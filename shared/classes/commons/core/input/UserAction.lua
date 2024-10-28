--[[
--- Created: 26/12/2023 08:22
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.UserAction = "UserAction"
loadClass(_cn.UserAction)

--- Imports ---


---@class UserAction : BaseObject
local UserAction = class(_cn.UserAction)

--- Attributs ---


--- Methods ---

function UserAction.new(actionName, keycode, actionType)
    ---@type UserAction
    local self = initMetatable(UserAction);

    self.actionName = actionName;
    self.keycode = keycode;
    self.actionType = actionType;

    self.onActionBeginCb = nil;
    self.onActionEndCb = nil;

    self.object = nil;

    return self;
end

function UserAction:onActionBegin()
    self.onActionBeginCb(self.object)
end

function UserAction:onActionEnd()
    self.onActionEndCb(self.object)
end

_c.UserAction = UserAction
classloaded(_cn.UserAction)