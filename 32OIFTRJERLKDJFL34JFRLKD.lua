local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local holdingF = false

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

-- Continuously update the camera when holding F
RunService.RenderStepped:Connect(function()
	if holdingF then
		local nearestPlayer = getNearestPlayer()
		lockCameraToPlayer(nearestPlayer)
	end
end)
