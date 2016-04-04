Goto FriendsAutoExec

AddFriend:
	InputBox, name, Add a friend, Enter the name:, no, , 120
	friendAdd(name)
return

friendAdd(name)
{
	if(name=="")
	{
		MsgBox,, Add a friend, The input was empty.
		return
	}
	
	onthelist := 0
	Loop % friendList.MaxIndex()
	{
		if(friendlist[A_Index]==name)
		{
			onthelist = 1
			break
		}
	}
	if(onthelist)
		MsgBox %name% is already on your list.
	else 
	{
		friendList.Insert(name)
		FileAppend, % name "`n", %A_ScriptDir%/Friends.txt
		MsgBox %name% was added to your friends list.
	}
}

:?:/fadd::
	addChatMessage("{bbbbbb}/fadd [ID/Name]")
	SendInput, /fadd{Space}
	Input, user, V I M, {Enter}
	SendInput ^a{del}{esc}
	if(user=="")
		addChatMessage("{FF0000}ERROR: The name is empty.")
	else
	{
		if user is integer
		{
			name := getPlayerNameById(user)
		}
		else
		{
			name := getPlayerNameById(getPlayerIdByName(user))
		}
		
		if(name=="" || getPlayerIdByName(name)==-1)
		{
			addChatMessage("{FF0000}ERROR: Player is not connected.")
		}
		else
		{
			onthelist := 0
			Loop % friendList.MaxIndex()
			{
				if(friendlist[A_Index]==name)
				{
					onthelist = 1
					break
				}
			}
			if(onthelist)
				addChatMessage("{FF0000}ERROR: " name " is already on your list.")
			else 
			{
				friendList.Insert(name)
				FileAppend, % name "`n", %A_ScriptDir%/Friends.txt
				addChatMessage("{009900} SUCCESS: " name " was added to your friends list.")
			}
		}
	}
return

:?:/fdel::
	addChatMessage("{bbbbbb}/fdel [ID/Name]")
	SendInput, /fdel{Space}
	Input, user, V I M, {Enter}
	SendInput ^a{del}{esc}
	if(user=="")
		addChatMessage("{FF0000}ERROR: The name is empty.")
	else
	{
		if user is integer
		{
			name := getPlayerNameById(user)
		}
		else
		{
			name := user
		}
		
		if(name=="" || getPlayerIdByName(name)==-1)
		{
			addChatMessage("{FF0000}ERROR: Player is not connected.")
		}
		else
		{
			onthelist := 0
			index := 0
			Loop % friendList.MaxIndex()
			{
				if(friendlist[A_Index]==name)
				{
					onthelist = 1
					index = %A_Index%
					break
				}
			}
			if(onthelist)
			{
				friendList.Remove(index)
				FileDelete, %A_ScriptDir%/Friends.txt
				Loop % friendList.MaxIndex()
					FileAppend, % friendList[A_Index] "`n", %A_ScriptDir%/Friends.txt
				addChatMessage("{009900}SUCCESS: " name " was deleted.")
			}
			else
				addChatMessage("{FF0000}ERROR: " name " is not on your list.")
		}
	}
return

~Numpad4::
	if(isInChat())
		return
	
	addChatMessage("{33aa33}|________________Online Friends________________|")
	Loop % friendList.MaxIndex()
	{
		id := getPlayerIdByName(friendList[A_Index])
		if(id==-1)
			continue
		; addChatMessage("{e2ffff}       • " friendList[A_Index] " (" id ")")
		sendChat("/id " id)
		; Sleep, 100
	}
return


FriendsAutoExec:
	Menu, tray, add, Add a friend by name, AddFriend

	Loop, Read, Friends.txt
	{
		friendList.Insert(A_LoopReadLine)
	}