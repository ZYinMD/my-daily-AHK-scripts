/*
Purpose:

  Ctrl-Shift-N when dropbox has focus: add 5 randoms songs into the default playlist.

  The following operations in Foobar2000 are meant to be done in car with with one hand and no eyes:

  If ScrollLock is on:
    Press space will delete the current song being played
    Press → will move to next song

  F12 is remapped to ScrollLock (only in Foobar2000) because of this.
*/

#IfWinActive ahk_exe foobar2000.exe

^+n::
  Run,node "%PathToDropboxFolder%\Coding\play\play.js" foobar2000,,Hide ;traditional mode is being used here, so don't be fooled by the color, the stuff between "" is not a string, because the whole argument (all the stuff between two commas is one agument) is a big string, it's like in between `` in js. The quota marks are part of the big string, and the %% is like ${} is js. Hide is an argument which means run silently. Without it the node shell will pop up then go away.
  return
Space::
  If GetKeyState("ScrollLock","t") {
    Send +{Delete}
    Sleep 200
    Send {y}
  }
  Else
    Send {Space}
  Return

Right::
  If GetKeyState("ScrollLock","t")
    Send !{Right}
  Else
    Send {Right}
  Return

F12::ScrollLock

#IfWinActive
