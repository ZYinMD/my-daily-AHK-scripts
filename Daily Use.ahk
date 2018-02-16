; Important Note: If /* */ is used for comments, both /* and */ must appear at the beginning of line.

/*
Important Note:
  Use Windows line break (CRLF), not Unix (LF). This is Windows!
  I've set Git to auto-convert to LF on commit, so remember to change back manually after download.

Style Guide:
  Use PascalCase, although the language is case insensitive.
*/


/*
Goal:
  Auto Execute Zone
Syntax:
  On load, the script will run from top down, until a Return or :: or Exit is encountered. So put the things you want to autorun on the top.
  In fact, the things starting with a # are "directives", which runs no matter where you put them. But traditionally these settings are all on the top.
*/
#SingleInstance force ;if this script is run twice, auto replace the previous one with the new one.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Sql := false ; This global variable needs to be declared for the auto CAPITAL sql keywords to work

/*
Goal:
  Remap CapsLock to RCtrl. (Has to be RCtrl, because LCtrl will have different jobs.)
Syntax:
  key::targetKey
  This means a remap, effect holds even when in combinations with other keys.
*/
CapsLock::RControl

/*
Goal:
  Use the two keys on the right side of spacebar as PageUp and PageDown. On a standard keyboard this is RAlt and RWin.
Note:
  On my laptop, these two keys are RAlt and RWin. I had to use Keytweak for the RCtrl because
*/
RAlt::PgUp
RWin::PgDn
RAlt & a::Send ^{PgUp} ; Don't know why >!a::^PaUp doesn't work
RAlt & d::Send ^{PgDn}

/*
Goal:
  LCtrl + enter => new line below
  LCtrl + shift + enter => new line above
Why do this:
  To mimic the Sublime Text behavior in other apps, but with LCtrl only, because RCtrl + Enter in other apps needs to be reserved for their own settings.
Syntax:
  hotkey::function.
  Key combination is allowed on the left side which is different from a remap.
  ^ = Ctrl, ! = Alt, + = Shift, # = Win.
  In this case, <^ means LCtrl, >^ means RCtrl.
  Send is a built-in function. Curly braces means a key. Without curly braces it'll be sent as string input.
*/
<^Enter::Send {End}{Enter}
<^+Enter::Send {Home}{Enter}{Up}

/*
Goal:
  ` + Esc => Mute.
  ` + 1 => Volume down.
  ` + 2 => Volume up.
Syntax:
  Same as above, but defines ` as a new modifier key.
*/
` & Esc::Send {Volume_Mute}
` & 1::Send {Volume_Down}
` & 2::Send {Volume_Up}

/*
Goal:
  Restore the original function of ` key
