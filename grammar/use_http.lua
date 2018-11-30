require "socket"

local connect = assert(socket.connect("www.sunfeilong.com", 80))

connect:send("GET " .. "index.html" .. " HTTP/1.0\r\n\r\n")

local result
while true do
    print(connect:receive(2 ^ 10))
    local context, status, response = connect:receive(2 ^ 10)
    if status == "closed" then
        print(response)
        connect:close()
        break
    else
        result = result .. context
    end
end

print(result)
