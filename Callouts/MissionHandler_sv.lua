CreateThread(function()
  Wait(5000)
  while true do
    PlayerList = GetPlayers()
    for i, PlayerNetID in ipairs(PlayerList) do
      PlayerNetID = tonumber(PlayerNetID)
      if PlayerCanTriggerCallouts[PlayerNetID] == nil then
        PlayerCanTriggerCallouts[PlayerNetID] = false
      end
      if PlayerCanTriggerAmbientEvents[PlayerNetID] == nil then
        PlayerCanTriggerAmbientEvents[PlayerNetID] = true
      end
      if PlayerRunsAmbientEvent[PlayerNetID] == nil then
        PlayerRunsAmbientEvent[PlayerNetID] = 'None'
      end
      if PlayerRunsCallout[PlayerNetID] == nil then
        PlayerRunsCallout[PlayerNetID] = 'None'
      end
    end
    Wait(60000)
  end
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
    local NoActiveCalloutPlayers = GetNoActiveCalloutPlayers()
    local CalloutChance = CalloutTriggerChance * math.sqrt(NoActiveCalloutPlayers)
    local CalloutRandomIntTrigger = math.random(1, 100)
    if true then --CalloutChance >= CalloutRandomIntTrigger then
      if #PlayerCanTriggerCalloutsIPairsList > 0 then
        local PlayerNetID = PlayerCanTriggerCalloutsIPairsList[math.random(1, #PlayerCanTriggerCalloutsIPairsList)]
        PlayerNetID = tonumber(PlayerNetID)
        PlayerCanTriggerCallouts[PlayerNetID] = false
        CreateThread(function()
          TriggerEvent('pd5m:msssv:TriggerCallout', PlayerNetID)
        end)
      end
    end
    Wait(10000)
  end
end)

AddEventHandler('playerDropped', function(reason)
  if PlayerRunsAmbientEvent ~= nil then

  end
  if PlayerRunsCallout ~= nil then

  end
  PlayerCanTriggerCallouts[source] = nil
  PlayerCanTriggerAmbientEvents[source] = nil
  PlayerRunsAmbientEvent[source] = nil
  PlayerRunsCallout[source] = nil
end)

function GetNoActiveCalloutPlayers()
  local NoActivePlayers = 0
  PlayerCanTriggerCalloutsIPairsList = {}
  for i, entry in pairs(PlayerCanTriggerCallouts) do
    if entry == true then
      table.insert(PlayerCanTriggerCalloutsIPairsList, i)
      NoActivePlayers = NoActivePlayers + 1
    end
  end
  return(NoActivePlayers)
end

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

AddEventHandler('chatMessage', function(s, n, m)
  local message = string.lower(m)
  local client = tonumber(s)
  if message == "/10-8" then
    CancelEvent()
    PlayerCanTriggerCallouts[client] = true
    print('Officer ' .. n .. ' is now on duty.')
  elseif message == "/10-7" then
    CancelEvent()
    PlayerCanTriggerCallouts[client] = false
    print('Officer ' .. n .. ' is now off duty.')
  end
end)

AddEventHandler('pd5m:msssv:TriggerCallout', function(PlayerNetID)
  local CalloutRandom = math.random(1, CalloutTotalWeight)
  local CalloutID = 1
  while CalloutRandom > CalloutWeightList[CalloutID] do
    CalloutID = CalloutID + 1
  end
  PlayerRunsCallout[PlayerNetID] = CalloutID
  TriggerClientEvent('pd5m:mss:TriggerCallout', PlayerNetID, CalloutID)
end)

RegisterNetEvent('pd5m:msssv:RegisterCallout')
AddEventHandler('pd5m:msssv:RegisterCallout', function(CalloutID)
  local Client = tonumber(source)
  CurrentlyRunningCalloutsList[Client] = {
    ClientID = Client,
    RunningEvent = CalloutID,
    Entities = {

    },
  }
end)

RegisterNetEvent('pd5m:msssv:RegisterCalloutEntity')
AddEventHandler('pd5m:msssv:RegisterCalloutEntity', function(TargetNetID)
  local Client = tonumber(source)
  table.insert(CurrentlyRunningCalloutsList[Client].Entities, TargetNetID)
end)

RegisterNetEvent('pd5m:msssv:EndCallout')
AddEventHandler('pd5m:msssv:EndCallout', function()

end)

AddEventHandler('pd5m:msssv:TriggerAmbientEvent', function(PlayerNetID)
  local AmbientEventRandom = math.random(1, AmbientEventTotalWeight)
  local AmbientEventID = 1
  while AmbientEventRandom > AmbientEventWeightList[AmbientEventID] do
    AmbientEventID = AmbientEventID + 1
  end
  PlayerRunsAmbientEvent[PlayerNetID] = AmbientEventID
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
          if CurrTime - EntityData.Time > 900 or not DoesEntityExist(NetworkGetEntityFromNetworkId(EntityData.Entity)) then
            TriggerClientEvent('pd5m:mss:SetEntityAsNoLongerNeeded', -1, EntityData.Entity)
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
