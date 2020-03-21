-- config variables

-- ped variables
NormalDrivingBehavior = 786603 -- sets the standard driving style for peds. Refer to https://vespura.com/drivingstyle/ for more info.

-- general variables
ActivateBlipsOnMap = true -- shows the department-blips, the hospital-blips and the tow-blips set by PD5M.
ActivateCrosshair = true -- activates the F3-function to display a crosshair in the middle of the screen.

-- marker variables
ActivateArrestMarkers = true -- activates the arrest markers. Should stay activated.
ActivateClothMarkers = true -- activates the wardrobes.
ActivateHealMarkers = true -- activates the heal-markers at the hospitals.
ActivateLSPDGarage = true -- activates the LSPD-garage.
ActivateBCSOGarage = true -- activates the BCSO-garage.
ActivateSAPRGarage = true -- activates the SAPR-garage.
ActivateSASPGarage = true -- activates the SASP-garage.
ActivateSWATGarage = true -- activates the SWAT-garage.
ActivateDPOSGarage = true -- activates the DPOS-garage.
ActivateHeliPads = true -- activates the Helipads.
ActivateWeaponMarkers = true -- activates the armory.
ActivateEvidenceMarkers = true -- activates the evidence markers. Should stay activated.
ActivateHelpMarkers = true -- activates the help markers.

-- service variables
TowTruckDrivers = {"cs_floyd", "mp_f_bennymech_01", "mp_m_waremech_01", "s_m_m_autoshop_02", "s_m_m_dockwork_01", "s_m_m_gardener_01", "s_m_y_construct_02", "s_m_y_garbage", "s_m_y_winclean_01", "s_m_y_xmech_01"}
CoronerDrivers = {"csb_cop", "csb_prolsec", "s_f_y_cop_01", "s_f_y_ranger_01", "s_f_y_sheriff_01", "s_f_y_scrubs_01", "s_m_y_autopsy_01", "s_m_y_cop_01", "s_m_y_hwaycop_01", "s_m_y_ranger_01", "s_m_y_sheriff_01"}
CoronerVehicles = {"policet"}

-- PD-Maps
SLBMissionRow = false --whether the Community Mission Row PD MLO by SLB2k11 is activated
BamboozledSandyPD = false --whether the Sandy Sheriff Office Extension MLO by Bamboozled is activated
matusPDPaleto = false --whether the Paleto Bay Sheriff's Office Extended MLO by matus77 is activated
SmokeyBeaverBushPR = false --whether the Beaver Bush Park Ranger Station MLO by Smokey7 is activated

-- Hospital-Maps
beekSandyMC = false -- whether the Sandy Shores Hospital MLO by grzybeek is activated
BrownPaletoMC = false -- whether the Paleto Bay Medical Center MLO by MrBrown1999 is activated

-- Vehicle-Mods
LSPDMegaPackT0y = false -- whether the Los Santos Police Department Mega Pack ELS by t0y is activated
BCSOMegaPackBradM = false -- whether the Blaine County Sheriff Office Mega Pack ELS by BradM is activated
CHFThehurk = false -- whether the California Highway Patrol Mega Pack ELS by Thehurk is activated


-- various config data - only edit this if you are comfortable with what you are doing!

-- coordinate-lists
list_arrest_coords = {
	{x=1690.49, y=2592.45, z=45.74}, -- Bolingbroke Arrest Point
}

list_cloth_coords = { -- z-1
	{x=450.72, y=-992.65, z=29.69}, --Mission Row
	{x=823.98, y=-1300.09, z=26.11}, --LaMesa
	{x=354.75, y=-1589.48, z=28.29}, --Davis
	{x=641.09, y=6.89, z=81.79}, --Vinewood
	{x=-556.78, y=-130.51, z=37.04}, --Rockford
	{x=-1105.91, y=-850.1, z=18.32}, --Vespucci
	{x=-1636.35, y=-1014.65, z=12.13}, --Del Perro Pier
	{x=-1311.36, y=-1522.9, z=3.42}, --Vespucci Beach
	{x=403.76, y=-1624.84, z=28.29}, -- DPOS Davis
	{x=-207.67, y=-1339.65, z=33.89}, -- Bennys
	{x=-1148.48, y=-1999.79, z=12.18}, -- DPOS Airport
	{x=-1047.57, y=-841.53, z=4.04}, --DPOS Vespucci
	{x=-346.63, y=-133.47, z=38.01}, --DPOS Burton
	{x=726.51, y=-1067.12, z=27.31}, --DPOS La Mesa
	{x=100.32, y=6618.38, z=31.47}, --DPOS Paleto
	{x=1187.34, y=2639.68, z=37.44}, --DPOS Harmony
}

