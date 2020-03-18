-- Cleans up ClientPedList and ClientPedConfigList
-- Deletes the information if the specific ped is either dead or despawned
-- Triggers a server event to remove the information server side as well
CreateThread( function()
	while true do
		for i, NetID in ipairs(ClientPedList) do
			if not DoesEntityExist(NetToPed(NetID)) then
				table.remove(ClientPedList, i)
				table.remove(ClientPedConfigList, i)
				DisplayingList["" .. NetID] = nil
				TriggerServerEvent('pd5m:syncsv:RemovePedEntry', NetID)
			elseif IsEntityDead(NetToPed(NetID)) then
				table.remove(ClientPedList, i)
				table.remove(ClientPedConfigList, i)
				DisplayingList["" .. NetID] = nil
				TriggerServerEvent('pd5m:syncsv:RemovePedEntry', NetID)
				SetEntityAsNoLongerNeeded(NetToPed(NetID))
			end
		end
		Wait(10000)
	end
end)

-- Cleans up ClientVehList and ClientVehConfigList
-- Deletes the information if the specific vehicle is either dead(yes, it does that...) or despawned
-- Triggers a server event to remove the information server side as well
CreateThread( function()
	while true do
		for i, NetID in ipairs(ClientVehList) do
			if not DoesEntityExist(NetToVeh(NetID)) then
				table.remove(ClientVehList, i)
				table.remove(ClientVehConfigList, i)
				TriggerServerEvent('pd5m:syncsv:RemoveVehEntry', NetID)
			elseif IsEntityDead(NetToVeh(NetID)) then
				table.remove(ClientVehList, i)
				table.remove(ClientVehConfigList, i)
				TriggerServerEvent('pd5m:syncsv:RemoveVehEntry', NetID)
				SetEntityAsNoLongerNeeded(NetToVeh(NetID))
			end
		end
		Wait(10000)
	end
end)

-- Cleans up the different ClientFlagLists
-- Deletes the information if the specific ped is either dead or despawned
CreateThread( function()
	while true do
		for i, NetID in ipairs(ClientPedStoppedList) do
			if not DoesEntityExist(NetToPed(NetID)) then
				TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', NetID, 'Stopped')
			elseif IsEntityDead(NetToPed(NetID)) then
				TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', NetID, 'Stopped')
			end
		end
		for i, NetID in ipairs(ClientPedTalkingList) do
			if not DoesEntityExist(NetToPed(NetID)) then
				TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', NetID, 'Talking')
			elseif IsEntityDead(NetToPed(NetID)) then
				TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', NetID, 'Talking')
			end
		end
		for i, NetID in ipairs(ClientPedNoFearList) do
			if not DoesEntityExist(NetToPed(NetID)) then
				TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', NetID, 'NoFear')
			elseif IsEntityDead(NetToPed(NetID)) then
				TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', NetID, 'NoFear')
			end
		end
		for i, NetID in ipairs(ClientPedArrestedList) do
			if not DoesEntityExist(NetToPed(NetID)) then
				TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', NetID, 'Arrested')
			elseif IsEntityDead(NetToPed(NetID)) then
				TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', NetID, 'Arrested')
			end
		end
		for i, NetID in ipairs(ClientPedNoTalkList) do
			if not DoesEntityExist(NetToPed(NetID)) then
				TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', NetID, 'NoTalk')
			elseif IsEntityDead(NetToPed(NetID)) then
				TriggerServerEvent('pd5m:syncsv:RemovePedFlagEntry', NetID, 'NoTalk')
			end
		end
		Wait(20000)
	end
end)

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
