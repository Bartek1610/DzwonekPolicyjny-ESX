ESX = nil
local timer = 0
local CurrentAction = nil
local pCoords = nil
local currentZone = nil
local HasAlreadyEnteredMarker = false
local LastZone = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		pCoords = GetEntityCoords(playerPed)
		Citizen.Wait(400)
	end
end)

function DzwonekPD()
	x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
	playerX = tonumber(string.format("%.2f", x))
    playerY = tonumber(string.format("%.2f", y))
    playerZ = tonumber(string.format("%.2f", z))
	TriggerServerEvent('jotaro:pddzwonek1', playerX, playerY, playerZ)
end

RegisterNetEvent('jotaro:pddzwonek')
AddEventHandler('jotaro:pddzwonek', function()
    if timer == 0 then
        DzwonekPD()
        timer = 30
        ZmniejszTimer()
    else
        ESX.ShowNotification(string.format(Config.Translations['must_wait'], timer))
    end
end)

RegisterNetEvent('jotaro:pddzwonek2')
AddEventHandler('jotaro:pddzwonek2', function(x, y, z)
    if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
        ESX.ShowNotification(Config.Translations['waiting_for_police'])
    end
end)

function ZmniejszTimer()
    while timer >= 0 do
        timer = timer -1
        Citizen.Wait(1000)
        --print(timer)
        if timer == 0 then
            break
        end
    end
end

Citizen.CreateThread(function()
    if Config.Target then
        exports.qtarget:AddBoxZone("Dzwonek", vector3(441.85, -982.07, 30.69), 0.4, 0.6, {
            name="Dzwonek",
            heading=282,
            --debugPoly=true,
            minZ=30.69,
            maxZ=30.89
            }, {
            options = {
                {
                    event = "jotaro:pddzwonek",
                    icon = "fas fa-solid fa-hand",
                    label = Config.Translations['target_label'],
                    num = 1,
                },
            },
            distance = 1.5
        })
    end
end)

-- Key controls
Citizen.CreateThread(function ()
    if not Config.Target then
        while true do
            Citizen.Wait(1)
            if CurrentAction ~= nil then
                if CurrentAction == 'dzwonek' then
                    ESX.ShowHelpNotification(Config.Translations['press'])
                end
                if IsControlPressed(0, 38) then
                    Citizen.Wait(10)
                    TriggerEvent('jotaro:pddzwonek')
                    Citizen.Wait(500)
                end
            end
        end
    end
end)

-- Display markers
Citizen.CreateThread(function()
    if not Config.Target then
        while true do
            Citizen.Wait(1)
            for i=1, #Config.Locations, 1 do
                if(GetDistanceBetweenCoords(pCoords, Config.Locations[i].Marker, true) < Config.DrawDistance) then
                    DrawMarker(Config.MarkerType, Config.Locations[i].Marker, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 90, false, true, 2, true, false, false, false)
                end
            end
        end
    end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function ()
    if not Config.Target then
        while true do
            Wait(1)
            local isInMarker  = false
	        local playerPed = GetPlayerPed(-1)
            for i=1, #Config.Locations, 1 do
		        if(GetDistanceBetweenCoords(pCoords, Config.Locations[i].Marker, true) < Config.MarkerSize.x) then
                    if not IsPedInAnyVehicle(playerPed) then
                        isInMarker  = true
                        currentZone = 'dzwonek'
                    end
		        end
            end
            if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
                HasAlreadyEnteredMarker = true
                LastZone = currentZone
                TriggerEvent('jotaro:hasEnteredMarker', currentZone)
            end
            if not isInMarker and HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = false
                TriggerEvent('jotaro:hasExitedMarker', LastZone)
            end
        end
    end
end)

AddEventHandler('jotaro:hasEnteredMarker', function(zone)
    if not Config.Target then
        if currentZone == 'dzwonek' then
            CurrentAction = 'dzwonek'
        end
    end
end)

AddEventHandler('jotaro:hasExitedMarker', function(zone)
    if not Config.Target then
        CurrentAction = nil
    end
end)