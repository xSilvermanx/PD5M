local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
	local PlayerData = QBCore.Functions.GetPlayerData()
	if PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'fire' then
      PlayerData.job.name = 'police'
    end
	Wait(5000)
end)
