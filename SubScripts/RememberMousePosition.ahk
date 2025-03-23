; this file is currently not imported into `Daily Use.ahk`.

/*
Purpose:
  For video recording purposes, when NumLock is off, press numlock 0+x to remember current mouse positions, press x to resume positions
*/
NumpadIns & NumpadEnd::
  MouseGetPos, x1, y1
return
NumpadEnd::
  MouseMove, x1, y1
return
NumpadIns & NumpadDown::
  MouseGetPos, x2, y2
return
NumpadDown::
  MouseMove, x2, y2
return
NumpadIns & NumpadPgdn::
  MouseGetPos, x3, y3
return
NumpadPgdn::
  MouseMove, x3, y3
return
NumpadIns & NumpadLeft::
  MouseGetPos, x4, y4
return
NumpadLeft::
  MouseMove, x4, y4
return
NumpadIns & NumpadClear::
  MouseGetPos, x5, y5
return
NumpadClear::
  MouseMove, x5, y5
return
NumpadIns & NumpadRight::
  MouseGetPos, x6, y6
return
NumpadRight::
  MouseMove, x6, y6
return
NumpadIns & NumpadHome::
  MouseGetPos, x7, y7
return
NumpadHome::
  MouseMove, x7, y7
return
NumpadIns & NumpadUp::
  MouseGetPos, x8, y8
return
NumpadUp::
  MouseMove, x8, y8
return
NumpadIns & NumpadPgup::
  MouseGetPos, x9, y9
return
NumpadPgup::
  MouseMove, x9, y9
return
