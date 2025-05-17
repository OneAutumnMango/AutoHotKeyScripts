#Requires AutoHotKey v2.0
#SingleInstance

SetWorkingDir A_ScriptDir

global WasIdle := false

; SetTimer(CheckForDiscord, 1000)
SetTimer(IdleMonitor, 1000)
return

IdleMonitor() {
	global WasIdle
    static IdleThreshold := 20 * 60 * 1000 ; 20 minutes in ms
    idleTime := A_TimeIdlePhysical

    if (idleTime > IdleThreshold) {
        WasIdle := true
    } else if (WasIdle) {
        ; User was idle and is now active
        WasIdle := false
        MoveDiscord()
    }
}

MoveDiscord() {
	win := "ahk_exe Discord.exe"
    if WinExist(win) {	
		WinRestore(win)
		WinMove(-1900, 300,,, win)
		WinMaximize(win)
    }
}


; CheckForDiscord() {
;     if WinExist("ahk_exe Discord.exe") {
; 		winTitle := WinGetTitle("ahk_exe Discord.exe")
;        if (winTitle = "Discord Updater") {
;            WinWaitClose("Discord Updater")
;            return
;        }
; 		
; 		MoveDiscord()
; 			
; 			; Run("C:\Program Files\PowerToys\PowerToys.WorkspacesLauncher.exe {69C3BCF8-0E79-457A-8BAD-6C44F78759B1} 1")
; 		WinWaitClose("ahk_exe Discord.exe")
; 		
;     }
; }