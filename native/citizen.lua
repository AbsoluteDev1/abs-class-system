---
--- Created by jokir.
--- DateTime: 11/10/2024 00:12
---

Citizen = {
    CreateThread = function() end,
    Wait = function() end,
    SetTimeout = function() end,
    SetInterval = function() end,
    ClearTimeout = function() end,
    ClearInterval = function() end,
    Await = function() end,
}

vector3 = function(x, y, z)
    return { x = x, y = y, z = z }
end

function GetHashKey(model)
    return 0
end

function TriggerClientEvent(eventName, eventSource, ...)
    return true
end

function TriggerServerEvent(eventName, eventSource, ...)
    return true
end

function RegisterNetEvent(eventName)
    return true
end

function AddEventHandler(eventName, eventHandler)
    return true
end
