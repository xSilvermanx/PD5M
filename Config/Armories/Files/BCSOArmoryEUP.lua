BCSOArmory = {
  {
    name = "Pistol",
    handle = "weapon_combatpistol",
    table = "Weapon",
    ammo = 48,
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
    name = "Carbine",
    handle = "weapon_carbinerifle",
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
        {'COMPONENT_AT_AR_FLSH', 'Flashlight'}
      },
    },
  },
  {
    name = "Shotgun",
    handle = "weapon_pumpshotgun",
    table = "Weapon",
    ammo = 32,
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
          {9,5,3},
          {9,20,1},
          {9,20,4},
        },
        Female = {
          {9,3,3},
          {9,23,1},
          {9,23,4},
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
          {9,7,1},
          {9,18,1},
        },
        Female = {
          {9,7,1},
          {9,22,7},
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
          {9,4,1},
          {9,4,2},
        },
        Female = {
          {9,4,1},
          {9,4,2},
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
