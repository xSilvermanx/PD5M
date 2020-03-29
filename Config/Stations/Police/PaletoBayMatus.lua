PolPaleto = {
  handles = {
    PaletoBCSO = {handle='PaletoBCSO', name='bcso', stationname = "Sheriff Office Paleto Bay", shortname = "Paleto Bay"},
    PaletoSASP = {handle='PaletoSASP', name='sasp', stationname = "San Andreas Highway Patrol Station Paleto Bay", shortname = "Paleto Bay"},
    PaletoSWAT = {handle='PaletoSWAT', name='swat', stationname = "SWAT Base Paleto Bay", shortname = "Paleto Bay"},
    PaletoHeli = {handle='PaletoHeli', name='heli', stationname = "Sheriff Office Paleto Bay Helipad", shortname = "Paleto Bay Helipad"},
  },
  blips = {
    {x=-445.25, y=6012.7, z=40.15, sprite=60, colour=40, alpha=255, name='SWAT Station'},
    {x=-445.25, y=6012.7, z=40.15, sprite=60, colour=5, alpha=255, name='BCSO Station'},
    {x=-445.25, y=6012.7, z=40.15, sprite=60, colour=0, alpha=255, name='SASP Station'},
  },
  tps = {
    {x=-428.22, y=6028.45, z=31.49, handle='PaletoBCSO'},
    {x=-428.22, y=6028.45, z=31.49, handle='PaletoSASP'},
    {x=-428.22, y=6028.45, z=31.49, handle='PaletoSWAT'},
  },
  markers = {
    arrest = {
      {x=-431.24, y=5997.11, z=31.72, handle='PaletoBCSO'},
    },
    cloth = {
      {x=-440.02, y=5991.87, z=30.72, handle='PaletoBCSO'},
    },
    evidence = {
      {x=-441.95, y=5987.74, z=31.72, handle='PaletoBCSO'},
    },
    garage = {
      marker = {
        {x=-459.27, y=6016.01, z=31.69, handle='PaletoBCSO'},
        {x=-455.5, y=6019.85, z=31.69, handle='PaletoSASP'},
        {x=-458.85, y=6034.11, z=31.54, handle='PaletoSWAT'},
        {x=-457.64, y=5990.87, z=31.5, handle='PaletoHeli'},
      },
      spawnpoint = {
        {x=-479.37, y=6028.13, z=32.34, angle=225.39, handle='PaletoBCSO'},
        {x=-472.23, y=6035.35, z=31.34, angle=228.1, handle='PaletoSASP'},
        {x=-463.08, y=6044.24, z=31.34, angle=140.34, handle='PaletoSWAT'},
        {x=-475.35, y=5988.61, z=31.34, angle=313.99, handle='PaletoHeli'},
      },
    },
    heal = {

    },
    help = {

    },
    weap = {
      {x=-437.64, y=5989.05, z=31.72, handle='PaletoBCSO'},
      {x=-436.09, y=6005.58, z=31.72, handle='PaletoSASP'},
      {x=-438.62, y=6002.82, z=31.72, handle='PaletoSWAT'},
    },
  },
  corspawn = {
    {x=-437.59, y=6040.01, z=32.34, angle=299.42, handle='PaletoBCSO', name='BCSO Paleto Bay'},
  },
}
