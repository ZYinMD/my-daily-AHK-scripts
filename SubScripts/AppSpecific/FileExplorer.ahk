/*
Purpose:
  When in Windows File Explorer, Alt-Down should trigger Enter (to mimic mac habit)
*/

#IfWinActive ahk_class CabinetWClass
!Down::
!]::Send {Enter}
#IfWinActive
