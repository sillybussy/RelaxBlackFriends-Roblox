local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Small Fly GUI
local FlyGui = Instance.new("ScreenGui", PlayerGui)
FlyGui.Name = "FlyGUI"
FlyGui.ResetOnSpawn = false

local FlyFrame = Instance.new("Frame", FlyGui)
FlyFrame.Size = UDim2.new(0, 140, 0, 60)
FlyFrame.Position = UDim2.new(0.5, -70, 0.5, -30)
FlyFrame.BackgroundColor3 = Color3.fromRGB(35,35,35)
FlyFrame.Active = true
FlyFrame.Draggable = true
Instance.new("UICorner", FlyFrame).CornerRadius = UDim.new(0,12)

-- Fly Button
local Btn = Instance.new("TextButton", FlyFrame)
Btn.Size = UDim2.new(1,0,1,-15)
Btn.Position = UDim2.new(0,0,0,0)
Btn.BackgroundColor3 = Color3.fromRGB(255,0,0) -- kapalı kırmızı
Btn.TextColor3 = Color3.fromRGB(255,255,255)
Btn.Font = Enum.Font.GothamBold
Btn.TextScaled = true
Btn.Text = "FLY"
Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,8)

-- Credit Text
local Credit = Instance.new("TextLabel", FlyFrame)
Credit.Size = UDim2.new(1,0,0,15)
Credit.Position = UDim2.new(0,0,1,0)
Credit.BackgroundTransparency = 1
Credit.Text = "10x Hızlı Fly Aktif/Pasif"
Credit.TextColor3 = Color3.fromRGB(0,255,255)
Credit.TextScaled = true
Credit.Font = Enum.Font.Gotham
Credit.TextWrapped = true

-- Fly logic
local FlyEnabled = false
local flySpeed = 100 -- 10x hızlı
local BodyVelocity, BodyGyro

Btn.MouseButton1Click:Connect(function()
    FlyEnabled = not FlyEnabled
    if FlyEnabled then
        Btn.BackgroundColor3 = Color3.fromRGB(0,200,0) -- açık yeşil
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            BodyVelocity = Instance.new("BodyVelocity", hrp)
            BodyVelocity.MaxForce = Vector3.new(1e5,1e5,1e5)
            BodyVelocity.Velocity = Vector3.new(0,0,0)
            BodyGyro = Instance.new("BodyGyro", hrp)
            BodyGyro.MaxTorque = Vector3.new(1e5,1e5,1e5)
            BodyGyro.CFrame = hrp.CFrame
        end
    else
        Btn.BackgroundColor3 = Color3.fromRGB(255,0,0) -- kapalı kırmızı
        if BodyVelocity then BodyVelocity:Destroy() BodyVelocity=nil end
        if BodyGyro then BodyGyro:Destroy() BodyGyro=nil end
    end
end)

-- Movement
RunService.RenderStepped:Connect(function()
    if not FlyEnabled then return end
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart
    local moveDir = Vector3.new()
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + hrp.CFrame.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - hrp.CFrame.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - hrp.CFrame.RightVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + hrp.CFrame.RightVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0,1,0) end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0,1,0) end

    if BodyVelocity then
        BodyVelocity.Velocity = moveDir.Unit * flySpeed
    end
end)