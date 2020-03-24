if ESXEnabled then
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
      Wait(5000)
    end
  end)
else
  PlayerData = {}
  PlayerData.job = {}
  PlayerData.job.name = 'police'
end
