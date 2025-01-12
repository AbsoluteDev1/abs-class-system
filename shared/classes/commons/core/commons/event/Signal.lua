---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 00:04
---

_cn.Signal = "Signal"
loadClass(_cn.Signal)

---@class Signal : BaseObject
---@field connections Connection[]
local Signal = class("Signal");

function Signal.new()
    ---@type Signal
    local self = initMetatable(Signal);
    self.connections = {};
    return self;
end

---@param func fun():Connection
---@return Connection
function Signal:connect(func)
    local connection = _c.Connection.new(self, func);
    table.insert(self.connections, connection);
    return connection;
end

function Signal:fire(...)
    for _, connection in pairs(self.connections) do
        connection.func(...);
    end
end

function Signal:disconnect(connection)
    for i, conn in pairs(self.connections) do
        if conn == connection then
            table.remove(self.connections, i);
            break ;
        end
    end
end

function Signal:combine(signal)
    local newSignal = _c.Signal.new();

    local oneIsTriggered = false;

    local allData = {};

    local connect1 = self:connect(function(...)
        allData = { table.unpack(allData), ... };
        if not oneIsTriggered then
            oneIsTriggered = true;
            newSignal:fire(table.unpack(allData));
        end
    end)

    local connect2 = signal:connect(function(...)
        allData = { table.unpack(allData), ... };
        if not oneIsTriggered then
            oneIsTriggered = true;
            newSignal:fire(table.unpack(allData));
        end
    end)

    return newSignal, connect1, connect2;
end

_c.Signal = Signal
classloaded(_cn.Signal)
