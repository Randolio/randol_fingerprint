local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = {}

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerJob = QBCore.Functions.GetPlayerData().job
    end
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('randol:client:policetablet') 
AddEventHandler('randol:client:policetablet', function()
    if PlayerJob.name == "police" then
        TriggerEvent('animations:client:EmoteCommandStart', {"tablet2"})
        QBCore.Functions.Progressbar("scan_finger", "Attempting to scan finger..", 5000, false, true, {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = false,
        }, {}, {}, {}, function() -- Done
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            local player, distance = QBCore.Functions.GetClosestPlayer()
            if player ~= -1 and distance < 2.5 then
                local playerId = GetPlayerServerId(player)
                TriggerServerEvent("randolio:server:fingerprintmenu", playerId)
            else
                QBCore.Functions.Notify("Nobody close enough to scan.", "error")
            end
        end, function() -- Cancel
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify("You stopped what you were doing.", "error")
        end)
    else
        QBCore.Functions.Notify("This tablet is encrypted.", "error")
    end
end)


RegisterNetEvent('randolio:client:fingerprintmenu') 
AddEventHandler('randolio:client:fingerprintmenu', function(pdata)
    exports['qb-menu']:openMenu({
        {
            header = "Fingerprint Scanner",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Print Information",
            txt = 'Name: '..pdata.charinfo.firstname..' '..pdata.charinfo.lastname..'</p>Citizen ID: '..pdata.citizenid..'</p>State ID: '..pdata.source..'',
            icon = "fa-solid fa-fingerprint",
        },
        {
            header = "Exit",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)