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
      {x=834.82, y=-1303.32, z=24.32, handle='LaMesaLSPD'},
    },
    cloth = {
      {x=830.3, y=-1285.26, z=24.32, handle='LaMesaLSPD'},
      {x=832.2, y=-1281.92, z=24.32, handle='LaMesaSASP'},
      {x=831.73, y=-1278.05, z=24.32, handle='LaMesaSWAT'},
      {x=844.65, y=-1281.88, z=24.32, handle='LaMesaLSPD'},
      {x=844.95, y=-1286.25, z=24.32, handle='LaMesaSASP'},
      {x=845.6, y=-1278.05, z=24.32, handle='LaMesaSWAT'},
    },
    evidence = {
      {x=840.53, y=-1293.92, z=24.32, handle='LaMesaLSPD'},
    },
    garage = {
      marker = {
        {x=837.69, y=-1374.57, z=26.31, handle='LaMesaLSPD'},
        {x=852.24, y=-1300.69, z=24.32, handle='LaMesaSASP'},
        {x=863.21, y=-1354.29, z=26.08, handle='LaMesaSWAT'},
      },
      spawnpoint = {
        {x=832.4, y=-1370.61, z=26.13, angle=358.00, handle='LaMesaLSPD'},
        {x=857.1, y=-1310.63, z=23.95, angle=2.19, handle='LaMesaSASP'},
        {x=869.72, y=-1350.24, z=26.14, angle=89.67, handle='LaMesaSWAT'},
      },
    },
    heal = {

    },
    help = {

    },
    weap = {
      {x=834.34, y=-1294.81, z=24.32, handle='LaMesaLSPD'},
      {x=842.69, y=-1307.65, z=24.32, handle='LaMesaSASP'},
      {x=835.08, y=-1299.3, z=24.32, handle='LaMesaSWAT'},
    },
    delete = {
      {x=826.76, y=-1312.9, z=26.13, handle='LaMesaLSPD'},
    },
    tp = {
      {x=846.59, y=-1281.01, z=28.23, handle='LaMesaLSPD'},
    },
  },
  corspawn = {
    {x=805.91, y=-1341.60, z=26.24, angle=0.0, xa=791.14, ya=-1296.48, za=26.26, aa=175.88, handle='LaMesaLSPD', name='LSPD Station La Mesa'},
  },
}
