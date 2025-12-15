; Important Note: If /* */ is used for comments, both /* and */ must appear at the beginning of line.

/*
Important Note:
  Use Windows line break (CRLF), not Unix (LF).
  Use .gitattributes file to make sure this.

Style Guide:
  Use PascalCase, although the language is case insensitive.

If you don't know the syntax:
  Follow into each #Include file, read every single comments in them. You'll become a master when finish.
  Make sure to read the files in order from top to bottom, don't jump around.
*/

; #Include means import a file as if it's copied into the position of #Include.
#Include SubScripts\AutoExecuteZone_V2.ahk
#Include SubScripts\Variables_V2.ahk
#Include SubScripts\Remaps_V2.ahk
#Include SubScripts\Hotkeys_V2.ahk
#Include SubScripts\HotStrings_v2.ahk
#Include SubScripts\ActivateApps_V2.ahk
#Include SubScripts\Numpad_V2.ahk

; App specific hotkeys: hotkeys that work only inside certain apps
#Include SubScripts\AppSpecific\VSCode_V2.ahk
