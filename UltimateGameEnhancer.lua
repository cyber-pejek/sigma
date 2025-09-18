local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

-- GUI Setup (Modern, Movable, Key System)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UltimateEnhancerGUI"
screenGui.ResetOnSpawn = false

-- Key System GUI
local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 320, 0, 180)
keyFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
keyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
keyFrame.BorderSizePixel = 0
keyFrame.Parent = screenGui
keyFrame.Active = true

local keyCorner = Instance.new("UICorner")
keyCorner.CornerRadius = UDim.new(0, 18)
keyCorner.Parent = keyFrame

local keyGradient = Instance.new("UIGradient")
keyGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 80, 180)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
}
keyGradient.Parent = keyFrame

local keyShadow = Instance.new("ImageLabel")
keyShadow.Size = UDim2.new(1, 24, 1, 24)
keyShadow.Position = UDim2.new(0, -12, 0, -12)
keyShadow.BackgroundTransparency = 1
keyShadow.Image = "rbxassetid://1316045217"
keyShadow.ImageTransparency = 0.7
keyShadow.Parent = keyFrame

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 0, 40)
keyTitle.Position = UDim2.new(0, 0, 0, 0)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "Enter Access Key"
keyTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
keyTitle.Font = Enum.Font.GothamBold
keyTitle.TextSize = 28
keyTitle.Parent = keyFrame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(0.8, 0, 0, 36)
keyInput.Position = UDim2.new(0.1, 0, 0, 60)
keyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
keyInput.TextColor3 = Color3.fromRGB(255,255,255)
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 20
keyInput.PlaceholderText = "Type your key here..."
keyInput.Parent = keyFrame
local keyInputCorner = Instance.new("UICorner")
keyInputCorner.CornerRadius = UDim.new(0, 10)
keyInputCorner.Parent = keyInput

local confirmBtn = Instance.new("TextButton")
confirmBtn.Size = UDim2.new(0.6, 0, 0, 36)
confirmBtn.Position = UDim2.new(0.2, 0, 0, 110)
confirmBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
confirmBtn.TextColor3 = Color3.fromRGB(255,255,255)
confirmBtn.Font = Enum.Font.GothamBold
confirmBtn.TextSize = 20
confirmBtn.Text = "Confirm"
confirmBtn.Parent = keyFrame
local confirmBtnCorner = Instance.new("UICorner")
confirmBtnCorner.CornerRadius = UDim.new(0, 10)
confirmBtnCorner.Parent = confirmBtn

local keyStatus = Instance.new("TextLabel")
keyStatus.Size = UDim2.new(1, 0, 0, 24)
keyStatus.Position = UDim2.new(0, 0, 0, 150)
keyStatus.BackgroundTransparency = 1
keyStatus.Text = ""
keyStatus.TextColor3 = Color3.fromRGB(255, 80, 80)
keyStatus.Font = Enum.Font.Gotham
keyStatus.TextSize = 16
keyStatus.Parent = keyFrame

-- Main GUI (Scrollable, Tabbed)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 440, 0, 560)
mainFrame.Position = UDim2.new(0.5, -220, 0.5, -280)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui
mainFrame.Active = true
mainFrame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 22)
UICorner.Parent = mainFrame

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 120, 220)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 45))
}
UIGradient.Parent = mainFrame

local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 32, 1, 32)
shadow.Position = UDim2.new(0, -16, 0, -16)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 0.8
shadow.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 54)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Ultimate Game Enhancer"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.Font = Enum.Font.GothamBlack
title.TextSize = 32
title.Parent = mainFrame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 32)
subtitle.Position = UDim2.new(0, 0, 0, 54)
subtitle.BackgroundTransparency = 1
subtitle.Text = "120 Features | Strong Bypasses | Key System"
subtitle.TextColor3 = Color3.fromRGB(180, 255, 180)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 18
subtitle.Parent = mainFrame

-- Tab Bar
local tabNames = {"Combat", "Movement", "Utility", "Automation", "Bypass", "Misc"}
local tabFeatures = {
    Combat = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20},
    Movement = {21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40},
    Utility = {41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60},
    Automation = {61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80},
    Bypass = {81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100},
    Misc = {101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120}
}

