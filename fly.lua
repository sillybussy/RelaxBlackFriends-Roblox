--// RelaxBlackFriends Fly v4 (25x Speed + Loading Screen)
--// Made for @botreal1 on TikTok

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

-- Ana GUI
local gui = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
gui.Name = "RelaxFly"
gui.ResetOnSpawn = false

-- Loading ekranı
local loadingFrame = Instance.new("Frame", gui)
loadingFrame.Size = UDim2.new(0, 220, 0, 100)
loadingFrame.Position = UDim2.new(0.5, -110, 0.5, -50)
loadingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
loadingFrame.BorderSizePixel = 0
Instance.new("UICorner", loadingFrame).CornerRadius = UDim.new(0, 12)

local loadingLabel = Instance.new("TextLabel", loadingFrame)
loadingLabel.Size = UDim2.new(1, 0, 1, 0)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Text = "Kanka yükleniyor..."
loadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingLabel.Font = Enum.Font.GothamBold
loadingLabel.TextScaled = true

for i = 1, 3 do
	loadingLabel.Text = "Kanka yükleniyor" .. string.rep(".", i)
	task.wait(0.5)
end
task.wait(0.5)
loadingFrame:Destroy()

-- GUI Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 140, 0, 50)
frame.Position = UDim2.new(0.5, -70, 0.5, -25)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(1, -16, 1, -16)
btn.Position = UDim2.new(0, 8, 0, 8)
btn.Text = "Uç: Kapalı"
btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Font = Enum.Font.GothamBold
btn.TextScaled = true
Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

-- Fly Sistemi
local flying = false
local BV, BG

local speed = 25 -- 🚀 25x hız (istersen 50 yapabilirim)

local function startFly()
	flying = true
	btn.Text = "Uç: Açık (" .. speed .. "x)"
	btn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

	local char = lp.Character or lp.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")
	local hum = char:WaitForChild("Humanoid")
	hum.PlatformStand = true

	BV = Instance.new("BodyVelocity")
	BG = Instance.new("BodyGyro")

	BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
	BV.Velocity = Vector3.zero
	BV.P = 12500

	BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
	BG.P = 12500

	BV.Parent = hrp
	BG.Parent = hrp

	RunService.RenderStepped:Connect(function()
		if flying then
			local cam = workspace.CurrentCamera
			local move = Vector3.zero
			if hum.MoveDirection.Magnitude > 0 then
				move = cam.CFrame.LookVector * speed
			end
			BV.Velocity = move
			BG.CFrame = cam.CFrame
		else
			BV.Velocity = Vector3.zero
		end
	end)
end

local function stopFly()
	flying = false
	btn.Text = "Uç: Kapalı"
	btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

	local char = lp.Character
	if char and char:FindFirstChild("Humanoid") then
		char:FindFirstChild("Humanoid").PlatformStand = false
	end

	if BV then BV:Destroy() BV = nil end
	if BG then BG:Destroy() BG = nil end
end

btn.MouseButton1Click:Connect(function()
	if flying then
		stopFly()
	else
		startFly()
	end
end)