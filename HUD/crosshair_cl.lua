-- thread that allows for a dot to be displayed in the center of the screen.
-- Used by pressing F3.
CreateThread(function()
	local ButtonPressed = false
	while true do
		if IsControlJustPressed(0, 170) then
			ButtonPressed = not ButtonPressed
		end
		if ButtonPressed then
			DisplaySniperScopeThisFrame()
		end		
		Wait(0)
	end
end)