# Radialmenu-integration to PD5M

This resource was written by Brent_Peterson. Please refer to main readme.md for a link to his resource.
The following changes have been made to radialmenu for PD5M:

- added radial_sv.lua to trigger events that should be on the radialmenu
- changed config.lua to customize the wheels and edit when they show
- changed radialmenu.lua to allow the player to control their ped while a wheel is shown
- changed html/menu.html: this version of radialmenu is controlled by hovering the mouse over a tile and releasing the key pressed to show the wheel. The original version requires clicking on the tile
- added full controller support, rewrote small portions of the code to reflect this and added a way to control the cursor with the right analog stick
