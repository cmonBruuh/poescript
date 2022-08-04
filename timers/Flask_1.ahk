#SingleInstance, Force

global toggle = false
global timer
global flaskTimer1
global savedFlaskTimer1

IniRead, Start, %A_ScriptDir%\Hotkeys.ini, Hotkeys, Start
IniRead, Stop, %A_ScriptDir%\Hotkeys.ini, Hotkeys, Stop

IniRead, savedFlaskTimer1, %A_ScriptDir%\Timers.ini, Timers, Flask1

Hotkey,~%Start%,StartHK
Hotkey,~%Stop%,StopHK

if (savedFlaskTimer1 = null) {
	Gui, -MaximizeBox -MinimizeBox
	Gui, Add, Edit, x0 y0 w70 h20 -VScroll -WantReturn Number Limit5 +Center vflaskTimer1,
	Gui, Add, Button, x69 y-1 w32 h22 gOK, OK
	Gui, Show, w100 h20, Flask 1
	return
} else {
	flaskTimer1 := savedFlaskTimer1
	timer := flaskTimer1
	if (timer < 1000) {
		MsgBox Timer must be between 1000 and 12000
		ExitApp
	}
	if (timer > 12000) {
		MsgBox Timer must be between 1000 and 12000
		ExitApp
	}
	msgbox, , , Flask 1 saved with %savedFlaskTimer1% MS, 1
	return
}

GuiClose:
ExitApp

OK:
	GuiControlGet, flaskTimer1
	timer := flaskTimer1
	if (timer < 1000) {
		MsgBox Timer must be between 1000 and 12000
		return
	}
	if (timer > 12000) {
		MsgBox Timer must be between 1000 and 12000
		return
	}
	WinHide, Flask 1

StartHK:
	toggle := true
	runTimer1()
	return

StopHK:
	toggle := false
	return

runTimer1() {
	if (WinActive("ahk_class POEWindowClass")) {
		while (toggle) {
			Send, 1
			Sleep, %timer%
		}
	}
}