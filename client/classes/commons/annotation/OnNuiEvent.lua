---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 10/10/2024
---

_cn.OnNuiEvent = "OnNuiEvent";
loadClass(_cn.OnNuiEvent)

--- Imports ---

---@class OnNuiEvent : Annotation
local OnNuiEvent = extends(_cn.OnNuiEvent, _cn.Annotation);

function OnNuiEvent.new(tableRef, attr, params)
    ---@type OnNuiEvent
    local self = initMetatable(OnNuiEvent);

    self.params = params;

    return self;
end

function OnNuiEvent:onInstantiate(object, attr)
    local nuiName = object.__class__:lower() .. ":" .. attr;

    if self.params then
        nuiName = self.params.nuiName;
    end

    RegisterNUICallback(nuiName, function(data, cb)
        object[attr](object, data, cb);
    end);
end

---@type fun(params:{nuiName:string}):OnNuiEvent
_a.OnNuiEvent = annotation(_cn.OnNuiEvent, OnNuiEvent)
_c.OnNuiEvent = OnNuiEvent;
classloaded(_cn.OnNuiEvent)
