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

## Regenerate translation maps (optional)

The `*.tsv` maps are plain `english<TAB>translation` UTF-8 files — edit them directly and restart the app.
The full 4-language pipeline used to generate them (merge + fidelity validation against the Chinese source map) lives outside this repo; the shipped maps are the authoritative artifact.

## Verify

1. Run `安装.ps1 -Lang ja-JP -NoStart`
2. Launch the app — check `ZhApply.log` next to the exe for `applied:` entries and `seterr` (must stay 0)
3. The floating switcher bar appears near the main window's top-right corner (requires `ZhBar.txt` + `langs\`, both deployed by the installer)
