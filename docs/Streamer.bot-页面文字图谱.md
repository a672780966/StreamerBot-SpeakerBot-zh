# Streamer.bot 汉化未触达区域探索报告

> 通过 BAML 资源解析（Baml2006Reader）提取 Streamer.bot.exe 内全部 496 个 XAML 视图的界面文本。
> 本报告最初用于探索 67 条映射之外的全部未覆盖文本；**本次扩展已将其中的静态界面文本全部翻译**。
> 下文为更新后的覆盖状态与仍按英文保留的条目分类。

## 总览（更新于本次扩展后）

| 指标 | 数值 |
|---|---|
| BAML 视图总数 | 496 |
| 提取原始字符串 | 8188 |
| 唯一字符串 | 2527 |
| 扩展后映射（Streamer.bot） | 1089（深度检查 +30） |
| 清洗后待翻译静态文本 | 1006 |
| **静态文本命中率** | **96.7%（973/1006）** |
| 未覆盖（按英文保留） | 33 |

> **深度检查补充（capture 模式）**：遍历 13 个 TabItem + 集成页 + 观众页 + 设置页 + 全局变量窗口，
> 累计采集 250+ 条运行时文本。已采集但未翻译词条共 100 条，其中 **30 条可翻译**已补译
> （观众页列头 7 + 集成页说明 19 + 设置页 4），运行时验证全部生效；
> 其余为 Patreon 支持者人名（~50）与品牌/集成名（19），按设计保留英文。

## 未覆盖的 33 条分类（均按英文保留，属正确行为）

| 类别 | 条目 | 说明 |
|---|---|---|
| 集成/品牌名 | OBS Studio、Streamlabs Desktop、Elgato CameraHub、Elgato StreamDeck、Elgato WaveLink、VTube Studio、Lumia Stream、Meld Studio、Crowd Control、Donor Drive、Pally.gg、Speaker.bot | 第三方产品名不翻译 |
| 技术术语 | TLS 1.0/1.1/1.2、HypeRate ID、HypeRate.io、Webhook URL | 保持英文 |
| 格式串 | `{0}%`、`{0}/100`、`{0}/200`、`{0}/40`、`{0}/45`、`{0}/500`、`{0}/5000`、`Streamer.bot {0}` | 进度/计数占位格式，随数据变化，翻译无意义 |
| 噪声/变量 | `%fileName%`、`%filePath%`、`%line%`、`<<`、`>>`、`SubActionSwitchCase_CaseSensitive`、`v5.x` | 变量路径/操作符/版本号 |

## 已知运行时限制

1. **主窗口标题**：应用重新绑定数据后标题可能还原为英文（WPF 数据绑定优先级高于本地值），
   属应用侧行为，首次启动时已正确翻译。
2. **命令/动作编辑对话框内部**的部分动态控件（图标按钮无文本、DataGrid 单元格运行时值）
   未逐一展开验证，需手动交互采集补充；已覆盖命令页列头与全局变量查看器。
3. **占位符匹配**对 `{0}` 使用 `.+?`（任意非空内容），若控件值为空串则不命中（可接受）。

---

## 附：原始探索明细（BAML 提取未覆盖文本）

以下为最初 2467 条未覆盖文本的完整清单，供后续逐条补充翻译时检索。多数已在上方"已翻译"范围内。
若需针对某一对话框精修，可依据模块路径定位到 `ZhMap.tsv` 对应条目直接修改。

## 未触达区域分布

| 类别 | 视图数 | 文本量 |
|---|---|---|
| 对话框 | 401 | 5519 |
| 设置/页面 | 76 | 2267 |
| 独立窗口 | 5 | 220 |
| 主窗口 | 1 | 94 |

## 各模块未覆盖文本明细

### 对话框

#### dialogs/subactions/code/executecodedialog（67 条）

- 10
- 11
- 12
- 13
- 14
- 16
- 18
- 20
- 24
- 28
- Add reference from file...
- AddReferenceCommand
- Cancel
- CancelCommand
- Closing
- CodingFonts
- Compile
- CompileCommand
- CompileStatusStrings
- Compiling Log
- Copy all to clipboard
- CopyCompileLogToClipboardCommand
- DelayStart
- Delayed Start
- DeleteReferenceCommand
- Description
- Editing
- Editor Settings
- EditorContainer
- FallbackEditor
- Find Refs
- FindRefsCommand
- Font Family
- Font Size
- FontPicker
- FontSizePicker
- Format Document
- FormatDocumentCommand
- Loaded
- Loading Editor Components...
- Monaco Settings
- Name
- Ok
- OkCommand
- Precompile
- Precompile on Application Start
- References
- ReloadingWebview
- Save
- Save Result to Variable
- Save and Compile
- SaveAndCompileCommand
- SaveCommand
- SaveToVariable
- SelectedFontFamily
- SelectedReference
- Settings
- StatusMessage
- TextFontSize
- Title
- True
- UseFallbackEditor
- Variable Name
- VariableName
- Window
- WindowClosingCommand
- WindowLoadedCommand

#### dialogs/twitch/twitchchannelrewarddialog（48 条）

- (Optional)
- Background Color
- BackgroundColor
- CancelCommand
- Caption
- Cost
- Description
- Enabled
- ForegroundColor
- Global Cooldown
- GlobalCooldown
- Group
- Groups
- HexColor
- IsEditing
- IsOwned
- Max
- MaxPerStream
- MaxPerUserPerStream
- OkCommand
- Paused
- Persist Counter
- Persist User Counter
- PersistCounter
- PersistUserCounter
- Pick a Random Color
- PickColorCommand
- PickRandomColorCommand
- Redemption Skips Queue
- RedemptionSkipsQueue
- Reward Name
- RewardPrompt
- RewardPrompt.Length
- RewardTitle
- RewardTitle.Length
- Save
- SelectedGroupText
- Streamer.bot Settings
- Title
- True
- User Input Required
- UserInputRequired
- Window
- channel points
- per Stream
- per User per Stream
- {0}/200
- {0}/45

#### dialogs/commanddialog（46 条）

- <<
- >>
- AddPermittedViewersCommand
- AddToAllowedCommand
- AllowedGroupPermissions
- Anywhere
- AvailableGroupPermissions
- CancelCommand
- CaseSensitive
- Collapsed
- Command(s)
- Commands
- Cooldowns
- Denied
- Enabled
- Exact
- ExplicitCapture
- FirstColumn
- GlobalCooldown
- Grant Type
- GrantType
- Groups
- IgnoreBotAccount
- IgnoreInternalMessages
- Include
- Location
- Mode
- Name
- Normal
- OkCommand
- Options
- PersistCounter
- PersisteUserCounter
- Regex
- RemoveAllPermittedViewersCommand
- RemoveFromAllowedCommand
- SelectedAllowedGroup
- SelectedAvailableGroup
- SelectedGroupText
- SelectedPermittedViewer
- Sources
- Start
- Title
- UserCooldown
- Visible
- Window

#### dialogs/kick/kickchannelrewarddialog（39 条）

- (Optional)
- Background Color
- BackgroundColor
- CancelCommand
- Caption
- Cost
- Description
- Enabled
- ForegroundColor
- Group
- Groups
- HexColor
- IsEditing
- IsOwned
- OkCommand
- Paused
- Persist Counter
- Persist User Counter
- PersistCounter
- PersistUserCounter
- Pick a Random Color
- PickColorCommand
- PickRandomColorCommand
- Redemption Skips Queue
- RedemptionSkipsQueue
- RewardPrompt
- RewardPrompt.Length
- RewardTitle
- RewardTitle.Length
- Save
- SelectedGroupText
- Streamer.bot Settings
- Title
- True
- User Input Required
- UserInputRequired
- Window
- {0}/200
- {0}/40

#### dialogs/subactions/midi/midioutgenericdialog（34 条）

- CancelCommand
- Channel
- Close
- Command
- Commands
- Data1
- Data2
- Device
- HasInDevices
- HasOutDevices
- Ignore NoteOff
- IgnoreNoteOff
- InDevices
- Learn from Device
- LearnDeviceOpen
- LearnDeviceState
- MIDI Device is NOT connected
- MIDI Device is already in use
- MIDI Device is connected
- MIDI Device is not found
- Name
- No Devices Available to Learn From!
- No Output Devices Available!
- OkCommand
- Open
- OpenCloseDeviceCommand
- OutDevices
- SelectedCommand
- SelectedInDevice
- SelectedOutDevice
- TestCommand
- Title
- True
- Window

#### dialogs/subactions/midi/midioutnoteondialog（32 条）

- CancelCommand
- Channel
- Close
- Device
- Duration
- HasInDevices
- HasOutDevices
- IgnoreNoteOff
- InDevices
- Learn from Device
- LearnDeviceOpen
- LearnDeviceState
- MIDI Device is NOT connected
- MIDI Device is already in use
- MIDI Device is connected
- MIDI Device is not found
- Name
- No Devices Available to Learn From!
- No Output Devices Available!
- Note
- OkCommand
- Open
- OpenCloseDeviceCommand
- OutDevices
- SelectedInDevice
- SelectedOutDevice
- Send NoteOff
- TestCommand
- Title
- True
- Velocity
- Window

#### dialogs/subactions/vtubestudio/vtubestudiocolortintdialog（32 条）

- Add
- AddValueCommand
- BackgroundColor
- CancelCommand
- Color
- Del
- Filter Type
- FilterTypes
- Filters
- ForegroundColor
- HexColor
- IsConnected
- Mix
- Mix With Scene Lighting Color
- NewValue
- Not Connected
- OkCommand
- Pick a Random Color
- Pick a color
- PickColorCommand
- PickRandomColorCommand
- Random Color
- RandomColor
- RemoveValueCommand
- SelectedFilterType
- SelectedValue
- TestCommand
- Tint All
- TintAll
- Title
- Values
- Window

#### dialogs/subactions/midi/midioutcontrolchangedialog（29 条）

- CancelCommand
- Channel
- Close
- Controller
- Device
- HasInDevices
- HasOutDevices
- InDevices
- Learn from Device
- LearnDeviceOpen
- LearnDeviceState
- MIDI Device is NOT connected
- MIDI Device is already in use
- MIDI Device is connected
- MIDI Device is not found
- Name
- No Devices Available to Learn From!
- No Output Devices Available!
- OkCommand
- Open
- OpenCloseDeviceCommand
- OutDevices
- SelectedInDevice
- SelectedOutDevice
- TestCommand
- Title
- True
- Value
- Window

#### dialogs/subactions/streamerbotdecks/streamerbotdeckitemseticondialog（29 条）

- Add a Deck!
- CancelCommand
- Collapsed
- Color
- Deck
- DeckItemStates
- DeckItems
- Decks
- False
- FileId
- HasDeckItems
- HasDecks
- IsAuthenticated
- Item
- Name
- No Items!
- Not Connected
- Not Connected!
- OkCommand
- SelectedDeck
- SelectedDeckItem
- SelectedStateItem
- State
- TestCommand
- Title
- True
- Url
- Visible
- Window

#### dialogs/subactions/streamerbotdecks/streamerbotdeckitemsetbackgrounddialog（28 条）

- Add a Deck!
- CancelCommand
- Collapsed
- Color
- Deck
- DeckItemStates
- DeckItems
- Decks
- False
- FileId
- HasDeckItems
- HasDecks
- IsAuthenticated
- Item
- No Items!
- Not Connected
- Not Connected!
- OkCommand
- SelectedDeck
- SelectedDeckItem
- SelectedStateItem
- State
- TestCommand
- Title
- True
- Url
- Visible
- Window

#### dialogs/subactions/obsstudio/obsstudiosetcolorsourcecolordialog（27 条）

- BackgroundColor
- CancelCommand
- Color
- Connection
- Connections
- ForegroundColor
- HexColor
- IsConnected
- Not Connected
- OkCommand
- Pick a Random Color
- Pick a color
- PickColorCommand
- PickRandomColorCommand
- Random
- Random Color
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- Source
- Sources
- TestCommand
- Title
- Window

#### dialogs/subactions/streamerbotdecks/streamerbotdeckitemsettitledialog（27 条）

- Add a Deck!
- CancelCommand
- Collapsed
- Color
- Deck
- DeckItemStates
- DeckItems
- Decks
- False
- HasDeckItems
- HasDecks
- IsAuthenticated
- Item
- ItemTitle
- No Items!
- Not Connected
- Not Connected!
- OkCommand
- SelectedDeck
- SelectedDeckItem
- SelectedStateItem
- State
- TestCommand
- Title
- True
- Visible
- Window

#### dialogs/subactions/obsstudio/obsstudiorawdialog（26 条）

- Add Results to Arguments
- CancelCommand
- Connection
- Connections
- Editor
- Format
- FormatCommand
- IsConnected
- Loaded
- Name
- Not Connected
- OkCommand
- Raw
- Request
- RequestNodes
- Response
- ResponseNodes
- ResultsToArgs
- SelectedConnection
- SelectedTab
- TestCommand
- Title
- Variable Prefix
- VariablePrefix
- Window
- WindowLoadedCommand

#### dialogs/subactions/streamerbotdecks/streamerbotdeckitemsetvaluedialog（26 条）

- Add a Deck!
- CancelCommand
- Collapsed
- Deck
- DeckItemStates
- DeckItems
- Decks
- False
- HasDeckItems
- HasDecks
- IsAuthenticated
- Item
- No Items!
- Not Connected
- Not Connected!
- OkCommand
- SelectedDeck
- SelectedDeckItem
- SelectedStateItem
- State
- TestCommand
- Title
- True
- Value
- Visible
- Window

#### dialogs/subactions/vtubestudio/vtubestudiosendrawrequestdialog（26 条）

- Add Results to Arguments
- CancelCommand
- Connection
- Connections
- Editor
- Format
- FormatCommand
- IsConnected
- Loaded
- Name
- Not Connected
- OkCommand
- Raw
- Request
- RequestName
- RequestNodes
- Response
- ResponseNodes
- SelectedConnection
- SelectedTab
- TestCommand
- Title
- Variable Prefix
- VariablePrefix
- Window
- WindowLoadedCommand

#### dialogs/subactions/kick/channelrewards/kickchannelrewardsetbackgroundcolordialog（25 条）

- BackgroundColor
- CancelCommand
- Color
- ForegroundColor
- HasRewards
- HexColor
- IsConnected
- Items[0].Group
- Kick is not Connected
- No Editable Rewards Found!
- OkCommand
- Pick a Random Color
- Pick a color
- PickColorCommand
- PickRandomColorCommand
- Random
- Random Color
- Revert to Original Color
- RevertCommand
- Reward
- Rewards
- SelectedReward
- TestCommand
- Title
- Window

#### dialogs/subactions/streamerbotdecks/streamerbotdeckitemsetstatedialog（25 条）

- Add a Deck!
- CancelCommand
- Collapsed
- Deck
- DeckItemStates
- DeckItems
- Decks
- False
- HasDeckItems
- HasDecks
- IsAuthenticated
- Item
- No Items!
- Not Connected
- Not Connected!
- OkCommand
- SelectedDeck
- SelectedDeckItem
- SelectedStateItem
- State
- TestCommand
- Title
- True
- Visible
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardsetbackgroundcolordialog（25 条）

- BackgroundColor
- CancelCommand
- Color
- ForegroundColor
- HasRewards
- HexColor
- IsConnected
- Items[0].Group
- No Editable Rewards Found!
- OkCommand
- Pick a Random Color
- Pick a color
- PickColorCommand
- PickRandomColorCommand
- Random
- Random Color
- Revert to Original Color
- RevertCommand
- Reward
- Rewards
- SelectedReward
- TestCommand
- Title
- Twitch is not Connected
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardupdatedialog（25 条）

- CancelCommand
- Cost
- CostOperators
- HasRewards
- IsConnected
- Items[0].Group
- No Editable Rewards Found!
- OkCommand
- Operator
- Prompt
- Revert to original values
- RevertCommand
- Reward
- RewardCost
- RewardPrompt
- RewardTitle
- Rewards
- SelectedIsOwned
- SelectedOperator
- SelectedReward
- TestCommand
- Title
- To not set a value for any of the options,, just leave the field empty
- Twitch is not Connected
- Window

#### dialogs/updatedialog（25 条）

- CanChangeReleaseChannel
- CanDownload
- CancelCommand
- CurrentVersion
- DownloadCommand
- InstallCommand
- IsDownloaded
- IsInstalling
- IsLoggedIn
- IsUpdateAvailable
- Login to your Streamer.bot Account to see beta/alpha channels.
- ProgressMax
- ProgressMin
- ProgressStatus
- ProgressValue
- ReleaseChannels
- SelectedReleaseChannel
- There is an update available!
- Title
- True
- Up to Date
- View Notes
- ViewNotesCommand
- Window
- {0} ({1})

#### dialogs/filefolderwatcherdialog（24 条）

- %changeType% - The type of change (Changed, Created, Deleted)
- %empty% - If the file is now empty
- %fileName% - The file name with extension
- %fullPath% - The full path to the file
- %line#% - The specifc line of the file, 0 based index, 0 is the first line
- %lineEscaped#% - The line escaped for use in a url query
- %lines% - The number of lines in the file
- Add Changed Data
- AddChangedData
- As JSON
- AsJson
- BrowseForFolderCommand
- CancelCommand
- Changed only Values
- Enabled
- Filter
- Folder
- FolderPath
- If AsJson is checked, the file will try to be loaded as a json object only a simple object will be loaded (for now), if it can not be parsed, the below will be available
- Include Subdirectories
- IncludeSubdirectories
- OkCommand
- Title
- Window

#### dialogs/subactions/core/performcommanddialog（24 条）

- Add
- AddArgumentCommand
- Arguments
- BrowseForTargetCommand
- BrowseForWorkingDirCommand
- CancelCommand
- Delete All
- DeleteAllCommand
- EnvVars
- Environment Variables
- Name
- OkCommand
- SelectedVariable
- Set wait time to 0 seconds to run without waiting
- Target
- Title
- Value
- Variable
- Wait maximum
- WaitForExit
- Window
- Working Directory
- WorkingDirectory
- seconds for exit

#### dialogs/subactions/kick/channelrewards/kickchannelrewardupdatedialog（24 条）

- CancelCommand
- Cost
- CostOperators
- Description
- HasRewards
- IsConnected
- Items[0].Group
- Kick is not Connected
- No Editable Rewards Found!
- OkCommand
- Operator
- Revert to original values
- RevertCommand
- Reward
- RewardCost
- RewardDescription
- RewardTitle
- Rewards
- SelectedOperator
- SelectedReward
- TestCommand
- Title
- To not set a value for any of the options,, just leave the field empty
- Window

#### dialogs/subactions/lumiastream/lumiastreamsetcolordialog（24 条）

- BackgroundColor
- Brightness
- CancelCommand
- Color
- Default
- DefaultValue
- Duration
- ForegroundColor
- HexColor
- IsConnected
- Lights
- LumiaStream is Not Connected!
- Not Connected
- OkCommand
- Pick a Random Color
- Pick a color
- PickColorCommand
- PickRandomColorCommand
- SkipQueue
- Skips Queue
- TestCommand
- Title
- Transition
- Window

#### dialogs/subactions/obsstudio/obsstudiosetsourcefilterstatedialog（24 条）

- CancelCommand
- Connection
- Connections
- Filter
- Filters
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedFilter
- SelectedScene
- SelectedSceneItem
- SelectedSource
- SelectedSourceItem
- SelectedState
- Source
- Sources
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetsourcefilterstatedialog（24 条）

- CancelCommand
- Connection
- Connections
- Filter
- Filters
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedFilter
- SelectedScene
- SelectedSceneItem
- SelectedSource
- SelectedSourceItem
- SelectedState
- Source
- Sources
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/kick/channelrewards/kickchannelrewardconfiguredialog（23 条）

- CancelCommand
- Disable not configured rewards
- Disabled
- Enabled
- HasRewards
- Move All To
- MoveAllToDisabledCommand
- MoveAllToEnabledCommand
- MoveAllToNotConfiguredCommand
- MoveAllToPausedCommand
- No Rewards Found
- Not Configured
- OkCommand
- Paused
- Rewards
- States
- States[0].Rewards.Count
- States[1].Rewards.Count
- States[2].Rewards.Count
- States[3].Rewards.Count
- TestCommand
- Title
- Window

#### dialogs/subactions/meldstudio/meldstudioseteffectenabledstatedialog（23 条）

- CancelCommand
- Connection
- Connections
- Effect
- Effects
- IsConnected
- Layer
- Layers
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedEffectText
- SelectedLayer
- SelectedLayerText
- SelectedScene
- SelectedSceneText
- SelectedState
- State
- TestCommand
- Title
- Window

#### dialogs/subactions/meldstudio/meldstudiosetlayertrackmutedstatedialog（23 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Layer
- Layers
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedLayer
- SelectedLayerText
- SelectedScene
- SelectedSceneText
- SelectedState
- SelectedTrackText
- State
- TestCommand
- Title
- Track
- Tracks
- Window

#### dialogs/subactions/obsstudio/obsstudiosetaudiotrackstatedialog（23 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- SelectedState
- SelectedTrack
- Source
- Sources
- State
- States
- TestCommand
- Title
- Track
- Tracks
- Window

#### dialogs/subactions/obsstudio/obsstudiotakescreenshotdialog（23 条）

- BrowseForFileCommand
- CancelCommand
- Connection
- Connections
- File Path
- FileName
- IsConnected
- Not Connected
- OkCommand
- Quality
- Quality:
- QualityValue
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- Source
- Sources
- TestCommand
- Title
- Window

#### dialogs/subactions/streamerbotremote/streamerbotremoteinstancesendsignaldialog（23 条）

- Add
- AddArgumentCommand
- Args
- Arguments
- CancelCommand
- Delete All
- DeleteAllArgumentsCommand
- Include Action's Arguments
- Instance
- IsAuthenticated
- Items
- Name
- Not Connected
- Not Connected!
- OkCommand
- SelectedArgument
- SelectedItem
- Signal Name
- SignalName
- Title
- UseArgs
- Value
- Window

#### dialogs/subactions/streamerbotremote/streamerbotremoteinstancesendtriggerdialog（23 条）

- Add
- AddArgumentCommand
- Args
- Arguments
- CancelCommand
- Delete All
- DeleteAllArgumentsCommand
- Event Name
- EventName
- Include Action's Arguments
- Instance
- IsAuthenticated
- Items
- Name
- Not Connected
- Not Connected!
- OkCommand
- SelectedArgument
- SelectedItem
- Title
- UseArgs
- Value
- Window

#### dialogs/subactions/streamlabsdesktop/streamlabsdesktopflipsourcedialog（23 条）

- CancelCommand
- Connection
- Connections
- Display
- Displays
- IsConnected
- Mode
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedDisplay
- SelectedScene
- SelectedSceneItem
- SelectedSource
- SelectedState
- Source
- Sources
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetsourcevisibilitydialog（23 条）

- CancelCommand
- Connection
- Connections
- Display
- Displays
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedDisplay
- SelectedScene
- SelectedSceneItem
- SelectedSource
- SelectedState
- Source
- Sources
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardconfiguredialog（23 条）

- CancelCommand
- Disable not configured rewards
- Disabled
- Enabled
- HasRewards
- Move All To
- MoveAllToDisabledCommand
- MoveAllToEnabledCommand
- MoveAllToNotConfiguredCommand
- MoveAllToPausedCommand
- No Rewards Found
- Not Configured
- OkCommand
- Paused
- Rewards
- States
- States[0].Rewards.Count
- States[1].Rewards.Count
- States[2].Rewards.Count
- States[3].Rewards.Count
- TestCommand
- Title
- Window

#### dialogs/twitch/twitchpredictiondialog（23 条）

