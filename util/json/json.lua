JSON = {}

JSON.prefix = "{"
JSON.suffix = "}"
JSON.table = "    "

-- 序列化table为JSON数据
JSON.serializable = function(t, tab)
    if nil == tab then
        tab = ""
    else
        tab = tab .. JSON.table
    end

    if type(t) == "string" then
        return "\"" .. t .. "\""
    elseif type(t) == "number" then
        return string.format("%d", t)
    elseif type(t) == "boolean" then
        if t then
            return "true"
        end
        return "false"
    elseif type(t) == "table" then
        local split = ""
        local result = ""
        for k, v in pairs(t) do
            result = string.format("%s%s%s%q:%s", result, split, tab .. JSON.table, k, JSON.serializable(v, tab))
            split = ",\n"
        end
        return JSON.prefix .. "\n" .. result .. "\n" .. tab .. JSON.suffix
    else
        error("not support type:[" .. type(t) .. "]")
    end
end

-- 反序列化JSON数据为table
JSON.deserializable = function(jsonData, result)
    result = result or {}
    -- table
    for k, v in string.gmatch(jsonData, "\"([%w_]+)\":({.-}\n)") do
        jsonData = string.gsub(jsonData, "(\"[%w_]+\":{.-}\n)", "", 1)
        result[k] = {}
        JSON.deserializable(v, result[k])
    end

    -- boolean
    for k, v in string.gmatch(jsonData, "\"([%w_]+)\":(true)") do
        result[k] = true
    end

    for k, v in string.gmatch(jsonData, "\"([%w_]+)\":(false)") do
        result[k] = false
    end

    -- number
    for k, v in string.gmatch(jsonData, "\"([%w_]+)\":(%d+)[,]\n") do
        result[k] = tonumber(v)
    end

    -- string
    for s1, s2 in string.gmatch(jsonData, "\"([%w_]+)\":\"([^\n]+)\"") do
        result[s1] = s2
    end
    return result
end

local data = {
    name = "132123",
    age = 25,
    address = {
        country = "chi:\"n[[]]ame\":12%n31}2,na",
        city1 = "北京",
        city2 = "北京"
    },
    sex = false
}

local result = JSON.serializable(data)
print(result)

local de_data = JSON.deserializable(result)

print(JSON.serializable(de_data))





