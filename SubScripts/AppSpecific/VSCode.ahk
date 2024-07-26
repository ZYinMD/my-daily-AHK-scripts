/*
Purpose:
  Some hotkeys when inside sublime text:
*/

; Different than the other apps, #If is used instead of #IfWinActive here, because I need an expression
#If WinActive("ahk_exe Code.exe") or WinActive("ahk_exe Code - Insiders.exe")

  ; use ` as modifier key in VSCode to do things:
  ; `up and `down to move between panes
  ` & Up::
  ` & =::Send ^{Numpad4}
  ` & down::
  ` & ]::Send ^{Numpad6}

  ; `Delete and `Backspace to toggle line comment and block comment
  ` & -::
  ` & Delete::Send ^/

  ` & BackSpace::Send +!{a}

  ; use 1 as modifier key for selection.
  ; F1Left and F1Right for expanding and shrinking selection
  f1 & Left::
  f1 & [::Send +!{Right}
  f1 & Right::
  f1 & \::Send +!{Left}
  ; f1up and f1down for line selection, I installed the plugin "Better Line Select"
  f1 & Up::
  f1 & =::Send ^!l ; I set this keybinding with "better line select" extension
  f1 & Down::
  f1 & ]::Send ^l ; this key binding is vscode native

  ; Use 2 to delete.
  ; 2left and 2right to delete words. This is already supported in generic programs.

  ; 2home and 2end to backspace to line start and delete to line end. The vscode's native 2end is better than mine:
  ; I set "Delete all left" and "Delete all right" to ^+Backspace and ^+Delete. It's turned off by default
  2 & Right::
  2 & \::
  2 & End::
  2 & RShift::Send ^+{Delete}

  ; 2up and 2down to delete line
  2 & ]::
  2 & Down::Send ^+k ; native line delete is better than my line delete (when next line is indented)
  2 & =::
  2 & Up:: Send ^+k{Up}

  ; Use 3 as a modifier key to move texts around.
  3 & Left::
  3 & [::Send ^[
  3 & Right::
  3 & \::Send ^]
  3 & Up::
  3 & =::Send ^!+{Up}
  3 & Down::
  3 & ]::Send ^!+{Down}
  3::3 ; restore 3

  ; use 4 as modifier key in VSCode to fold:
  ; 4left and 4right for folding:
  4 & Left::
  4 & [::Send ^+[
  4 & Right::
  4 & \::Send ^+]
  ; 4Home to fold all, 4End to unfold all
  4 & Enter::
  4 & Home::Send ^+!u
  4 & RShift::
  4 & End::Send ^+!]
  ; 4Up and 4Down for finding errors:
  4 & Up::
  4 & =::Send !{F8}
  4 & Down::
  4 & ]::Send {F8}

  4::4

  ; to activate AceJump:
  !Space::Send ^{F11}

  ; use Appskey for "quick fix" (= click the lightbulb) (mainly for auto correct of spell check)
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
  result := Chr(letter1) Chr(letter2) Chr(letter3) digit1 digit2 digit3 ; this concats. Can also use "." to explicitly concat
  return result
}
