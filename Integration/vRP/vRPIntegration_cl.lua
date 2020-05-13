vRP = Proxy.getInterface("vRP")
vRPpd5m = {}
Tunnel.bindInterface("PD5M",vRPpd5m)
vRPserver = Tunnel.getInterface("vRP","PD5M")
vRPpd5mS = Tunnel.getInterface("PD5M","PD5M")

Citizen.CreateThread(function()
	while true do
		vRPpd5mS.isPD({}, function(isacop)
			if isacop ~= nil then
				PlayerData.job.name = isacop
			else
				PlayerData.job.name = ""
			end
		end)
		Citizen.Wait(5000)
	end
end)