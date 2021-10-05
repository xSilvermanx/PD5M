

-- Cleans up Blips on the map and the ClientPedBlipList
-- Deletes the blip if the specific ped is either dead or despawned
CreateThread(function()
	while true do
		for i, Blip in ipairs(ClientPedBlipList) do
			if not DoesBlipExist(Blip) then
				RemoveBlip(Blip)
				table.remove(ClientPedBlipList, i)
			elseif IsEntityDead(GetBlipInfoIdEntityIndex(Blip)) or not DoesEntityExist(GetBlipInfoIdEntityIndex(Blip)) then
				RemoveBlip(Blip)
				table.remove(ClientPedBlipList, i)
			end
		end
		Wait(10000)
	end
end)

-- Cleans up the lists which IDs / licences the player got from peds
-- Deletes the information if the specific ped is either dead or despawned
CreateThread(function()
	while true do
		for i, NetID in ipairs(ClientPlayerGotPedIDList) do
			if not DoesEntityExist(NetToPed(NetID)) then
				table.remove(ClientPlayerGotPedIDList, i)
			elseif IsEntityDead(NetToPed(NetID)) then
				table.remove(ClientPlayerGotPedIDList, i)
			end
		end
		for i, NetID in ipairs(ClientPlayerGotPedDriverLicenceList) do
			if not DoesEntityExist(NetToPed(NetID)) then
				table.remove(ClientPlayerGotPedDriverLicenceList, i)
			elseif IsEntityDead(NetToPed(NetID)) then
				table.remove(ClientPlayerGotPedDriverLicenceList, i)
			end
		end
		for i, NetID in ipairs(ClientPlayerGotPedWeaponPermitList) do
			if not DoesEntityExist(NetToPed(NetID)) then
				table.remove(ClientPlayerGotPedWeaponPermitList, i)
			elseif IsEntityDead(NetToPed(NetID)) then
				table.remove(ClientPlayerGotPedWeaponPermitList, i)
			end
		end
		Wait(10000)
	end
end)

-- ToDo: Create a Thread that cleans up MissionEntities from players
-- needs to be synced to server and every client in some way
-- needs a way to determine if mission npcs are needed

RegisterNetEvent('pd5m:cleanup:SetEntityAsNoLongerNeeded')
AddEventHandler('pd5m:cleanup:SetEntityAsNoLongerNeeded', function(EntityNetID)
	if DoesEntityExist(NetToEnt(EntityNetID)) then
		local entity = NetToEnt(EntityNetID)
  	SetEntityAsNoLongerNeeded(entity)
	end
end)

RegisterNetEvent('pd5m:cleanup:SetEntityWander')
AddEventHandler('pd5m:cleanup:SetEntityWander', function(TargetNetID)
	local target = NetToPed(TargetNetID)
	if DoesEntityExist(target) and not IsEntityDead(target) and GetEntityType(target) == 1 then
		if IsPedInAnyVehicle(target, false) then
			local vehicle = GetVehiclePedIsIn(target, false)
			TaskVehicleDriveWander(target, vehicle, 17.0, PedDrivingBehavior)
		else
			TaskWanderStandard(target, 10.0, 10)
		end
	end
end)
