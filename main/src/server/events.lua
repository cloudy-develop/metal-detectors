RegisterNetEvent('GetFivemId')
AddEventHandler('GetFivemId', function(source)
    TriggerClientEvent('GetFivemId', source, GetPlayerIdentifier(source, 5))
end)

RegisterNetEvent('DetectorAlarm')
AddEventHandler('DetectorAlarm', function(source, detector)
    TriggerClientEvent('DetectorAlarm', -1, detector)
end)