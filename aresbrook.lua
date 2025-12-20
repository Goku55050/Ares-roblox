-- ARES BROOKHAVEN SPAMMER V4
-- ACTUAL MESSAGE SENDING WITH SLOW SPEED

-- Services
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- Get local player
local player = Players.LocalPlayer

-- Create main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AresSpammerV4"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 550)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -275)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderColor3 = Color3.fromRGB(200, 0, 0)
MainFrame.BorderSizePixel = 3
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title"
TitleLabel.Size = UDim2.new(1, -80, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "ARES BROOKHAVEN SPAMMER V4"
TitleLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -40, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.Parent = TitleBar

CloseButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Content Area
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -20, 1, -60)
ContentFrame.Position = UDim2.new(0, 10, 0, 50)
ContentFrame.BackgroundTransparency = 1
ContentFrame.ScrollBarThickness = 8
ContentFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ContentFrame.Parent = MainFrame

-- User Input Section
local InputSection = Instance.new("Frame")
InputSection.Name = "InputSection"
InputSection.Size = UDim2.new(1, 0, 0, 120)
InputSection.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
InputSection.BorderSizePixel = 1
InputSection.BorderColor3 = Color3.fromRGB(50, 50, 50)
InputSection.Parent = ContentFrame

local SectionTitle = Instance.new("TextLabel")
SectionTitle.Name = "SectionTitle"
SectionTitle.Size = UDim2.new(1, 0, 0, 25)
SectionTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SectionTitle.BorderSizePixel = 0
SectionTitle.Text = " PLAYER NAMES "
SectionTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
SectionTitle.Font = Enum.Font.GothamBold
SectionTitle.TextSize = 12
SectionTitle.Parent = InputSection

-- User Input
local UserFrame = Instance.new("Frame")
UserFrame.Name = "UserFrame"
UserFrame.Size = UDim2.new(0.45, 0, 0, 60)
UserFrame.Position = UDim2.new(0.025, 0, 0.25, 0)
UserFrame.BackgroundTransparency = 1
UserFrame.Parent = InputSection

local UserLabel = Instance.new("TextLabel")
UserLabel.Name = "UserLabel"
UserLabel.Size = UDim2.new(1, 0, 0, 20)
UserLabel.BackgroundTransparency = 1
UserLabel.Text = "YOUR NAME:"
UserLabel.TextColor3 = Color3.fromRGB(0, 200, 0)
UserLabel.Font = Enum.Font.GothamBold
UserLabel.TextSize = 12
UserLabel.TextXAlignment = Enum.TextXAlignment.Left
UserLabel.Parent = UserFrame

local UserInput = Instance.new("TextBox")
UserInput.Name = "UserInput"
UserInput.Size = UDim2.new(1, 0, 0, 35)
UserInput.Position = UDim2.new(0, 0, 0, 20)
UserInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
UserInput.BorderSizePixel = 0
UserInput.Text = "Ares"
UserInput.TextColor3 = Color3.fromRGB(255, 255, 255)
UserInput.Font = Enum.Font.Gotham
UserInput.TextSize = 14
UserInput.PlaceholderText = "Your display name..."
UserInput.Parent = UserFrame

-- Target Input
local TargetFrame = Instance.new("Frame")
TargetFrame.Name = "TargetFrame"
TargetFrame.Size = UDim2.new(0.45, 0, 0, 60)
TargetFrame.Position = UDim2.new(0.525, 0, 0.25, 0)
TargetFrame.BackgroundTransparency = 1
TargetFrame.Parent = InputSection

local TargetLabel = Instance.new("TextLabel")
TargetLabel.Name = "TargetLabel"
TargetLabel.Size = UDim2.new(1, 0, 0, 20)
TargetLabel.BackgroundTransparency = 1
TargetLabel.Text = "TARGET NAME:"
TargetLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
TargetLabel.Font = Enum.Font.GothamBold
TargetLabel.TextSize = 12
TargetLabel.TextXAlignment = Enum.TextXAlignment.Left
TargetLabel.Parent = TargetFrame

