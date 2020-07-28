/*
Cycle between multiple instances/windows of the same app that stack together.
Code found on https://superuser.com/questions/435602/shortcut-in-windows-7-to-switch-between-same-applications-windows-like-cmd

 */
!`::
  WinGetClass, ActiveClass, A
  WinGet, WinClassCount, Count, ahk_class %ActiveClass%

  ; if there's only one instance, do nothing:
  IF WinClassCount = 1
    Return
  Else

  WinGet, List, List, % "ahk_class " ActiveClass
  Loop, % List {
    index := List - A_Index + 1
    WinGet, State, MinMax, % "ahk_id " List%index%
    if (State <> -1) {
      WinID := List%index%
      break
    }
  }
  WinActivate, % "ahk_id " WinID
return
