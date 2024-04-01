local from = _G.argv[1]
local to = _G.argv[2]

local fromfull = fs.combine(hsh.getDir(),from)
local tofull = fs.combine(hsh.getDir(),to)

if fs.exists(fromfull) and (not fs.isDir(fromfull)) then
    if (not fs.exists(tofull)) then
        fs.copy(fromfull, tofull)
    else
        print("Destination exists")
    end
else
    print("Source does not exist or is dir")
end
