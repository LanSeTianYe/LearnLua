local set1 = { 1, 2, 3 }
local set2 = { 3, 4, 100 }

-- 定义合并函数
local union = function(self, other)
    local indexSet = {}
    local result = {}

    for i, v in pairs(self) do
        indexSet[v] = true
    end
    for i, v in pairs(other) do
        indexSet[v] = true
    end

    -- 遍历value不为空的元素
    for k, v in pairs(indexSet) do
        table.insert(result, k)
    end

    return result

end

-- 重载元方法
setmetatable(set1, { __add = union })

local set3 = set1 + set2

for k, v in pairs(set3) do
    print(string.format("%s : %s", k, v))
end

-- 重载 __index 方法

local human = {
    name = "XiaoTian",
    age = 25
}

local index = function(self, key)
    return string.format("index_%s", key)
end

setmetatable(human, { __index = index })

for k, v in pairs(human) do
    print(string.format("%s : %s", k, v))
end

print(human[3])

-- 禁止修改原表

setmetatable(human, { __metatable = "不能访问!" })
-- cannot change a protected metatable
-- setmetatable(human, {__index = index})



