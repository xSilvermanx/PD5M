-- stations_cl.lua is the main config handler for every station in the game.
-- To remove a station remove the name of the respective station out of the below lists.
-- To add a station add a formatted lua-file in the folder-structure under 'Config/Stations', add the file to the __resource.lua and add the list-name to the appropriate lists.
-- To edit an existing station edit the related file in the mentioned folder-structure.

PolStations = {
  PolBeaverBush,
  PolDavis,
  PolDelPerro,
  PolLaMesa,
  PolMissionRow,
  PolPaleto,
  PolRockford,
  PolSandy,
  PolVespucci,
  PolVespucciBeach,
  PolVinewood,
}

MedStations = {
  MedCentralLS,
  MedEclipse,
  MedFiacre,
  MedMountZonah,
  MedPaleto,
  MedPillbox,
  MedPortola,
  MedSandy,
}

TowStations = {
  TowLSIA,
  TowBennys,
  TowBurton,
  TowDavis,
  TowHarmony,
  TowLaMesa,
  TowBeekers,
  TowVespucci,
  TowSandy,
  TowMirrorPark,
  TowVinewood,
}

OthStations = {
  OthBolingbroke,
  OthCoronerOffice,
}

-- do not edit anything below this point

-- Stations-init
Stations = {}
for i, Station in ipairs(PolStations) do
  table.insert(Stations, Station)
end

for i, Station in ipairs(MedStations) do
  table.insert(Stations, Station)
end

for i, Station in ipairs(TowStations) do
  table.insert(Stations, Station)
end

for i, Station in ipairs(OthStations) do
  table.insert(Stations, Station)
end

-- Handles-init
list_handles = {}
list_PolHandles = {}
list_MedHandles = {}
list_TowHandles = {}
list_OthHandles = {}

for i, Station in ipairs(PolStations) do
  for j, stationhandle in pairs(Station.handles) do
    local handlesave = stationhandle.handle
    list_PolHandles[handlesave] = {Station, handle = handlesave}
    list_handles[handlesave] = {Station, handle = handlesave}
  end
end

for i, Station in ipairs(MedStations) do
  for j, stationhandle in pairs(Station.handles) do
    local handlesave = stationhandle.handle
    list_MedHandles[handlesave] = {Station, handle = handlesave}
    list_handles[handlesave] = {Station, handle = handlesave}
  end
end

for i, Station in ipairs(TowStations) do
  for j, stationhandle in pairs(Station.handles) do
    local handlesave = stationhandle.handle
    list_TowHandles[handlesave] = {Station, handle = handlesave}
    list_handles[handlesave] = {Station, handle = handlesave}
  end
end

for i, Station in ipairs(OthStations) do
  for j, stationhandle in pairs(Station.handles) do
    local handlesave = stationhandle.handle
    list_OthHandles[handlesave] = {Station, handle = handlesave}
    list_handles[handlesave] = {Station, handle = handlesave}
  end
end

-- Arrest-coords init
list_arrest_coords = {}

for i, Station in ipairs(PolStations) do
  for j, arrestpoint in ipairs(Station.markers.arrest) do
    table.insert(list_arrest_coords, arrestpoint)
  end
end

for i, Station in ipairs(OthStations) do
  for j, arrestpoint in ipairs(Station.markers.arrest) do
    table.insert(list_arrest_coords, arrestpoint)
  end
end

-- Cloth-coords init
list_cloth_coords = {}
for i, Station in ipairs(Stations) do
  for j, clothpoint in ipairs(Station.markers.cloth) do
    table.insert(list_cloth_coords, clothpoint)
  end
end

-- Evidence-coords init
list_evidence_coords = {}
for i, Station in ipairs(PolStations) do
  for j, evidencepoint in ipairs(Station.markers.evidence) do
    table.insert(list_evidence_coords, evidencepoint)
  end
end

-- Heal-coords init
list_heal_coords = {}
for i, Station in ipairs(PolStations) do
  for j, healpoint in ipairs(Station.markers.heal) do
    table.insert(list_heal_coords, healpoint)
  end
end

for i, Station in ipairs(MedStations) do
  for j, healpoint in ipairs(Station.markers.heal) do
    table.insert(list_heal_coords, healpoint)
  end
end

for i, Station in ipairs(OthStations) do
  for j, healpoint in ipairs(Station.markers.heal) do
    table.insert(list_heal_coords, healpoint)
  end
end

-- Help-coords init
list_help_coords = {}
for i, Station in ipairs(Stations) do
  for j, helppoint in ipairs(Station.markers.help) do
    table.insert(list_help_coords, helppoint)
  end
end

