; If you don't know the syntax, read from top to bottom, read every comment, you'll become a master when you finish.

; Important Note: If /* */ is used for comments, both /* and */ must appear at the beginning of line.

/*
Important Note:
  Use Windows line break (CRLF), not Unix (LF). This is Windows!
  If you downloaded this file from github, remember to change back to CRLF manually, because I've set my git to auto-convert to LF.

Style Guide:
  Use PascalCase, although the language is case insensitive.
*/


/*
Purpose:
  Auto Execute Zone
Syntax:
  On load, the script will run from top down, until a keyword Return or :: or Exit is encountered. So put the things you want to autorun on the top.
*/
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Sql := false ; This global variable needs to be declared for the auto CAPITAL sql keywords to work

; Things starting with a # are "directives", which will run no matter where you put them. But by tradition, some directives are also put in the Auto Execute Zone.
#SingleInstance force ;if this script is run twice, auto replace the previous one with the new one.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

; #Include means import another file as if it's copied into this position.
; If you're learning the syntax from reading the comments, follow the order of these files, one by one, don't jump around.
#Include SubScripts\Paths.ahk
#Include SubScripts\Remaps.ahk
#Include SubScripts\HotStrings.ahk
#Include SubScripts\ActivateApps.ahk
#Include SubScripts\OpenPaths.ahk

; App specific hotkeys: hotkeys that work only inside certain apps
#Include SubScripts\AppSpecific\ConEmu.ahk
#Include SubScripts\AppSpecific\FileExplorer.ahk
#Include SubScripts\AppSpecific\Evernote.ahk
#Include SubScripts\AppSpecific\SublimeText.ahk


/*
Purpose:
  Some use inside Anki
*/

Numpad0 & 1::
  SendInput {Home}{Delete 7}-{Left}+{End}{F8} ;在Anki里面format从Collins贴过来的例句
  Return
/*
Purpose:
  Remap Numpad0 + Numpad keys to be Win+number keys, in order to mimic Windows Hotkey to task bar apps
*/

Numpad0 & Numpad1::Send #1
Numpad0 & Numpad2::Send #2
Numpad0 & Numpad3::Send #3
Numpad0 & Numpad4::Send #4
Numpad0 & Numpad5::Send #5
Numpad0 & Numpad6::Send #6
Numpad0 & Numpad7::Send #7
Numpad0 & Numpad8::Send #8
Numpad0 & Numpad9::Send #9
Numpad0 & NumpadDot::Send #0
Numpad0::Numpad0 ;restore Numpad0

Numpad0 & NumpadDiv::
  Send {Volume_Mute}
  Return

Numpad0 & NumpadMult::
  IfWinExist ahk_class SpotifyMainWindow
    WinActivate
  Else Run C:\Users\Zhi\AppData\Roaming\Spotify\Spotify.exe
  Return

Numpad0 & NumpadAdd::
  IfWinExist ahk_class kwmusicmaindlg
    WinActivate
  Else Run C:\Dropbox\Portables\KwMusic\kuwo\kuwomusic\8.5.2.0_UG6\bin\KwMusic.exe
  Return

` & f::
Numpad0 & NumpadSub::
  IfWinExist ahk_exe foobar2000.exe
    WinActivate
  Else Run C:\Dropbox\Portables\Foobar2000\foobar2000.exe
  Return


/*
Purpose:
  After typing the hotstring SqlOn, Sql keywords will auto capitalize. Type SqlOff to stop.
*/

SqlOn()
{
  global Sql
  Sql := true
}

SqlOff()
{
  global Sql
  Sql := false
}

::SqlOn:: ;if you want a hotstring to call a function, you must put the function call onto a separate line.
  SqlOn()
  Return
::SqlOff::
  SqlOff()
  Return

#Hotstring *0 ?0

#If Sql = true
::show::SHOW
::use::USE
::database::DATABASE
::databases::DATABASES
::table::TABLE
::select::SELECT
::from::FROM
::where::WHERE
::order::ORDER
::group::GROUP
::by::BY
::join::JOIN
::insert::INSERT
::into::INTO
::update::UPDATE
::set::SET
::delete::DELETE
::having::HAVING
::in::IN
::like::LIKE
::and::AND
::or::OR
::is::IS
::not::NOT
::null::NULL
::as::AS
::limit::LIMIT
::offset::OFFSET
::desc::DESC
::drop::DROP
::schema::SCHEMA
::if::IF
::exists::EXISTS
::create::CREATE
::default::DEFAULT
::primary::PRIMARY
::key::KEY
::values::VALUES
::unique::UNIQUE
::column::COLUMN
::columns::COLUMNS
::unsigned::UNSIGNED
:*:integer::INTEGER
:*:int(::INT(
:*:varchar::VARCHAR
:*:char::CHAR
:*:text::TEXT
:*:count::COUNT
#If

  ;============以下是两台电脑不同的行为=================

;把Lenovo笔记本的右Alt和右Ctrl换成PageUp和PageDown: 这个问题经过反复测试, 用了很多写法, 都不理想, 所以改用KeyTweak了

; RCtrl::AppsKey ; 把右Alt换成menu键, 这是给Logiteck键盘用的。因为Laptop的右Alt已经用KeyTweak换成PageUp了, 所以不影响

; >!Backspace::Send {Delete} ;其实这个本来已经设置过!Backspace了, 但为了恢复RAlt的功能, 只能随便再设一个, 这样上一行就会变长fires on key up

;我本来想把Desktop的Logitech键盘的Fn换成右键, 但后来发现这个Fn是非常底层的一个按键, AutoHotkey和KeyTweak都搞不定

;我本来想把联想电脑的Fn和Ctrl互换, 但后来发现这个Fn是非常底层的一个按键, AutoHotkey和KeyTweak都搞不定

; RControl::
;   IfNotExist, D:\Archive
;     Send,{PgDn}
;   Return

; RAlt::
;   IfNotExist, D:\Archive
;     Send,{PgUp}
;   Return

` & l::
Numpad0 & l::
  IfWinExist Slack
    WinActivate Slack
  Else IfExist, D:\Archive
    Run C:\Users\Zhi\AppData\Local\slack\slack.exe
  Else Run C:\Users\zhiyi\AppData\Local\slack\slack.exe ;这两个电脑的User Directory不同好蛋疼啊, 以后重装的时候一定不能直接用Outlook帐号登录
  Return

; temp: for changing article title in Evernote (needed when archiving 说说咱家娃)
` & LAlt::
  MouseGetPos, x, y
  MouseMove, 1145, 270
  Send {Click 3}^c{F2}
  Sleep 200
  Send ^v
  MouseMove, x, y
  Return

; temp but may be useful in the future when recording videos:
Numpad0 & Left::
  MouseGetPos, x, y
Numpad0 & Right::
  MouseMove, x, y
