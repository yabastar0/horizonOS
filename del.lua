local cDir = hsh.getDir()
local path = _G.argv[1]
if fs.exists(fs.combine(cDir,path)) == true then
  fs.delete(fs.combine(cDir,path))
else
  print("Not a file")
end
