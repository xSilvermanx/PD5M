RegisterNetEvent('pd5m:cleanupsv:SetEntityAsNoLongerNeeded')
AddEventHandler('pd5m:cleanupsv:SetEntityAsNoLongerNeeded', function(EntityNetID)
  TriggerClientEvent('pd5m:cleanup:SetEntityAsNoLongerNeeded', -1, EntityNetID)
end)

RegisterNetEvent('pd5m:cleanupsv:SetEntityWander')
AddEventHandler('pd5m:cleanupsv:SetEntityWander', function(TargetNetID)
  TriggerClientEvent('pd5m:cleanup:SetEntityWander', -1, TargetNetID)
end)

-- Cleans up PedList and PedConfigList
-- Deletes the information if the specific ped is either dead or despawned
-- Triggers a server event to remove the information server side as well
CreateThread( function()
	while true do
		for i, NetID in ipairs(PedList) do
			if not DoesEntityExist(NetworkGetEntityFromNetworkId(NetID)) then
				TriggerEvent('pd5m:msssv:EntityInteracted', NetID)
				table.remove(PedList, i)
				table.remove(PedConfigList, i)
				TriggerEvent('pd5m:syncsv:RemovePedEntry', NetID)
			end
		end
		Wait(10000)
	end
end)

-- Cleans up VehList and VehConfigList
-- Deletes the information if the specific vehicle is either dead(yes, it does that...) or despawned
-- Triggers a server event to remove the information server side as well
CreateThread( function()
	while true do
		for i, NetID in ipairs(VehList) do
			if not DoesEntityExist(NetworkGetEntityFromNetworkId(NetID)) then
				TriggerEvent('pd5m:msssv:EntityInteracted', NetID)
				table.remove(VehList, i)
				table.remove(VehConfigList, i)
				TriggerEvent('pd5m:syncsv:RemoveVehEntry', NetID)
			end
		end
		Wait(10000)
	end
end)

-- Cleans up the different FlagLists
-- Deletes the information if the specific ped is either dead or despawned
CreateThread( function()
	while true do
		for i, NetID in ipairs(PedStoppedList) do
			if not DoesEntityExist(NetworkGetEntityFromNetworkId(NetID)) then
				TriggerEvent('pd5m:syncsv:RemovePedFlagEntry', NetID, 'Stopped')
			end
		end
		for i, NetID in ipairs(PedTalkingList) do
			if not DoesEntityExist(NetworkGetEntityFromNetworkId(NetID)) then
				TriggerEvent('pd5m:syncsv:RemovePedFlagEntry', NetID, 'Talking')
			end
		end
		for i, NetID in ipairs(PedNoFearList) do
			if not DoesEntityExist(NetworkGetEntityFromNetworkId(NetID)) then
				TriggerEvent('pd5m:syncsv:RemovePedFlagEntry', NetID, 'NoFear')
			end
		end
		for i, NetID in ipairs(PedArrestedList) do
			if not NetworkDoesEntityExistWithNetworkId(NetID) then
				TriggerEvent('pd5m:syncsv:RemovePedFlagEntry', NetID, 'Arrested')
			end
		end
		for i, NetID in ipairs(PedNoTalkList) do
			if not DoesEntityExist(NetworkGetEntityFromNetworkId(NetID)) then
				TriggerEvent('pd5m:syncsv:RemovePedFlagEntry', NetID, 'NoTalk')
			end
		end
		Wait(10000)
	end
end)