- Add
- AddValueCommand
- CancelCommand
- Chatters will receive a temporary chat badge indicating the option they voted for until the prediction ends.
- CreateCommand
- Creators and mods can create predictions. Viewers who guess the outcome correctly can win Channel Points. All predictions must follow Twitch's
- Del
- How long viewers have to guess the outcome
- Name the prediction
- NewValue
- Outcomes (Minimum of 2, maximum of 10)
- PredictionTitle
- PredictionTitle.Length
- PredictionWindow
- RemoveValueCommand
- SelectedValue
- Start a Prediction
- Submission Preiod
- Terms of Service
- Title
- Values
- Window
- {0}/45

#### dialogs/midieventdialog（22 条）

- CancelCommand
- Channel
- Command
- Commands
- ConnectionStatus
- Data
- Enabled
- Ignore Channel
- Ignore Data
- Ignore NoteOff
- IgnoreChannel
- IgnoreData
- IgnoreNoteOff
- Name
- OkCommand
- Raw Message
- RawMessage
- RawValues
- SelectedCommand
- Title
- Value
- Window

#### dialogs/subactions/file/writetofiledialog（22 条）

- %counter% - Global usage counter for reward
- %randomUser0% - Random active user's display name
- %randomUser1% - Random active user's display name
- %randomUserName0% - Random active user's login name
- %randomUserName1% - Random active user's login name
- %rawInput% - UNSANITIZED input from redemption
- %timedoutUser0% - Timed out user's display name
- %timedoutUserName0% - Timed out user's login name
- %user% - Display name of User who used reward
- %userCounter% - Usage counter for user who used reward
- %userName% - Login of user who used reward
- Append
- Append to File
- BrowseForFileCommand
- CancelCommand
- File to Write To
- FilePath
- OkCommand
- Text to Write
- TextToWrite
- Title
- Window

#### dialogs/subactions/sounds/playsoundfromfolderdialog（22 条）

- Audio Output Device
- AudioDevices
- BrowseForFolderCommand
- CancelCommand
- Files
- Finish playing before continuing
- FinishBeforeContinuing
- Folder
- Folder containing *.mp3 and *.wav
- Name
- OkCommand
- Recursive
- SelectedDevice
- SelectedFile
- SoundName
- TestCommand
- Title
- Use Filename
- UseFileNameAsName
- Volume
- Window
- {0}%

#### dialogs/subactions/streamerbotdecks/streamerbotdeckitemtogglestatedialog（22 条）

- Add a Deck!
- CancelCommand
- Collapsed
- Deck
- DeckItems
- Decks
- False
- HasDeckItems
- HasDecks
- IsAuthenticated
- Item
- No Items!
- Not Connected
- Not Connected!
- OkCommand
- SelectedDeck
- SelectedDeckItem
- TestCommand
- Title
- True
- Visible
- Window

#### dialogs/subactions/streamlabsdesktop/streamlabsdesktoprotatesourcedialog（22 条）

- Additive
- CancelCommand
- Connection
- Connections
- Display
- Displays
- IsConnected
- Not Connected
- OkCommand
- Rotation
- Scene
- Scenes
- SelectedConnection
- SelectedDisplay
- SelectedScene
- SelectedSceneItem
- SelectedSource
- Source
- Sources
- TestCommand
- Title
- Window

#### dialogs/subactions/vtubestudio/vtubestudiosetexpressionstatedialog（22 条）

- CancelCommand
- Collapsed
- Expression
- Expressions
- Fade Time
- FadeTime
- False
- HasItems
- IsConnected
- No Expressions Found!
- Not Connected
- Not Connected!
- OkCommand
- SelectedExpression
- SelectedState
- State
- States
- TestCommand
- Title
- True
- Visible
- Window

#### dialogs/twitch/twitchpolldialog（22 条）

- Add
- AddValueCommand
- CancelCommand
- Caption
- Channel Points Per Vote
- ChannelPointsPerVote
- Create a New Poll
- CreateCommand
- Del
- Duration
- How long viewers have to vote in the poll
- NewValue
- PollTitle
- Question
- RemoveValueCommand
- Response (Minimum of 2, maximum of 5)
- SelectedValue
- Subtitle
- Title
- Values
- Window
- set to 0 to disable

#### dialogs/quotedialog（21 条）

- CancelCommand
- Categories
- Category
- CategoryText
- Clear User
- ClearUserCommand
- ID
- Id
- IsEditing
- OkCommand
- Platform
- Platforms
- Quote
- Search for User
- SearchForUserCommand
- SelectedPlatform
- Timestamp
- Title
- User
- UserLocked
- Window

#### dialogs/subactions/code/executemethoddialog（21 条）

- CancelCommand
- Execute C# Code
- HasSubActions
- Methods
- Name
- No Execute C# Code Sub-Actions were found!
- No Execute C# Sub-Aactions Found!
- OkCommand
- Only methods that return bool, and have no parameter are usable.
- Run on UI Thread
- RunOnUiThread
- Save Result to Variable
- SaveResultToVariable
- SelectedMethod
- SelectedSubAction
- SubActions
- This will only show Execute C# Code subactions that have a name.
- Title
- Variable Name
- VariableName
- Window

#### dialogs/subactions/core/fetchurldialog（21 条）

- Add
- AddArgumentCommand
- Auto-Type non-JSON Result
- AutoTypeNonJson
- CancelCommand
- Delete All
- DeleteAllCommand
- Header
- Headers
- Name
- OkCommand
- Parse Results as JSON
- ParseAsJson
- SelectedHeader
- Title
- URL
- Url
- Value
- Variable Name
- VariableName
- Window

#### dialogs/subactions/obsstudio/obsstudiosetrandomfilterstatedialog（21 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- SelectedState
- Source
- Sources
- State
- States
- TestCommand
- This will pick a random filter within the selected source and make it visible or hidden, or toggle its state.
- Title
- Window

#### dialogs/subactions/streamerbotdecks/streamerbotdecknotifydialog（21 条）

- Add a Deck!
- CancelCommand
- Collapsed
- Color
- Deck
- Decks
- Description
- False
- HasDecks
- IsAuthenticated
- Not Connected
- Not Connected!
- NotifyTitle
- OkCommand
- SelectedDeck
- SoundId
- TestCommand
- Title
- True
- Visible
- Window

#### dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetrandomfilterstatedialog（21 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- SelectedState
- Source
- Sources
- State
- States
- TestCommand
- This will pick a random filter within the selected source and make it visible or hidden, or toggle its state.
- Title
- Window

#### dialogs/actiondialog（20 条）

- AlwaysRun
- CancelCommand
- Concurrent
- Enabled
- Enter a unique Action name...
- ExcludeFromHistory
- Groups
- Name
- OkCommand
- Queues
- RandomAction
- SelectedGroupText
- SelectedQueue
- Title
- When enabled, if queued in a queue that is paused, this action will ignore that pause state and immediately run.
- When enabled, will prevent this action from showing in the Action Queue Pending/History tabs, this should be enabled for Actions that have high volume Triggers on them.
- When enabled, will run a random top-level sub-action.
- When enabled, will run all top-level sub-actions at the same time.
- Whether or not the Action is enabled
- Window

#### dialogs/subactions/elgato/wavelink/elgatowavelinkmuteinputdialog（20 条）

- CancelCommand
- Elgato WaveLink is Not Connected!
- Input
- IsConnected
- Items
- Mixer
- Mixers
- No Inputs Found!
- Not Connected
- OkCommand
- SelectedItem
- SelectedMixer
- SelectedState
- ShowNoItems
- ShowNotConnected
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/kick/kickaddrandomusersdialog（20 条）

- Add
- Add the specified number of random users to the arguments, this will provide a unique number of users filterd by their present status and that have been seen by Streamer.bot.
- AddGroupCommand
- AvailableGroups
- CancelCommand
- Count
- Del
- Exclude
- GroupText
- Groups
- If this is checked, only users in the listed groups will be used, otherwise they will be excluded
- IncludeFrom
- OkCommand
- Only Those Listed
- Present Only
- PresentOnly
- RemoveGroupCommand
- SelectedGroup
- Title
- Window

#### dialogs/subactions/meldstudio/meldstudiosetbrowserlayerurldialog（20 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Layer
- Layers
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedLayerText
- SelectedScene
- SelectedSceneText
- TestCommand
- Title
- URL
- Url
- Window
- You can use variables in the source, for example %targetUserProfileImageUrl% if you want the browser source set to the target user's profile image, if an Add Target info action is in the actions.

#### dialogs/subactions/meldstudio/meldstudiosetlayervisibilitystatedialog（20 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Layer
- Layers
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedLayer
- SelectedLayerText
- SelectedScene
- SelectedSceneText
- SelectedState
- State
- TestCommand
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudioflipsourcedialog（20 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Mode
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- SelectedState
- Source
- Sources
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudiorotatesourcedialog（20 条）

- Additive
- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Rotation
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- Source
- Sources
- TestCommand
- This will rotate your source around its alignment position.  By default OBS sets this to TopLeft, ideally you want this set to Center, this can be changed by editing your source's transform in OBS
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudiosetbrowsersourceurldialog（20 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- Source
- Sources
- TestCommand
- Title
- URL
- Url
- Window
- You can use variables in the source, for example %targetUserProfileImageUrl% if you want the browser source set to the target user's profile image, if an Add Target info action is in the actions.

#### dialogs/subactions/obsstudio/obsstudiosetimagesourcefiledialog（20 条）

- BrowseForFileCommand
- CancelCommand
- Connection
- Connections
- FileName
- Filename
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- Source
- Sources
- TestCommand
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudiosetmediasourcefiledialog（20 条）

- BrowseForFileCommand
- CancelCommand
- Connection
- Connections
- FileName
- Filename
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- Source
- Sources
- TestCommand
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudiosetmediastatedialog（20 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- SelectedState
- Source
- Sources
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudiosetscenefilterstatedialog（20 条）

- CancelCommand
- Connection
- Connections
- Filter
- Filters
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedFilter
- SelectedScene
- SelectedSceneItem
- SelectedState
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudiosetsourcemutestatedialog（20 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- SelectedState
- Source
- Sources
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudiosourcevisbilitydialog（20 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- SelectedState
- Source
- Sources
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/streamlabsdesktop/streamlabsdesktophidegroupsourcesdialog（20 条）

- CancelCommand
- Connection
- Connections
- Display
- Displays
- Group
- Groups
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedDisplay
- SelectedGroup
- SelectedScene
- SelectedSceneItem
- TestCommand
- Title
- Window

#### dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetbrowsersourceurldialog（20 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- Source
- Sources
- TestCommand
- Title
- URL
- Url
- Window
- You can use variables in the source, for example %targetUserProfileImageUrl% if you want the browser source set to the target user's profile image, if an Add Target info action is in the actions.

#### dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetrandomgroupsourcevisibledialog（20 条）

- CancelCommand
- Connection
- Connections
- Display
- Displays
- Group
- Groups
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedDisplay
- SelectedGroup
- SelectedScene
- SelectedSceneItem
- TestCommand
- Title
- Window

#### dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetscenefilterstatedialog（20 条）

- CancelCommand
- Connection
- Connections
- Filter
- Filters
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedFilter
- SelectedScene
- SelectedSceneItem
- SelectedState
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetsourcemutedialog（20 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- SelectedState
- Source
- Sources
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardsetcostdialog（20 条）

- CancelCommand
- Cost
- CostOperators
- HasRewards
- IsConnected
- Items[0].Group
- No Editable Rewards Found!
- OkCommand
- Operator
- RevertCommand
- Reward
- Rewards
- SelectedIsOwned
- SelectedOperator
- SelectedReward
- TestCommand
- Title
- Twitch is not Connected
- Value
- Window

#### dialogs/subactions/twitch/twitchaddrandomusersdialog（20 条）

- Add
- Add the specified number of random users to the arguments, this will provide a unique number of users filterd by their present status and that have been seen by Streamer.bot.
- AddGroupCommand
- AvailableGroups
- CancelCommand
- Count
- Del
- Exclude
- GroupText
- Groups
- If this is checked, only users in the listed groups will be used, otherwise they will be excluded
- IncludeFrom
- OkCommand
- Only Those Listed
- Present Only
- PresentOnly
- RemoveGroupCommand
- SelectedGroup
- Title
- Window

#### dialogs/subactions/vtubestudio/vtubestudiotriggerhotkeydialog（20 条）

- CancelCommand
- Collapsed
- False
- HasItems
- Hotkey
- Hotkeys
- IsConnected
- Model
- Models
- No Hotkeys Found!
- Not Connected
- OkCommand
- SelectedHotkey
- SelectedModel
- TestCommand
- Title
- True
- VTube Studio is Not Connected!
- Visible
- Window

#### dialogs/promptdialog（19 条）

- Closing
- DoNotAskAgain
- Don't Show Again
- False
- Image
- Input
- Message
- NoButtonText
- NoCommand
- OkButton
- SaveDoNotAskAgain
- ShowImage
- ShowInput
- ShowNoButton
- Title
- Window
- WindowClosingCommand
- YesButtonText
- YesCommand

#### dialogs/subactions/core/pickcolordialog（19 条）

- BackgroundColor
- CancelCommand
- Color
- ForegroundColor
- HexColor
- OBS Color
- OBS Studio use ABGR format for its colors
- ObsColor
- OkCommand
- Pick a Random Color
- Pick a color
- PickColorCommand
- PickRandomColorCommand
- Random
- Random Color
- Title
- Variable Name
- VariableName
- Window

#### dialogs/subactions/core/sendlocalsignaldialog（19 条）

- Add
- AddArgumentCommand
- Args
- Arguments
- CancelCommand
- Delete All
- DeleteAllArgumentsCommand
- Include Action's Arguments
- IncludeArgs
- Name
- OkCommand
- Queue Signal
- QueueSignal
- SelectedArgument
- Signal name
- SignalName
- Title
- Value
- Window

#### dialogs/subactions/elgato/wavelink/elgatowavelinksetfilterstatedialog（19 条）

- CancelCommand
- Elgato WaveLink is Not Connected!
- Filter
- Filters
- Input
- IsConnected
- Items
- No Inputs Found!
- Not Connected
- OkCommand
- SelectedFilter
- SelectedItem
- SelectedState
- ShowNoItems
- ShowNotConnected
- State
- States
- Title
- Window

#### dialogs/subactions/elgato/wavelink/elgatowavelinksetinputvolumedialog（19 条）

- Adjustment
- CancelCommand
- Elgato WaveLink is Not Connected!
- Input
- IsConnected
- Items
- Mixer
- Mixers
- No Inputs Found!
- Not Connected
- OkCommand
- SelectedItem
- SelectedMixer
- ShowNoItems
- ShowNotConnected
- TestCommand
- Title
- Volume
- Window

#### dialogs/subactions/kick/channelrewards/kickchannelrewardsetcostdialog（19 条）

- CancelCommand
- Cost
- CostOperators
- HasRewards
- IsConnected
- Items[0].Group
- Kick is not Connected
- No Editable Rewards Found!
- OkCommand
- Operator
- RevertCommand
- Reward
- Rewards
- SelectedOperator
- SelectedReward
- TestCommand
- Title
- Value
- Window

#### dialogs/subactions/meldstudio/meldstudiosetlayertextdialog（19 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Layer
- Layers
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedLayerText
- SelectedScene
- SelectedSceneText
- TestCommand
- Text
- Title
- Window
- You can use variable in the text, for example, %targetUser% to set the text to the target's name, if an Add Target Info action exists in the actions.

#### dialogs/subactions/meldstudio/meldstudiosetmedialayersourcedialog（19 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Layer
- Layers
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedLayerText
- SelectedScene
- SelectedSceneText
- TestCommand
- Title
- URL
- Url
- Window

#### dialogs/subactions/obsstudio/obsstudiosetgditextdialog（19 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- Source
- Sources
- TestCommand
- Text
- Title
- Window
- You can use variable in the text, for example, %targetUser% to set the text to the target's name, if an Add Target Info action exists in the actions.

#### dialogs/subactions/sounds/playsounddialog（19 条）

- Audio Output Device
- AudioDevices
- BrowseForFileCommand
- CancelCommand
- Finish playing before continuing
- FinishBeforeContinuing
- Name
- OkCommand
- SelectedDevice
- Sound file to play
- SoundFile
- SoundName
- TestCommand
- Title
- Use Filename
- UseFileNameAsName
- Volume
- Window
- {0}%

#### dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetgditextdialog（19 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- Source
- Sources
- TestCommand
- Text
- Title
- Window
- You can use variable in the text, for example, %targetUser% to set the text to the target's name, if an Add Target Info action exists in the actions.

#### dialogs/subactions/vtubestudio/vtubestudiomovemodeldialog（19 条）

- CancelCommand
- Capture Model Position
- CaptureCommand
- OkCommand
- Optional values that are left blank, will not be changed.
- PosX
- PosY
- Position X (double, optional)
- Position Y (double, optional)
- Relative to Model (boolean, required)
- RelativeToModel
- Rotation
- Rotation (double, optional)
- Size
- Size (double, optional)
- Time
- Time in Seconds (double, required)
- Title
- Window

#### dialogs/customwebsocketclientdialog（18 条）

- AutoConnect
- AutoReconnect
- CancelCommand
- Enable Compression
- EnableCompression
- Endpoint
- IsEditable
- Name
- OkCommand
- RetryInterval
- TLS 1.0
- TLS 1.1
- TLS 1.2
- Title
- UseTls10
- UseTls11
- UseTls12
- Window

#### dialogs/restoredialog（18 条）

- Backup Version:
- BackupCreated
- CancelCommand
- Created At:
- DownloadCommand
- Instance Name:
- InstanceName
- IsDownloaded
- IsRestoring
- ProgressMax
- ProgressMin
- ProgressStatus
- ProgressValue
- Restore
- RestoreCommand
- Title
- Window
- {0} ({1})

#### dialogs/subactions/logic/globalsetdialog（18 条）

- Auto Type
- AutoType
- CancelCommand
- Checking this will make your value be auto typed, and has no effect on increment or decrement source
- Destination
- Destinations
- OkCommand
- Persisted
- SelectedDestination
- SelectedSource
- SourceDescription
- Sources
- This SubAction will set the value of either an argument to the value, or a global variable from an argument, or to the value specified
- Title
- Value
- Variable Name
- VariableName
- Window

#### dialogs/subactions/obsstudio/obsstudiohidegroupsourcesdialog（18 条）

- CancelCommand
- Connection
- Connections
- Group
- Groups
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedGroup
- SelectedScene
- SelectedSceneItem
- TestCommand
- This will hide all sources within a group that are currently visible.
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudiohidesourcefiltersdialog（18 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- Source
- Sources
- TestCommand
- This will hide all filters for a given source that are currently visible.
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudiosetrandomgroupsourcevisibledialog（18 条）

- CancelCommand
- Connection
- Connections
- Group
- Groups
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedGroup
- SelectedScene
- SelectedSceneItem
- TestCommand
- This will pick a random source within the selected group and make it visible, if all items are visible, it will do nothing.
- Title
- Window

#### dialogs/subactions/streamerbotdecks/streamerbotdeckpagesetdialog（18 条）

- Add a Deck!
- CancelCommand
- Collapsed
- Deck
- Decks
- False
- HasDecks
- IsAuthenticated
- Not Connected
- Not Connected!
- OkCommand
- Page
- SelectedDeck
- TestCommand
- Title
- True
- Visible
- Window

#### dialogs/subactions/streamlabsdesktop/streamlabsdesktophidesourcefiltersdialog（18 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- Source
- Sources
- TestCommand
- This will hide all filters for a given source that are currently visible.
- Title
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardsetcooldowndialog（18 条）

- Additive
- CancelCommand
- Cooldown
- HasRewards
- IsConnected
- Items[0].Group
- No Editable Rewards Found!
- OkCommand
- RevertCommand
- Reward
- Rewards
- SelectedIsOwned
- SelectedReward
- TestCommand
- Title
- Twitch is not Connected
- Value
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardsetmaxperstreamdialog（18 条）

- Additive
- CancelCommand
- Cooldown
- HasRewards
- IsConnected
- Items[0].Group
- No Editable Rewards Found!
- OkCommand
- RevertCommand
- Reward
- Rewards
- SelectedIsOwned
- SelectedReward
- TestCommand
- Title
- Twitch is not Connected
- Value
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardsetmaxperuserperstreamdialog（18 条）

- Additive
- CancelCommand
- Cooldown
- HasRewards
- IsConnected
- Items[0].Group
- No Editable Rewards Found!
- OkCommand
- RevertCommand
- Reward
- Rewards
- SelectedIsOwned
- SelectedReward
- TestCommand
- Title
- Twitch is not Connected
- Value
- Window

#### dialogs/subactions/twitch/twitchcreatepolldialog（18 条）

- Add
- AddItemCommand
- CancelCommand
- Channel Points Per Vote, leave empty or set to 0 to disable
- Choices (Minimum of 2, maximum of 5)
- CostPerVote
- Del
- Duration
- Duration, defaults to 60 if empty or unable to parse
- Items
- NewItem
- OkCommand
- PollTitle
- Question
- RemoveItemCommand
- SelectedItem
- Title
- Window

#### dialogs/triggers/crowdcontrol/crowdcontroleffectcommontriggerdialog（18 条）

- CancelCommand
- Effect
- Effects
- Game
- Games
- MinMax
- OkCommand
- Pack
- Packs
- Price
- SelectedEffect
- SelectedGame
- SelectedPack
- SelectedType
- Title
- Type
- Types
- Window

#### dialogs/donordrivedialog（17 条）

- Auto Monitor
- AutoMonitor
- CanEditEndpoint
- CancelCommand
- Charities
- DonorDriveId
- Endpoint
- Id
- Name
- OkCommand
- Provider
- SelectedCharity
- SelectedType
- Title
- Type
- Types
- Window

#### dialogs/subactions/core/getinputdialog（17 条）

- A variable, success will also be added, and will be true if Ok was pressed
- Auto-Type
- AutoType
- CancelCommand
- Default Value
- DefaultText
- InputPrompt
- InputTitle
- OkCommand
- Output Variable
- Output Variable will be the name of the variable that your result goes into, default is inputResult
- OutputVariable
- Prompt
- TestCommand
- Title
- Title, Prompt and Original Text all support variables.
- Window

#### dialogs/subactions/discord/discordbasicwebhookdialog（17 条）

- Avatar URL
- AvatarUrl
- BrowseForFileCommand
- CancelCommand
- Content
- Image
- ImagePath
- Name
- OkCommand
- Text to Speech
- TextToSpeech
- Title
- Username
- Webhook URL
- WebhookName
- WebhookUrl
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubepoccamsetarlensdialog（17 条）

- AR Lens
- CancelCommand
- Elgato CameraHub is Not Connected!
- HasItems
- IsConnected
- Items
- No AR Lenses Found!
- Not Connected
- OkCommand
- Selected Camera is not EpocCam!
- SelectedItem
- ShowNoItems
- ShowNotConnected
- ShowNotEpocCam
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubepoccamsetbitratedialog（17 条）

- Bitrate
- CancelCommand
- Elgato CameraHub is Not Connected!
- HasItems
- IsConnected
- Items
- No AR Lenses Found!
- Not Connected
- OkCommand
- Selected Camera is not EpocCam!
- SelectedItem
- ShowNoItems
- ShowNotConnected
- ShowNotEpocCam
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubepoccamsetcameradialog（17 条）

- Camera
- CancelCommand
- Elgato CameraHub is Not Connected!
- HasItems
- IsConnected
- Items
- No AR Lenses Found!
- Not Connected
- OkCommand
- Selected Camera is not EpocCam!
- SelectedItem
- ShowNoItems
- ShowNotConnected
- ShowNotEpocCam
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/wavelink/elgatowavelinkmutemicrophonedialog（17 条）

- CancelCommand
- Elgato WaveLink is Not Connected!
- IsConnected
- Items
- Microphone
- No Inputs Found!
- Not Connected
- OkCommand
- SelectedItem
- SelectedState
- ShowNoItems
- ShowNotConnected
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/wavelink/elgatowavelinksetmicrophoneoutputvolumedialog（17 条）

