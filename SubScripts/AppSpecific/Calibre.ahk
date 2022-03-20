#IfWinActive ahk_exe calibre-parallel.exe

Space::
  if GetKeyState("CapsLock","p") {
    Send ^{Space}
  } else if (abstinence > 0) {
    Send {Space}
    abstinence --
    ; MsgBox, %abstinence%
  }
  return

#IfWinActive
