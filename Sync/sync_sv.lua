-- event triggered by a client to ask for a specific peds' config
-- variables: EntityNetId
RegisterNetEvent('pd5m:syncsv:DatabaseQuery')
AddEventHandler('pd5m:syncsv:DatabaseQuery', function(NetID)
	local PedNetID = nil
	local List = {}
	for i, ID in ipairs(PedList) do
		if ID == NetID then
			PedNetID = NetID
			index = i
			List = PedConfigList[i]
			break
		end
	end
	TriggerClientEvent('pd5m:sync:PedDatabaseResult', source, PedNetID, List)
end)

-- event that searches through every ped config whether a specific entry has a specific value
-- don't use this, trigger function SearchPedEntry (in common_cl_fct.lua)
RegisterNetEvent('pd5m:syncsv:SearchPedEntry')
AddEventHandler('pd5m:syncsv:SearchPedEntry', function(entryname, entryvalue)
	local ReturnList = {}

	for i, List in ipairs(PedConfigList) do
		if List[entryname] == entryvalue then
			table.insert(ReturnList, List.NetID)
		end
	end

	TriggerClientEvent('pd5m:sync:SearchPedEntryResult', source, entryname, entryvalue, ReturnList)
end)

-- event that will change a specific entry from a specific ped to a specific value.
-- e.g. change the surname of a given ped to 'Johnson'.
-- entryname must be one of PedVariableListGlobal (see def_gl.lua)
-- entryvalues are explained there as well
-- variables: EntityNetId, STRING, [depends on entryname]
RegisterNetEvent('pd5m:syncsv:ChangePedEntry')
AddEventHandler('pd5m:syncsv:ChangePedEntry', function(NetID, entryname, entryvalue)
	local resistmodifier = 0
	local newresistmodifier = 0
	local resistindex = 1
	local FlagSetFlag = false

	for i, ID in ipairs(PedList) do
		if ID == NetID then
			index = i
			if entryname == 'resistmodifierList' then
				resistmodifier = PedConfigList[index].resistmodifier
				newresistmodifier = resistmodifier
				for i, value in ipairs(entryvalue) do
					resistindex = math.log(math.abs(value))/math.log(2)
					if IsInt(resistindex) then
						FlagSetFlag = GetNthBinaryFlag(newresistmodifier, resistindex)
						if value == math.abs(value) then
							if FlagSetFlag == 0 then
								newresistmodifier = newresistmodifier + value
							end
						else
							if FlagSetFlag == 1 then
								newresistmodifier = newresistmodifier + value
							end
						end
					end
				end
				for j, entry in ipairs(PedVariableList) do
					if 'resistmodifier' == entry then
						PedConfigList[index][PedVariableList[j]] = newresistmodifier
						TriggerClientEvent('pd5m:sync:ChangePedEntry', -1, NetID, j, newresistmodifier)
						break
					end
				end
			else
				for j, entry in ipairs(PedVariableList) do
					if entryname == entry then
						PedConfigList[index][PedVariableList[j]] = entryvalue
						TriggerClientEvent('pd5m:sync:ChangePedEntry', -1, NetID, j, entryvalue)
						break
					end
				end
			end
			break
		end
	end
end)

-- event that removes a ped information server-side.
-- there is no way to sync ped information from client to server.
-- You are allowed to trigger this event however be careful with it.
-- This event is automatically triggered for dead and non-existing peds by first cleanup-thread (in cleanupthreads_cl.lua)
-- variables: EntityNetId
RegisterNetEvent('pd5m:syncsv:RemovePedEntry')
AddEventHandler('pd5m:syncsv:RemovePedEntry', function(NetID)
	for i, ID in ipairs(PedList) do
		if ID == NetID then
			table.remove(PedList, i)
			table.remove(PedConfigList, i)
			break
		end
	end
end)

-- event that adds a specific ped flag.
-- e.g. you can make a ped not interactable by using 'NoTalk'
-- 'NoFear' will only set the flag, however you will have to manually SetBlockingOfNonTemporaryEvents(ped, true)
-- flagname must be one of 'Stopped', 'Talking', 'NoFear', 'Arrested', 'NoTalk'
-- variables: EntityNetId, STRING
RegisterNetEvent('pd5m:syncsv:AddPedFlagEntry')
AddEventHandler('pd5m:syncsv:AddPedFlagEntry', function(NetID, flagname)
	if flagname == 'Stopped' then
		table.insert(PedStoppedList, NetID)
		TriggerClientEvent('pd5m:sync:AddPedFlagEntry', -1, NetID, flagname)
	elseif flagname == 'Talking' then
		table.insert(PedTalkingList, NetID)
		TriggerClientEvent('pd5m:sync:AddPedFlagEntry', -1, NetID, flagname)
	elseif flagname == 'NoFear' then
		table.insert(PedNoFearList, NetID)
		TriggerClientEvent('pd5m:sync:AddPedFlagEntry', -1, NetID, flagname)
	elseif flagname == 'Arrested' then
		table.insert(PedArrestedList, NetID)
		TriggerClientEvent('pd5m:sync:AddPedFlagEntry', -1, NetID, flagname)
	elseif flagname == 'NoTalk' then
		table.insert(PedNoTalkList, NetID)
		TriggerClientEvent('pd5m:sync:AddPedFlagEntry', -1, NetID, flagname)
	end
end)

