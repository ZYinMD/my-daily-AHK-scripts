search_calibre_full_text() {
  Send ^c ; copy
  Sleep 150
  If WinExist("Search the text of all books in the library") {
    WinActivate
  } else {
    MsgBox % "Full text search window not open"
    Return
  }
  ; remove trailing spaces from clipboard
  Clipboard := RegExReplace(Clipboard, "\s+$")
  Sleep 150
  Click 150, 150 ; click on the search box
  Sleep 150
  Send ^a ; select all
  Sleep 150
  Send ^v ; paste
  Sleep 150
  Send !{s}
}

look_up_word() {
  Send ^c ; copy
  Sleep 150
  ; remove trailing spaces from clipboard
  Clipboard := RegExReplace(Clipboard, "\s+$")
  Sleep 150
  Run, https://www.iciba.com/word?w=%clipboard%
  Sleep 150
  Run, https://youglish.com/pronounce/%clipboard%/english
  Sleep 150
  Run, https://www.google.com/search?q=%clipboard%&udm=2
  Sleep 150
  Run, https://www.google.com/search?q=pronounce+%clipboard%
  Sleep 150
  Run, https://www.collinsdictionary.com/dictionary/english/%clipboard%
  Sleep 150
  If WinExist("ahk_exe msedge.exe") {
    WinActivate
    Sleep 150
    Send ^2 ; switch to the 2nd tab which is ChatGPT
    Sleep 150
    Click 2000, 2000 ; click on the input box
    Sleep 150
    Send ^a ; select all
    Sleep 150
    Send meaning of "%clipboard%"?
  }
}

; on win+s, search the current selected word in calibre full text index
<#s::
  search_calibre_full_text()
return

; on win+c, search the current selected word in collins dictionary + google pronunciation + google image
<#c::
  look_up_word()
return
