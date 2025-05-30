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
