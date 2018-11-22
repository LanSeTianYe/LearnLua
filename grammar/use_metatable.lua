local Triangle = {}

Triangle.mt = { a = 3, b = 4, c = 5 }

Triangle.mt.default = 0

Triangle.mt.__index = function(t, k)
    print("access:" .. tostring(k))
    if t[k] then
        return t[k]
    else
        return Triangle.mt.default
    end
end

Triangle.mt.__newindex = function(t, k, v)
    print(string.format("set value, key:%s, value: %s", tostring(k), tostring(v)))
end

local triangle = {}

setmetatable(triangle, Triangle.mt)

print(triangle["a"])
print(triangle["b"])
print(triangle["c"])
print(triangle["d"])
triangle["d"] = 3
print(triangle["d"])