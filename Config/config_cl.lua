-- config variables

-- ped variables
NormalDrivingBehavior = 786603 -- sets the standard driving style for peds. Refer to https://vespura.com/drivingstyle/ for more info.
PoliceDrivingBehavior = 525116 -- sets the driving style for AI-Code 3-response. Refer to https://vespura.com/drivingstyle/ for more info.

-- general variables
ActivateBlipsOnMap = true -- shows the department-blips, the hospital-blips and the tow-blips set by PD5M.
ActivateCrosshair = true -- activates the F3-function to display a crosshair in the middle of the screen.
ESXEnabled = false -- ESX integration thanks to MobTV

-- marker variables
ActivateArrestMarkers = true -- activates the arrest markers. Should stay activated.
ActivateClothMarkers = true -- activates the wardrobes.
ActivateHealMarkers = true -- activates the heal-markers at the hospitals.
ActivateGarages = true -- activates garages in general. If set to false no garage will be displayed independently of the rest of the settings.
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

-- Vehicle-Mods
LSPDMegaPackT0y = false -- whether the Los Santos Police Department Mega Pack ELS by t0y is activated
BCSOMegaPackBradM = false -- whether the Blaine County Sheriff Office Mega Pack ELS by BradM is activated
CHFThehurk = false -- whether the California Highway Patrol Mega Pack ELS by Thehurk is activated

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
	list_help_coords = {}
end
