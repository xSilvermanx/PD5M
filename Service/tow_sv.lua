-- remember to have services flag cars / peds / dead bodies as NoLongerNeeded
-- optional you can have the service remove the entities directly

-- Serverside event to abort the towtruck on every client at the same time.
-- Necessary because a car getting towed is synced to every client in order to prevent multiple towtrucks being dispatched.
-- Also means that every player can abort a towtruck being dispatched.
-- Advise: Do not use this since it's already set for player control.
RegisterNetEvent('pd5m:towsv:aborttowtruck')
AddEventHandler('pd5m:towsv:aborttowtruck', function(TargetVehNetID)
	TriggerClientEvent('pd5m:tow:aborttowtruck', -1, TargetVehNetID)
end)

RegisterNetEvent('pd5m:towsv:flatbedpickup')
AddEventHandler('pd5m:towsv:flatbedpickup', function(TargetVehNetID, TowNetID)
	TriggerClientEvent('pd5m:tow:flatbedpickup', -1, TargetVehNetID, TowNetID)
end)
