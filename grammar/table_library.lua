local pf = require("print_info")

pf.print_new_block("table 库")

local color = { first = "red", "blue", third = "green", "yellow" }
print(color["first"])                 --> output: red
print(color[1])                       --> output: blue
print(color["third"])                 --> output: green
print(color[2])                       --> output: yellow
print(color[3])                       --> output: nil

local s = { 1, 2, 3, 4, 5, 6 }

--
print(table.getn(s))
print(table.concat(s, ","))
table.insert(s, 2, 3)
print(table.concat(s, ","))
print(table.maxn(s))
table.remove(s, 2)
print(table.concat(s, ","))

local compare = function(x, y)
    return x > y
end
table.sort(s, compare)
print(table.concat(s, ","))


