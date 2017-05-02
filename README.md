# dxGui - Editbox, Window, Buttoon, Combobox and bugged scroll
# Contact
dxGui v0.2 by Haze <zmuda20011@gmail.com>
# Button Functions
dxCreateButton
dxSetButtonText
dxButtonSetVisible
# Window Functions
dxSetWindowText
dxWindowSetVisible
# Editbox Functions
dxCreateEdit
dxEditGetText
dxEditSetVisible
# Checkbox Functions 
dxCreateCheckbox
dxCheckboxGetClicked
dxCheckboxSetVisible
# Combobox Functions
dxCreateCombobox
dxComboboxAddItem 
dxComboboxSetVisible
dxComboboxGetItemText
# Example Lua
dxCreateWindow(1,sx * 0.3316, sy * 0.2695, sx * 0.3734, sy * 0.5378,"dxGui by Haze v0.1")
dxCreateEdit(1, sx * 0.4078, sy * 0.3477, sx * 0.2086, sy * 0.0573)
dxCreateCombobox(1,sx * 0.4722, sy * 0.4362, sx * 0.1435, sy * 0.0469)
dxCreateCheckbox(1, sx * 0.4078, sy * 0.3477+100, 15)
dxCreateScroll(1, sx * 0.4122, sy * 0.5990, sx * 0.2035, sy * 0.0495,0)
dxCreateButton(1,sx * 0.5842, sy * 0.6940, sx * 0.1047, sy * 0.0794,"Close",function()
	dxWindowSetVisible(1, false)
	dxCheckboxSetVisible(1, false)
	dxComboboxSetVisible(1, false)
	dxButtonSetVisible(1, false)
	dxScrollSetVisible(1, false)
	dxButtonSetVisible(2, false)
	dxEditSetVisible(1, false)
	showCursor(false)
end)

dxCreateButton(2,sx * 0.3485, sy * 0.6940, sx * 0.1047, sy * 0.0794,"getDxInfo",function()
	outputChatBox("editbox:  "..dxEditGetText(1))
	outputChatBox("checkbox: "..tostring(dxCheckboxGetClicked(1)))
	outputChatBox("combobox: "..dxComboboxGetItemText(1))
end)
	dxComboboxSetVisible(1, false)
	dxScrollSetVisible(1, false)
	dxCheckboxSetVisible(1, false)
	dxWindowSetVisible(1, false)
	dxButtonSetVisible(1, false)
	dxButtonSetVisible(2, false)
	dxEditSetVisible(1, false)
	for i=1,5 do
		dxComboboxAddItem(1, i)
	end
addCommandHandler("dxOpen",function()
dxButtonSetVisible(2, true)
dxScrollSetVisible(1, true)
dxCheckboxSetVisible(1, true)
dxComboboxSetVisible(1, true)
dxWindowSetVisible(1, true)
dxEditSetVisible(1, true)

dxButtonSetVisible(1, true)
showCursor(true)
end)
