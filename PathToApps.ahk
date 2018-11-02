; Because AutoHotkey is a language that deals with strings a lot, strings don't need quotes.
PathToChrome = C:\Program Files (x86)\Google\Chrome\Application\chrome.exe

; I have more than one computers, and apps are installed in different paths:
if (A_ComputerName = "ZHI-DESKTOP") { ; A_ComputerName is sort of a environmental variable
  PathToSublime = C:\Sublime Text\sublime_text.exe
} else if (A_ComputerName = "ZHI-MI") {
  PathToSublime = C:\Sublime Text 3\sublime_text.exe
}

