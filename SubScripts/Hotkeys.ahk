; win+tab to focus on taskbar items
#Tab::Send {LWin down}{t}

; in file explorer, Ctrl+T is remapped to Win+E in Win10 (because I have a muscle memory to press Ctrl+T but Win10 explorer doesn't support tabs).
^t::
  if(!WinActive("ahk_class CabinetWClass")) {
    ; I could've done it inside FIleExplorer.ahk, but the problem is when ^t is wrapped inside the #IfWinActive directive, it doesn't work with CapLock, only works with the real Ctrl.
    Send ^t
    return
  } else {
    if (A_ComputerName = "L22") ; L22 uses Win10
      Send #e ; launch a new explorer window
    else
      Send ^t
    return
  }

; activate screensaver
F1 & S::
  RunWait, scrnsave.scr /s
return
