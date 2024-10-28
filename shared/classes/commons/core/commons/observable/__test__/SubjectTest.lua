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

_cn.SubjectTest = "SubjectTest"
loadClass(_cn.SubjectTest)

import(_cn.Test)
_a.Test()
---@class SubjectTest : BaseObject
---@field testBench TestBench
local SubjectTest = class("SubjectTest")

--- Attributs ---

--- Methods ---

function SubjectTest.new()
    ---@type MyFirstTest
    local self = initMetatable(SubjectTest);

    return self;
end

function SubjectTest:test()
    self.testBench:newUnitTest():describe("SubjectTest")
        :it("Test if subscribers are notified", function()
        local subject = _c.Subject.new();
        subject:subscribe({
            next = function(value)
                assert(value == "Hello", "Value is Hello")
            end
        });
        subject:subscribe({
            next = function(value)
                assert(value == "Hello", "Value is Hello")
            end
        });

        subject:next("Hello");
    end)
end

_c.SubjectTest = SubjectTest
classloaded(_cn.SubjectTest)