---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 21/12/2023 01:18
---

_cn.Subject = "Subject";
loadClass(_cn.Subject)

--- Imports ---
import(_cn.List)
import(_cn.Observable)

---@class Subject : BaseObject
local Subject = class("Subject");

function Subject.new(next)
    ---@type Subject
    local self = initMetatable(Subject);

	self.subscribers = _c.List.new();

	self.observable = _c.Observable.new(function(subscriber)

	end);

    return self;
end

---@param subscriber { next : fun, error : fun, complete : fun }
function Subject:subscribe(subscriber)

	local sub = _c.Subscriber.new();

	sub._next = subscriber.next;
	sub._error = subscriber.error;
	sub._complete = subscriber.complete;

	self.subscribers:push(sub);
	return sub;
end

function Subject:next(value)
	---@param subscriber Subscriber
	self.subscribers:each(function(subscriber)
		subscriber:next(value);
	end);
end

function Subject:error(value)
	self.subscribers:each(function(subscriber)
		subscriber:error(value);
	end);
end

function Subject:complete()
	self.subscribers:each(function(subscriber)
		subscriber:complete();
	end);
end

_c.Subject = Subject;
classloaded(_cn.Subject)