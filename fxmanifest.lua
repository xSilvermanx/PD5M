-- Resource Metadata
fx_version 'bodacious'
games {'gta5'}

author 'xSilvermanx'
description 'PD5M - Multiplayer PvE Police Script'
version '0.2.1.1'

------------------------------------------------------------------------
------------------------ Major config variables ------------------------
------------------------------------------------------------------------

-- Server framework config variables
ConvarEnableESX = false -- https://forum.cfx.re/t/release-esx-base/39881
ConvarEnablevRP = false -- https://forum.cfx.re/t/release-vrp-framework/22894

-- Clothing config variables
ConvarEnableEUP = false -- https://forum.cfx.re/t/release-eup-serve-and-rescue-law-order-7-5-server-side-update-1-2-now-with-esx-permissions/210892
                        -- you only need to install "eup-stream"

-- Police station config variables
ConvarEnableMissionRowSLB = false -- https://de.gta5-mods.com/maps/community-mission-row-pd
ConvarEnablePaletoBayMatus = false -- https://de.gta5-mods.com/maps/paleto-bay-sheriff-s-office-extended-sp-and-fivem-mlo
ConvarEnableSandyShoresBamboozled = false -- https://de.gta5-mods.com/maps/sandy-sheriff-office-extension-mlo-interior
ConvarEnableBeaverBushSmokey = false -- https://forum.cfx.re/t/release-mlo-beaver-bush-park-ranger-station/1052889

-- Fire station and hospital config variables
ConvarEnablePaletoBayBrown = false -- https://de.gta5-mods.com/maps/mlo-paleto-bay-medical-center
ConvarEnableSandyShoresBeek = true -- https://de.gta5-mods.com/maps/sandy-shores-hospital-mlo-interior-add-on-fivem

-- Vehicle config variables
ConvarEnableELSLSPDt0yPack = false -- https://www.lcpdfr.com/downloads/gta5mods/vehiclemodels/17911-los-santos-police-department-mega-pack-els/
ConvarEnableELSBCSOBradMPack = false -- https://forum.cfx.re/t/els-bcso-mega-pack-fixed-again/81604
ConvarEnableELSSAHPTheHurkPack = false -- https://forum.cfx.re/t/release-2017-california-highway-patrol-mega-pack-els/64875


-- Main system config variables
ConvarEnableMainScript = true -- Enables Interaction with peds, radialmenu and many other scripts. If deactivated markers still function properly.
ConvarEnableMissionScript = true -- Enables Ambient Events; only works with main script enabled

---------------------------------------------------
----------------- Loading scripts -----------------
---------------------------------------------------

-- Loading main config files
shared_scripts {
  "Common/def_gl.lua",
}

server_scripts {
  "Common/def_sv.lua",
  "Config/config_sv.lua",
}

client_scripts {
  "Common/def_cl.lua",
  "Config/config_cl.lua",

}

-- Loading function library files
shared_scripts {
  "Common/global_fct.lua",
}

server_scripts {
  "Common/common_sv_fct.lua",
}

client_scripts {
  "Warmenu/warmenu.lua",
  "Common/common_cl_fct.lua",
}

-- Loading station config files
client_scripts {
  "Config/Stations/Police/DavisVanilla.lua",
  "Config/Stations/Police/DelPerroVanilla.lua",
  "Config/Stations/Police/LaMesaVanilla.lua",
  "Config/Stations/Police/RockfordVanilla.lua",
  "Config/Stations/Police/VespucciVanilla.lua",
  "Config/Stations/Police/VinewoodVanilla.lua",
  "Config/Stations/Med/CentralLSVanilla.lua",
  "Config/Stations/Med/DavisFDVanilla.lua",
  "Config/Stations/Med/EclipseVanilla.lua",
  "Config/Stations/Med/FiacreVanilla.lua",
  "Config/Stations/Med/MountZonahVanilla.lua",
  "Config/Stations/Med/PaletoBayFDVanilla.lua",
  "Config/Stations/Med/PillboxHillVanilla.lua",
  "Config/Stations/Med/PortolaVanilla.lua",
  "Config/Stations/Med/RockfordHillsFDVanilla.lua",
  "Config/Stations/Med/SandyShoresFDVanilla.lua",
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
  "Config/Stations/Other/BolingbrokeVanilla.lua",
  "Config/Stations/Other/CoronerOfficeVanilla.lua",
}

