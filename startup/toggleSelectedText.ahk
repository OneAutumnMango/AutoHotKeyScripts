#Requires AutoHotkey v2.0
#SingleInstance Force

~^!t::
{
    A_Clipboard := ""
    SmartSend "^c"
    ClipWait

    if (A_Clipboard = "" || SubStr(A_Clipboard, -1) = "`n" || SubStr(A_Clipboard, -2) = "`r`n")  ; abort if nothing selected
        return

    if (ContainsUpper(A_Clipboard))
        A_Clipboard := StrLower(A_Clipboard)
    else
        A_Clipboard := StrUpper(A_Clipboard)

    SmartSend "^v"
    Sleep 100
    if (StrLen(A_Clipboard) < 30) {  ; limit to not be too slow
        Send "{Left " StrLen(A_Clipboard) "}"
        Send "+{Right " StrLen(A_Clipboard) "}"  ; reselect
    }
}

ContainsUpper(str) {
    for _, char in StrSplit(str) {
        if (IsUpper(char))
            return true
    }
    return false
}

SmartSend(keys) {  ; definitely not necessary as it doesnt even properly work in msys. tried with backspace but is awkward
    processes := Map("mintty.exe", true)
    if (processes.Has(WinGetProcessName("A")))
        Send "+" . keys
    else
        Send keys
}

^!Esc::ExitApp
return
