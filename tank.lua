local component = require("component")
local sides = require("sides")

local record = {}
local tanklevel = 0

f = io.open("transposer.txt","r")
for l in f:lines() do
  address0, lower0, higher0, tankside0, interfaceside0, interfaceemptyslot0, interfacefilledslot0 = string.match(l, "([^,]+),([0-9]+),([0-9]+),([A-Za-z]+),([A-Za-z]+),([0-9]+),([0-9]+)")
  if address0 then
    r = {}
    r[1] = component.proxy(address0)
    r[2] = tonumber(lower0)
    r[3] = tonumber(higher0)
    r[4] = sides[tankside0]
    r[5] = sides[interfaceside0]
    r[6] = tonumber(interfaceemptyslot0)
    r[7] = tonumber(interfacefilledslot0)
    table.insert(record, r)
  end
end

print("count=" .. #record)

while true do
  for k, r in pairs(record) do
    transposer = r[1]
    lower = r[2]
    higher = r[3]
    tankside = r[4]
    interfaceside = r[5]
    interfaceemptyslot = r[6]
    interfacefilledslot = r[7]
    tanklevel = transposer.getTankLevel(tankside)
    os.sleep(0.05)
    if tanklevel < lower then
      transposer.transferItem(interfaceside, tankside, 1, interfacefilledslot, 1)
      os.sleep(1)
      transposer.transferItem(tankside, interfaceside, 1, 2, 9)
    elseif tanklevel > higher then
      transposer.transferItem(interfaceside, tankside, 1, interfaceemptyslot, 1)
      os.sleep(1)
      transposer.transferItem(tankside, interfaceside, 1, 2, 9)
    end
  end
  os.sleep(5)
end