; get env var value from windows native env var
HOME := EnvGet("UserProfile") ; HOME points to ~
APPDATA := HOME . "\AppData"
DirDropbox := HOME . "\Dropbox"
DirPortables := HOME . "\Portable Apps"
PathToVSCode := APPDATA . "\Local\Programs\Microsoft VS Code\Code.exe"
PathToCursor := APPDATA . "\Local\Programs\cursor\Cursor.exe"
PathToVSCodeInsiders := APPDATA . "\Local\Programs\Microsoft VS Code Insiders\Code - Insiders.exe"
PathToAnki := APPDATA . "\Local\Programs\Anki\anki.exe"
PathToFoobar2000 := DirPortables . "\foobar2000\foobar2000.exe"
PathToCalibre := DirPortables . "\Calibre\calibre-portable.exe"
