SWATArmory = {
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
        {'COMPONENT_AT_PI_FLSH', 'Flashlight'},
		{'COMPONENT_AT_PI_SUPP', 'Suppressor'},
      },
    },
  },
  {
    name = "Carbine",
    handle = "weapon_carbinerifle_mk2",
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
        {"COMPONENT_AT_AR_AFGRIP_02", 'Grip'},
        {"COMPONENT_AT_AR_FLSH", 'Flashlight'},
		{"COMPONENT_AT_SCOPE_MEDIUM_MK2", 'Large Scope'},
        {"COMPONENT_AT_SCOPE_MACRO_MK2", 'Small Scope'},
		{"COMPONENT_AT_SIGHTS", 'Sights'},
		{'COMPONENT_AT_AR_SUPP', 'Suppressor'},
      },
    },
  },
  {
    name = "Special Carbine",
    handle = "weapon_specialcarbine_mk2",
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
        {"COMPONENT_AT_AR_AFGRIP_02", 'Grip'},
        {"COMPONENT_AT_AR_FLSH", 'Flashlight'},
		{"COMPONENT_AT_SCOPE_MEDIUM_MK2", 'Large Scope'},
        {"COMPONENT_AT_SCOPE_MACRO_MK2", 'Small Scope'},
		{"COMPONENT_AT_SIGHTS", 'Sights'},
		{'COMPONENT_AT_AR_SUPP', 'Suppressor'},
      },
    },
  },
  {
    name = "Shotgun",
    handle = "weapon_pumpshotgun_mk2",
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
        {'COMPONENT_AT_AR_FLSH', 'Flashlight'},
        {'COMPONENT_AT_AR_AFGRIP', 'Grip'},
      },
    },
  },
  {
    name = "Sniper Rifle",
    handle = "weapon_sniperrifle",
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
        {'COMPONENT_AT_SCOPE_MAX', 'Scope'}
      },
    },
  },
  {
    name = "Tear gas",
    handle = "weapon_smokegrenade",
    table = "Equipment",
    ammo = 25,
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
