-- for-loop that initializes every permanent blip
if ActivateBlipsOnMap then
	for _, Blip in pairs(list_blips) do
		local addedblip = AddBlipForCoord(Blip.x, Blip.y, Blip.z)

		SetBlipSprite(addedblip, Blip.sprite)
		SetBlipColour(addedblip, Blip.colour)
		SetBlipAlpha(addedblip, Blip.alpha)
		SetBlipScale(addedblip, 1.0)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Blip.name)
		EndTextCommandSetBlipName(addedblip)

		SetBlipAsShortRange(addedblip, true)
		SetBlipCategory(addedblip, 1)
		SetBlipDisplay(addedblip, 2)
		SetBlipShrink(addedblip, false)
	end
end
