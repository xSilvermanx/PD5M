CreateThread(function()
	local playerRelGroup = GetPedRelationshipGroupHash(playerped)
	while true do
		for Ped in EnumeratePeds() do
			if GetRelationshipBetweenPeds(playerped, Ped) == 255 then
				local PedRelGroup = GetPedRelationshipGroupHash(Ped)
				SetRelationshipBetweenGroups(0, PedRelGroup, playerRelGroup)
			end
		end
		Wait(1000)
	end
end)
