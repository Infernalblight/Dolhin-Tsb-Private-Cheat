--local Players = game:GetService("Players")
--local player = Players.LocalPlayer

--local kick = false

--if kick then
 --   player:Kick("You've been banned for Reason: Auto Fishing Ban Duration:  9999 Years  Note: Ban bypass by Liam. The ban bypass system prevented you from getting banned!!!!!")
--end
-- NIGGAS
local allowedUsers = {"Vildsej", "bertramabcdee"} -- Target usernames
local player = game.Players.LocalPlayer

-- Check if the player is one of the allowed users
if not table.find(allowedUsers, player.Name) then
    return
end

local warningCount = 0 -- Track warnings
local maxWarnings = 10 -- Max warnings before kick

-- Function to create the UI
local function createWarningUI()
    -- Create screen GUI
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WarningUI"
    screenGui.Parent = player.PlayerGui
    
    -- Create a main frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 200)
    frame.Position = UDim2.new(0.5, -200, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(255, 165, 0)
    frame.Parent = screenGui
    
    -- Add title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.3, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "Warning Detected"
    title.TextColor3 = Color3.fromRGB(255, 85, 85)
    title.Font = Enum.Font.GothamBold
    title.TextScaled = true
    title.Parent = frame
    
    -- Add warning text
    local warningText = Instance.new("TextLabel")
    warningText.Size = UDim2.new(1, -20, 0.4, 0)
    warningText.Position = UDim2.new(0, 10, 0.35, 0)
    warningText.BackgroundTransparency = 1
    warningText.Text = "Cheats Detected - Ban Warning " .. warningCount .. " of " .. maxWarnings
    warningText.TextColor3 = Color3.fromRGB(255, 165, 0)
    warningText.Font = Enum.Font.Gotham
    warningText.TextScaled = true
    warningText.Parent = frame
    
    -- Add "Okay" button
    local okayButton = Instance.new("TextButton")
    okayButton.Size = UDim2.new(0.5, 0, 0.2, 0)
    okayButton.Position = UDim2.new(0.25, 0, 0.75, 0)
    okayButton.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
    okayButton.Text = "Okay"
    okayButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    okayButton.Font = Enum.Font.GothamBold
    okayButton.TextScaled = true
    okayButton.Parent = frame

    -- Button functionality to close UI
    okayButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
end

-- Function to handle warnings
local function issueWarning()
    warningCount += 1
    createWarningUI()
    
    if warningCount >= maxWarnings then
        wait(3) -- Small delay before kick
        player:Kick("1 MORE WARNING KICK AND YOU ARE BANNED")
    end
end

-- Warning loop
while warningCount < maxWarnings do
    issueWarning()
    wait(30) -- 30 seconds between warnings
end
