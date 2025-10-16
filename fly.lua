--// RelaxBlackFriends Speed v1
--// Made for @botreal1 on TikTok

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

-- Ana GUI
local gui = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
gui.Name = "RelaxSpeed"
gui.ResetOnSpawn = false

-- Küçük kutu
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 140, 0, 50)
frame.Position = UDim2.new(0.5, -70, 0.5, -25)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

-- Buton
local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(1, -16, 1, -16)
btn.Position = UDim2.new(0, 8, 0, 8)
btn.Text = "Hız: Kapalı"
btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Font = Enum.Font.GothamBold
btn.TextScaled = true
Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

-- Hız sistemi
local running = false
local normalSpeed = 16
local fastSpeed = 160 -- ⚡ 10x hız (Roblox varsayılan 16)

btn.MouseButton1Click:Connect(function()
	local char = lp.Character or lp.CharacterAdded:Wait()
	local hum = char:WaitForChild("Humanoid")

	if running then
		running = false
		btn.Text = "Hız: Kapalı"
		btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		hum.WalkSpeed = normalSpeed
	else
		running = true
		btn.Text = "Hız: Açık (10x)"
		btn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		hum.WalkSpeed = fastSpeed
	end
end)

-- Karakter yeniden doğarsa hızı sıfırlasın
lp.CharacterAdded:Connect(function(char)
	wait(1)
	if running then
		char:WaitForChild("Humanoid").WalkSpeed = fastSpeed
	else
		char:WaitForChild("Humanoid").WalkSpeed = normalSpeed
	end
end)