PolVinewood = {
  handles = {
    VinewoodLSPD = {handle='VinewoodLSPD', name='lspd', stationname = "Los Santos Police Department Vinewood", shortname = "Vinewood"},
    VinewoodHeli = {handle='VinewoodHeli', name='heli', stationname = "Police Station Vinewood Helipad", shortname = "Vinewood Helipad"},
  },
  blips = {
    {x=579.09, y=-4.75, z=101.25, sprite=60, colour=3, alpha=255, name='LSPD Station'},
  },
  tps = {
    {x=654.64, y=-15.25, z=82.93, handle='VinewoodLSPD'},
  },
  markers = {
    arrest = {

    },
    cloth = {
      {x=641.09, y=6.89, z=81.79, handle='VinewoodLSPD'},
    },
    evidence = {

    },
    garage = {
      marker = {
        {x=535.38, y=-21.96, z=70.83, handle='VinewoodLSPD'},
        {x=572.9, y=6.36, z=103.43, handle='VinewoodHeli'},
      },
      spawnpoint = {
        {x=529.89, y=-28.69, z=71.24, angle=211.01, handle='VinewoodLSPD'},
        {x=579.8, y=12.43, z=104.23, angle=0, handle='VinewoodHeli'},
      },
    },
    heal = {

    },
    help = {

    },
    weap = {
      {x=639.82, y=0.9, z=82.79, handle='VinewoodLSPD'}
    },
  },
  corspawn = {
    {x=663.78, y=-18.8, z=83.07, angle=133.36, xa=650.75, ya=-45.69, za=79.19, aa=297.35, handle='VinewoodLSPD', name='LSPD Station Vinewood'},
  },
}
