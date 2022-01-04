local TPMenuOpen = false

-- Event that activates the teleport-menu.
-- Triggered by the chat message "/tp".
-- Don't trigger this, use the chat message.
RegisterNetEvent('pd5m:hud:opentpmenu')
AddEventHandler('pd5m:hud:opentpmenu', function()
	TPMenuOpen = true
end)

-- Thread for the teleporting menu.
-- The at the start defined lists contain the teleport-coordinates.
CreateThread(function()

	local LSPDCurrent = 1
	local LSPDSelected = 1
	local BCSOCurrent = 1
	local BCSOSelected = 1
	local SASPCurrent = 1
	local SASPSelected = 1
	local SAPRCurrent = 1
	local SAPRSelected = 1
	local SWATCurrent = 1
	local SWATSelected = 1
	local DPOSCurrent = 1
	local DPOSSelected = 1
	local FIRECurrent = 1
	local FIRESelected = 1

	WarMenu.CreateMenu('TPMenu', 'Station-Teleporter')

	while true do
		if WarMenu.IsMenuOpened('TPMenu') then
			if WarMenu.ComboBox('LSPD Stations', LSPDStations, LSPDCurrent, LSPDSelected, function(currentIndex, selectedIndex)
					LSPDCurrent = currentIndex
					LSPDSelected = selectedIndex
				end) then
					TriggerEvent('chatMessage', '', {0,0,180}, 'Teleported to ' .. list_lspd_coords[LSPDCurrent].stationname .. '!')
					SetEntityCoords(GetPlayerPed(-1), list_lspd_coords[LSPDCurrent].x, list_lspd_coords[LSPDCurrent].y, list_lspd_coords[LSPDCurrent].z, 1, 0, 0, 1)
					TPMenuOpen = false
					WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('LSSD Stations', BCSOStations, BCSOCurrent, BCSOSelected, function(currentIndex, selectedIndex)
					BCSOCurrent = currentIndex
					BCSOSelected = selectedIndex
				end) then
					TriggerEvent('chatMessage', '', {225,213,5}, 'Teleported to ' .. list_bcso_coords[BCSOCurrent].stationname .. '!')
					SetEntityCoords(GetPlayerPed(-1), list_bcso_coords[BCSOCurrent].x, list_bcso_coords[BCSOCurrent].y, list_bcso_coords[BCSOCurrent].z, 1, 0, 0, 1)
					TPMenuOpen = false
					WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('SASP Stations', SASPStations, SASPCurrent, SASPSelected, function(currentIndex, selectedIndex)
					SASPCurrent = currentIndex
					SASPSelected = selectedIndex
				end) then
					TriggerEvent('chatMessage', '', {230,230,230}, 'Teleported to ' .. list_sasp_coords[SASPCurrent].stationname .. '!')
					SetEntityCoords(GetPlayerPed(-1), list_sasp_coords[SASPCurrent].x, list_sasp_coords[SASPCurrent].y, list_sasp_coords[SASPCurrent].z, 1, 0, 0, 1)
					TPMenuOpen = false
					WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('SAPR Stations', SAPRStations, SAPRCurrent, SAPRSelected, function(currentIndex, selectedIndex)
					SAPRCurrent = currentIndex
					SAPRSelected = selectedIndex
				end) then
					TriggerEvent('chatMessage', '', {0,200,0}, 'Teleported to ' .. list_sapr_coords[SAPRCurrent].stationname .. '!')
					SetEntityCoords(GetPlayerPed(-1), list_sapr_coords[SAPRCurrent].x, list_sapr_coords[SAPRCurrent].y, list_sapr_coords[SAPRCurrent].z, 1, 0, 0, 1)
					TPMenuOpen = false
					WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('SWAT Stations', SWATStations, SWATCurrent, SWATSelected, function(currentIndex, selectedIndex)
					SWATCurrent = currentIndex
					SWATSelected = selectedIndex
				end) then
					TriggerEvent('chatMessage', '', {0,0,0}, 'Teleported to ' .. list_swat_coords[SWATCurrent].stationname .. '!')
					SetEntityCoords(GetPlayerPed(-1), list_swat_coords[SWATCurrent].x, list_swat_coords[SWATCurrent].y, list_swat_coords[SWATCurrent].z, 1, 0, 0, 1)
					TPMenuOpen = false
					WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('DPOS Stations', DPOSStations, DPOSCurrent, DPOSSelected, function(currentIndex, selectedIndex)
					DPOSCurrent = currentIndex
					DPOSSelected = selectedIndex
				end) then
					TriggerEvent('chatMessage', '', {255,150, 0}, 'Teleported to ' .. list_dpos_coords[DPOSCurrent].stationname .. '!')
					SetEntityCoords(GetPlayerPed(-1), list_dpos_coords[DPOSCurrent].x, list_dpos_coords[DPOSCurrent].y, list_dpos_coords[DPOSCurrent].z, 1, 0, 0, 1)
					TPMenuOpen = false
					WarMenu.CloseMenu()
				elseif WarMenu.ComboBox('FD Stations', FIREStations, FIRECurrent, FIRESelected, function(currentIndex, selectedIndex)
						FIRECurrent = currentIndex
						FIRESelected = selectedIndex
					end) then
						TriggerEvent('chatMessage', '', {255,150, 0}, 'Teleported to ' .. list_fire_coords[FIRECurrent].stationname .. '!')
						SetEntityCoords(GetPlayerPed(-1), list_fire_coords[FIRECurrent].x, list_fire_coords[FIRECurrent].y, list_fire_coords[FIRECurrent].z, 1, 0, 0, 1)
						TPMenuOpen = false
						WarMenu.CloseMenu()

			elseif WarMenu.Button('Exit') then
				TPMenuOpen = false
				WarMenu.CloseMenu()
			end

			WarMenu.Display()
		elseif TPMenuOpen then
			WarMenu.OpenMenu('TPMenu')
		end

		Wait(0)
	end
end)
