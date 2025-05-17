#Requires AutoHotKey v2.0
#SingleInstance

SetWorkingDir A_ScriptDir

SetTimer(CheckForSlippi, 1000)
return


CheckForSlippi() {
    static processRunning := false
    static pid := 0

    if WinExist("ahk_exe Slippi Dolphin.exe") {
        if (!processRunning) {
            Run('C:\msys64\home\david\.venv\Scripts\python ./disRP.py', "", "Hide", &pid)

            processRunning := true
        }
    } else {
        if (processRunning) {
            Run('taskkill /PID ' . pid , "", "Hide", &pid)
            processRunning := false
        }
    }
}