- Adjustment
- Allowed values for volume are %variables%, or a decimal value between 0.0 and 1.0 inclusive.
- CancelCommand
- Elgato WaveLink is Not Connected!
- IsConnected
- Items
- Microphone
- No Inputs Found!
- Not Connected
- OkCommand
- SelectedItem
- ShowNoItems
- ShowNotConnected
- TestCommand
- Title
- Volume
- Window

#### dialogs/subactions/logic/globalgetdialog（17 条）

- CancelCommand
- Default Value
- DefaultValue
- Destination Variable
- DestinationVariable
- If "Destination Variable" is left empty, the value will be stored to global_variableName, or user_username_variablename
- OkCommand
- Persisted
- SelectedSource
- Source
- Sources
- This SubAction will let you get a global variable and add it to the arguments that are passed along to other SubActions
- Title
- Variable Name
- VariableName
- Window
- You can specify a default value to use if the variable is not found, if a default value is set, and the variable is not found, it will also set the variable to this value

#### dialogs/subactions/streamerbotdecks/streamerbotdeckpagecommondialog（17 条）

- Add a Deck!
- CancelCommand
- Collapsed
- Deck
- Decks
- False
- HasDecks
- IsAuthenticated
- Not Connected
- Not Connected!
- OkCommand
- SelectedDeck
- TestCommand
- Title
- True
- Visible
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardsetenabledstatedialog（17 条）

- CancelCommand
- HasRewards
- IsConnected
- Items[0].Group
- No Editable Rewards Found!
- OkCommand
- Reward
- Rewards
- SelectedIsOwned
- SelectedReward
- SelectedState
- State
- States
- TestCommand
- Title
- Twitch is not Connected
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardsetpausedstatedialog（17 条）

- CancelCommand
- HasRewards
- IsConnected
- Items[0].Group
- No Editable Rewards Found!
- OkCommand
- Reward
- Rewards
- SelectedIsOwned
- SelectedReward
- SelectedState
- State
- States
- TestCommand
- Title
- Twitch is not Connected
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardsetpromptdialog（17 条）

- CancelCommand
- HasRewards
- IsConnected
- Items[0].Group
- No Editable Rewards Found!
- OkCommand
- Prompt
- RevertCommand
- Reward
- RewardPrompt
- Rewards
- SelectedIsOwned
- SelectedReward
- TestCommand
- Title
- Twitch is not Connected
- Window

#### dialogs/subactions/youtube/youtubecreatepolldialog（17 条）

- Add
- AddItemCommand
- Broadcast
- CancelCommand
- Del
- Items
- NewItem
- OkCommand
- Options
- Options (Minimum of 2, maximum of 4)
- PollQuestion
- Question
- RemoveItemCommand
- SelectedItem
- SelectedOption
- Title
- Window

#### dialogs/subactions/youtube/youtubesettitleanddescriptiondialog（17 条）

- Broadcast
- BroadcastTitle
- BroadcastTitle.Length
- CancelCommand
- Description
- Description.Length
- IsAuthenticated
- Items
- Not Connected
- OkCommand
- SelectedItem
- Title
- Updating your YouTube stream information is an expensive call, please use this sparingly.
- Window
- You can either set a static title/description, and/or use variables to set a title/description.
- {0}/100
- {0}/5000

#### dialogs/obsdialog（16 条）

- AutoConnect
- CancelCommand
- Host
- IsEditable
- Name
- OkCommand
- Password
- Port
- Reconnect
- RetryInterval
- SelectedVersion
- Title
- Version
- Window
- v4.9.x
- v5.x

#### dialogs/subactions/elgato/wavelink/elgatowavelinkgetfilterstatedialog（16 条）

- CancelCommand
- Elgato WaveLink is Not Connected!
- Filter
- Filters
- Input
- Inputs
- IsConnected
- No Inputs Found!
- Not Connected
- OkCommand
- SelectedFilter
- SelectedInput
- ShowNoItems
- ShowNotConnected
- Title
- Window

#### dialogs/subactions/elgato/wavelink/elgatowavelinksetmicrophonebalancedialog（16 条）

- Allowed values for balance are %variables%, or a number value between 0 and 100 inclusive.
- Balance
- CancelCommand
- Elgato WaveLink is Not Connected!
- IsConnected
- Items
- Microphone
- No Inputs Found!
- Not Connected
- OkCommand
- SelectedItem
- ShowNoItems
- ShowNotConnected
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/wavelink/elgatowavelinksetmicrophonegaindialog（16 条）

- Allowed values for gain are %variables%, or a decimal value between 0.0 and 1.0 inclusive.
- CancelCommand
- Elgato WaveLink is Not Connected!
- Gain
- IsConnected
- Items
- Microphone
- No Inputs Found!
- Not Connected
- OkCommand
- SelectedItem
- ShowNoItems
- ShowNotConnected
- TestCommand
- Title
- Window

#### dialogs/subactions/file/readrandomlinefromfiledialog（16 条）

- Attempt Auto-Typing
- AutoType
- BrowseForFileCommand
- CancelCommand
- Count
- File to Read From
- FilePath
- OkCommand
- Overwrite Existing Variable(s)
- OverwriteExisting
- Parse Variables
- ParseVariables
- Title
- Variable Name to Use (if empty, line is used)
- VariableName
- Window

#### dialogs/subactions/kick/channelrewards/kickchannelrewardsetdescriptiondialog（16 条）

- CancelCommand
- Description
- HasRewards
- IsConnected
- Items[0].Group
- Kick is not Connected
- No Editable Rewards Found!
- OkCommand
- RevertCommand
- Reward
- RewardDescription
- Rewards
- SelectedReward
- TestCommand
- Title
- Window

#### dialogs/subactions/kick/channelrewards/kickchannelrewardsetenabledstatedialog（16 条）

- CancelCommand
- HasRewards
- IsConnected
- Items[0].Group
- Kick is not Connected
- No Editable Rewards Found!
- OkCommand
- Reward
- Rewards
- SelectedReward
- SelectedState
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/kick/channelrewards/kickchannelrewardsetpausedstatedialog（16 条）

- CancelCommand
- HasRewards
- IsConnected
- Items[0].Group
- Kick is not Connected
- No Editable Rewards Found!
- OkCommand
- Reward
- Rewards
- SelectedReward
- SelectedState
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudiogetsceneitempropertiesdialog（16 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- SelectedSceneItem
- SelectedSource
- Source
- Sources
- Title
- Window

#### dialogs/subactions/streamerbotremote/streamerbotremoteinstancewaitforsignaldialog（16 条）

- CancelCommand
- If timeout is left blank, it defaults to 30 seconds (or 30,000ms)
- Instance
- IsAuthenticated
- Items
- Not Connected
- Not Connected!
- OkCommand
- Overwrite
- Overwrite Variables
- SelectedItem
- Signal Name
- SignalName
- Timeout
- Title
- Window

#### dialogs/subactions/streamfog/streamfogplayvideobackgrounddialog（16 条）

- CancelCommand
- HasItems
- IsConnected
- Name
- No Video Backgrounds Found!
- Not Connected
- Not Connected!
- OkCommand
- SelectedItem
- ShowNoItems
- ShowNotConnected
- TestCommand
- Title
- Video
- Videos
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardsettitledialog（16 条）

- CancelCommand
- HasRewards
- IsConnected
- Items[0].Group
- No Editable Rewards Found!
- OkCommand
- RevertCommand
- Reward
- RewardTitle
- Rewards
- SelectedIsOwned
- SelectedReward
- TestCommand
- Title
- Twitch is not Connected
- Window

#### dialogs/subactions/twitch/twitchsendmessagedialog（16 条）

- Auto pin message after it is sent and will be pinned for 20 minutes
- CancelCommand
- Fallback
- Fallback to Broadcaster
- Message
- Message.Length
- OkCommand
- Pin
- PinToStreamEnd
- Send using bot account
- The pinned message will be updated to last until stream ends
- Title
- Until stream ends
- UseBot
- Window
- {0}/500

#### dialogs/subactions/twitch/twitchupdatechannelgueststarsettingsdialog（16 条）

- Any values that are left blank, will not be changed
- Browser Source Audio Enabled (boolean)
- BrowserSourceAudioEnabled
- CancelCommand
- Group Layout
- GroupLayout
- GroupLayouts
- Moderator Send Live Enabled (boolean)
- ModeratorSendLiveEnabled
- OkCommand
- Regenerate Browser Sources (boolean)
- RegenerateBrowserSources
- Slot Count (number)
- SlotCount
- Title
- Window

#### dialogs/subactions/youtube/youtubesendmessagedialog（16 条）

- Broadcast
- CancelCommand
- Fallback
- Fallback to Broadcaster
- IsAuthenticated
- Items
- Message
- Message.Length
- Not Connected
- OkCommand
- SelectedItem
- Send using bot account
- Title
- UseBot
- Window
- {0}/200

#### dialogs/voicecontrolcommanddialog（16 条）

- CancelCommand
- Command
- Confidence Threshold
- ConfidenceThreshold
- Enabled
- Location
- Locations
- Name
- OkCommand
- Override Global
- OverrideGlobal
- SelectedLocation
- Stop After
- StopAfter
- Title
- Window

#### dialogs/filetaildialog（15 条）

- %fileName%
- %filePath%
- %line%
- - The file line as the file changes
- - The file name with extension
- - The full path to the file
- BrowseForFileCommand
- CancelCommand
- Enabled
- File
- FilePath
- Name
- OkCommand
- Title
- Window

#### dialogs/subactions/commands/getcommandsdialog（15 条）

- CancelCommand
- Group
- Has Permission
- HasPermission
- Ignore Aliases
- IgnoreAliases
- Include All
- IncludeAll
- Items
- OkCommand
- SelectedItem
- Title
- Variable Name
- VariableName
- Window

#### dialogs/subactions/core/commentdialog（15 条）

- BackgroundColor
- CancelCommand
- ClearColorCommand
- Color
- Comment
- ForegroundColor
- HexColor
- Leave color empty to use Application default color for comments
- OkCommand
- Pick a Random Color
- Pick a color
- PickColorCommand
- PickRandomColorCommand
- Title
- Window

#### dialogs/subactions/core/getrandomnumberdialog（15 条）

- Add a random number into arguments, use for percentages, or anything else.
- Between
- BetweenEnabled
- CancelCommand
- False
- HasItems
- Max
- Min
- OkCommand
- RandomType
- RandomTypes
- Title
- Type
- When random type is between, a number between the 2 values you set will be added into the arguments at %randomNumber%
- Window

#### dialogs/subactions/core/keyboardpressdialog（15 条）

- Alt
- CancelCommand
- Ctrl
- Items
- Key
- ModifierAlt
- ModifierCtrl
- ModifierShift
- Modifiers
- OkCommand
- SelectedItem
- Shift
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetcrosshairimagedialog（15 条）

- CancelCommand
- Crosshair
- Elgato CameraHub is Not Connected!
- HasItems
- IsConnected
- Items
- No Crosshair Images Found!
- Not Connected
- OkCommand
- SelectedItem
- ShowNoItems
- ShowNotConnected
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetfontdialog（15 条）

- CancelCommand
- Elgato CameraHub is Not Connected!
- Font
- HasItems
- IsConnected
- Items
- No Fonts Found!
- Not Connected
- OkCommand
- SelectedItem
- ShowNoItems
- ShowNotConnected
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetscriptdialog（15 条）

- CancelCommand
- Elgato CameraHub is Not Connected!
- HasItems
- IsConnected
- Items
- No Scripts Found!
- Not Connected
- OkCommand
- Script
- SelectedItem
- ShowNoItems
- ShowNotConnected
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetnoisereductiondialog（15 条）

- Camera does not support Noise Reduction!
- CancelCommand
- Elgato CameraHub is Not Connected!
- HasItems
- IsConnected
- Items
- Mode
- Not Connected
- OkCommand
- SelectedItem
- ShowNoItems
- ShowNotConnected
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/wavelink/elgatowavelinksetoutputvolumedialog（15 条）

- Adjustment
- Cancel
- CancelCommand
- IsConnected
- Items
- Not Connected
- Ok
- OkCommand
- Output
- SelectedItem
- Test
- TestCommand
- Title
- Volume
- Window

#### dialogs/subactions/file/readspecificlinefromfiledialog（15 条）

- Attempt Auto-Typing
- AutoType
- BrowseForFileCommand
- CancelCommand
- File to Read From
- FilePath
- Line Number
- LineNumber
- OkCommand
- Parse Variables
- ParseVariables
- Title
- Variable Name to Use (if empty, line is used)
- VariableName
- Window

#### dialogs/subactions/kick/channelrewards/kickchannelrewardsettitledialog（15 条）

- CancelCommand
- HasRewards
- IsConnected
- Items[0].Group
- Kick is not Connected
- No Editable Rewards Found!
- OkCommand
- RevertCommand
- Reward
- RewardTitle
- Rewards
- SelectedReward
- TestCommand
- Title
- Window

#### dialogs/subactions/kick/kicksetchannelcategorydialog（15 条）

- CancelCommand
- Category Name
- CategoryName
- CategoryText
- Click the button above to select a category.
- Collapsed
- OkCommand
- SearchForCategoryCommand
- SelectedSource
- Source
- Sources
- Specific Category
- Title
- Window
- You can use the above entry for variables, or set a specific category, change the Source to pick from Kick's category list

#### dialogs/subactions/logic/logicifdialog（15 条）

- Add your SubActions to either of these groups to perform actions based on the result of this expression.
- Auto Type
- AutoType
- CancelCommand
- Input
- Input now supports variable parsing, be sure to surround it with % if you want the value of the variable. i.e. %user%, %userCounter%, %rawInput%, etc...
- OkCommand
- Operation
- Operations
- SelectedOperator
- Title
- Value
- ValueIsEnabled
- When adding an If/Else SubAction, two groups, called True Result and False Result, will automatically be added underneath the SubAction.
- Window

#### dialogs/subactions/lumiastream/lumiastreamsendcommanddialog（15 条）

- CancelCommand
- Command
- Commands
- HasCommands
- IsConnected
- LumiaStream is Not Connected!
- No Commands Found!
- Not Connected
- OkCommand
- SelectedCommand
- ShowNoCommands
- ShowNotConnected
- TestCommand
- Title
- Window

#### dialogs/subactions/meldstudio/meldstudiosettrackmutedstatedialog（15 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- SelectedConnection
- SelectedState
- SelectedTrackText
- State
- TestCommand
- Title
- Track
- Tracks
- Window

#### dialogs/subactions/speakerbot/speakerbotactivatevoicegateprofiledialog（15 条）

- CancelCommand
- HasProfiles
- IsConnected
- Items
- No Profiles Found!
- Not Connected
- OkCommand
- Profile
- SelectedItem
- ShowNoProfiles
- ShowNotConnected
- Speaker.bot is Not Connected!
- TestCommand
- Title
- Window

#### dialogs/subactions/streamfog/streamfogactivatelensdialog（15 条）

- CancelCommand
- Categories
- Category
- Duration
- IsConnected
- Lens
- Lenses
- Not Connected
- OkCommand
- SelectedCategory
- SelectedLens
- Streamfog is Not Connected!
- TestCommand
- Title
- Window

#### dialogs/subactions/twitch/twitchcreatepredictiondialog（15 条）

- Add
- AddItemCommand
- CancelCommand
- Del
- Duration
- Items
- NewItem
- OkCommand
- Outcomes (Minimum of 2, maximum of 10)
- Prediction Window (seconds) default is 60s
- PredictionTitle
- RemoveItemCommand
- SelectedItem
- Title
- Window

#### dialogs/subactions/twitch/twitchsetchanneltagsdialog（15 条）

- A channel may specify a maximum of 10 tags. Each tag is limited to a maximum of 25 characters and may not be an empty string or contain spaces or special characters.
- Add
- AddItemCommand
- CancelCommand
- Del
- For readability, consider using camelCasing or PascalCasing.
- Items
- NewItem
- OkCommand
- RemoveItemCommand
- SelectedItem
- Tags (Maximum of 10)
- Tags are case insensitive.
- Title
- Window

#### dialogs/subactions/twitch/twitchupdategueststarslotsettingsdialog（15 条）

- Any values that are left blank, will not be changed
- Audio Enabled (boolean)
- AudioEnabled
- CancelCommand
- Live
- Live (boolean)
- OkCommand
- Slot
- Slot (number, required)
- Title
- Video Enabled (boolean)
- VideoEnabled
- Volume
- Volume (number)
- Window

#### dialogs/timerdialog（15 条）

- By default, timed actions will repeat, you can have them only trigger once, by unticking repeat, and it will trigger after being enabled
- CancelCommand
- Enabled
- If both options are set, then both criteria must be met for the action to occur. The action will only run if Y number have lines have been said, and if X seconds have passed.
- Interval
- Lines
- Name
- OkCommand
- RandomInterval
- Repeat
- The time interval can also be set to a random value within a range, this random value is updated everytime the action is run.
- Timed actions can have either an interval set, where they will occur every X seconds, or a line count set, where they will occur every Y lines.
- Title
- UpperInterval
- Window

#### dialogs/subactions/commands/setcommandstatedialog（14 条）

- Add a Command!
- CancelCommand
- Command
- HasCommands
- Items
- Items[0].Group
- No Commands Found!
- OkCommand
- SelectedItem
- SelectedState
- State
- States
- Title
- Window

#### dialogs/subactions/elgato/streamdeckmcp/elgatostreamdeckmcpexecuteactiondialog（14 条）

- Action
- Actions
- CancelCommand
- Elgato StreamDeck MCP is Not Connected!
- IsConnected
- No Actions Found!
- Not Connected
- OkCommand
- SelectedAction
- ShowNoItems
- ShowNotConnected
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/wavelink/elgatowavelinkgetmicrophoneinformationdialog（14 条）

- CancelCommand
- Elgato WaveLink is Not Connected!
- HasItems
- IsConnected
- Items
- Microphone
- No Inputs Found!
- Not Connected
- OkCommand
- SelectedItem
- ShowNoItems
- ShowNotConnected
- Title
- Window

#### dialogs/subactions/ifttt/iftttnotificationadvanceddialog（14 条）

- Add
- AddArgumentCommand
- Args
- Arguments
- CancelCommand
- Delete All
- DeleteAllArgumentsCommand
- Event Name
- EventName
- Name
- OkCommand
- Title
- Value
- Window

#### dialogs/subactions/kick/kickreplytomessagedialog（14 条）

- CancelCommand
- Fallback
- Fallback to Broadcaster
- Message
- Message.Length
- OkCommand
- Reply Id
- ReplyId
- Send using bot account
- Title
- Use the variable that contains the Id, for example %msgId%
- UseBot
- Window
- {0}/500

#### dialogs/subactions/logic/logicswitchcasegroupdialog（14 条）

- Add
- AddValueCommand
- CancelCommand
- Case Sensitive
- Case Values
- CaseSensitive
- Del
- NewValue
- OkCommand
- RemoveValueCommand
- SelectedValue
- Title
- Values
- Window

#### dialogs/subactions/logic/logicwhiledialog（14 条）

- Auto Type
- AutoType
- CancelCommand
- Ignore Case
- IgnoreCase
- Input
- OkCommand
- Operation
- Operations
- SelectedOperator
- Title
- Value
- ValueIsEnabled
- Window

#### dialogs/subactions/obsstudio/obsstudiohidescenesourcesdialog（14 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- TestCommand
- This will hide all sources within a scene that are currently visible.
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudiosetactivescenedialog（14 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- TestCommand
- This will make the scene your active scene in OBS Studio
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudiosetrandomscenesourcevisibledialog（14 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- TestCommand
- This will pick a random source within the selected scene and make it visible, if all items are visible, it will do nothing.
- Title
- Window

#### dialogs/subactions/polypop/polypoptriggeralertdialog（14 条）

- Add
- AddArgumentCommand
- AlertName
- Args
- CancelCommand
- Delete All
- DeleteAllArgumentsCommand
- Name
- OkCommand
- Signal name
- Title
- Value
- Variables
- Window

#### dialogs/subactions/speakerbot/speakerbotspeakdialog（14 条）

- BadWordFilter
- CancelCommand
- Delay
- IsConnected
- Message
- OkCommand
- Pass through Bad Word Filter
- Silent
- Speaker.bot Not Connected
- TestCommand
- Title
- Voice Alias
- VoiceAlias
- Window

#### dialogs/subactions/streamfog/streamfogactivateoutfitdialog（14 条）

- CancelCommand
- IsConnected
- No Outfits Found!
- Not Connected
- Not Connected!
- OkCommand
- Outfit
- Outfits
- SelectedOutfit
- ShowNoItems
- ShowNotConnected
- TestCommand
- Title
- Window

#### dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetactivescenedialog（14 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- Scenes
- SelectedConnection
- SelectedScene
- TestCommand
- This will make the scene your active scene in Streamlabs Desktop
- Title
- Window

#### dialogs/subactions/twitch/twitchreplytomessagedialog（14 条）

- CancelCommand
- Fallback
- Fallback to Broadcaster
- Message
- Message.Length
- OkCommand
- Reply Id
- ReplyId
- Send using bot account
- Title
- Use the variable that contains the Id, for example %msgId%
- UseBot
- Window
- {0}/500

#### dialogs/subactions/twitch/twitchsetchannelgamedialog（14 条）

- CancelCommand
- CategoryText
- Click the button above to select a game, leave it empty to have your game category empty.
- Collapsed
- Game
- OkCommand
- SearchForCategoryCommand
- SelectedSource
- Source
- Sources
- Specific Game
- Title
- Window
- You can use the above entry for variables, or set a specific game, change the Source to pick from Twitch's list

#### dialogs/subactions/voicecontrol/voicecontrolsetcommandstatedialog（14 条）

- Add a Voice Control Command!
- CancelCommand
- HasCommands
- Items
- Items[0].Group
- No Voice Control Commands Found!
- OkCommand
- SelectedItem
- SelectedState
- State
- States
- Title
- Voice Command
- Window

#### dialogs/subactions/voicemod/voicemodplaysounddialog（14 条）

- CancelCommand
- IsConnected
- Not Connected
- OkCommand
- SelectedSound
- SelectedSoundboard
- Sound
- Soundboard
- SoundboardsItems
- Sounds
- TestCommand
- Title
- VoiceMod is Not Connected!
- Window

#### dialogs/subactions/youtube/youtubesetdescriptiondialog（14 条）

- Broadcast
- CancelCommand
- Description
- Description.Length
- IsAuthenticated
- Items
- Not Connected
- OkCommand
- SelectedItem
- Title
- Updating your YouTube stream information is an expensive call, please use this sparingly.
- Window
- You can either set a static description, and/or use variables to set a description.
- {0}/5000

#### dialogs/subactions/youtube/youtubesettitledialog（14 条）

- Broadcast
- BroadcastTitle
- BroadcastTitle.Length
- CancelCommand
- IsAuthenticated
- Items
- Not Connected
- OkCommand
- SelectedItem
- Title
- Updating your YouTube stream information is an expensive call, please use this sparingly.
- Window
- You can either set a static title, and/or use variables to set a title.
- {0}/100

#### dialogs/triggers/core/testtriggerdialog（14 条）

- Add
- AddArgumentCommand
- Args
- Arguments
- CancelCommand
- Delete All
- DeleteAllArgumentsCommand
- Name
- OkCommand
- Right click to add an argument
- SelectedArgument
- Title
- Value
- Window

#### dialogs/triggers/core/userglobalvariableupdatedtriggerdialog（14 条）

- CancelCommand
- Either
- Leaving name or login empty is considered a catch-all and will trigger on any user global variable updating
- NonPersisted
- OkCommand
- Persisted
- Platform
- Platforms
- Title
- User Login
- UserLogin
- Variable Name
- VariableName
- Window

#### dialogs/customwebsocketserverdialog（13 条）

- Address
- Auto Start on Startup
- AutoStart
- CancelCommand
- Endpoint
- Ignore Extensions
- IgnoreExtensions
- IsEditable
- Name
- OkCommand
- Port
- Title
- Window

