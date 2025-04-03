local lastVehicle = nil

local function isAdmin(player)
    return IsPlayerAceAllowed(player, "admin")
end

RegisterCommand("car", function(source, args)
    local playerPed = GetPlayerPed(-1)
    local playerId = source
    if not isAdmin(playerId) then
        TriggerEvent("chatMessage", "[CarSpawner]", {255, 0, 0}, "❌ Du hast keine Berechtigung, dieses Fahrzeug zu spawnen!")
        return
    end

    local vehicleName = args[1] or "adder"
    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent("chatMessage", "[CarSpawner]", {255, 0, 0}, "❌ Ungültiger Fahrzeugname!")
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
            SetVehicleColours(vehicle, r, g, b)
        end
    end

    lastVehicle = vehicle

    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)

    TriggerEvent("chatMessage", "[CarSpawner]", {0, 255, 0}, "✅ Fahrzeug " .. vehicleName .. " wurde gespawnt!")
end, false)

RegisterCommand("delcar", function(source, args)
    local playerId = source
    if not isAdmin(playerId) then
        TriggerEvent("chatMessage", "[CarSpawner]", {255, 0, 0}, "❌ Du hast keine Berechtigung, Fahrzeuge zu löschen!")
        return
    end

    if lastVehicle and DoesEntityExist(lastVehicle) then
        DeleteEntity(lastVehicle)
        TriggerEvent("chatMessage", "[CarSpawner]", {0, 255, 0}, "✅ Das Fahrzeug wurde gelöscht!")
    else
        TriggerEvent("chatMessage", "[CarSpawner]", {255, 0, 0}, "❌ Kein Fahrzeug zum Löschen gefunden!")
    end
end, false)
