#Requires AutoHotKey v2.0
#SingleInstance

SetWorkingDir A_ScriptDir

SetTimer(CheckForDiscord, 1000)
return

CheckForDiscord() {
    if WinExist("ahk_exe Discord.exe") {
		winTitle := WinGetTitle("ahk_exe Discord.exe")
        if (winTitle = "Discord Updater") {
            WinWaitClose("Discord Updater")
            return
        }
		
		if (InStr(winTitle, "- Discord")) {
			WinMove(-1900, 300,,, "ahk_exe Discord.exe")
			WinMaximize("ahk_exe Discord.exe")
			
			; Run("C:\Program Files\PowerToys\PowerToys.WorkspacesLauncher.exe {69C3BCF8-0E79-457A-8BAD-6C44F78759B1} 1")
			WinWaitClose("ahk_exe Discord.exe")
		}
    }
}
