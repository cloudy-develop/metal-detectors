RegisterNetEvent('GetFivemId')
AddEventHandler('GetFivemId', function(source)
    TriggerClientEvent('GetFivemId', source, GetPlayerIdentifier(source, 5))
end)

RegisterNetEvent('DetectorAlarm')
AddEventHandler('DetectorAlarm', function(source, detector)
    TriggerClientEvent('DetectorAlarm', -1, detector)
end)

RegisterNetEvent('PrintFivemId')
AddEventHandler('PrintFivemId', function(source, fivemId)
    if (fivemId ~= 0) then
        print("^3Metal Detectors: ^0" .. GetPlayerName(source) .. " = " .. fivemId)
    else
        print("^3Metal Detectors: ^0" .. GetPlayerName(source) .. " = Error getting FiveM ID.")
    end
end)