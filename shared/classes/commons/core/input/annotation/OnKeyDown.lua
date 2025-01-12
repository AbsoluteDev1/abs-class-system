---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 04/10/2024
---

_cn.OnKeyDown = "OnKeyUp";
loadClass(_cn.OnKeyDown)

--- Imports ---

---@class OnKeyDown : Annotation
local OnKeyDown = extends(_cn.OnKeyDown, _cn.Annotation);

function OnKeyDown.new(tableRef, attr, key)
    ---@type OnKeyDown
    local self = initMetatable(OnKeyDown);

    self.params = key;

    return self;
end

function OnKeyDown:onInstantiate(object, attr)
    local defaultFct = object[attr];
    ---@type InputService
    local inputService = getSingleton(_c.InputService);

    local userAction = _c.UserAction.new();
    userAction.actionType = Enum.ActionType.KeyDown;
    userAction.onActionBeginCb = defaultFct;
    userAction.keycode = self.params.keyCode;
    userAction.actionName = self.params.name;

    inputService:addAction(userAction);
end

function OnKeyDown:onValueChange(object, attr)

end

--- Annotation OnKeyDown Register the next function to be called when the key is pressed
_a.OnKeyDown = annotation(_cn.OnKeyDown, OnKeyDown)
_c.OnKeyDown = OnKeyDown;
classloaded(_cn.OnKeyDown)