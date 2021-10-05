ESX = nil

Citizen.CreateThread(function()
  while true do
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
    if PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'fire' then
      PlayerData.job.name = 'police'
    end
    Wait(5000)
  end
end)
