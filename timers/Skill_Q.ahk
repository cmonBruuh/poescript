#SingleInstance, Force

global toggle = false
global timer
global skillTimerQ
global savedSkillTimerQ

IniRead, Start, %A_ScriptDir%\Hotkeys.ini, Hotkeys, Start
IniRead, Stop, %A_ScriptDir%\Hotkeys.ini, Hotkeys, Stop

IniRead, savedSkillTimerQ, %A_ScriptDir%\Timers.ini, Timers, SkillQ

Hotkey,~%Start%,StartHK
Hotkey,~%Stop%,StopHK

if (savedSkillTimerQ = null) {
	Gui, -MaximizeBox -MinimizeBox
	Gui, Add, Edit, x0 y0 w70 h20 -VScroll -WantReturn Number Limit5 +Center vskillTimerQ,
	Gui, Add, Button, x69 y-1 w32 h22 gOK, OK
	Gui, Show, w100 h20, Skill Q
	return
} else {
	skillTimerQ := savedSkillTimerQ
	timer := skillTimerQ
	if (timer < 1000) {
		MsgBox Timer must be between 1000 and 12000
		ExitApp
	}
	if (timer > 12000) {
		MsgBox Timer must be between 1000 and 12000
		ExitApp
	}
	msgbox, , , Skill Q saved with %savedSkillTimerQ% MS, 1
	return
}

GuiClose:
ExitApp

OK:
	GuiControlGet, skillTimerQ
	timer := skillTimerQ
	if (timer < 1000) {
		MsgBox Timer must be between 1000 and 30000
		return
	}
	if (timer > 30000) {
		MsgBox Timer must be between 1000 and 30000
		return
	}
	WinHide, Skill Q

StartHK:
	toggle := true
	runTimerQ()
	return

StopHK:
	toggle := false
	return

runTimerQ() {
	if (WinActive("ahk_class POEWindowClass")) {
		while (toggle) {
			Send, Q
			Sleep, %timer%
		}
	}
}