#### dialogs/mtion/mtionselecttriggerdialog（13 条）

- BodyStrong
- CancelCommand
- Clear
- Clubhouse
- ClubhouseName
- Filter
- Filter...
- IsRunning
- Select mtion Trigger
- SelectCommand
- SelectedTrigger
- Triggers
- Window

#### dialogs/subactions/actions/setsubactionstatedialog（13 条）

- Action
- ActionText
- CancelCommand
- OkCommand
- SelectActionCommand
- SelectedState
- SelectedSubAction
- State
- States
- Sub-Actions
- SubActions
- Title
- Window

#### dialogs/subactions/commands/setcommandgroupstatedialog（13 条）

- Add a Command in a Group!
- CancelCommand
- Group
- HasGroups
- Items
- No Command Groups Found!
- OkCommand
- SelectedItem
- SelectedState
- State
- States
- Title
- Window

#### dialogs/subactions/core/basegroupdialog（13 条）

- BackgroundColor
- CancelCommand
- Color
- ForegroundColor
- HexColor
- Name
- OkCommand
- Pick a Random Color
- Pick a color
- PickColorCommand
- PickRandomColorCommand
- Title
- Window

#### dialogs/subactions/core/settimerstatedialog（13 条）

- Add a Timer!
- CancelCommand
- HasTimers
- Items
- No Timers Found!
- OkCommand
- SelectedItem
- SelectedState
- State
- States
- Timer
- Title
- Window

#### dialogs/subactions/elgato/wavelink/elgatowavelinkgetinputinformationdialog（13 条）

- CancelCommand
- Elgato WaveLink is Not Connected!
- Input
- Inputs
- IsConnected
- No Inputs Found!
- Not Connected
- OkCommand
- SelectedInput
- ShowNoItems
- ShowNotConnected
- Title
- Window

#### dialogs/subactions/elgato/wavelink/elgatowavelinkmuteoutputdialog（13 条）

- CancelCommand
- IsConnected
- Items
- Not Connected
- OkCommand
- Output
- SelectedItem
- SelectedState
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/wavelink/elgatowavelinksetoutputmonitordevicedialog（13 条）

- CancelCommand
- Device
- Elgato WaveLink is Not Connected!
- IsConnected
- Items
- No Inputs Found!
- Not Connected
- OkCommand
- SelectedItem
- ShowNoItems
- ShowNotConnected
- Title
- Window

#### dialogs/subactions/file/readlinesfromfiledialog（13 条）

- Attempt Auto-Typing
- AutoType
- BrowseForFileCommand
- CancelCommand
- File to Read From
- FilePath
- OkCommand
- Parse Variables
- ParseVariables
- Title
- Variable Name to Use (if empty, line is used)
- VariableName
- Window

#### dialogs/subactions/kick/channelrewards/kickchannelrewardsetgroupenabledstatedialog（13 条）

- Add a Kick Reward!
- CancelCommand
- Group
- HasGroups
- Items
- No Kick Reward Groups Found!
- OkCommand
- SelectedItem
- SelectedState
- State
- States
- Title
- Window

#### dialogs/subactions/kick/channelrewards/kickchannelrewardsetgrouppausedstatedialog（13 条）

- Add a Kick Reward!
- CancelCommand
- Group
- HasGroups
- Items
- No Kick Reward Groups Found!
- OkCommand
- SelectedItem
- SelectedState
- State
- States
- Title
- Window

#### dialogs/subactions/meldstudio/meldstudiorecordclipdialog（13 条）

- Cancel
- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- Ok
- OkCommand
- SelectedConnection
- Test
- TestCommand
- Title
- Window

#### dialogs/subactions/meldstudio/meldstudioshowscenedialog（13 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- Scene
- SceneName
- Scenes
- SelectedConnection
- TestCommand
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudiocommonstatedialog（13 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- SelectedConnection
- SelectedState
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudiocreaterecordchapterdialog（13 条）

- CancelCommand
- Chapter Name
- Chapter name supports %variables%.
- ChapterName
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- SelectedConnection
- This sub-action requires the `Hybrid MP4 [BETA](.mp4)` recording format to be selected within OBS.
- Title
- Window

#### dialogs/subactions/streamlabsdesktop/streamlabsdesktopcommonstatedialog（13 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- SelectedConnection
- SelectedState
- State
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/throwingsystem/throwingsystemthrowitemdialog（13 条）

- Amount
- CancelCommand
- Delay
- IsConnected
- Item
- Items
- Not Connected
- Not Connected!
- OkCommand
- SelectedItem
- TestCommand
- Title
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardsetgroupenabledstatedialog（13 条）

- Add a Twitch Reward!
- CancelCommand
- Group
- HasGroups
- Items
- No Twitch Reward Groups Found!
- OkCommand
- SelectedItem
- SelectedState
- State
- States
- Title
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardsetgrouppausedstatedialog（13 条）

- Add a Twitch Reward!
- CancelCommand
- Group
- HasGroups
- Items
- No Twitch Reward Groups Found!
- OkCommand
- SelectedItem
- SelectedState
- State
- States
- Title
- Window

#### dialogs/subactions/twitch/twitchsendannouncementdialog（13 条）

- CancelCommand
- Color
- Colors
- Fallback
- Fallback to Broadcaster
- Message
- Message.Length
- OkCommand
- Send using bot account
- Title
- UseBot
- Window
- {0}/500

#### dialogs/subactions/youtube/youtubetimeoutuserdialog（13 条）

- Broadcast
- CancelCommand
- Duration
- IsAuthenticated
- Items
- Not Connected
- OkCommand
- SelectedItem
- The user id can contain either a specific user's id, or a %variable% that will be parsed
- Title
- User Id
- UserId
- Window

#### dialogs/triggers/obsstudio/obsstudiovendoreventtriggerdialog（13 条）

- Add Connection
- CancelCommand
- Connection
- Connections
- CreateCommand
- Event Name
- EventName
- OkCommand
- SelectedConnection
- Title
- Vendor Name
- VendorName
- Window

#### dialogs/twitch/twitchusersearchdialog（13 条）

- CancelCommand
- ClearCommand
- ID
- Id
- IsSearching
- Login
- Name
- SearchResults
- SearchTerm
- SelectCommand
- SelectedUser
- Username
- Window

#### dialogs/addeditkeyvaluepairdialog（12 条）

- AutoType
- CanAutoType
- CancelCommand
- KeyLabel
- KeyReadonly
- KeyValue
- Name
- OkCommand
- ShowAutoType
- Title
- Value
- Window

#### dialogs/meldstudiodialog（12 条）

- Auto Connect on Startup
- AutoConnect
- CancelCommand
- Host
- IsEditable
- Name
- OkCommand
- Reconnect
- Reconnect on Disconnect
- RetryInterval
- Title
- Window

#### dialogs/midiindialog（12 条）

- Auto Open on Startup
- AutoOpen
- CancelCommand
- Device Name
- Devices
- Name
- OkCommand
- Re-Open on Close
- ReOpen
- SelectedDevice
- Title
- Window

#### dialogs/streamlabsdesktopdialog（12 条）

- AutoConnect
- CancelCommand
- Host
- IsEditable
- Name
- OkCommand
- Port
- Reconnect
- RetryInterval
- Title
- Token
- Window

#### dialogs/subactions/actions/setactiongroupstatedialog（12 条）

- Add an Action in a Group!
- CancelCommand
- Group
- HasGroups
- Items
- OkCommand
- SelectedItem
- SelectedState
- State
- States
- Title
- Window

#### dialogs/subactions/actions/setactionqueuepausestatedialog（12 条）

- CancelCommand
- Clear
- Clear Queue
- Items
- OkCommand
- Queue
- SelectedItem
- SelectedState
- State
- States
- Title
- Window

#### dialogs/subactions/actions/setsubactionweightdialog（12 条）

- Action
- ActionText
- CancelCommand
- OkCommand
- SelectActionCommand
- SelectedSubAction
- Sub-Actions
- SubActions
- Title
- Weight
- Weight can be a fixed value, or a parsed value, using variables and/or inline functions, and the resulting value needs to be a double or number
- Window

#### dialogs/subactions/core/toastnotificationdialog（12 条）

- Attribution
- CancelCommand
- Icon Path
- IconPath
- OkCommand
- TestCommand
- Text
- Title
- Toast Id
- ToastId
- ToastTitle
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetantiflickerdialog（12 条）

- Anti-flicker
- CancelCommand
- IsConnected
- Items
- Not Connected
- OkCommand
- SelectedItem
- ShowStatusText
- StatusText
- TestCommand
- Title
- Window

#### dialogs/subactions/filetail/setfiletailstatedialog（12 条）

- CancelCommand
- File Tail
- HasItems
- Items
- No File Tails Found
- OkCommand
- SelectedItem
- SelectedState
- State
- States
- Title
- Window

#### dialogs/subactions/meldstudio/meldstudiocommonstatedialog（12 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- SelectedConnection
- SelectedState
- State
- TestCommand
- Title
- Window

#### dialogs/subactions/mtion/mtionsendtriggerdialog（12 条）

- ...
- CancelCommand
- Name
- OkCommand
- Parameters
- SelectTriggerCommand
- Title
- Trigger Name
- TriggerName
- Type
- Value
- Window

#### dialogs/subactions/triggers/settriggerstatedialog（12 条）

- Action
- ActionText
- CancelCommand
- OkCommand
- SelectActionCommand
- SelectedState
- SelectedTrigger
- State
- States
- Title
- Triggers
- Window

#### dialogs/subactions/voicecontrol/voicecontrolsetcommanddialog（12 条）

- Add a Voice Control Command!
- CancelCommand
- Command
- HasCommands
- Items
- Items[0].Group
- No Voice Control Commands Found!
- OkCommand
- SelectedItem
- Title
- Voice Command
- Window

#### dialogs/subactions/youtube/youtubebanuserdialog（12 条）

- Broadcast
- CancelCommand
- IsAuthenticated
- Items
- Not Connected
- OkCommand
- SelectedItem
- The user id can contain either a specific user's id, or a %variable% that will be parsed
- Title
- User Id
- UserId
- Window

#### dialogs/triggers/crowdcontrol/crowdcontrolcoinexchangetriggerdialog（12 条）

- Amount
- CancelCommand
- Coin Type
- CoinTypes
- Exchange Source
- ExchangeSources
- MinMax
- OkCommand
- SelectedCoinType
- SelectedExchangeSource
- Title
- Window

#### dialogs/triggers/meldstudio/meldstudioeventtriggerdialog（12 条）

- Add Connection
- CancelCommand
- Connection
- Connections
- CreateCommand
- Event
- Events
- OkCommand
- SelectedConnection
- SelectedEventText
- Title
- Window

#### dialogs/triggers/midi/midimessagetriggerdialog（12 条）

- CancelCommand
- Create Midi Event
- CreateCommand
- Device
- Devices
- Event
- Events
- OkCommand
- SelectedDevice
- SelectedEvent
- Title
- Window

#### dialogs/triggers/obsstudio/obsstudioeventtriggerdialog（12 条）

- Add Connection
- CancelCommand
- Connection
- Connections
- CreateCommand
- Event
- Events
- OkCommand
- SelectedConnection
- SelectedEventText
- Title
- Window

#### dialogs/triggers/streamerbotremote/streamerbotremoteinstancetriggertriggerdialog（12 条）

- CancelCommand
- Event Name
- EventName
- Instance
- IsAuthenticated
- Items
- Leaving Event Name empty is considered a catch-all and will trigger on any remote event name.
- Not Authenticated
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/triggers/twitch/twitchgiftsubtriggerdialog（12 条）

- CancelCommand
- Milestone Range (this is for the number of subs gifted over all time)
- MinMax
- Months Gifted
- MonthsGifted
- OkCommand
- Sub Type
- SubTypes
- Tier
- Tiers
- Title
- Window

#### dialogs/subactions/commands/getcommandgroupstatedialog（11 条）

- Cancel
- CancelCommand
- Group
- HasGroups
- Items
- No command groups found!
- Ok
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubepoccamsettorchmodedialog（11 条）

- CancelCommand
- Elgato CameraHub is Not Connected!
- IsConnected
- Items
- Mode
- Not Connected
- OkCommand
- SelectedItem
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetautowhitebalancedialog（11 条）

- CancelCommand
- Elgato CameraHub is Not Connected!
- IsConnected
- Mode
- Not Connected
- OkCommand
- SelectedState
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetdynamicrangedialog（11 条）

- CancelCommand
- Dynamic Range
- Elgato CameraHub is Not Connected!
- IsConnected
- Not Connected
- OkCommand
- SelectedState
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/streamdeck/streamdecksetbackgrounddialog（11 条）

- BrowseForFileCommand
- Button ID
- ButtonId
- CancelCommand
- Color
- Image
- OkCommand
- State
- Title
- Window
- You can get the ButtonID from the StreamDeck Application, and Image/State supports variables. State is optional

#### dialogs/subactions/kick/channelrewards/kickchannelrewardgetinfodialog（11 条）

- CancelCommand
- HasRewards
- Items[0].Group
- No Kick Rewards Found!
- No Rewards Found
- OkCommand
- Reward
- Rewards
- SelectedReward
- Title
- Window

#### dialogs/subactions/kick/channelrewards/kickchannelrewardresetcounterdialog（11 条）

- CancelCommand
- HasRewards
- Items[0].Group
- No Kick Rewards Found!
- No Rewards Found
- OkCommand
- Reward
- Rewards
- SelectedReward
- Title
- Window

#### dialogs/subactions/kick/channelrewards/kickchannelrewardresetusercountersdialog（11 条）

- CancelCommand
- HasRewards
- Items[0].Group
- No Kick Rewards Found!
- No Rewards Found
- OkCommand
- Reward
- Rewards
- SelectedReward
- Title
- Window

#### dialogs/subactions/kick/kicksendmessagedialog（11 条）

- CancelCommand
- Fallback
- Fallback to Broadcaster
- Message
- Message.Length
- OkCommand
- Send using bot account
- Title
- UseBot
- Window
- {0}/500

#### dialogs/subactions/logic/setargumentdialog（11 条）

- Auto Type
- AutoType
- CancelCommand
- OkCommand
- This SubAction will allow you to set the value of an argument.  These are the %variables% you use in other SubActions
- Title
- Value
- Variable Name
- Variable Name or Value can be a fixed value, or a parsed value, using variables and/or inline functions
- VariableName
- Window

#### dialogs/subactions/quotes/getquotedialog（11 条）

- Adding multiple Get Quotes will overwrite each previous one
- CanEditQuoteId
- CancelCommand
- OkCommand
- Quote ID
- QuoteId
- SelectedType
- Title
- Type
- Types
- Window

#### dialogs/subactions/streamfog/streamfogactivatelensbynamedialog（11 条）

- CancelCommand
- Duration
- IsConnected
- Lens Name
- Lens Name and/or Duration can be a fixed value or a parsed value using variables and/or inline functions.
- Name
- Not Connected
- OkCommand
- TestCommand
- Title
- Window

#### dialogs/subactions/throwingsystem/throwingsystemactivatetriggerdialog（11 条）

- CancelCommand
- IsConnected
- Items
- Not Connected
- Not Connected!
- OkCommand
- SelectedItem
- TestCommand
- Title
- Trigger
- Window

#### dialogs/subactions/throwingsystem/throwingsystemthrowitembynamedialog（11 条）

- Amount
- CancelCommand
- Delay
- IsConnected
- Item
- Name
- Not Connected
- OkCommand
- TestCommand
- Title
- Window

#### dialogs/subactions/throwingsystem/throwingsystemthrowitemsbynamedialog（11 条）

- Amount
- CancelCommand
- Delay
- IsConnected
- Item
- ItemNames
- Not Connected
- OkCommand
- TestCommand
- Title
- Window

#### dialogs/subactions/throwingsystem/throwingsystemthrowitemsdialog（11 条）

- Amount
- CancelCommand
- Delay
- IsConnected
- Items
- Not Connected
- Not Connected!
- OkCommand
- TestCommand
- Title
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardgetinfodialog（11 条）

- CancelCommand
- HasRewards
- Items[0].Group
- No Rewards Found
- No Twitch Rewards Found!
- OkCommand
- Reward
- Rewards
- SelectedReward
- Title
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardresetcounterdialog（11 条）

- CancelCommand
- HasRewards
- Items[0].Group
- No Rewards Found
- No Twitch Rewards Found!
- OkCommand
- Reward
- Rewards
- SelectedReward
- Title
- Window

#### dialogs/subactions/twitch/rewards/twitchrewardresetusercountersdialog（11 条）

- CancelCommand
- HasRewards
- Items[0].Group
- No Rewards Found
- No Twitch Rewards Found!
- OkCommand
- Reward
- Rewards
- SelectedReward
- Title
- Window

#### dialogs/subactions/users/clearusersfromgroupdialog（11 条）

- Add a Group!
- CancelCommand
- Group
- HasGroups
- Items
- Items[0].Group
- No Groups Found!
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/subactions/voicemod/voicemodselectvoicedialog（11 条）

- CancelCommand
- IsConnected
- Items
- Not Connected
- Not Connected!
- OkCommand
- SelectedItem
- TestCommand
- Title
- Voice
- Window

#### dialogs/subactions/vtubestudio/vtubestudioloadmodeldialog（11 条）

- CancelCommand
- IsConnected
- Model
- Models
- Not Connected
- Not Connected!
- OkCommand
- SelectedModel
- TestCommand
- Title
- Window

#### dialogs/triggers/inputs/inputkeypressedtriggerdialog（11 条）

- CancelCommand
- Capture Key
- CaptureKeyCommand
- Capturing
- Key Combination
- KeyCombination
- OkCommand
- Save Key
- SaveKeyCommand
- Title
- Window

#### dialogs/triggers/meldstudio/meldstudioscenechangedtriggerdialog（11 条）

- Add Connection
- CancelCommand
- Connection
- Connections
- CreateCommand
- OkCommand
- Scene Name
- SceneName
- SelectedConnection
- Title
- Window

#### dialogs/triggers/obsstudio/obsstudioscenechangedtriggerdialog（11 条）

- Add Connection
- CancelCommand
- Connection
- Connections
- CreateCommand
- OkCommand
- Scene Name
- SceneName
- SelectedConnection
- Title
- Window

#### dialogs/triggers/streamlabsdesktop/streamlabsdesktopscenechangedtriggerdialog（11 条）

- Add Connection
- CancelCommand
- Connection
- Connections
- CreateCommand
- OkCommand
- Scene Name
- SceneName
- SelectedConnection
- Title
- Window

#### dialogs/variableinspectordialog（11 条）

- Copy All Variable Names
- Copy As Text Table
- CopyAllVariableNamesCommand
- CopyAsTextTableCommand
- Name
- SelectedVariable
- Title
- Value
- Variable Value
- Variables
- Window

#### dialogs/subactions/actions/setactionqueueblockingstatedialog（10 条）

- CancelCommand
- Items
- OkCommand
- Queue
- SelectedItem
- SelectedState
- State
- States
- Title
- Window

#### dialogs/subactions/actions/setactionstatedialog（10 条）

- Action
- ActionText
- CancelCommand
- OkCommand
- SelectActionCommand
- SelectedState
- State
- States
- Title
- Window

#### dialogs/subactions/commands/getcommandstatedialog（10 条）

- CancelCommand
- Command
- HasCommands
- Items
- Items[0].Group
- No commands found!
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/subactions/core/waitforlocalsignaldialog（10 条）

- CancelCommand
- If timeout is left blank, it defaults to 30 seconds (or 30,000ms)
- OkCommand
- Overwrite Variables
- OverwriteVariables
- Signal name
- SignalName
- Timeout
- Title
- Window

#### dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetautoscrollstatedialog（10 条）

- CancelCommand
- IsConnected
- Mode
- Not Connected
- OkCommand
- SelectedState
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetbrightnessdialog（10 条）

- Adjustment
- Brightness
- CancelCommand
- IsConnected
- Not Connected
- OkCommand
- TestCommand
- Title
- Value
- Window

#### dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetchapterdialog（10 条）

- Adjustment
- CancelCommand
- Chapter
- IsConnected
- Not Connected
- OkCommand
- TestCommand
- Title
- Value
- Window

#### dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetcrosshairstatedialog（10 条）

- CancelCommand
- IsConnected
- Mode
- Not Connected
- OkCommand
- SelectedState
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetfontsizedialog（10 条）

- Adjustment
- CancelCommand
- Font Size
- IsConnected
- Not Connected
- OkCommand
- TestCommand
- Title
- Value
- Window

#### dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersethorizontalmargindialog（10 条）

- Adjustment
- CancelCommand
- IsConnected
- Margin
- Not Connected
- OkCommand
- TestCommand
- Title
- Value
- Window

#### dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetlinespacingdialog（10 条）

- Adjustment
- CancelCommand
- IsConnected
- Line Spacing
- Not Connected
- OkCommand
- TestCommand
- Title
- Value
- Window

#### dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetmodedialog（10 条）

- CancelCommand
- IsConnected
- Mode
- Not Connected
- OkCommand
- SelectedState
- States
- TestCommand
- Title
- Window

#### dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetopacitydialog（10 条）

- Adjustment
- CancelCommand
- IsConnected
- Line Spacing
- Not Connected
- OkCommand
- TestCommand
- Title
- Value
- Window

#### dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetverticalmargindialog（10 条）

- Adjustment
- CancelCommand
- IsConnected
- Margin
- Not Connected
- OkCommand
- TestCommand
- Title
- Value
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetbrightnessdialog（10 条）

- Adjustment
- Brightness
- CancelCommand
- IsConnected
- Not Connected
- OkCommand
- TestCommand
- Title
- Value
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetcontrastdialog（10 条）

- Adjustment
- CancelCommand
- Contrast
- IsConnected
- Not Connected
- OkCommand
- TestCommand
- Title
- Value
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetfocusdialog（10 条）

- Adjustment
- CancelCommand
- Focus
- IsConnected
- Not Connected
- OkCommand
- TestCommand
- Title
- Value
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetpandialog（10 条）

- Adjustment
- CancelCommand
- IsConnected
- Not Connected
- OkCommand
- Pan
- TestCommand
- Title
- Value
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetsaturationdialog（10 条）

- Adjustment
- CancelCommand
- IsConnected
- Not Connected
- OkCommand
- Saturation
- TestCommand
- Title
- Value
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetsharpnessdialog（10 条）

- Adjustment
- CancelCommand
- Focus
- IsConnected
- Not Connected
- OkCommand
- TestCommand
- Title
- Value
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsettiltdialog（10 条）

- Adjustment
- CancelCommand
- IsConnected
- Not Connected
- OkCommand
- TestCommand
- Tilt
- Title
- Value
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetwhitebalancedialog（10 条）

- Adjustment
- CancelCommand
- IsConnected
- Not Connected
- OkCommand
- TestCommand
- Title
- Value
- White Balance
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetwhitebalancetintdialog（10 条）

- Adjustment
- CancelCommand
- IsConnected
- Not Connected
- OkCommand
- TestCommand
- Title
- Value
- White Balance Tint
- Window

#### dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetzoomdialog（10 条）

- Adjustment
- CancelCommand
- IsConnected
- Not Connected
- OkCommand
- TestCommand
- Title
- Value
- Window
- Zoom

#### dialogs/subactions/logic/logicswitchdialog（10 条）

- A Switch evaluates the input against the Case Values for equality, and first matching will have it's SubActions run.
- Auto Type
- AutoType
- CancelCommand
- If there are no matches then it will fall back to the Default Case.
- Input
- OkCommand
- Title
- Window
- You can add multiple Case groups under the Switch SubAction, and order matters.

#### dialogs/subactions/meldstudio/meldstudiotakescreenshotdialog（10 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- SelectedConnection
- TestCommand
- Title
- Window

