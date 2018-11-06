/*
Purpose:
  Some hotkeys when inside sublime text:
*/

#IfWinActive ahk_exe Code.exe

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
