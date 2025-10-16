--// RelaxBlackFriends Speed GUI v3
--// Made for @botreal1 on TikTok

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

-- GUI
local SpeedGUI = Instance.new("ScreenGui")
SpeedGUI.Name = "SpeedGUI"
SpeedGUI.DisplayOrder = 1000
SpeedGUI.IgnoreGuiInset = true
SpeedGUI.Parent = lp:WaitForChild("PlayerGui")

-- Küçük kutu
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 120, 0, 50)
Frame.Position = UDim2.new(0.05, 0, 0.9, -60)
Frame.BackgroundColor3 = Color3.fromRGB(80, 0, 140)
Frame.Active = true
Frame.Draggable = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)
Frame.Parent = SpeedGUI

-- Buton
local Toggle = Instance.new("TextButton")
Toggle.Size = UDim2.new(1, 0, 1, 0)
Toggle.Text = "Hız: Kapalı"
Toggle.Font = Enum.Font.GothamBold
Toggle.TextScaled = true
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 8)
Toggle.Parent = Frame

-- Label
local Label = Instance.new("TextLabel")
Label.Size = UDim2.new(1, 0, 0, 20)
Label.Position = UDim2.new(0, 0, -1.1, 0)
Label.BackgroundTransparency = 1
Label.Text = "Made by RelaxBlackFriends"
Label.Font = Enum.Font.GothamSemibold
Label.TextScaled = true
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.Parent = Frame

-- Sistem
local running = false
local normalSpeed = 16
local fastSpeed = 160 -- 10x hız
local maintainLoop = nil

local function setSpeedLoop()
	if maintainLoop then
		maintainLoop:Disconnect()
	end
	local char = lp.Character or lp.CharacterAdded:Wait()
	local hum = char:WaitForChild("Humanoid")

	maintainLoop = game:GetService("RunService").Heartbeat:Connect(function()
		if running and hum and hum.Parent then
			if hum.WalkSpeed ~= fastSpeed then
				hum.WalkSpeed = fastSpeed
			end
		end
	end)
end

Toggle.MouseButton1Click:Connect(function()
	local char = lp.Character or lp.CharacterAdded:Wait()
	local hum = char:WaitForChild("Humanoid")

	if running then
		running = false
		hum.WalkSpeed = normalSpeed
		Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		Toggle.Text = "Hız: Kapalı"
		if maintainLoop then maintainLoop:Disconnect() end
	else
		running = true
		hum.WalkSpeed = fastSpeed
		Toggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		Toggle.Text = "Hız: Açık (10x)"
		setSpeedLoop()
	end
end)

lp.CharacterAdded:Connect(function()
	wait(1)
	if running then
		setSpeedLoop()
	end
end)