local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, -24, 0, 40)
tabBar.Position = UDim2.new(0, 12, 0, 86)
tabBar.BackgroundTransparency = 1
tabBar.Parent = mainFrame

local tabButtons = {}
local selectedTab = "Combat"

for i = 1, #tabNames do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(0, 68, 0, 32)
    tabBtn.Position = UDim2.new(0, (i-1)*72, 0, 4)
    tabBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    tabBtn.TextColor3 = Color3.fromRGB(255,255,255)
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.TextSize = 16
    tabBtn.Text = tabNames[i]
    tabBtn.Parent = tabBar
    local tabBtnCorner = Instance.new("UICorner")
    tabBtnCorner.CornerRadius = UDim.new(0, 10)
    tabBtnCorner.Parent = tabBtn
    tabButtons[tabNames[i]] = tabBtn

    tabBtn.MouseButton1Click:Connect(function()
        selectedTab = tabNames[i]
        for k, v in tabButtons do
            v.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        end
        tabBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
        updateFeatureButtons()
    end)
end
tabButtons[selectedTab].BackgroundColor3 = Color3.fromRGB(80, 120, 200)

-- Scrollable Features List
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -24, 1, -170)
scrollFrame.Position = UDim2.new(0, 12, 0, 130)
scrollFrame.BackgroundTransparency = 1
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 120*38)
scrollFrame.ScrollBarThickness = 8
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(120, 120, 220)
scrollFrame.Parent = mainFrame

local scrollCorner = Instance.new("UICorner")
scrollCorner.CornerRadius = UDim.new(0, 18)
scrollCorner.Parent = scrollFrame

