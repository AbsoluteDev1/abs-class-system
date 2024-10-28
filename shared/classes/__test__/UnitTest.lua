--[[
--- Created: 24/12/2023 14:38
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

loadClass("UnitTest")

---@class UnitTest : BaseObject
local UnitTest = class("UnitTest")

--- Attributs ---


--- Methods ---

function UnitTest.new()
    ---@type UnitTest
    local self = initMetatable(UnitTest);
    self.name = "Test";
    self.its = {};
    self.numberOfTests = 0;
    return self;
end

function UnitTest:describe(name)
    self.name = name;
    return self;
end

function UnitTest:beforeEach(callback)
    self.beforeEachCb = callback;
    return self;
end

function UnitTest:afterEach(callback)
    self.afterEachCb = callback;
    return self;
end

function UnitTest:it(name, callback)
    local source = debug.getinfo(2).source;
    self.its[name] = { cb = callback, source = source };
    self.numberOfTests = self.numberOfTests + 1;
    return self;
end

function UnitTest:run(testBenchData)
    print(" ---- Running tests : " .. self.name .. " ---- ");
    for name, data in pairs(self.its) do
        if self.beforeEachCb then
            self.beforeEachCb();
        end
        print("Running test : " .. name .. " source : " .. data.source);
        local s, e = pcall(function()
            data.cb();
        end)
        if not s then
            print("Test " .. self.name .. " failed: ^5" .. name .. " with error: " .. e .. "^7");
            testBenchData.numberOfTestFailed = testBenchData.numberOfTestFailed + 1;
        else
            print("Test " .. self.name .. " passed: ^2" .. name .. "^7");
            testBenchData.numberOfTestPassed = testBenchData.numberOfTestPassed + 1;
        end
        testBenchData.numberOfTest = testBenchData.numberOfTest + 1;
        print("test passed : " .. testBenchData.numberOfTest .. " / " .. testBenchData.totalTests);
        if self.afterEachCb then
            self.afterEachCb();
        end
    end
    print("--------------------------------------------");
    return testBenchData;
end

_c.UnitTest = UnitTest
_cn.UnitTest = "UnitTest"
classloaded("UnitTest")