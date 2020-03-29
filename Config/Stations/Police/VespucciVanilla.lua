PolVespucci = {
  handles = {
    VespucciLSPD = {handle='VespucciLSPD', name='lspd', stationname = "Los Santos Police Department Vespucci", shortname = "Vespucci"},
	  VespucciSWAT = {handle='VespucciSWAT', name='swat', stationname = "SWAT Base Vespucci", shortname = "Vespucci"},
    VespucciHeli = {handle='VespucciHeli', name='heli', stationname = "Police Station Vespucci Helipad", shortname = "Vespucci Helipad"},
  },
  blips = {
    {x=-1109.59, y=-846.52, z=19.32, sprite=60, colour=40, alpha=255, name='SWAT Station'},
    {x=-1109.59, y=-846.52, z=19.32, sprite=60, colour=3, alpha=255, name='LSPD Station'},
  },
  tps = {
    {x=-1111.71, y=-849.3, z=19.32, handle='VespucciLSPD'},
    {x=-1111.71, y=-849.3, z=19.32, handle='VespucciSWAT'},
  },
  markers = {
    arrest = {

    },
    cloth = {
      {x=-1105.91, y=-850.1, z=18.32, handle='VespucciLSPD'},
    },
    evidence = {

    },
    garage = {
      marker = {
        {x=-1078.67, y=-856.83, z=5.24, handle='VespucciLSPD'},
        {x=-1113.26, y=-849.27, z=13.65, handle='VespucciSWAT'},
        {x=-1104.65, y=-831.24, z=37.88, handle='VespucciHeli'},
      },
      spawnpoint = {
        {x=-1073.02, y=-854.92, z=5.87, angle=215.99, handle='VespucciLSPD'},
        {x=-1126.52, y=-841.38, z=13.38, angle=134.38, handle='VespucciSWAT'},
        {x=-1095.38, y=-835.22, z=38.68, angle=305.76, handle='VespucciHeli'},
      },
    },
    heal = {

    },
    help = {

    },
    weap = {
      {x=-1108.69, y=-845.55, z=19.32, handle='VespucciLSPD'},
      {x=-1109.7, y=-853.8, z=13.53, handle='VespucciSWAT'},
    },
  },
  corspawn = {
    {x=-1145.59, y=-826.04, z=14.77, angle=309.96, xa=-1124.69, ya=-793.47, za=17.37, aa=128.82, handle='VespucciLSPD', name='LSPD Station Vespucci'},
  },
}
