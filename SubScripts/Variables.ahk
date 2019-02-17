; Variables are declared when first used.
; := means assignment

PathToSublime := "C:\Sudo\Sublime Text 3\sublime_text.exe"
PathToVSCode := "C:\Users\Zhi\AppData\Local\Programs\Microsoft VS Code\Code.exe"
PathToConEmu := "C:\Dropbox\Portables\ConEmu Portable - PreviewVersion171109\ConEmu64.exe"
PathToSpotify := "C:\Users\Zhi\AppData\Roaming\Spotify\Spotify.exe"
PathToFoobar2000 := "C:\Dropbox\Portables\Foobar2000\foobar2000.exe"
PathToAnki := "C:\Program Files\Anki\anki.exe"
PathToSlack := "C:\Users\Zhi\AppData\Local\slack\slack.exe"
PathToVivaldi := "C:\sudo\Vivaldi\Application\vivaldi.exe"
PathToChrome := "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

; I have more than one computers, and sometimes apps are installed in different paths:
if (A_ComputerName = "ZHI-DESKTOP") { ; single equal sign means evaluation
  PathToEvernote := "C:\Users\Zhi\AppData\Local\Apps\Evernote\Evernote\Evernote.exe"
  PathToFirefox := "C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
  PathToDownloads := "D:\Downloads"
} else if (A_ComputerName = "ZHI-MI") { ; A_ComputerName is sort of an environmental variable
  PathToEvernote := "C:\Program Files (x86)\Evernote\Evernote.exe"
  PathToFirefox := "C:\Program Files\Mozilla Firefox\firefox.exe"
  PathToDownloads := "C:\Users\Zhi\Downloads"
}

Sql := false ; This is a global variable for writing SQL queries, see SQL.ahk
