/*
Purpose:
  Some hotkeys inside ConEmu
Syntax:
  Wrap hotkeys inside #IfWinActive so it's effective only when certain window is active
*/

#IfWinActive ahk_exe WindowsTerminal.exe
/*
cd.. and cd -
 */
!=::
!Up::Send cd ..{Enter}

![::
!Left::Send cd -{Enter}


; use the native delete to line start and delete to line end (although the generic ones already work properly)
2 & Left::
2 & [::
2 & Home::
2 & Enter::Send ^u

2 & Right::
2 & \::
2 & End::
2 & RShift::Send ^k
#IfWinActive
