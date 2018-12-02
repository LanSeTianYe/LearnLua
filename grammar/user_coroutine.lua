local permgenn
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

for v in perm({ 1, 2, 3 }) do
    printResult(v)
end
