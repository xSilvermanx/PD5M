# PD5M [![Discord][discord-img]][discord-url] [![Release][githubver-img]][githubver-url] [![License][license-img]][license-url]

## Make sure that your resource is written completely lowercase: `pd5m`!
[![Banner][banner-img]][banner-url]


PD5M is a resource for FiveM aiming to provide a functional police-multiplayer to the game. Inspired by LSPDFR and PIS you can take on the role of an officer of the Police Departments to protect and to serve the citizens of San Andreas.

## Features
- Interact with every ped and vehicle on the server
- Talk to civilians, search them, use a drugtest or a breathalyzer
- Seize cars or items, fine peds or arrest them
- Call Coroner and Towtrucks to get rid of dead bodies resp. seized cars
- Departments: LSPD, BCSO, SAHP, SAPR (Park Ranger), SWAT
- Advanced and fully customizable armory, wardrobe and garage - systems
- Full EUP wardrobe support
- Work as a towtruck driver for the DPOS (Department of Public Order and Safety; very limited script-support)
- Wardrobe and Garage support for Fire Department and EMS (no script-support currently)
- Custom TP-script to quickly get you to each station
- Config file pre-set to work with a few mods (listed below)
- Backend: Sync-structure so every client gets the same information of the peds

## Controls
- Use `F3` to enable a crosshair that will help you determine what you are looking at
- Type `/tp` to open the teleport menu that can send you to every police- and DPOS-station
- Type `/rank` to choose your department ranks. If you are displaying rank insignia on your uniform, this command will choose the appropriate rank insignia next time you are in the wardrobe

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

- [EUP Serve & Rescue](https://forum.cfx.re/t/release-eup-serve-and-rescue-law-order-7-5-server-side-update-1-2-now-with-esx-permissions/210892), uploaded by scarefacesg. You only need to install the `eup-stream` part of the download. Remember to activate the correct configurations in pd5m `__resource.lua`.
-
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

## Newest Patch Notes: Update v0.2.4 EUP 9.3

This release updates the wardrobe to EUP-Version 9.3 and includes the
option to save your outfits. It also includes Armories for Tow Trucks
and Fire Departments with Fire Extinguishers and Jerry Cans.

- Armories and Wardrobe have been updated to EUP 9.3
- Json-Database to save outfits for each department
- BCSO has changed to LSSD
- Added Support for SAHP-Station LaMesa by Matus and LSPD-Station Del Perro Pier by Pablito
- Added TP-markers at every department, removed /tp-command
- Added the rank-command into the wardrobe, removed /rank-command
- Added Vehicle-Repair and -Impound/Deletion Markers. They are located at every tow truck station and a few police stations
- Ped Props now get removed when you open the uniform tab in the wardrobe

[discord-img]: https://img.shields.io/badge/Discord-join-blue?style=plastic&logo=discord
[discord-url]: https://discord.gg/3DNTHeT

[githubver-img]: https://img.shields.io/github/v/release/xSilvermanx/PD5M?style=plastic
[githubver-url]: https://github.com/xSilvermanx/PD5M/releases

[license-img]: https://img.shields.io/github/license/xSilvermanx/PD5M?style=plastic
[license-url]: https://github.com/xSilvermanx/PD5M/blob/master/LICENSE

[banner-img]: https://forum.cfx.re/uploads/default/optimized/4X/b/b/0/bb022a8aba80f4e18d4b8865bff06df15849899e_2_690x194.png
[banner-url]: https://forum.cfx.re/t/release-pd5m-multiplayer-pve-police-script-ambient-events
