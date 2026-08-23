# Streamer.bot / Speaker.bot 四语言汉化安装脚本（可移植版）
# 用法：
#   powershell -ExecutionPolicy Bypass -File 安装.ps1              # 交互选择语言
#   powershell -ExecutionPolicy Bypass -File 安装.ps1 -Lang ja-JP  # 直接指定语言
#   可选：-StreamerPath / -SpeakerPath 直接指定程序目录（跳过自动发现）
# 程序路径解析顺序：config.json 已存配置 → 自动发现常见目录 → 用户输入。
# 验证成功的路径会写入 config.json，供 切换语言.ps1 / 还原.ps1 复用。
# 支持只安装其中一个程序；两个都找不到时终止。
param(
    [ValidateSet('zh-CN','ja-JP','ko-KR','es-ES')]
    [string]$Lang = '',
    [switch]$NoStart,
    [string]$StreamerPath = '',
    [string]$SpeakerPath = ''
)
$ErrorActionPreference = 'Stop'

$SrcRoot = $PSScriptRoot
$DllSrc  = Join-Path $SrcRoot 'src\ZhInject.dll'
$ConfigPath = Join-Path $SrcRoot 'config.json'

$LangNames = @{ 'zh-CN'='简体中文'; 'ja-JP'='日本語'; 'ko-KR'='한국어'; 'es-ES'='Español' }

# ===== 公共：配置读写与路径解析 =====

function Read-Config {
    $empty = [pscustomobject]@{ StreamerBotPath = ''; SpeakerBotPath = '' }
    if (-not (Test-Path -LiteralPath $ConfigPath)) { return $empty }
    try {
        $j = Get-Content -LiteralPath $ConfigPath -Raw -Encoding UTF8 | ConvertFrom-Json
        return [pscustomobject]@{
            StreamerBotPath = [string]$j.StreamerBotPath
            SpeakerBotPath  = [string]$j.SpeakerBotPath
        }
    } catch {
        Write-Warning "config.json 无法解析（$($_.Exception.Message)），已忽略。"
        return $empty
    }
}

function Write-Config {
    param([string]$StreamerBotPath, [string]$SpeakerBotPath)
    $obj = [ordered]@{
        schemaVersion   = 1
        StreamerBotPath = $StreamerBotPath
        SpeakerBotPath  = $SpeakerBotPath
    }
    $json = $obj | ConvertTo-Json
    [System.IO.File]::WriteAllText($ConfigPath, $json, (New-Object System.Text.UTF8Encoding($false)))
}

function Test-AppDir {
    # 目录存在且包含 <Name>.exe 才算有效
    param([string]$Dir, [string]$Name)
    if ([string]::IsNullOrWhiteSpace($Dir)) { return $false }
    if (-not (Test-Path -LiteralPath $Dir -PathType Container)) { return $false }
    return (Test-Path -LiteralPath (Join-Path $Dir "$Name.exe") -PathType Leaf)
}

function Normalize-AppPath {
    # 接受目录或 "<Name>.exe" 完整路径，统一返回程序目录；无效返回 $null
    param([string]$InputPath, [string]$Name)
    if ([string]::IsNullOrWhiteSpace($InputPath)) { return $null }
    $p = $InputPath.Trim().Trim('"')
    try { $full = [System.IO.Path]::GetFullPath($p) } catch { return $null }
    if ((Split-Path -Leaf $full) -ieq "$Name.exe") {
        if (-not (Test-Path -LiteralPath $full -PathType Leaf)) { return $null }
        $full = [System.IO.Path]::GetDirectoryName($full)
    }
    if (Test-AppDir -Dir $full -Name $Name) { return $full }
    return $null
}

function Read-InputSafe {
    # 非交互环境（无控制台输入）下 Read-Host 会抛异常；统一转为空输入
    param([string]$Prompt)
    try { return (Read-Host $Prompt).Trim() } catch { return '' }
}