#### dialogs/subactions/meldstudio/meldstudiotakeverticalscreenshotdialog（10 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- SelectedConnection
- TestCommand
- Title
- Window

#### dialogs/subactions/streamfog/streamfogactivateoutfitbynamedialog（10 条）

- CancelCommand
- IsConnected
- Name
- Not Connected
- OkCommand
- Outfit Name
- Outfit Name can be a fixed value or a parsed value using variables and/or inline functions.
- TestCommand
- Title
- Window

#### dialogs/subactions/streamfog/streamfogplayvideobackgroundbynamedialog（10 条）

- CancelCommand
- IsConnected
- Name
- Not Connected
- OkCommand
- TestCommand
- Title
- Video Name
- Video Name can be a fixed value or a parsed value using variables and/or inline functions.
- Window

#### dialogs/subactions/twitch/twitchaddsuspiciousstatusdialog（10 条）

- CancelCommand
- OkCommand
- SelectedState
- States
- Status
- The user login can contain either a specific user's login, or a %variable% that will be parsed.  Some examples of variables to use are: %user%, %targetUser%, %input0%
- Title
- User Login
- UserLogin
- Window

#### dialogs/subactions/voicemod/voicemodcommonsetstatedialog（10 条）

- CancelCommand
- IsConnected
- Items
- Not Connected!
- OkCommand
- SelectedItem
- State
- TestCommand
- Title
- Window

#### dialogs/subactions/voicemod/voicemodselectrandomvoicedialog（10 条）

- CancelCommand
- IsConnected
- Items
- Mode
- Not Connected!
- OkCommand
- SelectedItem
- TestCommand
- Title
- Window

#### dialogs/subactions/voicemod/voicemodselectvoicebyiddialog（10 条）

- CancelCommand
- Id
- IsConnected
- Not Connected
- OkCommand
- TestCommand
- Title
- Voice ID
- VoiceId can be a fixed value or a parsed value using variables and/or inline functions.
- Window

#### dialogs/subactions/voicemod/voicemodselectvoicebynamedialog（10 条）

- CancelCommand
- IsConnected
- Not Connected
- OkCommand
- TestCommand
- Title
- Voice Name
- Voice Name can be a fixed value or a parsed value using variables and/or inline functions.
- VoiceName
- Window

#### dialogs/triggers/commands/commandcommontriggerdialog（10 条）

- CancelCommand
- Command
- Create Command
- CreateCommand
- Items
- Items[0].Group
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/triggers/core/globalvariablecreatedtriggerdialog（10 条）

- CancelCommand
- Either
- Leaving name empty is considered a catch-all and will trigger on any global variable being created
- NonPersisted
- OkCommand
- Persisted
- Title
- Variable Name
- VariableName
- Window

#### dialogs/triggers/core/globalvariabledeletedtriggerdialog（10 条）

- CancelCommand
- Either
- Leaving name empty is considered a catch-all and will trigger on any global variable being deleted
- NonPersisted
- OkCommand
- Persisted
- Title
- Variable Name
- VariableName
- Window

#### dialogs/triggers/core/globalvariableupdatedtriggerdialog（10 条）

- CancelCommand
- Either
- Leaving name empty is considered a catch-all and will trigger on any global variable updating
- NonPersisted
- OkCommand
- Persisted
- Title
- Variable Name
- VariableName
- Window

#### dialogs/triggers/twitch/twitchgiftbombtriggerdialog（10 条）

- CancelCommand
- Gift Sub Count Range
- MinMax
- OkCommand
- Sub Type
- SubTypes
- Tier
- Tiers
- Title
- Window

#### dialogs/kick/kickcategorysearchdialog（9 条）

- CancelCommand
- ClearCommand
- IsSearching
- Query
- Search Kick Categories
- SearchResults
- SelectCommand
- SelectedResult
- Window

#### dialogs/midioutdialog（9 条）

- AutoOpen
- CancelCommand
- Devices
- Name
- OkCommand
- ReOpen
- SelectedDevice
- Title
- Window

#### dialogs/subactions/actions/doactiondialog（9 条）

- Action
- ActionText
- CancelCommand
- OkCommand
- Run Action Immediately
- RunImmediately
- SelectActionCommand
- Title
- Window

#### dialogs/subactions/core/setspeechtotextinputdialog（9 条）

- Audio Input Device
- AudioDevices
- CancelCommand
- HasDevices
- No Audio Devices Found
- OkCommand
- SelectedDevice
- Title
- Window

#### dialogs/subactions/core/udpbroadcastdialog（9 条）

- CancelCommand
- OkCommand
- Payload
- Payload Data
- Port
- Title
- UDP Port
- Using this you can send a UDP broadcast packet which will contain the data you enter in payload.
- Window

#### dialogs/subactions/elgato/streamdeck/streamdecksettitledialog（9 条）

- Button ID
- ButtonId
- ButtonTitle
- CancelCommand
- OkCommand
- State
- Title
- Window
- You can get the ButtonID from the StreamDeck Application, and Title/State supports variables.  State is optional.

#### dialogs/subactions/file/fileexistsdialog（9 条）

- BrowseForFileCommand
- CancelCommand
- File to Check if Exists
- FilePath
- OkCommand
- Title
- Variable Name to Use (if empty, fileExists is used)
- VariableName
- Window

#### dialogs/subactions/file/folderexistsdialog（9 条）

- BrowseForFolderCommand
- CancelCommand
- Folder
- Folder to Check if Exists
- OkCommand
- Title
- Variable Name to Use (if empty, folderExists is used)
- VariableName
- Window

#### dialogs/subactions/kick/kickcommonusergroupdialog（9 条）

- CancelCommand
- Group Name
- GroupName
- OkCommand
- The user login and group name can contain either a specific user's login, or a %variables% that will be parsed
- Title
- User Login
- UserLogin
- Window

#### dialogs/subactions/meldstudio/meldstudiocommonconnectiondialog（9 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- SelectedConnection
- Title
- Window

#### dialogs/subactions/obsstudio/obsstudiocommonconnectiondialog（9 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- SelectedConnection
- Title
- Window

#### dialogs/subactions/pronouns/pronounsaddforuserdialog（9 条）

- CancelCommand
- OkCommand
- Prefix
- The user login can contain either a specific user's login, or a %variables% that will be parsed
- Title
- User Login
- UserLogin
- Variable Prefix
- Window

#### dialogs/subactions/speakerbot/speakerbotsetenabledstatedialog（9 条）

- CancelCommand
- IsConnected
- OkCommand
- SelectedState
- Speaker.bot Not Connected
- State
- States
- Title
- Window

#### dialogs/subactions/speakerbot/speakerbotsetpausedstatedialog（9 条）

- CancelCommand
- IsConnected
- OkCommand
- SelectedState
- Speaker.bot Not Connected
- State
- States
- Title
- Window

#### dialogs/subactions/streamlabsdesktop/streamlabsdesktopcommonconnectiondialog（9 条）

- CancelCommand
- Connection
- Connections
- IsConnected
- Not Connected
- OkCommand
- SelectedConnection
- Title
- Window

#### dialogs/subactions/throwingsystem/throwingsystemactivatetriggerbynamedialog（9 条）

- CancelCommand
- IsConnected
- Name
- Not Connected
- OkCommand
- TestCommand
- Title
- Trigger
- Window

#### dialogs/subactions/twitch/rewards/twitchredemptionstatusdialog（9 条）

- CancelCommand
- If cancelling a redemption, this will refund the channel points back to the user that redeemed it.
- OkCommand
- SelectedState
- States
- Status
- Title
- Window
- You can set the status of a redemption using this action, and the usual caveat, the reward must have been created by CPH for it to modify the status of redemptions.

#### dialogs/subactions/twitch/twitchcommonchanneltagdialog（9 条）

- A channel may specify a maximum of 10 tags. Each tag is limited to a maximum of 25 characters and may not be an empty string or contain spaces or special characters.
- CancelCommand
- ChannelTag
- For readability, consider using camelCasing or PascalCasing.
- OkCommand
- Tag
- Tags are case insensitive.
- Title
- Window

#### dialogs/subactions/twitch/twitchcommongueststarslotdialog（9 条）

- CancelCommand
- OkCommand
- Slot
- The slot can contain a number, typically between 1 and 6, or a %variable% that will be parsed.
- The user login can contain either a specific user's login, or a %variable% that will be parsed
- Title
- User Login
- UserLogin
- Window

#### dialogs/subactions/twitch/twitchcommonusergroupdialog（9 条）

- CancelCommand
- Group Name
- GroupName
- OkCommand
- The user login and group name can contain either a specific user's login, or a %variables% that will be parsed
- Title
- User Login
- UserLogin
- Window

#### dialogs/subactions/twitch/twitchfollowmodedialog（9 条）

- CancelCommand
- Duration
- Duration can either be a number (in minutes between 0 and 129,600), or a %variable% that will be parsed.
- OkCommand
- SelectedState
- State
- States
- Title
- Window

#### dialogs/subactions/twitch/twitchslowmodedialog（9 条）

- CancelCommand
- Duration
- Duration can either be a number (in seconds), or a %variable% that will be parsed.
- OkCommand
- SelectedState
- State
- States
- Title
- Window

#### dialogs/subactions/twitch/twitchtimeoutuserdialog（9 条）

- CancelCommand
- Duration
- OkCommand
- Reason
- The user login can contain either a specific user's login, or a %variable% that will be parsed
- Title
- User Login
- UserLogin
- Window

#### dialogs/subactions/twitch/twitchupdategueststarslotdialog（9 条）

- CancelCommand
- Destination Slot
- DestinationSlot
- OkCommand
- Source Slot
- SourceSlot
- The slot can contain a number, typically between 1 and 6, or a %variable% that will be parsed.
- Title
- Window

#### dialogs/subactions/vtubestudio/vtubestudiocommonbynamedialog（9 条）

- CancelCommand
- IsConnected
- Name
- Name can be a fixed value or a parsed value using variables and/or inline functions.
- Not Connected
- OkCommand
- TestCommand
- Title
- Window

#### dialogs/subactions/youtube/youtubecommonusergroupdialog（9 条）

- CancelCommand
- Group Name
- GroupName
- OkCommand
- The user login and group name can contain either a specific user's login, or a %variables% that will be parsed
- Title
- User Login
- UserLogin
- Window

#### dialogs/subactions/youtube/youtubeendpolldialog（9 条）

- Broadcast
- CancelCommand
- IsAuthenticated
- Items
- Not Connected
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/triggers/core/timedactiontriggerdialog（9 条）

- CancelCommand
- Create Timer
- CreateCommand
- Items
- OkCommand
- SelectedItem
- Timers
- Title
- Window

#### dialogs/triggers/donordrive/donordrivecommontriggerdialog（9 条）

- CancelCommand
- Create DonorDrive
- CreateCommand
- Donor Drive
- Items
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/triggers/elgato/wavelink/elgatowavelinkinputlevelmeterchangedtriggerdialog（9 条）

- CancelCommand
- Input
- IsConnected
- Items
- Not Connected
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/triggers/filetail/filetailchangedtriggerdialog（9 条）

- CancelCommand
- Create File Tail
- CreateCommand
- File Tail
- Items
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/triggers/filewatcher/filewatchercommontriggerdialog（9 条）

- CancelCommand
- Create File Watcher
- CreateCommand
- Items
- OkCommand
- SelectedItem
- Title
- Watcher
- Window

#### dialogs/triggers/kick/kickchannelupdatetriggerdialog（9 条）

- CancelCommand
- CategoryText
- Game
- Game Only
- GameOnly
- OkCommand
- SearchForCategoryCommand
- Title
- Window

#### dialogs/triggers/kick/kickfirstwordstriggerdialog（9 条）

- CancelCommand
- Is UserId
- IsUserId
- Leaving user name empty is considered a catch-all and will trigger on any first words event.
- OkCommand
- Title
- User Name
- Username
- Window

#### dialogs/triggers/kick/kickrewardredemptioncommontriggerdialog（9 条）

- CancelCommand
- Create Reward
- CreateCommand
- Items
- OkCommand
- Reward
- SelectedItem
- Title
- Window

#### dialogs/triggers/meldstudio/meldstudiocommonconnectiontriggerdialog（9 条）

- Add Connection
- CancelCommand
- Connection
- Connections
- CreateCommand
- OkCommand
- SelectedConnection
- Title
- Window

#### dialogs/triggers/obsstudio/obsstudiocommonconnectiontriggerdialog（9 条）

- Add Connection
- CancelCommand
- Connection
- Connections
- CreateCommand
- OkCommand
- SelectedConnection
- Title
- Window

#### dialogs/triggers/speechtotext/speechtotextcommontriggerdialog（9 条）

- CancelCommand
- Create Voice Command
- CreateCommand
- Items
- OkCommand
- SelectedItem
- Title
- Voice Control
- Window

#### dialogs/triggers/streamerbot/streamerbotcustomwebhooktriggerdialog（9 条）

- CancelCommand
- Custom Webhook
- IsAuthenticated
- Items
- Not Authenticated
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/triggers/streamerbotremote/streamerbotremoteinstancecommontriggerdialog（9 条）

- CancelCommand
- Instance
- IsAuthenticated
- Items
- Not Authenticated
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/triggers/streamlabsdesktop/streamlabsdesktopcommonconnectiontriggerdialog（9 条）

- Add Connection
- CancelCommand
- Connection
- Connections
- CreateCommand
- OkCommand
- SelectedConnection
- Title
- Window

#### dialogs/triggers/throwingsystem/throwingsystemitemhittriggerdialog（9 条）

- CancelCommand
- IsConnected
- Item
- Items
- Not Connected
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/triggers/throwingsystem/throwingsystemtriggercommontriggerdialog（9 条）

- CancelCommand
- IsConnected
- Items
- Not Connected
- OkCommand
- SelectedItem
- Title
- Trigger
- Window

#### dialogs/triggers/twitch/twitchfirstwordstriggerdialog（9 条）

- CancelCommand
- Is UserId
- IsUserId
- Leaving user name empty is considered a catch-all and will trigger on any first words event.
- OkCommand
- Title
- User Name
- Username
- Window

#### dialogs/triggers/twitch/twitchrewardredemptioncommontriggerdialog（9 条）

- CancelCommand
- Create Reward
- CreateCommand
- Items
- OkCommand
- Reward
- SelectedItem
- Title
- Window

#### dialogs/triggers/twitch/twitchstreamupdatetriggerdialog（9 条）

- CancelCommand
- CategoryText
- Game
- Game Only
- GameOnly
- OkCommand
- SearchForCategoryCommand
- Title
- Window

#### dialogs/triggers/vtubestudio/vtubestudiocommontriggerdialog（9 条）

- CancelCommand
- IsConnected
- Items
- Model
- Not Connected
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/triggers/websocketclient/websocketclientcommontriggerdialog（9 条）

- CancelCommand
- Client
- Create Websocket Client
- CreateCommand
- Items
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/triggers/websocketcustomserver/websocketcustomservercommontriggerdialog（9 条）

- CancelCommand
- Create Custom Server
- CreateCommand
- Items
- OkCommand
- SelectedItem
- Server
- Title
- Window

#### dialogs/triggers/youtube/youtubefirstwordstriggerdialog（9 条）

- CancelCommand
- Is UserId
- IsUserId
- Leaving user name empty is considered a catch-all and will trigger on any first words event.
- OkCommand
- Title
- User Name
- Username
- Window

#### dialogs/actionqueuedialog（8 条）

- Blocking
- CancelCommand
- Enter a unique queue name...
- Name
- OkCommand
- Title
- When enabled, actions in this queue will be run in sequence, each action waits for the previous one to complete before running.
- Window

#### dialogs/actionselectdialog（8 条）

- Actions
- CancelCommand
- ClearCommand
- Filter
- Select Action
- SelectCommand
- SelectedItem
- Window

#### dialogs/subactions/core/delayactiondialog（8 条）

- CancelCommand
- Delay
- OkCommand
- Random
- Title
- To
- Window
- You can enter a %variable% in either field, or a number.  The value is in milliseconds.

#### dialogs/subactions/core/logentrydialog（8 条）

- CancelCommand
- Log Level
- LogLevels
- Message
- OkCommand
- SelectedLogLevel
- Title
- Window

#### dialogs/subactions/elgato/streamdeck/streamdecksetstatedialog（8 条）

- Button ID
- ButtonId
- CancelCommand
- OkCommand
- State
- Title
- Window
- You can get the ButtonID from the StreamDeck Application, and State supports variables.

#### dialogs/subactions/elgato/streamdeck/streamdecksetvaluedialog（8 条）

- Button ID
- ButtonId
- CancelCommand
- OkCommand
- Title
- Value
- Window
- You can get the ButtonID from the StreamDeck Application, and Value supports variables.

#### dialogs/subactions/kick/kickcommonuserreasondialog（8 条）

- CancelCommand
- OkCommand
- Reason
- The user login can contain either a specific user's login, or a %variable% that will be parsed
- Title
- User Login
- UserLogin
- Window

#### dialogs/subactions/kick/kicktimeoutuserdialog（8 条）

- CancelCommand
- Duration
- OkCommand
- The user login can contain either a specific user's login, or a %variable% that will be parsed
- Title
- User Login
- UserLogin
- Window

#### dialogs/subactions/speakerbot/speakerbotspeakudpdialog（8 条）

- BadWordFilter
- CancelCommand
- Message
- OkCommand
- TestCommand
- Title
- VoiceAlias
- Window

#### dialogs/subactions/triggers/customeventtriggerdialog（8 条）

- CancelCommand
- Event Name
- EventName
- OkCommand
- Title
- Use Args
- UseArgs
- Window

#### dialogs/subactions/twitch/twitchcommonuserreasondialog（8 条）

- CancelCommand
- OkCommand
- Reason
- The user login can contain either a specific user's login, or a %variable% that will be parsed
- Title
- User Login
- UserLogin
- Window

#### dialogs/subactions/twitch/twitchcreateclipdialog（8 条）

- CancelCommand
- Clip Title
- ClipTitle
- Duration
- Duration can contain either a specific value between 5 and 60 (inclusive), or a %variable% that will be parsed.  This is in seconds, and if left blank, the default is 30s.
- OkCommand
- Title
- Window

#### dialogs/subactions/twitch/twitchpinchatmessagedialog（8 条）

- Both fields support parsing.  Duration can either be empty, which means the Pinned Message would last until the stream ends, or it must be, or parse to a value between 30 and 1800.
- CancelCommand
- Duration
- Message Id
- MessageId
- OkCommand
- Title
- Window

#### dialogs/triggers/twitch/twitchresubtriggerdialog（8 条）

- CancelCommand
- Cumulative Sub Range
- MinMax
- OkCommand
- Tier
- Tiers
- Title
- Window

#### dialogs/twitch/twitchcategorysearchdialog（8 条）

- CancelCommand
- ClearCommand
- IsSearching
- Query
- SearchResults
- SelectCommand
- SelectedResult
- Window

#### dialogs/subactions/actions/clearactionqueuedialog（7 条）

- CancelCommand
- Items
- OkCommand
- Queue
- SelectedItem
- Title
- Window

#### dialogs/subactions/actions/getactiongroupstatedialog（7 条）

- CancelCommand
- Group
- Items
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/subactions/actions/getactionstatedialog（7 条）

- Action
- ActionText
- CancelCommand
- OkCommand
- SelectActionCommand
- Title
- Window

#### dialogs/subactions/elgato/streamdeck/streamdeckcommonbuttoniddialog（7 条）

- Button ID
- ButtonId
- CancelCommand
- OkCommand
- Title
- Window
- You can get the ButtonID from the StreamDeck Application.

#### dialogs/subactions/ifttt/iftttnotificationdialog（7 条）

- CancelCommand
- Event Name
- EventName
- OkCommand
- Text
- Title
- Window

#### dialogs/subactions/kick/kickcommonuserlogindialog（7 条）

- CancelCommand
- OkCommand
- The user login can contain either a specific user's login, or a %variable% that will be parsed
- Title
- User Login
- UserLogin
- Window

#### dialogs/subactions/quotes/addquotedialog（7 条）

- CancelCommand
- OkCommand
- QuoteVariable
- The field above must contain the %variable% that will contain the quote to be added.
- Title
- Variable
- Window

#### dialogs/subactions/quotes/deletequotedialog（7 条）

- CancelCommand
- OkCommand
- Quote ID
- Quote ID can be a variable which must parse to a number, or a number.
- QuoteId
- Title
- Window

#### dialogs/subactions/sounds/stopsoundplaybackdialog（7 条）

- CancelCommand
- OkCommand
- Sound Name
- Sound Name can be empty, in which case it will use "default", a variable, or a string you enter
- SoundName
- Title
- Window

#### dialogs/subactions/twitch/twitchcommonstatedialog（7 条）

- CancelCommand
- OkCommand
- SelectedState
- State
- States
- Title
- Window

#### dialogs/subactions/twitch/twitchcommonuserlogindialog（7 条）

- CancelCommand
- OkCommand
- The user login can contain either a specific user's login, or a %variable% that will be parsed.  Some examples of variables to use are: %broadcastUser%, %user%, %input0%
- Title
- User Login
- UserLogin
- Window

#### dialogs/subactions/twitch/twitchgetclipdownloadurlsdialog（7 条）

- CancelCommand
- Clip ID
- ClipId
- OkCommand
- The clip ID can contain either a specific id for a clip, or a %variable% that will be parsed.  This can also only get URLs for your own clips.
- Title
- Window

#### dialogs/subactions/twitch/twitchresolvepredictionbytitledialog（7 条）

- CancelCommand
- OkCommand
- Outcome Title
- OutcomeTitle
- Specify the title of the outcome to use as the winning outcome when resolving the active prediction.  Variables are supported.
- Title
- Window

#### dialogs/subactions/twitch/twitchresolvepredictiondialog（7 条）

- CancelCommand
- OkCommand
- Specify the 0 based index of the outcome to use as the winning outcome when resolving the current active prediction.  Variables are supported.
- Title
- Window
- Winning Index
- WinningIndex

#### dialogs/subactions/twitch/twitchruncommercialdialog（7 条）

- CancelCommand
- Duration
- Durations
- OkCommand
- SelectedDuration
- Title
- Window

#### dialogs/subactions/twitch/twitchsetsubcountercountdialog（7 条）

- CancelCommand
- Count
- OkCommand
- The count can contain a specific number, or a %variables% that will be parsed
- Title
- Value
- Window

#### dialogs/subactions/twitch/twitchstartraiddialog（7 条）

- CancelCommand
- OkCommand
- This will allow you to start a raid to the user login that is specified in the above text box. Variables are supported.
- Title
- User Login
- UserLogin
- Window

#### dialogs/triggers/core/processstartedtriggerdialog（7 条）

- CancelCommand
- Leaving name empty is considered a catch-all and will trigger on any process starting.
- Name
- OkCommand
- ProcessName
- Title
- Window

#### dialogs/triggers/core/processstoppedtriggerdialog（7 条）

- CancelCommand
- Leaving name empty is considered a catch-all and will trigger on any process stopping.
- Name
- OkCommand
- ProcessName
- Title
- Window

#### dialogs/triggers/core/toastactivationtriggerdialog（7 条）

- CancelCommand
- Leaving Toast Id empty is considered a catch-all and will trigger on any Toast Id.
- OkCommand
- Title
- Toast Id
- ToastId
- Window

#### dialogs/triggers/custom/customeventtriggerdialog（7 条）

- CancelCommand
- Event Name
- EventName
- Leaving Event Name empty is considered a catch-all and will trigger on any custom event name.
- OkCommand
- Title
- Window

#### dialogs/triggers/elgato/wavelink/elgatowavelinkoutputlevelmeterchangedtriggerdialog（7 条）

- CancelCommand
- Items
- Mixer
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/triggers/group/groupcommontriggerdialog（7 条）

- CancelCommand
- Group
- Items
- OkCommand
- SelectedItem
- Title
- Window

#### dialogs/triggers/twitch/twitchautomaticrewardredemptiontriggerdialog（7 条）

