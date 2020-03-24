PolMissionRow = {
  handles = {
    MissionRowLSPD = {handle='MissionRowLSPD', name='lspd', stationname = "Los Santos Police Department Mission Row", shortname = "Mission Row"},
    MissionRowHeli = {handle='MissionRowHeli', name='heli', stationname = "Mission Row Police Station Helipad", shortname = "Mission Row Helipad"},
  },
  blips = {
    {x=444.33, y=-985.00, z=43.69, sprite=60, colour=3, alpha=255, name='LSPD Station'},
  },
  tps = {
    {x=414.36, y=-980.25, z=29.45, handle='MissionRowLSPD'},
  },
  markers = {
    arrest = {
      {x=465.64, y=-999.76, z=24.91, handle='MissionRowLSPD'},
    },
    cloth = {
      {x=450.72, y=-992.65, z=29.69, handle='MissionRowLSPD'},
    },
    evidence = {
      {x=474.51, y=-985.79, z=24.91, handle='MissionRowLSPD'},
    },
    garage = {
      marker = {
        {x=458.33, y=-1008.56, z=28.48, handle='MissionRowLSPD'},
        {x=460.29, y=-981.14, z=43.89, handle='MissionRowHeli'},
      },
      spawnpoint = {
        {x=454.36 , y=-1020.67 , z=29.32 , angle=92.07, handle='MissionRowLSPD'},
        {x=449.33, y=-980.75, z=44.69, angle=0, handle='MissionRowHeli'},
      },
    },
    heal = {
      {x=439.68, y=-976.37, z=26.17, handle='MissionRowLSPD'},
    },
    help = {
      {x=435.18, y=-974.71, z=30.71, handle='MissionRowLSPD'},
    },
    weap = {
      {x=452.17, y=-980.26, z=30.69, handle='MissionRowLSPD'},
    },
  },
  corspawn = {
    {x=401.83, y=-1008.18, z=29.39, angle=0.0, handle='MissionRowLSPD', name='LSPD Station Mission Row'},
  },
}
