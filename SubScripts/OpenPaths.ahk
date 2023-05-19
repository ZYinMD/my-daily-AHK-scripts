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
  Else Run A:\Archive
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
