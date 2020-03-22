-- thread to draw the markers on the map
CreateThread(function()
	while true do
		for i,coord in ipairs(list_arrest_coords) do
			DrawMarker(var_arrest_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_arrest_scaleX, var_arrest_scaleY, var_arrest_scaleZ, var_arrest_red, var_arrest_green, var_arrest_blue, var_arrest_alpha, var_arrest_bob, var_arrest_face, var_arrest_p19, var_arrest_rotate, var_arrest_textdict, var_arrest_textname, var_arrest_drawonent)
		end
		for i,coord in ipairs(list_cloth_coords) do
			DrawMarker(var_cloth_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cloth_scaleX, var_cloth_scaleY, var_cloth_scaleZ, var_cloth_red, var_cloth_green, var_cloth_blue, var_cloth_alpha, var_cloth_bob, var_cloth_face, var_cloth_p19, var_cloth_rotate, var_cloth_textdict, var_cloth_textname, var_cloth_drawonent)
		end
		for i,coord in ipairs(list_heal_coords) do
			DrawMarker(var_heal_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_heal_scaleX, var_heal_scaleY, var_heal_scaleZ, var_heal_red, var_heal_green, var_heal_blue, var_heal_alpha, var_heal_bob, var_heal_face, var_heal_p19, var_heal_rotate, var_heal_textdict, var_heal_textname, var_heal_drawonent)
		end
		for i,coord in ipairs(list_cars_city_coords) do
			DrawMarker(var_cars_city_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_city_scaleX, var_cars_city_scaleY, var_cars_city_scaleZ, var_cars_city_red, var_cars_city_green, var_cars_city_blue, var_cars_city_alpha, var_cars_city_bob, var_cars_city_face, var_cars_city_p19, var_cars_city_rotate, var_cars_city_textdict, var_cars_city_textname, var_cars_city_drawonent)
		end
		for i,coord in ipairs(list_cars_bcso_coords) do
			DrawMarker(var_cars_bcso_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_bcso_scaleX, var_cars_bcso_scaleY, var_cars_bcso_scaleZ, var_cars_bcso_red, var_cars_bcso_green, var_cars_bcso_blue, var_cars_bcso_alpha, var_cars_bcso_bob, var_cars_bcso_face, var_cars_bcso_p19, var_cars_bcso_rotate, var_cars_bcso_textdict, var_cars_bcso_textname, var_cars_bcso_drawonent)
		end
		for i,coord in ipairs(list_cars_sapr_coords) do
			DrawMarker(var_cars_sapr_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_sapr_scaleX, var_cars_sapr_scaleY, var_cars_sapr_scaleZ, var_cars_sapr_red, var_cars_sapr_green, var_cars_sapr_blue, var_cars_sapr_alpha, var_cars_sapr_bob, var_cars_sapr_face, var_cars_sapr_p19, var_cars_sapr_rotate, var_cars_sapr_textdict, var_cars_sapr_textname, var_cars_sapr_drawonent)
		end
		for i,coord in ipairs(list_cars_sasp_coords) do
			DrawMarker(var_cars_sasp_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_sasp_scaleX, var_cars_sasp_scaleY, var_cars_sasp_scaleZ, var_cars_sasp_red, var_cars_sasp_green, var_cars_sasp_blue, var_cars_sasp_alpha, var_cars_sasp_bob, var_cars_sasp_face, var_cars_sasp_p19, var_cars_sasp_rotate, var_cars_sasp_textdict, var_cars_sasp_textname, var_cars_sasp_drawonent)
		end
		for i,coord in ipairs(list_cars_swat_coords) do
			DrawMarker(var_cars_swat_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_swat_scaleX, var_cars_swat_scaleY, var_cars_swat_scaleZ, var_cars_swat_red, var_cars_swat_green, var_cars_swat_blue, var_cars_swat_alpha, var_cars_swat_bob, var_cars_swat_face, var_cars_swat_p19, var_cars_swat_rotate, var_cars_swat_textdict, var_cars_swat_textname, var_cars_swat_drawonent)
		end
		for i,coord in ipairs(list_cars_dpos_coords) do
			DrawMarker(var_cars_dpos_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_dpos_scaleX, var_cars_dpos_scaleY, var_cars_dpos_scaleZ, var_cars_dpos_red, var_cars_dpos_green, var_cars_dpos_blue, var_cars_dpos_alpha, var_cars_dpos_bob, var_cars_dpos_face, var_cars_dpos_p19, var_cars_dpos_rotate, var_cars_dpos_textdict, var_cars_dpos_textname, var_cars_dpos_drawonent)
		end
		for i,coord in ipairs(list_cars_heli_coords) do
			DrawMarker(var_cars_heli_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_heli_scaleX, var_cars_heli_scaleY, var_cars_heli_scaleZ, var_cars_heli_red, var_cars_heli_green, var_cars_heli_blue, var_cars_heli_alpha, var_cars_heli_bob, var_cars_heli_face, var_cars_heli_p19, var_cars_heli_rotate, var_cars_heli_textdict, var_cars_heli_textname, var_cars_heli_drawonent)
		end
		for i,coord in ipairs(list_weap_coords) do
			DrawMarker(var_weap_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_weap_scaleX, var_weap_scaleY, var_weap_scaleZ, var_weap_red, var_weap_green, var_weap_blue, var_weap_alpha, var_weap_bob, var_weap_face, var_weap_p19, var_weap_rotate, var_weap_textdict, var_weap_textname, var_weap_drawonent)
		end
		for i,coord in ipairs(list_evidence_coords) do
			DrawMarker(var_evidence_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_evidence_scaleX, var_evidence_scaleY, var_evidence_scaleZ, var_evidence_red, var_evidence_green, var_evidence_blue, var_evidence_alpha, var_evidence_bob, var_evidence_face, var_evidence_p19, var_evidence_rotate, var_evidence_textdict, var_evidence_textname, var_evidence_drawonent)
		end
		for i,coord in ipairs(list_tut_coords) do
			DrawMarker(var_tut_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_tut_scaleX, var_tut_scaleY, var_tut_scaleZ, var_tut_red, var_tut_green, var_tut_blue, var_tut_alpha, var_tut_bob, var_tut_face, var_tut_p19, var_tut_rotate, var_tut_textdict, var_tut_textname, var_tut_drawonent)
		end
		Wait(0)
	end
end)

-- Code to give functionalities to the markers
-- Always builds the same: the first thread checks if the player is in range of the marker.
-- If yes, pressing E will use the marker, most of the time it opens a warmenu.
-- -- Clothing

