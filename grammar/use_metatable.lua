local index = {}

local mt = {
    -- __index 当表里面不存在对应的k时会调用
    __index = function(t, k)
        print("access:" .. tostring(k))
        return t[index][k]
    end,
    -- __newindex 设置值的时候如果存在 __newindex 函数则会调用该函数而不会执行赋值操作
    __newindex = function(t, k, v)
        print(string.format("set value, key:%s, value: %s", tostring(k), tostring(v)))
        t[index][k] = v
    end
}

-- 代理模式

function track(t)
    local proxy = {}
    proxy[index] = t
    setmetatable(proxy, mt)
    return proxy
end

local t = { a = 1, b = 2, c = 3, d = 4 }

_t = track(t)

print(_t["a"])

_t["e"] = 5
for k, v in pairs(t) do
    print(k)
end