-- event that removes a specific ped flag if it exists.
-- e.g. you can make a ped interactable again by using 'NoTalk'
-- 'NoFear' will only remove the flag, however you will have to manually SetBlockingOfNonTemporaryEvents(ped, false)
-- flagname must be one of 'Stopped', 'Talking', 'NoFear', 'Arrested', 'NoTalk'
-- variables: EntityNetId, STRING
RegisterNetEvent('pd5m:syncsv:RemovePedFlagEntry')
AddEventHandler('pd5m:syncsv:RemovePedFlagEntry', function(NetID, flagname)
	if flagname == 'Stopped' then
		for i, ID in ipairs(PedStoppedList) do
			if ID == NetID then
				table.remove(PedStoppedList, i)
				TriggerClientEvent('pd5m:sync:RemovePedFlagEntry', -1, NetID, flagname)
				break
			end
		end
	elseif flagname == 'Talking' then
		for i, ID in ipairs(PedTalkingList) do
			if ID == NetID then
				table.remove(PedTalkingList, i)
				TriggerClientEvent('pd5m:sync:RemovePedFlagEntry', -1, NetID, flagname)
				break
			end
		end
	elseif flagname == 'NoFear' then
		for i, ID in ipairs(PedNoFearList) do
			if ID == NetID then
				table.remove(PedNoFearList, i)
				TriggerClientEvent('pd5m:sync:RemovePedFlagEntry', -1, NetID, flagname)
				break
			end
		end
	elseif flagname == 'Arrested' then
		for i, ID in ipairs(PedArrestedList) do
			if ID == NetID then
				table.remove(PedArrestedList, i)
				TriggerClientEvent('pd5m:sync:RemovePedFlagEntry', -1, NetID, flagname)
				break
			end
		end
	elseif flagname == 'NoTalk' then
		for i, ID in ipairs(PedNoTalkList) do
			if ID == NetID then
				table.remove(PedNoTalkList, i)
				TriggerClientEvent('pd5m:sync:RemovePedFlagEntry', -1, NetID, flagname)
				break
			end
		end
	end
end)

-- event triggered by a client to ask for a specific peds' config
-- variables: EntityNetId
RegisterNetEvent('pd5m:syncsv:VehDatabaseQuery')
AddEventHandler('pd5m:syncsv:VehDatabaseQuery', function(NetID)
	local VehNetID = nil
	local List = {}
	for i, ID in ipairs(VehList) do
		if ID == NetID then
			VehNetID = NetID
			index = i
			List = VehConfigList[i]
			break
		end
	end
	TriggerClientEvent('pd5m:sync:VehDatabaseResult', source, VehNetID, List)
end)

-- event that will change a specific entry from a specific vehicle to a specific value.
-- e.g. change the registration of a given vehicle to 'Stolen'.
-- entryname must be one of VehVariableListGlobal (see def_gl.lua)
-- entryvalues are explained there as well
-- variables: EntityNetId, STRING, [depends on entryname]
RegisterNetEvent('pd5m:syncsv:ChangeVehEntry')
AddEventHandler('pd5m:syncsv:ChangeVehEntry', function(NetID, entryname, entryvalue)
	for i, ID in ipairs(VehList) do
		if ID == NetID then
			index = i
			for j, entry in ipairs(VehVariableList) do
				if entryname == entry then
					VehConfigList[index][VehVariableList[j]] = entryvalue
					TriggerClientEvent('pd5m:sync:ChangeVehEntry', -1, NetID, j, entryvalue)
					break
				end
			end
			break
		end
	end
end)

-- event that removes a vehicle information server-side.
-- there is no way to sync vehicle information from client to server.
-- You are allowed to trigger this event however be careful with it.
-- This event is automatically triggered for dead and non-existing vehicles (yes, for dead vehicles...) by second cleanup-thread (in cleanupthreads_cl.lua)
-- variables: EntityNetId
RegisterNetEvent('pd5m:syncsv:RemoveVehEntry')
AddEventHandler('pd5m:syncsv:RemoveVehEntry', function(NetID)
	for i, ID in ipairs(VehList) do
		if ID == NetID then
			table.remove(VehList, i)
			table.remove(VehConfigList, i)
			break
		end
	end
end)