if ActivateClothMarkers then
	atcloth = false

	CreateThread(function()
		while true do
			for i,coord in ipairs(list_cloth_coords) do
				local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
				local distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
				if distance < 5 then
					atcloth = true
					StartHelpNotify('Press ~INPUT_CONTEXT~ to open the wardrobe (MP-character required).', 500)
					Wait(40)
					while distance < 5 do
						HelpNotify('Press ~INPUT_CONTEXT~ to open the wardrobe (MP-character required).', 500)
						Wait(500)
						local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
						distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
					end
					EndHelpNotify('Press ~INPUT_CONTEXT~ to open the wardrobe (MP-character required).', 500)
					atcloth = false
				end
			end
		Wait(0)
		end
	end)

	CreateThread(function()

		WarMenu.CreateMenu('Umkleide', 'Wardrobe')
		WarMenu.CreateSubMenu('AllgemeinCloth', 'Umkleide', 'General')
		WarMenu.CreateSubMenu('Gürtel', 'AllgemeinCloth', 'Belts')
		WarMenu.CreateSubMenu('Rangabzeichen', 'AllgemeinCloth', 'Rank Insignia')
		WarMenu.CreateSubMenu('Kopfbedeckungen', 'AllgemeinCloth', 'Headgear')
		WarMenu.CreateSubMenu('Brillen', 'AllgemeinCloth', 'Glasses')
		WarMenu.CreateSubMenu('Balaclavas', 'AllgemeinCloth', 'Balaclavas')

		WarMenu.CreateSubMenu('UndressCloth', 'AllgemeinCloth', 'Undress')

		WarMenu.CreateSubMenu('LSPDCloth', 'Umkleide', 'LSPD-Uniform')
		WarMenu.CreateSubMenu('LSPDTops', 'LSPDCloth', 'LSPD-Tops')
		WarMenu.CreateSubMenu('LSPDHose', 'LSPDCloth', 'LSPD-Pants')
		WarMenu.CreateSubMenu('LSPDShoes', 'LSPDCloth', 'LSPD-Shoes')

		WarMenu.CreateSubMenu('BCSOCloth', 'Umkleide', 'BCSO-Uniform')
		WarMenu.CreateSubMenu('BCSOTops', 'BCSOCloth', 'BCSO-Tops')
		WarMenu.CreateSubMenu('BCSOHose', 'BCSOCloth', 'BCSO-Pants')
		WarMenu.CreateSubMenu('BCSOShoes', 'BCSOCloth', 'BCSO-Shoes')

		WarMenu.CreateSubMenu('SAPRCloth', 'Umkleide', 'SAPR-Uniform')
		WarMenu.CreateSubMenu('SAPRTops', 'SAPRCloth', 'SAPR-Tops')
		WarMenu.CreateSubMenu('SAPRHose', 'SAPRCloth', 'SAPR-Pants')
		WarMenu.CreateSubMenu('SAPRShoes', 'SAPRCloth', 'SAPR-Shoes')

		WarMenu.CreateSubMenu('SASPCloth', 'Umkleide', 'SASP-Uniform')
		WarMenu.CreateSubMenu('SASPTops', 'SASPCloth', 'SASP-Tops')
		WarMenu.CreateSubMenu('SASPHose', 'SASPCloth', 'SASP-Pants')
		WarMenu.CreateSubMenu('SASPShoes', 'SASPCloth', 'SASP-Shoes')

		WarMenu.CreateSubMenu('SWATCloth', 'Umkleide', 'SWAT-Uniform')
		WarMenu.CreateSubMenu('SWATTops', 'SWATCloth', 'SWAT-Tops')
		WarMenu.CreateSubMenu('SWATHose', 'SWATCloth', 'SWAT-Pants')
		WarMenu.CreateSubMenu('SWATShoes', 'SWATCloth', 'SWAT-Shoes')

		WarMenu.CreateSubMenu('DPOSCloth', 'Umkleide', 'DPOS-Uniform')
		WarMenu.CreateSubMenu('DPOSTops', 'DPOSCloth', 'DPOS-Tops')
		WarMenu.CreateSubMenu('DPOSHose', 'DPOSCloth', 'DPOS-Pants')
		WarMenu.CreateSubMenu('DPOSShoes', 'DPOSCloth', 'DPOS-Shoes')

		WarMenu.CreateSubMenu('SheriffCloth', 'Umkleide', 'Sheriff-Uniform')
		WarMenu.CreateSubMenu('SheriffTops', 'SheriffCloth', 'Sheriff-Tops')
		WarMenu.CreateSubMenu('SheriffHose', 'SheriffCloth', 'Sheriff-Pants')
		WarMenu.CreateSubMenu('SheriffShoes', 'SheriffCloth', 'Sheriff-Shoes')
		WarMenu.CreateSubMenu('SheriffAccess', 'SheriffCloth', 'Sheriff-Accessoires')
		WarMenu.CreateSubMenu('SheriffDecals', 'SheriffCloth', 'Sheriff-Decals')
		WarMenu.CreateSubMenu('SheriffHead', 'SheriffCloth', 'Sheriff-Headgear')


		while true do
			if WarMenu.IsMenuOpened('Umkleide') then
				if WarMenu.MenuButton('General', 'AllgemeinCloth') then
				elseif WarMenu.MenuButton('LSPD', 'LSPDCloth') then
				elseif WarMenu.MenuButton('BCSO', 'BCSOCloth') then
				elseif WarMenu.MenuButton('SAPR', 'SAPRCloth') then
				elseif WarMenu.MenuButton('SASP', 'SASPCloth') then
				elseif WarMenu.MenuButton('SWAT', 'SWATCloth') then
				elseif WarMenu.MenuButton('DPOS', 'DPOSCloth') then
				--elseif WarMenu.MenuButton('Sheriff', 'SheriffCloth') then
				elseif WarMenu.Button('Exit') then
					WarMenu.CloseMenu()
				end
			WarMenu.Display()

			elseif WarMenu.IsMenuOpened('LSPDCloth') then
				if WarMenu.MenuButton('Tops', 'LSPDTops') then
				elseif WarMenu.MenuButton('Pants', 'LSPDHose') then
				elseif WarMenu.MenuButton('Shoes', 'LSPDShoes') then
				elseif WarMenu.MenuButton('Go back', 'Umkleide') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('LSPDTops') then
				if WarMenu.Button('LSPD-Shirt') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 3, 14, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 48, 0, 0)
					end
				elseif WarMenu.Button('Pullover') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 1, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 50, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 3, 3, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 43, 0, 0)
					end
				elseif WarMenu.Button('Shirt') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 11, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 13, 3, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 3, 9, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 86, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'LSPDCloth') then
				end
			WarMenu.Display()

			elseif WarMenu.IsMenuOpened('LSPDHose') then
				if WarMenu.Button('Pants PD-Blue') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 4, 25, 2, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 4, 34, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'LSPDCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('LSPDShoes') then
				if WarMenu.Button('Shoes LSPD') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 6, 12, 6, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 6, 52, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'LSPDCloth') then
				end
			WarMenu.Display()

			elseif WarMenu.IsMenuOpened('AllgemeinCloth') then
				if WarMenu.MenuButton('Belts', 'Gürtel') then
				elseif WarMenu.MenuButton('Rank Insignia', 'Rangabzeichen') then
				elseif WarMenu.MenuButton('Headgear', 'Kopfbedeckungen') then
				elseif WarMenu.MenuButton('Balaclavas', 'Balaclavas') then
				elseif WarMenu.MenuButton('Glasses', 'Brillen') then
				elseif WarMenu.MenuButton('Undress', 'UndressCloth') then
				elseif WarMenu.MenuButton('Go back', 'Umkleide') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('Gürtel') then
				if WarMenu.Button('Nothing') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 8, 34, 0, 0)
					end

				elseif WarMenu.Button('Police Belt with Radio') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 8, 58, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 8, 35, 0, 0)
					end
				elseif WarMenu.Button('Police Belt') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 8, 129, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 8, 159, 0, 0)
					end
				elseif WarMenu.Button('Holster') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 8, 130, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 8, 160, 0, 0)
					end
				elseif WarMenu.Button('Police Belt with Holster') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 8, 122, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 8, 152, 0, 0)
					end
				elseif WarMenu.Button('Safety vest yellow') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 8, 59, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 8, 36, 0, 0)
					end
				elseif WarMenu.Button('Safety vest orange') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 8, 59, 1, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 8, 36, 1, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'AllgemeinCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('Rangabzeichen') then
				if WarMenu.Button('None / Recruit') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 10, 7, 0, 0)
					end
				elseif WarMenu.Button('Police Officer') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 1, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 10, 7, 1, 0)
					end
				elseif WarMenu.Button('Detective') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 2, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 10, 7, 2, 0)
					end
				elseif WarMenu.Button('Senior Officer') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 3, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 10, 7, 3, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'AllgemeinCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('Kopfbedeckungen') then
				if WarMenu.Button('None') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 0)
						SetPedPropIndex(GetPlayerPed(-1), 0, 8, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 0)
						SetPedPropIndex(GetPlayerPed(-1), 0, 120, 0, 0)
					end
				elseif WarMenu.Button('LSPD-Hat') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 0, 46, 0, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 0, 45, 0, 0)
					end
				elseif WarMenu.Button('Cap Black') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 0, 58, 2, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 0, 58, 2, 0)
					end
				elseif WarMenu.Button('Cap Beige') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 0, 58, 0, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 0, 58, 0, 0)
					end
				elseif WarMenu.Button('Helmet LSPD') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 0, 123, 15, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 0, 122, 15, 0)
					end
				elseif WarMenu.Button('Helmet Black') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 0, 123, 0, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 0, 122, 0, 0)
					end
				elseif WarMenu.Button('Helmet LSPD Visor Up') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 0, 124, 15, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 0, 123, 15, 0)
					end
				elseif WarMenu.Button('Helmet Schwarz Visor Up') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 0, 124, 0, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 0, 123, 0, 0)
					end
				elseif WarMenu.Button('Riot helmet LSPD') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 0, 125, 18, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 0, 124, 18, 0)
					end
				elseif WarMenu.Button('Riot helmet Black') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 0, 125, 0, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 0, 124, 0, 0)
					end
				elseif WarMenu.Button('Riot helmet LSPD Visor Up') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 0, 126, 18, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 0, 125, 18, 0)
					end
				elseif WarMenu.Button('Riot helmet Black Visor Up') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 0, 126, 0, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 0, 125, 0, 0)
					end
				elseif WarMenu.Button('Helicopter Headphones') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 0, 19, 0, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 0, 19, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'AllgemeinCloth') then
				end
			WarMenu.Display()

			elseif WarMenu.IsMenuOpened('Brillen') then
				if WarMenu.Button('None') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 1, 6, 0, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 1, 5, 0, 0)
					end
				elseif WarMenu.Button('Highway Orange') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 1, 5, 7, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 1, 11, 3, 0)
					end
				elseif WarMenu.Button('Highway Dark') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 1, 5, 1, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 1, 11, 6, 0)
					end
				elseif WarMenu.Button('Highway Green') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 1, 5, 2, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 1, 11, 4, 0)
					end
				elseif WarMenu.Button('Cop Black') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 1, 23, 9, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 1, 25, 9, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'AllgemeinCloth') then
				end
			WarMenu.Display()

			elseif WarMenu.IsMenuOpened('Balaclavas') then
				if WarMenu.Button('None') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 0)
					end
				elseif WarMenu.Button('Only eyes open') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 1, 35, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 1, 35, 0, 0)
					end
				elseif WarMenu.Button('Eyes and part of the nose open') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 1, 52, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 1, 52, 0, 0)
					end
				elseif WarMenu.Button('Face open') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 1, 122, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 1, 122, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'AllgemeinCloth') then
				end
			WarMenu.Display()

			elseif WarMenu.IsMenuOpened('UndressCloth') then
				if WarMenu.Button('Take off Headgear') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 0, 8, 0, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 0, 120, 0, 0)
					end
				elseif WarMenu.Button('Take off Mask') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 0)
					end
				elseif WarMenu.Button('Take off Glasses') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 1, 6, 0, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 1, 5, 0, 0)
					end
				elseif WarMenu.Button('Take off Earring') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 2, 33, 0, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 2, 19, 0, 0)
					end
				elseif WarMenu.Button('Take off Watch') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 6, 2, 0, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 6, 1, 0, 0)
					end
				elseif WarMenu.Button('Take off Wristband') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedPropIndex(GetPlayerPed(-1), 7, 8, 0, 0)
					else
						SetPedPropIndex(GetPlayerPed(-1), 7, 16, 0, 0)
					end
				elseif WarMenu.Button('Take off Top') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 15, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 15, 0, 0)
					end
				elseif WarMenu.Button('Take off Pants') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 4, 21, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 4, 15, 0, 0)
					end
				elseif WarMenu.Button('Take off Shoes') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 6, 34, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 6, 35, 0, 0)
					end
				elseif WarMenu.Button('Take off Belt') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 8, 34, 0, 0)
					end
				elseif WarMenu.Button('Take off Vest') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 9, 0, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 9, 0, 0, 0)
					end
				elseif WarMenu.Button('Take off Rank Insignia') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 10, 0, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 10, 0, 0, 0)
					end
				elseif WarMenu.Button('Take off Accessoires') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 0)
					end
				elseif WarMenu.Button('Take off Backpack') then
					SetPedComponentVariation(GetPlayerPed(-1), 5, 0,0,0)
				elseif WarMenu.MenuButton('Go back', 'AllgemeinCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('BCSOCloth') then
				if WarMenu.MenuButton('Tops', 'BCSOTops') then
				elseif WarMenu.MenuButton('Pants', 'BCSOHose') then
				elseif WarMenu.MenuButton('Shoes', 'BCSOShoes') then
				elseif WarMenu.MenuButton('Go back', 'Umkleide') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('BCSOTops') then
				if WarMenu.Button('Pullover') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 1, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 50, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 3, 3, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 43, 0, 0)
					end
				elseif WarMenu.Button('Shirt') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 11, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 26, 4, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 3, 14, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 250, 3, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'BCSOCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('BCSOHose') then
				if WarMenu.Button('Pants SO-Brown') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 4, 25, 6, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 4, 37, 6, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'BCSOCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('BCSOShoes') then
				if WarMenu.Button('Shoes BCSO') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 6, 10, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 6, 29, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'BCSOCloth') then
				end
			WarMenu.Display()

			elseif WarMenu.IsMenuOpened('SAPRCloth') then
				if WarMenu.MenuButton('Tops', 'SAPRTops') then
				elseif WarMenu.MenuButton('Pants', 'SAPRHose') then
				elseif WarMenu.MenuButton('Shoes', 'SAPRShoes') then
				elseif WarMenu.MenuButton('Go back', 'Umkleide') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('SAPRTops') then
				if WarMenu.Button('Pullover') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 1, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 50, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 3, 3, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 43, 0, 0)
					end
				elseif WarMenu.Button('Shirt') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 11, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 26, 1, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 3, 9, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 9, 3, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'SAPRCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('SAPRHose') then
				if WarMenu.Button('Pants PR-Black') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 4, 25, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 4, 37, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'SAPRCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('SAPRShoes') then
				if WarMenu.Button('Shoes SAPR') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 6, 12, 6, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 6, 52, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'SAPRCloth') then
				end
			WarMenu.Display()

			elseif WarMenu.IsMenuOpened('SASPCloth') then
				if WarMenu.MenuButton('Tops', 'SASPTops') then
				elseif WarMenu.MenuButton('Pants', 'SASPHose') then
				elseif WarMenu.MenuButton('Shoes', 'SASPShoes') then
				elseif WarMenu.MenuButton('Go back', 'Umkleide') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('SASPTops') then
				if WarMenu.Button('Pullover') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 1, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 50, 0, 0)  -- 9
					else
						SetPedComponentVariation(GetPlayerPed(-1), 3, 3, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 43, 0, 0)
					end
				elseif WarMenu.Button('Shirt') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 11, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 13, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 3, 9, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 9, 1, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'SASPCloth') then
				end
			WarMenu.Display()

			elseif WarMenu.IsMenuOpened('SASPHose') then
				if WarMenu.Button('Pants SP-Gray') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 4, 25, 1, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 4, 37, 1, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'SASPCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('SASPShoes') then
				if WarMenu.Button('Shoes SASP') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 6, 12, 6, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 6, 52, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'SASPCloth') then
				end
			WarMenu.Display()

			elseif WarMenu.IsMenuOpened('SWATCloth') then
				if WarMenu.MenuButton('Tops', 'SWATTops') then
				elseif WarMenu.MenuButton('Pants', 'SWATHose') then
				elseif WarMenu.MenuButton('Shoes', 'SWATShoes') then
				elseif WarMenu.MenuButton('Go back', 'Umkleide') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('SWATTops') then
				if WarMenu.Button('Pullover') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 1, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 50, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 3, 3, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 43, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'SWATCloth') then
				end
			WarMenu.Display()

			elseif WarMenu.IsMenuOpened('SWATHose') then
				if WarMenu.Button('SWAT Pants Armored') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 4, 34, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 4, 33, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'SWATCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('SWATShoes') then
				if WarMenu.Button('Shoes SWAT') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 6, 12, 6, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 6, 52, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'SWATCloth') then
				end
			WarMenu.Display()

			elseif WarMenu.IsMenuOpened('DPOSCloth') then
				if WarMenu.MenuButton('Tops', 'DPOSTops') then
				elseif WarMenu.MenuButton('Pants', 'DPOSHose') then
				elseif WarMenu.MenuButton('Shoes', 'DPOSShoes') then
				elseif WarMenu.MenuButton('Go back', 'Umkleide') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('DPOSTops') then
				if WarMenu.Button('DPOS-Shirt White') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 3, 14, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 68, 16, 0)
					end
				elseif WarMenu.Button('DPOS-Shirt Beige') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 11, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 3, 14, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 88, 0, 0) --49, 280, 286
					end
				elseif WarMenu.Button('DPOS-Shirt White Dirty') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 56, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 3, 14, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 68, 16, 0)
					end
				elseif WarMenu.Button('DPOS-Shirt Beige Dirty') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 97, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 3, 14, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 88, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'DPOSCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('DPOSHose') then
				if WarMenu.Button('Pants DPOS') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 4, 36, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'DPOSCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('DPOSShoes') then
				if WarMenu.Button('Shoes DPOS') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 6, 27, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 6, 26, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'DPOSCloth') then
				end
			WarMenu.Display()

			elseif WarMenu.IsMenuOpened('SheriffCloth') then
				if WarMenu.MenuButton('Tops', 'SheriffTops') then
				elseif WarMenu.MenuButton('Pants', 'SheriffHose') then
				elseif WarMenu.MenuButton('Shoes', 'SheriffShoes') then
				elseif WarMenu.MenuButton('Headgear', 'SheriffHead') then
				elseif WarMenu.MenuButton('Accessoires', 'SheriffAccess') then
				elseif WarMenu.MenuButton('Rank Insignia', 'SheriffDecals') then
				elseif WarMenu.MenuButton('Go back', 'Umkleide') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('SheriffTops') then
				if WarMenu.Button('Sheriff-Shirt') then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0)
						SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 11, 48, 0, 0)
					end
				elseif WarMenu.MenuButton('Go back', 'SheriffCloth') then
				end
			WarMenu.Display()

			elseif WarMenu.IsMenuOpened('SheriffHose') then
				if WarMenu.Button() then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then

					else

					end
				elseif WarMenu.MenuButton('Go back', 'SheriffCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('SheriffShoes') then
				if WarMenu.Button() then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then

					else

					end
				elseif WarMenu.MenuButton('Go back', 'SheriffCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('SheriffAccess') then --Mit Brillen
				if WarMenu.Button() then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then

					else

					end
				elseif WarMenu.MenuButton('Go back', 'SheriffCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('SheriffDecals') then
				if WarMenu.Button() then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then

					else

					end
				elseif WarMenu.MenuButton('Go back', 'SheriffCloth') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('SheriffHead') then
				if WarMenu.Button() then
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then

					else

					end
				elseif WarMenu.MenuButton('Go back', 'SheriffCloth') then
				end
			WarMenu.Display()

			elseif IsControlJustPressed(0, 51) and atcloth == true then -- e
				WarMenu.OpenMenu('Umkleide')
			end

			Wait(0)
		end
	end)
end


-- -- Heal
if ActivateHealMarkers then
	atheal = false

	CreateThread(function()
		while true do
			for i,coord in ipairs(list_heal_coords) do
				local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
				local distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
				if distance < 5 then
					atheal = true
					StartHelpNotify('Press ~INPUT_CONTEXT~ to heal yourself.', 500)
					Wait(40)
					while distance < 5 do
						HelpNotify('Press ~INPUT_CONTEXT~ to heal yourself.', 500)
						Wait(500)
						local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
						distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
					end
					EndHelpNotify('Press ~INPUT_CONTEXT~ to heal yourself.', 500)
					atheal = false
				end
			end
		Wait(0)
		end
	end)

	CreateThread(function()
		while true do
			if IsControlJustPressed(0, 51) and atheal == true then -- e
				SetEntityHealth(GetPlayerPed(-1), GetEntityMaxHealth(GetPlayerPed(-1)))
			end
		Wait(0)
		end
	end)
end

-- -- Vehicles
atgarage = false
location = nil
police = nil

CreateThread(function()
	while true do
		for n,list in ipairs(list_cars_coords) do
			for i,coord in ipairs(list) do
				local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
				local distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
				if distance < 5 then
					atgarage = true
					location = coord.handle
					for k,handleslist in ipairs(list_handles) do
						for m,handles in ipairs(handleslist) do
							if location == handles.handle then
								police = handles.name
							end
						end
					end
					StartHelpNotify('Press ~INPUT_CONTEXT~ to open the garage.', 500)
					Wait(40)
					while distance < 5 do
						HelpNotify('Press ~INPUT_CONTEXT~ to open the garage.', 500)
						Wait(500)
						local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
						distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
					end
					EndHelpNotify('Press ~INPUT_CONTEXT~ to open the garage.', 500)
					atgarage = false
					location = nil
					police = nil
				end
			end
		end
		Wait(0)
	end
end)

if ActivateLSPDGarage then
	if LSPDMegaPackT0y then
		CreateThread(function()

			WarMenu.CreateMenu('Garage LSPD', 'Garage LSPD')

			while true do
				if WarMenu.IsMenuOpened('Garage LSPD') then
					if WarMenu.Button('Ford Crown Victoria') then
						spawnCar('lspd2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford Interceptor') then
						spawnCar('lspd')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Dodge Charger') then
						spawnCar('lspd3')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford Crown Victoria Slicktop') then
						spawnCar('lspd6')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford Explorer') then
						spawnCar('lspd9')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Chevrolet Tahoe') then
						spawnCar('lspd8')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Chevrolet Silverado') then
						spawnCar('lspd11')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Declasse Burrito') then
						spawnCar('policet')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Vapid Stanier') then
						spawnCar('police4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Ford Crown Victoria') then
						spawnCar('lspd4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('WMC Sovereign') then
						spawnCar('policeb')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Vapid Bus') then
						spawnCar('pbus')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Exit') then
						WarMenu.CloseMenu()
					end

					WarMenu.Display()
				elseif IsControlJustPressed(0, 51) and atgarage == true and police == 'lspd' then -- e
					WarMenu.OpenMenu('Garage LSPD')
				end

				Wait(0)
			end
		end)
	elseif not BCSOMegaPackBradM then
		CreateThread(function()

			WarMenu.CreateMenu('Garage LSPD', 'Garage LSPD')

			while true do
				if WarMenu.IsMenuOpened('Garage LSPD') then
					if WarMenu.Button('Vapid Stanier') then
						spawnCar('police')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Bravado Buffalo') then
						spawnCar('police2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Vapid Interceptor') then
						spawnCar('police3')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Declasse Burrito') then
						spawnCar('policet')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Vapid Stanier') then
						spawnCar('police4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('WMC Sovereign') then
						spawnCar('policeb')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Vapid Bus') then
						spawnCar('pbus')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Exit') then
						WarMenu.CloseMenu()
					end

					WarMenu.Display()
				elseif IsControlJustPressed(0, 51) and atgarage == true and police == 'lspd' then -- e
					WarMenu.OpenMenu('Garage LSPD')
				end

				Wait(0)
			end
		end)
	else
		CreateThread(function()

			WarMenu.CreateMenu('Garage LSPD', 'Garage LSPD')

			while true do
				if WarMenu.IsMenuOpened('Garage LSPD') then
					if WarMenu.Button('Declasse Burrito') then
						spawnCar('policet')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Vapid Stanier') then
						spawnCar('police4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('WMC Sovereign') then
						spawnCar('policeb')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Vapid Bus') then
						spawnCar('pbus')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Exit') then
						WarMenu.CloseMenu()
					end

					WarMenu.Display()
				elseif IsControlJustPressed(0, 51) and atgarage == true and police == 'lspd' then -- e
					WarMenu.OpenMenu('Garage LSPD')
				end

				Wait(0)
			end
		end)
	end
end

if ActivateBCSOGarage then
	if BCSOMegaPackBradM and LSPDMegaPackT0y then
		CreateThread(function()

			WarMenu.CreateMenu('Garage BCSO', 'Garage BCSO')

			while true do
				if WarMenu.IsMenuOpened('Garage BCSO') then
					if WarMenu.Button('Ford Crown Victoria') then
						spawnCar('sheriff')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford Interceptor') then
						spawnCar('police3')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Chevrolet Impala') then
						spawnCar('police')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Dodge Charger') then
						spawnCar('police2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford Explorer') then
						spawnCar('fbi2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Chevrolet Tahoe') then
						spawnCar('sheriff2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Vapid Stanier') then
						spawnCar('police4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Ford Crown Victoria') then
						spawnCar('lspd4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('WMC Sovereign') then
						spawnCar('policeb')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Vapid Bus') then
						spawnCar('pbus')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Exit') then
						WarMenu.CloseMenu()
					end

					WarMenu.Display()
				elseif IsControlJustPressed(0, 51) and atgarage == true and police == 'bcso' then -- e
					WarMenu.OpenMenu('Garage BCSO')
				end

				Wait(0)
			end
		end)
	elseif BCSOMegaPackBradM then
		CreateThread(function()

			WarMenu.CreateMenu('Garage BCSO', 'Garage BCSO')

			while true do
				if WarMenu.IsMenuOpened('Garage BCSO') then
					if WarMenu.Button('Ford Crown Victoria') then
						spawnCar('sheriff')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford Interceptor') then
						spawnCar('police3')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Chevrolet Impala') then
						spawnCar('police')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Dodge Charger') then
						spawnCar('police2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford Explorer') then
						spawnCar('fbi2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Chevrolet Tahoe') then
						spawnCar('sheriff2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Vapid Stanier') then
						spawnCar('police4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('WMC Sovereign') then
						spawnCar('policeb')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Vapid Bus') then
						spawnCar('pbus')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Exit') then
						WarMenu.CloseMenu()
					end

					WarMenu.Display()
				elseif IsControlJustPressed(0, 51) and atgarage == true and police == 'bcso' then -- e
					WarMenu.OpenMenu('Garage BCSO')
				end

				Wait(0)
			end
		end)
	else
		CreateThread(function()

			WarMenu.CreateMenu('Garage BCSO', 'Garage BCSO')

			while true do
				if WarMenu.IsMenuOpened('Garage BCSO') then
					if WarMenu.Button('Vapid Stanier') then
						spawnCar('sheriff')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Declasse Granger') then
						spawnCar('sheriff2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Vapid Stanier') then
						spawnCar('police4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('WMC Sovereign') then
						spawnCar('policeb')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Vapid Bus') then
						spawnCar('pbus')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Exit') then
						WarMenu.CloseMenu()
					end

					WarMenu.Display()
				elseif IsControlJustPressed(0, 51) and atgarage == true and police == 'bcso' then -- e
					WarMenu.OpenMenu('Garage BCSO')
				end

				Wait(0)
			end
		end)
	end
end

if ActivateSAPRGarage then
	CreateThread(function()

		WarMenu.CreateMenu('Garage SAPR', 'Garage SAPR')

		while true do
			if WarMenu.IsMenuOpened('Garage SAPR') then
				if WarMenu.Button('Declasse Granger') then
					spawnCar('pranger')
					WarMenu.CloseMenu()
				elseif WarMenu.Button('Exit') then
					WarMenu.CloseMenu()
				end

				WarMenu.Display()
			elseif IsControlJustPressed(0, 51) and atgarage == true and police == 'sapr' then -- e
				WarMenu.OpenMenu('Garage SAPR')
			end

			Wait(0)
		end
	end)
end

if ActivateSASPGarage then
	if CHFThehurk and LSPDMegaPackT0y then
		CreateThread(function()

			WarMenu.CreateMenu('Garage SASP', 'Garage SASP')

			while true do
				if WarMenu.IsMenuOpened('Garage SASP') then
					if WarMenu.Button('Ford Crown Victoria') then
						spawnCar('hwaycar5')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Dodge Charger') then
						spawnCar('hwaycar13')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford Explorer') then
						spawnCar('hwaycar15')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Chevrolet Tahoe') then
						spawnCar('hwaycar12')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford Crown Victoria Slicktop') then
						spawnCar('hwaycar3')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Dodge Charger Slicktop') then
						spawnCar('hwaycar14')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Vapid Stanier') then
						spawnCar('police4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Ford Crown Victoria') then
						spawnCar('lspd4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('BMW 1200RT') then
						spawnCar('hwaycar7')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('K9 Ford Crown Victoria') then
						spawnCar('hwaycar6')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('K9 Ford Crown Victoria Slicktop') then
						spawnCar('hwaycar4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford Expedition') then
						spawnCar('hwaycar8')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford F350') then
						spawnCar('hwaycar11')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Dodge Charger White') then
						spawnCar('hwaycar2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford Explorer White') then
						spawnCar('hwaycar16')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Vapid Bus') then
						spawnCar('pbus')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Exit') then
						WarMenu.CloseMenu()
					end

					WarMenu.Display()
				elseif IsControlJustPressed(0, 51) and atgarage == true and police == 'sasp' then -- e
					WarMenu.OpenMenu('Garage SASP')
				end

				Wait(0)
			end
		end)
	elseif CHFThehurk then
		CreateThread(function()

			WarMenu.CreateMenu('Garage SASP', 'Garage SASP')

			while true do
				if WarMenu.IsMenuOpened('Garage SASP') then
					if WarMenu.Button('Ford Crown Victoria') then
						spawnCar('hwaycar5')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Dodge Charger') then
						spawnCar('hwaycar13')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford Explorer') then
						spawnCar('hwaycar15')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Chevrolet Tahoe') then
						spawnCar('hwaycar12')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford Crown Victoria Slicktop') then
						spawnCar('hwaycar3')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Dodge Charger Slicktop') then
						spawnCar('hwaycar14')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Vapid Stanier') then
						spawnCar('police4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('BMW 1200RT') then
						spawnCar('hwaycar7')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('K9 Ford Crown Victoria') then
						spawnCar('hwaycar6')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('K9 Ford Crown Victoria Slicktop') then
						spawnCar('hwaycar4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford Expedition') then
						spawnCar('hwaycar8')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford F350') then
						spawnCar('hwaycar11')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Dodge Charger White') then
						spawnCar('hwaycar2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Ford Explorer White') then
						spawnCar('hwaycar16')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Vapid Bus') then
						spawnCar('pbus')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Exit') then
						WarMenu.CloseMenu()
					end

					WarMenu.Display()
				elseif IsControlJustPressed(0, 51) and atgarage == true and police == 'sasp' then -- e
					WarMenu.OpenMenu('Garage SASP')
				end

				Wait(0)
			end
		end)
	else
		CreateThread(function()

			WarMenu.CreateMenu('Garage SASP', 'Garage SASP')

			while true do
				if WarMenu.IsMenuOpened('Garage SASP') then
					if WarMenu.Button('Vapid Stanier') then
						spawnCar('police')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Bravado Buffalo') then
						spawnCar('police2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Vapid Interceptor') then
						spawnCar('police3')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Declasse Burrito') then
						spawnCar('policet')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Vapid Stanier') then
						spawnCar('police4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('WMC Sovereign') then
						spawnCar('policeb')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Vapid Bus') then
						spawnCar('pbus')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Exit') then
						WarMenu.CloseMenu()
					end

					WarMenu.Display()
				elseif IsControlJustPressed(0, 51) and atgarage == true and police == 'sasp' then -- e
					WarMenu.OpenMenu('Garage SASP')
				end

				Wait(0)
			end
		end)
	end
end

if ActivateSWATGarage then
	if LSPDMegaPackT0y then
		CreateThread(function()

			WarMenu.CreateMenu('Garage SWAT', 'Garage SWAT')

			while true do
				if WarMenu.IsMenuOpened('Garage SWAT') then
					if WarMenu.Button('UC Vapid Stanier') then
						spawnCar('police4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Vapid Buffalo') then
						spawnCar('fbi')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Ford Crown Victoria') then
						spawnCar('lspd4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Declasse Burrito') then
						spawnCar('policet')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Riot Van') then
						spawnCar('riot')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Riot Control Van') then
						spawnCar('riot2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Exit') then
						WarMenu.CloseMenu()
					end

					WarMenu.Display()
				elseif IsControlJustPressed(0, 51) and atgarage == true and police == 'swat' then -- e
					WarMenu.OpenMenu('Garage SWAT')
				end

				Wait(0)
			end
		end)
	else
		CreateThread(function()

			WarMenu.CreateMenu('Garage SWAT', 'Garage SWAT')

			while true do
				if WarMenu.IsMenuOpened('Garage SWAT') then
					if WarMenu.Button('UC Vapid Stanier') then
						spawnCar('police4')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Vapid Buffalo') then
						spawnCar('fbi')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('UC Declasse Granger') then
						spawnCar('fbi2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Declasse Burrito') then
						spawnCar('policet')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Riot Van') then
						spawnCar('riot')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Riot Control Van') then
						spawnCar('riot2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Exit') then
						WarMenu.CloseMenu()
					end

					WarMenu.Display()
				elseif IsControlJustPressed(0, 51) and atgarage == true and police == 'swat' then -- e
					WarMenu.OpenMenu('Garage SWAT')
				end

				Wait(0)
			end
		end)
	end
end

if ActivateDPOSGarage then
	if LSPDMegaPackT0y then
		CreateThread(function()

			WarMenu.CreateMenu('Garage DPOS', 'Garage DPOS')

			while true do
				if WarMenu.IsMenuOpened('Garage DPOS') then
					if WarMenu.Button('Ford Crown Victoria') then
						spawnCar('lspd5')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Chevrolet Silverado Auxiliary') then
						spawnCar('lspd10')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Chevrolet Silverado Maintenance') then
						spawnCar('lspd12')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Vapid Slamvan') then
						spawnCar('towtruck2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Vapid Yankee') then
						spawnCar('towtruck')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('MTL Packer Flatbed') then
						spawnCar('flatbed')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('MTL Packer') then
						spawnCar('packer')
					elseif WarMenu.Button('Exit') then
						WarMenu.CloseMenu()
					end

					WarMenu.Display()
				elseif IsControlJustPressed(0, 51) and atgarage == true and police == 'dpos' then -- e
					WarMenu.OpenMenu('Garage DPOS')
				end

				Wait(0)
			end
		end)
	else
		CreateThread(function()

			WarMenu.CreateMenu('Garage DPOS', 'Garage DPOS')

			while true do
				if WarMenu.IsMenuOpened('Garage DPOS') then
					if WarMenu.Button('Vapid Slamvan') then
						spawnCar('towtruck2')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('Vapid Yankee') then
						spawnCar('towtruck')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('MTL Packer Flatbed') then
						spawnCar('flatbed')
						WarMenu.CloseMenu()
					elseif WarMenu.Button('MTL Packer') then
						spawnCar('packer')
					elseif WarMenu.Button('Exit') then
						WarMenu.CloseMenu()
					end

					WarMenu.Display()
				elseif IsControlJustPressed(0, 51) and atgarage == true and police == 'dpos' then -- e
					WarMenu.OpenMenu('Garage DPOS')
				end

				Wait(0)
			end
		end)
	end
end

if ActivateHeliPads then
	CreateThread(function()

		WarMenu.CreateMenu('Garage Heli', 'Helipad')

		while true do
			if WarMenu.IsMenuOpened('Garage Heli') then
				if WarMenu.Button('WC Maverick') then
					spawnCar('polmav')
					WarMenu.CloseMenu()
				elseif WarMenu.Button('Exit') then
					WarMenu.CloseMenu()
				end

				WarMenu.Display()
			elseif IsControlJustPressed(0, 51) and atgarage == true and police == 'heli' then -- e
				WarMenu.OpenMenu('Garage Heli')
			end

			Wait(0)
		end
	end)
end

function spawnCar(carname)
    local car = GetHashKey(carname)
	local isspawned = false

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(50)
    end

	for n,list in ipairs(list_spawns) do
		for i,coord in ipairs(list) do
			if location == coord.handle then
				if IsAnyVehicleNearPoint(coord.x, coord.y, coord.z, 5.0) then
					Notify('Please remove the vehicle that is blocking the spawn point.')
				else
					local vehicle = CreateVehicle(car, coord.x, coord.y, coord.z, coord.angle, true, false)
					SetVehicleNeonLightEnabled(vehicle, 2, true)
					SetVehicleLivery(vehicle, 0)
					if LSPDMegaPackT0y and BCSOMegaPackBradM then
						if carname == 'lspd2' or carname == 'sheriff' or carname == 'police3' or carname == 'police' or carname == 'police2' or carname == 'sheriff2' then
							number = math.random(1,3) - 1
							SetVehicleLivery(vehicle, number)
						elseif carname == 'lspd3' then
							SetVehicleLivery(vehicle, 1)
						elseif carname == 'lspd6' or carname == 'lspd11' then
							SetVehicleLivery(vehicle, math.random(0, 1))
						end
					elseif BCSOMegaPackBradM then
						if carname == 'sheriff' or carname == 'police3' or carname == 'police' or carname == 'police2' or carname == 'sheriff2' then
							number = math.random(1,3) - 1
							SetVehicleLivery(vehicle, number)
						end
					elseif LSPDMegaPackT0y then
						if carname == 'lspd2' then
							number = math.random(1,3) - 1
							SetVehicleLivery(vehicle, number)
						elseif carname == 'lspd3' then
							SetVehicleLivery(vehicle, 1)
						elseif carname == 'lspd6' or carname == 'lspd11' then
							SetVehicleLivery(vehicle, math.random(0, 1))
						end
					else
						if carname == 'police' then
							number = math.random(1,6) - 1
							SetVehicleLivery(vehicle, number)
						elseif carname == 'police2' or carname == 'police3' then
							number = math.random(1,8) - 1
							SetVehicleLivery(vehicle, number)
						elseif carname == 'sheriff' or carname == 'sheriff2' then
							number = math.random(1,4) - 1
							SetVehicleLivery(vehicle, number)
						end
					end
					if carname == 'towtruck2' or carname == 'towtruck' or carname == 'flatbed' or carname == 'packer' then
						SetVehicleColours(vehicle, 38, 0)
					end

				end
				isspawned = true
			end
		end
	end

	if not isspawned then
		Notify("Vehicle couldn't be spawned.")
	else
		isspawned = false
	end

	SetEntityAsNoLongerNeeded(vehicle)
	SetModelAsNoLongerNeeded(vehicleName)
end


-- -- Weapons
if ActivateWeaponMarkers then
	atweapon = false

	CreateThread(function()
		while true do
			for i,coord in ipairs(list_weap_coords) do
				local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
				local distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
				if distance < 5 then
					atweapon = true
					StartHelpNotify('Press ~INPUT_CONTEXT~ to open the armory.', 500)
					Wait(40)
					while distance < 5 do
						HelpNotify('Press ~INPUT_CONTEXT~ to open the armory.', 500)
						Wait(500)
						local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
						distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
					end
					EndHelpNotify('Press ~INPUT_CONTEXT~ to open the armory.', 500)
					atweapon = false
				end
			end
		Wait(0)
		end
	end)

	CreateThread(function()

		local coordx, coordy, coordz = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))

		WarMenu.CreateMenu('Waffenkammer', 'Armory')
		WarMenu.CreateSubMenu('Standard', 'Waffenkammer', 'Standard Loadout')
		WarMenu.CreateSubMenu('LSPD', 'Waffenkammer', 'LSPD-Bewaffnung')
		WarMenu.CreateSubMenu('BCSO', 'Waffenkammer', 'BCSO-Bewaffnung')
		WarMenu.CreateSubMenu('SAPR', 'Waffenkammer', 'SAPR-Bewaffnung')
		WarMenu.CreateSubMenu('SASP', 'Waffenkammer', 'SASP-Bewaffnung')
		WarMenu.CreateSubMenu('SWAT', 'Waffenkammer', 'SWAT-Bewaffnung')
		WarMenu.CreateSubMenu('Sheriff', 'Waffenkammer', 'Sheriff-Bewaffnung')

		while true do
			if WarMenu.IsMenuOpened('Waffenkammer') then
				if WarMenu.MenuButton('Standard', 'Standard') then
				elseif WarMenu.MenuButton('LSPD', 'LSPD') then
				elseif WarMenu.MenuButton('BCSO', 'BCSO') then
				elseif WarMenu.MenuButton('SAPR', 'SAPR') then
				elseif WarMenu.MenuButton('SASP', 'SASP') then
				elseif WarMenu.MenuButton('SWAT', 'SWAT') then
				--elseif WarMenu.MenuButton('Sheriff', 'Sheriff') then
				elseif WarMenu.Button('Exit') then
					WarMenu.CloseMenu()
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('Standard') then
				if WarMenu.Button('Baton') then
					GiveWeaponToPed(GetPlayerPed(-1),0x678B81B1, 1, false, true)
				elseif WarMenu.Button('Flashlight') then
					GiveWeaponToPed(GetPlayerPed(-1), 0x8BB05FD7, 1, false, true)
				elseif WarMenu.Button('Flare') then
					GiveWeaponToPed(GetPlayerPed(-1), 0x497FACC3, 10, false, true)
				elseif WarMenu.Button('Tazer') then
					GiveWeaponToPed(GetPlayerPed(-1), 0x3656C8C1, 1, false, true)
				elseif WarMenu.Button('Bulletproof Vest') then
					SetPedArmour(GetPlayerPed(-1), 100)
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 9, 15, 2, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 9, 17, 2, 0)
					end
				elseif WarMenu.Button('Stabproof Vest') then
					SetPedArmour(GetPlayerPed(-1), 100)
					if GetEntityModel(GetPlayerPed(-1)) == GetHashKey('mp_m_freemode_01') then
						SetPedComponentVariation(GetPlayerPed(-1), 9, 4, 1, 0)
					else
						SetPedComponentVariation(GetPlayerPed(-1), 9, 3, 1, 0)
					end
				elseif WarMenu.Button('Underarmor Vest') then
					SetPedArmour(GetPlayerPed(-1), 75)
					SetPedComponentVariation(GetPlayerPed(-1), 9, 0, 0, 0)
				elseif WarMenu.MenuButton('Go back', 'Waffenkammer') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('LSPD') then
				if WarMenu.Button('Pistol') then --Mk2 + Licht
					GiveWeaponToPed(GetPlayerPed(-1), 0xBFE256D4, 120, false, true)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0xBFE256D4, 0x43FD595B)
				elseif WarMenu.Button('Submachine gun') then --MP
					GiveWeaponToPed(GetPlayerPed(-1), 0x2BE6766B, 300, false, true)
				elseif WarMenu.Button('Shotgun') then --Pump-Action-Schrotfline + Licht
					GiveWeaponToPed(GetPlayerPed(-1), 0x1D073A89, 80, false, true)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x1D073A89, 0x7BC4CDDC)
				elseif WarMenu.MenuButton('Go back', 'Waffenkammer') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('BCSO') then
				if WarMenu.Button('Pistol') then --Mk1 + Licht
					GiveWeaponToPed(GetPlayerPed(-1), 0x1B06D571, 120, false, true)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x1B06D571, 0x359B7AAE)
				elseif WarMenu.Button('Submachine gun') then --MP
					GiveWeaponToPed(GetPlayerPed(-1), 0x2BE6766B, 300, false, true)
				elseif WarMenu.Button('Shotgun') then --Pump-Action-Schrotflinte + Licht
					GiveWeaponToPed(GetPlayerPed(-1), 0x1D073A89, 80, false, true)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x1D073A89, 0x7BC4CDDC)
				elseif WarMenu.Button('Flare gun') then
					GiveWeaponToPed(GetPlayerPed(-1), 0x47757124, 20, false, true)
				elseif WarMenu.MenuButton('Go back', 'Waffenkammer') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('SAPR') then
				if WarMenu.Button('Pistol') then --Combat Pistol + Licht
					GiveWeaponToPed(GetPlayerPed(-1), 0x5EF9FEC4, 120, false, true)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x5EF9FEC4, 0x359B7AAE)
				elseif WarMenu.Button('Flare gun') then
					GiveWeaponToPed(GetPlayerPed(-1), 0x47757124, 20, false, true)
				elseif WarMenu.MenuButton('Go back', 'Waffenkammer') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('SASP') then
				if WarMenu.Button('Pistol') then --Kal.50 + Licht
					GiveWeaponToPed(GetPlayerPed(-1), 0x99AEEB3B, 90, false, true)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x99AEEB3B, 0x359B7AAE)
				elseif WarMenu.Button('Submachine gun') then --MP
					GiveWeaponToPed(GetPlayerPed(-1), 0x2BE6766B, 300, false, true)
				elseif WarMenu.Button('Shotgun') then --Pump-Action-Schrotflinte + Licht
					GiveWeaponToPed(GetPlayerPed(-1), 0x1D073A89, 80, false, true)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x1D073A89, 0x7BC4CDDC)
				elseif WarMenu.MenuButton('Go back', 'Waffenkammer') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('SWAT') then
				if WarMenu.Button('Pistol') then --Schwere Pistole + Licht
					GiveWeaponToPed(GetPlayerPed(-1), 0xD205520E, 180, false, true)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0xD205520E, 0x359B7AAE)
				elseif WarMenu.Button('Submachine gun') then --MP + Taktisches Licht + Schalldämpfer + Zielfernrohr
					GiveWeaponToPed(GetPlayerPed(-1), 0x2BE6766B, 300, false, true)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x2BE6766B, 0x7BC4CDDC)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x2BE6766B, 0xC304849A)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x2BE6766B, 0x3CC6BA57)
				elseif WarMenu.Button('Carbine') then --Karabiner + Griff + Taktisches Licht + Zielfernrohr
					GiveWeaponToPed(GetPlayerPed(-1), 0x83BF0278, 300, false, true)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x83BF0278, 0xC164F53)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x83BF0278, 0x7BC4CDDC)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x83BF0278, 0xA0D89C42)
				elseif WarMenu.Button('Special Carbine') then --Spezialkarabiner + Griff + Taktisches Licht + Zielfernrohr
					GiveWeaponToPed(GetPlayerPed(-1), 0xC0A3098D, 300, false, true)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0xC0A3098D, 0xC164F53)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0xC0A3098D, 0x7BC4CDDC)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0xC0A3098D, 0xA0D89C42)
				elseif WarMenu.Button('Shotgun') then --Schwere Schrotflinte + Griff + Taktisches Licht + Trommelmagazin
					GiveWeaponToPed(GetPlayerPed(-1), 0x3AABBBAA, 300, false, true)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x3AABBBAA, 0xC164F53)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x3AABBBAA, 0x7BC4CDDC)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x3AABBBAA, 0x88C7DA53)
					elseif WarMenu.Button('Sniper rifle') then --Scharfschützengewehr + Verbessertes Zielfernrohr
					GiveWeaponToPed(GetPlayerPed(-1), 0x05FC3C11, 100, false, true)
					GiveWeaponComponentToPed(GetPlayerPed(-1), 0x05FC3C11, 0xBC54DA77)
				elseif WarMenu.Button('Tear gas') then
					GiveWeaponToPed(GetPlayerPed(-1), 0xFDBC8A50, 5, false, true)
				elseif WarMenu.MenuButton('Go back', 'Waffenkammer') then
				end
			WarMenu.Display()
			elseif WarMenu.IsMenuOpened('Sheriff') then
				if WarMenu.Button('Precision Pistol') then
					GiveWeaponToPed(GetPlayerPed(-1), 0xDC4DB296, 20, false, true)
				elseif WarMenu.Button('Revolver') then
					GiveWeaponToPed(GetPlayerPed(-1), 0xC1B3C3D1, 18, false, true)
				elseif WarMenu.Button('Heavy Revolver') then
					GiveWeaponToPed(GetPlayerPed(-1), 0xCB96392F, 18, false, true)
				elseif WarMenu.Button('Double Action Revolver') then
					GiveWeaponToPed(GetPlayerPed(-1), 0x97EA20B8, 18, false, true)
				elseif WarMenu.Button('Musket') then
					GiveWeaponToPed(GetPlayerPed(-1), 0xA89CB99E, 30, false, true)
				elseif WarMenu.Button('Double Barrel Shotgun') then
					GiveWeaponToPed(GetPlayerPed(-1), 0xEF951FBB, 20, false, true)
				elseif WarMenu.Button('Broken Bottle') then
					GiveWeaponToPed(GetPlayerPed(-1), 0xF9E6AA4B, 1, false, true)
				elseif WarMenu.Button('Pool Cue') then
					GiveWeaponToPed(GetPlayerPed(-1), 0x94117305, 1, false, true)
				elseif WarMenu.Button('Molotov Cocktail') then
					GiveWeaponToPed(GetPlayerPed(-1), 0x24B17070, 3, false, true)
				elseif WarMenu.MenuButton('Go back', 'Waffenkammer') then
				end

			WarMenu.Display()
			elseif IsControlJustPressed(0, 51) and atweapon == true then -- e
				WarMenu.OpenMenu('Waffenkammer')
			end

			Wait(0)
		end
	end)
