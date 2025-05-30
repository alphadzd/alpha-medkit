local QBCore = exports['qb-core']:GetCoreObject()
local isReviving = false
local reviveTimer = 0

local function StartRevival(targetId)
    if isReviving then return end
    
    local targetPed = GetPlayerPed(GetPlayerFromServerId(targetId))
    if not targetPed then return end
    
    isReviving = true
    local startTime = GetGameTimer()
    
    exports['minigames']:StartMinigame(Config.MinigameType, function(success)
        if success then
            TriggerServerEvent('alpha-medkit:server:revivePlayer', targetId)
            QBCore.Functions.Notify(string.format(Config.Messages.revive_success, GetPlayerName(GetPlayerFromServerId(targetId))), 'success')
        else
            QBCore.Functions.Notify(Config.Messages.revive_failed, 'error')
        end
        isReviving = false
    end)
    
    CreateThread(function()
        while isReviving do
            if GetGameTimer() - startTime > (Config.ReviveTime * 1000) then
                isReviving = false
                QBCore.Functions.Notify(Config.Messages.time_expired, 'error')
                break
            end
            Wait(1000)
        end
    end)
end

RegisterNetEvent('alpha-medkit:client:useMedkit', function()
    local player, distance = QBCore.Functions.GetClosestPlayer()
    
    if player == -1 or distance > 3.0 then
        QBCore.Functions.Notify(Config.Messages.too_far, 'error')
        return
    end
    
    local targetId = GetPlayerServerId(player)
    StartRevival(targetId)
end)

RegisterNetEvent('alpha-medkit:client:getRevived', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, GetEntityHeading(playerPed), true, false)
    SetPlayerInvincible(playerPed, false)
    ClearPedBloodDamage(playerPed)
end) 