list_heal_coords = { -- z-0.5
	{x=-874.4, y=-308.14, z=39.06}, --Portola Trinity MC 1
	{x=-449.38, y=-347.75, z=34.0}, --Mount Zonah MC 1
	{x=-447.87, y=-334.86, z=34.0}, --Mount Zonah MC 2
	{x=-496.51, y=-328.69, z=34.0}, --Mount Zonah MC 3
	{x=-498.37, y=-341.77, z=34.0}, --Mount Zonah MC 4
	{x=-482.99, y=-342.22, z=41.72}, --Mount Zonah MC 5
	{x=-464.48, y=-343.72, z=41.72}, --Mount Zonah MC 6
	{x=-436.04, y=-341.73, z=41.72}, --Mount Zonah MC 7
	{x=-461.45, y=-280.54, z=41.72}, --Mount Zonah MC 8
	{x=-462.76, y=-331.93, z=41.72}, --Mount Zonah MC 9
	{x=-481.49, y=-329.93, z=41.72}, --Mount Zonah MC 10
	{x=-510.46, y=-297.66, z=41.72}, --Mount Zonah MC 11
	{x=-444.13, y=-358.91, z=33.59}, --Mount Zonah MC 12
	{x=-507.39, y=-351.13, z=34.7}, --Mount Zonah MC 13
	{x=-675.79, y=312.96, z=82.58}, --Eclipse Medical Tower 1
	{x=1122.5, y=-1522.34, z=34.34}, --St. Fiacre Hospital 1
	{x=1151.14, y=-1529.44, z=34.87}, --St. Fiacre Hospital 2
	{x=1152.74, y=-1536.2, z=38.82}, --St. Fiacre Hospital 3
	{x=1154.55, y=-1568.82, z=38.84}, --St. Fiacre Hospital 4
	{x=391.95, y=-1434.36, z=28.95}, --Central LS MC 1
	{x=307.12, y=-1433.8, z=29.39}, --Central LS MC 2
	{x=295.3, y=-1447.62, z=28.47}, --Central LS MC 3
	{x=342.14, y=-1397.59, z=32.01}, --Central LS MC 4
	{x=356.03, y=-596.58, z=28.28}, --Pillbox Hill MC 1
	{x=360.81, y=-585.23, z=28.33}, --Pillbox Hill MC 2
	{x=298.0, y=-584.36, z=42.76}, --Pillbox Hill MC 3
}

list_cars_city_coords = { -- z+ 0.2
	{x=458.33, y=-1008.56, z=28.48, handle='MissionRowVeh'},
	{x=-1631.45, y=-1014.76, z=13.32, handle='DelPerroVeh'},
	{x=-1313.12, y=-1527.43, z=4.62, handle='VespucciBeachVeh'},
	{x=-1078.67, y=-856.83, z=5.24, handle='VespucciVeh'},
	{x=370.07, y=-1608.34, z=29.49, handle='DavisVeh'},
	{x=830.42, y=-1311.42, z=28.34, handle='LaMesaVeh'},
	{x=-566.39, y=-133.16, z=38.17, handle='RockfordVeh'},
	{x=535.38, y=-21.96, z=70.83, handle='VinewoodVeh'},
}

list_cars_bcso_coords = { -- z+0.2
	{x=-459.27, y=6016.01, z=31.69, handle='PaletoVeh'},
	{x=1852.82, y=3680.83, z=34.47, handle='SandyShoresVeh'},
}

list_cars_sapr_coords = { -- z+0.2
	{x=379.91, y=790.82, z=187.82, handle='BeaverBush'},
}

list_cars_sasp_coords = { -- z+0.2
	{x=818.09, y=-1374.61, z=26.51, handle='LaMesaSASP'},
	{x=-455.5, y=6019.85, z=31.69, handle='PaletoSASP'},
}

list_cars_swat_coords = { -- z+0.2
	{x=849.76, y=-1284.08, z=28.2, handle='LaMesaSWAT'},
	{x=377.61, y=-1621.98, z=29.49, handle='DavisSWAT'},
	{x=-1113.26, y=-849.27, z=13.65, handle='VespucciSWAT'},
	{x=-576.12, y=-139.85, z=37.11, handle='RockfordSWAT'},
	{x=-458.85, y=6034.11, z=31.54, handle='PaletoSWAT'},
}

