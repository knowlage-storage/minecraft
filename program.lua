local Args = { ... }

if #Args < 2
then
    print("Enter command in format repoFile targetFile")
    return
end

local user = "knowlage-storage"
local repo = "minecraft"
local branch = "master"

-- https://raw.githubusercontent.com/knowlage-storage/minecraft/master/program.lua

local function get(user, repo, branch, repoFile, saveTo)
    local url = "https://raw.github.com/"..user.."/"..repo.."/"..branch.."/"..repoFile
    local download = http.get(url) --This will make 'download' hold the contents of the file.
    if download then --checks if download returned true or false
       local handle = download.readAll() --Reads everything in download
       download.close() --remember to close the download!
       local file = fs.open(saveTo,"w") --opens the file defined in 'saveTo' with the permissions to write.
       file.write(handle) --writes all the stuff in handle to the file defined in 'saveTo'
       file.close() --remember to close the file!
      else --if returned false
       print("Unable to download the file "..repoFile)
       print("Make sure you have the HTTP API enabled or")
       print("an internet connection!")
      end --end the if
end --close the function

get(user, repo, branch, Args[1], Args[2])