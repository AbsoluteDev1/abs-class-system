---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jokir.
--- DateTime: 29/09/2024 12:23
---

Locale = {}
CurrentLocale = "en"

function _L(key)
    if not Locale[CurrentLocale] then
        return "missing locale : " .. CurrentLocale
    end
    if key == nil then
        return "missing translation : nil"
    end
    return Locale[CurrentLocale][key] or "missing translation : " .. key
end

function _LGetAll()
    return Locale[CurrentLocale]
end

Locale["Keys"] = {

}

_LK = Locale["Keys"]