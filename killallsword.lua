local I1I1I1I1I1 = game:GetService("\83\116\97\114\116\101\114\71\117\105") local I1I1I1lIlI = game:GetService("\80\108\97\121\101\114\115") local l1Il1l1I1I = I1I1I1lIlI.LocalPlayer local Il1I1IlIlI = l1Il1l1I1I:WaitForChild("PlayerGui")

local lIl1Il1I1l = Instance.new("ScreenGui", Il1I1IlIlI) lIl1Il1I1l.Name = "lIl1I1I1SkibidiLoading" lIl1Il1I1l.ResetOnSpawn = false

local lIl1I1lIl1 = Instance.new("Frame", lIl1Il1I1l) lIl1I1lIl1.BackgroundColor3 = Color3.fromRGB(30,30,30) lIl1I1lIl1.Size = UDim2.new(0, 400, 0, 160) lIl1I1lIl1.Position = UDim2.new(0.5, -200, 0.5, -80) Instance.new("UICorner", lIl1I1lIl1).CornerRadius = UDim.new(0, 10)

local lIIlIIlIlIlIlIlIlIllIlI = Instance.new("TextLabel", lIl1I1lIl1) lIIlIIlIlIlIlIlIlIllIlI.Text = string.char(84,104,97,110,107,115,32,70,111,114,32,85,115,105,110,103,32,77,121,32,83,99,114,105,112,116) lIIlIIlIlIlIlIlIlIllIlI.Font = Enum.Font.GothamBlack lIIlIIlIlIlIlIlIlIllIlI.TextColor3 = Color3.fromRGB(255, 255, 255) lIIlIIlIlIlIlIlIlIllIlI.TextScaled = true lIIlIIlIlIlIlIlIlIllIlI.Size = UDim2.new(1, -20, 0, 50) lIIlIIlIlIlIlIlIlIllIlI.Position = UDim2.new(0, 10, 0, 5) lIIlIIlIlIlIlIlIlIllIlI.BackgroundTransparency = 1

local I1lIlIl1I1 = Instance.new("TextLabel", lIl1I1lIl1) I1lIlIl1I1.Text = string.char(76,111,97,100,105,110,103,32,80,108,101,97,115,101,32,87,97,105,116,46,46,46) I1lIlIl1I1.Font = Enum.Font.Gotham I1lIlIl1I1.TextColor3 = Color3.fromRGB(255, 255, 255) I1lIlIl1I1.TextScaled = true I1lIlIl1I1.Size = UDim2.new(1, -20, 0, 40) I1lIlIl1I1.Position = UDim2.new(0, 10, 0, 60) I1lIlIl1I1.BackgroundTransparency = 1

local BarBack = Instance.new("Frame", lIl1I1lIl1) BarBack.Size = UDim2.new(1, -41, 0, 20) BarBack.Position = UDim2.new(0, 20, 0.75, 0) BarBack.BackgroundColor3 = Color3.fromRGB(50, 50, 50) Instance.new("UICorner", BarBack).CornerRadius = UDim.new(0, 8)

local BarFill = Instance.new("Frame", BarBack) BarFill.Size = UDim2.new(0, 0, 1, 0) BarFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0) Instance.new("UICorner", BarFill).CornerRadius = UDim.new(0, 8)

for i = 1, 100 do BarFill.Size = UDim2.new(i/100, 0, 1, 0) wait(0.025) end

for i = 0, 1, 0.05 do lIl1I1lIl1.BackgroundTransparency = i lIIlIIlIlIlIlIlIlIllIlI.TextTransparency = i I1lIlIl1I1.TextTransparency = i BarBack.BackgroundTransparency = i BarFill.BackgroundTransparency = i wait() end lIl1Il1I1l:Destroy()

local IlIlIlIIlIl = Instance.new("ScreenGui", Il1I1IlIlI) IlIlIlIIlIl.Name = "KillAllUI" IlIlIlIIlIl.ResetOnSpawn = false

local I1l1I1I1l1 = Instance.new("Frame", IlIlIlIIlIl) I1l1I1I1l1.Size = UDim2.new(0, 250, 0, 90) I1l1I1I1l1.Position = UDim2.new(0.5, -125, 0.5, -45) I1l1I1I1l1.BackgroundColor3 = Color3.fromRGB(30, 30, 30) I1l1I1I1l1.Active = true I1l1I1I1l1.Draggable = true Instance.new("UICorner", I1l1I1I1l1).CornerRadius = UDim.new(0, 10)

local Btn = Instance.new("TextButton", I1l1I1I1l1) Btn.Size = UDim2.new(1, -20, 0, 50) Btn.Position = UDim2.new(0, 10, 0, 10) Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50) Btn.TextColor3 = Color3.fromRGB(255, 0, 0) Btn.Font = Enum.Font.GothamBold Btn.TextScaled = true Btn.Text = "Kill All: OFF" Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)

local Credit = Instance.new("TextLabel", I1l1I1I1l1) Credit.Size = UDim2.new(1, -20, 0, 20) Credit.Position = UDim2.new(0, 10, 0, 65) Credit.BackgroundColor3 = Color3.fromRGB(40, 40, 40) Credit.Text = string.char(77,97,100,101,32,66,121,32,64,98,111,116,114,101,97,108,49,32,111,110,32,116,105,107,116,111,107) Credit.TextColor3 = Color3.fromRGB(255, 255, 255) Credit.TextScaled = true Credit.Font = Enum.Font.Gotham Instance.new("UICorner", Credit).CornerRadius = UDim.new(0, 6)

local Enabled = false Btn.MouseButton1Click:Connect(function() Enabled = not Enabled Btn.Text = Enabled and "Kill All: ON (Hold Sword)" or "Kill All: OFF" Btn.TextColor3 = Enabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0) end)

game:GetService("RunService").RenderStepped:Connect(function() if not Enabled then return end for _, plr in pairs(I1I1I1lIlI:GetPlayers()) do if plr ~= l1Il1l1I1I then local char = plr.Character if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then if l1Il1l1I1I:DistanceFromCharacter(char.HumanoidRootPart.Position) <= 1000000 then local tool = l1Il1l1I1I.Character and l1Il1l1I1I.Character:FindFirstChildOfClass("Tool") if tool and tool:FindFirstChild("Handle") then tool:Activate() for _, part in pairs(char:GetChildren()) do if part:IsA("BasePart") then firetouchinterest(tool.Handle, part, 0) firetouchinterest(tool.Handle, part, 1) end end end end end end end end)

