; Important Note: If /* */ is used for comments, both /* and */ must appear at the beginning of line.

/*
Important Note:
  Use Windows line break (CRLF), not Unix (LF). This is Windows!
  I've set Git to auto-convert to LF on commit, so remember to change manually after download.

Note:
  I can never remember all these syntaxes, so I try to write enough comments for myself, and put these hotkeys in the order of simple to complex.

Style Guide:
  Use PascalCase, although the language is case insensitive.
*/

/*
Goal:
  Auto Execute Zone
Syntax:
  On load, the script will run from top down, until a Return or :: or Exit is encountered. So put the things you want to run on the top
  In fact, the things starting with a # are directives, they will run no matter where you put them. But traditionally these settings are all set on the top.
*/
#SingleInstance force ;if this script is run twice, auto replace the previous one with the new one.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

NumpadClear::Up
NumpadEnd::Left
NumpadPgDn::Right
NumpadLeft::Home
NumpadRight::End
NumpadIns::Delete
NumpadDel::BackSpace

RAlt::PgUp
RWin::PgDn
RCtrl::
  IfExist, C:\AMD ; This will be true if it's my laptop,
    Send {PgDn}
  Return

, & m::Send {BackSpace}
. & m::Send ^{BackSpace}
/::Enter


/*
Goal:
  Remap CapsLock to RCtrl
Syntax:
  key::target
  Everything in AutoHotkey revolves around the double colon :: .
  Basically it means the left triggers the right.
Note :
  Has to be RCtrl, because I need LCtrl for other things.
*/
CapsLock::RControl

/*
Goal:
  Simple examples of using ` as a modifier key.
Syntax:
  hotkey::Send KeyName
  & means key combination. Send can be omitted unless & is used on the left. In this case Send can't be omitted.
  Curly braces means a key. Without curly braces it'll be sent as string input.
*/
` & =::Send {Volume_Up}
` & -::Send {Volume_Down}
` & m::Send {Volume_Mute}

/*
Goal:
  Restore the original function of ` key
Explain:
  ` no longer works since it has become a modifier key
*/
`::` ; Do this, and ` will be restored, but fires on key up
+`::~ ; + means shift. This restores ~, fires immediately
; #`::#` ; # means Win. Restores #`, fire immediately


^`::^` ; ^ means Ctrl
!`::!` ; ! means Alt

/*
Goal:
  LCtrl + enter => new line below
  LCtrl + shift + enter => new line above
  RCtrl + semicolon => semicolon at line end and enter
  LCtrl + semicolon => semicolon
Syntax:
  hotkey::Send KeySequence
  <^ means LCtrl, >^ means RCtrl.
*/
<^Enter::Send {End}{Enter}
<^+Enter::Send {Home}{Enter}{Up}
>^;::Send {End}{;}{Enter}
<^;::Send {;}

/*
Goal:
  If LCtrl was pressed down and up with no other keys combined, fire a mouse click on up.
  I'm likely the only person on earth who needs this.
Note:
  This works only because LCtrl has been set to be a modifier key, otherwise the script will fire the mouse click immediately on key down
*/
LControl::Click

/*
Goal:
  Hotstrings and auto-replace
Syntax:
  ::what you type::what it'll turn into
  Triggers after an "ending character" is typed, which includes space and enter and punctuations.
  Add O between the first two colons means don't display the ending character
  Add * between the first two colons means fire immediately without waiting for the ending character.
  Add ? between the first two colons means fire even the hotstring is the second half of a word
  # and ^ and + needs an R as escape char, forgot why.
Background Story:
  The hotstrings are inspired by Chinese
*/
:?*:qian::$
:?*:qier::$(''){Left}{Left}
:?*:baif::%
:?*:gong::&
:?*:tong::&
:?*:jian::-
:?*:xian::-
:?*:xiah::_ ;xiahua
:?*:xing::*
:?*:cheng::*
:?*:chuh::/ ;chuhao
:?*:gang::/
:?*:deng::=
:?*R:jiah::+ ;jiahao
:?*R:jing::#
:?*R:jier::^
:?*:duihao::✔
:?*:wujiao::★
:?*:shalou::⏳
:?*:eee::Ⓔ
:?*:cslg::console.log(){left}
:?*:csif::console.info(){left}
:?*:cswn::console.warn(){left}
:?*:cser::console.error(){left}
:?*:cstb::console.table(){left}
:?*:cstm::console.time(){Enter}{Enter}console.timeEnd(){Up}{Tab}
:?*:csgp::console.groupCollapsed(){Enter}{Enter}console.groupEnd(){Up}{Tab}
:?O:git com::git commit -m ""{left}