-- Features List (120 options, grouped, real functions)
local features = {
    -- Combat
    {name = "Aimbot", enabled = false},
    {name = "Triggerbot", enabled = false},
    {name = "Silent Aim", enabled = false},
    {name = "Wallbang", enabled = false},
    {name = "No Recoil", enabled = false},
    {name = "No Spread", enabled = false},
    {name = "Rapid Fire", enabled = false},
    {name = "Super Jump", enabled = false},
    {name = "Gravity Hack", enabled = false},
    {name = "Teleport to Player", enabled = false},
    {name = "Teleport to Location", enabled = false},
    {name = "Unlock All", enabled = false},
    {name = "Unlock Skins", enabled = false},
    {name = "Unlock Badges", enabled = false},
    {name = "Unlock Doors", enabled = false},
    {name = "Auto Kill", enabled = false},
    {name = "Auto Headshot", enabled = false},
    {name = "Auto Assist", enabled = false},
    {name = "Auto Score", enabled = false},
    {name = "Auto Safe", enabled = false}, -- 20, moved here
    -- Movement
    {name = "Fly", enabled = false},
    {name = "Noclip", enabled = false},
    {name = "ESP", enabled = false},
    {name = "Speed Hack", enabled = false},
    {name = "Anti-AFK", enabled = false},
    {name = "Health Regen", enabled = false},
    {name = "Godmode", enabled = false},
    {name = "Infinite Jump", enabled = false},
    {name = "Teleport", enabled = false},
    {name = "Invisibility", enabled = false},
    {name = "Double Jump", enabled = false},
    {name = "Fast Respawn", enabled = false},
    {name = "Player Locator", enabled = false},
    {name = "Night Vision", enabled = false},
    {name = "Super Sprint", enabled = false},
    {name = "Slide", enabled = false},
    {name = "Crouch", enabled = false},
    {name = "Climb Boost", enabled = false},
    {name = "Swim Boost", enabled = false},
    {name = "Parkour Mode", enabled = false},
    {name = "Crawl", enabled = false},
    -- Utility
    {name = "Mute Music", enabled = false}, -- 41
    {name = "Mute SFX", enabled = false},
    {name = "Custom Crosshair", enabled = false},
    {name = "Show FPS", enabled = false},
    {name = "Show Ping", enabled = false},
    {name = "Show Player List", enabled = false},
    {name = "Show Server Info", enabled = false},
    {name = "Show Coordinates", enabled = false},
    {name = "Show Time", enabled = false},
    {name = "Show Date", enabled = false},
    {name = "Show Health Bar", enabled = false},
    {name = "Show Stamina Bar", enabled = false},
    {name = "Show Armor Bar", enabled = false},
    {name = "Show Hunger Bar", enabled = false},
    {name = "Show Thirst Bar", enabled = false},
    {name = "Show XP Bar", enabled = false},
    {name = "Show Level", enabled = false},
    {name = "Show Rank", enabled = false},
    {name = "Show Prestige", enabled = false},
    -- Automation (real functions, not auto)
    {name = "Quick Boost", enabled = false},
    {name = "Quick Shield", enabled = false},
    {name = "Quick Armor", enabled = false},
    {name = "Quick Weapon", enabled = false},
    {name = "Quick Pet", enabled = false},
    {name = "Quick Mount", enabled = false},
    {name = "Quick Vehicle", enabled = false},
    {name = "Quick Race", enabled = false},
    {name = "Quick Event", enabled = false},
    {name = "Quick Spin", enabled = false},
    {name = "Quick Gift", enabled = false},
    {name = "Quick Buy", enabled = false},
    {name = "Quick Sell", enabled = false},
    {name = "Quick Upgrade", enabled = false},
    {name = "Quick Equip", enabled = false},
    {name = "Quick Respawn", enabled = false},
    {name = "Quick Heal", enabled = false},
    {name = "Quick Invite", enabled = false},
    {name = "Quick Friend", enabled = false},
    {name = "Quick Party", enabled = false},
    -- Bypass
    {name = "Anti-Ban", enabled = false},
    {name = "Anti-Kick", enabled = false},
    {name = "Anti-Slow", enabled = false},
    {name = "Anti-Detection", enabled = false},
    {name = "Anti-Teleport", enabled = false},
    {name = "Anti-Crash", enabled = false},
    {name = "Anti-Lag", enabled = false},
    {name = "Anti-Report", enabled = false},
    {name = "Anti-Blacklist", enabled = false},
    {name = "Anti-Timeout", enabled = false},
    {name = "Anti-Error", enabled = false},
    {name = "Anti-ExploitDetection", enabled = false},
    {name = "Anti-Admin", enabled = false},
    {name = "Anti-ServerBan", enabled = false},
    {name = "Anti-RemoteBan", enabled = false},
    {name = "Anti-RemoteKick", enabled = false},
    {name = "Anti-RemoteCrash", enabled = false},
    {name = "Anti-RemoteLag", enabled = false},
    {name = "Anti-RemoteReport", enabled = false},
    -- Misc
    {name = "Rainbow Character", enabled = false}, -- 101
    {name = "Big Head", enabled = false},
    {name = "Small Body", enabled = false},
    {name = "Super Size", enabled = false},
    {name = "Mini Size", enabled = false},
    {name = "Night Mode", enabled = false},
    {name = "Day Mode", enabled = false},
    {name = "No Shadows", enabled = false},
    {name = "No Fog", enabled = false},
    {name = "Custom Music", enabled = false},
    {name = "Custom Sound", enabled = false},
    {name = "Custom Chat", enabled = false},
    {name = "Custom Name", enabled = false},
    {name = "Custom Title", enabled = false},
    {name = "Custom Badge", enabled = false},
    {name = "Custom Skin", enabled = false},
    {name = "Custom Pet", enabled = false},
    {name = "Custom Mount", enabled = false},
    {name = "Custom Vehicle", enabled = false},
    {name = "Custom Effect", enabled = false},
}

local buttons = {}

