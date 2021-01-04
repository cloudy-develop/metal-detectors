function CreateDetector(detector)

    local detectorHash = GetHashKey('ch_prop_ch_metal_detector_01a')

    RequestModel(detectorHash)
    while not (HasModelLoaded(detectorHash)) do
        Wait(0)
    end

    local entityOld = GetClosestObjectOfType(detector.coords.x, detector.coords.y, detector.coords.z - 1.0, 10.0, detectorHash, false, false, false)
    while (entityOld == nil) do
        Wait(0)
    end

    if (entityOld ~= 0) then
        entityOld = DeleteObject()
        DebugPrint("^3DEBUG: ^0Deleted old detector " .. detector.info.id .. ".")
    end

    local entityNew = CreateObject(detectorHash, detector.coords.x, detector.coords.y, detector.coords.z - 1.0, false, false, false)
    while (entityNew == nil) do
        Wait(0)
    end
    
    if (entityNew ~= 0) then
        SetEntityHeading(entityNew, detector.entity.heading)
        SetEntityInvincible(entityNew, true)
        SetEntityCanBeDamaged(entityNew, false)
        SetEntityCollision(entityNew, true, false)
        FreezeEntityPosition(entityNew, true)
        DebugPrint("^3DEBUG: ^0Created new detector " .. detector.info.id .. ".")
    end

end

function DetectorScan(detector)

    if not (HasAccess(detector)) then
        if (HasWeapon(PlayerPedId())) then
            TriggerServerEvent('DetectorAlarm', client.player.info.serverId, detector)
            DebugPrint("^3DEBUG: ^0Triggered event to start alarm on detector " .. detector.info.id .. ".")
        end
    end

end

function HasAccess(detector)

    for i,var0 in pairs(config.players) do
        if (var0.fivemId == client.player.info.fivemId) then
            for i,var1 in pairs(var0.detectors) do
                if (var1 == detector.info.id) then
                    DebugPrint("^3DEBUG: ^0Checked for access. Returned (true).")
                    return true
                end
            end
        end
    end

    DebugPrint("^3DEBUG: ^0Checked for access. Returned (false).")
    return false

end

function HasWeapon(ped)

    local weapons = {
        0x92A27487, -- dagger
        0x958A4A8F, -- bat
        0x84BD7BFD, -- crowbar
        0x8BB05FD7, -- flashlight
        0x440E4788, -- golfclub
        0x4E875F73, -- hammer
        0xF9DCBF2D, -- hatchet
        0xD8DF3C3C, -- knuckle
        0x99B507EA, -- knife
        0xDD5DF8D9, -- machete
        0xDFE37640, -- switchblade
        0x19044EE0, -- wrench
        0xCD274149, -- battleaxe
        0x1B06D571, -- pistol
        0xBFE256D4, -- pistol_mk2
        0x5EF9FEC4, -- combatpistol
        0x22D8FE39, -- appistol
        0x3656C8C1, -- stungun
        0x99AEEB3B, -- pistol50
        0xBFD21232, -- snspistol
        0x88374054, -- snspistol_mk2
        0xD205520E, -- heavypistol
        0x83839C4, -- vintagepistol
        0x47757124, -- flaregun
        0xDC4DB296, -- marksmanpistol
        0xC1B3C3D1, -- revolver
        0xCB96392F, -- revolver_mk2
        0x97EA20B8, -- doubleaction
        0xAF3696A1, -- raypistol
        0x917F6C8C, -- navyrevolver
        0x13532244, -- microsmg
        0x2BE6766B, -- smg
        0x78A97CD0, -- smg_mk2
        0xEFE7E2DF, -- assaultsmg
        0xA3D4D34, -- combatpdw
        0xDB1AA450, -- machinepistol
        0xBD248B55, -- minismg
        0x476BF155, -- raycarbine
        0x1D073A89, -- pumpshotgun
        0x555AF99A, -- pumpshotgun_mk2
        0x7846A318, -- sawnoffshotgun
        0xE284C527, -- assaultshotgun
        0x9D61E50F, -- bullpupshotgun
        0xA89CB99E, -- musket
        0x3AABBBAA, -- heavyshotgun
        0xEF951FBB, -- dbshotgun
        0x12E82D3D, -- autoshotgun
        0xBFEFFF6D, -- assaultrifle
        0x394F415C, -- assaultrifle_mk2
        0x83BF0278, -- carbinerifle
        0xFAD1F1C9, -- carbinerifle_mk2
        0xAF113F99, -- advancedrifle
        0xC0A3098D, -- specialcarbine
        0x969C3D67, -- specialcarbine_mk2
        0x7F229F94, -- bullpuprifle
        0x84D6FAFD, -- bullpuprifle_mk2
        0x624FE830, -- compactrifle
        0x9D07F764, -- mg
        0x7FD62962, -- combatmg
        0xDBBD7280, -- combatmg_mk2
        0x61012683, -- gusenberg
        0x5FC3C11, -- sniperrifle
        0xC472FE2, -- heavysniper
        0xA914799, -- heavysniper_mk2
        0xC734385A, -- marksmanrifle
        0x6A6C02E0, -- marksmanrifle_mk2
        0xB1CA77B1, -- rpg
        0xA284510B, -- grenadelauncher
        0x4DD2DC56, -- grenadelauncher_smoke
        0x42BF8A85, -- minigun
        0x7F7497E5, -- firework
        0x6D544C99, -- railgun
        0x63AB0442, -- hominglauncher
        0x781FE4A, -- compactlauncher
        0xB62D1F67, -- rayminigun
        0x93E220BD, -- grenade
        0xA0973D5E, -- bzgas
        0xFDBC8A50, -- smokegrenade
        0x497FACC3, -- flare
        0x24B17070, -- molotov
        0x2C3731D9, -- stickybomb
        0xAB564B93, -- proxmine
        0xBA45E8B8, -- pipebomb
        0x34A67B97, -- petrolcan
        0x60EC506 -- fireextinguisher
    }

    for i,var0 in pairs(weapons) do
        if (HasPedGotWeapon(ped, var0, false)) then
            DebugPrint("^3DEBUG: ^0Checked for weapon. Returned (true).")
            return true
        end
    end

    DebugPrint("^3DEBUG: ^0Checked for weapon. Returned (false).")
    return false

end

function DetectorAlarm(detector)
    RequestScriptAudioBank('dlc_xm_iaa_player_facility_sounds', false)
    PlaySoundFromCoord(-1, 'scanner_alarm_os', detector.coords.x, detector.coords.y, detector.coords.z, 'dlc_xm_iaa_player_facility_sounds', false, detector.info.sound.range, false)
    DebugPrint("^3DEBUG: ^0Played alarm on detector " .. detector.info.id .. ".")
end

function DebugPrint(text)
    if (config.debug) then
        print(text)
    end
end