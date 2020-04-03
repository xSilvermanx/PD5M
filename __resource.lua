-- Do not delete this line
resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- PD5M server scripts
server_scripts {
	"Cleanupthreads/cleanupthreads_sv.lua",
	"Common/common_sv_fct.lua",
	"Common/def_gl.lua",
	"Common/def_sv.lua",
	"Common/global_fct.lua",
	"Config/config_sv.lua",
	"HUD/help_sv.lua",
	"HUD/tp_sv.lua",
	"Interaction/interaction_sv.lua",
	"Radialmenu/radial_sv.lua",
	"Service/coroner_sv.lua",
	"Service/tow_sv.lua",
	"Startup/startup_sv.lua",
	"Sync/sync_sv.lua",
}

--vRP-integration. Uncomment the following server_scripts and client_scripts.
--[[server_scripts {
	"@vrp/lib/utils.lua",
	"Duty/vRPIntegration_sv.lua",
}

client_scripts {
	"lib/Proxy.lua",
	"lib/Tunnel.lua",
	"Duty/vRPIntegration_cl.lua",
}]]

-- config files for PD5M
client_scripts {

-- Configuration for police related stations and their recommendations.
--If you uncomment any station be sure to install the associated resource and comment out the vanilla version.

	-- Beaver Bush Ranger Station | Park Ranger
	"Config/Stations/Police/BeaverBushVanilla.lua",
--	"Config/Stations/Police/BeaverBushSmokey.lua",

	-- Davis Sheriff's Station
	"Config/Stations/Police/DavisVanilla.lua",


	-- Del Perro Police Station
	"Config/Stations/Police/DelPerroVanilla.lua",


	-- La Mesa Police Station
	"Config/Stations/Police/LaMesaVanilla.lua",


	-- Mission Row Police Station
	"Config/Stations/Police/MissionRowVanilla.lua",
--	"Config/Stations/Police/MissionRowSLB.lua",

	-- Paleto Bay Sheriff's Office
	"Config/Stations/Police/PaletoBayVanilla.lua",
--	"Config/Stations/Police/PaletoBayMatus.lua",

	-- Rockford Hills Police Station
	"Config/Stations/Police/RockfordVanilla.lua",


	-- Sandy Shores Sheriff's Station
  "Config/Stations/Police/SandyShoresVanilla.lua",
--	"Config/Stations/Police/SandyShoresBamboozled.lua",

	-- Vespucci Beach Police Station
	"Config/Stations/Police/VespucciBeachVanilla.lua",


	-- Vespucci Police Station
	"Config/Stations/Police/VespucciVanilla.lua",


	-- Vinewood Police Station
	"Config/Stations/Police/VinewoodVanilla.lua",


-- Configuration for medical related stations and their recommendations
--If you uncomment any station be sure to install the associated resource and comment out the vanilla version.

	-- Central Los Santos Medical Center
	"Config/Stations/Med/CentralLSVanilla.lua",


	-- Eclipse Medical Tower
	"Config/Stations/Med/EclipseVanilla.lua",


	-- St. Fiacre Hospital
	"Config/Stations/Med/FiacreVanilla.lua",


	-- Mount Zonah Medical Center
	"Config/Stations/Med/MountZonahVanilla.lua",


	-- The Bay Care Center
	"Config/Stations/Med/PaletoBayVanilla.lua",
--	"Config/Stations/Med/PaletoBayBrown.lua",

	-- Pillbox Hill Medical Center
	"Config/Stations/Med/PillboxHillVanilla.lua",


	-- Portola Trinity Medical Center
	"Config/Stations/Med/PortolaVanilla.lua",


	-- Sandy Shores Medical Center
	"Config/Stations/Med/SandyShoresVanilla.lua",
--	"Config/Stations/Med/SandyShoresBeek.lua",


-- Configuration for towservices
	"Config/Stations/Tow/BeekersGarageVanilla.lua",
	"Config/Stations/Tow/BennysVanilla.lua",
	"Config/Stations/Tow/DPOSDavisVanilla.lua",
	"Config/Stations/Tow/DPOSVespucciVanilla.lua",
	"Config/Stations/Tow/LSCAirportVanilla.lua",
	"Config/Stations/Tow/LSCBurtonVanilla.lua",
	"Config/Stations/Tow/LSCHarmonyVanilla.lua",
	"Config/Stations/Tow/LSCLaMesaVanilla.lua",
	"Config/Stations/Tow/AutoRepairsSandy.lua",
	"Config/Stations/Tow/AutoRepairsMirrorPark.lua",
	"Config/Stations/Tow/AutoExoticVinewood.lua",


-- Configuration for other stations
	"Config/Stations/Other/BolingbrokeVanilla.lua",
	"Config/Stations/Other/CoronerOfficeVanilla.lua",


-- Configuration for garages and their recommendations.
-- If you uncomment any station be sure to install the associated resource and comment out the vanilla version.

-- Los Santos Police Department
	"Config/Garages/Files/lspdgaragesvanilla.lua",
--	"Config/Garages/Files/lspdgaragest0y.lua",

-- Blaine County Sherrif Office
	"Config/Garages/Files/bcsogaragesvanilla.lua",
--	"Config/Garages/Files/bcsogaragesbradm.lua",

-- San Andreas State Patrol
	"Config/Garages/Files/saspgaragesvanilla.lua",
	"Config/Garages/Files/saspgaragesthehurk.lua",

-- San Andreas Park Rangers
	"Config/Garages/Files/saprgaragesvanilla.lua",


-- Special weapons and tactics
	"Config/Garages/Files/swatgaragesvanilla.lua",


-- Department of Public Order and Safety
	"Config/Garages/Files/dposgaragesvanilla.lua",

-- Police Helicopter Garages -- Ambulance/Firefighter will be added later maybe :)
	"Config/Garages/Files/heligaragesvanilla.lua",


