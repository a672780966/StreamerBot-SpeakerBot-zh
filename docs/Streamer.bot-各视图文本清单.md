# Streamer.bot 未触达 UI 文本清单（干净版）

共 1112 条唯一文本，分布在 441 个视图模块。

## ui/wpf/mainwindow.baml (18)

- ({0}/{1})
- Account Settings
- Cancel Login
- Check for Updates
- Connect your Streamer.bot account
- Copy Login Link
- Data.IsMinimized
- Event Feed
- Global Variables
- Important Information
- Ko-fi
- Log In (Default)
- Not Connected
- Open Log Folder...
- Partially Connected
- Streamer.bot Account
- Streamer.bot account
- {0} Supporter

## ui/wpf/splashscreen.baml (1)

- Created by nate1280

## ui/wpf/views/dialogs/actiondialog.baml (6)

- Enter a unique Action name...
- When enabled, if queued in a queue that is paused, this action will ignore that pause state and immediately run.
- When enabled, will prevent this action from showing in the Action Queue Pending/History tabs, this should be enabled for Actions that have high volume Triggers on them.
- When enabled, will run a random top-level sub-action.
- When enabled, will run all top-level sub-actions at the same time.
- Whether or not the Action is enabled

## ui/wpf/views/dialogs/actionqueuedialog.baml (2)

- Enter a unique queue name...
- When enabled, actions in this queue will be run in sequence, each action waits for the previous one to complete before running.

## ui/wpf/views/dialogs/actionselectdialog.baml (1)

- Select Action

## ui/wpf/views/dialogs/commanddialog.baml (4)

- <<
- >>
- Command(s)
- Grant Type

## ui/wpf/views/dialogs/customwebsocketclientdialog.baml (4)

- Enable Compression
- TLS 1.0
- TLS 1.1
- TLS 1.2

## ui/wpf/views/dialogs/customwebsocketserverdialog.baml (2)

- Auto Start on Startup
- Ignore Extensions

## ui/wpf/views/dialogs/donordrivedialog.baml (1)

- Auto Monitor

## ui/wpf/views/dialogs/filefolderwatcherdialog.baml (12)

- %changeType% - The type of change (Changed, Created, Deleted)
- %empty% - If the file is now empty
- %fileName% - The file name with extension
- %fullPath% - The full path to the file
- %line#% - The specifc line of the file, 0 based index, 0 is the first line
- %lineEscaped#% - The line escaped for use in a url query
- %lines% - The number of lines in the file
- Add Changed Data
- As JSON
- Changed only Values
- If AsJson is checked, the file will try to be loaded as a json object only a simple object will be loaded (for now), if it can not be parsed, the below will be available
- Include Subdirectories

## ui/wpf/views/dialogs/filetaildialog.baml (6)

- %fileName%
- %filePath%
- %line%
- - The file line as the file changes
- - The file name with extension
- - The full path to the file

## ui/wpf/views/dialogs/kick/kickcategorysearchdialog.baml (1)

- Search Kick Categories

## ui/wpf/views/dialogs/kick/kickchannelrewarddialog.baml (12)

- (Optional)
- Background Color
- Persist Counter
- Persist User Counter
- Pick a Random Color
- Redemption Skips Queue
- RewardPrompt.Length
- RewardTitle.Length
- Streamer.bot Settings
- User Input Required
- {0}/200
- {0}/40

## ui/wpf/views/dialogs/meldstudiodialog.baml (2)

- Auto Connect on Startup
- Reconnect on Disconnect

## ui/wpf/views/dialogs/midieventdialog.baml (4)

- Ignore Channel
- Ignore Data
- Ignore NoteOff
- Raw Message

## ui/wpf/views/dialogs/midiindialog.baml (3)

- Auto Open on Startup
- Device Name
- Re-Open on Close

## ui/wpf/views/dialogs/mtion/mtionselecttriggerdialog.baml (2)

- Filter...
- Select mtion Trigger

## ui/wpf/views/dialogs/obsdialog.baml (2)

- v4.9.x
- v5.x

## ui/wpf/views/dialogs/promptdialog.baml (1)

- Don't Show Again

## ui/wpf/views/dialogs/quotedialog.baml (2)

- Clear User
- Search for User

## ui/wpf/views/dialogs/restoredialog.baml (4)

- Backup Version:
- Created At:
- Instance Name:
- {0} ({1})

## ui/wpf/views/dialogs/subactions/actions/doactiondialog.baml (1)

- Run Action Immediately

## ui/wpf/views/dialogs/subactions/actions/setactiongroupstatedialog.baml (1)

- Add an Action in a Group!

## ui/wpf/views/dialogs/subactions/actions/setactionqueuepausestatedialog.baml (1)

- Clear Queue

## ui/wpf/views/dialogs/subactions/actions/setsubactionstatedialog.baml (1)

- Sub-Actions

## ui/wpf/views/dialogs/subactions/actions/setsubactionweightdialog.baml (2)

- Sub-Actions
- Weight can be a fixed value, or a parsed value, using variables and/or inline functions, and the resulting value needs to be a double or number

## ui/wpf/views/dialogs/subactions/code/executecodedialog.baml (15)

- Add reference from file...
- Compiling Log
- Copy all to clipboard
- Delayed Start
- Editor Settings
- Find Refs
- Font Family
- Font Size
- Format Document
- Loading Editor Components...
- Monaco Settings
- Precompile on Application Start
- Save Result to Variable
- Save and Compile
- Variable Name

## ui/wpf/views/dialogs/subactions/code/executemethoddialog.baml (8)

- Execute C# Code
- No Execute C# Code Sub-Actions were found!
- No Execute C# Sub-Aactions Found!
- Only methods that return bool, and have no parameter are usable.
- Run on UI Thread
- Save Result to Variable
- This will only show Execute C# Code subactions that have a name.
- Variable Name

## ui/wpf/views/dialogs/subactions/commands/getcommandgroupstatedialog.baml (1)

- No command groups found!

## ui/wpf/views/dialogs/subactions/commands/getcommandsdialog.baml (4)

- Has Permission
- Ignore Aliases
- Include All
- Variable Name

## ui/wpf/views/dialogs/subactions/commands/getcommandstatedialog.baml (2)

- Items[0].Group
- No commands found!

## ui/wpf/views/dialogs/subactions/commands/setcommandgroupstatedialog.baml (2)

- Add a Command in a Group!
- No Command Groups Found!

## ui/wpf/views/dialogs/subactions/commands/setcommandstatedialog.baml (3)

- Add a Command!
- Items[0].Group
- No Commands Found!

## ui/wpf/views/dialogs/subactions/core/basegroupdialog.baml (2)

- Pick a Random Color
- Pick a color

## ui/wpf/views/dialogs/subactions/core/commentdialog.baml (3)

- Leave color empty to use Application default color for comments
- Pick a Random Color
- Pick a color

## ui/wpf/views/dialogs/subactions/core/delayactiondialog.baml (1)

- You can enter a %variable% in either field, or a number.  The value is in milliseconds.

## ui/wpf/views/dialogs/subactions/core/fetchurldialog.baml (4)

- Auto-Type non-JSON Result
- Delete All
- Parse Results as JSON
- Variable Name

## ui/wpf/views/dialogs/subactions/core/getinputdialog.baml (6)

- A variable, success will also be added, and will be true if Ok was pressed
- Auto-Type
- Default Value
- Output Variable
- Output Variable will be the name of the variable that your result goes into, default is inputResult
- Title, Prompt and Original Text all support variables.

## ui/wpf/views/dialogs/subactions/core/getrandomnumberdialog.baml (3)

- Add a random number into arguments, use for percentages, or anything else.
- When random type is Next Float, a decimal number (upto 17 decimal precision) will be picked and added to the arguments as %randomFloat%, this number will also be added as a percentage value (with no decimals) as %randomPercent%
- When random type is between, a number between the 2 values you set will be added into the arguments at %randomNumber%

## ui/wpf/views/dialogs/subactions/core/logentrydialog.baml (1)

- Log Level

## ui/wpf/views/dialogs/subactions/core/performcommanddialog.baml (6)

- Delete All
- Environment Variables
- Set wait time to 0 seconds to run without waiting
- Wait maximum
- Working Directory
- seconds for exit

## ui/wpf/views/dialogs/subactions/core/pickcolordialog.baml (6)

- OBS Color
- OBS Studio use ABGR format for its colors
- Pick a Random Color
- Pick a color
- Random Color
- Variable Name

## ui/wpf/views/dialogs/subactions/core/sendlocalsignaldialog.baml (4)

- Delete All
- Include Action's Arguments
- Queue Signal
- Signal name

## ui/wpf/views/dialogs/subactions/core/setspeechtotextinputdialog.baml (2)

- Audio Input Device
- No Audio Devices Found

## ui/wpf/views/dialogs/subactions/core/settimerstatedialog.baml (2)

- Add a Timer!
- No Timers Found!

## ui/wpf/views/dialogs/subactions/core/toastnotificationdialog.baml (2)

- Icon Path
- Toast Id

## ui/wpf/views/dialogs/subactions/core/udpbroadcastdialog.baml (3)

- Payload Data
- UDP Port
- Using this you can send a UDP broadcast packet which will contain the data you enter in payload.

## ui/wpf/views/dialogs/subactions/core/waitforlocalsignaldialog.baml (3)

- If timeout is left blank, it defaults to 30 seconds (or 30,000ms)
- Overwrite Variables
- Signal name

## ui/wpf/views/dialogs/subactions/discord/discordbasicwebhookdialog.baml (3)

- Avatar URL
- Text to Speech
- Webhook URL

## ui/wpf/views/dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetautoscrollstatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetbrightnessdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetchapterdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetcrosshairimagedialog.baml (3)

- Elgato CameraHub is Not Connected!
- No Crosshair Images Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetcrosshairstatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetfontdialog.baml (3)

- Elgato CameraHub is Not Connected!
- No Fonts Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetfontsizedialog.baml (2)

- Font Size
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersethorizontalmargindialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetlinespacingdialog.baml (2)

- Line Spacing
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetmodedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetopacitydialog.baml (2)

- Line Spacing
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetscriptdialog.baml (3)

- Elgato CameraHub is Not Connected!
- No Scripts Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/prompter/elgatocamerahubpromptersetverticalmargindialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubepoccamsetarlensdialog.baml (5)

- AR Lens
- Elgato CameraHub is Not Connected!
- No AR Lenses Found!
- Not Connected
- Selected Camera is not EpocCam!

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubepoccamsetbitratedialog.baml (4)

- Elgato CameraHub is Not Connected!
- No AR Lenses Found!
- Not Connected
- Selected Camera is not EpocCam!

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubepoccamsetcameradialog.baml (4)

- Elgato CameraHub is Not Connected!
- No AR Lenses Found!
- Not Connected
- Selected Camera is not EpocCam!

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubepoccamsettorchmodedialog.baml (2)

- Elgato CameraHub is Not Connected!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetantiflickerdialog.baml (2)

- Anti-flicker
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetautowhitebalancedialog.baml (2)

- Elgato CameraHub is Not Connected!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetbrightnessdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetcontrastdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetdynamicrangedialog.baml (3)

- Dynamic Range
- Elgato CameraHub is Not Connected!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetfocusdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetnoisereductiondialog.baml (3)

- Camera does not support Noise Reduction!
- Elgato CameraHub is Not Connected!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetpandialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetsaturationdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetsharpnessdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsettiltdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetwhitebalancedialog.baml (2)

- Not Connected
- White Balance

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetwhitebalancetintdialog.baml (2)

- Not Connected
- White Balance Tint