-- event that adds a specific veh flag.
-- flagname must be one of: 'Towing'
-- variables: EntityNetId, STRING
RegisterNetEvent('pd5m:syncsv:AddVehFlagEntry')
AddEventHandler('pd5m:syncsv:AddVehFlagEntry', function(NetID, flagname)
	if flagname == 'Towing' then
		table.insert(VehTowingList, NetID)
		TriggerClientEvent('pd5m:sync:AddVehFlagEntry', -1, NetID, flagname)
	end
end)

-- event that removes a specific veh flag if it exists.
-- flagname must be one of: 'Towing'
-- variables: EntityNetId, STRING
RegisterNetEvent('pd5m:syncsv:RemoveVehFlagEntry')
AddEventHandler('pd5m:syncsv:RemoveVehFlagEntry', function(NetID, flagname)
	if flagname == 'Towing' then
		for i, ID in ipairs(VehTowingList) do
			if ID == NetID then
				table.remove(VehTowingList, i)
				TriggerClientEvent('pd5m:sync:RemoveVehFlagEntry', -1, NetID, flagname)
				break
			end
		end
	end
end)

-- event used to trigger display of communication on every client.
-- Text is said by first given ID to second given ID.
-- text can be of any length. It'll automatically be split up into multiple parts if too long.
-- this event will mostly be used from client-side.
-- Displaytime can safely be set to the convar as set in config_cl.lua or config_sv.lua
-- variables: EntityNetId, EntityNetId, STRING, INT
RegisterNetEvent('pd5m:syncsv:ShowCommunication')
AddEventHandler('pd5m:syncsv:ShowCommunication', function(NetID, PartnerNetID, text, displaytime)
	TriggerClientEvent('pd5m:int:ShowCommunication', -1, NetID, PartnerNetID, text, displaytime) --this is indeed 'pd5m:int:ShowCommunication'
end)

-- event used to sync the different flaglists.
-- This is triggered for every client that joins the server.
-- It's not yet clear whether executing this event for players interacting with peds will result in problems.
-- Exercise caution if you want to use the event. Normally it should not be necessary as every flag should be synced to every client at all times.
RegisterNetEvent('pd5m:syncsv:SyncFlagLists')
AddEventHandler('pd5m:syncsv:SyncFlagLists', function()
	local FlagTables = {}
	table.insert(FlagTables, PedStoppedList)
	table.insert(FlagTables, PedTalkingList)
	table.insert(FlagTables, PedNoFearList)
	table.insert(FlagTables, PedArrestedList)
	table.insert(FlagTables, PedNoTalkList)
	table.insert(FlagTables, VehTowingList)
	TriggerClientEvent('pd5m:sync:SyncFlagLists', source, FlagTables)
end)

-- event used to sync animations to every client.
-- The variables are exactly the variables of the native TaskPlayAnim.
-- This event executes the native on every client at once.
-- Using RequestAnimDict / loadAnimDict-function in front of this event is not necessary, the event takes care of this itself.
RegisterNetEvent('pd5m:syncsv:TaskPlayAnim')
AddEventHandler('pd5m:syncsv:TaskPlayAnim', function(target, AnimDict, AnimName, blendInSpeed, blendOutSpeed, duration, flag, playbackRate, lockX, lockY, lockZ)
	TriggerClientEvent('pd5m:sync:TaskPlayAnim', -1, target, AnimDict, AnimName, blendInSpeed, blendOutSpeed, duration, flag, playbackRate, lockX, lockY, lockZ)
end)

RegisterNetEvent('pd5m:syncsv:grabped')
AddEventHandler('pd5m:syncsv:grabped', function(TargetNetID, PlayerpedNetID)
	TriggerClientEvent('pd5m:int:grabbingevent', -1, TargetNetID, PlayerpedNetID)
end)

RegisterNetEvent('pd5m:syncsv:ungrabped')
AddEventHandler('pd5m:syncsv:ungrabped', function(TargetNetID)
	TriggerClientEvent('pd5m:int:ungrabbingevent', -1, TargetNetID)
end)

RegisterNetEvent('pd5m:syncsv:handcuffingevent')
AddEventHandler('pd5m:syncsv:handcuffingevent', function(TargetNetID, PlayerpedNetID)
	TriggerClientEvent('pd5m:int:handcuffingevent', -1, TargetNetID, PlayerpedNetID)
end)

RegisterNetEvent('pd5m:syncsv:unhandcuffingevent')
AddEventHandler('pd5m:syncsv:unhandcuffingevent', function(TargetNetID, PlayerpedNetID)
	TriggerClientEvent('pd5m:int:unhandcuffingevent', -1, TargetNetID, PlayerpedNetID)
end)

RegisterNetEvent('pd5m:syncsv:SetEntityAsMissionEntity')
AddEventHandler('pd5m:syncsv:SetEntityAsMissionEntity', function(TargetNetID)
	TriggerClientEvent('pd5m:sync:SetEntityAsMissionEntity', -1, TargetNetID)
end)
