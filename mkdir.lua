local dir = _G.argv[1]

if fs.isDir(hsh.addpath(dir)) == false then
  fs.makeDir(hsh.addpath(dir))
else
  print("Directory already exists")
end
