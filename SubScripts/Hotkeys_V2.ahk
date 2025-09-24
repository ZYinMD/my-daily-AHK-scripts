; on pressing printscreen, wait 100ms, then send alt+printscreen (to take screenshot of active window), then wait 100ms, then send the right arrow, then wait 100ms, then play a beep sound.

TakeScreenshotAndMoveRight() {
  Send "{PrintScreen}"
  Sleep 500 ; wait for the screenshot to be taken before moving to next page
  Send "{Right}"
  Sleep 1000 ; this wait has 2 purposes: 1. wait for the page-turning animation to finish 2. libby preload 2 pages ahead, so after pressing right arrow, the preload of next next page starts. 1000 seems a lot, but I need to slow down the overall pace of page turning to 1.5s, to give the pages enough time to load.
}
Launch_App2:: { ; Launch_App2 is the "calculator" key on the keyboard
  Sleep 500 ; wait till the key is lifted
  Loop 98 {
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
