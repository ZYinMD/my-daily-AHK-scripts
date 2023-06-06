#IfWinActive ahk_exe anki.exe
  ^o::
  ^j::
    SendEvent ^{space} ; anki may crash on switching to chinese
  return

#IfWinActive
