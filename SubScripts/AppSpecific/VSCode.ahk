/*
Purpose:
  Some hotkeys when inside sublime text:
*/

#IfWinActive ahk_exe Code.exe

; use ` as modifier key to fold
  ` & Left::
  ` & [::Send ^+[
  ` & Right::
  ` & \::Send ^+]

; Use 2 to delete line
  2 & \::
  2 & Right::Send ^+{Delete}
  2 & ]::
  2 & Down::Send ^+k ; native line delete is better than my line delete (when next line is indented)
  2 & =::
  2 & Up::Send {End}^+{BackSpace}{BackSpace}


; Use 3 as a modifier key to move texts around.
  3 & Left::
  3 & [::Send ^[
  3 & Right::
  3 & \::Send ^]
  3 & Up::
  3 & =::Send !{Up}
  3 & Down::
  3 & ]::Send !{Down}

  3::3 ; restore 3

#IfWinActive
