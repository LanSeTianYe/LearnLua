local pf = require("print_info")

pf.print_new_block("文件操作")

-- 打开文件
local fileName = "D://test.txt"
local file = io.input(fileName)

-- 读取文件内容
repeat
    line = io.read()
    if nil == line then
        break
    end
    print(line)
until false
-- 关闭文件
io.close(file)

-- 以追加方式打开文件 "a+" 追加 "r" 读 "w" 写
file = io.open(fileName, "a+")
io.output(file)
io.write("Hello Lua!")
io.close(file)
