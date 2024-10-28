local classes = {}
local classesLoaded = {}
local classesReflection = {}
local singletons = {}
local proxies = {}
local classesImport = {}
local stopAllTryingInstantiation = false;
_a = {}
_c = {}

local currentClassloading = nil;
local classAnnotations = {};

function allClassesLoaded()
    for k, v in pairs(classesLoaded) do
        if not v then
            return false;
        end
    end
    return true;
end

function extends(classname, extendclass, cannotBeExtended)
    assert(type(classname) == "string", "Classloader.loadClass expects 'classname' as a 'string'")
    assert(type(extendclass) == "string",
            "Classloader.loadClass expects 'extendclass' as a 'string' receive : " .. type(extendclass))
    ---@type BaseObject
    local clazz = import(extendclass)
    return class(classname, clazz, cannotBeExtended);
end

---@param name string
---@param timeoutTimer number | nil
function import(name, timeoutTimer)
    local currentClazz = currentClassloading;
    if name == nil then
        print(debug.traceback())
        error("Import expects 'name' as a 'string' not a 'nil'")
    end

    if classesImport[currentClazz] and classesImport[currentClazz][name] and currentClazz ~= "Class" and name ~= "Class" then
        error("Importing class '" .. name .. "' in class '" .. currentClazz .. "' will create a circular dependency")
    end

    if not classesImport[name] then
        classesImport[name] = {};
    end

    if currentClazz then
        classesImport[name][currentClazz] = true;
    end

    if (name == "Subscriber") then
        print("Importing class '" .. name .. "'")
    end
    if classes[name] then
        return classes[name]
    else
        local promize = Interface.promise.new();
        Interface.thread(function()
            local timeout = timeoutTimer or 1000;
            local timer = Interface.getGameTimer();
            repeat
                if (name == "Subscriber") then
                    print("Wait Resolve class '" .. name .. "'")
                end
                Interface.wait(0)
            until (classes[name] and classesLoaded[name]) or Interface.getGameTimer() - timer > timeout
            if classes[name] then
                if (name == "Subscriber") then
                    print("Resolve class 2 '" .. name .. "'", classes[name])
                end
                promize:resolve(classes[name])
            else
                print(debug.traceback())
                promize:reject("Classloader.loadClass / Can't get Class '" .. name .. "' cause it's not loaded")
            end
        end)
        if (name == "Subscriber") then
            print("Importing class 2 '" .. name .. "'")
        end
        local r = Interface.await(promize)
        currentClassloading = currentClazz;
        return r;
    end
end

---@param name string
---@param parentClass BaseObject
function class(name, parentClass, cannotBeExtended)
    currentClassloading = name;
    local ignoreAttribute = true;
    ---@type BaseObject
    local clazz = parentClass and parentClass.new() or BaseObject.new();

    clazz.__analyseStack = function(t, k, v)
        analyseClass(name, t, k, v);
        rawset(t, k, v);
    end

    clazz = setmetatable(clazz, {
        __index = parentClass and parentClass or BaseObject,
        __newindex = function(t, k, v)
            t.__analyseStack(t, k, v);
            if classAnnotations[clazz.__class__] and k ~= "__canBeExtended__" and k ~= "toString" and k ~= "super" then
                local classRef = clazz;
                local attr = k;

                for _, annot in pairs(classAnnotations[clazz.__class__]) do
                    if annot.__class__ then
                        ---@type Annotation
                        local annotation = annot;
                        annotation.innerTable = classRef;
                        annotation.innerAttr = attr;

                        if not classRef.__annotations__[attr] then
                            classRef.__annotations__[attr] = {}
                        end
                        table.insert(classRef.__annotations__[attr], annot);
                        Log.trace("annotation registered for class : %s attribute : %s annotation : %s", clazz.__class__,
                                k, annot)
                    end
                end
                classAnnotations[clazz.__class__] = {};
            end
        end
    });
    classes[name] = clazz;
    clazz.__parent__ = parentClass and parentClass.new() or BaseObject.new();
    clazz.__super__ = parentClass;
    clazz.__class__ = name;

    clazz.__canBeExtended__ = not cannotBeExtended;
    clazz.__annotations__ = {};

    function clazz:toString()
        return name;
    end

    function clazz:super(...)
        local init = initMetatable;

        initMetatable = function()
            return self;
        end

        local superOrignal = self.super;

        self.super = function(...)
            self.__parent__.super(self.__parent__, ...)
        end

        self.__parent__.new(...);

        self.super = superOrignal;

        initMetatable = init;
    end

    ignoreAttribute = false;

    local classRef = classes[name];

    classRef.__annotations__["__global__"] = {};

    if (classAnnotations[name]) then
        for _, annot in pairs(classAnnotations[name]) do
            if annot.__class__ then
                Log.trace("annotation registered global for class : %s annotation : %s", _, clazz.__class__,
                        annot.__class__)
                table.insert(classRef.__annotations__["__global__"], annot);
                annot.innerTable = classRef;
            end
        end

        classAnnotations[name] = {};
    end

    return classes[name];
end

