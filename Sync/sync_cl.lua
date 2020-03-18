-- event that recieves the server data for a specific ped.
-- don't use this, trigger event 'pd5m:syncsv:DatabaseQuery'
RegisterNetEvent('pd5m:sync:PedDatabaseResult')
AddEventHandler('pd5m:sync:PedDatabaseResult', function(NetID, List)
	if NetID == nil then
	
	else
		local flagduplicate = false
		for i, ID in ipairs(ClientPedList) do
			if ID == NetID then
				flagduplicate = true
				break
			end
		end
		if not flagduplicate then
			table.insert(ClientPedList, NetID)
			table.insert(ClientPedConfigList, List)
		end
	end
end)

-- event that recieves the server data for a search query.
-- don't use this, trigger function SearchPedEntry (in common_cl_fct.lua)
RegisterNetEvent('pd5m:sync:SearchPedEntryResult')
AddEventHandler('pd5m:sync:SearchPedEntryResult', function(entryname, entryvalue, ReturnList)
	local ResultList = {}
	
	table.insert(ResultList, entryname)
	table.insert(ResultList, entryvalue)
	table.insert(ResultList, ReturnList)
	
	table.insert(ClientPedSearchList, ResultList)
end)

-- event that recieves a server query to change a specific ped entry.
-- don't use this, trigger event 'pd5m:syncsv:ChangePedEntry'
RegisterNetEvent('pd5m:sync:ChangePedEntry')
AddEventHandler('pd5m:sync:ChangePedEntry', function(NetID, j, entryvalue)
	for i, ID in ipairs(ClientPedList) do
		if ID == NetID then
			ClientPedConfigList[i][ClientPedVariableList[j]] = entryvalue
			break
		end
	end
end)

-- event that recieves a server query to add a specific ped flag.
-- don't use this, trigger event 'pd5m:syncsv:AddPedFlagEntry'
RegisterNetEvent('pd5m:sync:AddPedFlagEntry')
AddEventHandler('pd5m:sync:AddPedFlagEntry', function(NetID, flagname)
	if flagname == 'Stopped' then
		local FlagIsStopped = CheckFlag(NetID, 'Stopped')
		if not FlagIsStopped then
			table.insert(ClientPedStoppedList, NetID)
		end
	elseif flagname == 'Talking' then
		local FlagIsTalking = CheckFlag(NetID, 'Talking')
		if not FlagIsTalking then
			table.insert(ClientPedTalkingList, NetID)
		end
	elseif flagname == 'NoFear' then
		local FlagIsNoFear = CheckFlag(NetID, 'NoFear')
		if not FlagIsNoFear then
			table.insert(ClientPedNoFearList, NetID)
		end
	elseif flagname == 'Arrested' then
		local FlagIsArrested = CheckFlag(NetID, 'Arrested')
		if not FlagIsArrested then
			table.insert(ClientPedArrestedList, NetID)
		end
	elseif flagname == 'NoTalk' then
		local FlagIsNoTalk = CheckFlag(NetID, 'NoTalk')
		if not FlagIsNoTalk then
			table.insert(ClientPedNoTalkList, NetID)
		end
	end
end)

-- event that recieves a server query to add a specific ped flag.
-- don't use this, trigger event 'pd5m:syncsv:RemovePedFlagEntry'
RegisterNetEvent('pd5m:sync:RemovePedFlagEntry')
AddEventHandler('pd5m:sync:RemovePedFlagEntry', function(NetID, flagname)
	if flagname == 'Stopped' then
		for i, ID in ipairs(ClientPedStoppedList) do
			if ID == NetID then
				table.remove(ClientPedStoppedList, i)
				break
			end
		end
	elseif flagname == 'Talking' then
		for i, ID in ipairs(ClientPedTalkingList) do
			if ID == NetID then
				table.remove(ClientPedTalkingList, i)
				break
			end
		end
	elseif flagname == 'NoFear' then
		for i, ID in ipairs(ClientPedNoFearList) do
			if ID == NetID then
				table.remove(ClientPedNoFearList, i)
				break
			end
		end
	elseif flagname == 'Arrested' then
		for i, ID in ipairs(ClientPedArrestedList) do
			if ID == NetID then
				table.remove(ClientPedArrestedList, i)
				break
			end
		end
	elseif flagname == 'NoTalk' then
		for i, ID in ipairs(ClientPedNoTalkList) do
			if ID == NetID then
				table.remove(ClientPedNoTalkList, i)
				break
			end
		end
	end
end)

