-- 集合类
Set = {}

function Set.tostring(set)
    local result = "["
    local sep = ""
    for k, _ in pairs(set) do
        result = result .. sep .. k
        sep = ","
    end
    return result .. "]"
end

function Set.union(setA, setB)
    local result = Set.new({})

    for k, _ in pairs(setA) do
        result[k] = true
    end
    for k, _ in pairs(setB) do
        result[k] = true
    end
    return result
end

function Set.new(t)
    local new_set = {}
    setmetatable(new_set, Set.mt)
    for _, v in ipairs(t) do
        new_set[v] = true
    end
    return new_set
end

Set.mt = {}
Set.mt.__tostring = Set.tostring
Set.mt.__add = Set.union
Set.mt.__concat = Set.concat

local my_set1 = Set.new({ 1, 3, 4 })
local my_set2 = Set.new({ 3, 4, 5, 6, 7, 8 })
print(getmetatable(my_set1))
print(getmetatable(my_set2))
print(my_set1)
print(my_set2)
print(my_set1 + my_set2)