## ui/wpf/views/dialogs/subactions/elgato/camerahub/webcam/elgatocamerahubwebcamsetzoomdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/streamdeck/streamdeckcommonbuttoniddialog.baml (2)

- Button ID
- You can get the ButtonID from the StreamDeck Application.

## ui/wpf/views/dialogs/subactions/elgato/streamdeck/streamdecksetbackgrounddialog.baml (2)

- Button ID
- You can get the ButtonID from the StreamDeck Application, and Image/State supports variables. State is optional

## ui/wpf/views/dialogs/subactions/elgato/streamdeck/streamdecksetstatedialog.baml (2)

- Button ID
- You can get the ButtonID from the StreamDeck Application, and State supports variables.

## ui/wpf/views/dialogs/subactions/elgato/streamdeck/streamdecksettitledialog.baml (2)

- Button ID
- You can get the ButtonID from the StreamDeck Application, and Title/State supports variables.  State is optional.

## ui/wpf/views/dialogs/subactions/elgato/streamdeck/streamdecksetvaluedialog.baml (2)

- Button ID
- You can get the ButtonID from the StreamDeck Application, and Value supports variables.

## ui/wpf/views/dialogs/subactions/elgato/streamdeckmcp/elgatostreamdeckmcpexecuteactiondialog.baml (3)

- Elgato StreamDeck MCP is Not Connected!
- No Actions Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/wavelink/elgatowavelinkgetfilterstatedialog.baml (3)

- Elgato WaveLink is Not Connected!
- No Inputs Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/wavelink/elgatowavelinkgetinputinformationdialog.baml (3)

- Elgato WaveLink is Not Connected!
- No Inputs Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/wavelink/elgatowavelinkgetmicrophoneinformationdialog.baml (3)

- Elgato WaveLink is Not Connected!
- No Inputs Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/wavelink/elgatowavelinkmuteinputdialog.baml (3)

- Elgato WaveLink is Not Connected!
- No Inputs Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/wavelink/elgatowavelinkmutemicrophonedialog.baml (3)

- Elgato WaveLink is Not Connected!
- No Inputs Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/wavelink/elgatowavelinkmuteoutputdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/wavelink/elgatowavelinksetfilterstatedialog.baml (3)

- Elgato WaveLink is Not Connected!
- No Inputs Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/wavelink/elgatowavelinksetinputvolumedialog.baml (3)

- Elgato WaveLink is Not Connected!
- No Inputs Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/wavelink/elgatowavelinksetmicrophonebalancedialog.baml (4)

- Allowed values for balance are %variables%, or a number value between 0 and 100 inclusive.
- Elgato WaveLink is Not Connected!
- No Inputs Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/wavelink/elgatowavelinksetmicrophonegaindialog.baml (4)

- Allowed values for gain are %variables%, or a decimal value between 0.0 and 1.0 inclusive.
- Elgato WaveLink is Not Connected!
- No Inputs Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/wavelink/elgatowavelinksetmicrophoneoutputvolumedialog.baml (4)

- Allowed values for volume are %variables%, or a decimal value between 0.0 and 1.0 inclusive.
- Elgato WaveLink is Not Connected!
- No Inputs Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/wavelink/elgatowavelinksetoutputmonitordevicedialog.baml (3)

- Elgato WaveLink is Not Connected!
- No Inputs Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/elgato/wavelink/elgatowavelinksetoutputvolumedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/file/fileexistsdialog.baml (2)

- File to Check if Exists
- Variable Name to Use (if empty, fileExists is used)

## ui/wpf/views/dialogs/subactions/file/folderexistsdialog.baml (2)

- Folder to Check if Exists
- Variable Name to Use (if empty, folderExists is used)

## ui/wpf/views/dialogs/subactions/file/readlinesfromfiledialog.baml (4)

- Attempt Auto-Typing
- File to Read From
- Parse Variables
- Variable Name to Use (if empty, line is used)

## ui/wpf/views/dialogs/subactions/file/readrandomlinefromfiledialog.baml (5)

- Attempt Auto-Typing
- File to Read From
- Overwrite Existing Variable(s)
- Parse Variables
- Variable Name to Use (if empty, line is used)

## ui/wpf/views/dialogs/subactions/file/readspecificlinefromfiledialog.baml (5)

- Attempt Auto-Typing
- File to Read From
- Line Number
- Parse Variables
- Variable Name to Use (if empty, line is used)

## ui/wpf/views/dialogs/subactions/file/writetofiledialog.baml (14)

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
- Append to File
- File to Write To
- Text to Write

## ui/wpf/views/dialogs/subactions/filetail/setfiletailstatedialog.baml (2)

- File Tail
- No File Tails Found

## ui/wpf/views/dialogs/subactions/ifttt/iftttnotificationadvanceddialog.baml (2)

- Delete All
- Event Name

## ui/wpf/views/dialogs/subactions/ifttt/iftttnotificationdialog.baml (1)

- Event Name

## ui/wpf/views/dialogs/subactions/kick/channelrewards/kickchannelrewardconfiguredialog.baml (8)

- Disable not configured rewards
- Move All To
- No Rewards Found
- Not Configured
- States[0].Rewards.Count
- States[1].Rewards.Count
- States[2].Rewards.Count
- States[3].Rewards.Count

## ui/wpf/views/dialogs/subactions/kick/channelrewards/kickchannelrewardgetinfodialog.baml (3)

- Items[0].Group
- No Kick Rewards Found!
- No Rewards Found

## ui/wpf/views/dialogs/subactions/kick/channelrewards/kickchannelrewardresetcounterdialog.baml (3)

- Items[0].Group
- No Kick Rewards Found!
- No Rewards Found

## ui/wpf/views/dialogs/subactions/kick/channelrewards/kickchannelrewardresetusercountersdialog.baml (3)

- Items[0].Group
- No Kick Rewards Found!
- No Rewards Found

## ui/wpf/views/dialogs/subactions/kick/channelrewards/kickchannelrewardsetbackgroundcolordialog.baml (7)

- Items[0].Group
- Kick is not Connected
- No Editable Rewards Found!
- Pick a Random Color
- Pick a color
- Random Color
- Revert to Original Color

## ui/wpf/views/dialogs/subactions/kick/channelrewards/kickchannelrewardsetcostdialog.baml (3)

- Items[0].Group
- Kick is not Connected
- No Editable Rewards Found!

## ui/wpf/views/dialogs/subactions/kick/channelrewards/kickchannelrewardsetdescriptiondialog.baml (3)

- Items[0].Group
- Kick is not Connected
- No Editable Rewards Found!

## ui/wpf/views/dialogs/subactions/kick/channelrewards/kickchannelrewardsetenabledstatedialog.baml (3)

- Items[0].Group
- Kick is not Connected
- No Editable Rewards Found!

## ui/wpf/views/dialogs/subactions/kick/channelrewards/kickchannelrewardsetgroupenabledstatedialog.baml (2)

- Add a Kick Reward!
- No Kick Reward Groups Found!

## ui/wpf/views/dialogs/subactions/kick/channelrewards/kickchannelrewardsetgrouppausedstatedialog.baml (2)

- Add a Kick Reward!
- No Kick Reward Groups Found!

## ui/wpf/views/dialogs/subactions/kick/channelrewards/kickchannelrewardsetpausedstatedialog.baml (3)

- Items[0].Group
- Kick is not Connected
- No Editable Rewards Found!

## ui/wpf/views/dialogs/subactions/kick/channelrewards/kickchannelrewardsettitledialog.baml (3)

- Items[0].Group
- Kick is not Connected
- No Editable Rewards Found!

## ui/wpf/views/dialogs/subactions/kick/channelrewards/kickchannelrewardupdatedialog.baml (5)

- Items[0].Group
- Kick is not Connected
- No Editable Rewards Found!
- Revert to original values
- To not set a value for any of the options,, just leave the field empty

## ui/wpf/views/dialogs/subactions/kick/kickaddrandomusersdialog.baml (4)

- Add the specified number of random users to the arguments, this will provide a unique number of users filterd by their present status and that have been seen by Streamer.bot.
- If this is checked, only users in the listed groups will be used, otherwise they will be excluded
- Only Those Listed
- Present Only

## ui/wpf/views/dialogs/subactions/kick/kickcommonusergroupdialog.baml (3)

- Group Name
- The user login and group name can contain either a specific user's login, or a %variables% that will be parsed
- User Login

## ui/wpf/views/dialogs/subactions/kick/kickcommonuserlogindialog.baml (2)

- The user login can contain either a specific user's login, or a %variable% that will be parsed
- User Login

## ui/wpf/views/dialogs/subactions/kick/kickcommonuserreasondialog.baml (2)

- The user login can contain either a specific user's login, or a %variable% that will be parsed
- User Login

## ui/wpf/views/dialogs/subactions/kick/kickreplytomessagedialog.baml (6)

- Fallback to Broadcaster
- Message.Length
- Reply Id
- Send using bot account
- Use the variable that contains the Id, for example %msgId%
- {0}/500

## ui/wpf/views/dialogs/subactions/kick/kicksendmessagedialog.baml (4)

- Fallback to Broadcaster
- Message.Length
- Send using bot account
- {0}/500

## ui/wpf/views/dialogs/subactions/kick/kicksetchannelcategorydialog.baml (4)

- Category Name
- Click the button above to select a category.
- Specific Category
- You can use the above entry for variables, or set a specific category, change the Source to pick from Kick's category list

## ui/wpf/views/dialogs/subactions/kick/kicksetchanneltitledialog.baml (1)

- You can either set a static title, and/or use variables to set a title

## ui/wpf/views/dialogs/subactions/kick/kicktimeoutuserdialog.baml (2)

- The user login can contain either a specific user's login, or a %variable% that will be parsed
- User Login

## ui/wpf/views/dialogs/subactions/logic/globalgetdialog.baml (6)

- Default Value
- Destination Variable
- If "Destination Variable" is left empty, the value will be stored to global_variableName, or user_username_variablename
- This SubAction will let you get a global variable and add it to the arguments that are passed along to other SubActions
- Variable Name
- You can specify a default value to use if the variable is not found, if a default value is set, and the variable is not found, it will also set the variable to this value

## ui/wpf/views/dialogs/subactions/logic/globalsetdialog.baml (4)

- Auto Type
- Checking this will make your value be auto typed, and has no effect on increment or decrement source
- This SubAction will set the value of either an argument to the value, or a global variable from an argument, or to the value specified
- Variable Name

## ui/wpf/views/dialogs/subactions/logic/logicifdialog.baml (4)

- Add your SubActions to either of these groups to perform actions based on the result of this expression.
- Auto Type
- Input now supports variable parsing, be sure to surround it with % if you want the value of the variable. i.e. %user%, %userCounter%, %rawInput%, etc...
- When adding an If/Else SubAction, two groups, called True Result and False Result, will automatically be added underneath the SubAction.

## ui/wpf/views/dialogs/subactions/logic/logicswitchcasegroupdialog.baml (2)

- Case Sensitive
- Case Values

## ui/wpf/views/dialogs/subactions/logic/logicswitchdialog.baml (4)

- A Switch evaluates the input against the Case Values for equality, and first matching will have it's SubActions run.
- Auto Type
- If there are no matches then it will fall back to the Default Case.
- You can add multiple Case groups under the Switch SubAction, and order matters.

## ui/wpf/views/dialogs/subactions/logic/logicwhiledialog.baml (2)

- Auto Type
- Ignore Case

## ui/wpf/views/dialogs/subactions/logic/setargumentdialog.baml (4)

- Auto Type
- This SubAction will allow you to set the value of an argument.  These are the %variables% you use in other SubActions
- Variable Name
- Variable Name or Value can be a fixed value, or a parsed value, using variables and/or inline functions

