---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 05/10/2024
---

_cn.Vector3 = "Vector3";
loadClass(_cn.Vector3)

--- Imports ---

---@class Vector3 : BaseObject
local Vector3 = class("Vector3");

function Vector3.new(x, y, z)
    ---@type Vector3
    local self = initMetatable(Vector3);

    self.x = x;
    self.y = y;
    self.z = z;

    return self;
end

_c.Vector3 = Vector3;
classloaded(_cn.Vector3)