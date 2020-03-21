-- config variables

-- ped creation variables
-- -- info: the chances below are given in percent. So a variable of 1.50 stands for 1.5%. Please do only use variables with two decimal place between 0.00 and 100.00.
PedDruggedChance = 0.50 -- Chance that the ped is drugged (standard: 0.50)
PedDrunkChance = 4.00 -- Chance that the ped is drunk (standard: 4.00)
PedWantedChance = 1.50 -- Chance that the ped is wanted (standard: 1.50)
PedNoIDChance = 1.00 -- Chance that the ped has no ID (standard: 1.00)
PedNoDriverLicenceChance = 4.00 -- Chance that the ped has no drivers licence (standard: 4.00)
PedNoWeaponLicenceChance = 60.00 -- Chance that the ped has no weapon permit (standard: 40.00)
PedIllegalItemDrugChance = 50.00 -- Chance for possession of drugs if the ped is drugged (standard: 50.00)

-- Ped creation weapon /item base variables
PedMeleeBaseChance = 6.00 -- Base chance that the ped has a melee weapon (standard: 6.00)
PedLegalWeapBaseChance = 5.00 -- Base chance that the ped has a legal weapon (standard: 5.00)
PedIllegalWeapBaseChance = 4.00 -- Base chance that the ped has an illegal weapon (standard: 4.00)
PedIllegalItemBaseChance = 4.00 -- Base chance that the ped has an illegal weapon (standard: 4.00)

-- The following modifiers add or substract a specific chance from the above weapon / item base variables.
-- Please make sure that you neither fall below 0.00 or exceed 100.00 for any variable.
PedMeleeWeaponLicenceModifier = -1.00 -- chance modifier for a melee weapon if the ped has a weapon permit (standard: -1.00)
PedMeleeWeaponWantedModifier = 2.00 -- chance modifier for a melee weapon if the ped is wanted (standard: +2.00)

PedLegalWeapLicenceModifier = 45.00 -- chance modifier for a legal weapon if the ped has a weapon permit (standard: +48.00)
PedLegalWeapWantedModifier = 15.00 -- chance modifier for a legal weapon if the ped is wanted (standard: +8.00)

PedIllegalWeapLicenceModifier = -4.00 -- chance modifier for an illegal weapon if the ped has a weapon permit (standard: -1.00)
PedIllegalWeapWantedModifier = 26.00 -- chance modifier for an illegal weapon if the ped is wanted (standard: +19.00)

PedIllegalItemWantedModifier = 6.00 -- chance modifier for an illegal item if the ped is wanted (standard: +6.00)

-- Ped creation behavior base variables
PedHideIDBaseChance = 1.00 -- Base chance that the ped hides their ID (standard: 1.00)
PedFleeInstantBaseChance = 1.00 -- Base chance that the ped flees instantly when interacted to (standard: 1.00)
PedFightBaseChance = 0.50 -- Base chance that the ped will fight instead of fleeing (standard: 0.50)

-- The following modifiers add or substract a specific chance from the above behavior base variables.
-- Please make sure that you neither fall below 0.00 or exceed 100.00 for any variable.
PedHideIDWantedModifier = 29.00 -- chance modifier to hide the ID if the ped is wanted (standard: +29.00)
PedHideIDIllegalItemModifier = 2.00 -- chance modifier to hide the ID if the ped has an illegal item (standard: +2.00)
PedHideIDIllegalWeaponModifier = 4.00 -- chance modifier to hide the ID if the ped has an illegal weapon (standard: +4.00)
PedHideIDDruggedModifier = -0.10 -- chance modifier to hide the ID if the ped is drugged (standard: -0.10)
PedHideIDDrunkModifier = -0.10 -- chance modifier to hide the ID if the ped is drunk (standard: -0.10)

PedFleeInstantWantedModifier = 49.00 -- chance modifier for the ped to flee instantly if they are wanted (standard: +49.00)
PedFleeInstantIllegalItemModifier = 4.00 -- chance modifier for the ped to flee instantly if they got an illegal item (standard: +4.00)
PedFleeInstantIllegalWeaponModifier = 9.00 -- chance modifier for the ped to flee instantly if they got an illegal weapon (standard: +9.00)
PedFleeInstantDruggedModifier = 49.00  -- chance modifier for the ped to flee instantly if they are drugged (standard: +49.00)
PedFleeInstantDrunkModifier = 19.00 -- chance modifier for the ped to flee instantly if they are drunk (standard: +19.00)

PedFightWantedModifier = 1.50 -- chance modifier for the ped to fight instead of fleeing if they are wanted (standard: +1.50)
PedFightIllegalItemModifier = 0.50 -- chance modifier for the ped to fight instead of fleeing if they got an illegal item (standard: +0.50)
PedFightIllegalWeaponModifier = 29.50 -- chance modifier for the ped to fight instead of fleeing if they got an illegal weapon (standard: +29.50)
PedFightDruggedModifier = 39.50 -- chance modifier for the ped to fight instead of fleeing if they are drugged (standard: +39.50)
PedFightDrunkModifier = 9.50 -- chance modifier for the ped to fight instead of fleeing if they are drunk (standard: +9.50)

-- Vehicle creation variables

VehOwnerWantedChance = 1.00 -- chance that the owner of an empty car is wanted (standard: 1.00)
VehIllegalItemChance = 5.00 -- chance that an illegal item is in the car (standard: 5.00)

-- general variables
ActivateTPfunction = true -- activates the /tp-function.
-- to disable single teleporting options edit the lists in tp_cl.lua lines 15 to 26.

