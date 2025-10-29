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
  Sleep 150
  Send ^c ; copy
  Sleep 150
  ; remove trailing spaces from clipboard
  Clipboard := RegExReplace(Clipboard, "\s+$")
  Sleep 150
  Run, https://youglish.com/pronounce/%clipboard%/english
  Sleep 150
  Run, https://www.iciba.com/word?w=%clipboard%
  Sleep 150
  Run, https://www.google.com/search?q=%clipboard%&udm=2
  Sleep 150
  Run, https://www.google.com/search?q=pronounce+%clipboard%
  Sleep 150
  Run, https://www.collinsdictionary.com/dictionary/english/%clipboard%
  Sleep 150
  Send #0 ; switch to grok (10th on taskbar)
  Sleep 500
  Click 3770, 70 ; create a new chat
  input = I'm learning English. Please explain the meaning of "%clipboard%", with collocations and example sentences. Also, are there some linguistic facts that can help me learn it?
  Clipboard = %input%
  Sleep 500
  Send ^v ; paste. Wait a big longer because the input box isn't immediately ready after creating new chat

  /*
  If WinExist("ahk_exe msedge.exe") {
    WinActivate
    Sleep 150
    Send ^3 ; switch to the 3rd tab which is Grok
    Sleep 200
    ; Send ^j ; ctrl j (not working for now)
    Click 3435, 263
    Sleep 250
    PostMessage 0x50, 0, DllCall("LoadKeyboardLayout", "Str", "00000409", "Int", 1),, As ; switch to english input
    Sleep 250
    SendInput I'm learning English. Please explain the meaning of "%clipboard%", with example sentences. Also, are there some linguistic facts that can help me learn it?
  }
  */

}

; on win+s, search the current selected word in calibre full text index
<#s::
  search_calibre_full_text()
return

; on win+c, search the current selected word in collins dictionary + google pronunciation + google image
<#c::
  look_up_word()
return
