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

; wt doesn't have a ctrl-pgup ctrl-pgdn ctrl-tab ctrl-shift-tab as 4 different hotkeys as chrome does. It only has 2, ctrl-tab and ctrl-shift-tab. Ctrl-tab can be used to cycle through tabs. Ctrl-shift-tab is mapped to ctrl-pgup in WT.
` & Right::
` & \::Send ^{Tab}

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
