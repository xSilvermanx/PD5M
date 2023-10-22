local QBCore = exports['qb-core']:GetCoreObject()

PlayerData = QBCore.Functions.GetPlayerData()

Citizen.CreateThread(function()
	while true do
		PlayerData = QBCore.Functions.GetPlayerData()
		if PlayerData and PlayerData.job and PlayerData.job.name then
			if PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'fire' then
				PlayerData.job.name = 'police'
			end
		end
		Wait(5000)
	end
end)
	