Explain:
  Since ` has become a modifier key, it no longer works when pressed, because the script is always waiting for the potential second key.
*/
`::` ; Remap it to itself, the script will know you want a restore, but it only fires on key up.

/*
Goal:
  ; => ; at line end
  LCtrl + ; => ;
  RCtrl + ; => ; at line end and enter
*/
; $;:: ;$ means prevent the hotkey to trigger itself
;   If GetKeyState("CapsLock","p") ;since my RCtrl is a remapped key, >^ doesn't really work, so I have to use this ugly way
;     Send {end};{Enter}
;   Else
;     Send {end};
;   Return
; <^;::Send `; ;Unless appears right after another character, ; needs ` as an escape char.

/*
Goal:
  Use ; as a modifier to type symbols
*/

`; & a::Send {{}
`; & s::Send {}}
`; & d::Send {[}
`; & f::Send {]}
`; & j::Send {(}
`; & l::Send {)}
`; & q::Send {NumpadSub}
`; & w::Send {=}
`; & i::Send {"}
`; & k::Send {'}
`; & z::Send {_}
`; & x::Send {+}
`; & g::Send {?}
`; & c::Send {\}
`; & v::Send {/}

/*
Goal:
  Use - instead of Backspace to decrease hand movement
*/

;-::Send {BackSpace}

/*
Goal:
  Restore semicolon after it has become a modifier key
  ; => ; at line end
  LCtrl + ; => ;
  RCtrl + ; => ; at line end and enter
  Alt + , => right arrow once then comma then space (useful in coding)
Syntax:
  Unless appears right after another character, ; needs ` as an escape char.
*/


$;:: ;$ means prevent the hotkey to trigger itself;

  If GetKeyState("CapsLock","p") ;since my RCtrl is a remapped key, >^ doesn't really work, so I have to use this ugly way
    Send {end};{Enter}
  Else
    Send {end};
  Return

<^;::Send {;}
+;::Send {:} ;Because ; was restored by a hotkey as opposed to a remap, any modifier key with ; needs to be separately restored, which is different from restoring the ` using a remap.
!,::Send {right},{space}

/*
Goal:
  2 + j or ← => ``delete to line beginning
  2 + l or → => delete to line end
  2 + i or ↑ => delete line and move to previous line end
  2 + k or ↓ => delete line and move next line up (same as Ctrl-Shift-K in Sublime Text)
Why 2?
  2 is at a golden location where you can easily reach by extending the ring finger without moving your wrist
Why not 3?
  The middle finger is heavier than the ring finger, harder to lift up when pressed, more strain on the ligament
*/
2 & Left::Send +{Home}{Delete}
2 & Right::Send +{End}{BackSpace}
2 & Up::Send {End}+{Home}+{Home}{Delete}{BackSpace} ; shift home twice to clear indentings
2 & Down::Send {End}+{Home}+{Home}{Delete}{Delete} ; shift home twice to clear indentings
; same as above, but in ijkl
2 & j::
  NavOn()
  Send +{Home}{Delete}
  Return
2 & l::
  NavOn()
  Send +{End}{BackSpace}
  Return
2 & i::
  NavOn()
  Send {End}+{Home}+{Home}{BackSpace}{BackSpace}
  Return
2 & k::
  NavOn()
  Send {End}+{Home}+{Home}{Delete}{Delete}
  Return
2::2


#IfWinActive ahk_exe sublime_text.exe ;some hotkeys when inside sublime text:
2 & Down::Send ^+k ; Sublime's native line delete is better than my line delete (when next line is indented)
2 & k::
  NavOn()a
  Send ^+k
  Return

^`:: ;toggle the sidebar
  PixelGetColor, color, 120, 20 ;detect this spot to tell if sidebar is open
  If color != 0xACCCD8 ;if the sidebar is currently closed, open it first
    Send ^k^b
  Send ^0 ;^0 is the default hotkey to focus on the sidebar
  NavOn() ;this is naturally needed after focus
  Return

F5:: ;When developing a web page in Sublime, refresh it in Chrome
  Send #{2}
  Sleep 500
  Send ^{1} ;habit: consistently put the page on the leftmost position
  Sleep 500
  Send ^{r}
  ShutSublimePop() ;If the register window pops up, close it
  Return

; When in Sublime, use 1 as a modifier key to help selection
1 & Right::Send ^d
1 & Down::Send ^l
1 & Left::Send ^+s
1 & Up::Send ^+a
1::1 ; restore 1

; When in Sublime, use 3 as a modifier key to move texts around. The original idea was to use tab, but couldn't solve the shift-tab-tab-tab issue
3 & Left::Send ^[
3 & Right::Send ^]
3 & Up::Send ^+{Up}
3 & Down::Send ^+{Down}
3::3 ; restore 3

; When in Sublime, use ` as modifier key to collapse and toggle comment and switch projects
` & Left::Send ^+[
` & Right::Send ^+]
` & BackSpace::Send ^+/
` & Delete::Send ^/
` & Up::
` & Down::Send !{p}{s}

; When Ctrl and Tab / PgUp / PgDn is pressed in Sublime, which is often when auto save happens, close the potential popup
~Tab::
~PgUp::
~PgDn::ShutSublimePop()

#IfWinActive

/*
Goal:
  If LCtrl was pressed down and up with no other keys combined, fire a mouse click on up.
  I'm likely the only person on earth who needs this.
Note:
  This works only because LCtrl has been set to be a modifier key, otherwise the script will fire   the mouse click immediately on key down
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
  Add ? between the first two colons means fire even when the hotstring is inside another word
  # and ^ and + needs an R as escape char, forgot why.
Background Story:
  The hotstrings are inspired by Chinese
*/
#Hotstring ? *
::qian::$
::qier::$(''){Left}{Left}
::baif::%
::gong::&
::tong::&
::jian::-
::xian::-
::xiah::_ ;xiahua
::xing::*
::cheng::*
::chuh::/ ;chuhao
::gang::/
::deng::=
:R:jiah::+ ;jiahao
:R:jing::#
:R:jier::^
::duihao::✔
::wujiao::★
::shalou::⏳
::eee::Ⓔ
::shangmian::↑
::xiamian::↓
::zuomian::←
::youmian::→
::cslg::console.log(){left}
::csdr::console.dir(){left}
::csif::console.info(){left}
::cswn::console.warn(){left}
::cser::console.error(){left}
::cstb::console.table(){left}
::cstm::console.time(){Enter}{Enter}console.timeEnd(){Up}{Tab}
::csgp::console.groupCollapsed(){Enter}{Enter}console.groupEnd(){Up}{Tab}
::gsta::git status{enter}
::gadd::git add -A{enter}
::gcom::git commit -m ""{left}
::gfet::git fetch{enter}
::gche::git checkout{space}
::gbra::git branch{space}

#Hotstring *0
::fata::=> ;fat arrow
:C:Im::I'm
:C:Ill::I'll
:C:Ive::I've
::youll::you'll
::youre::you're
::youve::you've
::its::it's
::itll::it'll
::itd::it'd
::isnt::isn't
::wasnt::wasn't
::werent::weren't
::dont::don't
::doesnt::doesn't
::didnt::didn't
::havent::haven't
::hadnt::hadn't
::hasnt::hasn't
::shouldnt::shouldn't
::wouldnt::wouldn't
::wouldve::would've
::cant::can't
::couldnt::couldn't
::wont::won't
::whats::what's
::wheres::where's
::wherere::where're
::theres::there's
::therere::there're
::thats::that's
::thatll::that'll
::heres::here's
::todays::today's
::theyre::they're
::theyd::they'd
::theyve::they've
::whos::who's
::hows::how's
::howd::how'd


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

<!s::
` & s::  ; Sublime Text sometimes pops up the register window, deal with it at the same time
  ShutSublimePop()
  IfWinExist ahk_exe sublime_text.exe
    WinActivate
  Else Run D:\Dropbox\Portables\Sublime Text 3\sublime_text.exe
  Return

<!c::
` & c::
  IfWinExist ahk_exe chrome.exe
    WinActivate
  Else Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
  Return

<!a::
` & a::
  IfWinExist Add
    WinActivate
  Else IfWinExist ahk_exe anki.exe
    WinActivate
  Else Run D:\Program Files (x86)\Anki\anki.exe
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

; If all parameters of WinActivate are omitted, the Last Found Window will be used.
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
  IfWinExist ahk_exe PotPlayerMini64.exe
    WinActivate
  Return

<!x::
` & x::
  IfWinExist ahk_exe firefox.exe
    WinActivate ahk_exe firefox.exe
  Else Run C:\Program Files (x86)\Mozilla Firefox\firefox.exe
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

/*
Goal:
  Adjust the numpad keys when NumLock is off.
*/
NumpadClear::Up
NumpadEnd::Left
NumpadPgDn::Right
NumpadHome::Delete
NumpadUp::End
#If !GetKeyState("NumLock", "T")
NumpadDiv::Home
NumpadMult::PgUp
#If
NumpadPgUp::PgDn
NumpadLeft::Send ^{Left}
+NumpadLeft::Send +^{Left}
NumpadRight::Send ^{Right}
+NumpadRight::Send +^{Right}
NumpadIns::BackSpace

'::Enter

#If GetKeyState("ScrollLock", "T")
  i::Up
  k::Down
  j::Left
  l::Right
  u::Send ^{Left}
  +u::Send ^+{Left}
  o::Send ^{Right}
  +o::Send ^+{Right}

  ~q::
  ~w::
  ~e::
  ~r::
  ~t::
  ~y::
  ~s::
  ~d::
  ~f::
  ~g::
  ~h::
  ~b::
  ~n::
  ~p::
  Esc::
  ~^k::
  ~a::
  ~z::
  ~x::
  ~c::
  ~v::
  ~,::
  m::

    If !GetKeyState("CapsLock","p")
      NavOff()
    Return
#If

#If !GetKeyState("ScrollLock", "T")
    !i::
    !j::
    !k::
    NavOn()
    Return
    !l::
      NavOn()
      Send {Right}
      Return
#If

NavOn()
  {
    SetScrollLockState On
    SplashImage, nav.gif,b,,,Nav
    ; Progress, b CWWhite ZH0 fs88, Navigation On,,Nav, Courier New
    ; WinSet, Transparent, 100, Nav
    WinSet, TransColor, White, Nav
  }

NavOff()
  {
    SetScrollLockState Off
    SplashImage Off
    ; Progress, Off
  }

ShutSublimePop() ;this function kills the sublime popup window
  {
    Sleep 200
    IfWinExist This is an unregistered copy
      WinKill This is an unregistered copy
  }

<!h::Send {Home}
<!+h::Send +{Home}
^<!h::SendEvent ^{Home}
<!;::Send {End}
<!+;::Send +{End}
<!^;::SendEvent ^{End}

\::AppsKey
+\::|



/*
Goal:
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
#If Sql = true
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
::delete::DELETE
::having::HAVING
::in::IN
::like::LIKE
::and::AND
::or::OR
::is::IS
::not::NOT
::null::NULL
#If
