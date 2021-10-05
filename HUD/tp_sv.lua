-- Handler to utilize "/tp" in tp_cl.lua
if ActivateTPfunction then
	RegisterCommand("tp", function(s, n, m)
		CancelEvent()
		TriggerClientEvent('pd5m:hud:opentpmenu', s)
	end)
end