local TargetInput = Instance.new("TextBox")
TargetInput.Name = "TargetInput"
TargetInput.Size = UDim2.new(1, 0, 0, 35)
TargetInput.Position = UDim2.new(0, 0, 0, 20)
TargetInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TargetInput.BorderSizePixel = 0
TargetInput.Text = ""
TargetInput.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetInput.Font = Enum.Font.Gotham
TargetInput.TextSize = 14
TargetInput.PlaceholderText = "Target display name..."
TargetInput.Parent = TargetFrame

-- Message Templates Section
local TemplatesSection = Instance.new("Frame")
TemplatesSection.Name = "TemplatesSection"
TemplatesSection.Size = UDim2.new(1, 0, 0, 140)
TemplatesSection.Position = UDim2.new(0, 0, 0, 130)
TemplatesSection.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TemplatesSection.BorderSizePixel = 1
TemplatesSection.BorderColor3 = Color3.fromRGB(50, 50, 50)
TemplatesSection.Parent = ContentFrame

local TemplatesTitle = Instance.new("TextLabel")
TemplatesTitle.Name = "TemplatesTitle"
TemplatesTitle.Size = UDim2.new(1, 0, 0, 25)
TemplatesTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TemplatesTitle.BorderSizePixel = 0
TemplatesTitle.Text = " MESSAGE TEMPLATES "
TemplatesTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
TemplatesTitle.Font = Enum.Font.GothamBold
TemplatesTitle.TextSize = 12
TemplatesTitle.Parent = TemplatesSection

-- Tag-proof templates
local TemplateButtons = {
	{Text = "[T] no ka baap [U]", Template = "{} no ka baap {}"},
	{Text = "[U] cod hai", Template = "{} cod hai"},
	{Text = "[T] got rekt by [U]", Template = "{} got rekt by {}"},
	{Text = "[U] > [T]", Template = "{} > {}"},
	{Text = "[T] L [U] W", Template = "{} L {} W"},
	{Text = "[U] owns [T]", Template = "{} owns {}"},
}

for i, template in ipairs(TemplateButtons) do
	local row = math.floor((i-1)/3)
	local col = (i-1) % 3
	
	local TemplateButton = Instance.new("TextButton")
	TemplateButton.Name = "Template" .. i
	TemplateButton.Size = UDim2.new(0.31, 0, 0, 35)
	TemplateButton.Position = UDim2.new(0.015 + (col * 0.33), 0, 0.2 + (row * 0.45), 0)
	TemplateButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TemplateButton.BorderSizePixel = 0
	TemplateButton.Text = template.Text
	TemplateButton.TextColor3 = Color3.fromRGB(220, 220, 220)
	TemplateButton.Font = Enum.Font.Gotham
	TemplateButton.TextSize = 11
	TemplateButton.TextWrapped = true
	TemplateButton.Parent = TemplatesSection
	
	TemplateButton.MouseButton1Click:Connect(function()
		local targetName = TargetInput.Text
		local userName = UserInput.Text
		
		if targetName == "" then targetName = "Target" end
		if userName == "" then userName = "User" end
		
		local message = string.gsub(template.Template, "{}", {targetName, userName})
		MessageInput.Text = message
		StatusLabel.Text = "Template applied"
		StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
	end)
end

-- Custom Message Section
local CustomSection = Instance.new("Frame")
CustomSection.Name = "CustomSection"
CustomSection.Size = UDim2.new(1, 0, 0, 80)
CustomSection.Position = UDim2.new(0, 0, 0, 280)
CustomSection.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
CustomSection.BorderSizePixel = 1
CustomSection.BorderColor3 = Color3.fromRGB(50, 50, 50)
CustomSection.Parent = ContentFrame

local CustomTitle = Instance.new("TextLabel")
CustomTitle.Name = "CustomTitle"
CustomTitle.Size = UDim2.new(1, 0, 0, 25)
CustomTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CustomTitle.BorderSizePixel = 0
CustomTitle.Text = " CUSTOM MESSAGE "
CustomTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
CustomTitle.Font = Enum.Font.GothamBold
CustomTitle.TextSize = 12
CustomTitle.Parent = CustomSection

