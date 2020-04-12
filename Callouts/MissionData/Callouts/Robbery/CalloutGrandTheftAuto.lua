Mss_Cll_GrandTheftAuto1_Silverman = {
  Class = 'Robbery',
  Weight = 100,
  Main = function()
    Notify('Callout "Grand Theft Auto" was triggered.')

    MarkerList = {

    }

    CreateThread(function()
      while true do
        for i, Marker in ipairs(MarkerList) do
          DrawMarker(26, Marker.x, Marker.y, Marker.z, 0.0, 0.0, 0.0, 0.0, 0.0, Marker.a, 1.0, 1.0, 1.0, Marker.r, Marker.g, Marker.b, 180, false, false, 2, false, nil, nil, false)
        end
        Wait(0)
      end
    end)

    local rndx = math.random(-3250, 3850) + 0.1
    local rndy = math.random(-3350, 7050) + 0.1
    local rndz = GetHeightmapTopZForPosition(rndx, rndy)
    local nthNode = math.random(1, 20)

    local MissionPosBool, MissionPos, MissionHeading, _ = GetNthClosestVehicleNodeWithHeading(rndx, rndy, rndz, nthNode, 0, 3.0, 2.5)

    while not MissionPosBool do
      rndx = math.random(-3250, 3850) + 0.1
      rndy = math.random(-3350, 7050) + 0.1
      rndz = GetHeightmapTopZForPosition(rndx, rndy)
      nthNode = math.random(1, 20)
      MissionPosBool, MissionPos, MissionHeading, _ = GetNthClosestVehicleNodeWithHeading(rndx, rndy, rndz, nthNode, 0, 3.0, 2.5)
      Wait(500)
    end

    local MissionBlip = AddBlipForCoord(MissionPos.x, MissionPos.y, MissionPos.z)

    local MissionVehSpawnRadius = 350
    rndx = MissionPos.x + math.random(-MissionVehSpawnRadius, MissionVehSpawnRadius)
    rndy = MissionPos.y + math.random(-MissionVehSpawnRadius, MissionVehSpawnRadius)
    rndz = GetHeightmapTopZForPosition(rndx, rndy)

    local MissionVehSpawnBool, MissionVehSpawn, MissionVehHeading = GetClosestVehicleNodeWithHeading(rndx, rndy, rndz, 0, 3.0, 0)
    local EstTravelDistance = CalculateTravelDistanceBetweenPoints(MissionVehSpawn.x, MissionVehSpawn.y, MissionVehSpawn.z, MissionPos.x, MissionPos.y, MissionPos.z)

    while not MissionVehSpawnBool or EstTravelDistance > 600.0 or EstTravelDistance < 200.0 do
      rndx = MissionPos.x + math.random(-MissionVehSpawnRadius, MissionVehSpawnRadius)
      rndy = MissionPos.y + math.random(-MissionVehSpawnRadius, MissionVehSpawnRadius)
      rndz = GetHeightmapTopZForPosition(rndx, rndy)
      MissionVehSpawnBool, MissionVehSpawn, MissionVehHeading = GetClosestVehicleNodeWithHeading(rndx, rndy, rndz, 0, 3.0, 0)
      EstTravelDistance = CalculateTravelDistanceBetweenPoints(MissionVehSpawn.x, MissionVehSpawn.y, MissionVehSpawn.z, MissionPos.x, MissionPos.y, MissionPos.z)
      Wait(500)
    end

    local SpawnBlip = AddBlipForCoord(MissionVehSpawn.x, MissionVehSpawn.y, MissionVehSpawn.z)
    SetBlipColour(SpawnBlip, 1)

    local offx = MissionPos.x - MissionVehSpawn.x
    local offy = MissionPos.y - MissionVehSpawn.y

    local AngleSpawn = GetHeadingFromVector_2d(offx, offy) - MissionVehHeading

    while AngleSpawn < 0 or AngleSpawn > 360 do
      if AngleSpawn < 0 then
        AngleSpawn = AngleSpawn + 360
      elseif AngleSpawn > 360 then
        AngleSpawn = AngleSpawn - 360
      end
      Wait(200)
    end

    if AngleSpawn < 270 and AngleSpawn > 90 then
      MissionVehHeading = MissionVehHeading + 180.0
    end

    local off2x = MissionVehSpawn.x - MissionPos.x
    local off2y = MissionVehSpawn.y - MissionPos.y

    local AngleMissPos = GetHeadingFromVector_2d(off2x, off2y) - MissionHeading

    while AngleMissPos < 0 or AngleMissPos > 360 do
      if AngleMissPos < 0 then
        AngleMissPos = AngleMissPos + 360
      elseif AngleMissPos > 360 then
        AngleMissPos = AngleMissPos - 360
      end
      Wait(200)
    end

    if AngleMissPos < 270 and AngleMissPos > 90 then
    else
      MissionHeading = MissionHeading + 180.0
    end

    local CrimSpawnBool, CrimPos = GetRoadSidePointWithHeading(MissionPos.x, MissionPos.y, MissionPos.z, MissionHeading)

    local _, TempPos1, TempHeading, _ = GetNthClosestVehicleNodeWithHeading(MissionPos.x, MissionPos.y, MissionPos.z, 2, 0, 3.0, 2.5)

    local _, TempPos2, TempHeading, _ = GetNthClosestVehicleNodeWithHeading(MissionPos.x, MissionPos.y, MissionPos.z, 3, 0, 3.0, 2.5)

    local FirstPatrolEndBool, FirstPatrolEnd = GetRoadSidePointWithHeading(TempPos1.x, TempPos1.y, TempPos1.z, MissionHeading)

    local SecondPatrolEndBool, SecondPatrolEnd = GetRoadSidePointWithHeading(TempPos2.x, TempPos2.y, TempPos2.z, MissionHeading)

    if not (CrimSpawnBool and (FirstPatrolEndBool or SecondPatrolEndBool)) then
      TriggerServerEvent('pd5m:msssv:EndCallout')
    else
      local Mult = 1.2
      local off3x = (CrimPos.x - MissionPos.x) * Mult
      local off3y = (CrimPos.y - MissionPos.y) * Mult
      local off3z = (CrimPos.z - MissionPos.z) * Mult

      local off4x = (FirstPatrolEnd.x - TempPos1.x) * Mult
      local off4y = (FirstPatrolEnd.y - TempPos1.y) * Mult
      local off4z = (FirstPatrolEnd.z - TempPos1.z) * Mult

      local off5x = (SecondPatrolEnd.x - TempPos2.x) * Mult
      local off5y = (SecondPatrolEnd.y - TempPos2.y) * Mult
      local off5z = (SecondPatrolEnd.z - TempPos2.z) * Mult

      CrimPos = {x= MissionPos.x + off3x, y=MissionPos.y + off3y, z=MissionPos.z + off3z}

      FirstPatrolEnd = {x = TempPos1.x + off4x, y = TempPos1.y + off4y, z = TempPos1.z + off4z}

      SecondPatrolEnd = {x = TempPos2.x + off5x, y = TempPos2.y + off5y, z = TempPos2.z + off5z}

      local VehicleDroppoints = {
        {{{x=-77.11, y=-1101.22, z=26.17}, {x=-349.31, y=-2698.67, z=6.05}, {x=-1117.92, y=-1562.88, z=4.39}, {x=1038.95, y=-2341.2, z=30.47}, {x=328.87, y=33.88, z=88.22}}, loc='Los Santos'},
        {{{x=-256.89, y=6188.12, z=31.39}, {x=-715.94, y=5789.06, z=17.7}, {x=-158.42, y=6495.67, z=29.65}, {x=-457.16, y=6361.39, z=12.4}, {x=7.95, y=6736.63, z=21.63}}, loc='Paleto Bay'},
      }

      local HighwayTargets = {
        {{{x=-2195.47, y=-345.00, z=13.24}, {x=-3105.73, y=1187.47, z=20.34}, {x=-2719.94, y=2286.46, z=19.04}, {x=-594.42, y=5637.00, z=38.73}}, loc='Great Ocean Highway'},
        {{{x=640.59, y=6524.76, z=28.23}, {x=2623.04, y=5110.94, z=44.85}, {x=2791.42, y=4407.86, z=49.04}, {x=2409.65, y=2908.74, z=49.34}, {x=1114.71, y=406.69, z=91.53}, {x=659.99, y=-215.26, z=44.3}}, loc='Senora Freeway'},
      }

      local HighwayNamesList={
      	"Los Santos Freeway",
      	"Los Santos Fwy",
      	"Del Perro Fwy",
      	"Del Perro Freeway",
      	"Elysian Fields Fwy",
      	"Elysian Fields Freeway",
      	"Palomino Fwy",
      	"Palomino Freeway",
      	"Senora Fwy",
      	"Senora Freeway",
      	"Great Ocean Hwy",
      	"Great Ocean Highway",
      	"La Puerta Fwy",
      	"La Puerta Freeway",
      	"Olympic Fwy",
      	"Olympic Freeway",
      	"Route 68",
      }

      local VehicleDroppointIndex = 1
      local VehicleDroppointCoordIndex = 0
      local VehicleDroppointName = VehicleDroppoints[1].loc
      local distance = 0.0

      for i, Coords in ipairs(VehicleDroppoints[1][1]) do
        local tempdist = Vdist2(MissionPos.x, MissionPos.y, MissionPos.z, Coords.x, Coords.y, Coords.z)
        if tempdist > distance then
          distance = tempdist
        end
      end

      for i, Coords in ipairs(VehicleDroppoints[2][1]) do
        local tempdist = Vdist2(MissionPos.x, MissionPos.y, MissionPos.z, Coords.x, Coords.y, Coords.z)
        if tempdist > distance then
          VehicleDroppointIndex = 2
          VehicleDroppointName = VehicleDroppoints[2].loc
          break
        end
      end

      VehicleDroppointCoordIndex = math.random(#VehicleDroppoints[VehicleDroppointIndex][1])


      local HighwayIndex = 0
      local HighwayCoordIndex = 0
      local HighwayName = nil
      local distance1 = 9999999999.0
      local distance2 = 9999999999.0
      local index1 = 0
      local index2 = 0

      for i, Coords in ipairs(HighwayTargets[1][1]) do
        local tempdist = Vdist2(MissionPos.x, MissionPos.y, MissionPos.z, Coords.x, Coords.y, Coords.z)
        if tempdist < distance1 then
          index1 = i
          distance1 = tempdist
        end
      end

      for i, Coords in ipairs(HighwayTargets[2][1]) do
        local tempdist = Vdist2(MissionPos.x, MissionPos.y, MissionPos.z, Coords.x, Coords.y, Coords.z)
        if tempdist < distance2 then
          index2 = i
          distance2 = tempdist
        end
      end

      if distance2 < distance1 then
        HighwayIndex = 2
        HighwayCoordIndex = index2
      else
        HighwayIndex = 1
        HighwayCoordIndex = index1
      end

      HighwayName = HighwayTargets[HighwayIndex].loc



      local CriminalModelList = {
        {'a_m_m_eastsa_01', 'overweight male with dark skin color, short hair wearing a black muscle shirt and blue jeans' },
        {'g_m_y_azteca_01', 'male with light skin color, short hair wearing a light blue jacket and black jeans which are bleached on the front'},
        {'g_m_y_ballaeast_01', 'male with black skin color, short hair wearing a purple and white striped t-shirt and black trousers'},
        {'g_f_y_ballas_01', 'female with dark skin color, shoulder long blonde hair wearing a purple bandana, a white top and grey jeans'},
        {'u_f_y_bikerchic', 'female with light skin color, short black hair wearing a black bra and kneelong greenish trousers'},
        {'g_f_y_lost_01', 'female with dark face skin color and light body skin color, short hair wearing an open leather jacket, a red bra and light blue hotpants'},
        {'g_m_y_lost_01', 'male with dark skin color, short hair wearing a grey sleeveless shirt and grey baggy pants'},
        {'g_m_y_lost_02', 'male with light skin color, brown dreadlocks wearing a black vest, a white pullover and grey, dirty pants'},
        {'g_m_y_lost_03', 'male with light skin color, bald wearing a black vest, a grey muscleshirt and grey jeans'},
        {'g_m_y_mexgoon_03', 'male with light skin color, short hair wearing a white muscle shirt and grey jeans'},
      }
      local PedModelList = {'ig_bankman', 'a_f_m_bevhills_01', 'a_f_y_bevhills_01', 'a_m_m_bevhills_01', 'a_m_y_bevhills_01', 'a_f_m_bevhills_02', 'a_f_y_bevhills_02', 'a_m_m_bevhills_02', 'a_m_y_bevhills_02', 'a_f_y_bevhills_03', 'a_f_y_bevhills_04', 'a_f_y_business_01', 'a_m_m_business_01', 'a_m_y_business_01', 'a_f_m_business_02', 'a_f_y_business_02', 'a_m_y_business_02', 'a_f_y_business_03', 'a_m_y_business_03', 'a_f_y_business_04'}
      local VehicleModelList = {'blista', 'issi2', 'panto', 'exemplar', 'felon', 'felon2', 'f620', 'jackal', 'oracle', 'oracle2', 'sentinel', 'sentinel2', 'zion', 'zion2', 'coquette3', 'dominator', 'dominator3', 'gauntlet', 'baller', 'baller2', 'dubsta', 'gresley', 'habanero', 'patriot', 'rocoto', 'xls', 'asea', 'asterope', 'fugitive', 'intruder', 'premier', 'surge', 'tailgater', 'banshee', 'bestiagts', 'buffalo', 'carbonizzare', 'comet2', 'comet5', 'coquette', 'elegy2', 'feltzer2', 'flashgt', 'fusilade', 'kuruma', 'ninef', 'ninef2', 'pariah', 'schafter2', 'raiden', 'rapidgt', 'rapidgt2', 'penumbra', 'schwarzer', 'sultan', 'coquette2', 'mamba', 'monroe', 'bullet', 'pfister811', 't20', 'tempesta', 'vacca', 'voltic', 'zentorno', 'bison', 'burrito', 'rumpo', 'minivan'}

      local VehicleColorList = {
        {{0,1,11,147}, 'black'},
        {{2,3,9,10}, 'dark grey'},
        {{4,5,6,7,8}, 'light grey'},
        {{27,28,29,30,31,32,33,34,35,150}, 'red'},
        {{135,136,137}, 'pink'},
        {{36,38,138}, 'orange'},
        {{99}, 'gold'},
        {{90}, 'bronze'},
        {{88,89,91}, 'yellow'},
        {{49,50,51,52,53,92}, 'green'},
        {{54}, 'turquoise'},
        {{61,62,63,64,65,66,67,68,69,70,73,74}, 'blue'},
        {{94,95,96,97,98,99,100,101,102,103,104}, 'brown'},
        {{71,72,145}, 'purple'},
        {{8,107,111,112}, 'white'},
      }

      local criminalmodel = GetHashKey(CriminalModelList[math.random(#CriminalModelList)][1])

      RequestModel(criminalmodel)
      while not HasModelLoaded(criminalmodel) do
        RequestModel(criminalmodel)
        Wait(100)
      end

      local pedmodel = GetHashKey(PedModelList[math.random(#PedModelList)])

      RequestModel(pedmodel)
      while not HasModelLoaded(pedmodel) do
        RequestModel(pedmodel)
        Wait(100)
      end

      local vehiclemodel = GetHashKey(VehicleModelList[math.random(#VehicleModelList)])

      RequestModel(vehiclemodel)
      while not HasModelLoaded(vehiclemodel) do
        RequestModel(vehiclemodel)
        Wait(100)
      end

      Wait(10000)

      -- Spawnpoint init
      local playerped = GetPlayerPed(-1)
      local plpedcoords = GetEntityCoords(playerped)
      local vehspawncoords = plpedcoords
      local vehspawnnumber = 0

      local PlBottomZ = GetHeightmapBottomZForPosition(plpedcoords.x, plpedcoords.y)

      if plpedcoords.z - PlBottomZ > 150.0 then
        vehspawncoords = GetOffsetFromEntityInWorldCoords(playerped, 0.0, -50.0, 0.0)
      else
        vehspawncoords = {
          x = plpedcoords.x,
          y = plpedcoords.y,
          z = PlBottomZ - 10.0,
        }
      end

      -- Entity init

      -- Init Victim and vehicle
      local vehicle = CreateVehicle(vehiclemodel, vehspawncoords.x + (vehspawnnumber * 5.0), vehspawncoords.y + (vehspawnnumber * 5.0), vehspawncoords.z - (vehspawnnumber * 0.5), MissionVehHeading, true, true)
      vehspawnnumber = vehspawnnumber + 1
      NetworkRegisterEntityAsNetworked(vehicle)
      SetEntityAsMissionEntity(vehicle, true, true)
      local VehicleNetID = VehToNet(vehicle)
      SetNetworkIdExistsOnAllMachines(VehicleNetID, true)
      TriggerServerEvent('pd5m:msssv:RegisterCalloutEntity', VehicleNetID)

      local ped = CreatePed(26, pedmodel,  vehspawncoords.x + (vehspawnnumber * 5.0), vehspawncoords.y + (vehspawnnumber * 5.0), vehspawncoords.z - (vehspawnnumber * 0.5), MissionVehHeading, true, true)
      vehspawnnumber = vehspawnnumber + 1
      NetworkRegisterEntityAsNetworked(ped)
      SetEntityAsMissionEntity(ped, true, true)
      local PedNetID = PedToNet(ped)
      SetNetworkIdExistsOnAllMachines(PedNetID, true)
      TriggerServerEvent('pd5m:msssv:RegisterCalloutEntity', PedNetID)

      -- Init victim traits
      local TargetFlagListIndex, TargetVehFlagListIndex = SyncPedAndVeh(ped, vehicle)
      TriggerServerEvent('pd5m:syncsv:ChangePedEntry', PedNetID, 'flagfleeinstant', false)
      TriggerServerEvent('pd5m:syncsv:ChangePedEntry', PedNetID, 'flagfight', false)
      TriggerServerEvent('pd5m:syncsv:ChangePedEntry', PedNetID, 'savepedweapons', {})
      TriggerServerEvent('pd5m:syncsv:ChangePedEntry', PedNetID, 'flagillegalweapon', false)

      local VehicleNumberPlate = GetVehicleNumberPlateText(vehicle)

      local VehiclePrimaryColorIndex = math.random(#VehicleColorList)
      local VehiclePrimaryColorChooser = VehicleColorList[VehiclePrimaryColorIndex][1]
      local VehiclePrimaryColor = VehiclePrimaryColorChooser[math.random(#VehiclePrimaryColorChooser)]
      local VehicleSecondaryColor = 0
      local VehicleColorName = VehicleColorList[VehiclePrimaryColorIndex][2]

      SetVehicleColours(vehicle, VehiclePrimaryColor, VehicleSecondaryColor)

      local VictimHasWeapons = false
      local VictimWeaponsList = {}
      local VictimWeapRnd = math.random(1, 100)

      if VictimWeapRnd <= 20 then
        VictimHasWeapons = true
        for i=1, math.random(1,4), 1 do
          table.insert(VictimWeaponsList, WeaponList[math.random(#WeaponList)])
        end
        if not ClientPedConfigList[TargetFlagListIndex].flagweaponlicense then
          TriggerServerEvent('pd5m:syncsv:ChangePedEntry', PedNetID, 'flagillegalweapon', true)
        end
      end

      local VictimCraziness = math.random(1, 100)

      -- init criminal
      local _, crimspawncoords = GetSafeCoordForPed(plpedcoords.x + math.random(-50, 50), plpedcoords.y + math.random(-50, 50), plpedcoords.z, true, 0)
      local criminal = CreatePed(26, criminalmodel, crimspawncoords.x, crimspawncoords.y, crimspawncoords.z, MissionHeading-180.0, true, true)
      NetworkRegisterEntityAsNetworked(criminal)
      SetEntityAsMissionEntity(criminal, true, true)
      local CriminalNetID = PedToNet(criminal)
      TriggerServerEvent('pd5m:msssv:RegisterCalloutEntity', CriminalNetID)

      -- init criminal traits
      local CriminalFlagListIndex, _ = SyncPedAndVeh(criminal, 0)

      TriggerServerEvent('pd5m:syncsv:ChangePedEntry', CriminalNetID, 'flagfleeinstant', false)
      TriggerServerEvent('pd5m:syncsv:ChangePedEntry', CriminalNetID, 'flagfight', false)
      TriggerServerEvent('pd5m:syncsv:ChangePedEntry', CriminalNetID, 'savepedweapons', {})
      TriggerServerEvent('pd5m:syncsv:ChangePedEntry', CriminalNetID, 'flagillegalweapon', false)


      local CriminalHasWeapons = false
      local CrimWeaponsList = {}
      local CrimWeapRnd = math.random(1, 100)

      if CrimWeapRnd <= 80 then
        CriminalHasWeapons = true
        if CrimWeapRnd <= 50 then
          for i=1, math.random(1,4),1 do
            table.insert(CrimWeaponsList, WeaponList[math.random(#WeaponList)])
          end
          if not ClientPedConfigList[CriminalFlagListIndex].flagweaponlicense then
            TriggerServerEvent('pd5m:syncsv:ChangePedEntry', CriminalNetID, 'flagillegalweapon', true)
          end
          TriggerServerEvent('pd5m:syncsv:ChangePedEntry', CriminalNetID, 'savepedweapons', CrimWeaponsList)
        else
          for i=1, math.random(1,4), 1 do
            table.insert(CrimWeaponsList, IllegalWeaponList[math.random(#WeaponList)])
          end
          TriggerServerEvent('pd5m:syncsv:ChangePedEntry', CriminalNetID, 'flagillegalweapon', true)
          TriggerServerEvent('pd5m:syncsv:ChangePedEntry', CriminalNetID, 'savepedweapons', CrimWeaponsList)
        end
      end

      if CriminalHasWeapons then
        for i, Weapon in ipairs(CrimWeaponsList) do
          GiveWeaponToPed(criminal, Weapon, 300, false, false)
        end
        SetPedCanSwitchWeapon(criminal, true)
      end

      if math.random(1, 100) <= 95 then
        TriggerServerEvent('pd5m:syncsv:ChangePedEntry', CriminalNetID, 'flagfleeinstant', true)
      end

      local CriminalCraziness = math.random(1, 100)

      if CriminalCraziness <= 80 then
        TriggerServerEvent('pd5m:syncsv:ChangePedEntry', CriminalNetID, 'flagfight', true)
      end


      -- create mission outcome
      local CrimActionIndex = 0 -- 0: Nothing; 1: threaten out; 2: pull out; 3: threaten on street; 4: shoot out
      local VictimReactionIndex = 0 --0: Comply; 1: Drive Past; 2: Threaten; 3: Drive Over; 4: Shoot; 5: Flee;
      local CrimReactionIndex = 0 -- 0: Flee; 1: Fight

      if CriminalHasWeapons and CriminalCraziness >= 90 then
        CrimActionIndex = 4
      elseif CriminalHasWeapons and CriminalCraziness >= 60 then
        CrimActionIndex = 3
      elseif not CriminalHasWeapons and CriminalCraziness >= 5 then
        CrimActionIndex = 2
      elseif CriminalHasWeapons then
        CrimActionIndex = 1
      end

      if VictimHasWeapons and VictimCraziness >= 90 then
        VictimReactionIndex = 4
      elseif VictimHasWeapons and VictimCraziness >= 60 then
        VictimReactionIndex = 2
      elseif not VictimHasWeapons and VictimCraziness >= 90 and (CrimActionIndex == 2 or CrimActionIndex == 3) then
        VictimReactionIndex = 3
      elseif not VictimHasWeapons and VictimCraziness >= 60 and (CrimActionIndex == 2 or CrimActionIndex == 3) then
        VictimReactionIndex = 1
      elseif CrimActionIndex == 4 then
        VictimReactionIndex = 5
      end

      if (CriminalCraziness >= 60 and CriminalHasWeapons) or CriminalCraziness >= 90 then
        CrimReactionIndex = 1
      end


      -- init victim to move
      SetPedIntoVehicle(ped, vehicle, -1)
      SetBlockingOfNonTemporaryEvents(ped, true)

      TaskVehicleDriveWander(ped, vehicle, 17.0, NormalDrivingBehavior)

      -- init criminal to move
      SetBlockingOfNonTemporaryEvents(criminal, true)

      TaskWanderStandard(criminal, 10.0, 10)

      Wait(100)

      -- start callout
      local CheckCalloutResult = true
      local VictimDied = false
      local CriminalDied = false
      local VictimComplied = false
      local CriminalInTargetCar = false
      local CriminalFleeing = false
      local VictimFleeing = false
      local CriminalSuccessful = false

      SetEntityCoords(ped, MissionVehSpawn.x, MissionVehSpawn.y, MissionVehSpawn.z, 1, 0, 0, 1)
      SetEntityCoords(vehicle, MissionVehSpawn.x, MissionVehSpawn.y, MissionVehSpawn.z, 1, 0, 0, 0)
      ClearPedTasksImmediately(ped)
      SetPedIntoVehicle(ped, vehicle, -1)

      TaskVehicleDriveToCoord(ped, vehicle, MissionPos.x, MissionPos.y, MissionPos.z, 17.0, 1.0, NormalDrivingBehavior, 2.0, true)

      SetEntityCoords(criminal, CrimPos.x, CrimPos.y, CrimPos.z)

      ClearPedTasksImmediately(criminal)

      local VehicleBlip = AddBlipForEntity(vehicle)
      local PedBlip = AddBlipForEntity(ped)
      local CriminalBlip = AddBlipForEntity(criminal)

      local DistanceFirst = CalculateTravelDistanceBetweenPoints(CrimPos.x, CrimPos.y, CrimPos.z, FirstPatrolEnd.x, FirstPatrolEnd.y, FirstPatrolEnd.z)
      local DistanceSecond = CalculateTravelDistanceBetweenPoints(CrimPos.x, CrimPos.y, CrimPos.z, SecondPatrolEnd.x, SecondPatrolEnd.y, SecondPatrolEnd.z)
      local MaxDistance = 35.0
      local CriminalWalk = true

      CreateThread(function()
        while CriminalWalk do
          if DistanceFirst < MaxDistance and CriminalWalk then
            TaskGoStraightToCoord(criminal, FirstPatrolEnd.x, FirstPatrolEnd.y, FirstPatrolEnd.z, 1.0, -1, MissionHeading-180.0, 2.0)
            local distance = 999999.0
            while CriminalWalk and distance > 4.0 do
              local CrimCoords = GetEntityCoords(criminal)
              distance = Vdist2(FirstPatrolEnd.x, FirstPatrolEnd.y, FirstPatrolEnd.z, CrimCoords.x, CrimCoords.y, CrimCoords.z)
              Wait(200)
            end
            if CriminalWalk then
              TaskGoStraightToCoord(criminal, CrimPos.x, CrimPos.y, CrimPos.z, 1.0, -1, MissionHeading, 2.0)
              distance = 999999.0
              while CriminalWalk and distance > 4.0 do
                local CrimCoords = GetEntityCoords(criminal)
                distance = Vdist2(CrimPos.x, CrimPos.y, CrimPos.z, CrimCoords.x, CrimCoords.y, CrimCoords.z)
                Wait(200)
              end
            end
          end

          if DistanceSecond < MaxDistance and CriminalWalk then
            TaskGoStraightToCoord(criminal, SecondPatrolEnd.x, SecondPatrolEnd.y, SecondPatrolEnd.z, 1.0, -1, MissionHeading, 2.0)
            local distance = 999999.0
            while CriminalWalk and distance > 4.0 do
              local CrimCoords = GetEntityCoords(criminal)
              distance = Vdist2(SecondPatrolEnd.x, SecondPatrolEnd.y, SecondPatrolEnd.z, CrimCoords.x, CrimCoords.y, CrimCoords.z)
              Wait(200)
            end
            if CriminalWalk then
              TaskGoStraightToCoord(criminal, CrimPos.x, CrimPos.y, CrimPos.z, 1.0, -1, MissionHeading-180.0, 2.0)
              distance = 999999.0
              while CriminalWalk and distance > 4.0 do
                local CrimCoords = GetEntityCoords(criminal)
                distance = Vdist2(CrimPos.x, CrimPos.y, CrimPos.z, CrimCoords.x, CrimCoords.y, CrimCoords.z)
                Wait(200)
              end
            end
          end

          Wait(40)
        end
      end)


      local distance = 999999.0
      while distance > 60.0 do
        local vehiclecoords = GetEntityCoords(vehicle)
        distance = CalculateTravelDistanceBetweenPoints(vehiclecoords.x, vehiclecoords.y, vehiclecoords.z, MissionPos.x, MissionPos.y, MissionPos.z)
        Wait(500)
      end

      local CriminalWalk = false

      if CrimActionIndex == 2 or CrimActionIndex == 3 then
        TaskGoStraightToCoord(criminal, MissionPos.x, MissionPos.y, MissionPos.z, 2.0, -1, MissionHeading - 180.0, 2.0)
      else
        TaskGoStraightToCoord(criminal, CrimPos.x, CrimPos.y, CrimPos.z, 2.0, -1, MissionHeading-180.0, 2.0)
      end

      while distance > 30.0 do
        local vehiclecoords = GetEntityCoords(vehicle)
        distance = CalculateTravelDistanceBetweenPoints(vehiclecoords.x, vehiclecoords.y, vehiclecoords.z, MissionPos.x, MissionPos.y, MissionPos.z)
        Wait(500)
      end

      TaskVehicleDriveWander(ped, vehicle, 14.0, NormalDrivingBehavior)

      CreateThread(function()
        while CheckCalloutResult do
          if IsPedDeadOrDying(ped, 1) then
            VictimDied = true
          end

          if IsPedDeadOrDying(criminal, 1) then
            CriminalDied = true
          end

          if IsPedInVehicle(criminal, vehicle, true) then
            CriminalInTargetCar = true
          end

          local crimcoords = GetEntityCoords(criminal)
          if Vdist2(MissionPos.x, MissionPos.y, MissionPos.z, crimcoords.x, crimcoords.y, crimcoords.z) > 5000.0 then
            CriminalFleeing = true
          end

          local viccoords = GetEntityCoords(ped)
          if Vdist2(MissionPos.x, MissionPos.y, MissionPos.z, viccoords.x, viccoords.y, viccoords.z) > 5000.0 then
            VictimFleeing = true
          end

          Wait(500)
        end
      end)

      if CrimActionIndex == 1 or CrimActionIndex == 3 then
        SetCurrentPedWeapon(criminal, CrimWeaponsList[math.random(#CrimWeaponsList)], true)
        ClearPedTasks(criminal)
        TaskAimGunAtEntity(criminal, ped, -1, 0)
      elseif CrimActionIndex == 2 then
        ClearPedTasks(criminal)
      elseif CrimActionIndex == 4 then
        SetCurrentPedWeapon(criminal, CrimWeaponsList[math.random(#CrimWeaponsList)], true)
        ClearPedTasks(criminal)
        TaskAimGunAtEntity(criminal, ped, -1, 0)

        TaskCombatPed(criminal, ped, 0, 16)
      end

      Wait(1300)

      if VictimReactionIndex == 0 then
        VictimComplied = true
        TaskLeaveVehicle(ped, vehicle, 0)
        TaskGoStraightToCoord(ped, CrimPos.x, CrimPos.y, CrimPos.z, 1.0, 10000, MissionHeading, 2.0)
        Wait(1500)
        ClearPedTasks(criminal)
        TaskEnterVehicle(criminal, vehicle, 10000, -1, 2.0, 1, 0)
        local n = 0
        local distance = 9999999.0
        while distance > 3.0 and n < 50 do
          n = n + 1
          Wait(500)
        end
        if n >= 49 then
          SetEntityCoords(ped, CrimPos.x, CrimPos.y, CrimPos.z, 1, 0, 0, 0)
        end
        if not IsPedInVehicle(criminal, vehicle, true) then
          SetPedIntoVehicle(criminal, vehicle, -1)
        end
      elseif VictimReactionIndex == 1 then
        TaskVehicleDriveWander(ped, vehicle, 17.0, 786601)
        Wait(2000)
        TaskVehicleDriveWander(ped, vehicle, 17.0, NormalDrivingBehavior)
        if CrimReactionIndex == 1 then
          TaskAimGunAtEntity(criminal, ped, 4000, 0)
          TaskCombatPed(criminal, ped, 0, 16)
        else
          TaskSmartFleePed(criminal, ped, 10000, -1, true, true)
        end
      elseif VictimReactionIndex == 2 then
        TaskLeaveVehicle(ped, vehicle, 0)
        SetCurrentPedWeapon(ped, VictimWeaponsList[math.random(#VictimWeaponsList)], true)
        TaskAimGunAtEntity(ped, criminal, 4000, 0)
        if CrimReactionIndex == 1 then
          TaskAimGunAtEntity(criminal, ped, 4000, 0)
          TaskCombatPed(criminal, ped, 0, 16)
          TaskCombatPed(ped, criminal, 0, 16)
        else
          TaskSmartFleePed(criminal, ped, 10000, -1, true, true)
        end
      elseif VictimReactionIndex == 3 then
        local crimcoords = GetEntityCoords(criminal)
        TaskVehicleGotoNavmesh(ped, vehicle, crimcoords.x, crimcoords.y, crimcoords.z, 17.0, 0, 1.0)
        Wait(1000)
        TaskVehicleDriveWander(ped, vehicle, 17.0, NormalDrivingBehavior)
        if CrimReactionIndex == 1 then
          TaskAimGunAtEntity(criminal, ped, 4000, 0)
          TaskCombatPed(criminal, ped, 0, 16)
        else
          TaskSmartFleePed(criminal, ped, 10000, -1, true, true)
        end
      elseif VictimReactionIndex == 4 then
        TaskLeaveVehicle(ped, vehicle, 0)
        SetCurrentPedWeapon(ped, VictimWeaponsList[math.random(#VictimWeaponsList)], true)
        TaskAimGunAtEntity(ped, criminal, 4000, 0)
        TaskCombatPed(ped, criminal, 0, 16)
        if CrimReactionIndex == 1 then
          TaskAimGunAtEntity(criminal, ped, 4000, 0)
          TaskCombatPed(criminal, ped, 0, 16)
        else
          TaskSmartFleePed(criminal, ped, 10000, -1, true, true)
        end
      elseif VictimReactionIndex == 5 then
        TaskLeaveVehicle(ped, vehicle, 0)
        SetPedFleeAttributes(ped, 2, false)
        TaskReactAndFleePed(ped, criminal)
      end

      local TimeInteger = 0
      while not (VictimDied or CriminalDied or VictimComplied or CriminalInTargetCar or CriminalFleeing or VictimFleeing) and TimeInteger < 30 do
        TimeInteger = TimeInteger + 1
        Wait(500)
      end

      CheckCalloutResult = false

      if TimeInteger >= 29 then

      else
        if VictimDied or VictimComplied or CriminalInTargetCar then
          if CriminalDied then
            if VictimDied then

            else

            end
          elseif CriminalFleeing then
            TaskSmartFleeCoord(criminal, MissionPos.x, MissionPos.y, MissionPos.z, 10000.0, 900, true, true)
            if VictimDied then

            else

            end
          else
            if not CriminalInTargetCar then
              ClearPedTasks(criminal)
              TaskEnterVehicle(criminal, vehicle, 10000, -1, 2.0, 1, 0)
              local timeoutint = 0
              while not IsPedInVehicle(criminal, vehicle, true) and timeoutint < 10 do
                timeoutint = timeoutint + 1
                Wait(1000)
              end
              if timeoutint >= 9 then
                SetPedIntoVehicle(criminal, vehicle, -1)
              end
            end
            CriminalSuccessful = true
            if VictimDied then

            else

            end
          end

        elseif CriminalDied then
          if VictimDied then

          else

          end
        elseif CriminalFleeing or VictimFleeing then
          TaskVehicleDriveWander(ped, vehicle, 17.0, NormalDrivingBehavior)
          TaskSmartFleeCoord(criminal, MissionPos.x, MissionPos.y, MissionPos.z, 10000.0, 900, true, true)
        end
      end
      if CriminalSuccessful then

      elseif CriminalFleeing then

      elseif CriminalDied then

      end

    end
    TriggerServerEvent('pd5m:msssv:EndCallout')
  end,
}

AddEventHandler('pd5m:mss:cll:GrandTheftAuto1:Silverman', function()

end)
