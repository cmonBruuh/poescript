#SingleInstance, Force

global toggle = false
global timer
global skillTimerW
global savedSkillTimerW

IniRead, Start, %A_ScriptDir%\Hotkeys.ini, Hotkeys, Start
IniRead, Stop, %A_ScriptDir%\Hotkeys.ini, Hotkeys, Stop

IniRead, savedSkillTimerW, %A_ScriptDir%\Timers.ini, Timers, SkillW

Hotkey,~%Start%,StartHK
Hotkey,~%Stop%,StopHK

if (savedSkillTimerW = null) {
	Gui, -MaximizeBox -MinimizeBox
	Gui, Add, Edit, x0 y0 w70 h20 -VScroll -WantReturn Number Limit5 +Center vskillTimerW,
	Gui, Add, Button, x69 y-1 w32 h22 gOK, OK
	Gui, Show, w100 h20, Skill W
	return
} else {
	skillTimerW := savedSkillTimerW
	timer := skillTimerW
	if (timer < 1000) {
		MsgBox Timer must be between 1000 and 12000
		ExitApp
	}
	if (timer > 12000) {
		MsgBox Timer must be between 1000 and 12000
		ExitApp
	}
	msgbox, , , Skill W saved with %savedSkillTimerW% MS, 1
	return
}

GuiClose:
ExitApp

OK:
	GuiControlGet, skillTimerW
	timer := skillTimerW
	if (timer < 1000) {
		MsgBox Timer must be between 1000 and 30000
		return
	}
	if (timer > 30000) {
		MsgBox Timer must be between 1000 and 30000
		return
	}
	WinHide, Skill W

StartHK:
	toggle := true
	runTimerW()
	return

StopHK:
	toggle := false
	return

runTimerW() {
	if (WinActive("ahk_class POEWindowClass")) {
		while (toggle) {
			Send, W
			Sleep, %timer%
		}
	}
}