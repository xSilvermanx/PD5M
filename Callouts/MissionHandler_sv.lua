CreateThread(function()
  Wait(5000)
  while true do
    PlayerList = GetPlayers()
    for i, PlayerNetID in ipairs(PlayerList) do
      PlayerNetID = tonumber(PlayerNetID)
      if PlayerCanTriggerAmbientEvents[PlayerNetID] == nil then
        PlayerCanTriggerAmbientEvents[PlayerNetID] = true
      end
      if PlayerRunsAmbientEvent[PlayerNetID] == nil then
        PlayerRunsAmbientEvent[PlayerNetID] = 'None'
        TriggerEvent('pd5m:msssv:UpdateMissionInformation', PlayerNetID)
      end
    end
    Wait(60000)
  end
end)

RegisterNetEvent('pd5m:msssv:InitMssTables')
AddEventHandler('pd5m:msssv:InitMssTables', function()
  local Client = tonumber(source)
  PlayerCanTriggerAmbientEvents[Client] = true
  PlayerRunsAmbientEvent[Client] = 'None'
end)

CreateThread(function()
  while true do
    local NoActiveAmbientEventPlayers = GetNoActiveAmbientEventPlayers()
    local AmbientEventChance = AmbientEventTriggerChance * math.sqrt(NoActiveAmbientEventPlayers)
    local AmbientEventRandomIntTrigger = math.random(1, 100)
    if AmbientEventChance >= AmbientEventRandomIntTrigger then
      if #PlayerCanTriggerAmbientEventsIPairsList > 0 then
        local PlayerNetID = PlayerCanTriggerAmbientEventsIPairsList[math.random(1, #PlayerCanTriggerAmbientEventsIPairsList)]
        PlayerNetID = tonumber(PlayerNetID)
        PlayerCanTriggerAmbientEvents[PlayerNetID] = false
        CreateThread(function()
          TriggerEvent('pd5m:msssv:TriggerAmbientEvent', PlayerNetID)
        end)
      end
    end
    Wait(10000)
  end
end)

AddEventHandler('playerDropped', function(reason)
  if PlayerRunsAmbientEvent[source] ~= 'None' then

  end
  PlayerCanTriggerAmbientEvents[source] = nil
  PlayerRunsAmbientEvent[source] = nil
end)

function GetNoActiveAmbientEventPlayers()
  local NoActivePlayers = 0
  PlayerCanTriggerAmbientEventsIPairsList = {}
  for i, entry in pairs(PlayerCanTriggerAmbientEvents) do
    if entry == true then
      table.insert(PlayerCanTriggerAmbientEventsIPairsList, i)
      NoActivePlayers = NoActivePlayers + 1
    end
  end
  return(NoActivePlayers)
end

AddEventHandler('pd5m:msssv:TriggerAmbientEvent', function(PlayerNetID)
  local AmbientEventRandom = math.random(1, AmbientEventTotalWeight)
  local AmbientEventID = 1
  while AmbientEventRandom > AmbientEventWeightList[AmbientEventID] do
    AmbientEventID = AmbientEventID + 1
  end
  PlayerRunsAmbientEvent[PlayerNetID] = AmbientEventID
  TriggerEvent('pd5m:msssv:UpdateMissionInformation', PlayerNetID)
  TriggerClientEvent('pd5m:mss:TriggerAmbientEvent', PlayerNetID, AmbientEventID)
end)

RegisterNetEvent('pd5m:msssv:RegisterAmbientEventTimer')
AddEventHandler('pd5m:msssv:RegisterAmbientEventTimer', function(AmbientEventID)
  local Client = tonumber(source)
  local CurrTime = os.time()
  CurrentlyRunningAmbientEventsList[Client] = {
    ClientID = Client,
    RunningEvent = AmbientEventID,
    CreationTime = CurrTime,
    Entities = {
    },
  }
end)

RegisterNetEvent('pd5m:msssv:AddAmbientEventTimer')
AddEventHandler('pd5m:msssv:AddAmbientEventTimer', function(TargetNetID)
  local Client = tonumber(source)
  if CurrentlyRunningAmbientEventsList[Client] ~= nil then
    local CurrTime = os.time()
    local List = {
      Entity = TargetNetID,
      Time = CurrTime,
      Interacted = false,
    }
    table.insert(CurrentlyRunningAmbientEventsList[Client].Entities, List)
  end
end)

AddEventHandler('pd5m:msssv:EndAmbientEvent', function(PlayerNetID)
  PlayerRunsAmbientEvent[PlayerNetID] = 'None'
  TriggerEvent('pd5m:msssv:UpdateMissionInformation', PlayerNetID)
  PlayerCanTriggerAmbientEvents[PlayerNetID] = true
end)

CreateThread(function()
  while true do
    local CurrTime = os.time()
    for Client, AmbientEvent in pairs(CurrentlyRunningAmbientEventsList) do
      if #AmbientEvent.Entities == 0 then
        if CurrTime - AmbientEvent.CreationTime > 120 then
          CurrentlyRunningAmbientEventsList[Client] = nil
          TriggerEvent('pd5m:msssv:EndAmbientEvent', Client)
        end
      else
        for i, EntityData in ipairs(AmbientEvent.Entities) do
          if CurrTime - EntityData.Time > 900 then
            TriggerEvent('pd5m:cleanupsv:SetEntityAsNoLongerNeeded', EntityData.Entity)
            CurrentlyRunningAmbientEventsList[Client].Entities[i] = nil
            AmbientEvent.CreationTime = CurrTime
          elseif EntityData.Interacted then
            CurrentlyRunningAmbientEventsList[Client].Entities[i] = nil
            AmbientEvent.CreationTime = CurrTime
          end
        end
      end
    end
    Wait(10000)
  end
end)

RegisterNetEvent('pd5m:msssv:EntityInteracted')
AddEventHandler('pd5m:msssv:EntityInteracted', function(NetID)
  local CurrTime = os.time()
  for Client, AmbientEvent in pairs(CurrentlyRunningAmbientEventsList) do
    if #AmbientEvent.Entities ~= 0 then
      for i, EntityData in ipairs(AmbientEvent.Entities) do
        if NetID == EntityData.Entity and CurrTime > EntityData.Time then
          EntityData.Interacted = true
        end
      end
    end
  end
end)

AddEventHandler('pd5m:msssv:UpdateMissionInformation', function(ClientNetID)
  local AmbientInfo = false
  if PlayerRunsAmbientEvent[ClientNetID] == 'None' then
  else
    AmbientInfo = true
  end

  TriggerClientEvent('pd5m:hud:UpdateMissionInformation', ClientNetID, AmbientInfo)
end)
