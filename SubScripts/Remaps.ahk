/*
Purpose:
  If LCtrl was pressed down and up with no other keys combined, fire a mouse click on up.
  I'm likely the only person on earth who needs this.
  Note:
  This works only because LCtrl has been set to be a modifier key, otherwise the script will fire the mouse click immediately on key down
*/
LControl::Click

/*
Purpose:
  Except the one above↑, all the following remaps can be done with either AutoHotkey or keytweak, but not both together (will cause undesired behavior, e.g. CapsLock -> Right Control -> PgDn). On some computers, like my Mi laptop, AutoHotkey doesn't always work well, so I use keytweak.

Syntax:
  Things between #If(expression) and #If are only effective when condition is met. For operators, search AutoHotkey Doc for "operators in expressions"
*/

#If !(A_ComputerName = "ZHI-MI")

  /*
  Purpose:
    Remap CapsLock to RCtrl. (Has to be RCtrl, because LCtrl will have different jobs.)
  Syntax:
    key::targetKey
    This means a remap, effect holds even when in combinations with other keys.
  */
  CapsLock::RControl

  /*
  Purpose:
    Similarly, remap the following:
    + => ↑
    [ => ←
    ] => ↓
    \ => →
    - => Delete
    ' => Enter
    Enter => Home
    RShift => End
    RAlt => PgUp
    RCtrl => PgDn
    / => AppsKey
  */
  =::Up
  [::Left
  ]::Down
  \::Right
  -::Delete
  '::Enter
  Enter::Home
  RShift::End
  RAlt::PgUp
  RCtrl::PgDn
  /::AppsKey

#If

; all custom modifiers:
F1::F1
