--// 🔥 ARES RECHAT v6.1 - FIXED & STABLE (Delta)
--// Compact Mobile Edition

if getgenv().ARES_RECHAT_LOADED then return end
getgenv().ARES_RECHAT_LOADED = true

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

--==============================
-- RemoteEvent
--==============================
local remote = ReplicatedStorage:FindFirstChild("ARES_ReChat")
if not remote then
    remote = Instance.new("RemoteEvent")
    remote.Name = "ARES_ReChat"
    remote.Parent = ReplicatedStorage
end

--==============================
-- SERVER HANDLER (executor-safe)
--==============================
if not getgenv().ARES_SERVER then
    getgenv().ARES_SERVER = true
    local users = {}

    remote.OnServerEvent:Connect(function(plr, action, name, text)
        if action == "JOIN" then
            users[plr] = true
            remote:FireAllClients("COUNT", #users)
        elseif action == "MSG" and users[plr] then
            remote:FireAllClients("MSG", name, text)
        elseif action == "LEAVE" then
            users[plr] = nil
            remote:FireAllClients("COUNT", #users)
        end
    end)
end

--==============================
-- GUI (SAFE PARENTING)
--==============================
local gui = Instance.new("ScreenGui")
gui.Name = "AresReChat"
gui.ResetOnSpawn = false
gui.Parent = player.PlayerGui

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0.92, 0, 0.38, 0)
main.Position = UDim2.new(0.04, 0, 0.58, 0)
main.BackgroundColor3 = Color3.fromRGB(20,20,24)
main.BorderSizePixel = 0
main.ClipsDescendants = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)

-- Stroke
local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 1.5
stroke.Transparency = 0.4

RunService.RenderStepped:Connect(function()
    stroke.Color = Color3.fromHSV((tick()*0.12)%1,0.9,1)
end)

--==============================
-- HEADER
--==============================
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1,0,0,34)
header.BackgroundTransparency = 1

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(0.6,0,1,0)
title.Position = UDim2.new(0,12,0,0)
title.Text = "ARES CHAT"
title.Font = Enum.Font.GothamBlack
title.TextSize = 15
title.TextColor3 = Color3.fromRGB(220,220,255)
title.BackgroundTransparency = 1
title.TextXAlignment = Left

local online = Instance.new("TextLabel", header)
online.Size = UDim2.new(0.4,-12,1,0)
online.Position = UDim2.new(0.6,0,0,0)
online.Text = "● 1 online"
online.Font = Enum.Font.Gotham
online.TextSize = 13
online.TextColor3 = Color3.fromRGB(100,255,140)
online.BackgroundTransparency = 1
online.TextXAlignment = Right

--==============================
-- MESSAGES
--==============================
local scroll = Instance.new("ScrollingFrame", main)
scroll.Position = UDim2.new(0,8,0,40)
scroll.Size = UDim2.new(1,-16,1,-78)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 4
scroll.CanvasSize = UDim2.new(0,0,0,0)

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0,6)

--==============================
-- INPUT
--==============================
local inputFrame = Instance.new("Frame", main)
inputFrame.Size = UDim2.new(1,-16,0,42)
inputFrame.Position = UDim2.new(0,8,1,-50)
inputFrame.BackgroundColor3 = Color3.fromRGB(30,30,36)
Instance.new("UICorner", inputFrame).CornerRadius = UDim.new(0,10)

local box = Instance.new("TextBox", inputFrame)
box.Size = UDim2.new(1,-68,1,-8)
box.Position = UDim2.new(0,6,0,4)
box.PlaceholderText = "Message..."
box.TextWrapped = true
box.ClearTextOnFocus = false
box.Font = Enum.Font.Gotham
box.TextSize = 14
box.TextColor3 = Color3.new(1,1,1)
box.BackgroundTransparency = 1

local send = Instance.new("TextButton", inputFrame)
send.Size = UDim2.new(0,56,1,-8)
send.Position = UDim2.new(1,-62,0,4)
send.Text = "SEND"
send.Font = Enum.Font.GothamBold
send.TextSize = 13
send.TextColor3 = Color3.new(1,1,1)
send.BackgroundColor3 = Color3.fromRGB(60,160,255)
Instance.new("UICorner", send).CornerRadius = UDim.new(0,10)

--==============================
-- MESSAGE FUNCTION
--==============================
local function addMessage(user,text)
    local msg = Instance.new("TextLabel")
    msg.Size = UDim2.new(1,0,0,0)
    msg.AutomaticSize = Enum.AutomaticSize.Y
    msg.TextWrapped = true
    msg.Text = "  @"..user..": "..text
    msg.Font = Enum.Font.Gotham
    msg.TextSize = 13
    msg.TextColor3 = Color3.fromRGB(235,235,245)
    msg.BackgroundColor3 = Color3.fromRGB(32,32,38)
    msg.Parent = scroll
    Instance.new("UICorner", msg).CornerRadius = UDim.new(0,10)

    task.wait()
    scroll.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y+16)
    scroll.CanvasPosition = Vector2.new(0, math.huge)
end

--==============================
-- AUTO EXPAND + TAP FIX
--==============================
box:GetPropertyChangedSignal("Text"):Connect(function()
    local lines = math.min(#box.Text:split("\n"),4)
    local h = 42 + (lines-1)*16
    inputFrame.Size = UDim2.new(1,-16,0,h)
    inputFrame.Position = UDim2.new(0,8,1,-h-8)
end)

box.Focused:Connect(function()
    main.Position = UDim2.new(0.04,0,0.45,0)
end)

box.FocusLost:Connect(function()
    main.Position = UDim2.new(0.04,0,0.58,0)
end)

--==============================
-- NETWORK
--==============================
remote:FireServer("JOIN", player.Name)

send.MouseButton1Click:Connect(function()
    if box.Text ~= "" then
        remote:FireServer("MSG", player.Name, box.Text)
        box.Text = ""
    end
end)

remote.OnClientEvent:Connect(function(action,a,b)
    if action == "MSG" then
        addMessage(a,b)
    elseif action == "COUNT" then
        online.Text = "● "..a.." online"
    end
end)

player.AncestryChanged:Connect(function(_,parent)
    if not parent then
        remote:FireServer("LEAVE")
    end
end)
