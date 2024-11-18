local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Dolphin Fire", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local TsbTab = Window:MakeTab({
	Name = "Tsb",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = TsbTab:AddSection({
	Name = "Characters"
})

OrionLib:MakeNotification({
	Name = "UHUH",
	Content = "YOU EXECUTED DOKPHIN PRIVATE HUB",
	Image = "rbxassetid://4483345998",
	Time = 5
})

TsbTab:AddButton({
	Name = "Kj Script",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Gokou300/Gokou300/main/kJ%20Moveset%20V2%20by%20camerawoman"))()
  	end    
})

TsbTab:AddButton({
	Name = "Gojo (Equeip Saitama)",
	Callback = function()
_G.settings = {
    ["RedStartupId"] = "rbxassetid://1177475221",
    ["RedHitId"] = "rbxassetid://8625377966",
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToSorcerer/main/Latest.lua"))()
  	end    
})

TsbTab:AddButton({
	Name = "Gojo V2 (Equip Saitama)",
	Callback = function()
    getgenv().morph = true -- turn false to true if you want custom accessories
loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToSorcerer/refs/heads/main/LatestV2.lua"))()
  	end    
})

TsbTab:AddButton({
	Name = "Gojo Domain Expansion Move + some exstra cool moves! (Equip Saitama)",
	Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/777Q4QDN",true))()
  	end    
})

TsbTab:AddButton({
	Name = "Sukuna (Equip Hero hunter)",
	Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Yourfavoriteguy/Sukuna/refs/heads/main/CLEAVE!'))()
  	end    
})

local Section = TsbTab:AddSection({
	Name = "Utility"
})

TsbTab:AddButton({
	Name = "Death counter Alert",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/louismich4el/ItsLouisPlayz-Scripts/main/TSB%20Death%20Counter%20Identifier.lua"))()
  	end    
})

TsbTab:AddButton({
	Name = "Block Aimbot",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UniDCYT/Dolhin-Tsb-Private-Cheat/refs/heads/main/32OIFTRJERLKDJFL34JFRLKD.lua"))()
  	end    
})

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local humanoidRootPart
local teleporting = false
local qTpEnabled = false
local inputConnection

-- Function to get the closest player
local function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, otherPlayer in pairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetRootPart = otherPlayer.Character.HumanoidRootPart
            local distance = (humanoidRootPart.Position - targetRootPart.Position).Magnitude

            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = otherPlayer
            end
        end
    end

    return closestPlayer
end

-- Function to enable Q teleport
local function enableQTeleport()
    if inputConnection then
        inputConnection:Disconnect()
    end

    inputConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.Q and not teleporting and qTpEnabled then
            teleporting = true
            local endTime = tick() + 0.7 -- Teleport duration (0.7 seconds)

            -- Loop teleporting for 0.7 seconds
            while tick() < endTime and qTpEnabled do
                local targetPlayer = getClosestPlayer()
                if targetPlayer and targetPlayer.Character then
                    local targetRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if targetRootPart and humanoidRootPart then
                        -- Teleport behind the target player
                        local backPosition = targetRootPart.Position - targetRootPart.CFrame.LookVector * 3
                        humanoidRootPart.CFrame = CFrame.new(backPosition, targetRootPart.Position)
                    end
                end
                RunService.RenderStepped:Wait()
            end
            teleporting = false
        end
    end)
end

-- Function to handle character updates and re-establish the toggle
local function setupCharacter()
    player.CharacterAdded:Connect(function()
        player.Character:WaitForChild("HumanoidRootPart")
        humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

        if qTpEnabled then
            enableQTeleport() -- Re-enable Q teleport after respawn
        end
    end)

    -- Ensure we have the current character's humanoidRootPart
    if player.Character then
        humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
    end
end

-- Initialize character setup
setupCharacter()

-- Toggle for Q Teleport
TsbTab:AddToggle({
    Name = "Q Tp",
    Default = false,
    Callback = function(Value)
        qTpEnabled = Value
        print("Q Tp " .. (qTpEnabled and "Enabled" or "Disabled"))

        if qTpEnabled then
            enableQTeleport()
        elseif inputConnection then
            inputConnection:Disconnect()
            inputConnection = nil
        end
    end
})

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Function to find the nearest player
local function getNearestPlayer()
    local nearestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                nearestPlayer = player
            end
        end
    end

    return nearestPlayer
end

-- Function to update the camera to look at the nearest player
local function lockCameraToPlayer(targetPlayer)
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPosition)
    end
end

-- Toggle for Camera Lock to Nearest Player
TsbTab:AddToggle({
    Name = "Camera Lock to Nearest Player",
    Default = false,  -- Default state of the toggle is off
    Callback = function(Value)
        local cameraLockEnabled = Value
        local holdingF = false

        -- When the toggle is enabled or disabled, reset holdingF
        if cameraLockEnabled then
            -- Check for holding the F key
            UserInputService.InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.F then
                    holdingF = true
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.F then
                    holdingF = false
                end
            end)

            -- Continuously update the camera when holding F if camera lock is enabled
            RunService.RenderStepped:Connect(function()
                if cameraLockEnabled and holdingF then
                    local nearestPlayer = getNearestPlayer()
                    lockCameraToPlayer(nearestPlayer)
                end
            end)
        end

        -- Ensure the camera lock is functional after respawning
        Players.LocalPlayer.CharacterAdded:Connect(function()
            -- Reset the camera lock state when respawned
            if cameraLockEnabled then
                holdingF = false  -- Reset holding state if the character respawns
            end
        end)
        
        print("Camera Lock " .. (Value and "Enabled" or "Disabled"))
    end    
})

--[[  
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]] 


local LSTab = Window:MakeTab({
	Name = "No Limit Lifting Simulator",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

LSTab:AddButton({
	Name = "Auto Sell/Auto Lift",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SkoterScripts/No-Limit-Lifting-Simulator/refs/heads/main/Script"))()
  	end    
})
