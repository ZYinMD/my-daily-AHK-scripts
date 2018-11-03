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
#IfWinActive
