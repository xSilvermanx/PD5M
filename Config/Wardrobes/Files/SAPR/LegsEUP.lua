SAPRLegs = {
  {
    Type = 0, -- 0: component, 1: prop
    ComponentID = 4, -- =component-ID in the FiveM-native SetPedComponentVariation
    Category = "Uniform", -- the item will be categorized inside this category
    CategoryIndex = 2,
    Name = "Standard Issue", -- the item will bear this name. If multiple options have the same name, you can choose different designs
    Male = {
      Ranked = false, -- defines if the clothing has rank insignia
      ClothList = { -- if "Ranked" is false only put in one option! If "Ranked" is set to true, you can fill this with multiple options.
        {101,1, {{6,25,0}} },
      },
      RankList = {},
    },
    Female = {
      Ranked = false,
      ClothList = {
        {105, 1, {{6,25,0}} },
      },
      RankList = {

      },
    },

  },
  {
    Type = 0, -- 0: component, 1: prop
    ComponentID = 4, -- =component-ID in the FiveM-native SetPedComponentVariation
    Category = "Uniform", -- the item will be categorized inside this category
    CategoryIndex = 2,
    Name = "Search and Rescue", -- the item will bear this name. If multiple options have the same name, you can choose different designs
    Male = {
      Ranked = false, -- defines if the clothing has rank insignia
      ClothList = { -- if "Ranked" is false only put in one option! If "Ranked" is set to true, you can fill this with multiple options.
        {44,0, {{6,25,0}} },
      },
      RankList = {},
    },
    Female = {
      Ranked = false,
      ClothList = {
        {46, 0, {{6,25,0}} },
      },
      RankList = {

      },
    },

  },
}
