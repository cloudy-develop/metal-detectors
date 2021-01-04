RegisterNetEvent('GetFivemId')
AddEventHandler('GetFivemId', function(fivemId)
    if (fivemId ~= nil) then
        client.player.info.fivemId = tonumber(string.sub(fivemId, 7))
	else
		client.player.info.fivemId = 0
	end
end)

RegisterNetEvent('DetectorAlarm')
AddEventHandler('DetectorAlarm', function(detector)
	DetectorAlarm(detector)
end)