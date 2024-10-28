--[[
--- Created: 31/03/2024 17:11
--- Author: Absolute
--Made with ?
-------
-------


-------
--]]

_cn.Entity = "Entity"
loadClass(_cn.Entity)

--- Imports ---
import(_cn.List)
import(_cn.AClient)

---@class Entity : BaseObject
local Entity = class(_cn.Entity)

--- Attributs ---


--- Methods ---

---@param model string
---@param coords table
---@return Entity
function Entity.new(model, coords)
    ---@type Entity
    local self = initMetatable(Entity);

    self.model = model or "mp_m_freemode_01";
    self.coords = coords or vector3(0, 0, 0);
    self.hash = GetHashKey(self.model);
    self.id = nil;
    self.components = _c.List.new();

    self.entityDamaged = _c.Signal.new();
    self.healthChanged = _c.Signal.new();
    self.onDeath = _c.Signal.new();

    self.userData = _c.Map.new();

    ---@type ProximityText
    self.proximityText = nil;

    return self;
end

function Entity:outline(state)
    if (not self:exist()) then
        return ;
    end
    SetEntityDrawOutline(self.id, state);
end

function Entity:getHealth()
    return GetEntityHealth(self.id);
end

function Entity:setHealth(health)
    SetEntityHealth(self.id, health);
end

---@param textInfo {text:string, textOfInteraction:string}
---@param key number
---@param cb fun(): void
function Entity:interact(textInfo, key, cb)
    return self:registerProximity(textInfo, key, cb);
end

---@return boolean success
function Entity:placeOnGround()
    return PlaceObjectOnGroundProperly(self.id);
end

_a.AClient()
---@param cb fun(): void
---@param textInfo {text:string, textOfInteraction:string}
---@return ProximityText
function Entity:registerProximity(textInfo, key, cb)
    local drawModule = getSingleton(_c.DrawModule);
    local proximityText = drawModule:registerProximityText(self, textInfo, vector3(1, 1, 1), self.coords.x, self.coords.y, self.coords.z, 3.0, 3.0, _c.Color.new(255, 255, 255, 255));
    proximityText:setOnAction(cb, key);
    self.onDeath:connect(function()
        proximityText:unregister();
    end);

    self.proximityText = proximityText;

    return proximityText;
end

function Entity:setState(key, value, sync)
    Entity(self.id).state:set(key, value, sync);
end

function Entity:invincible(state)
    SetEntityInvincible(self.id, state);
end

function Entity:getState(key)
    return Entity(self.id).state:get(key);
end

---@param component Component
function Entity:addComponent(component)
    component.entity = self;
    self.components:push(component);
    component:onAdded();
end

function Entity:removeComponent(component)
    self.components:pop(component);
    component:onRemoved();
end

function Entity:getComponent(component)
    return self.components:find(component);
end

function Entity:setCoords(coords)
    self.coords = coords;
    SetEntityCoords(self.model, coords);
end

function Entity:setModel(model)
    self.model = model;
    SetEntityModel(self.id, model);
end

function Entity:setHeading(heading)
    SetEntityHeading(self.id, heading);
end

function Entity:loadModel()
    local hash = GetHashKey(self.model);
    if (not IsDuplicityVersion()) then
        RequestModel(hash);
        local timeout = GetGameTimer() + 5000;
        while not HasModelLoaded(hash) and GetGameTimer() < timeout do
            Citizen.Wait(0);
        end
        if GetGameTimer() >= timeout then
            Log.error("Entity model not loaded", self.model);
        end
    end
end

function Entity:spawn()
    self:loadModel();
    self.id = CreateObjectNoOffset(self.hash, self.coords);
end

function Entity:delete()
    DeleteEntity(self.id);
end

---@return vector3
function Entity:getCoords()
    return GetEntityCoords(self.id);
end

function Entity:getModel()
    return GetEntityModel(self.id);
end

function Entity:getHeading()
    return GetEntityHeading(self.id);
end

function Entity:applyForce(forceType, x, y, z, offX, offY, offZ, boneIndex, isDirection, ignoreUpVec, isForceRel, p12,
                           p13)
    if not self:exist() then
        return ;
    end
    ApplyForceToEntity(self.id, forceType, x, y, z, offX, offY, offZ, boneIndex, isDirection, ignoreUpVec, isForceRel,
            p12, p13);
end

---@return vector3
function Entity:getForwardVector()
    return GetEntityForwardVector(self.id);
end

function Entity:freeze(state)
    FreezeEntityPosition(self.id, state);
end

---Check if the entity exists
---@return boolean
function Entity:exist()
    return DoesEntityExist(self.id);
end

---@param entity Entity
function Entity:distanceTo(entity)
    return #(self:getCoords() - entity:getCoords());
end

function Entity:distanceToCoords(coords)
    return #(self:getCoords() - coords);
end

---@param entity Entity
function Entity:attachEntityToEntity(entity, boneIndex, x, y, z, xRot, yRot, zRot, p8, useSoftPinning, collision, isPed,
                                     vertexIndex, fixedRot)
    if not self:exist() or not entity:exist() then
        return ;
    end
    AttachEntityToEntity(entity.id, self.id,
            GetPedBoneIndex(self.id, boneIndex), x, y, z,
            xRot, yRot, zRot, p8,
            useSoftPinning, collision, isPed,
            vertexIndex, fixedRot
    );
end

_c.Entity = Entity
classloaded(_cn.Entity)
