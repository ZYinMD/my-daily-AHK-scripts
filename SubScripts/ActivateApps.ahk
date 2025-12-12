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

<!v::
  If WinActive("ahk_exe Code.exe") {
    Send !{v}
  } Else If WinExist("ahk_exe Code.exe") {
    WinActivate
  } Else {
    Run %PathToVSCode%
  }
Return

<!s::
  If WinActive("Search the text of all books in the library") {
    Send !{s}
  } Else If WinActive("ahk_exe Code.exe") {
    ; } Else If WinActive("ahk_exe Cursor.exe") {
    Send !{s}
  } Else If WinExist("ahk_exe Code.exe") {
    ; } Else If WinExist("ahk_exe Cursor.exe") {
    WinActivate
  } Else {
    Run %PathToVSCode%
    ; Run %PathToCursor%
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

` & t::
  If WinExist("TradingView") {
    WinActivate
  }
Return
