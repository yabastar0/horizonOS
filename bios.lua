shell.run("clr")
local cDir = ""

if fs.exists("horizon/cd.lua") == false then
    
end

local function changeDir(path)
    cDir = fs.combine(cDir,path)
end

while true do
    io.write(cDir..">")
    local command = io.read()
    words = {}
    for word in command:gmatch("%w+") do table.insert(words, word) end
    if fs.exists("horizon/"..fs.combine(words[1])) == true then
        table.remove(words,1)
        local tmp = {}
        for _,v in pairs(words) do
            table.insert(tmp,v)
            print(v)
        end
        _G.argv = tmp
        loadfile("horizon/"..fs.combine(words[1]))()
    elseif fs.exists(fs.combine(words[1]))
        table.remove(words,1)
        local tmp = {}
        for _,v in pairs(words) do
            table.insert(tmp,v)
            print(v)
        end
        _G.argv = tmp
        loadfile(fs.combine(words[1]))()  
    else
        print(textutils.serialise(words))
    end
end
