local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI oluştur
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 120, 0, 50) -- küçük
button.Position = UDim2.new(0.5, -60, 0.5, -25)
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- kırmızı
button.Text = "BAS"
button.TextScaled = true
button.Parent = screenGui
button.Active = true
button.Draggable = true  -- sürüklenebilir

-- durum değişkeni
local toggle = false

-- chat gönderme fonksiyonu (Rayfield kodundan alındı)
local function sendChatMessage(message)
    local defaultChat = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
    if defaultChat then
        local sayMessageRequest = defaultChat:FindFirstChild("SayMessageRequest")
        if sayMessageRequest then
            sayMessageRequest:FireServer(message, "All")
            return true
        end
    end

    local textChatService = game:GetService("TextChatService")
    if textChatService then
        local channels = textChatService:FindFirstChild("TextChannels")
        if channels then
            local generalChannel = channels:FindFirstChild("RBXGeneral")
            if generalChannel then
                generalChannel:SendAsync(message)
                return true
            end
        end
    end

    return false
end

-- buton tıklama
button.MouseButton1Click:Connect(function()
    toggle = not toggle
    if toggle then
        sendChatMessage("adminxfly 10")
        button.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- yeşil
    else
        sendChatMessage("adminxunfly")
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- kırmızı
    end
end)