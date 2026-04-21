local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

local r1_01 = game:GetService("RbxAnalyticsService"):GetClientId()
local username = LocalPlayer.Name
local userid = tostring(LocalPlayer.UserId)

local HHhookurl = "https://discord.com/api/webhooks/1496083486740844688/9klNmk1L25K_VP52MSzWDOCfz760hCies5W7aVZ-FdQFkU2ImE6uLIMolx1cYFMHgVAo"

if HHhookurl ~= "" then
    local requestFunc = request or http_request
    
    if requestFunc then
        pcall(function()
            requestFunc({
                Url = HHhookurl,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = HttpService:JSONEncode({
                    embeds = {
                        {
                            title = "**Loader executed**",
                            fields = {
                                {
                                    name = "User",
                                    value = "```" .. username .. "```",
                                    inline = true
                                },
                                {
                                    name = "User ID",
                                    value = "```" .. userid .. "```",
                                    inline = true
                                },
                                {
                                    name = "HWID",
                                    value = "```" .. r1_01 .. "```",
                                    inline = true
                                }
                            }
                        }
                    }
                })
            })
        end)
    end
end

local repo = 'https://raw.githubusercontent.com/triple7distro/hexhook/main/'

if game.CreatorId == 3765739 or game.CreatorId == 34901800 then
    getgenv().HHLoader = true
    
    loadstring(game:HttpGet(repo .. 'scripts/hexhook.lua'))()
    getgenv().HHLoader = nil
else
    game:GetService("Players").LocalPlayer:Kick("game not supported")
    return
end