-- Weap-coords init
list_weap_coords = {}
for i, Station in ipairs(PolStations) do
  for j, weappoint in ipairs(Station.markers.weap) do
    table.insert(list_weap_coords, weappoint)
  end
end

for i, Station in ipairs(OthStations) do
  for j, weappoint in ipairs(Station.markers.weap) do
    table.insert(list_weap_coords, weappoint)
  end
end

--Towtruck-spawns init
list_towtruck_spawns = {}
for i, Station in ipairs(TowStations) do
  for j, towspawnpoint in ipairs(Station.towspawn) do
    table.insert(list_towtruck_spawns, towspawnpoint)
  end
end

for i, Station in ipairs(OthStations) do
  for j, towspawnpoint in ipairs(Station.towspawn) do
    table.insert(list_towtruck_spawns, towspawnpoint)
  end
end

--Coroner-spawns init
list_coroner_spawns = {}
for i, Station in ipairs(PolStations) do
  for j, coronerspawnpoint in ipairs(Station.corspawn) do
    table.insert(list_coroner_spawns, coronerspawnpoint)
  end
end

for i, Station in ipairs(OthStations) do
  for j, coronerspawnpoint in ipairs(Station.corspawn) do
    table.insert(list_coroner_spawns, coronerspawnpoint)
  end
end

-- Blips init
list_blips = {}
for i, Station in ipairs(Stations) do
  for j, blippoint in ipairs(Station.blips) do
    table.insert(list_blips, blippoint)
  end
end

-- cars_coords init
list_cars_coords = {}
for i, Station in ipairs(Stations) do
  for j, garagepoint in ipairs(Station.markers.garage.marker) do
    table.insert(list_cars_coords, garagepoint)
  end
end

-- cars_spawns init
list_cars_spawns = {}
for i, Station in ipairs(Stations) do
  for j, garagepoint in ipairs(Station.markers.garage.spawnpoint) do
    table.insert(list_cars_spawns, garagepoint)
  end
end

-- tp_coords init
list_tp_coords = {}
for i, Station in ipairs(Stations) do
  for j, tppoint in pairs(Station.tps) do
    table.insert(list_tp_coords, tppoint)
  end
end

-- init of end-tp-lists
list_lspd_coords = {}
list_bcso_coords = {}
list_sasp_coords = {}
list_sapr_coords = {}
list_swat_coords = {}
list_dpos_coords = {}

LSPDStations = {}
BCSOStations = {}
SASPStations = {}
SAPRStations = {}
SWATStations = {}
DPOSStations = {}

for i, tppoint in ipairs(list_tp_coords) do
  if list_handles[tppoint.handle][1].handles[tppoint.handle].name == 'lspd' then
    table.insert(LSPDStations, list_handles[tppoint.handle][1].handles[tppoint.handle].shortname)
    tppoint.stationname = list_handles[tppoint.handle][1].handles[tppoint.handle].stationname
    table.insert(list_lspd_coords, tppoint)
  elseif list_handles[tppoint.handle][1].handles[tppoint.handle].name == 'bcso' then
    table.insert(BCSOStations, list_handles[tppoint.handle][1].handles[tppoint.handle].shortname)
    tppoint.stationname = list_handles[tppoint.handle][1].handles[tppoint.handle].stationname
    table.insert(list_bcso_coords, tppoint)
  elseif list_handles[tppoint.handle][1].handles[tppoint.handle].name == 'sasp' then
    table.insert(SASPStations, list_handles[tppoint.handle][1].handles[tppoint.handle].shortname)
    tppoint.stationname = list_handles[tppoint.handle][1].handles[tppoint.handle].stationname
    table.insert(list_sasp_coords, tppoint)
  elseif list_handles[tppoint.handle][1].handles[tppoint.handle].name == 'sapr' then
    table.insert(SAPRStations, list_handles[tppoint.handle][1].handles[tppoint.handle].shortname)
    tppoint.stationname = list_handles[tppoint.handle][1].handles[tppoint.handle].stationname
    table.insert(list_sapr_coords, tppoint)
  elseif list_handles[tppoint.handle][1].handles[tppoint.handle].name == 'swat' then
    table.insert(SWATStations, list_handles[tppoint.handle][1].handles[tppoint.handle].shortname)
    tppoint.stationname = list_handles[tppoint.handle][1].handles[tppoint.handle].stationname
    table.insert(list_swat_coords, tppoint)
  elseif list_handles[tppoint.handle][1].handles[tppoint.handle].name == 'dpos' then
    table.insert(DPOSStations, list_handles[tppoint.handle][1].handles[tppoint.handle].shortname)
    tppoint.stationname = list_handles[tppoint.handle][1].handles[tppoint.handle].stationname
    table.insert(list_dpos_coords, tppoint)
  end
end
