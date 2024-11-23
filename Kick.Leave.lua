local allowedUsers = {"Vildsej", "bertramabcdee"} -- Target usernames
local player = game.Players.LocalPlayer

-- Check if the player is one of the allowed users
if not table.find(allowedUsers, player.Name) then
    return
end

-- Function to create the advanced warning UI
local function createAdvancedWarningUI()
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AdvancedWarningUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player.PlayerGui

    -- Create main frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 600, 0, 400)
    frame.Position = UDim2.new(0.5, -300, 0.5, -200)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    frame.Parent = screenGui

    -- Add a glowing border effect
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 15)
    uiCorner.Parent = frame

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 5
    uiStroke.Color = Color3.fromRGB(255, 0, 0)
    uiStroke.Parent = frame

    -- Add title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.15, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "⚠️ SEVERE WARNING ⚠️"
    title.TextColor3 = Color3.fromRGB(255, 85, 85)
    title.Font = Enum.Font.GothamBlack
    title.TextScaled = true
    title.Parent = frame

    -- Add warning text
    local warningText = Instance.new("TextLabel")
    warningText.Size = UDim2.new(0.9, 0, 0.3, 0)
    warningText.Position = UDim2.new(0.05, 0, 0.2, 0)
    warningText.BackgroundTransparency = 1
    warningText.Text = "If you do not stop your actions, you will be HWID banned and reported to Roblox staff with proof."
    warningText.TextColor3 = Color3.fromRGB(255, 255, 255)
    warningText.Font = Enum.Font.Gotham
    warningText.TextScaled = true
    warningText.TextWrapped = true
    warningText.Parent = frame

    -- Add warning icon
    local warningIcon = Instance.new("ImageLabel")
    warningIcon.Size = UDim2.new(0, 100, 0, 100)
    warningIcon.Position = UDim2.new(0.05, 0, 0.55, 0)
    warningIcon.BackgroundTransparency = 1
    warningIcon.Image = "rbxassetid://1234567890" -- Replace with a suitable warning icon ID
    warningIcon.Parent = frame

    -- Add animated pattern behind the text
    local pattern = Instance.new("ImageLabel")
    pattern.Size = UDim2.new(1, 0, 1, 0)
    pattern.Position = UDim2.new(0, 0, 0, 0)
    pattern.BackgroundTransparency = 1
    pattern.Image = "rbxassetid://9876543210" -- Replace with a repeating pattern texture
    pattern.ImageTransparency = 0.8
    pattern.ZIndex = 0
    pattern.Parent = frame

    -- Add decorative arrows on the sides
    local leftArrow = Instance.new("ImageLabel")
    leftArrow.Size = UDim2.new(0, 80, 0, 200)
    leftArrow.Position = UDim2.new(0, -60, 0.5, -100)
    leftArrow.BackgroundTransparency = 1
    leftArrow.Image = "rbxassetid://1122334455" -- Replace with an arrow texture
    leftArrow.Rotation = -90
    leftArrow.Parent = frame

    local rightArrow = leftArrow:Clone()
    rightArrow.Position = UDim2.new(1, -20, 0.5, -100)
    rightArrow.Rotation = 90
    rightArrow.Parent = frame

    -- Add spinning effect in the center
    local spinningEffect = Instance.new("ImageLabel")
    spinningEffect.Size = UDim2.new(0, 150, 0, 150)
    spinningEffect.Position = UDim2.new(0.5, -75, 0.5, -75)
    spinningEffect.BackgroundTransparency = 1
    spinningEffect.Image = "rbxassetid://6789012345" -- Replace with a spinning wheel or circle image
    spinningEffect.Parent = frame

    -- Animate spinning effect
    game:GetService("RunService").RenderStepped:Connect(function()
        spinningEffect.Rotation = spinningEffect.Rotation + 1
    end)

    -- Add "Okay" button
    local okayButton = Instance.new("TextButton")
    okayButton.Size = UDim2.new(0.4, 0, 0.15, 0)
    okayButton.Position = UDim2.new(0.3, 0, 0.8, 0)
    okayButton.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
    okayButton.Text = "Okay, I Understand"
    okayButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    okayButton.Font = Enum.Font.GothamBold
    okayButton.TextScaled = true
    okayButton.Parent = frame

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 10)
    buttonCorner.Parent = okayButton

    -- Button functionality to close the UI
    okayButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
end

-- Trigger the UI creation
createAdvancedWarningUI()
