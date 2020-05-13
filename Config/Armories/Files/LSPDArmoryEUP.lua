LSPDArmory = {
  {
    name = "Pistol",
    handle = "weapon_pistol_mk2",
    table = "Weapon",
    ammo = 120,
    armor = {
      IsArmor = false,
      ArmorValue = 0,
      CompVars = {
        Male = {},
        Female = {},
      },
    },
    attachments = {
      HasAttachments = true,
      Components = {
        {'COMPONENT_AT_PI_FLSH_02', 'Flashlight'}
      },
    },
  },
  {
    name = "Submachine gun",
    handle = "weapon_smg",
    table = "Weapon",
    ammo = 300,
    armor = {
      IsArmor = false,
      ArmorValue = 0,
      CompVars = {
        Male = {},
        Female = {},
      },
    },
    attachments = {
      HasAttachments = false,
      Components = {
        {}
      },
    },
  },
  {
    name = "Shotgun",
    handle = "weapon_pumpshotgun",
    table = "Weapon",
    ammo = 80,
    armor = {
      IsArmor = false,
      ArmorValue = 0,
      CompVars = {
        Male = {},
        Female = {},
      },
    },
    attachments = {
      HasAttachments = true,
      Components = {
        {'COMPONENT_AT_AR_FLSH', 'Flashlight'}
      },
    },
  },
  {
    name = "Large Vest",
    handle = "",
    table = "Equipment",
    ammo = 0,
    armor = {
      IsArmor = true,
      ArmorValue = 100,
      CompVars = {
        Male = {
          {9,7,0},
          {9,15,0},
          {9,27,5},
          {9,9,2},
          {9,9,3},
        },
        Female = {
          {9,17,0},
          {9,29,5},
          {9,6,2},
          {9,6,3},

        },
      },
    },
    attachments = {
      HasAttachments = false,
      Components = {
        {}
      },
    },
  },
  {
    name = "Medium Vest",
    handle = "",
    table = "Equipment",
    ammo = 0,
    armor = {
      IsArmor = true,
      ArmorValue = 85,
      CompVars = {
        Male = {
          {9,12,3},
          {9,11,4},
          {9,25,9},
          {9,11,1},
        },
        Female = {
          {9,3,4},
          {9,12,1},
          {9,27,9},
          {9,8,1},
          {9,13,1},
          {9,9,1},
          {9,10,1},
          {9,3,1},
        },
      },
    },
    attachments = {
      HasAttachments = false,
      Components = {
        {}
      },
    },
  },
  {
    name = "Small Vest",
    handle = "",
    table = "Equipment",
    ammo = 0,
    armor = {
      IsArmor = true,
      ArmorValue = 70,
      CompVars = {
        Male = {
          {9,4,4},
          {9,4,0},
        },
        Female = {
          {9,4,4},
          {9,4,0},
        },
      },
    },
    attachments = {
      HasAttachments = false,
      Components = {
        {}
      },
    },
  },
}