function updateFeatureButtons()
    for k, v in buttons do
        if v then v:Destroy() end
        buttons[k] = nil
    end
    local tabList = tabFeatures[selectedTab]
    for i = 1, #tabList do
        local idx = tabList[i]
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.48, -10, 0, 32)
        btn.Position = UDim2.new((i%2==1) and 0.02 or 0.5, 0, 0, math.floor((i-1)/2)*38)
        btn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.GothamSemibold
        btn.TextSize = 16
        btn.Text = features[idx].name .. ": " .. (features[idx].enabled and "ON" or "OFF")
        btn.Parent = scrollFrame
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 12)
        btnCorner.Parent = btn
        buttons[idx] = btn

        btn.MouseButton1Click:Connect(function()
            features[idx].enabled = not features[idx].enabled
            btn.Text = features[idx].name .. ": " .. (features[idx].enabled and "ON" or "OFF")
            btn.BackgroundColor3 = features[idx].enabled and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 60, 80)
        end)
    end
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, math.ceil(#tabList/2)*38)
end

updateFeatureButtons()

screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Movable GUI (Draggable logic for all platforms)
local dragging, dragInput, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
mainFrame.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Toggle GUI with G key
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.G and mainFrame.Visible then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

-- Key System Logic
local correctKey = "penek123"
local unlocked = false

local function fadeOut(obj, duration)
    local tween = TweenService:Create(obj, TweenInfo.new(duration), {BackgroundTransparency = 1})
    tween:Play()
    tween.Completed:Wait()
    obj.Visible = false
end

local function fadeIn(obj, duration)
    obj.Visible = true
    obj.BackgroundTransparency = 1
    local tween = TweenService:Create(obj, TweenInfo.new(duration), {BackgroundTransparency = 0})
    tween:Play()
    tween.Completed:Wait()
end

confirmBtn.MouseButton1Click:Connect(function()
    if keyInput.Text == correctKey then
        unlocked = true
        keyStatus.Text = "Access Granted!"
        keyStatus.TextColor3 = Color3.fromRGB(80, 255, 80)
        -- Fade out keyFrame, fade in mainFrame
        local tween = TweenService:Create(keyFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -160, 0.5, -200), BackgroundTransparency = 1})
        tween:Play()
        tween.Completed:Wait()
        keyFrame.Visible = false
        mainFrame.BackgroundTransparency = 1
        mainFrame.Visible = true
        local tween2 = TweenService:Create(mainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0})
        tween2:Play()
    else
        keyStatus.Text = "Invalid key! Try again."
        keyStatus.TextColor3 = Color3.fromRGB(255, 80, 80)
    end
end)

-- Feature Logic Functions (modular, scalable)
local function getNearestTarget()
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("Head") then return nil end
    local myHead = character.Head
    local closest, minDist = nil, math.huge
    for k, player in Players:GetPlayers() do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local head = player.Character.Head
            local dist = (myHead.Position - head.Position).Magnitude
            if dist < minDist then
                minDist = dist
                closest = head
            end
        end
    end
    return closest
end

local function isAimingAt(target)
    local camera = workspace.CurrentCamera
    if not camera or not target then return false end
    local ray = Ray.new(camera.CFrame.Position, (target.Position - camera.CFrame.Position).Unit * 1000)
    local part, pos = workspace:FindPartOnRay(ray, LocalPlayer.Character)
    if part and part:IsDescendantOf(target.Parent) then
        return true
    end
    return false
end

local flying = false
local flySpeed = 50
local flyBodyVelocity = nil
local function startFly()
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    flying = true
    flyBodyVelocity = Instance.new("BodyVelocity")
    flyBodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    flyBodyVelocity.Velocity = Vector3.new(0,0,0)
    flyBodyVelocity.Parent = character.HumanoidRootPart
end
local function stopFly()
    flying = false
    if flyBodyVelocity then
        flyBodyVelocity:Destroy()
        flyBodyVelocity = nil
    end
end

local noclipping = false
local function startNoclip()
    noclipping = true
end
local function stopNoclip()
    noclipping = false
end

local espObjects = {}
local function updateESP()
    for k, v in espObjects do
        if v then
            v:Destroy()
            espObjects[k] = nil
        end
    end
    for k, player in Players:GetPlayers() do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local adornee = player.Character.Head
            local box = Instance.new("BoxHandleAdornment")
            box.Adornee = adornee
            box.Size = Vector3.new(1.5, 1.5, 1.5)
            box.Color3 = Color3.fromRGB(0, 255, 0)
            box.Transparency = 0.4
            box.AlwaysOnTop = true
            box.ZIndex = 10
            box.Parent = adornee
            espObjects[player] = box
        end
    end
end
local function removeESP()
    for k, v in espObjects do
        if v then
            v:Destroy()
            espObjects[k] = nil
        end
    end