if ConvarEnableMissionRowSLB == true then
  client_scripts {
    "Config/Stations/Police/MissionRowSLB.lua",
  }
else
  client_scripts {
    "Config/Stations/Police/MissionRowVanilla.lua",
  }
end

if ConvarEnablePaletoBayMatus == true then
  client_scripts {
    "Config/Stations/Police/PaletoBayMatus.lua",
  }
else
  client_scripts {
    "Config/Stations/Police/PaletoBayVanilla.lua",
  }
end

if ConvarEnableSandyShoresBamboozled == true then
  client_scripts {
    "Config/Stations/Police/SandyShoresBamboozled.lua",
  }
else
  client_scripts {
    "Config/Stations/Police/SandyShoresVanilla.lua",
  }
end

if ConvarEnableBeaverBushSmokey == true then
  client_scripts {
    "Config/Stations/Police/BeaverBushSmokey.lua",
  }
else
  client_scripts {
    "Config/Stations/Police/BeaverBushVanilla.lua",
  }
end

if ConvarEnablePaletoBayBrown == true then
  client_scripts {
    "Config/Stations/Med/PaletoBayBrown.lua",
  }
else
  client_scripts {
    "Config/Stations/Med/PaletoBayVanilla.lua",
  }
end

if ConvarEnableSandyShoresBeek == true then
  client_scripts {
    "Config/Stations/Med/SandyShoresBeek.lua",
  }
else
  client_scripts {
    "Config/Stations/Med/SandyShoresVanilla.lua",
  }
end

-- Loading Garage config files
client_scripts {
  "Config/Garages/Files/saprgaragesvanilla.lua",
  "Config/Garages/Files/swatgaragesvanilla.lua",
  "Config/Garages/Files/dposgaragesvanilla.lua",
  "Config/Garages/Files/heligaragesvanilla.lua",
  "Config/Garages/Files/firegaragesvanilla.lua",
}

if ConvarEnableELSLSPDt0yPack == true then
  client_scripts {
    "Config/Garages/Files/lspdgaragest0y.lua",
  }
else
  client_scripts {
    "Config/Garages/Files/lspdgaragesvanilla.lua",
  }
end

if ConvarEnableELSBCSOBradMPack == true then
  client_scripts {
    "Config/Garages/Files/bcsogaragesbradm.lua",
  }
else
  client_scripts {
    "Config/Garages/Files/bcsogaragesvanilla.lua",
  }
end

if ConvarEnableELSSAHPTheHurkPack == true then
  client_scripts {
    "Config/Garages/Files/saspgaragesthehurk.lua",
  }
else
  client_scripts {
    "Config/Garages/Files/saspgaragesvanilla.lua",
  }
end

-- Loading armory config files
if ConvarEnableEUP then
  client_scripts {
    "Config/Armories/Files/GeneralArmoryEUP.lua",
    "Config/Armories/Files/LSPDArmoryEUP.lua",
    "Config/Armories/Files/BCSOArmoryEUP.lua",
    "Config/Armories/Files/SASPArmoryEUP.lua",
    "Config/Armories/Files/SAPRArmoryEUP.lua",
    "Config/Armories/Files/SWATArmoryEUP.lua",
  }
else
  client_scripts {
    "Config/Armories/Files/GeneralArmoryVanilla.lua",
    "Config/Armories/Files/LSPDArmoryVanilla.lua",
    "Config/Armories/Files/BCSOArmoryVanilla.lua",
    "Config/Armories/Files/SASPArmoryVanilla.lua",
    "Config/Armories/Files/SAPRArmoryVanilla.lua",
    "Config/Armories/Files/SWATArmoryVanilla.lua",
  }
end

