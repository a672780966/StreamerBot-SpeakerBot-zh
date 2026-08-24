# Streamer.bot / Speaker.bot 汉化语言切换脚本（可移植版）
# 用法：
#   powershell -ExecutionPolicy Bypass -File 切换语言.ps1              # 交互选择语言
#   powershell -ExecutionPolicy Bypass -File 切换语言.ps1 -Lang es-ES  # 直接指定语言
# 程序路径读取自 config.json（由 安装.ps1 生成）。
# 某个程序路径失效时给出明确提示并继续处理另一个程序。
param(
    [ValidateSet('zh-CN','ja-JP','ko-KR','es-ES')]
    [string]$Lang = '',
    [switch]$NoRestart
)
$ErrorActionPreference = 'Stop'

$SrcRoot = $PSScriptRoot
$ConfigPath = Join-Path $SrcRoot 'config.json'
$LangNames = @{ 'zh-CN'='简体中文'; 'ja-JP'='日本語'; 'ko-KR'='한국어'; 'es-ES'='Español' }

# ===== 公共：配置读取与路径校验 =====

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
        Write-Warning "config.json 无法解析（$($_.Exception.Message)）。请重新运行 安装.ps1。"
        return $empty
    }
}

function Test-AppDir {
    param([string]$Dir, [string]$Name)
    if ([string]::IsNullOrWhiteSpace($Dir)) { return $false }
    if (-not (Test-Path -LiteralPath $Dir -PathType Container)) { return $false }
    return (Test-Path -LiteralPath (Join-Path $Dir "$Name.exe") -PathType Leaf)
}

# ===== 主流程 =====

function Show-LangMenu {
    Write-Host ''
    Write-Host '请选择要切换到的语言 / 言語を選択 / 언어를 선택하세요 / Elige el idioma:' -ForegroundColor Cyan
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
        default { Write-Warning '无效选择，默认简体中文。'; return 'zh-CN' }
    }
}

if (-not $Lang) { $Lang = Show-LangMenu }
if (-not $LangNames.ContainsKey($Lang)) { Write-Error "不支持的语言: $Lang"; exit 1 }
$LangName = $LangNames[$Lang]

$config = Read-Config
$targets = @()
foreach ($pair in @(@('Streamer.bot','StreamerBotPath'), @('Speaker.bot','SpeakerBotPath'))) {
    $name = $pair[0]
    $dir  = [string]$config.($pair[1])
    if (-not $dir) {
        Write-Host "- $name not found, skipped" -ForegroundColor DarkGray
        continue
    }
    if (-not (Test-AppDir -Dir $dir -Name $name)) {
        Write-Warning "$name 的已保存路径已经失效：`n`n$dir`n`n请重新运行 安装.ps1 更新程序路径。"
        continue
    }
    $targets += @{ Name = $name; Dir = $dir }
}

if (-not $targets -or $targets.Count -eq 0) {
    Write-Error "没有可用的程序路径。请先运行 安装.ps1 完成安装。"
    exit 1
}

$switchedTargets = @()
foreach ($t in $targets) {
    $name = $t.Name
    $dir  = $t.Dir
    $mapSrc = Join-Path $SrcRoot "$name\$Lang\ZhMap.tsv"
    if (-not (Test-Path -LiteralPath $mapSrc)) {
        Write-Host "$name：缺少 $Lang 映射，未切换" -ForegroundColor Red
        continue
    }

    # 关闭程序（若在运行），否则 DLL 已缓存旧映射
    $running = $null -ne (Get-Process -Name $name -ErrorAction SilentlyContinue)
    if ($running) {
        Write-Host "[$name] 正在关闭以应用新语言..." -ForegroundColor DarkGray
        Get-Process -Name $name -ErrorAction SilentlyContinue | Stop-Process -Force
        Start-Sleep -Milliseconds 800
    }

    Copy-Item -LiteralPath $mapSrc -Destination (Join-Path $dir 'ZhMap.tsv') -Force
    Set-Content -LiteralPath (Join-Path $dir 'ZhLang.txt') -Value $Lang -Encoding Ascii
    $switchedTargets += $t
    Write-Host "$name：切换成功（$LangName / $Lang）" -ForegroundColor Green
}
$failedTargets = @($targets | Where-Object { $switchedTargets -notcontains $_ })
foreach ($t in $failedTargets) {
    Write-Host "$($t.Name)：未切换" -ForegroundColor Yellow
}

Write-Host ''
if (-not $NoRestart) {
    if ($switchedTargets.Count -eq 0) {
        Write-Host "没有程序完成切换，无需重启。" -ForegroundColor Yellow
        exit 1
    }
    Write-Host '正在自动重启已切换的程序...' -ForegroundColor DarkGray
    foreach ($t in $switchedTargets) {
        $exe = Join-Path $t.Dir "$($t.Name).exe"
        if (Test-Path -LiteralPath $exe) {
            try { Start-Process -FilePath $exe; Write-Host "[$($t.Name)] 已启动" -ForegroundColor Green }
            catch { Write-Warning "[$($t.Name)] 启动失败: $($_.Exception.Message)" }
        }
    }
    Write-Host ''
    Write-Host "已切换到 $LangName，程序已重启。" -ForegroundColor Cyan
} else {
    Write-Host "已切换到 $LangName（未重启）。请手动重启程序使新语言生效。" -ForegroundColor Cyan
}
