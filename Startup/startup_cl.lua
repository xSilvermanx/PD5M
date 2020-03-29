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
EnableDispatchService(9, true) --PulledOverPD
EnableDispatchService(10, true) --CruisingPD
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
