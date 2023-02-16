#IfWinActive ahk_exe WindowsTerminal.exe

; use the native delete to line start and delete to line end (although the generic ones already work properly)
2 & Left::
2 & [::
2 & Home::
2 & Enter::Send ^u

2 & Right::
2 & \::
2 & End::
2 & RShift::Send ^k

; No need for the F1 hotkey when I'm already in wt, re-enable it. The pwsh doc says F1 is bound to some parameter intellisence, I tried but didn't work.
F1::Send {F1}

#IfWinActive