-- event that recieves the server data for a specific vehicle.
-- don't use this, trigger event 'pd5m:syncsv:VehDatabaseQuery'
RegisterNetEvent('pd5m:sync:VehDatabaseResult')
AddEventHandler('pd5m:sync:VehDatabaseResult', function(NetID, List)
	if NetID == nil then
	
	else
		local flagduplicate = false
		for i, ID in ipairs(ClientVehList) do
			if ID == NetID then
				flagduplicate = true
				break
			end
		end
		if not flagduplicate then
			table.insert(ClientVehList, NetID)
			table.insert(ClientVehConfigList, List)
		end
	end
end)

-- event that recieves a server query to change a specific vehicle entry.
-- don't use this, trigger event 'pd5m:syncsv:ChangeVehEntry'
RegisterNetEvent('pd5m:sync:ChangeVehEntry')
AddEventHandler('pd5m:sync:ChangeVehEntry', function(NetID, j, entryvalue)
	for i, ID in ipairs(ClientVehList) do
		if ID == NetID then
			ClientVehConfigList[i][ClientVehVariableList[j]] = entryvalue
			break
		end
	end
end)

-- event that sets every behavior-changing flag to either true or false.
-- Use this event to make the ped either allow (true) or disallow (false) every action the officer can do (e.g. breathalyzer, arrest, ...)
-- variables: EntityId, bool
AddEventHandler('pd5m:sync:PedSetAllAllowConfigFlags', function(target, boolvalue)
	local TargetNetID = PedToNet(target)
	
	if boolvalue then
		TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'resistmodifier', 0)
	end
	
	TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowbreathalyzer', boolvalue)
	TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowdrugtest', boolvalue)
	TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowpersonsearch', boolvalue)
	TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowcarsearch', boolvalue)
	TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowcarseizure', boolvalue)
	TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowitemconfiscation', boolvalue)
	TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowfine', boolvalue)
	TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagallowarrest', boolvalue)
end)

-- event that recieves a server query to add a specific veh flag.
-- don't use this, trigger event 'pd5m:syncsv:AddVehFlagEntry'
RegisterNetEvent('pd5m:sync:AddVehFlagEntry')
AddEventHandler('pd5m:sync:AddVehFlagEntry', function(NetID, flagname)
	if flagname == 'Towing' then
		local FlagIsTowing = CheckVehFlag(NetID, 'Towing')
		if not FlagIsTowing then
			table.insert(ClientVehTowingList, NetID)
		end
	end
end)

-- event that recieves a server query to add a specific veh flag.
-- don't use this, trigger event 'pd5m:syncsv:RemoveVehFlagEntry'
RegisterNetEvent('pd5m:sync:RemoveVehFlagEntry')
AddEventHandler('pd5m:sync:RemoveVehFlagEntry', function(NetID, flagname)
	if flagname == 'Towing' then
		for i, ID in ipairs(ClientVehTowingList) do
			if ID == NetID then
				table.remove(ClientVehTowingList, i)
				break
			end
		end
	end
end)

-- event that recieves a server query to rewrite every clientside flag with the server-saved data.
-- don't use this, trigger event 'pd5m:syncsv:SyncFlagLists'
RegisterNetEvent('pd5m:sync:SyncFlagLists')
AddEventHandler('pd5m:sync:SyncFlagLists', function(FlagTables)
	ClientPedStoppedList = FlagTables[1]
	ClientPedTalkingList = FlagTables[2]
	ClientPedNoFearList = FlagTables[3]
	ClientPedArrestedList = FlagTables[4]
	ClientPedNoTalkList = FlagTables[5]
	ClientVehTowingList = FlagTables[6]
end)

-- event that recieves a server query to trigger a specific Animation.
-- don't use this, trigger event 'pd5m:syncsv:TaskPlayAnim'
RegisterNetEvent('pd5m:sync:TaskPlayAnim')
AddEventHandler('pd5m:sync:TaskPlayAnim', function(target, AnimDict, AnimName, blendInSpeed, blendOutSpeed, duration, flag, playbackRate, lockX, lockY, lockZ)
	loadAnimDict(AnimDict)
	
	TaskPlayAnim(target, AnimDict, AnimName, blendInSpeed, blendOutSpeed, duration, flag, playbackRate, lockX, lockY, lockZ)
end)
