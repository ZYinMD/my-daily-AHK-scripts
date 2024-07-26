; get env var value from windows native env var, because there're a couple that's not included in the AHK env vars.
EnvGet, HOME, UserProfile ; HOME is the new var name, UserProfile is the native windows env var which points to ~ .
; This file uses "expression mode" for strings. A dot means concat. Read cheat sheet autoHotkeys for details
APPDATA := HOME . "\AppData"
DirDropbox := HOME . "\Dropbox"
DirPortables := DirDropbox . "\Portables"
DirDownloads := HOME . "\Downloads"
PathToVSCode := APPDATA . "\Local\Programs\Microsoft VS Code\Code.exe --disable-gpu"
PathToVSCodeInsiders := APPDATA . "\Local\Programs\Microsoft VS Code Insiders\Code - Insiders.exe --disable-gpu" ; have to disable gpu, otherwise it flickers on full screen
PathToAnki := APPDATA . "\Local\Programs\Anki\anki.exe"
PathToFoobar2000 := HOME . "\apps\foobar2000\foobar2000.exe"
PathToCalibre := DirPortables . "\Calibre\calibre-portable.exe"
