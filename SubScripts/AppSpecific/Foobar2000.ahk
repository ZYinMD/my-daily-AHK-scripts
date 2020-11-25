#IfWinActive ahk_exe foobar2000.exe

; Ctrl-Shift-N when dropbox has focus: add 5 randoms songs into the default playlist.
^+n::
; calling bash explicitly here, I could also omit it, and rely on windows file association to directly run .sh files with the correct bash.exe, but sometimes it seems buggy: I created the correct file association but it doesn't work.
; ★ note: must use /bin/bash (similar as shebang), can't use /bin/usr/bash, which doesn't work. Not sure why.
  Run,%A_ProgramFiles%\Git\bin\bash.exe %DirDropbox%\Coding\play\features\music\add-random-songs-to-foobar2000.sh,,Hide ;Hide is an argument which means run silently. Without it the bash shell will pop up then go away.
  ;deprecated:
  ;Run,node "%DirDropbox%\Coding\play\play.js" add-songs,,Hide ;traditional mode is being used here, so don't be fooled by the color, the stuff between "" is not a string, because the whole argument (all the stuff between two commas is one agument) is a big string, it's like in between `` in js. The quota marks are part of the big string, and the %% is like ${} is js.
  return


/*
Purpose:
  The following operations in Foobar2000 are meant to be done in car with with one hand and no eyes:

  If ScrollLock is on:
    Press space will delete the current song being played
    Press → will move to next song

  F12 is remapped to ScrollLock (only in Foobar2000) because of this.
*/

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
