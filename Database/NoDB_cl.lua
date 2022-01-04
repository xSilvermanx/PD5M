local database_enabled = false

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
      fire = {

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
      fire = {

      },
      dpos = {

      },
    },
  },
}

AddEventHandler('pd5m:db:SaveCurrentOutfit', function()
  Notify('Database is disabled. Action not possible.')
end)

AddEventHandler('pd5m:db:LoadOutfit', function()
  Notify('Database is disabled. Action not possible.')
end)

AddEventHandler('pd5m:db:DeleteOutfit', function()
  Notify('Database is disabled. Action not possible.')
end)
