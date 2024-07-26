#IfWinActive ahk_exe WindowsTerminal.exe

  ; use the native delete to line start and delete to line end (although the generic ones already work properly)
  F2 & Left::
  F2 & [::
  F2 & Home::
  F2 & Enter::Send ^u

  F2 & Right::
  F2 & \::
  F2 & End::
  F2 & RShift::Send ^k

  ; No need for the F1 hotkey when I'm already in wt, re-enable it. The pwsh doc says F1 is bound to some parameter intellisence, I tried but didn't work.
  F1::Send {F1}

#IfWinActive
