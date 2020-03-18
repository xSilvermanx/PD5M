--[[table.insert(list_arrest_coords, {x=,y=,z=})
table.insert(list_cloth_coords, {x=-1467.96,y=-537.52,z=49.73})
table.insert(list_heal_coords, {x=-1461.44,y=-531.7,z=50.22})
table.insert(list_cars_coords, {x=,y=,z=})
local list_tut_spawns = {{x=, y=, z=}}
table.insert(list_spawns, list_tut_spawns)
table.insert(list_weap_coords, {x=,y=,z=})
table.insert(list_evidence_coords, {x=,y=,z=})



RegisterNetEvent('pd5m:tut:starttutorial')
AddEventHandler('pd5m:tut:starttutorial', function()
	local PlayerModel = GetEntityModel(GetPlayerPed(-1))
	if PlayerModel == GetHashKey('mp_m_freemode_01') or PlayerModel == GetHashKey('mp_f_freemode_01') then
		TriggerEvent('pd5m:tut:tptoappartment')
	else
		Notify('Please create a mp-ped using vMenu (press M) before starting the tutorial.')
	end
end)

AddEventHandler('pd5m:tut:tptoappartment', function()
	
end)]]
