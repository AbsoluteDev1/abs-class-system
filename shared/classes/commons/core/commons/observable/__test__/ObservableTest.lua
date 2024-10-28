--[[
--- Created: 24/12/2023 14:49
--- Author: Absolute
--Made with ❤
-------
-------
--Copyright (c) Qinoxe, All Rights Reserved.
--This file is part of Qinoxe project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
-------
--]]

_cn.ObservableTest = "ObservableTest"
loadClass(_cn.ObservableTest)

import(_cn.Test)
_a.Test()
---@class ObservableTest : BaseObject
---@field testBench TestBench
local ObservableTest = class(_cn.ObservableTest)

--- Attributs ---

--- Methods ---

function ObservableTest.new()
    ---@type MyFirstTest
    local self = initMetatable(ObservableTest);
    return self;
end

function ObservableTest:test()
    self.testBench:newUnitTest()
        :describe("ObservableTest")
        :it("should have an observer in param", function()
        local observable = _c.Observable.new(function(observer)
            assert(observer ~= nil, "Observable is not nil")
        end)
    end)
        :it("Check subscribe value after next", function()
        local observable = _c.Observable.new(function(observer)
            observer:next("Hello")
        end)
        observable:subscribe({
            next = function(value)
                assert(value == "Hello", "Value is Hello")
            end
        })
    end)
        :it("Check subscribe value after error", function()
        local observable = _c.Observable.new(function(observer)
            observer:error("Error")
        end)
        observable:subscribe({
            error = function(value)
                assert(value == "Error", "Value is Error")
            end
        })
    end)
        :it("Check subscribe value after complete", function()
        local observable = _c.Observable.new(function(observer)
            observer:complete()
        end)
        observable:subscribe({
            complete = function()
                assert(true, "Complete is true")
            end
        })
    end)
        :it("Check filter value", function()
        local observable = _c.Observable.new(function(observer)
            observer:next(1)
            observer:next(2)
            observer:next(3)
            observer:next(4)
            observer:next(5)
            observer:complete()
        end)                 :filter(function(value)
            return value % 2 == 0
        end)
        observable:subscribe({
            next = function(value)
                assert(value % 2 == 0, "Value is even")
            end
        })
    end)
        :it("Check foreach value", function()
        local observable = _c.Observable.new(function(observer)
            observer:next(1)
            observer:next(2)
            observer:next(3)
            observer:next(4)
            observer:next(5)
            observer:complete()
        end)                 :foreach(function(value)
            assert(value, "Value is not nil")
        end)
    end)
        :it("Check map value", function()
        local observable = _c.Observable.new(function(observer)
            observer:next(1)
            observer:next(2)
            observer:next(3)
            observer:next(4)
            observer:next(5)
            observer:complete()
        end)                 :map(function(value)
            return value * 2
        end)
        observable:subscribe({
            next = function(value)
                assert(value % 2 == 0, "Value is even")
            end
        })
    end)
end

_c.ObservableTest = ObservableTest
classloaded(_cn.ObservableTest)