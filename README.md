# PD5M

## Make sure that your resource is written completely lowercase: `pd5m`!

PD5M is a resource for FiveM aiming to provide a functional police-multiplayer to the game. Inspired by LSPDFR and PIS you can take on the role of an officer of the Police Departments to protect and to serve the citizens of San Andreas.

## Features
- Interact with every ped and vehicle on the server
- Talk to civilians, search them, use a drugtest or a breathalyzer
- Seize cars or items, fine peds or arrest them
- Call Coroner and Towtrucks to get rid of dead bodies resp. seized cars
- Departments: LSPD, BCSO, SASP (State Patrol), SAPR (Park Ranger), SWAT
- Basic working armory, wardrobe, garage
- Work as a towtruck driver for the DPOS (Department of Public Order and Safety; very limited script-support)
- Custom TP-script to quickly get you to each police-station
- Config file pre-set to work with a few mods (listed below)
- Backend: Sync-structure so every client gets the same information of the peds

## Controls
- Use `F3` to enable a crosshair that will help you determine what you are looking at
- Type `/tp` to open the teleport menu that can send you to every police- and DPOS-station

### Keyboard:
- Use `E` to interact with an npc you are looking at. Is also used to interact with every marker on the map
- Hold `X` to open the radialmenu. You can see every action your officer can possibly take. Hover your mouse over an action and release the key (no click necessary) to perform the action. Has different options on foot and in a car

### Controller:
- Use `DPad Right` to interact with an npc you are looking at. Is also used to interact with every marker on the map
- Press `DPad Down` to open the radialmenu. You can see every action your officer can possibly take. Use the right analog stick to move the cursor over an action and press DPad Down again to perform the action. Has different options on foot and in a car

On Foot: To carry out an action, look at a ped and use E or X as described above.

In a Car: The actions will get carried out for the vehicle directly in front of your vehicle.

Make sure to talk to people before taking an action against them (e.g. arresting them). You wouldn't like that in real life either!

## Discord