list_cars_dpos_coords = { -- z+0.2
	{x=409.41, y=-1623.28, z=29.49, handle='DavisDPOS'},
	{x=105.25, y=6613.41, z=32.6, handle='PaletoDPOS'},
	{x=-1142.16, y=-1992.98, z=13.36, handle='LSCLSIA'},
	{x=-201.48, y=-1308.79, z=31.49, handle='Bennys'},
	{x=721.66, y=-1083.69, z=22.42, handle='LSCLaMesa'},
	{x=-355.12, y=-127.87, z=39.63, handle='LSCCentral'},
	{x=1191.91, y=2644.77, z=38.05, handle='LSCHarmony'},
	{x=-1057.31, y=-841.56, z=5.24, handle='VespucciDPOS'},
}

list_cars_heli_coords = { -- z+0.2
	{x=460.29, y=-981.14, z=43.89, handle='MissionRowHeli'},
	{x=375.01, y=-1602.32, z=37.15, handle='DavisHeli'},
	{x=-1104.65, y=-831.24, z=37.88, handle='VespucciHeli'},
	{x=572.9, y=6.36, z=103.43, handle='VinewoodHeli'},
	{x=-457.64, y=5990.87, z=31.5, handle='PaletoHeli'},
}

list_weap_coords = { -- z+ 0.2
	{x=452.17, y=-980.26, z=30.69}, --Mission Row
	{x=826.67, y=-1290.13, z=28.24}, --La Mesa
	{x=360.53, y=-1584.36, z=29.29}, --Davis
	{x=-1108.69, y=-845.55, z=19.32}, --Vespucci
	{x=-1626.07, y=-1019.26, z=13.16}, --Del Perro Pier
	{x=-1317.87, y=-1529.29, z=4.42}, --Vespucci Beach
	{x=-561.31, y=-132.54, z=38.03}, --Rockford
	{x=639.82, y=0.9, z=82.79}, --Vinewood
}

list_evidence_coords = {}

list_tut_coords = {
	{x=435.18, y=-974.71, z=30.71}
}

-- vehicle spawn-coordinate lists
list_cars_city_spawns = { -- z + 1
	{x=454.36 , y=-1020.67 , z=29.32 , angle=92.07, handle='MissionRowVeh'},
	{x=-1624.31, y=-1014.12, z=14.15, angle=323.73, handle='DelPerroVeh'},
	{x=-1306.61, y=-1527.67, z=5.35, angle=248.32, handle='VespucciBeachVeh'},
	{x=-1073.02, y=-854.92, z=5.87, angle=215.99, handle='VespucciVeh'},
	{x=377.89, y=-1613.56, z=30.29, angle=226.27, handle='DavisVeh'},
	{x=824.32, y=-1312.97, z=27.12, angle=110.61, handle='LaMesaVeh'},
	{x=-570.54, y=-145.18, z=38.31, angle=202.49, handle='RockfordVeh'},
	{x=529.89, y=-28.69, z=71.24, angle=211.01, handle='VinewoodVeh'},
}

list_cars_bcso_spawns = { -- z + 1
	{x=-479.37, y=6028.13, z=32.34, angle=225.39, handle='PaletoVeh'},
	{x=1853.46, y=3675.65, z=34.76, angle=211.65, handle='SandyShoresVeh'},
}

list_cars_sapr_spawns = { -- z+1
	{x=374.43, y=796.64, z=186.28, angle=174.61, handle='BeaverBush'},
}

list_cars_sasp_spawns = { -- z+1
	{x=824.09, y=-1371.48, z=27.14, angle=0, handle='LaMesaSASP'},
	{x=-472.23, y=6035.35, z=31.34, angle=228.1, handle='PaletoSASP'},
}

list_cars_swat_spawns = { -- z+1
	{x=854.79, y=-1279.64, z=27.5, angle=21.71, handle='LaMesaSWAT'},
	{x=380.7, y=-1626.98, z=30.12, angle=321.33, handle='DavisSWAT'},
	{x=-1126.52, y=-841.38, z=13.38, angle=134.38, handle='VespucciSWAT'},
	{x=-581.2, y=-135.9, z=35.82, angle=200.72, handle='RockfordSWAT'},
	{x=-463.08, y=6044.24, z=31.34, angle=140.34, handle='PaletoSWAT'},
}

