local path = _G.argv[1]
if fs.exists(hsh.addpath(path)) == true then
  if fs.isDir(hsh.addpath(path)) == false then
    fs.delete(hsh.addpath(path))
  else
    print("Cannot delete a directory. Use rmdir")
  end
else
  print("Not a file")
end
