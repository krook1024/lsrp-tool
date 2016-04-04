SetWorkingDir %A_ScriptDir%

#UseHook
#NoEnv
#SingleInstance Force

#include %A_ScriptDir%/Inc/SAMP.ahk

; Tray menu
Menu, tray, add 
Menu, tray, add, Edit .ini settings, EditSettings

; Global declarations
global friendList := []

;#include %A_ScriptDir%/Inc/Friends.ahk

; End of auto-exec section
return

EditSettings:
	Run, %A_ScriptDir%\Settings.ini
return

#include %A_ScriptDir%/Inc/Commands.ahk
#include %A_ScriptDir%/Inc/Keybinds.ahk
