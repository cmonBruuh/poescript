IniRead, Start, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, Start
IniRead, Stop, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, Stop
IniRead, Currency, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, Currency
IniRead, Decks, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, Decks
IniRead, End, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, End

Gui, -MaximizeBox -MinimizeBox
Gui, Add, Text, x12 y19 w130 h30 , Start Flasks
Gui, Add, Text, x12 y59 w130 h30 , Stop Flasks
Gui, Add, Text, x12 y99 w130 h30 , Use Currency on inventory
Gui, Add, Text, x12 y139 w130 h30 , Open decks
Gui, Add, Text, x12 y179 w130 h30 , Spam Currency (linking)
Gui, Add, Text, x12 y219 w130 h30 , Abrubtly end any function
Gui, Add, Hotkey, x152 y19 w180 h30 vStart, %Start%
Gui, Add, Hotkey, x152 y59 w180 h30 vStop, %Stop%
Gui, Add, Hotkey, x152 y99 w180 h30 vCurrency, %Currency%
Gui, Add, Hotkey, x152 y139 w180 h30 vDecks, %Decks%
Gui, Add, Edit, x152 y179 w180 h30 -VScroll +ReadOnly vSpam, SHIFT+Pause/break
Gui, Add, Hotkey, x152 y219 w180 h30 vEnd, %End%
Gui, Add, Button, x12 y259 w130 h30 gSave, Save
Gui, Add, Button, x182 y259 w130 h30 gCancel, Cancel
Gui, Show, w346 h300, Hotkeys
return

GuiClose:
ExitApp

Save:
	Gui, Submit, NoHide
	GuiControlGet, Start
	GuiControlGet, Stop
	GuiControlGet, Currency
	GuiControlGet, Decks
	GuiControlGet, Spam
	start := Start
	stop := Stop
	currency := Currency
	decks := Decks
	spam := Spam
	IniWrite, %start%, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, Start
	IniWrite, %stop%, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, Stop
	IniWrite, %currency%, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, Currency
	IniWrite, %decks%, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, Decks
	IniWrite, %end%, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, End
	ExitApp

Cancel:
	ExitApp


