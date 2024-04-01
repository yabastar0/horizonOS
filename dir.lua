local count = 1
term.clear()
term.setCursorPos(1,1)
local w,h = term.getSize()
local x,_ = term.getCursorPos()
local dirs = {}
local files = {}

for _,v in ipairs(fs.list(hsh.getDir())) do
    if fs.isDir(fs.combine(hsh.getDir(),v)) then
        table.insert(dirs,v)
    else
        table.insert(files,v)
    end
end

local function compare(a, b)
    return a < b
end

table.sort(dirs,compare)
table.sort(files,compare)

for _,v in ipairs(dirs) do
    count = count + 1
    if x+count > h then
        term.scroll(1)
        count = count - 1
    end

    term.setCursorPos(w-(#"DIR"),x+count)
    term.write("DIR")

    local tmpx, tmpy = term.getCursorPos()
    term.setCursorPos(1,tmpy)
    io.write(v)
end

io.write("\n")

count = 1

for _,v in ipairs(files) do
    count = count + 1
    if x+count > h then
        term.scroll(1)
        count = count - 1
    end

    if string.sub(v,-4) == ".lua" then
        term.setCursorPos(w-(#"LUA SOURCE FILE"),x+count)
        term.write("LUA SOURCE FILE")
    elseif string.sub(v,-4) == ".txt" then
        term.setCursorPos(w-(#"TEXT FILE"),x+count)
        term.write("TEXT FILE")
    else
        term.setCursorPos(w-(#"FILE"),x+count)
        term.write("FILE")
    end

    local tmpx, tmpy = term.getCursorPos()
    term.setCursorPos(1,tmpy)
    io.write(v)
end

io.write("\n")