list_cars_dpos_spawns = { -- z+1
	{x=401.71, y=-1632.55, z=30.29, angle=137.05, handle='DavisDPOS'},
	{x=110.71, y=6606.92, z=31.87, angle=282.23, handle='PaletoDPOS'},
	{x=-1149.58, y=-1982.56, z=14.16, angle=282.82, handle='LSCLSIA'},
	{x=-198.87, y=-1300.55, z=32.3, angle=87.61, handle='Bennys'},
	{x=706.3, y=-1075.51, z=23.42, angle=358.41, handle='LSCLaMesa'},
	{x=-357.21, y=-114.86, z=39.7, angle=71.82, handle='LSCCentral'},
	{x=1204.55, y=2638.42, z=38.81, angle=316.2, handle='LSCHarmony'},
	{x=-1045.42, y=-852.74, z=5.87, angle=130.15, handle='VespucciDPOS'},
}

list_cars_heli_spawns = { -- z+1
	{x=449.33, y=-980.75, z=44.69, angle=0, handle='MissionRowHeli'},
	{x=362.94, y=-1598.45, z=37.95, angle=317.67, handle='DavisHeli'},
	{x=-1095.38, y=-835.22, z=38.68, angle=305.76, handle='VespucciHeli'},
	{x=579.8, y=12.43, z=104.23, angle=0, handle='VinewoodHeli'},
	{x=-475.35, y=5988.61, z=31.34, angle=313.99, handle='PaletoHeli'},
}

-- garage handle lists
list_cars_lspd_handles = {
	{handle='MissionRowVeh', name='lspd'},
	{handle='DelPerroVeh', name='lspd'},
	{handle='VespucciBeachVeh', name='lspd'},
	{handle='VespucciVeh', name='lspd'},
	{handle='DavisVeh', name='lspd'},
	{handle='LaMesaVeh', name='lspd'},
	{handle='RockfordVeh', name='lspd'},
	{handle='VinewoodVeh', name='lspd'},
}

list_cars_bcso_handles = {
	{handle='PaletoVeh', name='bcso'},
	{handle='SandyShoresVeh', name='bcso'},
}

list_cars_sapr_handles = {
	{handle='BeaverBush', name='sapr'},
}

list_cars_sasp_handles = {
	{handle='LaMesaSASP', name='sasp'},
	{handle='PaletoSASP', name='sasp'},
}

list_cars_swat_handles = {
	{handle='LaMesaSWAT', name='swat'},
	{handle='DavisSWAT', name='swat'},
	{handle='VespucciSWAT', name='swat'},
	{handle='RockfordSWAT', name='swat'},
	{handle='PaletoSWAT', name='swat'},
}

list_cars_dpos_handles = {
	{handle='DavisDPOS', name='dpos'},
	{handle='PaletoDPOS', name='dpos'},
	{handle='LSCLSIA', name='dpos'},
	{handle='Bennys', name='dpos'},
	{handle='LSCLaMesa', name='dpos'},
	{handle='LSCCentral', name='dpos'},
	{handle='LSCHarmony', name='dpos'},
	{handle='VespucciDPOS', name='dpos'},
}

list_cars_heli_handles = {
	{handle='MissionRowHeli', name='heli'},
	{handle='DavisHeli', name='heli'},
	{handle='VespucciHeli', name='heli'},
	{handle='VinewoodHeli', name='heli'},
	{handle='PaletoHeli', name='heli'},
}

-- service spawn-lists
list_towtruck_spawns = { -- z+1
	{x=-1052.91, y=-885.37, z=5.96, angle=120.15, handle='VespucciDPOS', name='DPOS Station Vespucci'},
	{x=-351.06, y=-187.97, z=39.07, angle=109.95, handle='LSCCentral', name='Los Santos Customs Burton'},
	{x=-266.99, y=-1304.53, z=32.27, angle=0.64, handle='Bennys', name='Bennys Original Motorworks'},
	{x=406.65, y=-1601.34, z=30.23, angle=230.18, handle='DavisDPOS', name='DPOS Station Davis'},
	{x=777.46, y=-1043.64, z=26.74, angle=183.4, handle='LSCLaMesa', name='Los Santos Customs La Mesa'},
	{x=-1092.43, y=-1977.57, z=14.14, angle=349.78, handle='LSCLSIA', name='Los Santos Customs Vespucci'},
	{x=1209.07, y=2678.73, z=38.7, angle=268.13, handle='LSCHarmony', name='Los Santos Customs Harmony'},
	{x=108.78, y=6569.28, z=32.58, angle=222.93, handle='PaletoDPOS', name='Beekers Garage Paleto'},
}

