local database_enabled = true

DBPlayerData = {}
DBCharacterData = {}
DBWardrobeData = {}

DBWardrobeMenuData = {
  ListOfOutfitNames = {
    [1] = {
      lspd = {

      },
      bcso = {

      },
      sasp = {

      },
      sapr = {

      },
      swat = {

      },
      lsfd = {

      },
      bcfd = {

      },
      dpos = {

      },
    },
    [2] = {
      lspd = {

      },
      bcso = {

      },
      sasp = {

      },
      sapr = {

      },
      swat = {

      },
      lsfd = {

      },
      bcfd = {

      },
      dpos = {

      },
    },
  },
}

RegisterNetEvent('pd5m:db:RecieveData')
AddEventHandler('pd5m:db:RecieveData', function(PlData, ChData, ClData)
  DBPlayerData = Pldata
  DBCharacterData = ChData
  DBWardrobeData = ClData

  TriggerEvent('pd5m:db:RecreateWardrobeMenuData')
end)

AddEventHandler('pd5m:db:RecreateWardrobeMenuData', function()
  local lspdMExists = false
  local bcsoMExists = false
  local saspMExists = false
  local saprMExists = false
  local swatMExists = false
  local lsfdMExists = false
  local bcfdMExists = false
  local dposMExists = false
  local lspdFExists = false
  local bcsoFExists = false
  local saspFExists = false
  local saprFExists = false
  local swatFExists = false
  local lsfdFExists = false
  local bcfdFExists = false
  local dposFExists = false


  DBWardrobeMenuData = {
    ListOfOutfitNames = {
      [1] = {
        lspd = {

        },
        bcso = {

        },
        sasp = {

        },
        sapr = {

        },
        swat = {

        },
        lsfd = {

        },
        bcfd = {

        },
        dpos = {

        },
      },
      [2] = {
        lspd = {

        },
        bcso = {

        },
        sasp = {

        },
        sapr = {

        },
        swat = {

        },
        lsfd = {

        },
        bcfd = {

        },
        dpos = {

        },
      },
    },
  }
  for name, entry in pairs(DBWardrobeData) do
    local PedGender = entry.Gender
    local Department = entry.Department
    if Department == 'lspd' then
      if PedGender == 1 then
        lspdMExists = true
      else
        lspdFExists = true
      end
    elseif Department == 'bcso' then
      if PedGender == 1 then
        bcsoMExists = true
      else
        bcsoFExists = true
      end
    elseif Department == 'sasp' then
      if PedGender == 1 then
        saspMExists = true
      else
        saspFExists = true
      end
    elseif Department == 'sapr' then
      if PedGender == 1 then
        saprMExists = true
      else
        saprFExists = true
      end
    elseif Department == 'swat' then
      if PedGender == 1 then
        swatMExists = true
      else
        swatFExists = true
      end
    elseif Department == 'lsfd' then
      if PedGender == 1 then
        lsfdMExists = true
      else
        lsfdFExists = true
      end
    elseif Department == 'bcfd' then
      if PedGender == 1 then
        bcfdMExists = true
      else
        bcfdFExists = true
      end
    elseif Department == 'dpos' then
      if PedGender == 1 then
        dposMExists = true
      else
        dposFExists = true
      end
    end
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[PedGender][Department], name)
  end

  if not lspdMExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[1].lspd, 'No Outfit available')
  end
  if not lspdFExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[2].lspd, 'No Outfit available')
  end
  if not bcsoMExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[1].bcso, 'No Outfit available')
  end
  if not bcsoFExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[2].bcso, 'No Outfit available')
  end
  if not saspMExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[1].sasp, 'No Outfit available')
  end
  if not saspFExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[2].sasp, 'No Outfit available')
  end
  if not saprMExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[1].sapr, 'No Outfit available')
  end
  if not saprFExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[2].sapr, 'No Outfit available')
  end
  if not swatMExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[1].swat, 'No Outfit available')
  end
  if not swatFExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[2].swat, 'No Outfit available')
  end
  if not lsfdMExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[1].lsfd, 'No Outfit available')
  end
  if not lsfdFExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[2].lsfd, 'No Outfit available')
  end
  if not bcfdMExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[1].bcfd, 'No Outfit available')
  end
  if not bcfdFExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[2].bcfd, 'No Outfit available')
  end
  if not dposMExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[1].dpos, 'No Outfit available')
  end
  if not dposFExists then
    table.insert(DBWardrobeMenuData.ListOfOutfitNames[2].dpos, 'No Outfit available')
  end

end)

