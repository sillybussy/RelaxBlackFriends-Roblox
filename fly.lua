--// RelaxBlackFriends Speed GUI v2
--// Made for @botreal1 on TikTok

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local SpeedGUI = Instance.new("ScreenGui")
SpeedGUI.Name = "SpeedGUI"
SpeedGUI.DisplayOrder = 1000
SpeedGUI.IgnoreGuiInset = true
SpeedGUI.Parent = lp:WaitForChild("PlayerGui")

-- Küçük kutu
local SmallerFrame = Instance.new("Frame")
SmallerFrame.Name = "SmallerSpeedFrame"
SmallerFrame.Size = UDim2.new(0, 120, 0, 50)
SmallerFrame.Position = UDim2.new(0.05, 0, 0.9, -60)
SmallerFrame.BackgroundColor3 = Color3.fromRGB(80, 0, 140)
SmallerFrame.BackgroundTransparency = 0.2
SmallerFrame.Parent = SpeedGUI

-- Aç/Kapa butonu
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(1, 0, 1, 0)
ToggleButton.Position = UDim2.new(0, 0, 0, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Text = "Hız: Kapalı"
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextScaled = true
ToggleButton.Parent = SmallerFrame

-- Etiket
local CreditLabel = Instance.new("TextLabel")
CreditLabel.Name = "CreditLabel"
CreditLabel.Size = UDim2.new(1, 0, 0, 20)
CreditLabel.Position = UDim2.new(0, 0, -1.1, 0)
CreditLabel.BackgroundTransparency = 1
CreditLabel.TextColor3 = Color3.new(1, 1, 1)
CreditLabel.Text = "Made by RelaxBlackFriends"
CreditLabel.Font = Enum.Font.GothamSemibold
CreditLabel.TextScaled = true
CreditLabel.Parent = SmallerFrame

-- Hız sistemi
local running = false
local normalSpeed = 16
local fastSpeed = 160 -- 10x hız

ToggleButton.MouseButton1Click:Connect(function()
	local char = lp.Character or lp.CharacterAdded:Wait()
	local hum = char:WaitForChild("Humanoid")

	if running then
		running = false
		hum.WalkSpeed = normalSpeed
		ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		ToggleButton.Text = "Hız: Kapalı"
	else
		running = true
		hum.WalkSpeed = fastSpeed
		ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		ToggleButton.Text = "Hız: Açık (10x)"
	end
end)

-- Yeniden doğuşta hız koruma
lp.CharacterAdded:Connect(function(char)
	wait(1)
	local hum = char:WaitForChild("Humanoid")
	if running then
		hum.WalkSpeed = fastSpeed
	end
end)