## ui/wpf/views/dialogs/subactions/lumiastream/lumiastreamsendcommanddialog.baml (3)

- LumiaStream is Not Connected!
- No Commands Found!
- Not Connected

## ui/wpf/views/dialogs/subactions/lumiastream/lumiastreamsetcolordialog.baml (5)

- LumiaStream is Not Connected!
- Not Connected
- Pick a Random Color
- Pick a color
- Skips Queue

## ui/wpf/views/dialogs/subactions/meldstudio/meldstudiocommonconnectiondialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/meldstudio/meldstudiocommonstatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/meldstudio/meldstudiorecordclipdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/meldstudio/meldstudiosetbrowserlayerurldialog.baml (2)

- Not Connected
- You can use variables in the source, for example %targetUserProfileImageUrl% if you want the browser source set to the target user's profile image, if an Add Target info action is in the actions.

## ui/wpf/views/dialogs/subactions/meldstudio/meldstudioseteffectenabledstatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/meldstudio/meldstudiosetlayertextdialog.baml (2)

- Not Connected
- You can use variable in the text, for example, %targetUser% to set the text to the target's name, if an Add Target Info action exists in the actions.

## ui/wpf/views/dialogs/subactions/meldstudio/meldstudiosetlayertrackmutedstatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/meldstudio/meldstudiosetlayervisibilitystatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/meldstudio/meldstudiosetmedialayersourcedialog.baml (2)

- Not Connected
- You can use variables in the source, for example %targetUserProfileImageUrl% if you want the image or media source set to the target user's profile image, if an Add Target info action is in the actions.

## ui/wpf/views/dialogs/subactions/meldstudio/meldstudiosettrackmutedstatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/meldstudio/meldstudioshowscenedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/meldstudio/meldstudiotakescreenshotdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/meldstudio/meldstudiotakeverticalscreenshotdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/midi/midioutcontrolchangedialog.baml (7)

- Learn from Device
- MIDI Device is NOT connected
- MIDI Device is already in use
- MIDI Device is connected
- MIDI Device is not found
- No Devices Available to Learn From!
- No Output Devices Available!

## ui/wpf/views/dialogs/subactions/midi/midioutgenericdialog.baml (8)

- Ignore NoteOff
- Learn from Device
- MIDI Device is NOT connected
- MIDI Device is already in use
- MIDI Device is connected
- MIDI Device is not found
- No Devices Available to Learn From!
- No Output Devices Available!

## ui/wpf/views/dialogs/subactions/midi/midioutnoteondialog.baml (8)

- Learn from Device
- MIDI Device is NOT connected
- MIDI Device is already in use
- MIDI Device is connected
- MIDI Device is not found
- No Devices Available to Learn From!
- No Output Devices Available!
- Send NoteOff

## ui/wpf/views/dialogs/subactions/mtion/mtionsendtriggerdialog.baml (1)

- Trigger Name

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiocommonconnectiondialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiocommonstatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiocreaterecordchapterdialog.baml (4)

- Chapter Name
- Chapter name supports %variables%.
- Not Connected
- This sub-action requires the `Hybrid MP4 [BETA](.mp4)` recording format to be selected within OBS.

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudioflipsourcedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiogetsceneitempropertiesdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiohidegroupsourcesdialog.baml (2)

- Not Connected
- This will hide all sources within a group that are currently visible.

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiohidescenesourcesdialog.baml (2)

- Not Connected
- This will hide all sources within a scene that are currently visible.

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiohidesourcefiltersdialog.baml (2)

- Not Connected
- This will hide all filters for a given source that are currently visible.

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiorawdialog.baml (3)

- Add Results to Arguments
- Not Connected
- Variable Prefix

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiorotatesourcedialog.baml (2)

- Not Connected
- This will rotate your source around its alignment position.  By default OBS sets this to TopLeft, ideally you want this set to Center, this can be changed by editing your source's transform in OBS

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiosetactivescenedialog.baml (2)

- Not Connected
- This will make the scene your active scene in OBS Studio

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiosetaudiotrackstatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiosetbrowsersourceurldialog.baml (2)

- Not Connected
- You can use variables in the source, for example %targetUserProfileImageUrl% if you want the browser source set to the target user's profile image, if an Add Target info action is in the actions.

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiosetcolorsourcecolordialog.baml (4)

- Not Connected
- Pick a Random Color
- Pick a color
- Random Color

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiosetgditextdialog.baml (2)

- Not Connected
- You can use variable in the text, for example, %targetUser% to set the text to the target's name, if an Add Target Info action exists in the actions.

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiosetimagesourcefiledialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiosetmediasourcefiledialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiosetmediastatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiosetrandomfilterstatedialog.baml (2)

- Not Connected
- This will pick a random filter within the selected source and make it visible or hidden, or toggle its state.

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiosetrandomgroupsourcevisibledialog.baml (2)

- Not Connected
- This will pick a random source within the selected group and make it visible, if all items are visible, it will do nothing.

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiosetrandomscenesourcevisibledialog.baml (2)

- Not Connected
- This will pick a random source within the selected scene and make it visible, if all items are visible, it will do nothing.

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiosetscenefilterstatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiosetsourcefilterstatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiosetsourcemutestatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiosourcevisbilitydialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/obsstudio/obsstudiotakescreenshotdialog.baml (3)

- File Path
- Not Connected
- Quality:

## ui/wpf/views/dialogs/subactions/polypop/polypoptriggeralertdialog.baml (2)

- Delete All
- Signal name

## ui/wpf/views/dialogs/subactions/pronouns/pronounsaddforuserdialog.baml (3)

- The user login can contain either a specific user's login, or a %variables% that will be parsed
- User Login
- Variable Prefix

## ui/wpf/views/dialogs/subactions/quotes/addquotedialog.baml (1)

- The field above must contain the %variable% that will contain the quote to be added.

## ui/wpf/views/dialogs/subactions/quotes/deletequotedialog.baml (2)

- Quote ID
- Quote ID can be a variable which must parse to a number, or a number.

## ui/wpf/views/dialogs/subactions/quotes/getquotedialog.baml (2)

- Adding multiple Get Quotes will overwrite each previous one
- Quote ID

## ui/wpf/views/dialogs/subactions/sounds/playsounddialog.baml (5)

- Audio Output Device
- Finish playing before continuing
- Sound file to play
- Use Filename
- {0}%

## ui/wpf/views/dialogs/subactions/sounds/playsoundfromfolderdialog.baml (5)

- Audio Output Device
- Finish playing before continuing
- Folder containing *.mp3 and *.wav
- Use Filename
- {0}%

## ui/wpf/views/dialogs/subactions/sounds/stopsoundplaybackdialog.baml (2)

- Sound Name
- Sound Name can be empty, in which case it will use "default", a variable, or a string you enter

## ui/wpf/views/dialogs/subactions/speakerbot/speakerbotactivatevoicegateprofiledialog.baml (3)

- No Profiles Found!
- Not Connected
- Speaker.bot is Not Connected!

## ui/wpf/views/dialogs/subactions/speakerbot/speakerbotsetenabledstatedialog.baml (1)

- Speaker.bot Not Connected

## ui/wpf/views/dialogs/subactions/speakerbot/speakerbotsetpausedstatedialog.baml (1)

- Speaker.bot Not Connected

## ui/wpf/views/dialogs/subactions/speakerbot/speakerbotspeakdialog.baml (3)

- Pass through Bad Word Filter
- Speaker.bot Not Connected
- Voice Alias

## ui/wpf/views/dialogs/subactions/streamerbotdecks/streamerbotdeckitemsetbackgrounddialog.baml (4)

- Add a Deck!
- No Items!
- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/streamerbotdecks/streamerbotdeckitemseticondialog.baml (4)

- Add a Deck!
- No Items!
- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/streamerbotdecks/streamerbotdeckitemsetstatedialog.baml (4)

- Add a Deck!
- No Items!
- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/streamerbotdecks/streamerbotdeckitemsettitledialog.baml (4)

- Add a Deck!
- No Items!
- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/streamerbotdecks/streamerbotdeckitemsetvaluedialog.baml (4)

- Add a Deck!
- No Items!
- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/streamerbotdecks/streamerbotdeckitemtogglestatedialog.baml (4)

- Add a Deck!
- No Items!
- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/streamerbotdecks/streamerbotdecknotifydialog.baml (3)

- Add a Deck!
- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/streamerbotdecks/streamerbotdeckpagecommondialog.baml (3)

- Add a Deck!
- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/streamerbotdecks/streamerbotdeckpagesetdialog.baml (3)

- Add a Deck!
- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/streamerbotremote/streamerbotremoteinstancesendsignaldialog.baml (5)

- Delete All
- Include Action's Arguments
- Not Connected
- Not Connected!
- Signal Name

## ui/wpf/views/dialogs/subactions/streamerbotremote/streamerbotremoteinstancesendtriggerdialog.baml (5)

- Delete All
- Event Name
- Include Action's Arguments
- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/streamerbotremote/streamerbotremoteinstancewaitforsignaldialog.baml (5)

- If timeout is left blank, it defaults to 30 seconds (or 30,000ms)
- Not Connected
- Not Connected!
- Overwrite Variables
- Signal Name

## ui/wpf/views/dialogs/subactions/streamfog/streamfogactivatelensbynamedialog.baml (3)

- Lens Name
- Lens Name and/or Duration can be a fixed value or a parsed value using variables and/or inline functions.
- Not Connected

## ui/wpf/views/dialogs/subactions/streamfog/streamfogactivatelensdialog.baml (2)

- Not Connected
- Streamfog is Not Connected!

## ui/wpf/views/dialogs/subactions/streamfog/streamfogactivateoutfitbynamedialog.baml (3)

- Not Connected
- Outfit Name
- Outfit Name can be a fixed value or a parsed value using variables and/or inline functions.

## ui/wpf/views/dialogs/subactions/streamfog/streamfogactivateoutfitdialog.baml (3)

- No Outfits Found!
- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/streamfog/streamfogplayvideobackgroundbynamedialog.baml (3)

- Not Connected
- Video Name
- Video Name can be a fixed value or a parsed value using variables and/or inline functions.

## ui/wpf/views/dialogs/subactions/streamfog/streamfogplayvideobackgrounddialog.baml (3)

- No Video Backgrounds Found!
- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/streamlabsdesktop/streamlabsdesktopcommonconnectiondialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/streamlabsdesktop/streamlabsdesktopcommonstatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/streamlabsdesktop/streamlabsdesktopflipsourcedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/streamlabsdesktop/streamlabsdesktophidegroupsourcesdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/streamlabsdesktop/streamlabsdesktophidesourcefiltersdialog.baml (2)

- Not Connected
- This will hide all filters for a given source that are currently visible.

## ui/wpf/views/dialogs/subactions/streamlabsdesktop/streamlabsdesktoprotatesourcedialog.baml (2)

- Not Connected
- This will rotate your source around its alignment position.  By default this is TopLeft, ideally you want this set to Center, this can be changed by editing your source's transform in Streamlabs Desktop

## ui/wpf/views/dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetactivescenedialog.baml (2)

- Not Connected
- This will make the scene your active scene in Streamlabs Desktop

## ui/wpf/views/dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetbrowsersourceurldialog.baml (2)

- Not Connected
- You can use variables in the source, for example %targetUserProfileImageUrl% if you want the browser source set to the target user's profile image, if an Add Target info action is in the actions.

## ui/wpf/views/dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetgditextdialog.baml (2)

- Not Connected
- You can use variable in the text, for example, %targetUser% to set the text to the target's name, if an Add Target Info action exists in the actions.

## ui/wpf/views/dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetrandomfilterstatedialog.baml (2)

