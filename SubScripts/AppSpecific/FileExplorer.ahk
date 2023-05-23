; When in Windows File Explorer
#IfWinActive ahk_class CabinetWClass

  ; Alt-Down should trigger Enter (to mimic mac habit)
  !Down::
    !]::Send {Enter}

    ; Alt-` to focus on sidebar like VSCode
    !`::Send {F6 3}
#IfWinActive
