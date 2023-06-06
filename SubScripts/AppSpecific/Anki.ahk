#IfWinActive ahk_exe anki.exe
  ^j::SendEvent ^{space} ; anki may crash on switching to chinese
#IfWinActive
