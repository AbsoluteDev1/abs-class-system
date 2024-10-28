---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 01:18
---

_cn.Cache = "Cache";
loadClass(_cn.Cache)

--- Imports ---

---@class Cache : BaseObject
local Cache = class("Cache");

function Cache.new()
    ---@type Cache
    local self = initMetatable(Cache);

    self.data = {};

    return self;
end

function Cache:set(key, value)
    self.data[key] = value;
end

function Cache:get(key)
    return self.data[key];
end

function Cache:has(key)
    return self.data[key] ~= nil;
end

_c.Cache = Cache;
classloaded(_cn.Cache)