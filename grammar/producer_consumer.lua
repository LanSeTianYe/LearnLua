-- 消费者函数
local consumer = function(message)
    print(message)
end

-- 数据程序
local sender = function(first)
    local number = first
    while true do
        local message = coroutine.yield("consumer response is : " .. number)
        consumer(message)
        number = number + 1
    end
end

-- 协程
local c_t = coroutine.create(sender)

-- 生产者
local producer = function()
    local number = 1
    while true do
        local status, response = coroutine.resume(c_t, "p_" .. number)
        print(response)
        number = number + 1
        if number > 2 then
            break
        end
    end
end

-- 第一次调用 resume 参数会传递给协程函数 sender
-- resume 接受下一次协程执行 yield 函数的返回值
local status, response = coroutine.resume(c_t, 100)
print("first response : " .. response)

-- 启动生产者
producer()

