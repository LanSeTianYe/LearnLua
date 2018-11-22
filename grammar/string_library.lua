local pf = require("print_info")

pf.print_new_block("字符串函数库")

local name = "XiaoTian"

-- 转换为大写
print(string.upper(name))
-- 转换为小写
print(string.lower(name))
-- 字符串长度
print(string.len(name))
-- 查找字符
print(string.find(name, "a"))
-- 返回字符对应的 ASCII 码，(字符串，start，end)，start从1开始。
print(string.byte(name, 1, string.len(name)))
-- 返回数字对应的ASCII组成的字符串
print(string.char(96, 97, 98))
-- 格式化字符串 %d 十进制 %x十六进制 %o八进制 %f浮点数 %s字符串
print(string.format("%03d", 10))
print(string.format("%03x", 10))
print(string.format("%03o", 10))
print(string.format("%04.4f", 10))
-- 匹配字符串，匹配成功返回匹配的字符串
print(string.match("hello lua", "lua"))
print()

-- %a 匹配有字母
s = "hello world from Lua"
for w in string.gmatch(s, "%a+") do
    --匹配最长连续且只含字母的字符串
    print(w)
end
-- 重复字符串
print(string.rep(name, 3))
-- 子字符串 ia， 下标从1开始
print(string.sub(name, 2, 3))
-- 查找并替换
-- hello hello hello   3
print(string.gsub("Lua Lua Lua", "Lua", "hello"))
-- hello hello Lua     2
print(string.gsub("Lua Lua Lua", "Lua", "hello", 2)) --指明第四个参数
-- 反转字符串
print(string.reverse(name))