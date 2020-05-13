BCSOArmory = {
  {
    name = "Pistol",
    handle = "weapon_pistol",
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
        {'COMPONENT_AT_PI_FLSH', 'Flashlight'}
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
    name = "Flaregun",
    handle = "weapon_flaregun",
    table = "Weapon",
    ammo = 20,
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
    name = "Large Vest",
    handle = "",
    table = "Equipment",
    ammo = 0,
    armor = {
      IsArmor = true,
      ArmorValue = 100,
      CompVars = {
        Male = {
          {9,7,1},
          {9,27,0},
          {9,27,1},
          {9,15,2},
          {9,27,5},
          {9,9,0},
          {9,9,2},
          {9,9,3},
          {9,9,1},
          {9,16,0},
        },
        Female = {
          {9,29,0},
          {9,29,1},
          {9,17,2},
          {9,17,1},
          {9,29,5},
          {9,6,0},
          {9,6,2},
          {9,6,3},
          {9,6,1},
          {9,18,0},
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
          {9,12,1},
          {9,11,2},
          {9,25,9},
          {9,25,7},
          {9,11,1},
        },
        Female = {
          {9,3,2},
          {9,12,2},
          {9,12,1},
          {9,27,9},
          {9,27,7},
          {9,13,2},
          {9,8,2},
          {9,9,2},
          {9,10,2},
          {9,13,1},
          {9,3,1},
          {9,8,1},
          {9,9,1},
          {9,10,1},
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
          {9,4,2},
          {9,4,0},
        },
        Female = {
          {9,4,2},
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