- CancelCommand
- Items
- OkCommand
- Reward
- SelectedItem
- Title
- Window

#### dialogs/triggers/twitch/twitchcustompowerupredemptioncommontriggerdialog（7 条）

- CancelCommand
- Items
- OkCommand
- Reward
- SelectedItem
- Title
- Window

#### dialogs/triggers/twitch/twitchgueststarguestupdatetriggerdialog（7 条）

- CancelCommand
- Items
- OkCommand
- SelectedItem
- State
- Title
- Window

#### dialogs/triggers/twitch/twitchpowerupredemptiontriggerdialog（7 条）

- CancelCommand
- Items
- OkCommand
- Power-up
- SelectedItem
- Title
- Window

#### dialogs/triggers/voicemod/voicemodsoundboardchangedtriggerdialog（7 条）

- CancelCommand
- Leaving soundboard name empty is considered a catch-all and will trigger on any soundboard changed event.
- OkCommand
- Soundboard Name
- SoundboardId
- Title
- Window

#### dialogs/triggers/voicemod/voicemodvoiceloadedtriggerdialog（7 条）

- CancelCommand
- Leaving voice name empty is considered a catch-all and will trigger on any voice loaded event.
- OkCommand
- Title
- Voice Name
- VoiceId
- Window

#### dialogs/usersearchdialog（7 条）

- CancelCommand
- SearchResults
- SearchTerm
- SelectCommand
- SelectedUser
- Username
- Window

#### dialogs/subactions/kick/kicksetchanneltitledialog（6 条）

- CancelCommand
- ChannelTitle
- OkCommand
- Title
- Window
- You can either set a static title, and/or use variables to set a title

#### dialogs/subactions/twitch/twitchcreatestreammarkerdialog（6 条）

- CancelCommand
- Description
- OkCommand
- Title
- Window
- You can use variables, or a fixed value, including nothing to set a description for the stream marker.

#### dialogs/subactions/twitch/twitchsetchanneltitledialog（6 条）

- CancelCommand
- ChannelTitle
- OkCommand
- Title
- Window
- You can either set a static title, and/or use variables to set a title

#### dialogs/subactions/twitch/twitchupdatepinnedchatmessagedurationdialog（6 条）

- CancelCommand
- Duration
- Duration support parsing.  Duration can either be empty, which means the Pinned Message would last until the stream ends, or it must be, or parse to a value between 30 and 1800.
- OkCommand
- Title
- Window

#### dialogs/triggers/inputs/inputmouseclickedtriggerdialog（6 条）

- Button
- CancelCommand
- Items
- OkCommand
- Title
- Window

#### dialogs/triggers/twitch/twitchsubtriggerdialog（6 条）

- CancelCommand
- OkCommand
- Tier
- Tiers
- Title
- Window

#### dialogs/simulatedeventdialog（5 条）

- CancelCommand
- SaveCommand
- Settings
- Title
- Window

#### dialogs/subactions/twitch/twitchaddpresentuserdialog（5 条）

- CancelCommand
- Index
- OkCommand
- Title
- Window

#### dialogs/subactionweightdialog（5 条）

- CancelCommand
- OkCommand
- Weight
- Weighted Value
- Window

#### dialogs/triggers/commonminmaxtriggerdialog（5 条）

- CancelCommand
- MinMax
- OkCommand
- Title
- Window

#### dialogs/triggers/fourthwall/fourthwalldonationtriggerdialog（5 条）

- CancelCommand
- MinMax
- OkCommand
- Title
- Window

#### dialogs/triggers/hyperate/hyperateheartratepulsetriggerdialog（5 条）

- CancelCommand
- MinMax
- OkCommand
- Title
- Window

#### dialogs/triggers/kick/kickminmaxcommontriggerdialog（5 条）

- CancelCommand
- MinMax
- OkCommand
- Title
- Window

#### dialogs/triggers/kofi/kofidonationtriggerdialog（5 条）

- CancelCommand
- MinMax
- OkCommand
- Title
- Window

#### dialogs/triggers/pallygg/pallyggcampaigntiptriggerdialog（5 条）

- CancelCommand
- MinMax
- OkCommand
- Title
- Window

#### dialogs/triggers/pulsoid/pulsoidheartratepulsetriggerdialog（5 条）

- CancelCommand
- MinMax
- OkCommand
- Title
- Window

#### dialogs/triggers/streamelements/streamelementstiptriggerdialog（5 条）

- CancelCommand
- MinMax
- OkCommand
- Title
- Window

#### dialogs/triggers/streamlabs/streamlabsminmaxtriggerdialog（5 条）

- CancelCommand
- MinMax
- OkCommand
- Title
- Window

#### dialogs/triggers/tipeeestream/tipeeestreamdonationtriggerdialog（5 条）

- CancelCommand
- MinMax
- OkCommand
- Title
- Window

#### dialogs/triggers/twitch/twitchminmaxcommontriggerdialog（5 条）

- CancelCommand
- MinMax
- OkCommand
- Title
- Window

#### dialogs/triggers/twitch/twitchupcomingadtriggerdialog（5 条）

- CancelCommand
- Minutes
- OkCommand
- Title
- Window

#### dialogs/triggers/youtube/youtubeminmaxcommontriggerdialog（5 条）

- CancelCommand
- MinMax
- OkCommand
- Title
- Window

#### dialogs/markdownviewerdialog（3 条）

- Doc
- Title
- Window

### 设置/页面

#### pages/settings/userinterfacepage（134 条）

- After
- Ask for Confirmation on Close
- Auto Open Chat on Startup
- Auto Open Event Feed on Startup
- AutoOpenChat
- AutoOpenFeed
- BodyStrong
- Changing enabled Sub-Actions requires a restart of Streamer.bot
- Changing enabled Triggers requires a restart of Streamer.bot
- Choose a custom default color to use for the Comment Sub-Action
- Choose the color to use when a Sub-Action is disabled
- Choose what MIDI pages to show
- Choose what Server/Client pages to show
- Choose what Voice Control pages to show
- Choose what platforms to show
- Choose what services to show
- Choose what streaming applications to show
- CloseConfirmation
- Colors
- Commands
- Comment Color
- CommentColor
- CommentColorHex
- Credits
- Custom Websocket Clients
- Custom Websocket Servers
- Dark Mode
- Disable Capturing of Variable Viewer Window
- DisableCapturing
- Do not show Streamer.bot's splash screen when starting
- Duplicate Sub-Action Location
- Enabled Sub-Actions
- Enabled Triggers
- End
- File Tails
- File/Folder Watcher
- HTTP Server
- Hide Splash Screen
- HideSplashScreen
- Kick
- Light Mode
- Log
- MIDI
- MIDI In
- MIDI Out
- Meld Studio
- Minimize to Tray
- Minimize to Tray on Close
- MinimizeToTray
- MinimizeToTrayOnClose
- NavPanelCommands
- NavPanelMidi
- NavPanelMidi_MidiIn
- NavPanelMidi_MidiOut
- NavPanelPlatforms
- NavPanelPlatforms_Kick
- NavPanelPlatforms_Twitch
- NavPanelPlatforms_YouTube
- NavPanelServersClients
- NavPanelServersClients_CustomWebsocketClients
- NavPanelServersClients_CustomWebsocketServers
- NavPanelServersClients_HttpServer
- NavPanelServersClients_UdpServer
- NavPanelServersClients_WebsocketServer
- NavPanelServices
- NavPanelServices_Credits
- NavPanelServices_FileFolderWatcher
- NavPanelServices_FileTails
- NavPanelServices_ProcessWatcher
- NavPanelServices_Quotes
- NavPanelServices_Timers
- NavPanelStreamApps
- NavPanelStreamApps_MeldStudio
- NavPanelStreamApps_ObsStudio
- NavPanelStreamApps_PolyPop
- NavPanelStreamApps_StreamlabsDesktop
- NavPanelVoiceControl
- NavPanelVoiceControl_VCCommands
- NavPanelVoiceControl_VCLog
- NavPanelVoiceControl_VCSettings
- Navigation Panel
- OBS Studio
- Off
- On
- Other
- Pick either Light Mode or Dark Mode for Streamer.bot
- PickCommentColorCommand
- PickSubActionDisabledColorCommand
- Platforms
- PolyPop
- Process Watcher
- Quotes
- Reset
- Reset Delete Confirmations
- Reset Integrations
- Reset Navigation Items
- ResetDeleteConfirmationsCommand
- ResetIntegrationsCommand
- ResetNavigationCommand
- Secondary
- Servers/Clients
- Services
- Settings
- Show or hide Commands page
- Stream Apps
- Streamlabs Desktop
- Sub-Action Disabled Color
- Sub-Actions
- SubActionDisabledColor
- SubActionDisabledColorHex
- SubActionDuplicateLocation
- SubActions
- Subtitle
- Theme
- This will prevent the Variable Viewer window from appearing in any form of window/screen capturing
- Timers
- Triggers
- Twitch
- UDP Server
- UseDarkMode
- User Interface
- Voice Control
- Websocket Server
- When closing Streamer.bot, ask if you really meant to close it
- When closing Streamer.bot, it will goto the Tray Icons, using close in the Tray Menu will close Streamer.bot
- When minimizing Streamer.bot, it will goto the Tray Icons
- When starting Streamer.bot, the Chat window will automatically open
- When starting Streamer.bot, the Event Feed window will automatically open
- Where to add a duplicated sub-action
- Will reset all delete confirmations so they are asked again when deleting items
- Will reset the integrations tab back to original
- Will reset the navigation panel to default, a restart is required
- Window Options
- YouTube

#### pages/platforms/twitch/twitchpage（122 条）

- Accounts
- Artificial
- Auto Reset Cache
- Automatically run the Stream Update trigger when connecting to Twitch
- BetterTTV
- BodyStrong
- Bot Account
- BotCancelLoginCommand
- BotCopyLoginUrlCommand
- BotEventSubCancelRetryCommand
- BotEventSubConnectCommand
- BotEventSubDisconnectCommand
- BotEventSubRetryCountDown
- BotEventSubState
- BotForgetCommand
- BotLoginCommand
- BotLoginState
- BotLogoutCommand
- BotName
- BotProfileUrl
- BotSubText
- Broadcaster Account
- BroadcasterCancelLoginCommand
- BroadcasterCopyLoginUrlCommand
- BroadcasterEventSubCancelRetryCommand
- BroadcasterEventSubConnectCommand
- BroadcasterEventSubDisconnectCommand
- BroadcasterEventSubRetryCountDown
- BroadcasterEventSubState
- BroadcasterForgetCommand
- BroadcasterLoginCommand
- BroadcasterLoginState
- BroadcasterLogoutCommand
- BroadcasterName
- BroadcasterProfileUrl
- BroadcasterSubText
- Browse your past videos
- Cancel Login
- Channel Point Rewards
- Clear the cache on startup if the time since last startup exceeds the given interval
- Collapsed
- Configure Twitch Sub Counter integration settings
- Configure the first words cache
- Configure third party emote handling, changing these requires a restart
- Configuring Twitch
- Connect
- Connect a bot account to send messages with a different user
- Connect your streaming account for core functionality
- Connecting...
- Copy Login Link
- Custom Power-Ups
- Defaults to 5 minutes to balance accuracy and performance
- Disabled
- Disconnect
- Emote Handlers
- Enabled
- EventSub
- EventSub Client
- First Words
- FirstWordsReset
- Forget
- Forget this account?
- FrankerFaceZ
- Gift Bombs
- HandleBetterTTY
- HandleFrankerFaceZ
- HandleSevenTV
- Help with Twitch
- IgnoreGiftSubsFromGiftBombs
- Ignored
- Keep track of active viewers in chat
- Keep track of users that create pyramids in your chat
- Live
- Live Update
- Log In (Default)
- Login
- Logout
- Manage Polls on your Twitch broadcaster account
- Manage Predictions on your Twitch broadcaster account
- Manage your Twitch channel point rewards
- Manage your Twitch custom power-ups (beta)
- Manually reset the cache
- Minimum Width
- NavigateToCommand
- Not Ignored
- Polls
- Predictions
- Present Viewers
- PresentViewersEnabled
- PresentViewersInterval
- PresentViewersLiveUpdate
- PyramidMinimumWidth
- PyramidSharedChat
- Pyramids
- PyramidsEnabled
- Related Support
- Reset
- ResetFirstWordsCommand
- Retrying
- Secondary
- Services
- Settings
- SevenTV
- Shared Chat Participation
- Stream Update on Connect
- StreamUpdateOnConnect
- Sub Counter
- Subtitle
- TextFillColorSecondaryBrush
- The minimum number of emotes required before starting to track a pyramid
- Title
- Twitch
- Update Interval
- Videos
- Visible
- Whether or not shared chat will be able to participate in creating/breaking Pyramids
- Whether or not to ignore Gift Subs from Gift Bombs
- Whether or not to use realtime data from Twitch, or artificial data
- Whether to handle BetterTTV emotes
- Whether to handle FrankerFaceZ emotes
- Whether to handle Seven TV emotes
- {0} minute(s)

#### pages/platforms/kick/kickpage（80 条）

- Accounts
- Auto Reset Cache
- BodyStrong
- Bot Account
- BotCancelLoginCommand
- BotCopyLoginUrlCommand
- BotForgetCommand
- BotLoginCommand
- BotLoginState
- BotLogoutCommand
- BotName
- BotSubText
- Broadcaster Account
- BroadcasterCancelLoginCommand
- BroadcasterChatCancelRetryCommand
- BroadcasterChatConnectCommand
- BroadcasterChatDisconnectCommand
- BroadcasterChatRetryCountDown
- BroadcasterChatState
- BroadcasterCopyLoginUrlCommand
- BroadcasterForgetCommand
- BroadcasterLoginCommand
- BroadcasterLoginState
- BroadcasterLogoutCommand
- BroadcasterName
- BroadcasterSubText
- Cancel Login
- Channel Point Rewards
- Chat Client
- Clear the cache on startup if the time since last startup exceeds the given interval
- Collapsed
- Configure the first words cache
- Configure third party emote handling, changing these requires a restart
- Connect
- Connect a bot account to send messages with a different user
- Connect your streaming account for core functionality
- Connecting...
- Copy Login Link
- Defaults to 5 minutes to balance accuracy and performance
- Disabled
- Disconnect
- Emote Handlers
- Enabled
- First Words
- FirstWordsReset
- Forget
- Forget this account?
- HandleSevenTV
- IsKickStatusOk
- IsKickTokenExpired
- IsStreamerBotConnected
- Keep track of active viewers in chat
- Kick
- Kick's own API implementation is still very fluid, and lacking, so not every feature maybe implemented
- Log In (Default)
- Login
- Logout
- Manage your Kick channel point rewards
- Manually reset the cache
- NavigateToCommand
- OpenStreamerBotKickLinkCommand
- Present Viewers
- PresentViewersEnabled
- PresentViewersInterval
- Reset
- ResetFirstWordsCommand
- Retrying
- Secondary
- Services
- Settings
- SevenTV
- Streamer.bot Account Required.  Connect to the Streamer.bot website by clicking 'Login' in the bottom-left corner.
- Subtitle
- TextFillColorSecondaryBrush
- Update Interval
- Visible
- Whether to handle Seven TV emotes
- Your Kick account is linked on Streamer.bot
- Your Kick connection on the website has expired, this is required, click here to reconnect
- {0} minute(s)

#### pages/platforms/youtube/youtubepage（80 条）

- Accounts
- Add
- AddTagCommand
- Auto Monitor Live Broadcasts
- Auto Reset Cache
- AutoMonitorLive
- Automatically connect to your YouTube Bot account when Streamer.bot starts up
- Automatically connect to your YouTube Broadcaster account when Streamer.bot starts up
- BodyStrong
- Bot Account
- Bot Account Auto Connect
- BotAutoConnect
- BotAvatar
- BotCanConnect
- BotCanDisconnect
- BotConnectCommand
- BotDisconnectCommand
- BotForgetCommand
- BotName
- BotStatus
- Broadcaster Account
- Broadcaster Account Auto Connect
- BroadcasterAutoConnect
- BroadcasterAvatar
- BroadcasterCanConnect
- BroadcasterCanDisconnect
- BroadcasterConnectCommand
- BroadcasterDisconnectCommand
- BroadcasterForgetCommand
- BroadcasterName
- BroadcasterStatus
- Broadcasts
- By clicking "I Agree" below, you are agreeing to YouTube's Terms of Service, Google's Privacy Policy, and Streamer.bot's Terms of Service and Privacy policy as linked below.
- Clear the cache on startup if the time since last startup exceeds the given interval
- Collapsed
- Configure the first words cache
- Connect a bot account to send messages with a different user
- Connect your streaming account for core functionality
- Default Tags
- Defaults to 5 minutes to balance accuracy and performance
- Del
- Disabled
- Enabled
- First Words
- FirstWordsReset
- Forget
- Forget this account?
- I Agree
- Keep track of active viewers in chat
- Logout
- Manually reset the cache
- NavigateToCommand
- NewTag
- Off
- On
- Present Viewers
- PresentViewersEnabled
- PresentViewersInterval
- Privacy Policy
- QuotaExceeded
- RemoveTagCommand
- Reset
- ResetFirstWordsCommand
- Secondary
- SelectedTag
- Settings
- Streamer.bot's YouTube quota has been exceeded! The quota will reset at Midnight PST!
- Subtitle
- Tags
- Terms of Service
- TextFillColorSecondaryBrush
- Title
- True
- Update Interval
- When a Live broadcast is detected automatically start monitoring it
- YouTubeAcceptedTerms
- YouTubeAgreeCommand
- YouTubePage
- Your YouTube broadcasts
- {0} minute(s)

#### pages/settings/defaultspage（66 条）

- ActionAlwaysRun
- ActionConcurrent
- ActionExclude
- ActionRandom
- Actions
- Always Run
- BodyStrong
- Case Sensitive
- CommandCaseSensitive
- CommandGlobalCooldown
- CommandIgnoreBot
- CommandIgnoreInternal
- CommandInclude
- CommandPersistCounter
- CommandPersistUserCounter
- CommandSourceKickMessage
- CommandSourceTwitchBotWhisper
- CommandSourceTwitchMessage
- CommandSourceTwitchReSubMessage
- CommandSourceTwitchSharedChat
- CommandSourceTwitchWhisper
- CommandSourceYouTubeMessage
- CommandUserCooldown
- Commands
- Concurrent
- Default settings to apply to new Actions
- Default settings to apply to new Commands
- Default settings to apply to new Switch Case groupings
- Defaults
- Exclude from Action Queue/History
- Global Cooldown
- Ignore Bot Messages
- Ignore Internal Messages
- Include
- Kick Message
- Off
- On
- Persist Counter
- Persist User Counter
- Random
- Sources
- Sub-Actions
- SubActionSwitchCase_CaseSensitive
- Subtitle
- Switch Case
- The global cooldown for the command
- The user cooldown for the command
- Twitch Bot Whisper
- Twitch Message
- Twitch Resubscription Message
- Twitch Shared Chat
- Twitch Whisper
- User Cooldown
- What sources are enabled by default
- Whether or not the command is case sensitive
- Whether or not this action, when queued will always run, regardless if the queue is paused
- Whether or not to exclude the action from appearing in the Action Queue or Action History pages
- Whether or not to ignore messages that come from the logged in bot account for the service
- Whether or not to ignore messages that originate from Streamer.bot
- Whether or not to include the command in the command list sub-action
- Whether or not to pick a random top level sub-actions to only run
- Whether or not to save counters to disk
- Whether or not to save user counters to disk
- Whether or not to the switch case should be case sensitive
- Whether or not top level sub-actions run concurrently
- YouTube Message

#### pages/actionspage（64 条）

- ({0})
- ActionFilter
- Actions
- Actions.Count
- ActionsList
- ActionsView
- Add
- AddActionCommand
- BodyStrong
- Caption
- Collapse All
- CollapseAllCommand
- Collapsed
- CopyActionIdCommand
- CopySelectedTriggersCommand
- CopySubActionCommand
- Criteria
- DeleteActionsCommand
- DeleteSelectedTriggersCommand
- DeleteSubActionCommand
- DuplicateActionCommand
- DuplicateSubActionCommand
- EditActionCommand
- EditSubActionCommand
- EditTriggerCommand
- Enabled
- Expand All
- ExpandAllCommand
- Filter
- LeftColumn
- Name
- Open Trigger Viewer
- Options
- Queue
- QueueName
- Right-click to add an Action
- RightBottom
- RightColumn
- RightTop
- Search above or right-click to add a Sub-Action
- Search above or right-click to add a Trigger
- Search to add trigger...
- Search24
- SelectedAction
- SelectedActionSubActions
- SelectedActionSubActions.Count
- SelectedActionTriggers
- SelectedActionTriggers.Count
- SelectedActionsCount
- SelectedTrigger
- ShowTriggerViewerCommand
- Source
- SubActionSuggestions
- TestTriggerCommand
- ToggleActionEnabledCommand
- ToggleSubActionEnabledCommand
- ToggleTriggerEnabledCommand
- TriggerCount
- TriggerSuggestions
- Triggers
- TriggersList
- Type
- Visible
- Window

#### pages/settings/backupspage（59 条）

- A description for your backup
- Backup
- Backup Folder
- Backup Now
- Backup Progress
- Backup Status
- BackupFolder
- Backups
- Backups currently available in your cloud storage
- BodyStrong
- BrowseForBackupFolderCommand
- Cloud Backups
- Cloud Backups are a supporter perk, and require you to be subscribed at the
- CloudBackupDescription
- CloudBackupProgress
- CloudIncludeAuthDb
- Create Backup
- Create Cloud Backup
- Create a backup and upload it to your cloud storage
- CreateBackupCommand
- CreateCloudBackupCommand
- Description
- Higher tiers gives you more storage space to hold more backups.
- Include auth.db
- IsCreatingCloudBackup
- IsOnlineBackupAvailable
- IsStreamerBotConnected
- Last backup: Never
- Last backup: {0:F}
- LastCloudBackupStatus
- LastLocalBackup
- Name
- No
- OpenUrlCommand
- Other Instances
- Patreon
- Secondary
- SelectedBackup
- SelectedOtherBackup
- Size
- Streamer.bot
- Streamer.bot Account
- Streamer.bot Cloud Backups
- Subtitle
- Support on Patreon
- TextFillColorSecondaryBrush
- Thank You
- The folder to save backups to
- This Instance
- Timestamp
- Version
- Whether or not to include your authentication keys in the backup
- Yes
- You are currently not subscribed to Patreon, subscribe on Patreon to the Thank You tier or higher and get access to Cloud Backups and more!
- https://streamer.bot/user/settings
- https://www.patreon.com/nate1280
- on the
- tier or higher on Patreon.
- website.

#### pages/settings/generalsettingspage（58 条）

- Action History
- Application Volume
- ApplicationVolume
- Audio
- Audio Output Device
- AudioOutputFallback
- BodyStrong
- BrowseForLogFolderCommand
- CSharpUseMonacoEditor
- CanLogLevelChange
- Changing the log folder requires a restart of Streamer.bot
- Changing these settings requires a restart of Streamer.bot
- Configure the default audio output device Streamer.bot uses
- Disable the tracking of Actions to reclaim performance
- Disabled
- Enable or disable the viewers tab to reclaim performance
- Enabled
- Execute C# Code Editor
- General
- Generate a new Instance Id for this instance of Streamer.bot
- Instance
- Instance Id
- InstanceId
- InstanceName
- Log Folder
- Log Level
- LogFolder
- LogLevels
- Logging
- Manually refresh audio output devices
- Name
- No
- Performance
- PerformanceActionHistoryEnabled
- PerformanceViewersTabEnabled
- Refresh
- RefreshAudioOutDevicesCommand
- Reset
- Reset the Instance Id for this instance of Streamer.bot
- ResetInstanceCommand
- Save
- SaveInstanceNameCommand
- Secondary
- SelectedLogLevel
- SelectedOutputDevice
- Subtitle
- The UUID for this instance of Streamer.bot
- The default volume applied to the Play Sound sub-actions and C# methods
- The folder to write logs to
- The logging level being used, this is locked to verbose in non-stable versions
- The name of this Streamer.bot instance
- Use Monaco Editor
- Use System Default
- Use the System Default audio device when the selected device above is not found
- Use the feature rich Monaco Editor for editing your C# code
- Viewers Tab
- Yes
- {0}%

