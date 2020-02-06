/*
Purpose:
  In order to use alt-tab as little as possible, the most frequently used apps should each have a shortcut.
Syntax:
  If more than one line of code needs to be triggered by a hotkey, add Return in the end.
  Use %varname% to retrieve the value of a variable
  If all parameters of WinActivate are omitted, the Last Found Window will be used.
*/

` & t::
  IfWinExist ahk_exe ConEmu64.exe
    WinActivate
  Else Run %PathToConEmu%
  Return

` & e::
  IfWinExist ahk_exe Evernote.exe
    WinActivate
  Else Run %PathToEvernote%
  Return

` & u::  ; µTorrent minimizes to tray, so need to WinShow first
  WinShow µTorrent
  WinActivate µTorrent
  Return

` & r::
  IfWinExist Redux DevTools
    WinActivate
  Return

` & s::
  IfWinExist ahk_exe Code - Insiders.exe
    WinActivate
  Else Run %PathToVSCodeInsiders%
  Return

  ; ` & s used to be sublime↓, but now it's vscode insiders
  ; IfWinExist ahk_exe sublime_text.exe
  ;   WinActivate
  ; Else Run %PathToSublime%
  ; Return

<!x::
` & x::
  IfWinExist ahk_exe firefox.exe
    WinActivate
  Else Run %PathToFirefox%
  Return

<!b::
  IfWinExist ahk_exe brave.exe
    WinActivate
  Else Run %PathToBrave%
  Return

<!v::
` & v::
  IfWinExist ahk_exe vivaldi.exe
    WinActivate
  Else Run %PathToVivaldi%
  Return

<!s::
  IfWinActive ahk_exe Code.exe
  {
    Send ^{p}
    Return
  }
  Else {
    IfWinExist ahk_exe Code.exe
      WinActivate
    Else Run %ComSpec% /c "code --disable-gpu",,hide
      ; have to disable gpu, otherwise it flickers on full screen
      ; this is equivalent to running `code --disable-gup` in CLI. %ComSpec% is the environmental variable for cmd.exe, /c I don't know what it is. ,,hide means close the cmd window
    Return
  }
<!c::
` & c::
  IfWinActive ahk_exe xnview.exe
  {
    Send !{c}
    Return
  }
  Else {
    IfWinExist ahk_exe chrome.exe
      WinShow
      WinActivate
    ; Send #{2}
    Return
  }

` & l::
  IfWinExist Slack
    WinActivate Slack
  Else Run %PathToSlack%
  Return

<!a::
  IfWinExist Add
    WinActivate
  Else IfWinExist ahk_exe anki.exe
    WinActivate
  Else Run %PathToAnki%
  Return

` & q::
  IfWinExist Studio 3T
    WinActivate
  Else IfWinExist MySQL Workbench
    WinActivate
  Return

` & o::
  IfWinExist ahk_exe PotPlayerMini64.exe
    WinActivate
  Return

` & p::
  IfWinExist ahk_exe Postman.exe
    WinActivate
  Return
