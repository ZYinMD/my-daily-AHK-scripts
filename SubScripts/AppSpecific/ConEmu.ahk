/*
Purpose:
  Some hotkeys inside ConEmu
Syntax:
  Wrap hotkeys inside #IfWinActive so it's effective only when certain window is active
*/

#IfWinActive ahk_exe ConEmu64.exe
!=::
!Up::Send cd ..{Enter}
![::
!Left::Send cd -{Enter}
#IfWinActive
