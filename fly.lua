--// BAS Button GUI
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Chat = game:GetService("Chat")

-- GUI
local GUI = Instance.new("ScreenGui")
GUI.Name = "BasButtonGUI"
GUI.Parent = lp:WaitForChild("PlayerGui")

-- Buton Frame
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 150, 0, 70) -- biraz büyük
Button.Position = UDim2.new(0.4, 0, 0.4, 0)
Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- kırmızı başlangıç
Button.Text = "BAS"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextScaled = true
Button.Font = Enum.Font.GothamBold
Button.Active = true
Button.Draggable = true -- hareket edebilir
Button.Parent = GUI

-- Durum
local basildi = false

-- Buton tıklandığında
Button.MouseButton1Click:Connect(function()
	local message = ""
	if not basildi then
		message = "sa"
		basildi = true
		Button.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- yeşil
	else
		message = "as"
		basildi = false
		Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- kırmızı
	end
	-- Chat'e mesaj gönder
	lp.Chatted:Wait() -- küçük delay önleme
	game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(message, "All")
end)