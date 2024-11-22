local key = "477932-4473850-9285791-284720-2847832973-38474829-38374738-38475829-47483892-38293948-294839-29394-193948-1939485-18383848-138838348-383847-3838484-3838-384848483-292949558-0204747-654645-645643543654-68765453-64573245-67854906453-908022-76584"

-- Create UI elements
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Blur effect
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game:GetService("Lighting")
TweenService:Create(blur, TweenInfo.new(0.5), {Size = 24}):Play()

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Frame corner rounding
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 15)
frameCorner.Parent = frame

-- Title label
local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "Dolphin Private Cheat"
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextColor3 = Color3.fromRGB(85, 170, 255)
titleLabel.TextScaled = true
titleLabel.Parent = frame

-- Description label
local descLabel = Instance.new("TextLabel")
descLabel.Text = "Enter your access key below:"
descLabel.Size = UDim2.new(1, -20, 0, 30)
descLabel.Position = UDim2.new(0, 10, 0, 60)
descLabel.BackgroundTransparency = 1
descLabel.Font = Enum.Font.Gotham
descLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
descLabel.TextScaled = true
descLabel.Parent = frame

-- Key Prompt Label (shows 'Enter your key here')
local keyPromptLabel = Instance.new("TextLabel")
keyPromptLabel.Text = "Enter your key here"
keyPromptLabel.Size = UDim2.new(1, -20, 0, 25)
keyPromptLabel.Position = UDim2.new(0, 10, 0, 110)
keyPromptLabel.BackgroundTransparency = 1
keyPromptLabel.Font = Enum.Font.Gotham
keyPromptLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
keyPromptLabel.TextScaled = true
keyPromptLabel.TextXAlignment = Enum.TextXAlignment.Left
keyPromptLabel.Parent = frame

-- TextBox for key input
local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(0.9, 0, 0, 40)
keyInput.Position = UDim2.new(0.05, 0, 0, 140)
keyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.Font = Enum.Font.Gotham
keyInput.TextScaled = true
keyInput.ClearTextOnFocus = false
keyInput.PlaceholderText = "•••••••••••••••••••••••••••••••"
keyInput.Text = ""
keyInput.Parent = frame

-- TextBox corner rounding
local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 10)
inputCorner.Parent = keyInput

-- Check Button
local checkButton = Instance.new("TextButton")
checkButton.Size = UDim2.new(0.9, 0, 0, 50)
checkButton.Position = UDim2.new(0.05, 0, 0, 200)
checkButton.BackgroundColor3 = Color3.fromRGB(60, 160, 60)
checkButton.Font = Enum.Font.GothamBold
checkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkButton.TextScaled = true
checkButton.Text = "Check Key Upd 1.1"
checkButton.Parent = frame

-- Button corner rounding
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = checkButton

-- Functionality for the check button
checkButton.MouseButton1Click:Connect(function()
    if keyInput.Text == key then
        -- Correct key entered, execute the script
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Infernalblight/Dolhin-Tsb-Private-Cheat/refs/heads/main/DolphinInjector.lua'))()
        
        -- Feedback message and cleanup
        titleLabel.Text = "Access Granted"
        titleLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        descLabel.Text = "Welcome, loading cheat..."
        keyInput:Destroy()
        checkButton:Destroy()
        keyPromptLabel:Destroy()
        wait(1)
        
        -- Remove the UI and blur
        screenGui:Destroy()
        TweenService:Create(blur, TweenInfo.new(0.5), {Size = 0}):Play()
        wait(0.5)
        blur:Destroy()
    else
        -- Incorrect key feedback
        titleLabel.Text = "Access Denied"
        titleLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        descLabel.Text = "Invalid key. Please try again."
        keyInput.Text = ""
    end
end)
