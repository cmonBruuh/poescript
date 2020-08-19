#SingleInstance, Force

global toggle = false
global switch = false
global timer
global flasks
global mapFound = false

Gui,+AlwaysOnTop
Gui, -MaximizeBox -MinimizeBox
Gui, Add, Text, x1 y0 w52 h20 , Flasks
Gui, Add, Text, x1 y20 w52 h20 , Timer
Gui, Add, Text, x1 y40 w52 h20 , State
Gui, Add, Text, x1 y60 w52 h20 , Lvling
Gui, Add, Edit, x53 y0 w69 h20 -VScroll vFlasks,
Gui, Add, Edit, x53 y20 w69 h20 -VScroll vTimer,
Gui, Add, Edit, x53 y40 w69 h20 -VScroll +ReadOnly vLogs, Sleeping...
Gui, Add, CheckBox, x30 y58 w25 h20 vQuick,
Gui, Add, Button, x62 y60 w40 h22 gSpam, Spam
Gui, Add, Button, x0 y80 w23 h22 gFlask1, 1
Gui, Add, Button, x20 y80 w23 h22 gFlask2, 2
Gui, Add, Button, x40 y80 w23 h22 gFlask3, 3
Gui, Add, Button, x60 y80 w23 h22 gFlask4, 4
Gui, Add, Button, x80 y80 w23 h22 gFlask5, 5
Gui, Add, Button, x0 y100 w23 h22 gSkillQ, Q
Gui, Add, Button, x20 y100 w23 h22 gSkillW, W
Gui, Add, Button, x40 y100 w23 h22 gSkillE, E
Gui, Add, Button, x60 y100 w23 h22 gSkillR, R
Gui, Add, Button, x80 y100 w23 h22 gSkillT, T
Gui, Add, Button, x100 y60 w23 h22 gKill, X
Gui, Add, Button, x100 y80 w23 h22 vHelp gHelp, ?
Gui, Show,% "x" A_ScreenWidth - 140 " y" A_ScreenHeight - 170 " w" 126 " h" 120, Script V2.1
Gui, Color, 
return

GuiClose:
ExitApp

Flask1:
	Run %A_ScriptDir%\timers\Flask_1.ahk
	return
Flask2:
	Run %A_ScriptDir%\timers\Flask_2.ahk
	return
Flask3:
	Run %A_ScriptDir%\timers\Flask_3.ahk
	return
Flask4:
	Run %A_ScriptDir%\timers\Flask_4.ahk
	return
Flask5:
	Run %A_ScriptDir%\timers\Flask_5.ahk
	return
SkillQ:
	Run %A_ScriptDir%\timers\Skill_Q.ahk
	return
SkillW:
	Run %A_ScriptDir%\timers\Skill_W.ahk
	return
SkillE:
	Run %A_ScriptDir%\timers\Skill_E.ahk
	return
SkillR:
	Run %A_ScriptDir%\timers\Skill_R.ahk
	return
SkillT:
	Run %A_ScriptDir%\timers\Skill_T.ahk
	return
Spam:
	Run %A_ScriptDir%\timers\Spam_C.ahk
	return

