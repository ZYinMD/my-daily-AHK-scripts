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
`; & w::SendText("%")
`; & e::&
`; & r::*
`; & a::SendText("{")
`; & s::SendText("}")
`; & u::[
`; & o::]
`; & j::SendText("(")
`; & l::SendText(")")
`; & d::SendText("=")
`; & f::SendText("-")
`; & i::SendText('"')
`; & k::SendText("'")
`; & z::_
`; & x::SendText("+")
`; & g::SendText("?")
`; & c::/
`; & v::\
`; & 1::SendText("!")
`; & 2::@
`; & 3::#
`; & 4::$
`; & t::SendText("|")

; `; & `::~ ; remap semicolon+backtick to tilde. It's commented out it's not well supported on Mac, so I don't want this muscle memory. See my own post: https://www.reddit.com/r/Karabiner/comments/1ds4kam/struggling_to_find_a_way_to_define_some_custom/
`;::; ; Restore ;
/*

/*
For taking screenshots for Libby books
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
