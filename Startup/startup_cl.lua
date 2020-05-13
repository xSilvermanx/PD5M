local player = PlayerId()

SetIgnoreLowPriorityShockingEvents(player, true)
SetPoliceIgnorePlayer(player, true)
SetPlayerCanBeHassledByGangs(player, false)

EnableDispatchService(1, false)
EnableDispatchService(2, false)
EnableDispatchService(3, true) --FireDepartment
EnableDispatchService(4, false)
EnableDispatchService(5, false) --AmbulanceDepartment
EnableDispatchService(6, false)
EnableDispatchService(7, false)
EnableDispatchService(8, false)
EnableDispatchService(9, false) --PulledOverPD
EnableDispatchService(10, false) --CruisingPD
EnableDispatchService(11, true) --Gangs
EnableDispatchService(12, false)
EnableDispatchService(13, false)
EnableDispatchService(14, false)
EnableDispatchService(15, true) --BikerBackup

TriggerServerEvent('pd5m:syncsv:SyncFlagLists')

CreateThread(function()
  while true do
    if WarMenu.IsAnyMenuOpened() then
      DisableControlAction(0, 19, true)
      DisableControlAction(1, 19, true)
      DisableControlAction(0, 48, true)
      DisableControlAction(1, 48, true)
      DisableControlAction(0, 73, true)
      DisableControlAction(1, 73, true)
      SetBigmapActive(false, false)
    end
    Wait(0)
  end
end)

TriggerServerEvent('pd5m:msssv:InitMssTables')

ClothingCurrentDrawables = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
ClothingCurrentTextures = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}

AddEventHandler('playerSpawned', function(spawn)
  Wait(3000)
  local playerped = GetPlayerPed(-1)
  SetPedPropIndex(playerped, 0, ClothingCurrentDrawables[1], ClothingCurrentTextures[1], true)
  SetPedPropIndex(playerped, 1, ClothingCurrentDrawables[2], ClothingCurrentTextures[2], true)
  SetPedPropIndex(playerped, 2, ClothingCurrentDrawables[3], ClothingCurrentTextures[3], true)
  SetPedPropIndex(playerped, 6, ClothingCurrentDrawables[4], ClothingCurrentTextures[4], true)
  SetPedPropIndex(playerped, 7, ClothingCurrentDrawables[5], ClothingCurrentTextures[5], true)
  SetPedComponentVariation(playerped, 1, ClothingCurrentDrawables[6], ClothingCurrentTextures[6], 0)
  SetPedComponentVariation(playerped, 3, ClothingCurrentDrawables[7], ClothingCurrentTextures[7], 0)
  SetPedComponentVariation(playerped, 4, ClothingCurrentDrawables[8], ClothingCurrentTextures[8], 0)
  SetPedComponentVariation(playerped, 5, ClothingCurrentDrawables[9], ClothingCurrentTextures[9], 0)
  SetPedComponentVariation(playerped, 6, ClothingCurrentDrawables[10], ClothingCurrentTextures[10], 0)
  SetPedComponentVariation(playerped, 7, ClothingCurrentDrawables[11], ClothingCurrentTextures[11], 0)
  SetPedComponentVariation(playerped, 8, ClothingCurrentDrawables[12], ClothingCurrentTextures[12], 0)
  SetPedComponentVariation(playerped, 9, ClothingCurrentDrawables[13], ClothingCurrentTextures[13], 0)
  SetPedComponentVariation(playerped, 10, ClothingCurrentDrawables[14], ClothingCurrentTextures[14], 0)
  SetPedComponentVariation(playerped, 11, ClothingCurrentDrawables[15], ClothingCurrentTextures[15], 0)
end)
