if _G.argv[1] ~= nil then
    local dir = hsh.addpath(_G.argv[1])
    if fs.isDir(dir) then
        hsh.setDir(dir)
    else
        print("Not a directory")
        return
    end
else
    print("cd {path}")
end