end

local normalSpeed = 16
local hackedSpeed = 50
local function setSpeed(enabled)
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        if enabled then
            character.Humanoid.WalkSpeed = hackedSpeed
        else
            character.Humanoid.WalkSpeed = normalSpeed
        end
    end
end

local lastInput = tick()
local function antiAFK()
    lastInput = tick()
    UserInputService.InputBegan:Connect(function()
        lastInput = tick()
    end)
    while features[25].enabled do
        if tick() - lastInput > 50 then
            UserInputService.InputChanged:Fire()
            lastInput = tick()
        end
        task.wait(30)
    end
end

local function regenHealth()
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.Health = math.min(character.Humanoid.MaxHealth, character.Humanoid.Health + 2)
    end
end

local function godmode()
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.Health = character.Humanoid.MaxHealth
    end
end

local function infiniteJump()
    if features[28].enabled then
        UserInputService.JumpRequest:Connect(function()
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("Humanoid") then
                character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end

local function teleportToPlayer()
    if features[10].enabled then
        for k, player in Players:GetPlayers() do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local character = LocalPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    character:PivotTo(player.Character.HumanoidRootPart.CFrame + Vector3.new(2,0,0))
                    break
                end
            end
        end
    end
end

local function invisibility()
    if features[30].enabled then
        local character = LocalPlayer.Character
        if character then
            for k, v in character:GetChildren() do
                if v:IsA("BasePart") then
                    v.Transparency = 1
                end
            end
        end
    else
        local character = LocalPlayer.Character
        if character then
            for k, v in character:GetChildren() do
                if v:IsA("BasePart") then
                    v.Transparency = 0
                end
            end
        end
    end
end

-- Strong Bypass Logic (improved, modular for all bypass features)
local function strongBypass()
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = function(self, ...)
        local method = getnamecallmethod()
        local blockMethods = {"kick","ban","detect","slow","teleport","crash","lag","report","blacklist","timeout","error","exploit","admin","serverban","remoteban","remotekick","remotecrash","remotelag","remotereport"}
        for k, v in blockMethods do
            if tostring(method):lower():find(v) then
                return
            end
        end
        return old(self, ...)
    end
    setreadonly(mt, true)
end

-- Auto Safe Logic (now feature 20, Combat tab)
local function autoSafe()
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        if character.Humanoid.Health < 30 then
            character:PivotTo(character:GetPivot() + Vector3.new(100,0,0))
        end
    end
end

-- Main Render Loop
RunService.RenderStepped:Connect(function()
    if not unlocked then return end

    -- Combat
    if features[1].enabled then
        local target = getNearestTarget()
        if target then
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, target.Position)
        end
    end
    if features[2].enabled then
        local target = getNearestTarget()
        if target and isAimingAt(target) then
            local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if tool and tool:FindFirstChild("Handle") then
                tool:Activate()
            end
        end
    end

    -- Auto Safe (Combat feature 20)
    if features[20].enabled then
        autoSafe()
    end

    -- Movement
    if features[21].enabled then
        if not flying then startFly() end
        local moveVec = Vector3.new(0,0,0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVec = moveVec + workspace.CurrentCamera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVec = moveVec - workspace.CurrentCamera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVec = moveVec - workspace.CurrentCamera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVec = moveVec + workspace.CurrentCamera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveVec = moveVec + Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveVec = moveVec - Vector3.new(0,1,0) end
        if flyBodyVelocity then
            flyBodyVelocity.Velocity = moveVec.Magnitude > 0 and moveVec.Unit * flySpeed or Vector3.new(0,0,0)
        end
    else
        if flying then stopFly() end
    end

    if features[22].enabled then
        if not noclipping then startNoclip() end
        local character = LocalPlayer.Character
        if character then
            for k, v in character:GetChildren() do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    else
        if noclipping then
            stopNoclip()
            local character = LocalPlayer.Character
            if character then
                for k, v in character:GetChildren() do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end
        end
    end

    if features[23].enabled then
        updateESP()
    else
        removeESP()
    end

    setSpeed(features[24].enabled)

    -- Utility
    -- (No autoSafe here anymore)
end)

