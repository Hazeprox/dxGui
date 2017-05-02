local sx, sy = guiGetScreenSize ( )
function isMouseInPosition ( x, y, width, height )
    if ( not isCursorShowing( ) ) then
        return false
    end
	local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
        return true
    else
        return false
    end
end
		function deleteLastLetter(text,ile)
			if tostring(text) and tonumber(ile) then
				asd = utf8.sub(text, 1, string.len(text)-ile)
				return asd
			end
			return false
		end
		bold = dxCreateFont ("Raleway-Bold.ttf", 9)
		light = dxCreateFont ("Raleway-Light.ttf", 12)
		medium = dxCreateFont ("Raleway-Medium.ttf", 15)
dxGui={
	allowLetters={ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k","l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"},
	button={}, -- zrobione
	combobox={}, --naprawione git
	gridlist={},
	window={}, -- w miare git
	checkbox={}, -- git
	editbox={}, -- git
	scroll={},-- nie dziala pobieranie statusu

}

addEventHandler("onClientRender", root,function()
	for k,v in pairs(dxGui["button"]) do
		if #dxGui.button > 0 and v.visible == true then
			dxDrawRectangle(v.x, v.y, v.w, v.h,tocolor(0,0,0,tonumber(v.alpha)),true)
			dxDrawRectangle(v.x+2, v.y+2, v.w-4, v.h-4	,tocolor(186,186,186,tonumber(v.alpha)-100),true)
			dxDrawText ( v.text , v.x, v.y, v.x+v.w, v.y+v.h, tocolor ( 255, 255, 255, 150 ),1, medium,"center", "center",false,false,true)
			if isMouseInPosition(v.x, v.y, v.w, v.h) then
				dxGui.button[v.id].alpha = 180
			else
				dxGui.button[v.id].alpha = 150
			end
		end
	end
	-- window
	for k,v in pairs(dxGui["window"]) do
		if #dxGui.window > 0 and v.visible == true then
			dxDrawRectangle(v.x, v.y, v.w, v.h,tocolor(0,0,0,tonumber(v.alpha)))
			dxDrawRectangle(v.x+10, v.y+20, v.w-20, v.h-30,tocolor(186,186,186,tonumber(v.alpha)-100))
			dxDrawRectangle(v.x, v.y, v.w, 20,tocolor(0,0,0,tonumber(v.alpha)-50))
			dxDrawText ( v.text , v.x, v.y, v.x+v.w, v.y+v.h, tocolor ( 255, 255, 255, 150 ), 1, bold,"center", "top")
		end
	end
	for k,v in pairs(dxGui["editbox"]) do
		if #dxGui.editbox > 0 and v.visible == true then
			dxDrawRectangle(v.x, v.y, v.w, v.h, tocolor(255,255,255,tonumber(v.alpha)), true)
			dxDrawRectangle(v.x+5, v.y+5, v.w-10, v.h-10,tocolor(186,186,186,tonumber(v.alpha)+10))
			dxDrawText ( v.text , v.x, v.y, v.x+v.w, v.y+v.h, tocolor ( 0, 0, 0, 255 ), 1, light,"center", "center",false,false,true)
		end
	end
	for k,v in pairs(dxGui["checkbox"]) do
		if #dxGui.checkbox > 0 and v.visible == true then
			if v.click == true then
				dxDrawRectangle(v.x, v.y, v.w, v.w, tocolor(255,255,255,tonumber(v.alpha)), true)
				dxDrawRectangle(v.x+5, v.y+5, v.w-10, v.w-10,tocolor(0,0,0,255),true)
			else
				dxDrawRectangle(v.x, v.y, v.w, v.w, tocolor(255,255,255,tonumber(v.alpha)), true)
				dxDrawRectangle(v.x+5, v.y+5, v.w-10, v.w-10,tocolor(255,255,255,tonumber(v.alpha)+20),true)
			end
		end
	end
	for _,v in pairs(dxGui["combobox"]) do
		if #dxGui.combobox > 0 and v.visible == true then
			if v.click == false then
				dxDrawRectangle(v.x, v.y, v.w, v.h, tocolor(255,255,255,tonumber(v.alpha)), true)
				dxDrawText ( v.item , v.x, v.y, v.x+v.w, v.y+v.h, tocolor ( 0, 0, 0, 255 ), 1, light,"center", "center",false,false,true)
			elseif v.click == true then
				if #dxGui.combobox[v.id].items > 0 then
					dxDrawRectangle(v.x, v.y, v.w, v.h, tocolor(255,255,255,tonumber(v.alpha)), true)
					dxDrawText ( v.item , v.x, v.y, v.x+v.w, v.y+v.h, tocolor ( 0, 0, 0, 255 ), 1, light,"center", "center",false,false,true)
					for k,item in pairs(dxGui["combobox"][v.id]["items"]) do
						dxDrawRectangle(v.x, v.y+40*k, v.w, v.h, tocolor(0,0,0,tonumber(v.alpha)), true)
						dxDrawText (tostring(item), v.x, v.y+80*k, v.x+v.w, v.y+v.h, tocolor ( 255, 255, 255, 255 ), 1, light,"center", "center",false,false,true)
					end
				end
			end
		end
	end
    for _,v in pairs(dxGui["scroll"]) do
        if #dxGui.scroll > 0 and v.visible == true then
            dxDrawRectangle(v.x, v.y, v.w, v.h, tocolor(0,0,0,tonumber(v.alpha)), true)
            scrollStatus = v.w/100
            dxDrawRectangle(v.wS, v.y, v.w/10, v.h, tocolor(255,255,255,tonumber(v.alpha)), true)-- TO JEST MALY KWADRACIK
                if getKeyState("mouse1") then
                    if isMouseInPosition(v.wS, v.y, v.w/10, v.h)  then
                        local x,y = getCursorPosition()
                        local cx, cy = (sx*x), (sy*y)
                        if cx >= v.x+((v.w/10)/2) and cx <= v.x+v.w-((v.w/10)/2) then
                            v.wS = cx-((v.w/10)/2)
                            dxGui["scroll"][v.id].status = scrollStatus*v.wS-v.x
                            outputChatBox(dxGui["scroll"][v.id].status)
                        end
                    end
                end
        end
    end
end)
addEventHandler("onClientClick",root,function(btn,state)
	if btn and getKeyState("mouse1") and state then
		for k,v in pairs(dxGui["button"]) do
			if #dxGui.button > 0 and v.visible then
				if isMouseInPosition(v.x, v.y, v.w, v.h) then
					if type(v.funkcja) == "function" then
						v.funkcja()
					end
				end
			end
		end
		for k,v in pairs(dxGui["editbox"]) do
		dxGui.editbox[v.id].click = false
			if #dxGui.editbox > 0 and v.visible then
				if isMouseInPosition(v.x, v.y, v.w, v.h) then
					dxGui.editbox[v.id].click = true
				end
			end
		end
		for k,v in pairs(dxGui["checkbox"]) do
			if #dxGui.checkbox > 0 and v.visible then
				if isMouseInPosition(v.x, v.y, v.w, v.w) then
					if v.click == false then
						dxGui.checkbox[v.id].click = true
					else
						dxGui.checkbox[v.id].click = false
					end
				end
			end
		
		end
		for _,v in pairs(dxGui["combobox"]) do
			if #dxGui["combobox"] > 0 and v.visible then
				if v.click == false then
					if isMouseInPosition(v.x, v.y, v.w, v.h)  then
						dxGui.combobox[v.id].click = true
					end
				else
					for k,item in pairs(dxGui["combobox"][v.id]["items"]) do
						if isMouseInPosition(v.x, v.y+40*k, v.w, v.h) then
							dxGui.combobox[v.id].click = false
							dxGui["combobox"][v.id].item = dxGui["combobox"][v.id]["items"][k]
						end
					end
				end
			end
		end
	end
end)
--button
function dxCreateButton(idd, xd, yd, wd, hd, textd,funkcjad)
		dxGui.button[idd] = {
			visible = true,
			id = idd,
			x = xd,
			y = yd,
			w = wd,
			h = hd,
			text = textd,
			alpha = 150,
			funkcja = funkcjad
		}
end



function dxSetButtonText(id, text)
	dxGui.button[id].text = text
end

function dxButtonSetVisible(id, bool)
	dxGui.button[id].visible = bool or false
end
--window
function dxCreateWindow(idd, xd, yd, wd, hd, textd)
		dxGui.window[idd] = {
			visible = true,
			id = idd,
			x = xd,
			y = yd,
			w = wd,
			h = hd,
			text = textd,
			alpha = 150,
		}
end
function dxSetWindowText(id, text)
	dxGui.window[id].text = text
end

function dxWindowSetVisible(id, bool)
	dxGui.window[id].visible = bool or false
	
end
--editbox
function dxCreateEdit(idd, xd, yd, wd, hd)
		dxGui.editbox[idd] = {
			visible = true,
			id = idd,
			x = xd,
			y = yd,
			w = wd,
			h = hd,
			click = false,
			text = "",
			alpha = 200,
		}
end

function dxEditGetText(id)
	return dxGui.editbox[id].text 
end

function dxEditSetVisible(id, bool)
	dxGui.editbox[id].visible = bool or false
	
end

addEventHandler("onClientKey",root,function(button, press)
	if press then
		for k,v in pairs(dxGui["editbox"]) do
			if v.click == true then
				if button == "backspace" then
					if #dxGui.editbox[v.id].text > 0 then
						dxGui.editbox[v.id].text = deleteLastLetter(dxGui.editbox[v.id].text, 1)
					end
				else
					for k,litera in pairs(dxGui["allowLetters"]) do
						if #dxGui.editbox[v.id].text < 16 then 
							if button == litera and getKeyState("lshift") then
								dxGui.editbox[v.id].text = dxGui.editbox[v.id].text..string.upper(litera)
								break
							end
							if button == litera then
								dxGui.editbox[v.id].text = dxGui.editbox[v.id].text ..litera
							end
						end
					end
				end
			end
		end
	end
end)

--checkbox
function dxCreateCheckbox(idd, xd, yd, wd)
		dxGui.checkbox[idd] = {
			visible = true,
			id = idd,
			x = xd,
			y = yd,
			w = wd,
			click = false,
			alpha = 200,
		}
end

function dxCheckboxGetClicked(id)
	return dxGui.checkbox[id].click 
end

function dxCheckboxSetVisible(id, bool)
	dxGui.checkbox[id].visible = bool or false
	
end
--combobox
function dxCreateCombobox(idd, xd, yd, wd,hd)
		dxGui.combobox[idd] = {
			visible = true,
			id = idd,
			x = xd,
			y = yd,
			w = wd,
			h = hd,
			click = false,
			items = {},
			item = "",
			alpha = 200,
		}
end
function dxComboboxAddItem(id, text)
	table.insert(dxGui.combobox[id].items, text)
end
function dxComboboxSetVisible(id, bool)
	dxGui.combobox[id].visible = bool or false
end
function dxComboboxGetItemText(id)
	return dxGui.combobox[id].item
end
--scroll1

function dxCreateScroll(idd, xd, yd, wd,hd, wS)
        dxGui.scroll[idd] = {
            visible = true,
            id = idd,
            x = xd,
            y = yd,
            w = wd,
            h = hd,
            wS = xd,
            status = 0,
            alpha = 200,
        }
end
function dxScrollSetVisible(id, bool)
	dxGui.scroll[id].visible = bool or false
end
function dxScrollGetStatus(id)
	return dxGui.scroll[id].status
end
--Tworzenie test
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