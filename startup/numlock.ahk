#NoEnv
#InstallKeybdHook
#SingleInstance, Force

SetNumLockState, AlwaysOn

^!NumLock:: ; Ctrl+Alt+NumLock
    if ( GetKeyState("NumLock", "T") )
        SetNumLockState, AlwaysOff
    else
        SetNumLockState, AlwaysOn
return
