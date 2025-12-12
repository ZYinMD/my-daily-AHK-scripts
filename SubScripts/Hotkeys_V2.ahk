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