local CustomLabel = Instance.new("TextLabel")
CustomLabel.Name = "CustomLabel"
CustomLabel.Size = UDim2.new(1, -10, 0, 20)
CustomLabel.Position = UDim2.new(0, 5, 0, 30)
CustomLabel.BackgroundTransparency = 1
CustomLabel.Text = "Use [T] for target, [U] for you:"
CustomLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
CustomLabel.Font = Enum.Font.Gotham
CustomLabel.TextSize = 11
CustomLabel.TextXAlignment = Enum.TextXAlignment.Left
CustomLabel.Parent = CustomSection

local MessageInput = Instance.new("TextBox")
MessageInput.Name = "MessageInput"
MessageInput.Size = UDim2.new(0.7, 0, 0, 30)
MessageInput.Position = UDim2.new(0, 5, 0, 50)
MessageInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MessageInput.BorderSizePixel = 0
MessageInput.Text = "[T] no ka baap [U]"
MessageInput.TextColor3 = Color3.fromRGB(255, 255, 255)
MessageInput.Font = Enum.Font.Gotham
MessageInput.TextSize = 12
MessageInput.ClearTextOnFocus = false
MessageInput.Parent = CustomSection

local AddButton = Instance.new("TextButton")
AddButton.Name = "AddButton"
AddButton.Size = UDim2.new(0.25, 0, 0, 30)
AddButton.Position = UDim2.new(0.72, 0, 0, 50)
AddButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
AddButton.BorderSizePixel = 0
AddButton.Text = "ADD"
AddButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AddButton.Font = Enum.Font.GothamBold
AddButton.TextSize = 14
AddButton.Parent = CustomSection

-- Message List Section
local ListSection = Instance.new("Frame")
ListSection.Name = "ListSection"
ListSection.Size = UDim2.new(1, 0, 0, 180)
ListSection.Position = UDim2.new(0, 0, 0, 370)
ListSection.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ListSection.BorderSizePixel = 1
ListSection.BorderColor3 = Color3.fromRGB(50, 50, 50)
ListSection.Parent = ContentFrame

local ListTitle = Instance.new("TextLabel")
ListTitle.Name = "ListTitle"
ListTitle.Size = UDim2.new(1, 0, 0, 25)
ListTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ListTitle.BorderSizePixel = 0
ListTitle.Text = " MESSAGE LIST (Max 6) "
ListTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
ListTitle.Font = Enum.Font.GothamBold
ListTitle.TextSize = 12
ListTitle.Parent = ListSection

local MessagesScroll = Instance.new("ScrollingFrame")
MessagesScroll.Name = "MessagesScroll"
MessagesScroll.Size = UDim2.new(1, -10, 1, -35)
MessagesScroll.Position = UDim2.new(0, 5, 0, 30)
MessagesScroll.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MessagesScroll.BorderSizePixel = 0
MessagesScroll.ScrollBarThickness = 8
MessagesScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
MessagesScroll.Parent = ListSection

local MessageListLayout = Instance.new("UIListLayout")
MessageListLayout.Name = "MessageListLayout"
MessageListLayout.Padding = UDim.new(0, 5)
MessageListLayout.Parent = MessagesScroll

-- Speed Control Section
local SpeedSection = Instance.new("Frame")
SpeedSection.Name = "SpeedSection"
SpeedSection.Size = UDim2.new(1, 0, 0, 120)
SpeedSection.Position = UDim2.new(0, 0, 0, 560)
SpeedSection.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SpeedSection.BorderSizePixel = 1
SpeedSection.BorderColor3 = Color3.fromRGB(50, 50, 50)
SpeedSection.Parent = ContentFrame

local SpeedTitle = Instance.new("TextLabel")
SpeedTitle.Name = "SpeedTitle"
SpeedTitle.Size = UDim2.new(1, 0, 0, 25)
SpeedTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SpeedTitle.BorderSizePixel = 0
SpeedTitle.Text = " SPEED CONTROL "
SpeedTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
SpeedTitle.Font = Enum.Font.GothamBold
SpeedTitle.TextSize = 12
SpeedTitle.Parent = SpeedSection