-- Loading wardrobe config files
if ConvarEnableEUP then
  client_scripts {
    "Config/Wardrobes/Files/GEN/TopsEUP.lua",
  	"Config/Wardrobes/Files/GEN/LegsEUP.lua",
  	"Config/Wardrobes/Files/GEN/AccessoiresEUP.lua",
  	"Config/Wardrobes/Files/GEN/GlovesEUP.lua",
    "Config/Wardrobes/Files/POL/TopsEUP.lua",
    "Config/Wardrobes/Files/POL/LegsEUP.lua",
    "Config/Wardrobes/Files/POL/AccessoiresEUP.lua",
    "Config/Wardrobes/Files/FIRE/TopsEUP.lua",
  	"Config/Wardrobes/Files/FIRE/LegsEUP.lua",
  	"Config/Wardrobes/Files/FIRE/AccessoiresEUP.lua",
    "Config/Wardrobes/Files/LSPD/TopsEUP.lua",
    "Config/Wardrobes/Files/LSPD/LegsEUP.lua",
    "Config/Wardrobes/Files/LSPD/AccessoiresEUP.lua",
    "Config/Wardrobes/Files/BCSO/TopsEUP.lua",
    "Config/Wardrobes/Files/BCSO/LegsEUP.lua",
    "Config/Wardrobes/Files/BCSO/AccessoiresEUP.lua",
    "Config/Wardrobes/Files/SASP/TopsEUP.lua",
    "Config/Wardrobes/Files/SASP/LegsEUP.lua",
    "Config/Wardrobes/Files/SASP/AccessoiresEUP.lua",
    "Config/Wardrobes/Files/SAPR/TopsEUP.lua",
  	"Config/Wardrobes/Files/SAPR/LegsEUP.lua",
  	"Config/Wardrobes/Files/SAPR/AccessoiresEUP.lua",
    "Config/Wardrobes/Files/SWAT/TopsEUP.lua",
    "Config/Wardrobes/Files/SWAT/LegsEUP.lua",
    "Config/Wardrobes/Files/SWAT/AccessoiresEUP.lua",
    "Config/Wardrobes/Files/DPOS/TopsEUP.lua",
    "Config/Wardrobes/Files/DPOS/LegsEUP.lua",
    "Config/Wardrobes/Files/DPOS/AccessoiresEUP.lua",
    "Config/Wardrobes/Files/LSFD/TopsEUP.lua",
    "Config/Wardrobes/Files/LSFD/LegsEUP.lua",
    "Config/Wardrobes/Files/LSFD/AccessoiresEUP.lua",
    "Config/Wardrobes/Files/BCFD/TopsEUP.lua",
    "Config/Wardrobes/Files/BCFD/LegsEUP.lua",
    "Config/Wardrobes/Files/BCFD/AccessoiresEUP.lua",
  }
else
  client_scripts {
    "Config/Wardrobes/Files/GEN/TopsVanilla.lua",
    "Config/Wardrobes/Files/GEN/LegsVanilla.lua",
    "Config/Wardrobes/Files/GEN/AccessoiresVanilla.lua",
    "Config/Wardrobes/Files/GEN/GlovesVanilla.lua",
    "Config/Wardrobes/Files/POL/TopsVanilla.lua",
    "Config/Wardrobes/Files/POL/LegsVanilla.lua",
    "Config/Wardrobes/Files/POL/AccessoiresVanilla.lua",
    "Config/Wardrobes/Files/FIRE/TopsVanilla.lua",
    "Config/Wardrobes/Files/FIRE/LegsVanilla.lua",
    "Config/Wardrobes/Files/FIRE/AccessoiresVanilla.lua",
    "Config/Wardrobes/Files/LSPD/TopsVanilla.lua",
  	"Config/Wardrobes/Files/LSPD/LegsVanilla.lua",
  	"Config/Wardrobes/Files/LSPD/AccessoiresVanilla.lua",
    "Config/Wardrobes/Files/BCSO/TopsVanilla.lua",
  	"Config/Wardrobes/Files/BCSO/LegsVanilla.lua",
  	"Config/Wardrobes/Files/BCSO/AccessoiresVanilla.lua",
    "Config/Wardrobes/Files/SASP/TopsVanilla.lua",
    "Config/Wardrobes/Files/SASP/LegsVanilla.lua",
    "Config/Wardrobes/Files/SASP/AccessoiresVanilla.lua",
    "Config/Wardrobes/Files/SAPR/TopsVanilla.lua",
    "Config/Wardrobes/Files/SAPR/LegsVanilla.lua",
    "Config/Wardrobes/Files/SAPR/AccessoiresVanilla.lua",
    "Config/Wardrobes/Files/SWAT/TopsVanilla.lua",
  	"Config/Wardrobes/Files/SWAT/LegsVanilla.lua",
  	"Config/Wardrobes/Files/SWAT/AccessoiresVanilla.lua",
    "Config/Wardrobes/Files/DPOS/TopsVanilla.lua",
    "Config/Wardrobes/Files/DPOS/LegsVanilla.lua",
    "Config/Wardrobes/Files/DPOS/AccessoiresVanilla.lua",
    "Config/Wardrobes/Files/LSFD/TopsVanilla.lua",
    "Config/Wardrobes/Files/LSFD/LegsVanilla.lua",
    "Config/Wardrobes/Files/LSFD/AccessoiresVanilla.lua",
    "Config/Wardrobes/Files/BCFD/TopsVanilla.lua",
    "Config/Wardrobes/Files/BCFD/LegsVanilla.lua",
    "Config/Wardrobes/Files/BCFD/AccessoiresVanilla.lua",
  }
