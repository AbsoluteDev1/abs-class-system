---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 05/10/2024
---

_cn.DrawableElement = "DrawableElement";
loadClass(_cn.DrawableElement)

--- Imports ---

import(_cn.DrawModule)

---@class DrawableElement : BaseObject
local DrawableElement = class("DrawableElement");

---@param color Color
function DrawableElement.new(color, position, distance)
    ---@type DrawableElement
    local self = initMetatable(DrawableElement);

    self.color = color;
    self.position = position;
    self.distance = distance;

    ---@type Entity
    self.entityAttached = nil;

    self.entityOffset = vector3(0, 0, 0);

    return self;
end

function DrawableElement:register()
    ---@type DrawModule
    self.drawModule = getSingleton(_c.DrawModule);
    self.drawModule:registerDrawable(self);

    return self;
end

function DrawableElement:unregister()
    self.drawModule:unregisterDrawable(self);
end

function DrawableElement:draw()

end

---@param entity Entity
---@param offset Vector3
function DrawableElement:attachToEntity(entity, offset)
    self.entityOffset = offset or vector3(0, 0, 0);
    self.entityAttached = entity;
end

function DrawableElement:getCoords()
    if self.entityAttached then
        return self.entityAttached:getCoords() + self.entityOffset;
    end

    return self.position;
end

_c.DrawableElement = DrawableElement;
classloaded(_cn.DrawableElement)