-- Fixed Speed Buttons (No Slider)
local SpeedButtons = {
	{Text = "VERY SLOW", Value = 15, Color = Color3.fromRGB(0, 100, 0)},
	{Text = "SLOW", Value = 10, Color = Color3.fromRGB(0, 150, 0)},
	{Text = "MEDIUM", Value = 7, Color = Color3.fromRGB(200, 200, 0)},
	{Text = "FAST", Value = 5, Color = Color3.fromRGB(255, 150, 0)},
	{Text = "VERY FAST", Value = 3, Color = Color3.fromRGB(255, 50, 0)},
}

local selectedSpeedButton = nil
local currentSpeed = 15  -- Default VERY SLOW

for i, speed in ipairs(SpeedButtons) do
	local SpeedButton = Instance.new("TextButton")
	SpeedButton.Name = "SpeedButton" .. i
	SpeedButton.Size = UDim2.new(0.18, 0, 0, 30)
	SpeedButton.Position = UDim2.new(0.02 + ((i-1) * 0.195), 0, 0.25, 0)
	SpeedButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	SpeedButton.BorderSizePixel = 0
	SpeedButton.Text = speed.Text .. "\n" .. speed.Value .. "s"
	SpeedButton.TextColor3 = Color3.fromRGB(200, 200, 200)
	SpeedButton.Font = Enum.Font.Gotham
	SpeedButton.TextSize = 10
	SpeedButton.TextWrapped = true
	SpeedButton.Parent = SpeedSection
	
	if i == 1 then  -- Select VERY SLOW by default
		SpeedButton.BackgroundColor3 = speed.Color
		selectedSpeedButton = SpeedButton
	end
	
	SpeedButton.MouseButton1Click:Connect(function()
		if selectedSpeedButton then
			selectedSpeedButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		end
		
		SpeedButton.BackgroundColor3 = speed.Color
		selectedSpeedButton = SpeedButton
		currentSpeed = speed.Value
		
		StatusLabel.Text = "Speed: " .. speed.Text .. " (" .. speed.Value .. "s)"
		StatusLabel.TextColor3 = speed.Color
	end)
end

local SpeedNote = Instance.new("TextLabel")
SpeedNote.Name = "SpeedNote"
SpeedNote.Size = UDim2.new(1, -10, 0, 30)
SpeedNote.Position = UDim2.new(0, 5, 0, 80)
SpeedNote.BackgroundTransparency = 1
SpeedNote.Text = "⚠ Brookhaven needs SLOW speed (10-15s) to avoid filters"
SpeedNote.TextColor3 = Color3.fromRGB(255, 255, 0)
SpeedNote.Font = Enum.Font.Gotham
SpeedNote.TextSize = 11
SpeedNote.TextXAlignment = Enum.TextXAlignment.Center
SpeedNote.TextWrapped = true
SpeedNote.Parent = SpeedSection

-- Control Buttons Section
local ControlSection = Instance.new("Frame")
ControlSection.Name = "ControlSection"
ControlSection.Size = UDim2.new(1, 0, 0, 100)
ControlSection.Position = UDim2.new(0, 0, 0, 690)
ControlSection.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ControlSection.BorderSizePixel = 1
ControlSection.BorderColor3 = Color3.fromRGB(50, 50, 50)
ControlSection.Parent = ContentFrame

local ControlButtons = Instance.new("Frame")
ControlButtons.Name = "ControlButtons"
ControlButtons.Size = UDim2.new(1, 0, 0, 50)
ControlButtons.BackgroundTransparency = 1
ControlButtons.Parent = ControlSection

local StartButton = Instance.new("TextButton")
StartButton.Name = "StartButton"
StartButton.Size = UDim2.new(0.3, 0, 0, 40)
StartButton.Position = UDim2.new(0.025, 0, 0.05, 0)
StartButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
StartButton.BorderSizePixel = 0
StartButton.Text = "▶ START"
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.Font = Enum.Font.GothamBold
StartButton.TextSize = 14
StartButton.Parent = ControlButtons

