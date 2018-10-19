local person = require("person")

-- 初始化对象
local xiaoTian = person:new("XiaoTian")

-- 调用对象的方法
xiaoTian:sayHello()
print(xiaoTian.name)
print(xiaoTian:getName())

