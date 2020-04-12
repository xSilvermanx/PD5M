-- remember to have services flag cars / peds / dead bodies as NoLongerNeeded
-- optional you can have the service remove the entities directly

-- this flag is used to interrupt any and every executing while-loop if a towtruck is cancelled.
-- When calling multiple towtrucks at the same time, cancelling one will also interrupt every other truck.
-- This is a known bug and needs to be fixed.
GlobalFlagTowCar = true

-- NetEvent to select the car to be towed.
-- Checks if the car can be towed. If yes, starts the event 'pd5m:tow:inittowtruck'.
-- Advise: Do not trigger this since it's already set for player control.
RegisterNetEvent('pd5m:tow:calltowtruck')
AddEventHandler('pd5m:tow:calltowtruck', function()
	local playerped = GetPlayerPed(-1)
	local playerpedcoords = GetEntityCoords(playerped)
	local camcoords = GetGameplayCamCoord()
	local lookingvector = GetPlayerLookingVector(playerped, 30)
	local TargetVehNetID = nil
	local TargetNetID = nil
	local target = nil
	local TargetVehFlagListIndex = nil
	local TargetFlagListIndex = nil
	local flagtowcar = false
	local flagtowing = false

	if not IsPedInAnyVehicle(playerped, true) then
		local flag_hasTarget, targetcoords, targetveh = GetVehInDirection(camcoords, lookingvector)
		if flag_hasTarget and GetEntityType(targetveh) == 2 then
			local distanceToTarget = GetDistanceBetweenCoords(playerpedcoords, targetcoords)
			if distanceToTarget <= 4.0 then
				if GetVehicleNumberOfPassengers(targetveh) == 0 and (IsVehicleSeatFree(targetveh, -1) or (GetPedInVehicleSeat(targetveh, -1) == 0)) then

					TargetVehNetID = VehToNet(targetveh)

					_, TargetVehFlagListIndex = SyncPedAndVeh(0, targetveh)

					flagtowing = CheckVehFlag(TargetVehNetID, 'Towing')

					if flagtowing then
						Notify('Towtruck aborted')
						GlobalFlagTowCar = false
						TriggerServerEvent('pd5m:towsv:aborttowtruck', TargetVehNetID)
						TriggerServerEvent('pd5m:syncsv:RemoveVehFlagEntry', TargetVehNetID, 'Towing')
					else
						TargetNetID = ClientVehConfigList[TargetVehFlagListIndex].PedNetID

						if TargetNetID ~= 0 and TargetNetID ~= nil then
							target = NetToPed(TargetNetID)
							if DoesEntityExist(target) and not IsEntityDead(target) then
								TargetFlagListIndex, _ = SyncPedAndVeh(target, 0)
								flagtowcar = ClientPedConfigList[TargetFlagListIndex].flagallowcarseizure
								if flagtowcar then
									TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'VehicleNetID', nil)
									TriggerServerEvent('pd5m:syncsv:ChangeVehEntry', TargetVehNetID, 'PedNetID', nil)
								end
							else
								TriggerServerEvent('pd5m:syncsv:ChangeVehEntry', TargetVehNetID, 'PedNetID', nil)
								flagtowcar = true
							end
						else
							flagtowcar = true
						end

						if flagtowcar then
							TriggerServerEvent('pd5m:syncsv:AddVehFlagEntry', TargetVehNetID, 'Towing')
							TriggerEvent('pd5m:tow:inittowtruck', TargetVehNetID)
						else
							Notify('You cannot have this car towed.')
						end
					end
				else
					Notify('Car is not empty.')
				end
			else
				Notify('Too far away.')
			end
		else
			Notify('No car found.')
		end
	end
end)


