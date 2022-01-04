local database_enabled = true
local integer = 0

RegisterNetEvent('pd5m:dbsv:CheckMainDatabaseExists')
AddEventHandler('pd5m:dbsv:CheckMainDatabaseExists', function()
  local main = LoadResourceFile('pd5m', 'Database/DatabaseFiles/Main.json')
  if main then
    print('Database loaded successfully')
    data = json_GetFile('Main')
    CreateThread(function()
      local foundFreeId = false
      while not foundFreeId do
        integer = integer + 1
        if data[integer] == nil then
          break
        end
        Wait(0)
      end
      print('Next database ID', integer)
    end)
  else
    print('Creating Database')
    TriggerEvent('pd5m:dbsv:CreateMainDatabaseFiles')
  end
end)

AddEventHandler('pd5m:dbsv:CreateMainDatabaseFiles', function()
  local MainFile = io.open(GetResourcePath('pd5m') .. "/Database/DatabaseFiles/Main.json", "w")
  MainFile:write("{}")
  MainFile:close()
  integer = 1
end)

RegisterNetEvent('pd5m:dbsv:PlayerConnected')
AddEventHandler('pd5m:dbsv:PlayerConnected', function()
  local id = source
  local LoadedData, DbId = pd5m_dbsv_FindPlayerDatabaseId(id)
  if not LoadedData then
    print('Creating Data')
    TriggerEvent('pd5m:dbsv:CreateNewPlayer', id)
  else
    print('Loaded Data')
    TriggerEvent('pd5m:dbsv:LoadPlayer', id, DbId)
  end
end)

AddEventHandler('pd5m:dbsv:CreateNewPlayer', function(id)
  local xdbid = integer
  integer = integer + 1
  local xsteamid, xlicense, xdiscord, xfivem = pd5m_dbsv_ReturnEventHandlers(id)
  local Content = {
    dbid = xdbid,
    steamid = xsteamid,
    license = xlicense,
    discord = xdiscord,
    fivem = xfivem,
  }
  local dbid = xdbid
  json_AddItem('Main', dbid, Content)

  local CharsFile = io.open(GetResourcePath('pd5m') .. "/Database/DatabaseFiles/Characters/" .. tostring(dbid) .. ".json", "w")
  CharsFile:write("{}")
  CharsFile:close()

  local PlsFile = io.open(GetResourcePath('pd5m') .. "/Database/DatabaseFiles/Players/" .. tostring(dbid) .. ".json", "w")
  PlsFile:write("{}")
  PlsFile:close()

  local ClothsFile = io.open(GetResourcePath('pd5m') .. "/Database/DatabaseFiles/Wardrobes/" .. tostring(dbid) .. ".json", "w")
  ClothsFile:write("{}")
  ClothsFile:close()

  TriggerClientEvent('pd5m:db:RecieveData', id, {}, {}, {})
end)

AddEventHandler('pd5m:dbsv:LoadPlayer', function(id, dbid)

  local PlData = json_GetFile("Players/" .. tostring(dbid))
  local ChData = json_GetFile("Characters/" .. tostring(dbid))
  local ClData = json_GetFile("Wardrobes/" .. tostring(dbid))

  TriggerClientEvent('pd5m:db:RecieveData', id, PlData, ChData, ClData)
end)

RegisterNetEvent('pd5m:dbsv:RecieveData')
AddEventHandler('pd5m:dbsv:RecieveData', function(type, task, name, value)
  local id = source
  local LoadedData, DbId = pd5m_dbsv_FindPlayerDatabaseId(id)
  if LoadedData then
    local PathPrefix = nil
    if type == 'Player' then
      PathPrefix = 'Players/'
    elseif type == 'Character' then
      PathPrefix = 'Characters/'
    elseif type == 'Clothing' then
      PathPrefix = 'Wardrobes/'
    end

    if task == 'AddItem' then
      json_AddItem(PathPrefix .. tostring(DbId), name, value)
    elseif task == 'DeleteItem' then
      json_DeleteItem(PathPrefix .. tostring(DbId), name)
    elseif task == 'ReplaceItem' then
      json_ReplaceItem(PathPrefix .. tostring(DbId), name, value)
    end

    local PlData = json_GetFile("Players/" .. tostring(DbId))
    local ChData = json_GetFile("Characters/" .. tostring(DbId))
    local ClData = json_GetFile("Wardrobes/" .. tostring(DbId))

    TriggerClientEvent('pd5m:db:RecieveData', id, PlData, ChData, ClData)

  else
    print('Tried loading data of type ' .. type .. ' with task ' .. task .. ". Didn't find player database ID." )
  end
end)

function pd5m_dbsv_ReturnEventHandlers(id)
  local steamid = false
  local license = false
  local discord = false
  local fivem = false

  for i, id in pairs(GetPlayerIdentifiers(id)) do
    if string.sub(id, 1, string.len("steam:")) == "steam:" then
      steamid = id
    elseif string.sub(id, 1, string.len("license:")) == "license:" then
      license = id
    elseif string.sub(id, 1, string.len("discord:")) == "discord:" then
      discord = id
    elseif string.sub(id, 1, string.len("fivem:")) == "fivem:" then
      fivem = id
    end
  end

  return steamid, license, discord, fivem
end

function pd5m_dbsv_FindPlayerDatabaseId(id)
  local bool = false
  local dbid = 0
  local steamid, license, discord, fivem = pd5m_dbsv_ReturnEventHandlers(id)
  local MainData = json_GetFile('Main')
  for i, entry in pairs(MainData) do
    if (steamid == entry.steamid and not steamid == false) or (license == entry.license and not license == false) or (discord == entry.discord and not discord == false) or (fivem == entry.fivem and not fivem == false) then
      bool = true
      dbid = i
      break
    end
  end
  return bool, dbid
end
