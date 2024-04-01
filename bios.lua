local cDir = ""

local needRestart = fs.open("horizon/sys/res.sys","r")
local dbrestart = false
if needRestart ~= nil then
    if needRestart.readAll() == "true" then
        local unloop = fs.open("horizon/sys/res.sys","w")
        unloop.write("false")
        unloop.close()
        dbrestart = true
    end
    needRestart.close()
end

_G.hsh = {}

function hsh.clear()
    term.clear()
    term.setCursorPos(1, 1)
end

local function update(link, name, bios)
    hsh.clear()
    print("Downloading system files ... ["..name.."]")
    local rawData = http.get(link)
    local data = rawData.readAll()
    local file = ""
    if bios == false then
        file = fs.open("horizon/"..name,"w")
    else
        file = fs.open(name..".lua","w")
    end
    file.write(data)
    file.close()
end

local function updateAll()
    update("https://raw.githubusercontent.com/yabastar0/horizonOS/main/cd.lua","cd",false)
    update("https://raw.githubusercontent.com/yabastar0/horizonOS/main/bios.lua","bios",true)
end

if dbrestart == true then
    updateAll()
    os.reboot()
end

if fs.exists("horizon/cd") == false then
    update("https://raw.githubusercontent.com/yabastar0/horizonOS/main/cd.lua","cd",false)
end

function hsh.addpath(path)
    local start = string.sub(path, 1, 1)
    if start == "/" or start == "\\" then
        return fs.combine("", path)
    else
        return fs.combine(cDir, path)
    end
end

function hsh.setDir(path)
    cDir = fs.combine(path, "")
end

function hsh.run(command)
    words = {}
    for word in command:gmatch("%S+") do table.insert(words, word) end
    local cmd1 = words[1]
    if fs.exists("horizon/"..fs.combine(cmd1)) == true then
        table.remove(words,1)
        local tmp = {}
        for _,v in pairs(words) do
            table.insert(tmp,v)
        end
        _G.argv = tmp
        loadfile("horizon/"..fs.combine(cmd1))()
    elseif fs.exists(fs.combine(cmd1)) then
        table.remove(words,1)
        local tmp = {}
        for _,v in pairs(words) do
            table.insert(tmp,v)
        end
        _G.argv = tmp
        loadfile(fs.combine(cmd1))()
    elseif cmd1 == "download" then
        updateAll()
        io.write("The system needs to restart for changes to effect. Restart now? (y/n) ")
        local inp = ""
        repeat
            inp = io.read()
        until inp == "y" or inp == "yes" or inp == "n" or inp == "no"
        if inp == "y" or inp == "yes" then
            local needdb = fs.open("horizon/sys/res.sys","w")
            needdb.write("true")
            needdb.close()
            os.reboot()
        end
    else
        print(textutils.serialise(words))
    end
end

hsh.clear()

while true do
    io.write(cDir..">")
    local command = io.read()
    hsh.run(command)
end
