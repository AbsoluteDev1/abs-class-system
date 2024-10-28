--[[
--- Created: 23/12/2023 14:51
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.InventoryModule = "InventoryModule"
loadClass(_cn.InventoryModule)
---@type PlayerModule
local PlayerModule = import("PlayerModule");

_a.ApplicationScope()
_a.AModule()
---@class InventoryModule : Module
local InventoryModule = extends("InventoryModule", "Module")

--- Attributs ---
_a.Inject(PlayerModule)
---@type PlayerModule
InventoryModule.PlayerModule = nil;

--- Methods ---

function InventoryModule.new()
    ---@type InventoryModule
    local self = initMetatable(InventoryModule);

    return self;
end

_c.InventoryModule = InventoryModule
classloaded(_cn.InventoryModule)