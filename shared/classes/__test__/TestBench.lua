--[[
--- Created: 23/12/2023 14:25
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]
loadClass("TestBench")

import("ApplicationScope")
---@type UnitTest
local UnitTest = import("UnitTest");

_a.ApplicationScope()
---@class TestBench : BaseObject
---@field unitTests UnitTest[]
local TestBench = class("TestBench")

function TestBench.new()
    ---@type TestBench
    local self = initMetatable(TestBench);

    self.unitTests = {};
    self.nbTest = 0;
    self.waitForTest = true;

    RegisterCommand("run_test", function(source, args)
        self:run(args)
    end)

    RegisterCommand("test_list", function(source, args)
        self:list()
    end)

    return self;
end

function TestBench:list()
    for _, unitTest in pairs(self.unitTests) do
        print("--- Test class : " .. _chc.B .. unitTest.name .. _chc.W .. " ---");
        for name, data in pairs(unitTest.its) do
            print("Test unit : " .. name);
        end
    end
end

---@return UnitTest
function TestBench:newUnitTest()
    local unitTest = UnitTest.new();
    table.insert(self.unitTests, unitTest);
    return unitTest;
end

function TestBench:run(args)

    local testName = args[1];

    local totalTests = 0;
    for _, unitTest in pairs(self.unitTests) do
        if testName ~= nil then
            if testName == unitTest.name then
                totalTests = totalTests + unitTest.numberOfTests;
            end
        else
            totalTests = totalTests + unitTest.numberOfTests;
        end
    end
    local time = Interface.getGameTimer();
    print("Running " .. totalTests .. " tests");
    local numberOfTest = { numberOfTest = 0, totalTests = totalTests, numberOfTestFailed = 0, numberOfTestPassed = 0 };
    for _, unitTest in pairs(self.unitTests) do
        ---@type UnitTest
        local test = unitTest;
        if (testName ~= nil) then
            if (testName == test.name) then
                numberOfTest = test:run(numberOfTest);
            end
        else
            numberOfTest = test:run(numberOfTest);
        end
    end
    print("Tests finished in " .. Interface.getGameTimer() - time .. "ms")
    print("Rapports : ")
    print("Tests run : " .. numberOfTest.numberOfTest .. " / " .. totalTests);
    print("^2Tests passed : " .. numberOfTest.numberOfTestPassed .. " / " .. totalTests);
    print("^5Tests failed : " .. numberOfTest.numberOfTestFailed .. " / " .. totalTests);
end

_c.TestBench = TestBench
_cn.TestBench = "TestBench"
classloaded("TestBench")