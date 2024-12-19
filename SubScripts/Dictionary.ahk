search_calibre_full_text() {
  Send ^c ; copy
  Sleep 100
  If WinExist("Search the text of all books in the library") {
    WinActivate
  } else {
    MsgBox % "Full text search window not open"
    Return
  }
  Sleep 100
  Click 150, 150 ; click on the search box
  Sleep 100
  Send ^a ; select all
  Sleep 100
  Send ^v ; paste
  Sleep 100
  Send {Enter} ; search
}

look_up_word() {
  Send ^c ; copy
  Sleep 100
  Run, https://www.iciba.com/word?w=%clipboard%
  Sleep 100
  Run, https://www.google.com/search?q=%clipboard%&udm=2
  Sleep 100
  Run, https://www.google.com/search?q=pronounce+%clipboard%
  Sleep 100
  Run, https://www.collinsdictionary.com/dictionary/english/%clipboard%
}

; on win+s, search the current selected word in calibre full text index
<#s::
  search_calibre_full_text()
return

; on win+c, search the current selected word in collins dictionary + google pronunciation + google image
<#c::
  look_up_word()
return