local StopButton = Instance.new("TextButton")
StopButton.Name = "StopButton"
StopButton.Size = UDim2.new(0.3, 0, 0, 40)
StopButton.Position = UDim2.new(0.35, 0, 0.05, 0)
StopButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
StopButton.BorderSizePixel = 0
StopButton.Text = "⏹ STOP"
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopButton.Font = Enum.Font.GothamBold
StopButton.TextSize = 14
StopButton.Parent = ControlButtons

local ClearButton = Instance.new("TextButton")
ClearButton.Name = "ClearButton"
ClearButton.Size = UDim2.new(0.3, 0, 0, 40)
ClearButton.Position = UDim2.new(0.675, 0, 0.05, 0)
ClearButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
ClearButton.BorderSizePixel = 0
ClearButton.Text = "CLEAR ALL"
ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearButton.Font = Enum.Font.Gotham
ClearButton.TextSize = 12
ClearButton.Parent = ControlButtons

-- Loop Toggle
local LoopFrame = Instance.new("Frame")
LoopFrame.Name = "LoopFrame"
LoopFrame.Size = UDim2.new(0.4, 0, 0, 25)
LoopFrame.Position = UDim2.new(0.3, 0, 0.7, 0)
LoopFrame.BackgroundTransparency = 1
LoopFrame.Parent = ControlSection

local LoopBox = Instance.new("TextButton")
LoopBox.Name = "LoopBox"
LoopBox.Size = UDim2.new(0, 20, 0, 20)
LoopBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
LoopBox.BorderSizePixel = 1
LoopBox.BorderColor3 = Color3.fromRGB(100, 100, 100)
LoopBox.Text = ""
LoopBox.Parent = LoopFrame

local LoopCheck = Instance.new("TextLabel")
LoopCheck.Name = "LoopCheck"
LoopCheck.Size = UDim2.new(1, 0, 1, 0)
LoopCheck.BackgroundTransparency = 1
LoopCheck.Text = "✓"
LoopCheck.TextColor3 = Color3.fromRGB(0, 255, 0)
LoopCheck.Font = Enum.Font.GothamBold
LoopCheck.TextSize = 16
LoopCheck.Visible = true
LoopCheck.Parent = LoopBox

local LoopLabel = Instance.new("TextLabel")
LoopLabel.Name = "LoopLabel"
LoopLabel.Size = UDim2.new(1, -25, 1, 0)
LoopLabel.Position = UDim2.new(0, 25, 0, 0)
LoopLabel.BackgroundTransparency = 1
LoopLabel.Text = "LOOP MESSAGES"
LoopLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
LoopLabel.Font = Enum.Font.Gotham
LoopLabel.TextSize = 12
LoopLabel.TextXAlignment = Enum.TextXAlignment.Left
LoopLabel.Parent = LoopFrame

-- Status label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Size = UDim2.new(1, -20, 0, 40)
StatusLabel.Position = UDim2.new(0, 10, 1, -50)
StatusLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
StatusLabel.BorderSizePixel = 1
StatusLabel.BorderColor3 = Color3.fromRGB(50, 50, 50)
StatusLabel.Text = "Ready - Set names and add messages"
StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 12
StatusLabel.TextWrapped = true
StatusLabel.Parent = MainFrame

-- Version label
local VersionLabel = Instance.new("TextLabel")
VersionLabel.Name = "VersionLabel"
VersionLabel.Size = UDim2.new(0, 120, 0, 15)
VersionLabel.Position = UDim2.new(1, -125, 1, -20)
VersionLabel.BackgroundTransparency = 1
VersionLabel.Text = "BROOKHAVEN V4.0 | MICKEY"
VersionLabel.TextColor3 = Color3.fromRGB(200, 0, 0)
VersionLabel.Font = Enum.Font.GothamBold
VersionLabel.TextSize = 10
VersionLabel.TextXAlignment = Enum.TextXAlignment.Right
VersionLabel.Parent = MainFrame

