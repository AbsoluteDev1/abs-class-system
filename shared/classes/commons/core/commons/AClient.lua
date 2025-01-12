---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 12/10/2024
---

_cn.AClient = "AClient";
loadClass(_cn.AClient)

--- Imports ---

---@class AClient : Annotation
local AClient = extends(_cn.AClient, _cn.Annotation);

function AClient.new()
    ---@type AClient
    local self = initMetatable(AClient);

    return self;
end

function AClient:onInstantiate(object, attr)
    if not Ats.isClient() then
        object[attr] = function()
            Log.error("Method " .. attr .. " is not available on server side");
        end
    end
end

function AClient:onValueChange(object, attr)
end

_a.AClient = annotation(_cn.AClient, AClient)
_c.AClient = AClient;
classloaded(_cn.AClient)