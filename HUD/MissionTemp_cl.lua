RegisterNetEvent('pd5m:hud:ShowPlayerAvailable')
AddEventHandler('pd5m:hud:ShowPlayerAvailable', function(ClientNetID, ClientName)
  BeginTextCommandThefeedPost("TWOSTRINGS")

	AddTextComponentSubstringPlayerName("Officer ~y~" .. ClientName .. '~s~ is now ~g~available~s~.')

	EndTextCommandThefeedPostMessagetext("CHAR_CALL911", "CHAR_CALL911", false, 4, 'Duty Notification', "Officer ID ~y~" .. ClientNetID)
	EndTextCommandThefeedPostTicker(false, false)

  UnregisterPedheadshot(PedHeadHandle)
end)

RegisterNetEvent('pd5m:hud:ShowPlayerUnavailable')
AddEventHandler('pd5m:hud:ShowPlayerUnavailable', function(ClientNetID, ClientName)
  BeginTextCommandThefeedPost("TWOSTRINGS")

  AddTextComponentSubstringPlayerName("Officer ~y~" .. ClientName .. '~s~ is now ~r~busy~s~.')

  EndTextCommandThefeedPostMessagetext("CHAR_CALL911", "CHAR_CALL911", false, 4, 'Duty Notification', "Officer ID ~y~" .. ClientNetID)
  EndTextCommandThefeedPostTicker(false, false)

  UnregisterPedheadshot(PedHeadHandle)
end)

RegisterNetEvent('pd5m:hud:UpdateMissionInformation')
AddEventHandler('pd5m:hud:UpdateMissionInformation', function(CalloutInfo, AmbientInfo, AvailableInfo)
  MssCalloutTriggered = CalloutInfo
  MssAmbientEventTriggered = AmbientInfo
end)

RegisterNetEvent('pd5m:hud:UpdateAvailability')
AddEventHandler('pd5m:hud:UpdateAvailability', function(AvailableInfo)
  MssAvailable = AvailableInfo
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
      AddTextComponentSubstringPlayerName('Callout')
      SetTextCentre(true)
      SetTextColour(255, 255, 255, 255)
      SetTextScale(0.5, 0.35)
      SetTextOutline()
      EndTextCommandDisplayText(0.1935, 0.881)

      BeginTextCommandDisplayText("STRING")
      AddTextComponentSubstringPlayerName('Ambient')
      SetTextCentre(true)
      SetTextColour(255, 255, 255, 255)
      SetTextScale(0.5, 0.35)
      SetTextOutline()
      EndTextCommandDisplayText(0.1908, 0.856)

      BeginTextCommandDisplayText("STRING")
      AddTextComponentSubstringPlayerName('Status')
      SetTextCentre(true)
      SetTextColour(255, 255, 255, 255)
      SetTextScale(0.5, 0.4)
      SetTextOutline()
      EndTextCommandDisplayText(0.1937, 0.826)
      if MssCalloutTriggered then
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName('running')
        SetTextColour(255, 0, 0, 255)
        SetTextScale(0.5, 0.35)
        SetTextOutline()
        EndTextCommandDisplayText(0.2155, 0.881)
      elseif not MssAvailable then
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName('deactivated')
        SetTextColour(100, 100, 100, 255)
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
      if MssAmbientEventTriggered then
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName('running')
        SetTextColour(255, 0, 0, 255)
        SetTextScale(0.5, 0.35)
        SetTextOutline()
        EndTextCommandDisplayText(0.2155, 0.856)
        else
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName('available')
        SetTextColour(0, 255, 0, 255)
        SetTextScale(0.5, 0.35)
        SetTextOutline()
        EndTextCommandDisplayText(0.2155, 0.856)
      end
      if MssAvailable then
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName('Available')
        SetTextColour(0, 255, 0, 255)
        SetTextScale(0.5, 0.4)
        SetTextOutline()
        EndTextCommandDisplayText(0.2155, 0.826)
      else
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName('Busy')
        SetTextColour(255, 0, 0, 255)
        SetTextScale(0.5, 0.4)
        SetTextOutline()
        EndTextCommandDisplayText(0.2155, 0.826)
      end
    end
    Wait(0)
  end
end)