#### pages/viewerspage（54 条）

- (in user list)
- (not in user list)
- 2,3
- Bits Donated
- Channel Points Spent
- Collapsed
- Data.CopyToClipboardCommand
- Data.SelectedViewer
- DataContext.SelectedBitsDonated
- DataContext.SelectedChannelPointsRedeemed
- DataContext.SelectedPyramidsMade
- DataContext.SelectedRaidsSent
- DataContext.SelectedRaidsTotalViewers
- DataContext.SelectedViewer
- DataContext.SelectedViewerGroupsText
- False
- Groups
- Hide Not Present
- HideNotPresent
- Id
- IsExempt
- IsKickUser
- IsSubscribed
- IsTwitchUser
- IsYouTubeUser
- Jewels Gifted
- Kicks Gifted
- Labels
- Last Active
- LastActive
- Login
- Name
- Platform
- Present
- Pyramids Made
- Raids
- Role
- RootPage
- Select a viewer from the list to view their information.
- SelectedViewer
- Subscribed
- Subtitle
- Timeout Exempt
- True
- Twitch
- User ID
- User Information
- Username
- Viewers
- Visible
- YouTube
- raids,
- total viewers
- {0:N0}

#### pages/integrations/elgatostreamdeckpage（52 条）

- Address
- Auto Connect
- Auto Reconnect
- Auto Start
- AutoStart
- Automatically connect to Elgato Stream Deck MCP when Streamer.bot starts up
- Automatically reconnect to Elgato Stream Deck MCP when the connection is terminated
- Automatically start the server when Streamer.bot starts up
- BodyStrong
- Collapsed
- Connect
- Connected
- ConnectedClients
- Connecting...
- Connection Status
- Connections
- Disconnect
- Disconnected
- Elgato Stream Deck instances that are currently connected
- Elgato StreamDeck
- Enter the IP address for this server to bind to. For example, '127.0.0.1'
- Enter the port to use for server connection. Defaults to 8059
- IpAddress
- IsEditable
- McpAutoConnect
- McpAutoReconnect
- McpCancelRetryCommand
- McpConnectCommand
- McpConnectionState
- McpDisconnectCommand
- McpRetryText
- Off
- On
- Port
- Retrying to connect
- Running
- RunningState
- Secondary
- Server Status
- Session ID
- SessionId
- Start Server
- StartServerCommand
- Starting...
- Stop Server
- StopServerCommand
- Stopped
- Stream Deck MCP Server
- This requires the Enable MCP Deck to be checked in your Stream Deck preferences.
- Title
- Version
- Visible

#### pages/dashboardpage（49 条）

- 1.0.0
- Actions
- Alpha Access
- BodyStrong
- Caption
- Commands
- Configure actions, queues and view action history
- Configure your streaming application settings
- Created by nate1280
- Discord
- Documentation
- Explore the official documentation for Streamer.bot
- Gain early access to new features and updates before they are released to the public.
- HasUpdate
- IconRow
- Ideas & Suggestions
- If you enjoy Streamer.bot, please consider supporting nate1280 on Patreon.
- Join the Streamer.bot community!
- Keep the updates coming!
- Manage your chat commands
- NavigateToCommand
- OpenUpdateDialogCommand
- OpenUrlCommand
- Platforms
- Receive access to additional supporter benefits, including Custom Webhooks and Cloud Backups!
- Secondary
- Share and discuss ideas for new features or improvements to Streamer.bot
- Show your Support
- Stream Apps
- Streamer.bot
- Streamer.bot {0}
- Support
- Support Streamer.bot on Patreon!
- Support on Patreon
- Supporter Perks
- TextFillColorSecondaryBrush
- TextRow
- TitleLarge
- Update Available!
- UpdateVersion
- Version
- View and modify your streaming platform settings
- Why donate?
- Your support helps keep Streamer.bot free for everyone, and shows your appreciation for the hard work that goes into maintaining and improving the application.
- Your support helps maintain continued development and ongoing improvements to Streamer.bot, ensuring it remains a powerful tool for streamers like you.
- http://discord.streamer.bot/
- http://docs.streamer.bot/
- http://ideas.streamer.bot/
- https://www.patreon.com/nate1280

#### pages/serverclients/httpserverpage（45 条）

- ...
- Add
- AddMappingCommand
- Address
- Auto Start
- AutoStart
- Automatically start the server when Streamer.bot starts up
- Available Endpoints
- BodyStrong
- BrowseForFolderCommand
- Collapsed
- Configuring HTTP Server
- Del
- Enter the IP address for this server to bind to. For example, '127.0.0.1'
- Enter the port to use for server connection. Defaults to 7474
- Folder
- Folder mappings for serving local files
- Help with HTTP Server
- HttpRequests
- Id
- Mappings
- Name
- NewMappingFolder
- NewMappingPath
- Off
- On
- Path
- Port
- Related Support
- RemoveMappingCommand
- Requests
- Requests received by the HTTP server
- Running
- RunningState
- Secondary
- SelectedMapping
- Server Status
- Start Server
- StartServerCommand
- Starting...
- Stop Server
- StopServerCommand
- Stopped
- Subtitle
- Visible

#### pages/serverclients/websocketserverpage（45 条）

- Address
- AuthEnabled
- AuthEnforce
- Authenticated
- Authentication
- Auto Start
- AutoStart
- Automatically start the server when Streamer.bot starts up
- Available Requests
- BodyStrong
- Clients that are currently connected
- Collapsed
- Connected Clients
- Disabled
- Enabled
- Endpoint
- Enforce
- Enter the IP address for this server to bind to. For example, '127.0.0.1'
- Enter the port to use for server connection. Defaults to 8080
- Help with WebSocket Server
- IsEditable
- No
- Off
- On
- Password
- Port
- Related Support
- Running
- RunningState
- Secondary
- Server Status
- Start Server
- StartServerCommand
- Starting...
- Stop Server
- StopServerCommand
- Stopped
- Subscriptions
- Subtitle
- The endpoint that the WebSocket server listens on
- The password required for authentication
- Visible
- Wether or not to enforce authentication for all requests, or just priviledged
- Whether or not the WebSocket server requires authentication to connect
- Yes

#### pages/voicecontrol/voicecontrolsettingspage（43 条）

- Audio Input Device
- Auto Start Listen
- AutoStart
- Automatically start listening for voice commands when Streamer.bot starts
- Available Sub-Actions
- Available Triggers
- BodyStrong
- Collapsed
- Confidence Threshold
- ConfidenceThreshold
- Configure the device to use for speech recognition
- Configuring Voice Control
- Disabled
- Enabled
- Help with Voice Control
- Listening
- Listening Status
- Locale
- Locales
- Log Speech to Text Dictation
- LogSpokenText
- Manually refresh audio input devices
- Off
- On
- Refresh
- RefreshAudioInDevicesCommand
- Related Support
- RunningState
- Secondary
- SelectedAudioInputDevice
- SelectedLocale
- Settings
- Start Listening
- StartListeningCommand
- Starting...
- Stop Listening
- StopListeningCommand
- Stopped
- Subtitle
- The confidence the speech engine must have in its recognition
- The locale to use for speech recognition
- Visible
- Whether or not to log any speech to text dication

#### pages/integrations/throwingsystempage（37 条）

- Address
- Auto Connect
- Auto Reconnect
- AutoConnect
- AutoReconnect
- Automatically connect to Throwing System when Streamer.bot starts up
- Automatically reconnect to Throwing System when the connection is terminated
- BodyStrong
- Collapsed
- Connect
- Connected
- Connecting...
- Disconnect
- Disconnected
- Enter the IP address to connect to. For example, '127.0.0.1'
- Enter the port to use for the connection. Defaults to 42069
- Events Client
- EventsCancelRetryCommand
- EventsConnectCommand
- EventsConnectionState
- EventsDisconnectCommand
- EventsRetryText
- IsEditable
- Off
- On
- Port
- Retrying to connect
- Secondary
- Services
- Throwing System
- Visible
- Websocket Client
- WebsocketCancelRetryCommand
- WebsocketConnectCommand
- WebsocketConnectionState
- WebsocketDisconnectCommand
- WebsocketRetryText

#### pages/streamapps/obsstudiopage（36 条）

- Add
- AddCommand
- Auto Connect
- Collapsed
- Connections
- Current Scene
- CurrentScene
- CurrentSources
- Data
- Data.AddCommand
- Data.UpdateAllActionsToDefaultCommand
- DeleteCommand
- EditCommand
- Host
- IsRecording
- IsSelectionConnected
- IsStreaming
- NOT Recording!
- NOT Streaming!
- OBS Information
- OBS Studio
- ObsList
- Reconnect
- Recording!
- Retry
- Select an OBS Connection
- SelectedConnection
- SelectedConnection.Name
- Sources
- Status
- Stream Status
- Streaming!
- True
- Update All Actions To Use Default
- Visible
- {0} is NOT connected!

#### pages/streamapps/meldstudiopage（35 条）

- Add
- AddCommand
- Auto Connect
- Collapsed
- Connections
- Current Scene
- CurrentScene
- CurrentSources
- Data.AddCommand
- Data.UpdateAllActionsToDefaultCommand
- DeleteCommand
- EditCommand
- Host
- IsRecording
- IsSelectionConnected
- IsStreaming
- Meld Studio
- Meld Studio Information
- MeldList
- NOT Recording!
- NOT Streaming!
- Reconnect
- Recording!
- Retry
- Select a Meld Studio Connection
- SelectedConnection
- SelectedConnection.Name
- Sources
- Status
- Stream Status
- Streaming!
- True
- Update All Actions To Use Default
- Visible
- {0} is NOT connected!

#### pages/streamapps/streamlabsdesktoppage（35 条）

- Add
- AddCommand
- Auto Connect
- Collapsed
- Connections
- Current Scene
- CurrentScene
- CurrentSources
- Data.AddCommand
- Data.UpdateAllActionsToDefaultCommand
- DeleteCommand
- EditCommand
- Host
- IsRecording
- IsSelectionConnected
- IsStreaming
- NOT Recording!
- NOT Streaming!
- Reconnect
- Recording!
- Retry
- Select a Streamlabs Desktop Connection
- SelectedConnection
- SelectedConnection.Name
- Sources
- Status
- Stream Status
- Streaming!
- Streamlabs Desktop
- Streamlabs Desktop Information
- StreamlabsList
- True
- Update All Actions To Use Default
- Visible
- {0} is NOT connected!

#### pages/integrations/streamelementspage（34 条）

- Account
- AccountCanLogin
- AccountCanLogout
- AccountForgetCommand
- AccountIsLoggedIn
- AccountLoginCommand
- AccountLogoutCommand
- AccountProfileUrl
- AccountSubText
- Accounts
- BodyStrong
- Client
- ClientCancelRetryCommand
- ClientConnectCommand
- ClientDisconnectCommand
- ClientRetryCountDown
- ClientState
- Collapsed
- Connect
- Connect your StreamElements account to receive events
- Connecting...
- Disconnect
- False
- Forget
- Forget this account?
- Login
- Logout
- Retrying
- Secondary
- Services
- StreamElements
- Subtitle
- True
- Visible

#### pages/integrations/streamlabspage（34 条）

- Account
- AccountCanLogin
- AccountCanLogout
- AccountForgetCommand
- AccountIsLoggedIn
- AccountLoginCommand
- AccountLogoutCommand
- AccountProfileUrl
- AccountSubText
- Accounts
- BodyStrong
- Client
- ClientCancelRetryCommand
- ClientConnectCommand
- ClientDisconnectCommand
- ClientRetryCountDown
- ClientState
- Collapsed
- Connect
- Connect your Streamlabs account to receive events
- Connecting...
- Disconnect
- False
- Forget
- Forget this account?
- Login
- Logout
- Retrying
- Secondary
- Services
- Streamlabs
- Subtitle
- True
- Visible

#### pages/integrations/vtubestudiopage（34 条）

- Address
- Auto Connect
- Auto Reconnect
- AutoConnect
- AutoReconnect
- Automatically connect to VTubeStudio when Streamer.bot starts up
- Automatically reconnect to VTubeStudio when the connection is terminated
- BodyStrong
- CancelRetryCommand
- Collapsed
- Connect
- ConnectCommand
- Connected
- Connecting...
- Connection Status
- ConnectionState
- Disconnect
- DisconnectCommand
- Disconnected
- Enter the IP address to connect to. For example, '127.0.0.1'
- Enter the port to use for the connection. Defaults to 42069
- Forget
- Forget Account
- Forget any saved credentials for VTubeStudio
- ForgetCommand
- IsEditable
- Off
- On
- Port
- RetryText
- Retrying to connect
- Secondary
- VTube Studio
- Visible

#### pages/integrations/elgatowavelinkpage（32 条）

- Auto Connect
- Auto Reconnect
- AutoConnect
- AutoReconnect
- Automatically connect to Elgato WaveLink when Streamer.bot starts up
- Automatically reconnect to Elgato WaveLink when the connection is terminated
- Available Sub-Actions
- Available Triggers
- BodyStrong
- CancelRetryCommand
- Collapsed
- Configuring Elgato WaveLink
- Connect
- ConnectCommand
- Connected
- Connecting...
- Connection Status
- ConnectionState
- Disconnect
- DisconnectCommand
- Disconnected
- Elgato WaveLink
- Help with Elgato WaveLink
- Off
- On
- Related Support
- RetryText
- Retrying to connect
- Secondary
- Subtitle
- The Elgato WaveLink integration only supports WaveLink version 2.x, it will not work with 3.x
- Visible

#### pages/integrations/treatstreampage（31 条）

- Account
- AccountCanLogin
- AccountCanLogout
- AccountForgetCommand
- AccountLoginCommand
- AccountLogoutCommand
- AccountSubText
- Accounts
- BodyStrong
- Client
- ClientCancelRetryCommand
- ClientConnectCommand
- ClientDisconnectCommand
- ClientRetryCountDown
- ClientState
- Collapsed
- Connect
- Connect your TreatStream account to receive events
- Connecting...
- Disconnect
- Forget
- Forget this account?
- Login
- Logout
- Retrying
- Secondary
- Services
- Subtitle
- TreatStream
- True
- Visible

#### pages/integrations/elgatocamerahubpage（30 条）

- Auto Connect
- Auto Reconnect
- AutoConnect
- AutoReconnect
- Automatically connect to Elgato CameraHub when Streamer.bot starts up
- Automatically reconnect to Elgato CameraHub when the connection is terminated
- BodyStrong
- CancelRetryCommand
- Collapsed
- Configuring Elgato CameraHub
- Connect
- ConnectCommand
- Connected
- Connecting...
- Connection Status
- ConnectionState
- Disconnect
- DisconnectCommand
- Disconnected
- Elgato CameraHub
- Help with Elgato CameraHub
- Off
- On
- Related Support
- RetryText
- Retrying to connect
- Secondary
- Subtitle
- The Elgato CameraHub integration requires a minimum CameraHub version of 2.0.0.5721
- Visible

#### pages/platforms/twitch/twitchsubcounterpage（29 条）

- A rollover will happen when this value is reached
- BodyStrong
- BrowseForFileCommand
- CancelSubCounterEditCommand
- Disabled
- EditingSubCounterValue
- Enable automatic roll over once the subsction count reaches a set number
- Enable the Sub Counter for tracking of subscriptions and rollovers
- Enabled
- Output File
- Output Text
- OutputFilename
- OutputText
- Reset
- Reset Sub Counter
- Reset sub-counter and rollover counters, this can not be undone
- ResetSubCounterCommand
- Rollover
- Rollover Value
- RolloverEnabled
- RolloverValue
- Secondary
- Sub Counter
- SubCounter
- SubCounterValue
- The current value of the sub counter
- The file to write the sub-counter data to
- The output template to use when writing to the file specified above
- ToggleSubCounterEditCommand

#### pages/platforms/twitch/twitchvideopage（29 条）

- All
- Archive
- Broadcaster
- Copy All Video Urls to Clipboard
- Created At
- CreatedAt
- Data.CopyAllVideoUrlsCommand
- Data.SaveAllToCsvCommand
- Data.SelectBroadcasterCommand
- Duration
- Filter
- Found {0} videos
- Highlight
- Save All to CSV
- Search
- SearchVideosCommand
- Searching
- SelectUserCommand
- SelectedItem
- SelectedType
- Title
- Type
- Upload
- User
- UserFilter
- Videos
- Videos.Count
- View Count
- ViewCount

#### pages/integrations/donordrivecontrolpage（27 条）

- Add
- Amount
- Auto Monitor
- CampaignDonations
- CampaignGoal
- CampaignName
- CampaignRaised
- Campaigns
- Data.AddDonorDriveCommand
- Data.StopAllClientsCommand
- Date/Time
- DeleteDonorDriveCommand
- Donations
- Donor
- DonorDrive
- DonorDriveId
- DonorName
- ID
- Monitoring
- Name
- Raised/Goal
- SelectedCampaign
- SelectedDonation
- Stop All Clients
- Team Member
- Type
- {0:C2}

#### pages/integrations/speakerbotpage（27 条）

- Address
- AutoConnect
- AutoReconnect
- Automatically connect to Speaker.bot when Streamer.bot starts up
- Automatically reconnect to Speaker.bot when the connection is terminated
- BodyStrong
- CancelRetryCommand
- Collapsed
- Connect
- ConnectCommand
- Connected
- Connecting...
- Connection Status
- ConnectionState
- Disconnect
- DisconnectCommand
- Disconnected
- Endpoint
- Enter the IP address Speaker.bot's WebSocket server is running on, '127.0.0.1'
- Enter the port Speaker.bot's WebSocket server is running on. Defaults to 7580
- Port
- RetryText
- Retrying to connect
- Secondary
- Speaker.bot
- The endpoint Speaker.bot uses, default is /
- Visible

#### pages/streamapps/polypoppage（27 条）

- Address
- Auto Start
- AutoStart
- Automatically start the server when Streamer.bot starts up
- BodyStrong
- CanStart
- CanStop
- Collapsed
- Endpoint
- Enter the IP address for this server to bind to. For example, '127.0.0.1'
- Enter the endpoint to listen to for the connection.  Defaults to '/'
- Enter the port to use for server connection. Defaults to 9652
- IsEditable
- Off
- On
- PolyPop
- Port
- Secondary
- Server Status
- Start Server
- StartServerCommand
- StatusText
- Stop Server
- StopServerCommand
- Stopped
- True
- Visible

#### pages/integrations/pulsoidpage（26 条）

- Auto Connect
- Auto Reconnect
- AutoConnect
- AutoReconnect
- Automatically connect to Pulsoid when Streamer.bot starts up
- Automatically reconnect to Pulsoid when the connection is terminated
- BodyStrong
- Collapsed
- Connect
- ConnectCommand
- Connected
- Connecting...
- Connection Status
- ConnectionState
- Disconnect
- DisconnectCommand
- Disconnected
- Forget
- Forget Account
- Forget any saved credentials for Pulsoid
- ForgetCommand
- Off
- On
- Pulsoid
- Secondary
- Visible

#### pages/integrations/tipeeestreampage（26 条）

- Auto Connect
- Auto Reconnect
- AutoConnect
- AutoReconnect
- Automatically connect to TipeeeStream when Streamer.bot starts up
- Automatically reconnect to TipeeeStream when the connection is terminated
- BodyStrong
- Collapsed
- Connect
- ConnectCommand
- Connected
- Connecting...
- Connection Status
- ConnectionState
- Disconnect
- DisconnectCommand
- Disconnected
- Forget
- Forget Account
- Forget any saved credentials for TipeeeStream
- ForgetCommand
- Off
- On
- Secondary
- TipeeeStream
- Visible

#### pages/midi/midiinpage（26 条）

- Add
- AddEventCommand
- AddMidiCommand
- Auto Open
- Channel
- Command Type
- Data
- Data.AddEventCommand
- DeleteEventCommand
- DeleteMidiCommand
- Device Name
- DeviceName
- Devices
- EditEventCommand
- EditMidiCommand
- Enabled
- Events
- MIDI In
- MidiEventList
- MidiInList
- Name
- Reconnect
- SelectedDevice
- SelectedEvent
- Status
- ToggleEventEnabledCommand

#### pages/settings/groupspage（26 条）

- Add
- Add Group
- Add Multiple Twitch Users to Group
- Add User to
- Add Users
- AddGroupCommand
- AddUserToGroupCommand
- AddUsersToGroupCommand
- AddingUsers
- Bots
- ClearGroupCommand
- CopySelectedUsersCommand
- DeleteGroupCommand
- Groups
- Name
- NewGroupBots
- NewGroupName
- Remove All
- RemoveUserFromGroupCommand
- SelectedGroup
- SelectedGroup.Name
- SelectedUserInGroup
- Users
- UsersAddedCount
- UsersToAdd
- UsersToAddCount

#### pages/settings/settingspage（26 条）

- Add common C# reference
- Add, edit and delete user groups
- Backups
- Basic settings related to Streamer.bot
- BodyStrong
- C# Compile Settings
- Change backup settings, and force backup creation
- Change settings.
- Configure default options when creating new Actions, Commands and other
- Defaults
- General Settings
- Groups
- Handle all things variables
- HasUpdate
- Labs
- Manage different aspects of Streamer.bot's UI
- NavigateToCommand
- OpenUpdateDialogCommand
- PlatformsPage
- Secondary
- Streamer.bot {0} is available!
- Update Available
- UpdateVersion
- User Interface
- Variables
- Want to try out experimental features, can enable them here

#### pages/integrations/hyperateiopage（25 条）

- Add your HypeRate ID (CaSe SenSITiVe!!!!)
- Auto Connect
- Auto Reconnect
- AutoConnect
- AutoReconnect
- Automatically connect to HypeRate.io when Streamer.bot starts up
- Automatically reconnect to HypeRate.io when the connection is terminated
- BodyStrong
- Collapsed
- Connect
- ConnectCommand
- Connected
- Connecting...
- Connection Status
- ConnectionState
- Disconnect
- DisconnectCommand
- Disconnected
- HypeRate ID
- HypeRate.io
- Id
- Off
- On
- Secondary
- Visible

#### pages/integrations/lumiastreampage（25 条）

- Auto Connect
- Auto Reconnect
- AutoConnect
- AutoReconnect
- Automatically connect to Lumia Stream when Streamer.bot starts up
- Automatically reconnect to Lumia Stream when the connection is terminated
- BodyStrong
- Caption
- Collapsed
- Connect
- ConnectCommand
- Connected
- Connecting...
- Connection Status
- ConnectionState
- Copy and paste your token in this field
- Disconnect
- DisconnectCommand
- Disconnected
- Lumia Stream
- Off
- On
- Secondary
- Token
- Visible

#### pages/integrations/voicemodpage（25 条）

- Auto Connect
- Auto Reconnect
- AutoConnect
- AutoReconnect
- Automatically connect to VoiceMod when Streamer.bot starts up
- Automatically reconnect to VoiceMod when the connection is terminated
- BodyStrong
- CancelRetryCommand
- Collapsed
- Connect
- ConnectCommand
- Connected
- Connecting...
- Connection Status
- ConnectionState
- Disconnect
- DisconnectCommand
- Disconnected
- Off
- On
- RetryText
- Retrying to connect
- Secondary
- Visible
- VoiceMod

#### pages/integrations/crowdcontrolpage（24 条）

