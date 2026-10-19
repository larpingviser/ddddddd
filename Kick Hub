-- ============================================================
-- KICK MENU — все kick-функции из Vizer V1 + V2 (все вместе)
-- ============================================================
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
	Title = "Kick Menu",
	Footer = "V1 + V2 Methods",
	Icon = 95816097006870,
	NotifySide = "Right",
	ShowCustomCursor = true,
})

-- ============================================================
-- SERVICES
-- ============================================================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents")
local SetNetworkOwner = GrabEvents:WaitForChild("SetNetworkOwner")
local CreateGrabLine = GrabEvents:FindFirstChild("CreateGrabLine")
local DestroyGrabLine = GrabEvents:WaitForChild("DestroyGrabLine")
local ExtendGrabLine = GrabEvents:FindFirstChild("ExtendGrabLine")

local MenuToys = ReplicatedStorage:WaitForChild("MenuToys")
local SpawnToyRemoteFunction = MenuToys:WaitForChild("SpawnToyRemoteFunction")
local DestroyToy = MenuToys:WaitForChild("DestroyToy")

local CharacterEvents = ReplicatedStorage:WaitForChild("CharacterEvents")
local Struggle = CharacterEvents:WaitForChild("Struggle")
local Ragdoll = CharacterEvents:WaitForChild("RagdollRemote")

-- ============================================================
-- HELPERS
-- ============================================================
local function notify(title, body, duration)
	Library:Notify({ Title = title, Description = body or "", Time = duration or 3 })
end

local function lookAt(from, to)
	local dir = (to - from).Unit
	local right = dir:Cross(Vector3.new(0, 1, 0))
	local up = right:Cross(dir)
	return CFrame.fromMatrix(from, right, up)
end

local function getHRP(player)
	local char = player and player.Character
	return char and char:FindFirstChild("HumanoidRootPart")
end

local function getRoot()
	local char = LocalPlayer.Character
	return char and char:FindFirstChild("HumanoidRootPart")
end

local function stvel(hrp)
	if hrp then
		hrp.AssemblyLinearVelocity = Vector3.zero
		hrp.AssemblyAngularVelocity = Vector3.zero
	end
end

local function FWC(parent, name, t)
	return parent:FindFirstChild(name) or parent:WaitForChild(name, t or 3)
end

