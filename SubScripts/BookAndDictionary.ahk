; on win+s, search the current selected word in calibre full text index
<#s::{
  selected_word := get_current_selection()
  search_calibre_full_text(selected_word)
}

; on win+c, search the current selected word in collins dictionary + google pronunciation + google image
<#c::{
  selected_word := get_current_selection()
  look_up_word(selected_word)
}

/**
* get the text that is currently selected
*/
get_current_selection(){
  Sleep(150)
  Send("^c") ; copy
  Sleep(150)
  result := RegExReplace(A_Clipboard, "\s+$") ; remove trailing spaces
  Return result
}

/**
* search a word in calibre's full text index
*/
search_calibre_full_text(word) {
  If WinExist("Search the text of all books in the library") {
    WinActivate()
  } else {
    MsgBox("Full text search window not open")
    Return
  }
  Sleep(150)
  Click(200, 90) ; click on the search box
  Sleep(150)
  Send("^a") ; select all
  Sleep(150)
  ; Send("^v") ; paste
  SendText(word)
  Sleep(150)
  Send("!{s}") ; alt s to hit the search button
}

/**
* look up a word in various websites for learning it
*/
look_up_word(word) {
  Run("https://youglish.com/pronounce/" . word . "/english")
  Sleep(150)
  Run("https://www.iciba.com/word?w=" . word)
  Sleep(150)
  Run("https://www.google.com/search?udm=2&q=" . word)
  Sleep(150)
  Run("https://www.google.com/search?q=pronounce+" . word)
  Sleep(150)
  Run("https://www.collinsdictionary.com/dictionary/english/" . word)
  Sleep(150)
  Send("#0") ; switch to grok (10th on taskbar)
  Sleep(500)
  Send("^j") ; ctrl j to create a new chat. Use left control, because right control+j is mapped to switching input method
  input := "I'm learning English. Please explain the meaning of '" . word . "', with collocations and example sentences. Also, are there some linguistic facts that can help me learn it?" ; "" is escaped " inside string
  Sleep(400) ; Wait a big longer because the input box isn't immediately ready after creating new chat
  A_Clipboard := input ; put the input into clipboard, paste later. Use paste instead of SendText because it's less buggy
  Sleep(150)
  Send("^v") ; paste.
}
