---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 11:24
---
_cn.CMNotNull = "CMNotNull"
loadClass(_cn.CMNotNull)

--- Imports ---

---@class CMNotNull : Annotation
local CMNotNull = extends(_cn.CMNotNull, _cn.Annotation);

--- Attributs ---


--- Methods ---

function CMNotNull.new(tableRef, attr, params)
    ---@type CMNotNull
    local self = initMetatable(CMNotNull);
    self.innerTable = tableRef;
    self.innerAttr = attr;
    self.params = params;

    return self;
end

function CMNotNull:onValueChange(object, attr, value)
    error("Not implemented method")
end

function CMNotNull:onLoaded(attr)
    if self.innerAttr == attr then
        local defaultFct = self.innerTable[attr];
        self.innerTable[attr] = function(...)
            local args = { ... };
            for i, v in ipairs(args) do
                if v == nil then
                    error("Argument " .. i .. " is null")
                end
            end
            defaultFct(...)
        end
    end
end

_a.CMNotNull = annotation(_cn.CMNotNull, CMNotNull)
_c.CMNotNull = CMNotNull

classloaded(_cn.CMNotNull)