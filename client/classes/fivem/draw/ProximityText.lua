---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 12/10/2024
---

_cn.ProximityText = "ProximityText";
loadClass(_cn.ProximityText)

--- Imports ---

---@class ProximityText : Text3D
local ProximityText = extends(_cn.ProximityText, _cn.Text3D);

---@param entity Entity
---@param textInfo {text:string, textOfInteraction:string}
---@param scale Vector3
---@param x number
---@param y number
---@param z number
---@param distance number
---@param distanceToInteract number
---@param color Color
function ProximityText.new(entity, textInfo, scale, x, y, z, distance, distanceToInteract, color, offset)
    ---@type ProximityText
    local self = initMetatable(ProximityText);

    self:super(textInfo.text, vector3(scale.x or 0, scale.y or 0, scale.z or 0), x or 0, y or 0, z or 0, distance, _c.Color.new(color.r, color.g, color.b, color.a));

    self.distanceToInteract = distanceToInteract or 3.0;

    self.textOfInteraction = textInfo.textOfInteraction;

    self.color = color;

    self:attachToEntity(entity, offset)

    self.drawModule = getSingleton(_c.DrawModule);

    self.inputService = getSingleton(_c.InputService);

    self.actionned = _c.Signal.new();

    self.enteredProximity = _c.Signal.new();
    self.exitedProximity = _c.Signal.new();

    ---@private
    self.isEnteredInProximityDistance = false;

    return self;
end

function ProximityText:draw()
    self.__super__.draw(self);

    if self:isInProximity() then
        self.drawModule:showHelpNotification(self.textOfInteraction);
        self:checkInteraction();
        if not self.isEnteredInProximityDistance then
            self.enteredProximity:fire();
            self.isEnteredInProximityDistance = true;
        end
    else
        if self.isEnteredInProximityDistance then
            self.exitedProximity:fire();
            self.isEnteredInProximityDistance = false;
        end
    end
end

function ProximityText:unregister()
    self.__super__.unregister(self);

    self.drawModule.helpNotification = nil;
end

function ProximityText:setOnAction(action, key)
    self.onAction = action;
    self.key = key;
    return self;
end

function ProximityText:isInProximity()
    local coords = self:getCoords();
    local distanceFromPlayer = #(GetEntityCoords(PlayerPedId()) - coords);
    return distanceFromPlayer <= self.distanceToInteract;
end

function ProximityText:checkInteraction()

    if self.onAction and self.inputService:isKeyUp(self.key) then
        self.actionned:fire();
        self.onAction();
    end
end

_c.ProximityText = ProximityText;
classloaded(_cn.ProximityText)