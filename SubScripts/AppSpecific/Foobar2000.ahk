/*
Purpose:

  The following operations in Foobar2000 are meant to be done in car with with one hand and no eyes:

  If ScrollLock is on:
    Press space will delete the current song being played
    Press → will move to next song

  F12 is remapped to ScrollLock (only in Foobar2000) because of this
*/

#IfWinActive ahk_exe foobar2000.exe

Space::
  If GetKeyState("ScrollLock","t") {
    Send +{Delete}
    Sleep 200
    Send {y}
  }
  Else
    Send {Space}
  Return

Right::
  If GetKeyState("ScrollLock","t")
    Send !{Right}
  Else
    Send {Right}
  Return

F12::ScrollLock

#IfWinActive