-- Configuration for armorys
	"Config/Armories/Files/GeneralArmoryVanilla.lua",
	"Config/Armories/Files/LSPDArmoryVanilla.lua",
	"Config/Armories/Files/BCSOArmoryVanilla.lua",
	"Config/Armories/Files/SASPArmoryVanilla.lua",
	"Config/Armories/Files/SAPRArmoryVanilla.lua",
	"Config/Armories/Files/SWATArmoryVanilla.lua",
}

-- PD5M client scripts
client_scripts {
	"Warmenu/warmenu.lua",
	"Cleanupthreads/cleanupthreads_cl.lua",
	"Common/common_cl_fct.lua",
	"Common/def_cl.lua",
	"Common/def_gl.lua",
	"Common/global_fct.lua",
	"Config/config_cl.lua",
	"Config/speechoptions_cl.lua",
	"Config/Armories/armory_cl.lua",
	"Config/Garages/garages_cl.lua",
	"Config/Stations/stations_cl.lua",
	"Duty/ESXIntegration_cl.lua",
	"HUD/blips_cl.lua",
	"HUD/crosshair_cl.lua",
	"HUD/help_cl.lua",
	"HUD/markers_cl.lua",
	"HUD/notes_cl.lua",
	"HUD/tp_cl.lua",
	"Interaction/interaction_cl.lua",
	"Interaction/pednopanic_cl.lua",
	"Service/coroner_cl.lua",
	"Service/tow_cl.lua",
	"Startup/startup_cl.lua",
	"Sync/sync_cl.lua",
}

-- Radialmenu integration
client_script {
  "Radialmenu/config.lua",
  "Radialmenu/radialmenu.lua"
}

ui_page "Radialmenu/html/menu.html"

files {
	"Radialmenu/html/menu.html",
	"Radialmenu/html/raphael.min.js",
  "Radialmenu/html/wheelnav.min.js",
}
