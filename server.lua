RegisterNetEvent('killlog:playerDied', function(killerId)
    local victimId = source

    local killerName = GetPlayerName(killerId)
    local victimName = GetPlayerName(victimId)

    if not killerName or not victimName then return end

    -- Notify the victim
    TriggerClientEvent('killlog:notifyVictim', victimId, killerName, killerId)

    -- Notify the killer
    TriggerClientEvent('killlog:notifyKiller', killerId, victimName, victimId)
end)
