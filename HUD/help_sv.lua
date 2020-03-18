--[[AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/tutorial" then
		CancelEvent()
		TriggerClientEvent('pd5m:tut:starttutorial', s)
	end
end)]]
