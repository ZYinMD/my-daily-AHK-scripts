search_calibre_full_text() {
  Send ^c ; copy
  Sleep 150
  If WinExist("Search the text of all books in the library") {
    WinActivate
  } else {
    MsgBox % "Full text search window not open"
    Return
  }
  Sleep 150
  Click 150, 150 ; click on the search box
  Sleep 150
  Send ^a ; select all
  Sleep 150
  Send ^v ; paste
  Sleep 150
  Click 2300, 150 ; click the search button. I choose not to use Enter, because if the word has been searched before, a dropdown will pop, then Enter will select the word from the dropdown, and search won't be performed until another Enter is pressed.

}

look_up_word() {
  Send ^c ; copy
  Sleep 150
  Run, https://www.iciba.com/word?w=%clipboard%
  Sleep 150
  Run, https://www.google.com/search?q=%clipboard%&udm=2
  Sleep 150
  Run, https://www.google.com/search?q=pronounce+%clipboard%
  Sleep 150
  Run, https://www.collinsdictionary.com/dictionary/english-word/%clipboard%
}

; on win+s, search the current selected word in calibre full text index
<#s::
  search_calibre_full_text()
return

; on win+c, search the current selected word in collins dictionary + google pronunciation + google image
<#c::
  look_up_word()
return
