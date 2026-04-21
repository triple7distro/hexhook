if not getgenv().HHLoader then
    local Players = game:GetService("Players")
    local HttpService = game:GetService("HttpService")
    local LocalPlayer = Players.LocalPlayer
    
    local r1_01 = game:GetService("RbxAnalyticsService"):GetClientId()
    local username = LocalPlayer.Name
    local userid = tostring(LocalPlayer.UserId)
    
    local r1_02 = "https://discord.com/api/webhooks/1496083486740844688/9klNmk1L25K_VP52MSzWDOCfz760hCies5W7aVZ-FdQFkU2ImE6uLIMolx1cYFMHgVAo"
    
    if r1_02 ~= "" then
        local requestFunc = request or http_request
        if requestFunc then
            pcall(function()
                requestFunc({
                    Url = r1_02,
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json"
                    },
                    Body = HttpService:JSONEncode({
                        embeds = {
                            {
                                title = "**Loader bypass attempted**",
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
    
    LocalPlayer:Kick("bypassing loader huh?")
    return
end

if getgenv().HexHookLoaded then
    if getgenv().HexHookLibrary then
        getgenv().HexHookLibrary:Unload()
    end
    if getgenv().Toggles then
        for _, Toggle in next, getgenv().Toggles do
            if Toggle.Default ~= nil then
                Toggle.Value = Toggle.Default
            else
                Toggle.Value = false
            end
        end
    end
    getgenv().HexHookLoaded = nil
    getgenv().HexHookLibrary = nil
end

local repo = 'https://raw.githubusercontent.com/triple7distro/hexhook/main/'

local Library = loadstring(game:HttpGet(repo .. 'libraries/UI_library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'libraries/UI_theme.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'libraries/UI_save.lua'))()

local Window = Library:CreateWindow({
    Title = 'hexhook',
    Center = true,
    AutoShow = false,
    TabPadding = 8,
    MenuFadeTime = 0.2,
    Font = 'rbxasset://fonts/robotocondensed.ttf'
})

local Tabs = {
    ['UI Settings'] = Window:AddTab('UI Settings')
}

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload UI', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'Insert', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('hexhook')
SaveManager:SetFolder('hexhook')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])

Library.Toggle()

getgenv().HexHookLoaded = true
getgenv().HexHookLibrary = Library

Library:Notify("hexhook loaded")