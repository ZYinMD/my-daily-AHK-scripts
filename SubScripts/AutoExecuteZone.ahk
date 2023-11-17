/*
Purpose:
  Auto Execute Zone
Syntax:
  AutoHotkey scripts doesn't run from top to bottom. When it's run, the goal is usually having a list of rules (hotkeys) become effective (stored in memory).
  If you want the scripts to do some things when it's run, put those things on top. The script will run from top down, until a keyword Return or :: or Exit is encountered.
  This is called the Auto Execute Zone
*/

SendMode Input ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
SetTitleMatchMode, RegEx ; This applies to window title matching functions like Set title match mode to 'contains' instead of 'starts with' (the default). See doc of `SetTitleMatchMode`

; The following things starting with a # are "directives", which will run no matter where you put them.
; But by tradition, they're also put in the Auto Execute Zone.
#SingleInstance force ;if this script is run twice, auto replace the previous one with the new one.
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.

; below is for calibre. It has to auto execute, so I put them here.
abstinence := 0
locked := True
increment() {
  global abstinence
  global locked
  if (abstinence < 15) {
    abstinence++
  } else {
    locked := False
  }
}

SetTimer, increment, 180000 ; gain 1 abstinence every 3 minutes. Will max out on 45 minutes
