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
}
