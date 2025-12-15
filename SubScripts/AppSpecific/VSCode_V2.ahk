; Different from the other apps, #If is used instead of #IfWinActive here, because I need an expression
#HotIf WinActive("ahk_exe Code.exe") or WinActive("ahk_exe Code - Insiders.exe") or WinActive("ahk_exe Cursor.exe")

; use ` as modifier key in VSCode to do things:
; `up and `down to move between panes
` & Up::
` & =::Send("^{Numpad4}")
` & down::
` & ]::Send("^{Numpad6}")

; `Delete and `Backspace to toggle line comment and block comment
` & -::
` & Delete::Send("^/")

` & BackSpace::Send("+!{a}")

; use 1 as modifier key for selection.
; F1Left and F1Right for expanding and shrinking selection
f1 & Left::
f1 & [::Send("+!{Right}")
f1 & Right::
f1 & \::Send("+!{Left}")
; f1up and f1down for line selection, I installed the plugin "Better Line Select"
f1 & Up::
f1 & =::Send("^{Numpad8}") ; I set this keybinding with "better line select" extension
f1 & Down::
f1 & ]::Send("^{Numpad2}") ; I set this in vscode settings

; Use F2 to delete.
; F2left and F2right to delete words. This is already supported in generic programs.

; F2home and F2end to backspace to line start and delete to line end. The vscode's native F2end is better than mine:
; I set "Delete all left" and "Delete all right" to ^+Backspace and ^+Delete. It's turned off by default
F2 & Right::
F2 & \::
F2 & End::
F2 & RShift::Send("^+{Delete}")

; 2up and 2down to delete line
F2 & ]::
F2 & Down::Send("^{NumpadDot}") ; native line delete is better than my line delete (when next line is indented)
F2 & =::
F2 & Up:: Send("^{NumpadDot}{Up}")

; Use F3 as a modifier key to move texts around.
F3 & Left::
F3 & [::Send("^[")
F3 & Right::
F3 & \::Send("^]")
F3 & Up::
F3 & =::Send("^!+{Up}")
F3 & Down::
F3 & ]::Send("^!+{Down}")

; use F4 as modifier key in VSCode to fold:
; F4left and F4right for folding:
F4 & Left::
F4 & [::Send("^+[")
F4 & Right::
F4 & \::Send("^+]")
; F4Home to fold all, F4End to unfold all
F4 & Enter::
F4 & Home::Send("^+!u")
F4 & RShift::
F4 & End::Send("^+!]")
; F4Up and F4Down for finding errors:
F4 & Up::
F4 & =::Send("!{F8}")
F4 & Down::
F4 & ]::Send("{F8}")

#HotIf
