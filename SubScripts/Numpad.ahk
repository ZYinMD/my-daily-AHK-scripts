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
Numpad0::Numpad0 ;restore Numpad0

Numpad0 & NumpadSub::
  If WinExist("ahk_exe SumatraPDF.exe") {
    WinActivate
  }
Return

Numpad0 & NumpadDiv::
  If WinExist("ahk_exe Spotify.exe") {
    WinActivate
  } Else {
    Run %PathToSpotify%
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
  }
Return

Numpad0 & NumpadAdd::
  If WinExist("ahk_exe calibre.exe"){
    WinActivate
  } Else {
    Run %PathToCalibre%
  }
Return
