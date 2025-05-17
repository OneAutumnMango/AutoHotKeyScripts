#Persistent
SetTimer, DrawCursor, 10
Return

DrawCursor:
MouseGetPos, xpos, ypos
ToolTip, +, % xpos, % ypos
WinSet, Transparent, 255, ahk_class tooltips_class32
Return
