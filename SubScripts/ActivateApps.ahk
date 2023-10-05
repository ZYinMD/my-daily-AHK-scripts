/*
Purpose:
  In order to use alt-tab as little as possible, the most frequently used apps should each have a shortcut.
Syntax:
  - WinExist is complicated and the doc is hard to understand, but it seems I can use two criterias to match a window, e.g.:
    If WinExist("Desktop","Explorer.EXE")
    If WinExist("Add", "ahk_exe Anki.exe")
      (this could be wrong, but it works for me for now)
  - If no argument is passed into WinActivate, the Last Found Window will be used.
  - Use %varname% to retrieve the value of a variable, e.g. `Run %PathToAnki%`
  - If more than one line of code needs to be triggered by a hotkey, add Return in the end. (I end up always use Return)
*/

#d::
  If WinExist("Desktop ahk_exe explorer.exe") { ; to narrow down the search result by with multiple lines displayed in spy, just put the together in one string
    WinActivate
  } Else {
    Run %A_Desktop%
  }
Return

F1::
  If WinExist("ahk_exe WindowsTerminal.exe") {
    WinActivate
  }
Return

` & r::
  If WinExist("Redux DevTools") {
    WinActivate
  }
Return

` & s::
  If WinExist("ahk_exe Code - Insiders.exe") {
    WinActivate
  } Else {
    Run %PathToVSCodeInsiders%
  }
Return

` & d::
  If WinExist("ahk_exe Docker Desktop.exe") {
    WinActivate
  }
Return

<!x::
  If WinExist("ahk_exe firefox.exe") {
    WinActivate
  } Else {
    Run firefox ; this works if firefox is installed, kind of magical, but sure (it's not in path, btw)
  }
Return

<!e::
  If WinExist("ahk_exe msedge.exe") {
    WinActivate
  } Else {
    Run msedge ; this works if edge is installed, kind of magical, but sure (it's not in path, btw)
  }
Return

<!s::
  If WinActive("ahk_exe Code.exe") {
    Send !{s}
  } Else If WinExist("ahk_exe Code.exe") {
    WinActivate
  } Else {
    Run %ComSpec% /c "code --disable-gpu",,hide ; have to disable gpu, otherwise it flickers on full screen. This is equivalent to running `code --disable-gup` in CLI. %ComSpec% is the environmental variable for cmd.exe, /c I don't know what it is. ,,hide means close the cmd window
  }
Return

<!c::
  If WinActive("Google Tasks") {
    Send !{c}
  } Else If WinExist("ChatGPT") {
    WinActivate
  }
Return

<!a::
  If WinExist("Add ahk_exe Anki.exe") { ; to narrow down the search result by with multiple lines displayed in spy, just put the together in one string
    WinActivate
  } Else If WinExist("ahk_exe anki.exe") {
    WinActivate
  } Else {
    Run %PathToAnki%
  }
Return

` & q::
  If WinExist("ahk_exe tableau.exe") or WinExist("Studio 3T") or WinExist("MySQL Workbench") {
    WinActivate
  }
Return
