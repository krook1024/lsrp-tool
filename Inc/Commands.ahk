#IfWinActive GTA:SA:MP
:?:/cp::
	SendInput, /clothing place{space}
return

:?:/lk::
	if(isInChat())
	{
		return
	}

	IniRead, ame, %A_ScriptDir%\Settings.ini, Main, Ame
	if(ame)
	{
		sendChat("/ame "ame)
	}
return
#ifWinActive
