_cn = {}

---@class BaseObject
---@field __isLoaded__ boolean
---@field __class__ string
---@field __annotations__ table<string, Annotation>
---@field __parent__ BaseObject
---@field _data table<string, any>
---@field changed Signal
BaseObject = {}

_cn.BaseObject = "BaseObject"

function BaseObject.new()
    local self = setmetatable({}, { __index = BaseObject });
    self.__isLoaded__ = false;
    self.__class__ = "BaseObject";
    self.__annotations__ = {};
    return self
end

function BaseObject:toString()
    return "BaseObject"
end

function BaseObject:serialize(excepts)
    local data = {};
    local keysExcepts = _c.List.of(excepts);
    for k, v in pairs(self.__internal__) do
        if type(v) ~= "function" and not keysExcepts:contains(k) then
            if v and type(v) == "table" and v.__class__ then
                data[k] = v:serialize();
            else
                data[k] = v;
            end
        end
    end
    return data;
end

function BaseObject:deserialize(data)
    for k, v in pairs(data) do
        self[k] = v
    end
end

function BaseObject:instanceOf(clazz)
    return instanceof(self, clazz);
end

---@param logLevel "trace"|"debug"|"info"|"warn"|"error"
---@param message string
function BaseObject:log(logLevel, message)
    Log[logLevel or "info"](("(^2%s^7) %s"):format(self.__class__, message));
end

function BaseObject:getClass()
    return getClassByName(self.__class__);
end

function BaseObject:getClassObject()
    return self:getClass();
end