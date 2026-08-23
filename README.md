# Streamer.bot / Speaker.bot Multilingual Localization Pack

A fully reversible, injection-based localization pack for **Streamer.bot** and **Speaker.bot** that provides four interface languages: **简体中文 (zh-CN)**, **日本語 (ja-JP)**, **한국어 (ko-KR)** and **Español (es-ES)**.

- **No exe modification** – digital signatures stay intact
- **Injection via .NET AppDomainManager** – a sidecar `ZhInject.dll` swaps UI strings at runtime
- **Reversible** – one-click uninstall restores the original English UI
- **Instant language switching** – install once, switch between all four languages anytime

## Repository Layout

```
StreamerBot-SpeakerBot-zh\
├─ 安装.ps1          Install script (language menu / -Lang param / auto-launch)
├─ 切换语言.ps1      Language switch script (deploys the map and restarts the app)
├─ 还原.ps1          Restore script (removes all localization files, restores config)
├─ 使用说明.md       Usage guide (Chinese)
├─ src\
│  └─ ZhInject.dll   Language-agnostic injector (one DLL for all four languages)
├─ Streamer.bot\
│  ├─ zh-CN\ZhMap.tsv    Simplified Chinese map (1089 keys)
│  ├─ ja-JP\ZhMap.tsv    Japanese map (1089 keys)
│  ├─ ko-KR\ZhMap.tsv    Korean map (1089 keys)
│  └─ es-ES\ZhMap.tsv    Spanish map (1089 keys)
└─ Speaker.bot\
   ├─ zh-CN\ZhMap.tsv    Simplified Chinese map (181 keys)
   ├─ ja-JP\ZhMap.tsv    Japanese map (181 keys)
   ├─ ko-KR\ZhMap.tsv    Korean map (181 keys)
   └─ es-ES\ZhMap.tsv    Spanish map (181 keys)
```

## Install

1. Close Streamer.bot and Speaker.bot.
2. Right-click `安装.ps1` → **Run with PowerShell**, then pick a language (`1) 简体中文 2) 日本語 3) 한국어 4) Español`).
   - Or skip the menu: `powershell -ExecutionPolicy Bypass -File 安装.ps1 -Lang ja-JP`
   - `-Lang` accepts `zh-CN` / `ja-JP` / `ko-KR` / `es-ES`
3. The script auto-launches both apps (pass `-NoStart` to skip). The UI switches to the chosen language shortly after startup.

The installer automatically: stops running instances, backs up `*.exe.config` to `*.exe.config.bak`, injects the two AppDomainManager lines into `<runtime>`, deploys `ZhInject.dll` plus the selected-language `ZhMap.tsv`, and writes `ZhMode.txt=translate` and `ZhLang.txt=<lang>`.

## Switch Language

- Right-click `切换语言.ps1` and choose the new language — it deploys the matching map and **auto-restarts** the apps so the new language takes effect.
- Or: `powershell -ExecutionPolicy Bypass -File 切换语言.ps1 -Lang es-ES`
- The active language is recorded in `ZhLang.txt` next to each app.

### Title-Bar Language Switcher

