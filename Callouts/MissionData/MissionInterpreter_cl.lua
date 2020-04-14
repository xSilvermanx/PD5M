RegisterNetEvent('pd5m:mss:api:TriggerDispatchCall')
AddEventHandler('pd5m:mss:api:TriggerDispatchCall', function(CalloutNumber, string, MissionPos)

  local blip = AddBlipForRadius(MissionPos.x, MissionPos.y, MissionPos.z, 100.0)
  SetBlipColour(blip, 1)
  SetBlipAlpha(blip, 80)
  SetBlipHiddenOnLegend(blip, false)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Callout ID ' .. CalloutNumber .. '')
  EndTextCommandSetBlipName(blip)

  CreateThread(function()
    Wait(300000)
    RemoveBlip(blip)
  end)

  local DisplayText = string
	local DisplayTextLength = string.len(DisplayText)
	local DisplayTextMainList = {}
	local DisplayTextSubList = {}

	if DisplayTextLength > 99 then
		local n = 1
		for word in string.gmatch(DisplayText, "%S+") do
			table.insert(DisplayTextSubList, word)
			n = n + 1
		end

		local DisplayTextHelpNew = DisplayTextSubList[1]
		local i = 1
		while i < n do
      local breakloop = false
			local DisplayTextHelpLength = 0
      local DisplayTextHelp = nil
			while DisplayTextHelpLength < 90 do
				i = i + 1
				DisplayTextHelp = DisplayTextHelpNew
				if DisplayTextSubList[i] == nil then
					breakloop = true
					break
				end
				DisplayTextHelpNew = DisplayTextHelp .. ' ' .. DisplayTextSubList[i]
				DisplayTextHelpLength = string.len(DisplayTextHelpNew)
				Wait(0)
			end
			if breakloop then
				table.insert(DisplayTextMainList, DisplayTextHelp)
				break
			end
			DisplayTextHelp = DisplayTextHelp .. ' ' .. '...'
			table.insert(DisplayTextMainList, DisplayTextHelp)
			i = i - 1
			DisplayTextHelpNew = '...'
			Wait(0)
		end
	else
		table.insert(DisplayTextMainList, DisplayText)
	end

  for i, str in ipairs(DisplayTextMainList) do
    if (i % 2 == 0) then
    else
      BeginTextCommandThefeedPost("TWOSTRINGS")

      if DisplayTextMainList[i+1] ~= nil then
        AddTextComponentSubstringPlayerName(string.sub(str, 1, -5))
        AddTextComponentSubstringPlayerName(string.sub(DisplayTextMainList[i+1], 5))
      else
        AddTextComponentSubstringPlayerName(str)
      end

      EndTextCommandThefeedPostMessagetext("CHAR_CALL911", "CHAR_CALL911", false, 4, 'Police Dispatch', 'Callout ID ~y~' .. CalloutNumber)
      EndTextCommandThefeedPostTicker(false, false)
      Wait(4000)
    end
  end
end)

RegisterNetEvent('pd5m:mss:api:DispatchUpdate')
AddEventHandler('pd5m:mss:api:DispatchUpdate', function(CalloutNumber, string)

  local DisplayText = string
	local DisplayTextLength = string.len(DisplayText)
	local DisplayTextMainList = {}
	local DisplayTextSubList = {}

	if DisplayTextLength > 99 then
		local n = 1
		for word in string.gmatch(DisplayText, "%S+") do
			table.insert(DisplayTextSubList, word)
			n = n + 1
		end

		local DisplayTextHelpNew = DisplayTextSubList[1]
		local i = 1
		while i < n do
      local breakloop = false
			local DisplayTextHelpLength = 0
      local DisplayTextHelp = nil
			while DisplayTextHelpLength < 90 do
				i = i + 1
				DisplayTextHelp = DisplayTextHelpNew
				if DisplayTextSubList[i] == nil then
					breakloop = true
					break
				end
				DisplayTextHelpNew = DisplayTextHelp .. ' ' .. DisplayTextSubList[i]
				DisplayTextHelpLength = string.len(DisplayTextHelpNew)
				Wait(0)
			end
			if breakloop then
				table.insert(DisplayTextMainList, DisplayTextHelp)
				break
			end
			DisplayTextHelp = DisplayTextHelp .. ' ' .. '...'
			table.insert(DisplayTextMainList, DisplayTextHelp)
			i = i - 1
			DisplayTextHelpNew = '...'
			Wait(0)
		end
	else
		table.insert(DisplayTextMainList, DisplayText)
	end

  for i, str in ipairs(DisplayTextMainList) do
    if (i % 2 == 0) then
    else
      BeginTextCommandThefeedPost("TWOSTRINGS")

      if DisplayTextMainList[i+1] ~= nil then
        AddTextComponentSubstringPlayerName(string.sub(str, 1, -4))
        AddTextComponentSubstringPlayerName(string.sub(DisplayTextMainList[i+1], 5))
      else
        AddTextComponentSubstringPlayerName(str)
      end

      EndTextCommandThefeedPostMessagetext("CHAR_CALL911", "CHAR_CALL911", false, 4, 'Police Dispatch', 'Callout ID ~y~' .. CalloutNumber)
      EndTextCommandThefeedPostTicker(false, false)
      Wait(4000)
    end
  end
end)
