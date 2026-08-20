# Streamer.bot / Speaker.bot 四语言汉化安装脚本
# 用法：
#   powershell -ExecutionPolicy Bypass -File 安装.ps1              # 交互选择语言
#   powershell -ExecutionPolicy Bypass -File 安装.ps1 -Lang ja-JP  # 直接指定语言
# 支持语言：zh-CN 简体中文 | ja-JP 日本語 | ko-KR 한국어 | es-ES Español
# 作用：部署 ZhInject.dll + 所选语言翻译映射，注入 AppDomainManager 配置，
#       写入 ZhLang.txt 记录当前语言，安装完成后自动启动程序。
# 全程不改 exe、不破坏数字签名，可随时用 还原.ps1 一键还原，用 切换语言.ps1 换语言。
param(
    [ValidateSet('zh-CN','ja-JP','ko-KR','es-ES')]
    [string]$Lang = '',
    [switch]$NoStart
)
$ErrorActionPreference = 'Stop'

$SrcRoot = $PSScriptRoot
$DllSrc  = Join-Path $SrcRoot 'src\ZhInject.dll'

$LangNames = @{ 'zh-CN'='简体中文'; 'ja-JP'='日本語'; 'ko-KR'='한국어'; 'es-ES'='Español' }

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

$Apps = @(
    @{ Name='Speaker.bot'; Dir='C:\Users\admin\Apps\Speaker.bot' },
    @{ Name='Streamer.bot'; Dir='C:\Users\admin\Apps\Streamer.bot' }
)

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
    param([string]$ConfigPath)
    $xml = Get-Content -LiteralPath $ConfigPath -Raw -Encoding UTF8
    if ($xml -match 'appDomainManagerAssembly') { return '已注入，跳过' }
    if ($xml -notmatch '<runtime>') { throw '未找到 <runtime> 节点，无法注入' }
    $insert = "    <appDomainManagerAssembly value=`"ZhInject, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null`" />`r`n" +
              "    <appDomainManagerType value=`"ZhInject.ZhManager`" />`r`n  "
    $xml = $xml -replace '</runtime>', ($insert + '</runtime>')
    Set-Content -LiteralPath $ConfigPath -Value $xml -Encoding UTF8
    return '已注入'
}

Write-Host ''
Write-Host "开始安装汉化：语言 = $LangName ($Lang)" -ForegroundColor Cyan

foreach ($app in $Apps) {
    $name = $app.Name
    $dir  = $app.Dir

    # 语言映射必须存在
    $mapSrc = Join-Path $SrcRoot "$name\$Lang\ZhMap.tsv"
    if (-not (Test-Path -LiteralPath $mapSrc)) {
        Write-Error "缺少语言映射文件：$mapSrc（已跳过 $name）" -ErrorAction Continue
        continue
    }
    if (-not (Test-Path -LiteralPath $dir)) {
        Write-Error "未找到 $name 安装目录：$dir（已跳过）" -ErrorAction Continue
        continue
    }

    Stop-App $name

    # 1. 备份配置
    $config = Join-Path $dir "$name.exe.config"
    $bak    = Join-Path $dir "$name.exe.config.bak"
    if ((Test-Path $config) -and -not (Test-Path $bak)) {
        Copy-Item -LiteralPath $config -Destination $bak
        Write-Host "[$name] 已备份配置 → $bak" -ForegroundColor DarkGray
    }

    # 2. 注入配置
    if (Test-Path $config) {
        $result = Inject-AppDomainManager $config
        Write-Host "[$name] 注入 AppDomainManager：$result" -ForegroundColor Green
    } else {
        Write-Warning "[$name] 未找到 $config"
    }

    # 3. 部署文件
    Copy-Item -LiteralPath $DllSrc  -Destination (Join-Path $dir 'ZhInject.dll') -Force
    Copy-Item -LiteralPath $mapSrc  -Destination (Join-Path $dir 'ZhMap.tsv') -Force
    Set-Content -LiteralPath (Join-Path $dir 'ZhMode.txt') -Value 'translate' -Encoding Ascii
    Set-Content -LiteralPath (Join-Path $dir 'ZhLang.txt') -Value $Lang -Encoding Ascii
    Write-Host "[$name] 已部署 ZhInject.dll / ZhMap.tsv($Lang) / ZhMode.txt=translate / ZhLang.txt=$Lang" -ForegroundColor Green
}

Write-Host ''
Write-Host "汉化安装完成：$LangName ($Lang)" -ForegroundColor Cyan

if (-not $NoStart) {
    Write-Host '正在自动启动程序...' -ForegroundColor DarkGray
    foreach ($app in $Apps) {
        $exe = Join-Path $app.Dir "$($app.Name).exe"
        if (Test-Path -LiteralPath $exe) {
            try { Start-Process -FilePath $exe; Write-Host "[$($app.Name)] 已启动" -ForegroundColor Green }
            catch { Write-Warning "[$($app.Name)] 启动失败: $($_.Exception.Message)" }
        } else {
            Write-Warning "[$($app.Name)] 未找到 $exe"
        }
    }
    Write-Host ''
    Write-Host '程序已启动，稍等片刻即可看到所选语言界面。' -ForegroundColor Cyan
} else {
    Write-Host '（已跳过自动启动，请手动启动程序查看效果）' -ForegroundColor DarkGray
}
Write-Host '如需更换语言，运行 切换语言.ps1；如需还原英文，运行 还原.ps1。' -ForegroundColor Cyan