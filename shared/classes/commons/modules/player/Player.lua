--[[
--- Created: 23/12/2023 09:24
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.Player = "Player";
loadClass(_cn.Player)
---@class Player : Instance
local Player = extends("Player", "Instance")

--- Attributes ---

Player.name = "";

--- Methods ---


function Player.new(sessionId)
    ---@type Player
    local self = initMetatable(Player);

    self.sessionId = sessionId;

    self.ped = _c.Ped.new();
    self.ped.id = GetPlayerPed(sessionId);

    return self;
end

function Player:setData(key, value)
    GLocalPlayer(self.sessionId, key, value, not Ats.isClient()).state:set(key, value);
end

function Player:getData(key)
    return GLocalPlayer(self.sessionId, key, nil, not Ats.isClient()).state:get(key);
end

function Player:getPosition()

end

---@param coords vector3
function Player:setPosition(coords)
    self.ped:setCoords(coords);
end

_c.Player = Player;
classloaded(_cn.Player)