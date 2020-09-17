/*
Purpose:
  Frequently visited folders also need shortcuts. Use 1 as modifier key for folders.
*/

1::1 ; restore 1

1 & o::
  IfWinExist Download
    WinActivate
  Else Run %DirDownloads%
  Return

1 & a::
  IfWinExist Archive
    WinActivate
  Else Run D:\Archive
  Return

1 & m::
  IfWinExist Music
    WinActivate
  Else Run D:\Music\
  Return

1 & v::
  IfWinExist Videos
    WinActivate
  Else Run D:\Videos
  Return

1 & s::
  IfWinExist Study
    WinActivate
  Else Run D:\Archive\Study
  Return

1 & d::
  IfWinExist Dropbox
    WinActivate
  Else Run %DirDropbox%
  Return

1 & c::
  IfWinExist Coding
    WinActivate
  Else Run %DirDropbox%\Coding
  Return

1 & g::
  IfWinExist Google Drive
    WinActivate
  Else Run %HOME%\Google Drive
  Return

1 & h::
  IfWinExist Zhi Yin
    WinActivate
  Else Run %HOME%
  Return
