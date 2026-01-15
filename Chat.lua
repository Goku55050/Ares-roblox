--// 🔥 ARES RECHAT v6.1 - Compact Mobile Edition
--// Better touch targets, smaller footprint, cleaner look

if getgenv().ARES_RECHAT_LOADED then return end
getgenv().ARES_RECHAT_LOADED = true

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- RemoteEvent
local remote = ReplicatedStorage:FindFirstChild("ARES_ReChat") or Instance.new("RemoteEvent")
remote.Name = "ARES_ReChat"
remote.Parent = ReplicatedStorage

--==============================
-- SERVER HANDLER (unchanged)
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
-- COMPACT + MOBILE FRIENDLY GUI
--==============================
local gui = Instance.new("ScreenGui")
gui.Name = "AresReChat"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui", 5)

local main = Instance.new("Frame")
main.Size = UDim2.new(0.92, 0, 0.38, 0)           -- bit taller but narrower
main.Position = UDim2.new(0.04, 0, 0.58, 0)       -- better mobile positioning
main.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = main

-- Subtle gradient stroke (looks cleaner on mobile)
local stroke = Instance.new("UIStroke")
stroke.Thickness = 1.5
stroke.Transparency = 0.4
stroke.Color = Color3.fromRGB(110, 180, 255)
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = main

-- Rainbow effect (optional - can be removed if you want static)
RunService.RenderStepped:Connect(function(dt)
    local hue = (tick() * 0.12) % 1
    stroke.Color = Color3.fromHSV(hue, 0.9, 1)
end)

-- Header + Online counter
local header = Instance.new("Frame")
header.Size = UDim2.new(1,0,0,34)
header.BackgroundTransparency = 1
header.Parent = main

do
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0.5,0,1,0)
    title.Position = UDim2.new(0,12,0,0)
    title.BackgroundTransparency = 1
    title.Text = "ARES CHAT"
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 15
    title.TextColor3 = Color3.fromRGB(220,220,255)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = header

    local count = Instance.new("TextLabel")
    count.Name = "OnlineCount"
    count.Size = UDim2.new(0.5,0,1,0)
    count.Position = UDim2.new(0.5,0,0,0)
    count.BackgroundTransparency = 1
    count.Text = "● 1 online"
    count.Font = Enum.Font.Gotham
    count.TextSize = 13
    count.TextColor3 = Color3.fromRGB(100, 255, 140)
    count.TextXAlignment = Enum.TextXAlignment.Right
    count.Parent = header
end

-- Messages area
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1,-16,1,-78)
scroll.Position = UDim2.new(0,8,0,40)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = Color3.fromRGB(80,80,100)
scroll.CanvasSize = UDim2.new()
scroll.Parent = main

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0,6)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = scroll

-- Input area (bigger touch targets)
local inputFrame = Instance.new("Frame")
inputFrame.Size = UDim2.new(1,-16,0,42)
inputFrame.Position = UDim2.new(0,8,1,-50)
inputFrame.BackgroundColor3 = Color3.fromRGB(30,30,36)
inputFrame.BorderSizePixel = 0
inputFrame.Parent = main

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0,10)
inputCorner.Parent = inputFrame

local box = Instance.new("TextBox")
box.Size = UDim2.new(1,-68,1,-8)
box.Position = UDim2.new(0,6,0,4)
box.BackgroundTransparency = 1
box.TextColor3 = Color3.new(1,1,1)
box.PlaceholderColor3 = Color3.fromRGB(140,140,160)
box.PlaceholderText = "Message..."
box.TextWrapped = true
box.ClearTextOnFocus = false
box.Font = Enum.Font.Gotham
box.TextSize = 14
box.TextXAlignment = Enum.TextXAlignment.Left
box.Parent = inputFrame

-- Send button (bigger hitbox)
local send = Instance.new("TextButton")
send.Size = UDim2.new(0,56,1,-8)
send.Position = UDim2.new(1,-62,0,4)
send.BackgroundColor3 = Color3.fromRGB(60, 160, 255)
send.Text = "SEND"
send.Font = Enum.Font.GothamBold
send.TextSize = 13
send.TextColor3 = Color3.new(1,1,1)
send.Parent = inputFrame

local sendCorner = Instance.new("UICorner")
sendCorner.CornerRadius = UDim.new(0,10)
sendCorner.Parent = send

--==============================
-- FUNCTIONS (small improvements)
--==============================
local function addMessage(user, text)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1,0,0,0)
    frame.AutomaticSize = Enum.AutomaticSize.Y
    frame.BackgroundTransparency = 1
    frame.Parent = scroll

    local msg = Instance.new("TextLabel")
    msg.Size = UDim2.new(1,0,0,0)
    msg.AutomaticSize = Enum.AutomaticSize.Y
    msg.BackgroundColor3 = Color3.fromRGB(32,32,38)
    msg.BackgroundTransparency = 0.25
    msg.TextColor3 = Color3.fromRGB(235,235,245)
    msg.TextWrapped = true
    msg.TextXAlignment = Enum.TextXAlignment.Left
    msg.TextYAlignment = Enum.TextYAlignment.Top
    msg.TextSize = 13
    msg.Font = Enum.Font.Gotham
    msg.Text = "  @" .. user .. ": " .. text
    msg.Parent = frame

    local msgCorner = Instance.new("UICorner")
    msgCorner.CornerRadius = UDim.new(0,10)
    msgCorner.Parent = msg

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0,6)
    padding.PaddingBottom = UDim.new(0,6)
    padding.PaddingLeft = UDim.new(0,8)
    padding.PaddingRight = UDim.new(0,8)
    padding.Parent = msg

    task.delay(0.03, function()
        scroll.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y + 16)
        scroll.CanvasPosition = Vector2.new(0, math.huge)
    end)
end

-- Auto-resize input (max 4 lines)
box:GetPropertyChangedSignal("Text"):Connect(function()
    local lines = math.min(#box.Text:split("\n"), 4)
    local newHeight = 42 + (lines-1)*16
    inputFrame.Size = UDim2.new(1,-16,0,newHeight)
    inputFrame.Position = UDim2.new(0,8,1,-newHeight-8)
end)

-- Better mobile experience
box.Focused:Connect(function()
    main.Position = UDim2.new(0.04, 0, 0.45, 0) -- move up when keyboard opens
end)

box.FocusLost:Connect(function()
    main.Position = UDim2.new(0.04, 0, 0.58, 0)
end)

--==============================
-- CONNECTIONS (unchanged logic)
--==============================
remote:FireServer("JOIN", player.Name)

send.MouseButton1Click:Connect(function()
    local text = box.Text
    if text ~= "" and text:match("%S") then
        remote:FireServer("MSG", player.Name, text)
        box.Text = ""
    end
end)

remote.OnClientEvent:Connect(function(action, a, b)
    if action == "MSG" then
        addMessage(a, b)
    elseif action == "COUNT" then
        scroll.Parent.OnlineCount.Text = "● " .. a .. " online"
    end
end)

-- Cleanup on leave
player.AncestryChanged:Connect(function(_, parent)
    if not parent then
        remote:FireServer("LEAVE")
    end
end)
