/*
Purpose:
  F2 + Home => backspace to line beginning
  F2 + End => delete to line end
  F2 + ← => same as F2 + Home
  F2 + → => same as F2 + End
  F2 + ↑ => delete line and move to previous line end
  F2 + ↓ => delete line and move next line up (same as Ctrl-Shift-K in Sublime Text)
Syntax:
  Since = [ ] \ were remapped, it wouldn't work, so remap them separately.
  If more than one hotkey combinations are mapped to the same functions, stack them on the left side of ::
*/
F2 & Home::
F2 & Enter::Send +{Home}{Delete}
F2 & End::
F2 & RShift::Send +{End}{BackSpace}

F2 & Left::
F2 & [::Send +{Home}{Delete}
F2 & Right::
F2 & \::Send +{End}{BackSpace}

F2 & Up::
F2 & =::Send {End}+{Home}+{Home}{Delete}{BackSpace} ; shift home twice to clear indentations
F2 & Down::
F2 & ]::Send {space}{End}+{Home}+{Home}{Delete}{Delete} ; shift home twice to clear indentations

/*
Purpose:
  ` + space: pause and play foobar2000
  Ctrl+Alt+Shift+5 is set to be the global hotkey for this function in foobar2000, but I need a easier version in actuality
*/

` & space::Send ^!+5

/*
Purpose:
  Restart the Script. Sometimes some modifier keys get stuck, restarting may help.
  The following scripts were copied exactly from the doc.
*/
^!+F12::
  Reload
  Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
  MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
  IfMsgBox, Yes, Edit
    return

  /*
  Purpose:
    Sometimes some modifier keys get stuck, this will try to release all of them.
  */
Insert::
^!F11::
  Send {RShift up}
  Send {LShift up}
  Send {RCtrl up}
  Send {LCtrl up}
  Send {RAlt up}
  Send {LAlt up}
  Send {CapsLock up}
  Send {` up}
  Send {; up}
  Send {1 up}
  Send {2 up}
  Send {3 up}
  Send {4 up}
  Send {Numpad0 up}
  Send {F1 up}
  Send {F2 up}
  Send {F3 up}
  Send {F4 up}

return

/*
Purpose:
  Simulate ctrl+ and ctrl- to zoom in and out. Since + and - have been remapped, I need to find a way to simulate them.
*/
; update: no longer used, because I use ctrl numpad +/-
; ^0::Send ^{=}
; ^9::Send ^{-}

/*
A demo of how to use clipboard.
To try, go to voidtools everything and find a mp3, then right click to copy full path. Then fire the hotkey.
To understand it, first read cheat sheet autohotkeys, then read doc about `clipboard`, then read doc about `run`
*/

#F12::Run, %PathToFoobar2000% "%clipboard%"

/*
用Ctrl J Ctrl O 来切换输入法
本来我是用Win中设快捷键: Time & Language > Typing > Advanced keyboard settings > Input language hot keys. 我设为了Ctrl-Shift-7和Ctrl-Shift-8
后来发现win10有bug, EN总是被重设位none, 所以我就换成了function call
 */
; ^j::Send ^+{7}
; ^o::Send ^+{8}
^o::
  zh := DllCall("LoadKeyboardLayout", "Str", "00000804", "Int", 1)
  PostMessage 0x50, 0, %zh%,, A
Return
^j::
  en := DllCall("LoadKeyboardLayout", "Str", "00000409", "Int", 1)
  PostMessage 0x50, 0, %en%,, A
Return

/*
Map Alt L to Alt D, which is the "focus on address bar" on Mac. It's a better setup because it's always followed by two-hand typing'. On windows, we can free up Alt D to something more important.
 */
!l::!d

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
