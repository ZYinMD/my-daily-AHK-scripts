; Important Note: If /* */ is used for comments, both /* and */ must appear at the beginning of line.

; If you don't know the syntax, read from top to bottom, read every comment, you'll become a master when you finish.


/*
How to use

Important Note:
  Use Windows line break (CRLF), not Unix (LF). This is Windows!
  If you downloaded this file from github, remember to change back to CRLF manually, because I've set my git to auto-convert to LF.

Style Guide:
  Use PascalCase, although the language is case insensitive.
*/


; #Include means import another file as if it's copied into this position.
; If you're learning the syntax from reading the comments, follow the order of these files, one by one, don't jump around.
#Include SubScripts\AutoExecuteZone.ahk
#Include SubScripts\Variables.ahk
#Include SubScripts\Remaps.ahk
#Include SubScripts\Hotkeys.ahk
#Include SubScripts\HotStrings.ahk
#Include SubScripts\ActivateApps.ahk
#Include SubScripts\OpenPaths.ahk
#Include SubScripts\Numpad.ahk
#Include SubScripts\SQL.ahk


; App specific hotkeys: hotkeys that work only inside certain apps
#Include SubScripts\AppSpecific\ConEmu.ahk
#Include SubScripts\AppSpecific\FileExplorer.ahk
#Include SubScripts\AppSpecific\Evernote.ahk
#Include SubScripts\AppSpecific\SublimeText.ahk
#Include SubScripts\AppSpecific\Anki.ahk

