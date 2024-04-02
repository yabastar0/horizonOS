local path = _G.argv[1]

path = hsh.addpath(path)

if fs.exists(path) == true then
  if fs.isDir(path) == false then
    local type = fs.open(path,"r")
    print(type.readAll())
    type.close()
  else
    print("Cannot type directory")
  end
else
  print("Does not exist")
end
