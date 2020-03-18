-- lists every config that is available in a PedConfigList
-- notable entries:
-- VehicleNetID: if the ped owns (=drives) a vehicle the VehicleNetID-entry is set to the Network ID of the vehicle.
PedVariableListGlobal = {'PedGender', 'FirstName', 'LastName', 'BirthYear', 'BirthMonth', 'BirthDay', 'RandomID', 'RandomLicenceID', 'RandomWeaponID', 'VehicleNetID', 'PedUnusualActivity', 'AlliesList', 'flagfleeinstant', 'flagfight', 'flagdrug', 'savedrug', 'savedruglevel', 'flagdrunk', 'savedrunklevel', 'flagwanted', 'saveoffense', 'flagpedillegalweapon', 'savepedweapons', 'flagpedillegalitem', 'savepeditems', 'flagid', 'flaghideid', 'flaglicence', 'flagweaponlicence', 'resistmodifier', 'flagallowbreathalyzer', 'flagallowdrugtest', 'flagallowpersonsearch', 'flagallowcarsearch', 'flagallowcarseizure', 'flagallowitemconfiscation', 'flagallowarrest', 'flagallowfine'}

-- lists every config that is available in a VehConfigList
-- notable entries:
-- PedNetID: if the car is being driven by a ped, the PedNetID-entry is set to the Network ID of the ped.
VehVariableListGlobal = {'Registration', 'PedNetID', 'savevehitems', 'flagvehillegalitem', 'PedGender', 'FirstName', 'LastName', 'BirthYear', 'BirthMonth', 'BirthDay'}

ClientPedVariableList = PedVariableListGlobal
ClientVehVariableList = VehVariableListGlobal

PedVariableList = PedVariableListGlobal
VehVariableList = VehVariableListGlobal