list_coroner_spawns = { -- z+1
	{x=414.22, y=-1021.45, z=30.23, angle=90.62, handle='LSPDMissionRow', name='LSPD Station Mission Row'},
	{x=219.00, y=-1411.17, z=30.29, angle=152.34, handle='CoronerOfficeLS', name='Los Santos County Coroner Office'},
	{x=815.91, y=-1265.26, z=27.26, angle=82.87, handle='LSPDLaMesa', name='LSPD Station La Mesa'},
	{x=-1150.47, y=-841.98, z=15.41, angle=32.71, handle='LSPDVespucci', name='LSPD Station Vespucci'},
	{x=-575.91, y=-150.13, z=38.96, angle=204.36, handle='LSPDRockford', name='LSPD Station Rockford Hills'},
	{x=1851.21, y=3664.64, z=35.12, angle=122.78, handle='BCSOSandy', name='BCSO Sandy Shores'},
	{x=-437.59, y=6040.01, z=32.34, angle=299.42, handle='BCSOPaleto', name='BCSO Paleto Bay'},
}

-- blip list
BlipList = {
	{x=-562.36, y=-128.88, z=51.99, sprite=60, colour=40, alpha=255, name='SWAT Station'},
	{x=-1109.59, y=-846.52, z=19.32, sprite=60, colour=40, alpha=255, name='SWAT Station'},
	{x=372.14, y=-1594.24, z=36.95, sprite=60, colour=40, alpha=255, name='SWAT Station'},
	{x=824.32, y=-1290.22, z=28.24, sprite=60, colour=40, alpha=255, name='SWAT Station'},
	{x=-445.25, y=6012.7, z=40.15, sprite=60, colour=40, alpha=255, name='SWAT Station'},
	{x=382.06, y=796.72, z=195.16, sprite=60, colour=2, alpha=255, name='Park Ranger Station'},
	{x=-1057.69, y=-843.84, z=5.04, sprite=317, colour=17, alpha=255, name='DPOS Station'},
	{x=406.02, y=-1627.99, z=29.29, sprite=317, colour=17, alpha=255, name='DPOS Station'},
	{x=107.14, y=6613.11, z=31.99, sprite=317, colour=17, alpha=255, name='DPOS Station'},
	{x=1192.21, y=2643.83, z=37.85, sprite=317, colour=17, alpha=255, name='DPOS Station'},
	{x=-355.89, y=-129.71, z=39.44, sprite=317, colour=17, alpha=255, name='DPOS Station'},
	{x=-1140.26, y=-1994.36, z=13.17, sprite=317, colour=17, alpha=255, name='DPOS Station'},
	{x=-200.22, y=-1308.93, z=31.29, sprite=317, colour=17, alpha=255, name='DPOS Station'},
	{x=720.14, y=-1081.7, z=22.24, sprite=317, colour=17, alpha=255, name='DPOS Station'},
	{x=1852.92, y=3687.03, z=34.27, sprite=60, colour=5, alpha=255, name='BCSO Station'},
	{x=-445.25, y=6012.7, z=40.15, sprite=60, colour=5, alpha=255, name='BCSO Station'},
	{x=824.32, y=-1290.22, z=28.24, sprite=60, colour=0, alpha=255, name='SASP Station'},
	{x=-445.25, y=6012.7, z=40.15, sprite=60, colour=0, alpha=255, name='SASP Station'},
	{x=579.09, y=-4.75, z=101.25, sprite=60, colour=3, alpha=255, name='LSPD Station'},
	{x=-562.36, y=-128.88, z=51.99, sprite=60, colour=3, alpha=255, name='LSPD Station'},
	{x=-1109.59, y=-846.52, z=19.32, sprite=60, colour=3, alpha=255, name='LSPD Station'},
	{x=-1632.33, y=-1013.57, z=13.11, sprite=60, colour=3, alpha=255, name='LSPD Station'},
	{x=-1313.2, y=-1527.46, z=4.42, sprite=60, colour=3, alpha=255, name='LSPD Station'},
	{x=372.14, y=-1594.24, z=36.95, sprite=60, colour=3, alpha=255, name='LSPD Station'},
	{x=444.33, y=-985.00, z=43.69, sprite=60, colour=3, alpha=255, name='LSPD Station'},
	{x=824.32, y=-1290.22, z=28.24, sprite=60, colour=3, alpha=255, name='LSPD Station'},
	{x=-245.83, y=6329.63, z=32.43, sprite=61, colour=1, alpha=255, name='Hospital'},
	{x=1839.39, y=3672.76, z=34.28, sprite=61, colour=1, alpha=255, name='Hospital'},
	{x=-473.01, y=-339.17, z=35.2, sprite=61, colour=1, alpha=255, name='Hospital'},
	{x=-875.16, y=-313.68, z=55.54, sprite=61, colour=1, alpha=255, name='Hospital'},
	{x=-676.01, y=312.02, z=83.08, sprite=61, colour=1, alpha=255, name='Hospital'},
	{x=342.69, y=-1398.18, z=32.51, sprite=61, colour=1, alpha=255, name='Hospital'},
	{x=1150.8, y=-1529.69, z=35.37, sprite=61, colour=1, alpha=255, name='Hospital'},
	{x=322.72, y=-586.26, z=90.62, sprite=61, colour=1, alpha=255, name='Hospital'},
	{x=1690.95, y=2594.43, z=45.56, sprite=188, colour=0, alpha=255, name='Prison'},
}

