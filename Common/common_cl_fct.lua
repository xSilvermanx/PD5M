local color = {r=220, g=220, b=220, alpha=255}
local font = 0
local backgroundcolor = { r = 35, g = 35, b = 35, alpha = 200 }

--shows text the player's character is saying
--don't use this, trigger 'pd5m:syncsv:ShowCommunication'
function PrintTextAtBottom(text, displaytime)
	local displaying = true
	CreateThread(function()
		Wait(displaytime)
		displaying = false
	end)
	
	CreateThread(function()
	while displaying do
		SetTextColour(color.r, color.g, color.b, color.alpha)
		SetTextFont(font)
		SetTextProportional(1)
		SetTextScale(0.0, 0.4)
		SetTextWrap(0.25, 0.75)
		SetTextJustification(0)
		
		BeginTextCommandWidth("STRING")
		AddTextComponentString(text)
		local height = GetTextScaleHeight(0.4, font)
		local width = EndTextCommandGetWidth(font)
		
		BeginTextCommandLineCount("STRING")
		AddTextComponentString(text)
		local linecount = EndTextCommandGetLineCount(0.5, 0.85)
		
		BeginTextCommandDisplayText("STRING")
		AddTextComponentString(text)
		EndTextCommandDisplayText(0.5, 0.85)
		DrawRect(0.5, 0.85+0.7/45, width, height + 0.0051, backgroundcolor.r, backgroundcolor.g, backgroundcolor.b, backgroundcolor.alpha)
		if linecount > 1 then
			DrawRect(0.5, 0.8775+0.7/45, width, height + 0.0051, backgroundcolor.r, backgroundcolor.g, backgroundcolor.b, backgroundcolor.alpha)
		end
		if linecount > 2 then
			DrawRect(0.5, 0.905+0.7/45, width, height + 0.0051, backgroundcolor.r, backgroundcolor.g, backgroundcolor.b, backgroundcolor.alpha)
		end
		if linecount > 3 then
			DrawRect(0.5, 0.9325+0.7/45, width, height + 0.0051, backgroundcolor.r, backgroundcolor.g, backgroundcolor.b, backgroundcolor.alpha)
		end
		
		Wait(0)
	end
	end)
end

--shows text every ped apart from the player's character is saying, including other players
--don't use this, trigger 'pd5m:syncsv:ShowCommunication'
function PrintTextOverPedHead(TalkingPed, text, displaytime)
	local tx,ty,tz = table.unpack(GetEntityCoords(TalkingPed, false))
	local px,py,pz = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
	
	local PedNetID = PedToNet(TalkingPed)
	
	if Vdist2(tx,ty,tz,px,py,pz) < 2500 and HasEntityClearLosToEntity(GetPlayerPed(-1), TalkingPed, 17) then
		
		CurrentlyDisplayingList["" .. PedNetID] = true
		CreateThread(function()
			Wait(displaytime)
			CurrentlyDisplayingList["" .. PedNetID] = false
		end)
		
		CreateThread(function()
		while CurrentlyDisplayingList["" .. PedNetID] == true do
			local tx,ty,tz = table.unpack(GetEntityCoords(TalkingPed, false))
			local px,py,pz = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
			local dist = GetDistanceBetweenCoords(px,py,pz, tx,ty,tz, 1)
			tz = tz + 1.14
			local onScreen,_x,_y = GetScreenCoordFromWorldCoord(tx,ty,tz)
			local scale = ((1/math.sqrt(dist))*2)*(1/GetGameplayCamFov())*100
			if HasEntityClearLosToEntity(GetPlayerPed(-1), TalkingPed, 17) then
				SetTextColour(color.r, color.g, color.b, color.alpha)
				SetTextScale(0.0*scale, 0.19*scale)
				SetTextFont(font)
				SetTextProportional(1)
				SetTextWrap(0.25, 0.75)
				SetTextCentre(true)
				
				BeginTextCommandDisplayText("STRING")
				AddTextComponentString(text)
				EndTextCommandDisplayText(_x, _y)
			end
			Wait(0)
		end
		CurrentlyDisplayingList["" .. PedNetID] = nil
		end)
	end
