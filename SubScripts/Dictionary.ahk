search_calibre_full_text() {
  Click 2 ; double click to select word
  Sleep 100
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

<#s::
  search_calibre_full_text()
return
