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

; In ConEmu, Chrome seems to be hard to activate by #2, so fall back to WinActivatez
<!c::
` & c::
  IfWinExist Google Chrome
    WinActivate
  Else Send #2
  Return
#IfWinActive
