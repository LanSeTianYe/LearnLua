local read_file_use_model_line = function(file)
    local total_line = 0
    local result = ''
    io.input(file)
    local line = io.read()
    while nil ~= line do
        result = result .. string.gsub(line, "\r", "\r\n")
        total_line = total_line + 1
        line = io.read()
    end
    return total_line, result
end

local read_file_use_model_all = function(file)
    io.input(file)
    return io.read("*all")
end

local file_path = "d:/qq.txt"

-- read by line
--local total_line, content = read_file_use_model_line(file_path)
--print(total_line)
--print(content)

-- read by all
--print(read_file_use_model_all(file_path))

local BUFFER_SIZE = (2 ^ 10)

local file = io.open(file_path, "r")

local result = ""
local content, line_end = file:read(BUFFER_SIZE, "*line")
while nil ~= content do
    if nil == line_end then
        result = result..content
    else
        result = result..content..line_end
    end
    content, line_end = file:read(BUFFER_SIZE, "*line")
end

print(result)

