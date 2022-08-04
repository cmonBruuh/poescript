#SingleInstance, Force

global toggle = false
global timer
global flaskTimer2
global savedFlaskTimer2

IniRead, Start, %A_ScriptDir%\Hotkeys.ini, Hotkeys, Start
IniRead, Stop, %A_ScriptDir%\Hotkeys.ini, Hotkeys, Stop

IniRead, savedFlaskTimer2, %A_ScriptDir%\Timers.ini, Timers, Flask2

Hotkey,~%Start%,StartHK
Hotkey,~%Stop%,StopHK

if (savedFlaskTimer2 = null) {
	Gui, -MaximizeBox -MinimizeBox
	Gui, Add, Edit, x0 y0 w70 h20 -VScroll -WantReturn Number Limit5 +Center vflaskTimer2,
	Gui, Add, Button, x69 y-1 w32 h22 gOK, OK
	Gui, Show, w100 h20, Flask 2
	return
} else {
	flaskTimer2 := savedFlaskTimer2
	timer := flaskTimer2
	if (timer < 1000) {
		MsgBox Timer must be between 1000 and 12000
		ExitApp
	}
	if (timer > 12000) {
		MsgBox Timer must be between 1000 and 12000
		ExitApp
	}
	msgbox, , , Flask 2 saved with %savedFlaskTimer2% MS, 1
	return
}

GuiClose:
ExitApp

OK:
	GuiControlGet, flaskTimer2
	timer := flaskTimer2
	if (timer < 1000) {
		MsgBox Timer must be between 1000 and 12000
		return
	}
	if (timer > 12000) {
		MsgBox Timer must be between 1000 and 12000
		return
	}
	WinHide, Flask 2

StartHK:
	toggle := true
	runTimer2()
	return

StopHK:
	toggle := false
	return

runTimer2() {
	if (WinActive("ahk_class POEWindowClass")) {
		while (toggle) {
			Send, 2
			Sleep, %timer%
		}
	}
}