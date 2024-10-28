--[[
--- Created: 25/12/2023 23:28
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.ReplicatedObject = "ReplicatedObject"
loadClass(_cn.ReplicatedObject)
local GLOBAL_REPLICATED_ID = 0
--- Imports ---

import(_cn.Inject)
import(_cn.ReplicatedService)

---@class ReplicatedObject : BaseObject
---@field id number
---@field replicateService ReplicatedService
local ReplicatedObject = class(_cn.ReplicatedObject)

--- Attributs ---
_a.Inject(_c.ReplicatedService)
ReplicatedObject.replicateService = nil;

--- Methods ---

function ReplicatedObject.new()
    ---@type ReplicatedObject
    local self = initMetatable(ReplicatedObject);

    GLOBAL_REPLICATED_ID = GLOBAL_REPLICATED_ID + 1
    self.id = GLOBAL_REPLICATED_ID
    self.replicateService.rReplicatedObject:fireAllClients(self);

    return self;
end

function ReplicatedObject:replicate()
    self.replicateService.rReplicatedObject:fireClient(self)
end

_c.ReplicatedObject = ReplicatedObject
classloaded(_cn.ReplicatedObject)