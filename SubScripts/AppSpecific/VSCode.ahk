/*
Purpose:
  Some hotkeys when inside sublime text:
*/

; Different than the other apps, #If is used instead of #IfWinActive here, because I need an expression
#If WinActive("ahk_exe Code.exe") or WinActive("ahk_exe Code - Insiders.exe") or WinActive("ahk_exe Cursor.exe")

  ; to activate AceJump:
  !Space::Send ^{F11}

  ; use AppsKey for "quick fix" (= click the lightbulb) (mainly for auto correct of spell check)
  /::
    Send ^+{NumpadSub}
  return
  AppsKey::
    Send ^+{NumpadSub}
  return

  ; generate a random string to locate errors reported by `reportErr`:
  ^Numpad3:: SendInput % RandomErrLocator() ; % is used to call a function and send the result of the function. This line is equivalent to   errLocator := RandomErrLocator()    SendInput, %errLocator%

  /*
  Alt L should still be Alt L in VSCode (it's mapped to Alt D in other places as "focus on address bar")
   */
  !l::Send !l
#If

/*
Generate a random errLocator string
*/
RandomErrLocator() {
  Random, letter1, 65, 90 ; ASCII values for uppercase letters (A-Z)
  Random, letter2, 97, 122 ; lowercase letters (a-z)
  Random, letter3, 97, 122
  Random, digit1, 0, 9
  Random, digit2, 0, 9
  Random, digit3, 0, 9
  result := Chr(letter1) Chr(letter2) Chr(letter3) digit1 digit2 digit3 ; this is concat. Can also use "." to explicitly concat
  return result
}
