SWATArmory = {
  {
    name = "Pistol",
    handle = "weapon_heavypistol",
    table = "Weapon",
    ammo = 180,
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
      HasAttachments = true,
      Components = {
        {'COMPONENT_AT_AR_FLSH', 'Flashlight'},
        {'COMPONENT_AT_PI_SUPP', 'Suppressor'},
        {'COMPONENT_AT_SCOPE_MACRO_02', 'Scope'},
      },
    },
  },
  {
    name = "Carbine",
    handle = "weapon_carbinerifle",
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
      HasAttachments = true,
      Components = {
        {"COMPONENT_AT_AR_AFGRIP", 'Grip'},
        {"COMPONENT_AT_AR_FLSH", 'Flashlight'},
        {"COMPONENT_AT_SCOPE_MEDIUM", 'Scope'},
      },
    },
  },
  {
    name = "Special Carbine",
    handle = "weapon_specialcarbine",
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
      HasAttachments = true,
      Components = {
        {"COMPONENT_AT_AR_AFGRIP", 'Grip'},
        {"COMPONENT_AT_AR_FLSH", 'Flashlight'},
        {"COMPONENT_AT_SCOPE_MEDIUM", 'Scope'},
      },
    },
  },
  {
    name = "Shotgun",
    handle = "weapon_heavyshotgun",
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
      HasAttachments = true,
      Components = {
        {'COMPONENT_AT_AR_FLSH', 'Flashlight'},
        {'COMPONENT_AT_AR_AFGRIP', 'Grip'},
        {'COMPONENT_HEAVYSHOTGUN_CLIP_03', 'Drum Magazine'}
      },
    },
  },
  {
    name = "Sniper Rifle",
    handle = "weapon_sniperrifle",
    table = "Weapon",
    ammo = 100,
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
        {'COMPONENT_AT_SCOPE_MAX', 'Scope'}
      },
    },
  },
  {
    name = "Tear gas",
    handle = "weapon_smokegrenade",
    table = "Equipment",
    ammo = 5,
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
          {9,9,2},
          {9,27,5},
          {9,9,3},
        },
        Female = {
          {9,6,2},
          {9,29,5},
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
          {9,25,9},
          {9,11,1},
        },
        Female = {
          {9,12,1},
          {9,27,9},
          {9,13,1},
          {9,8,1},
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
          {9,4,0},
        },
        Female = {
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
