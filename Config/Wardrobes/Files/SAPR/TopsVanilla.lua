SAPRTops = {
  {
    Type = 0, -- 0: component, 1: prop
    ComponentID = 11, -- =component-ID in the FiveM-native SetPedComponentVariation
    Category = "Uniform", -- the item will be categorized inside this category
    CategoryIndex = 0,
    Name = "Medium Sleeve", -- the item will bear this name. If multiple options have the same name, you can choose different designs
    Male = {
      Ranked = false, -- defines if the clothing has rank insignia
      ClothList = { -- if "Ranked" is false only put in one option! If "Ranked" is set to true, you can fill this with multiple options.
        {26, 1, {{3,11,0},{8,15,0},{9,0,0}} },
      },
      RankList = {},
    },
    Female = {
      Ranked = false,
      ClothList = {
        {9, 3, {{3,9,0},{8,14,0},{9,0,0}} },
      },
      RankList = {

      },
    },

  },
}
