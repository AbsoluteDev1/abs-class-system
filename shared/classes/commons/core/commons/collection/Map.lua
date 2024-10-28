---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 06/10/2024
---

_cn.Map = "Map";
loadClass(_cn.Map)

--- Imports ---

---@class Map : BaseObject
local Map = class("Map");

function Map.new()
    ---@type Map
    local self = initMetatable(Map);

    self.data = {};

    return self;
end

function Map:put(key, value)
    self.data[key] = value;
end

function Map:set(key, value)
    self.data[key] = value;
end

function Map:get(key)
    return self.data[key];
end

function Map:has(key)
    return self.data[key] ~= nil;
end

function Map:remove(key)
    self.data[key] = nil;
end

function Map:clear()
    self.data = {};
end

function Map:keys()
    local keys = {};
    for k, _ in pairs(self.data) do
        table.insert(keys, k);
    end
    return keys;
end

function Map:values()
    local values = {};
    for _, v in pairs(self.data) do
        table.insert(values, v);
    end
    return values;
end

function Map:each(callback)
    for k, v in pairs(self.data) do
        callback(k, v);
    end
end

function Map:find(callback)
    for k, v in pairs(self.data) do
        if callback(k, v) then
            return k, v;
        end
    end
end

function Map:size()
    local size = 0;
    for _, _ in pairs(self.data) do
        size = size + 1;
    end

    return size;
end

function Map:isEmpty()
    return self:size() == 0;
end

function Map:containsValue(value)
    for _, v in pairs(self.data) do
        if v == value then
            return true;
        end
    end

    return false;
end

function Map:containsKey(key)
    return self.data[key] ~= nil;
end

function Map:filter(callback)
    local map = Map.new();
    for k, v in pairs(self.data) do
        if callback(k, v) then
            map:put(k, v);
        end
    end
    return map;
end

function Map:map(callback)
    local map = Map.new();
    for k, v in pairs(self.data) do
        local newKey, newValue = callback(k, v);
        map:put(newKey, newValue);
    end
    return map;
end

function Map.of(...)
    local map = Map.new();
    local args = { ... };
    for i = 1, #args, 2 do
        map:put(args[i], args[i + 1]);
    end
    return map;
end

_c.Map = Map;
classloaded(_cn.Map)