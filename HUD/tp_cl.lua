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
	
	local LSPDStations = {'Davis', 'Del Pierro Pier', 'La Mesa', 'Mission Row', 'Rockford Hills', 'Vespucci', 'Vespucci Beach', 'Vinewood'}
	local LSPDCoords = {{x=365.43, y=-1573.81, z=29.24}, {x=-1633.00, y=-1010.8, z=13.09}, {x=812.47, y=-1289.88, z=26.29}, {x=414.36, y=-980.25, z=29.45}, {x=-550.97, y=-139.73, z=38.47}, {x=-1111.71, y=-849.3, z=19.32}, {x=-1309.54, y=-1535.01, z=4.31}, {x=654.64, y=-15.25, z=82.93} }
	local BCSOStations = {'Sandy Shores', 'Paleto Bay'}
	local BCSOCoords = {{x=1863.75, y=3683.29, z=33.78}, {x=-428.22, y=6028.45, z=31.49} }
	local SASPStations = {'La Mesa', 'Paleto Bay'}
	local SASPCoords = {{x=812.47, y=-1289.88, z=26.29}, {x=-428.22, y=6028.45, z=31.49} }
	local SAPRStations = {'Beaver Bush'}
	local SAPRCoords = {{x=372.85, y=775.93, z=185.12} }
	local SWATStations = {'Davis', 'La Mesa', 'Paleto Bay', 'Rockford', 'Vespucci'}
	local SWATCoords = {{x=365.43, y=-1573.81, z=29.24}, {x=812.47, y=-1289.88, z=26.29}, {x=-428.22, y=6028.45, z=31.49}, {x=-550.97, y=-139.73, z=38.47}, {x=-1111.71, y=-849.3, z=19.32} }
	local DPOSStations = {'Airport', 'Burton', 'Davis', 'Harmony', 'La Mesa', 'Paleto', 'Strawberry', 'Vespucci'}
	local DPOSCoords = {{x=-1137.16, y=-1994.64, z=13.17}, {x=-358.33, y=-126.3, z=38.7}, {x=414.56, y=-1612.42, z=29.29}, {x=1188.44, y=2650.64, z=37.84}, {x=720.01, y=-1076.28, z=22.24}, {x=108.63, y=6613.43, z=32.01}, {x=-212.41, y=-1307.53, z=31.26}, {x=-1060.12, y=-844.23, z=5.04} }
	
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
	
	WarMenu.CreateMenu('TPMenu', 'Station-Teleporter')
	
	while true do
		if WarMenu.IsMenuOpened('TPMenu') then
			if WarMenu.ComboBox('LSPD Stations', LSPDStations, LSPDCurrent, LSPDSelected, function(currentIndex, selectedIndex)
					LSPDCurrent = currentIndex
					LSPDSelected = selectedIndex
				end) then
					TriggerEvent('chatMessage', '', {0,0,180}, 'Teleported to LSPD Station ' .. LSPDStations[LSPDCurrent] .. '!')
					SetEntityCoords(GetPlayerPed(-1), LSPDCoords[LSPDCurrent].x, LSPDCoords[LSPDCurrent].y, LSPDCoords[LSPDCurrent].z, 1, 0, 0, 1)
					TPMenuOpen = false
					WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('BCSO Stations', BCSOStations, BCSOCurrent, BCSOSelected, function(currentIndex, selectedIndex)
					BCSOCurrent = currentIndex
					BCSOSelected = selectedIndex
				end) then
					TriggerEvent('chatMessage', '', {225,213,5}, 'Teleported to BCSO Station ' .. BCSOStations[BCSOCurrent] .. '!')
					SetEntityCoords(GetPlayerPed(-1), BCSOCoords[BCSOCurrent].x, BCSOCoords[BCSOCurrent].y, BCSOCoords[BCSOCurrent].z, 1, 0, 0, 1)
					TPMenuOpen = false
					WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('SASP Stations', SASPStations, SASPCurrent, SASPSelected, function(currentIndex, selectedIndex)
					SASPCurrent = currentIndex
					SASPSelected = selectedIndex
				end) then
					TriggerEvent('chatMessage', '', {230,230,230}, 'Teleported to SASP Station ' .. SASPStations[SASPCurrent] .. '!')
					SetEntityCoords(GetPlayerPed(-1), SASPCoords[SASPCurrent].x, SASPCoords[SASPCurrent].y, SASPCoords[SASPCurrent].z, 1, 0, 0, 1)
					TPMenuOpen = false
					WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('SAPR Stations', SAPRStations, SAPRCurrent, SAPRSelected, function(currentIndex, selectedIndex)
					SAPRCurrent = currentIndex
					SAPRSelected = selectedIndex
				end) then
					TriggerEvent('chatMessage', '', {0,200,0}, 'Teleported to SAPR Station ' .. SAPRStations[SAPRCurrent] .. '!')
					SetEntityCoords(GetPlayerPed(-1), SAPRCoords[SAPRCurrent].x, SAPRCoords[SAPRCurrent].y, SAPRCoords[SAPRCurrent].z, 1, 0, 0, 1)
					TPMenuOpen = false
					WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('SWAT Stations', SWATStations, SWATCurrent, SWATSelected, function(currentIndex, selectedIndex)
					SWATCurrent = currentIndex
					SWATSelected = selectedIndex
				end) then
					TriggerEvent('chatMessage', '', {0,0,0}, 'Teleported to SWAT Station ' .. SWATStations[SWATCurrent] .. '!')
					SetEntityCoords(GetPlayerPed(-1), SWATCoords[SWATCurrent].x, SWATCoords[SWATCurrent].y, SWATCoords[SWATCurrent].z, 1, 0, 0, 1)
					TPMenuOpen = false
					WarMenu.CloseMenu()
			elseif WarMenu.ComboBox('DPOS Stations', DPOSStations, DPOSCurrent, DPOSSelected, function(currentIndex, selectedIndex)
					DPOSCurrent = currentIndex
					DPOSSelected = selectedIndex
				end) then
					TriggerEvent('chatMessage', '', {255,150, 0}, 'Teleported to DPOS Station ' .. DPOSStations[DPOSCurrent] .. '!')
					SetEntityCoords(GetPlayerPed(-1), DPOSCoords[DPOSCurrent].x, DPOSCoords[DPOSCurrent].y, DPOSCoords[DPOSCurrent].z, 1, 0, 0, 1)
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
