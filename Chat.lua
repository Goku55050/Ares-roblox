--// 🔥 ARES RECHAT v6
--// Auto-expand | Tap-to-type | Online counter | Delta compatible

if getgenv().ARES_RECHAT_LOADED then return end
getgenv().ARES_RECHAT_LOADED = true

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local UserInputService = game:GetService("UserInputService")

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
-- SERVER HANDLER (EXECUTOR SAFE)
--==============================
if not getgenv().ARES_SERVER then
    getgenv().ARES_SERVER = true
    local users = {}

    remote.OnServerEvent:Connect(function(plr, action, name, text)
        if action == "JOIN" then
            users[plr] = name
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
-- GUI
--==============================
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.82, 0.26)
main.Position = UDim2.fromScale(0.09, 0.68)
main.BackgroundColor3 = Color3.fromRGB(18,18,22)
main.BorderSizePixel = 0
main.ClipsDescendants = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)

-- RGB Border
local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 2
local hue = 0
RunService.RenderStepped:Connect(function(dt)
    hue = (hue + dt * 0.15) % 1
    stroke.Color = Color3.fromHSV(hue,1,1)
end)

-- Header
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,-80,0,26)
title.Position = UDim2.new(0,12,0,6)
title.Text = "ARES"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.TextXAlignment = Left

-- Online counter
local counter = Instance.new("TextLabel", main)
counter.Size = UDim2.new(0,80,0,26)
counter.Position = UDim2.new(1,-90,0,6)
counter.Text = "● 1 online"
counter.Font = Enum.Font.Gotham
counter.TextSize = 12
counter.TextColor3 = Color3.fromRGB(120,255,120)
counter.BackgroundTransparency = 1
counter.TextXAlignment = Right

-- Messages
local messages = Instance.new("ScrollingFrame", main)
messages.Position = UDim2.new(0,10,0,38)
messages.Size = UDim2.new(1,-20,1,-90)
messages.BackgroundTransparency = 1
messages.CanvasSize = UDim2.new()

local layout = Instance.new("UIListLayout", messages)
layout.Padding = UDim.new(0,4)

-- Input box (auto-expand)
local box = Instance.new("TextBox", main)
box.Size = UDim2.new(1,-80,0,30)
box.Position = UDim2.new(0,10,1,-38)
box.PlaceholderText = "Tap to type..."
box.TextWrapped = true
box.ClearTextOnFocus = false
box.Font = Enum.Font.Gotham
box.TextSize = 13
box.TextColor3 = Color3.new(1,1,1)
box.BackgroundColor3 = Color3.fromRGB(28,28,32)
Instance.new("UICorner", box).CornerRadius = UDim.new(0,10)

-- Send
local send = Instance.new("TextButton", main)
send.Size = UDim2.fromOffset(56,30)
send.Position = UDim2.new(1,-66,1,-38)
send.Text = "SEND"
send.Font = Enum.Font.GothamBold
send.TextSize = 12
send.TextColor3 = Color3.new(1,1,1)
send.BackgroundColor3 = Color3.fromRGB(40,40,45)
Instance.new("UICorner", send).CornerRadius = UDim.new(0,10)

--==============================
-- FUNCTIONS
--==============================
local function addMessage(user, text)
    local msg = Instance.new("TextLabel")
    msg.Size = UDim2.new(1,-6,0,20)
    msg.AutomaticSize = Enum.AutomaticSize.Y
    msg.TextWrapped = true
    msg.TextXAlignment = Left
    msg.TextYAlignment = Top
    msg.Text = "@"..user..": "..text
    msg.Font = Enum.Font.Gotham
    msg.TextSize = 13
    msg.TextColor3 = Color3.fromRGB(235,235,235)
    msg.BackgroundColor3 = Color3.fromRGB(32,32,36)
    Instance.new("UICorner", msg).CornerRadius = UDim.new(0,8)
    msg.Parent = messages

    task.wait()
    messages.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y + 6)
    messages.CanvasPosition = Vector2.new(0, math.max(0, messages.CanvasSize.Y.Offset - messages.AbsoluteWindowSize.Y))
end

-- Auto-expand input height
box:GetPropertyChangedSignal("Text"):Connect(function()
    local lines = math.clamp(#box.Text:split("\n"),1,4)
    box.Size = UDim2.new(1,-80,0,30 + (lines-1)*12)
    send.Position = UDim2.new(1,-66,1,-box.Size.Y.Offset-8)
end)

-- Tap to type (mobile fix)
box.Focused:Connect(function()
    main.Position = UDim2.fromScale(0.09,0.6)
end)

box.FocusLost:Connect(function()
    main.Position = UDim2.fromScale(0.09,0.68)
end)

--==============================
-- CHAT
--==============================
remote:FireServer("JOIN", player.Name)

send.MouseButton1Click:Connect(function()
    if box.Text ~= "" then
        remote:FireServer("MSG", player.Name, box.Text)
        box.Text = ""
    end
end)

remote.OnClientEvent:Connect(function(action, a, b)
    if action == "MSG" then
        addMessage(a,b)
    elseif action == "COUNT" then
        counter.Text = "● "..a.." online"
    end
end)

player.AncestryChanged:Connect(function(_, parent)
    if not parent then
        remote:FireServer("LEAVE")
    end
end)
