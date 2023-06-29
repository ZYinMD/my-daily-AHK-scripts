; get env var value from windows native env var, because there're a couple that's not included in the AHK env vars.
EnvGet, HOME, UserProfile ; HOME is the new var name, UserProfile is the native windows env var which points to ~ .
; This file uses "expression mode" for strings. A dot means concat. Read cheat sheet autoHotkeys for details
APPDATA := HOME . "\AppData"
DirDropbox := HOME . "\Dropbox"
DirPortables := DirDropbox . "\Portables"
DirYoutubeDownloads := A_Desktop . "\youtube-dl one time download"
DirDownloads := HOME . "\Downloads"
PathToSublime := "C:\Sudo\Sublime Text 3\sublime_text.exe"
PathToVSCode := APPDATA . "\Local\Programs\Microsoft VS Code\Code.exe"
PathToVSCodeInsiders := APPDATA . "\Local\Programs\Microsoft VS Code Insiders\Code - Insiders.exe"
PathToAnki := APPDATA . "\Local\Programs\Anki\anki.exe"
PathToSpotify := APPDATA . "\Roaming\Spotify\Spotify.exe"
PathToSlack := APPDATA . "\Local\slack\slack.exe"
PathToChrome := "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
PathToFoobar2000 := HOME . "\apps\foobar2000\foobar2000.exe"
PathToBash := A_ProgramFiles . "\Git\bin\bash.exe"
PathToCalibre := DirPortables . "\Calibre\calibre-portable.exe"

; the following portable apps need to be installed in different paths on different computers so that the dropbox syncing doesn't interfere with each other
; A_xxx is env var of AHK
; assigning variable using "traditional mode" (= instead of :=), read cheat sheet autoHotkeys to understand the syntax
PathToConEmu := DirPortables . "\" . A_ComputerName . "\ConEmu\ConEmu64.exe" ; this is actually no longer used, but let's leave it here for an example of using A_ComputerName

Sql := false ; This is a global variable for writing SQL queries, see SQL.ahk
