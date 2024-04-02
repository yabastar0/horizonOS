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

local function writetype(w,x,count,text)
    term.setCursorPos(w-(#text),x+count)
    term.write(text)
end

for _,v in ipairs(files) do
    count = count + 1
    if x+count > h then
        term.scroll(1)
        count = count - 1
    end

    if string.sub(v,-4) == ".lua" then
        writetype(w,x,count,"LUA SOURCE FILE")
    elseif string.sub(v,-4) == ".txt" then
        writetype(w,x,count,"TEXT FILE")
    elseif string.sub(v,-4) == ".nft" then
        writetype(w,x,count,"NITRO FNGR TXT IMAGE")
    elseif string.sub(v,-4) == ".nfp" then
        writetype(w,x,count,"NITRO FNGR PICTURE")
    elseif string.sub(v,-6) == ".dfpwm" then
        writetype(w,x,count,"AUDIO FILE")
    elseif string.sub(v,-7) == ".mdfpwm" then
        writetype(w,x,count,"MULTIPLE AUDIO FILE")
    elseif string.sub(v,-4) == ".bat" then
        writetype(w,x,count,"BATCH FILE")
    elseif string.sub(v,-4) == ".hsh" then
        writetype(w,x,count,"H SHELL SCRIPT")
    elseif string.sub(v,-4) == ".com" then
        writetype(w,x,count,"COMMAND FILE")
    elseif string.sub(v,-4) == ".exe" then
        writetype(w,x,count,"YABEX EXECUTABLE")
    elseif string.sub(v,-4) == ".sys" then
        writetype(w,x,count,"SYSTEM FILE")
    elseif string.sub(v,-4) == ".cfg" then
        writetype(w,x,count,"CONFIG FILE")
    else
        writetype(w,x,count,"FILE")
    end

    local tmpx, tmpy = term.getCursorPos()
    term.setCursorPos(1,tmpy)
    io.write(v)
end

io.write("\n")
