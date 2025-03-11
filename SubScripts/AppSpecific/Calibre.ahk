#IfWinActive ahk_exe calibre-parallel.exe
  Space::
    if (abstinence > 0 ) {
      Send {Space}
      abstinence --
    }
  Return

  PgDn::
    MsgBox %abstinence%
  return

  WheelDown::
  return

#IfWinActive

; Search in calibre full text index:
