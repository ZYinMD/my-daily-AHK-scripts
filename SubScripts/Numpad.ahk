; Only keyboard with a numpad can use hotkeys in this file

/*
Purpose:
  Remap Numpad0 + Numpad keys to be Win+number keys, in order to mimic Windows Hotkey to task bar apps
*/

; #{1} is win-1, ^#{1} is ctr-win-1, which goes to the previous
Numpad0 & Numpad1::Send ^#{1}
Numpad0 & Numpad2::Send ^#{2}
Numpad0 & Numpad3::Send ^#{3}
Numpad0 & Numpad4::Send ^#{4}
Numpad0 & Numpad5::Send ^#{5}
Numpad0 & Numpad6::Send ^#{6}
Numpad0 & Numpad7::Send ^#{7}
Numpad0 & Numpad8::Send ^#{8}
Numpad0 & Numpad9::Send ^#{9}

Numpad0 & NumpadDot::Send #0

Numpad0 & NumpadSub::
  If WinExist("SumatraPDF") {
    WinActivate
  }
Return

` & f::
Numpad0 & NumpadMult::
  If WinExist("ahk_exe foobar2000.exe") {
    WinActivate
  } Else {
    Run %PathToFoobar2000%
  }
Return

Numpad0 & NumpadEnter::
  If WinExist("ahk_exe calibre-parallel.exe") {
    WinActivate
  } else if WinExist("ahk_exe EXCEL.EXE") {
    WinActivate
  }
Return

Numpad0 & NumpadAdd::
  /*
  if calibre main window exist but not active, activate it.
  if main window is already active, switch to the full text search window (if it exists)
  if main window doesn't exist, launch calibre
  ↑ The pseudocode looks nice, but the actually might be a bit too clever down here ↓.
  The key thing to understand is, when WinExist() and WinActive() return truthy, it'll update the `Last Found Window`.
  */
  main_window_title := "calibre —"
  full_text_search_window_title := "Search the text of all books in the library"
  If WinExist(main_window_title) {
    If WinActive(main_window_title) {
      If WinExist(full_text_search_window_title) {
        WinActivate
      }
    }
    WinActivate
  } else {
    Run %PathToCalibre%
  }
Return
