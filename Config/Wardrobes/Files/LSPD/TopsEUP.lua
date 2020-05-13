LSPDTops = {
  {
    Type = 0, -- 0: component, 1: prop
    ComponentID = 11, -- =component-ID in the FiveM-native SetPedComponentVariation
    Category = "Uniform", -- the item will be categorized inside this category
    CategoryIndex = 0,
    Name = "Medium Sleeve", -- the item will bear this name. If multiple options have the same name, you can choose different designs
    Male = {
      Ranked = true, -- defines if the clothing has rank insignia
      ClothList = { -- if "Ranked" is false only put in one option! If "Ranked" is set to true, you can fill this with multiple options.
        {149, 0, {{3,0,0},{8,15,0},{9,0,0}} },
        {149, 9, {{3,0,0},{8,15,0},{9,0,0}} },
        {149, 1, {{3,0,0},{8,15,0},{9,0,0}} },
        {149, 2, {{3,0,0},{8,15,0},{9,0,0}} },
        {149, 3, {{3,0,0},{8,15,0},{9,0,0}} },
        {149, 4, {{3,0,0},{8,15,0},{9,0,0}} },
        {149, 5, {{3,0,0},{8,15,0},{9,0,0}} },
        {149, 6, {{3,0,0},{8,15,0},{9,0,0}} },
        {149, 7, {{3,0,0},{8,15,0},{9,0,0}} },
      },
      RankList = {
        1,1,1,1,2,2,2,3,3,4,5,6,7,8,9
      },
    },
    Female = {
      Ranked = true, -- defines if the clothing has rank insignia
      ClothList = { -- if "Ranked" is false only put in one option! If "Ranked" is set to true, you can fill this with multiple options.
        {146, 0, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 9, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 1, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 2, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 3, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 4, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 5, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 6, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 7, {{3,14,0},{8,14,0},{9,0,0}} },
      },
      RankList = {
        1,1,1,1,2,2,2,3,3,4,5,6,7,8,9
      },
    },

  },
  {
    Type = 0,
    ComponentID = 11,
    Category = "Uniform",
    CategoryIndex = 0,
    Name = "Medium Sleeve K-9",
    Male = {
      Ranked = true,
      ClothList = {
        {102, 0, {{3,0,0},{8,15,0},{9,0,0}} },
        {102, 3, {{3,0,0},{8,15,0},{9,0,0}} },
      },
      RankList = {
        1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,
      },
    },
    Female = {
      Ranked = true,
      ClothList = {
        {93, 0, {{3,0,0},{8,15,0},{9,0,0}} },
        {93, 3, {{3,0,0},{8,15,0},{9,0,0}} },
      },
      RankList = {
        1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,
      },
    },
  },
  {
    Type = 0,
    ComponentID = 11,
    Category = "Uniform",
    CategoryIndex = 0,
    Name = "Long Sleeve",
    Male = {
      Ranked = true,
      RankList = {1,1,1,1,2,2,2,3,3,4,5,6,7,8,9},
      ClothList = {
        {143,0,{{3,4,0}, {8,15,0}, {9,0,0}} },
        {143,9,{{3,4,0}, {8,15,0}, {9,0,0}} },
        {143,1,{{3,4,0}, {8,15,0}, {9,0,0}} },
        {143,2,{{3,4,0}, {8,15,0}, {9,0,0}} },
        {143,3,{{3,4,0}, {8,15,0}, {9,0,0}} },
        {143,4,{{3,4,0}, {8,15,0}, {9,0,0}} },
        {143,5,{{3,4,0}, {8,15,0}, {9,0,0}} },
        {143,6,{{3,4,0}, {8,15,0}, {9,0,0}} },
        {143,7,{{3,4,0}, {8,15,0}, {9,0,0}} },
      }
    },
    Female = {
      Ranked = true, -- defines if the clothing has rank insignia
      ClothList = { -- if "Ranked" is false only put in one option! If "Ranked" is set to true, you can fill this with multiple options.
        {146, 0, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 9, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 1, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 2, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 3, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 4, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 5, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 6, {{3,14,0},{8,14,0},{9,0,0}} },
        {146, 7, {{3,14,0},{8,14,0},{9,0,0}} },
      },
      RankList = {
        1,1,1,1,2,2,2,3,3,4,5,6,7,8,9
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
        {111,0,{{3,4,0}, {8,15,0}, {9,0,0}} },
      }
    },
    Female = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {103,0,{{3,3,0}, {8,14,0}, {9,0,0}} },
      }
    },
  },
  {
    Type = 0,
    ComponentID = 11,
    Category = "T-Shirt",
    CategoryIndex = 0,
    Name = "Standard",
    Male = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {93,0,{{3,0,0}, {8,15,0}, {9,0,0}} },
      }
    },
    Female = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {84,0,{{3,14,0}, {8,14,0}, {9,0,0}} },
      }
    },
  },
  {
    Type = 0,
    ComponentID = 11,
    Category = "T-Shirt",
    CategoryIndex = 0,
    Name = "Bicycle Unit",
    Male = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {93,2,{{3,0,0}, {8,15,0}, {9,0,0}} },
      }
    },
    Female = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {84,2,{{3,14,0}, {8,14,0}, {9,0,0}} },
      }
    },
  },
  {
    Type = 0,
    ComponentID = 11,
    Category = "Jacket T1",
    CategoryIndex = 1,
    Name = "Blue",
    Male = {
      Ranked = false,
      ClothList = {
        {35, 1, {{3,4,0},{8,72,0},{9,0,0}} }
      },
    },
    Female = {
      Ranked = false,
      ClothList = {
        {172,0, {{3,3,0},{8,67,0},{9,0,0}} },
      },
      RankList = {

      },
    }
  },
  {
    Type = 0,
    ComponentID = 11,
    Category = "Jacket T1",
    CategoryIndex = 1,
    Name = "Blue",
    Male = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {36,1,{{3,4,0}, {8,72,0},{9,0,0}} },
      }
    },
    Female = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {172,1, {{3,3,0},{8,67,0},{9,0,0}} },
      }
    },
  },
  {
    Type = 0,
    ComponentID = 11,
    Category = "Jacket T1",
    CategoryIndex = 1,
    Name = "Black",
    Male = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {39,0,{{3,4,0}, {8,72,0}, {9,0,0}} },
      }
    },
    Female = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {172,0, {{3,3,0},{8,67,0},{9,0,0}} },
      }
    },
  },
  {
    Type = 0,
    ComponentID = 11,
    Category = "Jacket T1",
    CategoryIndex = 1,
    Name = "Black",
    Male = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {39,1,{{3,4,0}, {8,72,0}, {9,0,0}} },
      }
    },
    Female = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {172,1, {{3,3,0},{8,67,0},{9,0,0}} },
      }
    },
  },
  {
    Type = 0,
    ComponentID = 11,
    Category = "Jacket T5",
    CategoryIndex = 5,
    Name = "Blue",
    Male = {
      Ranked = true,
      RankList = {1,1,1,2,6,7,8,4,5,1,1,1,1,1,1},
      ClothList = {
        {154,0,{{3,4,0}, {8,72,0}, {9,0,0}} },
        {154,1,{{3,4,0}, {8,72,0}, {9,0,0}} },
        {154,2,{{3,4,0}, {8,72,0}, {9,0,0}} },
        {154,3,{{3,4,0}, {8,72,0}, {9,0,0}} },
        {154,4,{{3,4,0}, {8,72,0}, {9,0,0}} },
        {154,5,{{3,4,0}, {8,72,0}, {9,0,0}} },
        {154,6,{{3,4,0}, {8,72,0}, {9,0,0}} },
        {154,7,{{3,4,0}, {8,72,0}, {9,0,0}} },
      }
    },
    Female = {
      Ranked = true,
      RankList = {1,1,1,2,6,7,8,4,5,1,1,1,1,1,1},
      ClothList = {
        {151,0,{{3,3,0}, {8,67,0}, {9,0,0}} },
        {151,1,{{3,3,0}, {8,67,0}, {9,0,0}} },
        {151,2,{{3,3,0}, {8,67,0}, {9,0,0}} },
        {151,3,{{3,3,0}, {8,67,0}, {9,0,0}} },
        {151,4,{{3,3,0}, {8,67,0}, {9,0,0}} },
        {151,5,{{3,3,0}, {8,67,0}, {9,0,0}} },
        {151,6,{{3,3,0}, {8,67,0}, {9,0,0}} },
        {151,7,{{3,3,0}, {8,67,0}, {9,0,0}} },
      }
    },
  },
  {
    Type = 0,
    ComponentID = 8,
    Category = "Undershirt",
    CategoryIndex = 1,
    Name = "Shirt",
    Male = {
      Ranked = true,
      RankList = {1,1,1,1,1,1,1,1,1,2,3,4,5,6,7},
      ClothList = {
        {51,0,{} },
        {51,1,{} },
        {51,2,{} },
        {51,3,{} },
        {51,4,{} },
        {51,5,{} },
        {51,6,{} },
      }
    },
    Female = {
      Ranked = true,
      RankList = {1,1,1,1,1,1,1,1,1,2,3,4,5,6,7},
      ClothList = {
        {53,0,{} },
        {53,1,{} },
        {53,2,{} },
        {53,3,{} },
        {53,4,{} },
        {53,5,{} },
        {53,6,{} },
      }
    },
  },
  {
    Type = 0,
    ComponentID = 8,
    Category = "Undershirt",
    CategoryIndex = 1,
    Name = "Shirt + Tie",
    Male = {
      Ranked = true,
      RankList = {1,1,1,1,1,1,1,1,1,2,3,4,5,6,7},
      ClothList = {
        {52,0,{} },
        {52,1,{} },
        {52,2,{} },
        {52,3,{} },
        {52,4,{} },
        {52,5,{} },
        {52,6,{} },
      }
    },
    Female = {
      Ranked = true,
      RankList = {1,1,1,1,1,1,1,1,1,2,3,4,5,6,7},
      ClothList = {
        {53,0,{} },
        {53,1,{} },
        {53,2,{} },
        {53,3,{} },
        {53,4,{} },
        {53,5,{} },
        {53,6,{} },
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
        {72,0,{} },
      }
    },
    Female = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {67,0,{} },
      }
    },
  },
  {
    Type = 0,
    ComponentID = 8,
    Category = "Undershirt",
    CategoryIndex = 1,
    Name = "Shirt in front of Pullover",
    Male = {
      Ranked = true,
      RankList = {1,1,1,1,1,1,1,1,1,2,3,4,5,6,7},
      ClothList = {
        {92,16,{} },
        {92,17,{} },
        {92,18,{} },
        {92,19,{} },
        {92,20,{} },
        {92,21,{} },
        {92,22,{} },
      }
    },
    Female = {
      Ranked = true,
      RankList = {1,1,1,1,1,1,1,1,1,2,3,4,5,6,7},
      ClothList = {
        {103,16,{} },
        {103,17,{} },
        {103,18,{} },
        {103,19,{} },
        {103,20,{} },
        {103,21,{} },
        {103,22,{} },
      }
    },
  },
  {
    Type = 0,
    ComponentID = 8,
    Category = "Belt + Chest",
    CategoryIndex = 3,
    Name = "Radio + Badge",
    Male = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {67,0,{} },
      }
    },
    Female = {
      Ranked = false,
      RankList = {},
      ClothList = {
        {49,0,{} },
      }
    },
  },
}
