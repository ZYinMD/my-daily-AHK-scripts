/*
Purpose:
  Win + z => Ctrl + PgUp
  Win + x => Ctrl + PgDn
Syntax:
  hotkey::function call.
  Key combination is allowed on the left side which is different from a remap.
  ^ = Ctrl, ! = Alt, + = Shift, # = Win.
  Send is a built-in function. Curly braces means a key. Without curly braces it'll be sent as string input.
*/

; disabled for now, as I never use them
; #z::Send ^{PgUp}
; #x::Send ^{PgDn}

/*
Purpose:
  Alt + , => right arrow once then comma then space.
  Alt + ; => right arrow once then colon then space.
  Alt + . => right arrow once then period.
  These are often useful in JS and JSON.
*/
!,::Send {right},{space}
!;::Send {right}:{space}
!.::Send {right}.

/*
Purpose:
  Win + CapsLock => CapsLock
  Since CapsLock is remapped to Ctrl, there needs to be a way to press it.
*/
#CapsLock::CapsLock

/*
Purpose:
  LCtrl + enter => new line below
  LCtrl + shift + enter => new line above
Why do this:
  To mimic the Sublime Text behavior in other apps, but with LCtrl only, because RCtrl + Enter in other apps needs to be reserved for their own settings.
Syntax:
  In the following case, <^ means LCtrl, >^ means RCtrl.
*/
<^'::Send {End}{Enter} ; Remember, Enter is already remapped to '
<^+'::Send {Home}{Enter}{Up}

/*
Purpose:
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
Purpose:
  ` + left / right to move between tabs
  ` + left => Ctrl + PgUp
  ` + right=> Ctrl + PgDn
Syntax:
  Sometimes if there's mysterious bugs, add return in the end helps.
*/
  ` & Left::
  ` & [::
  Send ^{PgUp}
  return
  ` & Right::
  ` & \::
  Send ^{PgDn}
  return

/*
Purpose:
  Restore the original function of ` key
Explain:
  Since ` has become a modifier key, it no longer works when pressed, because the script is always waiting for the potential second key.
*/
`::` ; Remap ` to itself, the script will know you want a restore, but it only fires on key up.


/*
Purpose:
  Use ; as a modifier to type symbols
Syntax:
  1. Unless appears right after another character, ; needs ` as an escape char.
  2. The Send {keyname} was the traditional syntax, and the bare key name is the new syntax introduced after 2018 version. However, I found it creates a bug where j; / l; / d; etc doesn't output the semicolon if you press too fast. So the old syntax is more reliable.
  3. Also, when using MS PinYin, symbols like ? and ! will trigger the shift key and switch the input to English, the old method doesn't have this issue.
*/
`; & a::{
`; & s::}
`; & u::
`; & e::[
`; & o::
`; & r::]
`; & j::Send {(}
`; & l::Send {)}
`; & d::Send {=}
`; & f::Send {NumpadSub}
`; & i::Send {"}
`; & k::Send {'}
`; & z::_
`; & x::Send {+}
`; & g::Send {?}
`; & c::/
`; & v::\
`; & `::~
`; & 1::Send {!}
`; & 2::@
`; & 3::#
`; & 4::$
`; & t::Send {|}

/*
Purpose:
  Restore semicolon after it has become a modifier key
  Restore it by giving it specific instructions:
    ; => ; at line end
    LCtrl + ; => ;
    RCtrl + ; => ; at line end and enter
      (this is commented out now, because I rarely use it)
*/

/*
$;::
if GetKeyState("CapsLock","p")
  Send {end};{Enter}
else
  Send {end}{;}
Return
;since my RCtrl is a remapped key, >^ doesn't really work, so I have to use this ugly way. "p" means retrive the phisical state of the key
*/

$;::Send {end}{;} ;$ means prevent the hotkey to trigger itself;
^;::Send {;}
+;::Send {:} ;Because ; was restored by a hotkey as opposed to a remap, any modifier key with ; needs to be separately restored, which is different from restoring the ` using a remap, which doesn't need to explicitly restore "~"

/*
Purpose:
  2 + Home => backspace to line beginning
  2 + End => delete to line end
  2 + ← => same as 2 + Home
  2 + → => same as 2 + End
  2 + ↑ => delete line and move to previous line end
  2 + ↓ => delete line and move next line up (same as Ctrl-Shift-K in Sublime Text)
Syntax:
  Since = [ ] \ were remapped, it wouldn't work, so remap them separately.
  If more than one hotkey combinations are mapped to the same functions, stack them on the left side of ::
*/
2 & Home::
2 & Enter::Send +{Home}{Delete}
2 & End::
2 & RShift::Send +{End}{BackSpace}

2 & Left::
2 & [::Send +{Home}{Delete}
2 & Right::
2 & \::Send +{End}{BackSpace}

2 & Up::
2 & =::Send {End}+{Home}+{Home}{Delete}{BackSpace} ; shift home twice to clear indentations
2 & Down::
2 & ]::Send {space}{End}+{Home}+{Home}{Delete}{Delete} ; shift home twice to clear indentations
2::2

/*
Purpose:
  2 + jkluioh;m{space} => 1234567890
*/
2 & j::Send {1}
2 & k::Send {2}
2 & l::Send {3}
2 & u::Send {4}
2 & i::Send {5}
2 & o::Send {6}
2 & h::Send {7}
2 & `;::Send {8}
2 & n::
2 & m::Send {9} ;both m and n will fire 9
2 & space::Send {0}

/*
Purpose:
  ` + space: pause and play foobar2000
  Ctrl+Alt+Shift+5 is set to be the global hotkey for this function in foobar2000, but I need a easier version in actuality
*/

` & space::Send ^!+5

/*
Purpose:
  Remember current mouse location, and resume this position later. Useful when recording videos
F9::
  MouseGetPos, x, y
  return
F10::
  MouseMove, x, y
*/

/*
Purpose:
  Restart the Script. Sometimes some modifier keys get stuck, restarting may help.
  The following scripts were copied exactly from the doc.
*/
^!F12::
  Reload
  Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
  MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
  IfMsgBox, Yes, Edit
return

/*
Purpose:
  Simulate ctrl+ and ctrl- to zoom in and out. Since + and - have been remapped, I need to find a way to simulate them.
*/
^0::Send ^{=}
^9::Send ^{-}
