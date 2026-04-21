local repo = 'https://raw.githubusercontent.com/triple7distro/hexhook/main/'
local supportedGameId = 3765739

if game.CreatorId == supportedGameId then
    loadstring(game:HttpGet(repo .. 'scripts/hexhook.lua'))()
else
    game:GetService("Players").LocalPlayer:Kick("game not supported")
    return
end