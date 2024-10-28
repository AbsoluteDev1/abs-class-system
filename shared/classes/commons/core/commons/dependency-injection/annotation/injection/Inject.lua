---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 11:24
---


_cn.Inject = "Inject"
loadClass(_cn.Inject)

---@type DependencyInjection
local DependencyInjection = import("DependencyInjection");

---@class Inject : Annotation
local Inject = extends("Inject", "Annotation");

function Inject.new(tableRef, attr, params)
    ---@type Inject
    local self = initMetatable(Inject);
    self.innerTable = tableRef;
    self.innerAttr = attr;
    self.params = params;
    if params == nil then
        error("Inject annotation must have a class parameter check if import is correct");
    end

    return self;
end

function Inject:onValueChange(object, attr, value)

end

function Inject:onInstantiate(object, attr, value)
    ---@type DependencyInjection
    local DependencyInjection = getSingleton(DependencyInjection);
    object[attr] = DependencyInjection:inject(self.params.__class__, attr)
    Log.trace("Injecting value for attribute %s in class %s", attr, object.__class__)
end

---@type fun(className: BaseObject): Inject
_a.Inject = annotation(_cn.Inject)
_c.Inject = Inject
classloaded(_cn.Inject)
