/*
Purpose:
  Some hotkeys when inside sublime text:
*/

#IfWinActive ahk_exe sublime_text.exe

; use alt space to call out the command palette:
!Space::Send ^+p

2 & ]::
2 & Down::Send ^+k ; native line delete is better than my line delete (when next line is indented)
2 & =::
2 & Up:: Send ^+k{Up}

; When in Sublime, use 1 as a modifier key to help selection
1 & Right::
1 & \::Send ^d
1 & Down::
1 & ]::Send ^l
1 & Left::
1 & [::Send ^+s
1 & Up::
1 & =::Send ^+a

; When in Sublime, use 3 as a modifier key to move texts around. The original idea was to use tab, but couldn't solve the shift-tab-tab-tab issue
3 & Left::
3 & [::Send ^[
3 & Right::
3 & \::Send ^]
3 & Up::
3 & =::Send ^+{Up}
3 & Down::
3 & ]::Send ^+{Down}
3::3 ; restore 3

; alt ` to focus the sidebar:
!`::Send ^+{e}

; alt + ↑↓←→ to move cursor fast
!Left::
![::Send {left 10}
!Right::
!\::Send {right 10}
!Up::
!=::Send {Up 4}
!Down::
!]::Send {Down 4}

; When in Sublime, use ` as modifier key to collapse and toggle comment and switch projects
` & Left::
` & [::Send ^+[
` & Right::
` & \::Send ^+]
` & BackSpace::
` & '::Send ^+/
` & -::
` & Delete::Send ^/
` & Up::
` & Down::
` & =::
` & ]::Send !{p}{s}

#IfWinActive
