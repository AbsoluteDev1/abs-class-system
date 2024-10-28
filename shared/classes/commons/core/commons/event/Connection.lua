---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 00:14
---

_cn.Connection = "Connection"
loadClass(_cn.Connection)
---@class Connection
local Connection = class(_cn.Connection);

function Connection.new(signal, func)
	local self = setmetatable({}, { __index = Connection });
	self.signal = signal;
	self.func = func;
	return self;
end

---Disconnects the connection
function Connection:disconnect()
	self.signal:disconnect(self);
end

---Fires the connection
---@vararg any
function Connection:fire(...)
	assert(self.func, "Connection is disconnected");
	self.func(...);
end

_c.Connection = Connection

classloaded("Connection")