end

-- shows a notification on the bottom left
-- usage: Notify(STRING)
function Notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, false)
end

-- this is used to show help messages for the controls.
-- StartHelpNotify beeps non-looped
-- HelpNotify doesn't beep in a loop.
-- Use EndHelpNotify to stop the loop (no beep as well).
function StartHelpNotify(text, duration)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentString(text)
	EndTextCommandDisplayHelp(0,0, 1, duration)
end

function HelpNotify(text, duration)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentString(text)
	EndTextCommandDisplayHelp(0,1, 0, duration)
end

function EndHelpNotify(text, duration)
	BeginTextCommandDisplayHelp("STRING")
	AddTextComponentString(text)
	EndTextCommandDisplayHelp(0, 0, 0, duration)
end

-- returns the first hit ped between two points on the map
-- usage: bool, Vector3, EntityId = GetPedInDirection(Vector3, Vector3)
function GetPedInDirection(coordFrom, coordTo)
	local rayHandle = StartShapeTestRay(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 4, GetPlayerPed(-1), 0)
	local _,flag_PedHit,PedCoords,_,PedHit = GetShapeTestResult(rayHandle)
	return flag_PedHit, PedCoords, PedHit
end

-- returns the first hit vehicle between two points on the map
-- usage: bool, Vector3, EntityId = GetVehInDirection(Vector3, Vector3)
function GetVehInDirection(coordFrom, coordTo)
	local rayHandle = StartShapeTestRay(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 2, GetPlayerPed(-1), 0)
	local _,flag_VehHit,VehCoords,_,VehHit = GetShapeTestResult(rayHandle)
	return flag_VehHit, VehCoords, VehHit
end

-- returns the vector in which direction the player is looking (middle of the screen). Works first and third person
-- only use this for the local player, not other players' peds
-- usage: Vector3 = GetPlayerLookingVector(GetPlayerPed(-1), INT)
function GetPlayerLookingVector(playerped, radius)
	local pedyaw = GetEntityHeading(playerped)
	local camyaw = GetGameplayCamRelativeHeading()
	local pitch = 90.0-GetGameplayCamRelativePitch()
	local yaw = pedyaw + camyaw
	
	if yaw > 180 then
		yaw = yaw - 360
	elseif yaw < -180 then
		yaw = yaw + 360
	end	
	local pitch = pitch * math.pi / 180
	local yaw = yaw * math.pi / 180
	local x = radius * math.sin(pitch) * math.sin(yaw)
	local y = radius * math.sin(pitch) * math.cos(yaw)
	local z = radius * math.cos(pitch)
	local playerpedcoords = GetGameplayCamCoord()
	local xcorr = -x+ playerpedcoords.x
	local ycorr = y+ playerpedcoords.y
	local zcorr = z+ playerpedcoords.z
	local Vector = vector3(tonumber(xcorr), tonumber(ycorr), tonumber(zcorr))
	return Vector
end

-- loads the specified ped-animation dictionary
-- usage: loadAnimDict(STRING)
function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Wait( 0 )
    end
end

-- returns the ped gender as a string
-- usage: STRING = GetPedGender(EntityId)
function GetPedGender(target)
	local PedGender = GetPedType(target)
	if PedGender == 5 then
		PedGender = 'Female'
	elseif PedGender == 4 then
		PedGender = 'Male'
	else
		PedGender = 'Male'
	end
	return(PedGender)
end

