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

<!s::
` & s::
  IfWinExist ahk_exe sublime_text.exe
    WinActivate
  Else Run %PathToSublime%
  Return

<!x::
` & x::
  IfWinExist ahk_exe firefox.exe
    WinActivate
  Else Run %PathToFirefox%
  Return

<!v::
` & v::
  IfWinExist ahk_exe Code.exe
    WinActivate
  Else Run %ComSpec% /c "code --disable-gpu",,hide ; %ComSpec% is the environmental variable for cmd.exe, /c I don't know what it is. ,,hide means close the cmd window
  Return

<!c::
` & c::Send #2 ; This is to activate Chrome, which is better done by Win-2, because there's open other SPA open

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
