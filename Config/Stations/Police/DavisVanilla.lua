PolDavis = {
  handles = {
    DavisSWAT = {handle='DavisSWAT', name='swat', stationname = "SWAT Base Davis", shortname = "Davis"},
    DavisLSPD = {handle='DavisLSPD', name='lspd', stationname = "Los Santos Police Department Davis", shortname = "Davis"},
    DavisHeli = {handle='DavisHeli', name='heli', stationname = "Davis Police Station Helipad", shortname = "Davis Helipad"},
  },
  blips = {
    {x=372.14, y=-1594.24, z=36.95, sprite=60, colour=40, alpha=255, name='SWAT Station'},
    {x=372.14, y=-1594.24, z=36.95, sprite=60, colour=3, alpha=255, name='LSPD Station'},
  },
  tps = {
    {x=365.43, y=-1573.81, z=29.24, handle='DavisLSPD'},
    {x=365.43, y=-1573.81, z=29.24, handle='DavisSWAT'},
  },
  markers = {
    arrest = {

    },
    cloth = {
      {x=354.75, y=-1589.48, z=28.29, handle='DavisLSPD'},
    },
    evidence = {

    },
    garage = {
      marker = {
      	{x=370.07, y=-1608.34, z=29.49, handle='DavisLSPD'},
        {x=377.61, y=-1621.98, z=29.49, handle='DavisSWAT'},
        {x=375.01, y=-1602.32, z=37.15, handle='DavisHeli'},
      },
      spawnpoint = {
        	{x=377.89, y=-1613.56, z=30.29, angle=226.27, handle='DavisLSPD'},
          {x=380.7, y=-1626.98, z=30.12, angle=321.33, handle='DavisSWAT'},
          {x=362.94, y=-1598.45, z=37.95, angle=317.67, handle='DavisHeli'},
      },
    },
    heal = {

    },
    help = {

    },
    weap = {
      {x=360.53, y=-1584.36, z=29.29, handle='DavisLSPD'},
      {x=371.83, y=-1626.21, z=29.29, handle='DavisSWAT'},
    },
  },
  corspawn = {
    {x=368.48, y=-1568.78, z=29.26, angle=232.39, xa=395.25, ya=-1570.28, za=29.34, aa=49.09, handle='DavisLSPD', name='LSPD Station Davis'},
  },
}
