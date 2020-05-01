-- see def_cl.lua for explanations for the below lists
PedList = {}
PedStoppedList = {}
PedTalkingList = {}
PedNoFearList = {}
PedArrestedList = {}
PedNoTalkList = {}
PedConfigList = {}

VehList = {}
VehConfigList = {}
VehTowingList = {}

-- Mission Handler list definitions
PlayerList = {} -- Global list which saves the currently active players
PlayerCanTriggerAmbientEvents = {} -- list which saves the player state for triggering ambient events. Is either true or false
PlayerCanTriggerAmbientEventsIPairsList = {} -- list which saves the player ids that can currently trigger ambient events
PlayerRunsAmbientEvent = {} -- list which saves the ambient event ID that the player with the NetworkID-[index] currently runs.
CurrentlyRunningAmbientEventsList = {} -- list which saves the entity data of every event that has been created
