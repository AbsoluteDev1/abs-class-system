--[[
--- Created: 23/12/2023 09:20
--- Author: Absolute
--Made with ?
-------
-------


-------
--]]

_cn.List = "List"
loadClass(_cn.List)

---@class List : BaseObject
local List = class("List")

---@return List
function List.new(...)
    local self = initMetatable(List);

    self.data = {};
    local args = { ... }
    for i = 1, #args do
        local v = args[i];
        self.data[i] = v;
    end

    return self;
end

function List.of(args)
    return List.new(table.unpack(args or {}));
end

---Pushes an element to the list
---@param element any
---@return List
function List:push(element)

    if type(element) == _cn.Map or type(element) == _cn.List then
        local elements = element.data and element.data or element;
        for i = 1, #(elements) do
            table.insert(self.data, elements[i]);
        end
    else
        table.insert(self.data, element);
    end
end

---Removes the last element of the list
function List:pop()
    table.remove(self.data, #self.data);
end

---Removes all elements of the list
function List:clear()
    self.data = {};
end

---Each element of the list
---@param callback fun(element: ,index:number)
function List:each(callback)
    for i = 1, #self.data do
        callback(self.data[i], i);
    end
end

function List:find(callback)
    for i = 1, #self.data do
        if callback(self.data[i], i) then
            return self.data[i];
        end
    end
end

function List:asTable()
    return self.data;
end

function List:get(index)
    return self.data[index];
end

function List:removeElement(element)
    for i = 1, #self.data do
        if self.data[i] == element then
            table.remove(self.data, i);
            return;
        end
    end
end

---Removes an element from the list by index
function List:remove(index)
    if index < 1 or index > #self.data then
        return;
    end
    table.remove(self.data, index);
end

function List:size()
    return #self.data;
end

function List:iterator()
    local index = 0;
    return function()
        index = index + 1;
        return self.data[index];
    end
end

function List:isEmpty()
    return #self.data == 0;
end

function List:contains(element)
    for i = 1, #self.data do
        if self.data[i] == element then
            return true;
        end
    end
    return false;
end

function List:map(callback)
    local list = List.new();
    for i = 1, #self.data do
        list:push(callback(self.data[i], i));
    end
    return list;
end

function List:filter(callback)
    local list = List.new();
    for i = 1, #self.data do
        if callback(self.data[i], i) then
            list:push(self.data[i]);
        end
    end
    return list;
end

function List:first()
    return self.data[1];
end

function List:reduce(callback, initialValue)
    local accumulator = initialValue;
    for i = 1, #self.data do
        accumulator = callback(accumulator, self.data[i], i);
    end
    return accumulator;
end

function List:sort(callback)
    table.sort(self.data, callback);
end

function List:reverse()
    local reversed = List.new();
    for i = #self.data, 1, -1 do
        reversed:push(self.data[i]);
    end
    return reversed;
end

function List:copy()
    local list = List.new();
    for i = 1, #self.data do
        list:push(self.data[i]);
    end
    return list;
end

function List:containsAll(elements)
    for i = 1, #elements do
        if not self:contains(elements[i]) then
            return false;
        end
    end
    return true;
end

function List:removeAll(elements)
    for i = 1, #elements do
        self:remove(self:indexOf(elements[i]));
    end
end

function List:contains(element)
    for i = 1, #self.data do
        if self.data[i] == element then
            return true;
        end
    end
    return false;
end

function List:indexOf(element)
    for i = 1, #self.data do
        if self.data[i] == element then
            return i;
        end
    end
    return -1;
end

function List:serialize()
    local data = {}
    for k, v in ipairs(self.data) do
        if type(v) ~= "function" then
            if v and v.__class__ then
                data[k] = v:serialize()
            else
                data[k] = v
            end
        end
    end
    return data
end

function List:deserialize(data)
    for k, v in ipairs(data) do
        self[k] = v
    end
end

_c.List = List
classloaded(_cn.List)