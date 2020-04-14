RegisterNetEvent('pd5m:cleanupsv:SetEntityAsNoLongerNeeded')
AddEventHandler('pd5m:cleanupsv:SetEntityAsNoLongerNeeded', function(EntityNetID)
  TriggerClientEvent('pd5m:cleanup:SetEntityAsNoLongerNeeded', -1, EntityNetID)
end)

RegisterNetEvent('pd5m:cleanupsv:SetEntityWander')
AddEventHandler('pd5m:cleanupsv:SetEntityWander', function(TargetNetID)
  if GetEntityType(NetworkGetEntityFromNetworkId(TargetNetID)) == 1 then
    TriggerClientEvent('pd5m:cleanup:SetEntityWander', -1, TargetNetID)
  end
end)