/*
Goal:
  In order to use alt-tab as little as possible, the most frequently used apps should each have a shortcut.
Syntax:
  If more than one line of code triggered by a hotkey, add Return in the end.
*/
` & t::
  IfWinExist ahk_exe ConEmu64.exe
    WinActivate
  Else Run D:\Dropbox\Portables\ConEmu Portable - PreviewVersion171109\ConEmu64.exe
  Return

` & e::
  IfWinExist ahk_exe Evernote.exe
    WinActivate
  Else Run C:\Users\Zhi\AppData\Local\Apps\Evernote\Evernote\Evernote.exe
  Return

` & u::  ; µTorrent minimizes to tray, so need to WinShow first
  WinShow µTorrent
  WinActivate µTorrent
  Return

` & s::  ; Sublime Text sometimes pops up the register window, deal with it at the same time
  IfWinExist ahk_exe sublime_text.exe
  { IfWinExist This is an unregistered copy
    { WinKill This is an unregistered copy
      WinActivate ahk_exe sublime_text.exe
      Return
    }
    Else WinActivate
  }
  Else Run D:\Dropbox\Portables\Sublime Text 3\sublime_text.exe
  Return

` & d::
  IfWinExist Dropbox
    WinActivate Dropbox
  Else Run D:\Dropbox
  Return

` & g::
  IfWinExist Google Drive
    WinActivate Google Drive
  Else Run D:\Google Drive
  Return

` & 1::
Numpad0 & 1::
  SendInput {Home}{Delete 7}-{Left}+{End}{F8} ;在Anki里面format从Collins贴过来的例句
  Return

Numpad0::Numpad0 ;如果没有这一句, 单按Numpad0会失去任何功能, 因为Numpad0已经变成一个功能键。加了这句之后, Numpad0抬起时会打出0


Numpad0 & Numpad1::Send #1 ;左手可以操作, 故暂时留空, 以后有需要再用,
Numpad0 & Numpad2::Send #2
Numpad0 & Numpad3::Send #3
Numpad0 & Numpad4::Send #4 ;以下都是Mirror Win+数字键
Numpad0 & Numpad5::Send #5
Numpad0 & Numpad6::Send #6
Numpad0 & Numpad7::Send #7
Numpad0 & Numpad8::Send #8
Numpad0 & Numpad9::Send #9
Numpad0 & NumpadDot::Send #0 ;Win+0也是有功能的,用点来代替0

;另外一个思路：在NumLock熄灭的情况下，把NumIns remap到win，把其他的Num键remap到主键盘的数字键。这样NumLock点亮的情况不受影响。缺点是每次想用小键盘输入数字的时候都要点亮NumLock, 不实用


Numpad0 & NumpadDiv::
  Send {Volume_Mute}
  Return

; The If all parameters of WinActivate are omitted, the Last Found Window will be used.
Numpad0 & NumpadMult::
  IfWinExist ahk_class SpotifyMainWindow
    WinActivate
  Else Run C:\Users\Zhi\AppData\Roaming\Spotify\Spotify.exe
  Return

Numpad0 & NumpadAdd::
  IfWinExist ahk_class kwmusicmaindlg
    WinActivate
  Else Run D:\Dropbox\Portables\KwMusic\kuwo\kuwomusic\8.5.2.0_UG6\bin\KwMusic.exe
  Return

` & f::
Numpad0 & NumpadSub::
  IfWinExist ahk_exe foobar2000.exe
    WinActivate
  Else Run D:\Dropbox\Portables\Foobar2000\foobar2000.exe
  Return

` & p::
Numpad0 & p::
  IfWinExist ahk_exe PotPlayerMini64.exe
    WinActivate
  Return

; ` & f::
; Numpad0 & f::
;   IfWinExist ahk_exe firefox.exe
;     WinActivate ahk_exe firefox.exe
;   Else Run C:\Program Files (x86)\Mozilla Firefox\firefox.exe
;   Return

Numpad0 & Right::
  IfWinExist uTorrent
    WinActivate uTorrent
  Else Run D:\Downloads\uTorrent
  Return

Numpad0 & Up::
  IfWinExist (D:) ;只需要窗口Title里面包含(D:)就行了
    WinActivate (D:)
  Else Run D:\
  Return

;============以下是两台电脑不同的行为=================

;把Lenovo笔记本的右Alt和右Ctrl换成PageUp和PageDown: 这个问题经过反复测试, 用了很多写法, 都不理想, 所以改用KeyTweak了

RCtrl::AppsKey ; 把右Alt换成menu键, 这是给Logiteck键盘用的。因为Laptop的右Alt已经用KeyTweak换成PageUp了, 所以不影响
>!Backspace::Send {Delete} ;其实这个本来已经设置过!Backspace了, 但为了恢复RAlt的功能, 只能随便再设一个, 这样上一行就会变长fires on key up

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
