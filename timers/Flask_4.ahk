#SingleInstance, Force

global toggle = false
global timer
global flaskTimer4
global savedFlaskTimer4

IniRead, Start, %A_ScriptDir%\Hotkeys.ini, Hotkeys, Start
IniRead, Stop, %A_ScriptDir%\Hotkeys.ini, Hotkeys, Stop

IniRead, savedFlaskTimer4, %A_ScriptDir%\Timers.ini, Timers, Flask4

Hotkey,~%Start%,StartHK
Hotkey,~%Stop%,StopHK

if (savedFlaskTimer4 = null) {
	Gui, -MaximizeBox -MinimizeBox
	Gui, Add, Edit, x0 y0 w70 h20 -VScroll -WantReturn Number Limit5 +Center vflaskTimer4,
	Gui, Add, Button, x69 y-1 w32 h22 gOK, OK
	Gui, Show, w100 h20, Flask 4
	return
} else {
	flaskTimer4 := savedFlaskTimer4
	timer := flaskTimer4
	if (timer < 1000) {
		MsgBox Timer must be between 1000 and 12000
		ExitApp
	}
	if (timer > 12000) {
		MsgBox Timer must be between 1000 and 12000
		ExitApp
	}
	msgbox, , , Flask 4 saved with %savedFlaskTimer4% MS, 1
	return
}

GuiClose:
ExitApp

OK:
	GuiControlGet, flaskTimer4
	timer := flaskTimer4
	if (timer < 1000) {
		MsgBox Timer must be between 1000 and 12000
		return
	}
	if (timer > 12000) {
		MsgBox Timer must be between 1000 and 12000
		return
	}
	WinHide, Flask 4

StartHK:
	toggle := true
	runTimer4()
	return

StopHK:
	toggle := false
	return

runTimer4() {
	if (WinActive("ahk_class POEWindowClass")) {
		while (toggle) {
			Send, 4
			Sleep, %timer%
		}
	}
}