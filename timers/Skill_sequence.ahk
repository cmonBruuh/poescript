#SingleInstance, Force

global timer
global skill1
global skill2
global elatimer

Gui, -MaximizeBox -MinimizeBox
Gui, Add, Edit, x92 y9 w90 h20 -VScroll -WantReturn Limit1 Uppercase vSkill1, 
Gui, Add, Edit, x92 y39 w90 h20 -VScroll -WantReturn Limit1 Uppercase vSkill2, 
Gui, Add, Edit, x92 y69 w90 h20 -VScroll -WantReturn Number Limit4 vElaTimer,
Gui, Add, Text, x12 y9 w70 h20 , Skill 1
Gui, Add, Text, x12 y39 w70 h20 , Skill 2
Gui, Add, Text, x12 y69 w70 h20 , Elapsetimer
Gui, Add, Text, x12 y99 w170 h100 , - Skill 1 is the skill you execute by yourself `n - Skill 2 is the skill which is executed "after" you clicked skill 1 `n - Eslapsetimer is the time inbetween the first and second skill (the time which i meant with "after")
Gui, Show, w201 h217, Skills in sequence
Gui, Add, Button, x60 y195 w70 h20 gSave, Save
return

GuiClose:
ExitApp

Save:
	GuiControlGet, Skill1
	GuiControlGet, Skill2
	GuiControlGet, ElaTimer
	skill1 := Skill1
	skill2 := Skill2
	elatimer := ElaTimer
	if (!skill1 or !skill2 or !elatimer) {
		MsgBox, All fields must be filled.
		return
	}
	if (elatimer < 400) {
		MsgBox, Timer must be above 400ms
		return
	}
	Hotkey,~%Skill1%,SkillHK
	WinHide, Skills in sequence
	return


SkillHK:
	if (WinActive("ahk_class POEWindowClass")) {
			Sleep, %elatimer%
			Send, %skill2%
	}
	return