function initMetatable(Object, cb)
    local d = setmetatable({}, { __index = Object })
    local _d = d;
    local signal

    if Object.__parent__ then
        --- need to call the new of parent but apply to the current d instance
        local p = Object.__parent__.new();
        Object.__parent__ = p;
        if p then
            for k, v in pairs(p) do
                if type(v) ~= "function" and not (string.sub(tostring(k), 1, 2) == "__") then
                    d[k] = p[k];
                end
            end
        end
    end

    local internalData = {}

    local monitorMetatable = {
        __index = function(table, key)
            if (key == "__internal__") then
                return _d;
            end
            return _d[key]
        end,
        __newindex = function(table, key, value)
            analyseClass(Object.__class__, internalData, key, value);
            if signal then
                signal:fire(key, value)
            end
            if cb then
                cb(table, key, value)
            end
            _d[key] = value
        end,
        __pairs = function(table)
            return pairs(_d)
        end,
        __ipairs = function(table)
            return ipairs(_d)
        end,
    }
    local instance = setmetatable(internalData, monitorMetatable);
    if Object.__class__ ~= "Signal" and Object.__class__ ~= "Connection" then
        import("Signal")
        signal = _c.Signal.new();
        instance.changed = signal;
    end
    for k, v in pairs(Object.__annotations__) do
        for _, a in pairs(v) do
            if a.onInstantiate then
                a:onInstantiate(instance, k)
            end
        end
    end
    return instance -- On applique la métatable à internalData
end

---Register a class as a singleton, the class can't be instancied twice
---@param name string
function singleton(name)
    Interface.thread(function()
        Interface.wait(0)
        tryInstantiate(name)
    end)
end

function tryInstantiate(name)
    if not allClassesLoaded() and not stopAllTryingInstantiation then
        Interface.wait(0);
        Log.trace("Waiting for all classes to be loaded before instantiating '" .. name .. "'")
        tryInstantiate(name)
    else
        singletons[name] = classes[name].new();
        Log.trace("^5Singleton '" .. name .. "' ^2created")
        classes[name].new = function()
            error("Singleton '" .. name .. "' can't be instancied twice")
        end
    end
end

---@generic T
---@param c T
---@return T
function getSingleton(c)
    local clazz = c;
    if type(clazz) == "string" then
        clazz = classes[clazz];
    end
    local p = Interface.promise.new()
    local name = clazz.__class__;
    local loaded = false;
    Interface.thread(function()
        repeat
            Interface.wait(0)
            if loaded then
                return ;
            end
        until singletons[name]
        loaded = true;
        p:resolve(singletons[name])
    end)
    Ats.setTimeout(5000, function()
        loaded = true;
        if not loaded then
            p:reject("Singleton '" .. name .. "' can't be loaded")
        end
    end)

    return Interface.await(p);
end

---@param cb fun():void
function thread(cb)
    Interface.thread(cb);
end

function await(promise)
    return Interface.await(promise)
end

function annotation(name)
    if not classes[name] then
        error("Annotation '" .. name .. "' can't be applied to a class that doesn't exist")
    end

    local clazz = classes[name];

    return function(params)
        local cur = currentClassloading;

        classAnnotations[cur] = classAnnotations[cur] or {};

        table.insert(classAnnotations[cur], clazz.new(classes[cur], nil, params));
    end
end

function afterClassLoad(class, cb)

end

function analyseClass(className, object, k, v)
    local clazz = classes[className];
    if not clazz then
        error("Class '" .. className .. "' doesn't exist")
    end
    if not clazz.__annotations__[k] then
        return ;
    end
    for _, annot in pairs(clazz.__annotations__[k]) do
        if annot.__class__ then
            Log.trace("Annotation found for class : " ..
                    className .. " attribute : " .. k .. " annotation : " .. annot.__class__)
            annot:onValueChange(object, k, v);
        end
    end
end

function instanceof(object, clazz)
    return object.__class__ == clazz.__class__;
end

function getClasses()
    return classes;
end

---@return BaseObject
function getClassByName(name)
    return classes[name];
end

function loadClass(className, module)
    if classesLoaded[className] then
        error("Class '" .. className .. "' is already loaded")
        return ;
    end
    classesLoaded[className] = false;
    Log.trace("^3Loading class '" .. className .. "'^7")
    local p = Interface.promise.new();
    Interface.thread(function()
        Interface.wait(1)
        p:resolve();
    end)
    local r = Interface.await(p)
    currentClassloading = className;
    return r;
end

function classloaded(className)
    classesLoaded[className] = true;
    local clazz = classes[className];
    if clazz then
        for _, attr in pairs(clazz.__annotations__) do
            if clazz.__annotations__[_] then
                for k, annotation in pairs(attr) do
                    if annotation.onLoaded then
                        annotation:onLoaded(_);
                    end
                end
            end
        end
    end

    Log.trace("^2Class '" .. className .. "' loaded^7")
    Interface.thread(function()
        currentClassloading = className;
        ---@type Class
        local Class = import("Class");
        classesReflection[className] = Class:new();
    end)
    currentClassloading = nil;
end

function replaceClass(cName, clazz)
    classes[cName] = clazz;
end

classes["BaseObject"] = BaseObject;

Log.info("^4Preloading classes...")
Interface.thread(function()
    Log.info("^2Preloading ended")
    Log.info("^4Start meta programming...")
    Interface.setTimeout(2000, function()
        stopAllTryingInstantiation = true;
        if not allClassesLoaded() then
            Log.error("Some classes are not loaded, please check your code")
            Log.error("---- Classes not loaded : ----")
            for k, v in pairs(classesLoaded) do
                if not v then
                    Log.error("- Class '" .. k .. "' is not loaded")
                end
            end
            Log.error("---- End of classes not loaded ----")
        end
    end)
end)
