local _thread = coroutine.create(
        function()
            for i = 1, 2, 1 do
                -- 等待 获取resume传递的参数
                local value = coroutine.yield("y" .. i)
                print('yield ' .. value)
            end
            return "end"
        end
)

print(type(_thread))

print(coroutine.status(_thread))
-- run 接收下一个 yield 的参数，并传递参数给 yield
print('resume1 ', coroutine.resume(_thread, "r1"))
--yield
print('resume2 ', coroutine.resume(_thread, "r2"))
print('resume3 ', coroutine.resume(_thread, "r3"))

print('resume4 ', coroutine.resume(_thread, "r4"))
print(coroutine.status(_thread))

local pt
local p = function()
    local number = 1
    while true do
        coroutine.yield("p: " .. number)
        number = number + 1
    end
end

local c = function()
    local times = 1
    while times <= 100 do
        print(coroutine.resume(pt))
        times = times + 1
    end
end
pt = coroutine.create(p)
c()

local permgen
permgen = function(a, n)
    if n == 0 then
        coroutine.yield(a)
    else
        for i = 1, n do
            a[n], a[i] = a[i], a[n]
            permgen(a, n - 1)
            a[n], a[i] = a[i], a[n]
        end
    end
end

function printResult(a)
    local result = ""
    for i, v in ipairs(a) do
        result = result .. " " .. v
    end
    print(result)
end

local function perm(a)
    local length = table.getn(a)
    local co = coroutine.create(function()
        permgen(a, length)
    end)
    return function()
        local code, value = coroutine.resume(co)
        return value
    end
end

for v in perm({ 1, 2, 3, 4, 5 }) do
    printResult(v)
end

print(package.cpath)