- Not Connected
- This will pick a random filter within the selected source and make it visible or hidden, or toggle its state.

## ui/wpf/views/dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetrandomgroupsourcevisibledialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetscenefilterstatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetsourcefilterstatedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetsourcemutedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/streamlabsdesktop/streamlabsdesktopsetsourcevisibilitydialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/throwingsystem/throwingsystemactivatetriggerbynamedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/throwingsystem/throwingsystemactivatetriggerdialog.baml (2)

- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/throwingsystem/throwingsystemthrowitembynamedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/throwingsystem/throwingsystemthrowitemdialog.baml (2)

- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/throwingsystem/throwingsystemthrowitemsbynamedialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/throwingsystem/throwingsystemthrowitemsdialog.baml (2)

- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/triggers/customeventtriggerdialog.baml (2)

- Event Name
- Use Args

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchredemptionstatusdialog.baml (2)

- If cancelling a redemption, this will refund the channel points back to the user that redeemed it.
- You can set the status of a redemption using this action, and the usual caveat, the reward must have been created by CPH for it to modify the status of redemptions.

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardconfiguredialog.baml (8)

- Disable not configured rewards
- Move All To
- No Rewards Found
- Not Configured
- States[0].Rewards.Count
- States[1].Rewards.Count
- States[2].Rewards.Count
- States[3].Rewards.Count

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardgetinfodialog.baml (3)

- Items[0].Group
- No Rewards Found
- No Twitch Rewards Found!

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardresetcounterdialog.baml (3)

- Items[0].Group
- No Rewards Found
- No Twitch Rewards Found!

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardresetusercountersdialog.baml (3)

- Items[0].Group
- No Rewards Found
- No Twitch Rewards Found!

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardsetbackgroundcolordialog.baml (7)

- Items[0].Group
- No Editable Rewards Found!
- Pick a Random Color
- Pick a color
- Random Color
- Revert to Original Color
- Twitch is not Connected

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardsetcooldowndialog.baml (3)

- Items[0].Group
- No Editable Rewards Found!
- Twitch is not Connected

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardsetcostdialog.baml (3)

- Items[0].Group
- No Editable Rewards Found!
- Twitch is not Connected

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardsetenabledstatedialog.baml (3)

- Items[0].Group
- No Editable Rewards Found!
- Twitch is not Connected

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardsetgroupenabledstatedialog.baml (2)

- Add a Twitch Reward!
- No Twitch Reward Groups Found!

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardsetgrouppausedstatedialog.baml (2)

- Add a Twitch Reward!
- No Twitch Reward Groups Found!

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardsetmaxperstreamdialog.baml (3)

- Items[0].Group
- No Editable Rewards Found!
- Twitch is not Connected

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardsetmaxperuserperstreamdialog.baml (3)

- Items[0].Group
- No Editable Rewards Found!
- Twitch is not Connected

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardsetpausedstatedialog.baml (3)

- Items[0].Group
- No Editable Rewards Found!
- Twitch is not Connected

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardsetpromptdialog.baml (3)

- Items[0].Group
- No Editable Rewards Found!
- Twitch is not Connected

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardsettitledialog.baml (3)

- Items[0].Group
- No Editable Rewards Found!
- Twitch is not Connected

## ui/wpf/views/dialogs/subactions/twitch/rewards/twitchrewardupdatedialog.baml (5)

- Items[0].Group
- No Editable Rewards Found!
- Revert to original values
- To not set a value for any of the options,, just leave the field empty
- Twitch is not Connected

## ui/wpf/views/dialogs/subactions/twitch/twitchaddpresentuserdialog.baml (1)

- Adds the present user at the index specified.  Index can also be a variable.  As a note, the present user list can change, so if you're iterating through, there is a possibility for same/missed results.

## ui/wpf/views/dialogs/subactions/twitch/twitchaddrandomusersdialog.baml (4)

- Add the specified number of random users to the arguments, this will provide a unique number of users filterd by their present status and that have been seen by Streamer.bot.
- If this is checked, only users in the listed groups will be used, otherwise they will be excluded
- Only Those Listed
- Present Only

## ui/wpf/views/dialogs/subactions/twitch/twitchaddsuspiciousstatusdialog.baml (2)

- The user login can contain either a specific user's login, or a %variable% that will be parsed.  Some examples of variables to use are: %user%, %targetUser%, %input0%
- User Login

## ui/wpf/views/dialogs/subactions/twitch/twitchcommonchanneltagdialog.baml (3)

- A channel may specify a maximum of 10 tags. Each tag is limited to a maximum of 25 characters and may not be an empty string or contain spaces or special characters.
- For readability, consider using camelCasing or PascalCasing.
- Tags are case insensitive.

## ui/wpf/views/dialogs/subactions/twitch/twitchcommongueststarslotdialog.baml (3)

- The slot can contain a number, typically between 1 and 6, or a %variable% that will be parsed.
- The user login can contain either a specific user's login, or a %variable% that will be parsed
- User Login

## ui/wpf/views/dialogs/subactions/twitch/twitchcommonusergroupdialog.baml (3)

- Group Name
- The user login and group name can contain either a specific user's login, or a %variables% that will be parsed
- User Login

## ui/wpf/views/dialogs/subactions/twitch/twitchcommonuserlogindialog.baml (2)

- The user login can contain either a specific user's login, or a %variable% that will be parsed.  Some examples of variables to use are: %broadcastUser%, %user%, %input0%
- User Login

## ui/wpf/views/dialogs/subactions/twitch/twitchcommonuserreasondialog.baml (2)

- The user login can contain either a specific user's login, or a %variable% that will be parsed
- User Login

## ui/wpf/views/dialogs/subactions/twitch/twitchcreateclipdialog.baml (2)

- Clip Title
- Duration can contain either a specific value between 5 and 60 (inclusive), or a %variable% that will be parsed.  This is in seconds, and if left blank, the default is 30s.

## ui/wpf/views/dialogs/subactions/twitch/twitchcreatepolldialog.baml (3)

- Channel Points Per Vote, leave empty or set to 0 to disable
- Choices (Minimum of 2, maximum of 5)
- Duration, defaults to 60 if empty or unable to parse

## ui/wpf/views/dialogs/subactions/twitch/twitchcreatepredictiondialog.baml (2)

- Outcomes (Minimum of 2, maximum of 10)
- Prediction Window (seconds) default is 60s

## ui/wpf/views/dialogs/subactions/twitch/twitchcreatestreammarkerdialog.baml (1)

- You can use variables, or a fixed value, including nothing to set a description for the stream marker.

## ui/wpf/views/dialogs/subactions/twitch/twitchfollowmodedialog.baml (1)

- Duration can either be a number (in minutes between 0 and 129,600), or a %variable% that will be parsed.

## ui/wpf/views/dialogs/subactions/twitch/twitchgetclipdownloadurlsdialog.baml (2)

- Clip ID
- The clip ID can contain either a specific id for a clip, or a %variable% that will be parsed.  This can also only get URLs for your own clips.

## ui/wpf/views/dialogs/subactions/twitch/twitchpinchatmessagedialog.baml (2)

- Both fields support parsing.  Duration can either be empty, which means the Pinned Message would last until the stream ends, or it must be, or parse to a value between 30 and 1800.
- Message Id

## ui/wpf/views/dialogs/subactions/twitch/twitchreplytomessagedialog.baml (6)

- Fallback to Broadcaster
- Message.Length
- Reply Id
- Send using bot account
- Use the variable that contains the Id, for example %msgId%
- {0}/500

## ui/wpf/views/dialogs/subactions/twitch/twitchresolvepredictionbytitledialog.baml (2)

- Outcome Title
- Specify the title of the outcome to use as the winning outcome when resolving the active prediction.  Variables are supported.

## ui/wpf/views/dialogs/subactions/twitch/twitchresolvepredictiondialog.baml (2)

- Specify the 0 based index of the outcome to use as the winning outcome when resolving the current active prediction.  Variables are supported.
- Winning Index

## ui/wpf/views/dialogs/subactions/twitch/twitchsendannouncementdialog.baml (4)

- Fallback to Broadcaster
- Message.Length
- Send using bot account
- {0}/500

## ui/wpf/views/dialogs/subactions/twitch/twitchsendmessagedialog.baml (7)

- Auto pin message after it is sent and will be pinned for 20 minutes
- Fallback to Broadcaster
- Message.Length
- Send using bot account
- The pinned message will be updated to last until stream ends
- Until stream ends
- {0}/500

## ui/wpf/views/dialogs/subactions/twitch/twitchsetchannelgamedialog.baml (3)

- Click the button above to select a game, leave it empty to have your game category empty.
- Specific Game
- You can use the above entry for variables, or set a specific game, change the Source to pick from Twitch's list

## ui/wpf/views/dialogs/subactions/twitch/twitchsetchanneltagsdialog.baml (4)

- A channel may specify a maximum of 10 tags. Each tag is limited to a maximum of 25 characters and may not be an empty string or contain spaces or special characters.
- For readability, consider using camelCasing or PascalCasing.
- Tags (Maximum of 10)
- Tags are case insensitive.

## ui/wpf/views/dialogs/subactions/twitch/twitchsetchanneltitledialog.baml (1)

- You can either set a static title, and/or use variables to set a title

## ui/wpf/views/dialogs/subactions/twitch/twitchsetsubcountercountdialog.baml (1)

- The count can contain a specific number, or a %variables% that will be parsed

## ui/wpf/views/dialogs/subactions/twitch/twitchslowmodedialog.baml (1)

- Duration can either be a number (in seconds), or a %variable% that will be parsed.

## ui/wpf/views/dialogs/subactions/twitch/twitchstartraiddialog.baml (2)

- This will allow you to start a raid to the user login that is specified in the above text box. Variables are supported.
- User Login

## ui/wpf/views/dialogs/subactions/twitch/twitchtimeoutuserdialog.baml (2)

- The user login can contain either a specific user's login, or a %variable% that will be parsed
- User Login

## ui/wpf/views/dialogs/subactions/twitch/twitchupdatechannelgueststarsettingsdialog.baml (6)

- Any values that are left blank, will not be changed
- Browser Source Audio Enabled (boolean)
- Group Layout
- Moderator Send Live Enabled (boolean)
- Regenerate Browser Sources (boolean)
- Slot Count (number)

## ui/wpf/views/dialogs/subactions/twitch/twitchupdategueststarslotdialog.baml (3)

- Destination Slot
- Source Slot
- The slot can contain a number, typically between 1 and 6, or a %variable% that will be parsed.

## ui/wpf/views/dialogs/subactions/twitch/twitchupdategueststarslotsettingsdialog.baml (6)

- Any values that are left blank, will not be changed
- Audio Enabled (boolean)
- Live (boolean)
- Slot (number, required)
- Video Enabled (boolean)
- Volume (number)

## ui/wpf/views/dialogs/subactions/twitch/twitchupdatepinnedchatmessagedurationdialog.baml (1)

- Duration support parsing.  Duration can either be empty, which means the Pinned Message would last until the stream ends, or it must be, or parse to a value between 30 and 1800.

## ui/wpf/views/dialogs/subactions/users/clearusersfromgroupdialog.baml (3)

- Add a Group!
- Items[0].Group
- No Groups Found!

## ui/wpf/views/dialogs/subactions/voicecontrol/voicecontrolsetcommanddialog.baml (3)

- Add a Voice Control Command!
- Items[0].Group
- No Voice Control Commands Found!

## ui/wpf/views/dialogs/subactions/voicecontrol/voicecontrolsetcommandstatedialog.baml (3)

- Add a Voice Control Command!
- Items[0].Group
- No Voice Control Commands Found!

