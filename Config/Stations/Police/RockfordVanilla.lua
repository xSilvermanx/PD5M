PolRockford = {
  handles = {
    RockfordLSPD = {handle='RockfordLSPD', name='lspd', stationname = "Los Santos Police Department Rockford Hills", shortname = "Rockford Hills"},
    RockfordSWAT = {handle='RockfordSWAT', name='swat', stationname = "SWAT Base Rockford Hills", shortname = "Rockford Hills"},
  },
  blips = {
    {x=-562.36, y=-128.88, z=51.99, sprite=60, colour=40, alpha=255, name='SWAT Station'},
  	{x=-562.36, y=-128.88, z=51.99, sprite=60, colour=3, alpha=255, name='LSPD Station'},
  },
  tps = {
    {x=-550.97, y=-139.73, z=38.47, handle='RockfordLSPD'},
    {x=-550.97, y=-139.73, z=38.47, handle='RockfordSWAT'},
  },
  markers = {
    arrest = {

    },
    cloth = {
      {x=-556.78, y=-130.51, z=37.04, handle='RockfordLSPD'},
    },
    evidence = {

    },
    garage = {
      marker = {
        {x=-566.39, y=-133.16, z=38.17, handle='RockfordLSPD'},
        {x=-576.12, y=-139.85, z=37.11, handle='RockfordSWAT'},
      },
      spawnpoint = {
        {x=-570.54, y=-145.18, z=38.31, angle=202.49, handle='RockfordLSPD'},
        {x=-581.2, y=-135.9, z=35.82, angle=200.72, handle='RockfordSWAT'},
      },
    },
    heal = {

    },
    help = {

    },
    weap = {
      {x=-561.31, y=-132.54, z=38.03, handle='RockfordLSPD'},
      {x=-578.7, y=-133.71, z=35.82, handle='RockfordSWAT'},
    },
  },
  corspawn = {
    {x=-563.73, y=-153.27, z=38.09, angle=112.09, xa=-562.97, ya=-158.53, za=38.13, aa=290.86, handle='RockfordLSPD', name='LSPD Station Rockford Hills'},
  },
}
