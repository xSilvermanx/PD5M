SASPArmory = {
  {
    name = "Pistol",
    handle = "weapon_pistol50",
    table = "Weapon",
    ammo = 90,
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
}
