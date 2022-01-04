-- Config handler for Armory-data. Do not edit anything in here.

ListLSPDArmory = {}
ListBCSOArmory = {}
ListSASPArmory = {}
ListSAPRArmory = {}
ListSWATArmory = {}
ListFIREArmory = {}
ListDPOSArmory = {}

ArmoryUnderarmorVestDefinition = {
  name = "Underarmor Vest",
  handle = "",
  table = "Equipment",
  ammo = 0,
  armor = {
    IsArmor = true,
    ArmorValue = 55,
    CompVars = {
      Male = {
        {9, 0, 0},
        {9, 0, 0},
      },
      Female = {
        {9, 0, 0},
        {9, 0, 0},
      },
    },
  },
  attachments = {
    HasAttachments = false,
    Components = {
      {}
    },
  },
}



for i, option in ipairs(GENArmory) do
  table.insert(LSPDArmory, option)
  table.insert(BCSOArmory, option)
  table.insert(SASPArmory, option)
  table.insert(SAPRArmory, option)
  table.insert(SWATArmory, option)
end

-- LSPD Tables init
local ListLSPDEquipment = {
  data = {},
  names = {},
  handles = {},
  ammo = {},
  IsArmor = {},
  HasAttachments = {},
}
local ListLSPDWeapons = {
  data = {},
  names = {},
  handles = {},
  ammo = {},
  IsArmor = {},
  HasAttachments = {},
}

for i, option in ipairs(LSPDArmory) do
  if option.table == 'Equipment' then
    table.insert(ListLSPDEquipment.data, option)
  elseif option.table == 'Weapon' then
    table.insert(ListLSPDWeapons.data, option)
  end
end

table.insert(ListLSPDArmory, ListLSPDEquipment)
table.insert(ListLSPDArmory, ListLSPDWeapons)

-- BCSO Tables init
local ListBCSOEquipment = {
  data = {},
  names = {},
  handles = {},
  ammo = {},
  IsArmor = {},
  HasAttachments = {},
}
local ListBCSOWeapons = {
  data = {},
  names = {},
  handles = {},
  ammo = {},
  IsArmor = {},
  HasAttachments = {},
}

for i, option in ipairs(BCSOArmory) do
  if option.table == 'Equipment' then
    table.insert(ListBCSOEquipment.data, option)
  elseif option.table == 'Weapon' then
    table.insert(ListBCSOWeapons.data, option)
  end
end

table.insert(ListBCSOArmory, ListBCSOEquipment)
table.insert(ListBCSOArmory, ListBCSOWeapons)

-- SASP Tables init
local ListSASPEquipment = {
  data = {},
  names = {},
  handles = {},
  ammo = {},
  IsArmor = {},
  HasAttachments = {},
}
local ListSASPWeapons = {
  data = {},
  names = {},
  handles = {},
  ammo = {},
  IsArmor = {},
  HasAttachments = {},
}

for i, option in ipairs(SASPArmory) do
  if option.table == 'Equipment' then
    table.insert(ListSASPEquipment.data, option)
  elseif option.table == 'Weapon' then
    table.insert(ListSASPWeapons.data, option)
  end
end

table.insert(ListSASPArmory, ListSASPEquipment)
table.insert(ListSASPArmory, ListSASPWeapons)

-- SAPR Tables init
local ListSAPREquipment = {
  data = {},
  names = {},
  handles = {},
  ammo = {},
  IsArmor = {},
  HasAttachments = {},
}
local ListSAPRWeapons = {
  data = {},
  names = {},
  handles = {},
  ammo = {},
  IsArmor = {},
  HasAttachments = {},
}

for i, option in ipairs(SAPRArmory) do
  if option.table == 'Equipment' then
    table.insert(ListSAPREquipment.data, option)
  elseif option.table == 'Weapon' then
    table.insert(ListSAPRWeapons.data, option)
  end
end

table.insert(ListSAPRArmory, ListSAPREquipment)
table.insert(ListSAPRArmory, ListSAPRWeapons)

-- SWAT Tables init
local ListSWATEquipment = {
  data = {},
  names = {},
  handles = {},
  ammo = {},
  IsArmor = {},
  HasAttachments = {},
}
local ListSWATWeapons = {
  data = {},
  names = {},
  handles = {},
  ammo = {},
  IsArmor = {},
  HasAttachments = {},
}

for i, option in ipairs(SWATArmory) do
  if option.table == 'Equipment' then
    table.insert(ListSWATEquipment.data, option)
  elseif option.table == 'Weapon' then
    table.insert(ListSWATWeapons.data, option)
  end
end

table.insert(ListSWATArmory, ListSWATEquipment)
table.insert(ListSWATArmory, ListSWATWeapons)

-- FIRE Tables init
local ListFIREEquipment = {
  data = {},
  names = {},
  handles = {},
  ammo = {},
  IsArmor = {},
  HasAttachments = {},
}
local ListFIREWeapons = {
  data = {},
  names = {},
  handles = {},
  ammo = {},
  IsArmor = {},
  HasAttachments = {},
}

for i, option in ipairs(FIREArmory) do
  if option.table == 'Equipment' then
    table.insert(ListFIREEquipment.data, option)
  elseif option.table == 'Weapon' then
    table.insert(ListFIREWeapons.data, option)
  end
end

table.insert(ListFIREArmory, ListFIREEquipment)
table.insert(ListFIREArmory, ListFIREWeapons)

-- DPOS Tables init
local ListDPOSEquipment = {
  data = {},
  names = {},
  handles = {},
  ammo = {},
  IsArmor = {},
  HasAttachments = {},
}
local ListDPOSWeapons = {
  data = {},
  names = {},
  handles = {},
  ammo = {},
  IsArmor = {},
  HasAttachments = {},
}

for i, option in ipairs(DPOSArmory) do
  if option.table == 'Equipment' then
    table.insert(ListDPOSEquipment.data, option)
  elseif option.table == 'Weapon' then
    table.insert(ListDPOSWeapons.data, option)
  end
end

table.insert(ListDPOSArmory, ListDPOSEquipment)
table.insert(ListDPOSArmory, ListDPOSWeapons)
