RegisterCommand("pd5m:int:initstopcar", function(s, n, m)
	CancelEvent()
	TriggerClientEvent('pd5m:int:initstopcar', s, nil)
end)

RegisterCommand("pd5m:int:search", function(s, n, m)
	CancelEvent()
	TriggerClientEvent('pd5m:int:search', s)
end)
RegisterCommand("pd5m:int:breathalyzer", function(s, n, m)
	CancelEvent()
	TriggerClientEvent('pd5m:int:breathalyzer', s)
end)
RegisterCommand("pd5m:int:drugtest", function(s, n, m)
	CancelEvent()
	TriggerClientEvent('pd5m:int:drugtest', s)
end)
RegisterCommand("pd5m:int:seizecar", function(s, n, m)
	CancelEvent()
	TriggerClientEvent('pd5m:int:seizecar', s)
end)
RegisterCommand("pd5m:int:confiscateitems", function(s, n, m)
	CancelEvent()
	TriggerClientEvent('pd5m:int:confiscateitems', s)
end)
RegisterCommand("pd5m:int:fineped", function(s, n, m)
	CancelEvent()
	TriggerClientEvent('pd5m:int:fineped', s)
end)
RegisterCommand("pd5m:int:arrestped", function(s, n, m)
	CancelEvent()
	TriggerClientEvent('pd5m:int:arrestped', s)
end)
RegisterCommand("pd5m:int:letpedfollow", function(s, n, m)
	CancelEvent()
	TriggerClientEvent('pd5m:int:letpedfollow', s)
end)
RegisterCommand("pd5m:int:grabped", function(s, n, m)
	CancelEvent()
	TriggerClientEvent('pd5m:int:grabped', s)
end)
RegisterCommand("pd5m:int:packejectped", function(s, n, m)
	CancelEvent()
	TriggerClientEvent('pd5m:int:packejectped', s)
end)
RegisterCommand("pd5m:int:runid", function(s, n, m)
	CancelEvent()
	TriggerClientEvent('pd5m:int:runid', s)
end)
RegisterCommand("pd5m:int:runplate", function(s, n, m)
	CancelEvent()
	TriggerClientEvent('pd5m:int:runplate', s)
end)
RegisterCommand("pd5m:tow:calltowtruck", function(s, n, m)
	CancelEvent()
	TriggerClientEvent('pd5m:tow:calltowtruck', s)
end)
RegisterCommand("pd5m:service:callcoroner", function(s, n, m)
	CancelEvent()
	TriggerClientEvent('pd5m:service:callcoroner', s)
end)