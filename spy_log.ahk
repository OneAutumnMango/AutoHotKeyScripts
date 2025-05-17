
#Requires AutoHotKey v2.0
#SingleInstance

logFile := A_ScriptDir "\window_log.txt"
lastWindow := ""

SetTimer LogNewWindows, 100  ; Check every 100 ms
return

LogNewWindows() {
    global lastWindow, logFile

    hwnd := WinExist("A")  ; Foreground window
    if !hwnd
        return

    winTitle := WinGetTitle(hwnd)
    winClass := WinGetClass(hwnd)
    exePath := WinGetProcessPath(hwnd)
    info := "Title: " winTitle "`nClass: " winClass "`nExe: " exePath "`nTime: " A_Now "`n`n"

    ; Only log if it's a new window (avoid duplicates)
    if (winTitle != lastWindow && winTitle != "") {
        FileAppend info, logFile
        lastWindow := winTitle
    }
}
