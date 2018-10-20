local pre_handle_directory = function(directory)
    if os.execute("mkdir " .. directory) ~= nil then
        print("create directory [ " .. directory .. " ]")
    end
end

local clone_git_repository = function(git_repository_list, directory)
    if nil == git_repository_list then
        print("git address list is nil !")
        return
    elseif table.getn(git_repository_list) <= 0 then
        print("git address list is empty")
        return
    end

    for _, v in pairs(git_repository_list) do
        local command = "cd " .. directory
        command = command .. " && git clone " .. v
        os.execute(command)
    end
end

local read_git_repository_list = function(file_name)
    local file = io.open(file_name, "r")
    local result = {};

    for line in file:lines() do
        table.insert(result, line)
    end
    io.close(file)
    return result
end

-- 初始化参数
-- 项目要克隆的目录
local directory = "D:\\test"
-- git 仓库地址文件，每行一个
local git_repository_address_file_name = "git_repository_address.txt"

pre_handle_directory(directory)

clone_git_repository(read_git_repository_list(git_repository_address_file_name), directory)



