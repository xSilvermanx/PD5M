PlayerRanks = {1, 1, 1, 1, 1, 1, 1, 1}

LSPDRanks = {
  "Police Officer I",
  "Police Officer II",
  "Police Officer III",
  "Police Officer III+1",
  "Detective I",
  "Detective II",
  "Detective III",
  "Sergeant I",
  "Sergeant II",
  "Lieutenant",
  "Captain",
  "Commander",
  "Deputy Chief Of Police",
  "Assistant Chief Of Police",
  "Chief Of Police",
}

BCSORanks = {
  "Deputy I",
  "Deputy II",
  "Corporal I",
  "Corporal II",
  "Sergeant I",
  "Sergeant II",
  "Lieutenant",
  "Captain",
  "Commander",
  "Assistant Sheriff",
  "Undersheriff",
  "Sheriff",
}

SASPRanks = {
  "Officer I",
  "Officer II",
  "Sergeant I",
  "Sergeant II",
  "Lieutenant",
  "Captain",
  "Assistant Chief",
  "Chief",
  "Assistant Commissioner",
  "Deputy Commissioner",
  "Commissioner",
}

SAPRRanks = {
  "Ranger",
  "Supervisor",
  "Superintendent I",
  "Superintendent II",
  "Superintendent III",
  "Superintendent IV",
  "Division Chief",
  "Deputy Director",
  "Chief Deputy Director",
  "Director",
}

SWATRanks = {
  "SWAT Officer",
  "SWAT Element Leader",
  "SWAT Sergeant",
  "SWAT Lieutenant",
  "SWAT Commander",
}

DPOSRanks = {
  "Driver",
  "Senior Driver",
  "Supervisor",
  "Deputy Director",
  "Director",
}

LSFDRanks = {
  "Firefighter",
  "Firefighter / EMT",
  "Firefighter / Paramedic",
  "Driver Engineer",
  "Lieutenant",
  "Captain",
  "Battalion Chief",
  "Assistant Chief",
  "Fire Chief",
}

BCFDRanks = {
  "Firefighter",
  "Firefighter / EMT",
  "Firefighter / Paramedic",
  "Driver Engineer",
  "Lieutenant",
  "Captain",
  "Battalion Chief",
  "Assistant Chief",
  "Fire Chief",
}

local RankMenuOpen = false

RegisterNetEvent('pd5m:duty:openrankmenu')
AddEventHandler('pd5m:duty:openrankmenu', function()
  RankMenuOpen = true
end)

CreateThread(function()

  local LSPDRankCurrentIndex = 1
  local LSPDRankSelectedIndex = 1

  local BCSORankCurrentIndex = 1
  local BCSORankSelectedIndex = 1

  local SASPRankCurrentIndex = 1
  local SASPRankSelectedIndex = 1

  local SAPRRankCurrentIndex = 1
  local SAPRRankSelectedIndex = 1

  local SWATRankCurrentIndex = 1
  local SWATRankSelectedIndex = 1

  local DPOSRankCurrentIndex = 1
  local DPOSRankSelectedIndex = 1

  local LSFDRankCurrentIndex = 1
  local LSFDRankSelectedIndex = 1

  local BCFDRankCurrentIndex = 1
  local BCFDRankSelectedIndex = 1

  WarMenu.CreateMenu("RankMenu", "Department Ranks")

  while true do
    if WarMenu.IsMenuOpened("RankMenu") then
      if WarMenu.ComboBox('LSPD Rank', LSPDRanks, LSPDRankCurrentIndex, LSPDRankSelectedIndex, function(currentIndex, selectedIndex)
          LSPDRankCurrentIndex = currentIndex
          selectedIndex = currentIndex
          LSPDRankSelectedIndex = selectedIndex
          PlayerRanks[1] = LSPDRankSelectedIndex
        end) then
      elseif WarMenu.ComboBox('BCSO Rank', BCSORanks, BCSORankCurrentIndex, BCSORankSelectedIndex, function(currentIndex, selectedIndex)
          BCSORankCurrentIndex = currentIndex
          selectedIndex = currentIndex
          BCSORankSelectedIndex = selectedIndex
          PlayerRanks[2] = BCSORankSelectedIndex
        end) then
      elseif WarMenu.ComboBox('SAHP Rank', SASPRanks, SASPRankCurrentIndex, SASPRankSelectedIndex, function(currentIndex, selectedIndex)
          SASPRankCurrentIndex = currentIndex
          selectedIndex = currentIndex
          SASPRankSelectedIndex = selectedIndex
          PlayerRanks[3] = SASPRankSelectedIndex
        end) then
      elseif WarMenu.ComboBox('SAPR Rank', SAPRRanks, SAPRRankCurrentIndex, SAPRRankSelectedIndex, function(currentIndex, selectedIndex)
          SAPRRankCurrentIndex = currentIndex
          selectedIndex = currentIndex
          SAPRRankSelectedIndex = selectedIndex
          PlayerRanks[4] = SAPRRankSelectedIndex
        end) then
      elseif WarMenu.ComboBox('SWAT Rank', SWATRanks, SWATRankCurrentIndex, SWATRankSelectedIndex, function(currentIndex, selectedIndex)
          SWATRankCurrentIndex = currentIndex
          selectedIndex = currentIndex
          SWATRankSelectedIndex = selectedIndex
          PlayerRanks[5] = SWATRankSelectedIndex
        end) then
      elseif WarMenu.ComboBox('DPOS Rank', DPOSRanks, DPOSRankCurrentIndex, DPOSRankSelectedIndex, function(currentIndex, selectedIndex)
          DPOSRankCurrentIndex = currentIndex
          selectedIndex = currentIndex
          DPOSRankSelectedIndex = selectedIndex
          PlayerRanks[6] = DPOSRankSelectedIndex
        end) then
      elseif WarMenu.ComboBox('LSFD Rank', LSFDRanks, LSFDRankCurrentIndex, LSFDRankSelectedIndex, function(currentIndex, selectedIndex)
          LSFDRankCurrentIndex = currentIndex
          selectedIndex = currentIndex
          LSFDRankSelectedIndex = selectedIndex
          PlayerRanks[7] = LSFDRankSelectedIndex
        end) then
      elseif WarMenu.ComboBox('BCFD Rank', BCFDRanks, BCFDRankCurrentIndex, BCFDRankSelectedIndex, function(currentIndex, selectedIndex)
          BCFDRankCurrentIndex = currentIndex
          selectedIndex = currentIndex
          BCFDRankSelectedIndex = selectedIndex
          PlayerRanks[8] = BCFDRankSelectedIndex
        end) then
      elseif WarMenu.Button('Close Menu') then
        RankMenuOpen = false
        WarMenu.CloseMenu()
      end
      WarMenu.Display()
    elseif RankMenuOpen then
      WarMenu.OpenMenu("RankMenu")
    end
    Wait(0)
  end
end)