-- Marker-variables
-- -- Arrest
var_arrest_symbol = 30
var_arrest_scaleX = 1.0
var_arrest_scaleY = 1.0
var_arrest_scaleZ = 1.0
var_arrest_red = 0
var_arrest_green = 0
var_arrest_blue = 180
var_arrest_alpha = 200
var_arrest_bob = false
var_arrest_face = true
var_arrest_p19 = 2
var_arrest_rotate = false
var_arrest_textdict = nil
var_arrest_textname = nil
var_arrest_drawonent = false

-- -- Clothing
var_cloth_symbol = 27
var_cloth_scaleX = 1.0
var_cloth_scaleY = 1.0
var_cloth_scaleZ = 1.0
var_cloth_red = 0
var_cloth_green = 0
var_cloth_blue = 180
var_cloth_alpha = 200
var_cloth_bob = false
var_cloth_face = false
var_cloth_p19 = 2
var_cloth_rotate = true
var_cloth_textdict = nil
var_cloth_textname = nil
var_cloth_drawonent = false

-- -- Heal
var_heal_symbol = 0
var_heal_scaleX = 0.62
var_heal_scaleY = 0.62
var_heal_scaleZ = 0.62
var_heal_red = 230
var_heal_green = 0
var_heal_blue = 0
var_heal_alpha = 200
var_heal_bob = false
var_heal_face = false
var_heal_p19 = 2
var_heal_rotate = false
var_heal_textdict = nil
var_heal_textname = nil
var_heal_drawonent = false

-- -- Vehicles
var_cars_city_symbol = 36
var_cars_city_scaleX = 1.5
var_cars_city_scaleY = 1.5
var_cars_city_scaleZ = 1.5
var_cars_city_red = 0
var_cars_city_green = 0
var_cars_city_blue = 180
var_cars_city_alpha = 200
var_cars_city_bob = false
var_cars_city_face = true
var_cars_city_p19 = 2
var_cars_city_rotate = false
var_cars_city_textdict = nil
var_cars_city_textname = nil
var_cars_city_drawonent = false

var_cars_bcso_symbol = 36
var_cars_bcso_scaleX = 1.5
var_cars_bcso_scaleY = 1.5
var_cars_bcso_scaleZ = 1.5
var_cars_bcso_red = 225
var_cars_bcso_green = 213
var_cars_bcso_blue = 5
var_cars_bcso_alpha = 200
var_cars_bcso_bob = false
var_cars_bcso_face = true
var_cars_bcso_p19 = 2
var_cars_bcso_rotate = false
var_cars_bcso_textdict = nil
var_cars_bcso_textname = nil
var_cars_bcso_drawonent = false

var_cars_sapr_symbol = 36
var_cars_sapr_scaleX = 1.5
var_cars_sapr_scaleY = 1.5
var_cars_sapr_scaleZ = 1.5
var_cars_sapr_red = 0
var_cars_sapr_green = 100
var_cars_sapr_blue = 0
var_cars_sapr_alpha = 200
var_cars_sapr_bob = false
var_cars_sapr_face = true
var_cars_sapr_p19 = 2
var_cars_sapr_rotate = false
var_cars_sapr_textdict = nil
var_cars_sapr_textname = nil
var_cars_sapr_drawonent = false

var_cars_sasp_symbol = 36
var_cars_sasp_scaleX = 1.5
var_cars_sasp_scaleY = 1.5
var_cars_sasp_scaleZ = 1.5
var_cars_sasp_red = 230
var_cars_sasp_green = 230
var_cars_sasp_blue = 230
var_cars_sasp_alpha = 200
var_cars_sasp_bob = false
var_cars_sasp_face = true
var_cars_sasp_p19 = 2
var_cars_sasp_rotate = false
var_cars_sasp_textdict = nil
var_cars_sasp_textname = nil
var_cars_sasp_drawonent = false