## ui/wpf/views/dialogs/subactions/voicemod/voicemodcommonsetstatedialog.baml (1)

- Not Connected!

## ui/wpf/views/dialogs/subactions/voicemod/voicemodplaysounddialog.baml (2)

- Not Connected
- VoiceMod is Not Connected!

## ui/wpf/views/dialogs/subactions/voicemod/voicemodselectrandomvoicedialog.baml (1)

- Not Connected!

## ui/wpf/views/dialogs/subactions/voicemod/voicemodselectvoicebyiddialog.baml (3)

- Not Connected
- Voice ID
- VoiceId can be a fixed value or a parsed value using variables and/or inline functions.

## ui/wpf/views/dialogs/subactions/voicemod/voicemodselectvoicebynamedialog.baml (3)

- Not Connected
- Voice Name
- Voice Name can be a fixed value or a parsed value using variables and/or inline functions.

## ui/wpf/views/dialogs/subactions/voicemod/voicemodselectvoicedialog.baml (2)

- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/vtubestudio/vtubestudiocolortintdialog.baml (7)

- Filter Type
- Mix With Scene Lighting Color
- Not Connected
- Pick a Random Color
- Pick a color
- Random Color
- Tint All

## ui/wpf/views/dialogs/subactions/vtubestudio/vtubestudiocommonbynamedialog.baml (2)

- Name can be a fixed value or a parsed value using variables and/or inline functions.
- Not Connected

## ui/wpf/views/dialogs/subactions/vtubestudio/vtubestudioloadmodeldialog.baml (2)

- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/vtubestudio/vtubestudiomovemodeldialog.baml (8)

- Capture Model Position
- Optional values that are left blank, will not be changed.
- Position X (double, optional)
- Position Y (double, optional)
- Relative to Model (boolean, required)
- Rotation (double, optional)
- Size (double, optional)
- Time in Seconds (double, required)

## ui/wpf/views/dialogs/subactions/vtubestudio/vtubestudiosendrawrequestdialog.baml (3)

- Add Results to Arguments
- Not Connected
- Variable Prefix

## ui/wpf/views/dialogs/subactions/vtubestudio/vtubestudiosetexpressionstatedialog.baml (4)

- Fade Time
- No Expressions Found!
- Not Connected
- Not Connected!

## ui/wpf/views/dialogs/subactions/vtubestudio/vtubestudiotriggerhotkeydialog.baml (3)

- No Hotkeys Found!
- Not Connected
- VTube Studio is Not Connected!

## ui/wpf/views/dialogs/subactions/youtube/youtubebanuserdialog.baml (3)

- Not Connected
- The user id can contain either a specific user's id, or a %variable% that will be parsed
- User Id

## ui/wpf/views/dialogs/subactions/youtube/youtubecommonusergroupdialog.baml (3)

- Group Name
- The user login and group name can contain either a specific user's login, or a %variables% that will be parsed
- User Login

## ui/wpf/views/dialogs/subactions/youtube/youtubecreatepolldialog.baml (1)

- Options (Minimum of 2, maximum of 4)

## ui/wpf/views/dialogs/subactions/youtube/youtubeendpolldialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/subactions/youtube/youtubesendmessagedialog.baml (5)

- Fallback to Broadcaster
- Message.Length
- Not Connected
- Send using bot account
- {0}/200

## ui/wpf/views/dialogs/subactions/youtube/youtubesetdescriptiondialog.baml (5)

- Description.Length
- Not Connected
- Updating your YouTube stream information is an expensive call, please use this sparingly.
- You can either set a static description, and/or use variables to set a description.
- {0}/5000

## ui/wpf/views/dialogs/subactions/youtube/youtubesettitleanddescriptiondialog.baml (7)

- BroadcastTitle.Length
- Description.Length
- Not Connected
- Updating your YouTube stream information is an expensive call, please use this sparingly.
- You can either set a static title/description, and/or use variables to set a title/description.
- {0}/100
- {0}/5000

## ui/wpf/views/dialogs/subactions/youtube/youtubesettitledialog.baml (5)

- BroadcastTitle.Length
- Not Connected
- Updating your YouTube stream information is an expensive call, please use this sparingly.
- You can either set a static title, and/or use variables to set a title.
- {0}/100

## ui/wpf/views/dialogs/subactions/youtube/youtubetimeoutuserdialog.baml (3)

- Not Connected
- The user id can contain either a specific user's id, or a %variable% that will be parsed
- User Id

## ui/wpf/views/dialogs/subactionweightdialog.baml (1)

- Weighted Value

## ui/wpf/views/dialogs/timerdialog.baml (4)

- By default, timed actions will repeat, you can have them only trigger once, by unticking repeat, and it will trigger after being enabled
- If both options are set, then both criteria must be met for the action to occur. The action will only run if Y number have lines have been said, and if X seconds have passed.
- The time interval can also be set to a random value within a range, this random value is updated everytime the action is run.
- Timed actions can have either an interval set, where they will occur every X seconds, or a line count set, where they will occur every Y lines.

## ui/wpf/views/dialogs/triggers/commands/commandcommontriggerdialog.baml (1)

- Items[0].Group

## ui/wpf/views/dialogs/triggers/core/globalvariablecreatedtriggerdialog.baml (2)

- Leaving name empty is considered a catch-all and will trigger on any global variable being created
- Variable Name

## ui/wpf/views/dialogs/triggers/core/globalvariabledeletedtriggerdialog.baml (2)

- Leaving name empty is considered a catch-all and will trigger on any global variable being deleted
- Variable Name

## ui/wpf/views/dialogs/triggers/core/globalvariableupdatedtriggerdialog.baml (2)

- Leaving name empty is considered a catch-all and will trigger on any global variable updating
- Variable Name

## ui/wpf/views/dialogs/triggers/core/processstartedtriggerdialog.baml (1)

- Leaving name empty is considered a catch-all and will trigger on any process starting.

## ui/wpf/views/dialogs/triggers/core/processstoppedtriggerdialog.baml (1)

- Leaving name empty is considered a catch-all and will trigger on any process stopping.

## ui/wpf/views/dialogs/triggers/core/testtriggerdialog.baml (2)

- Delete All
- Right click to add an argument

## ui/wpf/views/dialogs/triggers/core/timedactiontriggerdialog.baml (1)

- Create Timer

## ui/wpf/views/dialogs/triggers/core/toastactivationtriggerdialog.baml (2)

- Leaving Toast Id empty is considered a catch-all and will trigger on any Toast Id.
- Toast Id

## ui/wpf/views/dialogs/triggers/core/userglobalvariableupdatedtriggerdialog.baml (3)

- Leaving name or login empty is considered a catch-all and will trigger on any user global variable updating
- User Login
- Variable Name

## ui/wpf/views/dialogs/triggers/crowdcontrol/crowdcontrolcoinexchangetriggerdialog.baml (2)

- Coin Type
- Exchange Source

## ui/wpf/views/dialogs/triggers/custom/customeventtriggerdialog.baml (2)

- Event Name
- Leaving Event Name empty is considered a catch-all and will trigger on any custom event name.

## ui/wpf/views/dialogs/triggers/donordrive/donordrivecommontriggerdialog.baml (2)

- Create DonorDrive
- Donor Drive

## ui/wpf/views/dialogs/triggers/elgato/wavelink/elgatowavelinkinputlevelmeterchangedtriggerdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/triggers/filetail/filetailchangedtriggerdialog.baml (2)

- Create File Tail
- File Tail

## ui/wpf/views/dialogs/triggers/filewatcher/filewatchercommontriggerdialog.baml (1)

- Create File Watcher

## ui/wpf/views/dialogs/triggers/inputs/inputkeypressedtriggerdialog.baml (3)

- Capture Key
- Key Combination
- Save Key

## ui/wpf/views/dialogs/triggers/kick/kickchannelupdatetriggerdialog.baml (1)

- Game Only

## ui/wpf/views/dialogs/triggers/kick/kickfirstwordstriggerdialog.baml (3)

- Is UserId
- Leaving user name empty is considered a catch-all and will trigger on any first words event.
- User Name

## ui/wpf/views/dialogs/triggers/kick/kickrewardredemptioncommontriggerdialog.baml (1)

- Create Reward

## ui/wpf/views/dialogs/triggers/meldstudio/meldstudiocommonconnectiontriggerdialog.baml (1)

- Add Connection

## ui/wpf/views/dialogs/triggers/meldstudio/meldstudioeventtriggerdialog.baml (1)

- Add Connection

## ui/wpf/views/dialogs/triggers/meldstudio/meldstudioscenechangedtriggerdialog.baml (2)

- Add Connection
- Scene Name

## ui/wpf/views/dialogs/triggers/midi/midimessagetriggerdialog.baml (1)

- Create Midi Event

## ui/wpf/views/dialogs/triggers/obsstudio/obsstudiocommonconnectiontriggerdialog.baml (1)

- Add Connection

## ui/wpf/views/dialogs/triggers/obsstudio/obsstudioeventtriggerdialog.baml (1)

- Add Connection

## ui/wpf/views/dialogs/triggers/obsstudio/obsstudioscenechangedtriggerdialog.baml (2)

- Add Connection
- Scene Name

## ui/wpf/views/dialogs/triggers/obsstudio/obsstudiovendoreventtriggerdialog.baml (3)

- Add Connection
- Event Name
- Vendor Name

## ui/wpf/views/dialogs/triggers/speechtotext/speechtotextcommontriggerdialog.baml (1)

- Voice Control

## ui/wpf/views/dialogs/triggers/streamerbot/streamerbotcustomwebhooktriggerdialog.baml (2)

- Custom Webhook
- Not Authenticated

## ui/wpf/views/dialogs/triggers/streamerbotremote/streamerbotremoteinstancecommontriggerdialog.baml (1)

- Not Authenticated

## ui/wpf/views/dialogs/triggers/streamerbotremote/streamerbotremoteinstancetriggertriggerdialog.baml (3)

- Event Name
- Leaving Event Name empty is considered a catch-all and will trigger on any remote event name.
- Not Authenticated

## ui/wpf/views/dialogs/triggers/streamlabsdesktop/streamlabsdesktopcommonconnectiontriggerdialog.baml (1)

- Add Connection

## ui/wpf/views/dialogs/triggers/streamlabsdesktop/streamlabsdesktopscenechangedtriggerdialog.baml (2)

- Add Connection
- Scene Name

## ui/wpf/views/dialogs/triggers/throwingsystem/throwingsystemitemhittriggerdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/triggers/throwingsystem/throwingsystemtriggercommontriggerdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/triggers/twitch/twitchfirstwordstriggerdialog.baml (3)

- Is UserId
- Leaving user name empty is considered a catch-all and will trigger on any first words event.
- User Name

## ui/wpf/views/dialogs/triggers/twitch/twitchgiftbombtriggerdialog.baml (2)

- Gift Sub Count Range
- Sub Type

## ui/wpf/views/dialogs/triggers/twitch/twitchgiftsubtriggerdialog.baml (3)

- Milestone Range (this is for the number of subs gifted over all time)
- Months Gifted
- Sub Type

## ui/wpf/views/dialogs/triggers/twitch/twitchpowerupredemptiontriggerdialog.baml (1)

- Power-up

## ui/wpf/views/dialogs/triggers/twitch/twitchresubtriggerdialog.baml (1)

- Cumulative Sub Range

## ui/wpf/views/dialogs/triggers/twitch/twitchrewardredemptioncommontriggerdialog.baml (1)

- Create Reward

## ui/wpf/views/dialogs/triggers/twitch/twitchstreamupdatetriggerdialog.baml (1)

- Game Only

## ui/wpf/views/dialogs/triggers/voicemod/voicemodsoundboardchangedtriggerdialog.baml (2)