--[[LSPDRanks = {
  {"Police Officer I", "PO I"},
  {"Police Officer II", "PO II"},
  {"Police Officer III", "PO III"},
  {"Police Officer III+1", "PO III + 1"},
  {"Detective I", "Det I"},
  {"Detective II", "Det II"},
  {"Detective III", "Det III"},
  {"Sergeant I", "Sgt I"},
  {"Sergeant II", "Sgt II"},
  {"Lieutenant", "Lt"},
  {"Captain", "Cpt"},
  {"Commander", "Cmdr"},
  {"Deputy Chief Of Police", "Dep COP"},
  {"Assistant Chief Of Police", "AC"},
  {"Chief Of Police", "COP"},
}

BCSORanks = {
  {"Deputy I", "Dep I"},
  {"Deputy II", "Dep II"},
  {"Corporal I", "Cpl I"},
  {"Corporal II", "Cpl II"},
  {"Sergeant I", "Sgt I"},
  {"Sergeant II", "Sgt II"},
  {"Lieutenant", "Lt"},
  {"Captain", "Cpt."},
  {"Commander", "Cmdr."},
  {"Assistant Sheriff", "Asst Sheriff"},
  {"Undersheriff", "Undersheriff"},
  {"Sheriff", "Sheriff"},
}

SASPRanks = {
  {"Officer I", "PO I"},
  {"Officer II", "PO II"},
  {"Sergeant I", "Sgt I"},
  {"Sergeant II", "Sgt II"},
  {"Lieutenant", "Lt"},
  {"Captain", "Cpt"},
  {"Assistant Chief", "AC"},
  {"Chief", "Chief"},
  {"Assistant Commissioner", "Asst Commr"},
  {"Deputy Commissioner", "Dep Commr"},
  {"Commissioner", "Commr"},
}

SAPRRanks = {
  {"Ranger", "Rngr"},
  {"Supervisor", "Supv"},
  {"Superintendent I", "Super I"},
  {"Superintendent II", "Super II"},
  {"Superintendent III", "Super III"},
  {"Superintendent IV", "Super IV"},
  {"Division Chief", "DVC"},
  {"Deputy Director", "DD"},
  {"Chief Deputy Director", "CDD"},
  {"Director", "Dir"},
}

SWATRanks = {
  {"SWAT Officer", "S OFC"},
  {"SWAT Element Leader", "S EL"},
  {"SWAT Sergeant", "S Sgt"},
  {"SWAT Lieutenant", "S Lt"},
  {"SWAT Commander", "S Cmdr"},
}

DPOSRanks = {
  {"Driver", "Dr"},
  {"Senior Driver", "S Dr"},
  {"Supervisor", "Supv"},
  {"Deputy Director", "DD"},
  {"Director", "Dir"},
}

LSFDRanks = {
  {"Firefighter", "FF"},
  {"Firefighter / EMT", "EMT-B"},
  {"Firefighter / Paramedic", "EMT"},
  {"Driver Engineer", "DE"},
  {"Lieutenant", "Lt"},
  {"Captain", "Cpt"},
  {"Battalion Chief", "BC"},
  {"Assistant Chief", "AC"},
  {"Fire Chief", "FC"},
}

BCFDRanks = {
  {"Firefighter", "FF"},
  {"Firefighter / EMT", "EMT-B"},
  {"Firefighter / Paramedic", "EMT"},
  {"Driver Engineer", "DE"},
  {"Lieutenant", "Lt"},
  {"Captain", "Cpt"},
  {"Battalion Chief", "BC"},
  {"Assistant Chief", "AC"},
  {"Fire Chief", "FC"},
}]]