var_cars_swat_symbol = 39
var_cars_swat_scaleX = 1.5
var_cars_swat_scaleY = 1.5
var_cars_swat_scaleZ = 1.5
var_cars_swat_red = 0
var_cars_swat_green = 0
var_cars_swat_blue = 0
var_cars_swat_alpha = 200
var_cars_swat_bob = false
var_cars_swat_face = true
var_cars_swat_p19 = 2
var_cars_swat_rotate = false
var_cars_swat_textdict = nil
var_cars_swat_textname = nil
var_cars_swat_drawonent = false

var_cars_dpos_symbol = 39
var_cars_dpos_scaleX = 1.5
var_cars_dpos_scaleY = 1.5
var_cars_dpos_scaleZ = 1.5
var_cars_dpos_red = 255
var_cars_dpos_green = 150
var_cars_dpos_blue = 0
var_cars_dpos_alpha = 200
var_cars_dpos_bob = false
var_cars_dpos_face = true
var_cars_dpos_p19 = 2
var_cars_dpos_rotate = false
var_cars_dpos_textdict = nil
var_cars_dpos_textname = nil
var_cars_dpos_drawonent = false

var_cars_heli_symbol = 34
var_cars_heli_scaleX = 1.5
var_cars_heli_scaleY = 1.5
var_cars_heli_scaleZ = 1.5
var_cars_heli_red = 0
var_cars_heli_green = 0
var_cars_heli_blue = 180
var_cars_heli_alpha = 200
var_cars_heli_bob = false
var_cars_heli_face = true
var_cars_heli_p19 = 2
var_cars_heli_rotate = false
var_cars_heli_textdict = nil
var_cars_heli_textname = nil
var_cars_heli_drawonent = false

-- -- Weapons
var_weap_symbol = 21
var_weap_scaleX = 1.0
var_weap_scaleY = 1.0
var_weap_scaleZ = 1.0
var_weap_red = 0
var_weap_green = 0
var_weap_blue = 180
var_weap_alpha = 200
var_weap_bob = false
var_weap_face = false
var_weap_p19 = 2
var_weap_rotate = true
var_weap_textdict = nil
var_weap_textname = nil
var_weap_drawonent = false

-- -- Evidence
var_evidence_symbol = 29
var_evidence_scaleX = 0.6
var_evidence_scaleY = 0.6
var_evidence_scaleZ = 0.6
var_evidence_red = 255
var_evidence_green = 215
var_evidence_blue = 0
var_evidence_alpha = 200
var_evidence_bob = false
var_evidence_face = false
var_evidence_p19 = 2
var_evidence_rotate = true
var_evidence_textdict = nil
var_evidence_textname = nil
var_evidence_drawonent = false

-- -- Help
var_tut_symbol = 32
var_tut_scaleX = 0.6
var_tut_scaleY = 0.6
var_tut_scaleZ = 0.6
var_tut_red = 255
var_tut_green = 255
var_tut_blue = 255
var_tut_alpha = 200
var_tut_bob = false
var_tut_face = false
var_tut_p19 = 2
var_tut_rotate = true
var_tut_textdict = nil
var_tut_textname = nil
var_tut_drawonent = false

-- functions

-- -- the following if-clauses are used to allow for easy activation of certain mods.
if SLBMissionRow then
	table.insert(list_arrest_coords, {x=465.64, y=-999.76, z=24.91}) -- arrest point
	table.insert(list_heal_coords, {x=439.68, y=-976.37, z=26.17}) -- heal point
	table.insert(list_evidence_coords, {x=474.51, y=-985.79, z=24.91}) -- evidence point
else
	table.insert(list_arrest_coords, {x=464.10, y=-998.42, z=24.91})
	table.insert(list_heal_coords, {x=438.78, y=-991.46, z=30.19})
	table.insert(list_evidence_coords, {x=460.51, y=-991.27, z=24.91})
end

if BamboozledSandyPD then -- Sandy Shores PD
	table.insert(list_arrest_coords, {x=1843.15, y=3690.42, z=34.2}) -- arrest point
	table.insert(list_cloth_coords, {x=1857.41, y=3694.39, z=33.33}) -- clothing point
	table.insert(list_weap_coords, {x=1860.51, y=3692.96, z=34.25}) -- weapon point
	table.insert(list_evidence_coords, {x=1855.48, y=3697.83, z=34.21}) -- evidence point
else
	table.insert(list_arrest_coords, {x=1856.99, y=3689.5, z=34.27})
	table.insert(list_cloth_coords, {x=1848.69, y=3689.87, z=33.27})
	table.insert(list_weap_coords, {x=1851.02, y=3683.31, z=34.47})
	table.insert(list_evidence_coords, {x=1853.32, y=3689.74, z=34.27})
