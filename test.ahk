#SingleInstance force ;if this script is run twice, auto replace the previous one with the new one.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; SysGet, A_ScreenWidth, 0
; MsgBox, %A_ScreenWidth%
SplashX := A_ScreenWidth-350
MsgBox, %SplashX%

Insert::Delete
#If GetKeyState("ScrollLock", "T")
    /::NavOff()

#If

#If !GetKeyState("ScrollLock", "T")
    /::NavOn()
#If

NavOn()
  {
    SetScrollLockState, On
    ; SplashImage, nav.gif,b,,,NoActivate
    Progress, b CWWhite ZH0 fs88, Nav,,,Arial
    WinSet, TransColor, White, Nav
    ; SplashImage, picture.gif,b x25 y25,,,Nav
  }

NavOff()
  {
    SetScrollLockState, Off
    SplashImage, Off
    Progress, Off
  }
; Hi! I have a question, in this line here, how can I use a variable in place of 25? I still haven't figured out how to use the % symbol
; SplashImage, picture.gif,b x25 y25




/*

#InputLevel 1
h::Home

#InputLevel 0
^h::^h
Hi, I have a question, when I did this:
^=:: Send ^{=}
=::End
It worked as intended. However when I flipped the order of these two lines, the ^= stopped working and functions as ^{End}. So it seems the order counts, but I didn't see anything about ordering in the help file?
*/
