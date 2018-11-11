/*
Purpose:
  Auto Execute Zone
Syntax:
  AutoHotkey scripts doesn't run from top to bottom. When it's run, the goal is usually having a list of rules (hotkeys) become effective (stored in memory).
  If you want the scripts to do some things when it's run, put those things on top. The script will run from top down, until a keyword Return or :: or Exit is encountered.
  This is called the Auto Execute Zone
*/

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; The following things starting with a # are "directives", which will run no matter where you put them.
; But by tradition, they're also put in the Auto Execute Zone.
#SingleInstance force ;if this script is run twice, auto replace the previous one with the new one.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.

SetTitleMatchMode 2 ; Set how a keyword is searched against window titles. 1 for "starting with", and 2 for "including".