-- Main Sync-function, syncs peds and vehicles
-- to sync only ped or vehicle, use either target = 0 or targetveh = 0
-- syncing ped and vehicle at the same time syncs them together so the vehicle will belong to said ped
-- resulting TargetFlagListIndex, TargetVehFlagListIndex are the indices of the the ClientPedConfigList / ClientVehConfigList for the specified Ped / vehicle
-- use this function if you need the flag list indices as well
-- usage: INT, INT = SyncPedAndVeh(EntityId, EntityId)
function SyncPedAndVeh(target, targetveh)
	local TargetFlagListIndex = 0
	local TargetVehFlagListIndex = 0
	local TargetNetID = 0
	local TargetVehNetID = 0
	
	if target == 0 then
	else
		TargetNetID = PedToNet(target)
	end
	
	if targetveh == 0 then
	else
		TargetVehNetID = VehToNet(targetveh)
	end
	
	if target ~= 0 and (TargetNetID == 0 or TargetNetID == nil) then
		NetworkRegisterEntityAsNetworked(target)
		TargetNetID = PedToNet(target)
	end
	if targetveh ~= 0 and (TargetVehNetID == 0 or TargetVehNetID == nil) then
		NetworkRegisterEntityAsNetworked(targetveh)
		TargetVehNetID = VehToNet(targetveh)
	end

	if target ~= 0 then
		for i, ID in ipairs(ClientPedList) do
			if ID == TargetNetID then
				TargetFlagListIndex = i
				break
			end
		end
		if TargetFlagListIndex == 0 then
			local PedGender = GetPedGender(target)
			TriggerServerEvent('pd5m:intsv:AddPedToList', TargetNetID, PedGender)
			Wait(10)
			while TargetFlagListIndex == 0 do
				TriggerServerEvent('pd5m:syncsv:DatabaseQuery', TargetNetID)
				for i, ID in ipairs(ClientPedList) do
					if ID == TargetNetID then
						TargetFlagListIndex = i
						break
					end
				end
				Wait(10)
			end
		end
		if TargetFlagListIndex == 0 then
			print("Error, didn't find TargetFlagListIndex.")
		else
			if not IsEntityAMissionEntity(target) then
				SetEntityAsMissionEntity(target, true, true)
			end
		end			
	end
	
	if targetveh ~= 0 then
		for i, ID in ipairs(ClientVehList) do
			if ID == TargetVehNetID then
				TargetVehFlagListIndex = i
				break
			end
		end
		if TargetVehFlagListIndex == 0 then
			TriggerServerEvent('pd5m:intsv:AddVehToList', TargetVehNetID)
			Wait(10)
			while TargetVehFlagListIndex == 0 do
				TriggerServerEvent('pd5m:syncsv:VehDatabaseQuery', TargetVehNetID)
				for i, ID in ipairs(ClientVehList) do
					if ID == TargetVehNetID then
						TargetVehFlagListIndex = i
						break
					end
				end
				Wait(10)
			end				
		end
		if TargetVehFlagListIndex == 0 then
			print("Error, didn't find TargetVehFlagListIndex.")
		else
			if not IsEntityAMissionEntity(targetveh) then
				SetEntityAsMissionEntity(targetveh, true, true)
			end
		end
	end
	
	return TargetFlagListIndex, TargetVehFlagListIndex
end

-- rotates a ped to face another ped
-- usage: makeEntityFaceEntity(EntityId, EntityId)
function makeEntityFaceEntity( entity1, entity2 )
    local p1 = GetEntityCoords(entity1, true)
    local p2 = GetEntityCoords(entity2, true)

    local dx = p2.x - p1.x
    local dy = p2.y - p1.y

    local heading = GetHeadingFromVector_2d(dx, dy)
    TaskGoStraightToCoord(entity1, p1.x, p1.y, p1.z, 5.0, -1, heading, 2)
end

-- returns boolean whether a specific ped has registered a certain flag
-- flagname must be one of: 'Stopped', 'Talking', 'NoFear', 'Arrested', 'NoTalk'
-- usage: bool = CheckFlag(INT, STRING)
function CheckFlag(NetID, flagname)
	local boolflag = false
	if flagname == 'Stopped' then
		for i, ID in ipairs(ClientPedStoppedList) do
			if ID == NetID then
				boolflag = true
				break
			end
		end
	elseif flagname == 'Talking' then
		for i, ID in ipairs(ClientPedTalkingList) do
			if ID == NetID then
				boolflag = true
				break
			end
		end
	elseif flagname == 'NoFear' then
		for i, ID in ipairs(ClientPedNoFearList) do
			if ID == NetID then
				boolflag = true
				break
			end
		end
	elseif flagname == 'Arrested' then
		for i, ID in ipairs(ClientPedArrestedList) do
			if ID == NetID then
				boolflag = true
				break
			end
		end
	elseif flagname == 'NoTalk' then
		for i, ID in ipairs(ClientPedNoTalkList) do
			if ID == NetID then
				boolflag = true
				break
			end
		end
	end
	
	return boolflag
