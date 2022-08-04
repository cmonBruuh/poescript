#SingleInstance, Force

global toggle = false
global switch = false
global autoToggle = false
global deckCount
global coorCount
global timer
global flasks
global mapFound = false
global startingX
global startingY
global endingX
global endingY

IniRead, Start, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, Start
IniRead, Stop, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, Stop
IniRead, Currency, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, Currency
IniRead, Decks, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, Decks
;IniRead, Spam, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, Spam
IniRead, End, %A_ScriptDir%\timers\Hotkeys.ini, Hotkeys, End

IniRead, xCoor, %A_ScriptDir%\settings\window.ini, Coordinates, x
IniRead, yCoor, %A_ScriptDir%\settings\window.ini, Coordinates, y

IniRead, xStartCoor, %A_ScriptDir%\settings\coordinates.ini, Coordinates, xStart
IniRead, yStartCoor, %A_ScriptDir%\settings\coordinates.ini, Coordinates, yStart
IniRead, xEndCoor, %A_ScriptDir%\settings\coordinates.ini, Coordinates, xEnd
IniRead, yEndCoor, %A_ScriptDir%\settings\coordinates.ini, Coordinates, yEnd

Hotkey,%Start%,StartHK
Hotkey,%Stop%,StopHK
Hotkey,%Currency%,CurrencyHK
Hotkey,%Decks%,DecksHK
Hotkey,%End%,EndHK
Hotkey,+%End%,EndCurrHK

global xCoor := xCoor
global yCoor := yCoor

global xStartCoor := xStartCoor
global yStartCoor := yStartCoor
global xEndCoor := xEndCoor
global yEndCoor := yEndCoor

checkReso()

Gui,+AlwaysOnTop
Gui, -MaximizeBox -MinimizeBox
Gui, Add, Text, x1 y0 w52 h20 , Flasks
Gui, Add, Text, x1 y20 w52 h20 , Timer
Gui, Add, Text, x1 y40 w52 h20 , State
Gui, Add, Text, x1 y63 w52 h20 , Lvling
Gui, Add, Button, x60 y60 w52 h20 gHideout, Hideout
Gui, Add, Edit, x53 y0 w65 h20 -VScroll vFlasks,
Gui, Add, Edit, x53 y20 w65 h20 -VScroll vTimer,
Gui, Add, Edit, x53 y40 w65 h20 -VScroll +ReadOnly vLogs, Sleeping...
Gui, Add, CheckBox, x35 y61 w25 h20 vQuick,
Gui, Add, Button, x0 y80 w23 h22 gFlask1, 1
Gui, Add, Button, x24 y80 w23 h22 gFlask2, 2
Gui, Add, Button, x48 y80 w23 h22 gFlask3, 3
Gui, Add, Button, x72 y80 w23 h22 gFlask4, 4
Gui, Add, Button, x96 y80 w23 h22 gFlask5, 5
Gui, Add, Button, x0 y100 w23 h22 gSkillQ, Q
Gui, Add, Button, x24 y100 w23 h22 gSkillW, W
Gui, Add, Button, x48 y100 w23 h22 gSkillE, E
Gui, Add, Button, x72 y100 w23 h22 gSkillR, R
Gui, Add, Button, x96 y100 w23 h22 gSkillT, T

Gui, Add, Button, x0 y120 w46 h22 gSpam, Spam
Gui, Add, Button, x48 y120 w23 h22 vHK gHK, HK
Gui, Add, Button, x72 y120 w23 h22 gSkillSeq, SQ
Gui, Add, Button, x96 y120 w23 h22 vHelp gHelp, ?


Gui, Show,% "x" A_ScreenWidth - 140 " y" A_ScreenHeight - 212 " w" 120 " h" 143, Script V3.0
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
SkillSeq:
	Run %A_ScriptDir%\timers\Skill_sequence.ahk
	return

Hideout:
	if WinExist("ahk_class POEWindowClass") {
		WinActivate, Path of Exile
		Send {Enter}
		SendRaw /Hideout
		Send {Enter}
	} else {
		return
	}
	return

