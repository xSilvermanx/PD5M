-- Menu state
local showMenu = false

-- Keybind Lookup table
local keybindControls = {
	["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["Backspace"] = 177, ["Tab"] = 37, ["q"] = 44, ["w"] = 32, ["e"] = 38, ["r"] = 45, ["t"] = 245, ["y"] = 246, ["u"] = 303, ["p"] = 199, ["["] = 39, ["]"] = 40, ["Enter"] = 18, ["CapsLock"] = 137, ["a"] = 34, ["s"] = 8, ["d"] = 9, ["f"] = 23, ["g"] = 47, ["h"] = 74, ["k"] = 311, ["l"] = 182, ["Shift"] = 21, ["z"] = 20, ["x"] = 73, ["c"] = 26, ["v"] = 0, ["b"] = 29, ["n"] = 249, ["m"] = 244, [","] = 82, ["."] = 81, ["Home"] = 213, ["PageUp"] = 10, ["PageDown"] = 11, ["Delete"] = 178
}

local padControls = {
	["DPadDown"] = 19, ["DPadLeft"] = 15, ["DPadRight"] = 14, ["DPadUp"] = 27, ["L1"] = 25,
}

-- Main thread
Citizen.CreateThread(function()
    -- Update every frame
    while true do
        Citizen.Wait(0)

        -- Loop through all menus in config
        for _, menuConfig in pairs(menuConfigs) do
            -- Check if menu should be enabled
            if menuConfig:enableMenu() then
                -- When keybind is pressed toggle UI
                local keybindControl = keybindControls[menuConfig.data.keybind]
								local padControl = padControls[menuConfig.data.padkeybind]
                if ( IsControlPressed(0, keybindControl) and IsInputDisabled(2) ) or ( IsControlPressed(0, padControl) and (not IsInputDisabled(2)) ) then
                    -- Init UI
                    showMenu = true
                    SendNUIMessage({
                        type = 'init',
                        data = menuConfig.data,
                        resourceName = GetCurrentResourceName()
                    })

                    -- Set cursor position and set focus
                    SetCursorLocation(0.5, 0.5)
                    SetNuiFocus(true, true)
										SetNuiFocusKeepInput(true)
										CreateThread(function()
											while showMenu do
												DisableControlAction(0, 1, true)
												DisableControlAction(0, 2, true)
												DisableControlAction(0, 3, true)
												DisableControlAction(0, 4, true)
												DisableControlAction(0, 5, true)
												DisableControlAction(0, 6, true)
												DisableControlAction(0, 24, true)
												DisableControlAction(0, 37, true)
												DisableControlAction(0, 38, true)
												DisableControlAction(0, 44, true)
												DisableControlAction(0, 46, true)
												DisableControlAction(0, 48, true)
												DisableControlAction(0, 51, true)
												DisableControlAction(0, 245, true)
												DisableControlAction(1, 1, true)
												DisableControlAction(1, 2, true)
												DisableControlAction(1, 3, true)
												DisableControlAction(1, 4, true)
												DisableControlAction(1, 5, true)
												DisableControlAction(1, 6, true)
												DisableControlAction(1, 24, true)
												DisableControlAction(1, 37, true)
												DisableControlAction(1, 38, true)
												DisableControlAction(1, 44, true)
												DisableControlAction(1, 46, true)
												DisableControlAction(1, 48, true)
												DisableControlAction(1, 51, true)
												DisableControlAction(1, 245, true)
												SetBigmapActive(false, false)
												Wait(0)
											end
										end)

										CreateThread(function()
											local xmax, ymax = GetActiveScreenResolution()
											local vx = 0.015
											local vy = vx * 1.5
											local a = 2
											while showMenu do
												local x, y = GetNuiCursorPosition()
												x = x / xmax
												y = y / ymax
												local xc = GetControlValue(0, 220)
												local yc = GetControlValue(0, 221)

												xc = xc - 127
												yc = yc - 127

												local sx = 1
												local sy = 1

												if xc < 0.0 then
													sx = -1
												end
												if yc < 0.0 then
													sy = -1
												end

												xc = sx* xc^a
												yc = sy* yc^a

												x = x + vx * xc/((127)^a)
												y = y + vy * yc/((127)^a)

												if x > 1.0 then
													x = 1.0
												elseif x < 0.0 then
													x = 0.0
												end
												if y > 1.0 then
													y = 1.0
												elseif y < 0.0 then
													y = 0.0
												end

												SetCursorLocation(x,y)
												Wait(0)
											end
										end)

                    -- Play sound
                    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)

										CreateThread(function()
											Wait(1000)
											while showMenu do
												if IsControlPressed(0, padControl) then
													SendNUIMessage({
														type = 'padclose',
													})
												end
												Wait(0)
											end
										end)

                    -- Prevent menu from showing again until key is released
                    while showMenu == true do Citizen.Wait(100) end
                    Citizen.Wait(100)
                    while IsControlPressed(0, keybindControl) do Citizen.Wait(100) end
                end
            end
        end
    end
end)

-- Callback function for closing menu
RegisterNUICallback('closemenu', function(data, cb)
    -- Clear focus and destroy UI
    showMenu = false
    SetNuiFocus(false, false)
		SetNuiFocusKeepInput(false)

    SendNUIMessage({
        type = 'destroy'
    })

    -- Play sound
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)

    -- Send ACK to callback function
    cb('ok')
end)

-- Callback function for when a slice is clicked, execute command
RegisterNUICallback('sliceclicked', function(data, cb)
    -- Clear focus and destroy UI
    showMenu = false
    SetNuiFocus(false, false)
		SetNuiFocusKeepInput(false)

    SendNUIMessage({
        type = 'destroy'
    })

    -- Play sound
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)

    -- Run command
    ExecuteCommand(data.command)

    -- Send ACK to callback function
    cb('ok')
end)

-- Callback function for testing
RegisterNUICallback('testprint', function(data, cb)
    -- Print message
    TriggerEvent('chatMessage', "[test]", {255,0,0}, data.message)

    -- Send ACK to callback function
    cb('ok')
end)