AddEventHandler('pd5m:db:SaveCurrentOutfit', function(Department, PedGender)
  AddTextEntry('SaveOutfitLabel', 'Enter Outfit Name (Use Numbers, Letters, _ and : )')
  DisplayOnscreenKeyboard(6, "SaveOutfitLabel", "lspd_m_Lieutenant1", "", "", "", "", 30)
  while (UpdateOnscreenKeyboard() == 0) do
    DisableAllControlActions(0)
    Wait(0)
  end
  if (GetOnscreenKeyboardResult()) then
    local result = GetOnscreenKeyboardResult()
    if result ~= nil then
      local ResultValid = true
      for i=1,string.len(result),1 do
        local c = string.sub(result, i, i)
        if not ( string.match(c, "%a") or string.match(c, "%d") or string.match(c, "[:_]") ) then
          ResultValid = false
          break
        end
      end

      if ResultValid then
        local ResultUnique = true
        for name, entry in pairs(DBWardrobeData) do
          if name == result then
            ResultUnique = false
            break
          end
        end
        if ResultUnique then
          local playerped = GetPlayerPed(-1)
          local ClothTable = {
            Department = Department,
            Gender = PedGender,
            Components = {
              {1,GetPedDrawableVariation(playerped, 1), GetPedTextureVariation(playerped, 1), GetPedPaletteVariation(playerped, 1)},
              {3,GetPedDrawableVariation(playerped, 3), GetPedTextureVariation(playerped, 3), GetPedPaletteVariation(playerped, 3)},
              {4,GetPedDrawableVariation(playerped, 4), GetPedTextureVariation(playerped, 4), GetPedPaletteVariation(playerped, 4)},
              {5,GetPedDrawableVariation(playerped, 5), GetPedTextureVariation(playerped, 5), GetPedPaletteVariation(playerped, 5)},
              {6,GetPedDrawableVariation(playerped, 6), GetPedTextureVariation(playerped, 6), GetPedPaletteVariation(playerped, 6)},
              {7,GetPedDrawableVariation(playerped, 7), GetPedTextureVariation(playerped, 7), GetPedPaletteVariation(playerped, 7)},
              {8,GetPedDrawableVariation(playerped, 8), GetPedTextureVariation(playerped, 8), GetPedPaletteVariation(playerped, 8)},
              {9,GetPedDrawableVariation(playerped, 9), GetPedTextureVariation(playerped, 9), GetPedPaletteVariation(playerped, 9)},
              {10,GetPedDrawableVariation(playerped, 10), GetPedTextureVariation(playerped, 10), GetPedPaletteVariation(playerped, 10)},
              {11,GetPedDrawableVariation(playerped, 11), GetPedTextureVariation(playerped, 11), GetPedPaletteVariation(playerped, 11)},
            },
            Props = {
              {0, GetPedPropIndex(playerped, 0), GetPedPropTextureIndex(playerped, 0)},
              {1, GetPedPropIndex(playerped, 1), GetPedPropTextureIndex(playerped, 1)},
              {2, GetPedPropIndex(playerped, 2), GetPedPropTextureIndex(playerped, 2)},
              {6, GetPedPropIndex(playerped, 6), GetPedPropTextureIndex(playerped, 6)},
              {7, GetPedPropIndex(playerped, 7), GetPedPropTextureIndex(playerped, 7)},
            },
          }

          TriggerServerEvent('pd5m:dbsv:RecieveData', 'Clothing', 'AddItem', result, ClothTable)
          Notify('Outfit saved successfully with name ~g~' .. result .. '~s~.')
        else
          Notify('Name already chosen in your wardrobe.')
        end
      else
        Notify('Please enter a valid name.')
      end
    else
      Notify('Please enter a valid name.')
    end
  else
    Notify('Please enter a valid name.')
  end
end)

AddEventHandler('pd5m:db:LoadOutfit', function(name)
  if name == 'No Outfit available' then
    Notify('Cannot load any outfit.')
  else
    Notify('Loading outfit ~g~' .. name .. "~s~.")
    local playerped = GetPlayerPed(-1)
    local Components = DBWardrobeData[name].Components
    local Props = DBWardrobeData[name].Props

    for i, comp in ipairs(Components) do
      SetPedComponentVariation(playerped, comp[1], comp[2], comp[3], comp[4])
    end
    for i, prop in ipairs(Props) do
      if prop[2] == -1 then
        ClearPedProp(playerped, prop[1])
      else
        SetPedPropIndex(playerped, prop[1], prop[2], prop[3], true)
      end
    end
  end
end)

AddEventHandler('pd5m:db:DeleteOutfit', function(name)
  if name == 'No Outfit available' then
    Notify('Cannot delete any outfit.')
  else
    TriggerServerEvent('pd5m:dbsv:RecieveData', 'Clothing', 'DeleteItem', name, {})
  end
end)
