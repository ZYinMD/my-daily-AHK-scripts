; get env var value from windows native env var, because there're a couple that's not included in the AHK env vars.
EnvGet, HOME, HOMEPATH ; HOME is the new var name, HOMEPATH is the native windows env var.
; This file uses "expression mode" for strings. A dot means concat. Read cheat sheet autoHotkeys for details
APPDATA := HOME . "\AppData"
DirDropbox := HOME . "\Dropbox"
DirPortables := DirDropbox . "\Portables"
DirYoutubeDownloads := HOME . "\Desktop\youtube-dl one time download"
DirDownloads := HOME . "\Downloads"
PathToSublime := "C:\Sudo\Sublime Text 3\sublime_text.exe"
PathToVSCode := APPDATA . "\Local\Programs\Microsoft VS Code\Code.exe"
PathToVSCodeInsiders := "C:\Program Files\Microsoft VS Code Insiders\Code - Insiders.exe"
PathToSpotify := APPDATA . "\Roaming\Spotify\Spotify.exe"
PathToSlack := APPDATA . "\Local\slack\slack.exe"
PathToVivaldi := "C:\sudo\Vivaldi\Application\vivaldi.exe"
PathToChrome := "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
PathToFirefox := "C:\Program Files\Mozilla Firefox\firefox.exe"
PathToBrave := "C:\Program Files (x86)\BraveSoftware\Brave-Browser\Application\brave.exe"
PathToEdge := "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
PathToEvernote := "C:\Program Files (x86)\Evernote\Evernote.exe"
PathToFoobar2000 := "C:\sudo\foobar2000\foobar2000.exe"

; the following portable apps need to be installed in different paths on different computers so that the dropbox syncing doesn't interfere with each other
; A_xxx is env variable of AHK
; assigning variable using "traditional mode" (= instead of :=), read cheat sheet autoHotkeys to understand the syntax
PathToAnki := DirPortables . "\" . A_ComputerName . "\Anki\Anki.bat"
PathToConEmu := DirPortables . "\" . A_ComputerName . "\ConEmu\ConEmu64.exe"

if (A_ComputerName = "ZHI-D13") { ; single equal sign means evaluation, read cheat sheet autoHotkeys to understand the syntax
  ; PathToAnki := DirDropbox . "\Portables\ZHI-DESKTOP\Anki\Anki.bat" ; read cheat sheet autoHotkeys to understand the syntax
  PathToConEmu := DirPortables . "\ZHI-DESKTOP\ConEmu\ConEmu64.exe"
} else if (A_ComputerName = "ZHI-MI") { ;
  ; PathToAnki := DirDropbox . "\Portables\MI\Anki\Anki.bat"
  PathToConEmu := DirDropbox . "\Portables\MI\ConEmuPack.200615\ConEmu64.exe"
}

Sql := false ; This is a global variable for writing SQL queries, see SQL.ahk