- Leaving soundboard name empty is considered a catch-all and will trigger on any soundboard changed event.
- Soundboard Name

## ui/wpf/views/dialogs/triggers/voicemod/voicemodvoiceloadedtriggerdialog.baml (2)

- Leaving voice name empty is considered a catch-all and will trigger on any voice loaded event.
- Voice Name

## ui/wpf/views/dialogs/triggers/vtubestudio/vtubestudiocommontriggerdialog.baml (1)

- Not Connected

## ui/wpf/views/dialogs/triggers/websocketclient/websocketclientcommontriggerdialog.baml (1)

- Create Websocket Client

## ui/wpf/views/dialogs/triggers/websocketcustomserver/websocketcustomservercommontriggerdialog.baml (1)

- Create Custom Server

## ui/wpf/views/dialogs/triggers/youtube/youtubefirstwordstriggerdialog.baml (3)

- Is UserId
- Leaving user name empty is considered a catch-all and will trigger on any first words event.
- User Name

## ui/wpf/views/dialogs/twitch/twitchchannelrewarddialog.baml (17)

- (Optional)
- Background Color
- Global Cooldown
- Persist Counter
- Persist User Counter
- Pick a Random Color
- Redemption Skips Queue
- Reward Name
- RewardPrompt.Length
- RewardTitle.Length
- Streamer.bot Settings
- User Input Required
- channel points
- per Stream
- per User per Stream
- {0}/200
- {0}/45

## ui/wpf/views/dialogs/twitch/twitchpolldialog.baml (5)

- Channel Points Per Vote
- Create a New Poll
- How long viewers have to vote in the poll
- Response (Minimum of 2, maximum of 5)
- set to 0 to disable

## ui/wpf/views/dialogs/twitch/twitchpredictiondialog.baml (10)

- Chatters will receive a temporary chat badge indicating the option they voted for until the prediction ends.
- Creators and mods can create predictions. Viewers who guess the outcome correctly can win Channel Points. All predictions must follow Twitch's
- How long viewers have to guess the outcome
- Name the prediction
- Outcomes (Minimum of 2, maximum of 10)
- PredictionTitle.Length
- Start a Prediction
- Submission Preiod
- Terms of Service
- {0}/45

## ui/wpf/views/dialogs/updatedialog.baml (5)

- Login to your Streamer.bot Account to see beta/alpha channels.
- There is an update available!
- Up to Date
- View Notes
- {0} ({1})

## ui/wpf/views/dialogs/variableinspectordialog.baml (3)

- Copy All Variable Names
- Copy As Text Table
- Variable Value

## ui/wpf/views/dialogs/voicecontrolcommanddialog.baml (3)

- Confidence Threshold
- Override Global
- Stop After

## ui/wpf/views/pages/aboutpage.baml (12)

- A very special thanks to the following people who believed in me and this project.
- Also a nod to all those supporters past and present who are not listed above
- Created by: nate1280
- Dedicated to the loving memory of my mother.
- I also can not forget giving a nod to the following people
- I can not foget to thank the following who are on Streamer.bot's staff, providing support in the discord
- Ko-fi
- May you rest in peace; you will be missed. 1954-2021
- Patreon Supporters
- Streamer.bot
- Thank you to the following supporters on Patreon:
- Your stream, your rules—made better with Streamer.bot

## ui/wpf/views/pages/actionhistorypage.baml (5)

- Clear History
- Completed At
- How long it took for the action to run, this is in milliseconds
- Queued At
- Started At

## ui/wpf/views/pages/actionslandingpage.baml (7)

- Action History
- Pending Actions
- Queues keep the Actions flowing, or stopped when needed
- See Streamer.bot work, view and inspect variables of actions that are currently being run
- See actions that have finished, and learn more about if they succeeded, what variables were available, etc
- The core of Streamer.bot
- The heart of Streamer.bot, Actions are what defines what can happen and when

## ui/wpf/views/pages/actionspage.baml (11)

- ({0})
- Actions.Count
- Collapse All
- Expand All
- Open Trigger Viewer
- Right-click to add an Action
- Search above or right-click to add a Sub-Action
- Search above or right-click to add a Trigger
- Search to add trigger...
- SelectedActionSubActions.Count
- SelectedActionTriggers.Count

## ui/wpf/views/pages/commandspage.baml (3)

- Collapse All
- Data.Group
- Expand All

## ui/wpf/views/pages/dashboardpage.baml (27)

- 1.0.0
- Alpha Access
- Configure actions, queues and view action history
- Configure your streaming application settings
- Created by nate1280
- Explore the official documentation for Streamer.bot
- Gain early access to new features and updates before they are released to the public.
- Ideas & Suggestions
- If you enjoy Streamer.bot, please consider supporting nate1280 on Patreon.
- Join the Streamer.bot community!
- Keep the updates coming!
- Manage your chat commands
- Receive access to additional supporter benefits, including Custom Webhooks and Cloud Backups!
- Share and discuss ideas for new features or improvements to Streamer.bot
- Show your Support
- Stream Apps
- Streamer.bot
- Streamer.bot {0}
- Support Streamer.bot on Patreon!
- Support on Patreon
- Supporter Perks
- Update Available!
- View and modify your streaming platform settings
- Why donate?
- Your support helps keep Streamer.bot free for everyone, and shows your appreciation for the hard work that goes into maintaining and improving the application.
- Your support helps maintain continued development and ongoing improvements to Streamer.bot, ensuring it remains a powerful tool for streamers like you.
- https://www.patreon.com/nate1280

## ui/wpf/views/pages/integrations/crowdcontrolpage.baml (9)

- Auto Connect
- Auto Reconnect
- Automatically connect to CrowdControl when Streamer.bot starts up
- Automatically reconnect to CrowdControl when the connection is terminated
- Connecting...
- Connection Status
- Copy and paste your Overlay URL in this field
- Crowd Control
- Overlay URL

## ui/wpf/views/pages/integrations/donordrivecontrolpage.baml (6)

- Auto Monitor
- Date/Time
- Raised/Goal
- Stop All Clients
- Team Member
- {0:C2}

## ui/wpf/views/pages/integrations/elgatocamerahubpage.baml (12)

- Auto Connect
- Auto Reconnect
- Automatically connect to Elgato CameraHub when Streamer.bot starts up
- Automatically reconnect to Elgato CameraHub when the connection is terminated
- Configuring Elgato CameraHub
- Connecting...
- Connection Status
- Elgato CameraHub
- Help with Elgato CameraHub
- Related Support
- Retrying to connect
- The Elgato CameraHub integration requires a minimum CameraHub version of 2.0.0.5721

## ui/wpf/views/pages/integrations/elgatostreamdeckpage.baml (20)

- Auto Connect
- Auto Reconnect
- Auto Start
- Automatically connect to Elgato Stream Deck MCP when Streamer.bot starts up
- Automatically reconnect to Elgato Stream Deck MCP when the connection is terminated
- Automatically start the server when Streamer.bot starts up
- Connecting...
- Connection Status
- Elgato Stream Deck instances that are currently connected
- Elgato StreamDeck
- Enter the IP address for this server to bind to. For example, '127.0.0.1'
- Enter the port to use for server connection. Defaults to 8059
- Retrying to connect
- Server Status
- Session ID
- Start Server
- Starting...
- Stop Server
- Stream Deck MCP Server
- This requires the Enable MCP Deck to be checked in your Stream Deck preferences.

## ui/wpf/views/pages/integrations/elgatowavelinkpage.baml (14)

- Auto Connect
- Auto Reconnect
- Automatically connect to Elgato WaveLink when Streamer.bot starts up
- Automatically reconnect to Elgato WaveLink when the connection is terminated
- Available Sub-Actions
- Available Triggers
- Configuring Elgato WaveLink
- Connecting...
- Connection Status
- Elgato WaveLink
- Help with Elgato WaveLink
- Related Support
- Retrying to connect
- The Elgato WaveLink integration only supports WaveLink version 2.x, it will not work with 3.x

## ui/wpf/views/pages/integrations/hyperateiopage.baml (9)

- Add your HypeRate ID (CaSe SenSITiVe!!!!)
- Auto Connect
- Auto Reconnect
- Automatically connect to HypeRate.io when Streamer.bot starts up
- Automatically reconnect to HypeRate.io when the connection is terminated
- Connecting...
- Connection Status
- HypeRate ID
- HypeRate.io

## ui/wpf/views/pages/integrations/lumiastreampage.baml (8)

- Auto Connect
- Auto Reconnect
- Automatically connect to Lumia Stream when Streamer.bot starts up
- Automatically reconnect to Lumia Stream when the connection is terminated
- Connecting...
- Connection Status
- Copy and paste your token in this field
- Lumia Stream

## ui/wpf/views/pages/integrations/pallyggpage.baml (9)

- API Key
- Auto Connect
- Auto Reconnect
- Automatically connect to Pally.gg when Streamer.bot starts up
- Automatically reconnect to Pally.gg when the connection is terminated
- Connecting...
- Connection Status
- Copy and paste your API Key in this field
- Pally.gg

## ui/wpf/views/pages/integrations/pulsoidpage.baml (8)

- Auto Connect
- Auto Reconnect
- Automatically connect to Pulsoid when Streamer.bot starts up
- Automatically reconnect to Pulsoid when the connection is terminated
- Connecting...
- Connection Status
- Forget Account
- Forget any saved credentials for Pulsoid

## ui/wpf/views/pages/integrations/speakerbotpage.baml (9)

- Automatically connect to Speaker.bot when Streamer.bot starts up
- Automatically reconnect to Speaker.bot when the connection is terminated
- Connecting...
- Connection Status
- Enter the IP address Speaker.bot's WebSocket server is running on, '127.0.0.1'
- Enter the port Speaker.bot's WebSocket server is running on. Defaults to 7580
- Retrying to connect
- Speaker.bot
- The endpoint Speaker.bot uses, default is /

## ui/wpf/views/pages/integrations/streamelementspage.baml (3)

- Connect your StreamElements account to receive events
- Connecting...
- Forget this account?

## ui/wpf/views/pages/integrations/streamerbotwebsitepage.baml (3)

- Login to your Streamer.bot account in the bottom-left corner
- Streamer.bot Website
- Streamer.bot instances that have been seen by your account

## ui/wpf/views/pages/integrations/streamfogpage.baml (8)

- Auto Connect
- Auto Reconnect
- Automatically connect to Streamfog when Streamer.bot starts up
- Automatically reconnect to Streamfog when the connection is terminated
- Connecting...
- Connection Status
- Copy and paste your remote key in this field
- Remote Key

## ui/wpf/views/pages/integrations/streamlabspage.baml (3)

- Connect your Streamlabs account to receive events
- Connecting...
- Forget this account?

## ui/wpf/views/pages/integrations/streamlootspage.baml (8)

- Alerts Widget URL
- Auto Connect
- Auto Reconnect
- Automatically connect to StreamLoots when Streamer.bot starts up
- Automatically reconnect to StreamLoots when the connection is terminated
- Connecting...
- Connection Status
- Copy and paste your Alerts Widget URL in this field

## ui/wpf/views/pages/integrations/throwingsystempage.baml (11)

- Auto Connect
- Auto Reconnect
- Automatically connect to Throwing System when Streamer.bot starts up
- Automatically reconnect to Throwing System when the connection is terminated
- Connecting...
- Enter the IP address to connect to. For example, '127.0.0.1'
- Enter the port to use for the connection. Defaults to 42069
- Events Client
- Retrying to connect
- Throwing System
- Websocket Client

## ui/wpf/views/pages/integrations/tipeeestreampage.baml (8)

