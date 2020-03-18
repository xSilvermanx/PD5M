-- Handler to utilize "/tp" in tp_cl.lua
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/tp" then
		CancelEvent()
		TriggerClientEvent('pd5m:hud:opentpmenu', s)
	end
end)