-- ============================================================
-- TABS
-- ============================================================
local Tabs = {
	Kick = Window:AddTab("Kick", "sword"),
	["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

-- ============================================================
-- KICK TAB — Groupboxes
-- ============================================================
local TargetBox   = Tabs.Kick:AddGroupbox({ Side = "Left",  Name = "Target",           IconName = "crosshair" })
local KickMethods = Tabs.Kick:AddGroupbox({ Side = "Right", Name = "Kick Methods",     IconName = "zap" })
local BlobMethods = Tabs.Kick:AddGroupbox({ Side = "Right", Name = "Blobman Methods",  IconName = "circle-dot" })
local ServerBox   = Tabs.Kick:AddGroupbox({ Side = "Right", Name = "Server",           IconName = "server" })
-- дополнительный блок для новых функций V2 (внизу правой колонки)
local V2Methods   = Tabs.Kick:AddGroupbox({ Side = "Right", Name = "Extra Methods (V2)", IconName = "swords" })
local V2Orbit     = Tabs.Kick:AddGroupbox({ Side = "Right", Name = "Blobman Orbit",     IconName = "orbit" })

-- ============================================================
-- GLOBAL STATE
-- ============================================================
local selectedKickPlayer = nil
local selectedPlrName = nil
local selectedHeight = "Spawn"
local customKickHeight = 25

-- ============================================================
-- PLAYER LIST HELPERS
-- ============================================================
local function getPlayerList()
	local list = {}
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer then
			table.insert(list, plr.DisplayName .. " (@" .. plr.Name .. ")")
		end
	end
	if #list == 0 then table.insert(list, "No Players") end
	return list
end

local function getPlayerFromSelection(Value)
	if not Value or Value == "No Players" then return nil end
	local username = Value:match("@(.-)%)") or Value
	return Players:FindFirstChild(username)
end

-- ============================================================
-- TARGET SELECTION UI
-- ============================================================
local PlayerDropdown = TargetBox:AddDropdown("KickTarget", {
	Values = getPlayerList(),
	Default = 1,
	Multi = false,
	Text = "Select Player",
	Tooltip = "Выберите цель для кика",
	Searchable = true,
	Callback = function(Value)
		selectedKickPlayer = getPlayerFromSelection(Value)
		selectedPlrName = selectedKickPlayer and selectedKickPlayer.Name or nil
		print("[Kick] Target:", selectedPlrName)
	end,
})

local function updateDropdown()
	if PlayerDropdown then
		local list = getPlayerList()
		pcall(function() PlayerDropdown:SetValues(list) end)
	end
	if selectedKickPlayer and not selectedKickPlayer.Parent then
		selectedKickPlayer = nil
		selectedPlrName = nil
	end
end

Players.PlayerAdded:Connect(function() task.wait(1) updateDropdown() end)
Players.PlayerRemoving:Connect(function() task.wait(1) updateDropdown() end)

TargetBox:AddInput("FindByName", {
	Default = "",
	Numeric = false,
	Finished = true,
	ClearTextOnFocus = true,
	Text = "Find By Name (partial)",
	Tooltip = "Введите часть ника",
	Placeholder = "Username...",
	Callback = function(Value)
		if Value == "" then return end
		Value = Value:lower()
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr.Name:lower():sub(1, #Value) == Value or plr.DisplayName:lower():sub(1, #Value) == Value then
				selectedKickPlayer = plr
				selectedPlrName = plr.Name
				local displayString = plr.DisplayName .. " (@" .. plr.Name .. ")"
				PlayerDropdown:SetValue(displayString)
				break
			end
		end
	end,
})

TargetBox:AddInput("CustomKickHeight", {
	Default = "25",
	Numeric = true,
	Finished = true,
	ClearTextOnFocus = false,
	Text = "Custom Kick Height",
	Tooltip = "Высота подброса",
	Placeholder = "e.g. 50",
	Callback = function(Value)
		local num = tonumber(Value)
		customKickHeight = num or 25
	end,
})

-- ============================================================================
-- ============================================================================
--                         ЧАСТЬ 1: VIZER V1 KICK FUNCTIONS
-- ============================================================================
-- ============================================================================

-- 1. vizer Kick (Best) — Ownership Kick через AlignPosition
do
	local oatsKickActive = false
	local oatsKickTask = nil

	local function sno(part)
		pcall(function() SetNetworkOwner:FireServer(part, part.CFrame) end)
	end

	KickMethods:AddToggle("OatsKick", {
		Text = "vizer Kick (Best)",
		Default = false,
		Tooltip = "Ownership kick через AlignPosition",
		Callback = function(Value)
			oatsKickActive = Value

			if Value then
				local targetName = selectedPlrName
				if not targetName or targetName == "" then
					oatsKickActive = false
					Library:Notify({ Title = "Error", Description = "Select target first!", Time = 3 })
					return
				end

				oatsKickTask = task.spawn(function()
					local myChar = LocalPlayer.Character
					local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
					if not (myChar and myHRP) then oatsKickActive = false; return end

					local savedPos = myHRP.CFrame
					local lastRemoteFire = tick()

					while oatsKickActive and RunService.Heartbeat:Wait() do
						local currentTargetName = selectedPlrName
						local targetPlayer = currentTargetName and Players:FindFirstChild(currentTargetName)

						if not targetPlayer or not targetPlayer.Character then break end

						myChar = LocalPlayer.Character
						myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
						local myHead = myChar and myChar:FindFirstChild("Head")

						local tChar = targetPlayer.Character
						local tHRP = tChar and tChar:FindFirstChild("HumanoidRootPart")
						local tHum = tChar and tChar:FindFirstChild("Humanoid")

						if not (myChar and myHRP and myHead) or not (tHRP and tHum) or tHum.Health <= 0 then
							continue
						end

						local dist = (tHRP.Position - myHRP.Position).Magnitude

						if dist > 30 then
							pcall(function() myChar:PivotTo(tHRP.CFrame * CFrame.new(0, 2, 4)) end)
							sno(tHRP)
							task.wait(0.4)
							continue
						end

						if not tHRP:FindFirstChild("KickAlign") then
							local oldBp = tHRP:FindFirstChildOfClass("BodyPosition")
							if oldBp then oldBp:Destroy() end

							local att0 = Instance.new("Attachment", tHRP)
							att0.Name = "KickAtt0"
							local att1 = Instance.new("Attachment", workspace.Terrain)
							att1.Name = "KickAtt1"

							local alignPos = Instance.new("AlignPosition")
							alignPos.Name = "KickAlign"
							alignPos.Attachment0 = att0
							alignPos.Attachment1 = att1
							alignPos.MaxForce = math.huge
							alignPos.Responsiveness = 200
							alignPos.Parent = tHRP

							local alignRot = Instance.new("AlignOrientation")
							alignRot.Name = "KickRot"
							alignRot.Attachment0 = att0
							alignRot.Mode = Enum.OrientationAlignmentMode.OneAttachment
							alignRot.CFrame = CFrame.new()
							alignRot.MaxTorque = math.huge
							alignRot.Responsiveness = 200
							alignRot.Parent = tHRP
						end

						sno(tHRP)

						local align = tHRP:FindFirstChild("KickAlign")
						if align and align.Attachment1 and oatsKickActive then
							align.Attachment1.WorldPosition = myHead.Position + Vector3.new(0, customKickHeight, 0)
						end

						local rot = tHRP:FindFirstChild("KickRot")
						if rot then rot.CFrame = CFrame.Angles(0, 0, 0) end

						if tick() - lastRemoteFire > 0.05 and oatsKickActive then
							pcall(function() DestroyGrabLine:FireServer(tHRP) end)
							lastRemoteFire = tick()
						end
					end

					local finalTarget = selectedPlrName and Players:FindFirstChild(selectedPlrName)
					if finalTarget and finalTarget.Character then
						local tH = finalTarget.Character:FindFirstChild("HumanoidRootPart")
						if tH then
							local align = tH:FindFirstChild("KickAlign")
							local rot = tH:FindFirstChild("KickRot")
							local att0 = tH:FindFirstChild("KickAtt0")
							if align then
								if align.Attachment1 then align.Attachment1:Destroy() end
								align:Destroy()
							end
							if rot then rot:Destroy() end
							if att0 then att0:Destroy() end
							pcall(function() DestroyGrabLine:FireServer(tH) end)
						end
					end
					oatsKickActive = false
				end)
			else
				oatsKickActive = false
				if oatsKickTask then task.cancel(oatsKickTask) oatsKickTask = nil end
			end
		end,
	})
end

-- 2. Ownership Kick (4 режима)
do
	local modeOptions = {
		"vizer Ownership Kick(80+ fps)",
		"Ownership Kick fast",
		"Ownership Kick For Exploiter",
		"vizer UPGRADED Ownership Kick",
	}

	local selectedKickMode = "vizer Ownership Kick(80+ fps)"
	local ownershipKickActive = false
	local ownershipKickTask = nil
	local ownershipKickConnections = {}

	local function cleanupConnections()
		for _, conn in ipairs(ownershipKickConnections) do
			pcall(function() conn:Disconnect() end)
		end
		ownershipKickConnections = {}
		if ownershipKickTask then task.cancel(ownershipKickTask) ownershipKickTask = nil end
		ownershipKickActive = false
		pcall(function()
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local root = LocalPlayer.Character.HumanoidRootPart
				root.Anchored = false
				root.AssemblyLinearVelocity = Vector3.zero
				root.AssemblyAngularVelocity = Vector3.zero
			end
		end)
	end

	KickMethods:AddDropdown("OwnershipKickMode", {
		Values = modeOptions,
		Default = "vizer Ownership Kick(80+ fps)",
		Multi = false,
		Text = "Ownership Mode",
		Callback = function(Value) selectedKickMode = Value end,
	})

	KickMethods:AddToggle("OwnershipKickToggle", {
		Text = "Enable Ownership Kick",
		Default = false,
		Callback = function(Value)
			if not Value then cleanupConnections() return end
			if ownershipKickActive then cleanupConnections() end
			ownershipKickActive = Value

			local targetName = selectedPlrName
			if not targetName or targetName == "" then
				Library:Notify({ Title = "Error", Description = "Select target first!", Time = 3 })
				ownershipKickActive = false
				return
			end

			local mode = selectedKickMode

			ownershipKickTask = task.spawn(function()
				local target = Players:FindFirstChild(targetName)
				if not target then ownershipKickActive = false return end

				local ZERO_VECTOR = Vector3.new(0, 0, 0)
				local HIDDEN_CF = CFrame.new(0, 1e9, 0)

				if mode == "vizer Ownership Kick(80+ fps)" or mode == "vizer UPGRADED Ownership Kick" then
					local myChar = LocalPlayer.Character
					local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
					if not myRoot then ownershipKickActive = false return end

					local savedPos = myRoot.CFrame
					local dragging = false
					local grabStartTime = 0
					local checkStartTime = 0
					local currentFPS = 60

					local fpsConn = RunService.RenderStepped:Connect(function(dt) currentFPS = 1 / dt end)
					table.insert(ownershipKickConnections, fpsConn)

					local bodyPos, bodyGyro

					local function cleanupBodies()
						pcall(function()
							if bodyPos then bodyPos:Destroy() bodyPos = nil end
							if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
						end)
					end

					local function createBodies(targetRoot, pos)
						cleanupBodies()
						for _, v in pairs(targetRoot:GetChildren()) do
							if v:IsA("BodyPosition") or v:IsA("BodyGyro") then v:Destroy() end
						end
						bodyPos = Instance.new("BodyPosition")
						bodyPos.MaxForce = Vector3.new(9e9, 9e9, 9e9)
						bodyPos.D = 100
						bodyPos.Position = pos
						bodyPos.Parent = targetRoot

						bodyGyro = Instance.new("BodyGyro")
						bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
						bodyGyro.D = 100
						bodyGyro.CFrame = CFrame.new(pos)
						bodyGyro.Parent = targetRoot
					end

					while ownershipKickActive do
						local currentTarget = selectedPlrName and Players:FindFirstChild(selectedPlrName)
						if not currentTarget or not currentTarget.Character or not currentTarget.Parent then
							cleanupBodies() break
						end

						myChar = LocalPlayer.Character
						myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
						local tChar = currentTarget.Character
						local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
						local tHum = tChar and tChar:FindFirstChild("Humanoid")

						if tRoot and tHum and tHum.Health > 0 and myRoot then
							if not dragging then
								myRoot.CFrame = tRoot.CFrame * CFrame.new(0, 0, 3)
								cleanupBodies()
								checkStartTime = 0
								pcall(function()
									tHum.PlatformStand = true
									tHum.Sit = true
									SetNetworkOwner:FireServer(tRoot, tRoot.CFrame)
									SetNetworkOwner:FireServer(tRoot, tRoot.CFrame)
									DestroyGrabLine:FireServer(tRoot)
								end)
								myRoot.AssemblyLinearVelocity = ZERO_VECTOR
								myRoot.AssemblyAngularVelocity = ZERO_VECTOR
								if grabStartTime == 0 then grabStartTime = tick() end
								if tick() - grabStartTime > 0.15 then
									dragging = true
									grabStartTime = 0
									checkStartTime = tick()
									local lockPos = savedPos * CFrame.new(5, customKickHeight, 4)
									createBodies(tRoot, lockPos.Position)
								end
							else
								myRoot.CFrame = savedPos
								local lockPos = savedPos * CFrame.new(5, customKickHeight, 4)
								myRoot.AssemblyLinearVelocity = ZERO_VECTOR
								myRoot.AssemblyAngularVelocity = ZERO_VECTOR
								if bodyPos and bodyPos.Parent then
									bodyPos.Position = lockPos.Position
									if bodyGyro then bodyGyro.CFrame = lockPos end
								else
									createBodies(tRoot, lockPos.Position)
								end
								tHum.PlatformStand = true
								pcall(function()
									if currentFPS > 200 then
										SetNetworkOwner:FireServer(tRoot, lockPos)
										SetNetworkOwner:FireServer(tRoot, lockPos)
										DestroyGrabLine:FireServer(tRoot)
									elseif currentFPS >= 155 then
										for _ = 1, 3 do SetNetworkOwner:FireServer(tRoot, lockPos) end
										DestroyGrabLine:FireServer(tRoot)
									else
										for _ = 1, 4 do SetNetworkOwner:FireServer(tRoot, lockPos) end
										DestroyGrabLine:FireServer(tRoot)
									end
								end)
								if checkStartTime > 0 and tick() - checkStartTime > 0.15 then
									local dist = (tRoot.Position - lockPos.Position).Magnitude
									if dist > 10 then
										dragging = false
										grabStartTime = 0
										checkStartTime = 0
										cleanupBodies()
										myRoot.CFrame = tRoot.CFrame * CFrame.new(0, 0, 3)
									else
										checkStartTime = tick()
									end
								end
							end
						else
							dragging = false
							grabStartTime = 0
							checkStartTime = 0
							cleanupBodies()
						end
						RunService.Heartbeat:Wait()
					end

					cleanupBodies()
					if myRoot then myRoot.CFrame = savedPos end

				elseif mode == "Ownership Kick fast" or mode == "Ownership Kick For Exploiter" then
					local myChar = LocalPlayer.Character
					local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
					if not myRoot then ownershipKickActive = false return end

					local savedPos = myRoot.CFrame
					local isGrabbing = false
					local startTime = nil
					local lastPalletTime = 0
					local currentTargetRoot = nil
					local attachments = {}

					local function cleanupPhysicsObjects()
						isGrabbing = false
						currentTargetRoot = nil
						for _, v in pairs(attachments) do
							if v then pcall(function() v:Destroy() end) end
						end
						attachments = {}
					end

					local function isTargetAlive()
						if not target or not target.Parent then return false end
						local char = target.Character
						if not char then return false end
						local hum = char:FindFirstChild("Humanoid")
						if not hum or hum.Health <= 0 then return false end
						local root = char:FindFirstChild("HumanoidRootPart")
						if not root then return false end
						if root ~= currentTargetRoot then currentTargetRoot = root end
						return true
					end

					local MyToys = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
					local pallet = MyToys and MyToys:FindFirstChild("PalletLightBrown")
					if not pallet and LocalPlayer.CanSpawnToy.Value then
						pcall(function()
							SpawnToyRemoteFunction:InvokeServer("PalletLightBrown", HIDDEN_CF, Vector3.new(0, -90, 0))
						end)
						task.wait(0.5)
						MyToys = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
						pallet = MyToys and MyToys:FindFirstChild("PalletLightBrown")
					end
					local soundPart = pallet and pallet:FindFirstChild("SoundPart")
					if not soundPart then ownershipKickActive = false return end

					while ownershipKickActive and target do
						RunService.Stepped:Wait()
						if not isTargetAlive() then cleanupPhysicsObjects() task.wait(0.1) continue end

						myChar = LocalPlayer.Character
						myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
						if not myRoot then task.wait() continue end

						local tChar = target.Character
						local tHum = tChar and tChar:FindFirstChild("Humanoid")
						local tRoot = currentTargetRoot

						if tRoot then
							pcall(function()
								SetNetworkOwner:FireServer(tRoot, tRoot.CFrame)
								DestroyGrabLine:FireServer(tRoot)
							end)
						end

						if not isGrabbing then
							myRoot.CFrame = tRoot.CFrame * CFrame.new(0, -6, -10)
							myRoot.Velocity = ZERO_VECTOR
							tHum.PlatformStand = true
							tHum.Sit = false
							if not startTime then startTime = tick() end
							if tick() - startTime > 0.05 then
								isGrabbing = true
								startTime = nil
								myRoot.CFrame = savedPos
								myRoot.Velocity = ZERO_VECTOR
								local att0 = Instance.new("Attachment", tRoot)
								local att1 = Instance.new("Attachment", myRoot)
								att1.CFrame = CFrame.new(0, customKickHeight, 0)
								local ap = Instance.new("AlignPosition", tRoot)
								ap.Attachment0 = att0
								ap.Attachment1 = att1
								ap.MaxForce = math.huge
								ap.MaxVelocity = math.huge
								ap.Responsiveness = 200
								ap.ApplyAtCenterOfMass = true
								local ao = Instance.new("AlignOrientation", tRoot)
								ao.Attachment0 = att0
								ao.Attachment1 = att1
								ao.MaxTorque = math.huge
								ao.Responsiveness = 200
								attachments.att0 = att0
								attachments.att1 = att1
								attachments.ap = ap
								attachments.ao = ao
								tHum:ChangeState(Enum.HumanoidStateType.Physics)
							end
						else
							if attachments.att1 then attachments.att1.CFrame = CFrame.new(0, customKickHeight, 0) end
							if not isTargetAlive() then cleanupPhysicsObjects() task.wait(0.1) continue end
							tRoot = currentTargetRoot
							pcall(function()
								SetNetworkOwner:FireServer(tRoot, tRoot.CFrame)
								DestroyGrabLine:FireServer(tRoot)
							end)
							local currentTime = tick()
							if currentTime - lastPalletTime >= 0.02 then
								lastPalletTime = currentTime
								soundPart.CFrame = tRoot.CFrame * CFrame.new(0, 2, 0)
								pcall(function() SetNetworkOwner:FireServer(soundPart, soundPart.CFrame) end)
								task.wait()
								soundPart.CFrame = HIDDEN_CF
							end
						end
						task.wait()
					end
					cleanupPhysicsObjects()
					if myRoot and savedPos then myRoot.CFrame = savedPos end
				end
			end)
		end,
	})
end

-- 3. Loop Kick Blob
do
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local GE = ReplicatedStorage:WaitForChild("GrabEvents")
	local REMOTE_DELAY = 0.002

	local loopKickBlobActive = false
	local loopKickBlobTask = nil

	BlobMethods:AddToggle("LoopKickBlob", {
		Text = "Loop Kick Blob",
		Default = false,
		Tooltip = "Требует чтобы ты сидел на Blobman",
		Callback = function(Value)
			loopKickBlobActive = Value
			if not Value and loopKickBlobTask then
				task.cancel(loopKickBlobTask)
				loopKickBlobTask = nil
				return
			end

			local targetName = selectedPlrName
			if not targetName then
				Library:Notify({ Title = "Error", Description = "Select target first!", Time = 3 })
				loopKickBlobActive = false
				return
			end

			loopKickBlobTask = task.spawn(function()
				local lastRemote = 0
				local function BlobGrabKickHard()
					local target = Players:FindFirstChild(targetName)
					if not target then loopKickBlobActive = false return end

					local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
					local hum = char:WaitForChild("Humanoid")
					local seat = hum.SeatPart
					if not seat or seat.Parent.Name ~= "CreatureBlobman" then
						Library:Notify({ Title = "Error", Description = "Sit on Blobman first!", Time = 3 })
						loopKickBlobActive = false
						return
					end

					local blob = seat.Parent
					local blobRoot = blob:FindFirstChild("HumanoidRootPart") or blob.PrimaryPart
					local scriptObj = blob:WaitForChild("BlobmanSeatAndOwnerScript")
					local CG = scriptObj:WaitForChild("CreatureGrab")
					local CD = scriptObj:WaitForChild("CreatureDrop")
					local R_Det = blob:WaitForChild("RightDetector")

					local savedPos = blobRoot.CFrame
					local dragging = false
					local grabStartTime = 0

					while loopKickBlobActive do
						local currentTarget = Players:FindFirstChild(targetName)
						if not currentTarget then break end

						char = LocalPlayer.Character
						hum = char and char:FindFirstChild("Humanoid")
						seat = hum and hum.SeatPart
						if not seat or seat.Parent.Name ~= "CreatureBlobman" then break end

						blob = seat.Parent
						blobRoot = blob:FindFirstChild("HumanoidRootPart") or blob.PrimaryPart

						local tChar = currentTarget.Character
						local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
						local tHum = tChar and tChar:FindFirstChild("Humanoid")

						if tRoot and tHum and tHum.Health > 0 and blobRoot then
							tRoot.Velocity = Vector3.zero

							if not dragging then
								blobRoot.CFrame = tRoot.CFrame
								blobRoot.Velocity = Vector3.zero
								if tick() - lastRemote >= REMOTE_DELAY then
									lastRemote = tick()
									pcall(function()
										tHum.PlatformStand = true
										tHum.Sit = true
										GE.SetNetworkOwner:FireServer(tRoot, blobRoot.CFrame)
										GE.DestroyGrabLine:FireServer(tRoot)
									end)
								end
								if grabStartTime == 0 then grabStartTime = tick() end
								if tick() - grabStartTime > 0.35 then
									dragging = true
									grabStartTime = 0
									blobRoot.CFrame = savedPos
									blobRoot.Velocity = Vector3.zero
								end
							else
								blobRoot.CFrame = savedPos
								blobRoot.Velocity = Vector3.zero
								local lockPos = savedPos * CFrame.new(0, customKickHeight, 0)
								tRoot.CFrame = lockPos
								tHum.PlatformStand = true
								tHum.Sit = true
								if tick() - lastRemote >= REMOTE_DELAY then
									lastRemote = tick()
									pcall(function()
										GE.SetNetworkOwner:FireServer(tRoot, lockPos)
										GE.DestroyGrabLine:FireServer(tRoot)
										local weld = R_Det:FindFirstChild("RightWeld") or R_Det:FindFirstChildWhichIsA("Weld")
										if weld then
											CD:FireServer(weld)
											CG:FireServer(R_Det, tRoot, weld)
										end
									end)
								end
							end
						else
							dragging = false
							grabStartTime = 0
						end
						RunService.Heartbeat:Wait()
					end
					if blobRoot then
						blobRoot.CFrame = savedPos
						blobRoot.Velocity = Vector3.zero
					end
				end
				task.spawn(BlobGrabKickHard)
			end)
		end,
	})
end

-- 4. vizer (grab + blob) — Classic Kick
do
	local blobKickActive = false
	local blobKickTask = nil

	BlobMethods:AddToggle("BlobKickGrab", {
		Text = "vizer (grab + blob)",
		Default = false,
		Callback = function(Value)
			blobKickActive = Value
			if not Value and blobKickTask then
				task.cancel(blobKickTask)
				blobKickTask = nil
				return
			end

			if not selectedKickPlayer then
				Library:Notify({ Title = "Error", Description = "Select target first!", Time = 3 })
				blobKickActive = false
				return
			end

			blobKickTask = task.spawn(function()
				local myChar = LocalPlayer.Character
				local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
				if not myRoot then blobKickActive = false return end

				local savedPos = myRoot.CFrame
				local dragging = false
				local grabStartTime = 0

				while blobKickActive do
					local target = selectedKickPlayer
					if not target or not target.Parent or not target.Character then break end

					local tChar = target.Character
					local tRoot = tChar:FindFirstChild("HumanoidRootPart")
					local tHum = tChar:FindFirstChild("Humanoid")
					local seat = myChar and myChar.Humanoid.SeatPart

					if tRoot and tHum and tHum.Health > 0 then
						tRoot.AssemblyLinearVelocity = Vector3.zero
						tRoot.Velocity = Vector3.zero

						if seat then
							local blobman = seat.Parent
							local remoteFolder = blobman:FindFirstChild("BlobmanSeatAndOwnerScript")
							local grab = remoteFolder and remoteFolder:FindFirstChild("CreatureGrab")
							local drop = remoteFolder and remoteFolder:FindFirstChild("CreatureDrop")
							local L_Det = blobman:FindFirstChild("LeftDetector")
							local R_Det = blobman:FindFirstChild("RightDetector")
							local L_Weld = L_Det and (L_Det:FindFirstChild("LeftWeld") or L_Det:FindFirstChild("RigidConstraint"))
							local R_Weld = R_Det and (R_Det:FindFirstChild("RightWeld") or R_Det:FindFirstChild("RigidConstraint"))

							if grab and drop and L_Weld and R_Weld then
								pcall(function()
									grab:FireServer(L_Det, tRoot, L_Weld)
									grab:FireServer(R_Det, tRoot, R_Weld)
									drop:FireServer(L_Weld, tRoot)
									drop:FireServer(R_Weld, tRoot)
								end)
							end
						end

						if not dragging then
							myRoot.CFrame = tRoot.CFrame
							pcall(function()
								tHum.PlatformStand = true
								SetNetworkOwner:FireServer(tRoot, myRoot.CFrame)
								if CreateGrabLine then
									CreateGrabLine:FireServer(tRoot, Vector3.zero, tRoot.Position, false)
								end
							end)
							if grabStartTime == 0 then grabStartTime = tick() end
							if tick() - grabStartTime > 0.3 then
								dragging = true
								grabStartTime = 0
							end
						else
							local lockPos = savedPos * CFrame.new(0, customKickHeight, 0)
							myRoot.CFrame = savedPos
							tRoot.CFrame = lockPos
							pcall(function()
								tHum.PlatformStand = true
								SetNetworkOwner:FireServer(tRoot, lockPos)
								DestroyGrabLine:FireServer(tRoot)
								if CreateGrabLine then
									CreateGrabLine:FireServer(tRoot, Vector3.zero, tRoot.Position, false)
								end
							end)
						end
					else
						dragging = false
						grabStartTime = 0
					end
					RunService.Heartbeat:Wait()
				end
				if myRoot and savedPos then myRoot.CFrame = savedPos end
			end)
		end,
	})
end

-- 5. Destroy Gucci (sit)
do
	local destroyGucciActive = false
	local ATTEMPT_TIME = 0.9
	local COOLDOWN = 0.45

	local function getHumanoid(player)
		local character = player and player.Character
		return character and character:FindFirstChildOfClass("Humanoid")
	end

	TargetBox:AddToggle("DestroyGucciSit", {
		Text = "Destroy Gucci (sit)",
		Default = false,
		Callback = function(Value)
			destroyGucciActive = Value
			if not Value then return end

			local target = selectedKickPlayer
			if not target then
				Library:Notify({ Title = "Error", Description = "Select target first!", Time = 3 })
				destroyGucciActive = false
				return
			end

			task.spawn(function()
				while destroyGucciActive do
					local tgt = selectedKickPlayer
					if not tgt or not tgt.Parent then
						destroyGucciActive = false
						break
					end

					local myCharacter = LocalPlayer.Character
					local myHumanoid = myCharacter and myCharacter:FindFirstChildOfClass("Humanoid")
					local myRoot = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")
					local targetHumanoid = getHumanoid(tgt)

					if not myHumanoid or not myRoot or not targetHumanoid then
						task.wait(0.5)
						continue
					end

					local targetSeat = targetHumanoid.SeatPart

					if targetSeat and targetSeat:IsA("Seat") then
						local returnCFrame = myRoot.CFrame
						if myHumanoid.SeatPart ~= targetSeat then
							local magnetConn = RunService.Stepped:Connect(function()
								if not destroyGucciActive or not targetSeat.Parent or not myRoot.Parent then return end
								myRoot.CFrame = targetSeat.CFrame
								myRoot.AssemblyLinearVelocity = Vector3.zero
								if targetSeat.Parent and targetSeat.Parent.PrimaryPart then
									targetSeat.Parent.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
									targetSeat.Parent.PrimaryPart.AssemblyAngularVelocity = Vector3.zero
								end
							end)

							local deadline = os.clock() + ATTEMPT_TIME
							while destroyGucciActive and os.clock() < deadline and targetSeat.Parent and myHumanoid.SeatPart ~= targetSeat do
								pcall(function() targetSeat:Sit(myHumanoid) end)
								task.wait()
							end

							magnetConn:Disconnect()

							if myHumanoid.SeatPart == targetSeat then
								task.wait(0.15)
								myHumanoid.Sit = false
								myHumanoid.Jump = true
								task.wait(0.05)
								if myRoot.Parent then
									myRoot.CFrame = returnCFrame
									myRoot.AssemblyLinearVelocity = Vector3.zero
								end
								Library:Notify({ Title = "Success", Description = "Vehicle removed!", Time = 3 })
								task.wait(0.5)
							else
								if myRoot.Parent then myRoot.CFrame = returnCFrame end
							end
						end
					end
					task.wait(COOLDOWN)
				end
			end)
		end,
	})
end

-- 6. Ragdoll Spam (Better) — Pallet Ragdoll
do
	local ragdollSpamActive = false

	TargetBox:AddToggle("RagdollSpamHammer", {
		Text = "Ragdoll Spam (Better)",
		Default = false,
		Callback = function(Value)
			ragdollSpamActive = Value
			if not Value then return end

			if not selectedKickPlayer then
				Library:Notify({ Title = "Error", Description = "Select target first!", Time = 3 })
				ragdollSpamActive = false
				return
			end

			task.spawn(function()
				local rSpawn = MenuToys:WaitForChild("SpawnToyRemoteFunction")
				local rDestroy = MenuToys:WaitForChild("DestroyToy")
				local rOwner = GrabEvents:WaitForChild("SetNetworkOwner")

				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					task.spawn(function()
						rSpawn:InvokeServer("PalletLightBrown", LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0), Vector3.zero)
					end)
				end

				local toyFolder = workspace:WaitForChild(LocalPlayer.Name .. "SpawnedInToys", 5)
				if not toyFolder then return end
				local palletModel = toyFolder:WaitForChild("PalletLightBrown", 5)
				if not palletModel then return end
				local palletPart = palletModel:WaitForChild("SoundPart", 5)
				if not palletPart then return end

				rOwner:FireServer(palletPart, palletPart.CFrame)

				local hammerGoingDown = true
				local segmentIndex = 0
				local lastOwnerTime = tick()

				while ragdollSpamActive and palletModel.Parent do
					RunService.Heartbeat:Wait()
					local targetChar = selectedKickPlayer and selectedKickPlayer.Character
					local targetHrp = targetChar and targetChar:FindFirstChild("HumanoidRootPart")

					if targetHrp then
						if tick() - lastOwnerTime > 1.0 then
							rOwner:FireServer(palletPart, palletPart.CFrame)
							lastOwnerTime = tick()
						end
						local startPos = targetHrp.Position + Vector3.new(0, 50000, 0)
						local endPos = targetHrp.Position
						if hammerGoingDown then
							segmentIndex = segmentIndex + 1
							local alpha = segmentIndex / 8
							local nextPos = startPos:Lerp(endPos, alpha)
							palletPart.CFrame = CFrame.new(nextPos)
							palletPart.AssemblyLinearVelocity = Vector3.new(0, -50000, 0)
							if segmentIndex >= 8 then
								palletPart.AssemblyLinearVelocity = Vector3.new(0, -10, 0)
								hammerGoingDown = false
							end
						else
							palletPart.CFrame = CFrame.new(startPos)
							palletPart.AssemblyLinearVelocity = Vector3.zero
							segmentIndex = 0
							hammerGoingDown = true
						end
					else
						if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
							palletPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
							palletPart.AssemblyLinearVelocity = Vector3.zero
						end
					end
				end

				if rDestroy and palletModel then rDestroy:FireServer(palletModel) end
			end)
		end,
	})
end

-- 7. Pallet Ragdoll (Invis)
do
	local palletRagdollActive = false

	TargetBox:AddToggle("PalletRagdollInvis", {
		Text = "Pallet Ragdoll (Invis)",
		Default = false,
		Callback = function(Value)
			palletRagdollActive = Value

			if not Value then
				if getgenv().ragdollSteppedConn then
					getgenv().ragdollSteppedConn:Disconnect()
					getgenv().ragdollSteppedConn = nil
				end
				if getgenv().palletCacheConn then
					getgenv().palletCacheConn:Disconnect()
					getgenv().palletCacheConn = nil
				end
				local pallet = getgenv().PalletForRagdoll
				if pallet and pallet.Parent then
					pcall(function() DestroyToy:FireServer(pallet) end)
				end
				getgenv().PalletForRagdoll = nil
				return
			end

			if not selectedKickPlayer then
				Library:Notify({ Title = "Error", Description = "Select target first!", Time = 3 })
				palletRagdollActive = false
				return
			end

			getgenv().palletRagdollActive = true
			local toysFolder = workspace:WaitForChild(LocalPlayer.Name .. "SpawnedInToys")
			local lpName = LocalPlayer.Name

			local function clearAttackLoop()
				if getgenv().ragdollSteppedConn then
					getgenv().ragdollSteppedConn:Disconnect()
					getgenv().ragdollSteppedConn = nil
				end
			end

			getgenv().palletCacheConn = toysFolder.ChildAdded:Connect(function(child)
				if not getgenv().palletRagdollActive then return end
				if child.Name ~= "PalletLightBrown" and child.Name ~= "PalletForRagdoll" then return end

				local soundPart = child:WaitForChild("SoundPart", 3)
				if not soundPart then return end

				pcall(function()
					SetNetworkOwner:FireServer(soundPart, soundPart.CFrame)
					DestroyGrabLine:FireServer(soundPart)
				end)

				local partOwner = soundPart:WaitForChild("PartOwner", 1)
				if partOwner and partOwner.Value == lpName then
					for _, v in pairs(child:GetChildren()) do
						if v:IsA("BasePart") then
							v.CanCollide = false
							v.CanQuery = false
							v.Transparency = 1
						end
					end
					child.Name = "PalletForRagdoll"
					getgenv().PalletForRagdoll = child

					local strikePhase = false
					getgenv().ragdollSteppedConn = RunService.Stepped:Connect(function()
						if not getgenv().palletRagdollActive or not child.Parent then
							clearAttackLoop() return
						end
						local tChar = selectedKickPlayer and selectedKickPlayer.Character
						local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
						local tHum = tChar and tChar:FindFirstChildOfClass("Humanoid")

						if tRoot and tHum and soundPart.Parent and tHum.Health > 0 then
							local ragdolledVal = tHum:FindFirstChild("Ragdolled")
							local isRagdolled = ragdolledVal and ragdolledVal.Value or false
							if not isRagdolled then
								strikePhase = not strikePhase
								if strikePhase then
									soundPart.CFrame = tRoot.CFrame * CFrame.new(0, 2, 0)
									soundPart.AssemblyLinearVelocity = Vector3.new(0, -9e5, 0)
								else
									soundPart.CFrame = tRoot.CFrame * CFrame.new(0, -1, 0)
									soundPart.AssemblyLinearVelocity = Vector3.new(0, 9e5, 0)
								end
							else
								soundPart.CFrame = CFrame.new(0, 9e9, 0)
								soundPart.AssemblyLinearVelocity = Vector3.zero
							end
						else
							soundPart.CFrame = CFrame.new(0, 9e9, 0)
							soundPart.AssemblyLinearVelocity = Vector3.zero
						end
					end)
				else
					pcall(function() DestroyToy:FireServer(child) end)
				end
			end)

			local function spawnNewPallet()
				if not getgenv().palletRagdollActive then return end
				if getgenv().PalletForRagdoll and getgenv().PalletForRagdoll.Parent then return end
				local c = LocalPlayer.Character
				local h = c and c:FindFirstChild("HumanoidRootPart")
				if not h then return end
				task.spawn(function()
					pcall(function()
						SpawnToyRemoteFunction:InvokeServer("PalletLightBrown", h.CFrame * CFrame.new(0, 10, 20), Vector3.zero)
					end)
				end)
			end

			spawnNewPallet()
		end,
	})
end

-- 8. Remove Anti Kick
do
	local antiAntiKickActive = false

	TargetBox:AddToggle("RemoveAntiKick", {
		Text = "Remove Anti Kick",
		Default = false,
		Callback = function(Value)
			antiAntiKickActive = Value
			if not Value then return end

			task.spawn(function()
				local function invis_touch(part, cf)
					SetNetworkOwner:FireServer(part, cf)
				end

				local function CheckAndYeet(toy)
					local part = toy:FindFirstChild("SoundPart")
					if part then
						invis_touch(part, part.CFrame)
						if part:FindFirstChild("PartOwner") and part.PartOwner.Value == LocalPlayer.Name then
							part.CFrame = CFrame.new(0, 1000, 0)
						end
					end
				end

				while antiAntiKickActive do
					local target = selectedKickPlayer
					if target then
						local spawned = workspace:FindFirstChild(target.Name .. "SpawnedInToys")
						if spawned then
							for _, name in ipairs({"NinjaKunai", "NinjaShuriken", "AntiKick", "ToolPickaxe", "ToolPencil", "ToolDiggingForkRusty", "ToolCleaver"}) do
								local toy = spawned:FindFirstChild(name)
								if toy then CheckAndYeet(toy) end
							end
						end
					end
					task.wait(0.1)
				end
			end)
		end,
	})
end

-- 9. Anti-AntiKick (2 modes)
do
	local modeOptions = { "Anti-AntiKick CLICK", "Anti-AntiKick BYPASS" }
	local selectedAntiMode = "Anti-AntiKick CLICK"
	local antiActive = false
	local antiTask = nil

	TargetBox:AddDropdown("AntiAntiKickMode", {
		Values = modeOptions,
		Default = "Anti-AntiKick CLICK",
		Text = "Anti-AntiKick Mode",
		Callback = function(Value) selectedAntiMode = Value end,
	})

	TargetBox:AddToggle("AntiAntiKick", {
		Text = "Enable Anti-AntiKick",
		Default = false,
		Callback = function(Value)
			antiActive = Value
			if antiTask then task.cancel(antiTask) antiTask = nil end
			if not Value then return end

			local function sno(part)
				if part then pcall(function() SetNetworkOwner:FireServer(part, part.CFrame) end) end
			end

			local function CheckNetworkOwnerOnPart(part)
				local owner = part:FindFirstChild("PartOwner")
				return owner and owner.Value == LocalPlayer.Name
			end

			local function GetMagnitude(p1, p2)
				if not (p1 and p2) then return math.huge end
				return (p1.Position - p2.Position).Magnitude
			end

			if selectedAntiMode == "Anti-AntiKick CLICK" then
				antiTask = task.spawn(function()
					while antiActive do
						task.wait()
						local TargetPLR = selectedKickPlayer
						if not TargetPLR then continue end
						local TargetInv = workspace:FindFirstChild(TargetPLR.Name .. "SpawnedInToys")
						if not TargetInv then continue end
						local Root = TargetPLR.Character and TargetPLR.Character:FindFirstChild("HumanoidRootPart")
						local FirePlayerPart = Root and Root:FindFirstChild("FirePlayerPart")
						if not FirePlayerPart then continue end
						for _, v in pairs(TargetInv:GetChildren()) do
							local StickyPart = v:FindFirstChild("StickyPart")
							if StickyPart then
								if StickyPart.CanQuery then
									for _, part in pairs(v:GetChildren()) do
										if part:IsA("BasePart") then
											part.CanCollide = false
											part.CanTouch = false
											part.CanQuery = false
										end
									end
								end
								if not CheckNetworkOwnerOnPart(StickyPart) then sno(StickyPart) end
							end
						end
					end
				end)
			elseif selectedAntiMode == "Anti-AntiKick BYPASS" then
				local StickyEvent = ReplicatedStorage:FindFirstChild("PlayerEvents") and ReplicatedStorage.PlayerEvents:FindFirstChild("StickyPartEvent")
				antiTask = task.spawn(function()
					while antiActive do
						task.wait()
						local TargetPLR = selectedKickPlayer
						if not TargetPLR then continue end
						local TargetInv = workspace:FindFirstChild(TargetPLR.Name .. "SpawnedInToys")
						if not TargetInv then continue end
						local Root = TargetPLR.Character and TargetPLR.Character:FindFirstChild("HumanoidRootPart")
						local FirePlayerPart = Root and Root:FindFirstChild("FirePlayerPart")
						if not FirePlayerPart then continue end
						local myChar = LocalPlayer.Character
						local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
						local myFirePart = myHRP and myHRP:FindFirstChild("FirePlayerPart")
						for _, v in pairs(TargetInv:GetChildren()) do
							local StickyPart = v:FindFirstChild("StickyPart")
							if StickyPart then
								local StickyWeld = StickyPart:FindFirstChild("StickyWeld")
								if not StickyWeld then continue end
								if StickyPart.CanQuery then
									for _, part in pairs(v:GetChildren()) do
										if part:IsA("BasePart") then
											part.CanCollide = false
											part.CanTouch = false
											part.CanQuery = false
										end
									end
								end
								if myFirePart and StickyWeld.Part1 == myFirePart and GetMagnitude(FirePlayerPart, StickyPart) > 7 then
									continue
								elseif not CheckNetworkOwnerOnPart(StickyPart) then
									sno(StickyPart)
								else
									if StickyEvent then
										pcall(function()
											StickyEvent:FireServer(StickyPart, FirePlayerPart, CFrame.new(0, -10, 5))
										end)
									end
								end
							end
						end
					end
				end)
			end
		end,
	})
end

-- 10. Destroy Server
do
	ServerBox:AddDropdown("DestroyHeight", {
		Values = { "Spawn", "Heaven" },
		Default = "Spawn",
		Text = "Destroy Height",
		Callback = function(Value) selectedHeight = Value end,
	})

	local function getAllPlayers()
		local players = {}
		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer then table.insert(players, plr) end
		end
		return players
	end

	local function spamOwnership(hrp)
		if hrp then pcall(function() SetNetworkOwner:FireServer(hrp, hrp.CFrame) end) end
	end

	local function teleportToPlayer(myHrp, targetHrp)
		if not myHrp or not targetHrp then return end
		pcall(function()
			myHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 5, 5)
			myHrp.AssemblyLinearVelocity = Vector3.zero
		end)
	end

	local function destroyLineOnPlayer(hrp)
		pcall(function()
			if CreateGrabLine then CreateGrabLine:FireServer(hrp, CFrame.new(0, 1e9, 0)) end
			task.wait()
			DestroyGrabLine:FireServer(hrp)
		end)
	end

	local lineLagEnabled = false
	local lineLagThread = nil

	local function startLineLag()
		if lineLagEnabled then return end
		lineLagEnabled = true
		lineLagThread = task.spawn(function()
			while lineLagEnabled do
				local spawnLocation = Workspace:FindFirstChild("SpawnLocation") or Workspace:FindFirstChild("Spawn") or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
				if spawnLocation then
					local randomX = math.random(-1e9, 1e9)
					local randomZ = math.random(-1e9, 1e9)
					local directions = { CFrame.new(randomX, 0, randomZ), CFrame.new(-randomX, 0, -randomZ), CFrame.new(randomX, 0, -randomZ), CFrame.new(-randomX, 0, randomZ) }
					for _, pos in pairs(directions) do
						if CreateGrabLine then CreateGrabLine:FireServer(spawnLocation, pos) end
					end
				end
				task.wait()
			end
		end)
	end

	local function stopLineLag()
		lineLagEnabled = false
		if lineLagThread then task.cancel(lineLagThread) lineLagThread = nil end
	end

	ServerBox:AddButton({
		Text = "Destroy Server",
		Func = function()
			task.spawn(function()
				local height = (selectedHeight == "Heaven") and 1e9 or 35
				startLineLag()
				task.wait(1)
				local players = getAllPlayers()
				if #players == 0 then stopLineLag() return end
				local myChar = LocalPlayer.Character
				local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
				if not myHrp then stopLineLag() return end

				local playerData = {}
				for _, plr in ipairs(players) do
					local char = plr.Character
					local hrp = char and char:FindFirstChild("HumanoidRootPart")
					if hrp then table.insert(playerData, { player = plr, hrp = hrp }) end
				end

				for _, data in ipairs(playerData) do
					teleportToPlayer(myHrp, data.hrp)
					task.wait(0.2)
					spamOwnership(data.hrp)
					task.wait()
				end

				local radius = 40
				local angleStep = (math.pi * 2) / math.max(#playerData, 1)
				for idx, data in ipairs(playerData) do
					local angle = (idx - 1) * angleStep
					local x = math.cos(angle) * radius
					local z = math.sin(angle) * radius
					pcall(function()
						data.hrp.CFrame = CFrame.new(x, height, z)
						data.hrp.AssemblyLinearVelocity = Vector3.zero
					end)
					local bp = Instance.new("BodyPosition")
					bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
					bp.P = 40000000
					bp.Position = Vector3.new(x, height, z)
					bp.Parent = data.hrp
					task.delay(2, function() pcall(function() bp:Destroy() end) end)
					task.wait()
				end

				for i = 1, 8 do
					for _, data in ipairs(playerData) do destroyLineOnPlayer(data.hrp) end
					task.wait(0.3)
				end
			end)
		end,
	})

	ServerBox:AddButton({
		Text = "Stop Lag",
		Func = function() stopLineLag() end,
	})
end

-- ============================================================================
-- ============================================================================
--                         ЧАСТЬ 2: VIZER V2 KICK FUNCTIONS
--                (добавлено внизу — старые функции выше не удалены)
-- ============================================================================
-- ============================================================================

-- Новая таргет-система для V2 (свой список)
_selectedPlayersV2 = {}
_killRoundIndexV2 = 1
SelectedPlayerV2 = nil

local function getPlayerListV2()
	local list = {}
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer then
			table.insert(list, plr.DisplayName .. " (@" .. plr.Name .. ")")
		end
	end
	return list
end

local function extractUsernameV2(entry)
	return entry and entry:match("@([%w_]+)")
end

local function getSelectedPlayerV2()
	for _, un in ipairs(_selectedPlayersV2) do
		local p = Players:FindFirstChild(un)
		if p then return p end
	end
	return nil
end

RunService.Heartbeat:Connect(function()
	if #_selectedPlayersV2 == 0 then
		SelectedPlayerV2 = nil
		return
	end
	if _killRoundIndexV2 > #_selectedPlayersV2 then
		_killRoundIndexV2 = 1
	end
	SelectedPlayerV2 = _selectedPlayersV2[_killRoundIndexV2]
	_killRoundIndexV2 = _killRoundIndexV2 % #_selectedPlayersV2 + 1
end)

-- Dropdown для V2 (внизу в блоке Extra Methods)
local PlayerDropdownV2 = V2Methods:AddDropdown("PlayerDropdownV2", {
	Values = getPlayerListV2(),
	Default = 1,
	Multi = true,
	Text = "Select Target (V2)",
	Tooltip = "Цель для новых методов V2",
	Searchable = true,
	MaxVisibleDropdownItems = 10,
	Callback = function(v)
		_selectedPlayersV2 = {}
		for entry, state in pairs(v) do
			if state then
				local un = extractUsernameV2(entry)
				if un then
					local plr = Players:FindFirstChild(un)
					if plr and plr ~= LocalPlayer then
						table.insert(_selectedPlayersV2, un)
					end
				end
			end
		end
		_killRoundIndexV2 = 1
		if #_selectedPlayersV2 == 0 then
			notify("V2 Target", "No targets selected", 2)
		else
			notify("V2 Target set", #_selectedPlayersV2 .. " targeted", 3)
		end
	end,
})

Players.PlayerAdded:Connect(function() task.wait(0.5) PlayerDropdownV2:SetValues(getPlayerListV2()) end)
Players.PlayerRemoving:Connect(function(plr)
	task.wait(0.5)
	for i, un in ipairs(_selectedPlayersV2) do
		if un == plr.Name then table.remove(_selectedPlayersV2, i) break end
	end
	PlayerDropdownV2:SetValues(getPlayerListV2())
end)

-- ============================================================
-- V2 #1: BlobKick System (главный loop)
-- ============================================================
BlobkickList = {}
BlobKillList = {}
BlobBringList = {}
BKA = false
BKLA = false

local function checkgrabV2(itm)
	for _, prt in pairs(itm:GetChildren()) do
		if prt:IsA("BasePart") and prt:FindFirstChild("PartOwner") and prt.PartOwner.Value == LocalPlayer.Name then
			return true
		end
	end
	return false
end

local blobV2 = nil

function BlobKickV2()
	while true do
		local gotsomeone = false
		for _, plr in pairs(Players:GetPlayers()) do
			if BlobkickList[plr.UserId] or BlobKillList[plr.UserId] or BKA or BKLA then
				local j, h
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					j = LocalPlayer.Character.HumanoidRootPart.CFrame
					h = LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity
				end

				local continue1 = nil
				if BlobKillList[plr.UserId] then continue1 = "Kill"
				elseif BlobkickList[plr.UserId] then continue1 = "Kick"
				else
					if BKA then continue1 = "Kick" end
					if BKLA then continue1 = "Kill" end
				end

				if plr ~= LocalPlayer and continue1 then
					local continue = false
					if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
						if plr.Character.HumanoidRootPart.Massless then
							if plr.Character.Humanoid.SeatPart then continue = true end
						else
							continue = true
						end
					end

					local smegma = true
					while smegma and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
						and plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
						and plr.Character:FindFirstChild("Humanoid")
						and plr.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and continue do

						gotsomeone = true
						continue = false

						local vel = plr.Character.HumanoidRootPart.AssemblyLinearVelocity
						if vel.Magnitude > 10000 then vel = Vector3.zero end
						if plr.Character.HumanoidRootPart.CFrame.Position.Magnitude > 1000000 then continue = false end

						if LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.SeatPart
							and LocalPlayer.Character.Humanoid.SeatPart.Parent
							and LocalPlayer.Character.Humanoid.SeatPart.Parent.Name == "CreatureBlobman" then
							blobV2 = LocalPlayer.Character.Humanoid.SeatPart.Parent

							if (plr.Character.HumanoidRootPart.CFrame.Position - LocalPlayer.Character.HumanoidRootPart.CFrame.Position
								+ LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity).Magnitude > 30 then
								LocalPlayer.Character.HumanoidRootPart.CFrame =
									plr.Character.HumanoidRootPart.CFrame +
									(plr.Character.HumanoidRootPart.AssemblyLinearVelocity / math.pi)
								LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity =
									plr.Character.HumanoidRootPart.AssemblyLinearVelocity
							end

							if continue1 == "Kick" then
								if checkgrabV2(plr.Character) and blobV2:FindFirstChild("RightDetector")
									and blobV2.RightDetector:FindFirstChild("RightWeld")
									and blobV2:FindFirstChild("BlobmanSeatAndOwnerScript")
									and blobV2.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab") then
									plr.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 1e10, 0)
									DestroyGrabLine:FireServer(plr.Character.HumanoidRootPart)
									blobV2.BlobmanSeatAndOwnerScript.CreatureGrab:FireServer(
										blobV2.RightDetector,
										plr.Character.HumanoidRootPart,
										blobV2.RightDetector.RightWeld
									)
								else
									SetNetworkOwner:FireServer(
										plr.Character.HumanoidRootPart,
										plr.Character.HumanoidRootPart.CFrame
									)
								end
							else
								if blobV2:FindFirstChild("RightDetector")
									and blobV2.RightDetector:FindFirstChild("RightWeld")
									and blobV2:FindFirstChild("BlobmanSeatAndOwnerScript") then
									plr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
									blobV2.BlobmanSeatAndOwnerScript.CreatureGrab:FireServer(
										blobV2.RightDetector,
										plr.Character.HumanoidRootPart,
										blobV2.RightDetector.RightWeld
									)
									if blobV2.BlobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease") then
										blobV2.BlobmanSeatAndOwnerScript.CreatureRelease:FireServer(
											blobV2.RightDetector.RightWeld,
											plr.Character.HumanoidRootPart
										)
									end
								end
							end
						elseif continue then
							if LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.SeatPart then
								LocalPlayer.Character.Humanoid.Sit = false
							end
							if blobV2 and blobV2:FindFirstChild("VehicleSeat") then
								if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
									blobV2.VehicleSeat:Sit(LocalPlayer.Character.Humanoid)
								end
							else
								blobV2 = nil
								local folderV2 = workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
								if folderV2 then
									for _, itm in pairs(folderV2:GetChildren()) do
										if itm.Name == "CreatureBlobman" and itm:FindFirstChild("VehicleSeat") then
											blobV2 = itm
										end
									end
								end
								if blobV2 then
									blobV2.VehicleSeat:Sit(LocalPlayer.Character.Humanoid)
								end
							end
						end
						task.wait(0.1)
					end

					if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and j then
						LocalPlayer.Character.HumanoidRootPart.CFrame = j
						LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = h
					end
				end
			end
		end

		if not gotsomeone and blobV2 then
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
				and LocalPlayer.Character.Humanoid.SeatPart
				and LocalPlayer.Character.Humanoid.SeatPart.Parent == blobV2 then
				LocalPlayer.Character.Humanoid.Sit = false
			end
			task.wait()
			if blobV2 and blobV2:FindFirstChild("HumanoidRootPart") then
				blobV2.HumanoidRootPart.CFrame = CFrame.new(0, 1e15, 0)
			end
		end
		task.wait()
	end
end
task.spawn(BlobKickV2)

-- ============================================================
-- V2 #2: Loop Kill (performKill — TP + kill)
-- ============================================================
local KillHBV2 = nil
local HEIGHT_LIMIT_V2 = 100000
local TELEPORT_OFFSET_V2 = Vector3.new(6, -18.5, 0)

local CameraAnchorV2 = {}
CameraAnchorV2.__index = CameraAnchorV2
function CameraAnchorV2.new() return setmetatable({}, CameraAnchorV2) end
function CameraAnchorV2:attach(cf)
	self:detach()
	local p = Instance.new("Part")
	p.Name, p.Size, p.Transparency, p.Anchored, p.CanCollide, p.CFrame, p.Parent =
		"CameraAnchorV2", Vector3.new(0.2, 0.2, 0.2), 1, true, false, cf, Workspace
	self.part = p
	local cam = Workspace.CurrentCamera
	cam.CameraType = Enum.CameraType.Custom
	cam.CameraSubject = p
end
function CameraAnchorV2:detach()
	if self.part then self.part:Destroy() self.part = nil end
	local cam = Workspace.CurrentCamera
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("Humanoid") then
		cam.CameraSubject = char.Humanoid
	else
		cam.CameraType = Enum.CameraType.Custom
	end
end
local cameraAnchorV2 = CameraAnchorV2.new()

local function isTooHighV2(plr)
	local hrp = getHRP(plr)
	return not hrp or hrp.Position.Y > HEIGHT_LIMIT_V2
end

local function setNoCollideCharV2(char)
	for _, part in pairs(char:GetDescendants()) do
		if part:IsA("BasePart") then part.CanCollide = false end
	end
end

local function saveOriginalPosV2()
	local char = LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if hrp then char:SetAttribute("OriginalPositionV2", hrp:GetPivot()) end
end

local function getOriginalPosV2()
	local char = LocalPlayer.Character
	return char and char:GetAttribute("OriginalPositionV2") or nil
end

local function scheduleReturnHomeV2()
	local originalPos = getOriginalPosV2()
	if not originalPos then return end
	local conn
	conn = RunService.Heartbeat:Connect(function()
		local char = LocalPlayer.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if hrp then
			hrp:PivotTo(originalPos)
			if getgenv().originalFallenHeightV2 then
				Workspace.FallenPartsDestroyHeight = getgenv().originalFallenHeightV2
			end
			char:SetAttribute("SavingOriginalPosV2", false)
		end
		cameraAnchorV2:detach()
		conn:Disconnect()
	end)
end

local function modifyTargetV2(root, hum)
	if not (root and hum) or hum.Health <= 0 then return end
	hum.Sit = false
	hum:ChangeState(Enum.HumanoidStateType.Running)
	hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
	hum:ChangeState(Enum.HumanoidStateType.GettingUp)

	local plr = Players:GetPlayerFromCharacter(hum.Parent)
	if plr and plr:FindFirstChild("IsHeld") then plr.IsHeld.Value = false end
	local rag = hum:FindFirstChild("Ragdolled")
	if rag then rag.Value = false end

	local bv = Instance.new("BodyVelocity")
	local bav = Instance.new("BodyAngularVelocity")
	bv.MaxForce = Vector3.new(1e7, -1e7, 1e7)
	bv.P = 1e6
	bv.Velocity = Vector3.new(math.random(-500, 50), -50, math.random(-50, 50))
	bav.MaxTorque = Vector3.new(-1e7, -1e7, -1e7)
	bav.P = 1e6
	bav.AngularVelocity = Vector3.new(math.random(-500, 300), math.random(-300, 300), math.random(-500, 500))
	bv.Parent = root
	bav.Parent = root
	hum.BreakJointsOnDeath = false
	hum:ChangeState(Enum.HumanoidStateType.Dead)
	task.delay(2, function()
		if bv.Parent then bv:Destroy() end
		if bav.Parent then bav:Destroy() end
	end)
end

local function performKillV2()
	if not SelectedPlayerV2 then return end
	local target = Players:FindFirstChild(SelectedPlayerV2)
	local tChar = target and target.Character
	local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
	local tHum = tChar and tChar:FindFirstChild("Humanoid")
	local tHead = tChar and tChar:FindFirstChild("Head")
	if not (target and tRoot and tHum and tHead) then return end
	if isTooHighV2(target) then return end
	if target:FindFirstChild("InPlot") and target.InPlot.Value then return end
	if tHum:GetState() == Enum.HumanoidStateType.Dead then return end

	local char = LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if not (char and hrp) then return end
	if not char:GetAttribute("SavingOriginalPosV2") then saveOriginalPosV2() end
	char:SetAttribute("SavingOriginalPosV2", true)
	getgenv().originalFallenHeightV2 = Workspace.FallenPartsDestroyHeight
	Workspace.FallenPartsDestroyHeight = 0 / 0

	local originalPos = getOriginalPosV2()
	if originalPos then cameraAnchorV2:attach(originalPos) end

	hrp:PivotTo(CFrame.new(tRoot.Position + TELEPORT_OFFSET_V2))
	setNoCollideCharV2(tChar)
	SetNetworkOwner:FireServer(tRoot, tRoot.CFrame)
	task.wait(0.05)
	DestroyGrabLine:FireServer(tRoot)
	task.wait(0.05)
	if tHead:FindFirstChild("PartOwner") and tHead.PartOwner.Value == LocalPlayer.Name then
		task.wait(0.05)
		modifyTargetV2(tRoot, tHum)
	end
	scheduleReturnHomeV2()
end

V2Methods:AddToggle("LoopKillToggleV2", {
	Text = "[V2] Loop Kill",
	Default = false,
	Tooltip = "Спам TP + убийство (метод V2)",
	Callback = function(v)
		if v then
			if KillHBV2 then KillHBV2:Disconnect() end
			KillHBV2 = RunService.Heartbeat:Connect(performKillV2)
		else
			if KillHBV2 then KillHBV2:Disconnect() KillHBV2 = nil end
			cameraAnchorV2:detach()
		end
	end,
})

-- ============================================================
-- V2 #3: Loop Grab Kick (executeGrabKick через BodyPosition)
-- ============================================================
local GrabKickHBV2 = nil
local LoopGrabKickOnV2 = false

local function executeGrabKickV2()
	if not SelectedPlayerV2 then return end
	local targetPlayer = Players:FindFirstChild(SelectedPlayerV2)
	if not targetPlayer or not targetPlayer.Character then return end

	local char = LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	local head = char and char:FindFirstChild("Head")
	if not (char and hrp and head) then return end

	local targetChar = targetPlayer.Character
	local targetHrp = targetChar:FindFirstChild("HumanoidRootPart")
	local targetHead = targetChar:FindFirstChild("Head")
	local Hum = targetChar:FindFirstChild("Humanoid")
	if not (targetHrp and targetHead and Hum) or Hum.Health == 0 then return end

	local BodyPos = targetHrp:FindFirstChild("BodyPosition")
	local BodyGyro = targetHrp:FindFirstChild("BodyGyro")
	if not BodyPos then
		BodyPos = Instance.new("BodyPosition")
		BodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		BodyPos.Parent = targetHrp
		BodyPos.P = 50000
		BodyPos.D = 1000
	end
	if not BodyGyro then
		BodyGyro = Instance.new("BodyGyro")
		BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		BodyGyro.Parent = targetHrp
		BodyGyro.P = 50000
		BodyGyro.D = 1000
	end

	BodyPos.Position = head.Position + Vector3.new(0, 18, 0)
	BodyGyro.CFrame = hrp.CFrame

	SetNetworkOwner:FireServer(targetHrp, targetHrp.CFrame)
	SetNetworkOwner:FireServer(targetHead, targetHead.CFrame)
	DestroyGrabLine:FireServer(targetHrp)
	DestroyGrabLine:FireServer(targetHead)

	if (targetHrp.Position - hrp.Position).Magnitude > 35 then
		local oldCF = char:GetPivot()
		repeat
			if not LoopGrabKickOnV2 then break end
			char:PivotTo(targetHrp.CFrame * CFrame.new(0, 0, -10))
			SetNetworkOwner:FireServer(targetHrp, targetHrp.CFrame)
			SetNetworkOwner:FireServer(targetHead, targetHead.CFrame)
			task.wait()
		until (targetHrp.Position - hrp.Position).Magnitude <= 35
			or targetHead:FindFirstChild("PartOwner")
			or not LoopGrabKickOnV2
		char:PivotTo(oldCF)
	end
end

V2Methods:AddToggle("LoopGrabKickV2", {
	Text = "[V2] Loop Grab Kick",
	Default = false,
	Tooltip = "Граб + BodyPosition кик (метод V2)",
	Callback = function(v)
		LoopGrabKickOnV2 = v
		if v then
			if GrabKickHBV2 then GrabKickHBV2:Disconnect() end
			GrabKickHBV2 = RunService.Heartbeat:Connect(function()
				if LoopGrabKickOnV2 then executeGrabKickV2() end
			end)
		else
			if GrabKickHBV2 then GrabKickHBV2:Disconnect() GrabKickHBV2 = nil end
			if SelectedPlayerV2 then
				local tp = Players:FindFirstChild(SelectedPlayerV2)
				if tp and tp.Character then
					local tHrp = tp.Character:FindFirstChild("HumanoidRootPart")
					if tHrp then
						if tHrp:FindFirstChild("BodyPosition") then tHrp.BodyPosition:Destroy() end
						if tHrp:FindFirstChild("BodyGyro") then tHrp.BodyGyro:Destroy() end
					end
				end
			end
		end
	end,
})

-- ============================================================
-- V2 #4: Blob Kill / Blob Kick (по спискам)
-- ============================================================
V2Methods:AddToggle("BlobLoopKillV2", {
	Text = "[V2] [BLOB] Loop Kill",
	Default = false,
	Callback = function(state)
		local p = getSelectedPlayerV2()
		if not p then notify("V2 Error", "Select target first", 3) return end
		if state then
			BlobKillList[p.UserId] = "kill"
			BlobkickList[p.UserId] = nil
		else
			BlobKillList[p.UserId] = nil
		end
	end,
})

V2Methods:AddToggle("BlobLoopKickV2", {
	Text = "[V2] [BLOB] Loop Kick",
	Default = false,
	Callback = function(state)
		local p = getSelectedPlayerV2()
		if not p then notify("V2 Error", "Select target first", 3) return end
		if state then
			BlobkickList[p.UserId] = true
			BlobKillList[p.UserId] = nil
		else
			BlobkickList[p.UserId] = nil
		end
	end,
})

-- ============================================================
-- V2 #5: Kill All / Kick All (Server Box)
-- ============================================================
ServerBox:AddToggle("BlobKillAllV2", {
	Text = "[V2] Kill All",
	Default = false,
	Tooltip = "Убить всех игроков (метод V2)",
	Callback = function(state) BKLA = state end,
})

ServerBox:AddToggle("BlobKickAllV2", {
	Text = "[V2] Kick All",
	Default = false,
	Tooltip = "Кикнуть всех игроков (метод V2)",
	Callback = function(state) BKA = state end,
})

-- ============================================================
-- V2 #6: Player Assist (Bring / Switch / TP to Water)
-- ============================================================
local function BringPlayerV2(name)
	if not name or not Players:FindFirstChild(name) then return end
	local target = Players:FindFirstChild(name)
	local targetChar = target.Character
	if not targetChar then return end

	local targetHum = FWC(targetChar, "Humanoid")
	local targetHRP = FWC(targetChar, "HumanoidRootPart")
	local targetHead = FWC(targetChar, "Head")
	if not (targetHum and targetHRP and targetHead) or targetHum.Health == 0 then return end

	local myChar = LocalPlayer.Character
	local myHRP = FWC(myChar, "HumanoidRootPart")
	local myHead = FWC(myChar, "Head")
	if not (myHRP and myHead) then return end

	local lastPos = targetHRP.Position
	local backup = myHRP.CFrame
	local function Stop(b) myHRP.CFrame = b end

	while not (targetHead:FindFirstChild("PartOwner") and targetHead.PartOwner.Value == LocalPlayer.Name) do
		if targetHRP.Parent and targetHum.Health ~= 0 then
			if not LocalPlayer:FindFirstChild("IsHeld") or not LocalPlayer.IsHeld.Value then
				myHRP.CFrame = targetHRP.CFrame
					+ ((targetHRP.Position - lastPos) * LocalPlayer:GetNetworkPing() * 25)
					+ Vector3.new(0, -3.5, 0)
				SetNetworkOwner:FireServer(targetHRP, myHRP.CFrame)
				task.wait()
			else
				while myHead:FindFirstChild("PartOwner") do
					Struggle:FireServer(LocalPlayer)
					task.wait()
				end
			end
		else
			Stop(backup) return
		end
	end

	myHRP.CFrame = backup
	task.defer(function()
		local t0 = tick()
		while targetHead and targetHead.Parent
			and targetHead:FindFirstChild("PartOwner")
			and targetHead.PartOwner.Value == LocalPlayer.Name
			and tick() - t0 < 5 do
			targetHRP.CFrame = myHRP.CFrame + myHRP.CFrame.LookVector * 3
			targetHRP.AssemblyLinearVelocity = Vector3.zero
			task.wait()
		end
		DestroyGrabLine:FireServer(targetHRP)
	end)
end

local function TPPlayerToWaterV2(name)
	if not name or not Players:FindFirstChild(name) then return end
	local target = Players:FindFirstChild(name)
	local targetChar = target.Character
	if not targetChar then return end

	local targetHum = FWC(targetChar, "Humanoid")
	local targetHRP = FWC(targetChar, "HumanoidRootPart")
	local targetHead = FWC(targetChar, "Head")
	if not (targetHum and targetHRP and targetHead) or targetHum.Health == 0 then return end
	if target:FindFirstChild("InPlot") and target.InPlot.Value then return end

	local myChar = LocalPlayer.Character
	local myHRP = FWC(myChar, "HumanoidRootPart")
	local myHead = FWC(myChar, "Head")
	if not (myHRP and myHead) then return end

	local lastPos = targetHRP.Position
	local backup = myHRP.CFrame
	while not (targetHead:FindFirstChild("PartOwner") and targetHead.PartOwner.Value == LocalPlayer.Name) do
		if targetHRP.Parent and targetHum.Health ~= 0 then
			if not LocalPlayer.IsHeld.Value then
				myHRP.CFrame = targetHRP.CFrame
					+ ((targetHRP.Position - lastPos) * LocalPlayer:GetNetworkPing() * 25)
					+ Vector3.new(0, -3.5, 0)
				SetNetworkOwner:FireServer(targetHRP, myHRP.CFrame)
				task.wait()
			else
				while myHead:FindFirstChild("PartOwner") do
					Struggle:FireServer(LocalPlayer)
					task.wait()
				end
			end
		else
			myHRP.CFrame = backup return
		end
	end
	myHRP.CFrame = backup

	local waterPos = Vector3.new(320, -61, 423)
	task.defer(function()
		local t0 = tick()
		while targetHead and targetHead.Parent
			and targetHead:FindFirstChild("PartOwner")
			and targetHead.PartOwner.Value == LocalPlayer.Name
			and tick() - t0 < 5 do
			targetHRP.CFrame = CFrame.new(waterPos)
			for _, prt in pairs(targetChar:GetChildren()) do
				if prt:IsA("Part") then
					prt.Velocity = Vector3.zero
					prt.CanTouch = false
				end
			end
			task.wait()
		end
	end)
	task.wait(0.15)
	DestroyGrabLine:FireServer(targetHRP)
end

V2Methods:AddButton({
	Text = "[V2] Bring (Grab)",
	Func = function()
		local p = getSelectedPlayerV2()
		if not p then return notify("V2 Error", "Select target", 3) end
		task.spawn(BringPlayerV2, p.Name)
	end,
})

V2Methods:AddButton({
	Text = "[V2] TP to Water",
	Func = function()
		local p = getSelectedPlayerV2()
		if not p then return notify("V2 Error", "Select target", 3) end
		task.spawn(TPPlayerToWaterV2, p.Name)
	end,
})

-- ============================================================
-- V2 #7: Blobman Orbit
-- ============================================================
local kickLoopActiveV2 = false
local OrbitRadiusV2 = 10
local OrbitSpeedV2 = 2
local OrbitRotationV2 = 0
local HUGE_VECTOR_V2 = Vector3.new(math.huge, math.huge, math.huge)

local OrbitConnectionV2, OrbitConnectionV2b

local function findMountedBlobV2()
	local char = LocalPlayer.Character
	local hum = char and char:FindFirstChild("Humanoid")
	return (hum and hum.SeatPart and hum.SeatPart.Parent.Name == "CreatureBlobman") and hum.SeatPart.Parent or nil
end

local function blob_kickV2(blob, hrp, rl, v)
	local detec = blob:FindFirstChild(rl .. "Detector")
	if not detec then return end
	local script = blob:FindFirstChild("BlobmanSeatAndOwnerScript")
	if not script then return end
	local grab = script:FindFirstChild("CreatureGrab")
	local drop = script:FindFirstChild("CreatureDrop")
	local rel = script:FindFirstChild("CreatureRelease")
	local weld = detec:FindFirstChild(rl .. "Weld")
	pcall(function()
		if v == "Grab" then grab:FireServer(detec, hrp, weld) end
		if v == "Drop" then drop:FireServer(weld) end
		if v == "Release" then rel:FireServer(weld, hrp) end
	end)
end

V2Orbit:AddToggle("BlobOrbitToggleV2", {
	Text = "[V2] Blobman Orbit",
	Default = false,
	Callback = function(state)
		kickLoopActiveV2 = state
		OrbitRotationV2 = 0
		if not state then
			if OrbitConnectionV2 then OrbitConnectionV2:Disconnect() end
			if OrbitConnectionV2b then OrbitConnectionV2b:Disconnect() end
			return
		end
		local targetPlr = getSelectedPlayerV2()
		if not targetPlr then return end
		local MyBlob = findMountedBlobV2()
		if not MyBlob then return end
		local blobRoot = MyBlob:FindFirstChild("HumanoidRootPart") or MyBlob.PrimaryPart
		local targetHRP = targetPlr.Character and targetPlr.Character:FindFirstChild("HumanoidRootPart")
		if not blobRoot or not targetHRP then return end

		if targetHRP:FindFirstChild("OrbitBodyPosV2") then targetHRP.OrbitBodyPosV2:Destroy() end
		local bodyPos = Instance.new("BodyPosition")
		bodyPos.Name = "OrbitBodyPosV2"
		bodyPos.MaxForce = HUGE_VECTOR_V2
		bodyPos.Position = targetHRP.Position + Vector3.new(0, 20, 0)
		bodyPos.P = 5000
		bodyPos.D = 100
		bodyPos.Parent = targetHRP

		OrbitConnectionV2 = RunService.Heartbeat:Connect(function()
			if not kickLoopActiveV2 then return end
			local B = findMountedBlobV2()
			if not B then return end
			local br = B:FindFirstChild("HumanoidRootPart") or B.PrimaryPart
			local tP = getSelectedPlayerV2()
			local tH = tP and tP.Character and tP.Character:FindFirstChild("HumanoidRootPart")
			if not tH then return end
			local bp = tH:FindFirstChild("OrbitBodyPosV2")
			if not bp then return end
			OrbitRotationV2 = OrbitRotationV2 + OrbitSpeedV2
			br.CFrame = CFrame.new(bp.Position) * CFrame.Angles(0, math.rad(OrbitRotationV2), 0) * CFrame.new(OrbitRadiusV2, 0, 0)
			br.Velocity = Vector3.zero
		end)
		OrbitConnectionV2b = RunService.RenderStepped:Connect(function()
			if not kickLoopActiveV2 then return end
			local B = findMountedBlobV2()
			if not B then return end
			local br = B:FindFirstChild("HumanoidRootPart") or B.PrimaryPart
			local tP = getSelectedPlayerV2()
			local tH = tP and tP.Character and tP.Character:FindFirstChild("HumanoidRootPart")
			if not tH then return end
			local bp = tH:FindFirstChild("OrbitBodyPosV2")
			if not bp then return end
			br.CFrame = CFrame.new(br.Position, bp.Position)
		end)

		task.spawn(function()
			while kickLoopActiveV2 do
				local tPlr = getSelectedPlayerV2()
				if not tPlr then break end
				local char = tPlr.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				local hum = char and char:FindFirstChild("Humanoid")
				local MyBlob = findMountedBlobV2()
				if not (MyBlob and hrp and hum and hum.Health > 0) then
					task.wait(0.1)
					continue
				end
				for i = 1, 8 do
					blob_kickV2(MyBlob, hrp, "Left", "Grab")
					blob_kickV2(MyBlob, hrp, "Right", "Grab")
					task.wait(0.001)
					blob_kickV2(MyBlob, hrp, "Left", "Drop")
					blob_kickV2(MyBlob, hrp, "Right", "Drop")
				end
				task.wait(0.01)
			end
		end)
	end,
})

V2Orbit:AddSlider("OrbitRadiusV2", {
	Text = "Orbit Radius",
	Default = 10,
	Min = 5,
	Max = 35,
	Rounding = 0,
	Callback = function(v) OrbitRadiusV2 = v end,
})
V2Orbit:AddSlider("OrbitSpeedV2", {
	Text = "Orbit Speed",
	Default = 2,
	Min = 1,
	Max = 40,
	Rounding = 0,
	Callback = function(v) OrbitSpeedV2 = v end,
})

-- ============================================================
-- UI SETTINGS
-- ============================================================
local MenuGroup = Tabs["UI Settings"]:AddGroupbox({ Side = "Left", Name = "Menu", IconName = "wrench" })

MenuGroup:AddToggle("KeybindMenuOpen", {
	Default = Library.KeybindFrame.Visible,
	Text = "Open Keybind Menu",
	Callback = function(value) Library.KeybindFrame.Visible = value end,
})
MenuGroup:AddToggle("ShowCustomCursor", {
	Text = "Custom Cursor",
	Default = Library.ShowCustomCursor,
	Callback = function(Value) Library.ShowCustomCursor = Value end,
})
MenuGroup:AddToggle("AlwaysOnTop", {
	Text = "Always On Top",
	Default = Window.AlwaysOnTop,
	Callback = function(Value) Window:SetAlwaysOnTop(Value) end,
})
MenuGroup:AddSlider("UICornerSlider", {
	Text = "Corner Radius",
	Default = Library.CornerRadius,
	Min = 0,
	Max = 20,
	Rounding = 0,
	Callback = function(value) Window:SetCornerRadius(value) end,
})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })
MenuGroup:AddButton("Unload", function() Library:Unload() end)

Library.ToggleKeybind = Options.MenuKeybind

-- ============================================================
-- ADDONS
-- ============================================================
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("MyScriptHub")
SaveManager:SetFolder("MyScriptHub/specific-game")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()

Library:OnUnload(function() print("Unloaded!") end)
