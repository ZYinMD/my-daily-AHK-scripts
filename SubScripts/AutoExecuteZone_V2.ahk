/*
Purpose:
  Auto Execute Zone
Syntax:
  AutoHotkey scripts doesn't run from top to bottom. When it's run, the goal is usually having a list of rules (hotkeys) become effective (stored in memory).
  If you want the scripts to do some things when it's run, put those things on top. The script will run from top down, until a keyword Return or :: or Exit is encountered.
  This is called the Auto Execute Zone.
New in V2:
  When migrating to V2, I have removed lots of things that's no longer needed. So if a line is present in V1 but not in V2, it's because I removed it.
*/

SetTitleMatchMode "RegEx" ; by default,
; The following things starting with a # are "directives", which will run no matter where you put them.
; But by tradition, they're also put in the Auto Execute Zone.
#SingleInstance force ;if this script is run twice, auto replace the previous one with the new one.
