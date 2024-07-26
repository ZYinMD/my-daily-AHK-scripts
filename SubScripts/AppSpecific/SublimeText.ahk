/*
Purpose:
  Some hotkeys when inside sublime text:
*/

#IfWinActive ahk_exe sublime_text.exe

  F2 & ]::
  F2 & Down::Send ^+k ; native line delete is better than my line delete (when next line is indented)
  F2 & =::
  F2 & Up:: Send ^+k{Up}

  ; When in Sublime, use 1 as a modifier key to help selection
  f1 & Right::
  f1 & \::Send ^d
  f1 & Down::
  f1 & ]::Send ^l
  f1 & Left::
  f1 & [::Send ^+s
  f1 & Up::
  f1 & =::Send ^+a

  ; When in Sublime, use F3 as a modifier key to move texts around. The original idea was to use tab, but couldn't solve the shift-tab-tab-tab issue
  F3 & Left::
  F3 & [::Send ^[
  F3 & Right::
  F3 & \::Send ^]
  F3 & Up::
  F3 & =::Send ^+{Up}
  F3 & Down::
  F3 & ]::Send ^+{Down}

  ; alt ` to focus the sidebar:
  !`::Send ^+{e}

  ; When in Sublime, use 4 as modifier key to collapse, use ` to toggle comments
  4 & Left::
  4 & [::Send ^+[
  4 & Right::
  4 & \::Send ^+]
  ` & BackSpace::
  ` & '::Send ^+/
  ` & -::
  ` & Delete::Send ^/
  4::4

#IfWinActive
