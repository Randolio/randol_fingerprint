local PlayerData = {}

local function toggleTablet(bool)
    local model = `prop_cs_tablet`
    if bool then
        lib.requestAnimDict('amb@code_human_in_bus_passenger_idles@female@tablet@base', 2000)
        lib.requestModel(model, 2000)
        TABLET_PROP = CreateObject(model, 0.0, 0.0, 0.0, true, true, false)
        AttachEntityToEntity(TABLET_PROP, cache.ped, GetPedBoneIndex(cache.ped, 60309), 0.03, 0.002, -0.0, 10.0, 160.0, 0.0, true, false, false, false, 2, true)
        TaskPlayAnim(cache.ped, 'amb@code_human_in_bus_passenger_idles@female@tablet@base', 'base', 3.0, 3.0, -1, 49, 0, 0, 0, 0)
        SetModelAsNoLongerNeeded(model)
    else
        ClearPedSecondaryTask(cache.ped)
        if DoesEntityExist(TABLET_PROP) then
            DetachEntity(TABLET_PROP, true, false)
            DeleteEntity(TABLET_PROP)
        end
    end
end

local function openMdt()
    if not PlayerData.metadata.isdead and not PlayerData.metadata.inlaststand and not PlayerData.metadata.ishandcuffed and not IsPauseMenuActive() then
        if PlayerData.job.type == 'leo' then 
            TriggerServerEvent('mdt:server:openMDT')
        end
    end
end

local function showFingerprintData(data)
    local name = data.charinfo.firstname..' '..data.charinfo.lastname
    local printMenu = {
        id = 'fp_menu',
        title = 'Fingerprint Scanner',
        options = {
            {
                title = name,
                description = ('Print ID: %s \nCitizen ID: %s \nState ID: %s'):format(data.metadata.fingerprint, data.citizenid, data.source),
                icon = 'fa-solid fa-fingerprint',
                onSelect = function()
                    lib.setClipboard(data.metadata.fingerprint)
                    QBCore.Functions.Notify('Fingerprint Copied: '..data.metadata.fingerprint)
                    showFingerprintData(data)
                end,
            },
            {
                title = 'Open MDT',
                description = 'Open the MDT to insert the copied fingerprint.',
                icon = 'fa-solid fa-laptop',
                onSelect = openMdt,
            },
        },
    }
    lib.registerContext(printMenu)
    lib.showContext('fp_menu')
end

RegisterNetEvent('randol_fingerprint:client:usedTablet', function()
    if GetInvokingResource() then return end
    
    if PlayerData.job.type ~= 'leo' then
        return QBCore.Functions.Notify('This tablet is encrypted.', 'error')
    end

    local coords = GetEntityCoords(cache.ped)
    local player = lib.getClosestPlayer(coords, 1.5, false)
    
    if not player then
        return QBCore.Functions.Notify('Nobody close enough to scan.', 'error')
    end

    toggleTablet(true)
    QBCore.Functions.Progressbar('scan_finger', 'Attempting to scan finger..', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = false,
    }, {}, {}, {}, function() -- Done
        toggleTablet(false)
        local id = GetPlayerServerId(player)
        local data = lib.callback.await('randol_fingerprint:server:getPlayerInfo', false, id)
        if data then
            showFingerprintData(data)
        end
    end, function() -- Cancel
        toggleTablet(false)
        QBCore.Functions.Notify('You stopped what you were doing.', 'error')
    end)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    PlayerData = QBCore.Functions.GetPlayerData()
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    table.wipe(PlayerData)
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)