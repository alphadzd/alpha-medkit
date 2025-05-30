local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("medkit", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    
    TriggerClientEvent('alpha-medkit:client:useMedkit', source)
end)

RegisterNetEvent('alpha-medkit:server:revivePlayer', function(targetId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Target = QBCore.Functions.GetPlayer(targetId)
    if not Player or not Target then return end
    if not Player.Functions.RemoveItem('medkit', 1) then
        TriggerClientEvent('QBCore:Notify', src, Config.Messages.no_medkit, 'error')
        return
    end
    TriggerClientEvent('alpha-medkit:client:getRevived', targetId)
end)

QBCore.Commands.Add('testmedkit', 'Get a test medkit and test revival system', {}, false, function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.AddItem('medkit', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['medkit'], 'add')
    TriggerClientEvent('QBCore:Notify', source, 'You received a test medkit', 'success')
    TriggerClientEvent('alpha-medkit:client:testRevival', source)
end)

RegisterNetEvent('alpha-medkit:server:testRevival', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
        if not Player.Functions.RemoveItem('medkit', 1) then
        TriggerClientEvent('QBCore:Notify', src, Config.Messages.no_medkit, 'error')
        return
    end
        TriggerClientEvent('alpha-medkit:client:getRevived', src)
end)


-- If you want to get more resources, please contact me on discord.
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    Citizen.SetTimeout(1000, function()
        local p1 = "\27[95m"  
        local p2 = "\27[35m"  
        local p3 = "\27[91m"  
        local p4 = "\27[31m"  
        local white = "\27[97m"
        local reset = "\27[0m"
        print(p1 .. " __        __  ____                 _                                  _   " .. reset)
        print(p1 .. " \\ \\      / / |  _ \\  _____   _____| | ___  _ __  _ __ ___   ___ _ __ | |_ " .. reset)
        print(p2 .. "  \\ \\ /\\ / /  | | | |/ _ \\ \\ / / _ \\ |/ _ \\| '_ \\| '_ ` _ \\ / _ \\ '_ \\| __|" .. reset)
        print(p2 .. "   \\ V  V /   | |_| |  __/\\ V /  __/ | (_) | |_) | | | | | |  __/ | | | |_ " .. reset)
        print(p3 .. "    \\_/\\_/    |____/ \\___| \\_/ \\___|_|\\___/| .__/|_| |_| |_|\\___|_| |_|\\__|" .. reset)
        print(p4 .. "                                           |_|                              " .. reset)
        print(white .. "                 Created by: Alpha" .. reset)
        print(white .. "                 Discord: https://discord.gg/dF5C55hQYB" .. reset)
        print(white .. "                 If you want to get more resources, please contact me on discord." .. reset)
    end)
end)
