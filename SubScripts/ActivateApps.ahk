/*
Purpose:
  In order to use alt-tab as little as possible, the most frequently used apps should each have a shortcut.
Syntax:
  WinExist is complicated and the doc is hard to understand, but over time I've accumulated some knowledge:
  - The old function `IfWinExist` and `IfWinActive` are deprecated, now use `if WinExist()` and `If WinActive()` instead.
  - When you use the spy to inspect a window, there are 3 usable lines:  (1) title (2) ahk_lass xxx(3) ahk_exe xxx. Each single one can be used for search. If you want to use multiple criteria, just put everything together in a single string, for example:

    Desktop
    ahk_class CabinetWClass
    ahk_exe explorer.exe

    Now if I want to limit narrow to the window that match both line1 and line3, I can just do:
    If WinExist("Desktop ahk_exe explorer.exe")

  - In the AutoExecute zone, I did `SetTitleMatchMode, RegEx` to set the search algorithm to regex. The default setting is "startWith', another setting is "includes", which sounds nice, but only works for the title, not the ahk_class or ahk_exe, so I picked regex.
  - After using regex, the "one big string" approach still works, I have no idea why, but hey, it works.
  - If no argument is passed into WinActivate, the Last Found Window will be used.
  - Use %varname% to retrieve the value of a variable, e.g. `Run %PathToAnki%`
  - If more than one line of code needs to be triggered by a hotkey, add Return in the end. (I end up always use Return)
*/

/*
#d::
  If WinExist("Desktop ahk_exe explorer.exe") { ; to narrow down the search result by with multiple lines displayed in spy, just put the together in one string
    WinActivate
  } Else {
    Run %A_Desktop%
  }
Return
*/
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

` & e::
  If WinExist("ahk_exe Evernote.exe") {
    WinActivate
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
  } Else If WinActive("Edit metadata ahk_exe calibre.exe") {
    Send !{c}
  } Else If WinExist("NextChat") {
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
  If WinExist("ahk_exe DB Browser for SQLite.exe") or WinExist("ahk_exe tableau.exe") or WinExist("Studio 3T") or WinExist("MySQL Workbench") {
    WinActivate
  }
Return
