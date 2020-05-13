LSPDTops = {
  {
    Type = 0, -- 0: component, 1: prop
    ComponentID = 11, -- =component-ID in the FiveM-native SetPedComponentVariation
    Category = "Uniform", -- the item will be categorized inside this category
    CategoryIndex = 0,
    Name = "Medium Sleeve", -- the item will bear this name. If multiple options have the same name, you can choose different designs
    Male = {
      Ranked = false, -- defines if the clothing has rank insignia
      ClothList = { -- if "Ranked" is false only put in one option! If "Ranked" is set to true, you can fill this with multiple options.
        {55, 0, {{3,0,0},{8,15,0},{9,0,0}} },
      },
      RankList = {

      },
    },
    Female = {
      Ranked = false, -- defines if the clothing has rank insignia
      ClothList = { -- if "Ranked" is false only put in one option! If "Ranked" is set to true, you can fill this with multiple options.
        {48, 0, {{3,14,0},{8,14,0},{9,0,0}} },
      },
      RankList = {

      },
    },

  },
  {
    Type = 0,
    ComponentID = 11,
    Category = "Pullover",
    CategoryIndex = 0,
    Name = "Black",
    Male = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {111,3,{{3,4,0}, {8,15,0}, {9,0,0}} },
      }
    },
    Female = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {103,3,{{3,3,0}, {8,14,0}, {9,0,0}} },
      }
    },
  },
  {
    Type = 0,
    ComponentID = 8,
    Category = "Undershirt",
    CategoryIndex = 1,
    Name = "Pullover",
    Male = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {72,3,{} },
      }
    },
    Female = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {67,3,{} },
      }
    },
  },
}