-- Initializes the towtruck. Selects the station to dispatch the truck from.
-- Checks for the vehicle class and selects the appropriate truck.
-- Triggers the event 'pd5m:tow:towtruckapproach'.
-- Don't use this, trigger 'pd5m:tow:calltowtruck'.
AddEventHandler('pd5m:tow:inittowtruck', function(TargetVehNetID)
	local TowTruckNetID = 0
	local availableTrucks = {1} -- remove the 1 when reinstating the below checks
	local towtruckid = 1
	local targetveh = NetToVeh(TargetVehNetID)
	local pmodels = TowTruckDrivers
	local vehicles = {"flatbed", "towtruck", "towtruck2", "packer"}
	local playerped = GetPlayerPed(-1)

	local tarx, tary, tarz = table.unpack(GetEntityCoords(targetveh))
	local station = nil
	local shortestdistance = 999999999
	for i, location in ipairs(list_towtruck_spawns) do
		local distance = CalculateTravelDistanceBetweenPoints(location.x, location.y, location.z, tarx, tary, tarz)
		if distance < shortestdistance then
			station = location
			shortestdistance = distance
		end
	end

	local stx = station.x
	local sty = station.y
	local stz = station.z
	local sta = station.angle

	local offx = tarx - station.x
	local offy = tary - station.y

	local VecAngle = GetHeadingFromVector_2d(offx, offy)-sta

	while VecAngle < 0 or VecAngle > 360 do
		if VecAngle < 0 then
			VecAngle = VecAngle + 360
		elseif VecAngle > 360 then
			VecAngle = VecAngle - 360
		end
		Wait(200)
	end

	if VecAngle < 270 and VecAngle > 90 then
		stx = station.xa
		sty = station.ya
		stz = station.za
		sta = station.aa
	end

	local stationvec = {x=stx, y=sty, z=stz, angle=sta}

	-- -- -- ToDo: After getting the fancy way of getting to cars done, fix targetvehhash-checks
	--[[local targetvehClass = GetVehicleClass(targetveh)
	local targetvehhash = GetEntityModel(targetveh)

	if targetvehhash == 0x73920F8E or targetvehhash == 0x885F3671 or targetvehhash == 0xB822A1AA or targetvehhash == 0x9B16A3B4 or targetvehhash == 0xCEEA3F4B or targetvehhash == 0x4008EABB or targetvehhash == 0x2592B5CF or targetvehhash == 0x8B13F083 or targetvehhash == 0xCD935EF9 or targetvehhash == 0xDC434E51 or targetvehhash == 0x2BC345D1 or targetvehhash == 0x9A9FD3DF or targetvehhash == 0xB12314E0 or targetvehhash == 0xE5A2D6C6 or targetvehhash == 0x1ED0A534 or targetvehhash == 0x34E6BF6B or targetvehhash == 0x7F2153DF then --firetruck, pbus, riot, riot2, barracks, barrack2, barracks3, stretch, ripley, sadler, sadler2, scrap, towtruck, towtruck2, utilitruck, utilitruck2, utilitruck3
		availableTrucks = {2,3} --towtrucks with hook only
		print('car hook')
	elseif targetvehhash == 0xFDEFAEC3 or targetvehhash == 0x1517D4D9 or targetvehhash == 0xE2E7D4AB or targetvehhash == 0x8125BCF9 or targetvehhash == 0xFD231729 or targetvehhash == 0xB44F0582 or targetvehhash == 0xE5BA6858 or targetvehhash == 0xA1355F67 or targetvehhash == 0x7F81A829 or targetvehhash == 0x8F49AE28 or targetvehhash == 0x798682A2 or targetvehhash == 0xCEB28249 or targetvehhash == 0xED62BFA9 or targetvehhash == 0xEEF345EC or targetvehhash == 0x612F4B6 or targetvehhash == 0xD876DBE2 or targetvehhash == 0x1446590A or targetvehhash == 0x8B213907 or targetvehhash == 0x5D0AAC8F or targetvehhash == 0x44623884 or targetvehhash == 0xDFF0594C or targetvehhash == 0xD227BDBB or targetvehhash == 0xCB44B1CA or targetvehhash == 0x58E49664 or targetvehhash == 0x6A4BD8F6 or targetvehhash == 0x61D6BA8C or targetvehhash == 0x843B73DE or targetvehhash == 0x562A97BD then --police bike, police maverick, predator, blazer1, blazer2, blazer3, blazer4, blazer5, brutus, brutus2, brutus3, dune4, dune5, rcbandito, formula, formula2, airtug, caddy, caddy2, caddy3, docktug, forklift, mower, tractor, tractor2, tractor3
		availableTrucks = {1} -- flatbed only
		print('car flatbed')
	elseif targetvehhash == 0x132D5A1A or targetvehhash == 0xC703DB5F then --crusader, taxi
		availableTrucks = {1,2,3} -- flatbed and towtrucks with hook
		print('car all')
	elseif targetvehhash == 0x82CAC433 or targetvehhash == 0x9DAE1398 or targetvehhash == 0x7074F39D or targetvehhash == 0xC3FBA120 or targetvehhash == 0x810369E2 or targetvehhash == 0x1A7FCEFA or targetvehhash == 0x27D79225 or targetvehhash == 0x9B076C93 or targetvehhash == 0x8644331A or targetvehhash == 0x49863E9C or targetvehhash == 0xCD93A7DB or targetvehhash == 0x669EB40A or targetvehhash == 0xe2174AFC or targetvehhash == 0xD556917C or targetvehhash == 0x4C8DBA51 or targetvehhash == 0xD577C962 or targetvehhash == 0x4C80EB0E or targetvehhash == 0xEDC6F847 or targetvehhash == 0x8E08EC82 then --tug, phantom2, bulldozer, cutter, dump, handler, bruiser, bruiser2, bruiser3, marshall, monster, monster3, monster4, monster5, zhaba, airport bus, bus, brickade, wastelander
		availableTrucks = {} -- no towing possible
		print('car none')
	elseif targetvehClass == 14 or targetvehClass == 13 or targetvehClass == 15 or targetvehClass == 8 then -- boats, cycles,
		availableTrucks = {1} -- flatbed only
		print('class flatbed')
	elseif targetvehClass == 20 or targetvehClass == 10 or targetvehClass == 9 or targetvehClass == 17 or targetvehClass == 12 then -- commercials, industrial, off-road, service, vans
		availableTrucks = {2, 3} -- towtrucks with hook only
		print('class hook')
	elseif targetvehClass == 19 or targetvehClass == 16 or targetvehClass == 21 then -- military, planes, trains
		availableTrucks = {} -- no towing possible
		print('class none')
	elseif targetvehClass == 11 then
		availableTrucks = {4} -- truck
		print('class trailer')
	elseif targetvehClass == 0 or targetvehClass == 1 or targetvehClass == 2 or targetvehClass == 3 or targetvehClass == 4 or targetvehClass == 5 or targetvehClass == 6 or targetvehClass == 7 or targetvehClass == 18 then
		availableTrucks = {1,2,3}
		print('class all')
	else
		availableTrucks = {1} -- flatbed if nothing else is hit
		print('else')
	end]]

	if #availableTrucks == 0 then
		Notify('This vehicle cannot be towed.')
		TriggerServerEvent('pd5m:syncsv:RemoveVehFlagEntry', TargetVehNetID, 'Towing')
	else
		local traveldistance = CalculateTravelDistanceBetweenPoints(stationvec.x, stationvec.y, stationvec.z, tarx, tary, tarz)
		local traveltime = 2*math.ceil(traveldistance/1000)

		BeginTextCommandThefeedPost("TWOSTRINGS")

		AddTextComponentSubstringPlayerName("A towtruck has been dispatched from ~o~" .. list_handles[station.handle][1].handles[station.handle].stationname .. "~s~.")
		AddTextComponentSubstringPlayerName("It will arrive in approximately ~o~" .. traveltime .. "~s~ minutes.")

		EndTextCommandThefeedPostMessagetext("CHAR_PROPERTY_TOWING_IMPOUND", "CHAR_PROPERTY_TOWING_IMPOUND", false, 4, 'Department of', 'Public Order and Safety')
		EndTextCommandThefeedPostTicker(false, false)

		towtruckid = availableTrucks[math.random(#availableTrucks)]
		local vehiclehash = GetHashKey(vehicles[towtruckid])
		local drivermodel = GetHashKey(pmodels[math.random(#pmodels)])

		RequestModel(vehiclehash)
		while not HasModelLoaded(vehiclehash) do
			RequestModel(vehiclehash)
			Wait(50)
		end

		RequestModel(drivermodel)
		while not HasModelLoaded(drivermodel) do
			RequestModel(drivermodel)
			Wait(50)
		end

		local towtruck = CreateVehicle(vehiclehash, stationvec.x, stationvec.y, stationvec.z, stationvec.angle, true, false)
		SetVehicleColours(towtruck, 38, 0)
		local towdriver = CreatePed(26, drivermodel, stationvec.x, stationvec.y, stationvec.z+2.0, stationvec.angle, true, true)
		SetPedIntoVehicle(towdriver, towtruck, -1)
		SetVehicleFixed(towtruck)
		SetVehicleOnGroundProperly(towtruck)
		SetEntityAsMissionEntity(towdriver, true, true)
		local towblip = AddBlipForEntity(towtruck)
		SetBlipColour(towblip, 9)
		SetBlockingOfNonTemporaryEvents(towdriver, true)

		TowTruckNetID = VehToNet(towtruck)
		table.insert(ClientSelfVehTowingList, TargetVehNetID)
		table.insert(ClientSelfTowTruckList, TowTruckNetID)
		TriggerEvent('pd5m:tow:towtruckapproach', towtruck, towtruckid, towdriver, towblip, station, targetveh)
	end
end)

-- Event that is used to have a dispatched towtruck approach the car to be towed.
-- Do not use this, trigger 'pd5m:tow:calltowtruck'.
AddEventHandler('pd5m:tow:towtruckapproach', function(towtruck, towtruckid, towdriver, towblip, station, targetveh)
	local tarx, tary, tarz = table.unpack(GetEntityCoords(targetveh))
	local vehiclehash = GetHashKey(towtruck)

	TaskVehicleDriveToCoordLongrange(towdriver, towtruck, tarx, tary, tarz, 17.0, NormalDrivingBehavior, 2.0)

	local towx, towy, towz = table.unpack(GetEntityCoords(towtruck))
	local distance = Vdist2(towx, towy, towz, tarx, tary, tarz)

	ArePathNodesLoadedInArea(towx-100.0, towy-100.0, towx+100.0, towy+100.0)

	while distance > 1500.0 and GlobalFlagTowCar do
		print('Arriving')
		print(distance)
		towx, towy, towz = table.unpack(GetEntityCoords(towtruck))
		distance = Vdist2(towx, towy, towz, tarx, tary, tarz)

		if IsVehicleStopped(towtruck) and not IsVehicleStoppedAtTrafficLights(towtruck) then
			print('I have stopped')
			if IsPointOnRoad(towx, towy, towz, towtruck) then
				print("I'm on the road")
				local n = 0
				while IsVehicleStopped(towtruck) and n < 500 do
					print(n)
					n = n + 1
					Wait(10)
				end
				print('While ended')
				if n > 400 then
					print('Changing position')
					local towpos = GetOffsetFromEntityInWorldCoords(towtruck, 0.0, 100.0, 0.0)
					local _, pos, heading = GetClosestVehicleNodeWithHeading(towpos.x, towpos.y, towpos.z, 0, 3.0, 0)

					local offx = tarx - pos.x
					local offy = tary - pos.y
					local VecAngle = GetHeadingFromVector_2d(offx, offy)-heading

					if VecAngle < 270 and VecAngle > 90 then
						heading = heading + 180.00
					end
					SetEntityCoords(towtruck, pos.x, pos.y, pos.z, 1, 0, 0, 1)
					SetEntityCoords(towdriver, pos.x, pos.y, pos.z+2.0, 1, 0, 0, 0)
					SetEntityHeading(towtruck, heading)
					SetPedIntoVehicle(towdriver, towtruck, -1)
					SetVehicleFixed(towtruck)
					SetVehicleOnGroundProperly(towtruck)
					TaskVehicleDriveToCoordLongrange(towdriver, towtruck, tarx, tary, tarz, 17.0, NormalDrivingBehavior, 2.0)
				end
			else
				print("I'm off the road.")
				local n = 0
				while IsVehicleStopped(towtruck) and n < 500 do
					print(n)
					n = n + 1
					Wait(10)
				end
				print('While ended')
				if n > 400 then
					print('Changing position')
					local _, pos, heading = GetClosestVehicleNodeWithHeading(towx, towy, towz, 0, 3.0, 0)

					local offx = tarx - pos.x
					local offy = tary - pos.y
					local VecAngle = GetHeadingFromVector_2d(offx, offy)-heading

					if VecAngle < 270 and VecAngle > 90 then
						heading = heading + 180.00
					end
					SetEntityCoords(towtruck, pos.x, pos.y, pos.z, 1, 0, 0, 1)
					SetEntityCoords(towdriver, pos.x, pos.y, pos.z+2.0, 1, 0, 0, 0)
					SetEntityHeading(towtruck, heading)
					SetPedIntoVehicle(towdriver, towtruck, -1)
					SetVehicleFixed(towtruck)
					SetVehicleOnGroundProperly(towtruck)
					TaskVehicleDriveToCoordLongrange(towdriver, towtruck, tarx, tary, tarz, 17.0, NormalDrivingBehavior, 2.0)
				end
			end
		end
		Wait(1000)
	end

	if GlobalFlagTowCar then
		TriggerEvent('pd5m:tow:towtruckatscene', towtruck, towtruckid, towdriver, towblip, station, targetveh)
	else
		GlobalFlagTowCar = true
	end
end)

-- Event that is used to control the behavior of the towtruck at the seized car.
-- Do not use this, trigger 'pd5m:tow:calltowtruck'.
AddEventHandler('pd5m:tow:towtruckatscene', function(towtruck, towtruckid, towdriver, towblip, station, targetveh)
	print('At scene')
	local tarx, tary, tarz = table.unpack(GetEntityCoords(targetveh))
	local tardimensionMin, tardimensionMax = GetModelDimensions(GetEntityModel(targetveh))
	local tarsize = tardimensionMax - tardimensionMin

	local towdimensionMin, towdimensionMax = GetModelDimensions(GetEntityModel(towtruck))
	local towsize = towdimensionMax - towdimensionMin

	local vehiclehash = GetHashKey(towtruck)
	SetVehicleIndicatorLights(towtruck, 2, true)
	SetVehicleIndicatorLights(towtruck, 1, true)

	TaskVehicleDriveToCoord(towdriver, towtruck, tarx, tary, tarz, 5.0, 0, vehiclehash, NormalDrivingBehavior, 2.0, true)

	local towx, towy, towz = table.unpack(GetEntityCoords(towtruck))
	local distance = Vdist2(towx, towy, towz, tarx, tary, tarz)

	while distance > 800.0 and GlobalFlagTowCar do
		print('At scene start')
		print(distance)
		towx, towy, towz = table.unpack(GetEntityCoords(towtruck))
		distance = Vdist2(towx, towy, towz, tarx, tary, tarz)
		if IsVehicleStopped(towtruck) and not IsVehicleStoppedAtTrafficLights(towtruck) then
			print('I have stopped')
			if IsPointOnRoad(towx, towy, towz, towtruck) then
				print("I'm on the road")
				local n = 0
				while IsVehicleStopped(towtruck) and n < 500 do
					print(n)
					n = n + 1
					Wait(10)
				end
				print('While ended')
				if n > 400 then
					print('Changing position')
					local towpos = GetOffsetFromEntityInWorldCoords(towtruck, 0.0, 100.0, 0.0)
					local _, pos, heading = GetClosestVehicleNodeWithHeading(towpos.x, towpos.y, towpos.z, 0, 3.0, 0)

					local offx = tarx - pos.x
					local offy = tary - pos.y
					local VecAngle = GetHeadingFromVector_2d(offx, offy)-heading

					if VecAngle < 270 and VecAngle > 90 then
						heading = heading + 180.00
					end
					SetEntityCoords(towtruck, pos.x, pos.y, pos.z, 1, 0, 0, 1)
					SetEntityCoords(towdriver, pos.x, pos.y, pos.z+2.0, 1, 0, 0, 0)
					SetEntityHeading(towtruck, heading)
					SetPedIntoVehicle(towdriver, towtruck, -1)
					SetVehicleFixed(towtruck)
					SetVehicleOnGroundProperly(towtruck)
					TaskVehicleDriveToCoordLongrange(towdriver, towtruck, tarx, tary, tarz, 17.0, NormalDrivingBehavior, 2.0)
				end
			else
				print("I'm off the road.")
				local n = 0
				while IsVehicleStopped(towtruck) and n < 500 do
					print(n)
					n = n + 1
					Wait(10)
				end
				print('While ended')
				if n > 400 then
					print('Changing position')
					local _, pos, heading = GetClosestVehicleNodeWithHeading(towx, towy, towz, 0, 3.0, 0)

					local offx = tarx - pos.x
					local offy = tary - pos.y
					local VecAngle = GetHeadingFromVector_2d(offx, offy)-heading

					if VecAngle < 270 and VecAngle > 90 then
						heading = heading + 180.00
					end
					SetEntityCoords(towtruck, pos.x, pos.y, pos.z, 1, 0, 0, 1)
					SetEntityCoords(towdriver, pos.x, pos.y, pos.z+2.0, 1, 0, 0, 0)
					SetEntityHeading(towtruck, heading)
					SetPedIntoVehicle(towdriver, towtruck, -1)
					SetVehicleFixed(towtruck)
					SetVehicleOnGroundProperly(towtruck)
					TaskVehicleDriveToCoordLongrange(towdriver, towtruck, tarx, tary, tarz, 17.0, NormalDrivingBehavior, 2.0)
				end
			end
		end
		Wait(100)
	end

	if GlobalFlagTowCar then

		local towx, towy, towz = table.unpack(GetEntityCoords(towtruck))

		TaskVehicleDriveToCoord(towdriver, towtruck, tarx, tary, tarz, 3.0, 0, vehiclehash, NormalDrivingBehavior, 2.0, true)

		while distance > 300.0 and GlobalFlagTowCar do
			print('At scene closing in')
			print(distance)
			towx, towy, towz = table.unpack(GetEntityCoords(towtruck))
			distance = Vdist2(towx, towy, towz, tarx, tary, tarz)
			if IsVehicleStopped(towtruck) and not IsVehicleStoppedAtTrafficLights(towtruck) then
				print('I have stopped')
				if IsPointOnRoad(towx, towy, towz, towtruck) then
					print("I'm on the road")
					local n = 0
					while IsVehicleStopped(towtruck) and n < 500 do
						print(n)
						n = n + 1
						Wait(10)
					end
					print('While ended')
					if n > 400 then
						print('Changing position')
						local towpos = GetOffsetFromEntityInWorldCoords(towtruck, 0.0, 100.0, 0.0)
						local _, pos, heading = GetClosestVehicleNodeWithHeading(towpos.x, towpos.y, towpos.z, 0, 3.0, 0)

						local offx = tarx - pos.x
						local offy = tary - pos.y
						local VecAngle = GetHeadingFromVector_2d(offx, offy)-heading

						if VecAngle < 270 and VecAngle > 90 then
							heading = heading + 180.00
						end
						SetEntityCoords(towtruck, pos.x, pos.y, pos.z, 1, 0, 0, 1)
						SetEntityCoords(towdriver, pos.x, pos.y, pos.z+2.0, 1, 0, 0, 0)
						SetEntityHeading(towtruck, heading)
						SetPedIntoVehicle(towdriver, towtruck, -1)
						SetVehicleFixed(towtruck)
						SetVehicleOnGroundProperly(towtruck)
						TaskVehicleDriveToCoordLongrange(towdriver, towtruck, tarx, tary, tarz, 17.0, NormalDrivingBehavior, 2.0)
					end
				else
					print("I'm off the road.")
					local n = 0
					while IsVehicleStopped(towtruck) and n < 500 do
						print(n)
						n = n + 1
						Wait(10)
					end
					print('While ended')
					if n > 400 then
						print('Changing position')
						local _, pos, heading = GetClosestVehicleNodeWithHeading(towx, towy, towz, 0, 3.0, 0)

						local offx = tarx - pos.x
						local offy = tary - pos.y
						local VecAngle = GetHeadingFromVector_2d(offx, offy)-heading

						if VecAngle < 270 and VecAngle > 90 then
							heading = heading + 180.00
						end
						SetEntityCoords(towtruck, pos.x, pos.y, pos.z, 1, 0, 0, 1)
						SetEntityCoords(towdriver, pos.x, pos.y, pos.z+2.0, 1, 0, 0, 0)
						SetEntityHeading(towtruck, heading)
						SetPedIntoVehicle(towdriver, towtruck, -1)
						SetVehicleFixed(towtruck)
						SetVehicleOnGroundProperly(towtruck)
						TaskVehicleDriveToCoordLongrange(towdriver, towtruck, tarx, tary, tarz, 17.0, NormalDrivingBehavior, 2.0)
					end
				end
			end
			Wait(100)
		end

		if GlobalFlagTowCar then
			TaskVehicleTempAction(towdriver, towtruck, 27, 10000)

			Wait(3000)

			local TargetVehNetID = VehToNet(targetveh)
			local TowNetID = VehToNet(towtruck)
			TriggerServerEvent('pd5m:towsv:flatbedpickup', TargetVehNetID, TowNetID)

			Wait(1000)

			TriggerEvent('pd5m:tow:towtruckdepart', towtruck, towtruckid, towdriver, towblip, station, targetveh)
		else
			GlobalFlagTowCar = true
		end
	else
		GlobalFlagTowCar = true
	end
end)

-- Event to control the behaviour of the towtruck departing.
-- Do not use this, trigger 'pd5m:tow:calltowtruck'.
AddEventHandler('pd5m:tow:towtruckdepart', function(towtruck, towtruckid, towdriver, towblip, station, targetveh)
	print('Departing')
	local TargetVehNetID = VehToNet(targetveh)
	TriggerServerEvent('pd5m:syncsv:RemoveVehFlagEntry', TargetVehNetID, 'Towing')
	local vehiclehash = GetHashKey(towtruck)
	RemoveBlip(towblip)
	TaskVehicleDriveToCoordLongrange(towdriver, towtruck, station.x, station.y, station.z, 17.0, NormalDrivingBehavior, 2.0)
	SetEntityAsNoLongerNeeded(towtruck)
	SetEntityAsNoLongerNeeded(towdriver)
	SetEntityAsNoLongerNeeded(targetveh)
	local towx, towy, towz = table.unpack(GetEntityCoords(towtruck))
	local distance = Vdist2(towx, towy, towz, tarx, tary, tarz)

	while distance > 50.0 and DoesEntityExist(towtruck) do
		local towx, towy, towz = table.unpack(GetEntityCoords(towtruck))
		local distance = Vdist2(towx, towy, towz, tarx, tary, tarz)
		Wait(1000)
	end

	if DoesEntityExist(towtruck) then
		DeleteEntity(targetveh)
		TaskVehicleDriveWander(towdriver, towtruck, 30.0, NormalDrivingBehavior)
		SetVehicleIndicatorLights(towtruck, 2, false)
		SetVehicleIndicatorLights(towtruck, 1, false)
	end

end)

-- Event to abort a dispatched towtruck.
-- Do not use this, trigger 'pd5m:towsv:aborttowtruck'.
RegisterNetEvent('pd5m:tow:aborttowtruck')
AddEventHandler('pd5m:tow:aborttowtruck', function(TargetVehNetID)
	local SelfTowTruck = false
	local TowTruckNetID = 0
	for i, NetID in ipairs(ClientSelfVehTowingList) do
		if NetID == TargetVehNetID then
			SelfTowTruck = true
			TowTruckNetID = ClientSelfTowTruckList[i]
			break
		end
	end
	if TowTruckNetID ~= 0 then
		TriggerServerEvent('pd5m:syncsv:RemoveVehFlagEntry', TargetVehNetID, 'Towing')
		towtruck = NetToVeh(TowTruckNetID)
		towdriver = GetPedInVehicleSeat(towtruck, -1)
		towblip = GetBlipFromEntity(towtruck)
		GlobalFlagTowCar = false
		RemoveBlip(towblip)
		SetVehicleIndicatorLights(towtruck, 2, false)
		SetVehicleIndicatorLights(towtruck, 1, false)
		TaskVehicleDriveWander(towdriver, towtruck, 30.0, NormalDrivingBehavior)
		SetEntityAsNoLongerNeeded(towtruck)
		SetEntityAsNoLongerNeeded(towdriver)
	end
end)

-- player used handler to get the variables the flatbedpickup-handler needs.
RegisterNetEvent('pd5m:tow:playerflatbedpickup')
AddEventHandler('pd5m:tow:playerflatbedpickup', function()

end)

-- handler to have flatbed pick up cars that are beside it.
RegisterNetEvent('pd5m:tow:flatbedpickup')
AddEventHandler('pd5m:tow:flatbedpickup', function(TargetVehNetID, TowNetID)
	local targetveh = NetToVeh(TargetVehNetID)
	local towtruck = NetToVeh(TowNetID)
	AttachEntityToEntity(targetveh, towtruck, GetEntityBoneIndexByName(targetveh, "chassis"), 0.0, -2.0, 1.0, 0.0, 0.0, 0.0, false, false, true, false, 0, true)
end)

-- Player-version of a pushcar-function. Do not use this for NPCs.
-- needs a different approach to controls than the NPC function. Don't code one as a feature of the other.
RegisterNetEvent('pd5m:tow:playerpushcar')
AddEventHandler('pd5m:tow:playerpushcar', function() -- no variables allowed

end)
