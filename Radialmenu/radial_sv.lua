-- Event Handler that registers the commands sent by the radialmenu.
-- Triggers the relevant Client Event.
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/pd5m:int:initstopcar" then
		CancelEvent()
		TriggerClientEvent('pd5m:int:initstopcar', s, nil)
	elseif message == "/pd5m:int:search" then
		CancelEvent()
		TriggerClientEvent('pd5m:int:search', s)
	elseif message == "/pd5m:int:breathalyzer" then
		CancelEvent()
		TriggerClientEvent('pd5m:int:breathalyzer', s)
	elseif message == "/pd5m:int:drugtest" then
		CancelEvent()
		TriggerClientEvent('pd5m:int:drugtest', s)
	elseif message == "/pd5m:int:seizecar" then
		CancelEvent()
		TriggerClientEvent('pd5m:int:seizecar', s)
	elseif message == "/pd5m:int:confiscateitems" then
		CancelEvent()
		TriggerClientEvent('pd5m:int:confiscateitems', s)
	elseif message == "/pd5m:int:fineped" then
		CancelEvent()
		TriggerClientEvent('pd5m:int:fineped', s)
	elseif message == "/pd5m:int:arrestped" then
		CancelEvent()
		TriggerClientEvent('pd5m:int:arrestped', s)
	elseif message == "/pd5m:int:letpedfollow" then
		CancelEvent()
		TriggerClientEvent('pd5m:int:letpedfollow', s)
	elseif message == "/pd5m:int:grabped" then
		CancelEvent()
		TriggerClientEvent('pd5m:int:grabped', s)
	elseif message == "/pd5m:int:packejectped" then
		CancelEvent()
		TriggerClientEvent('pd5m:int:packejectped', s)
	elseif message == "/pd5m:int:runid" then
		CancelEvent()
		TriggerClientEvent('pd5m:int:runid', s)
	elseif message == "/pd5m:int:runplate" then
		CancelEvent()
		TriggerClientEvent('pd5m:int:runplate', s)
	elseif message == "/pd5m:tow:calltowtruck" then
		CancelEvent()
		TriggerClientEvent('pd5m:tow:calltowtruck', s)
	elseif message == "/pd5m:service:callcoroner" then
		CancelEvent()
		TriggerClientEvent('pd5m:service:callcoroner', s)
	end
end)
