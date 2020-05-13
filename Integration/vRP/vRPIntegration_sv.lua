local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPpd5m = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","PD5M")
Clotheclient = Tunnel.getInterface("PD5M","PD5M")
Tunnel.bindInterface("PD5M",vRPpd5m)


function vRPpd5m.isPD()
	local user_id = vRP.getUserId({source})
	if user_id ~= nil then
		if vRP.hasPermission({user_id, "cop.onduty"}) or vRP.hasPermission({user_id, "cop.whitelisted"}) then
			return "police"
		else
			return false
		end
	end
end