end

-- looks for every ped that fulfills a certain condition (e.g. SearchPedEntry('FirstName', 'Jon') will find every ped with first name 'Jon'
-- entryname must be one of PedVariableListGlobal (see def_gl.lua)
-- usage: ListOfFoundPeds = SearchPedEntry(STRING, STRING)
function SearchPedEntry(entryname, entryvalue)
	local resultfound = false
	local ResultList = {}
	local index = nil
	
	TriggerServerEvent('pd5m:syncsv:SearchPedEntry', entryname, entryvalue)
	Wait(200)
	while not resultfound do
		for i, List in ipairs(ClientPedSearchList) do
			if List[1] == entryname and List[2] == entryvalue then
				index = i
				ResultList = List[3]
				resultfound = true
				break		
			end
		end
		Wait(100)
	end
		
	table.remove(ClientPedSearchList, index)
	
	return(ResultList)
end

-- if a vehicle is owned by a ped, this function will sync the relevant data to the VehicleConfigList
-- usage: InputPedDataToVehicleConfig(EntityNetId, VehicleNetId)
function InputPedDataToVehicleConfig(TargetNetID, TargetVehNetID)
	local target = NetToPed(TargetNetID)
	local targetveh = NetToVeh(TargetVehNetID)
	local TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
	local _, TargetVehFlagListIndex = SyncPedAndVeh(0, targetveh)
	local PedGender = ClientPedConfigList[TargetFlagListIndex].PedGender
	local FirstName = ClientPedConfigList[TargetFlagListIndex].FirstName
	local LastName = ClientPedConfigList[TargetFlagListIndex].LastName
	local BirthYear = ClientPedConfigList[TargetFlagListIndex].BirthYear
	local BirthMonth = ClientPedConfigList[TargetFlagListIndex].BirthMonth
	local BirthDay = ClientPedConfigList[TargetFlagListIndex].BirthDay
	
	TriggerServerEvent('pd5m:syncsv:ChangeVehEntry', TargetVehNetID, 'PedNetID', TargetNetID)
	TriggerServerEvent('pd5m:syncsv:ChangeVehEntry', TargetVehNetID, 'PedGender', PedGender)
	TriggerServerEvent('pd5m:syncsv:ChangeVehEntry', TargetVehNetID, 'FirstName', FirstName)
	TriggerServerEvent('pd5m:syncsv:ChangeVehEntry', TargetVehNetID, 'LastName', LastName)
	TriggerServerEvent('pd5m:syncsv:ChangeVehEntry', TargetVehNetID, 'BirthYear', BirthYear)
	TriggerServerEvent('pd5m:syncsv:ChangeVehEntry', TargetVehNetID, 'BirthMonth', BirthMonth)
	TriggerServerEvent('pd5m:syncsv:ChangeVehEntry', TargetVehNetID, 'BirthDay', BirthDay)
	TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'VehicleNetID', TargetVehNetID)
end

-- returns boolean whether a specific vehicle has registered a certain flag
-- flagname must be one of: 'Towing'
-- usage: bool = CheckVehFlag(INT, STRING)
function CheckVehFlag(NetID, flagname)
	local boolflag = false
	if flagname == 'Towing' then
		for i, ID in ipairs(ClientVehTowingList) do
			if ID == NetID then
				boolflag = true
				break
			end
		end
	end
	
	return boolflag
end

-- EntityIter.lua-file made by IllidanS4.
-- Merged into PD5M for easier installation.
local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
  return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
      disposeFunc(iter)
      return
    end
    
    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)
    
    local next = true
    repeat
      coroutine.yield(id)
      next, id = moveFunc(iter)
    until not next
    
    enum.destructor, enum.handle = nil, nil
    disposeFunc(iter)
  end)
end

function EnumerateObjects()
  return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
  return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
  return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end
