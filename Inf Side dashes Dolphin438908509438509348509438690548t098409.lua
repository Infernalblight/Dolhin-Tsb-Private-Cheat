-- Place this LocalScript inside StarterPlayer -> StarterPlayerScripts

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local userInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local teleportDistance = 10  -- Distance to teleport
local dashDuration = 0.5     -- Time for the dash to last
local isDashing = false

local moveDirection = Vector3.new(0, 0, 0)
local modelName = "NinjaEffectModel"

-- Function to create the ninja jump model effect
local function createTeleportModel(position)
    -- Check if the model exists in ReplicatedStorage
    local modelTemplate = replicatedStorage:FindFirstChild(modelName)
    if not modelTemplate then
        warn("Model not found in ReplicatedStorage")
        return
    end

    -- Clone the model
    local effectModel = modelTemplate:Clone()
    effectModel.Parent = workspace
    effectModel:SetPrimaryPartCFrame(CFrame.new(position))

    -- Create a tween to move the model upwards and fade out
    local tweenService = game:GetService("TweenService")
    local info = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local goal = {CFrame = effectModel.PrimaryPart.CFrame * CFrame.new(0, 5, 0)}

    local moveTween = tweenService:Create(effectModel.PrimaryPart, info, goal)
    moveTween:Play()

    -- Make the model disappear after 1 second
    game:GetService("Debris"):AddItem(effectModel, 1)
end

-- Function to handle teleport dash movement
local function dash()
    if isDashing then return end
    if moveDirection == Vector3.new(0, 0, 0) then return end  -- Prevent dashing if no direction is pressed

    isDashing = true
    local dashDirection = moveDirection

    -- Create teleport model before dash
    createTeleportModel(humanoidRootPart.Position)

    -- Teleport the character in the direction pressed
    local newCFrame = humanoidRootPart.CFrame * CFrame.new(dashDirection * teleportDistance)
    character:SetPrimaryPartCFrame(newCFrame)

    -- Create teleport model at the new destination
    createTeleportModel(newCFrame.Position)

    -- Wait for the dash duration and then stop
    wait(dashDuration)
    isDashing = false
end

-- Update movement direction based on input
local function updateMovementDirection()
    if userInputService:IsKeyDown(Enum.KeyCode.A) then
        moveDirection = Vector3.new(-1, 0, 0)  -- Left
    elseif userInputService:IsKeyDown(Enum.KeyCode.D) then
        moveDirection = Vector3.new(1, 0, 0)   -- Right
    else
        moveDirection = Vector3.new(0, 0, 0)   -- No direction
    end
end

-- Listen for key press events
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    -- Update movement direction on key press
    if input.UserInputType == Enum.UserInputType.Keyboard then
        updateMovementDirection()
        
        -- Trigger the dash on 'Q'
        if input.KeyCode == Enum.KeyCode.Q then
            dash()
        end
    end
end)

-- Listen for key release events to stop movement
userInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        updateMovementDirection()
    end
end)
