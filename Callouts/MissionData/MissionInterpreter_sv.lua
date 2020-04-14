AmbientEventTotalWeight = 0
CalloutTotalWeight = 0

AmbientEventWeightList = {}
CalloutWeightList = {}

for i, AmbientEvent in ipairs(ListOfAmbientEvents) do
  table.insert(AmbientEventWeightList, AmbientEvent.Weight+AmbientEventTotalWeight)
  AmbientEventTotalWeight = AmbientEventTotalWeight + AmbientEvent.Weight
end

for i, Callout in ipairs(ListOfCallouts) do
  local ClassWeight = CalloutClasses[Callout.Class].Weight
  table.insert(CalloutWeightList, Callout.Weight*ClassWeight+CalloutTotalWeight)
  CalloutTotalWeight = CalloutTotalWeight + ClassWeight*Callout.Weight
end

-- Mission specific server events

RegisterNetEvent('pd5m:msssv:api:TriggerDispatchCall')
AddEventHandler('pd5m:msssv:api:TriggerDispatchCall', function(string, MissionPos)
  local CalloutNumber = source
  TriggerClientEvent('pd5m:mss:api:TriggerDispatchCall', -1, CalloutNumber, string, MissionPos)
end)

RegisterNetEvent('pd5m:msssv:api:DispatchUpdate')
AddEventHandler('pd5m:msssv:api:DispatchUpdate', function(string)
  local CalloutNumber = source
  TriggerClientEvent('pd5m:mss:api:DispatchUpdate', -1, CalloutNumber, string)
end)
