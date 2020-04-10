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
