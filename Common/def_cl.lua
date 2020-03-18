DisplayingList = {} -- lists which peds are talking (needs to be updated)
CurrentlyDisplayingList = {} -- lists which peds are currently talking (needs to be updated)

ClientPedList = {} --lists which Peds are known to this client
ClientPedStoppedList = {} --lists which Peds are currently stopped by any officer (synced to server)
ClientPedTalkingList = {} --lists which Peds are currently talking to an officer (synced to server)
ClientPedNoFearList = {} --lists which Peds currently have the SetBlockingOfNonTemporaryEvents-flag set
ClientPedArrestedList = {} --lists which Peds are currently handcuffed
ClientPedNoTalkList = {} --lists which Peds can't currently be spoken to (mostly fleeing or fighting; aim their weapon at them to get them to surrender)
ClientPedConfigList = {} --lists the ConfigFlags as set by interaction_sv.lua for the Peds known to this client
ClientPedBlipList = {} --lists the Blips that are currently set on peds by the client
ClientPedSearchList = {} --used to sync aspects of the database that are currently being search. Shortlived, entries are deleted instantly

ClientPlayerGotPedIDList = {} --lists which peds gave the offier their id
ClientPlayerGotPedDriverLicenceList = {} --lists which peds gave the officer their driver's licence. Currently not used
ClientPlayerGotPedWeaponPermitList = {} --lists which peds gave the officer their weapon permit. Currently not used

ClientVehList = {} -- lists which vehicles are known to this client
ClientVehConfigList = {} -- lists the ConfigFlags as set by interaction_sv.lua for the vehicles known to this client
ClientVehTowingList = {} -- lists the vehicles that a tow truck has been called for
ClientSelfVehTowingList = {} -- lists the vehicles that the client called a tow truck for (client-side only)
ClientSelfTowTruckList = {} -- lists the towtrucks that the client dispatched. The index of the tow truck matches the index of the vehicle in ClientSelfVehTowingList (client-side only)

ClientItemsList = {} -- lists every item which the officer has confiscated (client-side only)
ClientFollowingList = {} -- lists every ped which is following the officer (client-side only)

-- globals needed to check for grabbed targets
flag_grabbed = false
grabbedTarget = nil
