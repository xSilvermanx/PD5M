-- checks if the ped was already created. If not, this creates the ped config (includes things like first name, surname, date of birth, ...)
-- PedGender needs to be 'Male' or 'Female'
-- variables: EntityNetId, STRING
RegisterNetEvent('pd5m:intsv:AddPedToList')
AddEventHandler('pd5m:intsv:AddPedToList', function(NetID, PedGender)
	local flag_duplicate = false
	for i,ID in ipairs(PedList) do
		if ID == NetID then
			flag_duplicate = true
			if PedConfigList[i].FirstName ~= nil then
			else
				table.remove(PedList, i)
				table.insert(PedList, NetID)
				TriggerEvent('pd5m:intsv:InitPedConfigList', NetID, PedGender)
			end
			break
		end
	end
	if not flag_duplicate then
		table.insert(PedList, NetID)
		TriggerEvent('pd5m:intsv:InitPedConfigList', NetID, PedGender)
	end
end)

-- Creates config information for a specific ped
-- don't use this, trigger Event 'pd5m:intsv:AddPedToList'
AddEventHandler('pd5m:intsv:InitPedConfigList', function(PedNetID, Gender)

	local PedFirstName = nil

	if Gender == "Male" then
		PedFirstName = fmalenamesar[math.random(#fmalenamesar)]
	else
		PedFirstName = ffemalenamesar[math.random(#ffemalenamesar)]
	end
	
	local PedInfosListInit = {
	NetID = PedNetID,
	PedGender = Gender,
	FirstName = PedFirstName,
	LastName = snamesar[math.random(#snamesar)],
	BirthYear = math.random(1949, 1999),
	BirthMonth = math.random(1, 12),
	BirthDay = math.random(1, 29),
	RandomID = nil,
	RandomLicenceID = nil,  --Valid, Expired, Suspended
	RandomWeaponID = nil,
	VehicleNetID = nil,
	PedUnusualActivity = {},
	AlliesList = {}, --input NetIDs of allied peds. Useful for gang activity and missions
	
	flagfleeinstant = false,
	flagfight = false,
	flagdrug = false,
	savedrug = nil,
	savedruglevel = 0, -- unit ng / ml
	flagdrunk = false,
	savedrunklevel = 0, -- unit 0.1 BAC / Promille
	flagwanted = false,
	saveoffense = 'None',
	flagpedillegalweapon = false,
	savepedweapons = {},
	flagpedillegalitem = false,
	savepeditems = {},
	flagid = true,
	flaghideid = false,
	flaglicence = true,
	flagweaponlicence = true,
	resistmodifier = 0,
	
	flagallowbreathalyzer = false,
	flagallowdrugtest = false,
	flagallowpersonsearch = false,
	flagallowcarsearch = false,
	
	flagallowcarseizure = false,
	flagallowitemconfiscation = false,
	flagallowarrest = false,
	flagallowfine = false,
	}
	
	-- Random ID Generation	
	local RandomIDPre = math.random(1, 999999999999)
	local RandomIDPreDigits = 11 - math.floor(math.log10(RandomIDPre))
	local RandomIDDigits = ""
	for i=1, RandomIDPreDigits do
		RandomIDDigits = RandomIDDigits .. "0"
	end
	local RandomID = RandomIDDigits .. RandomIDPre
	PedInfosListInit.RandomID = RandomID
	RandomIDDigits = "0"
	
	local RandomLicenceIDPre = math.random(1, 999999999)
	local RandomLicenceIDPreDigits = 8 - math.floor(math.log10(RandomLicenceIDPre))
	local RandomLicenceIDDigits = ""
	for i=1, RandomLicenceIDPreDigits do
		RandomLicenceIDDigits = RandomLicenceIDDigits .. "0"
	end
	local RandomLicenceID = RandomLicenceIDDigits .. RandomLicenceIDPre
	PedInfosListInit.RandomLicenceID = RandomLicenceID
	RandomLicenceIDDigits = "0"
	
	local RandomWeaponIDPre = math.random(1, 999999999)
	local RandomWeaponIDPreDigits = 8 - math.floor(math.log10(RandomWeaponIDPre))
	local RandomWeaponIDDigits = ""
	for i=1, RandomWeaponIDPreDigits do
		RandomWeaponIDDigits = RandomWeaponIDDigits .. "0"
	end
	local RandomWeaponID = RandomWeaponIDDigits .. RandomWeaponIDPre
	PedInfosListInit.RandomWeaponID = RandomWeaponID
	RandomIDDigits = "0"
	
	-- Chance for certain flags
	if math.random(1, 10000) < 30 then
		PedInfosListInit.flagdrug = true
		PedInfosListInit.savedrug = DrugList[math.random(1, #DrugList)]
		PedInfosListInit.savedruglevel = math.random(10, 200)
	end
	if math.random(1, 10000) < 200 then
		PedInfosListInit.flagdrunk = true
		PedInfosListInit.savedrunklevel = math.random(20, 400)/100
	end
	if math.random(1, 10000) < 100 then
		PedInfosListInit.flagwanted = true
		PedInfosListInit.saveoffense = OffenseList[math.random(1, #OffenseList)]
	end
	if math.random(1, 10000) < 50 then
		PedInfosListInit.flagid = false
	end
	if math.random(1, 10000) < 300 then
		PedInfosListInit.flaglicence = false
	end
	if math.random(1, 10000) < 7000 then
		PedInfosListInit.flagweaponlicence = false
	end
	
	-- Chance to carry a weapon
	local meleechance = 200
	local weaponchance = 100
	local illegalweaponchance = 50
	if PedInfosListInit.flagweaponlicence then
		meleechance = meleechance - 100
		weaponchance = weaponchance * 15
		illegalweaponchance = 0
	end
	if PedInfosListInit.flagwanted then
		meleechance = meleechance + 200
		weaponchance = weaponchance + 200
		illegalweaponchance = illegalweaponchance + 200
	end
	if math.random(1, 10000) < meleechance then
		for i=1,math.random(1,4),1 do
			table.insert(PedInfosListInit.savepedweapons, MeleeList[math.random(1, #MeleeList)])
		end
	end
	if math.random(1, 10000) < weaponchance then
		for i=1,math.random(1,4),1 do
			table.insert(PedInfosListInit.savepedweapons, WeaponList[math.random(1, #WeaponList)])
			if not PedInfosListInit.flagweaponlicence then
				PedInfosListInit.flagpedillegalweapon = true
			end
		end
	end
	if math.random(1, 10000) < illegalweaponchance then
		for i=1,math.random(1,4),1 do
			table.insert(PedInfosListInit.savepedweapons, WeaponList[math.random(1, #IllegalWeaponList)])
		end
		PedInfosListInit.flagpedillegalweapon = true
	end
	
	-- Chance to carry an illegal item
	local illegalitemchance = 100
	
	if PedInfosListInit.flagwanted then
		illegalitemchance = illegalitemchance + 400
	end
	if math.random(1, 10000) < illegalitemchance then
		for i=1, math.random(1,4),1 do
			table.insert(PedInfosListInit.savepeditems, IllegalItemList[math.random(1, #IllegalItemList)])
		end
		PedInfosListInit.flagpedillegalitem = true
	end
	if PedInfosListInit.flagdrug and math.random(1, 10000) < 5000 then
		table.insert(PedInfosListInit.savepeditems, PedInfosListInit.savedrug)
		PedInfosListInit.flagpedillegalitem = true
	end
	if PedInfosListInit.flagpedillegalitem then
		for i=1, math.random(1,4),1 do
			table.insert(PedInfosListInit.savepeditems, ItemList[math.random(1, #ItemList)])
		end
	else
		for i=1, math.random(1,8),1 do
			table.insert(PedInfosListInit.savepeditems, ItemList[math.random(1, #ItemList)])
		end
	end
	
	-- Chance to hide id
	-- Chance to flee instant
	-- Flag Resist Modifier
	-- Chance to fight
	local hideidchance = 30
	local fleeinstantchance = 70
	local resistmodifier = 0
	local fightchance = 50
	
	if PedInfosListInit.flagwanted then
		hideidchance = hideidchance + 2970
		fleeinstantchance = fleeinstantchance + 1980
		if math.random(1, 10) <= 7 then
			resistmodifier = resistmodifier + 1 + 2 + 4
		end
		fightchance = fightchance + 50
	end
	if PedInfosListInit.flagpedillegalitem then
		hideidchance = hideidchance + 70
		fleeinstantchance = fleeinstantchance + 480
		fightchance = fightchance + 50
	end
	if PedInfosListInit.flagpedillegalweapon then
		hideidchance = hideidchance + 70
		fleeinstantchance = fleeinstantchance + 480
		fightchance = fightchance + 450
	end
	if PedInfosListInit.flagpedillegalitem or PedInfosListInit.flagpedillegalweapon then
		resistmodifier = resistmodifier + 32768 + 262144
	end
	if PedInfosListInit.flagdrug then
		hideidchance = hideidchance - 10
		fleeinstantchance = fleeinstantchance + 1450
		resistmodifier = resistmodifier + 16384
		fightchance = fightchance + 1450
	end
	if PedInfosListInit.flagdrunk then
		hideidchance = hideidchance - 10
		fleeinstantchance = fleeinstantchance + 950
		resistmodifier = resistmodifier + 8192
		fightchance = fightchance + 950
	end
	if not PedInfosListInit.flagid then
		hideidchance = 10000
	end
	
	PedInfosListInit.resistmodifier = resistmodifier
	
	--todo: randomize resistmodifier - only do this after implementing the "threaten-ped"-talk-option.
	
	if math.random(1, 10000) < fleeinstantchance then
		PedInfosListInit.flagfleeinstant = true
	end
	if math.random(1, 10000) < fightchance then
		PedInfosListInit.flagfight = true
	end
	if math.random(1, 10000) < hideidchance then	
		PedInfosListInit.flaghideid = true
	end
	
	table.insert(PedConfigList, PedInfosListInit)

end)

-- checks if the veh was already created. If not, this creates the veh config (includes things like registration, vehicle items, ...)
-- variables: EntityNetId
RegisterNetEvent('pd5m:intsv:AddVehToList')
AddEventHandler('pd5m:intsv:AddVehToList', function(NetID)
	local flag_duplicate = false
	for i,ID in ipairs(VehList) do
		if ID == NetID then
			flag_duplicate = true
			if VehConfigList[i].FirstName ~= nil then
			else
				table.remove(VehList, i)
				table.insert(VehList, NetID)
				TriggerEvent('pd5m:intsv:InitVehConfigList', NetID)
			end
			break
		end
	end
	if not flag_duplicate then
		table.insert(VehList, NetID)
		TriggerEvent('pd5m:intsv:InitVehConfigList', NetID)
	end
end)

-- Creates config information for a specific vehicle
-- don't use this, trigger Event 'pd5m:intsv:AddVehToList'
AddEventHandler('pd5m:intsv:InitVehConfigList', function(VehNetID)
	
	local PedFirstName = nil
	local Gender = nil
	
	if math.random(1, 10) <= 5 then
		Gender = 'Male'
		PedFirstName = fmalenamesar[math.random(#fmalenamesar)]
	else
		Gender = 'Female'
		PedFirstName = ffemalenamesar[math.random(#ffemalenamesar)]
	end
	
	local VehInfosListInit = {
	NetID = VehNetID,
	Registration = "Valid", -- Valid, Uninsured, Unregistered, Stolen
	PedNetID = nil,
	savevehitems = {},
	flagvehillegalitem = false,
	PedGender = Gender,
	FirstName = PedFirstName,
	LastName = snamesar[math.random(#snamesar)],
	BirthYear = math.random(1949, 1999),
	BirthMonth = math.random(1, 12),
	BirthDay = math.random(1, 29),
	flagwanted = false,
	saveoffense = 'None',
	}
	
	if math.random(1, 10000) < 100 then
		VehInfosListInit.flagwanted = true
		VehInfosListInit.saveoffense = OffenseList[math.random(1, #OffenseList)]
	end
	
	local illegalitemchance = 100
	
	if math.random(1, 10000) < illegalitemchance then
		for i=1, math.random(1,4),1 do
			table.insert(VehInfosListInit.savevehitems, IllegalItemList[math.random(1, #IllegalItemList)])
		end
		VehInfosListInit.flagvehillegalitem = true
	end
	if VehInfosListInit.flagvehillegalitem then
		for i=1, math.random(1,4),1 do
			table.insert(VehInfosListInit.savevehitems, ItemList[math.random(1, #ItemList)])
		end
	else
		for i=1, math.random(1,8),1 do
			table.insert(VehInfosListInit.savevehitems, ItemList[math.random(1, #ItemList)])
		end
	end
	
	table.insert(VehConfigList, VehInfosListInit)
	
end)