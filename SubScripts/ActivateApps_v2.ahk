/*
pseudocode:
When F1 is pressed:
  If Windows Terminal is the active window:
    Activate Warp if it's running
      Exit
  If Warp is the active window:
    Activate Windows Terminal if it's running
      Exit
  If neither is the active window:
    If Warp is running activate warp
    else activate Windows Terminal if it's running
*/

F1:: {
  if WinActive("ahk_exe WindowsTerminal.exe") {
    if WinExist("ahk_exe warp.exe") {
      WinActivate()
    }
    return
  }
  if WinActive("ahk_exe warp.exe") {
    if WinExist("ahk_exe WindowsTerminal.exe") {
      WinActivate()
    }
    return
  }
  if WinExist("ahk_exe warp.exe") {
    WinActivate()
  } else if WinExist("ahk_exe WindowsTerminal.exe") {
    WinActivate()
  }
}

  }
}
