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
      {x=-449.59, y=6016.55, z=31.72, handle='PaletoBCSO'},
    },
    cloth = {
      {x=-448.27, y=6008.02, z=30.72, handle='PaletoBCSO'},
    },
    evidence = {
      {x=-449.07, y=6012.54, z=31.72, handle='PaletoBCSO'},
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
      {x=-442.55, y=6012.16, z=31.92, handle='PaletoBCSO'},
      {x=-452.16, y=6005.9, z=31.84, handle='PaletoSASP'},
      {x=-447.14, y=6001.01, z=31.69, handle='PaletoSWAT'},
    },
  },
  corspawn = {
    {x=-429.18, y=6107.82, z=31.82, angle=157.07, xa=-420.78, ya=6054.12, za=31.42, aa=27.13, handle='PaletoBCSO', name='BCSO Paleto Bay'},
  },
}