The installer deploys **all four language maps** into `langs\` and embeds a compact **title-bar switcher** into each app's main window title bar (right side, next to the caption buttons):

```
┌────────────────────────────────┐
│ 中文 │ 日本語 │ 한국어 │ Español │
└────────────────────────────────┘
```

- **Click a language** → confirm → the app restarts into that language
- **Right-click the bar** → **Restore English** (uninstalls the localization and restarts the app in English)
- Always on top and drift-free: moves, minimizes and restores together with the app window; disable entirely by deleting `ZhBar.txt`

## Restore to English

Close the apps and run `还原.ps1`:
- Deletes `ZhInject.dll / ZhMap.tsv / ZhMode.txt / ZhLang.txt / ZhApply.log / ZhDebug.txt`
- Restores the original config from `.bak` (or strips the injected lines if no backup exists)

## How It Works

- `ZhMap.tsv`: translation map, format `english<TAB>translation`, UTF-8. First line `# english <lang>` is the header.
- **Placeholder matching**: entries containing `{N}` (e.g. `Actions ({0})`) compile to a regex at load time and are substituted at runtime (`Actions (3)` → `动作（3）`). Only pure-ASCII source strings are matched, avoiding double-translation.
- **Kept English**: a translation equal to its key (e.g. `Discord`, `1.0.7`, `ms`) means "keep English, do not translate"; an empty translation suppresses that entry (e.g. `Supporter`).
- **Key-set parity**: all four language maps share exactly the same key set as the Chinese source map (Streamer.bot 1089 / Speaker.bot 181), validated with zero missing/extra keys; `{N}` and `%var%` placeholders are verified intact.
- `ZhMode.txt`: `translate` = localization enabled; `capture` = capture mode (dumps untranslated UI strings for expanding the map).
- `ZhApply.log`: runtime log with `applied: X -> Y` (exact) and `appliedp:` (placeholder) entries for verifying which strings were translated.
- **Note**: the map is loaded at startup and windows are re-scanned periodically — you must **restart the app** (the switch script does this automatically) for changes to take effect.

## Translation Latency

The UI briefly shows English before switching to the chosen language — this is inherent to the injection approach:

- The injector performs its **first scan 0.5 s** after startup, then **every 1 s**.
- English display time = app window-creation time + at most 1 s scan interval.
- Measured on our machine: first translation appears at ~**2.1 s** (Speaker.bot) and ~**9.1 s** (Streamer.bot). The Streamer.bot remainder is mostly its own WPF window initialization (~9 s), not an injector bottleneck.
- Once a window is ready, all static text switches within the next scan (≤1 s). New windows/pages are translated within at most 1 s of opening.

## Coverage

| Language | Streamer.bot | Speaker.bot |
|---|---|---|
| zh-CN 简体中文 | 1079 translated / 9 kept / 1 suppressed | 166 translated / 15 kept |
| ja-JP 日本語 | 1077 translated | 164 translated |
| ko-KR 한국어 | 1075 translated | 165 translated |
| es-ES Español | 1070 translated | 162 translated |

(Translated counts exclude kept-English and suppressed entries; key sets are identical across languages.)

## Verified

Runtime verification passed for every language: `applied` fires, `seterr = 0`.

| Step | Result |
|---|---|
| Install ja-JP (auto-launch) | ✓ deployed map SHA256 matches package, UI shows Japanese |
| Switch ko-KR (auto-restart) | ✓ UI shows Korean |
| Switch es-ES (auto-restart) | ✓ UI shows Spanish |
| Switch zh-CN (auto-restart) | ✓ UI shows Chinese |
| Restore English | ✓ all files removed, config restored |

## Notes & Limitations

- Untranslated entries are **brand/integration names** (Twitch, Discord, OBS Studio, Elgato\*, Patreon…), **technical terms/units** (ms, MIDI, TLS), and **numbers/GUIDs/format strings** (`1.0.7`, `(0/0)`, `{0}/{1}`), deliberately kept in English.
- **Known limitation**: the main window title may revert to English after the app rebinds data (data binding outranks local values) — an app-side behavior, it does not affect the rest of the UI.
- Brand names are kept as-is; after an app update, new UI strings may be untranslated — rerun capture mode to extend the map.

---

## Language Selector / 语言选择

