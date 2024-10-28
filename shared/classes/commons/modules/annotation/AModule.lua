---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 11:24
---

loadClass("AModule")

--- Imports ---

import("ModuleManager");

---@class AModule : Annotation
local AModule = extends("AModule", "Annotation");

--- Attributs ---


--- Methods ---

function AModule.new(tableRef, attr, params)
    ---@type AModule
    local self = initMetatable(AModule);
    self.innerTable = tableRef;
    self.innerAttr = attr;
    self.params = params;
    Interface.thread(function()
        ---@type ModuleManager
        local moduleManager = getSingleton(_c.ModuleManager);

        moduleManager:preparingModule(self.innerTable)

        local module = getSingleton(self.innerTable)
        moduleManager:registerModule(module);
    end)
    return self;
end

function AModule:onValueChange(object, attr, value)
    error("Not implemented method")
end

_a.AModule = annotation("AModule", AModule)
_c.AModule = AModule
_cn.AModule = "AModule"
classloaded("AModule")