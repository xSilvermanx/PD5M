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
	"Config/Stations/Police/BeaverBushVanilla.lua",
	"Config/Stations/Police/DavisVanilla.lua",
	"Config/Stations/Police/DelPerroVanilla.lua",
	"Config/Stations/Police/LaMesaVanilla.lua",
	"Config/Stations/Police/MissionRowVanilla.lua",
	"Config/Stations/Police/PaletoBayVanilla.lua",
	"Config/Stations/Police/RockfordVanilla.lua",
	"Config/Stations/Police/SandyShoresVanilla.lua",
	"Config/Stations/Police/VespucciBeachVanilla.lua",
	"Config/Stations/Police/VespucciVanilla.lua",
	"Config/Stations/Police/VinewoodVanilla.lua",

	"Config/Stations/Other/BolingbrokeVanilla.lua",
	"Config/Stations/Other/CoronerOfficeVanilla.lua",

	"Config/Stations/Tow/BeekersGarageVanilla.lua",
	"Config/Stations/Tow/BennysVanilla.lua",
	"Config/Stations/Tow/DPOSDavisVanilla.lua",
	"Config/Stations/Tow/DPOSVespucciVanilla.lua",
	"Config/Stations/Tow/LSCAirportVanilla.lua",
	"Config/Stations/Tow/LSCBurtonVanilla.lua",
	"Config/Stations/Tow/LSCHarmonyVanilla.lua",
	"Config/Stations/Tow/LSCLaMesaVanilla.lua",

	"Config/Stations/Med/CentralLSVanilla.lua",
	"Config/Stations/Med/EclipseVanilla.lua",
	"Config/Stations/Med/FiacreVanilla.lua",
	"Config/Stations/Med/MountZonahVanilla.lua",
	"Config/Stations/Med/PaletoBayVanilla.lua",
	"Config/Stations/Med/PillboxHillVanilla.lua",
	"Config/Stations/Med/PortolaVanilla.lua",
	"Config/Stations/Med/SandyShoresVanilla.lua",

	"Config/Garages/Files/lspdgaragesvanilla.lua",
	"Config/Garages/Files/bcsogaragesvanilla.lua",
	"Config/Garages/Files/saspgaragesvanilla.lua",
	"Config/Garages/Files/saprgaragesvanilla.lua",
	"Config/Garages/Files/swatgaragesvanilla.lua",
	"Config/Garages/Files/dposgaragesvanilla.lua",
	"Config/Garages/Files/heligaragesvanilla.lua",

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
