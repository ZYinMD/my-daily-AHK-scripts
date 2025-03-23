; this file is currently not imported into `Daily Use.ahk`.

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
