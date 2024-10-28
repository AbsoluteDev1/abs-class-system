---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 07/10/2024
---

_cn.Blip = "Blip";
loadClass(_cn.Blip)

--- Imports ---

---@class Blip : BaseObject
local Blip = class("Blip");

---@param typeBlip 'ped'|'coords'|'vehicle'|'area'|'pickup'
function Blip.new(typeBlip, data, sprite, color, scale, name, shortRange)
    ---@type Blip
    local self = initMetatable(Blip);

    self.typeBlip = typeBlip;
    self.data = data;
    self.sprite = sprite;
    self.color = color;
    self.scale = scale;
    self.name = name;
    self.shortRange = shortRange;

    return self;
end

function Blip:hide()
    RemoveBlip(self.blipId);
end

function Blip:changeColor(color)
    SetBlipColour(self.blipId, color);
    return self;
end

function Blip:changeSprite(sprite)
    SetBlipSprite(self.blipId, sprite);
    return self;
end

function Blip:changeScale(scale)
    SetBlipScale(self.blipId, scale);
    return self;
end

function Blip:changeName(name)
    BeginTextCommandSetBlipName("STRING");
    AddTextComponentString(name);
    EndTextCommandSetBlipName(self.blipId);
    return self;
end

function Blip:changeShortRange(shortRange)
    SetBlipAsShortRange(self.blipId, shortRange);
    return self;
end

function Blip:show()
    local blip;

    if self.typeBlip == "ped" then
        blip = AddBlipForEntity(self.data);
    elseif self.typeBlip == "coords" then
        blip = AddBlipForCoord(self.data.x, self.data.y, self.data.z);
    elseif self.typeBlip == "vehicle" then
        blip = AddBlipForRadius(self.data.coords.x, self.data.coords.y, self.data.coords.z, self.data.radius);
    elseif self.typeBlip == "area" then
        blip = AddBlipForArea(self.data.x, self.data.y, self.data.z, self.data.width, self.data.height, self.data.depth);
    elseif self.typeBlip == "pickup" then
        blip = AddBlipForPickup(self.data);
    end

    SetBlipSprite(blip, self.sprite);
    SetBlipColour(blip, self.color);
    --SetBlipScale(blip, self.scale);
    SetBlipAsShortRange(blip, self.shortRange);
    BeginTextCommandSetBlipName("STRING");
    AddTextComponentString(self.name);
    EndTextCommandSetBlipName(blip);
    SetBlipDisplay(blip, 4);
    self.blipId = blip;

    Log.debug(("Blip %s showed"):format(self.name));
end

_c.Blip = Blip;
classloaded(_cn.Blip)