-- thread to determine the player position and select only close markers to draw
local list_show_arrest_coords = {}
local list_show_cloth_coords = {}
local list_show_heal_coords = {}
local list_show_cars_coords = {}
local list_show_weap_coords = {}
local list_show_evidence_coords = {}
local list_show_help_coords = {}

CreateThread(function()
	local range = 40000.0

	if not ActivateArrestMarkers then
		list_arrest_coords = {}
	end

	if not ActivateClothMarkers then
		list_cloth_coords = {}
	end

	if not ActivateHealMarkers then
		list_heal_coords = {}
	end

	if not ActivateGarages then
		list_cars_coords = {}
	end

	if not ActivateWeaponMarkers then
		list_weap_coords = {}
	end

	if not ActivateEvidenceMarkers then
		list_evidence_coords = {}
	end

	if not ActivateHelpMarkers then
		list_help_coords = {}
	end

	while true do
		list_show_arrest_coords = {}
		list_show_cloth_coords = {}
		list_show_heal_coords = {}
		list_show_cars_coords = {}
		list_show_weap_coords = {}
		list_show_evidence_coords = {}
		list_show_help_coords = {}
		local playerped = GetPlayerPed(-1)
		local plc = GetEntityCoords(playerped, true)
		for i, coord in ipairs(list_arrest_coords) do
			if Vdist2(plc.x, plc.y, plc.z, coord.x, coord.y, coord.z) < range then
				table.insert(list_show_arrest_coords, coord)
			end
		end
		for i, coord in ipairs(list_cloth_coords) do
			if Vdist2(plc.x, plc.y, plc.z, coord.x, coord.y, coord.z) < range then
				table.insert(list_show_cloth_coords, coord)
			end
		end
		for i, coord in ipairs(list_heal_coords) do
			if Vdist2(plc.x, plc.y, plc.z, coord.x, coord.y, coord.z) < range then
				table.insert(list_show_heal_coords, coord)
			end
		end
		for i, coord in ipairs(list_cars_coords) do
			if Vdist2(plc.x, plc.y, plc.z, coord.x, coord.y, coord.z) < range then
				table.insert(list_show_cars_coords, coord)
			end
		end
		for i, coord in ipairs(list_weap_coords) do
			if Vdist2(plc.x, plc.y, plc.z, coord.x, coord.y, coord.z) < range then
				table.insert(list_show_weap_coords, coord)
			end
		end
		for i, coord in ipairs(list_evidence_coords) do
			if Vdist2(plc.x, plc.y, plc.z, coord.x, coord.y, coord.z) < range then
				table.insert(list_show_evidence_coords, coord)
			end
		end
		for i, coord in ipairs(list_help_coords) do
			if Vdist2(plc.x, plc.y, plc.z, coord.x, coord.y, coord.z) < range then
				table.insert(list_show_help_coords, coord)
			end
		end
		Wait(5000)
	end
end)


