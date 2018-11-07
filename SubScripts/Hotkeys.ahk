/*
Purpose:
  Alt + , => right arrow once then comma then space.
  Alt + ; => right arrow once then colon then space.
  Alt + . => right arrow once then period.
  These are often useful when editing JSON like stuff.
Syntax:
  hotkey::function call.
  Key combination is allowed on the left side which is different from a remap.
  When writing key combinations on the left side, ^ = Ctrl, ! = Alt, + = Shift, # = Win.
  Send is a built-in function. Curly braces means a key. Without curly braces it'll be sent as string input.
*/
!,::Send {right},{space}
!;::Send {right}:{space}
!.::Send {right}.

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
  Restore the original function of ` key
Explain:
  Since ` has become a modifier key, it no longer works when pressed, because the script is always waiting for the potential second key.
*/
`::` ; Remap it to itself, the script will know you want a restore, but it only fires on key up.

/*
Purpose:
  Use ; as a modifier to type symbols
*/
`; & a::{
`; & s::}
`; & e::[
`; & r::]
`; & j::(
`; & l::)
`; & d::=
`; & f::Send {NumpadSub}
`; & i::"
`; & k::'
`; & z::_
`; & x::+
`; & g::?
`; & c::/
`; & v::\
`; & `::~
`; & 1::!
`; & 2::@
`; & 3::#
`; & 4::$
`; & t::|

/*
Purpose:
  Restore semicolon after it has become a modifier key
  Restore it by giving it specific instructions:
    ; => ; at line end
    LCtrl + ; => ;
    RCtrl + ; => ; at line end and enter
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

/*
Purpose:
  2 + Home => backspace to line beginning
  2 + End => delete to line end
  2 + ← => backspace a word
  2 + → => delete a word
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
2 & [::Send ^{BackSpace}
2 & Right::
2 & \::Send ^{Delete}

2 & Up::
2 & =::Send {End}+{Home}+{Home}{Delete}{BackSpace} ; shift home twice to clear indentations
2 & Down::
2 & ]::Send {space}{End}+{Home}+{Home}{Delete}{Delete} ; shift home twice to clear indentations
2::2

/*
Purpose:
  2 + uiopjkl;m, => 1234567890
*/
2 & u::Send {1}
2 & i::Send {2}
2 & o::Send {3}
2 & p::Send {4}
2 & j::Send {5}
2 & k::Send {6}
2 & l::Send {7}
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
*/
Numpad0 & Left::
  MouseGetPos, x, y
Numpad0 & Right::
  MouseMove, x, y
