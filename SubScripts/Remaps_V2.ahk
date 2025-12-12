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

/*
Purpose:
  We will create some custom modifiers keys.
Explain:
  If a key become a modifier key, it will no longer work when pressed, because the script is always waiting for the potential second key. To fix this, we remap a key to itself, so the script will know you want a restore, the key will fire on key up.
*/
`::`
F1::F1
F2::F2
F3::F3
F4::F4
Numpad0::Numpad0
