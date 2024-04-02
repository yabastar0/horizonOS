local path = _G.argv[1]
path = hsh.addpath(path)

if fs.exists(path) == true then
  if fs.isDir(path) == true then
    fs.delete(path)
  else
    print("Cannot delete file. Use del")
  end
else
  print("Not a directory")
end
