local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateUseableItem("policetablet", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("randol:client:policetablet", src)
end)

RegisterServerEvent('randolio:server:fingerprintmenu') 
AddEventHandler('randolio:server:fingerprintmenu', function(playerId)
    local src = source
    local Target = QBCore.Functions.GetPlayer(playerId)
    local pdata = Target.PlayerData
	if Target then
        TriggerClientEvent('randolio:client:fingerprintmenu', src, pdata)
    end
end)