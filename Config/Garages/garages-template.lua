LSPDGarage = {
  {
    name = "", --Name of the Car: String to be shown as a Menu Option
    handle = "", --Handle of the Car: Ingame-string used to spawn the car
    LicensePlateType = {}, -- List with numbers that can be used for the License Plate Design
    LicensePlateText = {}, -- List with either: "None" -> no license plate text; "Custom" -> player-chooseable license plate text; multiple strings of which a random will be taken. Each string may only contain 8 characters.
    PrimaryColors = { -- List of Primary Colors: {No., "Name"}
      {, ""},
    },
    SecondaryColors = { -- List of Secondary Colors: {No., "Name"}
      {, ""},
    },
    Liveries = { -- List of possible liveries: {No., "Name"}. If no livery is available empty the list.
      {, ""},
    },
    Extras = { -- list of Extras. From each list only one can be activated. If no extra is available empty the list.
      {
        name = "",
        Options = {
          {, ""},
        },
      },
    },
  },

}
