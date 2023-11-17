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