function Search-Exe {
    # 深度受限（3 层）递归搜索 exe，跳过重解析点，候选最多 10 个
    param([string]$Dir, [string]$Exe, [int]$Depth, [System.Collections.Generic.List[string]]$Found)
    if ($Depth -gt 3 -or $Found.Count -ge 10) { return }
    $items = $null
    try { $items = Get-ChildItem -LiteralPath $Dir -Force -ErrorAction SilentlyContinue } catch { return }
    if (-not $items) { return }
    foreach ($it in $items) {
        if ($it.PSIsContainer) {
            if ($it.Attributes -band [IO.FileAttributes]::ReparsePoint) { continue }
            Search-Exe -Dir $it.FullName -Exe $Exe -Depth ($Depth + 1) -Found $Found
        } elseif ($it.Name -ieq $Exe) {
            if (-not $Found.Contains($it.DirectoryName)) { $Found.Add($it.DirectoryName) }
        }
    }
}

function Find-AppCandidates {
    param([string]$Name)
    $roots = @(
        $PSScriptRoot,
        (Split-Path -Parent $PSScriptRoot),
        (Join-Path $env:USERPROFILE 'Apps'),
        (Join-Path $env:USERPROFILE 'Desktop'),
        (Join-Path $env:USERPROFILE 'Downloads'),
        $env:LOCALAPPDATA,
        $env:ProgramFiles,
        ${env:ProgramFiles(x86)}
    )
    $found = New-Object System.Collections.Generic.List[string]
    foreach ($root in ($roots | Select-Object -Unique)) {
        if ($root -and (Test-Path -LiteralPath $root -PathType Container)) {
            Search-Exe -Dir $root -Exe "$Name.exe" -Depth 0 -Found $found
        }
    }
    return $found
}

function Resolve-AppDir {
    # 三级解析：命令行参数 → config.json → 自动发现 → 用户输入
    # 返回 @{ Dir = 目录或 '' ; Source = 'input'|'config'|'auto'|'chosen'|'none' }
    param([string]$Name, [string]$Key, [string]$ParamPath, $Config)

    if ($ParamPath) {
        $d = Normalize-AppPath -InputPath $ParamPath -Name $Name
        if ($d) { return @{ Dir = $d; Source = 'input' } }
        Write-Warning "[$Name] 命令行指定的路径无效：$ParamPath（改用自动发现）"
    }

    $saved = [string]$Config.$Key
    if ($saved) {
        if (Test-AppDir -Dir $saved -Name $Name) {
            Write-Host "[$Name] 使用已保存路径：$saved" -ForegroundColor DarkGray
            return @{ Dir = $saved; Source = 'config' }
        }
        Write-Warning "[$Name] 已保存路径已失效：`n  $saved`n  将尝试自动发现。"
    }

    Write-Host "[$Name] 正在自动搜索 $Name ..." -ForegroundColor DarkGray
    $cands = @(Find-AppCandidates -Name $Name)
    if ($cands.Count -eq 1) {
        Write-Host "[$Name] 自动发现：$($cands[0])" -ForegroundColor DarkGray
        return @{ Dir = $cands[0]; Source = 'auto' }
    }
    if ($cands.Count -gt 1) {
        Write-Host "[$Name] 发现多个候选位置，请选择：" -ForegroundColor Yellow
        for ($i = 0; $i -lt $cands.Count; $i++) {
            Write-Host ("  {0}) {1}" -f ($i + 1), $cands[$i])
        }
        Write-Host ("  0) 手动输入路径")
        $sel = Read-InputSafe "请输入 0-$($cands.Count)"
        if ($sel -match '^\d+$' -and [int]$sel -ge 1 -and [int]$sel -le $cands.Count) {
            return @{ Dir = $cands[[int]$sel - 1]; Source = 'chosen' }
        }
    }

    while ($true) {
        $inp = Read-InputSafe "未找到 $Name。请输入 $Name 所在目录或 $Name.exe 完整路径（留空跳过该程序）"
        if ([string]::IsNullOrWhiteSpace($inp)) { return @{ Dir = ''; Source = 'none' } }
        $d = Normalize-AppPath -InputPath $inp -Name $Name
        if ($d) { return @{ Dir = $d; Source = 'input' } }
        Write-Warning "路径无效（未找到 $Name.exe）：$inp"
    }
}

