---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 10/10/2024
---

_cn.OnNuiReady = "OnNuiReady";
loadClass(_cn.OnNuiReady)

--- Imports ---

---@class OnNuiReady : Annotation
local OnNuiReady = extends(_cn.OnNuiReady, _cn.Annotation);

local nuiReadyCallbacks = {}

function OnNuiReady.new()
    ---@type OnNuiReady
    local self = initMetatable(OnNuiReady);

    return self;
end

function OnNuiReady:onInstantiate(object, attr)
    table.insert(_c.Nui.nuiReadyCallbacks, { object = object, attr = attr });
end

_a.OnNuiReady = annotation(_cn.OnNuiReady, OnNuiReady)
_c.OnNuiReady = OnNuiReady;
classloaded(_cn.OnNuiReady)