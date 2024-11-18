#IfWinActive ahk_exe calibre-parallel.exe
  Space::
    if (abstinence > 0 And !locked) {
      Send {Space}
      abstinence --
    }
    if (abstinence > 0 And locked) {
      ; MsgBox Current abstinence: %abstinence%
    }
    if (abstinence = 0) {
      locked = True
    }
  Return

  PgDn::
    MsgBox %abstinence%
  return

  WheelDown::
  return

#IfWinActive

; Search in calibre full text index:

<#s::
  Click 2 ; double click to select word
  Sleep 100
  Send ^c ; copy
  Sleep 100
  If WinExist("Search the text of all books in the library") {
    WinActivate
  } else {
    MsgBox % "Full text search window not open"
    Return
  }
  Sleep 100
  Click 150, 150 ; click on the search box
  Sleep 100
  Send ^a ; select all
  Sleep 100
  Send ^v ; paste
  Sleep 100
  Send {Enter} ; search
return
