---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 01:18
---

_cn.Subscriber = "Subscriber";
loadClass(_cn.Subscriber)
--- Imports ---

---@class Subscriber : BaseObject
local Subscriber = class(_cn.Subscriber);

function Subscriber.new()
	---@type Subscriber
	local self = initMetatable(Subscriber);
	self._next = nil;
	self._error = nil;
	self._complete = nil;
	---@type Observable
	self.observable = nil;
	return self;
end

function Subscriber:next(value)
	if self._next then
		self._next(value);
	end
end

function Subscriber:error(value)
	if self._error then
		self._error(value);
	end
end

function Subscriber:complete()
	if self._complete then
		self._complete();
	end
end

function Subscriber:unsubscribe()
	self.observable:removeSubscriber(self);
end

_c.Subscriber = Subscriber;
classloaded(_cn.Subscriber)