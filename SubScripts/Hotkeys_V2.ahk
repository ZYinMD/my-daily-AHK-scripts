/*
Purpose:
  Use F3 to cycle through Explorer windows on the Win-3 stack
Syntax:
  hotkey::function call.
  Key combination is allowed which is different from a remap.
  ^ = Ctrl, ! = Alt, + = Shift, # = Win.
  Send is a built-in function. Curly braces means a key. Without curly braces it'll be sent as string input.
*/

; some previous (better) implementations, but it seems win11 no longer support ctrl-win-number to go previous: F3::Send ^#{3} ; #{3} is win-3, ^#{3} is ctr-win-3, which goes to the previous

F3::  {
  If WinActive("more tabs - File Explorer") {
    WinActivate()
  } Else If WinExist("File Explorer") {
    WinActivate()
  } Else {
    Send("#{3}")
  }
}

/*
Purpose:
  Alt + , => right arrow once then comma then space.
  Alt + ; => right arrow once then colon then space.
  Alt + . => right arrow once then period.
  These are often useful in JS and JSON.
*/
!,::Send("{right},{space}")
!;::Send("{right}:{space}")
!.::Send("{right}.")

/*
Purpose:
  Win + CapsLock => CapsLock
  Since CapsLock is remapped to Ctrl, there needs to be a way to press it.
*/
#CapsLock::CapsLock

/*
Purpose:
  ` + left / right to move between tabs
  ` + left => Ctrl + PgUp
  ` + right=> Ctrl + PgDn
*/
` & Left::
` & [::{
  If WinActive("ahk_class CabinetWClass") {
    Send("^+{Tab}")
  } Else {
    Send("^{PgUp}")
  }
}

` & Right::
` & \:: {
  If WinActive("ahk_class CabinetWClass") {
    Send("^{Tab}")
  } Else {
    Send("^{PgDn}")
  }
}

/*
Purpose:
  Use ; as a modifier to type symbols
Syntax:
  1. Unless appears right after another character, ; needs ` as an escape char.
  2. The Send {keyname} was the traditional syntax, and the bare key name is the new syntax introduced after 2018 version. However, I found it creates a bug where j; / l; / d; etc doesn't output the semicolon if you press too fast. So the old syntax is more reliable.
  3. Also, when using MS PinYin, symbols like ? and ! will trigger the shift key and switch the input to English, the old method doesn't have this issue.
*/

`; & q::^
`; & w::%
`; & e::&
`; & r::*
`; & a::SendText("{")
`; & s::SendText("}")
`; & u::[
`; & o::]
`; & j::(
`; & l::)
`; & d::=
`; & f::-
`; & i::"
`; & k::'
`; & z::_
`; & x::+
`; & g::?
`; & c::/
`; & v::\
`; & 1::!
`; & 2::@
`; & 3::#
`; & 4::$
`; & t::|

; `; & `::~ ; remap semicolon+backtick to tilde. It's commented out it's not well supported on Mac, so I don't want this muscle memory. See my own post: https://www.reddit.com/r/Karabiner/comments/1ds4kam/struggling_to_find_a_way_to_define_some_custom/
`;::; ; Restore ;
/*

/*
Purpose:
  F2 + Home => backspace to line beginning
  F2 + End => delete to line end
  F2 + ← => same as F2 + Home
  F2 + → => same as F2 + End
  F2 + ↑ => delete line and move to previous line end
  F2 + ↓ => delete line and move next line up (same as Ctrl-Shift-K in Sublime Text)
Syntax:
  Since = [ ] \ were remapped, it wouldn't work, so remap them separately.
  If more than one hotkey combinations are mapped to the same functions, stack them on the left side of ::
*/
F2 & Home::
F2 & Enter::Send("+{Home}{Delete}")
F2 & End::
F2 & RShift::Send("+{End}{BackSpace}")

F2 & Left::
F2 & [::Send("+{Home}{Delete}")
F2 & Right::
F2 & \::Send("+{End}{BackSpace}")

F2 & Up::
F2 & =::Send("{End}+{Home}+{Home}{Delete}{BackSpace}") ; shift home twice to clear indentations
F2 & Down::
F2 & ]::Send("{space}{End}+{Home}+{Home}{Delete}{Delete}") ; shift home twice to clear indentations

/*
Purpose:
  ` + space: pause and play foobar2000
  Ctrl+Alt+Shift+5 is set to be the global hotkey for this function in foobar2000, but I need a easier version in actuality
*/

` & space::Send("^!+5")

/*
Purpose:
  Sometimes some modifier keys get stuck, this will try to release all of them.
*/
Insert::
^!F11::{
  Send("{RShift up}")
  Send("{LShift up}")
  Send("{RCtrl up}")
  Send("{LCtrl up}")
  Send("{RAlt up}")
  Send("{LAlt up}")
  Send("{CapsLock up}")
  Send("{` up}")
  Send("{; up}")
  Send("{1 up}")
  Send("{2 up}")
  Send("{3 up}")
  Send("{4 up}")
  Send("{Numpad0 up}")
  Send("{F1 up}")
  Send("{F2 up}")
  Send("{F3 up}")
  Send("{F4 up}")
}

/*
用Ctrl J Ctrl O 来切换输入法
本来我是用Win中设快捷键: Time & Language > Typing > Advanced keyboard settings > Input language hot keys. 我设为了Ctrl-Shift-7和Ctrl-Shift-8
后来发现win10有bug, EN总是被重设位none, 所以我就换成了function call
 */
^o:: {
  ; Load Chinese (Simplified) keyboard layout and request the active window to change to it
  zh := DllCall("LoadKeyboardLayout", "Str", "00000804", "UInt", 1, "Ptr")
  ; WM_INPUTLANGCHANGEREQUEST = 0x50
  PostMessage(0x50, 0, zh, , "A")
}
^j:: {
  ; Load English (US) keyboard layout and request the active window to change to it
  en := DllCall("LoadKeyboardLayout", "Str", "00000409", "UInt", 1, "Ptr")
  PostMessage(0x50, 0, en, , "A")
}

/* For taking screenshots for Libby books
*/
TakeScreenshotAndMoveRight() {
  ; Wait for page animation and input-up
  Sleep(1500)
  Send("#{PrintScreen}")
  Sleep(500)
  Send("{Right}")
}
^+!PrintScreen:: {
  popup := InputBox("How many pages?")
  numPages := Integer(popup.Value)
  Loop numPages {
    TakeScreenshotAndMoveRight()
  }
}

; reload script
^!F12:: {
  Reload()
  Sleep(1000) ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
  result := MsgBox("The script could not be reloaded. Would you like to open it for editing?", "", "YesNo")
  if (result = "Yes")
    Edit()
}
