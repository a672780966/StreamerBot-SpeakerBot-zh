# Build Instructions / 编译说明

## Prerequisites

- Windows with .NET Framework 4.x (the C# 5 compiler `csc.exe` ships with the OS — no SDK needed)
- No external dependencies

## Compile the injector

```bat
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe ^
  /nologo /target:library /optimize+ /codepage:65001 ^
  /out:ZhInject.dll ^
  /r:"C:\Windows\Microsoft.NET\Framework64\v4.0.30319\System.Windows.Forms.dll" ^
  /r:"C:\Windows\Microsoft.NET\Framework64\v4.0.30319\System.Drawing.dll" ^
  /r:"C:\Windows\Microsoft.NET\Framework64\v4.0.30319\System.dll" ^
  src\ZhInject.cs
```

- `/codepage:65001` — the source contains CJK button labels; this forces UTF-8 interpretation
- Output: `ZhInject.dll` (~28 KB), a language-agnostic injector shared by all four languages

## Translation map pipeline (optional)

The `*.tsv` maps are plain `english<TAB>translation` UTF-8 files — edit them directly and restart the app.

A Python 3 pipeline is included for validating and extending the maps:

```bat
python tools\merge_maps.py validate
python tools\merge_maps.py stats
python tools\merge_maps.py merge --app Streamer.bot --lang fr-FR --translations fr.tsv
```

- `validate` — checks all 8 shipped maps: key-set parity against the zh-CN authoritative source, `{N}`/`%var%` placeholder integrity, duplicate keys, encoding
- `stats` — per-map counts (translated / kept-English / suppressed)
- `merge` — builds a new language map from the zh-CN key source plus a partial translation TSV; entries without a translation fall back to English, entries with broken placeholders are rejected to keep format strings intact

Per-page UI text inventories (496 XAML views extracted from Streamer.bot) live in `docs/` — use them to locate which page a string belongs to.

## Verify

1. Run `安装.ps1 -Lang ja-JP -NoStart`
2. Launch the app — check `ZhApply.log` next to the exe for `applied:` entries and `seterr` (must stay 0)
3. The language switcher is associated with the application's main-window title area and is enabled when `ZhBar.txt` and the `langs\` directory are present (both deployed by the installer)

## App path configuration

The scripts do not use fixed installation paths:

- `config.example.json` — committed template showing the config structure
- `config.json` — generated locally by `安装.ps1` after it detects (or you enter) the app directories; intentionally excluded from Git

Path resolution order in `安装.ps1`: saved `config.json` → auto-discovery in common locations (script folder, `%USERPROFILE%\Apps`, Desktop, Downloads, `%LOCALAPPDATA%`, Program Files — depth-limited) → manual input (directory or full `.exe` path). `切换语言.ps1` and `还原.ps1` read the same `config.json`. Only one of the two apps needs to be installed.
