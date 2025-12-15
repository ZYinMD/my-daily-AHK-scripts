/*
A demo of how to use clipboard.
To try, go to voidtools everything and find a mp3, then right click to copy full path. Then fire the hotkey.
To understand it, first read cheat sheet autohotkeys, then read doc about `clipboard`, then read doc about `run`
*/

#F12::Run, %PathToFoobar2000% "%clipboard%"

/*
Right Control + Up: volume up
Right Control + Down: volume down
Right Control + Left: mute
Right Control + Right: pause

Note: I have remapped Right Control to PageDown with `RCtrl::PgDn` in "Remap.ahk"
*/
RControl & Up::Send {Volume_Up}
RControl & Down::Send {Volume_Down}
RControl & Left::Send {Volume_Mute}
RControl & Right::Send {Media_Play_Pause}

; win+. to type 。
#.::。

; win+tab to focus on taskbar items
#Tab::Send {LWin down}{t}

; in file explorer, Ctrl+T is remapped to Win+E in Win10 (because I have a muscle memory to press Ctrl+T but Win10 explorer doesn't support tabs).
^t::
  if(!WinActive("ahk_class CabinetWClass")) {
    ; I could've done it inside FIleExplorer.ahk, but the problem is when ^t is wrapped inside the #IfWinActive directive, it doesn't work with CapLock, only works with the real Ctrl.
    Send ^t
    return
  } else {
    if (A_ComputerName = "L22") ; L22 uses Win10
      Send #e ; launch a new explorer window
    else
      Send ^t
    return
  }

; activate screensaver
F1 & S::
  RunWait, scrnsave.scr /s
return