function Test-AppRunning {
    param([string]$Name)
    return $null -ne (Get-Process -Name $Name -ErrorAction SilentlyContinue)
}

function Stop-App {
    param([string]$Name)
    if (Test-AppRunning $Name) {
        Write-Warning "$Name 正在运行！将自动关闭后继续安装。"
        Get-Process -Name $Name -ErrorAction SilentlyContinue | Stop-Process -Force
        Start-Sleep -Milliseconds 800
    }
}

function Inject-AppDomainManager {
    param([string]$ConfigFile)
    $xml = Get-Content -LiteralPath $ConfigFile -Raw -Encoding UTF8
    if ($xml -match 'appDomainManagerAssembly') { return '已注入，跳过' }
    if ($xml -notmatch '<runtime>') { throw '未找到 <runtime> 节点，无法注入' }
    $insert = "    <appDomainManagerAssembly value=`"ZhInject, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null`" />`r`n" +
              "    <appDomainManagerType value=`"ZhInject.ZhManager`" />`r`n  "
    $xml = $xml -replace '</runtime>', ($insert + '</runtime>')
    Set-Content -LiteralPath $ConfigFile -Value $xml -Encoding UTF8
    return '已注入'
}

# ===== 主流程 =====

function Show-LangMenu {
    Write-Host ''
    Write-Host '请选择安装语言 / 言語を選択 / 언어를 선택하세요 / Elige el idioma:' -ForegroundColor Cyan
    Write-Host '  1) 简体中文 (zh-CN)' -ForegroundColor Yellow
    Write-Host '  2) 日本語 (ja-JP)'   -ForegroundColor Yellow
    Write-Host '  3) 한국어 (ko-KR)'   -ForegroundColor Yellow
    Write-Host '  4) Español (es-ES)' -ForegroundColor Yellow
    $choice = Read-Host '请输入 1-4'
    switch ($choice) {
        '1' { return 'zh-CN' }
        '2' { return 'ja-JP' }
        '3' { return 'ko-KR' }
        '4' { return 'es-ES' }
        default { Write-Warning '无效选择，默认安装简体中文。'; return 'zh-CN' }
    }
}

if (-not $Lang) { $Lang = Show-LangMenu }
if (-not $LangNames.ContainsKey($Lang)) { Write-Error "不支持的语言: $Lang"; exit 1 }
$LangName = $LangNames[$Lang]

Write-Host ''
Write-Host "开始安装汉化：语言 = $LangName ($Lang)" -ForegroundColor Cyan

$config = Read-Config
$Dirs = @{}
$Dirs['Streamer.bot'] = Resolve-AppDir -Name 'Streamer.bot' -Key 'StreamerBotPath' -ParamPath $StreamerPath -Config $config
$Dirs['Speaker.bot']  = Resolve-AppDir -Name 'Speaker.bot'  -Key 'SpeakerBotPath'  -ParamPath $SpeakerPath  -Config $config

# 持久化：只保存验证成功的路径（未安装的程序保存为空字符串）
Write-Config -StreamerBotPath $Dirs['Streamer.bot'].Dir -SpeakerBotPath $Dirs['Speaker.bot'].Dir
Write-Host "程序路径已保存到 config.json" -ForegroundColor DarkGray

$active = @($Dirs.Keys | Where-Object { $Dirs[$_].Dir })
$skipped = @($Dirs.Keys | Where-Object { -not $Dirs[$_].Dir })
foreach ($s in $skipped) { Write-Host "- $s not found, skipped" -ForegroundColor DarkGray }
if (-not $active) {
    Write-Host ''
    Write-Error "未找到任何 Streamer.bot / Speaker.bot 安装，已终止。请确认程序已安装后重试。"
    exit 1
}

