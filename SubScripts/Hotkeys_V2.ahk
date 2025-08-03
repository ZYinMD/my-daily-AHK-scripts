; on pressing printscreen, wait 100ms, then send alt+printscreen (to take screenshot of active window), then wait 100ms, then send the right arrow, then wait 100ms, then play a beep sound.

TakeScreenshotAndMoveRight() {
  Sleep 500
  Send "{PrintScreen}"
  Sleep 300
  Send "{Right}"         ; Send right arrow key
  Sleep 500
}
Launch_App2:: {
  Loop 20 {
    TakeScreenshotAndMoveRight()
  }
}

^!F12:: {
  Reload
  Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
  result := MsgBox("The script could not be reloaded. Would you like to open it for editing?", "", "YesNo")
  if (result = "Yes")
    Edit()
}
