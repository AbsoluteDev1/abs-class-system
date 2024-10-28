--[[
--- Created: 11/04/2024 14:23
--- Author: Absolute
--Made with ?
-------
-------


-------
--]]

_cn.Ped = "Ped"
loadClass(_cn.Ped)

--- Imports ---
import(_cn.SkinComponent)
---@type Signal
local Signal = import(_cn.Signal)
---@type Vehicle
local Vehicle = import(_cn.Vehicle)

---@class Ped : Entity
local Ped = extends(_cn.Ped, _cn.Entity)

--- Attributs ---


--- Methods ---

---@param model string
---@param coords Vector3
---@param heading number
function Ped.new(model, coords, heading)
    ---@type Ped
    local self = initMetatable(Ped);

    self.model = model or "a_m_m_skater_01";
    self.hash = GetHashKey(self.model);
    self.coords = coords or vector3(0, 0, 0);
    self.heading = heading or 0;

    -- Signals
    self.characterDied = Signal.new();
    self.weaponEquipped = Signal.new();
    self.weaponUnEquipped = Signal.new();
    self.armorChanged = Signal.new();
    self.vehicleEntered = Signal.new();

    return self;
end

function Ped:spawn()
    self:loadModel();
    self.id = CreatePed(0, self.hash, self.coords.x, self.coords.y, self.coords.z, self.heading, false, false);
    self.skinComponent = _c.SkinComponent.new();
    self:addComponent(self.skinComponent);

    local entityService = getSingleton(_c.EntityService);
    entityService:register(self);
end

---@return Vehicle
function Ped:getVehicleIsIn()
    local vehicle = Vehicle.new();
    vehicle.id = GetVehiclePedIsIn(self.id);
    return vehicle;
end

function Ped:getCoordsTwo()
    return self.coords
end

function Ped:getSkinComponent()
    return self.skinComponent;
end

function Ped:addWeapon(weaponHash, ammo)
    if self:exist() then
        assert(type(weaponHash) == "number", "weaponHash must be a number");
        assert(type(ammo) == "number", "ammo must be a number");
        GiveWeaponToPed(self.id, weaponHash, ammo, false, true);
    end
end

function Ped:removeWeapon(weaponHash)
    if self:exist() then
        RemoveWeaponFromPed(self.id, weaponHash);
    end
end

function Ped:goToCoords(coords)
    if self:exist() then
        TaskGoStraightToCoord(self.id, coords.x, coords.y, coords.z, 1.0, -1, self.heading, 0.0);
        _c.Observable.new(function()
            Ats.thread(function()
                local timeout = GetGameTimer() + 10000
                while (self:getCoords() - coords) < 2.0 and GetGameTimer() < timeout do
                    Ats.wait(0)
                    if #(self.coords - coords) < 2.0 then
                        break
                    end
                end
            end)
        end)
    end
end

function Ped:playAnimation(dict, name, duration, flag)
    if self:exist() then
        RequestAnimDict(dict);
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(0);
        end
        TaskPlayAnim(self.id, dict, name, 8.0, 8.0, duration, flag, 0, false, false, false);
    end
end

function Ped:playScenario(scenario)
    if self:exist() then
        TaskStartScenarioInPlace(self.id, scenario, 0, true);
    end
end

function Ped:playScenarioAtCoords(scenario, coords, heading)
    if self:exist() then
        TaskStartScenarioAtPosition(self.id, scenario, coords.x, coords.y, coords.z, heading, 0, true, true, 0, true);
    end
end

function Ped:setBlockingOfNonTemporaryEvents(state)
    if self:exist() then
        SetBlockingOfNonTemporaryEvents(self.id, state);
    end
end

function Ped:clearTasks()
    if self:exist() then
        ClearPedTasks(self.id);
    end
end

--- Focuses the camera on the ped's face with a transition.
function Ped:focusOnFace()
    if not DoesEntityExist(self.id) then
        return
    end

    if not self.camera then
        self.camera = _c.Camera.new()
    end

    local headBoneId = 31086  -- SKEL_Head
    local headCoords = GetPedBoneCoords(self.id, headBoneId)

    local camOffset = vector3(0.0, 1.5, 0.6)
    local camCoords = headCoords + camOffset

    local lookAtCoords = headCoords

    self.camera:setPosition(camCoords.x, camCoords.y, camCoords.z)
    self.camera:pointAtCoord(lookAtCoords.x, lookAtCoords.y, lookAtCoords.z)

    self.camera:setActive(true, true, 2000)

    local startFov = 60.0
    local endFov = 30.0
    local duration = 2000
    self.camera:setFov(startFov)

    Ats.thread(function()
        local startTime = GetGameTimer()
        while true do
            local progress = math.min((GetGameTimer() - startTime) / duration, 1.0)
            local currentFov = startFov + (endFov - startFov) * progress
            self.camera:setFov(currentFov)

            if progress >= 1.0 then
                break
            end
            Ats.wait(0)
        end
        self.camera:setFov(endFov)
    end)
end

function Ped:playFacialAnim(dict, name)
    if self:exist() then
        RequestAnimDict(dict);
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(0);
        end
        PlayFacialAnim(self.id, name, dict)
    end
end

---@param vehicle Vehicle
---@param timeout number
function Ped:walkToVehicle(vehicle, timeout, seatIndex, speed)
    timeout = timeout or 10000

    if self:exist() then

        TaskEnterVehicle(self.id, vehicle.id, -1, seatIndex or -1, speed or 1.0, 1, 0);

        local startTime = GetGameTimer()

        Ats.thread(function()
            while not IsPedInVehicle(self.id, vehicle.id, false) do
                local currentTime = GetGameTimer()
                local deltaTime = currentTime - startTime

                if deltaTime >= timeout then
                    self:clearTasks()
                    break
                end

                Ats.wait(0)
            end

            self.vehicleEntered:fire(vehicle)
        end)
    end
end

function Ped:driveToCoords(coords)
    if self:exist() then
        TaskVehicleDriveToCoord(self.id, GetVehiclePedIsIn(self.id), coords.x, coords.y, coords.z, 1.0, 1.0, GetEntityModel(GetVehiclePedIsIn(self.id)), 262144, 1.0, true);
    end
end

function Ped:driveToCoordsLongRange(coords, speed, timeout)
    if self:exist() then


        local vehicle = GetVehiclePedIsIn(self.id);

        if vehicle == 0 then
            return
        end

        if timeout == nil then
            timeout = 600000
        end

        TaskVehicleDriveToCoordLongrange(self.id, vehicle, coords.x, coords.y, coords.z, speed or 60.0, 447, 20.0);
        self.vehicleArrived = Signal.new();
        Ats.thread(function()
            local timer = GetGameTimer();
            while #(self:getCoords() - GetEntityCoords(vehicle)) <= 21.0 and (GetGameTimer() - timer) < timeout do
                Ats.wait(100)
            end

            self.vehicleArrived:fire();
        end)
    end
end

--- Checks if the Ped is inside the specified vehicle
---@param vehicle Vehicle
---@return boolean
function Ped:isInVehicle(vehicle)
    if self:exist() then
        return IsPedInVehicle(self.id, vehicle.id, false);
    end
    return false;
end

_c.Ped = Ped
classloaded(_cn.Ped)