/*
Purpose:
  When in Evernote, 3 + Left / Right should manage indent just like in text editors
*/

#IfWinActive ahk_exe Evernote.exe
+Tab::
3 & Left::
3 & [::Send ^+m
Tab::
3 & Right::
3 & \::Send ^m
3::3

; temp: for changing article title in Evernote (needed when archiving 说说咱家娃)
` & LAlt::
  MouseGetPos, x, y
  MouseMove, 1145, 270
  Send {Click 3}^c{F2}
  Sleep 200
  Send ^v
  MouseMove, x, y
  Return

#IfWinActive
