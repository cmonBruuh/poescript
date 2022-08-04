#SingleInstance, Force

global toggle = false
global timer
global flaskTimer5
global savedFlaskTimer5

IniRead, Start, %A_ScriptDir%\Hotkeys.ini, Hotkeys, Start
IniRead, Stop, %A_ScriptDir%\Hotkeys.ini, Hotkeys, Stop

IniRead, savedFlaskTimer5, %A_ScriptDir%\Timers.ini, Timers, Flask5

Hotkey,~%Start%,StartHK
Hotkey,~%Stop%,StopHK

if (savedFlaskTimer5 = null) {
	Gui, -MaximizeBox -MinimizeBox
	Gui, Add, Edit, x0 y0 w70 h20 -VScroll -WantReturn Number Limit5 +Center vflaskTimer5,
	Gui, Add, Button, x69 y-1 w32 h22 gOK, OK
	Gui, Show, w100 h20, Flask 5
	return
} else {
	flaskTimer5 := savedFlaskTimer5
	timer := flaskTimer5
	if (timer < 1000) {
		MsgBox Timer must be between 1000 and 12000
		ExitApp
	}
	if (timer > 12000) {
		MsgBox Timer must be between 1000 and 12000
		ExitApp
	}
	msgbox, , , Flask 5 saved with %savedFlaskTimer5% MS, 1
	return
}

GuiClose:
ExitApp

OK:
	GuiControlGet, flaskTimer5
	timer := flaskTimer5
	if (timer < 1000) {
		MsgBox Timer must be between 1000 and 12000
		return
	}
	if (timer > 12000) {
		MsgBox Timer must be between 1000 and 12000
		return
	}
	WinHide, Flask 5

StartHK:
	toggle := true
	runTimer5()
	return

StopHK:
	toggle := false
	return

runTimer5() {
	if (WinActive("ahk_class POEWindowClass")) {
		while (toggle) {
			Send, 5
			Sleep, %timer%
		}
	}
}