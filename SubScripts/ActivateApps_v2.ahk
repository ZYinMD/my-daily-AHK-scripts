/*
Syntax:
  WinExist is complicated and the doc is hard to understand, but over time I've accumulated some knowledge:
    - When you use the spy to inspect a window, there are 3 usable lines:  (1) title (2) ahk_lass xxx(3) ahk_exe xxx. Each single one can be used for search. If you want to use multiple criteria, just put everything together in a single string, for example if the spy shows this:

    Desktop
    ahk_class CabinetWClass
    ahk_exe explorer.exe

    Now if I want to limit to match both line1 and line3, I can just do:
    If WinExist("Desktop ahk_exe explorer.exe")

    - If no argument is passed into WinActivate, the Last Found Window will be used.
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

<!e::{
  If WinExist("ahk_exe msedge.exe") {
    WinActivate
  } Else {
    Run(PathToEdge)
  }
}

/*
On pressing alt + s:
  if calibre full text search window is active, send alt+s
  if VSCode is active, send alt+s
  else activate VSCode
*/
<!s:: {
  If WinActive("Search the text of all books in the library") {
    Send("!{s}")
  } Else If WinActive("ahk_exe Code.exe") {
    ; } Else If WinActive("ahk_exe Cursor.exe") {
    Send("!{s}")
  } Else If WinExist("ahk_exe Code.exe") {
    ; } Else If WinExist("ahk_exe Cursor.exe") {
    WinActivate
  } Else {
    Run(PathToVSCode)
    ; Run(PathToCursor)
  }
}
/*
Alt+a to activate anki. If the "add new card" window is open, prioritize that
*/
<!a:: {
  If WinExist("Add ahk_exe Anki.exe") { ; to narrow down the search result by with multiple lines displayed in spy, just put the together in one string
    WinActivate
  } Else If WinExist("ahk_exe anki.exe") {
    WinActivate
  } Else {
    Run(PathToAnki)
  }
}

` & q::{
  If WinExist("ahk_exe DB Browser for SQLite.exe") or WinExist("ahk_exe tableau.exe") or WinExist("Studio 3T") or WinExist("MySQL Workbench") {
    WinActivate
  }
}

` & t::{
  If WinExist("TradingView") {
    WinActivate
  }
}