$installed = @()
foreach ($name in ($active | Sort-Object)) {
    $dir = $Dirs[$name].Dir
    Write-Host "✓ $name detected" -ForegroundColor Green

    $mapSrc = Join-Path $SrcRoot "$name\$Lang\ZhMap.tsv"
    if (-not (Test-Path -LiteralPath $mapSrc)) {
        Write-Host "[$name] 错误：缺少语言映射文件 $mapSrc（已跳过）" -ForegroundColor Red
        continue
    }

    $configFile = Join-Path $dir "$name.exe.config"
    if (-not (Test-Path -LiteralPath $configFile)) {
        Write-Host "[$name] 找到程序目录，但缺少 $name.exe.config。" -ForegroundColor Red
        Write-Host "[$name] 该目录可能不是有效的 $name 安装目录。已跳过注入与部署。" -ForegroundColor Red
        continue
    }

    Stop-App $name

    # 1. 备份配置
    $bak = Join-Path $dir "$name.exe.config.bak"
    if (-not (Test-Path -LiteralPath $bak)) {
        Copy-Item -LiteralPath $configFile -Destination $bak
        Write-Host "[$name] 已备份配置 → $bak" -ForegroundColor DarkGray
    }

    # 2. 注入配置
    $result = Inject-AppDomainManager -ConfigFile $configFile
    Write-Host "[$name] 注入 AppDomainManager：$result" -ForegroundColor Green

    # 3. 部署文件
    Copy-Item -LiteralPath $DllSrc -Destination (Join-Path $dir 'ZhInject.dll') -Force
    $langsDir = Join-Path $dir 'langs'
    if (Test-Path -LiteralPath $langsDir) { Remove-Item -LiteralPath $langsDir -Recurse -Force }
    New-Item -ItemType Directory -Path $langsDir | Out-Null
    foreach ($L in @('zh-CN','ja-JP','ko-KR','es-ES')) {
        $m = Join-Path $SrcRoot "$name\$L\ZhMap.tsv"
        if (Test-Path -LiteralPath $m) {
            New-Item -ItemType Directory -Path (Join-Path $langsDir $L) -Force | Out-Null
            Copy-Item -LiteralPath $m -Destination (Join-Path $langsDir "$L\ZhMap.tsv") -Force
        }
    }
    Copy-Item -LiteralPath $mapSrc -Destination (Join-Path $dir 'ZhMap.tsv') -Force
    Set-Content -LiteralPath (Join-Path $dir 'ZhMode.txt') -Value 'translate' -Encoding Ascii
    Set-Content -LiteralPath (Join-Path $dir 'ZhLang.txt') -Value $Lang -Encoding Ascii
    Set-Content -LiteralPath (Join-Path $dir 'ZhBar.txt')  -Value 'on' -Encoding Ascii
    Write-Host "[$name] 已部署 ZhInject.dll / langs(4语言) / ZhMap.tsv($Lang) / ZhMode.txt=translate / ZhLang.txt=$Lang / ZhBar.txt" -ForegroundColor Green
    $installed += @{ Name = $name; Dir = $dir }
}

Write-Host ''
if ($installed.Count -eq 0) {
    Write-Host "没有任何程序完成安装（详见上方错误）。" -ForegroundColor Red
    exit 1
}
Write-Host "汉化安装完成：$LangName ($Lang)" -ForegroundColor Cyan

if (-not $NoStart) {
    Write-Host '正在自动启动程序...' -ForegroundColor DarkGray
    foreach ($it in $installed) {
        $exe = Join-Path $it.Dir "$($it.Name).exe"
        try { Start-Process -FilePath $exe; Write-Host "[$($it.Name)] 已启动" -ForegroundColor Green }
        catch { Write-Warning "[$($it.Name)] 启动失败: $($_.Exception.Message)" }
    }
    Write-Host ''
    Write-Host '程序已启动，稍等片刻即可看到所选语言界面。' -ForegroundColor Cyan
} else {
    Write-Host '（已跳过自动启动，请手动启动程序查看效果）' -ForegroundColor DarkGray
}
Write-Host '如需更换语言，运行 切换语言.ps1；如需还原英文，运行 还原.ps1。' -ForegroundColor Cyan
