; Functions
getInfoStyle()
{
	IniRead, InfoStyle, %A_ScriptDir%\Settings.ini, Main, InfoStyle
	if InfoStyle = Chatbox
		string = Chatbox
	else
		string = Gametext
		
	return string
}

; Keybinds
#ifWinActive ahk_exe gta_sa.exe

!1::
	if(isInChat())
	{
		return
	}
	
	sendChat("/enter")
	sendChat("/exit")
return

!2::
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

!3::
	if(isInChat())
	{
		return
	}

	sendChat("/door")
return


!k::
	if(isInChat())
	{
		return
	}
	
	sendChat("/engine")
return

!l::
	if(isInChat())
	{
		return
	}
	
	sendChat("/lock")
return

!m::
	if(isInChat())
	{
		return
	}
	
	sendChat("/mask")
return

~Numpad5::
	if(isInChat())
		return
	
	health 	=	% getPlayerHealth()
	armor 	= 	% getPlayerArmor()
	int 	= 	% getPlayerInteriorId()
	money 	= 	% getPlayerMoney()
	
	if(getInfoStyle() = "Gametext")
	{
		showGameText("~r~" health "~y~ ~n~ ~w~" armor "~n~ " A_Hour ":" A_Min " ~n~~n~", 1750, 4)
	}
	else
	{
		addChatMessage("{FFFFFF}[STATS]: {1E90FF}HP:{FFFFFF} " health " | {1E90FF}Armor:{FFFFFF} " armor " | {1E90FF}Interior:{FFFFFF} " int " | {1E90FF}Money:{FFFFFF} $" money " ")
		if(isPlayerInAnyVehicle())
		{
			type 	:= 	getVehicleModelName()
			hp		:=	getVehicleHealth()
			addChatMessage("{FFFFFF}[STATS]: {1E90FF}" type "'s health: {FFFFFF}" hp)
		}
	}
return

~Numpad7::
	if(isInChat())
		return
	
	IniRead, ClothesString, %A_ScriptDir%\Settings.ini, Main, Clothes
	Loop, Parse, ClothesString, `,
	{
		sendChat("/clothing place " A_LoopField)
	}
return

~Numpad9::
	if(isInChat())
		return

	sendChat("/sa")
return

~NumpadAdd::
	if(isInChat())
		return
	
	sendChat("/opentoll")
return

#IfWinActive