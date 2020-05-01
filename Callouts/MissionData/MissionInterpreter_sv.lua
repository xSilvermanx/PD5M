AmbientEventTotalWeight = 0

AmbientEventWeightList = {}

for i, AmbientEvent in ipairs(ListOfAmbientEvents) do
  table.insert(AmbientEventWeightList, AmbientEvent.Weight+AmbientEventTotalWeight)
  AmbientEventTotalWeight = AmbientEventTotalWeight + AmbientEvent.Weight
end