- **[English](#streamerbot--speakerbot-multilingual-localization-pack)**
- [简体中文](#中文说明)
- [日本語](#日本語の説明)
- [한국어](#한국어-설명)
- [Español](#español)

---

<details>
<summary><b>简体中文 · 中文说明</b></summary>

# Streamer.bot / Speaker.bot 四语言汉化包

对 **Streamer.bot** 和 **Speaker.bot** 提供四种界面语言：**简体中文 (zh-CN)**、**日本語 (ja-JP)**、**한국어 (ko-KR)**、**Español (es-ES)**。

采用**注入式**方案：不改动 exe、不破坏数字签名，通过 .NET `AppDomainManager` 机制在程序启动时自动加载旁置的 `ZhInject.dll`，把界面文本替换为所选语言。完全可逆，一键还原、一键切换语言。

## 安装

1. 关闭 Streamer.bot 和 Speaker.bot。
2. 右键 `安装.ps1` → **使用 PowerShell 运行**，按提示选择语言（`1) 简体中文 2) 日本語 3) 한국어 4) Español`）。
   - 或指定语言：`powershell -ExecutionPolicy Bypass -File 安装.ps1 -Lang ja-JP`
   - `-Lang` 可选 `zh-CN` / `ja-JP` / `ko-KR` / `es-ES`
3. 安装完成后脚本**自动启动**两个程序（可用 `-NoStart` 跳过），稍候界面即为所选语言。

安装脚本会自动：关闭正在运行的程序、备份原 `*.exe.config` → `*.exe.config.bak`、在 `<runtime>` 注入 AppDomainManager 两行配置、部署 `ZhInject.dll` + 所选语言 `ZhMap.tsv`，写入 `ZhMode.txt=translate` 与 `ZhLang.txt=<语言>`。

## 切换语言

- 右键 `切换语言.ps1` → 选择新语言，脚本部署对应映射并**自动重启**程序使新语言生效。
- 或：`powershell -ExecutionPolicy Bypass -File 切换语言.ps1 -Lang es-ES`
- 当前生效语言记录在各程序目录的 `ZhLang.txt`。

### 标题栏切换条

安装脚本会部署**全部四张语言映射**到 `langs\` 目录，并在主窗口**标题栏内嵌入切换条**（位于窗口控制按钮左侧）：

```
┌────────────────────────────────┐
│ 中文 │ 日本語 │ 한국어 │ Español │
└────────────────────────────────┘
```

- **点击语言** → 确认弹窗 → 程序自动重启进入该语言
- **右键切换条** → **还原英文**（一键卸载汉化并以英文重启）
- 始终置顶、绝不漂移：随主窗口移动/最小化/还原；删除 `ZhBar.txt` 可彻底停用

## 还原英文

关闭程序后运行 `还原.ps1`：删除 `ZhInject.dll / ZhMap.tsv / ZhMode.txt / ZhLang.txt / ZhApply.log / ZhDebug.txt`，并从 `.bak` 恢复原始配置（无备份则直接移除注入行）。

## 翻译延迟说明

程序启动后界面英文需要短暂等待才变为所选语言，属**注入式方案固有机制**：

- 注入器启动后 **0.5 秒**首次扫描，此后**每 1 秒**重新扫描一次。
- 英文显示时长 = 程序窗口创建完成前的时间 + 最长 1 秒扫描间隔。
- 实测（本机）：Speaker.bot 约 **2.1 秒**、Streamer.bot 约 **9.1 秒**出现首个翻译；Streamer.bot 剩余延迟主要来自其 WPF 主窗口自身初始化（约 9 秒），属程序启动开销。
- 窗口就绪后，全部静态文本在下一个扫描周期（≤1 秒）内统一切换；打开新窗口/页面同样最多等 1 秒。

## 覆盖统计

| 语言 | Streamer.bot | Speaker.bot |
|---|---|---|
| zh-CN 简体中文 | 1079 已译 / 9 保留英文 / 1 抑制 | 166 已译 / 15 保留英文 |
| ja-JP 日本語 | 1077 已译 | 164 已译 |
| ko-KR 한국어 | 1075 已译 | 165 已译 |
| es-ES Español | 1070 已译 | 162 已译 |

（键集合各语言完全一致：Streamer.bot 1089 / Speaker.bot 181。）

## 说明与限制

- 未翻译条目为**品牌/集成名**（Twitch、Discord、OBS Studio、Elgato*、Patreon 等）、**技术术语/单位**（ms、MIDI、TLS）、**数字/GUID/格式串**（1.0.7、`(0/0)`、`{0}/{1}`），按设计保留英文。
- **已知限制**：主窗口标题在应用重新绑定数据后可能被还原为英文（数据绑定优先级高于本地值），属应用侧行为，不影响其余界面。
- 详细用法见 `使用说明.md`。

</details>

<details>
<summary><b>日本語 · 日本語の説明</b></summary>

# Streamer.bot / Speaker.bot 多言語化パック

**Streamer.bot** と **Speaker.bot** に **简体中文 (zh-CN)**、**日本語 (ja-JP)**、**한국어 (ko-KR)**、**Español (es-ES)** の4言語のインターフェースを提供します。

**注入式**方式を採用：exe を変更せずデジタル署名も保持。.NET `AppDomainManager` 機構で起動時に旁置の `ZhInject.dll` を自動ロードし、UIテキストを選択言語に置き換えます。完全に可逆で、ワンクリックで復元・言語切替が可能です。

## インストール

1. Streamer.bot と Speaker.bot を閉じます。
2. `安装.ps1` を右クリック → **PowerShell で実行**し、言語を選択（`1) 简体中文 2) 日本語 3) 한국어 4) Español`）。
   - または直接指定：`powershell -ExecutionPolicy Bypass -File 安装.ps1 -Lang ja-JP`
   - `-Lang` は `zh-CN` / `ja-JP` / `ko-KR` / `es-ES`
3. インストール後スクリプトが**自動起動**します（`-NoStart` でスキップ）。UI は選択言語に切り替わります。

インストーラは自動で：実行中のアプリを停止、`*.exe.config` を `*.exe.config.bak` にバックアップ、`<runtime>` に AppDomainManager 2行を注入、`ZhInject.dll` と選択言語の `ZhMap.tsv` を配置、`ZhMode.txt=translate` と `ZhLang.txt=<言語>` を書き込みます。

## 言語切替

- `切换语言.ps1` を右クリック → 新言語を選択。マップを配置して**自動再起動**し、新言語を反映します。
- または：`powershell -ExecutionPolicy Bypass -File 切换语言.ps1 -Lang es-ES`
- 現在の言語は各アプリの `ZhLang.txt` に記録されます。

### タイトルバー切替バー

インストーラは **4言語すべてのマップ**を `langs\` に配置し、メインウィンドウの**タイトルバーに埋め込みバー**を表示します（ウィンドウ制御ボタンの左側）：

```
┌────────────────────────────────┐
│ 中文 │ 日本語 │ 한국어 │ Español │
└────────────────────────────────┘
```

- **言語をクリック** → 確認ダイアログ → アプリが自動再起動して切り替わります
- **バーを右クリック** → **英語に戻す**（アンインストールして英語で再起動）
- 常に最前面で固定；メインウィンドウと一緒に移動/最小化/復元；`ZhBar.txt` を削除すると無効化

## 英語に戻す

アプリを閉じて `还原.ps1` を実行：`ZhInject.dll / ZhMap.tsv / ZhMode.txt / ZhLang.txt / ZhApply.log / ZhDebug.txt` を削除し、`.bak` から設定を復元します（バックアップが無ければ注入行を除去）。

## 翻訳の遅延について

起動直後、UI は選択言語に切り替わるまで一時的に英語を表示します。これは注入式方式の特性です：

- 注入器は起動 **0.5 秒後**に初回スキャン、以降 **1 秒ごと**に再スキャンします。
- 英語表示時間 = ウィンドウ生成時間 + 最大1秒のスキャン間隔。
- 実測（本機）：Speaker.bot 約 **2.1 秒**、Streamer.bot 約 **9.1 秒**で最初の翻訳が適用。Streamer.bot の残りは主に WPF メインウィンドウ初期化（約9秒）で、注入器のボトルネックではありません。
- ウィンドウ準備完了後、全静的テキストは次のスキャン（≤1秒）で一括切替。新しいウィンドウ/ページも最大1秒で翻訳されます。

## カバレッジ

| 言語 | Streamer.bot | Speaker.bot |
|---|---|---|
| zh-CN 简体中文 | 1079 翻訳 / 9 保持 / 1 抑制 | 166 翻訳 / 15 保持 |
| ja-JP 日本語 | 1077 翻訳 | 164 翻訳 |
| ko-KR 한국어 | 1075 翻訳 | 165 翻訳 |
| es-ES Español | 1070 翻訳 | 162 翻訳 |

（キーセットは全言語で完全一致：Streamer.bot 1089 / Speaker.bot 181。）

## 注意・制限

- 未翻訳項目は**ブランド/連携名**（Twitch、Discord、OBS Studio、Elgato*、Patreon 等）、**技術用語/単位**（ms、MIDI、TLS）、**数値/GUID/書式文字列**（1.0.7、`(0/0)`、`{0}/{1}`）で、意図的に英語のままです。
- **既知の制限**：メインウィンドウのタイトルはデータ再バインド時に英語へ戻る場合があります（データバインディングがローカル値を優先）。アプリ側の挙動で、他の UI には影響しません。

</details>

<details>
<summary><b>한국어 · 한국어 설명</b></summary>

# Streamer.bot / Speaker.bot 다국어 로컬라이제이션 팩

**Streamer.bot**과 **Speaker.bot**에 **简体中文 (zh-CN)**·**日本語 (ja-JP)**·**한국어 (ko-KR)**·**Español (es-ES)** 네 가지 UI 언어를 제공합니다.

**주입식(injection)** 방식: exe를 수정하지 않고 디지털 서명을 유지합니다. .NET `AppDomainManager` 메커니즘으로 시작 시 `ZhInject.dll`을 자동 로드해 UI 텍스트를 선택한 언어로 교체합니다. 완전히 되돌릴 수 있으며 원클릭 복원·언어 전환이 가능합니다.

## 설치

1. Streamer.bot과 Speaker.bot을 닫습니다.
2. `安装.ps1`을 우클릭 → **PowerShell로 실행**하고 언어 선택（`1) 简体中文 2) 日本語 3) 한국어 4) Español`）。
   - 또는 직접 지정: `powershell -ExecutionPolicy Bypass -File 安装.ps1 -Lang ko-KR`
   - `-Lang` 값: `zh-CN` / `ja-JP` / `ko-KR` / `es-ES`
3. 설치 후 스크립트가 앱을 **자동 실행**합니다（`-NoStart`로 건너뛰기）。잠시 후 UI가 선택 언어로 바뀝니다.

설치 스크립트는 자동으로: 실행 중인 앱을 종료하고 `*.exe.config`를 `*.exe.config.bak`로 백업하며 `<runtime>`에 AppDomainManager 두 줄을 주입하고 `ZhInject.dll` + 선택 언어 `ZhMap.tsv`를 배포하며 `ZhMode.txt=translate`와 `ZhLang.txt=<언어>`를 기록합니다.

## 언어 전환

- `切换语言.ps1`을 우클릭 → 새 언어 선택. 매핑을 배포하고 앱을 **자동 재시작**하여 새 언어를 적용합니다.
- 또는: `powershell -ExecutionPolicy Bypass -File 切换语言.ps1 -Lang es-ES`
- 현재 언어는 각 앱 폴더의 `ZhLang.txt`에 기록됩니다.

### 제목 표시줄 전환 바

설치 스크립트는 **4개 언어 매핑 전부**를 `langs\`에 배포하고 메인 창 **제목 표시줄에 전환 바를 내장**합니다（창 제어 버튼 왼쪽）：

```
┌────────────────────────────────┐
│ 中文 │ 日本語 │ 한국어 │ Español │
└────────────────────────────────┘
```

- **언어 클릭** → 확인 대화상자 → 앱이 자동 재시작되며 해당 언어로 전환됩니다
- **바 우클릭** → **영어로 복원**（제거 후 영어로 재시작）
- 항상 최상단 고정；메인 창과 함께 이동/최소화/복원；`ZhBar.txt` 삭제 시 비활성화

## 영어로 복원

앱을 닫고 `还原.ps1` 실행: `ZhInject.dll / ZhMap.tsv / ZhMode.txt / ZhLang.txt / ZhApply.log / ZhDebug.txt`를 삭제하고 `.bak`에서 설정을 복원합니다（백업이 없으면 주입 줄만 제거）.

## 번역 지연 안내

시작 직후 UI는 선택 언어로 바뀌기 전까지 잠시 영어를 표시합니다. 이는 주입식 방식의 특성입니다:

- 주입기는 시작 **0.5초 후** 첫 스캔, 이후 **1초마다** 재스캔합니다.
- 영어 표시 시간 = 창 생성 시간 + 최대 1초 스캔 간격.
- 실측(본 기기): Speaker.bot 약 **2.1초**, Streamer.bot 약 **9.1초** 후 첫 번역 적용. Streamer.bot의 나머지 지연은 주로 WPF 메인 창 초기화(약 9초)로, 주입기 병목이 아닙니다.
- 창이 준비되면 모든 정적 텍스트가 다음 스캔(≤1초)에서 일괄 전환됩니다. 새 창/페이지도 최대 1초 내 번역됩니다.

## 커버리지

| 언어 | Streamer.bot | Speaker.bot |
|---|---|---|
| zh-CN 简体中文 | 1079 번역 / 9 유지 / 1 억제 | 166 번역 / 15 유지 |
| ja-JP 日本語 | 1077 번역 | 164 번역 |
| ko-KR 한국어 | 1075 번역 | 165 번역 |
| es-ES Español | 1070 번역 | 162 번역 |

（키 집합은 모든 언어에서 동일: Streamer.bot 1089 / Speaker.bot 181。）

## 참고 및 제한

- 미번역 항목은 **브랜드/연동 이름**（Twitch、Discord、OBS Studio、Elgato*、Patreon 등）과 **기술 용어/단위**（ms、MIDI、TLS）、**숫자/GUID/형식 문자열**（1.0.7、`(0/0)`、`{0}/{1}`）으로 의도적으로 영어로 유지됩니다.
- **알려진 제한**: 메인 창 제목은 앱이 데이터를 재바인딩할 때 영어로 되돌아갈 수 있습니다（데이터 바인딩이 로컬 값을 우선）. 앱 측 동작이며 나머지 UI에는 영향이 없습니다.

</details>

<details>
<summary><b>Español · Explicación en español</b></summary>

# Paquete de localización multilingüe para Streamer.bot / Speaker.bot

Proporciona cuatro idiomas de interfaz para **Streamer.bot** y **Speaker.bot**: **简体中文 (zh-CN)**, **日本語 (ja-JP)**, **한국어 (ko-KR)** y **Español (es-ES)**.

Usa un enfoque de **inyección**: no modifica el exe y mantiene las firmas digitales. Mediante el mecanismo .NET `AppDomainManager`, un `ZhInject.dll` lateral se carga al iniciar la app y reemplaza los textos de la interfaz por el idioma elegido. Totalmente reversible: restauración y cambio de idioma con un clic.

## Instalación

1. Cierra Streamer.bot y Speaker.bot.
2. Haz clic derecho en `安装.ps1` → **Ejecutar con PowerShell** y elige idioma (`1) 简体中文 2) 日本語 3) 한국어 4) Español`).
   - O directamente: `powershell -ExecutionPolicy Bypass -File 安装.ps1 -Lang es-ES`
   - `-Lang` acepta `zh-CN` / `ja-JP` / `ko-KR` / `es-ES`
3. El script **inicia ambas apps automáticamente** (usa `-NoStart` para omitirlo). La interfaz cambia al idioma elegido poco después.

El instalador automáticamente: detiene las apps en ejecución, respalda `*.exe.config` → `*.exe.config.bak`, inyecta las dos líneas AppDomainManager en `<runtime>`, despliega `ZhInject.dll` + el `ZhMap.tsv` del idioma elegido, y escribe `ZhMode.txt=translate` y `ZhLang.txt=<idioma>`.

## Cambiar idioma

- Clic derecho en `切换语言.ps1` → elige el nuevo idioma; despliega el mapa y **reinicia las apps** para aplicar el cambio.
- O: `powershell -ExecutionPolicy Bypass -File 切换语言.ps1 -Lang es-ES`
- El idioma activo se registra en `ZhLang.txt` junto a cada app.

### Barra de cambio de idioma en la barra de título

El instalador despliega **los cuatro mapas de idioma** en `langs\` y incrusta una **barra compacta en la barra de título** de la ventana principal（a la izquierda de los botones de control）:

```
┌────────────────────────────────┐
│ 中文 │ 日本語 │ 한국어 │ Español │
└────────────────────────────────┘
```

- **Clic en un idioma** → confirmación → la app se reinicia en ese idioma
- **Clic derecho en la barra** → **Restaurar inglés**（desinstala la localización y reinicia en inglés）
- Siempre visible y fija; se mueve, minimiza y restaura con la ventana; elimina `ZhBar.txt` para desactivarla

## Restaurar a inglés

Cierra las apps y ejecuta `还原.ps1`: elimina `ZhInject.dll / ZhMap.tsv / ZhMode.txt / ZhLang.txt / ZhApply.log / ZhDebug.txt` y restaura la configuración desde `.bak` (o quita las líneas inyectadas si no hay respaldo).

## Latencia de traducción

Justo al iniciar, la interfaz muestra inglés brevemente antes de pasar al idioma elegido — es inherente al enfoque de inyección:

- El inyector hace su **primer escaneo 0.5 s** tras el arranque, luego **cada 1 s**.
- Tiempo en inglés = tiempo de creación de la ventana + como máximo 1 s de intervalo de escaneo.
- Medido en nuestra máquina: la primera traducción aparece en ~**2.1 s** (Speaker.bot) y ~**9.1 s** (Streamer.bot). El resto en Streamer.bot se debe sobre todo a su propia inicialización de la ventana WPF (~9 s), no a un cuello de botella del inyector.
- Una vez lista la ventana, todo el texto estático cambia en el siguiente escaneo (≤1 s). Las ventanas/páginas nuevas se traducen en como máximo 1 s.

## Cobertura

| Idioma | Streamer.bot | Speaker.bot |
|---|---|---|
| zh-CN 简体中文 | 1079 traducidas / 9 mantenidas / 1 suprimida | 166 traducidas / 15 mantenidas |
| ja-JP 日本語 | 1077 traducidas | 164 traducidas |
| ko-KR 한국어 | 1075 traducidas | 165 traducidas |
| es-ES Español | 1070 traducidas | 162 traducidas |

(Los conjuntos de claves son idénticos en todos los idiomas: Streamer.bot 1089 / Speaker.bot 181.)

## Notas y limitaciones

- Los elementos sin traducir son **nombres de marca/integraciones** (Twitch, Discord, OBS Studio, Elgato\*, Patreon…), **términos/unidades técnicos** (ms, MIDI, TLS) y **números/GUIDs/cadenas de formato** (`1.0.7`, `(0/0)`, `{0}/{1}`), mantenidos deliberadamente en inglés.
- **Limitación conocida**: el título de la ventana principal puede volver a inglés cuando la app reenlaza datos (el enlace de datos prevalece sobre el valor local). Es un comportamiento de la app y no afecta al resto de la interfaz.

</details>