end

-- -- Evidence
if ActivateEvidenceMarkers then
	atevidence = false

	CreateThread(function()
		while true do
			for i,coord in ipairs(list_evidence_coords) do
				local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
				local distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
				if distance < 5 then
					atevidence = true
					StartHelpNotify('Press ~INPUT_CONTEXT~ to submit evidence.', 500)
					Wait(40)
					while distance < 5 do
						HelpNotify('Press ~INPUT_CONTEXT~ to submit evidence.', 500)
						Wait(500)
						local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
						distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
					end
					EndHelpNotify('Press ~INPUT_CONTEXT~ to submit evidence.', 500)
					atevidence = false
				end
			end
		Wait(0)
		end
	end)

	CreateThread(function()
		while true do
			if IsControlJustPressed(0, 51) and atevidence == true then -- e
				local NoItems = #ClientItemsList
				ClientItemsList = {}
				BeginTextCommandThefeedPost("TWOSTRINGS")
				AddTextComponentSubstringPlayerName("You brought ~y~" .. NoItems .. "~s~ confiscated items to the evidence chamber.")
				EndTextCommandThefeedPostMessagetext("CHAR_CALL911", "CHAR_CALL911", false, 4, "Evidence report", "")
				EndTextCommandThefeedPostTicker(false, false)
			end
		Wait(0)
		end
	end)
