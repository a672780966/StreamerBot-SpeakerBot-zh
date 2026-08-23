# Streamer.bot / Speaker.bot 汉化还原脚本
# 用法：右键「使用 PowerShell 运行」，或：
#   powershell -ExecutionPolicy Bypass -File 还原.ps1
# 作用：删除所有汉化文件（含 ZhLang.txt），从 .bak 恢复原始配置，完全还原英文原版。
$ErrorActionPreference = 'Continue'

$Apps = @('Speaker.bot', 'Streamer.bot')

foreach ($name in $Apps) {
    $dir = Join-Path 'C:\Users\admin\Apps' $name
    if (-not (Test-Path $dir)) { Write-Warning "未找到 $dir（跳过）"; continue }

    # 1. 删除汉化文件
    $zhFiles = 'ZhInject.dll', 'ZhMap.tsv', 'ZhMode.txt', 'ZhLang.txt', 'ZhApply.log', 'ZhDebug.txt', 'ZhBar.txt'
    foreach ($f in $zhFiles) {
        $p = Join-Path $dir $f
        if (Test-Path $p) { Remove-Item -LiteralPath $p -Force; Write-Host "[$name] 已删除 $f" -ForegroundColor DarkGray }
    }
    # 1.5 删除多语言映射目录（悬浮切换条数据源）
    $langsDir = Join-Path $dir 'langs'
    if (Test-Path $langsDir) {
        Remove-Item -LiteralPath $langsDir -Recurse -Force
        Write-Host "[$name] 已删除 langs\" -ForegroundColor DarkGray
    }

    # 2. 还原配置
    $config = Join-Path $dir "$name.exe.config"
    $bak    = Join-Path $dir "$name.exe.config.bak"
    if (Test-Path $bak) {
        Copy-Item -LiteralPath $bak -Destination $config -Force
        Write-Host "[$name] 已从备份还原配置" -ForegroundColor Green
    } else {
        # 无备份则手动移除注入的两行
        if (Test-Path $config) {
            $xml = Get-Content -LiteralPath $config -Raw -Encoding UTF8
            $xml = $xml -replace '(?m)^\s*<appDomainManagerAssembly[^\r\n]*\r?\n', ''
            $xml = $xml -replace '(?m)^\s*<appDomainManagerType[^\r\n]*\r?\n', ''
            Set-Content -LiteralPath $config -Value $xml -Encoding UTF8
            Write-Host "[$name] 无备份，已直接移除注入行" -ForegroundColor Green
        }
    }
}

Write-Host ''
Write-Host '还原完成！程序已恢复英文原版。' -ForegroundColor Cyan