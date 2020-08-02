#SingleInstance, Force
Gui, -MaximizeBox -MinimizeBox

global toggle = false
global timer

Gui, Add, Edit, x0 y0 w70 h20 -VScroll -WantReturn Number Limit5 +Center vflaskTimer4,
Gui, Add, Button, x69 y-1 w32 h22 gOK, OK
Gui, Show, w100 h20, Flask 4
return

GuiClose:
ExitApp

OK:
	GuiControlGet, flaskTimer4
	timer := flaskTimer4
	if (timer < 1000) {
		MsgBox Timer must be between 1000 and 10000
		return
	}
	if (timer > 12000) {
		MsgBox Timer must be between 1000 and 12000
		return
	}
	WinHide, Flask 4

~$F2::
	toggle := true
	runTimer4()
	return

~$F3::
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