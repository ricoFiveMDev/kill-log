local wasDead = false

CreateThread(function()
    while true do
        Wait(300)

        local ped = PlayerPedId()
        local isDead = IsEntityDead(ped)

        if isDead and not wasDead then
            wasDead = true

            local killerPed = GetPedSourceOfDeath(ped)

            if killerPed and killerPed ~= ped then
                local killerPlayer = NetworkGetPlayerIndexFromPed(killerPed)

                if killerPlayer ~= -1 then
                    local killerId = GetPlayerServerId(killerPlayer)
                    TriggerServerEvent('killlog:playerDied', killerId)
                end
            end
        end

        if not isDead then
            wasDead = false
        end
    end
end)

RegisterNetEvent('killlog:notifyVictim', function(killerName, killerId)
    lib.notify({
        title = ('You were killed by %s (ID: %s)'):format(killerName, killerId),
        type = 'error',
        duration = 8000,
        position = 'top',       -- top center
        style = {
            zIndex = 99999      -- ensure above most HUDs
        }
    })
end)
