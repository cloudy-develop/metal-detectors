Citizen.CreateThread(function()

    client.player.info.id = PlayerId()
    client.player.info.serverId = GetPlayerServerId(client.player.info.id)
    TriggerServerEvent('GetFivemId', client.player.info.serverId)

    while (client.player.info.fivemId == nil) do
        Citizen.Wait(0)
    end

    if (config.printFivemId) then
        TriggerServerEvent('PrintFivemId', client.player.info.serverId, client.player.info.fivemId)
    end

    for i,var0 in pairs(config.detectors) do
        table.insert(var0, { data = { distance = nil, enable = nil } })
        DebugPrint("^3DEBUG: ^0Inserted data table into detector " .. var0.info.id .. ".")

        if (var0.entity.enable) and (var0.entity.heading ~= nil) then
            CreateDetector(var0)
        end
    end

    while (true) do

        client.player.game.coords = GetEntityCoords(PlayerPedId())

        if (client.player.info.fivemId ~= 0) then
            for i,var0 in pairs(config.detectors) do
                var0[1].data.distance = GetDistanceBetweenCoords(client.player.game.coords, var0.coords.x, var0.coords.y, var0.coords.z, true)

                if (var0[1].data.distance < var0.coords.radius) then
                    if not (var0[1].data.enable) then
                        DetectorScan(var0)
                        var0[1].data.enable = true
                    end
                else
                    if (var0[1].data.enable) then
                        var0[1].data.enable = false
                    end
                end
            end
        else
            print('^1ERROR: ^0Could not get FiveM ID.')
            break
        end

        Citizen.Wait(200)

    end

end)