end

-- -- Help
if ActivateHelpMarkers then
	athelp = false

	CreateThread(function()
		while true do
			for i,coord in ipairs(list_tut_coords) do
				local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
				local distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
				if distance < 5 then
					athelp = true
					StartHelpNotify('Press ~INPUT_CONTEXT~ to display the controls.', 500)
					Wait(40)
					while distance < 5 do
						HelpNotify('Press ~INPUT_CONTEXT~ to display the controls.', 500)
						Wait(500)
						local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
						distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
					end
					EndHelpNotify('Press ~INPUT_CONTEXT~ to display the controls.', 500)
					athelp = false
				end
			end
		Wait(0)
		end
	end)

	CreateThread(function()
		while true do
			if IsControlJustPressed(0, 51) and athelp == true then -- e

				if ActivateCrosshair then
					BeginTextCommandThefeedPost("TWOSTRINGS")
					AddTextComponentSubstringPlayerName("Press ~b~F3~s~ to display a point. This helps you determine what you are looking at.")
					EndTextCommandThefeedPostTicker(false, false)
				end

				BeginTextCommandThefeedPost("TWOSTRINGS")
				AddTextComponentSubstringPlayerName("Press ~g~E~s~ while looking at a ped to talk to them.")
				EndTextCommandThefeedPostTicker(false, false)

				BeginTextCommandThefeedPost("TWOSTRINGS")
				AddTextComponentSubstringPlayerName("Hold ~r~X~s~ to see what actions you can perform. Move your mouse on a tile and release X")
				AddTextComponentSubstringPlayerName("to carry it out. Make sure you are looking at the right person informed them of your action!")
				EndTextCommandThefeedPostTicker(false, false)

				BeginTextCommandThefeedPost("TWOSTRINGS")
				AddTextComponentSubstringPlayerName("Type ~o~/tp~s~ in the chat to open the teleporting menu.")
				EndTextCommandThefeedPostTicker(false, false)
			end
		Wait(0)
		end
	end)
end
