--[[
--- Created: 24/12/2023 15:49
--- Author: Absolute
--Made with ❤
-------
-------
-------
--]]

_cn.Server = "Server"
loadClass(_cn.Server)

--- Imports ---
import("ApplicationScope")
import("ModuleManager")
import("Vehicle")

_a.ApplicationScope()
---@class Server : BaseObject
local Server = class("Server")


--- Attributs ---

_a.Inject(_c.ModuleManager)
---@type ModuleManager
Server.moduleManager = nil;

--- Methods ---

function Server.new()
    ---@type Server
    local self = initMetatable(Server);
    local time = Interface.getGameTimer();

    self:waitForModules();

    Log.info("Server starting...");

    self:loadModules();

    Log.info("Modules loaded");
    Log.info("**************************");

    self:startAllModules();

    Log.info("**************************");
    Log.info("Server started");
    Log.info("Started in " .. Interface.getGameTimer() - time .. " ms");

    return self;
end

function Server:waitForModules()
    repeat
        Interface.wait(0);
    until self.moduleManager:allModulesLoaded();
    Log.info("All modules loaded");
end

function Server:loadModules()
    self.moduleManager:loadModules();
end

function Server:startAllModules()
    self.moduleManager:startModules();
end

function Server:stopAllModules()
    self.moduleManager:stopModules();
end

_a.NetEvent()
function Server:isServerReady(source)
    TriggerClientEvent("Client:isServerReady", source);
end

_c.Server = Server
classloaded(_cn.Server)