- Auto Connect
- Auto Reconnect
- Automatically connect to TipeeeStream when Streamer.bot starts up
- Automatically reconnect to TipeeeStream when the connection is terminated
- Connecting...
- Connection Status
- Forget Account
- Forget any saved credentials for TipeeeStream

## ui/wpf/views/pages/integrations/treatstreampage.baml (3)

- Connect your TreatStream account to receive events
- Connecting...
- Forget this account?

## ui/wpf/views/pages/integrations/voicemodpage.baml (7)

- Auto Connect
- Auto Reconnect
- Automatically connect to VoiceMod when Streamer.bot starts up
- Automatically reconnect to VoiceMod when the connection is terminated
- Connecting...
- Connection Status
- Retrying to connect

## ui/wpf/views/pages/integrations/vtubestudiopage.baml (12)

- Auto Connect
- Auto Reconnect
- Automatically connect to VTubeStudio when Streamer.bot starts up
- Automatically reconnect to VTubeStudio when the connection is terminated
- Connecting...
- Connection Status
- Enter the IP address to connect to. For example, '127.0.0.1'
- Enter the port to use for the connection. Defaults to 42069
- Forget Account
- Forget any saved credentials for VTubeStudio
- Retrying to connect
- VTube Studio

## ui/wpf/views/pages/midi/midiinpage.baml (4)

- Auto Open
- Command Type
- Device Name
- MIDI In

## ui/wpf/views/pages/midi/midioutpage.baml (3)

- Auto Open
- Device Name
- MIDI Out

## ui/wpf/views/pages/midi/midipage.baml (5)

- Create, edit and remove your output MIDI device associations
- Create, edit, and remove your MIDI Input associations and events
- MIDI In
- MIDI Out
- Modify your MIDI settings here.

## ui/wpf/views/pages/pendingactionspage.baml (2)

- Queued At
- Started At

## ui/wpf/views/pages/platforms/kick/kickchannelpointrewardspage.baml (5)

- Channel Point Rewards
- Collapse All
- Create Reward
- Expand All
- Refresh from Kick

## ui/wpf/views/pages/platforms/kick/kickpage.baml (29)

- Auto Reset Cache
- Bot Account
- Broadcaster Account
- Cancel Login
- Channel Point Rewards
- Chat Client
- Clear the cache on startup if the time since last startup exceeds the given interval
- Configure the first words cache
- Configure third party emote handling, changing these requires a restart
- Connect a bot account to send messages with a different user
- Connect your streaming account for core functionality
- Connecting...
- Copy Login Link
- Defaults to 5 minutes to balance accuracy and performance
- Emote Handlers
- First Words
- Forget this account?
- Keep track of active viewers in chat
- Kick's own API implementation is still very fluid, and lacking, so not every feature maybe implemented
- Log In (Default)
- Manage your Kick channel point rewards
- Manually reset the cache
- Present Viewers
- Streamer.bot Account Required.  Connect to the Streamer.bot website by clicking 'Login' in the bottom-left corner.
- Update Interval
- Whether to handle Seven TV emotes
- Your Kick account is linked on Streamer.bot
- Your Kick connection on the website has expired, this is required, click here to reconnect
- {0} minute(s)

## ui/wpf/views/pages/platforms/platformspage.baml (4)

- Login to your Kick account, and adjust settings.
- Login to your Twitch account, manage Chanel Rewards, Poll and Predictions, and settings.
- Login to your YouTube account, see your broadcasts, and alter settings.
- Pick your platform of choice to interact with your viewers.

## ui/wpf/views/pages/platforms/twitch/twitchchannelpointrewardspage.baml (5)

- Channel Point Rewards
- Collapse All
- Create Reward
- Expand All
- Reward Name

## ui/wpf/views/pages/platforms/twitch/twitchcustompowerupspage.baml (7)

- Bits Cost
- Collapse All
- Custom Power-Ups
- Expand All
- Not all API endpoints/EventSub events have been implemented by Twitch yet. Some features may currently be missing, once they are added on Twitch's side, they will be updated for Streamer.bot's usage.
- Refresh from Twitch
- Twitch Custom Power-Ups are a beta feature that not everyone has access to.

## ui/wpf/views/pages/platforms/twitch/twitchpage.baml (49)

- Auto Reset Cache
- Automatically run the Stream Update trigger when connecting to Twitch
- Bot Account
- Broadcaster Account
- Browse your past videos
- Cancel Login
- Channel Point Rewards
- Clear the cache on startup if the time since last startup exceeds the given interval
- Configure Twitch Sub Counter integration settings
- Configure the first words cache
- Configure third party emote handling, changing these requires a restart
- Configuring Twitch
- Connect a bot account to send messages with a different user
- Connect your streaming account for core functionality
- Connecting...
- Copy Login Link
- Custom Power-Ups
- Defaults to 5 minutes to balance accuracy and performance
- Emote Handlers
- EventSub Client
- First Words
- Forget this account?
- Gift Bombs
- Help with Twitch
- Keep track of active viewers in chat
- Keep track of users that create pyramids in your chat
- Live Update
- Log In (Default)
- Manage Polls on your Twitch broadcaster account
- Manage Predictions on your Twitch broadcaster account
- Manage your Twitch channel point rewards
- Manage your Twitch custom power-ups (beta)
- Manually reset the cache
- Minimum Width
- Not Ignored
- Present Viewers
- Related Support
- Shared Chat Participation
- Stream Update on Connect
- Sub Counter
- The minimum number of emotes required before starting to track a pyramid
- Update Interval
- Whether or not shared chat will be able to participate in creating/breaking Pyramids
- Whether or not to ignore Gift Subs from Gift Bombs
- Whether or not to use realtime data from Twitch, or artificial data
- Whether to handle BetterTTV emotes
- Whether to handle FrankerFaceZ emotes
- Whether to handle Seven TV emotes
- {0} minute(s)

## ui/wpf/views/pages/platforms/twitch/twitchpollspage.baml (4)

- Data.IsPollRunning
- New Poll
- Refresh Polls from Twitch
- Selected Poll

## ui/wpf/views/pages/platforms/twitch/twitchpredictionspage.baml (4)

- Data.IsPredictionRunning
- New Prediction
- Refresh Predictions from Twitch
- Selected Prediction

## ui/wpf/views/pages/platforms/twitch/twitchsubcounterpage.baml (12)

- A rollover will happen when this value is reached
- Enable automatic roll over once the subsction count reaches a set number
- Enable the Sub Counter for tracking of subscriptions and rollovers
- Output File
- Output Text
- Reset Sub Counter
- Reset sub-counter and rollover counters, this can not be undone
- Rollover Value
- Sub Counter
- The current value of the sub counter
- The file to write the sub-counter data to
- The output template to use when writing to the file specified above

## ui/wpf/views/pages/platforms/twitch/twitchvideopage.baml (6)

- Copy All Video Urls to Clipboard
- Created At
- Found {0} videos
- Save All to CSV
- Videos.Count
- View Count

## ui/wpf/views/pages/platforms/youtube/youtubebroadcastspage.baml (4)

- Broadcast Information
- Reset the information back to what the broadcast has
- Save the information for the broadcast
- Title (required)

## ui/wpf/views/pages/platforms/youtube/youtubepage.baml (28)

- Auto Monitor Live Broadcasts
- Auto Reset Cache
- Automatically connect to your YouTube Bot account when Streamer.bot starts up
- Automatically connect to your YouTube Broadcaster account when Streamer.bot starts up
- Bot Account
- Bot Account Auto Connect
- Broadcaster Account
- Broadcaster Account Auto Connect
- By clicking "I Agree" below, you are agreeing to YouTube's Terms of Service, Google's Privacy Policy, and Streamer.bot's Terms of Service and Privacy policy as linked below.
- Clear the cache on startup if the time since last startup exceeds the given interval
- Configure the first words cache
- Connect a bot account to send messages with a different user
- Connect your streaming account for core functionality
- Default Tags
- Defaults to 5 minutes to balance accuracy and performance
- First Words
- Forget this account?
- I Agree
- Keep track of active viewers in chat
- Manually reset the cache
- Present Viewers
- Privacy Policy
- Streamer.bot's YouTube quota has been exceeded! The quota will reset at Midnight PST!
- Terms of Service
- Update Interval
- When a Live broadcast is detected automatically start monitoring it
- Your YouTube broadcasts
- {0} minute(s)

## ui/wpf/views/pages/queuespage.baml (4)

- Completed Count
- Pause All Queues
- Pending Count
- Resume All Queues

## ui/wpf/views/pages/serverclients/customwebsocketclientspage.baml (1)

- Auto Connect

## ui/wpf/views/pages/serverclients/customwebsocketserverspage.baml (1)

- Auto Start

## ui/wpf/views/pages/serverclients/httpserverpage.baml (14)

- Auto Start
- Automatically start the server when Streamer.bot starts up
- Available Endpoints
- Configuring HTTP Server
- Enter the IP address for this server to bind to. For example, '127.0.0.1'
- Enter the port to use for server connection. Defaults to 7474
- Folder mappings for serving local files
- Help with HTTP Server
- Related Support
- Requests received by the HTTP server
- Server Status
- Start Server
- Starting...
- Stop Server

## ui/wpf/views/pages/serverclients/serverclientspage.baml (11)

- Create your own WebSocket Servers and manage them from within C#
- Create your own connections to WebSocket Servers and control them from within C#
- Custom WebSocket Clients
- Custom WebSocket Servers
- Enable integrations beyond the UI with Streamer.bot's build in WebSocket server.
- HTTP Server
- Manage network services
- Provide various URL endpoints for interacting with Streamer.bot
- Start a UDP server and react to incoming UDP packets
- UDP Server
- WebSocket Server

## ui/wpf/views/pages/serverclients/udpserverpage.baml (6)

- Auto Start
- Automatically start the server when Streamer.bot starts up
- Enter the port to use for server connection. Defaults to 4242
- Server Status
- Start Server
- Stop Server

## ui/wpf/views/pages/serverclients/websocketserverpage.baml (17)

- Auto Start
- Automatically start the server when Streamer.bot starts up
- Available Requests
- Clients that are currently connected
- Connected Clients
- Enter the IP address for this server to bind to. For example, '127.0.0.1'
- Enter the port to use for server connection. Defaults to 8080
- Help with WebSocket Server
- Related Support
- Server Status
- Start Server
- Starting...
- Stop Server
- The endpoint that the WebSocket server listens on
- The password required for authentication
- Wether or not to enforce authentication for all requests, or just priviledged
- Whether or not the WebSocket server requires authentication to connect

## ui/wpf/views/pages/services/creditspage.baml (4)

- Auto Reset
- Events to Record
- Track Top
- User Present (spoke)

## ui/wpf/views/pages/services/filefolderwatcherpage.baml (1)

- File/Folder Watcher

## ui/wpf/views/pages/services/filetailspage.baml (2)

- File Path
- File Tails

## ui/wpf/views/pages/services/processwatcherpage.baml (5)

- Auto Start
- Automatically start the Process Watcher when Streamer.bot starts up
- Process Watcher
- Service Status
- Starting...

## ui/wpf/views/pages/services/quotespage.baml (2)

- Data.Quotes.Count
- Re-index

## ui/wpf/views/pages/services/servicespage.baml (10)

- Configure options for the Credits service
- Create folder/file watchers to react to file changes
- File Tail
- File/Folder Watcher
- Process Watcher
- Receive events when applications on your computer start and/or stop!
- See the quotes that have been added, as well as add custom ones, or edit/delete existing.
- Setup a tail on a file and react to changes in realtime.
- Setup recurring timers.
- Start, stop or alter built in Services.

