local allowedUsers = {"Vildsej", "bertramabcdee"} -- Target usernames
local player = game.Players.LocalPlayer

-- Check if the player is one of the allowed users
if not table.find(allowedUsers, player.Name) then
    return
end

-- Function to create the UI
local function createAdvancedWarningUI()
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AdvancedWarningUI"
    screenGui.Parent = player.PlayerGui
    
    -- Create main frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 500, 0, 300)
    frame.Position = UDim2.new(0.5, -250, 0.5, -150)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    frame.Parent = screenGui
    
    -- Add glowing border effect
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 15)
    uiCorner.Parent = frame

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 3
    uiStroke.Color = Color3.fromRGB(255, 85, 85)
    uiStroke.Parent = frame

    -- Add title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.25, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "⚠️ WARNING ⚠️"
    title.TextColor3 = Color3.fromRGB(255, 0, 0)
    title.Font = Enum.Font.GothamBlack
    title.TextScaled = true
    title.Parent = frame

    -- Add warning text
    local warningText = Instance.new("TextLabel")
    warningText.Size = UDim2.new(0.9, 0, 0.4, 0)
    warningText.Position = UDim2.new(0.05, 0, 0.3, 0)
    warningText.BackgroundTransparency = 1
    warningText.Text = "If you do not stop your actions, you will be HWID banned\nand reported to Roblox staff with proof."
    warningText.TextColor3 = Color3.fromRGB(255, 255, 255)
    warningText.Font = Enum.Font.Gotham
    warningText.TextScaled = true
    warningText.TextWrapped = true
    warningText.Parent = frame

    -- Add an icon or drawing (e.g., warning sign)
    local warningIcon = Instance.new("ImageLabel")
    warningIcon.Size = UDim2.new(0, 100, 0, 100)
    warningIcon.Position = UDim2.new(0.05, 0, 0.6, 0)
    warningIcon.BackgroundTransparency = 1
    warningIcon.Image = "rbxassetid://1234567890" -- Replace with a suitable warning icon ID
    warningIcon.Parent = frame

    -- Add animated effect
    local spinningEffect = Instance.new("ImageLabel")
    spinningEffect.Size = UDim2.new(0, 80, 0, 80)
    spinningEffect.Position = UDim2.new(0.9, -80, 0.1, 0)
    spinningEffect.BackgroundTransparency = 1
    spinningEffect.Image = "rbxassetid://1234567890" -- Replace with a suitable spinning effect image ID
    spinningEffect.ZIndex = 2
    spinningEffect.Parent = frame
    
    -- Animate spinning effect
    game:GetService("RunService").RenderStepped:Connect(function()
        spinningEffect.Rotation = spinningEffect.Rotation + 1
    end)

    -- Add "Okay" button
    local okayButton = Instance.new("TextButton")
    okayButton.Size = UDim2.new(0.3, 0, 0.15, 0)
    okayButton.Position = UDim2.new(0.35, 0, 0.8, 0)
    okayButton.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
    okayButton.Text = "Okay"
    okayButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    okayButton.Font = Enum.Font.GothamBold
    okayButton.TextScaled = true
    okayButton.Parent = frame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = okayButton

    -- Button functionality
    okayButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
end

-- Trigger the UI creation
createAdvancedWarningUI()
