#SingleInstance, Force
Gui, -MaximizeBox -MinimizeBox

global toggle = false
global randomizer
global counter

Gui,+AlwaysOnTop
Gui, Add, Edit, x0 y0 w70 h20 -VScroll -WantReturn Number Limit3 +Center vCounter,
Gui, Add, Text,, You're about to set a number which `ndefines how many times a currency should `nbe applied to a item. Read the tutorial if `nyou don't know how this works.`nCancel to close this window.
Gui, Add, Button, x70 y-1 w40 h22 gCancel, Cancel
Gui, Add, CheckBox, x120 y-1 w80 h22 vRandomizer, Random
Gui, Show, w200 h100, Spam Currency
return

GuiClose:
ExitApp

+Pause::
	if (toggle) {
		toggle := false
		return
	} else {
		toggle := true
	}
	GuiControlGet, Counter
	GuiControlGet, Randomizer
	randomizer := Randomizer
	counter := Counter
	if (randomizer) {
		spamRandom()
	} else {
		spam()
	}
	return
	
$Pause::
	toggle:= false
	return

	
Cancel:
	ExitApp


*/
spam() {
	if (WinActive("ahk_class POEWindowClass")) {
		while (toggle) and (counter > 0) {
			MouseClick,Left
			counter--
			Sleep, 150
		}
	}
}

spamRandom() {
	if (WinActive("ahk_class POEWindowClass")) {
		while (toggle) and (counter > 0) {
			Random, rand, 150, 500
			MouseClick,Left
			counter--
			Sleep, %rand%
		}
	}
}