Mss_Cll_GrandTheftAuto1_Silverman = {
  Class = 'Robbery',
  Weight = 100,
  Main = function()
    Notify('Example Callout 1 was triggered.')

    local rndx = math.random(-3250, 3850) + 0.1
    local rndy = math.random(-3350 ,7050) + 0.1
    local rndz = GetHeightmapTopZForPosition(rndx, rndy)

    local _, cllcoord, heading = GetClosestVehicleNodeWithHeading(rndx, rndy, rndz, 0, 3.0, 0)

    local blip = AddBlipForCoord(cllcoord.x, cllcoord.y, cllcoord.z)

    --Wait(10000)

    Notify('go')

    local _, CrimSpawn = GetPointOnRoadSide(cllcoord.x, cllcoord.y, cllcoord.z, 1)

    local radius = 400.0
    local TempXPedSpawn = cllcoord.x - math.sin(heading)*radius
    local TempYPedSpawn = cllcoord.y + math.cos(heading)*radius
    local TempZPedSpawn = GetHeightmapTopZForPosition(TempXPedSpawn, TempYPedSpawn)

    local _, PedSpawn, pedheading = GetClosestVehicleNodeWithHeading(TempXPedSpawn, TempYPedSpawn, TempZPedSpawn, 0, 3.0, 0)

    local offx = cllcoord.x - PedSpawn.x
    local offy = cllcoord.y - PedSpawn.y

    local VecAngle = GetHeadingFromVector_2d(offx, offy) - pedheading

    if VecAngle < 270 and VecAngle > 90 then
      pedheading = pedheading + 180.0
    end

    local offx2 = PedSpawn.x - cllcoord.x
    local offy2 = PedSpawn.y - cllcoord.y

    local VecAngle2 = GetHeadingFromVector_2d(offx2, offy2) - heading

    if VecAngle2 < 270 and VecAngle2 > 90 then
    else
      heading = heading + 180.0
    end

    local CriminalModelList = {'a_m_m_eastsa_01', 'g_m_y_azteca_01', 'g_m_y_ballaeast_01', 'g_f_y_ballas_01', 'u_f_y_bikerchic', 'g_f_y_lost_01', 'g_m_y_lost_01', 'g_m_y_lost_02', 'g_m_y_lost_03', 'g_m_y_mexgoon_03'}
    local PedModelList = {'ig_bankman', 'a_f_m_bevhills_01', 'a_f_y_bevhills_01', 'a_m_m_bevhills_01', 'a_m_y_bevhills_01', 'a_f_m_bevhills_02', 'a_f_y_bevhills_02', 'a_m_m_bevhills_02', 'a_m_y_bevhills_02', 'a_f_y_bevhills_03', 'a_f_y_bevhills_04', 'a_f_y_business_01', 'a_m_m_business_01', 'a_m_y_business_01', 'a_f_m_business_02', 'a_f_y_business_02', 'a_m_y_business_02', 'a_f_y_business_03', 'a_m_y_business_03', 'a_f_y_business_04'}
    local VehicleModelList = {'blista', 'issi2', 'panto', 'exemplar', 'felon', 'felon2', 'f620', 'jackal', 'oracle', 'oracle2', 'sentinel', 'sentinel2', 'zion', 'zion2', 'coquette3', 'dominator', 'dominator3', 'gauntlet', 'baller', 'baller2', 'dubsta', 'gresley', 'habanero', 'patriot', 'rocoto', 'xls', 'asea', 'asterope', 'fugitive', 'intruder', 'premier', 'surge', 'tailgater', 'banshee', 'bestiagts', 'buffalo', 'carbonizzare', 'comet2', 'comet5', 'coquette', 'elegy2', 'feltzer2', 'flashgt', 'fusilade', 'kuruma', 'ninef', 'ninef2', 'pariah', 'schafter2', 'raiden', 'rapidgt', 'rapidgt2', 'penumbra', 'schwarzer', 'sultan', 'coquette2', 'mamba', 'monroe', 'bullet', 'pfister811', 't20', 'tempesta', 'vacca', 'voltic', 'zentorno', 'bison', 'burrito', 'rumpo', 'minivan'}

    local criminalmodel = GetHashKey(CriminalModelList[math.random(#CriminalModelList)])
    local pedmodel = GetHashKey(PedModelList[math.random(#PedModelList)])
    local pedvehicle = GetHashKey(VehicleModelList[math.random(#VehicleModelList)])

    RequestModel(criminalmodel)
    while not HasModelLoaded(criminalmodel) do
      RequestModel(criminalmodel)
      Wait(100)
    end

    RequestModel(pedmodel)
    while not HasModelLoaded(pedmodel) do
      RequestModel(pedmodel)
      Wait(100)
    end

    RequestModel(pedvehicle)
    while not HasModelLoaded(pedvehicle) do
      RequestModel(pedvehicle)
      Wait(100)
    end

    local criminal = CreatePed(26, criminalmodel, CrimSpawn.x, CrimSpawn.y, CrimSpawn.z, heading, true, true)
    NetworkRegisterEntityAsNetworked(criminal)
    SetEntityAsMissionEntity(criminal, true, true)
    local criminalNetID = PedToNet(criminal)
    TriggerServerEvent('pd5m:msssv:RegisterCalloutEntity', criminalNetID)

    local pedveh = CreateVehicle(pedvehicle, PedSpawn.x, PedSpawn.y, PedSpawn.z, pedheading, true, false)
    NetworkRegisterEntityAsNetworked(pedveh)
    SetEntityAsMissionEntity(pedveh, true, true)
    local pedvehNetID = VehToNet(pedveh)
    TriggerServerEvent('pd5m:msssv:RegisterCalloutEntity', pedvehNetID)

    local PedSpawnCorr = GetOffsetFromEntityInWorldCoords(pedveh, 2.0, 0, 0)

    SetEntityCoords(pedveh, PedSpawnCorr.x, PedSpawnCorr.y, PedSpawnCorr.z-0.5, 1, 0, 0, 1)

    local ped = CreatePed(26, pedmodel, PedSpawnCorr.x, PedSpawnCorr.y, PedSpawnCorr.z + 2.0, pedheading, true, true)
    NetworkRegisterEntityAsNetworked(ped)
    SetEntityAsMissionEntity(ped, true, true)
    local pedNetID = PedToNet(ped)
    TriggerServerEvent('pd5m:msssv:RegisterCalloutEntity', pedNetID)

    SetPedIntoVehicle(ped, pedveh, -1)
    SetVehicleFixed(pedveh)
    SetVehicleOnGroundProperly(pedveh)
    SetBlockingOfNonTemporaryEvents(ped, true)

    -- ToDo: Randomize the art of weapons the criminal can have. Depending on weapons code chances for the heist to fail
    local CriminalFlagListIndex = SyncPedAndVeh(criminal, 0)
    local PedFlagListIndex, PedVehFlagListIndex = SyncPedAndVeh(ped, pedveh)

    local CriminalWeapons = {}
    for i=1,math.random(1,4),1 do
			table.insert(CriminalWeapons, IllegalWeaponList[math.random(1, #IllegalWeaponList)])
		end
		local flagillegalweapon = true

    TriggerServerEvent('pd5m:syncsv:ChangePedEntry', criminalNetID, 'savepedweapons', CriminalIllegalWeapons)
    TriggerServerEvent('pd5m:syncsv:ChangePedEntry', criminalNetID, 'flagpedillegalweapon', flagillegalweapon)

    for i, Weapon in ipairs(CriminalWeapons) do
      GiveWeaponToPed(criminal, Weapon, 300, false, false)
    end

    -- ToDo: Randomize the weapons and abilities the ped can have. Depending on these code chances for the heist to fail.

    local PedDrivingBehavior = NormalDrivingBehavior

    local crimblip = AddBlipForEntity(criminal)
    local pedvehblip = AddBlipForEntity(pedveh)
    local pedblip = AddBlipForEntity(ped)

    ArePathNodesLoadedInArea(CrimSpawn.x-100.0, CrimSpawn.y-100.0, CrimSpawn.x+100.0, CrimSpawn.y+100.0)

    SetEntityDynamic(criminal, true)

    TaskWanderStandard(criminal, 10.0, 10)

    --TaskWanderInArea(criminal, CrimSpawn.x, CrimSpawn.y, CrimSpawn.z, 100.0, 5.0, 1000)


    ArePathNodesLoadedInArea(PedSpawnCorr.x-100.0, PedSpawnCorr.y-100.0, PedSpawnCorr.x+100.0, PedSpawnCorr.y+100.0)

    SetEntityDynamic(ped, true)
    SetEntityDynamic(pedveh, true)

    --TaskVehicleDriveWander(ped, pedveh, 17.0, PedDrivingBehavior)

    --Wait(2000)

    TaskVehicleDriveToCoordLongrange(ped, pedveh, cllcoord.x, cllcoord.y, cllcoord.z, 17.0, PedDrivingBehavior, 2.0)

    local distance = 99999999.0

    Wait(2000)

    while distance > 140.0 do
      local pedvehcoords = GetEntityCoords(pedveh)
      distance = CalculateTravelDistanceBetweenPoints(cllcoord.x, cllcoord.y, cllcoord.z, pedvehcoords.x, pedvehcoords.y, pedvehcoords.z)
      Wait(500)
    end

    TaskGoStraightToCoord(criminal, cllcoord.x, cllcoord.y, cllcoord.z, 1.0, 10000, heading, 2.0)

    while distance > 80.0 do
      local pedvehcoords = GetEntityCoords(pedveh)
      distance = CalculateTravelDistanceBetweenPoints(cllcoord.x, cllcoord.y, cllcoord.z, pedvehcoords.x, pedvehcoords.y, pedvehcoords.z)
      Wait(500)
    end

    SetCurrentPedWeapon(criminal, CriminalWeapons[math.random(1, #CriminalWeapons)], true)

    TaskAimGunAtEntity(criminal, ped, -1, 0)


  end,
}
