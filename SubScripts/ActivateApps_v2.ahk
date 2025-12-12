/*
Syntax:
  WinExist is complicated and the doc is hard to understand, but over time I've accumulated some knowledge:
    - When you use the spy to inspect a window, there are 3 usable lines:  (1) title (2) ahk_lass xxx(3) ahk_exe xxx. Each single one can be used for search. If you want to use multiple criteria, just put everything together in a single string, for example if the spy shows this:

    Desktop
    ahk_class CabinetWClass
    ahk_exe explorer.exe

    Now if I want to limit to match both line1 and line3, I can just do:
    If WinExist("Desktop ahk_exe explorer.exe")

  - In the AutoExecute zone, I did `SetTitleMatchMode, RegEx` to set the search algorithm to regex. The default setting is "startWith', another setting is "includes", which sounds nice, but only works for the title, not the ahk_class or ahk_exe, so I picked regex.
  - After using regex, the "one big string" approach still works, I have no idea why, but hey, it works.
  - If no argument is passed into WinActivate, the Last Found Window will be used.
  - Use varname to retrieve the value of a variable, e.g. `Run(PathToAnki)`
*/

/*
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

` & s::  {
  If WinExist("ahk_exe Code - Insiders.exe") {
    WinActivate()
  } Else {
    Run(PathToVSCodeInsiders)
  }
}

` & d::{
  If WinExist("ahk_exe Docker Desktop.exe") {
    WinActivate
  }
}

<!x:: {
  If WinExist("ahk_exe firefox.exe") {
    WinActivate
  } Else {
    Run(PathToFirefox)
  }
}
