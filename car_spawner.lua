local function isAdmin(player) return IsPlayerAceAllowed(player, "admin") end

RegisterCommand("car", function(source, args) local playerPed = GetPlayerPed(source) if not isAdmin(source) then TriggerClientEvent("chatMessage", source, "[CarSpawner]", {255, 0, 0}, "❌ Du hast keine Berechtigung, dieses Fahrzeug zu spawnen!") return end

local vehicleName = args[1] or "adder"
if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
    TriggerClientEvent("chatMessage", source, "[CarSpawner]", {255, 0, 0}, "❌ Ungültiger Fahrzeugname!")
    return
end

RequestModel(vehicleName)
while not HasModelLoaded(vehicleName) do
    Wait(500)
end

local playerCoords = GetEntityCoords(playerPed)
local vehicle = CreateVehicle(vehicleName, playerCoords.x + 2, playerCoords.y, playerCoords.z, GetEntityHeading(playerPed), true, false)

SetPedIntoVehicle(playerPed, vehicle, -1)

if #args > 1 then
    local r, g, b = tonumber(args[2]), tonumber(args[3]), tonumber(args[4])
    if r and g and b then
        SetVehicleCustomPrimaryColour(vehicle, r, g, b)
    end
end

SetEntityAsNoLongerNeeded(vehicle)
SetModelAsNoLongerNeeded(vehicleName)

TriggerClientEvent("chatMessage", source, "[CarSpawner]", {0, 255, 0}, "✅ Fahrzeug " .. vehicleName .. " wurde gespawnt!")

end, false)

RegisterCommand("delcar", function(source, args) if not isAdmin(source) then TriggerClientEvent("chatMessage", source, "[CarSpawner]", {255, 0, 0}, "❌ Du hast keine Berechtigung, Fahrzeuge zu löschen!") return end

local playerPed = GetPlayerPed(source)
local playerCoords = GetEntityCoords(playerPed)
local vehicle = GetClosestVehicle(playerCoords.x, playerCoords.y, playerCoords.z, 5.0, 0, 70)

if vehicle and DoesEntityExist(vehicle) then
    DeleteEntity(vehicle)
    TriggerClientEvent("chatMessage", source, "[CarSpawner]", {0, 255, 0}, "✅ Das Fahrzeug wurde gelöscht!")
else
    TriggerClientEvent("chatMessage", source, "[CarSpawner]", {255, 0, 0}, "❌ Kein Fahrzeug in der Nähe gefunden!")
end

end, false)
