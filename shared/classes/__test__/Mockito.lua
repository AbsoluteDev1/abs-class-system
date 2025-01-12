---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 01:18
---

_cn.Mockito = "Mockito";
loadClass(_cn.Mockito)

--- Imports ---

---@class Mockito : BaseObject
local Mockito = class("Mockito");

function Mockito.new()
    ---@type Mockito
    local self = initMetatable(Mockito);

    return self;
end

function Mockito:doReturn(value)
    local mock = _c.Mock.new();

    mock.returnValue = value;

    return mock;
end

function Mockito:doNothing()
    local mock = _c.Mock.new();

    mock.doNothing = true;

    return mock;
end

function Mockito:spyOn(obj, methodName)
    local spy = _c.Spy.new();

    spy:spyOn(obj, methodName);

    return spy;
end

function Mockito:assertNull(value)
    if value ~= nil then
        error("Expected nil but got " .. value);
    end
end

function Mockito:assertNotNull(value)
    if value == nil then
        error("Expected not nil but got nil");
    end
end

function Mockito:assertEquals(expected, actual)

    if type(expected) == "table" then
        for k, v in pairs(expected) do
            if actual[k] ~= v then
                error("Expected " .. v .. " but got " .. actual[k]);
            end
        end
    end

    if expected ~= actual then
        error("Expected " .. expected .. " but got " .. actual);
    end
end

function Mockito:assertNotEquals(expected, actual)

    if type(expected) == "table" then
        for k, v in pairs(expected) do
            if actual[k] == v then
                error("Expected " .. v .. " but got " .. actual[k]);
            end
        end
    end

    if expected == actual then
        error("Expected " .. expected .. " but got " .. actual);
    end
end

function Mockito:toBeTruthy(value)
    if value == nil or value == false then
        error("Expected true but got " .. value);
    end
end

function Mockito:toBeFalsy(value)
    if value == nil or value == true then
        error("Expected false but got " .. value);
    end
end

_c.Mockito = Mockito;
classloaded(_cn.Mockito)
singleton(_cn.Mockito)