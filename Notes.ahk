#SingleInstance,Force

Gui,+AlwaysOnTop
Gui, +Resize
Gui, -MaximizeBox -MinimizeBox
Gui, Add, Edit, w145 +Multi gEdit_AutoHeight, `n `n 
Loop, 5
	Lv_add("", "Cell " a_index ":1", "Cell " a_index ":2", "Cell " a_index ":3")
Edit_AutoHeight(hT "|" hLv)	; relative controls to be moved with Edit control.
Gui, Show, AutoSize, Notes
return

GuiClose:
EXITAPP
Return

;================================================================================
Edit_AutoHeight(CtrlHwnd) {				; AutoHeight Multiline Edit control when add/remove lines.
	STATIC RowH="", CtrlsToMove=""		; If you call once this function with a "|" separated list of Ctrl's Hwnds as parameter,
	IF InStr(CtrlHwnd, "|")				;    then these ctrls will move down/up as the Edit control changes it's height.
		Return (CtrlsToMove:=CtrlHwnd)	; It is prefered to set this function as the g-label function of the Edit control.
	IF !RowH							; For each Edit control to AutoHeight, you have to define it's own function (clone of this).
		{
		GuiControlGet, val,,               %CtrlHwnd%	; get current value
		SendMessage 0x304,0,0,,     Ahk_id %CtrlHwnd%	; WM_UNDO               action triger this event
		GuiControlGet, p, Pos,             %CtrlHwnd%	; get height     before action triger this event
		ControlGet, c, LineCount,,, Ahk_id %CtrlHwnd%	; get LinesCount before action triger this event
		RowH := (ph-8) / c								; 8= top & bottom margin of the Edit control (regardless of the nb of rows)
		GuiControl,, %CtrlHwnd%, %val%					; set back the last value before the undo command
		}
	GuiControlGet, p, Pos,            %CtrlHwnd%
	ControlGet, c, LineCount,,, Ahk_id %CtrlHwnd%
	GuiControl, MoveDraw, %CtrlHwnd%, % "h" (nh:=(RowH*c)+8)	; AutoHeight Edit control
	Loop, Parse, CtrlsToMove, |
		{
		GuiControlGet, cp, Pos, %A_LoopField%
		GuiControl, MoveDraw, %A_LoopField%,% "y" (cpy+nh-ph)	; Move down/up the relative controls
		}
	Gui, %A_Gui%:Show, AutoSize
}