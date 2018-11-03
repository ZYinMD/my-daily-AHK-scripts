/*
Purpose:
  Frequently visited folders also need shortcuts. Use 1 as modifier key for folders.
*/

1::1 ; restore 1

1 & o::
  IfWinExist Download
    WinActivate
  Else Run %PathToDownloads%
  Return

1 & a::
  IfWinExist Archive
    WinActivate
  Else Run D:\Archive
  Return

1 & m::
  IfWinExist Music
    WinActivate
  Else Run D:\Music\挑歌
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
  Else Run C:\Dropbox
  Return

1 & c::
  IfWinExist Coding
    WinActivate
  Else Run C:\Dropbox\Coding
  Return

1 & g::
  IfWinExist Google Drive
    WinActivate
  Else Run C:\Google Drive
  Return

Numpad0 & Up::
  IfWinExist (D:) ;只需要窗口Title里面包含(D:)就行了
    WinActivate (D:)
  Else Run D:\
  Return


