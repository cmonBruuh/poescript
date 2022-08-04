#SingleInstance, Force

global toggle = false
global timer
global flaskTimer3
global savedFlaskTimer3

IniRead, Start, %A_ScriptDir%\Hotkeys.ini, Hotkeys, Start
IniRead, Stop, %A_ScriptDir%\Hotkeys.ini, Hotkeys, Stop

IniRead, savedFlaskTimer3, %A_ScriptDir%\Timers.ini, Timers, Flask3

Hotkey,~%Start%,StartHK
Hotkey,~%Stop%,StopHK

if (savedFlaskTimer3 = null) {
	Gui, -MaximizeBox -MinimizeBox
	Gui, Add, Edit, x0 y0 w70 h20 -VScroll -WantReturn Number Limit5 +Center vflaskTimer3,
	Gui, Add, Button, x69 y-1 w32 h22 gOK, OK
	Gui, Show, w100 h20, Flask 3
	return
} else {
	flaskTimer3 := savedFlaskTimer3
	timer := flaskTimer3
	if (timer < 1000) {
		MsgBox Timer must be between 1000 and 12000
		ExitApp
	}
	if (timer > 12000) {
		MsgBox Timer must be between 1000 and 12000
		ExitApp
	}
	msgbox, , , Flask 3 saved with %savedFlaskTimer3% MS, 1
	return
}

GuiClose:
ExitApp

OK:
	GuiControlGet, flaskTimer3
	timer := flaskTimer3
	if (timer < 1000) {
		MsgBox Timer must be between 1000 and 12000
		return
	}
	if (timer > 12000) {
		MsgBox Timer must be between 1000 and 12000
		return
	}
	WinHide, Flask 3

StartHK:
	toggle := true
	runTimer3()
	return

StopHK:
	toggle := false
	return

runTimer3() {
	if (WinActive("ahk_class POEWindowClass")) {
		while (toggle) {
			Send, 3
			Sleep, %timer%
		}
	}
}