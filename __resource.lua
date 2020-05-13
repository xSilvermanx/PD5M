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
	"Duty/ranks_sv.lua",
	"HUD/help_sv.lua",
	"HUD/tp_sv.lua",
	"Interaction/interaction_sv.lua",
	"Radialmenu/radial_sv.lua",
	"Service/coroner_sv.lua",
	"Service/tow_sv.lua",
	"Startup/startup_sv.lua",
	"Sync/sync_sv.lua",
	"Sync/NativeSync_sv.lua",
}

--vRP-integration. Uncomment the following server_scripts and client_scripts.
--[[server_scripts {
	"@vrp/lib/utils.lua",
	"Integration/vRP/vRPIntegration_sv.lua",
}

client_scripts {
	"lib/Proxy.lua",
	"lib/Tunnel.lua",
	"Integration/vRP/vRPIntegration_cl.lua",
}]]

-- config files for PD5M
client_scripts {

-- --Configuration for police related stations and their recommendations.
--If you uncomment any station be sure to install the associated resource and comment out the vanilla version.

	-- Beaver Bush Ranger Station | Park Ranger
	"Config/Stations/Police/BeaverBushVanilla.lua",
	--"Config/Stations/Police/BeaverBushSmokey.lua",

	-- Davis Sheriff's Station
	"Config/Stations/Police/DavisVanilla.lua",


	-- Del Perro Police Station
	"Config/Stations/Police/DelPerroVanilla.lua",


	-- La Mesa Police Station
	"Config/Stations/Police/LaMesaVanilla.lua",


	-- Mission Row Police Station
	"Config/Stations/Police/MissionRowVanilla.lua",
	--"Config/Stations/Police/MissionRowSLB.lua",

	-- Paleto Bay Sheriff's Office
	"Config/Stations/Police/PaletoBayVanilla.lua",
	--"Config/Stations/Police/PaletoBayMatus.lua",

	-- Rockford Hills Police Station
	"Config/Stations/Police/RockfordVanilla.lua",


	-- Sandy Shores Sheriff's Station
  	"Config/Stations/Police/SandyShoresVanilla.lua",
	--"Config/Stations/Police/SandyShoresBamboozled.lua",

	-- Vespucci Beach Police Station
	"Config/Stations/Police/VespucciBeachVanilla.lua",


	-- Vespucci Police Station
	"Config/Stations/Police/VespucciVanilla.lua",


	-- Vinewood Police Station
	"Config/Stations/Police/VinewoodVanilla.lua",


-- --Configuration for medical related stations and their recommendations
--If you uncomment any station be sure to install the associated resource and comment out the vanilla version.

	-- Central Los Santos Medical Center
	"Config/Stations/Med/CentralLSVanilla.lua",

	-- Davis Fire Station
	"Config/Stations/Med/DavisFDVanilla.lua",

	-- Eclipse Medical Tower
	"Config/Stations/Med/EclipseVanilla.lua",


	-- St. Fiacre Hospital
	"Config/Stations/Med/FiacreVanilla.lua",


	-- Mount Zonah Medical Center
	"Config/Stations/Med/MountZonahVanilla.lua",


	-- The Bay Care Center
	"Config/Stations/Med/PaletoBayVanilla.lua",
	--"Config/Stations/Med/PaletoBayBrown.lua",

	-- Paleto Bay Fire Station
	"Config/Stations/Med/PaletoBayFDVanilla.lua",

	-- Pillbox Hill Medical Center
	"Config/Stations/Med/PillboxHillVanilla.lua",


	-- Portola Trinity Medical Center
	"Config/Stations/Med/PortolaVanilla.lua",

	-- Rockford Hills Fire Station
	"Config/Stations/Med/RockfordHillsFDVanilla.lua",

	-- Sandy Shores Medical Center
	"Config/Stations/Med/SandyShoresVanilla.lua",
	--"Config/Stations/Med/SandyShoresBeek.lua",

	-- Sandy Shores Fire Station
	"Config/Stations/Med/SandyShoresFDVanilla.lua",

-- --Configuration for towservices
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


-- --Configuration for other stations
	"Config/Stations/Other/BolingbrokeVanilla.lua",
	"Config/Stations/Other/CoronerOfficeVanilla.lua",


-- --Configuration for garages and their recommendations.
-- If you uncomment any station be sure to install the associated resource and comment out the vanilla version.

-- Los Santos Police Department
	"Config/Garages/Files/lspdgaragesvanilla.lua",
--	"Config/Garages/Files/lspdgaragest0y.lua",

-- Blaine County Sherrif Office
	"Config/Garages/Files/bcsogaragesvanilla.lua",
--	"Config/Garages/Files/bcsogaragesbradm.lua",

-- San Andreas State Patrol
	"Config/Garages/Files/saspgaragesvanilla.lua",
--	"Config/Garages/Files/saspgaragesthehurk.lua",

-- San Andreas Park Rangers
	"Config/Garages/Files/saprgaragesvanilla.lua",


-- Special weapons and tactics
	"Config/Garages/Files/swatgaragesvanilla.lua",


-- Department of Public Order and Safety
	"Config/Garages/Files/dposgaragesvanilla.lua",

-- Police Helicopter Garages
	"Config/Garages/Files/heligaragesvanilla.lua",

-- EMS and Firefighter Garages -- Helis might be added later
	"Config/Garages/Files/firegaragesvanilla.lua",

-- --Configuration for armories

-- General Armory Files
	"Config/Armories/Files/GeneralArmoryVanilla.lua",
	--"Config/Armories/Files/GeneralArmoryEUP.lua",

-- LSPD Armory Files
	"Config/Armories/Files/LSPDArmoryVanilla.lua",
	--"Config/Armories/Files/LSPDArmoryEUP.lua",

-- BCSO Armory Files
	"Config/Armories/Files/BCSOArmoryVanilla.lua",
	--"Config/Armories/Files/BCSOArmoryEUP.lua",

-- SASP Armory Files
	"Config/Armories/Files/SASPArmoryVanilla.lua",
	--"Config/Armories/Files/SASPArmoryEUP.lua",

-- SAPR Armory Files
	"Config/Armories/Files/SAPRArmoryVanilla.lua",
	--"Config/Armories/Files/SAPRArmoryEUP.lua",

-- SWAT Armory Files
	"Config/Armories/Files/SWATArmoryVanilla.lua",
	--"Config/Armories/Files/SWATArmoryEUP.lua",


-- --Configuration for wardrobes

-- General (Department-unspecific) clothing
	--"Config/Wardrobes/Files/GEN/TopsEUP.lua",
	--"Config/Wardrobes/Files/GEN/LegsEUP.lua",
	--"Config/Wardrobes/Files/GEN/AccessoiresEUP.lua",
	--"Config/Wardrobes/Files/GEN/GlovesEUP.lua",

	"Config/Wardrobes/Files/GEN/TopsVanilla.lua",
	"Config/Wardrobes/Files/GEN/LegsVanilla.lua",
	"Config/Wardrobes/Files/GEN/AccessoiresVanilla.lua",
	"Config/Wardrobes/Files/GEN/GlovesVanilla.lua",

-- Police department-unspecific clothing
	--"Config/Wardrobes/Files/POL/TopsEUP.lua",
	--"Config/Wardrobes/Files/POL/LegsEUP.lua",
	--"Config/Wardrobes/Files/POL/AccessoiresEUP.lua",

	"Config/Wardrobes/Files/POL/TopsVanilla.lua",
	"Config/Wardrobes/Files/POL/LegsVanilla.lua",
	"Config/Wardrobes/Files/POL/AccessoiresVanilla.lua",

-- Fire department-unspecific clothing
	--"Config/Wardrobes/Files/FIRE/TopsEUP.lua",
	--"Config/Wardrobes/Files/FIRE/LegsEUP.lua",
	--"Config/Wardrobes/Files/FIRE/AccessoiresEUP.lua",

	"Config/Wardrobes/Files/FIRE/TopsVanilla.lua",
	"Config/Wardrobes/Files/FIRE/LegsVanilla.lua",
	"Config/Wardrobes/Files/FIRE/AccessoiresVanilla.lua",

-- LSPD clothing
	--"Config/Wardrobes/Files/LSPD/TopsEUP.lua",
	--"Config/Wardrobes/Files/LSPD/LegsEUP.lua",
	--"Config/Wardrobes/Files/LSPD/AccessoiresEUP.lua",

	"Config/Wardrobes/Files/LSPD/TopsVanilla.lua",
	"Config/Wardrobes/Files/LSPD/LegsVanilla.lua",
	"Config/Wardrobes/Files/LSPD/AccessoiresVanilla.lua",

-- BCSO clothing
	--"Config/Wardrobes/Files/BCSO/TopsEUP.lua",
	--"Config/Wardrobes/Files/BCSO/LegsEUP.lua",
	--"Config/Wardrobes/Files/BCSO/AccessoiresEUP.lua",

	"Config/Wardrobes/Files/BCSO/TopsVanilla.lua",
	"Config/Wardrobes/Files/BCSO/LegsVanilla.lua",
	"Config/Wardrobes/Files/BCSO/AccessoiresVanilla.lua",

-- SASP clothing
	--"Config/Wardrobes/Files/SASP/TopsEUP.lua",
	--"Config/Wardrobes/Files/SASP/LegsEUP.lua",
	--"Config/Wardrobes/Files/SASP/AccessoiresEUP.lua",

	"Config/Wardrobes/Files/SASP/TopsVanilla.lua",
	"Config/Wardrobes/Files/SASP/LegsVanilla.lua",
	"Config/Wardrobes/Files/SASP/AccessoiresVanilla.lua",

-- SAPR clothing
	--"Config/Wardrobes/Files/SAPR/TopsEUP.lua",
	--"Config/Wardrobes/Files/SAPR/LegsEUP.lua",
	--"Config/Wardrobes/Files/SAPR/AccessoiresEUP.lua",

	"Config/Wardrobes/Files/SAPR/TopsVanilla.lua",
	"Config/Wardrobes/Files/SAPR/LegsVanilla.lua",
	"Config/Wardrobes/Files/SAPR/AccessoiresVanilla.lua",

-- SWAT clothing
	--"Config/Wardrobes/Files/SWAT/TopsEUP.lua",
	--"Config/Wardrobes/Files/SWAT/LegsEUP.lua",
	--"Config/Wardrobes/Files/SWAT/AccessoiresEUP.lua",

	"Config/Wardrobes/Files/SWAT/TopsVanilla.lua",
	"Config/Wardrobes/Files/SWAT/LegsVanilla.lua",
	"Config/Wardrobes/Files/SWAT/AccessoiresVanilla.lua",

-- DPOS clothing
	--"Config/Wardrobes/Files/DPOS/TopsEUP.lua",
	--"Config/Wardrobes/Files/DPOS/LegsEUP.lua",
	--"Config/Wardrobes/Files/DPOS/AccessoiresEUP.lua",

	"Config/Wardrobes/Files/DPOS/TopsVanilla.lua",
	"Config/Wardrobes/Files/DPOS/LegsVanilla.lua",
	"Config/Wardrobes/Files/DPOS/AccessoiresVanilla.lua",

-- LSFD clothing
	--"Config/Wardrobes/Files/LSFD/TopsEUP.lua",
	--"Config/Wardrobes/Files/LSFD/LegsEUP.lua",
	--"Config/Wardrobes/Files/LSFD/AccessoiresEUP.lua",

	"Config/Wardrobes/Files/LSFD/TopsVanilla.lua",
	"Config/Wardrobes/Files/LSFD/LegsVanilla.lua",
	"Config/Wardrobes/Files/LSFD/AccessoiresVanilla.lua",

-- BCFD clothing
	--"Config/Wardrobes/Files/BCFD/TopsEUP.lua",
	--"Config/Wardrobes/Files/BCFD/LegsEUP.lua",
	--"Config/Wardrobes/Files/BCFD/AccessoiresEUP.lua",

	"Config/Wardrobes/Files/BCFD/TopsVanilla.lua",
	"Config/Wardrobes/Files/BCFD/LegsVanilla.lua",
	"Config/Wardrobes/Files/BCFD/AccessoiresVanilla.lua",

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
	"Config/Wardrobes/wardrobe_cl.lua",
	"Config/Wardrobes/CategoryDefinitions_cl.lua",
	"Duty/duty_cl.lua",
	"Duty/ranks_cl.lua",
	"HUD/blips_cl.lua",
	"HUD/crosshair_cl.lua",
	"HUD/help_cl.lua",
	"HUD/markers_cl.lua",
	"HUD/MissionTemp_cl.lua",
	"HUD/notes_cl.lua",
	"HUD/tp_cl.lua",
	"Integration/ESX/ESXIntegration_cl.lua",
	"Interaction/interaction_cl.lua",
	"Interaction/pednopanic_cl.lua",
	"Service/coroner_cl.lua",
	"Service/tow_cl.lua",
	"Startup/startup_cl.lua",
	"Sync/sync_cl.lua",
	"Sync/NativeSync_cl.lua",
}

-- PD5M callout scripts
server_scripts {
	"Callouts/MissionData/AmbientEvents/**/*.lua",
	"Callouts/MissionData/MissionLoader_gl.lua",
	"Callouts/MissionHandler_sv.lua",
	"Callouts/MissionData/MissionInterpreter_sv.lua",
}

client_scripts {
	"Callouts/MissionData/AmbientEvents/**/*.lua",
	"Callouts/MissionData/MissionLoader_gl.lua",
	"Callouts/MissionHandler_cl.lua",
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
