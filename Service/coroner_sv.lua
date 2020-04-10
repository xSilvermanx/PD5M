-- remember to have services flag cars / peds / dead bodies as NoLongerNeeded
-- optional you can have the service remove the entities directly

RegisterNetEvent('pd5m:syncsv:deleteEntity')
AddEventHandler('pd5m:syncsv:deleteEntity', function(target)
  TriggerClientEvent('pd5m:sync:deleteEntity', -1, target)
end)