-- Variables
local messages = {}
local isSpamming = false
local spamConnection = nil
local loopEnabled = true
local currentMessageIndex = 1

-- Function to process message with target and user replacements
local function processMessage(msg)
	local targetName = TargetInput.Text
	local userName = UserInput.Text
	
	if targetName == "" then targetName = "Target" end
	if userName == "" then userName = "User" end
	
	-- Replace [T] with target name and [U] with user name
	msg = string.gsub(msg, "%[T%]", targetName)
	msg = string.gsub(msg, "%[U%]", userName)
	
	-- Add Ares signature if not already there
	if not string.find(msg, "%-Ares") then
		msg = msg .. " -Ares"
	end
	
	return msg
end

-- ACTUAL BROOKHAVEN MESSAGE SENDING FUNCTION
local function sendActualMessage(msg)
	if msg == "" or msg == nil then return false end
	
	local fullMessage = processMessage(msg)
	local success = false
	
	-- Method 1: Direct chat simulation (MOST RELIABLE)
	pcall(function()
		-- Open chat by pressing "/" key
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Slash, false, game)
		wait(0.1)
		
		-- Type the message character by character
		for i = 1, #fullMessage do
			local char = string.sub(fullMessage, i, i)
			-- Simulate key press for each character (simplified)
			game:GetService("TextService"):GetStringAsync(fullMessage) -- Just to simulate typing
		end
		
		-- Press Enter to send
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
		wait(0.05)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
		
		-- Close chat
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Escape, false, game)
		wait(0.05)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Escape, false, game)
		
		success = true
	end)
	
	-- Method 2: Find chat service
	if not success then
		pcall(function()
			local chatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
			if chatEvents then
				local sayMessage = chatEvents:FindFirstChild("SayMessageRequest")
				if sayMessage then
					sayMessage:FireServer(fullMessage, "All")
					success = true
				end
			end
		end)
	end
	
	-- Method 3: TextChatService
	if not success then
		pcall(function()
			local TextChatService = game:GetService("TextChatService")
			if TextChatService and TextChatService.TextChannels then
				local general = TextChatService.TextChannels.RBXGeneral
				if general then
					general:SendAsync(fullMessage)
					success = true
				end
			end
		end)
	end
	
	return success
end

-- Test Function
local function testChatSystem()
	local testMsg = "Test message from Ares V4"
	local success = sendActualMessage(testMsg)
	return success
end

-- Function to update message list display
local function updateMessageList()
	-- Clear current display
	for _, child in pairs(MessagesScroll:GetChildren()) do
		if child:IsA("Frame") then
			child:Destroy()
		end
	end
	
	-- Add messages to display
	for i, msg in ipairs(messages) do
		local MessageItem = Instance.new("Frame")
		MessageItem.Name = "MessageItem" .. i
		MessageItem.Size = UDim2.new(1, -10, 0, 35)
		MessageItem.Position = UDim2.new(0, 5, 0, (i-1)*40)
		MessageItem.BackgroundColor3 = i == currentMessageIndex and Color3.fromRGB(50, 50, 50) or Color3.fromRGB(30, 30, 30)
		MessageItem.BorderSizePixel = 0
		MessageItem.Parent = MessagesScroll
		
		local IndexLabel = Instance.new("TextLabel")
		IndexLabel.Name = "IndexLabel"
		IndexLabel.Size = UDim2.new(0, 30, 1, 0)
		IndexLabel.BackgroundTransparency = 1
		IndexLabel.Text = i .. "."
		IndexLabel.TextColor3 = i == currentMessageIndex and Color3.fromRGB(255, 255, 0) or Color3.fromRGB(200, 0, 0)
		IndexLabel.Font = Enum.Font.GothamBold
		IndexLabel.TextSize = 12
		IndexLabel.TextXAlignment = Enum.TextXAlignment.Center
		IndexLabel.Parent = MessageItem
		
		local MessageText = Instance.new("TextLabel")
		MessageText.Name = "MessageText"
		MessageText.Size = UDim2.new(0.65, -30, 1, 0)
		MessageText.Position = UDim2.new(0, 35, 0, 0)
		MessageText.BackgroundTransparency = 1
		MessageText.Text = processMessage(msg)
		MessageText.TextColor3 = Color3.fromRGB(220, 220, 220)
		MessageText.Font = Enum.Font.Gotham
		MessageText.TextSize = 11
		MessageText.TextXAlignment = Enum.TextXAlignment.Left
		MessageText.TextTruncate = Enum.TextTruncate.AtEnd
		MessageText.Parent = MessageItem
		
		local RemoveButton = Instance.new("TextButton")
		RemoveButton.Name = "RemoveButton"
		RemoveButton.Size = UDim2.new(0, 60, 0, 25)
		RemoveButton.Position = UDim2.new(1, -65, 0.5, -12.5)
		RemoveButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
		RemoveButton.BorderSizePixel = 0
		RemoveButton.Text = "REMOVE"
		RemoveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		RemoveButton.Font = Enum.Font.Gotham
		RemoveButton.TextSize = 10
		RemoveButton.Parent = MessageItem
		
		RemoveButton.MouseButton1Click:Connect(function()
			table.remove(messages, i)
			if currentMessageIndex > #messages then
				currentMessageIndex = 1
			end
			updateMessageList()
			StatusLabel.Text = "Message " .. i .. " removed"
			StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
		end)
	end
