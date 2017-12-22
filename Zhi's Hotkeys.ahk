; Important Note: If /* */ is used for comments, both /* and */ must appear at beginning of line.

/*Important Note:
	Use Windows line break (CRLF), not Unix (LF). This is Windows!
	My git might have auto-converted it for me, so if downloaded from GitHub, first change to CRLF manually.
*/

/*Important note:
	(This is just my current understanding, could be wrong.)
	AutoHotkey scripts don't run from top to bottom. It's more like a list of rules / functions waiting to be called.
	Therefore you can't do something like this:
		if (condition) {
			rule
		} else {
			rule
		}
*/
;==========================================================


/* 1.
Goal:
	Remap CapsLock to RCtrl
Syntax:
	hotkey::target
Note :
	Has to be RCtrl, because I need LCtrl for other things.
	Sometime it's buggy on laptops, so it's more reliable to use KeyTweak on this one. I did on my laptop.
*/
CapsLock::RControl

/*1.
Goal:
	Show some examples of using ` as a modifier key.
Syntax:
	Everything in AutoHotkey revolves around the double colon :: .
	Basically it means the left triggers the right.
	Curly braces means a key. Without curly braces it'll be send as string
*/
` & =::Send {Volume_Up}
` & -::Send {Volume_Down}
` & m::Send {Volume_Mute}

/*1.
Goal:
	Restore the original function of ` key
Explain:
	Since ` has become a modifier key, it no longer works.
*/
`::` ;同上, 抬起时打出`
+`::~ ;同上, 为了能够打出~
#`::#` ; 同上, 修复Win+`
^`::^` ; 同上, 修复Ctrl+`
!`::!` ; 同上, 修复Atl+`


/* 2.
Goal:
	LCtrl + enter => new line below
	LCtrl + shift + enter => new line above
	RCtrl + semicolon => semicolon at line end and enter
	LCtrl + semicolon => semicolon
	semicolon => semicolon at line end
Syntax:
	hotkey::Send action
	^ means Ctrl the modifier, <^ means LCtrl, Send means send a bunch of inputs
*/
<^Enter::Send {End}{Enter}
<^+Enter::Send {Home}{Enter}{Up}
>^;::Send {End}{;}{Enter}
<^;::Send {;}
$;::Send {End}{;} ;the dollor sign prevents the hotkey to trigger itself

/* 3.
Goal:
	If LCtrl was pressed down and up with no other keys combined, fire a mouse click on up
Note:
	This only works when combined with 2., because if LCtrl isn't set to be a modifier key, the script will fire the mouse click immediately on key down, no need to wait for key up.
*/
LControl::Click

/* 4.
Goal:
	Hotstrings and auto-replace
Syntax:
	::what you type::what it'll turn into
	Triggers after you type an "ending character", which is a space / enter / punctuation.
	Add O between the first two colons means don't display the ending character
	Add * between the first two colons means fire immediately without waiting for the ending character.
	Add ? between the first two colons means fire even the hotstring is the second half of a word
	# and ^ needs an R as escape char, forgot why.
Background Story:
	The hotstrings are inspired by Chinese
*/

:?*:qian::$(''){Left}{Left}
:?*:meiyuan::$
:?*R:jing::#
:?*:baifen::%
:?*R:jier::^
:?*:gong::&
:?*:tong::&
:?*:xing::*
:?*:duihao::✔
:?*:wujiao::★
:?*:shalou::⏳
:?*:eee::Ⓔ
:?*:cslg::console.log(){left}
:?O:git com::git commit -m ""{left}

/* 5.
Goal:
	When LAlt is pressed, use ijkl as arrow keys, h and ; as home and end, , and . as PgUp and PgDn
	Shift+, Ctrl+, Shift+Ctrl+ these keys also need to function
	All these aim to eliminate right hand moving back and forth, so LAlt+BackSpace should be delete
Syntax:
	! means alt, ^ means ctrl, + means shift
Stories:
	Alt wasn't my first choice as the modifier. It's actually my 5th choice. The first 4 failed as follows:
	Tab: shift-tab and ctrl-tab got in the way, they always fire
	q: letter q suffers from firing on key up, and shift-q needs to be bind for Q, and shift-q always fire
	LCtrl: can't make LCtrl+RCtrl+keys work
	LWin: All is good, except Win-L always fire. Any Win hotkey can be disabled by RegEdit, but Win-L can't. Are you kidding me?
*/


!j::Send {Left}
+!j::Send +{Left}
!l::Send {Right}
+!l::Send +{Right}
!i::Send {Up}
+!i::Send +{Up}
!k::Send {Down}
+!k::Send +{Down}
!h::Send {Home}
+!h::Send +{Home}
!;::Send {End}
+!;::Send +{End}
!u::Send ^{Left}
+!u::Send +^{Left}
!o::Send ^{Right}
+!o::Send +^{Right}
!,::Send {PgUp}
^!,::Send ^{PgUp}
!.::Send {PgDn}
^!.::Send ^{PgDn}
!Backspace::Send {Delete}

/* 6.
Goal:
	Frequently used apps should each have a shortcut. Use alt-tab as little as possible
Syntax:
	If more than one line of code is needed
*/
` & 1::
Numpad0 & 1::
	SendInput {Home}{Delete 7}-{Left}+{End}{F8} ;在Anki里面format从Collins贴过来的例句
	Return

Numpad0::Numpad0 ;如果没有这一句, 单按Numpad0会失去任何功能, 因为Numpad0已经变成一个功能键。加了这句之后, Numpad0抬起时会打出0


;Numpad0 & Numpad1:: ;左手可以操作, 故暂时留空, 以后有需要再用,
;Numpad0 & Numpad2:: ;同上
;Numpad0 & Numpad3:: ;同上
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

` & e::
Numpad0 & NumpadEnter::
	IfWinExist ahk_exe Evernote.exe
		WinActivate
	Else Run C:\Users\Zhi\AppData\Local\Apps\Evernote\Evernote\Evernote.exe
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

` & s::
Numpad0 & s::
	IfWinExist ahk_exe sublime_text.exe
	{ IfWinExist This is an unregistered copy
		{	WinKill This is an unregistered copy
			WinActivate ahk_exe sublime_text.exe
			Return
		}
		Else WinActivate
	}
	Else Run D:\Dropbox\Portables\Sublime Text 3\sublime_text.exe
	Return

` & t::
Numpad0 & t::
	IfWinExist ahk_exe ConEmu64.exe
		WinActivate
	Else Run D:\Dropbox\Portables\ConEmu Portable - PreviewVersion171109\ConEmu64.exe
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

` & u::  ; µTorrent minimizes to tray, so need to WinShow first
	WinShow µTorrent
	WinActivate µTorrent
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

RAlt::AppsKey ; 把右Alt换成menu键, 这是给Logiteck键盘用的。因为Laptop的右Alt已经用KeyTweak换成PageUp了, 所以不影响
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
#SingleInstance force ;if this script is run twice, auto replace the previous one with the new one.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
