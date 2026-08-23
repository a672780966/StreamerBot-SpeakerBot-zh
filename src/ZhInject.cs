using System;
using System.IO;
using System.Reflection;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace ZhInject
{
public sealed class ZhManager : System.AppDomainManager
    {
        static Dictionary<string, string> map;
        static Dictionary<string, System.Text.RegularExpressions.Regex> patternMap;
        static SortedSet<string> captured;
        static string dir;
        static bool captureMode;
        static bool debug;
        static string LogPath { get { return Path.Combine(dir, "ZhApply.log"); } }
        static string MapPath { get { return Path.Combine(dir, "ZhMap.tsv"); } }

        public override void InitializeNewDomain(AppDomainSetup info)
        {
            base.InitializeNewDomain(info);
            try
            {
                dir = AppDomain.CurrentDomain.BaseDirectory;
                string modeFile = Path.Combine(dir, "ZhMode.txt");
                captureMode = File.Exists(modeFile) && File.ReadAllText(modeFile).Trim().ToLowerInvariant() == "capture";
                debug = File.Exists(Path.Combine(dir, "ZhDebug.txt"));
                map = new Dictionary<string, string>();
                captured = new SortedSet<string>();
                if (!captureMode) LoadMap();
                AppDomain.CurrentDomain.AssemblyLoad += OnAsmLoad;
                AppDomain.CurrentDomain.ProcessExit += OnExit;
                AppDomain.CurrentDomain.DomainUnload += OnExit;
                if (!captureMode && File.Exists(Path.Combine(dir, "ZhBar.txt"))) StartSwitcher();
                Log("init done, capture=" + captureMode);
            }
            catch (Exception ex) { Log("init: " + ex.Message); }
        }

        static void OnAsmLoad(object s, AssemblyLoadEventArgs e)
        {
            try
            {
                string n = e.LoadedAssembly.GetName().Name;
                if (debug) Log("asm loaded: " + n);
                if (n == "System.Windows.Forms") HookWinForms();
                if (n == "PresentationFramework" || n == "WindowsBase") HookWpf();
            }
            catch (Exception ex) { Log("asmload: " + ex.Message); }
        }

        // ---------------- WinForms ----------------
static bool winFormsHooked;
        static System.Threading.Timer winTimer;
        static void HookWinForms()
        {
            if (winFormsHooked) return;
            winFormsHooked = true;
            try
            {
                winTimer = new System.Threading.Timer(delegate { ScanWinForms(); }, null, 500, 1000);
                Log("winforms timer hooks registered");
            }
            catch (Exception ex) { Log("hookwf: " + ex.Message + " :: " + ex.StackTrace); }
        }

        static int scanGuard;
        static void ScanWinForms()
        {
            if (System.Threading.Interlocked.Exchange(ref scanGuard, 1) == 1) return;
            try
            {
                Type app = Type.GetType("System.Windows.Forms.Application, System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089");
                if (app == null) return;
                PropertyInfo openForms = app.GetProperty("OpenForms");
                var forms = openForms.GetValue(null, null) as System.Collections.IEnumerable;
                if (forms == null) return;
                bool any = false;
                foreach (object f in forms) { any = true; WalkWinForms(f, 0); }
                if (any && captureMode) DumpCaptured();
            }
            catch { }
            finally { System.Threading.Interlocked.Exchange(ref scanGuard, 0); }
        }

        static void WalkWinForms(object c, int depth)
        {
            if (depth > 32 || c == null) return;
            try
            {
                ProcessWinFormControl(c);
                var controls = c.GetType().GetProperty("Controls").GetValue(c, null);
                if (controls == null) return;
                var list = controls as System.Collections.IEnumerable;
                if (list == null) return;
                foreach (object child in list)
                {
                    if (child != null) WalkWinForms(child, depth + 1);
                }
            }
            catch { }
        }

        static void ProcessWinFormControl(object c)
        {
            try
            {
                string tn = c.GetType().Name;
                if (tn == "Form")
                {
                    HandleStr(c, "Text");
                    return;
                }
                if (tn == "DataGridView")
                {
                    object cols = c.GetType().GetProperty("Columns").GetValue(c, null);
                    var colList = cols as System.Collections.IEnumerable;
                    if (colList != null)
                    {
                        foreach (object col in colList)
                        {
                            object h = col.GetType().GetProperty("HeaderText").GetValue(col, null);
                            string hs = h as string;
                            if (!string.IsNullOrEmpty(hs)) Handle(hs, delegate(string zh) { col.GetType().GetProperty("HeaderText").SetValue(col, zh, null); });
                        }
                    }
                    return;
                }
                PropertyInfo textProp = c.GetType().GetProperty("Text");
                if (textProp != null && textProp.CanWrite)
                {
                    if (tn.Contains("TextBox") || tn.Contains("ComboBox") || tn.Contains("RichTextBox")
                        || tn.Contains("MaskedTextBox") || tn.Contains("NumericUpDown") || tn.Contains("StatusStrip")
                        || tn.Contains("ToolStrip") || tn.Contains("MenuStrip") || tn.Contains("ContextMenuStrip")
                        || tn.Contains("TreeView"))
                    {
                        return;
                    }
                    HandleStr(c, "Text");
                }
            }
            catch { }
        }

        static void HandleStr(object o, string propName)
        {
            try
            {
                string s = o.GetType().GetProperty(propName).GetValue(o, null) as string;
                if (string.IsNullOrEmpty(s)) return;
                Handle(s, delegate(string zh) { o.GetType().GetProperty(propName).SetValue(o, zh, null); });
            }
            catch { }
        }

        // ---------------- WPF (Streamer.bot) ----------------
        static readonly string[] WpfRefs = { "WindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35",
            "PresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35",
            "PresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" };
        static Type Resolve(string fullName)
        {
            foreach (string r in WpfRefs)
            {
                Assembly a = Assembly.Load(r);
                Type t = a.GetType(fullName, false);
                if (t != null) return t;
            }
            return null;
        }

static bool wpfHooked;
        static System.Threading.Timer wpfTimer;
        static void HookWpf()
        {
            if (wpfHooked) return;
            wpfHooked = true;
            try
            {
                wpfTimer = new System.Threading.Timer(delegate { ScanWpf(); }, null, 500, 1000);
                Log("wpf timer hooks registered");
            }
            catch (Exception ex) { Log("hookwpf: " + ex.Message + " :: " + ex.StackTrace); }
        }

        static void ScanWpf()
        {
            try
            {
                // 通过反射访问 System.Windows.Application.Current.Windows
                Type appType = Resolve("System.Windows.Application");
                if (appType == null) { Log("scanwpf: appType null"); return; }
                PropertyInfo current = appType.GetProperty("Current");
                object app = current.GetValue(null, null);
                if (app == null) { return; }
                // 判断是否已在 UI 线程：比较 Dispatcher.Thread == Thread.CurrentThread
                PropertyInfo dispatcherProp = appType.GetProperty("Dispatcher");
                object dispatcher = dispatcherProp.GetValue(app, null);
                if (dispatcher == null) return;
                object dispThread = dispatcher.GetType().GetProperty("Thread").GetValue(dispatcher, null);
                if (!object.ReferenceEquals(dispThread, System.Threading.Thread.CurrentThread))
                {
                    // 在 UI 线程调度扫描
                    object result = dispatcher.GetType().GetMethod("BeginInvoke", new Type[] { typeof(Delegate), typeof(object[]) })
                        .Invoke(dispatcher, new object[] { new Action(ScanWpfOnUiThread), new object[] { } });
                    return;
                }
                ScanWpfOnUiThread();
            }
            catch (Exception ex)
            {
                Exception inner = ex.InnerException;
                Log("scanwpf: " + ex.Message + " inner=" + (inner != null ? inner.Message + " :: " + inner.GetType().Name : "none"));
            }
        }

        static void ScanWpfOnUiThread()
        {
            try
            {
                Type appType = Resolve("System.Windows.Application");
                object app = appType.GetProperty("Current").GetValue(null, null);
                if (app == null) return;
                var winList = appType.GetProperty("Windows").GetValue(app, null) as System.Collections.IEnumerable;
                if (winList == null) return;
                bool any = false;
                foreach (object w in winList)
                {
                    if (w != null) { any = true; WalkWpf(w); }
                }
                if (any && captureMode) DumpCaptured();
            }
            catch (Exception ex)
            {
                Exception inner = ex.InnerException;
                Log("scanwpfui: " + ex.Message + " inner=" + (inner != null ? inner.Message + " :: " + inner.GetType().Name : "none"));
            }
        }

static void WalkWpf(object root)
        {
            try
            {
                if (root == null) return;
                ProcessWpfContent(root);
                ProcessTreeChildren(root, 0);
                ProcessLogicalChildren(root, 0);
                if (captureMode) DumpCaptured();
            }
            catch { }
        }

        static void ProcessLogicalChildren(object o, int depth)
        {
            if (depth > 32 || o == null) return;
            try
            {
                Type lth = Resolve("System.Windows.LogicalTreeHelper");
                MethodInfo getChildren = lth.GetMethod("GetChildren", new Type[] { Resolve("System.Windows.DependencyObject") });
                var children = getChildren.Invoke(null, new object[] { o }) as System.Collections.IEnumerable;
                if (children == null) return;
                foreach (object c in children)
                {
                    if (c == null) continue;
                    ProcessWpfContent(c);
                    ProcessLogicalChildren(c, depth + 1);
                }
            }
            catch { }
        }

        static void ProcessWpfContent(object o)
        {
            try
            {
                string tn = o.GetType().Name;
                if (tn == "TextBlock")
                {
                    if (!IsDataBound(o, "TextProperty"))
                    {
                        string s = GetProp(o, "Text") as string;
                        if (!string.IsNullOrEmpty(s)) Handle(s, delegate(string zh) { SetProp(o, "Text", zh); });
                    }
                    object inlines = GetProp(o, "Inlines");
                    if (inlines != null)
                    {
                        IList inlineList = inlines as IList;
                        if (inlineList != null)
                        {
                            for (int i = 0; i < inlineList.Count; i++)
                            {
                                object run = inlineList[i];
                                if (run != null && run.GetType().Name == "Run" && !IsDataBound(run, "TextProperty"))
                                {
                                    string rs = GetProp(run, "Text") as string;
                                    if (!string.IsNullOrEmpty(rs)) Handle(rs, delegate(string zh) { SetProp(run, "Text", zh); });
                                }
                            }
                        }
                    }
                    return;
                }
                if (tn == "DataGrid")
                {
                    object cols = GetProp(o, "Columns");
                    var colList = cols as System.Collections.IEnumerable;
                    if (colList != null)
                    {
                        foreach (object col in colList)
                        {
                            object h = col.GetType().GetProperty("Header").GetValue(col, null);
                            string hs = h as string;
                            if (!string.IsNullOrEmpty(hs)) Handle(hs, delegate(string zh) { col.GetType().GetProperty("Header").SetValue(col, zh, null); });
                        }
                    }
                    return;
                }
                if (HasProp(o, "Content") && !HasProp(o, "Header"))
                {
                    if (!IsDataBound(o, "ContentProperty"))
                    {
                        string s = GetProp(o, "Content") as string;
                        if (!string.IsNullOrEmpty(s)) Handle(s, delegate(string zh) { SetProp(o, "Content", zh); });
                    }
                }
if (HasProp(o, "Header"))
                {
                    if (!IsDataBound(o, "HeaderProperty"))
                    {
                        string s = GetProp(o, "Header") as string;
                        if (!string.IsNullOrEmpty(s)) Handle(s, delegate(string zh) { SetProp(o, "Header", zh); });
                    }
                }
                // Window.Title
                if (HasProp(o, "Title") && tn == "Window")
                {
                    if (!IsDataBound(o, "TitleProperty"))
                    {
                        string s = GetProp(o, "Title") as string;
                        if (!string.IsNullOrEmpty(s)) Handle(s, delegate(string zh) { SetProp(o, "Title", zh); });
                    }
                }
                // ToolTip
                if (HasProp(o, "ToolTip"))
                {
                    if (!IsDataBound(o, "ToolTipProperty"))
                    {
                        string s = GetProp(o, "ToolTip") as string;
                        if (!string.IsNullOrEmpty(s)) Handle(s, delegate(string zh) { SetProp(o, "ToolTip", zh); });
                    }
                }
                // GridViewColumn 列头（DataGrid/ListView 内部）
                if (tn == "GridViewColumn")
                {
                    object h = GetProp(o, "Header");
                    string hs = h as string;
                    if (!string.IsNullOrEmpty(hs)) Handle(hs, delegate(string zh) { SetProp(o, "Header", zh); });
                }
                // ContextMenu 子项（MenuItem.Header）
                if (tn == "MenuItem" && HasProp(o, "Header"))
                {
                    string s = GetProp(o, "Header") as string;
                    if (!string.IsNullOrEmpty(s)) Handle(s, delegate(string zh) { SetProp(o, "Header", zh); });
                }
            }
            catch { }
        }

        static object GetProp(object o, string name) { return o.GetType().GetProperty(name).GetValue(o, null); }
        static void SetProp(object o, string name, object val) { o.GetType().GetProperty(name).SetValue(o, val, null); }
        static bool HasProp(object o, string name) { return o.GetType().GetProperty(name) != null; }
        static bool IsDataBound(object o, string dpName)
        {
            try
            {
                Type bindingOps = Resolve("System.Windows.Data.BindingOperations");
                object dp = o.GetType().GetField(dpName).GetValue(null);
                MethodInfo isBound = bindingOps.GetMethod("IsDataBound");
                return (bool)isBound.Invoke(null, new object[] { o, dp });
            }
            catch { return false; }
        }

        static void ProcessTreeChildren(object o, int depth)
        {
            if (depth > 64) return;
            try
            {
                Type vth = Resolve("System.Windows.Media.VisualTreeHelper");
                MethodInfo count = vth.GetMethod("GetChildrenCount", new Type[] { Resolve("System.Windows.DependencyObject") });
                MethodInfo child = vth.GetMethod("GetChild", new Type[] { Resolve("System.Windows.DependencyObject"), typeof(int) });
                int n = Convert.ToInt32(count.Invoke(null, new object[] { o }));
                for (int i = 0; i < n; i++)
                {
                    object c = child.Invoke(null, new object[] { o, i });
                    if (c != null) { ProcessWpfContent(c); ProcessTreeChildren(c, depth + 1); }
                }
            }
            catch { }
        }

static void Handle(string s, Action<string> setter)
        {
            if (captureMode) { captured.Add(s); return; }
            string zh;
            if (map.TryGetValue(s, out zh) && !string.IsNullOrEmpty(zh))
            {
                if (zh != s)
                {
                    try { setter(zh); Log("applied: " + s + " -> " + zh); }
                    catch (Exception ex) { Log("seterr: " + s + " " + ex.Message); }
                }
                return;  // 精确命中（含保持原文）则不再尝试占位符匹配
            }
            // 占位符格式串匹配：控件值 "Actions (3)" 匹配 key "Actions ({0})"
            // 仅对纯 ASCII 原文尝试，避免对已翻译的中文文本二次改写
            if (patternMap != null && patternMap.Count > 0 && IsAscii(s))
            {
                try
                {
                    foreach (System.Collections.Generic.KeyValuePair<string, System.Text.RegularExpressions.Regex> kv in patternMap)
                    {
                        System.Text.RegularExpressions.Match m = kv.Value.Match(s);
                        if (m.Success)
                        {
                            string val = map[kv.Key];
                            if (string.IsNullOrEmpty(val) || val == kv.Key) return;
                            // 用匹配到的数字组替换译文中的 {N}
                            zh = ReplacePlaceholders(val, m);
                            if (!string.IsNullOrEmpty(zh) && zh != s)
                            {
                                try { setter(zh); Log("appliedp: " + s + " -> " + zh + " (pat " + kv.Key + ")"); }
                                catch (Exception ex) { Log("seterr: " + s + " " + ex.Message); }
                            }
                            return;
                        }
                    }
                }
                catch { }
            }
        }

        static bool IsAscii(string s)
        {
            for (int i = 0; i < s.Length; i++)
            {
                if (s[i] > 126) return false;
            }
            return true;
        }

        static string ReplacePlaceholders(string template, System.Text.RegularExpressions.Match m)
        {
            try
            {
                string result = template;
                for (int i = 0; i < m.Groups.Count - 1; i++)
                {
                    result = result.Replace("{" + i + "}", m.Groups[i + 1].Value);
                }
                return result;
            }
            catch { return template; }
        }

static void LoadMap()
        {
            try
            {
                if (!File.Exists(MapPath)) return;
                map = new Dictionary<string, string>();
                patternMap = new Dictionary<string, System.Text.RegularExpressions.Regex>();
                foreach (string raw in File.ReadAllLines(MapPath, Encoding.UTF8))
                {
                    string line = raw.Trim();
                    if (line.Length == 0 || line.StartsWith("#")) continue;
                    int tab = line.IndexOf('\t');
                    if (tab <= 0) continue;
                    string key = line.Substring(0, tab).Trim();
                    string val = line.Substring(tab + 1).Trim();
                    if (key.Length == 0 || map.ContainsKey(key)) continue;
                    if (key.IndexOf('{') >= 0)
                    {
                        // 占位符格式串 -> 编译正则，如 "Actions ({0})" -> ^Actions\ \(.+?\)$
                        // 哨兵法：先替换 {N} 为不可打印哨兵，Escape 后还原为 (.+?)（Escape 会转义 { }，直接替换会破坏）
                        string sentinel = key;
                        for (int i = 0; i <= 9; i++)
                        {
                            sentinel = sentinel.Replace("{" + i + "}", "\x01" + i + "\x02");
                        }
                        string esc = System.Text.RegularExpressions.Regex.Escape(sentinel);
                        for (int i = 0; i <= 9; i++)
                        {
                            esc = esc.Replace("\x01" + i + "\x02", "(.+?)");
                        }
                        string pat = "^" + esc + "$";
                        try { patternMap[key] = new System.Text.RegularExpressions.Regex(pat, System.Text.RegularExpressions.RegexOptions.Compiled); }
                        catch { }
                        map[key] = val;
                    }
                    else
                    {
                        map[key] = val;
                    }
                }
                Log("map loaded: " + map.Count + " patterns: " + patternMap.Count);
            }
            catch (Exception ex) { Log("map: " + ex.Message); }
        }

static void DumpCaptured()
        {
            try
            {
                var sb = new StringBuilder();
                sb.AppendLine("# english\tchinese");
                foreach (string s in captured)
                {
                    // 过滤：只保留可打印 ASCII（避免 UTF-16 误读乱码）
                    if (string.IsNullOrEmpty(s)) continue;
                    bool asciiOnly = true;
                    for (int i = 0; i < s.Length; i++)
                    {
                        char ch = s[i];
                        if (ch < 32 || ch > 126) { asciiOnly = false; break; }
                    }
                    if (!asciiOnly) continue;
                    sb.AppendLine(s + "\t");
                }
                File.WriteAllText(MapPath, sb.ToString(), new UTF8Encoding(false));
                Log("captured " + captured.Count + " strings -> " + MapPath);
            }
            catch (Exception ex) { Log("dump: " + ex.Message); }
        }

        static void Log(string m)
        {
            try { File.AppendAllText(LogPath, string.Format("[{0}] {1}\n", DateTime.Now.ToString("HH:mm:ss"), m)); } catch { }
        }

        // ---------------- Switcher Bar (B2) ----------------
        internal static readonly string[] BarLangCodes = { "zh-CN", "ja-JP", "ko-KR", "es-ES" };
        internal static readonly string[] BarLangLabels = { "中文", "日本語", "한국어", "Español" };

        static void StartSwitcher()
        {
            try
            {
                if (!Directory.Exists(Path.Combine(dir, "langs"))) { Log("bar: no langs dir"); return; }
                System.Threading.Thread t = new System.Threading.Thread(RunSwitcher);
                t.SetApartmentState(System.Threading.ApartmentState.STA);
                t.IsBackground = true;
                t.Start();
                Log("bar: switcher thread started");
            }
            catch (Exception ex) { Log("barstart: " + ex.Message); }
        }

        static void RunSwitcher()
        {
            try
            {
                System.Threading.Thread.Sleep(2500);
                Application.EnableVisualStyles();
                Application.Run(new SwitcherForm());
            }
            catch (Exception ex) { Log("barrun: " + ex.Message + " :: " + ex.StackTrace); }
        }

        public static string GetCurrentLanguage()
        {
            try
            {
                string p = Path.Combine(dir, "ZhLang.txt");
                return File.Exists(p) ? File.ReadAllText(p).Trim() : "";
            }
            catch { return ""; }
        }

        public static void SwitchTo(string code)
        {
            try
            {
                string src = Path.Combine(dir, "langs", code, "ZhMap.tsv");
                if (!File.Exists(src))
                {
                    MessageBox.Show("缺少映射文件: " + code, "Zh Switcher", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                File.Copy(src, Path.Combine(dir, "ZhMap.tsv"), true);
                File.WriteAllText(Path.Combine(dir, "ZhLang.txt"), code, new UTF8Encoding(false));
                DialogResult r = MessageBox.Show("语言已切换，重启程序后生效。\n立即重启？\n\nRestart required. Restart now?",
                    "语言切换 / Language", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (r == DialogResult.Yes) RestartApp(null);
            }
            catch (Exception ex) { Log("switchto: " + ex.Message); MessageBox.Show(ex.Message, "Zh Switcher"); }
        }

        public static void RestoreEnglish()
        {
            try
            {
                DialogResult r = MessageBox.Show(
                    "将移除全部汉化文件并还原英文原版（含配置还原），程序将重启。\n继续？",
                    "还原英文 / Restore English", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (r != DialogResult.Yes) return;
                int pid = Process.GetCurrentProcess().Id;
                string exe = Application.ExecutablePath;
                string cfg = exe + ".config";
                StringBuilder sb = new StringBuilder();
                sb.Append("$ErrorActionPreference='SilentlyContinue';");
                sb.Append("$p=" + pid + ";$exe='" + exe.Replace("'", "''") + "';$cfg='" + cfg.Replace("'", "''") + "';$d='" + dir.Replace("'", "''") + "';");
                sb.Append("for($i=0;$i -lt 30;$i++){ if(-not(Get-Process -Id $p)){break}; Start-Sleep 1 };");
                sb.Append("Stop-Process -Id $p -Force;");
                sb.Append("Start-Sleep 1;");
                sb.Append("Remove-Item \"$d\\ZhInject.dll\",\"$d\\ZhMap.tsv\",\"$d\\ZhMode.txt\",\"$d\\ZhLang.txt\",\"$d\\ZhApply.log\",\"$d\\ZhDebug.txt\",\"$d\\ZhBar.txt\" -Force;");
                sb.Append("Remove-Item \"$d\\langs\" -Recurse -Force;");
                sb.Append("if(Test-Path \"$cfg.bak\"){ Copy-Item \"$cfg.bak\" $cfg -Force; Remove-Item \"$cfg.bak\" -Force };");
                sb.Append("Start-Sleep 1; Start-Process $exe;");
                string b64 = Convert.ToBase64String(Encoding.Unicode.GetBytes(sb.ToString()));
                ProcessStartInfo psi = new ProcessStartInfo();
                psi.FileName = Environment.GetFolderPath(Environment.SpecialFolder.System) + "\\WindowsPowerShell\\v1.0\\powershell.exe";
                if (!File.Exists(psi.FileName)) psi.FileName = "powershell.exe";
                psi.Arguments = "-NoProfile -ExecutionPolicy Bypass -EncodedCommand " + b64;
                psi.CreateNoWindow = true;
                psi.UseShellExecute = false;
                Process.Start(psi);
                Environment.Exit(0);
            }
            catch (Exception ex)
            {
                Log("restore: " + ex.Message);
                MessageBox.Show(ex.Message, "Zh Switcher");
            }
        }

        static void RestartApp(string preArg)
        {
            try
            {
                int pid = Process.GetCurrentProcess().Id;
                string exe = Application.ExecutablePath;
                string cmd = "/c timeout /t 1 /nobreak >nul & taskkill /f /pid " + pid +
                    " & timeout /t 1 /nobreak >nul & start \"\" \"" + exe + "\"" + (string.IsNullOrEmpty(preArg) ? "" : " " + preArg);
                ProcessStartInfo psi = new ProcessStartInfo();
                psi.FileName = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.System), "cmd.exe");
                psi.Arguments = cmd;
                psi.CreateNoWindow = true;
                psi.UseShellExecute = false;
                Process.Start(psi);
            }
            catch (Exception ex) { Log("restart: " + ex.Message); }
            finally { Environment.Exit(0); }
        }

        static void OnExit(object sender, EventArgs e)
        {
            try { if (captureMode) DumpCaptured(); } catch { }
        }
    }

    public sealed class SwitcherForm : Form
    {
        const int CompactW = 356, CompactH = 38;
        const int ExpandW = 252, ExpandH = 372;
        bool expanded, userClosed, dragging;
        Point dragOffset;
        Button[] langBtns;
        Button minBtn, maxBtn, closeBtn, restoreBtn;
        Label titleLabel;
        System.Windows.Forms.Timer pinTimer;

        [StructLayout(LayoutKind.Sequential)]
        struct RECT { public int Left, Top, Right, Bottom; }
        [DllImport("user32.dll")]
        static extern bool GetWindowRect(IntPtr hWnd, out RECT r);
        [DllImport("user32.dll")]
        static extern bool IsIconic(IntPtr hWnd);

        protected override bool ShowWithoutActivation { get { return true; } }

        public SwitcherForm()
        {
            FormBorderStyle = FormBorderStyle.None;
            Text = "ZhLanguageSwitcher";
            StartPosition = FormStartPosition.Manual;
            ShowInTaskbar = true;
            TopMost = true;
            BackColor = Color.FromArgb(32, 33, 36);
            ForeColor = Color.White;
            Font = new Font("Segoe UI", 9F);
            ClientSize = new Size(CompactW, CompactH);

            string cur = ZhManager.GetCurrentLanguage();

            langBtns = new Button[4];
            for (int i = 0; i < 4; i++)
            {
                Button b = new Button();
                b.Text = ZhManager.BarLangLabels[i];
                b.Tag = ZhManager.BarLangCodes[i];
                b.FlatStyle = FlatStyle.Flat;
                b.FlatAppearance.BorderSize = 0;
                b.Size = new Size(64, 26);
                b.Location = new Point(6 + i * 66, 6);
                b.BackColor = (cur == ZhManager.BarLangCodes[i]) ? Color.FromArgb(0, 120, 212) : Color.FromArgb(55, 56, 60);
                b.ForeColor = Color.White;
                b.Cursor = Cursors.Hand;
                b.Click += delegate(object s, EventArgs e) { ZhManager.SwitchTo((string)((Button)s).Tag); };
                Controls.Add(b);
                langBtns[i] = b;

                b.MouseDown += BarMouseDown;
                b.MouseMove += BarMouseMove;
            }

            minBtn = MakeCtrlBtn("─", CompactW - 84);
            minBtn.Click += delegate(object s, EventArgs e) { WindowState = FormWindowState.Minimized; };
            maxBtn = MakeCtrlBtn("□", CompactW - 58);
            maxBtn.Click += delegate(object s, EventArgs e) { ToggleExpand(); };
            closeBtn = MakeCtrlBtn("✕", CompactW - 32);
            closeBtn.Click += delegate(object s, EventArgs e) { userClosed = true; Hide(); };

            titleLabel = new Label();
            titleLabel.Text = "语言切换 / Language";
            titleLabel.AutoSize = false;
            titleLabel.Size = new Size(ExpandW - 20, 24);
            titleLabel.Location = new Point(10, 8);
            titleLabel.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            titleLabel.Visible = false;
            titleLabel.MouseDown += BarMouseDown;
            titleLabel.MouseMove += BarMouseMove;
            Controls.Add(titleLabel);

            restoreBtn = new Button();
            restoreBtn.Text = "还原英文 / Restore EN";
            restoreBtn.FlatStyle = FlatStyle.Flat;
            restoreBtn.FlatAppearance.BorderSize = 1;
            restoreBtn.FlatAppearance.BorderColor = Color.FromArgb(196, 43, 28);
            restoreBtn.BackColor = Color.FromArgb(45, 46, 50);
            restoreBtn.ForeColor = Color.White;
            restoreBtn.Size = new Size(ExpandW - 28, 34);
            restoreBtn.Location = new Point(14, ExpandH - 52);
            restoreBtn.Cursor = Cursors.Hand;
            restoreBtn.Visible = false;
            restoreBtn.Click += delegate(object s, EventArgs e) { ZhManager.RestoreEnglish(); };
            restoreBtn.MouseDown += BarMouseDown;
            restoreBtn.MouseMove += BarMouseMove;
            Controls.Add(restoreBtn);

            MouseDown += BarMouseDown;
            MouseMove += BarMouseMove;
            MouseUp += delegate(object s, MouseEventArgs e) { dragging = false; };

            pinTimer = new System.Windows.Forms.Timer();
            pinTimer.Interval = 1000;
            pinTimer.Tick += delegate(object s, EventArgs e) { PinToMainWindow(); };
            pinTimer.Start();
            PinToMainWindow();
        }

        Button MakeCtrlBtn(string text, int x)
        {
            Button b = new Button();
            b.Text = text;
            b.FlatStyle = FlatStyle.Flat;
            b.FlatAppearance.BorderSize = 0;
            b.Size = new Size(26, 26);
            b.Location = new Point(x, 6);
            b.BackColor = Color.FromArgb(55, 56, 60);
            b.ForeColor = Color.White;
            b.Cursor = Cursors.Hand;
            b.MouseDown += BarMouseDown;
            Controls.Add(b);
            return b;
        }

        void ToggleExpand()
        {
            expanded = !expanded;
            if (expanded)
            {
                ClientSize = new Size(ExpandW, ExpandH);
                titleLabel.Visible = true;
                restoreBtn.Visible = true;
                for (int i = 0; i < 4; i++)
                {
                    langBtns[i].Size = new Size(ExpandW - 28, 42);
                    langBtns[i].Location = new Point(14, 40 + i * 52);
                    langBtns[i].Font = new Font("Segoe UI", 12F, FontStyle.Bold);
                    langBtns[i].Text = ((string)langBtns[i].Tag == ZhManager.GetCurrentLanguage() ? "✓ " : "") + ZhManager.BarLangLabels[i];
                }
                minBtn.Location = new Point(ExpandW - 90, 7);
                maxBtn.Location = new Point(ExpandW - 62, 7);
                closeBtn.Location = new Point(ExpandW - 34, 7);
            }
            else
            {
                ClientSize = new Size(CompactW, CompactH);
                titleLabel.Visible = false;
                restoreBtn.Visible = false;
                for (int i = 0; i < 4; i++)
                {
                    langBtns[i].Font = Font;
                    langBtns[i].Text = ZhManager.BarLangLabels[i];
                    langBtns[i].Size = new Size(64, 26);
                    langBtns[i].Location = new Point(6 + i * 66, 6);
                    langBtns[i].BackColor = ((string)langBtns[i].Tag == ZhManager.GetCurrentLanguage()) ? Color.FromArgb(0, 120, 212) : Color.FromArgb(55, 56, 60);
                }
                minBtn.Location = new Point(CompactW - 84, 6);
                maxBtn.Location = new Point(CompactW - 58, 6);
                closeBtn.Location = new Point(CompactW - 32, 6);
            }
        }

        void PinToMainWindow()
        {
            try
            {
                if (userClosed || dragging) return;
                IntPtr h = Process.GetCurrentProcess().MainWindowHandle;
                if (h == IntPtr.Zero) return;
                if (IsIconic(h)) { if (!userClosed && Visible && !expanded) Hide(); return; }
                if (!userClosed && !Visible && !expanded) Show();
                RECT r;
                if (!GetWindowRect(h, out r)) return;
                if (r.Right <= 0 && r.Bottom <= 0) return;
                Location = new Point(r.Right - Width - 12, r.Top + 40);
            }
            catch { }
        }

        void BarMouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                dragging = true;
                dragOffset = new Point(Cursor.Position.X - Left, Cursor.Position.Y - Top);
            }
        }

        void BarMouseMove(object sender, MouseEventArgs e)
        {
            if (dragging)
            {
                Location = new Point(Cursor.Position.X - dragOffset.X, Cursor.Position.Y - dragOffset.Y);
            }
        }
    }
}
