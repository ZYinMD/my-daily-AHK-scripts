; When in Windows File Explorer
#HotIf WinActive("ahk_class CabinetWClass")

; Alt-Down should trigger Enter (to mimic mac habit)
!Down::
!]::Send("{Enter}")

; Alt-` or alt-q to focus on sidebar like VSCode
; when doing it manually, I need to press F6 3 times to get to sidebar, when using a script, it only needs to press twice, I'm not sure why.
!`::
!q::{
  Send("{F6 2}")
}
#HotIf
