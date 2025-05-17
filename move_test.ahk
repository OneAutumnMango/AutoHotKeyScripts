#Requires AutoHotKey v2.0
#SingleInstance

win := "ahk_exe Discord.exe"

WinRestore(win)
WinMove(-1928, 202,,, win)
WinMaximize(win)
return