Help:
	if (switch = false) {
		switch := true
		ToolTip, F2 = Start Flasks`nF3 = Stop Flasks`nF6 = Get Maps out of Map Stash`nF7 = Right click a currency and then press F7 to use that currency on all items inside inventory`nF10 = Move Maps in Inventory to Right`nCtrl + Numpadx = Moves x column Inventory to stash`nCtrl + Numpad0 = Moves all Inventory to stash`n, 100, 150
	} else {
		switch := false
		RemoveToolTip:
		ToolTip
		return
	}
	return

Kill:
	MsgBox,4,, Are you sure to kill all existing flask and skill scripts?
	If MsgBox Yes
		Process, Close, Flask_1.ahk
		Process, Close, Flask_2.ahk
		Process, Close, Flask_3.ahk
		Process, Close, Flask_4.ahk
		Process, Close, Flask_5.ahk
		Process, Close, Skill_Q.ahk
		Process, Close, Skill_W.ahk
		Process, Close, Skill_E.ahk
		Process, Close, Skill_R.ahk
		Process, Close, Skill_T.ahk
	return

$F10::
	moveMapsRight()
	return

$F2::
	Gui, Submit, NoHide
	toggle := true
	GuiControlGet, Timer
	timer := Timer
	GuiControlGet, Flasks
	flasks := flasks
	if (timer = null) and (flasks = null) {
		GuiControlGet, Timer
		GuiControl,,Timer,Blocked
		GuiControl,+ReadOnly,Timer
		GuiControlGet, Flasks
		GuiControl,,Flasks,Blocked
		GuiControl,+ReadOnly,Flasks
	}
	if (WinActive("ahk_class POEWindowClass")) {
		if (quick = false) {
			GuiControlGet, Logs
			GuiControl,, Logs, Running...
			runFlasks()
		} else if (quick = true) {
			GuiControlGet, Logs
			GuiControl,, Logs, Running...
			runQuick()
		} else {
			MsgBox,,Error,Lvling Option Bug
		}
	}
	return
	
$F3::
	stopFlasks()
	return

^Numpad1::
	oneRow()
	return
^Numpad2::
	twoRow()
	return
^Numpad3::
	threeRow()
	return
^Numpad4::
	fourRow()
	return
^Numpad5::
	fiveRow()
	return
^Numpad6::
	sixRow()
	return
^Numpad7::
	sevenRow()
	return
^Numpad8::
	eightRow()
	return
^Numpad9::
	nineRow()
	return
^Numpad0::
	twelveRow()
	return
	
$F6::
	getMaps()
	return
	
$F7::
	/* NEW VERSION WITH ALL CURRENCY POSSIBLE 
	*/
	Send, {Shift down}
	twelveRow()
	Send, {Shift up}
	/* OLD VERSION WITH ALCH
	MouseClick, right, 491, 339, 1, 2
	Send, {Shift down}
	twelveRow()
	Send, {Shift up}
	return
	*/
	
	runFlasks() {
		if (WinActive("ahk_class POEWindowClass")) {
		if (flasks = 1) {
			while (toggle) {
				Send, 1
				Sleep, %timer%
			}
		} else if (flasks = 12) {
			while (toggle) {
				Send, 1
				Send, 2
				Sleep, %timer%
			}
		} else if (flasks = 123) {
			while (toggle) {
				Send, 1
				Send, 2
				Send, 3
				Sleep, %timer%
			}
		} else if (flasks = 1234) {
			while (toggle) {
				Send, 1
				Send, 2
				Send, 3
				Send, 4
				Sleep, %timer%
			}
		} else if (flasks = 12345) {
			while (toggle) {
				Send, 1
				Send, 2
				Send, 3
				Send, 4
				Send, 5
				Sleep, %timer%
			}
		} else if (flasks = 2) {
			while (toggle) {
				Send, 2
				Sleep, %timer%
			}
		} else if (flasks = 23) {
			while (toggle) {
				Send, 2
				Send, 3
				Sleep, %timer%
			}
		} else if (flasks = 234) {
			while (toggle) {
				Send, 2
				Send, 3
				Send, 4
				Sleep, %timer%
			}
		} else if (flasks = 2345) {
			while (toggle) {
				Send, 2
				Send, 3
				Send, 4
				Send, 5
				Sleep, %timer%
			}
		} else if (flasks = 3) {
			while (toggle) {
				Send, 3
				Sleep, %timer%
			}
		} else if (flasks = 34) {
			while (toggle) {
				Send, 3
				Send, 4
				Sleep, %timer%
			}
		} else if (flasks = 345) {
			while (toggle) {
				Send, 3
				Send, 4
				Send, 5
				Sleep, %timer%
			}
		} else if (flasks = 4) {
			while (toggle) {
				Send, 4
				Sleep, %timer%
			}
		} else if (flasks = 45) {
			while (toggle) {
				Send, 4
				Send, 5
				Sleep, %timer%
			}
		} else if (flasks = 5) {
			while (toggle) {
				Send, 5
				Sleep, %timer%
			}
		}
	}
	}
	
	runQuick() {
		if (WinActive("ahk_class POEWindowClass")) {
			if (flasks = 45) {
				while (toggle) {
					Send, 4
					Sleep, %timer%
					Send, 5
					Sleep, %timer%
				}
			} else if (flasks = 345) {
				while (toggle) {
					Send, 3
					Sleep, %timer%
					Send, 4
					Sleep, %timer%
					Send, 5
					Sleep, %timer%
				}
			} else {
				MsgBox,,Error, Wrong Flasks Input`nLvling only works with 345 or 45
				return
			}
		}
	}
	
	stopFlasks() {
		toggle := false
		GuiControlGet, Logs
		GuiControl,, Logs, Sleeping...
		if (Timer = Blocked) {
		GuiControlGet, Timer
		GuiControl,,Timer,
		GuiControl,-ReadOnly,Timer
		}
		if (Flasks = Blocked) {
		GuiControlGet, Flasks
		GuiControl,,Flasks,
		GuiControl,-ReadOnly,Flasks
		}
	}
	
	oneRow() {
		if (WinActive("ahk_class POEWindowClass")) {
			MouseClick, left, 1298, 613, 1, 2
			MouseClick, left, 1298, 667, 1, 2
			MouseClick, left, 1298, 721, 1, 2
			MouseClick, left, 1298, 772, 1, 2
			MouseClick, left, 1298, 826, 1, 2
		}
	}
	
	twoRow() {
		if (WinActive("ahk_class POEWindowClass")) {
			oneRow()
			MouseClick, left, 1350, 613, 1, 2
			MouseClick, left, 1350, 667, 1, 2
			MouseClick, left, 1350, 721, 1, 2
			MouseClick, left, 1350, 772, 1, 2
			MouseClick, left, 1350, 826, 1, 2
		}
	}
	
	threeRow() {
		if (WinActive("ahk_class POEWindowClass")) {
			twoRow()
			MouseClick, left, 1403, 613, 1, 2
			MouseClick, left, 1403, 667, 1, 2
			MouseClick, left, 1403, 721, 1, 2
			MouseClick, left, 1403, 772, 1, 2
			MouseClick, left, 1403, 826, 1, 2
		}
	}
	
	fourRow() {
		if (WinActive("ahk_class POEWindowClass")) {
			threeRow()
			MouseClick, left, 1454, 613, 1, 2
			MouseClick, left, 1454, 667, 1, 2
			MouseClick, left, 1454, 721, 1, 2
			MouseClick, left, 1454, 772, 1, 2
			MouseClick, left, 1454, 826, 1, 2
		}
	}

	fiveRow() {
		if (WinActive("ahk_class POEWindowClass")) {
			fourRow()
			MouseClick, left, 1509, 613, 1, 2
			MouseClick, left, 1509, 667, 1, 2
			MouseClick, left, 1509, 721, 1, 2
			MouseClick, left, 1509, 772, 1, 2
			MouseClick, left, 1509, 826, 1, 2
		}
	}
	
	sixRow() {
		if (WinActive("ahk_class POEWindowClass")) {
			fiveRow()
			MouseClick, left, 1561, 613, 1, 2
			MouseClick, left, 1561, 667, 1, 2
			MouseClick, left, 1561, 721, 1, 2
			MouseClick, left, 1561, 772, 1, 2
			MouseClick, left, 1561, 826, 1, 2
		}
	}
	
	sevenRow() {
		if (WinActive("ahk_class POEWindowClass")) {
			sixRow()
			MouseClick, left, 1612, 613, 1, 2
			MouseClick, left, 1612, 667, 1, 2
			MouseClick, left, 1612, 721, 1, 2
			MouseClick, left, 1612, 772, 1, 2
			MouseClick, left, 1612, 826, 1, 2
		}
	}
	
	eightRow() {
		if (WinActive("ahk_class POEWindowClass")) {
			sevenRow()
			MouseClick, left, 1666, 613, 1, 2
			MouseClick, left, 1666, 667, 1, 2
			MouseClick, left, 1666, 721, 1, 2
			MouseClick, left, 1666, 772, 1, 2
			MouseClick, left, 1666, 826, 1, 2
		}
	}
	
	nineRow() {
		if (WinActive("ahk_class POEWindowClass")) {
			eightRow()
			MouseClick, left, 1718, 613, 1, 2
			MouseClick, left, 1718, 667, 1, 2
			MouseClick, left, 1718, 721, 1, 2
			MouseClick, left, 1718, 772, 1, 2
			MouseClick, left, 1718, 826, 1, 2
		}
	}
	
	twelveRow() {
		if (WinActive("ahk_class POEWindowClass")) {
			nineRow()
			;Ten
			MouseClick, left, 1771, 613, 1, 2
			MouseClick, left, 1771, 667, 1, 2
			MouseClick, left, 1771, 721, 1, 2
			MouseClick, left, 1771, 772, 1, 2
			MouseClick, left, 1771, 826, 1, 2
			;Eleven
			MouseClick, left, 1823, 613, 1, 2
			MouseClick, left, 1823, 667, 1, 2
			MouseClick, left, 1823, 721, 1, 2
			MouseClick, left, 1823, 772, 1, 2
			MouseClick, left, 1823, 826, 1, 2
			;Twelve
			MouseClick, left, 1877, 613, 1, 2
			MouseClick, left, 1877, 667, 1, 2
			MouseClick, left, 1877, 721, 1, 2
			MouseClick, left, 1877, 772, 1, 2
			MouseClick, left, 1877, 826, 1, 2
		}
	}
	
	getMaps() {
		if (WinActive("ahk_class POEWindowClass")) {
				Send, {Control down}
	;Erste Spalte
	MouseClick, left, 66, 507, 1, 2
	MouseClick, left, 66, 557, 1, 2
	MouseClick, left, 66, 607, 1, 2
	MouseClick, left, 66, 657, 1, 2
	MouseClick, left, 66, 707, 1, 2
	MouseClick, left, 66, 757, 1, 2
	
	MouseClick, left, 116, 507, 1, 2
	MouseClick, left, 116, 557, 1, 2
	MouseClick, left, 116, 607, 1, 2
	MouseClick, left, 116, 657, 1, 2
	MouseClick, left, 116, 707, 1, 2
	MouseClick, left, 116, 757, 1, 2
	
	MouseClick, left, 167, 507, 1, 2
	MouseClick, left, 167, 557, 1, 2
	MouseClick, left, 167, 607, 1, 2
	MouseClick, left, 167, 657, 1, 2
	MouseClick, left, 167, 707, 1, 2
	MouseClick, left, 167, 757, 1, 2
	
	MouseClick, left, 211, 507, 1, 2
	MouseClick, left, 211, 557, 1, 2
	MouseClick, left, 211, 607, 1, 2
	MouseClick, left, 211, 657, 1, 2
	MouseClick, left, 211, 707, 1, 2
	MouseClick, left, 211, 757, 1, 2
	
	MouseClick, left, 260, 507, 1, 2
	MouseClick, left, 260, 557, 1, 2
	MouseClick, left, 260, 607, 1, 2
	MouseClick, left, 260, 657, 1, 2
	MouseClick, left, 260, 707, 1, 2
	MouseClick, left, 260, 757, 1, 2
	
	MouseClick, left, 307, 507, 1, 2
	MouseClick, left, 307, 557, 1, 2
	MouseClick, left, 307, 607, 1, 2
	MouseClick, left, 307, 657, 1, 2
	MouseClick, left, 307, 707, 1, 2
	MouseClick, left, 307, 757, 1, 2
	
	MouseClick, left, 355, 507, 1, 2
	MouseClick, left, 355, 557, 1, 2
	MouseClick, left, 355, 607, 1, 2
	MouseClick, left, 355, 657, 1, 2
	MouseClick, left, 355, 707, 1, 2
	MouseClick, left, 355, 757, 1, 2
	
	MouseClick, left, 402, 507, 1, 2
	MouseClick, left, 402, 557, 1, 2
	MouseClick, left, 402, 607, 1, 2
	MouseClick, left, 402, 657, 1, 2
	MouseClick, left, 402, 707, 1, 2
	MouseClick, left, 402, 757, 1, 2
	
	MouseClick, left, 449, 507, 1, 2
	MouseClick, left, 449, 557, 1, 2
	MouseClick, left, 449, 607, 1, 2
	MouseClick, left, 449, 657, 1, 2
	MouseClick, left, 449, 707, 1, 2
	MouseClick, left, 449, 757, 1, 2
	
	MouseClick, left, 496, 507, 1, 2
	MouseClick, left, 496, 557, 1, 2
	MouseClick, left, 496, 607, 1, 2
	MouseClick, left, 496, 657, 1, 2
	MouseClick, left, 496, 707, 1, 2
	MouseClick, left, 496, 757, 1, 2
	Send, {Control up}
		}
	}
	
	moveMapsRight() {
		if (WinActive("ahk_class POEWindowClass")) {
			;erste 5 Maps
			MouseClick, left, 1298, 613, 1, 2
			MouseClick, left, 1875, 613, 1, 2
			MouseClick, left, 1298, 667, 1, 2
			MouseClick, left, 1875, 667, 1, 2
			MouseClick, left, 1298, 721, 1, 2
			MouseClick, left, 1875, 721, 1, 2
			MouseClick, left, 1298, 772, 1, 2
			MouseClick, left, 1875, 772, 1, 2
			MouseClick, left, 1298, 826, 1, 2
			MouseClick, left, 1875, 826, 1, 2
			;zweite 5 Maps
			MouseClick, left, 1349, 613, 1, 2
			MouseClick, left, 1824, 613, 1, 2
			MouseClick, left, 1349, 667, 1, 2
			MouseClick, left, 1824, 667, 1, 2
			MouseClick, left, 1349, 721, 1, 2
			MouseClick, left, 1824, 721, 1, 2
			MouseClick, left, 1349, 772, 1, 2
			MouseClick, left, 1824, 772, 1, 2
			MouseClick, left, 1349, 826, 1, 2
			MouseClick, left, 1824, 826, 1, 2
			;dritte 5 Maps
			MouseClick, left, 1400, 613, 1, 2
			MouseClick, left, 1773, 613, 1, 2
			MouseClick, left, 1400, 667, 1, 2
			MouseClick, left, 1773, 667, 1, 2
			MouseClick, left, 1400, 721, 1, 2
			MouseClick, left, 1773, 721, 1, 2
			MouseClick, left, 1400, 772, 1, 2
			MouseClick, left, 1773, 772, 1, 2
			MouseClick, left, 1400, 826, 1, 2
			MouseClick, left, 1773, 826, 1, 2
			;vierte 5 Maps
			MouseClick, left, 1451, 613, 1, 2
			MouseClick, left, 1722, 613, 1, 2
			MouseClick, left, 1451, 667, 1, 2
			MouseClick, left, 1722, 667, 1, 2
			MouseClick, left, 1451, 721, 1, 2
			MouseClick, left, 1722, 721, 1, 2
			MouseClick, left, 1451, 772, 1, 2
			MouseClick, left, 1722, 772, 1, 2
			MouseClick, left, 1451, 826, 1, 2
			MouseClick, left, 1722, 826, 1, 2
			;fünfte 5 Maps
			MouseClick, left, 1502, 613, 1, 2
			MouseClick, left, 1671, 613, 1, 2
			MouseClick, left, 1502, 667, 1, 2
			MouseClick, left, 1671, 667, 1, 2
			MouseClick, left, 1502, 721, 1, 2
			MouseClick, left, 1671, 721, 1, 2
			MouseClick, left, 1502, 772, 1, 2
			MouseClick, left, 1671, 772, 1, 2
			MouseClick, left, 1502, 826, 1, 2
			MouseClick, left, 1671, 826, 1, 2
		}
	}