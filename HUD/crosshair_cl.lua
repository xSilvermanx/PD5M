-- thread that allows for a dot to be displayed in the center of the screen.
-- Used by pressing F3.

if ActivateCrosshair then
	local texturedict = "srange_gen"
	local texturename = "medaldot_32"
	local ButtonPressed = false
	RequestStreamedTextureDict(texturedict, true)

	CreateThread(function()
		while true do
			if IsControlJustPressed(0, 170) then
				ButtonPressed = not ButtonPressed
			end
			Wait(0)
		end
	end)

	CreateThread(function()
		while true do
			while ButtonPressed do
				DrawSprite(texturedict, texturename, 0.5, 0.5, 0.009, 0.0165, 0.0, 0, 0, 0, 190)
				DrawSprite(texturedict, texturename, 0.5, 0.5, 0.007, 0.013, 0.0, 255, 255, 255, 190)
				Wait(0)
			end
			Wait(10)
		end
	end)

end
