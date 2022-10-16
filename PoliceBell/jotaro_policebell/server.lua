ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('jotaro:pddzwonek1')
AddEventHandler('jotaro:pddzwonek1', function(x, y, z) 
    TriggerClientEvent('jotaro:pddzwonek2', -1, x, y, z)
end)