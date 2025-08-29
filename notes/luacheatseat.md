## Comment multi line
```lua
--[[
    this is a comment multiline
--]]
```

## variables

```lua
local number = 4

local string = "hello , world"
local string2 = 'hello , world'
local crazy = [[ this is multi line and literal]]

local truth, lies = true, false
local nothing = nil

```

## functions
```lua
local function hello(name)
    print("hello", name)
end

local helllo2 = function(name)
    print("hello2", name)
end

local higher_order = function(value)
    return function(another)
        return value + another
    end
end
```

## data structer
```lua
--tables as list
local list = { "first", 2, false, function()
    print("fourth")
end }
print("1-index", list[1])
print("4-index", list[4]())
--tables as map
local t = {
    literal_key = "a string",
    ["an expresion"] = "also work",
    [function() end] = true
}
print("literal_key :", t.literal_key)
print("an expreions :", t["an expression"])
print("functon() end :", t[function() end])
```

## control flow ** do **
```lua
local favorite_accounts = { "ralf", "perro", "justin" }
for index = 1, #favorite_accounts do
    print(index, favorite_accounts[index])
end

--to iteare in map we need this way of loop
for index, value in ipairs(favorite_accounts) do
    print(index, value)
end

```

## control flow **if**
```lua
local function action(loves_coffee)
    if loves_coffee then
        print("i love coffe")
    else
        print("i dont't like coffe")
    end
end
-- "falsey": nil, false
action() --same as : action(nil)
action(false)

--everything else is "truthy"
action(true)
action(0)
action({})

```
## Modules, are just files
```lua
--foo.lua
local M = {}
M.cool_function = function() end
return M


--bar.lua
local foo = require('foo')
foo.cool_function()
```

## Functions: multiple returns 
```lua
local returns_four_values = function() 
    return 1, 2, 3, 4
end

firt, sencode, last = returns_four_values()

local varible_arguments = function(...)
    local arguments = {...}
    for i, v in ipairs({...})do print(i, v) end
    return unpack(arguments)
end

print("=====================")
print("1", varible_arguments("hello", "world", "!"))
print("=====================")
print("2", varible_arguments("hello", "world", "!"), "<lost>")
```

## function calling
```lua
--sring shorthand
local single_string = function(s)
    return s .. "- wow"
end

local x = single_string("hi")
local y = single_string "hi"
```

```lua
--Table shorthand
local setup = function(opt)
    if opts.default = nil then 
        opts.default = 17
    end

    print(opts.default, opts.other)
end

setup { default = 12, other = false}
setup {  other = true}
```

## Functions: colon Function
```lua
local MyTable = {}

function MyTable.something(self, ...)end
--this function is equivalent to the top function, is only sintax sugar
function MyTable:something(...)end
```

## Metatables

```lua
local vector_mt = {}
vector_mt.__add = function(left, righ)
    return setmetatable({
        left[1] + righ[2]
        left[2] + righ[2]
        left[3] + righ[3]
    }, vector_mt)
end

local  v1 = setmetatable({3, 1, 5}, vector_mt)
local  v2 = setmetatable({-3, 2, 2}, vector_mt)
local v3 = v1 + v2
print(v3[1], v3[2], v3[3])
print(v3 + v3)
```

i need research more about this
