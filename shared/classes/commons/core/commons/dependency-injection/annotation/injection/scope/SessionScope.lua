---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 11:24
---

_cn.SessionScope = "SessionScope"
loadClass(_cn.SessionScope)

---@type DependencyInjection
local DependencyInjection = import("DependencyInjection");

---@class SessionScope : Annotation
local SessionScope = extends("SessionScope", "Annotation");

--- Attributs ---


--- Methods ---

function SessionScope.new(tableRef, attr, params)
    ---@type SessionScope
    local self = initMetatable(SessionScope);
    self.innerTable = tableRef;
    self.innerAttr = attr;
    self.params = params;
    Interface.thread(function()
        local DependencyInjection = getSingleton(DependencyInjection);
        DependencyInjection:registerInjectableCandidat(tableRef.__class__, Enum.Scope.SESSION)
    end)

    return self;
end

function SessionScope:onValueChange(object, attr, value)
    error("Not implemented method")
end

_a.SessionScope = annotation(_cn.SessionScope, SessionScope)
_c.SessionScope = SessionScope
classloaded(_cn.SessionScope)