local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Loading Screen
local LoadingGui = Instance.new("ScreenGui", PlayerGui)
LoadingGui.Name = "RelaxLoading"
LoadingGui.ResetOnSpawn = false

local LoadingFrame = Instance.new("Frame", LoadingGui)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
LoadingFrame.Size = UDim2.new(0, 350, 0, 140)
LoadingFrame.Position = UDim2.new(0.5, -175, 0.5, -70)
Instance.new("UICorner", LoadingFrame).CornerRadius = UDim.new(0, 12)

local LoadingText = Instance.new("TextLabel", LoadingFrame)
LoadingText.Text = "Developer: RelaxBlackFriends\nOyun içine aktarılıyor biraz bekleyin..."
LoadingText.Font = Enum.Font.GothamBlack
LoadingText.TextColor3 = Color3.fromRGB(255,255,255)
LoadingText.TextScaled = true
LoadingText.Size = UDim2.new(1, -20, 0, 50)
LoadingText.Position = UDim2.new(0, 10, 0, 5)
LoadingText.BackgroundTransparency = 1

local BarBack = Instance.new("Frame", LoadingFrame)
BarBack.Size = UDim2.new(1, -41, 0, 20)
BarBack.Position = UDim2.new(0, 20, 0.75, 0)
BarBack.BackgroundColor3 = Color3.fromRGB(60,60,60)
Instance.new("UICorner", BarBack).CornerRadius = UDim.new(0,8)

local BarFill = Instance.new("Frame", BarBack)
BarFill.Size = UDim2.new(0,0,1,0)
BarFill.BackgroundColor3 = Color3.fromRGB(0,255,0)
Instance.new("UICorner", BarFill).CornerRadius = UDim.new(0,8)

for i=1,100 do
    BarFill.Size = UDim2.new(i/100,0,1,0)
    wait(0.025)
end

for i=0,1,0.05 do
    LoadingFrame.BackgroundTransparency = i
    LoadingText.TextTransparency = i
    BarBack.BackgroundTransparency = i
    BarFill.BackgroundTransparency = i
    wait()
end

LoadingGui:Destroy()

-- Small Kill All GUI
local KillGui = Instance.new("ScreenGui", PlayerGui)
KillGui.Name = "KillAllUI"
KillGui.ResetOnSpawn = false

local KillFrame = Instance.new("Frame", KillGui)
KillFrame.Size = UDim2.new(0, 120, 0, 50) -- küçük kutu
KillFrame.Position = UDim2.new(0.5, -60, 0.5, -25)
KillFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
KillFrame.Active = true
KillFrame.Draggable = true
Instance.new("UICorner", KillFrame).CornerRadius = UDim.new(0, 12)

-- Kill Button
local Btn = Instance.new("TextButton", KillFrame)
Btn.Size = UDim2.new(1, -10, 1, -10)
Btn.Position = UDim2.new(0, 5, 0, 5)
Btn.BackgroundColor3 = Color3.fromRGB(50,100,200) -- kapalı mavi
Btn.TextColor3 = Color3.fromRGB(255,255,255)
Btn.Font = Enum.Font.GothamBold
Btn.TextScaled = true
Btn.Text = "ÖLDÜR"
Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,8)

-- Credit Text
local Credit = Instance.new("TextLabel", KillFrame)
Credit.Size = UDim2.new(1,-10,0,15)
Credit.Position = UDim2.new(0,5,1,0)
Credit.BackgroundTransparency = 1
Credit.Text = "Kılıç elinde değilse çalışmaz."
Credit.TextColor3 = Color3.fromRGB(255,0,0)
Credit.TextScaled = true
Credit.Font = Enum.Font.Gotham
Credit.TextWrapped = true

-- Kill All logic
local Enabled = false
Btn.MouseButton1Click:Connect(function()
    Enabled = not Enabled
    if Enabled then
        Btn.BackgroundColor3 = Color3.fromRGB(0,200,0) -- açık yeşil
    else
        Btn.BackgroundColor3 = Color3.fromRGB(50,100,200) -- kapalı mavi
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if not Enabled then return end
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local char = plr.Character
            if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                if LocalPlayer:DistanceFromCharacter(char.HumanoidRootPart.Position) <= 1000000 then
                    local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
                    if tool and tool:FindFirstChild("Handle") then
                        tool:Activate()
                        for _, part in pairs(char:GetChildren()) do
                            if part:IsA("BasePart") then
                                firetouchinterest(tool.Handle, part, 0)
                                firetouchinterest(tool.Handle, part, 1)
                            end
                        end
                    end
                end
            end
        end
    end
end)