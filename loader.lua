local repo = 'https://raw.githubusercontent.com/triple7distro/hexhook/main/'

if game.CreatorId == 3765739 then
    loadstring(game:HttpGet(repo .. 'scripts/hexhook.lua'))()
else
    game:GetService("Players").LocalPlayer:Kick("game not supported")
    return
end