-- thread to draw the markers on the map
CreateThread(function()
	while true do
		for i,coord in ipairs(list_show_arrest_coords) do
			DrawMarker(var_arrest_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_arrest_scaleX, var_arrest_scaleY, var_arrest_scaleZ, var_arrest_red, var_arrest_green, var_arrest_blue, var_arrest_alpha, var_arrest_bob, var_arrest_face, var_arrest_p19, var_arrest_rotate, var_arrest_textdict, var_arrest_textname, var_arrest_drawonent)
		end
		for i,coord in ipairs(list_show_cloth_coords) do
			if list_handles[coord.handle][1].handles[coord.handle].name == 'lspd' then
				DrawMarker(var_cloth_lspd_symbol, coord.x, coord.y, coord.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cloth_lspd_scaleX, var_cloth_lspd_scaleY, var_cloth_lspd_scaleZ, var_cloth_lspd_red, var_cloth_lspd_green, var_cloth_lspd_blue, var_cloth_lspd_alpha, var_cloth_lspd_bob, var_cloth_lspd_face, var_cloth_lspd_p19, var_cloth_lspd_rotate, var_cloth_lspd_textdict, var_cloth_lspd_textname, var_cloth_lspd_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name == 'bcso' then
				DrawMarker(var_cloth_bcso_symbol, coord.x, coord.y, coord.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cloth_bcso_scaleX, var_cloth_bcso_scaleY, var_cloth_bcso_scaleZ, var_cloth_bcso_red, var_cloth_bcso_green, var_cloth_bcso_blue, var_cloth_bcso_alpha, var_cloth_bcso_bob, var_cloth_bcso_face, var_cloth_bcso_p19, var_cloth_bcso_rotate, var_cloth_bcso_textdict, var_cloth_bcso_textname, var_cloth_bcso_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name == 'sasp' then
				DrawMarker(var_cloth_sasp_symbol, coord.x, coord.y, coord.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cloth_sasp_scaleX, var_cloth_sasp_scaleY, var_cloth_sasp_scaleZ, var_cloth_sasp_red, var_cloth_sasp_green, var_cloth_sasp_blue, var_cloth_sasp_alpha, var_cloth_sasp_bob, var_cloth_sasp_face, var_cloth_sasp_p19, var_cloth_sasp_rotate, var_cloth_sasp_textdict, var_cloth_sasp_textname, var_cloth_sasp_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name == 'sapr' then
				DrawMarker(var_cloth_sapr_symbol, coord.x, coord.y, coord.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cloth_sapr_scaleX, var_cloth_sapr_scaleY, var_cloth_sapr_scaleZ, var_cloth_sapr_red, var_cloth_sapr_green, var_cloth_sapr_blue, var_cloth_sapr_alpha, var_cloth_sapr_bob, var_cloth_sapr_face, var_cloth_sapr_p19, var_cloth_sapr_rotate, var_cloth_sapr_textdict, var_cloth_sapr_textname, var_cloth_sapr_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name == 'swat' then
				DrawMarker(var_cloth_swat_symbol, coord.x, coord.y, coord.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cloth_swat_scaleX, var_cloth_swat_scaleY, var_cloth_swat_scaleZ, var_cloth_swat_red, var_cloth_swat_green, var_cloth_swat_blue, var_cloth_swat_alpha, var_cloth_swat_bob, var_cloth_swat_face, var_cloth_swat_p19, var_cloth_swat_rotate, var_cloth_swat_textdict, var_cloth_swat_textname, var_cloth_swat_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name == 'dpos' then
				DrawMarker(var_cloth_dpos_symbol, coord.x, coord.y, coord.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cloth_dpos_scaleX, var_cloth_dpos_scaleY, var_cloth_dpos_scaleZ, var_cloth_dpos_red, var_cloth_dpos_green, var_cloth_dpos_blue, var_cloth_dpos_alpha, var_cloth_dpos_bob, var_cloth_dpos_face, var_cloth_dpos_p19, var_cloth_dpos_rotate, var_cloth_dpos_textdict, var_cloth_dpos_textname, var_cloth_dpos_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name == 'lsfd' then
				DrawMarker(var_cloth_lsfd_symbol, coord.x, coord.y, coord.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cloth_lsfd_scaleX, var_cloth_lsfd_scaleY, var_cloth_lsfd_scaleZ, var_cloth_lsfd_red, var_cloth_lsfd_green, var_cloth_lsfd_blue, var_cloth_lsfd_alpha, var_cloth_lsfd_bob, var_cloth_lsfd_face, var_cloth_lsfd_p19, var_cloth_lsfd_rotate, var_cloth_lsfd_textdict, var_cloth_lsfd_textname, var_cloth_lsfd_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name == 'bcfd' then
				DrawMarker(var_cloth_bcfd_symbol, coord.x, coord.y, coord.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cloth_bcfd_scaleX, var_cloth_bcfd_scaleY, var_cloth_bcfd_scaleZ, var_cloth_bcfd_red, var_cloth_bcfd_green, var_cloth_bcfd_blue, var_cloth_bcfd_alpha, var_cloth_bcfd_bob, var_cloth_bcfd_face, var_cloth_bcfd_p19, var_cloth_bcfd_rotate, var_cloth_bcfd_textdict, var_cloth_bcfd_textname, var_cloth_bcfd_drawonent)
			end
		end
		for i,coord in ipairs(list_show_heal_coords) do
			DrawMarker(var_heal_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_heal_scaleX, var_heal_scaleY, var_heal_scaleZ, var_heal_red, var_heal_green, var_heal_blue, var_heal_alpha, var_heal_bob, var_heal_face, var_heal_p19, var_heal_rotate, var_heal_textdict, var_heal_textname, var_heal_drawonent)
		end
		for i, coord in ipairs(list_show_cars_coords) do
			if list_handles[coord.handle][1].handles[coord.handle].name == 'lspd' then
				DrawMarker(var_cars_city_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_city_scaleX, var_cars_city_scaleY, var_cars_city_scaleZ, var_cars_city_red, var_cars_city_green, var_cars_city_blue, var_cars_city_alpha, var_cars_city_bob, var_cars_city_face, var_cars_city_p19, var_cars_city_rotate, var_cars_city_textdict, var_cars_city_textname, var_cars_city_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name == 'bcso' then
				DrawMarker(var_cars_bcso_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_bcso_scaleX, var_cars_bcso_scaleY, var_cars_bcso_scaleZ, var_cars_bcso_red, var_cars_bcso_green, var_cars_bcso_blue, var_cars_bcso_alpha, var_cars_bcso_bob, var_cars_bcso_face, var_cars_bcso_p19, var_cars_bcso_rotate, var_cars_bcso_textdict, var_cars_bcso_textname, var_cars_bcso_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name == 'sapr' then
				DrawMarker(var_cars_sapr_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_sapr_scaleX, var_cars_sapr_scaleY, var_cars_sapr_scaleZ, var_cars_sapr_red, var_cars_sapr_green, var_cars_sapr_blue, var_cars_sapr_alpha, var_cars_sapr_bob, var_cars_sapr_face, var_cars_sapr_p19, var_cars_sapr_rotate, var_cars_sapr_textdict, var_cars_sapr_textname, var_cars_sapr_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name == 'sasp' then
				DrawMarker(var_cars_sasp_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_sasp_scaleX, var_cars_sasp_scaleY, var_cars_sasp_scaleZ, var_cars_sasp_red, var_cars_sasp_green, var_cars_sasp_blue, var_cars_sasp_alpha, var_cars_sasp_bob, var_cars_sasp_face, var_cars_sasp_p19, var_cars_sasp_rotate, var_cars_sasp_textdict, var_cars_sasp_textname, var_cars_sasp_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name == 'swat' then
				DrawMarker(var_cars_swat_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_swat_scaleX, var_cars_swat_scaleY, var_cars_swat_scaleZ, var_cars_swat_red, var_cars_swat_green, var_cars_swat_blue, var_cars_swat_alpha, var_cars_swat_bob, var_cars_swat_face, var_cars_swat_p19, var_cars_swat_rotate, var_cars_swat_textdict, var_cars_swat_textname, var_cars_swat_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name == 'dpos' then
				DrawMarker(var_cars_dpos_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_dpos_scaleX, var_cars_dpos_scaleY, var_cars_dpos_scaleZ, var_cars_dpos_red, var_cars_dpos_green, var_cars_dpos_blue, var_cars_dpos_alpha, var_cars_dpos_bob, var_cars_dpos_face, var_cars_dpos_p19, var_cars_dpos_rotate, var_cars_dpos_textdict, var_cars_dpos_textname, var_cars_dpos_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name == 'heli' then
				DrawMarker(var_cars_heli_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_heli_scaleX, var_cars_heli_scaleY, var_cars_heli_scaleZ, var_cars_heli_red, var_cars_heli_green, var_cars_heli_blue, var_cars_heli_alpha, var_cars_heli_bob, var_cars_heli_face, var_cars_heli_p19, var_cars_heli_rotate, var_cars_heli_textdict, var_cars_heli_textname, var_cars_heli_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name == 'lsfd' then
				DrawMarker(var_cars_lsfd_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_lsfd_scaleX, var_cars_lsfd_scaleY, var_cars_lsfd_scaleZ, var_cars_lsfd_red, var_cars_lsfd_green, var_cars_lsfd_blue, var_cars_lsfd_alpha, var_cars_lsfd_bob, var_cars_lsfd_face, var_cars_lsfd_p19, var_cars_lsfd_rotate, var_cars_lsfd_textdict, var_cars_lsfd_textname, var_cars_lsfd_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name == 'bcfd' then
				DrawMarker(var_cars_bcfd_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_cars_bcfd_scaleX, var_cars_bcfd_scaleY, var_cars_bcfd_scaleZ, var_cars_bcfd_red, var_cars_bcfd_green, var_cars_bcfd_blue, var_cars_bcfd_alpha, var_cars_bcfd_bob, var_cars_bcfd_face, var_cars_bcfd_p19, var_cars_bcfd_rotate, var_cars_bcfd_textdict, var_cars_bcfd_textname, var_cars_bcfd_drawonent)
			end
		end
		for i,coord in ipairs(list_show_weap_coords) do
			if list_handles[coord.handle][1].handles[coord.handle].name =='lspd' then
				DrawMarker(var_weap_lspd_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_weap_lspd_scaleX, var_weap_lspd_scaleY, var_weap_lspd_scaleZ, var_weap_lspd_red, var_weap_lspd_green, var_weap_lspd_blue, var_weap_lspd_alpha, var_weap_lspd_bob, var_weap_lspd_face, var_weap_lspd_p19, var_weap_lspd_rotate, var_weap_lspd_textdict, var_weap_lspd_textname, var_weap_lspd_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name =='bcso' then
				DrawMarker(var_weap_bcso_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_weap_bcso_scaleX, var_weap_bcso_scaleY, var_weap_bcso_scaleZ, var_weap_bcso_red, var_weap_bcso_green, var_weap_bcso_blue, var_weap_bcso_alpha, var_weap_bcso_bob, var_weap_bcso_face, var_weap_bcso_p19, var_weap_bcso_rotate, var_weap_bcso_textdict, var_weap_bcso_textname, var_weap_bcso_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name =='sapr' then
				DrawMarker(var_weap_sapr_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_weap_sapr_scaleX, var_weap_sapr_scaleY, var_weap_sapr_scaleZ, var_weap_sapr_red, var_weap_sapr_green, var_weap_sapr_blue, var_weap_sapr_alpha, var_weap_sapr_bob, var_weap_sapr_face, var_weap_sapr_p19, var_weap_sapr_rotate, var_weap_sapr_textdict, var_weap_sapr_textname, var_weap_sapr_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name =='sasp' then
				DrawMarker(var_weap_sasp_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_weap_sasp_scaleX, var_weap_sasp_scaleY, var_weap_sasp_scaleZ, var_weap_sasp_red, var_weap_sasp_green, var_weap_sasp_blue, var_weap_sasp_alpha, var_weap_sasp_bob, var_weap_sasp_face, var_weap_sasp_p19, var_weap_sasp_rotate, var_weap_sasp_textdict, var_weap_sasp_textname, var_weap_sasp_drawonent)
			elseif list_handles[coord.handle][1].handles[coord.handle].name =='swat' then
				DrawMarker(var_weap_swat_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_weap_swat_scaleX, var_weap_swat_scaleY, var_weap_swat_scaleZ, var_weap_swat_red, var_weap_swat_green, var_weap_swat_blue, var_weap_swat_alpha, var_weap_swat_bob, var_weap_swat_face, var_weap_swat_p19, var_weap_swat_rotate, var_weap_swat_textdict, var_weap_swat_textname, var_weap_swat_drawonent)
			end
		end
		for i,coord in ipairs(list_show_evidence_coords) do
			DrawMarker(var_evidence_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_evidence_scaleX, var_evidence_scaleY, var_evidence_scaleZ, var_evidence_red, var_evidence_green, var_evidence_blue, var_evidence_alpha, var_evidence_bob, var_evidence_face, var_evidence_p19, var_evidence_rotate, var_evidence_textdict, var_evidence_textname, var_evidence_drawonent)
		end
		for i,coord in ipairs(list_show_help_coords) do
			DrawMarker(var_tut_symbol, coord.x, coord.y, coord.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, var_tut_scaleX, var_tut_scaleY, var_tut_scaleZ, var_tut_red, var_tut_green, var_tut_blue, var_tut_alpha, var_tut_bob, var_tut_face, var_tut_p19, var_tut_rotate, var_tut_textdict, var_tut_textname, var_tut_drawonent)
		end
		Wait(0)
	end
end)

-- Code to give functionalities to the markers
-- Always builds the same: the first thread checks if the player is in range of the marker.
-- If yes, pressing E will use the marker, most of the time it opens a warmenu.
-- -- Clothing

atcloth = false
clothlocation = nil
clothpolice = nil


if ActivateClothMarkers then
	local policeindex = nil
	local ListWarMenuCloth = {}

	CreateThread(function()
		while true do
			for i,coord in ipairs(list_cloth_coords) do
				local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
				local distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
				if distance < 5 then
					clothlocation = coord.handle
					clothpolice = list_handles[clothlocation][1].handles[clothlocation].name

					if clothpolice == 'lspd' then
						policeindex = 1
						ListWarMenuCloth = ListLSPDCloth
					elseif clothpolice == 'bcso' then
						policeindex = 2
						ListWarMenuCloth = ListBCSOCloth
					elseif clothpolice == 'sasp' then
						policeindex = 3
						ListWarMenuCloth = ListSASPCloth
					elseif clothpolice == 'sapr' then
						policeindex = 4
						ListWarMenuCloth = ListSAPRCloth
					elseif clothpolice == 'swat' then
						policeindex = 5
						ListWarMenuCloth = ListSWATCloth
					elseif clothpolice == 'dpos' then
						policeindex = 6
						ListWarMenuCloth = ListDPOSCloth
					elseif clothpolice == 'lsfd' then
						policeindex = 7
						ListWarMenuCloth = ListLSFDCloth
					elseif clothpolice == 'bcfd' then
						policeindex = 8
						ListWarMenuCloth = ListBCFDCloth
					end

					atcloth = true
					StartHelpNotify('Press ~INPUT_CONTEXT~ to open the wardrobe.', 500)
					Wait(40)
					while distance < 5 do
						HelpNotify('Press ~INPUT_CONTEXT~ to open the wardrobe.', 500)
						Wait(500)
						local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
						distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
					end
					EndHelpNotify('Press ~INPUT_CONTEXT~ to open the wardrobe.', 500)
					atcloth = false
					clothlocation = nil
					clothpolice = nil
					WarMenu.CloseMenu()
				end
			end
			Wait(1000)
		end
	end)

	CreateThread(function()

		local PedGender = nil
		local playerped = nil

		local TopCategoryCurrentIndex = 1
		local TopCategorySelectedIndex = 1
		local TopItemCurrentIndex = 1
		local TopItemSelectedIndex = 1
		local TopOptionCurrentIndex = 1
		local TopOptionSelectedIndex = 1
		local TopOptionNameList = {1}
		local TopCategory = 0

		local PantsCategoryCurrentIndex = 1
		local PantsCategorySelectedIndex = 1
		local PantsItemCurrentIndex = 1
		local PantsItemSelectedIndex = 1
		local PantsOptionCurrentIndex = 1
		local PantsOptionSelectedIndex = 1
		local PantsOptionNameList = {1}
		local PantsCategory = 0

		local ShoesCategoryCurrentIndex = 1
		local ShoesCategorySelectedIndex = 1
		local ShoesItemCurrentIndex = 1
		local ShoesItemSelecctedIndex = 1
		local ShoesOptionCurrentIndex = 1
		local ShoesOptionSelectedIndex = 1
		local ShoesOptionNameList = {1}
		local ShoesCategory = 0

		local UndershirtCategoryCurrentIndex = 1
		local UndershirtCategorySelectedIndex = 1
		local UndershirtItemCurrentIndex = 1
		local UndershirtItemSelectedIndex = 1
		local UndershirtOptionCurrentIndex = 1
		local UndershirtOptionSelectedIndex = 1
		local UndershirtOptionNameList = {1}
		local UndershirtCategory = 0

		local KevlarCategoryCurrentIndex = 1
		local KevlarCategorySelectedIndex = 1
		local KevlarItemCurrentIndex = 1
		local KevlarItemSelectedIndex = 1
		local KevlarOptionCurrentIndex = 1
		local KevlarOptionSelectedIndex = 1
		local KevlarOptionNameList = {1}
		local KevlarCategory = 0

		local HeadgearCategoryCurrentIndex = 1
		local HeadgearCategorySelectedIndex = 1
		local HeadgearItemCurrentIndex = 1
		local HeadgearItemSelectedIndex = 1
		local HeadgearOptionCurrentIndex = 1
		local HeadgearOptionSelectedIndex = 1
		local HeadgearOptionNameList = {1}

		local MaskCategoryCurrentIndex = 1
		local MaskCategorySelectedIndex = 1
		local MaskItemCurrentIndex = 1
		local MaskItemSelectedIndex = 1
		local MaskOptionCurrentIndex = 1
		local MaskOptionSelectedIndex = 1
		local MaskOptionNameList = {1}

		local GlassesCategoryCurrentIndex = 1
		local GlassesCategorySelectedIndex = 1
		local GlassesItemCurrentIndex = 1
		local GlassesItemSelectedIndex = 1
		local GlassesOptionCurrentIndex = 1
		local GlassesOptionSelectedIndex = 1
		local GlassesOptionNameList = {1}

		local EarCategoryCurrentIndex = 1
		local EarCategorySelectedIndex = 1
		local EarItemCurrentIndex = 1
		local EarItemSelectedIndex = 1
		local EarOptionCurrentIndex = 1
		local EarOptionSelectedIndex = 1
		local EarOptionNameList = {1}

		local ChainCategoryCurrentIndex = 1
		local ChainCategorySelectedIndex = 1
		local ChainItemCurrentIndex = 1
		local ChainItemSelectedIndex = 1
		local ChainOptionCurrentIndex = 1
		local ChainOptionSelectedIndex = 1
		local ChainOptionNameList = {1}

		local BadgeCategoryCurrentIndex = 1
		local BadgeCategorySelectedIndex = 1
		local BadgeItemCurrentIndex = 1
		local BadgeItemSelectedIndex = 1
		local BadgeOptionCurrentIndex = 1
		local BadgeOptionSelectedIndex = 1
		local BadgeOptionNameList = {1}

		local BagCategoryCurrentIndex = 1
		local BagCategorySelectedIndex = 1
		local BagItemCurrentIndex = 1
		local BagItemSelectedIndex = 1
		local BagOptionCurrentIndex = 1
		local BagOptionSelectedIndex = 1
		local BagOptionNameList = {1}

		local GloveStyleCurrentIndex = 1
		local GloveStyleSelectedIndex = 1
		local GloveColorCurrentIndex = 1
		local GloveColorSelectedIndex = 1
		local BodyTypeCurrentIndex = 1
		local BodyTypeSelectedIndex = 1
		local VariantList = nil
		local BodyStyleList = nil
		local StyleNumberList = nil
		local StyleHelpNumberList = nil
		local BodyTypeNumber = 0

		local WatchCategoryCurrentIndex = 1
		local WatchCategorySelectedIndex = 1
		local WatchItemCurrentIndex = 1
		local WatchItemSelectedIndex = 1
		local WatchOptionCurrentIndex = 1
		local WatchOptionSelectedIndex = 1
		local WatchOptionNameList = {1}

		local BraceletCategoryCurrentIndex = 1
		local BraceletCategorySelectedIndex = 1
		local BraceletItemCurrentIndex = 1
		local BraceletItemSelectedIndex = 1
		local BraceletOptionCurrentIndex = 1
		local BraceletOptionSelectedIndex = 1
		local BraceletOptionNameList = {1}

		WarMenu.CreateMenu('WardrobeMain', 'Wardrobe')
		WarMenu.CreateSubMenu('WardrobeStandard', 'WardrobeMain', 'Wardrobe') -- change Shirt, Legs and Shoes (components 11, 4, 6)
		WarMenu.CreateSubMenu('WardrobeAccessoires', 'WardrobeMain', 'Wardrobe') -- change all props, components 1,3,5,7,10
		WarMenu.CreateSubMenu('WardrobeHeadgear', 'WardrobeAccessoires', 'Wardrobe') -- Props 0, 1, 2, Component 1
		WarMenu.CreateSubMenu('WardrobeBody', 'WardrobeAccessoires', 'Wardrobe') -- Props 6, 7, Component 3
		WarMenu.CreateSubMenu('WardrobeMisc', 'WardrobeAccessoires', 'Wardrobe') -- Components 5, 7, 10
		WarMenu.CreateSubMenu('WardrobeUndress', 'WardrobeMain', 'Wardrobe') -- undress options for every item
		WarMenu.CreateSubMenu('WardrobeUndershirt', 'WardrobeStandard', 'Wardrobe') -- change components 8, 9



		while true do
			if WarMenu.IsMenuOpened('WardrobeMain') then
				ClothingCurrentDrawables[1] = GetPedPropIndex(playerped, 0)
				ClothingCurrentDrawables[2] = GetPedPropIndex(playerped, 1)
				ClothingCurrentDrawables[3] = GetPedPropIndex(playerped, 2)
				ClothingCurrentDrawables[4] = GetPedPropIndex(playerped, 6)
				ClothingCurrentDrawables[5] = GetPedPropIndex(playerped, 7)
				ClothingCurrentDrawables[6] = GetPedDrawableVariation(playerped, 1)
				ClothingCurrentDrawables[7] = GetPedDrawableVariation(playerped, 3)
				ClothingCurrentDrawables[8] = GetPedDrawableVariation(playerped, 4)
				ClothingCurrentDrawables[9] = GetPedDrawableVariation(playerped, 5)
				ClothingCurrentDrawables[10] = GetPedDrawableVariation(playerped, 6)
				ClothingCurrentDrawables[11] = GetPedDrawableVariation(playerped, 7)
				ClothingCurrentDrawables[12] = GetPedDrawableVariation(playerped, 8)
				ClothingCurrentDrawables[13] = GetPedDrawableVariation(playerped, 9)
				ClothingCurrentDrawables[14] = GetPedDrawableVariation(playerped, 10)
				ClothingCurrentDrawables[15] = GetPedDrawableVariation(playerped, 11)
				ClothingCurrentTextures[1] = GetPedPropTextureIndex(playerped, 0)
				ClothingCurrentTextures[2] = GetPedPropTextureIndex(playerped, 1)
				ClothingCurrentTextures[3] = GetPedPropTextureIndex(playerped, 2)
				ClothingCurrentTextures[4] = GetPedPropTextureIndex(playerped, 6)
				ClothingCurrentTextures[5] = GetPedPropTextureIndex(playerped, 7)
				ClothingCurrentTextures[6] = GetPedTextureVariation(playerped, 1)
				ClothingCurrentTextures[7] = GetPedTextureVariation(playerped, 3)
				ClothingCurrentTextures[8] = GetPedTextureVariation(playerped, 4)
				ClothingCurrentTextures[9] = GetPedTextureVariation(playerped, 5)
				ClothingCurrentTextures[10] = GetPedTextureVariation(playerped, 6)
				ClothingCurrentTextures[11] = GetPedTextureVariation(playerped, 7)
				ClothingCurrentTextures[12] = GetPedTextureVariation(playerped, 8)
				ClothingCurrentTextures[13] = GetPedTextureVariation(playerped, 9)
				ClothingCurrentTextures[14] = GetPedTextureVariation(playerped, 10)
				ClothingCurrentTextures[15] = GetPedTextureVariation(playerped, 11)
				if WarMenu.MenuButton('Uniform', 'WardrobeStandard') then
					TopCategoryCurrentIndex = 1
					TopCategorySelectedIndex = 1
					TopItemCurrentIndex = 1
					TopItemSelectedIndex = 1
					TopOptionCurrentIndex = 1
					TopOptionSelectedIndex = 1
					TopOptionNameList = {1}

					PantsCategoryCurrentIndex = 1
					PantsCategorySelectedIndex = 1
					PantsItemCurrentIndex = 1
					PantsItemSelectedIndex = 1
					PantsOptionCurrentIndex = 1
					PantsOptionSelectedIndex = 1
					PantsOptionNameList = {1}

					ShoesCategoryCurrentIndex = 1
					ShoesCategorySelectedIndex = 1
					ShoesItemCurrentIndex = 1
					ShoesItemSelectedIndex = 1
					ShoesOptionCurrentIndex = 1
					ShoesOptionSelectedIndex = 1
					ShoesOptionNameList = {1}

					SetPedComponentVariation(playerped, 5, 0, 0, 0)
					SetPedComponentVariation(playerped, 7, 0, 0, 0)
					SetPedComponentVariation(playerped, 10, 0, 0, 0)

				elseif WarMenu.MenuButton('Accessoires', 'WardrobeAccessoires') then
				elseif WarMenu.MenuButton('Undress', 'WardrobeUndress') then
				elseif WarMenu.Button('Exit Menu') then
					WarMenu.CloseMenu()
				end
				WarMenu.Display()
			elseif WarMenu.IsMenuOpened('WardrobeStandard') then
				if WarMenu.ComboBox('Top Category', ListWarMenuCloth[1][11].Categories, TopCategoryCurrentIndex, TopCategorySelectedIndex, function(currentIndex, selectedIndex)
						TopCategoryCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							TopItemCurrentIndex = 1
							TopItemSelectedIndex = 1
							TopOptionCurrentIndex = 1
							TopOptionSelectedIndex = 1
							TopOptionNameList = {1}
						end
						selectedIndex = currentIndex
						TopCategorySelectedIndex = selectedIndex
						TopCategory = ListWarMenuCloth[1][11].CategoryIndex[TopCategorySelectedIndex]
					end) then

				elseif WarMenu.ComboBox('Top Item', ListWarMenuCloth[1][11].Items[TopCategorySelectedIndex], TopItemCurrentIndex, TopItemSelectedIndex, function(currentIndex, selectedIndex)
						TopItemCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							TopOptionCurrentIndex = 1
							TopOptionSelectedIndex = 1
							TopOptionNameList = {1}
						end
						selectedIndex = currentIndex
						TopItemSelectedIndex = selectedIndex
						local TopOptionNameListNew = {}
						for i, list in ipairs(ListWarMenuCloth[1][11].Options[TopCategorySelectedIndex][TopItemSelectedIndex]) do
							table.insert(TopOptionNameListNew, i)
						end
						TopOptionNameList = TopOptionNameListNew
					end) then

				elseif WarMenu.ComboBox('Top Option', TopOptionNameList, TopOptionCurrentIndex, TopOptionSelectedIndex, function(currentIndex, selectedIndex)
						TopOptionCurrentIndex = currentIndex
						selectedIndex = currentIndex
						TopOptionSelectedIndex = selectedIndex
						local ClothIndex = 1
						if ListWarMenuCloth[1][11].Options[TopCategorySelectedIndex][TopItemSelectedIndex][TopOptionSelectedIndex][PedGender].Ranked == true then
							ClothIndex = ListWarMenuCloth[1][11].Options[TopCategorySelectedIndex][TopItemSelectedIndex][TopOptionSelectedIndex][PedGender].RankList[PlayerRanks[policeindex]]
						end
						SetPedComponentVariation(playerped, 11, ListWarMenuCloth[1][11].Options[TopCategorySelectedIndex][TopItemSelectedIndex][TopOptionSelectedIndex][PedGender].ClothList[ClothIndex][1], ListWarMenuCloth[1][11].Options[TopCategorySelectedIndex][TopItemSelectedIndex][TopOptionSelectedIndex][PedGender].ClothList[ClothIndex][2], 0)
						for i, List in ipairs(ListWarMenuCloth[1][11].Options[TopCategorySelectedIndex][TopItemSelectedIndex][TopOptionSelectedIndex][PedGender].ClothList[ClothIndex][3]) do
							SetPedComponentVariation(playerped, List[1], List[2], List[3], 0)
						end
					end) then

				elseif WarMenu.ComboBox('Pants Category', ListWarMenuCloth[1][4].Categories, PantsCategoryCurrentIndex, PantsCategorySelectedIndex, function(currentIndex, selectedIndex)
						PantsCategoryCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							PantsItemCurrentIndex = 1
							PantsItemSelectedIndex = 1
							PantsOptionCurrentIndex = 1
							PantsOptionSelectedIndex = 1
							PantsOptionNameList = {1}
							ShoesCategoryCurrentIndex = 1
							ShoesCategorySelectedIndex = 1
							ShoesItemCurrentIndex = 1
							ShoesItemSelectedIndex = 1
							ShoesOptionCurrentIndex = 1
							ShoesOptionSelectedIndex = 1
							ShoesOptionNameList = {1}
						end
						selectedIndex = currentIndex
						PantsCategorySelectedIndex = selectedIndex
						PantsCategory = ListWarMenuCloth[1][4].CategoryIndex[PantsCategorySelectedIndex]
					end) then

				elseif WarMenu.ComboBox('Pants Item', ListWarMenuCloth[1][4].Items[PantsCategorySelectedIndex], PantsItemCurrentIndex, PantsItemSelectedIndex, function(currentIndex, selectedIndex)
						PantsItemCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							PantsOptionCurrentIndex = 1
							PantsOptionSelectedIndex = 1
							PantsOptionNameList = {1}
						end
						selectedIndex = currentIndex
						PantsItemSelectedIndex = selectedIndex
						local PantsOptionNameListNew = {}
						for i, list in ipairs(ListWarMenuCloth[1][4].Options[PantsCategorySelectedIndex][PantsItemSelectedIndex]) do
							table.insert(PantsOptionNameListNew, i)
						end
						PantsOptionNameList = PantsOptionNameListNew
					end) then

				elseif WarMenu.ComboBox('Pants Option', PantsOptionNameList, PantsOptionCurrentIndex, PantsOptionSelectedIndex, function(currentIndex, selectedIndex)
						PantsOptionCurrentIndex = currentIndex
						selectedIndex = currentIndex
						PantsOptionSelectedIndex = selectedIndex
						local ClothIndex = 1
						if ListWarMenuCloth[1][4].Options[PantsCategorySelectedIndex][PantsItemSelectedIndex][PantsOptionSelectedIndex][PedGender].Ranked == true then
							ClothIndex = ListWarMenuCloth[1][4].Options[PantsCategorySelectedIndex][PantsItemSelectedIndex][PantsOptionSelectedIndex][PedGender].RankList[PlayerRanks[policeindex]]
						end
						SetPedComponentVariation(playerped, 4, ListWarMenuCloth[1][4].Options[PantsCategorySelectedIndex][PantsItemSelectedIndex][PantsOptionSelectedIndex][PedGender].ClothList[ClothIndex][1], ListWarMenuCloth[1][4].Options[PantsCategorySelectedIndex][PantsItemSelectedIndex][PantsOptionSelectedIndex][PedGender].ClothList[ClothIndex][2], 0)
						for i, List in ipairs(ListWarMenuCloth[1][4].Options[PantsCategorySelectedIndex][PantsItemSelectedIndex][PantsOptionSelectedIndex][PedGender].ClothList[ClothIndex][3]) do
							SetPedComponentVariation(playerped, List[1], List[2], List[3], 0)
						end
					end) then

				elseif WarMenu.ComboBox('Shoes Category', ListWarMenuCloth[1][6].Categories[LegCategories[PantsCategory].ShoesCategory], ShoesCategoryCurrentIndex, ShoesCategorySelectedIndex, function(currentIndex, selectedIndex)
						ShoesCategoryCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							ShoesItemCurrentIndex = 1
							ShoesItemSelectedIndex = 1
							ShoesOptionCurrentIndex = 1
							ShoesOptionSelectedIndex = 1
							ShoesOptionNameList = {1}
						end
						selectedIndex = currentIndex
						ShoesCategorySelectedIndex = selectedIndex
					end) then

				elseif WarMenu.ComboBox('Shoes Item', ListWarMenuCloth[1][6].Items[LegCategories[PantsCategory].ShoesCategory][ShoesCategorySelectedIndex], ShoesItemCurrentIndex, ShoesItemSelectedIndex, function(currentIndex, selectedIndex)
						ShoesItemCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							ShoesOptionCurrentIndex = 1
							ShoesOptionSelectedIndex = 1
							ShoesOptionNameList = {1}
						end
						selectedIndex = currentIndex
						ShoesItemSelectedIndex = selectedIndex
						local ShoesOptionNameListNew = {}
						for i, list in ipairs(ListWarMenuCloth[1][6].Options[LegCategories[PantsCategory].ShoesCategory][ShoesCategorySelectedIndex][ShoesItemSelectedIndex]) do
							table.insert(ShoesOptionNameListNew, i)
						end
						ShoesOptionNameList = ShoesOptionNameListNew
					end) then

				elseif WarMenu.ComboBox('Shoes Option', ShoesOptionNameList, ShoesOptionCurrentIndex, ShoesOptionSelectedIndex, function(currentIndex, selectedIndex)
						ShoesOptionCurrentIndex = currentIndex
						selectedIndex = currentIndex
						ShoesOptionSelectedIndex = selectedIndex
						local ClothIndex = 1
						if ListWarMenuCloth[1][6].Options[LegCategories[PantsCategory].ShoesCategory][ShoesCategorySelectedIndex][ShoesItemSelectedIndex][ShoesOptionSelectedIndex][PedGender].Ranked == true then
							ClothIndex = ListWarMenuCloth[1][6].Options[LegCategories[PantsCategory].ShoesCategory][ShoesCategorySelectedIndex][ShoesItemSelectedIndex][ShoesOptionSelectedIndex][PedGender].RankList[PlayerRanks[policeindex]]
						end
						SetPedComponentVariation(playerped, 6, ListWarMenuCloth[1][6].Options[LegCategories[PantsCategory].ShoesCategory][ShoesCategorySelectedIndex][ShoesItemSelectedIndex][ShoesOptionSelectedIndex][PedGender].ClothList[ClothIndex][1], ListWarMenuCloth[1][6].Options[LegCategories[PantsCategory].ShoesCategory][ShoesCategorySelectedIndex][ShoesItemSelectedIndex][ShoesOptionSelectedIndex][PedGender].ClothList[ClothIndex][2], 0)
						for i, List in ipairs(ListWarMenuCloth[1][6].Options[LegCategories[PantsCategory].ShoesCategory][ShoesCategorySelectedIndex][ShoesItemSelectedIndex][ShoesOptionSelectedIndex][PedGender].ClothList[ClothIndex][3]) do
							SetPedComponentVariation(playerped, List[1], List[2], List[3], 0)
						end
					end) then

				elseif WarMenu.MenuButton('Choose accessoires', 'WardrobeUndershirt') then
					UndershirtCategoryCurrentIndex = 1
					UndershirtCategorySelectedIndex = 1
					UndershirtItemCurrentIndex = 1
					UndershirtItemSelectedIndex = 1
					UndershirtOptionCurrentIndex = 1
					UndershirtOptionSelectedIndex = 1
					UndershirtOptionNameList = {1}

					KevlarCategoryCurrentIndex = 1
					KevlarCategorySelectedIndex = 1
					KevlarItemCurrentIndex = 1
					KevlarItemSelectedIndex = 1
					KevlarOptionCurrentIndex = 1
					KevlarOptionSelectedIndex = 1
					KevlarOptionNameList = {1}
				elseif WarMenu.MenuButton('Back to main menu', 'WardrobeMain') then
				end
				WarMenu.Display()
			elseif WarMenu.IsMenuOpened('WardrobeUndershirt') then

				if WarMenu.ComboBox('Extra 1 Category', ListWarMenuCloth[1][8].Categories[TopCategories[TopCategory].UndershirtCategory], UndershirtCategoryCurrentIndex, UndershirtCategorySelectedIndex, function(currentIndex, selectedIndex)
						UndershirtCategoryCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							UndershirtItemCurrentIndex = 1
							UndershirtItemSelectedIndex = 1
							UndershirtOptionCurrentIndex = 1
							UndershirtOptionSelectedIndex = 1
							UndershirtOptionNameList = {1}
						end
						selectedIndex = currentIndex
						UndershirtCategorySelectedIndex = selectedIndex
					end) then

				elseif WarMenu.ComboBox('Extra 1 Item', ListWarMenuCloth[1][8].Items[TopCategories[TopCategory].UndershirtCategory][UndershirtCategorySelectedIndex], UndershirtItemCurrentIndex, UndershirtItemSelectedIndex, function(currentIndex, selectedIndex)
						UndershirtItemCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							UndershirtOptionCurrentIndex = 1
							UndershirtOptionSelectedIndex = 1
							UndershirtOptionNameList = {1}
						end
						selectedIndex = currentIndex
						UndershirtItemSelectedIndex = selectedIndex
						local UndershirtOptionNameListNew = {}
						for i, list in ipairs(ListWarMenuCloth[1][8].Options[TopCategories[TopCategory].UndershirtCategory][UndershirtCategorySelectedIndex][UndershirtItemSelectedIndex]) do
							table.insert(UndershirtOptionNameListNew, i)
						end
						UndershirtOptionNameList = UndershirtOptionNameListNew
					end) then

				elseif WarMenu.ComboBox('Extra 1 Option', UndershirtOptionNameList, UndershirtOptionCurrentIndex, UndershirtOptionSelectedIndex, function(currentIndex, selectedIndex)
						UndershirtOptionCurrentIndex = currentIndex
						selectedIndex = currentIndex
						UndershirtOptionSelectedIndex = selectedIndex
						local ClothIndex = 1
						if ListWarMenuCloth[1][8].Options[TopCategories[TopCategory].UndershirtCategory][UndershirtCategorySelectedIndex][UndershirtItemSelectedIndex][UndershirtOptionSelectedIndex][PedGender].Ranked == true then
							ClothIndex = ListWarMenuCloth[1][8].Options[TopCategories[TopCategory].UndershirtCategory][UndershirtCategorySelectedIndex][UndershirtItemSelectedIndex][UndershirtOptionSelectedIndex][PedGender].RankList[PlayerRanks[policeindex]]
						end
						SetPedComponentVariation(playerped, 8, ListWarMenuCloth[1][8].Options[TopCategories[TopCategory].UndershirtCategory][UndershirtCategorySelectedIndex][UndershirtItemSelectedIndex][UndershirtOptionSelectedIndex][PedGender].ClothList[ClothIndex][1], ListWarMenuCloth[1][8].Options[TopCategories[TopCategory].UndershirtCategory][UndershirtCategorySelectedIndex][UndershirtItemSelectedIndex][UndershirtOptionSelectedIndex][PedGender].ClothList[ClothIndex][2], 0)
						for i, List in ipairs(ListWarMenuCloth[1][8].Options[TopCategories[TopCategory].UndershirtCategory][UndershirtCategorySelectedIndex][UndershirtItemSelectedIndex][UndershirtOptionSelectedIndex][PedGender].ClothList[ClothIndex][3]) do
							SetPedComponentVariation(playerped, List[1], List[2], List[3], 0)
						end
					end) then

				elseif WarMenu.ComboBox('Extra 2 Category', ListWarMenuCloth[1][9].Categories[TopCategories[TopCategory].KevlarCategory], KevlarCategoryCurrentIndex, KevlarCategorySelectedIndex, function(currentIndex, selectedIndex)
						KevlarCategoryCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							KevlarItemCurrentIndex = 1
							KevlarItemSelectedIndex = 1
							KevlarOptionCurrentIndex = 1
							KevlarOptionSelectedIndex = 1
							KevlarOptionNameList = {1}
						end
						selectedIndex = currentIndex
						KevlarCategorySelectedIndex = selectedIndex
					end) then

				elseif WarMenu.ComboBox('Extra 2 Item', ListWarMenuCloth[1][9].Items[TopCategories[TopCategory].KevlarCategory][KevlarCategorySelectedIndex], KevlarItemCurrentIndex, KevlarItemSelectedIndex, function(currentIndex, selectedIndex)
						KevlarItemCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							KevlarOptionCurrentIndex = 1
							KevlarOptionSelectedIndex = 1
							KevlarOptionNameList = {1}
						end
						selectedIndex = currentIndex
						KevlarItemSelectedIndex = selectedIndex
						local KevlarOptionNameListNew = {}
						for i, list in ipairs(ListWarMenuCloth[1][9].Options[TopCategories[TopCategory].KevlarCategory][KevlarCategorySelectedIndex][KevlarItemSelectedIndex]) do
							table.insert(KevlarOptionNameListNew, i)
						end
						KevlarOptionNameList = KevlarOptionNameListNew
					end) then

				elseif WarMenu.ComboBox('Extra 2 Option', KevlarOptionNameList, KevlarOptionCurrentIndex, KevlarOptionSelectedIndex, function(currentIndex, selectedIndex)
						KevlarOptionCurrentIndex = currentIndex
						selectedIndex = currentIndex
						KevlarOptionSelectedIndex = selectedIndex
						local ClothIndex = 1
						if ListWarMenuCloth[1][9].Options[TopCategories[TopCategory].KevlarCategory][KevlarCategorySelectedIndex][KevlarItemSelectedIndex][KevlarOptionSelectedIndex][PedGender].Ranked == true then
							ClothIndex = ListWarMenuCloth[1][9].Options[TopCategories[TopCategory].KevlarCategory][KevlarCategorySelectedIndex][KevlarItemSelectedIndex][KevlarOptionSelectedIndex][PedGender].RankList[PlayerRanks[policeindex]]
						end
						SetPedComponentVariation(playerped, 9, ListWarMenuCloth[1][9].Options[TopCategories[TopCategory].KevlarCategory][KevlarCategorySelectedIndex][KevlarItemSelectedIndex][KevlarOptionSelectedIndex][PedGender].ClothList[ClothIndex][1], ListWarMenuCloth[1][9].Options[TopCategories[TopCategory].KevlarCategory][KevlarCategorySelectedIndex][KevlarItemSelectedIndex][KevlarOptionSelectedIndex][PedGender].ClothList[ClothIndex][2], 0)
						for i, List in ipairs(ListWarMenuCloth[1][9].Options[TopCategories[TopCategory].KevlarCategory][KevlarCategorySelectedIndex][KevlarItemSelectedIndex][KevlarOptionSelectedIndex][PedGender].ClothList[ClothIndex][3]) do
							SetPedComponentVariation(playerped, List[1], List[2], List[3], 0)
						end
					end) then

				elseif WarMenu.MenuButton('Back to main menu', 'WardrobeMain') then
				end
				WarMenu.Display()
			elseif WarMenu.IsMenuOpened('WardrobeAccessoires') then
				if WarMenu.MenuButton('Gloves and Wrists', 'WardrobeBody') then
					WatchCategoryCurrentIndex = 1
					WatchCategorySelectedIndex = 1
					WatchItemCurrentIndex = 1
					WatchItemSelectedIndex = 1
					WatchOptionCurrentIndex = 1
					WatchOptionSelectedIndex = 1
					WatchOptionNameList = {1}

					BraceletCategoryCurrentIndex = 1
					BraceletCategorySelectedIndex = 1
					BraceletItemCurrentIndex = 1
					BraceletItemSelectedIndex = 1
					BraceletOptionCurrentIndex = 1
					BraceletOptionSelectedIndex = 1
					BraceletOptionNameList = {1}

					GloveStyleCurrentIndex = 1
					GloveStyleSelectedIndex = 1
					GloveColorCurrentIndex = 1
					GloveColorSelectedIndex = 1
					local CurrentBodyType = GetPedDrawableVariation(playerped, 3)
					local UpperBound = nil
					local Addition = nil
					local Modulo = nil

					if PedGender == 1 then
 						UpperBound = 19
						Modulo = 11
						Addition = 3
					elseif PedGender == 2 then
						UpperBound = 20
						Modulo = 13
						Addition = 6
					end
					if CurrentBodyType < UpperBound then
						for i, Type in ipairs(StyleNumberList) do
							if Type == CurrentBodyType then
								BodyTypeCurrentIndex = i
								BodyTypeSelectedIndex = i
								break
							end
						end
					else
						local StyleHelper = ((CurrentBodyType+Addition) % Modulo) + 1
						local StyleIndex = StyleHelpNumberList[StyleHelper]
						for i, Type in ipairs(StyleNumberList) do
							if Type == StyleIndex then
								BodyTypeCurrentIndex = i
								BodyTypeSelectedIndex = i
								break
							end
						end
					end

				elseif WarMenu.MenuButton('Headgear', 'WardrobeHeadgear') then
					HeadgearCategoryCurrentIndex = 1
					HeadgearCategorySelectedIndex = 1
					HeadgearItemCurrentIndex = 1
					HeadgearItemSelectedIndex = 1
					HeadgearOptionCurrentIndex = 1
					HeadgearOptionSelectedIndex = 1
					HeadgearOptionNameList = {1}

					MaskCategoryCurrentIndex = 1
					MaskCategorySelectedIndex = 1
					MaskItemCurrentIndex = 1
					MaskItemSelectedIndex = 1
					MaskOptionCurrentIndex = 1
					MaskOptionSelectedIndex = 1
					MaskOptionNameList = {1}

					GlassesCategoryCurrentIndex = 1
					GlassesCategorySelectedIndex = 1
					GlassesItemCurrentIndex = 1
					GlassesItemSelectedIndex = 1
					GlassesOptionCurrentIndex = 1
					GlassesOptionSelectedIndex = 1
					GlassesOptionNameList = {1}

					EarCategoryCurrentIndex = 1
					EarCategorySelectedIndex = 1
					EarItemCurrentIndex = 1
					EarItemSelectedIndex = 1
					EarOptionCurrentIndex = 1
					EarOptionSelectedIndex = 1
					EarOptionNameList = {1}

				elseif WarMenu.MenuButton('Other gear', 'WardrobeMisc') then

					ChainCategoryCurrentIndex = 1
					ChainCategorySelectedIndex = 1
					ChainItemCurrentIndex = 1
					ChainItemSelectedIndex = 1
					ChainOptionCurrentIndex = 1
					ChainOptionSelectedIndex = 1
					ChainOptionNameList = {1}

					BadgeCategoryCurrentIndex = 1
					BadgeCategorySelectedIndex = 1
					BadgeItemCurrentIndex = 1
					BadgeItemSelectedIndex = 1
					BadgeOptionCurrentIndex = 1
					BadgeOptionSelectedIndex = 1
					BadgeOptionNameList = {1}

					BagCategoryCurrentIndex = 1
					BagCategorySelectedIndex = 1
					BagItemCurrentIndex = 1
					BagItemSelectedIndex = 1
					BagOptionCurrentIndex = 1
					BagOptionSelectedIndex = 1
					BagOptionNameList = {1}

				elseif WarMenu.MenuButton('Back to main menu', 'WardrobeMain') then
				end
				WarMenu.Display()
			elseif WarMenu.IsMenuOpened('WardrobeHeadgear') then
				if WarMenu.ComboBox('Headgear Category', ListWarMenuCloth[2][0].Categories, HeadgearCategoryCurrentIndex, HeadgearCategorySelectedIndex, function(currentIndex, selectedIndex)
						HeadgearCategoryCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							HeadgearItemCurrentIndex = 1
							HeadgearItemSelectedIndex = 1
							HeadgearOptionCurrentIndex = 1
							HeadgearOptionSelectedIndex = 1
							HeadgearOptionNameList = {1}
						end
						selectedIndex = currentIndex
						HeadgearCategorySelectedIndex = selectedIndex
					end) then

				elseif WarMenu.ComboBox('Headgear Item', ListWarMenuCloth[2][0].Items[HeadgearCategorySelectedIndex], HeadgearItemCurrentIndex, HeadgearItemSelectedIndex, function(currentIndex, selectedIndex)
						HeadgearItemCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							HeadgearOptionCurrentIndex = 1
							HeadgearOptionSelectedIndex = 1
							HeadgearOptionNameList = {1}
						end
						selectedIndex = currentIndex
						HeadgearItemSelectedIndex = selectedIndex
						local HeadgearOptionNameListNew = {}
						for i, list in ipairs(ListWarMenuCloth[2][0].Options[HeadgearCategorySelectedIndex][HeadgearItemSelectedIndex]) do
							table.insert(HeadgearOptionNameListNew, i)
						end
						HeadgearOptionNameList = HeadgearOptionNameListNew
					end) then

				elseif WarMenu.ComboBox('Headgear Option', HeadgearOptionNameList, HeadgearOptionCurrentIndex, HeadgearOptionSelectedIndex, function(currentIndex, selectedIndex)
						HeadgearOptionCurrentIndex = currentIndex
						selectedIndex = currentIndex
						HeadgearOptionSelectedIndex = selectedIndex
						local ClothIndex = 1
						if ListWarMenuCloth[2][0].Options[HeadgearCategorySelectedIndex][HeadgearItemSelectedIndex][HeadgearOptionSelectedIndex][PedGender].Ranked == true then
							ClothIndex = ListWarMenuCloth[2][0].Options[HeadgearCategorySelectedIndex][HeadgearItemSelectedIndex][HeadgearOptionSelectedIndex][PedGender].RankList[PlayerRanks[policeindex]]
						end
						if ListWarMenuCloth[2][0].Options[HeadgearCategorySelectedIndex][HeadgearItemSelectedIndex][HeadgearOptionSelectedIndex][PedGender].ClothList[ClothIndex][1] == 0 then
							ClearPedProp(playerped, 0)
						else
							SetPedPropIndex(playerped, 0, ListWarMenuCloth[2][0].Options[HeadgearCategorySelectedIndex][HeadgearItemSelectedIndex][HeadgearOptionSelectedIndex][PedGender].ClothList[ClothIndex][1], ListWarMenuCloth[2][0].Options[HeadgearCategorySelectedIndex][HeadgearItemSelectedIndex][HeadgearOptionSelectedIndex][PedGender].ClothList[ClothIndex][2], true)
						end
						for i, List in ipairs(ListWarMenuCloth[2][0].Options[HeadgearCategorySelectedIndex][HeadgearItemSelectedIndex][HeadgearOptionSelectedIndex][PedGender].ClothList[ClothIndex][3]) do
							SetPedComponentVariation(playerped, List[1], List[2], List[3], 0)
						end
					end) then

				elseif WarMenu.ComboBox('Mask Category', ListWarMenuCloth[1][1].Categories, MaskCategoryCurrentIndex, MaskCategorySelectedIndex, function(currentIndex, selectedIndex)
						MaskCategoryCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							MaskItemCurrentIndex = 1
							MaskItemSelectedIndex = 1
							MaskOptionCurrentIndex = 1
							MaskOptionSelectedIndex = 1
							MaskOptionNameList = {1}
						end
						selectedIndex = currentIndex
						MaskCategorySelectedIndex = selectedIndex
						MaskCategory = ListWarMenuCloth[1][1].CategoryIndex[MaskCategorySelectedIndex]
					end) then

				elseif WarMenu.ComboBox('Mask Item', ListWarMenuCloth[1][1].Items[MaskCategorySelectedIndex], MaskItemCurrentIndex, MaskItemSelectedIndex, function(currentIndex, selectedIndex)
						MaskItemCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							MaskOptionCurrentIndex = 1
							MaskOptionSelectedIndex = 1
							MaskOptionNameList = {1}
						end
						selectedIndex = currentIndex
						MaskItemSelectedIndex = selectedIndex
						local MaskOptionNameListNew = {}
						for i, list in ipairs(ListWarMenuCloth[1][1].Options[MaskCategorySelectedIndex][MaskItemSelectedIndex]) do
							table.insert(MaskOptionNameListNew, i)
						end
						MaskOptionNameList = MaskOptionNameListNew
					end) then

				elseif WarMenu.ComboBox('Mask Option', MaskOptionNameList, MaskOptionCurrentIndex, MaskOptionSelectedIndex, function(currentIndex, selectedIndex)
						MaskOptionCurrentIndex = currentIndex
						selectedIndex = currentIndex
						MaskOptionSelectedIndex = selectedIndex
						local ClothIndex = 1
						if ListWarMenuCloth[1][1].Options[MaskCategorySelectedIndex][MaskItemSelectedIndex][MaskOptionSelectedIndex][PedGender].Ranked == true then
							ClothIndex = ListWarMenuCloth[1][1].Options[MaskCategorySelectedIndex][MaskItemSelectedIndex][MaskOptionSelectedIndex][PedGender].RankList[PlayerRanks[policeindex]]
						end
						SetPedComponentVariation(playerped, 1, ListWarMenuCloth[1][1].Options[MaskCategorySelectedIndex][MaskItemSelectedIndex][MaskOptionSelectedIndex][PedGender].ClothList[ClothIndex][1], ListWarMenuCloth[1][1].Options[MaskCategorySelectedIndex][MaskItemSelectedIndex][MaskOptionSelectedIndex][PedGender].ClothList[ClothIndex][2], 0)
						for i, List in ipairs(ListWarMenuCloth[1][1].Options[MaskCategorySelectedIndex][MaskItemSelectedIndex][MaskOptionSelectedIndex][PedGender].ClothList[ClothIndex][3]) do
							SetPedComponentVariation(playerped, List[1], List[2], List[3], 0)
						end
					end) then

				elseif WarMenu.ComboBox('Glasses Category', ListWarMenuCloth[2][1].Categories, GlassesCategoryCurrentIndex, GlassesCategorySelectedIndex, function(currentIndex, selectedIndex)
						GlassesCategoryCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							GlassesItemCurrentIndex = 1
							GlassesItemSelectedIndex = 1
							GlassesOptionCurrentIndex = 1
							GlassesOptionSelectedIndex = 1
							GlassesOptionNameList = {1}
						end
						selectedIndex = currentIndex
						GlassesCategorySelectedIndex = selectedIndex
					end) then

				elseif WarMenu.ComboBox('Glasses Item', ListWarMenuCloth[2][1].Items[GlassesCategorySelectedIndex], GlassesItemCurrentIndex, GlassesItemSelectedIndex, function(currentIndex, selectedIndex)
						GlassesItemCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							GlassesOptionCurrentIndex = 1
							GlassesOptionSelectedIndex = 1
							GlassesOptionNameList = {1}
						end
						selectedIndex = currentIndex
						GlassesItemSelectedIndex = selectedIndex
						local GlassesOptionNameListNew = {}
						for i, list in ipairs(ListWarMenuCloth[2][1].Options[GlassesCategorySelectedIndex][GlassesItemSelectedIndex]) do
							table.insert(GlassesOptionNameListNew, i)
						end
						GlassesOptionNameList = GlassesOptionNameListNew
					end) then

				elseif WarMenu.ComboBox('Glasses Option', GlassesOptionNameList, GlassesOptionCurrentIndex, GlassesOptionSelectedIndex, function(currentIndex, selectedIndex)
						GlassesOptionCurrentIndex = currentIndex
						selectedIndex = currentIndex
						GlassesOptionSelectedIndex = selectedIndex
						local ClothIndex = 1
						if ListWarMenuCloth[2][1].Options[GlassesCategorySelectedIndex][GlassesItemSelectedIndex][GlassesOptionSelectedIndex][PedGender].Ranked == true then
							ClothIndex = ListWarMenuCloth[2][1].Options[GlassesCategorySelectedIndex][GlassesItemSelectedIndex][GlassesOptionSelectedIndex][PedGender].RankList[PlayerRanks[policeindex]]
						end
						if ListWarMenuCloth[2][1].Options[GlassesCategorySelectedIndex][GlassesItemSelectedIndex][GlassesOptionSelectedIndex][PedGender].ClothList[ClothIndex][1] == 0 then
							ClearPedProp(playerped, 1)
						else
							SetPedPropIndex(playerped, 1, ListWarMenuCloth[2][1].Options[GlassesCategorySelectedIndex][GlassesItemSelectedIndex][GlassesOptionSelectedIndex][PedGender].ClothList[ClothIndex][1], ListWarMenuCloth[2][1].Options[GlassesCategorySelectedIndex][GlassesItemSelectedIndex][GlassesOptionSelectedIndex][PedGender].ClothList[ClothIndex][2], true)
						end
						for i, List in ipairs(ListWarMenuCloth[2][1].Options[GlassesCategorySelectedIndex][GlassesItemSelectedIndex][GlassesOptionSelectedIndex][PedGender].ClothList[ClothIndex][3]) do
							SetPedComponentVariation(playerped, List[1], List[2], List[3], 0)
						end
					end) then

				elseif WarMenu.ComboBox('Ear Category', ListWarMenuCloth[2][2].Categories, EarCategoryCurrentIndex, EarCategorySelectedIndex, function(currentIndex, selectedIndex)
						EarCategoryCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							EarItemCurrentIndex = 1
							EarItemSelectedIndex = 1
							EarOptionCurrentIndex = 1
							EarOptionSelectedIndex = 1
							EarOptionNameList = {1}
						end
						selectedIndex = currentIndex
						EarCategorySelectedIndex = selectedIndex
					end) then

				elseif WarMenu.ComboBox('Ear Item', ListWarMenuCloth[2][2].Items[EarCategorySelectedIndex], EarItemCurrentIndex, EarItemSelectedIndex, function(currentIndex, selectedIndex)
						EarItemCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							EarOptionCurrentIndex = 1
							EarOptionSelectedIndex = 1
							EarOptionNameList = {1}
						end
						selectedIndex = currentIndex
						EarItemSelectedIndex = selectedIndex
						local EarOptionNameListNew = {}
						for i, list in ipairs(ListWarMenuCloth[2][2].Options[EarCategorySelectedIndex][EarItemSelectedIndex]) do
							table.insert(EarOptionNameListNew, i)
						end
						EarOptionNameList = EarOptionNameListNew
					end) then

				elseif WarMenu.ComboBox('Ear Option', EarOptionNameList, EarOptionCurrentIndex, EarOptionSelectedIndex, function(currentIndex, selectedIndex)
						EarOptionCurrentIndex = currentIndex
						selectedIndex = currentIndex
						EarOptionSelectedIndex = selectedIndex
						local ClothIndex = 1
						if ListWarMenuCloth[2][2].Options[EarCategorySelectedIndex][EarItemSelectedIndex][EarOptionSelectedIndex][PedGender].Ranked == true then
							ClothIndex = ListWarMenuCloth[2][2].Options[EarCategorySelectedIndex][EarItemSelectedIndex][EarOptionSelectedIndex][PedGender].RankList[PlayerRanks[policeindex]]
						end
						if ListWarMenuCloth[2][2].Options[EarCategorySelectedIndex][EarItemSelectedIndex][EarOptionSelectedIndex][PedGender].ClothList[ClothIndex][1] == 0 then
							ClearPedProp(playerped, 2)
						else
							SetPedPropIndex(playerped, 2, ListWarMenuCloth[2][2].Options[EarCategorySelectedIndex][EarItemSelectedIndex][EarOptionSelectedIndex][PedGender].ClothList[ClothIndex][1], ListWarMenuCloth[2][2].Options[EarCategorySelectedIndex][EarItemSelectedIndex][EarOptionSelectedIndex][PedGender].ClothList[ClothIndex][2], true)
						end
						for i, List in ipairs(ListWarMenuCloth[2][2].Options[EarCategorySelectedIndex][EarItemSelectedIndex][EarOptionSelectedIndex][PedGender].ClothList[ClothIndex][3]) do
							SetPedComponentVariation(playerped, List[1], List[2], List[3], 0)
						end
					end) then


				elseif WarMenu.MenuButton('Back to Accessoires', 'WardrobeAccessoires') then
				end
				WarMenu.Display()
			elseif WarMenu.IsMenuOpened('WardrobeBody') then

				if WarMenu.ComboBox('Glove Style', ListGloveStyles, GloveStyleCurrentIndex, GloveStyleSelectedIndex, function(currentIndex, selectedIndex)
						GloveStyleCurrentIndex = currentIndex
						selectedIndex = currentIndex
						GloveStyleSelectedIndex = selectedIndex
					end) then

				elseif WarMenu.ComboBox('Glove Color', ListGloveColors[GloveStyleSelectedIndex], GloveColorCurrentIndex, GloveColorSelectedIndex, function(currentIndex, selectedIndex)
						GloveColorCurrentIndex = currentIndex
						selectedIndex = currentIndex
						GloveColorSelectedIndex = selectedIndex
						SetPedComponentVariation(playerped, 3, VariantList[GloveStyleSelectedIndex][BodyTypeNumber][GloveColorSelectedIndex][1], VariantList[GloveStyleSelectedIndex][BodyTypeNumber][GloveColorSelectedIndex][2], 0)
					end) then

				elseif WarMenu.ComboBox('Body Type', BodyStyleList, BodyTypeCurrentIndex, BodyTypeSelectedIndex, function(currentIndex, selectedIndex)
						BodyTypeCurrentIndex = currentIndex
						selectedIndex = currentIndex
						BodyTypeSelectedIndex = selectedIndex
						BodyTypeNumber = StyleNumberList[BodyTypeCurrentIndex]
					end) then

				elseif WarMenu.ComboBox('Watch Category', ListWarMenuCloth[2][6].Categories, WatchCategoryCurrentIndex, WatchCategorySelectedIndex, function(currentIndex, selectedIndex)
						WatchCategoryCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							WatchItemCurrentIndex = 1
							WatchItemSelectedIndex = 1
							WatchOptionCurrentIndex = 1
							WatchOptionSelectedIndex = 1
							WatchOptionNameList = {1}
						end
						selectedIndex = currentIndex
						WatchCategorySelectedIndex = selectedIndex
					end) then

				elseif WarMenu.ComboBox('Watch Item', ListWarMenuCloth[2][6].Items[WatchCategorySelectedIndex], WatchItemCurrentIndex, WatchItemSelectedIndex, function(currentIndex, selectedIndex)
						WatchItemCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							WatchOptionCurrentIndex = 1
							WatchOptionSelectedIndex = 1
							WatchOptionNameList = {1}
						end
						selectedIndex = currentIndex
						WatchItemSelectedIndex = selectedIndex
						local WatchOptionNameListNew = {}
						for i, list in ipairs(ListWarMenuCloth[2][6].Options[WatchCategorySelectedIndex][WatchItemSelectedIndex]) do
							table.insert(WatchOptionNameListNew, i)
						end
						WatchOptionNameList = WatchOptionNameListNew
					end) then

				elseif WarMenu.ComboBox('Watch Option', WatchOptionNameList, WatchOptionCurrentIndex, WatchOptionSelectedIndex, function(currentIndex, selectedIndex)
						WatchOptionCurrentIndex = currentIndex
						selectedIndex = currentIndex
						WatchOptionSelectedIndex = selectedIndex
						local ClothIndex = 1
						if ListWarMenuCloth[2][6].Options[WatchCategorySelectedIndex][WatchItemSelectedIndex][WatchOptionSelectedIndex][PedGender].Ranked == true then
							ClothIndex = ListWarMenuCloth[2][6].Options[WatchCategorySelectedIndex][WatchItemSelectedIndex][WatchOptionSelectedIndex][PedGender].RankList[PlayerRanks[policeindex]]
						end
						if ListWarMenuCloth[2][6].Options[WatchCategorySelectedIndex][WatchItemSelectedIndex][WatchOptionSelectedIndex][PedGender].ClothList[ClothIndex][1] == 0 then
							ClearPedProp(playerped, 6)
						else
							SetPedPropIndex(playerped, 6, ListWarMenuCloth[2][6].Options[WatchCategorySelectedIndex][WatchItemSelectedIndex][WatchOptionSelectedIndex][PedGender].ClothList[ClothIndex][1], ListWarMenuCloth[2][6].Options[WatchCategorySelectedIndex][WatchItemSelectedIndex][WatchOptionSelectedIndex][PedGender].ClothList[ClothIndex][2], true)
						end
						for i, List in ipairs(ListWarMenuCloth[2][6].Options[WatchCategorySelectedIndex][WatchItemSelectedIndex][WatchOptionSelectedIndex][PedGender].ClothList[ClothIndex][3]) do
							SetPedComponentVariation(playerped, List[1], List[2], List[3], 0)
						end
					end) then

				elseif WarMenu.ComboBox('Bracelet Category', ListWarMenuCloth[2][7].Categories, BraceletCategoryCurrentIndex, BraceletCategorySelectedIndex, function(currentIndex, selectedIndex)
						BraceletCategoryCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							BraceletItemCurrentIndex = 1
							BraceletItemSelectedIndex = 1
							BraceletOptionCurrentIndex = 1
							BraceletOptionSelectedIndex = 1
							BraceletOptionNameList = {1}
						end
						selectedIndex = currentIndex
						BraceletCategorySelectedIndex = selectedIndex
					end) then

				elseif WarMenu.ComboBox('Bracelet Item', ListWarMenuCloth[2][7].Items[BraceletCategorySelectedIndex], BraceletItemCurrentIndex, BraceletItemSelectedIndex, function(currentIndex, selectedIndex)
						BraceletItemCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							BraceletOptionCurrentIndex = 1
							BraceletOptionSelectedIndex = 1
							BraceletOptionNameList = {1}
						end
						selectedIndex = currentIndex
						BraceletItemSelectedIndex = selectedIndex
						local BraceletOptionNameListNew = {}
						for i, list in ipairs(ListWarMenuCloth[2][7].Options[BraceletCategorySelectedIndex][BraceletItemSelectedIndex]) do
							table.insert(BraceletOptionNameListNew, i)
						end
						BraceletOptionNameList = BraceletOptionNameListNew
					end) then

				elseif WarMenu.ComboBox('Bracelet Option', BraceletOptionNameList, BraceletOptionCurrentIndex, BraceletOptionSelectedIndex, function(currentIndex, selectedIndex)
						BraceletOptionCurrentIndex = currentIndex
						selectedIndex = currentIndex
						BraceletOptionSelectedIndex = selectedIndex
						local ClothIndex = 1
						if ListWarMenuCloth[2][7].Options[BraceletCategorySelectedIndex][BraceletItemSelectedIndex][BraceletOptionSelectedIndex][PedGender].Ranked == true then
							ClothIndex = ListWarMenuCloth[2][7].Options[BraceletCategorySelectedIndex][BraceletItemSelectedIndex][BraceletOptionSelectedIndex][PedGender].RankList[PlayerRanks[policeindex]]
						end
						if ListWarMenuCloth[2][7].Options[BraceletCategorySelectedIndex][BraceletItemSelectedIndex][BraceletOptionSelectedIndex][PedGender].ClothList[ClothIndex][1] == 0 then
							ClearPedProp(playerped, 7)
						else
							SetPedPropIndex(playerped, 7, ListWarMenuCloth[2][7].Options[BraceletCategorySelectedIndex][BraceletItemSelectedIndex][BraceletOptionSelectedIndex][PedGender].ClothList[ClothIndex][1], ListWarMenuCloth[2][7].Options[BraceletCategorySelectedIndex][BraceletItemSelectedIndex][BraceletOptionSelectedIndex][PedGender].ClothList[ClothIndex][2], true)
						end
						for i, List in ipairs(ListWarMenuCloth[2][7].Options[BraceletCategorySelectedIndex][BraceletItemSelectedIndex][BraceletOptionSelectedIndex][PedGender].ClothList[ClothIndex][3]) do
							SetPedComponentVariation(playerped, List[1], List[2], List[3], 0)
						end
					end) then

				elseif WarMenu.MenuButton('Back to accessoires', 'WardrobeAccessoires') then
				end
				WarMenu.Display()
			elseif WarMenu.IsMenuOpened('WardrobeMisc') then
				if WarMenu.ComboBox('Extra 3 Category', ListWarMenuCloth[1][7].Categories, ChainCategoryCurrentIndex, ChainCategorySelectedIndex, function(currentIndex, selectedIndex)
						ChainCategoryCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							ChainItemCurrentIndex = 1
							ChainItemSelectedIndex = 1
							ChainOptionCurrentIndex = 1
							ChainOptionSelectedIndex = 1
							ChainOptionNameList = {1}
						end
						selectedIndex = currentIndex
						ChainCategorySelectedIndex = selectedIndex
						ChainCategory = ListWarMenuCloth[1][7].CategoryIndex[ChainCategorySelectedIndex]
					end) then

				elseif WarMenu.ComboBox('Extra 3 Item', ListWarMenuCloth[1][7].Items[ChainCategorySelectedIndex], ChainItemCurrentIndex, ChainItemSelectedIndex, function(currentIndex, selectedIndex)
						ChainItemCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							ChainOptionCurrentIndex = 1
							ChainOptionSelectedIndex = 1
							ChainOptionNameList = {1}
						end
						selectedIndex = currentIndex
						ChainItemSelectedIndex = selectedIndex
						local ChainOptionNameListNew = {}
						for i, list in ipairs(ListWarMenuCloth[1][7].Options[ChainCategorySelectedIndex][ChainItemSelectedIndex]) do
							table.insert(ChainOptionNameListNew, i)
						end
						ChainOptionNameList = ChainOptionNameListNew
					end) then

				elseif WarMenu.ComboBox('Extra 3 Option', ChainOptionNameList, ChainOptionCurrentIndex, ChainOptionSelectedIndex, function(currentIndex, selectedIndex)
						ChainOptionCurrentIndex = currentIndex
						selectedIndex = currentIndex
						ChainOptionSelectedIndex = selectedIndex
						local ClothIndex = 1
						if ListWarMenuCloth[1][7].Options[ChainCategorySelectedIndex][ChainItemSelectedIndex][ChainOptionSelectedIndex][PedGender].Ranked == true then
							ClothIndex = ListWarMenuCloth[1][7].Options[ChainCategorySelectedIndex][ChainItemSelectedIndex][ChainOptionSelectedIndex][PedGender].RankList[PlayerRanks[policeindex]]
						end
						SetPedComponentVariation(playerped, 7, ListWarMenuCloth[1][7].Options[ChainCategorySelectedIndex][ChainItemSelectedIndex][ChainOptionSelectedIndex][PedGender].ClothList[ClothIndex][1], ListWarMenuCloth[1][7].Options[ChainCategorySelectedIndex][ChainItemSelectedIndex][ChainOptionSelectedIndex][PedGender].ClothList[ClothIndex][2], 0)
						for i, List in ipairs(ListWarMenuCloth[1][7].Options[ChainCategorySelectedIndex][ChainItemSelectedIndex][ChainOptionSelectedIndex][PedGender].ClothList[ClothIndex][3]) do
							SetPedComponentVariation(playerped, List[1], List[2], List[3], 0)
						end
					end) then

				elseif WarMenu.ComboBox('Extra 4 Category', ListWarMenuCloth[1][10].Categories, BadgeCategoryCurrentIndex, BadgeCategorySelectedIndex, function(currentIndex, selectedIndex)
						BadgeCategoryCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							BadgeItemCurrentIndex = 1
							BadgeItemSelectedIndex = 1
							BadgeOptionCurrentIndex = 1
							BadgeOptionSelectedIndex = 1
							BadgeOptionNameList = {1}
						end
						selectedIndex = currentIndex
						BadgeCategorySelectedIndex = selectedIndex
						BadgeCategory = ListWarMenuCloth[1][10].CategoryIndex[BadgeCategorySelectedIndex]
					end) then

				elseif WarMenu.ComboBox('Extra 4 Item', ListWarMenuCloth[1][10].Items[BadgeCategorySelectedIndex], BadgeItemCurrentIndex, BadgeItemSelectedIndex, function(currentIndex, selectedIndex)
						BadgeItemCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							BadgeOptionCurrentIndex = 1
							BadgeOptionSelectedIndex = 1
							BadgeOptionNameList = {1}
						end
						selectedIndex = currentIndex
						BadgeItemSelectedIndex = selectedIndex
						local BadgeOptionNameListNew = {}
						for i, list in ipairs(ListWarMenuCloth[1][10].Options[BadgeCategorySelectedIndex][BadgeItemSelectedIndex]) do
							table.insert(BadgeOptionNameListNew, i)
						end
						BadgeOptionNameList = BadgeOptionNameListNew
					end) then

				elseif WarMenu.ComboBox('Extra 4 Option', BadgeOptionNameList, BadgeOptionCurrentIndex, BadgeOptionSelectedIndex, function(currentIndex, selectedIndex)
						BadgeOptionCurrentIndex = currentIndex
						selectedIndex = currentIndex
						BadgeOptionSelectedIndex = selectedIndex
						local ClothIndex = 1
						if ListWarMenuCloth[1][10].Options[BadgeCategorySelectedIndex][BadgeItemSelectedIndex][BadgeOptionSelectedIndex][PedGender].Ranked == true then
							ClothIndex = ListWarMenuCloth[1][10].Options[BadgeCategorySelectedIndex][BadgeItemSelectedIndex][BadgeOptionSelectedIndex][PedGender].RankList[PlayerRanks[policeindex]]
						end
						SetPedComponentVariation(playerped, 10, ListWarMenuCloth[1][10].Options[BadgeCategorySelectedIndex][BadgeItemSelectedIndex][BadgeOptionSelectedIndex][PedGender].ClothList[ClothIndex][1], ListWarMenuCloth[1][10].Options[BadgeCategorySelectedIndex][BadgeItemSelectedIndex][BadgeOptionSelectedIndex][PedGender].ClothList[ClothIndex][2], 0)
						for i, List in ipairs(ListWarMenuCloth[1][10].Options[BadgeCategorySelectedIndex][BadgeItemSelectedIndex][BadgeOptionSelectedIndex][PedGender].ClothList[ClothIndex][3]) do
							SetPedComponentVariation(playerped, List[1], List[2], List[3], 0)
						end
					end) then

				elseif WarMenu.ComboBox('Extra 5 Category', ListWarMenuCloth[1][5].Categories, BagCategoryCurrentIndex, BagCategorySelectedIndex, function(currentIndex, selectedIndex)
						BagCategoryCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							BagItemCurrentIndex = 1
							BagItemSelectedIndex = 1
							BagOptionCurrentIndex = 1
							BagOptionSelectedIndex = 1
							BagOptionNameList = {1}
						end
						selectedIndex = currentIndex
						BagCategorySelectedIndex = selectedIndex
						BagCategory = ListWarMenuCloth[1][5].CategoryIndex[BagCategorySelectedIndex]
					end) then

				elseif WarMenu.ComboBox('Extra 5 Item', ListWarMenuCloth[1][5].Items[BagCategorySelectedIndex], BagItemCurrentIndex, BagItemSelectedIndex, function(currentIndex, selectedIndex)
						BagItemCurrentIndex = currentIndex
						if currentIndex ~= selectedIndex then
							BagOptionCurrentIndex = 1
							BagOptionSelectedIndex = 1
							BagOptionNameList = {1}
						end
						selectedIndex = currentIndex
						BagItemSelectedIndex = selectedIndex
						local BagOptionNameListNew = {}
						for i, list in ipairs(ListWarMenuCloth[1][5].Options[BagCategorySelectedIndex][BagItemSelectedIndex]) do
							table.insert(BagOptionNameListNew, i)
						end
						BagOptionNameList = BagOptionNameListNew
					end) then

				elseif WarMenu.ComboBox('Extra 5 Option', BagOptionNameList, BagOptionCurrentIndex, BagOptionSelectedIndex, function(currentIndex, selectedIndex)
						BagOptionCurrentIndex = currentIndex
						selectedIndex = currentIndex
						BagOptionSelectedIndex = selectedIndex
						local ClothIndex = 1
						if ListWarMenuCloth[1][5].Options[BagCategorySelectedIndex][BagItemSelectedIndex][BagOptionSelectedIndex][PedGender].Ranked == true then
							ClothIndex = ListWarMenuCloth[1][5].Options[BagCategorySelectedIndex][BagItemSelectedIndex][BagOptionSelectedIndex][PedGender].RankList[PlayerRanks[policeindex]]
						end
						SetPedComponentVariation(playerped, 5, ListWarMenuCloth[1][5].Options[BagCategorySelectedIndex][BagItemSelectedIndex][BagOptionSelectedIndex][PedGender].ClothList[ClothIndex][1], ListWarMenuCloth[1][5].Options[BagCategorySelectedIndex][BagItemSelectedIndex][BagOptionSelectedIndex][PedGender].ClothList[ClothIndex][2], 0)
						for i, List in ipairs(ListWarMenuCloth[1][5].Options[BagCategorySelectedIndex][BagItemSelectedIndex][BagOptionSelectedIndex][PedGender].ClothList[ClothIndex][3]) do
							SetPedComponentVariation(playerped, List[1], List[2], List[3], 0)
						end
					end) then

				elseif WarMenu.MenuButton('Back to accessoires', 'WardrobeAccessoires') then
				end
				WarMenu.Display()
			elseif WarMenu.IsMenuOpened('WardrobeUndress') then
				if WarMenu.Button('Take off Headgear') then
					ClearPedProp(playerped, 0)
				elseif WarMenu.Button('Take off Mask') then
					SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 0)
				elseif WarMenu.Button('Take off Glasses') then
					ClearPedProp(playerped, 1)
				elseif WarMenu.Button('Take off Earring') then
					ClearPedProp(playerped, 2)
				elseif WarMenu.Button('Take off Watch') then
					ClearPedProp(playerped, 6)
				elseif WarMenu.Button('Take off Wristband') then
					ClearPedProp(playerped, 7)
				elseif WarMenu.Button('Take off Top') then
					SetPedComponentVariation(playerped, 3, 15, 0, 0)
					SetPedComponentVariation(playerped, 11, 15, 0, 0)
					SetPedComponentVariation(playerped, 9, 0, 0, 0)
					SetPedComponentVariation(playerped, 10, 0, 0, 0)
					SetPedComponentVariation(playerped, 7, 0, 0, 0)
					SetPedComponentVariation(playerped, 5, 0, 0, 0)
					if PedGender == 1 then
						SetPedComponentVariation(playerped, 8, 15, 0, 0)
					elseif PedGender == 2 then
						SetPedComponentVariation(playerped, 8, 14, 0, 0)
					end
				elseif WarMenu.Button('Take off Pants') then
					if PedGender == 1 then
						SetPedComponentVariation(GetPlayerPed(-1), 4, 21, 0, 0)
					elseif PedGender == 2 then
						SetPedComponentVariation(GetPlayerPed(-1), 4, 15, 0, 0)
					end
				elseif WarMenu.Button('Take off Shoes') then
					if PedGender == 1 then
						SetPedComponentVariation(GetPlayerPed(-1), 6, 34, 0, 0)
					elseif PedGender == 2 then
						SetPedComponentVariation(GetPlayerPed(-1), 6, 35, 0, 0)
					end
				elseif WarMenu.MenuButton('Back to accessoires', 'WardrobeAccessoires') then
				end
				WarMenu.Display()
			elseif IsControlJustPressed(0, 51) and atcloth and PlayerData.job.name == 'police' then
				playerped = GetPlayerPed(-1)
				if GetEntityModel(playerped) == GetHashKey('mp_m_freemode_01') then
					PedGender = 1
					VariantList = ListMaleGloveVariants
					BodyStyleList = ListMaleBodyStyles
					StyleNumberList = ListMaleStyleNumbers
					StyleHelpNumberList = ListMaleStyleHelpNumbers
					WarMenu.OpenMenu('WardrobeMain')
				elseif GetEntityModel(playerped) == GetHashKey('mp_f_freemode_01') then
					PedGender = 2
					VariantList = ListFemaleGloveVariants
					BodyStyleList = ListFemaleBodyStyles
					StyleNumberList = ListFemaleStyleNumbers
					StyleHelpNumberList = ListFemaleStyleHelpNumbers
					WarMenu.OpenMenu('WardrobeMain')
				else
					Notify('You need a mp ped to use the the wardrobe.')
				end
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
		Wait(1000)
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
garagelocation = nil
garagepolice = nil

if ActivateGarages then

	local ListWarMenuGarage = {}

	CreateThread(function()
		while true do
			for i,coord in ipairs(list_cars_coords) do
				local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
				local distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
				if distance < 5 then
					garagelocation = coord.handle
					garagepolice = list_handles[garagelocation][1].handles[garagelocation].name

					if garagepolice == 'lspd' then
						ListWarMenuGarage = ListLSPDGarage
					elseif garagepolice == 'bcso' then
						ListWarMenuGarage = ListBCSOGarage
					elseif garagepolice == 'sasp' then
						ListWarMenuGarage = ListSASPGarage
					elseif garagepolice == 'sapr' then
						ListWarMenuGarage = ListSAPRGarage
					elseif garagepolice == 'swat' then
						ListWarMenuGarage = ListSWATGarage
					elseif garagepolice == 'dpos' then
						ListWarMenuGarage = ListDPOSGarage
					elseif garagepolice == 'heli' then
						ListWarMenuGarage = ListHELIGarage
					elseif garagepolice == 'lsfd' then
						ListWarMenuGarage = ListFIREGarage
					elseif garagepolice == 'bcfd' then
						ListWarMenuGarage = ListFIREGarage
					end

					atgarage = true
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
					garagelocation = nil
					garagepolice = nil
					WarMenu.CloseMenu()
				end
			end
			Wait(1000)
		end
	end)

	CreateThread(function()
		local ChosenCar = nil
		local ChosenCarName = nil
		local LicensePlateTypeList = {}
		local LicensePlateTextList = {}
		local ChosenLicensePlateText = ""
		local PrimaryColorsList = {}
		local PrimaryColorsNames = {}
		local PrimaryColorsIndex = {}
		local SecondaryColorsList = {}
		local SecondaryColorsNames = {}
		local SecondaryColorsIndex = {}
		local LiveryList = {}
		local LiveryNames = {}
		local LiveryIndex = {}
		local ExtrasList = {}
		local ExtrasNames = {}
		local ExtrasOptionIndex = {}
		local ExtrasOptionNames = {}
		local ExtrasCurrentList = {}
		local ExtrasSelectedList = {}

		local LicensePlateCurrent = 1
		local LicensePlateSelected = 1
		local PrimaryColorsCurrent = 1
		local PrimaryColorsSelected = 1
		local SecondaryColorsCurrent = 1
		local SecondaryColorsSelected = 1
		local LiveryCurrent = 1
		local LiverySelected = 1

		WarMenu.CreateMenu('Garage', 'Garage')
		WarMenu.CreateSubMenu('Customization', 'Garage', 'Customization')

		while true do
			if WarMenu.IsMenuOpened('Garage') then
				for i, Carname in ipairs(ListWarMenuGarage[2]) do
					if WarMenu.MenuButton(Carname, 'Customization') then
						LicensePlateCurrent = 1
						LicensePlateSelected = 1
						PrimaryColorsCurrent = 1
						PrimaryColorsSelected = 1
						SecondaryColorsCurrent = 1
						SecondaryColorsSelected = 1
						LiveryCurrent = 1
						LiverySelected = 1
						ChosenCar = ListWarMenuGarage[3][i]
						ChosenCarName = Carname
						LicensePlateTypeList = {}
						LicensePlateTextList = {}
						PrimaryColorsList = {}
						PrimaryColorsNames = {}
						PrimaryColorsIndex = {}
						LicensePlateTypeList = ListWarMenuGarage[1][i].LicensePlateType
						LicensePlateTextList = ListWarMenuGarage[1][i].LicensePlateText
						PrimaryColorsList = ListWarMenuGarage[1][i].PrimaryColors
						for i, Color in ipairs(PrimaryColorsList) do
							table.insert(PrimaryColorsNames, Color[2])
							table.insert(PrimaryColorsIndex, Color[1])
						end
						SecondaryColorsList = {}
						SecondaryColorsNames = {}
						SecondaryColorsIndex = {}
						SecondaryColorsList = ListWarMenuGarage[1][i].SecondaryColors
						for i, Color in ipairs(SecondaryColorsList) do
							table.insert(SecondaryColorsNames, Color[2])
							table.insert(SecondaryColorsIndex, Color[1])
						end
						LiverList = {}
						LiveryNames = {}
						LiveryIndex = {}
						LiveryList = ListWarMenuGarage[1][i].Liveries
						for i, Livery in ipairs(LiveryList) do
							table.insert(LiveryNames, Livery[2])
							table.insert(LiveryIndex, Livery[1])
						end
						ExtrasList = {}
						ExtrasCurrentList = {}
						ExtrasSelectedList = {}
						ExtrasNames = {}
						ExtrasOptionIndex = {}
						ExtrasOptionNames = {}
						ExtrasList = ListWarMenuGarage[1][i].Extras
						for i, ExtrasOption in ipairs(ExtrasList) do
							table.insert(ExtrasCurrentList, 1)
							table.insert(ExtrasSelectedList, 1)
							local ExtrasOptionIndexTable = {}
							local ExtrasOptionNamesTable = {}
							for i, Option in ipairs(ExtrasOption.Options) do
								table.insert(ExtrasOptionIndexTable, Option[1])
								table.insert(ExtrasOptionNamesTable, Option[2])
							end
							table.insert(ExtrasNames, ExtrasOption.name)
							table.insert(ExtrasOptionIndex, ExtrasOptionIndexTable)
							table.insert(ExtrasOptionNames, ExtrasOptionNamesTable)
						end
					end
				end
				if WarMenu.Button('Exit Menu') then
					WarMenu.CloseMenu()
				end
				WarMenu.Display()
			elseif WarMenu.IsMenuOpened('Customization') then
				if WarMenu.ComboBox('License Plate Type', LicensePlateTypeList, LicensePlateCurrent, LicensePlateSelected, function(currentIndex, selectedIndex)
						LicensePlateCurrent = currentIndex
						selectedIndex = currentIndex
						LicensePlateSelected = selectedIndex

					end) then
				end
				if LicensePlateTextList[1] == 'None' or #LicensePlateTextList == 0 then
					ChosenLicensePlateText = ""
				elseif LicensePlateTextList[1] == 'Custom' then
					if WarMenu.Button('License Plate Text') then
						LicensePlateTextHead = "License Plate Text (8 chars maximum)"
						LicensePlateTextInside = ""
						AddTextEntry('LicensePlateTextLabel', LicensePlateTextHead)
						DisplayOnscreenKeyboard(6, 'LicensePlateTextLabel', "", LicensePlateTextInside, "", "", "", 8)
						while (UpdateOnscreenKeyboard() == 0) do
							DisableAllControlActions(0)
							Wait(0)
						end
						if (GetOnscreenKeyboardResult()) then
							ChosenLicensePlateText = GetOnscreenKeyboardResult()
						end
					end
				else
					ChosenLicensePlateText = LicensePlateTextList[math.random(1, #LicensePlateTextList)]
				end
				if WarMenu.ComboBox('Primary Colors', PrimaryColorsNames, PrimaryColorsCurrent, PrimaryColorsSelected, function(currentIndex, selectedIndex)
						PrimaryColorsCurrent = currentIndex
						selectedIndex = currentIndex
						PrimaryColorsSelected = selectedIndex

					end) then

				elseif WarMenu.ComboBox('Secondary Colors', SecondaryColorsNames, SecondaryColorsCurrent, SecondaryColorsSelected, function(currentIndex, selectedIndex)
						SecondaryColorsCurrent = currentIndex
						selectedIndex = currentIndex
						SecondaryColorsSelected = selectedIndex
					end) then

				end
				if #LiveryNames > 0 then
					if WarMenu.ComboBox('Livery', LiveryNames, LiveryCurrent, LiverySelected, 	function(currentIndex, selectedIndex)
							LiveryCurrent = currentIndex
							selectedIndex = currentIndex
							LiverySelected = selectedIndex

						end) then

					end
				end
				for i, Extra in ipairs(ExtrasNames) do
					if WarMenu.ComboBox(Extra, ExtrasOptionNames[i], ExtrasCurrentList[i], ExtrasSelectedList[i], function(currentIndex, selectedIndex)
							ExtrasCurrentList[i] = currentIndex
							selectedIndex = currentIndex
							ExtrasSelectedList[i] = selectedIndex
						end) then

					end
				end
				if WarMenu.Button('Spawn Vehicle', ChosenCarName) then
					local ChosenExtrasList = {}
					for i, number in ipairs(ExtrasCurrentList) do
						table.insert(ChosenExtrasList, ExtrasOptionIndex[i][number])
					end
					spawnCar(ChosenCar, LicensePlateTypeList[LicensePlateCurrent], ChosenLicensePlateText, PrimaryColorsIndex[PrimaryColorsCurrent], SecondaryColorsIndex[SecondaryColorsCurrent], LiveryIndex[LiveryCurrent], ChosenExtrasList)

					WarMenu.CloseMenu()
				elseif WarMenu.MenuButton('Go back to list', 'Garage') then
				end
				WarMenu.Display()
			elseif IsControlJustPressed(0, 51) and atgarage and PlayerData.job.name == 'police' then
				WarMenu.OpenMenu('Garage')
			end
			Wait(0)
		end
	end)

end

function spawnCar(carname, LicensePlateType, ChosenLicensePlateText, PrimaryColor, SecondaryColor, Livery, Extras)
  local car = GetHashKey(carname)
	local isspawned = false
	local vehicle = nil
  RequestModel(car)
  while not HasModelLoaded(car) do
      RequestModel(car)
      Citizen.Wait(50)
  end

	for i,coord in ipairs(list_cars_spawns) do
		if garagelocation == coord.handle then
			if IsAnyVehicleNearPoint(coord.x, coord.y, coord.z, 5.0) then
				Notify('Please remove the vehicle that is blocking the spawn point.')
			else
				vehicle = CreateVehicle(car, coord.x, coord.y, coord.z, coord.angle, true, false)
				SetVehicleNeonLightEnabled(vehicle, 2, true)
				SetVehicleNumberPlateTextIndex(vehicle, LicensePlateType)
				if (not (ChosenLicensePlateText == '')) then
					SetVehicleNumberPlateText(vehicle, ChosenLicensePlateText)
				end
				SetVehicleColours(vehicle, PrimaryColor, SecondaryColor)
				SetVehicleLivery(vehicle, Livery)
				for i = 1, 14, 1 do
					SetVehicleExtra(vehicle, i, 1)
				end
				for i, Extra in ipairs(Extras) do
					if Extra ~= 'None' then
						SetVehicleExtra(vehicle, Extra, 0)
					end
				end
			end
			isspawned = true
		end
	end

	if not isspawned then
		Notify("Vehicle couldn't be spawned.")
	else
		isspawned = false
	end

	if DoesBlipExist(PersonalVehicleBlip) then
		local VehicleID = GetBlipInfoIdEntityIndex(PersonalVehicleBlip)
		DeleteEntity(VehicleID)
		RemoveBlip(PersonalVehicleBlip)
	end

	SetEntityAsMissionEntity(vehicle, true, true)
	PersonalVehicleBlip = AddBlipForEntity(vehicle)

	if IsThisModelABicycle(car) or IsThisModelABike(car) or IsThisModelAQuadbike(car) or IsThisModelAnAmphibiousQuadbike(car) then
		SetBlipSprite(PersonalVehicleBlip, 348)
	elseif IsThisModelABoat(car) or IsThisModelAJetski(car) then
		SetBlipSprite(PersonalVehicleBlip, 427)
	elseif IsThisModelAHeli(car) or IsThisModelAPlane(car) then
		SetBlipSprite(PersonalVehicleBlip, 422)
	else
		SetBlipSprite(PersonalVehicleBlip, 326)
	end
	SetBlipColour(PersonalVehicleBlip, 0)
	SetBlipAlpha(PersonalVehicleBlip, 255)
	SetBlipScale(PersonalVehicleBlip, 1.0)
	SetBlipDisplay(PersonalVehicleBlip, 2)
	SetVehicleCanBeUsedByFleeingPeds(vehicle, false)
	local VehicleName = GetLabelText(GetDisplayNameFromVehicleModel(car))
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(VehicleName)
	EndTextCommandSetBlipName(PersonalVehicleBlip)
	SetModelAsNoLongerNeeded(vehicleName)
end


-- -- Weapons
atweapon = false
weaponlocation = nil
weaponpolice = nil

if ActivateWeaponMarkers then

	local ListWarMenuArmory = {}

	CreateThread(function()
		while true do
			for i,coord in ipairs(list_weap_coords) do
				local player_x, player_y, player_z = table.unpack(GetEntityCoords(PlayerPedId(), false))
				local distance = Vdist2(coord.x, coord.y, coord.z, player_x, player_y, player_z)
				if distance < 5 then
					weaponlocation = coord.handle
					weaponpolice = list_handles[weaponlocation][1].handles[weaponlocation].name

					if weaponpolice == 'lspd' then
						ListWarMenuArmory = ListLSPDArmory
					elseif weaponpolice == 'bcso' then
						ListWarMenuArmory = ListBCSOArmory
					elseif weaponpolice == 'sasp' then
						ListWarMenuArmory = ListSASPArmory
					elseif weaponpolice == 'sapr' then
						ListWarMenuArmory = ListSAPRArmory
					elseif weaponpolice == 'swat' then
						ListWarMenuArmory = ListSWATArmory
					end

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
					weaponlocation = nil
					weaponpolice = nil
					WarMenu.CloseMenu()
				end
			end
		Wait(1000)
		end
	end)

	CreateThread(function()
		local playerped = nil
		local isMale = false
		local ArmorAllowed = false
		local CurrentArmorDrawable = 0
		local CurrentArmorTexture = 0

		local SelectedWeapon = nil
		local AttachmentBoolList = {}

		local VestCurrentIndex = 1
		local VestSelectedIndex = 1
		local VestDesignCurrentIndex = 1
		local VestDesignSelectedIndex = 1
		local VestList = {
			data = {},
			names = {},
		}
		local VestDesignList = {
			index = {},
			data = {},
		}

		WarMenu.CreateMenu('Armory', 'Armory')
		WarMenu.CreateSubMenu('Weapons', 'Armory', 'Weapons')
		WarMenu.CreateSubMenu('AttachmentsW', 'Weapons', 'Attachments')
		WarMenu.CreateSubMenu('AttachmentsE', 'Equipment', 'Attachments')
		WarMenu.CreateSubMenu('Equipment', 'Armory', 'Equipment')

		while true do
			if WarMenu.IsMenuOpened('Armory') then
				if WarMenu.MenuButton('Weapons', 'Weapons') then
					VestCurrentIndex = 1
					VestSelectedIndex = 1
					VestDesignCurrentIndex = 1
					VestDesignSelectedIndex = 1
				elseif WarMenu.MenuButton('Equipment', 'Equipment') then
					VestCurrentIndex = 1
					VestSelectedIndex = 1
					VestDesignCurrentIndex = 1
					VestDesignSelectedIndex = 1
				elseif WarMenu.Button('Exit Menu') then
					WarMenu.CloseMenu()
				end
				WarMenu.Display()
			elseif WarMenu.IsMenuOpened('Weapons') then
				SelectedWeapon = nil
				AttachmentBoolList = {}
				VestList = {
					data = {},
					names = {},
				}
				VestDesignList = {
					index= {},
					data= {},
				}

				for i, weapon in ipairs(ListWarMenuArmory[2].data) do

					if weapon.attachments.HasAttachments then
						if WarMenu.MenuButton(weapon.name, 'AttachmentsW') then
							SelectedWeapon = weapon
							for i, Component in ipairs(SelectedWeapon.attachments.Components) do
								table.insert(AttachmentBoolList, false)
							end
							GiveWeaponToPed(playerped, GetHashKey(weapon.handle), weapon.ammo, false, true)
						end
					elseif weapon.armor.IsArmor then

					else
						if WarMenu.Button(weapon.name) then
							GiveWeaponToPed(playerped, GetHashKey(weapon.handle), weapon.ammo, false, true)
						end
					end

				end
				if WarMenu.MenuButton('Go back to main menu', 'Armory') then
				end

				WarMenu.Display()
			elseif WarMenu.IsMenuOpened('AttachmentsW') then
				for i, Component in ipairs(SelectedWeapon.attachments.Components) do
					if WarMenu.CheckBox(Component[2], AttachmentBoolList[i]) then
						AttachmentBoolList[i] = not AttachmentBoolList[i]
						if AttachmentBoolList[i] then
							if not HasPedGotWeaponComponent(playerped, GetHashKey(SelectedWeapon.handle), GetHashKey(Component[1]) ) then
								GiveWeaponComponentToPed(playerped, GetHashKey(SelectedWeapon.handle), GetHashKey(Component[1]) )
							end
						else
							if HasPedGotWeaponComponent(playerped, GetHashKey(SelectedWeapon.handle), GetHashKey(Component[1]) ) then
								RemoveWeaponComponentFromPed(playerped, GetHashKey(SelectedWeapon.handle), GetHashKey(Component[1]) )
							end
						end
					end
				end
				if WarMenu.MenuButton('Go back to Weapon List', 'Weapons') then
				end
				WarMenu.Display()
			elseif WarMenu.IsMenuOpened('Equipment') then
				SelectedWeapon = nil
				AttachmentBoolList = {}
				VestList = {
					data = {},
					names = {},
				}
				VestDesignList = {
					index= {},
					data= {},
				}

				if isMale then
					ArmoryUnderarmorVestDefinition.armor.CompVars.Male[1] = {9,CurrentArmorDrawable, CurrentArmorTexture}
				else
					ArmoryUnderarmorVestDefinition.armor.CompVars.Female[1] = {9,CurrentArmorDrawable, CurrentArmorTexture}
				end

				table.insert(VestList.data, ArmoryUnderarmorVestDefinition)
				table.insert(VestList.names, ArmoryUnderarmorVestDefinition.name)

				for i, weapon in ipairs(ListWarMenuArmory[1].data) do

					if weapon.attachments.HasAttachments then
						if WarMenu.MenuButton(weapon.name, 'AttachmentsE') then
							SelectedWeapon = weapon
							for i, Component in ipairs(SelectedWeapon.attachments.Components) do
								table.insert(AttachmentBoolList, false)
							end
							GiveWeaponToPed(playerped, GetHashKey(weapon.handle), weapon.ammo, false, true)
						end
					elseif weapon.armor.IsArmor then
						if ArmorAllowed then
							table.insert(VestList.data, weapon)
							table.insert(VestList.names, weapon.name)
						end
					else
						if WarMenu.Button(weapon.name) then
							GiveWeaponToPed(playerped, GetHashKey(weapon.handle), weapon.ammo, false, true)
						end
					end
				end
				if #VestList.data > 0 then
					if WarMenu.ComboBox('Vests', VestList.names, VestCurrentIndex, VestSelectedIndex, function(currentIndex, selectedIndex)
							VestCurrentIndex = currentIndex
							if VestCurrentIndex ~= VestSelectedIndex then
								VestDesignCurrentIndex = 1
								VestDesignSelectedIndex = 1
							end
							selectedIndex = currentIndex
							VestSelectedIndex = selectedIndex
							SetPedArmour(playerped, VestList.data[VestCurrentIndex].armor.ArmorValue)
							if isMale then
								VestDesignList.data = VestList.data[VestCurrentIndex].armor.CompVars.Male
								for i = 1, #VestDesignList.data, 1 do
									table.insert(VestDesignList.index, i)
								end
							else
								VestDesignList.data = VestList.data[VestCurrentIndex].armor.CompVars.Female
								for i = 1, #VestDesignList.data, 1 do
									table.insert(VestDesignList.index, i)
								end
							end

						end) then

					elseif WarMenu.ComboBox('Vestdesign', VestDesignList.index, VestDesignCurrentIndex, VestDesignSelectedIndex, function(currentIndex, selectedIndex)
							VestDesignCurrentIndex = currentIndex
							selectedIndex = currentIndex
							VestDesignSelectedIndex = selectedIndex
							SetPedComponentVariation(playerped, VestDesignList.data[VestDesignCurrentIndex][1], VestDesignList.data[VestDesignCurrentIndex][2], VestDesignList.data[VestDesignCurrentIndex][3], 0)
						end) then
					end
				end
				if WarMenu.MenuButton('Go back to main menu', 'Armory') then
				end
				WarMenu.Display()
			elseif WarMenu.IsMenuOpened('AttachmentsE') then
				for i, Component in ipairs(SelectedWeapon.attachments.Components) do
					if WarMenu.CheckBox(Component[2], AttachmentBoolList[i]) then
						AttachmentBoolList[i] = not AttachmentBoolList[i]
						if AttachmentBoolList[i] then
							if not HasPedGotWeaponComponent(playerped, GetHashKey(SelectedWeapon.handle), GetHashKey(Component[1]) ) then
								GiveWeaponComponentToPed(playerped, GetHashKey(SelectedWeapon.handle), GetHashKey(Component[1]) )
							end
						else
							if HasPedGotWeaponComponent(playerped, GetHashKey(SelectedWeapon.handle), GetHashKey(Component[1]) ) then
								RemoveWeaponComponentFromPed(playerped, GetHashKey(SelectedWeapon.handle), GetHashKey(Component[1]) )
							end
						end
					end
				end
				if WarMenu.MenuButton('Go back to Equipment List', 'Equipment') then
				end
				WarMenu.Display()
			elseif IsControlJustPressed(0, 51) and atweapon and PlayerData.job.name == 'police' then
				playerped = GetPlayerPed(-1)
				isMale = false
				if GetEntityModel(playerped) == GetHashKey('mp_m_freemode_01') then
					isMale = true
				end

				ArmorAllowed = false
				local CurrentTop = GetPedDrawableVariation(playerped, 11)
				if isMale then
					if ListMaleArmorAllowed[CurrentTop] == true then
						ArmorAllowed = true
					end
				else
					if ListFemaleArmorAllowed[CurrentTop] == true then
						ArmorAllowed = true
					end
				end

				CurrentArmorDrawable = GetPedDrawableVariation(playerped, 9)
				CurrentArmorTexture = GetPedTextureVariation(playerped, 9)

				WarMenu.OpenMenu('Armory')
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
		Wait(1000)
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
			for i,coord in ipairs(list_help_coords) do
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
		Wait(1000)
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

				if IsInputDisabled(2) then
					BeginTextCommandThefeedPost("TWOSTRINGS")
					AddTextComponentSubstringPlayerName("Press ~g~E~s~ while looking at a ped to talk to them.")
					EndTextCommandThefeedPostTicker(false, false)

					BeginTextCommandThefeedPost("TWOSTRINGS")
					AddTextComponentSubstringPlayerName("Hold ~r~X~s~ to see what actions you can perform. Move your mouse on a tile and release X")
					AddTextComponentSubstringPlayerName("to carry it out.")
					EndTextCommandThefeedPostTicker(false, false)
				else
					BeginTextCommandThefeedPost("TWOSTRINGS")
					AddTextComponentSubstringPlayerName("Press ~g~DPad Right~s~ while looking at a ped to talk to them.")
					EndTextCommandThefeedPostTicker(false, false)

					BeginTextCommandThefeedPost("TWOSTRINGS")
					AddTextComponentSubstringPlayerName("Press ~r~DPad Down~s~ to see what actions you can perform. Use your analog stick")
					AddTextComponentSubstringPlayerName("to move the cursor on a tile. Press DPad Down to carry it out.")
					EndTextCommandThefeedPostTicker(false, false)
				end

				BeginTextCommandThefeedPost("TWOSTRINGS")
				AddTextComponentSubstringPlayerName("When performing actions make sure you are looking at the right person")
				AddTextComponentSubstringPlayerName("and have informed said person about your action!")
				EndTextCommandThefeedPostTicker(false, false)


				BeginTextCommandThefeedPost("TWOSTRINGS")
				AddTextComponentSubstringPlayerName("Type ~o~/tp~s~ in the chat to open the teleporting menu.")
				EndTextCommandThefeedPostTicker(false, false)

				BeginTextCommandThefeedPost("TWOSTRINGS")
				AddTextComponentSubstringPlayerName("Type ~o~/rank~s~ in the chat to select your rank in each department.")
				EndTextCommandThefeedPostTicker(false, false)
			end
		Wait(0)
		end
	end)
end
