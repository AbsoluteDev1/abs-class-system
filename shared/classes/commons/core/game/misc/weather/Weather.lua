---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Absolute.
--- DateTime: 05/10/2024
---

_cn.Weather = "Weather";
loadClass(_cn.Weather)

--- Imports ---

---@class Weather : BaseObject
local Weather = class("Weather");

function Weather.new()
    ---@type Weather
    local self = initMetatable(Weather);

    return self;
end

---@param weather Weather
function Weather:change(weather)
    ClearOverrideWeather()
    ClearWeatherTypePersist()
    SetWeatherTypePersist(weather)
    SetWeatherTypeNow(weather)
    SetWeatherTypeNowPersist(weather)
end

function Weather:clear()
    ClearOverrideWeather()
    ClearWeatherTypePersist()
    SetWeatherTypeNow("CLEAR")
    SetWeatherTypeNowPersist("CLEAR")
end

_c.Weather = Weather;
classloaded(_cn.Weather)