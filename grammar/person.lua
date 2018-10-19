local _Person = {}

function _Person:getName()
    return self.name
end

function _Person:sayHello()
    print("Hello Lua!")
end

function _Person:new(name)
    name = name or "default name"
    return setmetatable({ name = name }, { __index = _Person })
end

return _Person
