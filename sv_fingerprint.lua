QBCore.Functions.CreateUseableItem('policetablet', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.type ~= 'leo' then return end
    TriggerClientEvent('randol_fingerprint:client:usedTablet', src)
end)

lib.callback.register('randol_fingerprint:server:getPlayerInfo', function(source, id)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.PlayerData.job.type ~= 'leo' then return false end

    local Target = QBCore.Functions.GetPlayer(id)

	if not Target then return false end

    return Target.PlayerData
end)