Mss_Amb_RedLightOffense_Silverman = {
  Weight = 100,
  Main = function()

    local playerped = GetPlayerPed(-1)
    local pcoords = GetEntityCoords(playerped)

    local rndx = math.random(-100, 100)
    local rndy = math.random(-100, 100)
    local rndz = math.random(-2, 2)

    local targetveh = GetClosestVehicle(pcoords.x+rndx, pcoords.y+rndy, pcoords.z+rndz, 50.0, 0, 70)

    while IsVehicleSeatFree(targetveh, -1) or IsPedAPlayer(GetPedInVehicleSeat(targetveh, -1)) or not DoesEntityExist(targetveh) do
      Wait(1000)
      local rndx = math.random(-100, 100)
      local rndy = math.random(-100, 100)
      local rndz = math.random(-2, 2)

      targetveh = GetClosestVehicle(pcoords.x+rndx, pcoords.y+rndy, pcoords.z+rndz, 50.0, 0, 70)
    end

    SetEntityAsMissionEntity(targetveh, true, true)
    local TargetVehNetID = VehToNet(targetveh)
    TriggerServerEvent('pd5m:syncsv:SetEntityAsMissionEntity', TargetVehNetID)

    local target = GetPedInVehicleSeat(targetveh, -1)
    SetEntityAsMissionEntity(target, true, true)
    local TargetNetID = PedToNet(target)
    TriggerServerEvent('pd5m:syncsv:SetEntityAsMissionEntity', TargetNetID)

    local TargetFlagListIndex, TargetVehFlagListIndex = SyncPedAndVeh(target, targetveh)

    TriggerServerEvent('pd5m:msssv:AddAmbientEventTimer', TargetVehNetID)
    TriggerServerEvent('pd5m:msssv:AddAmbientEventTimer', TargetNetID)
    TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'flagismissionped', true)

    local OffenseList = {
      {
        Chance = 85.0,
        Bool = {7,9,18,19,22},
        Flags = {flagfleeinstant = 1.0},
        Activate = false,
      },
      {
        Chance = 60.0,
        Bool = {2,3,5,7,9,18,19,22},
        Flags = {flagfleeinstant = 10.0},
        Activate = false,
      },
      {
        Chance = 75.0,
        Bool = {9,19},
        Flags = {
          flagfight = 40.0,
          flagfleeinstant = 30.0,
        },
        Activate = true,
      },
      {
        Chance = 35.0,
        Bool = {0,1,2,3,4,5,7,9,18,19,22},
        Flags = {
          flagfleeinstant = 75.0,
          flagfight = 50.0,
          flagdrunk = 40.0,
          flagdrug = 20.0,
        },
        Activate = false,
      },
    }

    local DrivingStyle = NormalDrivingBehavior
    local Speed = 17.0

    for i, Offense in ipairs(OffenseList) do
      if math.random(1, 100) <= Offense.Chance then
        local BoolChange = false
        for j, bool in ipairs(Offense.Bool) do
          local Flag = GetNthBinaryFlag(DrivingStyle, bool)
          if Offense.Activate and Flag == '0' then
            DrivingStyle = DrivingStyle + bool
          elseif not Offense.Activate and Flag == '1' then
            DrivingStyle = DrivingStyle - bool
          end
        end
        for flag, chance in pairs(Offense.Flags) do
          if math.random(1, 100) <= chance then
            if flag == 'flagdrunk' then
          		local savedrunklevel = math.random(20, 400)/100
              TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, flag, true)
              TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'savedrunklevel', savedrunklevel)
            elseif flag == 'flagdrug' then
              local savedrug = DrugList[math.random(1, #DrugList)]
          		local savedruglevel = math.random(10, 200)
              TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, flag, true)
              TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'savedrug', savedrug)
              TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, 'savedruglevel', savedruglevel)
            else
              TriggerServerEvent('pd5m:syncsv:ChangePedEntry', TargetNetID, flag, true)
            end
          end
        end
      end
    end

    local SpeedInfringement = math.random(1, 100)
    if SpeedInfringement <= 23 then
      Speed = 4.0
    elseif SpeedInfringement >= 60 then
      Speed = 120.0
    end

    TaskVehicleDriveWander(target, targetveh, Speed, DrivingStyle)

  end,
}
