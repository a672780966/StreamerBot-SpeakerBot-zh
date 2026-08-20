# Streamer.bot / Speaker.bot 汉化语言切换脚本
# 用法：
#   powershell -ExecutionPolicy Bypass -File 切换语言.ps1              # 交互选择语言
#   powershell -ExecutionPolicy Bypass -File 切换语言.ps1 -Lang es-ES  # 直接指定语言
# 支持语言：zh-CN 简体中文 | ja-JP 日本語 | ko-KR 한국어 | es-ES Español
# 作用：把所选语言的 ZhMap.tsv 部署到两个程序目录，更新 ZhLang.txt，
#       并自动重启程序使新语言生效。
param(
    [ValidateSet('zh-CN','ja-JP','ko-KR','es-ES')]
    [string]$Lang = '',
    [switch]$NoRestart
)
$ErrorActionPreference = 'Stop'

$SrcRoot = $PSScriptRoot
$LangNames = @{ 'zh-CN'='简体中文'; 'ja-JP'='日本語'; 'ko-KR'='한국어'; 'es-ES'='Español' }

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

$Apps = @('Speaker.bot', 'Streamer.bot')

foreach ($name in $Apps) {
    $dir  = Join-Path 'C:\Users\admin\Apps' $name
    $mapSrc = Join-Path $SrcRoot "$name\$Lang\ZhMap.tsv"
    if (-not (Test-Path -LiteralPath $mapSrc)) {
        Write-Error "缺少语言映射文件：$mapSrc（已跳过 $name）" -ErrorAction Continue
        continue
    }
    if (-not (Test-Path -LiteralPath $dir)) {
        Write-Warning "未找到 $dir（跳过）"; continue
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
    Write-Host "[$name] 已切换到 $LangName ($Lang)" -ForegroundColor Green
}

Write-Host ''
if (-not $NoRestart) {
    Write-Host '正在自动重启程序...' -ForegroundColor DarkGray
    foreach ($name in $Apps) {
        $exe = Join-Path 'C:\Users\admin\Apps' "$name\$name.exe"
        if (Test-Path -LiteralPath $exe) {
            try { Start-Process -FilePath $exe; Write-Host "[$name] 已启动" -ForegroundColor Green }
            catch { Write-Warning "[$name] 启动失败: $($_.Exception.Message)" }
        }
    }
    Write-Host ''
    Write-Host "已切换到 $LangName，程序已重启。" -ForegroundColor Cyan
} else {
    Write-Host "已切换到 $LangName（未重启）。请手动重启两个程序使新语言生效。" -ForegroundColor Cyan
}