RegisterNetEvent('pd5m:hud:UpdateMissionInformation')
AddEventHandler('pd5m:hud:UpdateMissionInformation', function(AmbientInfo)
  MssAmbientEventTriggered = AmbientInfo
end)

local ShowMissionMenu = false

CreateThread(function()
  while true do
    if PlayerData ~= nil then
      if PlayerData.job ~= nil then
        if PlayerData.job.name ~= nil then
          if PlayerData.job.name == 'police' then
            ShowMissionMenu = true
          end
        end
      end
    end
    Wait(5000)
  end
end)



CreateThread(function()
  while true do
    if ShowMissionMenu then
      BeginTextCommandDisplayText("STRING")
      AddTextComponentSubstringPlayerName('Ambient')
      SetTextCentre(true)
      SetTextColour(255, 255, 255, 255)
      SetTextScale(0.5, 0.35)
      SetTextOutline()
      EndTextCommandDisplayText(0.1908, 0.881)
      if MssAmbientEventTriggered then
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName('running')
        SetTextColour(255, 0, 0, 255)
        SetTextScale(0.5, 0.35)
        SetTextOutline()
        EndTextCommandDisplayText(0.2155, 0.881)
      else
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName('available')
        SetTextColour(0, 255, 0, 255)
        SetTextScale(0.5, 0.35)
        SetTextOutline()
        EndTextCommandDisplayText(0.2155, 0.881)
      end
    end
    Wait(0)
  end
end)
