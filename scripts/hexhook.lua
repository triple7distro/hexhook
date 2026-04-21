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

local repo = 'https://raw.githubusercontent.com/triple7distro/hexhook/main/'

task.spawn(function()
    local Library = loadstring(game:HttpGet(repo .. 'libraries/UI_library.lua'))()
    task.wait(0.2)
    
    Library:Notify("loading components")
    
    local ThemeManager = loadstring(game:HttpGet(repo .. 'libraries/UI_theme.lua'))()
    task.wait(0.2)
    
    local SaveManager = loadstring(game:HttpGet(repo .. 'libraries/UI_save.lua'))()
    task.wait(0.2)
    
    Library:Notify("loading esp")
    
    local EspLibrary = loadstring(game:HttpGet(repo .. 'libraries/ESP_library.lua'))()
    local ESPSettings = EspLibrary.Settings
    task.wait(0.2)
    
    Library:Notify("creating window")
    
    local Window = Library:CreateWindow({
        Title = 'hexhook',
        Center = true,
        AutoShow = false,
        TabPadding = 8,
        MenuFadeTime = 0,
    })
    
    task.wait(0.2)
    
    Library:Notify("setting up tabs")
    
    local Tabs = {
        ['visuals'] = Window:AddTab('visuals'),
        ['ui settings'] = Window:AddTab('ui settings')
    }
    
    task.wait(0.2)
    
    local ESPTabbox = Tabs['visuals']:AddLeftTabbox('esp')
    
    local ESPTab1 = ESPTabbox:AddTab('main')
    local ESPTab2 = ESPTabbox:AddTab('features')
    
    ESPTab1:AddToggle('ESPEnabled', {
        Text = 'esp masterswitch',
        Default = false,
        Callback = function(Value)
            ESPSettings.Enabled = Value
            if Value then
                EspLibrary.Load()
            else
                EspLibrary.Unload()
            end
        end
    })
    
    ESPTab1:AddSlider('ESPMaxDistance', {
        Text = 'max distance',
        Default = 10000,
        Min = 500,
        Max = 50000,
        Rounding = 0,
        Compact = true,
        Callback = function(Value)
            ESPSettings.MaxDistance = Value
        end
    })
    
    ESPTab2:AddToggle('ESPBox', {
        Text = 'box',
        Default = false,
        Callback = function(Value)
            ESPSettings.Box = Value
        end
    }):AddColorPicker('ESPBoxColor', {
        Default = Color3.new(1, 1, 1),
        Title = 'box color',
        Callback = function(Value)
            ESPSettings.BoxColor = Value
        end
    })
    
    ESPTab2:AddToggle('ESPBoxFill', {
        Text = 'box fill',
        Default = false,
        Callback = function(Value)
            ESPSettings.BoxFill = Value
        end
    }):AddColorPicker('ESPBoxFillColor', {
        Default = Color3.new(1, 0, 0),
        Title = 'fill color',
        Callback = function(Value)
            ESPSettings.BoxFillColor = Value
        end
    })
    
    ESPTab2:AddToggle('ESPName', {
        Text = 'name',
        Default = false,
        Callback = function(Value)
            ESPSettings.Name = Value
        end
    }):AddColorPicker('ESPNameColor', {
        Default = Color3.new(1, 1, 1),
        Title = 'name color',
        Callback = function(Value)
            ESPSettings.NameColor = Value
        end
    })
    
    ESPTab2:AddToggle('ESPHealth', {
        Text = 'health',
        Default = false,
        Callback = function(Value)
            ESPSettings.Health = Value
        end
    }):AddColorPicker('ESPHealthColor', {
        Default = Color3.new(0, 1, 0),
        Title = 'health color',
        Callback = function(Value)
            ESPSettings.HealthColor = Value
        end
    })
    
    ESPTab2:AddToggle('ESPDistance', {
        Text = 'distance',
        Default = false,
        Callback = function(Value)
            ESPSettings.Distance = Value
        end
    }):AddColorPicker('ESPDistanceColor', {
        Default = Color3.new(1, 1, 1),
        Title = 'distance color',
        Callback = function(Value)
            ESPSettings.DistanceColor = Value
        end
    })
    
    ESPTab2:AddToggle('ESPSkeleton', {
        Text = 'skeleton',
        Default = false,
        Callback = function(Value)
            ESPSettings.Skeleton = Value
        end
    }):AddColorPicker('ESPSkeletonColor', {
        Default = Color3.new(1, 1, 1),
        Title = 'skeleton color',
        Callback = function(Value)
            ESPSettings.SkeletonColor = Value
        end
    })
    
    ESPTab2:AddToggle('ESPChamsFill', {
        Text = 'chams fill',
        Default = false,
        Callback = function(Value)
            ESPSettings.ChamsFill = Value
            ESPSettings.Chams = Value or ESPSettings.ChamsOutline or ESPSettings.ChamsVisibleOnly
        end
    }):AddColorPicker('ESPChamsFillColor', {
        Default = Color3.new(1, 1, 1),
        Title = 'chams fill color',
        Callback = function(Value)
            ESPSettings.ChamsFillColor = Value
        end
    })
    
    ESPTab2:AddToggle('ESPChamsOutline', {
        Text = 'chams outline',
        Default = false,
        Callback = function(Value)
            ESPSettings.ChamsOutline = Value
            ESPSettings.Chams = Value or ESPSettings.ChamsFill or ESPSettings.ChamsVisibleOnly
        end
    }):AddColorPicker('ESPChamsOutlineColor', {
        Default = Color3.new(1, 1, 1),
        Title = 'chams outline color',
        Callback = function(Value)
            ESPSettings.ChamsOutlineColor = Value
        end
    })
    
    ESPTab2:AddToggle('ESPChamsVisibleOnly', {
        Text = 'chams visible only',
        Default = false,
        Callback = function(Value)
            ESPSettings.ChamsVisibleOnly = Value
            ESPSettings.Chams = Value or ESPSettings.ChamsFill or ESPSettings.ChamsOutline
        end
    })
    
    task.wait(0.2)
    
    local MenuGroup = Tabs['ui settings']:AddLeftGroupbox('menu')
    
    task.wait(0.2)
    
    Library:Notify("adding controls")
    
    MenuGroup:AddButton('unload ui', function() Library:Unload() end)
    MenuGroup:AddLabel('menu bind'):AddKeyPicker('MenuKeybind', { Default = 'Insert', NoUI = true, Text = 'menu keybind' })
    
    Library.ToggleKeybind = Options.MenuKeybind
    
    task.wait(0.2)
    
    Library:Notify("configuring themes")
    
    ThemeManager:SetLibrary(Library)
    SaveManager:SetLibrary(Library)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
    ThemeManager:SetFolder('hexhook')
    SaveManager:SetFolder('hexhook')
    SaveManager:BuildConfigSection(Tabs['ui settings'])
    ThemeManager:ApplyToTab(Tabs['ui settings'])
    
    task.wait(0.2)
    
    Library:Notify("setting up watermark")
    
    Library:SetWatermarkVisibility(true)
    Library.Watermark.Position = UDim2.new(0.5, -100, 0, 25)
    
    task.wait(0.2)
    
    Library:Notify("initializing performance monitor")
    
    local FrameTimer = tick()
    local FrameCounter = 0;
    local FPS = 60;

    local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
        FrameCounter += 1;

        if (tick() - FrameTimer) >= 1 then
            FPS = FrameCounter;
            FrameTimer = tick();
            FrameCounter = 0;
        end;

        Library:SetWatermark(('hexhook | %s fps | %s ms'):format(
            math.floor(FPS),
            math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
        ));
    end)

    Library:OnUnload(function()
        WatermarkConnection:Disconnect()
    end)
    
    task.wait(0.2)
    
    Library:Notify("finalizing")
    task.wait(0.3)
    
    Library.Toggle()
    
    task.wait(0.2)
    
    Library:Notify("hexhook loaded")
end)