end

-- Loading config parser files
client_scripts {
  "Config/Armories/armory_cl.lua",
  "Config/Garages/garages_cl.lua",
	"Config/Stations/stations_cl.lua",
	"Config/Wardrobes/wardrobe_cl.lua",
	"Config/Wardrobes/CategoryDefinitions_cl.lua",
}

-- Loading marker system
server_scripts {
  "Duty/ranks_sv.lua",
  "HUD/tp_sv.lua",
  "Startup/startup_sv.lua",
}

client_scripts {
  "Duty/ranks_cl.lua",
  "HUD/blips_cl.lua",
	"HUD/crosshair_cl.lua",
	"HUD/markers_cl.lua",
  "HUD/tp_cl.lua",
  "Startup/startup_cl.lua",
}

-- Loading main systems
if ConvarEnableMainScript == true then
  server_scripts {
    "Cleanupthreads/cleanupthreads_sv.lua",
    "Interaction/interaction_sv.lua",
    "Radialmenu/radial_sv.lua",
    "Service/coroner_sv.lua",
    "Service/tow_sv.lua",
    "Sync/sync_sv.lua",
    "Sync/NativeSync_sv.lua",
  }

  client_scripts {
    "Cleanupthreads/cleanupthreads_cl.lua",
    "Config/speechoptions_cl.lua",
    "Interaction/interaction_cl.lua",
    "Interaction/pednopanic_cl.lua",
    "Service/coroner_cl.lua",
  	"Service/tow_cl.lua",
    "Sync/sync_cl.lua",
  	"Sync/NativeSync_cl.lua",
  }
end

-- Loading mission system
if ConvarEnableMainScript == true and ConvarEnableMissionScript == true then
  server_scripts {
    "Callouts/MissionData/AmbientEvents/**/*.lua",
  	"Callouts/MissionData/MissionLoader_gl.lua",
  	"Callouts/MissionHandler_sv.lua",
  	"Callouts/MissionData/MissionInterpreter_sv.lua",
  }

  client_scripts {
    "HUD/MissionTemp_cl.lua",
    "Callouts/MissionData/AmbientEvents/**/*.lua",
  	"Callouts/MissionData/MissionLoader_gl.lua",
  	"Callouts/MissionHandler_cl.lua",
  }
end

-- Loading ESX integration
if ConvarEnableESX == true then
  server_scripts {

  }

  client_scripts {
    "Integration/ESX/ESXIntegration_cl.lua",
  }
end

-- Loading vRP integration
if ConvarEnablevRP == true then
  server_scripts {
    "@vrp/lib/utils.lua",
    "Integration/vRP/vRPIntegration_sv.lua",
  }

  client_scripts {
    "Integration/vRP/lib/Proxy.lua",
    "Integration/vRP/lib/Tunnel.lua",
    "Integration/vRP/vRPIntegration_cl.lua",
  }
end

if not ConvarEnableESX and not ConvarEnablevRP then
  client_scripts {
    "Duty/duty_cl.lua",
  }
end

-- Radialmenu integration
if ConvarEnableMainScript then
  client_scripts {
    "Radialmenu/config.lua",
    "Radialmenu/radialmenu.lua"
  }

  ui_page "Radialmenu/html/menu.html"

  files {
  	"Radialmenu/html/menu.html",
  	"Radialmenu/html/raphael.min.js",
    "Radialmenu/html/wheelnav.min.js",
  }
end