- Auto Connect
- Auto Reconnect
- AutoConnect
- AutoReconnect
- Automatically connect to CrowdControl when Streamer.bot starts up
- Automatically reconnect to CrowdControl when the connection is terminated
- BodyStrong
- Collapsed
- Connect
- ConnectCommand
- Connected
- Connecting...
- Connection Status
- ConnectionState
- Copy and paste your Overlay URL in this field
- Crowd Control
- Disconnect
- DisconnectCommand
- Disconnected
- Off
- On
- Overlay URL
- Secondary
- Visible

#### pages/integrations/pallyggpage（24 条）

- API Key
- Auto Connect
- Auto Reconnect
- AutoConnect
- AutoReconnect
- Automatically connect to Pally.gg when Streamer.bot starts up
- Automatically reconnect to Pally.gg when the connection is terminated
- BodyStrong
- Collapsed
- Connect
- ConnectCommand
- Connected
- Connecting...
- Connection Status
- ConnectionState
- Copy and paste your API Key in this field
- Disconnect
- DisconnectCommand
- Disconnected
- Off
- On
- Pally.gg
- Secondary
- Visible

#### pages/integrations/streamfogpage（24 条）

- Auto Connect
- Auto Reconnect
- AutoConnect
- AutoReconnect
- Automatically connect to Streamfog when Streamer.bot starts up
- Automatically reconnect to Streamfog when the connection is terminated
- BodyStrong
- Collapsed
- Connect
- ConnectCommand
- Connected
- Connecting...
- Connection Status
- ConnectionState
- Copy and paste your remote key in this field
- Disconnect
- DisconnectCommand
- Disconnected
- Off
- On
- Remote Key
- Secondary
- Streamfog
- Visible

#### pages/integrations/streamlootspage（24 条）

- Alerts Widget URL
- Auto Connect
- Auto Reconnect
- AutoConnect
- AutoReconnect
- Automatically connect to StreamLoots when Streamer.bot starts up
- Automatically reconnect to StreamLoots when the connection is terminated
- BodyStrong
- Collapsed
- Connect
- ConnectCommand
- Connected
- Connecting...
- Connection Status
- ConnectionState
- Copy and paste your Alerts Widget URL in this field
- Disconnect
- DisconnectCommand
- Disconnected
- Off
- On
- Secondary
- StreamLoots
- Visible

#### pages/platforms/kick/kickchannelpointrewardspage（24 条）

- Channel Point Rewards
- Collapse All
- CopyIdToClipboardCommand
- Cost
- Create Reward
- CreateCommand
- Data.CollapseAllCommand
- Data.CreateCommand
- Data.ExpandAllCommand
- Data.RefreshRewardsCommand
- DeleteCommand
- DuplicateCommand
- EditCommand
- Enabled
- Expand All
- KickRewardsList
- Options
- Paused
- Refresh from Kick
- Rewards
- SelectedReward
- Title
- ToggleEnabledCommand
- TogglePausedCommand

#### pages/platforms/twitch/twitchchannelpointrewardspage（24 条）

- Channel Point Rewards
- Collapse All
- CopyIdToClipboardCommand
- Cost
- Create Reward
- CreateCommand
- Data.CollapseAllCommand
- Data.CreateCommand
- Data.ExpandAllCommand
- DeleteCommand
- DuplicateCommand
- EditCommand
- Enabled
- Expand All
- Name
- Options
- Owned
- Paused
- Reward Name
- Rewards
- SelectedReward
- ToggleEnabledCommand
- TogglePausedCommand
- TwitchRewardsList

#### pages/aboutpage（23 条）

- A very special thanks to the following people who believed in me and this project.
- Also a nod to all those supporters past and present who are not listed above
- Body
- BodyStrong
- Caption
- Created by: nate1280
- Dedicated to the loving memory of my mother.
- Discord
- I also can not forget giving a nod to the following people
- I can not foget to thank the following who are on Streamer.bot's staff, providing support in the discord
- Ko-fi
- May you rest in peace; you will be missed. 1954-2021
- NodList
- Patreon
- Patreon Supporters
- PatreonList
- StaffList
- Streamer.bot
- Thank you to the following supporters on Patreon:
- ThanksList
- TitleLarge
- Twitch
- Your stream, your rules—made better with Streamer.bot

#### pages/platforms/youtube/youtubebroadcastspage（23 条）

- Broadcast Information
- Broadcasts
- Categories
- Category
- Description
- Monitored
- Privacy
- Reset the information back to what the broadcast has
- Revert
- RevertChangesCommand
- Save
- Save the information for the broadcast
- SaveChangesCommand
- SelectedBroadcast
- SelectedCategory
- SelectedDescription
- SelectedPrivacy
- SelectedTitle
- Status
- Tags
- Title
- Title (required)
- YouTubeBroadcastList

#### pages/services/servicespage（23 条）

- BodyStrong
- Configure options for the Credits service
- Create folder/file watchers to react to file changes
- Credits
- File Tail
- File/Folder Watcher
- NavigateToCommand
- Process Watcher
- Quotes
- Receive events when applications on your computer start and/or stop!
- Secondary
- See the quotes that have been added, as well as add custom ones, or edit/delete existing.
- Services
- Setup a tail on a file and react to changes in realtime.
- Setup recurring timers.
- ShowCredits
- ShowFileFolderWatcher
- ShowFileTails
- ShowProcessWatcher
- ShowQuotes
- ShowTimers
- Start, stop or alter built in Services.
- Timers

#### pages/commandspage（22 条）

- Add
- AddCommand
- Collapse All
- CollapseAllCommand
- Command
- CommandView
- CommandsList
- CopyIdToClipboardCommand
- Data.Group
- DeleteCommandsCommand
- Enabled
- Expand All
- ExpandAllCommand
- Filter
- GCD
- Location
- Name
- Options
- RenameGroupCommand
- SelectedCommand
- ToggleEnabledCommand
- UCD

#### pages/serverclients/udpserverpage（22 条）

- Auto Start
- AutoStart
- Automatically start the server when Streamer.bot starts up
- BodyStrong
- CanStart
- CanStop
- Collapsed
- Enter the port to use for server connection. Defaults to 4242
- IsEditable
- Off
- On
- Port
- Secondary
- Server Status
- Start Server
- StartCommand
- StatusText
- Stop Server
- StopCommand
- Stopped
- True
- Visible

#### pages/services/processwatcherpage（22 条）

- Auto Start
- AutoStart
- Automatically start the Process Watcher when Streamer.bot starts up
- BodyStrong
- CanStart
- CanStop
- Collapsed
- IsStarting
- Off
- On
- Process Watcher
- Secondary
- Service Status
- Start
- StartCommand
- Starting...
- StatusText
- Stop
- StopCommand
- Stopped
- True
- Visible

#### pages/queuespage（20 条）

- Add
- AddQueueCommand
- Blocking
- Completed Count
- CompletedCount
- DeleteQueueCommand
- EditQueueCommand
- Name
- Pause All Queues
- PauseAllQueuesCommand
- Paused
- Pending Count
- PendingCount
- QueueList
- Queues
- Resume All Queues
- ResumeAllQueuesCommand
- SelectedQueue
- ToggleQueueBlockingCommand
- ToggleQueuePauseCommand

#### pages/serverclients/serverclientspage（20 条）

- BodyStrong
- Create your own WebSocket Servers and manage them from within C#
- Create your own connections to WebSocket Servers and control them from within C#
- Custom WebSocket Clients
- Custom WebSocket Servers
- Enable integrations beyond the UI with Streamer.bot's build in WebSocket server.
- HTTP Server
- Manage network services
- NavigateToCommand
- Provide various URL endpoints for interacting with Streamer.bot
- Secondary
- ServerClients
- ShowCustomWebsocketClients
- ShowCustomWebsocketServers
- ShowHttpServer
- ShowUdpServer
- ShowWebsocketServer
- Start a UDP server and react to incoming UDP packets
- UDP Server
- WebSocket Server

#### pages/platforms/twitch/twitchcustompowerupspage（19 条）

- Bits Cost
- Collapse All
- CopyIdToClipboardCommand
- Custom Power-Ups
- CustomPowerUps
- Data.CollapseAllCommand
- Data.ExpandAllCommand
- Data.RefreshCustomPowerUpsCommand
- Enabled
- Expand All
- Not all API endpoints/EventSub events have been implemented by Twitch yet. Some features may currently be missing, once they are added on Twitch's side, they will be updated for Streamer.bot's usage.
- Options
- Paused
- Refresh
- Refresh from Twitch
- SelectedCustomPowerUp
- Title
- Twitch Custom Power-Ups are a beta feature that not everyone has access to.
- TwitchCustomPowerUpsList

#### pages/actionhistorypage（18 条）

- Clear History
- ClearHistoryCommand
- Completed At
- CompletedAt
- Duration
- HistoryList
- How long it took for the action to run, this is in milliseconds
- Name
- Queue
- QueueName
- Queued At
- QueuedAt
- SelectedCompletedAction
- Started At
- StartedAt
- State
- Variables
- VariablesAfterRun

#### pages/platforms/twitch/twitchpredictionspage（18 条）

- Data.IsPredictionRunning
- Data.NewPredictionCommand
- Data.RefreshCommand
- Duration
- IsAuthenticated
- IsRefreshing
- New Prediction
- Outcomes
- Points
- Predictions
- Refresh Predictions from Twitch
- Selected Prediction
- SelectedPrediction
- State
- Title
- TwitchPredictionsList
- Users
- Winner

#### pages/services/quotespage（18 条）

- Add
- AddQuoteCommand
- Category
- Data.AddQuoteCommand
- Data.Quotes.Count
- Data.ReindexQuotesCommand
- DeleteQuoteCommand
- EditQuoteCommand
- Filter
- ID
- Platform
- Quote
- QuoteList
- Quotes
- Re-index
- SelectedQuote
- Timestamp
- User

#### pages/platforms/twitch/twitchpollspage（17 条）

- Choices
- Data.IsPollRunning
- Data.NewPollCommand
- Data.RefreshCommand
- Duration
- IsAuthenticated
- IsRefreshing
- New Poll
- Polls
- Refresh Polls from Twitch
- Selected Poll
- SelectedPoll
- State
- Title
- TwitchPollsList
- Votes
- Winner

#### pages/streamapps/streamappspage（17 条）

- A game engine for your live streams
- Add, edit and manage Streamlabs Desktop instances
- An up and coming heavy weight
- BodyStrong
- Meld Studio
- NavigateToCommand
- OBS Studio
- Pick your favorite streamming application, get it connected, and start creating!
- PolyPop
- Secondary
- ShowMeldStudio
- ShowObsStudio
- ShowPolyPop
- ShowStreamlabsDesktop
- StreamApps
- Streamlabs Desktop
- The defacto standard for streaming

#### pages/voicecontrol/voicecontrolcommandspage（16 条）

- Add
- Command
- Commands
- Data.AddCommand
- DeleteCommand
- Enabled
- Location
- MoveDownCommand
- MoveToBottomCommand
- MoveToTopCommand
- MoveUpCommand
- Name
- SelectedCommand
- Stop After
- ToggleEnabledCommand
- VoiceCommandList

#### pages/actionslandingpage（14 条）

- Action History
- Actions
- BodyStrong
- HideHistory
- NavigateToCommand
- Pending Actions
- PlatformsPage
- Queues
- Queues keep the Actions flowing, or stopped when needed
- Secondary
- See Streamer.bot work, view and inspect variables of actions that are currently being run
- See actions that have finished, and learn more about if they succeeded, what variables were available, etc
- The core of Streamer.bot
- The heart of Streamer.bot, Actions are what defines what can happen and when

#### pages/midi/midioutpage（14 条）

- Add
- AddMidiCommand
- Auto Open
- DeleteMidiCommand
- Device Name
- DeviceName
- Devices
- EditMidiCommand
- MIDI Out
- MidiOutList
- Name
- Reconnect
- SelectedDevice
- Status

#### pages/platforms/platformspage（14 条）

- BodyStrong
- Kick
- Login to your Kick account, and adjust settings.
- Login to your Twitch account, manage Chanel Rewards, Poll and Predictions, and settings.
- Login to your YouTube account, see your broadcasts, and alter settings.
- NavigateToCommand
- Pick your platform of choice to interact with your viewers.
- Platforms
- Secondary
- ShowKick
- ShowTwitch
- ShowYouTube
- Twitch
- YouTube

#### pages/services/timerspage（14 条）

- Add
- AddCommand
- Data.AddCommand
- DeleteCommand
- EditCommand
- Enabled
- Interval
- Lines
- Name
- Repeat
- SelectedTimer
- TimerList
- Timers
- ToggleEnabledCommand

#### pages/settings/variablespage（14 条）

- 1. Global Variable Viewer
- 2. Action History Variable Inspecting
- Add
- AddKeywordCommand
- Del
- Mask Variable Containing
- MaskVariables
- MaskedKeywords
- NewKeyword
- RemoveKeywordCommand
- SelectedKeyword
- Variable Masking
- Variables
- Variables that contain these words will have their values masked with * in the following areas:

#### pages/voicecontrol/voicecontrolpage（14 条）

- BodyStrong
- Commands
- Create, edit, and remove Voice Control Commands
- Log
- Modify settings related to Voice Control
- NavigateToCommand
- Secondary
- Settings
- ShowCommands
- ShowLog
- ShowSettings
- View a list of what Voice Control has been hearing
- Voice Control related settings
- VoiceControl

#### pages/pendingactionspage（12 条）

- Enabled
- Name
- PendingList
- Queue
- QueueName
- Queued At
- QueuedAt
- SelectedQueuedAction
- Started At
- StartedAt
- State
- Variables

#### pages/midi/midipage（11 条）

- BodyStrong
- Create, edit and remove your output MIDI device associations
- Create, edit, and remove your MIDI Input associations and events
- MIDI In
- MIDI Out
- Midi
- Modify your MIDI settings here.
- NavigateToCommand
- Secondary
- ShowMidiIn
- ShowMidiOut

#### pages/serverclients/customwebsocketclientspage（11 条）

- Add
- Auto Connect
- AutoConnect
- Clients
- Data.AddCommand
- DeleteCommand
- Host
- Reconnect
- Retry
- SelectedClient
- Status

#### pages/services/creditspage（11 条）

- Auto Reset
- Credits
- CreditsAutoResetHours
- EventItems
- Events to Record
- GroupItems
- Reset
- ResetCreditsCommand
- TopItems
- Track Top
- User Present (spoke)

#### pages/services/filetailspage（11 条）

- Add
- Data.AddCommand
- DeleteCommand
- Enabled
- File Path
- File Tails
- FilePath
- FileTailList
- FileTails
- Name
- SelectedFileTail

#### pages/integrations/streamerbotwebsitepage（10 条）

- AccountAuthenticated
- BodyStrong
- Connected
- Instances
- Login to your Streamer.bot account in the bottom-left corner
- Name
- RemoteInstances
- Streamer.bot Website
- Streamer.bot instances that have been seen by your account
- Version

#### pages/services/filefolderwatcherpage（10 条）

- Add
- Data.AddCommand
- DeleteCommand
- Enabled
- File/Folder Watcher
- FileFolderWatcherList
- Filter
- Folder
- SelectedWatcher
- Watchers

#### pages/settings/compilersettingspage（10 条）

- Add reference from file...
- AddReferenceCommand
- Any references added to the common references list above will be automatically added to every Execute C# code when it's compiled
- C# Compiler
- Common References
- CommonReferences
- DeleteReferenceCommand
- Making Changes to this list will not invalidate any currently compiled Execute C# Code sub-actions
- SelectedCommonReference
- Subtitle

#### pages/serverclients/customwebsocketserverspage（9 条）

- Add
- Auto Start
- AutoStart
- Data.AddCommand
- DeleteCommand
- Host
- SelectedServer
- Servers
- Status

#### pages/settings/labspage（7 条）

- A caveat to note, due to the nature of serializing/deserializing, not all data types will preserved. Ones that I am aware of are List<T> objects, these will become object[] arrays when loaded.
- A restart is REQUIRED after enabling or disabling this labs feature.
- Enable
- EnablePendingActionCache
- Labs
- Pending Action Cache
- This feature is very experimental, and I need feedback on it, for options, capabilities, etc.

#### pages/voicecontrol/voicecontrollogpage（4 条）

- Clear
- ClearEntriesCommand
- Log
- LogEntries

#### pages/integrations/integrationspage（2 条）

- IntegrationsContainer
- Items

### 独立窗口

#### windows/importwindow（83 条）

- -1
- Actions
- Author
- Auto Connect
- Auto Start
- Blocking
- CanImport
- Cancel
- CancelCommand
- Clear
- ClearCommand
- Command
- CommandTrigger
- Commands
- Data.ExcludeAllActionsCommand
- Data.ExcludeAllCommandsCommand
- Data.ExcludeAllTimersCommand
- Data.ExcludeAllWebsocketClientsCommand
- Data.ExcludeAllWebsocketServersCommand
- Description
- Details
- Enabled
- Exclude all commands from import
- Exclude all from Import
- Exclude all timed actions from import
- Exclude all websocket clients from import
- Exclude all websocket servers from import
- Exists
- Export Version
- ExportActions
- ExportAuthor
- ExportCommands
- ExportDescription
- ExportName
- ExportQueues
- ExportTimedActions
- ExportVersion
- ExportWebsocketClients
- ExportWebsocketServers
- GCD
- HasExecuteCode
- Import
- Import String
- Import contains custom C# code. Ensure you trust the author and source of this import!
- ImportCommand
- ImportDragDropCommand
- ImportPreviewDragEnterCommand
- ImportText
- ImportTextError
- Include
- Interval
- Lines
- Location
- Name
- Options
- PreviewDragEnter
- PreviewDragOver
- PreviewDrop
- Queue
- QueueName
- Queues
- Reconnect
- Retry
- SelectedQueue
- Self
- ShowActions
- ShowCommands
- ShowQueues
- ShowTimedActions
- ShowWebsocketClients
- ShowWebsocketServers
- Streamer.bot Version
- StreamerBotVersion
- TabControl
- Timers
- Title
- TitleBar
- Triggers
- True
- UCD
- Websocket Clients
- Websocket Server
- Window

#### windows/exportwindow（64 条）

- Actions ({0})
- Author
- Auto Connect
- Auto Start
- Blocking
- Clear
- ClearCommand
- Clicking export will export your selected Actions, Queues, Commands, Timed Actions, Websocket Servers and Websocket Clients to your clipboard, and you can share them everywhere.
- Close
- CloseCommand
- Closing
- Command
- CommandTrigger
- Commands ({0})
- Data.ClearActionsFromExportCommand
- Data.ClearCommandsFromExportCommand
- Data.ClearTimedActionsFromExportCommand
- Data.ClearWebsocketClientsFromExportCommand
- Data.ClearWebsocketServersFromExportCommand
- Description
- Enabled
- Export to Clipboard
- Export to File
- ExportActions
- ExportActions.Count
- ExportAuthor
- ExportCommands
- ExportCommands.Count
- ExportDescription
- ExportName
- ExportQueues
- ExportQueues.Count
- ExportTimedActions
- ExportTimedActions.Count
- ExportToClipboardCommand
- ExportToFileCommand
- ExportVersion
- ExportWebsocketClients
- ExportWebsocketClients.Count
- ExportWebsocketServers
- ExportWebsocketServers.Count
- Interval
- Lines
- Location
- Name
- Options
- Queue
- QueueName
- Queues ({0})
- Reconnect
- Remove all actions from export
- Remove all commands from export
- Remove all websocket clients from export
- Remove all websocket servers from export
- Retry
- Timed Actions ({0})
- Title
- TitleBar
- Triggers
- Version
- Websocket Clients ({0})
- Websocket Servers ({0})
- Window
- WindowClosingCommand

#### windows/globalvariableviewerwindow（56 条）

- Add User
- Add Variable
- AddNonPersistedGlobalVariableCommand
- AddNonPersistedUserCommand
- AddPersistedGlobalVariableCommand
- AddPersistedUserCommand
- Closing
- Collapsed
- Data.ShowLastWriteColumn
- Delete All Variables
- Delete Filtered Variables
- DeleteAllNonPersistedGlobalVariablesCommand
- DeleteAllPersistedGlobalVariablesCommand
- DeleteFilteredNonPersistedGlobalVariablesCommand
- DeleteFilteredPersistedGlobalVariablesCommand
- DeleteNonPersistedGlobalVariableCommand
- DeleteNonPersistedUserGlobalVariableCommand
- DeletePersistedGlobalVariableCommand
- DeletePersistedUserGlobalVariableCommand
- Filter
- FriendlyType
- Global Variables
- Last Write
- LastWrite
- Name
- Non-Persisted Globals
- Non-Persisted User Globals
- NonPersistedGlobalVariables
- NonPersistedUserVariableFilter
- NonPersistedUserVariables
- NonPersistedVariableFilter
- Persisted Globals
- Persisted User Globals
- PersistedGlobalVariables
- PersistedUserVariableFilter
- PersistedUserVariables
- PersistedVariableFilter
- SelectedNonPersistedGlobalVariable
- SelectedNonPersistedUserGlobalVariable
- SelectedPersistedGlobalVariable
- SelectedPersistedUserGlobalVariable
- SelectedUserNonPersistedPlatform
- SelectedUserNonPersistedUser
- SelectedUserPersistedPlatform
- SelectedUserPersistedUser
- Show LastWrite Column
- ShowLastWriteColumn
- TitleBar
- Type
- UserNonPersistedPlatforms
- UserNonPersistedUsers
- UserPersistedPlatforms
- UserPersistedUsers
- Value
- Window
- WindowClosingCommand

#### windows/webviewwindow（12 条）

- Closing
- GridContainer
- InitError
- Loaded
- Loading...
- LoadingWebview
- StatusMessage
- There was an error trying to initialize WebView
- Title
- TitleBar
- WindowClosingCommand
- WindowLoadedCommand

#### windows/triggerviewerwindow（5 条）

- Closing
- FilterTerm
- Nodes
- Window
- WindowClosingCommand

### 主窗口

#### mainwindow（94 条）

- ({0}/{1})
- About
- Account Settings
- AccountAuthenticated
- AccountCancelLoginCommand
- AccountChevron2
- AccountForgetCommand
- AccountIcon
- AccountLoginCommand
- AccountLoginCopyCommand
- AccountLogoutCommand
- AccountPopup2
- AccountProfileUrl
- AccountSettingsCommand
- AccountToggle2
- AccountUserName
- ApplicationTitle
- BodyStrong
- BreadcrumbBar
- Cancel Login
- Chat
- Check for Updates
- CheckForUpdateCommand
- CloseClicked
- Closing
- Collapsed
- Connect your Streamer.bot account
- Connected
- Copy Login Link
- Data.IsMinimized
- Data.TrayExitCommand
- Data.TrayRestoreCommand
- Data.TrayShowCommand
- Documentation
- Event Feed
- Exit
- Export
- ExportCommand
- Forget
- Global Variables
- HasUpdate
- Import
- ImportCommand
- Important Information
- IsChecked
- IsSupporter
- Ko-fi
- Log In (Default)
- Login
- Logout
- Menu
- NavItems
- NavPaneOpen
- NavigationView
- Not Connected
- Open Log Folder...
- OpenDocumentationCommand
- OpenKofiCommand
- OpenLogFolderCommand
- OpenPatreonCommand
- OpenSuggestionsCommand
- OverallStatus
- Partially Connected
- PasteCommand
- Patreon
- Restore
- Save
- SaveCommand
- Secondary
- Settings
- Show
- ShowGlobalVariableViewerCommand
- ShowImportantInformationCommand
- ShowWebViewChatCommand
- ShowWebViewEventFeedCommand
- SnackbarPresenter
- StateChanged
- StatusChevron
- StatusIcon
- StatusPopup
- StatusToggle
- Statuses
- Streamer.bot Account
- Streamer.bot account
- Suggestions
- SupportTierName
- TitleBar
- True
- Visible
- WebsiteLoginState
- WindowCloseClickedCommand
- WindowClosingCommand
- WindowStateChangedCommand
- {0} Supporter
