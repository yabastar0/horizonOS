local path = _G.argv[1]
local newname = _G.argv[2]
path = fs.combine(path)
newname = fs.combine(newname)]

local words = {}
for word in string.gmatch(path, "[^/]+") do
    table.insert(words, word)
end

table.remove(words)

local result = table.concat(words, "/")

print(path,newname,result)
