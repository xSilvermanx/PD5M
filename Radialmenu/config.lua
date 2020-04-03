-- Menu configuration, array of menus to display
menuConfigs = {
    ['emotes'] = {                                  -- Example menu for emotes when player is on foot
        enableMenu = function()                     -- Function to enable/disable menu handling
          local player = GetPlayerPed(-1)
    			local retval = false
          if PlayerData ~= nil then
            if PlayerData.job ~= nil then
              if PlayerData.job.name ~= nil then
          			if IsPedOnFoot(player) and PlayerData.job.name == 'police' then
          				retval = true
          			end
              end
            end
          end
          return retval
        end,
        data = {                                    -- Data that is passed to Javascript
            keybind = "x",                         -- Wheel keybind to use (case sensitive, must match entry in keybindControls table)
            padkeybind = "DPadDown",
            style = {                               -- Wheel style settings
                sizePx = 600,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {                              -- Array of wheels to display
                {
                    navAngle = 270,                 -- Oritentation of wheel
                    minRadiusPercent = 0.3,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.6,         -- Maximum radius of wheel in percentage
                    labels = {"BREATHALYZER", "FOLLOW", "", "HANDCUFF", "FINE PED"},
                    commands = {"pd5m:int:breathalyzer", "pd5m:int:letpedfollow", "", "pd5m:int:arrestped", "pd5m:int:fineped"}
                },
                {
                    navAngle = 288,                 -- Oritentation of wheel
                    minRadiusPercent = 0.6,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                    labels = {"DRUGTEST", "RUN PLATE", "RUN ID", "CORONER", "TOW", "GRAB", "PACK", "SEIZE CAR", "SEIZE ITEMS", "SEARCH"},
                    commands = {"pd5m:int:drugtest", "pd5m:int:runplate", "pd5m:int:runid", "pd5m:service:callcoroner", "pd5m:tow:calltowtruck", "pd5m:int:grabped", "pd5m:int:packejectped", "pd5m:int:seizecar", "pd5m:int:confiscateitems", "pd5m:int:search"}
                }
            }
        }
    },
    ['vehicles'] = {                                -- Example menu for vehicle controls when player is in a vehicle
        enableMenu = function()                     -- Function to enable/disable menu handling
          local player = GetPlayerPed(-1)
    			local retval = false
          if PlayerData ~= nil then
            if PlayerData.job ~= nil then
              if PlayerData.job.name ~= nil then
                if IsPedInAnyVehicle(player, false) and PlayerData.job.name == 'police' then
                  retval = true
                end
              end
            end
          end
          return retval
        end,
        data = {                                    -- Data that is passed to Javascript
            keybind = "x",                         -- Wheel keybind to use (case sensitive, must match entry in keybindControls table)
            padkeybind = "DPadDown",
            style = {                               -- Wheel style settings
                sizePx = 400,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {                              -- Array of wheels to display
                {
                    navAngle = 315,                 -- Oritentation of wheel
                    minRadiusPercent = 0.4,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                    labels = {"RUNID", "RUNPLATE", "TRAFFIC STOP", "EJECT"},
                    commands = {"pd5m:int:runid", "pd5m:int:runplate", "pd5m:int:initstopcar", "pd5m:int:packejectped"}
                }
            }
        }
    }
}
