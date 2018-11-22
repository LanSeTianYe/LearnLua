local start = os.clock()
-- time
print(os.time())
-- date
print("os.date(): " .. os.date())
local date = os.date("*t")
print(string.format("%04d-%02d-%02d %02d:%02d:%02d", date.year, date.month, date.day, date.hour, date.min, date.sec))
print(string.format("今年的第%03d天", date.yday))
print(os.date("%Y-%m-%d %H:%M:%S"))

--系统环境变量
print(os.getenv("PATH"))

os.execute("ping www.baidu.com")

print("run program cost time: " .. (os.clock() - start))

os.exit()
