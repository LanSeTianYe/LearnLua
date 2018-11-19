local key = KEYS[1]
local minuteMaxInvokeTimes = ARGV[1]
local dayMaxInvokeTimes = ARGV[2]

local get_time = function()
    return redis.call("time")[1]
end

-- 检查每分钟调用次数
local check_minute_invoke_limit = function(key, minuteMaxInvokeTimes)
    local minute_invoke_time_key = "minute_invoke_time_" .. key
    local minute_invoke_times_key = "minute_invoke_times_" .. key

    local record_time = redis.call("get", minute_invoke_time_key)

    if record_time == false then
        redis.call("set", minute_invoke_time_key, get_time())
        redis.call("set", minute_invoke_times_key, 0)
        return true
    else
        local invoke_times = tonumber(redis.call("get", minute_invoke_times_key))
        if invoke_times > minuteMaxInvokeTimes then
            return false
        end
    end
    return true
end

-- 返回今日凌晨与午夜时间
local function get_day_start_time()
    local base_time = 1539964800
    local one_day_seconds = 60 * 60 * 24
    local curr_time = redis.call("time")[1]

    local one_day_start_time = base_time
    while one_day_start_time + one_day_seconds < curr_time do
        one_day_start_time = base_time + one_day_start_time
    end
    return one_day_start_time
end

-- 检查每天调用次数
local check_day_invoke = function(key, dayMaxInvokeTimes)
    local day_invoke_time_key = "day_invoke_time" .. key
    local day_invoke_times_key = "minute_invoke_times" .. key

    local record_time = redis.call("get", day_invoke_time_key)

    if false == record_time then
        redis.call("set", day_invoke_time_key, get_day_start_time())
        redis.call("set", day_invoke_times_key, 0)
        return true
    else
        local invoke_times = tonumber(redis.call("get", day_invoke_times_key))
        if invoke_times > dayMaxInvokeTimes then
            return false
        end
    end
    return true
end

print("123")
if check_minute_invoke_limit(key, minuteMaxInvokeTimes) == false then
    return "over_minute_limit"
end

if check_day_invoke(key, dayMaxInvokeTimes) == false then
    return "over_day_limit"
end