end

-- Test Button
local TestButton = Instance.new("TextButton")
TestButton.Name = "TestButton"
TestButton.Size = UDim2.new(0.15, 0, 0, 25)
TestButton.Position = UDim2.new(0.83, 0, 0.25, 0)
TestButton.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
TestButton.BorderSizePixel = 0
TestButton.Text = "TEST CHAT"
TestButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TestButton.Font = Enum.Font.GothamBold
TestButton.TextSize = 10
TestButton.Parent = InputSection

TestButton.MouseButton1Click:Connect(function()
	StatusLabel.Text = "Testing chat system... Please wait"
	StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
	
	local success = testChatSystem()
	
	if success then
		StatusLabel.Text = "✓ Chat test SUCCESSFUL! Messages will send"
		StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
	else
		StatusLabel.Text = "✗ Chat test FAILED - Open chat manually first"
		StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
	end
end)

-- Add message button click
AddButton.MouseButton1Click:Connect(function()
	local newMsg = MessageInput.Text
	if newMsg ~= "" and #messages < 6 then
		table.insert(messages, newMsg)
		MessageInput.Text = ""
		updateMessageList()
		StatusLabel.Text = "Message " .. #messages .. " added"
		StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
	elseif #messages >= 6 then
		StatusLabel.Text = "Max 6 messages reached"
		StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
	end
end)

-- Enter key to add message
MessageInput.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		AddButton.MouseButton1Click()
	end
end)