Help:
	if (switch = false) {
		switch := true
		ToolTip, %Start% = Start Flasks`n%Stop% = Stop Flasks`n%Currency% = Right click a currency and then press %Currency% to use that currency on all items inside inventory`n%Decks% = Open Stacked decks in first row`n%End% = Abrubtly ends function`nCtrl + Numpadx = Moves x column Inventory to stash`nCtrl + Numpad0 = Moves all Inventory to stash`nCtrl + Numpad+ = Moves all Inventory to stash VERY FAST (do not use for trades!!!), 0, 0
	} else {
		switch := false
		RemoveToolTip:
		ToolTip
		return
	}
	return

HK:
	Run %A_ScriptDir%\Hotkeys.ahk
	return

StartHK:
	Gui, Submit, NoHide
	toggle := true
	GuiControlGet, Timer
	timer := Timer
	GuiControlGet, Flasks
	flasks := flasks
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

StopHK:
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
^NumpadAdd::
	fastInventoryToStash()
	return

CurrencyHK:
	autoToggle := true
	useCurrencyOnInv()
	return

DecksHK:
	autoToggle := true
	stackedDeck()
	return

EndHK:
	autoToggle := false
	chanceCount := 0
	deckCount := 0
	coorCount := 0
	return

EndCurrHK:
	autoToggle := false
	chanceCount := 0
	deckCount := 0
	coorCount := 0
	Send, {Shift up}
	return

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

	stopFlasks() {
		toggle := false
		GuiControlGet, Logs
		GuiControl,, Logs, Sleeping...
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

	stackedDeck() {
		if (WinActive("ahk_class POEWindowClass")) {
			autoToggle := true
			cell := 0
			deckcount := 0
			Loop, 10 {
				If (autoToggle = true) {
				Loop, 5 {
					if(autoToggle = true) {
						localStartX := startingX
						localStartY := startingY
						localEndX := endingX
						localEndY := endingY
						localX := startingX
						localY := ((localEndY - localStartY) / 4) * cell + localStartY
						if (autoToggle = true) {
							MouseClick, right, %localX%, %localY%, 1, 2
							localX := localX - 100
							MouseClick, left, %localX%, %localY%, 1, 2
						}
							If (cell < 4) {
								cell := cell + 1
							} else {
								cell := 0
							}
						}
					}
				}
			}
		}
		return
	}

	wrongReso() {
		MsgBox, 0, Resolution not supported, Resolution %xCoor% x %yCoor% is not supported. Supported resolutions are:`n- 1920x1080`n- 1920x800`n`nIf you want me to add your resolution please contact me.`n`nYou can configure the resolution inside the window.ini file inside the timers folder.
		ExitApp
	}

	checkReso() {
		if(xCoor = null or yCoor = null) {
			wrongReso()
			ExitApp
		}	else if (xStartCoor <> null and yStartCoor <> null) {
			startingX := xStartCoor
			startingY := yStartCoor
			endingX := xEndCoor
			endingY := yEndCoor
			return
		} else if (xCoor = 1920 and yCoor = 1080) {
			startingX := 1298
			startingY := 613
			endingX := 1877
			endingY := 826
			return
		}	else if (xCoor = 1920 and yCoor = 800) {
			startingX := 1457
			startingY := 452
			endingX := 1886
			endingY := 610
			return
		} else {
			wrongReso()
		}
	}

	oneRow() {
		if (WinActive("ahk_class POEWindowClass")) {
				autoToggle := true
				row := 0
				Loop, 1 {
					if(autoToggle = true) {
						localStartX := startingX
						localStartY := startingY
						localEndX := endingX
						localEndY := endingY
						localX := ((localEndX - localStartX) / 11) * row + localStartX
						localY := startingY
					Loop, 5 {
						if (autoToggle = true) {
							MouseClick, left, %localX%, %localY%, 1, 2
							localY := (localEndY - localStartY) / 4 + localY
						}
					}
				row := row + 1
				}
			}
		}
	}

	twoRow() {
		if (WinActive("ahk_class POEWindowClass")) {
				autoToggle := true
				row := 0
				Loop, 2 {
					if(autoToggle = true) {
						localStartX := startingX
						localStartY := startingY
						localEndX := endingX
						localEndY := endingY
						localX := ((localEndX - localStartX) / 11) * row + localStartX
						localY := startingY
					Loop, 5 {
						if (autoToggle = true) {
							MouseClick, left, %localX%, %localY%, 1, 2
							localY := (localEndY - localStartY) / 4 + localY
						}
					}
				row := row + 1
				}
			}
		}
	}

	threeRow() {
		if (WinActive("ahk_class POEWindowClass")) {
				autoToggle := true
				row := 0
				Loop, 3 {
					if(autoToggle = true) {
						localStartX := startingX
						localStartY := startingY
						localEndX := endingX
						localEndY := endingY
						localX := ((localEndX - localStartX) / 11) * row + localStartX
						localY := startingY
					Loop, 5 {
						if (autoToggle = true) {
							MouseClick, left, %localX%, %localY%, 1, 2
							localY := (localEndY - localStartY) / 4 + localY
						}
					}
				row := row + 1
				}
			}
		}
	}

	fourRow() {
		if (WinActive("ahk_class POEWindowClass")) {
				autoToggle := true
				row := 0
				Loop, 4 {
					if(autoToggle = true) {
						localStartX := startingX
						localStartY := startingY
						localEndX := endingX
						localEndY := endingY
						localX := ((localEndX - localStartX) / 11) * row + localStartX
						localY := startingY
					Loop, 5 {
						if (autoToggle = true) {
							MouseClick, left, %localX%, %localY%, 1, 2
							localY := (localEndY - localStartY) / 4 + localY
						}
					}
				row := row + 1
				}
			}
		}
	}

	fiveRow() {
		if (WinActive("ahk_class POEWindowClass")) {
				autoToggle := true
				row := 0
				Loop, 5 {
					if(autoToggle = true) {
						localStartX := startingX
						localStartY := startingY
						localEndX := endingX
						localEndY := endingY
						localX := ((localEndX - localStartX) / 11) * row + localStartX
						localY := startingY
					Loop, 5 {
						if (autoToggle = true) {
							MouseClick, left, %localX%, %localY%, 1, 2
							localY := (localEndY - localStartY) / 4 + localY
						}
					}
				row := row + 1
				}
			}
		}
	}

	sixRow() {
		if (WinActive("ahk_class POEWindowClass")) {
				autoToggle := true
				row := 0
				Loop, 6 {
					if(autoToggle = true) {
						localStartX := startingX
						localStartY := startingY
						localEndX := endingX
						localEndY := endingY
						localX := ((localEndX - localStartX) / 11) * row + localStartX
						localY := startingY
					Loop, 5 {
						if (autoToggle = true) {
							MouseClick, left, %localX%, %localY%, 1, 2
							localY := (localEndY - localStartY) / 4 + localY
						}
					}
				row := row + 1
				}
			}
		}
	}

	sevenRow() {
		if (WinActive("ahk_class POEWindowClass")) {
				autoToggle := true
				row := 0
				Loop, 7 {
					if(autoToggle = true) {
						localStartX := startingX
						localStartY := startingY
						localEndX := endingX
						localEndY := endingY
						localX := ((localEndX - localStartX) / 11) * row + localStartX
						localY := startingY
					Loop, 5 {
						if (autoToggle = true) {
							MouseClick, left, %localX%, %localY%, 1, 2
							localY := (localEndY - localStartY) / 4 + localY
						}
					}
				row := row + 1
				}
			}
		}
	}

	eightRow() {
		if (WinActive("ahk_class POEWindowClass")) {
				autoToggle := true
				row := 0
				Loop, 8 {
					if(autoToggle = true) {
						localStartX := startingX
						localStartY := startingY
						localEndX := endingX
						localEndY := endingY
						localX := ((localEndX - localStartX) / 11) * row + localStartX
						localY := startingY
					Loop, 5 {
						if (autoToggle = true) {
							MouseClick, left, %localX%, %localY%, 1, 2
							localY := (localEndY - localStartY) / 4 + localY
						}
					}
				row := row + 1
				}
			}
		}
	}

	nineRow() {
		if (WinActive("ahk_class POEWindowClass")) {
				autoToggle := true
				row := 0
				Loop, 9 {
					if(autoToggle = true) {
						localStartX := startingX
						localStartY := startingY
						localEndX := endingX
						localEndY := endingY
						localX := ((localEndX - localStartX) / 11) * row + localStartX
						localY := startingY
					Loop, 5 {
						if (autoToggle = true) {
							MouseClick, left, %localX%, %localY%, 1, 2
							localY := (localEndY - localStartY) / 4 + localY
						}
					}
				row := row + 1
				}
			}
		}
	}

	twelveRow() {
		if (WinActive("ahk_class POEWindowClass")) {
				autoToggle := true
				row := 0
				Loop, 12 {
					if(autoToggle = true) {
						localStartX := startingX
						localStartY := startingY
						localEndX := endingX
						localEndY := endingY
						localX := ((localEndX - localStartX) / 11) * row + localStartX
						localY := startingY
					Loop, 5 {
						if (autoToggle = true) {
							MouseClick, left, %localX%, %localY%, 1, 2
							localY := (localEndY - localStartY) / 4 + localY
						}
					}
				row := row + 1
				} else {
					return
				}
			}
		}
	}

	fastInventoryToStash() {
		if (WinActive("ahk_class POEWindowClass")) {
				autoToggle := true
				row := 0
				Loop, 12 {
					if(autoToggle = true) {
						localStartX := startingX
						localStartY := startingY
						localEndX := endingX
						localEndY := endingY
						localX := ((localEndX - localStartX) / 11) * row + localStartX
						localY := startingY
					Loop, 5 {
						if (autoToggle = true) {
							MouseClick, left, %localX%, %localY%, 1, 0
							localY := (localEndY - localStartY) / 4 + localY
						}
					}
				row := row + 1
				}
			}
		}
	}

	useCurrencyOnInv() {
		if (WinActive("ahk_class POEWindowClass")) {
				autoToggle := true
				row := 0
				Send, {Shift down}
				Loop, 12 {
					if(autoToggle = true) {
						localStartX := startingX
						localStartY := startingY
						localEndX := endingX
						localEndY := endingY
						localX := ((localEndX - localStartX) / 11) * row + localStartX
						localY := startingY
					Loop, 5 {
						if (autoToggle = true) {
							MouseClick, left, %localX%, %localY%, 1, 2
							localY := (localEndY - localStartY) / 4 + localY
						}
					}
				row := row + 1
				}
			}
		}
	}