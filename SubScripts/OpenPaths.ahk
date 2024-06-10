/*
Purpose:
  Frequently visited folders also need shortcuts. Use 1 as modifier key for folders.
*/

1::1 ; restore 1

; everything here is disabled, because I want to use the new F3 -> Ctrl-T -> Click muscle memory

/* 1 & o::
  If WinExist("Download") {
    WinActivate
  } Else {
    Run %DirDownloads%
  }
Return

1 & a::
  If WinExist("Archive") {
    WinActivate
  } Else {
    Run A:\Archive
  }
Return

1 & d::
  If WinExist("Dropbox"){
    WinActivate
  } Else {
    Run %DirDropbox%
  }
Return

1 & c::
  If WinExist("Coding"){
    WinActivate
  } Else {
    Run %DirDropbox%\Coding
  }
Return

1 & g::
  If WinExist("Google Drive"){
    WinActivate
  } Else {
    Run %HOME%\Google Drive
  }
Return
 */
