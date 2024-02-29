QBCore.Functions.CreateUseableItem('policetablet', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.type ~= 'leo' then return end
    TriggerClientEvent('randol_fingerprint:client:usedTablet', src)
end)

lib.callback.register('randol_fingerprint:server:getPlayerInfo', function(source, id)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not id or Player.PlayerData.job.type ~= 'leo' then return false end

    local Target = QBCore.Functions.GetPlayer(id)

	if not Target then return false end

    local dist = #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(GetPlayerPed(id)))

    if dist > 2.0 then
        QBCore.Functions.Notify(src, 'Target is too far away.', 'error')
        return false 
    end

    return Target.PlayerData
end)