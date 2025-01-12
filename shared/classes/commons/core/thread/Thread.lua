---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 05/10/2024
---

_cn.Thread = "Thread";
loadClass(_cn.Thread)

--- Imports ---

local index = 0;

---@class Thread : BaseObject
local Thread = class("Thread");

function Thread.new(cb)
    ---@type Thread
    local self = initMetatable(Thread);

    self.cb = cb;
    self.isRunning = false;

    index = index + 1;

    self.name = "Thread" .. index;

    return self;
end

function Thread:run()
    ---@type ThreadManager
    self.threadManager = getSingleton(_c.ThreadManager);
    self.isRunning = true;
    self.threadManager.threads:push(self);
    Citizen.CreateThread(function()
        self.cb()
    end)
end

function Thread:wait(time)
    Citizen.Wait(time)
end

function Thread:kill()
    self.isRunning = false;
    local i = self.threadManager.threads:indexOf(self);
    self.threadManager.threads:remove(i);
end

_c.Thread = Thread;
classloaded(_cn.Thread)