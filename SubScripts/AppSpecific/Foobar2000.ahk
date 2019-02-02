/*
Purpose:
  Press space in Foobar2000 will delete the current song being player if ScrollLock is on. Used for deleting songs in the car.

  F12 is remapped to ScrollLock to activate this (only in Foobar2000)
*/

#IfWinActive ahk_exe foobar2000.exe

Space::
  If GetKeyState("ScrollLock","t") ; check doc for GetKeyState
    Send +{Delete}
    Sleep 200
    Send {y}
  Return

F12::ScrollLock

#IfWinActive