## ui/wpf/views/pages/settings/backupspage.baml (31)

- A description for your backup
- Backup Folder
- Backup Now
- Backup Progress
- Backup Status
- Backups currently available in your cloud storage
- Cloud Backups
- Cloud Backups are a supporter perk, and require you to be subscribed at the
- Create Backup
- Create Cloud Backup
- Create a backup and upload it to your cloud storage
- Higher tiers gives you more storage space to hold more backups.
- If you are already subscribed, thank you for your support. Make sure you are currently logged into your Streamer.bot account in the bottom-left corner of Streamer.bot. If you are logged in, then make sure you have also linked your
- Include auth.db
- Last backup: Never
- Last backup: {0:F}
- Other Instances
- Streamer.bot
- Streamer.bot Account
- Streamer.bot Cloud Backups
- Support on Patreon
- Thank You
- The folder to save backups to
- This Instance
- Whether or not to include your authentication keys in the backup
- You are currently not subscribed to Patreon, subscribe on Patreon to the Thank You tier or higher and get access to Cloud Backups and more!
- https://streamer.bot/user/settings
- https://www.patreon.com/nate1280
- on the
- tier or higher on Patreon.
- website.

## ui/wpf/views/pages/settings/compilersettingspage.baml (5)

- Add reference from file...
- Any references added to the common references list above will be automatically added to every Execute C# code when it's compiled
- C# Compiler
- Common References
- Making Changes to this list will not invalidate any currently compiled Execute C# Code sub-actions

## ui/wpf/views/pages/settings/defaultspage.baml (36)

- Always Run
- Case Sensitive
- Default settings to apply to new Actions
- Default settings to apply to new Commands
- Default settings to apply to new Switch Case groupings
- Exclude from Action Queue/History
- Global Cooldown
- Ignore Bot Messages
- Ignore Internal Messages
- Kick Message
- Persist Counter
- Persist User Counter
- Sub-Actions
- SubActionSwitchCase_CaseSensitive
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

## ui/wpf/views/pages/settings/generalsettingspage.baml (26)

- Action History
- Application Volume
- Audio Output Device
- Changing the log folder requires a restart of Streamer.bot
- Changing these settings requires a restart of Streamer.bot
- Configure the default audio output device Streamer.bot uses
- Disable the tracking of Actions to reclaim performance
- Enable or disable the viewers tab to reclaim performance
- Execute C# Code Editor
- Generate a new Instance Id for this instance of Streamer.bot
- Instance Id
- Log Folder
- Log Level
- Manually refresh audio output devices
- Reset the Instance Id for this instance of Streamer.bot
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
- {0}%

## ui/wpf/views/pages/settings/groupspage.baml (6)

- Add Group
- Add Multiple Twitch Users to Group
- Add User to
- Add Users
- Remove All
- SelectedGroup.Name

## ui/wpf/views/pages/settings/labspage.baml (6)

- A caveat to note, due to the nature of serializing/deserializing, not all data types will preserved. Ones that I am aware of are List<T> objects, these will become object[] arrays when loaded.
- A restart is REQUIRED after enabling or disabling this labs feature.
- Pending Action Cache
- This feature is very experimental, and I need feedback on it, for options, capabilities, etc.
- This labs feature will, on close, write to a database any outstanding pending actions, pending actions are actions that have not yet run, and are waiting to run, either because they're in a blocking queue, or a queue that is paused.
- When Streamer.bot is started, if this cache file is present, it will auto load in any actions that have been cached, as well as pause the queue that they belong to. In addition, an argument will be added, wasCached, this will be set to true; during normal operation, this variable will not exist.

## ui/wpf/views/pages/settings/settingspage.baml (14)

- Add common C# reference
- Add, edit and delete user groups
- Basic settings related to Streamer.bot
- C# Compile Settings
- Change backup settings, and force backup creation
- Change settings.
- Configure default options when creating new Actions, Commands and other
- General Settings
- Handle all things variables
- Manage different aspects of Streamer.bot's UI
- Streamer.bot {0} is available!
- Update Available
- User Interface
- Want to try out experimental features, can enable them here

## ui/wpf/views/pages/settings/userinterfacepage.baml (83)

- Ask for Confirmation on Close
- Auto Open Chat on Startup
- Auto Open Event Feed on Startup
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
- Comment Color
- Custom Websocket Clients
- Custom Websocket Servers
- Dark Mode
- Disable Capturing of Variable Viewer Window
- Do not show Streamer.bot's splash screen when starting
- Duplicate Sub-Action Location
- Enabled Sub-Actions
- Enabled Triggers
- File Tails
- File/Folder Watcher
- HTTP Server
- Hide Splash Screen
- Light Mode
- MIDI In
- MIDI Out
- Meld Studio
- Minimize to Tray
- Minimize to Tray on Close
- NavPanelMidi_MidiIn
- NavPanelMidi_MidiOut
- NavPanelPlatforms_Kick
- NavPanelPlatforms_Twitch
- NavPanelPlatforms_YouTube
- NavPanelServersClients_CustomWebsocketClients
- NavPanelServersClients_CustomWebsocketServers
- NavPanelServersClients_HttpServer
- NavPanelServersClients_UdpServer
- NavPanelServersClients_WebsocketServer
- NavPanelServices_Credits
- NavPanelServices_FileFolderWatcher
- NavPanelServices_FileTails
- NavPanelServices_ProcessWatcher
- NavPanelServices_Quotes
- NavPanelServices_Timers
- NavPanelStreamApps_MeldStudio
- NavPanelStreamApps_ObsStudio
- NavPanelStreamApps_PolyPop
- NavPanelStreamApps_StreamlabsDesktop
- NavPanelVoiceControl_VCCommands
- NavPanelVoiceControl_VCLog
- NavPanelVoiceControl_VCSettings
- Navigation Panel
- OBS Studio
- Pick either Light Mode or Dark Mode for Streamer.bot
- Process Watcher
- Reset Delete Confirmations
- Reset Integrations
- Reset Navigation Items
- Servers/Clients
- Show or hide Commands page
- Stream Apps
- Streamlabs Desktop
- Sub-Action Disabled Color
- Sub-Actions
- This will prevent the Variable Viewer window from appearing in any form of window/screen capturing
- UDP Server
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

## ui/wpf/views/pages/settings/variablespage.baml (5)

- 1. Global Variable Viewer
- 2. Action History Variable Inspecting
- Mask Variable Containing
- Variable Masking
- Variables that contain these words will have their values masked with * in the following areas:

## ui/wpf/views/pages/streamapps/meldstudiopage.baml (13)

- Auto Connect
- Current Scene
- Meld Studio
- Meld Studio Information
- NOT Recording!
- NOT Streaming!
- Recording!
- Select a Meld Studio Connection
- SelectedConnection.Name
- Stream Status
- Streaming!
- Update All Actions To Use Default
- {0} is NOT connected!

## ui/wpf/views/pages/streamapps/obsstudiopage.baml (13)

- Auto Connect
- Current Scene
- NOT Recording!
- NOT Streaming!
- OBS Information
- OBS Studio
- Recording!
- Select an OBS Connection
- SelectedConnection.Name
- Stream Status
- Streaming!
- Update All Actions To Use Default
- {0} is NOT connected!

## ui/wpf/views/pages/streamapps/polypoppage.baml (8)

- Auto Start
- Automatically start the server when Streamer.bot starts up
- Enter the IP address for this server to bind to. For example, '127.0.0.1'
- Enter the endpoint to listen to for the connection.  Defaults to '/'
- Enter the port to use for server connection. Defaults to 9652
- Server Status
- Start Server
- Stop Server

## ui/wpf/views/pages/streamapps/streamappspage.baml (8)

- A game engine for your live streams
- Add, edit and manage Streamlabs Desktop instances
- An up and coming heavy weight
- Meld Studio
- OBS Studio
- Pick your favorite streamming application, get it connected, and start creating!
- Streamlabs Desktop
- The defacto standard for streaming

## ui/wpf/views/pages/streamapps/streamlabsdesktoppage.baml (13)

- Auto Connect
- Current Scene
- NOT Recording!
- NOT Streaming!
- Recording!
- Select a Streamlabs Desktop Connection
- SelectedConnection.Name
- Stream Status
- Streaming!
- Streamlabs Desktop
- Streamlabs Desktop Information
- Update All Actions To Use Default
- {0} is NOT connected!

## ui/wpf/views/pages/viewerspage.baml (25)

- (in user list)
- (not in user list)
- 2,3
- Bits Donated
- Channel Points Spent
- Data.SelectedViewer
- DataContext.SelectedBitsDonated
- DataContext.SelectedChannelPointsRedeemed
- DataContext.SelectedPyramidsMade
- DataContext.SelectedRaidsSent
- DataContext.SelectedRaidsTotalViewers
- DataContext.SelectedViewer
- DataContext.SelectedViewerGroupsText
- Hide Not Present
- Jewels Gifted
- Kicks Gifted
- Last Active
- Pyramids Made
- Select a viewer from the list to view their information.
- Timeout Exempt
- User ID
- User Information
- raids,
- total viewers
- {0:N0}

## ui/wpf/views/pages/voicecontrol/voicecontrolcommandspage.baml (1)

- Stop After

## ui/wpf/views/pages/voicecontrol/voicecontrolpage.baml (4)

- Create, edit, and remove Voice Control Commands
- Modify settings related to Voice Control
- View a list of what Voice Control has been hearing
- Voice Control related settings

## ui/wpf/views/pages/voicecontrol/voicecontrolsettingspage.baml (19)

- Audio Input Device
- Auto Start Listen
- Automatically start listening for voice commands when Streamer.bot starts
- Available Sub-Actions
- Available Triggers
- Confidence Threshold
- Configure the device to use for speech recognition
- Configuring Voice Control
- Help with Voice Control
- Listening Status
- Log Speech to Text Dictation
- Manually refresh audio input devices
- Related Support
- Start Listening
- Starting...
- Stop Listening
- The confidence the speech engine must have in its recognition
- The locale to use for speech recognition
- Whether or not to log any speech to text dication

## ui/wpf/views/windows/exportwindow.baml (21)

- Actions ({0})
- Auto Connect
- Auto Start
- Clicking export will export your selected Actions, Queues, Commands, Timed Actions, Websocket Servers and Websocket Clients to your clipboard, and you can share them everywhere.
- Commands ({0})
- Export to Clipboard
- Export to File
- ExportActions.Count
- ExportCommands.Count
- ExportQueues.Count
- ExportTimedActions.Count
- ExportWebsocketClients.Count
- ExportWebsocketServers.Count
- Queues ({0})
- Remove all actions from export
- Remove all commands from export
- Remove all websocket clients from export
- Remove all websocket servers from export
- Timed Actions ({0})
- Websocket Clients ({0})
- Websocket Servers ({0})

## ui/wpf/views/windows/globalvariableviewerwindow.baml (12)

- Add User
- Add Variable
- Data.ShowLastWriteColumn
- Delete All Variables
- Delete Filtered Variables
- Global Variables
- Last Write
- Non-Persisted Globals
- Non-Persisted User Globals
- Persisted Globals
- Persisted User Globals
- Show LastWrite Column

## ui/wpf/views/windows/importwindow.baml (14)

- -1
- Auto Connect
- Auto Start
- Exclude all commands from import
- Exclude all from Import
- Exclude all timed actions from import
- Exclude all websocket clients from import
- Exclude all websocket servers from import
- Export Version
- Import String
- Import contains custom C# code. Ensure you trust the author and source of this import!
- Streamer.bot Version
- Websocket Clients
- Websocket Server

## ui/wpf/views/windows/webviewwindow.baml (2)

- Loading...
- There was an error trying to initialize WebView
