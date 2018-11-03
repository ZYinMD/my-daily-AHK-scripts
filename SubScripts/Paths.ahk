; Variables are declared when first used.
; := means assignment
PathToSublime := "C:\Sublime Text 3\sublime_text.exe"
PathToChrome := "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
PathToConEmu := "C:\Dropbox\Portables\ConEmu Portable - PreviewVersion171109\ConEmu64.exe"

; I have more than one computers, and sometimes apps are installed in different paths:
if (A_ComputerName = "ZHI-DESKTOP") { ; single equal sign means evaluation
  PathToEvernote := "C:\Users\Zhi\AppData\Local\Apps\Evernote\Evernote\Evernote.exe"
  PathToDownloads := "D:\Downloads"
} else if (A_ComputerName = "ZHI-MI") { ; A_ComputerName is sort of an environmental variable
  PathToEvernote := "C:\Program Files (x86)\Evernote\Evernote.exe"
  PathToDownloads := "C:\Users\Zhi\Downloads"
}