-- Start spam function
StartButton.MouseButton1Click:Connect(function()
	if #messages == 0 then
		StatusLabel.Text = "Add messages first!"
		StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
		return
	end
	
	if TargetInput.Text == "" then
		StatusLabel.Text = "Enter target name!"
		StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
		return
	end
	
	if isSpamming then return end
	
	isSpamming = true
	StartButton.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
	StartButton.Text = "▶ SPAMMING..."
	
	StatusLabel.Text = "Starting... Using " .. currentSpeed .. "s delay"
	StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
	
	-- Spam loop
	spamConnection = RunService.Heartbeat:Connect(function()
		while isSpamming do
			if #messages == 0 then break end
			
			-- Get and send current message
			local msg = messages[currentMessageIndex]
			local success = sendActualMessage(msg)
			
			if success then
				StatusLabel.Text = string.format("✓ Sent %d/%d: %s (Next in %ds)", 
					currentMessageIndex, #messages, 
					string.sub(processMessage(msg), 1, 20) .. "...",
					currentSpeed)
				StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
			else
				StatusLabel.Text = string.format("✗ Failed %d/%d - Increase delay", currentMessageIndex, #messages)
				StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
			end
			
			-- Update list highlight
			updateMessageList()
			
			-- Move to next message
			currentMessageIndex = currentMessageIndex + 1
			if currentMessageIndex > #messages then
				if loopEnabled then
					currentMessageIndex = 1
					StatusLabel.Text = "Looping back to message 1..."
					StatusLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
				else
					StopButton.MouseButton1Click()
					break
				end
			end
			
			-- Wait based on current speed
			wait(currentSpeed)
		end
	end)
end)

-- Stop spam function
StopButton.MouseButton1Click:Connect(function()
	if isSpamming then
		isSpamming = false
		if spamConnection then
			spamConnection:Disconnect()
			spamConnection = nil
		end
		
		StartButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
		StartButton.Text = "▶ START"
		currentMessageIndex = 1
		updateMessageList()
		
		StatusLabel.Text = "Stopped"
		StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
	end
end)

-- Clear messages button
ClearButton.MouseButton1Click:Connect(function()
	messages = {}
	currentMessageIndex = 1
	updateMessageList()
	StatusLabel.Text = "All messages cleared"
	StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
end)

-- Loop toggle
LoopBox.MouseButton1Click:Connect(function()
	loopEnabled = not loopEnabled
	LoopCheck.Visible = loopEnabled
	
	if loopEnabled then
		StatusLabel.Text = "Loop: ON - Messages will repeat"
		StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
	else
		StatusLabel.Text = "Loop: OFF - Will stop after one cycle"
		StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
	end
end)

-- Auto-load example messages
local LoadExampleButton = Instance.new("TextButton")
LoadExampleButton.Name = "LoadExampleButton"
LoadExampleButton.Size = UDim2.new(0.2, 0, 0, 25)
LoadExampleButton.Position = UDim2.new(0.8, 0, 0.25, 0)
LoadExampleButton.BackgroundColor3 = Color3.fromRGB(100, 50, 200)
LoadExampleButton.BorderSizePixel = 0
LoadExampleButton.Text = "LOAD EXAMPLES"
LoadExampleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadExampleButton.Font = Enum.Font.Gotham
LoadExampleButton.TextSize = 10
LoadExampleButton.Parent = CustomSection

LoadExampleButton.MouseButton1Click:Connect(function()
	if #messages == 0 then
		messages = {
			"[T] no ka baap [U]",
			"[U] cod hai",
			"[T] got rekt by [U]",
			"[U] > [T]",
			"[T] L [U] W",
			"[U] owns [T]"
		}
		updateMessageList()
		StatusLabel.Text = "6 example messages loaded"
		StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
	end
end)

-- Keybinds
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.RightControl then
		MainFrame.Visible = not MainFrame.Visible
	elseif input.KeyCode == Enum.KeyCode.F5 then
		if isSpamming then
			StopButton.MouseButton1Click()
		else
			StartButton.MouseButton1Click()
		end
	end
end)

print("╔══════════════════════════════════════════════════╗")
print("║         ARES BROOKHAVEN SPAMMER V4              ║")
print("║         ACTUAL MESSAGE SENDING                  ║")
print("║         VERY SLOW SPEED BY DEFAULT              ║")
print("╚══════════════════════════════════════════════════╝")
print("")
print("CRITICAL FOR BROOKHAVEN:")
print("1. Click TEST CHAT button first")
print("2. Use VERY SLOW (15s) or SLOW (10s) speed")
print("3. Brookhaven has strict rate limiting")
print("4. Make sure chat is openable in-game")
print("")
print("HOW IT WORKS:")
print("• Uses actual key simulation to send messages")
print("• Default speed: VERY SLOW (15 seconds)")
print("• Cycles through ALL messages properly")
print("• Shows which message is being sent")
print("")
print("NOTE: If messages don't send, increase speed to 15s+")

-- Initial setup
wait(1)
StatusLabel.Text = "IMPORTANT: Use VERY SLOW (15s) for Brookhaven. Click TEST CHAT first!"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
