---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 01:18
---

_cn.Camera = "Camera";
loadClass(_cn.Camera)

--- Imports ---

---@class Camera : BaseObject
local Camera = class(_cn.Camera);

function Camera.new()
    ---@type Camera
    local self = initMetatable(Camera);

    local camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true);
    self.id = camera;

    return self;
end

function Camera:setActive(active, ease, easeTime)
    SetCamActive(self.id, active);
    RenderScriptCams(active, ease or false, easeTime or 0, true, false);
end

function Camera:setPosition(x, y, z)
    SetCamCoord(self.id, x, y, z);
end

function Camera:setRotation(x, y, z)
    SetCamRot(self.id, x, y, z);
end

function Camera:setFov(fov)
    SetCamFov(self.id, fov);
end

function Camera:pointAt(entity)
    PointCamAtEntity(self.id, entity.id, 0, 0, 0, true);
end

function Camera:pointAtCoord(x, y, z)
    PointCamAtCoord(self.id, x, y, z);
end

function Camera:shake(amplitude, frequency)
    ShakeCam(self.id, "HAND_SHAKE", amplitude, frequency);
end

function Camera:shakeCam(cam, type, amplitude, frequency)
    ShakeCam(cam, type, amplitude, frequency);
end

function Camera:destroy()
    DestroyCam(self.id, false);
end

---@param entity Entity
function Camera:attachTo(entity)
    AttachEntityToEntity(self.id, entity.id, 0, 0, 0, 0, 0, 0, 0, 0, 0);
end

function Camera:pointAtPedBone(ped, boneIndex, x, y, z, p2)
    PointCamAtPedBone(self.id, ped, boneIndex, x, y, z, p2);
end

function Camera:attachToPedBone(ped, boneIndex, x, y, z, p5, p6, p7)
    AttachCamToPedBone(self.id, ped, boneIndex, x, y, z, p5, p6, p7);
end

function Camera:pointAtEntityBone(entity, boneIndex)
    local boneCoords = GetPedBoneCoords(entity.id, boneIndex)
    PointCamAtCoord(self.id, boneCoords.x, boneCoords.y, boneCoords.z)
end

_c.Camera = Camera;
classloaded(_cn.Camera)