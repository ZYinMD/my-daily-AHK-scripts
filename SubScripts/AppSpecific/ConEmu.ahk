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

^s::Send sudo {!}{!}{Enter}

; In ConEmu, Chrome seems to be hard to activate by #2, so fall back to WinActivatez
<!c::
` & c::
  IfWinExist Google Chrome
    WinActivate
  Else Send #2
  Return

; in ConEmu, use the native delete to line start and delete to line end (although the generic ones already work properly)
2 & Left::
2 & [::
2 & Home::
2 & Enter::Send ^u

2 & Right::
2 & \::
2 & End::
2 & RShift::Send ^k

; when pressing ctrl+w, type exit⏎ to exit properly. This ensures history is saved properly
^w::Send exit{Enter}
; since my RCtrl is a remapped key, ^W doesn't really work. It only works in computers where CapsLock is remapped with KeyTweak. for non-keytweaked computers, must use this ugly way. "p" means retrive the phisical state of the key
w::
  if GetKeyState("CapsLock","p")
    Send exit{Enter}
  else
    Send w
  Return


#IfWinActive
