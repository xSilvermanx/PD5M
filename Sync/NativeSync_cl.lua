RegisterNetEvent('pd5m:sync:native:TaskVehicleDriveToCoord')
AddEventHandler('pd5m:sync:native:TaskVehicleDriveToCoord', function(PedNetID, VehicleNetID, x, y, z, speed, vehiclemodel, drivingMode, stopRange)
  local plpedcoords = GetEntityCoords(GetPlayerPed(-1))
  local ped = NetToPed(PedNetID)
  local vehicle = NetToVeh(VehicleNetID)
  local vehcoords = GetEntityCoords(vehicle)

  ArePathNodesLoadedInArea(vehcoords.x-PathNodesLoading, vehcoords.y-PathNodesLoading, vehcoords.x+PathNodesLoading, vehcoords.y+PathNodesLoading)

  --print(Vdist(plpedcoords.x, plpedcoords.y, plpedcoords.z, vehcoords.x, vehcoords.y, vehcoords.z))

  if true then --check if DriveToCoord fails for longrange distances. Determine the range at which DriveToCoord fails (check if its a Vdist() or a CalculateTravelDistanceBetweenPoints()-issue. Order appropriate if-clause. Check if Longrange fails if a player is near.)
    print('Normal')
    TaskVehicleDriveToCoord(ped, vehicle, x, y, z, speed, 1.0, vehiclemodel, drivingMode, stopRange, true)
  else
    print('Longrange')
    TaskVehicleDriveToCoordLongrange(ped, vehicle, x, y, z, speed, drivingMode, stopRange)
  end
end)

RegisterNetEvent('pd5m:sync:native:TaskVehicleDriveWander')
AddEventHandler('pd5m:sync:native:TaskVehicleDriveWander', function(PedNetID, VehicleNetID, speed, drivingMode)
  local ped = NetToPed(PedNetID)
  local vehicle = NetToVeh(VehicleNetID)
  local vehcoords = GetEntityCoords(vehicle)

  ArePathNodesLoadedInArea(vehcoords.x-PathNodesLoading, vehcoords.y-PathNodesLoading, vehcoords.x+PathNodesLoading, vehcoords.y+PathNodesLoading)

  TaskVehicleDriveWander(ped, vehicle, speed, drivingMode)
end)

RegisterNetEvent('pd5m:sync:native:TaskWanderStandard')
AddEventHandler('pd5m:sync:native:TaskWanderStandard', function(PedNetID, p1, p2)
  local ped = NetToPed(PedNetID)
  TaskWanderStandard(ped, p1, p2)
end)
