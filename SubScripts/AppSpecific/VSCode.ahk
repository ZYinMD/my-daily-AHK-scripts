/*
Purpose:
  Some hotkeys when inside sublime text:
*/

#IfWinActive ahk_exe Code.exe

; use alt space to call out the command palette:
  !Space::Send ^+p

; use ` as modifier key in VSCode to do things:
  ; `left and `right for folding:
  ` & Left::
  ` & [::Send ^+[
  ` & Right::
  ` & \::Send ^+]

  ; `up for breadcrumb, `down for workspace selecting
  ` & Up::
  ` & =::Send ^+.
  ` & down::
  ` & ]::Send ^r

  ; `Delete and `Backspace to toggle line comment and block comment
  ` & -::
  ` & Delete::Send ^/
  ` & BackSpace::Send ^+/

; use 1 as modifier key for selection.
  ; 1Left and 1Right for expanding and shrinking selection
  1 & Left::
  1 & [::Send +!{Right}
  1 & Right::
  1 & \::Send +!{Left}
  ; 1up and 1down for line selection, I installed the plugin "Better Line Select"
  1 & Up::
  1 & =::Send ^!l
  1 & Down::
  1 & ]::Send ^l

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

; Alt ` to collapse all folders in the file explorer and then focus on it
  !`::Send ^{F1}!{NumpadSub} ; focus on file explorer

; alt + ↑↓←→ to move cursor fast
  !Left::
  ![::Send {left 10}
  !Right::
  !\::Send {right 10}
  !Up::
  !=::Send {Up 4}
  !Down::
  !]::Send {Down 4}

; to activate jumpy:
  `; & Space::Send ^{F11}
; not successful, stopped trying
; ` & F5::
; Numpad0 & Up::
; ControlSend,,{Up}{Enter},ahk_exe ConEmu64.exe
; Return

#IfWinActive
