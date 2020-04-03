-- remember to have services flag cars / peds / dead bodies as NoLongerNeeded
-- optional you can have the service remove the entities directly

-- these flags are used to a) interrupt any and every while-loop if a coroner is cancelled;
-- b) save the identity of the coroner to delete the car + ped after a cancellation.
-- You can only call one coroner at the same time.
flagcalledcoroner = false
GlobalCoroner = nil
GlobalCoronerDriver = nil
GlobalCoronerBlip = nil
GlobalSpeedZone = nil

-- NetEvent to call a coroner.
-- Advise: Do not trigger this since it's already set for player control.
RegisterNetEvent('pd5m:service:callcoroner')
AddEventHandler('pd5m:service:callcoroner', function()
	if flagcalledcoroner then
		TriggerEvent('pd5m:service:abortcoroner')
		Notify('Coroner aborted')
		flagcalledcoroner = false
	else
		TriggerEvent('pd5m:service:initcoroner')
		flagcalledcoroner = true
	end
end)

-- Initializes the coroner. Selects the station to dispatch the coroner from.
-- Triggers the event 'pd5m:service:coronerapproach'.
-- Don't use this, trigger 'pd5m:service:callcoroner'.
AddEventHandler('pd5m:service:initcoroner', function()
	local pmodels = CoronerDrivers
	local vehicles = CoronerVehicles
	local playerped = GetPlayerPed(-1)

	local tarx, tary, tarz = table.unpack(GetEntityCoords(playerped))
	local station = nil
	local shortestdistance = 999999999
	for i, location in ipairs(list_coroner_spawns) do
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

	if VecAngle < 270 and VecAngle > 90 then
		stx = station.xa
		sty = station.ya
		stz = station.za
		sta = station.aa
	end

	local stationvec = {x=stx, y=sty, z=stz, angle=sta}

	local vehiclehash = GetHashKey(vehicles[math.random(#vehicles)])
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

	local traveldistance = CalculateTravelDistanceBetweenPoints(station.x, station.y, station.z, tarx, tary, tarz)
	local traveltime = math.ceil(traveldistance/1000)/2

	BeginTextCommandThefeedPost("TWOSTRINGS")

	AddTextComponentSubstringPlayerName("A coroner has been dispatched from ~o~" .. list_handles[station.handle][1].handles[station.handle].stationname .. "~s~.")
	AddTextComponentSubstringPlayerName("It will arrive in approximately ~o~" .. traveltime .. "~s~ minutes.")

	EndTextCommandThefeedPostMessagetext("CHAR_CALL911", "CHAR_CALL911", false, 4, 'County of Los Santos', 'Department of Coroner')
	EndTextCommandThefeedPostTicker(false, false)

	local coroner = CreateVehicle(vehiclehash, stationvec.x, stationvec.y, stationvec.z, stationvec.angle, true, false)
	local coronerdriver = CreatePed(26, drivermodel, stationvec.x, stationvec.y, stationvec.z+2.0, stationvec.angle, true, true)
	SetPedIntoVehicle(coronerdriver, coroner, -1)
	SetVehicleFixed(coroner)
	SetVehicleOnGroundProperly(coroner)
	SetEntityAsMissionEntity(coronerdriver, true, true)
	local coronerblip = AddBlipForEntity(coroner)
	SetBlipColour(coronerblip, 29)
	SetBlockingOfNonTemporaryEvents(coronerdriver, true)
	SetVehicleSiren(coroner, true)

	GlobalCoroner = coroner
	GlobalCoronerDriver = coronerdriver
	GlobalCoronerBlip = coronerblip

	TriggerEvent('pd5m:service:coronerapproach', coroner, coronerdriver, coronerblip, station)
end)

-- Event that is used to control the behavior of the control while approaching.
-- Do not use this, trigger 'pd5m:service:callcoroner'.
AddEventHandler('pd5m:service:coronerapproach', function(coroner, coronerdriver, coronerblip, station)
	local playerped = GetPlayerPed(-1)
	local px, py, pz = table.unpack(GetEntityCoords(playerped))
	local _, tarpos = GetClosestVehicleNode(px, py, pz, 1, 3.0, 0)
	local tarx, tary, tarz = table.unpack(tarpos)
	local vehiclehash = GetHashKey(coroner)

	TaskVehicleDriveToCoordLongrange(coronerdriver, coroner, tarx, tary, tarz, 30.0, PoliceDrivingBehavior, 2.0)

	local corx, cory, corz = table.unpack(GetEntityCoords(coroner))
	local distance = Vdist2(corx, cory, corz, tarx, tary, tarz)

	while distance > 2000.0 and flagcalledcoroner do
		print('Arriving')
		print(distance)
		corx, cory, corz = table.unpack(GetEntityCoords(coroner))
		distance = Vdist2(corx, cory, corz, tarx, tary, tarz)

		ArePathNodesLoadedInArea(corx-100.0, cory-100.0, corx+100.0, cory+100.0)

		if IsVehicleStopped(coroner) and not IsVehicleStoppedAtTrafficLights(coroner) then
			print('I have stopped')
			if IsPointOnRoad(corx, cory, corz, coroner) then
				print("I'm on the road")
				local n = 0
				while IsVehicleStopped(coroner) and n < 500 do
					print(n)
					n = n + 1
					Wait(10)
				end
				print('While ended')
				if n > 400 then
					print('Changing position')
					local corpos = GetOffsetFromEntityInWorldCoords(coroner, 0.0, 100.0, 0.0)
					local _, pos, heading = GetClosestVehicleNodeWithHeading(corpos.x, corpos.y, corpos.z, 0, 3.0, 0)

					local offx = tarx - pos.x
					local offy = tary - pos.y
					local VecAngle = GetHeadingFromVector_2d(offx, offy)-heading

					if VecAngle < 270 and VecAngle > 90 then
						heading = heading + 180.00
					end
					SetEntityCoords(coroner, pos.x, pos.y, pos.z, 1, 0, 0, 1)
					SetEntityCoords(coronerdriver, pos.x, pos.y, pos.z+2.0, 1, 0, 0, 0)
					SetEntityHeading(coroner, heading)
					SetPedIntoVehicle(coronerdriver, coroner, -1)
					SetVehicleFixed(coroner)
					SetVehicleOnGroundProperly(coroner)
					TaskVehicleDriveToCoordLongrange(coronerdriver, coroner, tarx, tary, tarz, 17.0, NormalDrivingBehavior, 2.0)
				end
			else
				print("I'm off the road.")
				local n = 0
				while IsVehicleStopped(coroner) and n < 500 do
					print(n)
					n = n + 1
					Wait(10)
				end
				print('While ended')
				if n > 400 then
					print('Changing position')
					local _, pos, heading = GetClosestVehicleNodeWithHeading(corx, cory, corz, 0, 3.0, 0)

					local offx = tarx - pos.x
					local offy = tary - pos.y
					local VecAngle = GetHeadingFromVector_2d(offx, offy)-heading

					if VecAngle < 270 and VecAngle > 90 then
						heading = heading + 180.00
					end
					SetEntityCoords(coroner, pos.x, pos.y, pos.z, 1, 0, 0, 1)
					SetEntityCoords(coronerdriver, pos.x, pos.y, pos.z+2.0, 1, 0, 0, 0)
					SetEntityHeading(coroner, heading)
					SetPedIntoVehicle(coronerdriver, coroner, -1)
					SetVehicleFixed(coroner)
					SetVehicleOnGroundProperly(coroner)
					TaskVehicleDriveToCoordLongrange(coronerdriver, coroner, tarx, tary, tarz, 17.0, NormalDrivingBehavior, 2.0)
				end
			end
		end
		Wait(1000)
	end

	if flagcalledcoroner then
		TriggerEvent('pd5m:service:coroneratscene', coroner, coronerdriver, coronerblip, station)
	end
end)

-- Event that is used to control the behavior of the control at the scene.
-- Do not use this, trigger 'pd5m:service:callcoroner'.
AddEventHandler('pd5m:service:coroneratscene', function(coroner, coronerdriver, coronerblip, station)
	print('At scene')
	local playerped = GetPlayerPed(-1)
	local px, py, pz = table.unpack(GetEntityCoords(playerped))
	local _, tarpos = GetClosestVehicleNode(px, py, pz, 1, 3.0, 0)
	local tarx, tary, tarz = table.unpack(tarpos)
	local vehiclehash = GetHashKey(coroner)

	TaskVehicleDriveToCoord(coronerdriver, coroner, tarx, tary, tarz, 15.0, 0, vehiclehash, NormalDrivingBehavior, 2.0, true)

	local corx, cory, corz = table.unpack(GetEntityCoords(coroner))
	local distance = Vdist2(corx, cory, corz, tarx, tary, tarz)

	while distance > 800.0 and flagcalledcoroner do
		print('At scene start')
		print(distance)
		corx, cory, corz = table.unpack(GetEntityCoords(coroner))
		distance = Vdist2(corx, cory, corz, tarx, tary, tarz)
		Wait(100)
	end

	if flagcalledcoroner then

		local corx, cory, corz = table.unpack(GetEntityCoords(coroner))

		TaskVehicleDriveToCoord(coronerdriver, coroner, tarx, tary, tarz, 5.0, 0, vehiclehash, NormalDrivingBehavior, 2.0, true)

		while distance > 100.0 and flagcalledcoroner do
			print('At scene closing in')
			print(distance)
			corx, cory, corz = table.unpack(GetEntityCoords(coroner))
			distance = Vdist2(corx, cory, corz, tarx, tary, tarz)
			Wait(100)
		end

		if flagcalledcoroner then

			TaskVehicleTempAction(coronerdriver, coroner, 27, 10000)

			local DeadPedList = {}
			local corx, cory, corz = table.unpack(GetEntityCoords(coroner))

			for ped in EnumeratePeds() do
				if IsEntityDead(ped) then
					local tarx, tary, tarz = table.unpack(GetEntityCoords(ped))
					if Vdist2(tarx, tary, tarz, corx, cory, corz) < 2500.0 then
						table.insert(DeadPedList, ped)
					end
				end
			end

			Wait(3000)

			if #DeadPedList > 0 then
				TaskLeaveVehicle(coronerdriver, coroner, 0)

				local corx, cory, corz = table.unpack(GetEntityCoords(coroner))

				GlobalSpeedZone = AddSpeedZoneForCoord(corx, cory, corz, 10.0, 0.0, false)

				Wait(1000)

				for i, target in ipairs(DeadPedList) do
					if DoesEntityExist(target) then
						local tarx, tary, tarz = table.unpack(GetEntityCoords(target))
						TaskGoToEntity(coronerdriver, target, -1, 1.0, 2.0, 1073741824, 0)

						local distance = 9999999
						while distance > 8.0 do
							local corx, cory, corz = table.unpack(GetEntityCoords(coronerdriver))
							distance = Vdist2(corx, cory, corz, tarx, tary, tarz)
							Wait(100)
						end

						if DoesEntityExist(target) then
							TriggerServerEvent('pd5m:syncsv:TaskPlayAnim', target, 'anim@heists@narcotics@trash', 'pickup', 8.0, 8.0, -1, 0, 0.0, 0, 0, 0)
							Wait(500)
							DeleteEntity(target)
							-- put it into a bag, despawn person, pick up bag, put it into the vehicle, remove last coordinates
							Wait(2500)

							TaskGoToEntity(coronerdriver, coroner, -1, 1.0, 2.0, 1073741824, 0)
							local distance = 9999999
							local tarx, tary, tarz = table.unpack(GetEntityCoords(coroner))
							while distance > 20.0 do
								local corx, cory, corz = table.unpack(GetEntityCoords(coronerdriver))
								distance = Vdist2(corx, cory, corz, tarx, tary, tarz)
								Wait(100)
							end

						end
					end
				end

				DeadPedList = {}

				Wait(1000)

				TaskEnterVehicle(coronerdriver, coroner, -1, -1, 1.0, 1, 0)
			end

			TriggerEvent('pd5m:service:coronerdepart', coroner, coronerdriver, coronerblip, station)
		end
	end
end)

-- Event that is used to control the behavior of the control while departing.
-- Do not use this, trigger 'pd5m:service:callcoroner'.
AddEventHandler('pd5m:service:coronerdepart', function(coroner, coronerdriver, coronerblip, station)
	print('Departing')
	local vehiclehash = GetHashKey(coroner)
	local tarx, tary, tarz = station.x, station.y, station.z
	RemoveBlip(coronerblip)
	TaskVehicleDriveToCoordLongrange(coronerdriver, coroner, tarx, tary, tarz, 30.0, PoliceDrivingBehavior, 2.0)
	if GlobalSpeedZone ~= nil then
		RemoveSpeedZone(GlobalSpeedZone)
	end
	SetEntityAsNoLongerNeeded(coroner)
	SetEntityAsNoLongerNeeded(coronerdriver)
	local corx, cory, corz = table.unpack(GetEntityCoords(coroner))
	local distance = Vdist2(corx, cory, corz, tarx, tary, tarz)

	while distance > 50.0 and DoesEntityExist(coroner) do
		corx, cory, corz = table.unpack(GetEntityCoords(coroner))
		distance = Vdist2(corx, cory, corz, tarx, tary, tarz)
		Wait(1000)
	end
	if DoesEntityExist(coroner) then
		TaskVehicleDriveWander(coronerdriver, coroner, 17.0, NormalDrivingBehavior)
		SetVehicleSiren(coroner, false)
	end

	GlobalCoronerBlip = nil
	GlobalCoroner = nil
	GlobalCoronerDriver = nil
	flagcalledcoroner = false
	GlobalSpeedZone = nil
end)

-- Event that is used to abort a dispatched coroner.
-- Advise: Do not use this, as it is already set for player-control.
RegisterNetEvent('pd5m:service:abortcoroner')
AddEventHandler('pd5m:service:abortcoroner', function()
	RemoveBlip(GlobalCoronerBlip)
	TaskVehicleDriveWander(GlobalCoronerDriver, GlobalCoroner, 17.0, NormalDrivingBehavior)
	SetVehicleSiren(GlobalCoroner, false)
	SetEntityAsNoLongerNeeded(GlobalCoroner)
	SetEntityAsNoLongerNeeded(GlobalCoronerDriver)

	if GlobalSpeedZone ~= nil then
		RemoveSpeedZone(GlobalSpeedZone)
	end

	GlobalCoronerBlip = nil
	GlobalCoroner = nil
	GlobalCoronerDriver = nil
	flagcalledcoroner = false
	GlobalSpeedZone = nil
end)
