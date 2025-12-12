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
