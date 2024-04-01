local dir = hsh.addpath(_G.argv[1])
if fs.isDir(dir) then
    shell.setDir(dir)
else
    print("Not a directory")
    return
end
