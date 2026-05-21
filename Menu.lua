repeat task.wait() until game:IsLoaded()
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Đã sửa chuẩn chữ viết thường zombie arena
loadstring(game:HttpGet("https://raw.githubusercontent.com/Black69Weeds/Scripts/main/SyzenHub%20Survive%20zombie%20arena.lua"))()

local KarimcGui = Instance.new("ScreenGui")
KarimcGui.Name = "KarimcControl"
KarimcGui.Parent = PlayerGui
KarimcGui.ResetOnSpawn = false

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = KarimcGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
ToggleButton.Position = UDim2.new(0, 15, 0, 150)
ToggleButton.Size = UDim2.new(0, 45, 0, 45)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Text = "K"
ToggleButton.TextColor3 = Color3.fromRGB(140, 80, 255)
ToggleButton.TextSize = 18
ToggleButton.Active = true
ToggleButton.Draggable = true 

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(1, 0)
BtnCorner.Parent = ToggleButton

local BtnStroke = Instance.new("UIStroke")
BtnStroke.Color = Color3.fromRGB(140, 80, 255)
BtnStroke.Thickness = 1.5
BtnStroke.Parent = ToggleButton

task.spawn(function()
    local MainGui = nil
    while not MainGui do
        task.wait(0.5)
        MainGui = PlayerGui:FindFirstChild("SyzenHub") or PlayerGui:FindFirstChild("ScreenGui")
        if MainGui and not MainGui:FindFirstChild("MainWindow") and not MainGui:FindFirstChildOfClass("Frame") then
            MainGui = nil
        end
    end
    task.wait(1.0)
    
    for _, gui in pairs(PlayerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui.Name ~= "KarimcControl" then
            for _, child in pairs(gui:GetDescendants()) do
                if child:IsA("TextButton") and (child.Text == "Toggle" or child.Text == "Lock") then
                    if child.Parent:IsA("Frame") and child.Parent.Size.Y.Offset < 100 then
                        child.Parent:Destroy()
                    else
                        child:Destroy()
                    end
                end
            end
        end
    end
    
    local MainWindow = MainGui:FindFirstChild("MainWindow") or MainGui:FindFirstChildOfClass("Frame")
    if MainWindow then
        ToggleButton.MouseButton1Click:Connect(function()
            MainWindow.Visible = not MainWindow.Visible
            ToggleButton.Text = MainWindow.Visible and "K" or "Hiện"
        end)
    end
end)
