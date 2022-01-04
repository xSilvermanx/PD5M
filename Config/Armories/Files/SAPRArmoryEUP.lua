SAPRArmory = {
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
    name = "Hunting Rifle",
    handle = "weapon_marksmanrifle_mk2",
    table = "Weapon",
    ammo = 30,
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
		{'COMPONENT_AT_SIGHTS', 'Holographic Sight'},
		{'COMPONENT_AT_AR_SUPP', 'Suppressor'},
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
    name = "Medium Vest",
    handle = "",
    table = "Equipment",
    ammo = 0,
    armor = {
      IsArmor = true,
      ArmorValue = 85,
      CompVars = {
        Male = {
          {9,18,2},
          {9,18,3},
          {9,18,4},
          {9,36,0},
        },
        Female = {
          {9,22,2},
          {9,22,3},
          {9,22,4},
          {9,49,0},
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
          {9,4,3},
        },
        Female = {
          {9,4,3},
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
