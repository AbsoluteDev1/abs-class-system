---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 04/10/2024
---

_cn.OnKeyUp = "OnKeyUp";
loadClass(_cn.OnKeyDown)

--- Imports ---

---@class OnKeyUp : Annotation
local OnKeyUp = extends(_cn.OnKeyDown, _cn.Annotation);

function OnKeyUp.new(tableRef, attr, key)
    ---@type OnKeyUp
    local self = initMetatable(OnKeyUp);

    self.params = key;

    return self;
end

function OnKeyUp:onInstantiate(object, attr)
    local defaultFct = object[attr];
    ---@type InputService
    local inputService = getSingleton(_c.InputService);

    local userAction = _c.UserAction.new();
    userAction.actionType = Enum.ActionType.KeyUp;
    userAction.onActionEndCb = defaultFct;
    userAction.object = object;
    userAction.keycode = self.params.keyCode;
    userAction.actionName = self.params.name;

    inputService:addAction(userAction);
end

function OnKeyUp:onValueChange(object, attr)

end
--- Annotation OnKeyUp Register the next function to be called when the key is released
---@param params {keyCode: number, name: string}
_a.OnKeyUp = annotation(_cn.OnKeyDown, OnKeyUp)
_c.OnKeyUp = OnKeyUp;
classloaded(_cn.OnKeyDown)