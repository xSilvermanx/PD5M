Mss_Amb_NonRoadWorthyVehicle_Silverman = {
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

    local IssueList = {
      {
        Chance = 65.0,
        Result = function()
          local VehModel = GetEntityModel(targetveh)
          local MinVec, MaxVec = GetModelDimensions(VehModel)
          local Size = MaxVec - MinVec

          if math.random(1,100) <= 30 then
            SetVehicleDamage(targetveh, Size.x * 0.9, Size.y, 0.0, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.9, Size.y, -0.2, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.9, Size.y, -0.1, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.8, Size.y, 0.0, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.8, Size.y, -0.2, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.8, Size.y, -0.1, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.7, Size.y, 0.0, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.7, Size.y, -0.2, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.7, Size.y, -0.1, 7000.0, 1.2, true)
            Wait(20)
          end

          if math.random(1,100) <= 30 then
            SetVehicleDamage(targetveh, Size.x * 0.1, Size.y, -0.1, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.1, Size.y, -0.2, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.1, Size.y, 0.0, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, 0, Size.y, -0.1, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, 0, Size.y, -0.2, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, 0, Size.y, 0.0, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.1, Size.y, -0.2, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.1, Size.y, -0.1, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.1, Size.y, 0.0, 7000.0, 1.2, true)
            Wait(20)
          end

          if math.random(1,100) <= 30 then
            SetVehicleDamage(targetveh, -Size.x * 0.9, Size.y, -0.2, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.9, Size.y, -0.1, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.9, Size.y, 0.0, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.8, Size.y, -0.2, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.8, Size.y, -0.1, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.8, Size.y, 0.0, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.7, Size.y, -0.2, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.7, Size.y, -0.1, 7000.0, 1.2, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.7, Size.y, 0.0, 7000.0, 1.2, true)
            Wait(20)
          end

          if math.random(1,100) <= 30 then
            SetVehicleDamage(targetveh, Size.x * 0.9, 0.0, -0.3, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.9, 0.0, -0.4, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.9, 0.0, -0.5, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x, 0.25*Size.y, -0.3, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x, 0.25*Size.y, -0.4, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x, 0.25*Size.y, -0.5, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.9, -0.2*Size.y, -0.3, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.9, -0.2*Size.y, -0.4, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.9, -0.2*Size.y, -0.5, 3000.0, 2.5, true)
            Wait(20)
          end

          if math.random(1,100) <= 30 then
            SetVehicleDamage(targetveh, -Size.x * 0.9, 0.0, -0.3, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.9, 0.0, -0.4, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.9, 0.0, -0.5, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x, 0.25*Size.y, -0.3, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x, 0.25*Size.y, -0.4, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x, 0.25*Size.y, -0.5, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.9, -0.2*Size.y, -0.3, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.9, -0.2*Size.y, -0.4, 3000.0, 2.5, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.9, -0.2*Size.y, -0.5, 3000.0, 2.5, true)
            Wait(20)
          end

          if math.random(1,100) <= 30 then
            SetVehicleDamage(targetveh, Size.x * 0.9, -Size.y, 0.0, 5500.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.9, -Size.y, 0.1, 5500.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.9, -Size.y, 0.2, 5500.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.8, -Size.y, 0.0, 5500.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.8, -Size.y, 0.1, 5500.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.8, -Size.y, 0.2, 5500.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.7, -Size.y, 0.0, 5500.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.7, -Size.y, 0.1, 5500.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.7, -Size.y, 0.2, 5500.0, 0.8, true)
            Wait(20)
          end

          if math.random(1,100) <= 30 then
            SetVehicleDamage(targetveh, Size.x * 0.1, -Size.y, 0.0, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.1, -Size.y, 0.1, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.1, -Size.y, 0.2, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.0, -Size.y, 0.0, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.0, -Size.y, 0.1, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, Size.x * 0.0, -Size.y, 0.2, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.1, -Size.y, 0.0, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.1, -Size.y, 0.1, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.1, -Size.y, 0.2, 7000.0, 0.8, true)
            Wait(20)
          end
          if math.random(1,100) <= 30 then
            SetVehicleDamage(targetveh, -Size.x * 0.9, -Size.y, 0.0, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.9, -Size.y, 0.1, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.9, -Size.y, 0.2, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.8, -Size.y, 0.0, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.8, -Size.y, 0.1, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.8, -Size.y, 0.2, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.7, -Size.y, 0.0, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.7, -Size.y, 0.1, 7000.0, 0.8, true)
            Wait(20)
            SetVehicleDamage(targetveh, -Size.x * 0.7, -Size.y, 0.2, 7000.0, 0.8, true)
            Wait(20)
          end
        end
      },
      {
        Chance = 10.0,
        Result = function()
          SetVehicleAlarmTimeLeft(targetveh, 900000)
          SetVehicleAlarm(targetveh, true)
          StartVehicleAlarm(targetveh)
        end
      },
      {
        Chance = 10.0,
        Result = function()
          StartVehicleHorn(targetveh, 900000, "HELDDOWN", false)
        end
      },
      {
        Chance = 65.0,
        Result = function()
          local DoorIndices = {0, 1, 2, 3, 4, 5, 6, 7}
          for i, Index in ipairs(DoorIndices) do
            local rnd = math.random(1, 100)
            if rnd <= 5 then
              SetVehicleDoorBroken(targetveh, Index, false)
            elseif rnd <= 30 then
              SetVehicleDoorDestroyType(targetveh, Index, 1)
              SetVehicleDoorOpen(targetveh, Index, true, false)
            end
          end
        end
      },
      {
        Chance = 65.0,
        Result = function()
          local TyreIndices = {0, 1, 2, 3, 4, 5, 45, 47}
          for i, Index in ipairs(TyreIndices) do
            local rnd = math.random(1, 100)
            if rnd <= 25 then
              SetVehicleTyreBurst(targetveh, Index, true, 500.0)
            elseif rnd <= 50 then
              SetVehicleTyreBurst(targetveh, Index, false, 100.0)
            end
          end
        end
      },
      {
        Chance = 10.0,
        Result = function()
          SetVehicleDirtLevel(targetveh, math.random(8, 15)-0.1)
        end
      },
      {
        Chance = 65.0,
        Result = function()
          if math.random(1, 2) == 2 then
            SetVehicleIndicatorLights(targetveh, 0, true)
          end
          if math.random(1, 2) == 2 then
            SetVehicleIndicatorLights(targetveh, 1, true)
          end
        end
      },
      {
        Chance = 65.0,
        Result = function()
          SetVehicleLights(targetveh, 1)
        end
      },
      {
        Chance = 10.0,
        Result = function()
          SetVehicleReduceGrip(targetveh, true)
        end
      },
      {
        Chance = 10.0,
        Result = function()
          for i=0,13,1 do
            if math.random(1,100) <= 30 then
              SmashVehicleWindow(targetveh, i)
            end
          end
        end
      }
    }

    SetVehicleWheelsCanBreak(targetveh, true)

    for i, Issue in ipairs(IssueList) do
      if math.random(1, 100) <= Issue.Chance then
        Issue:Result()
      end
    end
  end,
}
