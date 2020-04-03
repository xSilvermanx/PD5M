PolLaMesa = {
  handles = {
    LaMesaLSPD = {handle='LaMesaLSPD', name='lspd', stationname = "Los Santos Police Department La Mesa", shortname = "La Mesa"},
    LaMesaSASP = {handle='LaMesaSASP', name='sasp', stationname = "San Andreas Highway Patrol Station La Mesa", shortname = "La Mesa"},
    LaMesaSWAT = {handle='LaMesaSWAT', name='swat', stationname = "SWAT Base La Mesa", shortname = "La Mesa"},
  },
  blips = {
    {x=824.32, y=-1290.22, z=28.24, sprite=60, colour=40, alpha=255, name='SWAT Station'},
    {x=824.32, y=-1290.22, z=28.24, sprite=60, colour=0, alpha=255, name='SASP Station'},
    {x=824.32, y=-1290.22, z=28.24, sprite=60, colour=3, alpha=255, name='LSPD Station'},
  },
  tps = {
    {x=812.47, y=-1289.88, z=26.29, handle='LaMesaLSPD'},
    {x=812.47, y=-1289.88, z=26.29, handle='LaMesaSASP'},
    {x=812.47, y=-1289.88, z=26.29, handle='LaMesaSWAT'},
  },
  markers = {
    arrest = {

    },
    cloth = {
      {x=823.98, y=-1300.09, z=26.11, handle='LaMesaLSPD'},
    },
    evidence = {

    },
    garage = {
      marker = {
        {x=830.42, y=-1311.42, z=28.34, handle='LaMesaLSPD'},
        {x=818.09, y=-1374.61, z=26.51, handle='LaMesaSASP'},
        {x=849.76, y=-1284.08, z=28.2, handle='LaMesaSWAT'},
      },
      spawnpoint = {
        {x=824.32, y=-1312.97, z=27.12, angle=110.61, handle='LaMesaLSPD'},
        {x=824.09, y=-1371.48, z=27.14, angle=0, handle='LaMesaSASP'},
        {x=854.79, y=-1279.64, z=27.5, angle=21.71, handle='LaMesaSWAT'},
      },
    },
    heal = {

    },
    help = {

    },
    weap = {
      {x=826.67, y=-1290.13, z=28.24, handle='LaMesaLSPD'},
      {x=837.17, y=-1374.39, z=26.31, handle='LaMesaSASP'},
      {x=847.22, y=-1276.27, z=26.47, handle='LaMesaSWAT'},
    },
  },
  corspawn = {
    {x=805.91, y=-1341.60, z=26.24, angle=0.0, xa=791.14, ya=-1296.48, za=26.26, aa=175.88, handle='LaMesaLSPD', name='LSPD Station La Mesa'},
  },
}
