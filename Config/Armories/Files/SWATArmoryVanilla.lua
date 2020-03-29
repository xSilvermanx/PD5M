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
}
