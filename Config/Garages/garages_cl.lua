-- Config handler for garage-data. Do not edit anything in here.

ListLSPDGarage = {}
ListBCSOGarage = {}
ListSASPGarage = {}
ListSAPRGarage = {}
ListSWATGarage = {}
ListDPOSGarage = {}
ListHELIGarage = {}

table.insert(ListLSPDGarage, LSPDGarage)
table.insert(ListBCSOGarage, BCSOGarage)
table.insert(ListSASPGarage, SASPGarage)
table.insert(ListSAPRGarage, SAPRGarage)
table.insert(ListSWATGarage, SWATGarage)
table.insert(ListDPOSGarage, DPOSGarage)
table.insert(ListHELIGarage, HELIGarage)

-- LSPD Tables init
local ListLSPDCarnames = {}
local ListLSPDCarhandles = {}

for i, vehicle in ipairs(LSPDGarage) do
  table.insert(ListLSPDCarnames, vehicle.name)
  table.insert(ListLSPDCarhandles, vehicle.handle)
end

table.insert(ListLSPDGarage, ListLSPDCarnames)
table.insert(ListLSPDGarage, ListLSPDCarhandles)

-- BCSO Tables init
local ListBCSOCarnames = {}
local ListBCSOCarhandles = {}

for i, vehicle in ipairs(BCSOGarage) do
  table.insert(ListBCSOCarnames, vehicle.name)
  table.insert(ListBCSOCarhandles, vehicle.handle)
end

table.insert(ListBCSOGarage, ListBCSOCarnames)
table.insert(ListBCSOGarage, ListBCSOCarhandles)

-- SASP Tables init
local ListSASPCarnames = {}
local ListSASPCarhandles = {}

for i, vehicle in ipairs(SASPGarage) do
  table.insert(ListSASPCarnames, vehicle.name)
  table.insert(ListSASPCarhandles, vehicle.handle)
end

table.insert(ListSASPGarage, ListSASPCarnames)
table.insert(ListSASPGarage, ListSASPCarhandles)

-- SAPR Tables init
local ListSAPRCarnames = {}
local ListSAPRCarhandles = {}

for i, vehicle in ipairs(SAPRGarage) do
  table.insert(ListSAPRCarnames, vehicle.name)
  table.insert(ListSAPRCarhandles, vehicle.handle)
end

table.insert(ListSAPRGarage, ListSAPRCarnames)
table.insert(ListSAPRGarage, ListSAPRCarhandles)

-- SWAT Tables init
local ListSWATCarnames = {}
local ListSWATCarhandles = {}

for i, vehicle in ipairs(SWATGarage) do
  table.insert(ListSWATCarnames, vehicle.name)
  table.insert(ListSWATCarhandles, vehicle.handle)
end

table.insert(ListSWATGarage, ListSWATCarnames)
table.insert(ListSWATGarage, ListSWATCarhandles)

-- DPOS Tables init
local ListDPOSCarnames = {}
local ListDPOSCarhandles = {}

for i, vehicle in ipairs(DPOSGarage) do
  table.insert(ListDPOSCarnames, vehicle.name)
  table.insert(ListDPOSCarhandles, vehicle.handle)
end

table.insert(ListDPOSGarage, ListDPOSCarnames)
table.insert(ListDPOSGarage, ListDPOSCarhandles)

-- HELI Tables init
local ListHELICarnames = {}
local ListHELICarhandles = {}

for i, vehicle in ipairs(HELIGarage) do
  table.insert(ListHELICarnames, vehicle.name)
  table.insert(ListHELICarhandles, vehicle.handle)
end

table.insert(ListHELIGarage, ListHELICarnames)
table.insert(ListHELIGarage, ListHELICarhandles)
