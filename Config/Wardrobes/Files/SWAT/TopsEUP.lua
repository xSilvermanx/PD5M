SWATTops = {
  {
    Type = 0, -- 0: component, 1: prop
    ComponentID = 11, -- =component-ID in the FiveM-native SetPedComponentVariation
    Category = "T-Shirt", -- the item will be categorized inside this category
    CategoryIndex = 0,
    Name = "LSPD SWAT", -- the item will bear this name. If multiple options have the same name, you can choose different designs
    Male = {
      Ranked = false, -- defines if the clothing has rank insignia
      ClothList = { -- if "Ranked" is false only put in one option! If "Ranked" is set to true, you can fill this with multiple options.
        {93, 1, {{3,0,0},{8,15,0},{9,0,0}} },
      },
      RankList = {},
    },
    Female = {
      Ranked = false,
      ClothList = {
        {84, 1, {{3,14,0},{8,14,0},{9,0,0}} },
      },
      RankList = {},
    },

  },
}
