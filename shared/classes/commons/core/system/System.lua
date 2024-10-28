--[[
--- Created: 25/12/2023 00:24
--- Author: Absolute
--Made with ?
-------
-------


-------
--]]

_cn.System = "System"
loadClass(_cn.System)

--- Imports ---

_a.ApplicationScope()
---@class System : BaseObject
local System = class("System")


--- Attributs ---


--- Methods ---
function System.new()
    ---@type System
    local self = initMetatable(System);
    Log.info(string.format("^2Class system initialized in %d ms", Interface.getGameTimer() - Interface.startTime))

    return self;
end

_c.System = System
classloaded(_cn.System)