Join our [Discord](https://discord.gg/3DNTHeT) for the latest announcements, patchnotes and more. Support is offered for this resource over there as well.

## Base (included in PD5M, you don't need to download the resources)
- [radialmenu](https://forum.cfx.re/t/release-radialmenu-configurable-menu-for-chat-commands-using-wheelnav-js/543690) by Brent_Peterson
- [warmenu](https://forum.cfx.re/t/release-0-9-8-final-warmenu-lua-menu-framework/41249) by Warxander

## Installation Instructions
- Download the latest release of PD5M
- Move PD5M to `resource/` directory (or any category)
- Rename the resource folder to `pd5m`
- Make sure the folder name is all lowercase
- Edit your server.cfg to include:

```
ensure pd5m
```

## Recommended Addons
- [vMenu](https://forum.cfx.re/t/vmenu-v3-1-3/88868) by Vespura, used to create an mp-ped as said functionality hasn't been added to PD5M yet
- [Delete Vehicle Script](https://forum.cfx.re/t/release-delete-vehicle-script-1-0-5/7727) by WolfKnight. As traffic loves to get crazy this helps you clean any mess

## Optional Addons
The addons listed below can be used to enhance your playing experience. They are fully supported by PD5M. If you want to use them, simply install them as per their installation instructions. Afterwards open `PD5M/Config/config_cl.lua` and set the respective bool at the top of the file to true.
- [ELS](https://forum.cfx.re/t/release-els-fivem-server-sync-lights-sirens-custom-patterns/64048) by MrDaGree
- [VisualSettings](https://forum.cfx.re/t/release-serverside-visualsettings/201448) by Jarrrk
- [LSPD-Mega-Pack](https://www.lcpdfr.com/downloads/gta5mods/vehiclemodels/17911-los-santos-police-department-mega-pack-els/) by T0y
- [BCSO-Mega-Pack](https://forum.cfx.re/t/els-bcso-mega-pack-fixed-again/81604) by BradM (FiveM-ready version by Kipz)
- [California Highway Patrol](https://forum.cfx.re/t/release-2017-california-highway-patrol-mega-pack-els/64875) by Thehurk (FiveM-ready version by Broderick)
- [traffic-changer](https://github.com/xSilvermanx/traffic-changer) by xSilvermanx
-
- [Community Mission Row PD](https://de.gta5-mods.com/maps/community-mission-row-pd) by SLB2k11
- [Sandy Sheriff Office Extension](https://de.gta5-mods.com/maps/sandy-sheriff-office-extension-mlo-interior) by Bamboozled
- [Paleto Bay Sheriff's Office Extended](https://de.gta5-mods.com/maps/paleto-bay-sheriff-s-office-extended-sp-and-fivem-mlo) by matus77
- [Beaver Bush Park Ranger Station](https://forum.cfx.re/t/release-mlo-beaver-bush-park-ranger-station/1052889) by Smokey7
-
- [Sandy Shores Hospital](https://de.gta5-mods.com/maps/sandy-shores-hospital-mlo-interior-add-on-fivem) by grzybeek
- [Paleto Bay Medical Center](https://de.gta5-mods.com/maps/mlo-paleto-bay-medical-center) by MrBrown1999

## Legal
- You are free to use the resource for your server in any way you want. Only requirement is a tag for PD5M in the server-name (can be any design, e.g. plain text, in brackets, vertical lines ...).
- Creating modifications is encouraged however please publish your own content so everyone can enjoy it.
- At the same time pull-requests are encouraged as well.

## Shoutouts
Shoutouts go out to:
- The teams of LSPDFR and PIS for their inspiration and small code-examples
- IllidanS4 for his [Entity Iterators](https://gist.github.com/IllidanS4/9865ed17f60576425369fc1da70259b2)
- The above mentioned mod authors
- DrBlackError for his tremendous help regarding setting up and maintaining the github.
- MobTV for his contribution to offer ESX-integration.
- ChieF TroN for his contribution to offer vRP-integration.
- Everyone involved in testing the mod prior to this release.
- DrBlackError for creating and managing our wonderful [Discord](https://discord.gg/3DNTHeT)!

## Newest Patch Notes: Ambient Events
- Added a system that provides work for officers while on-duty
- System works fully automatic, doesn't need to be activated nor started
- Added ambient event: car ignoring red lights (randomized, more things may happen)
- Added ambient event: car not in a road-worthy condition (randomized, different things may happen)

Tbh this is not the big update I was hoping to bring to you guys. However Callouts are a huge problem and the first version didn't work at all. Thus I completely removed the Callout-system to publish the mostly-working ambient events. I'll target callouts later on, an idea on how to get a dynamic system done does exist. However this will be extremely complicated so might take a long while.

More patchnotes, sorted for files:
`common_cl_fct.lua`:
- Added sync to automatically create data for all entities when peds drive vehicles
- Mission System Handler added: when using the SyncPedAndVeh()-function the mission system detects the used entities as interacted
- Fixed a bug where vehicles and peds wouldn't have synced data if you used the CheckPlate()-command without prior interaction to the vehicle

`config_cl.lua`:
- Edited the Standard Driving Behavior. The peds should now drive way more predictable, and should not overtake anymore after being stopped.
- The towtrucks and coroners shouldn't drive the wrong direction of streets anymore.

`station config Pillbox Hill Medical Center`:
- Markers at Pillbox Hill Medical Center now heal you instead of displaying the controls.

`cleanupthreads_cl.lua`:
- Added events that trigger SetEntityAsMissionEntity and SetEntityAsNoLongerNeeded on every client
- Added event that sets mission entities to wander if they exist
- Added checks to make sure that mission entities properly get deleted and properly start wandering around after an interaction. Deletion of mission entities only works if the script doesn't get restarted.

`def_gl.lua` and `dev_sv.lua`:
- Every custom list that was defined serverside only is now global (items, weapons, names, offenses, ...)
- Serverside definitions of lists related to the mission system

`interaction_cl.lua`:
- Fixed interaction with E-menu for players with ping > 200 (now problems will occur with a ping > 1000)
- Changed the FinePed()-function so you can directly start typing a sum instead of deleting huge amounts of text
- Upped the distance to grab peds using GrabPed()-function
- included targetveh-support in pedflee()-event. Should properly delete cars now
- peds in vehicles will now drive way slower when sending them on their way after a traffic stop
- Fixed a bug that caused a crash of the interaction-script when trying to set weapons for a ped which shouldn't have them
- Changed the speed at which the peds drive after interacting with you. Should be less speedy in the city, maybe a little bit too slow on the highway.
- Upped the distances at which you can use RunPlate to reflect the changes made to TrafficStops
- Set the max cruise speed of fleeing targets in vehicles higher and changed their driving style to be less chaotic. Chases should be harder now.
- Deleted Blips for fleeing peds. Chases should be harder now.
- Deleted Blips for hostile peds that get triggered through the interaction script.
- Fixed a bug where peds you interacted with wouldn't get properly marked as no longer needed.

`interaction_sv.lua`:
- Fixed a bug where illegal weapons for peds would generate out of the list for legal weapons thus rendering illegal weapons never used
- Added `flagismissionped` which if set prevents dead bodies from despawning without calling a coroner. Used for mission peds.

`markers_cl.lua`:
- Deleted large chunks of commented code that was left on accident
- Changed the creation of the vehicle blip such that it is not named 'Getaway Vehicle' anymore

`towtruck_cl.lua`, `towtruck_sv.lua`, `coroner_cl.lua` and `coroner_sv.lua`:
- Changed distances and speeds of the coroner during approach and on-scene. Should behave way calmer now
- Hopefully fixed a bug where the coroner would sometimes only pick up the first dead body. He'd go to every body, pick them up, the bodies would disappear and reappear almost instantly.
- Fixed towtruck and coroner spawning with incorrect orientation (should work 95% of the time now, last 5% are not a bug but a result of how the script works)

`startup_cl.lua`:
Deactivated dispatch services for cruising PD and pulled over PD

