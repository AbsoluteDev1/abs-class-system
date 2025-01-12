---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jokir.
--- DateTime: 26/09/2024 22:36
---


function dump(obj, level, visited)
    if(type(obj) == "table") then
        local s = "{\n";
        for k,v in pairs(obj) do
            if(type(v) == "table") then
                if(visited[v]) then
                    s = s..concatTables(level)..k..": ".."visited"..",\n";
                else
                    visited[v] = true;
                    s = s..concatTables(level)..k..": "..dump(v, level + 1, visited)..",\n";
                end
            elseif type(v) == "function" then
                s = s..concatTables(level)..k..": function,\n";
            elseif type(v) == "boolean" then
                s = s..concatTables(level)..k..": "..tostring(v)..",\n";
            elseif type(v) == "number" then
                s = s..concatTables(level)..k..": "..v..",\n";
            else
                s = s..concatTables(level)..k..": "..v..",\n";
            end
        end
        return s..concatTables(level).."}";
    else
        return obj;
    end
end

function concatTables(numberSpace)
    local t = "";
    for i = 0, numberSpace do
        t = t.."  ";
    end
    return t;
end

function printDump(obj)
    print(dump(obj,0, {}));
end