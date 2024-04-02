local path = _G.argv[1]

path = hsh.addpath(path)

function traverseDirectory(path, indent)
    local items = fs.list(path)
    for _, item in ipairs(items) do
        local itemPath = fs.combine(path, item)
        if fs.isDir(itemPath) then
            print(indent .. "|-- " .. item .. "/")
            traverseDirectory(itemPath, indent .. "    ")
        else
            print(indent .. "|-- " .. item)
        end
    end
end

function main()
    if fs.exists(path) then
        if fs.isDir(path) then
            print(path .. "/")
            traverseDirectory(path, "")
        else
            print("The provided path is not a directory.")
        end
    else
        print("The provided path does not exist.")
    end
end

main()
