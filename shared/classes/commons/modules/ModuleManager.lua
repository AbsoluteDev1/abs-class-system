--[[
--- Created: 24/12/2023 15:26
--- Author: Absolute
--Made with ❤
-------
-------


-------
--]]

_cn.ModuleManager = "ModuleManager"
loadClass(_cn.ModuleManager)
--- imports ---
import("ApplicationScope")

_a.ApplicationScope()
---@class ModuleManager : BaseObject
local ModuleManager = class("ModuleManager")

--- Attributs ---


--- Methods ---

function ModuleManager.new()
    ---@type ModuleManager
    local self = initMetatable(ModuleManager);

    ---@type Module[]
    self.modules = {};
    self.modulesLoading = {};

    RegisterCommand("stop_module", function(_, args)
        self:stopModule(args[1]);
    end)

    RegisterCommand("start_module", function(_, args)
        self:startModule(args[1]);
    end)

    RegisterCommand("restart_module", function(_, args)
        self:restartModule(args[1]);
    end)

    return self;
end

function ModuleManager:stopModule(moduleName)

    if (not moduleName) then
        Log.error("Module name is required");
        return ;
    end

    for _, module in pairs(self.modules) do
        if module.__class__ == moduleName then
            module:stop();
            return ;
        end
    end
    Log.error("Module " .. _chc.R .. moduleName .. _chc.W .. " not found");

end

function ModuleManager:startModule(moduleName)
    if (not moduleName) then
        Log.error("Module name is required");
        return ;
    end

    for _, module in pairs(self.modules) do
        print("Module name: " .. module.__class__, table.contains(Project.modulesDisabledByDefault, moduleName))
        if module.__class__ == moduleName and not table.contains(Project.modulesDisabledByDefault, moduleName) then
            module:start();
            return ;
        end
    end
    Log.error("Module " .. _chc.R .. moduleName .. _chc.W .. " not found");
end

function ModuleManager:restartModule(moduleName)

    if (not moduleName) then
        Log.error("Module name is required");
        return ;
    end

    for _, module in pairs(self.modules) do
        if module.__class__ == moduleName then
            module:restart();
            return ;
        end
    end
    Log.error("Module " .. _chc.R .. moduleName .. _chc.W .. " not found");

end

---@param module Module
function ModuleManager:preparingModule(module)
    self.modulesLoading[module.__class__] = false;
    Log.info("Module " .. _chc.B .. module.__class__ .. _chc.W .. " preparing to load");
end

---@param module Module
function ModuleManager:registerModule(module)
    table.insert(self.modules, module);
    self.modulesLoading[module.__class__] = nil;
    Log.info("Module " .. _chc.G .. module.__class__ .. _chc.W .. " ready to load");
end

function ModuleManager:loadModules()

    repeat Wait(0) until allClassesLoaded();

    Log.info(" *** Loading modules *** ");
    for _, module in pairs(self.modules) do

        if Project.modulesDisabledByDefault and table.contains(Project.modulesDisabledByDefault, module.__class__) then
            goto continue;
        end

        Log.info("Loading module " .. _chc.B .. module.__class__ .. _chc.W)
        module:load();

        :: continue ::
    end
end

function ModuleManager:startModules()
    Log.info("Starting modules");

    for _, module in pairs(self.modules) do

        if Project.modulesDisabledByDefault and table.contains(Project.modulesDisabledByDefault, module.__class__) then
            goto continue;
        end

        module:start();

        :: continue ::
    end
    Log.info("All modules started");
end

function ModuleManager:stopModules()
    Log.info("Stopping modules");
    for _, module in pairs(self.modules) do
        module:stop();
    end
    Log.info("All modules stopped");
end

function ModuleManager:allModulesLoaded()
    for _, isLoaded in pairs(self.modulesLoading) do
        if not isLoaded then
            return false;
        end
    end
    return true;
end

_c.ModuleManager = ModuleManager
classloaded(_cn.ModuleManager)