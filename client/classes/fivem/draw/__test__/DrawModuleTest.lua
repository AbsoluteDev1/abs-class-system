---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 05/10/2024
---

_cn.DrawModuleTest = "DrawModuleTest"
loadClass(_cn.DrawModuleTest)

import(_cn.Test)

_a.Test()
---@class DrawModuleTest : BaseObject
---@field testBench TestBench
local DrawModuleTest = class("DrawModuleTest")

--- Attributs ---

--- Methods ---

function DrawModuleTest.new()
    ---@type DrawModuleTest
    local self = initMetatable(DrawModuleTest);

    ---@type Mockito
    self.mockito = getSingleton(_c.Mockito);

    return self;
end

function DrawModuleTest:test()

    self:log("info", "DrawModuleTest:test()")
    
    self.testBench:newUnitTest():describe("DrawModuleTest")
        :it("Check color of marker", function()
        local color = _c.Color.new(255, 255, 255, 255);

        local m = _c.Marker.new(1, _c.Vector3.new(0, 0, 0), 10.0, _c.Vector3.new(1, 1, 1), color, 1.0);

        self.mockito:assertEquals(color, m.color);
    end)
end

_c.DrawModuleTest = DrawModuleTest
classloaded(_cn.DrawModuleTest)