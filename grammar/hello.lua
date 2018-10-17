local printNewBlock = function(blockName)
    print()
    print("-----------------------------------")
    print(blockName)
end

printNewBlock("输出变量类型 字符串、数字、boolean 和 函数")
print(type("Hello Lua!"))
print(type(213))
print(type(true))
print(type(print))
print(type(nil))

local corp = {
    web = "www.google.com", --索引为字符串，key = "web",value = "www.google.com"
    telephone = "12345678", --索引为字符串
    staff = { "Jack", "Scott", "Gary" }, --索引为字符串，值也是一个表
    100876, --相当于 [1] = 100876，此时索引为数字 key = 1, value = 100876
    100191, --相当于 [2] = 100191，此时索引为数字
    [10] = 360, --直接把数字索引给出
    ["city"] = "Beijing" --索引为字符串
}

printNewBlock("if 条件")
if true then
    print("true")
elseif true then
    print("...")
else
    print("......")
end

printNewBlock("while 语句")
local count = 2
while count > 0 do
    print(count)
    count = count - 1
    if (count == 1) then
        break
    end
end

printNewBlock("repeat 语句")
count = 2
repeat
    print(count)
until count == 2

printNewBlock("for ")

-- 数字遍历 [start,end,step]
for i = 0, 4, 2 do
    print(i)
end
-- 遍历数组
local hobby = { "篮球", "听歌", "看书" }
for index, value in ipairs(hobby) do
    print(string.format("%s : %s", index, value))
end
-- 遍历文件行
for line in io.lines("d:\\test.txt") do
    print(line)
end







