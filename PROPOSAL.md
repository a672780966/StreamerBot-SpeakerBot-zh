# Proposal: Official multilingual UI support for Streamer.bot & Speaker.bot

**From:** a672780966
**Repo:** https://github.com/a672780966/StreamerBot-SpeakerBot-zh
**License:** MIT

Hi nate1280,

I built a complete, runtime-verified UI localization pack for **Streamer.bot** and **Speaker.bot** covering **Simplified Chinese (zh-CN), Japanese (ja-JP), Korean (ko-KR), and Spanish (es-ES)**. I'd love to explore whether some form of this could become official — and I want to be upfront about what is and isn't a good fit.

## What I think is genuinely valuable to you

**The translation data.** Four complete UI string sets, extracted from the real apps and validated in running instances:

| Language | Streamer.bot | Speaker.bot |
|---|---|---|
| zh-CN 简体中文 | 1079 translated (+9 kept-EN, 1 suppressed) | 166 translated (+15 kept-EN) |
| ja-JP 日本語 | 1077 translated | 164 translated |
| ko-KR 한국어 | 1075 translated | 165 translated |
| es-ES Español | 1070 translated | 162 translated |

- All four languages share **exactly the same key set** as the Chinese source map (Streamer.bot 1089 keys / Speaker.bot 181 keys) — machine-verified with zero missing/extra entries
- `{N}` / `%var%` placeholders verified intact in every translation
- Brand/integration names (Twitch, Discord, OBS Studio, Elgato, Patreon…), technical terms, and format strings deliberately kept in English
- MIT licensed — you can take the data wholesale, no strings attached

**If Streamer.bot grew a first-class language-pack mechanism** (e.g. loading a JSON/resx string table at startup), these translations could ship as official language packs with essentially no further work on the translation side. I'm happy to maintain them and contribute additional languages.

## What the current implementation is (and why it probably shouldn't ship as-is)

The pack currently works via a .NET `AppDomainManager` injection: a sidecar `ZhInject.dll` loads at startup, scans open windows on a 1-second timer, and rewrites static UI strings through reflection. It also draws a small floating language-switcher bar next to the main window.

This was built to work **without touching the exe** (signatures stay intact, updates keep working), and it's fully reversible — but I understand it's an external hack:

- Reflection-based string rewriting is fragile against UI changes between versions
- Data-bound properties (e.g. the main window title) can revert to English
- It's not something I'd expect you to want in the official codebase

So the injection DLL is best seen as a **working demonstration** that the translations are complete and correct in the real UI — not as the proposed official mechanism.

## What I'm asking

1. **Would you accept the translation data** as a contribution, if there were an official language-pack loading path?
2. If yes — I can restructure the maps into whatever format you prefer and submit them.
3. Either way, the repo is MIT; the community is free to use the pack as-is in the meantime.

Happy to discuss in whatever channel works — GitHub issue, Discord, or email.

Thanks for two great tools.
