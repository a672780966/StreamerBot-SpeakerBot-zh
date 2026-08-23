# docs — 页面文字图谱与参考资料

本目录保存从 **Streamer.bot** 程序内部提取的界面文本资料，供翻译贡献者定位字符串所属页面、
以及程序更新后核对新增文本时使用。

## 文件说明

### Streamer.bot-页面文字图谱.md

通过 **BAML 资源解析**（Baml2006Reader）提取的 Streamer.bot 全部 **496 个 XAML 视图**的界面文本图谱：

| 分类 | 视图数 | 文本量 |
|---|---|---|
| 对话框 | 401 | 5519 |
| 设置/页面 | 76 | 2267 |
| 独立窗口 | 5 | 220 |
| 主窗口 | 1 | 94 |

- 开头是覆盖状态总览（静态文本命中率 96.7%）与按英文保留的条目分类
- 正文按**模块路径**分组（如 `dialogs/subactions/code/executecodedialog`、`views/settings/...`），
  每组列出该页面/对话框包含的全部文本
- 用途：想知道某条英文属于哪个页面 → 在本文件中搜索该文本，按模块路径定位

### Streamer.bot-各视图文本清单.md

上图的**干净版清单**：1112 条唯一文本，分布在 441 个视图模块，按 `.baml` 视图路径分组
（如 `ui/wpf/mainwindow.baml`、`ui/wpf/views/dialogs/actiondialog.baml`）。

## 如何用它扩展翻译

1. 在清单中找到目标文本，确认它所属的视图模块（即哪个页面/对话框）
2. 打开对应语言的 `ZhMap.tsv`（如 `Streamer.bot/ja-JP/ZhMap.tsv`），
   添加或修改 `英文<TAB>译文` 行
3. 重启程序生效；也可用 `tools/merge_maps.py validate` 校验键集一致性

## 说明

- 本资料仅覆盖 **Streamer.bot**（Speaker.bot 界面较小，未做 BAML 提取）
- 品牌名/集成名/技术术语/格式串按设计保留英文，分类见图谱开头
- 程序更新后如出现未翻译的新文本，可重新提取 BAML 对照补充
