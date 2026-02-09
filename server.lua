RegisterNetEvent('killlog:playerDied', function(killerId)
    local victimId = source

    if not GetPlayerName(killerId) then return end

    local killerName = GetPlayerName(killerId)

    TriggerClientEvent('killlog:notifyVictim', victimId, killerName, killerId)
end)
