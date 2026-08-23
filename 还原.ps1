# Streamer.bot / Speaker.bot 汉化还原脚本（可移植版）
# 用法：右键「使用 PowerShell 运行」，或：
#   powershell -ExecutionPolicy Bypass -File 还原.ps1
# 程序路径读取自 config.json（由 安装.ps1 生成，还原后保留以便下次复用）。
# 作用：删除所有汉化文件（含 ZhLang.txt 与 langs\），从 .bak 恢复原始配置，
#       完全还原英文原版。不会删除 config.json。
$ErrorActionPreference = 'Continue'

$SrcRoot = $PSScriptRoot
$ConfigPath = Join-Path $SrcRoot 'config.json'

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

$config = Read-Config
$restored = 0
foreach ($pair in @(@('Streamer.bot','StreamerBotPath'), @('Speaker.bot','SpeakerBotPath'))) {
    $name = $pair[0]
    $dir  = [string]$config.($pair[1])
    if (-not $dir) {
        Write-Host "- $name not found, skipped" -ForegroundColor DarkGray
        continue
    }
    if (-not (Test-AppDir -Dir $dir -Name $name)) {
        Write-Warning "$name 的已保存路径已经失效：`n`n$dir`n`n（目录不存在，无需清理。如已移动程序，请重新运行 安装.ps1 更新路径。）"
        continue
    }

    # 0. 关闭程序（若在运行）
    $running = $null -ne (Get-Process -Name $name -ErrorAction SilentlyContinue)
    if ($running) {
        Write-Host "[$name] 正在关闭..." -ForegroundColor DarkGray
        Get-Process -Name $name -ErrorAction SilentlyContinue | Stop-Process -Force
        Start-Sleep -Milliseconds 800
    }

    # 1. 删除汉化文件
    $zhFiles = 'ZhInject.dll', 'ZhMap.tsv', 'ZhMode.txt', 'ZhLang.txt', 'ZhApply.log', 'ZhDebug.txt', 'ZhBar.txt'
    foreach ($f in $zhFiles) {
        $p = Join-Path $dir $f
        if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force; Write-Host "[$name] 已删除 $f" -ForegroundColor DarkGray }
    }
    # 1.5 删除多语言映射目录（标题栏切换条数据源）
    $langsDir = Join-Path $dir 'langs'
    if (Test-Path -LiteralPath $langsDir) {
        Remove-Item -LiteralPath $langsDir -Recurse -Force
        Write-Host "[$name] 已删除 langs\" -ForegroundColor DarkGray
    }

    # 2. 还原配置
    $configFile = Join-Path $dir "$name.exe.config"
    $bak        = Join-Path $dir "$name.exe.config.bak"
    if (Test-Path -LiteralPath $bak) {
        Copy-Item -LiteralPath $bak -Destination $configFile -Force
        Remove-Item -LiteralPath $bak -Force
        Write-Host "[$name] 已从备份还原配置" -ForegroundColor Green
    } else {
        # 无备份则手动移除注入的两行
        if (Test-Path -LiteralPath $configFile) {
            $xml = Get-Content -LiteralPath $configFile -Raw -Encoding UTF8
            $xml = $xml -replace '(?m)^\s*<appDomainManagerAssembly[^\r\n]*\r?\n', ''
            $xml = $xml -replace '(?m)^\s*<appDomainManagerType[^\r\n]*\r?\n', ''
            Set-Content -LiteralPath $configFile -Value $xml -Encoding UTF8
            Write-Host "[$name] 无备份，已直接移除注入行" -ForegroundColor Green
        }
    }
    $restored++
}

Write-Host ''
if ($restored -gt 0) {
    Write-Host "还原完成！已还原 $restored 个程序到英文原版。（config.json 已保留，再次安装时自动复用路径）" -ForegroundColor Cyan
} else {
    Write-Host "没有找到需要还原的程序（config.json 为空或路径均失效）。" -ForegroundColor Yellow
}
