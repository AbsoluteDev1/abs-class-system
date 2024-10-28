--[[
--- Created: 26/12/2023 08:18
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.InputService = "InputService"
loadClass(_cn.InputService)

--- Imports ---

import(_cn.ApplicationScope)
import(_cn.Ped)

_a.ApplicationScope()
---@class InputService : BaseObject
local InputService = class(_cn.InputService)

--- Attributs ---


--- Methods ---

function InputService.new()
    ---@type InputService
    local self = initMetatable(InputService);
    ---@type UserAction[]
    self.actions = {};

    self:onUpdate();

    return self;
end

---@param userAction UserAction
function InputService:addAction(userAction)
    Log.debug("Adding action " .. userAction.actionName .. " with keycode " .. userAction.keycode .. " and type " .. userAction.actionType)
    table.insert(self.actions, userAction)
end

function InputService:isKeyDown(keycode)
    return Interface.isControlJustPressed(0, keycode)
end

function InputService:isKeyUp(keycode)
    return Interface.isControlJustReleased(0, keycode)
end

function InputService:onUpdate()

    Ats.thread(function()
        while true do
            for _, a in pairs(self.actions) do
                ---@type UserAction
                local action = a;

                if action.actionType == Enum.ActionType.KeyDown and self:isKeyDown(action.keycode) then
                    action:onActionBegin()
                elseif action.actionType == Enum.ActionType.KeyUp and self:isKeyUp(action.keycode) then
                    action:onActionEnd()
                end
            end
            Interface.wait(0)
        end
    end)
end

_c.InputService = InputService
classloaded(_cn.InputService)