end

if matusPDPaleto then -- Paleto Bay PD
	table.insert(list_arrest_coords, {x=-431.24, y=5997.11, z=31.72}) -- arrest point
	table.insert(list_cloth_coords, {x=-440.02, y=5991.87, z=30.72}) -- clothing point
	table.insert(list_weap_coords, {x=-437.64, y=5989.05, z=31.72}) -- weapon point
	table.insert(list_evidence_coords, {x=-441.95, y=5987.74, z=31.72}) -- evidence point
else
	table.insert(list_arrest_coords, {x=-449.59, y=6016.55, z=31.72})
	table.insert(list_cloth_coords, {x=-448.27, y=6008.02, z=30.72})
	table.insert(list_weap_coords, {x=-442.55, y=6012.16, z=31.92})
	table.insert(list_evidence_coords, {x=-449.07, y=6012.54, z=31.72})
end

if SmokeyBeaverBushPR then
	table.insert(list_cloth_coords, {x=379.22, y=798.95, z=186.74})
	table.insert(list_weap_coords, {x=386.44, y=796.74, z=190.58})
else
	table.insert(list_cloth_coords, {x=391.52, y=798.91, z=186.67})
	table.insert(list_weap_coords, {x=387.01, y=791.36, z=187.69})
end

if beekSandyMC then
	table.insert(list_heal_coords, {x=1826.57, y=3674.87, z=33.77}) -- heal point
	table.insert(list_heal_coords, {x=1820.9, y=3671.38, z=33.77}) -- heal point
else
	table.insert(list_heal_coords, {x=1839.26, y=3673.14, z=33.78})
end

if BrownPaletoMC then
	table.insert(list_heal_coords, {x=-259.49, y=6318.74, z=31.94}) -- heal point
	table.insert(list_heal_coords, {x=-254.16, y=6325.53, z=31.94}) -- heal point
else
	table.insert(list_heal_coords, {x=-247.06, y=6331.06, z=31.93})
end

-- the following if-clauses add functionality to the variables set at the start of the file. Do not change anything here.

if not ActivateArrestMarkers then
	list_arrest_coords = {}
end

if not ActivateClothMarkers then
	list_cloth_coords = {}
end

if not ActivateHealMarkers then
	list_heal_coords = {}
end

if not ActivateLSPDGarage then
	list_cars_city_coords = {}
	list_cars_city_spawns = {}
	list_cars_lspd_handles = {}
end

if not ActivateBCSOGarage then
	list_cars_bcso_coords = {}
	list_cars_bcso_spawns = {}
	list_cars_bcso_handles = {}
end

if not ActivateSAPRGarage then
	list_cars_sapr_coords = {}
	list_cars_sapr_spawns = {}
	list_cars_sapr_handles = {}
end

if not ActivateSASPGarage then
	list_cars_sasp_coords = {}
	list_cars_sasp_spawns = {}
	list_cars_sasp_handles = {}
end

if not ActivateSWATGarage then
	list_cars_swat_coords = {}
	list_cars_swat_spawns = {}
	list_cars_swat_handles = {}
end

if not ActivateDPOSGarage then
	list_cars_dpos_coords = {}
	list_cars_dpos_spawns = {}
	list_cars_dpos_handles = {}
end

if not ActivateHeliPads then
	list_cars_heli_coords = {}
	list_cars_heli_spawns = {}
	list_cars_heli_handles = {}
end

if not ActivateWeaponMarkers then
	list_weap_coords = {}
end

if not ActivateEvidenceMarkers then
	list_evidence_coords = {}
end

if not ActivateHelpMarkers then
	list_tut_coords = {}
end

list_cars_coords = {
	list_cars_city_coords,
	list_cars_bcso_coords,
	list_cars_sapr_coords,
	list_cars_sasp_coords,
	list_cars_swat_coords,
	list_cars_dpos_coords,
	list_cars_heli_coords,
}

list_spawns = {
	list_cars_city_spawns,
	list_cars_bcso_spawns,
	list_cars_sapr_spawns,
	list_cars_sasp_spawns,
	list_cars_swat_spawns,
	list_cars_dpos_spawns,
	list_cars_heli_spawns,
}

list_handles = {
	list_cars_lspd_handles,
	list_cars_bcso_handles,
	list_cars_sapr_handles,
	list_cars_sasp_handles,
	list_cars_swat_handles,
	list_cars_dpos_handles,
	list_cars_heli_handles,
}