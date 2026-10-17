print('discord.gg/25ms was here')
local _Players = game:GetService('Players')
local u3 = loadstring(game:HttpGet('http://you.whimper.xyz/sources/blitz/orionx'))()
local _Debris = game:GetService('Debris')
local _Workspace = game:GetService('Workspace')
local _Lighting = game:GetService('Lighting')
local _TweenService = game:GetService('TweenService')
local _UserInputService = game:GetService('UserInputService')
local _ReplicatedStorage = game:GetService('ReplicatedStorage')
local _ReplicatedFirst = game:GetService('ReplicatedFirst')
local _ContextActionService = game:GetService('ContextActionService')
local _RunService = game:GetService('RunService')
local _VirtualUser = game:GetService('VirtualUser')
local _CharacterEvents = _ReplicatedStorage:WaitForChild('CharacterEvents')
local _LocalPlayer = _Players.LocalPlayer
local _PlayerGui = _LocalPlayer:WaitForChild('PlayerGui')
_LocalPlayer:GetMouse()

local u17 = _Workspace:WaitForChild(_LocalPlayer.Name .. 'SpawnedInToys')
local _InPlot = _LocalPlayer:WaitForChild('InPlot')
local _ToysLimitCap = _LocalPlayer:WaitForChild('ToysLimitCap')

SpawnToyRF = _ReplicatedStorage:WaitForChild('MenuToys'):WaitForChild('SpawnToyRemoteFunction')
DeleteToyRE = _ReplicatedStorage:WaitForChild('MenuToys'):WaitForChild('DestroyToy')
BuyToy = _ReplicatedStorage:WaitForChild('MenuToys'):WaitForChild('BuyToyRemoteFunction')
BombEvents = _ReplicatedStorage:WaitForChild('BombEvents')
typeAnimation = _ReplicatedFirst.Typing.Type
flailAnimation = _ReplicatedFirst.ThrowPlayers.Flail

local _CreateGrabLine = _ReplicatedStorage:WaitForChild('GrabEvents'):WaitForChild('CreateGrabLine')
local _DestroyGrabLine = _ReplicatedStorage:WaitForChild('GrabEvents'):WaitForChild('DestroyGrabLine')
local _SetNetworkOwner = _ReplicatedStorage:WaitForChild('GrabEvents'):WaitForChild('SetNetworkOwner')

_ReplicatedStorage:WaitForChild('GrabEvents'):WaitForChild('ExtendGrabLine')

local _RagdollRemote = _CharacterEvents:WaitForChild('RagdollRemote')

ChatTypingBoard = _CharacterEvents:WaitForChild('ChatTyping')

local u24

if _ReplicatedStorage:FindFirstChild('DefaultChatSystemChatEvents') and _ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild('SayMessageRequest') then
	u24 = _ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest
else
	u24 = nil
end

local _UpdateLineColorsEvent = _ReplicatedStorage:WaitForChild('DataEvents'):WaitForChild('UpdateLineColorsEvent')
local _IsHeld = _LocalPlayer:WaitForChild('IsHeld')
local _PlayerScripts = _LocalPlayer:WaitForChild('PlayerScripts')
local u28 = nil
local _Struggle = _CharacterEvents:WaitForChild('Struggle')

anticreatelinelocalscript = _PlayerScripts:WaitForChild('CharacterAndBeamMove')

_LocalPlayer.Changed:Connect(function(p30)
	if p30 == 'userId' or p30 == 'UserId' then
		while true do end
	else
		return
	end
end)

function Type(p31)
	u24:FireServer(p31, 'All')
end

local function u33(p32)
	u3:MakeNotification({
		Name = 'Bliz_T HUB',
		Content = p32,
		Image = 'rbxassetid://16570630989',
		Time = 5,
	})
end

function IsSolara()
	if getexecutorname then
		local v34 = getexecutorname()

		if v34 and string.find(v34, 'Solara') then
			return true
		end
	end
end
function IsMobile()
	if _LocalPlayer.PlayerGui:FindFirstChild('ContextActionGui') then
		return true
	end
end

IsUsingSolara = IsSolara()

if IsUsingSolara then
	print('new proximity promp created!')

	getgenv().fireproximityprompt = function(p35)
		if p35.Name ~= 'ProximityPrompt' then
			error('retard: ' .. Obj.Name)
		else
			local _HoldDuration = p35.HoldDuration
			local _MaxActivationDistance = p35.MaxActivationDistance

			p35.MaxActivationDistance = math.huge
			p35.HoldDuration = 0

			p35:InputHoldBegin()
			p35:InputHoldEnd()

			p35.HoldDuration = _HoldDuration
			p35.MaxActivationDistance = _MaxActivationDistance
		end
	end
end

local u38 = {}

function checkadminData(p39)
	if table.find(u38, p39) then
		return true
	end
end

spawnToyThread = coroutine.create(function()
	while true do
		repeat
			local v40 = coroutine.yield()
		until typeof(v40) == 'table'

		SpawnToyRF:InvokeServer(unpack(v40))
	end
end)

function SpawnToy(p41)
	coroutine.resume(spawnToyThread, p41)
end

local function u49(p42, p43)
	if typeof(p42) == 'Instance' and p42.Parent then
		local _LastTimeRankUpdate = p42:GetAttribute('LastTimeRankUpdate')

		if not _LastTimeRankUpdate or _LastTimeRankUpdate and 300 <= os.clock() - _LastTimeRankUpdate then
			local v45, v46 = pcall(function()
				return p42:GetRankInGroup(p43)
			end)
			local _, v47 = pcall(function()
				return p42:GetRoleInGroup(p43)
			end)
			local v48 = not v45 and 'Common' or v46

			if v48 == 255 then
				p42:SetAttribute('Rank', 'Leader')
			elseif v48 == 4 then
				if v47 == 'High Rank Admin' then
					p42:SetAttribute('Rank', 'High Rank Admin')
				end
			elseif v48 == 3 then
				p42:SetAttribute('Rank', 'Low Rank Admin')
			elseif v48 == 2 then
				p42:SetAttribute('Rank', 'Goon')
			elseif v48 == 0 or v48 == 1 then
				p42:SetAttribute('Rank', 'Common')
			end

			p42:SetAttribute('LastTimeRankUpdate', os.clock())
		end

		local _ = p42.GetAttribute
	end
end
local function u54(p50)
	if typeof(p50) ~= 'Instance' then
		p50 = nil
	elseif p50:IsA('Model') and p50:FindFirstChildOfClass('Humanoid') and _Players:GetPlayerFromCharacter(p50) then
		p50 = _Players:GetPlayerFromCharacter(p50)
	elseif not p50:IsA('Player') then
		return
	end

	local v51 = false

	if p50 then
		local v52 = u49(p50, 16168861)
		local v53 = (v52 == 'Leader' or v52 == 'High Rank Admin') and true or ((v52 == 'Low Rank Admin' or v52 == 'Goon') and true or v51)

		if checkadminData(p50.Name) and not u38[p50.Name].Protection then
			v53 = false
		end

		return v53
	end
end

function IsHoldingAdminPlayer()
	local _GrabParts = _Workspace:FindFirstChild('GrabParts')

	if _GrabParts and _GrabParts:FindFirstChild('GrabPart') and _GrabParts.GrabPart:FindFirstChild('WeldConstraint') then
		local _Part1 = _GrabParts.GrabPart.WeldConstraint.Part1

		if _Part1 and u54(_Part1.Parent) then
			return true
		end
	end
end
function WhatIsHolding(p57)
	if p57 and p57:FindFirstChild('GrabPart') and p57.GrabPart:FindFirstChild('WeldConstraint') then
		local _Part12 = p57.GrabPart.WeldConstraint.Part1

		if _Part12 and _Part12.Parent and _Part12.Parent:IsA('Model') then
			local _Parent = _Part12.Parent

			return _Players:GetPlayerFromCharacter(_Part12.Parent) and 'Player' or (_Parent:FindFirstChild('Pet') and 'Follow NPC' or 'Object')
		end
	end
end
function tableAlphabeticOrder(p60, p61)
	return p60:lower() < p61:lower()
end

local function u69(p62)
	local v63 = _Players
	local v64, v65, v66 = pairs(v63:GetPlayers())
	local v67 = {}

	while true do
		local v68

		v66, v68 = v64(v65, v66)

		if v66 == nil then
			break
		end
		if v68.UserId ~= _LocalPlayer.UserId then
			table.insert(v67, v68.Name .. ' ' .. '(' .. v68.DisplayName .. ')')
		end
	end

	table.sort(v67, tableAlphabeticOrder)
	p62:Refresh(v67, true)
end

local u70 = {}
local u71 = {}

local function u79(p72, p73)
	local v74, v75, v76 = pairs(p73)
	local v77 = {}

	while true do
		local v78

		v76, v78 = v74(v75, v76)

		if v76 == nil then
			break
		end
		if typeof(v78) == 'string' then
			table.insert(v77, v78)
		end
	end

	p72:Refresh(v77, true)
end
local function u87(p80)
	local v81 = _Players
	local v82, v83, v84 = pairs(v81:GetPlayers())
	local v85 = {}

	while true do
		local v86

		v84, v86 = v82(v83, v84)

		if v84 == nil then
			break
		end
		if v86.UserId ~= _LocalPlayer.UserId then
			table.insert(v85, v86.Name .. ' ' .. '(' .. v86.DisplayName .. ')')
		end
	end

	table.sort(v85, tableAlphabeticOrder)
	table.insert(v85, 1, _LocalPlayer.Name .. ' ' .. '(' .. _LocalPlayer.DisplayName .. ')')
	p80:Refresh(v85, true)
end

function lookAt(p88, p89)
	local _Unit = (p89 - p88).Unit
	local v91 = _Unit:Cross((Vector3.new(0, 1, 0)))
	local v92 = v91:Cross(_Unit)

	return CFrame.fromMatrix(p88, v91, v92)
end

local function u96(p93, p94, _)
	if p93 == 'Spawn Toy (TAB)' and p94 == Enum.UserInputState.Begin then
		local v95 = {
			_G.SelectedToy,
			_LocalPlayer.Character.CamPart.CFrame,
			Vector3.new(0, _LocalPlayer.Character.CamPart.Orientation.Y, 0),
		}

		SpawnToyRF:InvokeServer(unpack(v95))
	end
end

function teleportfunc()
	local v97 = _G.ControllingCreature or _LocalPlayer.Character
	local v98 = _G.ControllingCreature and 'Head' or (_LocalPlayer.Character and 'CamPart' or nil)
	local v99, v100 = _Workspace:FindPartOnRayWithIgnoreList(Ray.new(v97[v98].Position, _LocalPlayer.Character.CamPart.CFrame.lookVector * 5000), {v97})

	if v99 then
		v97.HumanoidRootPart.CFrame = CFrame.new(v100.X, v100.Y + 5, v100.Z)
	end
end

local function u103(p101, p102, _)
	if p101 == 'Teleport(Z)' and p102 == Enum.UserInputState.Begin then
		teleportfunc()
	end
end
local function u105(p104)
	if table.find(u71, p104) then
		return true
	end
end

local u106 = nil
local u107 = nil

Noclip2 = nil
Clip2 = nil

local function u113()
	if not u106 then
		u107 = false

		local function v112()
			if u107 == false and game.Players.LocalPlayer.Character ~= nil then
				local v108, v109, v110 = pairs(game.Players.LocalPlayer.Character:GetChildren())

				while true do
					local v111

					v110, v111 = v108(v109, v110)

					if v110 == nil then
						break
					end
					if v111:IsA('BasePart') and v111.CanCollide and v111.Name ~= floatName then
						v111.CanCollide = false
					end
				end
			end

			wait(0.21)
		end

		u106 = _RunService.Stepped:Connect(v112)
	end
end
local function u114()
	if not _G.NoclipToggle then
		if u106 then
			u106:Disconnect()

			u106 = nil
		end

		u107 = true
	end
end

function countToys(p115)
	local v116 = u17
	local v117, v118, v119 = pairs(v116:GetChildren())
	local v120 = 0

	while true do
		local v121

		v119, v121 = v117(v118, v119)

		if v119 == nil then
			break
		end
		if v121.Name == p115 then
			v120 = v120 + 1
		end
	end

	return v120
end
function CheckNetworkOwnerShipOnPlayer(p122, p123)
	if typeof(p122) == 'Instance' and (p122:IsA('Player') and p122.Character) and (p122.Character:FindFirstChild('Head') and (p122.Character.Head:FindFirstChild('PartOwner') and p122.Character.Head.PartOwner.Value == _LocalPlayer.Name)) then
		return not p123 and true or p122.Character.Head.PartOwner
	end
end
function CheckNetworkOwnerShipPermanentOnPlayer(p124, p125)
	if typeof(p124) == 'Instance' and (p124:IsA('Player') and p124.Character) and (p124.Character:FindFirstChild('HumanoidRootPart') and p124.Character.HumanoidRootPart:FindFirstChild('FirePlayerPart')) and (p124.Character.HumanoidRootPart.FirePlayerPart:FindFirstChild('PartOwner') and p124.Character.HumanoidRootPart.FirePlayerPart.PartOwner.Value == _LocalPlayer.Name) then
		return not p125 and true or p124.Character.HumanoidRootPart.FirePlayerPart.PartOwner
	end
end
function CheckNetworkOwnerShipOnPart(p126, p127)
	if typeof(p126) == 'Instance' and (p126:FindFirstChild('PartOwner') and p126.PartOwner.Value == _LocalPlayer.Name) then
		return not p127 and true or p126.PartOwner
	end
end
function SNOWship(p128)
	if p128 and typeof(p128) == 'Instance' then
		local v129 = _LocalPlayer:DistanceFromCharacter(p128.Position)

		if _LocalPlayer.Character and (_LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and v129 <= 30) then
			_SetNetworkOwner:FireServer(p128, lookAt(_LocalPlayer.Character.HumanoidRootPart.Position, p128.Position))
		end
	end
end
function IsPlayerInsideSafeZone(p130)
	if typeof(p130) == 'Instance' and (p130:IsA('Player') and p130:FindFirstChild('InPlot')) and p130.InPlot.Value then
		return true
	end
end
function IsPlayerFloating(p131)
	if typeof(p131) == 'Instance' and (p131:IsA('Player') and p131.Character) and (p131.Character:FindFirstChildOfClass('Humanoid') and p131.Character:FindFirstChildOfClass('Humanoid').FloorMaterial == Enum.Material.Air) then
		return true
	end
end
function CheckPlayerVelocity(p132)
	if typeof(p132) == 'Instance' and (p132:IsA('Player') and p132.Character) and p132.Character:FindFirstChild('HumanoidRootPart') then
		return p132.Character.HumanoidRootPart.Velocity.Magnitude
	end
end
function SNOWshipOnce(p133)
	local v134 = _LocalPlayer:DistanceFromCharacter(p133.Position)

	if _LocalPlayer.Character and _LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
		if CheckNetworkOwnerShipOnPart(p133) then
			return true
		end
		if v134 <= 30 then
			_SetNetworkOwner:FireServer(p133, lookAt(_LocalPlayer.Character.HumanoidRootPart.Position, p133.Position))
		end
	end
end
function SNOWshipTrack(p135)
	if p135.Parent and p135.Parent:IsA('Model') then
		local _Parent2 = p135.Parent
		local _OwnershipTrackConnected = _Parent2:GetAttribute('OwnershipTrackConnected')
		local _CreatedConnected2 = _Parent2:GetAttribute('CreatedConnected2')

		if _LocalPlayer.Character and _LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
			local v139 = _LocalPlayer:DistanceFromCharacter(p135.Position)

			if _CreatedConnected2 then
				if _OwnershipTrackConnected then
					return true
				end
				if v139 <= 30 then
					_SetNetworkOwner:FireServer(p135, lookAt(_LocalPlayer.Character.HumanoidRootPart.Position, p135.Position))
				end
			else
				_Parent2:SetAttribute('CreatedConnected2', true)
				print('Create Connection 2')
				_Parent2.DescendantAdded:Connect(function(p140)
					if p140.Name ~= 'PartOwner' or p140.Value ~= _LocalPlayer.Name then
						if p140.Name == 'PartOwner' and p140.Value ~= _LocalPlayer.Name then
							_Parent2:SetAttribute('OwnershipTrackConnected', false)
						end
					else
						_Parent2:SetAttribute('OwnershipTrackConnected', true)
					end
				end)
			end
		end
	end
end
function SNOWshipOnceAndDelete(p141)
	local v142 = _LocalPlayer:DistanceFromCharacter(p141.Position)
	local _Connected = p141:GetAttribute('Connected')
	local _CreatedConnected = p141:GetAttribute('CreatedConnected')

	if _LocalPlayer.Character and _LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
		if CheckNetworkOwnerShipOnPart(p141) then
			p141:SetAttribute('Connected', true)
			_DestroyGrabLine:FireServer(p141)

			if not _CreatedConnected then
				p141:SetAttribute('CreatedConnected', true)
				print('Create Connection')
				p141.ChildAdded:Connect(function(p145)
					if p145.Name == 'PartOwner' and p145.Value ~= _LocalPlayer.Name then
						p141:SetAttribute('Connected', false)
					end
				end)
			end
		elseif v142 <= 30 and not _Connected then
			_SetNetworkOwner:FireServer(p141, lookAt(_LocalPlayer.Character.HumanoidRootPart.Position, p141.Position))
		end
	end
end
function SNOWshipPlayer(p146, p147)
	if _LocalPlayer.Character and (_LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and typeof(p146) == 'Instance' and (p146:IsA('Player') and p146.Character)) and p146.Character:FindFirstChild('HumanoidRootPart') then
		local _HumanoidRootPart = p146.Character.HumanoidRootPart
		local v149 = _LocalPlayer:DistanceFromCharacter(_HumanoidRootPart.Position)

		if CheckNetworkOwnerShipOnPlayer(p146) then
			if type(p147) == 'function' then
				p147()
			end

			return true
		end
		if v149 <= 30 then
			_SetNetworkOwner:FireServer(_HumanoidRootPart, lookAt(_LocalPlayer.Character.HumanoidRootPart.Position, _HumanoidRootPart.Position))
		end
	end
end
function SNOWshipPermanentPlayer(p150, p151)
	if _LocalPlayer.Character and (_LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and typeof(p150) == 'Instance' and (p150:IsA('Player') and p150.Character)) and (p150.Character:FindFirstChild('HumanoidRootPart') and p150.Character.HumanoidRootPart:FindFirstChild('FirePlayerPart')) then
		local _FirePlayerPart = p150.Character.HumanoidRootPart.FirePlayerPart
		local v153 = _LocalPlayer:DistanceFromCharacter(_FirePlayerPart.Position)

		if type(p151) == 'function' then
			p151()
		end
		if v153 <= 30 then
			_SetNetworkOwner:FireServer(_FirePlayerPart, lookAt(_LocalPlayer.Character.HumanoidRootPart.Position, _FirePlayerPart.Position))

			return true
		end
	end
end
function GetPlayerCharacter()
	if _LocalPlayer.Character and (_LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and _LocalPlayer.Character:FindFirstChildOfClass('Humanoid')) then
		return _LocalPlayer.Character
	end
end

_G.TP_Priority = 0

function ChangeActivityPriority(p154)
	if _G.TP_Priority <= p154 then
		_G.TP_Priority = p154

		return true
	end
	if p154 == 0 then
		_G.TP_Priority = p154

		return true
	end
end
function TeleportPlayer(p155, p156)
	if (p156 == nil and 0 or p156) == _G.TP_Priority then
		local v157 = GetPlayerCharacter()

		if v157 and not _G.TeleportingToNetworkOwnership and typeof(p155) == 'CFrame' then
			local _HumanoidRootPart2 = v157.HumanoidRootPart
			local _Humanoid = v157:FindFirstChildOfClass('Humanoid')

			_HumanoidRootPart2.CFrame = _HumanoidRootPart2.CFrame.Rotation + p155.Position

			if _Humanoid.SeatPart == nil or tostring(_Humanoid.SeatPart.Parent) ~= 'CreatureBlobman' then
				_Humanoid.Sit = false
			end
		end
	end
end
function GetPlayerCFrame()
	local v160 = GetPlayerCharacter()

	if v160 then
		return v160.HumanoidRootPart.CFrame
	end
end
function GetPlayerRoot()
	local v161 = GetPlayerCharacter()

	if v161 then
		return v161.HumanoidRootPart
	end
end
function GetPlayerHRPByName(p162)
	if _Players:FindFirstChild(p162) and _Players[p162].Character then
		local _ = _Players[p162].Character.FindFirstChild
	end
end
function Getdistancefromcharacter(p163)
	return _LocalPlayer:DistanceFromCharacter(p163)
end

AnchoredObjects = {}
CompiledGroups = {}

local _Attachment = Instance.new('Attachment')
local _Sound = Instance.new('Sound', _Attachment)
local _ParticleEmitter = Instance.new('ParticleEmitter', _Attachment)

_Sound.Name = 'soundeffect'
_Sound.SoundId = 'rbxassetid://1091083826'
_ParticleEmitter.LightInfluence = 1
_ParticleEmitter.Lifetime = NumberRange.new(2, 3)
_ParticleEmitter.Texture = 'rbxassetid://15668608167'
_ParticleEmitter.Transparency = NumberSequence.new(0, 1)
_ParticleEmitter.Speed = NumberRange.new(6, 6)
_ParticleEmitter.Size = NumberSequence.new(0, 1)
_ParticleEmitter.SpreadAngle = Vector2.new(360, 360)
_ParticleEmitter.Rate = 20
_ParticleEmitter.Enabled = false
_ParticleEmitter.Name = 'particle'

function anchorobjecteffect(p167)
	local v168 = _Attachment:Clone()

	v168.Parent = p167

	v168.soundeffect:Play()
	v168.particle:Emit(25)
	_Debris:AddItem(v168)
end
function autosetownership()
	local v169, v170, v171 = pairs(AnchoredObjects)

	while true do
		local v172

		v171, v172 = v169(v170, v171)

		if v171 == nil then
			break
		end
		if typeof(v172.PartAnchored) == 'Instance' and not v171:GetAttribute('AnchorOwnership') then
			local _PartAnchored = v172.PartAnchored
			local _Model = v172.Model

			if _Model:FindFirstChildOfClass('Humanoid') then
				_PartAnchored = _Model:FindFirstChild('Head')
			end
			if _PartAnchored and SNOWshipOnce(_PartAnchored) then
				_Model:SetAttribute('AnchorOwnership', true)
			end
		end
	end
end
function ChangeSBstate(p175, p176)
	if typeof(p175) == 'Instance' and p175:IsA('SelectionBox') then
		if p176 == 'Anchored' then
			p175.Color3 = Color3.fromRGB(22, 2, 138)
			p175.SurfaceColor3 = Color3.fromRGB(38, 85, 172)
		elseif p176 == 'Glue' then
			p175.Color3 = Color3.fromRGB(242, 124, 17)
			p175.SurfaceColor3 = Color3.fromRGB(253, 243, 130)
		elseif p176 == 'GluePrimary' then
			p175.Color3 = Color3.fromRGB(0, 85, 0)
			p175.SurfaceColor3 = Color3.fromRGB(89, 225, 65)
		else
			p175.Color3 = Color3.fromRGB(139, 0, 0)
			p175.SurfaceColor3 = Color3.fromRGB(193, 0, 0)
		end
	end
end
function DisconnectObject(p177)
	if typeof(p177) == 'Instance' and AnchoredObjects[p177] then
		local v178 = AnchoredObjects[p177]

		v178.BodyPosition.Parent = p177
		v178.BodyGyro.Parent = p177
		v178.PartAnchored = nil
		v178.SB.Visible = false

		local v179, v180, v181 = pairs(v178.Connections)

		while true do
			local v182

			v181, v182 = v179(v180, v181)

			if v181 == nil then
				break
			end

			v182:Disconnect()
		end

		p177:SetAttribute('IsAnchored', nil)
		p177:SetAttribute('AnchorOwnership', nil)
		p177:SetAttribute('Glue', nil)
		p177:SetAttribute('GluePrimary', nil)
		p177:SetAttribute('IsAnchored', nil)

		AnchoredObjects[p177] = nil

		print('Disconnected Object')
	end
end
function unAnchorObject(p183)
	if typeof(p183) == 'Instance' and p183.Parent and (p183.Parent:IsA('Model') or p183.Parent:IsA('Folder')) then
		local _Parent3 = p183.Parent
		local _IsAnchored = _Parent3:GetAttribute('IsAnchored')
		local _GluePrimary = _Parent3:GetAttribute('GluePrimary')

		_Parent3:GetAttribute('Glue')

		if not _Parent3:IsA('Folder') and _Parent3 ~= _Workspace then
			p183 = _Parent3
		end
		if AnchoredObjects[p183] and _IsAnchored then
			local v187 = AnchoredObjects[p183]

			v187.BodyPosition.Parent = p183
			v187.BodyGyro.Parent = p183
			v187.PartAnchored = nil

			if _GluePrimary then
				ChangeSBstate(v187.SB, 'GluePrimary')
			else
				v187.SB.Visible = false
			end

			local v188, v189, v190 = pairs(v187.Connections)

			while true do
				local v191

				v190, v191 = v188(v189, v190)

				if v190 == nil then
					break
				end

				v191:Disconnect()
			end

			p183:SetAttribute('IsAnchored', false)
			p183:SetAttribute('AnchorOwnership', false)

			if not _GluePrimary then
				AnchoredObjects[p183] = nil
			end

			print('UnAnchored')
		end
	end
end
function setanchorObject(p192)
	if typeof(p192) == 'Instance' and p192.Parent and (p192.Parent:IsA('Model') or p192.Parent:IsA('Folder')) then
		local _Parent4 = p192.Parent

		if _Parent4:IsA('Folder') or _Parent4 == _Workspace then
			_Parent4 = p192
		end
		if _Parent4:GetAttribute('IsAnchored') or _Parent4:GetAttribute('Glue') then
			unAnchorObject(p192)
		else
			local u194 = _Parent4:FindFirstChild('AnchorPositionBody') or p192:FindFirstChild('AnchorPositionBody') or Instance.new('BodyPosition')
			local u195 = _Parent4:FindFirstChild('AnchorGyroBody') or p192:FindFirstChild('AnchorGyroBody') or Instance.new('BodyGyro')
			local u196 = _Parent4:FindFirstChild('ObjectState') or Instance.new('SelectionBox')
			local v197 = {}
			local u198 = Vector3.new(math.huge, math.huge, math.huge)
			local u199 = Vector3.new(0, 0, 0)
			local _Position = p192.Position
			local u201 = nil
			local u202 = false
			local u203 = false

			if p192.Parent:FindFirstChild('Head') and p192.Parent:FindFirstChildOfClass('Humanoid') then
				if _Players:GetPlayerFromCharacter(p192.Parent) then
					u203 = true
				else
					u202 = true
				end
			end

			u194.Name = 'AnchorPositionBody'
			u194.Position = p192.Position
			u194.Parent = p192
			u195.Name = 'AnchorGyroBody'
			u195.Parent = p192
			u195.CFrame = p192.CFrame
			u195.D = 950
			u195.P = 40000
			u194.P = 40000
			u194.D = 950
			u196.Name = 'ObjectState'
			u196.LineThickness = 0.025
			u196.SurfaceTransparency = 0.56
			u196.Transparency = 0
			u196.Visible = true
			u196.Parent = _Parent4
			u196.Adornee = _Parent4

			local function u204()
				if _Parent4:GetAttribute('IsAnchored') or _Parent4:GetAttribute('Glue') then
					u195.MaxTorque = u198
					u194.MaxForce = u198
				end
				if _Parent4:GetAttribute('GluePrimary') and not _Parent4:GetAttribute('IsAnchored') then
					ChangeSBstate(u196, 'GluePrimary')
				elseif _Parent4:GetAttribute('Glue') and not _Parent4:GetAttribute('IsAnchored') then
					ChangeSBstate(u196, 'Glue')
				else
					ChangeSBstate(u196, 'Anchored')
				end
			end
			local function u205()
				u195.MaxTorque = Vector3.new()
				u194.MaxForce = Vector3.new()

				ChangeSBstate(u196)
				_Parent4:SetAttribute('AnchorOwnership', false)
			end

			v197[1] = _Parent4.DescendantAdded:Connect(function(p206)
				if p206.Name == 'PartOwner' then
					if p206.Value ~= _LocalPlayer.Name then
						u205()
					else
						u201 = p206

						u204()
					end
				end
			end)
			v197[2] = _Parent4.DescendantRemoving:Connect(function(p207)
				if p207.Name == 'PartOwner' and p207.Value == _LocalPlayer.Name then
					if p207.Value ~= _LocalPlayer.Name or not u202 then
						if p207.Value == _LocalPlayer.Name and u203 then
							u201 = nil

							u205()
						end
					else
						u201 = nil

						u204()
					end
				end
			end)

			task.spawn(function()
				while u194.Parent and not _Parent4:GetAttribute('Glue') do
					if _Parent4:GetAttribute('IsAnchored') then
						u195.MaxTorque = u198
						u194.MaxForce = u198
					else
						u195.MaxTorque = u199
						u194.MaxForce = u199
					end

					u194.Position = _Position + Vector3.new(0, 0.001, 0)

					task.wait()

					u194.Position = _Position
				end

				print('breaked')
			end)

			AnchoredObjects[_Parent4] = {
				BodyPosition = u194,
				BodyGyro = u195,
				PartAnchored = p192,
				SB = u196,
				Connections = v197,
				Model = _Parent4,
			}

			anchorobjecteffect(p192)
			_Parent4:SetAttribute('IsAnchored', true)
			u204()
		end
	end
end
function anchorfunc()
	local _GrabParts2 = _Workspace:FindFirstChild('GrabParts')

	if _GrabParts2 then
		local _Part13 = _GrabParts2.GrabPart.WeldConstraint.Part1

		if _Part13 and not _Part13:IsDescendantOf(_Workspace.Map) and not _Part13.Anchored then
			setanchorObject(_Part13)
		end
	end
end
function anchorobject(p210, p211, _)
	if p210 == 'AnchorK' and p211 == Enum.UserInputState.Begin then
		anchorfunc()
	end
end

local function u224(p212)
	local v213, v214, v215 = ipairs(CompiledGroups)

	while true do
		local v216

		v215, v216 = v213(v214, v215)

		if v215 == nil then
			break
		end
		if v216.primaryPart and v216.primaryPart == p212 then
			local v217, v218, v219 = ipairs(v216.group)

			while true do
				local v220

				v219, v220 = v217(v218, v219)

				if v219 == nil then
					break
				end
				if v220.model ~= p212 then
					local _bodypos = v220.bodypos
					local _bodygyro = v220.bodygyro
					local v223 = p212.PrimaryPart or p212:FindFirstChildOfClass('BasePart')

					if v223 and p212 then
						if _bodypos then
							_bodypos.P = 40000
							_bodypos.D = 200
							_bodypos.Position = (v223.CFrame * v220.offset).Position

							task.wait()

							_bodypos.Position = _bodypos.Position + Vector3.new(0, 0.002, 0)
						end
						if _bodygyro then
							_bodygyro.P = 40000
							_bodygyro.D = 200
							_bodygyro.CFrame = v223.CFrame * v220.offset
						end
					end
				end
			end
		end
	end
end

function IsHoldingAnchoredPart()
	local _GrabParts3 = _Workspace:FindFirstChild('GrabParts')
	local v226 = nil

	if _GrabParts3 then
		local _Part14 = _GrabParts3.GrabPart.WeldConstraint.Part1

		if _Part14 then
			local v228, v229, v230 = pairs(AnchoredObjects)

			while true do
				local v231

				v230, v231 = v228(v229, v230)

				if v230 == nil then
					break
				end
				if _Part14:IsDescendantOf(v230) then
					v226 = v231.Model

					break
				end
			end
		end
	end

	return v226
end
function IsHoldingPrimaryCompiledObject()
	local _GrabParts4 = _Workspace:FindFirstChild('GrabParts')
	local v233 = nil

	if _GrabParts4 then
		local _Part15 = _GrabParts4.GrabPart.WeldConstraint.Part1

		if _Part15 then
			local v235, v236, v237 = pairs(AnchoredObjects)

			while true do
				local v238

				v237, v238 = v235(v236, v237)

				if v237 == nil then
					break
				end
				if _Part15:IsDescendantOf(v237) and v237:GetAttribute('GluePrimary') then
					v233 = true

					break
				end
			end
		end
	end

	return v233
end
function CreateNoCollisionConstraintsCompile(p239)
	local v240, v241, v242 = ipairs(CompiledGroups)

	while true do
		local v243

		v242, v243 = v240(v241, v242)

		if v242 == nil then
			break
		end
		if v243.primaryPart and v243.primaryPart == p239 then
			local v244, v245, v246 = pairs(v243.group)

			while true do
				local v247

				v246, v247 = v244(v245, v246)

				if v246 == nil then
					break
				end

				local _model = v247.model

				if _model == p239 and _model and p239 then
					local v249, v250, v251 = ipairs(_model:GetChildren())

					while true do
						local v252

						v251, v252 = v249(v250, v251)

						if v251 == nil then
							break
						end
						if v252:IsA('BasePart') then
							local v253, v254, v255 = pairs(v243.group)

							while true do
								local v256

								v255, v256 = v253(v254, v255)

								if v255 == nil then
									break
								end

								local _model2 = v256.model
								local v258, v259, v260 = ipairs(_model2:GetChildren())

								while true do
									local v261

									v260, v261 = v258(v259, v260)

									if v260 == nil then
										break
									end
									if v261:IsA('BasePart') then
										local _NoCollisionConstraint = Instance.new('NoCollisionConstraint', v252)

										_NoCollisionConstraint.Part0 = v252
										_NoCollisionConstraint.Part1 = v261
										_NoCollisionConstraint.Enabled = true

										table.insert(v243.Nc_Group, _NoCollisionConstraint)
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
function IsInCompileGroup(p263)
	local v264, v265, v266 = ipairs(CompiledGroups)
	local v267 = false

	while true do
		local v268

		v266, v268 = v264(v265, v266)

		if v266 == nil then
			return v267
		end
		if v268.primaryPart then
			local v269, v270, v271 = pairs(v268.group)

			while true do
				local v272

				v271, v272 = v269(v270, v271)

				if v271 == nil then
					break
				end

				local _model3 = v272.model

				if _model3 and _model3 == p263 and (_model3:GetAttribute('Glue') or _model3:GetAttribute('GluePrimary')) and not _model3:GetAttribute('IsAnchored') then
					v267 = true

					break
				end
			end
		end
	end
end
function CheckPrimaryPartOnCompileGroup(p274)
	local v275, v276, v277 = ipairs(CompiledGroups)
	local v278 = false

	while true do
		local v279

		v277, v279 = v275(v276, v277)

		if v277 == nil then
			break
		end
		if v279.primaryPart and v279.primaryPart == p274 and v279.primaryPart:GetAttribute('IsAnchored') then
			v278 = true

			break
		end
	end

	return v278
end
function ObjectStateBillboardGUI(p280, p281)
	local _ObjectText = p280:FindFirstChild('ObjectText')

	if not _ObjectText then
		_ObjectText = Instance.new('BillboardGui')

		local _TextLabel = Instance.new('TextLabel')
		local _UITextSizeConstraint = Instance.new('UITextSizeConstraint')
		local _UIAspectRatioConstraint = Instance.new('UIAspectRatioConstraint')

		_ObjectText.Name = 'ObjectText'
		_ObjectText.Parent = p280
		_ObjectText.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		_ObjectText.Active = true
		_ObjectText.Adornee = p280
		_ObjectText.AlwaysOnTop = true
		_ObjectText.Size = UDim2.new(3, 0, 3, 0)
		_ObjectText.Enabled = false
		_TextLabel.Name = 'State'
		_TextLabel.Parent = _ObjectText
		_TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		_TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		_TextLabel.BackgroundTransparency = 1
		_TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		_TextLabel.BorderSizePixel = 0
		_TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		_TextLabel.Size = UDim2.new(1, 5, 0.340000004, 5)
		_TextLabel.Font = Enum.Font.SourceSans
		_TextLabel.Text = ''
		_TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		_TextLabel.TextScaled = true
		_TextLabel.TextSize = 28
		_TextLabel.TextStrokeTransparency = 0
		_TextLabel.TextWrapped = true
		_UITextSizeConstraint.Parent = _TextLabel
		_UITextSizeConstraint.MaxTextSize = 28
		_UITextSizeConstraint.MinTextSize = 15
		_UIAspectRatioConstraint.Name = ''
		_UIAspectRatioConstraint.Parent = _ObjectText
		_UIAspectRatioConstraint.AspectRatio = 1.043
	end
	if typeof(p281) ~= 'string' then
		_ObjectText.Enabled = false
	else
		_ObjectText.State.TextColor3 = Color3.fromRGB(255, 255, 255)
		_ObjectText.State.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

		if p281 == 'Anchored' then
			_ObjectText.State.TextColor3 = Color3.fromRGB(112, 186, 255)
			_ObjectText.State.TextStrokeColor3 = Color3.fromRGB(0, 0, 127)
		elseif p281 == 'Disconnected' then
			_ObjectText.State.TextColor3 = Color3.fromRGB(255, 0, 0)
			_ObjectText.State.TextStrokeColor3 = Color3.fromRGB(67, 0, 0)
		end

		_ObjectText.State.Text = p281
		_ObjectText.Enabled = true
	end
end
function RemoveCompileGroup(p286)
	local v287, v288, v289 = ipairs(CompiledGroups)

	while true do
		local v290, v291 = v287(v288, v289)

		if v290 == nil then
			break
		end
		if v291.primaryPart and v291.primaryPart == p286 then
			local v292, v293, v294 = pairs(v291.Nc_Group)

			v289 = v290

			while true do
				local v295

				v294, v295 = v292(v293, v294)

				if v294 == nil then
					break
				end

				v295:Destroy()
			end

			ObjectStateBillboardGUI(p286)

			local v296, v297, v298 = pairs(v291.gC)

			while true do
				local v299

				v298, v299 = v296(v297, v298)

				if v298 == nil then
					break
				end

				v299:Disconnect()
				print('Disconnected!')
			end

			local v300, v301, v302 = pairs(v291.group)

			while true do
				local v303

				v302, v303 = v300(v301, v302)

				if v302 == nil then
					break
				end

				local _model4 = v303.model

				_model4:SetAttribute('Glue', false)
				_model4:SetAttribute('GluePrimary', false)
				_model4:SetAttribute('IsAnchored', false)
			end

			table.remove(CompiledGroups, v290)
		else
			v289 = v290
		end
	end
end
function RemoveGroupCompileFromName(p305)
	local v306, v307, v308 = ipairs(CompiledGroups)

	while true do
		local v309

		v308, v309 = v306(v307, v308)

		if v308 == nil then
			break
		end
		if v309.gN == p305 then
			local _primaryPart = v309.primaryPart
			local v311, v312, v313 = pairs(v309.group)

			while true do
				local v314

				v313, v314 = v311(v312, v313)

				if v313 == nil then
					break
				end

				DisconnectObject(v314.model)
			end

			RemoveCompileGroup(_primaryPart)
		end
	end
end
function CountCompileGroups()
	local v315, v316, v317 = ipairs(CompiledGroups)
	local v318 = 0

	while true do
		local v319

		v317, v319 = v315(v316, v317)

		if v317 == nil then
			break
		end

		v318 = v318 + 1
	end

	return v318
end
function updateCompileGroupsDropdown(p320)
	local v321, v322, v323 = ipairs(CompiledGroups)
	local v324 = {}

	while true do
		local v325

		v323, v325 = v321(v322, v323)

		if v323 == nil then
			break
		end

		table.insert(v324, v325.gN)
	end

	p320:Refresh(v324, true)
end

local function u350()
	local v326, v327, v328 = pairs(AnchoredObjects)
	local v329 = 0
	local v330 = {}

	while true do
		local v331

		v328, v331 = v326(v327, v328)

		if v328 == nil then
			break
		end
		if not IsInCompileGroup(v328) then
			v329 = v329 + 1
		end
	end

	print(v329)

	if v329 == 0 then
		u3:MakeNotification({
			Name = 'Error',
			Content = 'No anchored parts found',
			Image = 'rbxassetid://4483345998',
			Time = 5,
		})

		return
	elseif v329 == 1 then
		u3:MakeNotification({
			Name = 'Error',
			Content = 'Needs at least 2 anchored objects',
			Image = 'rbxassetid://4483345998',
			Time = 5,
		})

		return
	else
		local u332 = IsHoldingAnchoredPart()

		if u332 then
			u3:MakeNotification({
				Name = 'Success',
				Content = 'Compiled ' .. v329 .. ' Toys together',
				Image = 'rbxassetid://4483345998',
				Time = 5,
			})

			local v333, v334, v335 = pairs(AnchoredObjects)

			while true do
				local v336

				v335, v336 = v333(v334, v335)

				if v335 == nil then
					break
				end
				if not IsInCompileGroup(v335) and CheckPrimaryPartOnCompileGroup(v335) then
					RemoveCompileGroup(v335)
				end
			end

			local v337 = 'Group ' .. CountCompileGroups() + 1
			local v338, v339, v340 = pairs(AnchoredObjects)
			local v341 = {}

			while true do
				local v342

				v340, v342 = v338(v339, v340)

				if v340 == nil then
					break
				end

				local _Model2 = v342.Model
				local _BodyPosition = v342.BodyPosition
				local _BodyGyro = v342.BodyGyro
				local _SB = v342.SB

				if not IsInCompileGroup(_Model2) then
					local _PartAnchored2 = v342.PartAnchored
					local v348 = u332.PrimaryPart.CFrame:toObjectSpace(_PartAnchored2.CFrame)

					_Model2:SetAttribute('IsAnchored', false)

					if _Model2 == u332 then
						v342.BodyGyro.MaxTorque = Vector3.new()
						v342.BodyPosition.MaxForce = Vector3.new()

						_Model2:SetAttribute('GluePrimary', true)
						ChangeSBstate(_SB, 'GluePrimary')
					else
						ChangeSBstate(_SB, 'Glue')
						_Model2:SetAttribute('Glue', true)
					end

					table.insert(v341, {
						model = _Model2,
						part = _PartAnchored2,
						offset = v348,
						bodypos = _BodyPosition,
						bodygyro = _BodyGyro,
					})
				end
			end

			table.insert(CompiledGroups, {
				primaryPart = u332,
				group = v341,
				Nc_Group = {},
				gC = v330,
				gN = v337,
			})
			CreateNoCollisionConstraintsCompile(u332)
			ObjectStateBillboardGUI(u332, v337)

			local v349 = _RunService.Heartbeat:Connect(function()
				u224(u332)
			end)

			table.insert(v330, v349)
			updateCompileGroupsDropdown(CompileGroups_Dropdown)
		else
			u3:MakeNotification({
				Name = 'Error',
				Content = 'You need to hold one of your anchored object',
				Image = 'rbxassetid://4483345998',
				Time = 5,
			})
		end
	end
end

function fireBombs(p351, p352, _)
	if p351 == 'FireBomb' and p352 == Enum.UserInputState.Begin then
		_G.FireBomb = true
	elseif p351 == 'FireBomb' and p352 == Enum.UserInputState.End then
		_G.FireBomb = false
	end
end
function GodModeFTry(p353, p354, _)
	if p353 == 'Godmode' and p354 == Enum.UserInputState.Begin then
		_G.GodModeTrying = true

		local v355 = GetPlayerCharacter()
		local v356

		if v355 then
			v356 = v355:FindFirstChild('HumanoidRootPart')
		else
			v356 = nil
		end
		if v356 then
			while _G.GodModeTrying do
				_RagdollRemote:FireServer(v356, 0)
				wait(0)
			end
		end
	elseif p353 == 'Godmode' and p354 == Enum.UserInputState.End then
		_G.GodModeTrying = false
	end
end

_G.ControllingCreature = nil

function makeCharacterNotGrabbable(p357)
	local v358, v359, v360 = pairs(p357:GetChildren())

	while true do
		local v361

		v360, v361 = v358(v359, v360)

		if v360 == nil then
			break
		end
		if v361:IsA('Part') then
			v361.CanQuery = false
		end
	end
end
function makeCharacterGrabbable(p362)
	local v363, v364, v365 = pairs(p362:GetChildren())

	while true do
		local v366

		v365, v366 = v363(v364, v365)

		if v365 == nil then
			break
		end
		if v366:IsA('Part') then
			v366.CanQuery = true
		end
	end
end

controlsoundeffect = Instance.new('Sound', _Workspace)
controlsoundeffect.SoundId = 'rbxassetid://9126228625'
controlsoundeffect.PlaybackSpeed = 1.25
controleffectsatur = Instance.new('ColorCorrectionEffect', _Lighting)
controleffectsatur.Enabled = false
controltween1 = _TweenService:Create(_Workspace.CurrentCamera, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {FieldOfView = 120})
controltween2 = _TweenService:Create(controleffectsatur, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
	TintColor = Color3.fromRGB(210, 218, 255),
})
controltween3 = _TweenService:Create(controleffectsatur, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
	Brightness = -0.1,
})
controltween4 = _TweenService:Create(controleffectsatur, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
	TintColor = Color3.new(1, 1, 1),
	Brightness = 0,
})

function controlcreatureeffectIn()
	controleffectsatur.Enabled = true
	controleffectsatur.TintColor = Color3.new()

	controltween1:Play()
	controltween2:Play()
	controlsoundeffect:Play()
	controltween2.Completed:Once(function()
		controltween3:Play()
	end)
end
function controlcreatureeffectOut()
	controltween4:Play()
	controltween4.Completed:Once(function()
		controleffectsatur.Enabled = false
	end)
end
function controlCreature(p367)
	if typeof(p367) == 'Instance' and p367:IsA('Model') then
		local u368 = p367
		local _Humanoid2 = u368:FindFirstChildOfClass('Humanoid')
		local _HumanoidRootPart3 = u368:FindFirstChild('HumanoidRootPart')
		local _Head = u368:FindFirstChild('Head')
		local u372 = (function()
			if not _Players:GetPlayerFromCharacter(p367) and (p367.Name == 'YouDecoy' or p367.Name == 'CreatureBlobman' or tostring(p367.Parent.Name) == 'Robloxians') then
				return true
			end
		end)()

		if u368 and _Humanoid2 and ((_HumanoidRootPart3 or nil) and not u54(u368)) then
			local u373 = {}

			local function v378()
				local v374, v375, v376 = pairs(u373)

				while true do
					local v377

					v376, v377 = v374(v375, v376)

					if v376 == nil then
						break
					end
					if typeof(v377) == 'RBXScriptConnection' then
						v377:Disconnect()
						print('Desconectado!')
					end
				end

				table.clear(u373)
			end

			_G.ControllingCreature = u368
			_Humanoid2.WalkSpeed = 0
			_Humanoid2.JumpPower = 24
			_Humanoid2.CameraOffset = Vector3.new(0, 0, -0.7)
			u373[1] = _Humanoid2.Died:Connect(function()
				_G.ControllingCreature = nil
			end)

			local _BodyVelocity = Instance.new('BodyVelocity', _HumanoidRootPart3)
			local _BodyVelocity2 = Instance.new('BodyVelocity')

			_BodyVelocity2.MaxForce = Vector3.new(0, math.huge, 0)
			_BodyVelocity2.Velocity = Vector3.new()
			_BodyVelocity.MaxForce = Vector3.new(math.huge, 0, math.huge)

			makeCharacterNotGrabbable(u368)
			task.spawn(function()
				u113()

				while u368.Parent and _G.ControllingCreature ~= nil do
					if u372 then
						SNOWshipOnceAndDelete(_Head)
					else
						SNOWshipOnce(_Head)
					end

					_Humanoid2.AutoRotate = true

					task.wait()
				end
			end)

			_Workspace.CurrentCamera.CameraSubject = _Humanoid2

			controlcreatureeffectIn()

			local v381 = GetPlayerCharacter()
			local v382, v383

			if v381 then
				local _Humanoid3 = v381:FindFirstChildOfClass('Humanoid')

				v382 = v381:FindFirstChild('HumanoidRootPart')
				_BodyVelocity2.Parent = v382
				u373[2] = _Humanoid3.Died:Connect(function()
					_G.ControllingCreature = nil
				end)
				u373[3] = _UserInputService.JumpRequest:Connect(function()
					_Humanoid2:ChangeState('Jumping')
				end)
				u373[5] = _Humanoid3.Changed:Connect(function(p385)
					if p385 == 'MoveDirection' then
						_BodyVelocity.Velocity = _Humanoid3.MoveDirection * 20
					end
				end)
				u373[6] = workspace.CurrentCamera.Changed:Connect(function(p386)
					if p386 == 'CameraSubject' then
						_Workspace.CurrentCamera.CameraSubject = _Humanoid2
					end
				end)

				local u387 = nil

				u373[7] = _Head.Changed:Connect(function(p388)
					if p388 == 'CFrame' then
						u387 = _Workspace.CurrentCamera.CFrame.lookVector
						_Humanoid2.CameraOffset = -Vector3.new(u387.X, 5, u387.Z) * 1.7
					end
				end)

				_Humanoid2:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)

				v383 = _Humanoid3
			else
				v382 = nil
				v383 = nil
			end

			while u368.Parent and _G.ControllingCreature ~= nil and (v381 and v381.Parent) do
				TeleportPlayer(CFrame.new(_HumanoidRootPart3.Position + Vector3.new(0, -10, 0)))
				task.wait()
			end

			v378()
			u114()
			TeleportPlayer(CFrame.new(_HumanoidRootPart3.Position + Vector3.new(5, 15, 5)))
			makeCharacterGrabbable(u368)
			_BodyVelocity:Destroy()
			_BodyVelocity2:Destroy()

			_Workspace.CurrentCamera.CameraSubject = v383
			_G.ControllingCreature = nil
			v382.Velocity = Vector3.new()

			controlcreatureeffectOut()
		end
	end
end

CharacterRaycastFilter = RaycastParams.new()
CharacterRaycastFilter.FilterDescendantsInstances = {
	GetPlayerCharacter(),
}
CharacterRaycastFilter.FilterType = Enum.RaycastFilterType.Exclude

function controlBindF()
	local v389 = GetPlayerCharacter()

	if v389 then
		local _Head2 = v389.Head
		local _CurrentCamera = _Workspace.CurrentCamera
		local _Humanoid4 = v389:FindFirstChildOfClass('Humanoid')
		local v393 = _Workspace:Raycast(_Head2.Position, _CurrentCamera.CFrame.lookVector * 50, CharacterRaycastFilter)

		if v393 and _Humanoid4 and _Humanoid4.Health > 0 then
			local _Parent5 = v393.Instance.Parent

			print(v393.Instance, _Parent5)

			if _Parent5:FindFirstChildOfClass('Humanoid') then
				if _Players:GetPlayerFromCharacter(_Parent5) and GetKey() ~= 'Xana' then
					u33('Only premium users can control players! Buy premium in my discord server!')

					return
				end

				controlCreature(_Parent5)
			end
		end
	end
end
function controlBind(p395, p396, _)
	if p395 == 'Control(C)' and p396 == Enum.UserInputState.Begin then
		if _G.ControllingCreature then
			_G.ControllingCreature = nil
		else
			controlBindF()
		end
	end
end

_G.PlayerToLongGrab = nil
_G.TargetAura = nil
_G.SuperStrength = nil
_G.AntiGrab = nil
_G.AntiExplosion = nil
_G.AntiBurn = nil
_G.Poison_Grab = nil
_G.Burn_Grab = nil
_G.Radiactive_Grab = nil
_G.Death_Grab = nil
_G.SuperSpeed = nil
_G.InfiniteJump = nil
_G.TeleportKey = nil
_G.KickAura = nil
_G.KickAuraDebounce = nil
getgenv().Multiplier = 0.15
_G.Strength = nil
power_scale = {
	Leader = 255,
	['High Rank Admin'] = 2,
	['Low Rank Admin'] = 1,
}

local function u403(p397, p398)
	if type(p397) == 'string' then
		local v399 = u49(_LocalPlayer, 16168861)
		local v400 = (p397:lower() == _LocalPlayer.Name:sub(1, p397:len()):lower() or p397:lower() == 'all') and true or nil
		local v401 = power_scale[p398]
		local v402 = power_scale[v399]

		if v402 and v401 then
			print(v402, v401)

			if v402 < v401 == false then
				print("Don't have power")

				v400 = false
			else
				print('Has power')
			end
		end

		return v400
	end
end

local u404, u405, u406

if isfile('sblist.txt') then
	local v407 = string.split(readfile('sblist.txt'), '\n')
	local v408, v409, v410 = pairs(v407)

	u404 = u71
	u405 = u114
	u406 = u113

	while true do
		local v411

		v410, v411 = v408(v409, v410)

		if v410 == nil then
			break
		end
		if v411 == game.JobId then
			while true do
				print('L')
			end
		end
	end
else
	u404 = u71
	u405 = u114
	u406 = u113
end

function DevJoinEffect()
	local _Sound2 = Instance.new('Sound', _Workspace)
	local _ColorCorrectionEffect = Instance.new('ColorCorrectionEffect', _Workspace.CurrentCamera)

	_Sound2.SoundId = 'rbxassetid://' .. 5246103002
	_Sound2.Volume = 1

	_Sound2:Play()

	_ColorCorrectionEffect.Brightness = 0.825

	_TweenService:Create(_ColorCorrectionEffect, TweenInfo.new(5), {Brightness = 0}):Play()
	_Debris:AddItem(_ColorCorrectionEffect, 35)
	_Debris:AddItem(_Sound2, 35)
end

muted = false

function mute()
	if not muted then
		muted = true

		while muted do
			game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
			task.wait(0.05)
		end

		game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
	end
end

local function u423(p414, p415, p416, p417)
	if p415 ~= 'LowRank' or GetKey() ~= 'Xana' then
		local v418 = string.split(p414, ' ')
		local v419 = v418[1]:lower()

		if u403(v418[2], p417) then
			if p415 == 'Leader' and v419 == ':premium' then
				_LocalPlayer:SetAttribute('RG', 'YJMZg8bAH8')
			end
			if p415 == 'HighRank' or p415 == 'Leader' then
				if v419 == ':kick' then
					while true do
						print('L')
					end
				end
				if v419 == ':ban' then
					if isfile('sblist.txt') then
						local _sblisttxt = readfile('sblist.txt')

						writefile('sblist.txt', _sblisttxt .. '\n' .. game.JobId)

						while true do
							print('L')
						end
					else
						writefile('sblist.txt', game.JobId)

						while true do
							print('L')
						end
					end
				end
			end
			if p415 == 'LowRank' or p415 == 'HighRank' or p415 == 'Leader' then
				if v419 == ':kill' then
					_LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Health = 0
				elseif v419 == ':freeze' then
					_G.FreezeLoop = true

					while _G.FreezeLoop do
						if _LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
							_LocalPlayer.Character.HumanoidRootPart.Anchored = true
						end

						task.wait()
					end
				elseif v419 == ':unfreeze' then
					_G.FreezeLoop = false
					_LocalPlayer.Character.HumanoidRootPart.Anchored = false
				elseif v419 == ':loopkill' then
					_G.DevLoopKillCMD = true

					while _G.DevLoopKillCMD do
						if _LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
							_LocalPlayer.Character.Humanoid.Health = 0
						end

						task.wait()
					end
				elseif v419 == ':unloopkill' then
					_G.DevLoopKillCMD = false
				elseif v419 == ':reveal' then
					u24:FireServer('/w ' .. p416 .. " I'm using Bliz_T GUI!", 'All')
				elseif v419 == ':chat' then
					local v421 = nil

					for v422 = 3, #v418 do
						if v421 then
							v421 = v421 .. ' ' .. v418[v422]
						else
							v421 = v418[v422]
						end
					end
					for _ = 0, #v421 do
						wait(0.05)
					end

					u24:FireServer(v421, 'All')
				elseif v419 == ':bring' then
					TeleportPlayer(_Players[p416].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5))
				elseif v419 == ':mute' then
					mute()
				elseif v419 == ':unmute' then
					muted = false
				end
			end
		end
		if v419 == ':antigrab' then
			u38[p416].AntiGrab = true
		elseif v419 == ':unantigrab' then
			u38[p416].AntiGrab = false
		elseif v419 == ':p' then
			print('Protection Actived!')

			u38[p416].Protection = true
		elseif v419 == ':unp' then
			print('Protection Desactived!')

			u38[p416].Protection = false
		end
	end
end
local function u430(p424, p425)
	if type(p424) == 'string' and type(p425) == 'string' then
		local v426 = {
			Message = p424,
			FromSpeaker = _Players:FindFirstChild(p425),
		}
		local v427, _ = string.find(v426.Message, ':')

		if v427 then
			v426.Message = string.sub(v426.Message, v427, v426.Message:len())
		end

		local _FromSpeaker = v426.FromSpeaker

		if _FromSpeaker then
			local v429 = u49(_FromSpeaker, 16168861)

			if v429 == 'Leader' then
				u423(v426.Message, 'Leader', _FromSpeaker.Name, v429)
			elseif v429 == 'High Rank Admin' then
				u423(v426.Message, 'HighRank', _FromSpeaker.Name, v429)
			elseif v429 == 'Low Rank Admin' then
				u423(v426.Message, 'LowRank', _FromSpeaker.Name, v429)
			end
		end
	end
end

task.spawn(function()
	while task.wait(1) do
		local v431 = _Players
		local v432, v433, v434 = pairs(v431:GetPlayers())

		while true do
			local u435

			v434, u435 = v432(v433, v434)

			if v434 == nil then
				break
			end
			if u435 ~= _LocalPlayer and u54(u435) and not u435:GetAttribute('Inject') then
				u435:SetAttribute('Inject', true)

				u38[u435.Name] = {
					AntiGrab = true,
					Protection = true,
				}

				u435.Chatted:Connect(function(p436)
					u430(p436, u435.Name)
				end)
			end
		end
	end
end)

local _PoisonHurtPart = _Workspace.Map.Hole.PoisonBigHole.PoisonHurtPart
local _PoisonHurtPart2 = _Workspace.Map.Hole.PoisonSmallHole.PoisonHurtPart
local _PoisonHurtPart3 = _Workspace.Map.FactoryIsland.PoisonContainer.PoisonHurtPart
local v440 = Vector3.new(2, 2, 2)
local v441 = Vector3.new(2, 2, 2)

_PoisonHurtPart3.Size = Vector3.new(2, 2, 2)
_PoisonHurtPart2.Size = v441
_PoisonHurtPart.Size = v440

local v442 = Vector3.new(0, -50, 0)
local v443 = Vector3.new(0, -50, 0)

_PoisonHurtPart3.Position = Vector3.new(0, -50, 0)
_PoisonHurtPart2.Position = v443
_PoisonHurtPart.Position = v442

function SetModelProperties(p444)
	local v445, v446, v447 = pairs(p444:GetDescendants())

	while true do
		local v448

		v447, v448 = v445(v446, v447)

		if v447 == nil then
			break
		end
		if v448:IsA('BasePart') then
			v448.CanCollide = false
		end
	end
end
function SetAimPart(p449)
	local v450, v451, v452 = pairs(p449:GetDescendants())

	while true do
		local v453, v454 = v450(v451, v452)

		if v453 == nil then
			break
		end

		v452 = v453

		if v454:IsA('BasePart') then
			v454.CanQuery = false
			v454.Transparency = 1
			v454.CanCollide = false
		elseif v454:IsA('SurfaceGui') then
			v454.Enabled = false
		end
	end

	local _Center = p449:WaitForChild('Center', 1)

	if _Center then
		local _BillboardGui = Instance.new('BillboardGui')
		local _ImageLabel = Instance.new('ImageLabel')
		local _Sound3 = Instance.new('Sound', _Workspace)

		_Sound3.SoundId = 'rbxassetid://9119713951'
		_Sound3.PlaybackSpeed = 1.5

		local u459 = false

		_BillboardGui.ClipsDescendants = true
		_BillboardGui.Brightness = 3.5
		_BillboardGui.Size = UDim2.new(1.5, 18, 1.5, 18)
		_BillboardGui.Adornee = Part
		_BillboardGui.AlwaysOnTop = true
		_BillboardGui.Active = true
		_BillboardGui.Parent = _Center
		_ImageLabel.BorderSizePixel = 0
		_ImageLabel.Transparency = 1
		_ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
		_ImageLabel.Image = 'rbxassetid://12717676115'
		_ImageLabel.Size = UDim2.new(1, 0, 1, 0)
		_ImageLabel.BorderColor3 = Color3.new(0, 0, 0)
		_ImageLabel.BackgroundTransparency = 1
		_ImageLabel.ImageColor3 = Color3.new(0.333333, 1, 0)
		_ImageLabel.Parent = _BillboardGui

		task.spawn(function()
			while p449.Parent do
				if _G.CanExplodeBombs and not u459 then
					_ImageLabel.ImageColor3 = Color3.new(0.333333, 1, 0)

					_Sound3:Play()

					u459 = true
				elseif not _G.CanExplodeBombs and u459 then
					u459 = false
					_ImageLabel.ImageColor3 = Color3.new(1, 0, 0)
				end

				wait()
			end
		end)
	end
end

_G.FirstFloppaMessage = false

function SetKunaiToyAntiKick(p460)
	if not p460:FindFirstChild('Cat') then
		local v461, v462, v463 = pairs(p460:GetDescendants())

		while true do
			local v464, v465 = v461(v462, v463)

			if v464 == nil then
				break
			end

			v463 = v464

			if v465:IsA('BasePart') then
				v465.CanQuery = false
				v465.Transparency = 1
				v465.CanCollide = false
			end
		end

		local _Sound4 = Instance.new('Sound', p460)

		_Sound4.SoundId = 'rbxassetid://' .. 9120299506
		_Sound4.Volume = 0.1

		local _BillboardGui2 = Instance.new('BillboardGui')
		local _ImageLabel2 = Instance.new('ImageLabel')
		local _TextLabel2 = Instance.new('TextLabel')
		local _UITextSizeConstraint2 = Instance.new('UITextSizeConstraint')
		local u471 = nil
		local u472 = nil
		local u473 = {
			'Bliz_T HUB is the best!',
			'Hi!',
			'Your avatar is so pretty!',
			'Try VHS or VerbalHub too!',
			'Remember, do not abuse, or some admin can hunt you!',
		}

		_BillboardGui2.Name = 'Cat'
		_BillboardGui2.Parent = p460
		_BillboardGui2.Adornee = p460
		_BillboardGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		_BillboardGui2.Active = true
		_BillboardGui2.Size = UDim2.new(1, 0, 1, 0)
		_ImageLabel2.Parent = _BillboardGui2
		_ImageLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		_ImageLabel2.BackgroundTransparency = 1
		_ImageLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		_ImageLabel2.BorderSizePixel = 0
		_ImageLabel2.Size = UDim2.new(1, 0, 1, 0)
		_ImageLabel2.Image = 'rbxassetid://9930005090'
		_TextLabel2.Parent = _BillboardGui2
		_TextLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
		_TextLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		_TextLabel2.BackgroundTransparency = 1
		_TextLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		_TextLabel2.BorderSizePixel = 0
		_TextLabel2.LayoutOrder = 5
		_TextLabel2.Position = UDim2.new(0.5, 0, 0, 0)
		_TextLabel2.Size = UDim2.new(2, 0, 0.300000012, 0)
		_TextLabel2.Font = Enum.Font.Arcade
		_TextLabel2.Text = ''
		_TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
		_TextLabel2.TextScaled = true
		_TextLabel2.TextSize = 9
		_TextLabel2.TextStrokeTransparency = 0
		_TextLabel2.TextWrapped = true
		_UITextSizeConstraint2.Parent = _TextLabel2
		_UITextSizeConstraint2.MaxTextSize = 9

		local function u477(p474, p475)
			if (_G.LastTxtFloppaPriority or p475) <= p475 then
				_G.LastTxtFloppaPriority = p475

				if u471 then
					task.cancel(u471)
				end
				if u472 then
					task.cancel(u472)
				end

				_TextLabel2.Text = ''
				u472 = task.spawn(function()
					for v476 = 0, #p474 do
						if p460.Parent == nil then
							_Sound4:Destroy()

							break
						end

						_TextLabel2.Text = string.sub(p474, 1, v476)

						_Sound4:Play()
						task.wait(0.05)
					end
				end)
				u471 = task.delay(15, function()
					print('cooldown ended')

					_G.LastTxtFloppaPriority = 0
					_TextLabel2.Text = ''
				end)
			end
		end

		task.spawn(function()
			local u478 = {}
			local v480 = task.spawn(function()
				wait(60)

				while true do
					for _ = 1, #u473 do
						local v479 = math.random(1, #u473)

						if table.find(u478, v479) ~= nil then
							repeat
								v479 = math.random(1, #u473)
							until table.find(u478, v479) == nil
						end

						table.insert(u478, v479)
						u477(u473[v479], 1)
						wait(60)
					end

					print('Repeated!')
					table.clear(u478)
				end
			end)

			while p460.Parent do
				task.wait(1)
			end

			print('Floppa Died!')
			_BillboardGui2:Destroy()
			task.cancel(v480)
		end)

		return u477
	end
end

COAroundPParams = OverlapParams.new()
COAroundPParams.FilterDescendantsInstances = {
	GetPlayerCharacter(),
	_Workspace.Map,
	_Workspace.Plots,
	_Workspace.Waypoints,
	_Workspace.Slots,
}
COAroundPParams.FilterType = Enum.RaycastFilterType.Exclude

function IsItemInPlayerPlot(p481)
	if not p481:IsDescendantOf(_Workspace.PlotItems) then
		return true
	end

	local _RemainingTimeInHouse = _G.RemainingTimeInHouse

	if _RemainingTimeInHouse and _RemainingTimeInHouse.Parent then
		local _Name = _RemainingTimeInHouse.Parent.Parent.Parent.Parent.Name

		if _Name and p481:IsDescendantOf(_Workspace.PlotItems[_Name]) then
			return true
		end
	end
end
function GetTeslaCoilFromPlayerPlot()
	local _RemainingTimeInHouse2 = _G.RemainingTimeInHouse

	if _RemainingTimeInHouse2 and (_RemainingTimeInHouse2.Parent and IsPlayerInsideSafeZone(_LocalPlayer)) then
		return _RemainingTimeInHouse2.Parent.Parent.Parent.Parent.TeslaCoil.ZapPart
	end
end
function CheckObjectsAroundPlayer()
	local v485 = GetPlayerRoot()

	if v485 then
		local v486 = {}
		local u487 = nil

		local function v492(p488)
			if not (p488:IsDescendantOf(_Workspace.Map) or (p488:IsDescendantOf(_Workspace.Plots) or p488:IsDescendantOf(_Workspace.Waypoints))) and (not p488:IsDescendantOf(_Workspace.Slots) and p488.Parent and p488.Parent:IsA('Model')) and (p488.Parent:FindFirstChildOfClass('BasePart') or p488.Parent:FindFirstChildOfClass('Part') or p488.Parent:FindFirstChildOfClass('MeshPart')) then
				local _Parent6 = p488.Parent
				local _Connected2 = _Parent6:GetAttribute('Connected2')

				if CheckIfKunaiIsOnPlayer(_Parent6) == 'Using' or CheckIfPlayerIsHoldingFood(_Parent6) == 'Using' then
					return false
				end
				if not IsItemInPlayerPlot(_Parent6) then
					return false
				end

				u487 = GetTeslaCoilFromPlayerPlot()

				local v491

				if _Parent6:FindFirstChildOfClass('Humanoid') then
					v491 = _Players:GetPlayerFromCharacter(_Parent6)
				else
					v491 = nil
				end
				if not (v491 or _Connected2) then
					return true
				end
			end
		end

		local v493 = _Workspace:GetPartBoundsInRadius(v485.Position, 28, COAroundPParams)
		local v494, v495, v496 = pairs(v493)
		local v497 = u487

		while true do
			local v498

			v496, v498 = v494(v495, v496)

			if v496 == nil then
				break
			end
			if v492(v498) then
				local _Parent7 = v498.Parent

				if not table.find(v486, _Parent7) then
					table.insert(v486, _Parent7)
				end
			end
		end

		return v486, v497
	end
end

local u500 = nil

local function u514()
	local v501 = GetPlayerCFrame()
	local v502 = u17
	local v503, v504, v505 = pairs(v502:GetChildren())
	local u506 = nil

	while true do
		local v507, v508 = v503(v504, v505)

		if v507 == nil then
			break
		end

		v505 = v507

		if v508.Name == 'SprayCanWD' and (v508:FindFirstChild('StickyRemoverPart') and v508.PrimaryPart) and Getdistancefromcharacter(v508.PrimaryPart.Position) < 30 then
			if v508.StickyRemoverPart:FindFirstChildOfClass('TouchTransmitter') then
				u506 = v508
			else
				DeleteToyRE:FireServer(v508)
			end
		end
	end

	if not u506 then
		if v501 then
			local v509 = {
				'SprayCanWD',
				CFrame.new(v501.Position.X, v501.Position.Y, v501.Position.Z, -0.133750245, -0.471861839, 0.871468484, -3.7252903e-9, 0.879369617, 0.476139903, -0.991015136, 0.0636838302, -0.117615893),
				Vector3.new(0, 97.69000244140625, 0),
			}

			SpawnToy(v509)
		end

		BuyToy:InvokeServer('SprayCanWD')
	end
	if u506 and not u506:GetAttribute('Connected2') then
		local u511 = u506.DescendantAdded:Connect(function(p510)
			if p510.Name == 'PartOwner' and p510.Value ~= _LocalPlayer.Name then
				u506:SetAttribute('AlreadySetOwnerShip', false)
			end
		end)
		local _Hitbox = u506:FindFirstChild('Hitbox')
		local _StickyRemoverPart = u506:FindFirstChild('StickyRemoverPart')

		task.spawn(function()
			while u506.Parent do
				if not _StickyRemoverPart:FindFirstChildOfClass('TouchTransmitter') then
					DeleteToyRE:FireServer(u506)
				end

				task.wait(5)
			end
		end)
		task.spawn(function()
			while u506.Parent do
				if not u506:GetAttribute('AlreadySetOwnerShip') then
					if SNOWshipOnce(_Hitbox) then
						u506:SetAttribute('AlreadySetOwnerShip', true)
					elseif Getdistancefromcharacter(_Hitbox.Position) > 30 then
						DeleteToyRE:FireServer(u506)
					end
				end

				task.wait(0.1)
			end

			u500 = nil

			u511:Disconnect()
		end)
		u506:SetAttribute('Connected2', true)
	end

	u500 = u506
end
local function u515()
	if u500 then
		return u500
	end

	u514()
end
local function u522(p516)
	local u517 = u515()
	local v518 = nil
	local _Character = _LocalPlayer.Character

	if _Character then
		_Character = _Character:FindFirstChild('Head')
	end
	if u517 then
		v518 = u517.PrimaryPart
	end
	if u517 and _Character and v518 then
		local _StickyRemoverPart2 = u517:FindFirstChild('StickyRemoverPart')

		if not v518:FindFirstChild('SprayPosRemove') and u517:GetAttribute('AlreadySetOwnerShip') then
			SetModelProperties(u517)

			local _BodyPosition2 = Instance.new('BodyPosition', v518)

			_BodyPosition2.Name = 'SprayPosRemove'
			_BodyPosition2.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

			Vector3.new(-453, math.random(50, 100), 1081)
			task.spawn(function()
				while u517.Parent do
					_BodyPosition2.Position = _Character.Position + Vector3.new(10, 500, 0)

					task.wait()
				end
			end)
		end
		if _StickyRemoverPart2 and u517:GetAttribute('AlreadySetOwnerShip') then
			_StickyRemoverPart2.Position = p516.Position

			task.wait()

			_StickyRemoverPart2.Position = v518.Position
		end
	end
end

KunaiFound = nil

function CheckIfKunaiIsOnPlayer(p523)
	if typeof(p523) == 'Instance' and (p523:IsA('Model') and p523.Parent) then
		local _StickyPart = p523:FindFirstChild('StickyPart')
		local v525 = GetPlayerCharacter()
		local v526 = _StickyPart and _StickyPart:FindFirstChild('StickyWeld')

		if v526 then
			local _Part16 = v526.Part1

			return v526.Enabled ~= false and (_Part16 and (_Part16:IsDescendantOf(v525) and 'Using' or 'Used') or 'No use!') or 'Useless'
		end
	end
end
function CheckIfPlayerIsHoldingFood(p528)
	if typeof(p528) == 'Instance' and (p528:IsA('Model') and p528.Parent) then
		local _HoldPart = p528:FindFirstChild('HoldPart')
		local v530 = GetPlayerCharacter()
		local v531 = _HoldPart and _HoldPart:FindFirstChild('RigidConstraint')

		if v531 then
			local _Attachment1 = v531.Attachment1

			return v531.Enabled ~= false and (_Attachment1 and (_Attachment1:IsDescendantOf(v530) and 'Using' or 'Used') or 'No use!') or 'Useless'
		end
	end
end
function CheckKunai()
	if not KunaiFound then
		local v533 = GetPlayerCFrame()
		local v534 = u17
		local v535, v536, v537 = pairs(v534:GetChildren())
		local u538 = nil

		while true do
			local v539, v540 = v535(v536, v537)

			if v539 == nil then
				break
			end

			v537 = v539

			if v540.Name == 'NinjaKunai' and (v540.PrimaryPart and v540.Parent) then
				if CheckIfKunaiIsOnPlayer(v540) ~= 'No use!' or 30 >= Getdistancefromcharacter(v540.PrimaryPart.Position) then
					if CheckIfKunaiIsOnPlayer(v540) ~= 'Useless' then
						u538 = v540
					else
						DeleteToyRE:FireServer(v540)
					end
				else
					DeleteToyRE:FireServer(v540)
					print('Destroy1')
				end
			end
		end

		if not u538 then
			if v533 then
				local v541 = {
					'NinjaKunai',
					CFrame.new(v533.Position.X, v533.Position.Y, v533.Position.Z, -0.133750245, -0.471861839, 0.871468484, -3.7252903e-9, 0.879369617, 0.476139903, -0.991015136, 0.0636838302, -0.117615893),
					Vector3.new(0, 97.69000244140625, 0),
				}

				SpawnToy(v541)
			end

			BuyToy:InvokeServer('NinjaKunai')
		end
		if u538 and not u538:GetAttribute('Connected2') and u538:FindFirstChild('StickyPart') and (u538.StickyPart:FindFirstChild('StickyWeld') and u538.Parent) then
			local _StickyPart2 = u538.StickyPart
			local _ = _StickyPart2.StickyWeld
			local u543 = SetKunaiToyAntiKick(u538)
			local u544 = {
				_StickyPart2,
				_LocalPlayer.Character:FindFirstChild('Left Leg'),
				CFrame.new(0, -0.5, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)),
			}
			local u546 = u538.DescendantAdded:Connect(function(p545)
				if p545.Name == 'PartOwner' and p545.Value ~= _LocalPlayer.Name then
					u538:SetAttribute('AlreadySetOwnerShip', false)
				end
			end)

			task.spawn(function()
				while u538.Parent do
					if CheckIfKunaiIsOnPlayer(u538) == 'Useless' then
						DeleteToyRE:FireServer(u538)
					end
					if CheckIfKunaiIsOnPlayer(u538) ~= 'Used' then
						if CheckIfKunaiIsOnPlayer(u538) == 'No use!' then
							if Getdistancefromcharacter(_StickyPart2.Position) >= 30 then
								DeleteToyRE:FireServer(u538)
							elseif SNOWshipOnce(_StickyPart2) then
								_ReplicatedStorage:WaitForChild('PlayerEvents'):WaitForChild('StickyPartEvent'):FireServer(unpack(u544))
							end
						end
					elseif Getdistancefromcharacter(_StickyPart2.Position) >= 30 then
						DeleteToyRE:FireServer(u538)
					else
						SNOWship(_StickyPart2)
					end

					task.wait()
				end

				print('Pew!')
			end)
			task.spawn(function()
				while u538.Parent do
					if not u538:GetAttribute('AlreadySetOwnerShip') then
						if SNOWshipOnce(_StickyPart2) then
							if CheckIfKunaiIsOnPlayer(u538) ~= 'Using' then
								_ReplicatedStorage:WaitForChild('PlayerEvents'):WaitForChild('StickyPartEvent'):FireServer(unpack(u544))

								if not _G.FirstFloppaMessage then
									u543("Don't worry my buddy, you won't get kicked", 3)

									_G.FirstFloppaMessage = true
								end
							else
								u538:SetAttribute('AlreadySetOwnerShip', true)
							end
						elseif Getdistancefromcharacter(_StickyPart2.Position) > 30 then
							DeleteToyRE:FireServer(u538)
						end
					end

					task.wait()
				end

				_StickyPart2 = nil
				KunaiFound = nil
				ShurikenEquipped = false

				u546:Disconnect()
				print('Pew!')
			end)
			u538:SetAttribute('Connected2', true)
		end

		KunaiFound = u538
	end
end
function GetKunai()
	if not KunaiFound then
		CheckKunai()
	end
end

local u547 = nil
local u548 = nil

local function u552(p549)
	if p549 then
		local _EdiblePart = p549:FindFirstChild('EdiblePart')
		local _HoldPart2 = p549:FindFirstChild('HoldPart')

		if _HoldPart2 then
			_HoldPart2 = _HoldPart2.RigidConstraint.Attachment1
		end
		if not (_EdiblePart or _HoldPart2) then
			return true
		end
	end
end
local function u570()
	local v553 = GetPlayerCFrame()
	local v554 = u17
	local v555, v556, v557 = pairs(v554:GetChildren())
	local u558 = nil

	while true do
		local v559

		v557, v559 = v555(v556, v557)

		if v557 == nil then
			break
		end
		if v559.Name == 'FoodBanana' and v559:GetAttribute('RagdollToy') then
			if u552(v559) then
				u558 = v559
			end
		end
	end

	if not u558 then
		local _FoodBanana = u17:FindFirstChild('FoodBanana')

		if _FoodBanana then
			if u552(_FoodBanana) then
				_FoodBanana:SetAttribute('RagdollToy', true)
			else
				local _EdiblePart2 = _FoodBanana:FindFirstChild('EdiblePart')
				local _HoldPart3 = _FoodBanana.HoldPart
				local _RigidConstraint = _HoldPart3.RigidConstraint

				if _EdiblePart2 and not _RigidConstraint.Attachment1 then
					local v564 = {
						_FoodBanana,
						_LocalPlayer.Character,
					}

					_HoldPart3.HoldItemRemoteFunction:InvokeServer(unpack(v564))
				elseif _EdiblePart2 and _RigidConstraint.Attachment1 and (_RigidConstraint.Attachment1:IsDescendantOf(_LocalPlayer.Character) and not _HoldPart3.EatingSound.IsPlaying) then
					_ReplicatedStorage.HoldEvents.Use:FireServer(_FoodBanana)
					task.wait(0.5)
				elseif not _EdiblePart2 and _RigidConstraint.Attachment1 and _RigidConstraint.Attachment1:IsDescendantOf(_LocalPlayer.Character) then
					local v565 = {
						_FoodBanana,
						CFrame.new(v553.Position.X, v553.Position.Y, v553.Position.Z, -0.133750245, -0.471861839, 0.871468484, -3.7252903e-9, 0.879369617, 0.476139903, -0.991015136, 0.0636838302, -0.117615893),
						Vector3.new(0, 97.69000244140625, 0),
					}

					_HoldPart3.DropItemRemoteFunction:InvokeServer(unpack(v565))
				end
			end
		else
			local v566 = {
				'FoodBanana',
				CFrame.new(508.073517, 67.2614441, -261.901917, -0.133750245, -0.471861839, 0.871468484, -3.7252903e-9, 0.879369617, 0.476139903, -0.991015136, 0.0636838302, -0.117615893),
				Vector3.new(0, 97.69000244140625, 0),
			}

			SpawnToy(v566)
			BuyToy:InvokeServer('FoodBanana')
		end
	end
	if u558 and u558:FindFirstChild('HoldPart') and (u558.HoldPart:FindFirstChild('RigidConstraint') and not u558:GetAttribute('Connected2')) then
		local u568 = u558.DescendantAdded:Connect(function(p567)
			if p567.Name == 'PartOwner' and p567.Value ~= _LocalPlayer.Name then
				u558:SetAttribute('AlreadySetOwnerShip', nil)
			end
		end)
		local _HitboxPart = u558:FindFirstChild('HitboxPart')

		task.spawn(function()
			while u558.Parent do
				if not u558:GetAttribute('AlreadySetOwnerShip') then
					if SNOWshipOnce(_HitboxPart) then
						for _ = 1, 15 do
							_DestroyGrabLine:FireServer(_HitboxPart)
							task.wait()
						end

						u558:SetAttribute('AlreadySetOwnerShip', true)
					elseif Getdistancefromcharacter(_HitboxPart.Position) > 30 then
						DeleteToyRE:FireServer(u558)
					end
				end

				task.wait(0.1)
			end

			u568:Disconnect()

			u547 = nil
			u548 = nil
			_HitboxPart = nil
		end)
		u558:SetAttribute('Connected2', true)
	end

	u547 = u558
end
local function u571()
	if u547 and u547.Parent ~= nil then
		return u547
	end

	u570()
end
local function u582(p572)
	local u573 = u571()
	local v574 = nil
	local _Character2 = _LocalPlayer.Character

	if _Character2 then
		_Character2 = _Character2:FindFirstChild('Head')
	end
	if u573 then
		v574 = u573.PrimaryPart
	end
	if u573 and _Character2 and v574 then
		if not u548 then
			local v576, v577, v578 = pairs(u573:GetChildren())

			while true do
				local v579

				v578, v579 = v576(v577, v578)

				if v578 == nil then
					break
				end
				if v579.Name == 'BananaPeel' and v579:FindFirstChildOfClass('TouchTransmitter') then
					u548 = v579
				end
			end

			print('Done!')
		end

		local v580 = u548

		v580.Size = Vector3.new(2, 2, 2)
		v580.Transparency = 1

		if not v574:FindFirstChild('FoodBananaPosRemove') and u573:GetAttribute('AlreadySetOwnerShip') then
			SetModelProperties(u573)

			local _BodyPosition3 = Instance.new('BodyPosition', u573.PrimaryPart)

			_BodyPosition3.Name = 'FoodBananaPosRemove'
			_BodyPosition3.MaxForce = Vector3.new(12500, 12500, 12500)

			task.spawn(function()
				while u573.Parent do
					_BodyPosition3.Position = _Character2.Position + Vector3.new(0, 500, 0)

					task.wait()
				end
			end)
		end
		if v580 and p572 and u573:GetAttribute('AlreadySetOwnerShip') then
			v580.Position = p572.Position

			task.wait()

			v580.Position = v574.Position
		end
	end
end

local u583 = nil

holdfirePartFound = nil

function checkHoldFirePart()
	local v584 = u17
	local v585, v586, v587 = pairs(v584:GetChildren())
	local v588 = nil

	while true do
		local v589

		v587, v589 = v585(v586, v587)

		if v587 == nil then
			break
		end
		if v589.Name == 'Campfire' and not v589:GetAttribute('FirePlayerPart') then
			if v589.FirePlayerPart.CanBurn.Value then
				v588 = v589
			end
		end
	end

	if not v588 then
		local v590 = {
			'Campfire',
			CFrame.new(508.073517, 67.2614441, -261.901917, -0.133750245, -0.471861839, 0.871468484, -3.7252903e-9, 0.879369617, 0.476139903, -0.991015136, 0.0636838302, -0.117615893),
			Vector3.new(0, 97.69000244140625, 0),
		}

		SpawnToy(v590)
		BuyToy:InvokeServer('Campfire')
	end

	holdfirePartFound = v588
end

local function u591()
	if holdfirePartFound and holdfirePartFound.Parent ~= nil then
		return holdfirePartFound
	end

	checkHoldFirePart()
end
local function u604()
	local v592 = GetPlayerCFrame()
	local v593 = u17
	local v594, v595, v596 = pairs(v593:GetChildren())
	local u597 = nil
	local u598 = nil

	while true do
		local v599

		v596, v599 = v594(v595, v596)

		if v596 == nil then
			break
		end
		if v599.Name == 'Campfire' and v599.PrimaryPart then
			if Getdistancefromcharacter(v599.PrimaryPart.Position) < 30 and v599.FirePlayerPart.CanBurn.Value then
				u597 = v599
			end
		end
	end

	if not u597 then
		if v592 then
			local v600 = {
				'Campfire',
				CFrame.new(v592.Position.X, v592.Position.Y, v592.Position.Z, -0.133750245, -0.471861839, 0.871468484, -3.7252903e-9, 0.879369617, 0.476139903, -0.991015136, 0.0636838302, -0.117615893),
				Vector3.new(0, 97.69000244140625, 0),
			}

			SpawnToy(v600)
		end

		BuyToy:InvokeServer('Campfire')
	end
	if u597 and u597:FindFirstChild('FirePlayerPart') and (u597.FirePlayerPart:FindFirstChild('CanBurn') and not u597:GetAttribute('Connected2')) then
		local u602 = u597.DescendantAdded:Connect(function(p601)
			if p601.Name == 'PartOwner' and p601.Value ~= _LocalPlayer.Name then
				u597:SetAttribute('AlreadySetOwnerShip', false)
			end
		end)

		task.spawn(function()
			lastpos = GetPlayerCFrame()
			u598 = u597.FirePlayerPart

			while u597.Parent do
				local v603 = not u597.FirePlayerPart.CanBurn.Value and u591()

				if v603 then
					u598.Position = v603.FirePlayerPart.Position
				end
				if not u597:GetAttribute('AlreadySetOwnerShip') then
					if SNOWshipOnce(u598) then
						u597:SetAttribute('AlreadySetOwnerShip', true)
					elseif Getdistancefromcharacter(u598.Position) > 30 then
						DeleteToyRE:FireServer(u597)
					end
				end

				task.wait(0.1)
			end

			u602:Disconnect()
			print('Pew!')
		end)
		u597:SetAttribute('Connected2', true)
	end

	u583 = u597
end
local function u605()
	if u583 and u583.Parent ~= nil then
		return u583
	end

	u604()
end
local function u613(p606)
	local u607 = u605()
	local v608 = nil
	local _Character3 = _LocalPlayer.Character

	if _Character3 then
		_Character3 = _Character3:FindFirstChild('Head')
	end
	if u607 then
		v608 = u607.PrimaryPart
	end
	if u607 and _Character3 and v608 then
		local _FirePlayerPart2 = u607:FindFirstChild('FirePlayerPart')
		local _CampfirePosRemove = v608:FindFirstChild('CampfirePosRemove')

		_FirePlayerPart2.Size = Vector3.new(2, 2, 2)

		if not _CampfirePosRemove and u607:GetAttribute('AlreadySetOwnerShip') then
			SetModelProperties(u607)

			local _BodyPosition4 = Instance.new('BodyPosition', u607.PrimaryPart)

			_BodyPosition4.Name = 'CampfirePosRemove'
			_BodyPosition4.MaxForce = Vector3.new(12500, 12500, 12500)

			Vector3.new(-453, math.random(50, 100), 1081)
			task.spawn(function()
				while u607.Parent do
					_BodyPosition4.Position = _Character3.Position + Vector3.new(5, 500, 0)

					task.wait()
				end
			end)
		end
		if _FirePlayerPart2 and p606 and (u607:GetAttribute('AlreadySetOwnerShip') and v608) then
			_FirePlayerPart2.Position = p606.Position

			task.wait()

			_FirePlayerPart2.Position = v608.Position
		end
	end
end

smalldiceToyFound = nil

function CheckFakeAim()
	local v614 = GetPlayerCFrame()
	local v615 = u17
	local v616, v617, v618 = pairs(v615:GetChildren())
	local u619 = nil

	while true do
		local v620

		v618, v620 = v616(v617, v618)

		if v618 == nil then
			break
		end
		if v620.Name == 'DiceSmall' and v620:FindFirstChild('Center') then
			if v620.PrimaryPart and Getdistancefromcharacter(v620.PrimaryPart.Position) < 30 then
				u619 = v620
			end
		end
	end

	if not u619 then
		if v614 then
			local v621 = {
				'DiceSmall',
				CFrame.new(v614.Position.X, v614.Position.Y, v614.Position.Z, -0.133750245, -0.471861839, 0.871468484, -3.7252903e-9, 0.879369617, 0.476139903, -0.991015136, 0.0636838302, -0.117615893),
				Vector3.new(0, 97.69000244140625, 0),
			}

			SpawnToy(v621)
		end

		BuyToy:InvokeServer('DiceSmall')
	end
	if u619 and u619:FindFirstChild('Center') and not u619:GetAttribute('Connected2') then
		local u623 = u619.DescendantAdded:Connect(function(p622)
			if p622.Name == 'PartOwner' and p622.Value ~= _LocalPlayer.Name then
				u619:SetAttribute('AlreadySetOwnerShip', false)
			end
		end)
		local _SoundPart = u619:FindFirstChild('SoundPart')

		task.spawn(function()
			while u619.Parent do
				if not u619:GetAttribute('AlreadySetOwnerShip') then
					if SNOWshipOnce(_SoundPart) then
						u619:SetAttribute('AlreadySetOwnerShip', true)
					elseif Getdistancefromcharacter(_SoundPart.Position) > 30 then
						DeleteToyRE:FireServer(u619)
					end
				end
				if not _G.FireworkEffectSpam then
					DeleteToyRE:FireServer(u619)
				end

				task.wait(0.1)
			end

			_SoundPart = nil
			smalldiceToyFound = nil
			u619 = nil

			u623:Disconnect()
			print('Pew!')
		end)
		u619:SetAttribute('Connected2', true)
	end

	smalldiceToyFound = u619
end
function GetFakeAim()
	if smalldiceToyFound and smalldiceToyFound.Parent ~= nil then
		return smalldiceToyFound
	end

	CheckFakeAim()
end
function GetFakeAim2()
	local u625 = GetFakeAim()
	local _Character4 = _LocalPlayer.Character
	local v627

	if u625 then
		v627 = u625.PrimaryPart
	else
		v627 = nil
	end
	if u625 and _Character4 and v627 then
		hitpart = u625:FindFirstChild('StickyRemoverPart')

		if not v627:FindFirstChild('AimPosRemove') and u625:GetAttribute('AlreadySetOwnerShip') then
			SetAimPart(u625)

			local _BodyPosition5 = Instance.new('BodyPosition', v627)

			_BodyPosition5.Name = 'AimPosRemove'
			_BodyPosition5.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			_BodyPosition5.P = 40000
			_BodyPosition5.D = 950

			local u629 = nil
			local u630 = nil
			local u631 = nil

			task.spawn(function()
				while u625.Parent do
					if _LocalPlayer.Character and _LocalPlayer.Character:FindFirstChild('CamPart') then
						u629 = Ray.new(_LocalPlayer.Character.CamPart.Position, _LocalPlayer.Character.CamPart.CFrame.lookVector * 5000)

						local v632, v633 = _Workspace:FindPartOnRayWithIgnoreList(u629, {
							_LocalPlayer.Character,
							u17,
						})

						u631 = v633
						u630 = v632

						if u630 and u631 then
							_BodyPosition5.Position = u631
						end
					end

					task.wait()
				end
			end)
		end

		return v627
	end
end

local u634 = nil

local function u643()
	local v635 = GetPlayerCharacter()
	local v636 = u17
	local v637, v638, v639 = pairs(v636:GetChildren())
	local v640 = nil

	while true do
		local v641

		v639, v641 = v637(v638, v639)

		if v639 == nil then
			break
		end
		if v641.Name == 'CreatureBlobman' then
			v640 = v641
		end
	end

	if not v640 then
		if u17:FindFirstChild('CreatureBlobman') then
			v640 = u17.CreatureBlobman
		else
			local v642 = {
				'CreatureBlobman',
				CFrame.new(v635.Head.Position),
				Vector3.new(0, 97.69000244140625, 0),
			}

			SpawnToy(v642)
			BuyToy:InvokeServer('CreatureBlobman')
		end
	end

	u634 = v640
end
local function u644()
	if u634 and u634.Parent then
		return u634
	end

	u643()
end

local v645 = u3
local v646 = u3.MakeWindow(v645, {
	Name = 'Fling Things and People',
	HidePremium = true,
	SaveConfig = true,
	ConfigFolder = 'FTAPConfig',
	IntroEnabled = false,
	KeyToOpenWindow = 'M',
	FreeMouse = true,
})
local v647 = v646:MakeTab({
	Name = 'Combat',
	Icon = 'rbxassetid://7485051715',
	PremiumOnly = false,
})

LongReachGrab_Player = v646:MakeTab({
	Name = 'Blobman Grab',
	Icon = 'rbxassetid://7734058599',
	PremiumOnly = false,
})

local v648 = v646:MakeTab({
	Name = 'Invincibility',
	Icon = 'rbxassetid://7734056608',
	PremiumOnly = false,
})
local v649 = v646:MakeTab({
	Name = 'Player',
	Icon = 'rbxassetid://7743871002',
	PremiumOnly = false,
})

Esp_Tab = v646:MakeTab({
	Name = 'ESP',
	Icon = 'rbxassetid://7733774602',
	PremiumOnly = false,
})

local v650 = v646:MakeTab({
	Name = 'Explosions',
	Icon = 'rbxassetid://17837704089',
	PremiumOnly = false,
})
local v651 = v646:MakeTab({
	Name = 'Teleport',
	Icon = 'rbxassetid://7733992829',
	PremiumOnly = false,
})
local v652 = v646:MakeTab({
	Name = 'Custom Line',
	Icon = 'rbxassetid://7734022107',
	PremiumOnly = false,
})
local v653 = v646:MakeTab({
	Name = 'Grab Auras',
	Icon = 'rbxassetid://7733955740',
	PremiumOnly = false,
})
local v654 = v646:MakeTab({
	Name = 'Keybinds',
	Icon = 'rbxassetid://11710306232',
	PremiumOnly = false,
})
local v655 = v646:MakeTab({
	Name = 'Loop Players',
	Icon = 'rbxassetid://7733964640',
	PremiumOnly = false,
})
local v656 = v646:MakeTab({
	Name = 'Auto',
	Icon = 'rbxassetid://7733916988',
	PremiumOnly = false,
})
local v657 = v646:MakeTab({
	Name = 'Misc',
	Icon = 'rbxassetid://7733917120',
	PremiumOnly = false,
})
local u658 = v646:MakeTab({
	Name = 'Discord Server',
	Icon = 'rbxassetid://16570630989',
	PremiumOnly = false,
})
local v659 = v646:MakeTab({
	Name = 'Config',
	Icon = 'rbxassetid://7734053495',
	PremiumOnly = false,
})

v646:MakeTab({
	Name = 'Premium Info',
	Icon = 'rbxassetid://7734053495',
	PremiumOnly = false,
})

local v660 = v646:MakeTab({
	Name = 'Credits',
	Icon = 'rbxassetid://7733687281',
	PremiumOnly = false,
})
local u661 = nil

task.spawn(function()

	local v664 = u658:AddSection({
		Name = 'Discord Server',
	})
	local u661 = "https://discord.gg/25ms"
	v664:AddLabel(u661)
	v664:AddButton({
		Name = 'Copy Discord Server Link',
		Callback = function()
			setclipboard(u661)
			u33('Copied to your clipboard')
		end,
	})
	v664:AddLabel('Join my discord server to see updates!')
end)

local v665 = v660:AddSection({
	Name = '1# Medal credits',
})
local v666 = v660:AddSection({
	Name = '2# Medal credits',
})
local v667 = v660:AddSection({
	Name = '3# Medal credits',
})
local _UserService = game:GetService('UserService')
local u669 = {
	90063030,
	2298910483,
	1030559478,
	1762306425,
	542649826,
	237152138,
	1390422876,
	3089724826,
	882860613,
	7280113503,
	3485279105,
}
local v670 = {}
local v671, v672 = pcall(function()
	return _UserService:GetUserInfosByUserIdsAsync(u669)
end)

if v671 and v672 then
	local v673, v674, v675 = pairs(u669)
	local v676 = u669

	while true do
		local v677

		v675, v677 = v673(v674, v675)

		if v675 == nil then
			break
		end

		local v678, v679, v680 = pairs(v672)

		while true do
			local v681

			v680, v681 = v678(v679, v680)

			if v680 == nil then
				break
			end
			if v681.Id == v677 then
				table.insert(v670, v681)
			end
		end
	end

	local v682, v683, v684 = pairs(v676)
	local v685 = v670

	while true do
		local v686, _ = v682(v683, v684)

		if v686 == nil then
			break
		end

		v684 = v686

		if not v670[v686] then
			v685[v686] = {
				DisplayName = 'deleted',
				Username = 'deleted',
			}
		end
	end

	v665:AddParagraph(v670[1].DisplayName .. ' (' .. v670[1].Username .. ')', 'I made the whole GUI (Combat, Player, Auras and more) XD!')
	v665:AddParagraph(v670[2].DisplayName .. ' (' .. v670[2].Username .. ')', 'Thanks for giving me inspiration to create the blobman functions, Massless Grab and Line color changer script!')
	v665:AddParagraph(v670[3].DisplayName .. ' (' .. v670[3].Username .. ') ' .. 'and ' .. v670[6].DisplayName .. ' (' .. v670[6].Username .. ')', 'Thanks for sharing the Attraction Aura, Silent Aim, Further Extend scripts for me!')
	v665:AddParagraph(v670[7].DisplayName .. ' (' .. v670[7].Username .. ')', 'Thanks for helping me to fix kick stuff and my anti-blobman')
	v665:AddParagraph(v670[8].DisplayName .. ' (' .. v670[8].Username .. ')', 'Thanks for explosion stuff, fireproximityprompt fix and script updater')
	v665:AddParagraph(v670[9].DisplayName .. ' (' .. v670[9].Username .. ')', 'Thanks for laggy stuff!')
	v665:AddParagraph(v670[10].DisplayName .. ' (' .. v670[10].Username .. ')', 'Thanks for Anchor Objects Glue/Compile')
	v665:AddParagraph(v670[11].DisplayName .. ' (' .. v670[11].Username .. ')', 'Thanks for Tornado Shape')
	v666:AddParagraph(v670[4].DisplayName .. ' (' .. v670[4].Username .. ')', 'Thanks for releasing my script!')
	v667:AddParagraph(v670[5].DisplayName .. ' (' .. v670[5].Username .. ')', 'Thanks for testing my scripts')
end

PerspectiveEffect = Instance.new('ScreenGui')
ImageLabel = Instance.new('ImageLabel')
PerspectiveSaturation = Instance.new('ColorCorrectionEffect', _Lighting)
PerspectiveEffect.Name = 'PerspectiveEffect'
PerspectiveEffect.DisplayOrder = -5
PerspectiveEffect.Enabled = true
PerspectiveEffect.IgnoreGuiInset = true
PerspectiveEffect.ResetOnSpawn = false
PerspectiveEffect.Parent = _LocalPlayer.PlayerGui
ImageLabel.Parent = PerspectiveEffect
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Size = UDim2.new(1, 0, 1, 0)
ImageLabel.Image = 'rbxassetid://8586979842'
ImageLabel.ImageTransparency = 1
PerspectiveSaturation.Enabled = true
PerspectiveSaturation.Saturation = 0
imagestransparencyeffect = 0.65
saturationvalue = -0.3
t1p = TweenInfo.new(0.6, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
t2p = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)

local v687 = _TweenService

perspectiveON_effect1 = _TweenService.Create(v687, ImageLabel, t1p, {ImageTransparency = imagestransparencyeffect})

local v688 = _TweenService

perspectiveON_effect2 = _TweenService.Create(v688, PerspectiveSaturation, t1p, {Saturation = saturationvalue})

local v689 = _TweenService

perspectiveOff_effect1 = _TweenService.Create(v689, ImageLabel, t2p, {ImageTransparency = 1})

local v690 = _TweenService

perspectiveOff_effect2 = _TweenService.Create(v690, PerspectiveSaturation, t2p, {Saturation = 0})

function PerspectiveOnEffect()
	perspectiveON_effect1:Play()
	perspectiveON_effect2:Play()
end
function PerspectiveOffEffect()
	perspectiveOff_effect1:Play()
	perspectiveOff_effect2:Play()
end

local function u692(p691)
	if p691 and _G.PerspectiveEffectsAllow then
		PerspectiveOnEffect()
	else
		PerspectiveOffEffect()
	end
end

gui = Instance.new('ScreenGui')
gui.ResetOnSpawn = false
CAG = _LocalPlayer.PlayerGui:FindFirstChild('ContextActionGui')

function IsMobile()
	if _LocalPlayer.PlayerGui:FindFirstChild('ContextActionGui') then
		return true
	end
end

if IsMobile() then
	gui.Parent = _LocalPlayer.PlayerGui
end

scriptToGetSenv = nil
senv = nil
minDistance = 3
pcDistance = 0
imageButton = Instance.new('ImageButton')
imageButton.Size = UDim2.new(0, 45, 0, 45)
imageButton.Position = UDim2.new(1, -70, 1, -259)
imageButton.Image = 'rbxassetid://97166444'
imageButton.BackgroundTransparency = 1
imageButton.ImageTransparency = 0.2
imageButton.Visible = false
imageButton.ImageColor3 = Color3.fromRGB(142, 142, 142)
imageButton.Parent = gui
imageLabel = Instance.new('ImageLabel')
imageLabel.Size = UDim2.new(1, 0, 1, 0)
imageLabel.Image = 'rbxassetid://9603831913'
imageLabel.BackgroundTransparency = 1
imageLabel.Parent = imageButton
imageButtonDe = Instance.new('ImageButton')
imageButtonDe.Size = UDim2.new(0, 45, 0, 45)
imageButtonDe.Position = UDim2.new(1, -70, 1, -211)
imageButtonDe.Image = 'rbxassetid://97166444'
imageButtonDe.BackgroundTransparency = 1
imageButtonDe.ImageTransparency = 0.2
imageButtonDe.Visible = false
imageButtonDe.ImageColor3 = Color3.fromRGB(142, 142, 142)
imageButtonDe.Parent = gui
imageLabelDe = Instance.new('ImageLabel')
imageLabelDe.Size = UDim2.new(1, 0, 1, 0)
imageLabelDe.Image = 'rbxassetid://9603826756'
imageLabelDe.BackgroundTransparency = 1
imageLabelDe.Parent = imageButtonDe
IncreaseLineExtend = 0

function buttonClicked()
	if senv and (senv.distance and _G.FutherExtend) then
		senv.distance = (senv.distance or 0) + IncreaseLineExtend

		if senv.distance < minDistance then
			senv.distance = minDistance
		end
	end
end
function buttonClickedDE()
	if senv and (senv.distance and _G.FutherExtend) then
		senv.distance = (senv.distance or 0) - IncreaseLineExtend

		if senv.distance < minDistance then
			senv.distance = minDistance
		end
	end
end
function toggleButtonState(p693)
	if p693 and _G.FutherExtend then
		imageButton.Visible = true
		imageButton.Active = true
		imageButtonDe.Visible = true
		imageButtonDe.Active = true
	else
		imageButton.Visible = false
		imageButton.Active = false
		imageButtonDe.Visible = false
		imageButtonDe.Active = false
	end
end
function toggleDefaultExtendButtons(p694)
	if CAG then
		local v695, v696, v697 = pairs(CAG:GetDescendants())

		while true do
			local v698

			v697, v698 = v695(v696, v697)

			if v697 == nil then
				break
			end
			if v698:IsA('ImageLabel') and (v698.Image == 'rbxassetid://9603826756' or v698.Image == 'rbxassetid://9603831913') then
				v698.Parent.Visible = p694
			end
		end
	end
end

_Workspace.ChildAdded:Connect(function(p699)
	if p699.Name == 'GrabParts' and (p699:IsA('Model') and not IsHoldingAdminPlayer()) then
		if _G.FutherExtend and _UserInputService.MouseEnabled and not IsMobile() then
			local u700 = p699

			GetPlayerCharacter()

			local v701 = u700

			u700.WaitForChild(v701, 'GrabPart')

			local v702 = u700

			u700.WaitForChild(v702, 'DragPart')

			local u703 = u700.DragPart:Clone()

			u703.Name = 'DragPart1'
			u703.AlignPosition.Attachment1 = u703.DragAttach
			u703.Parent = u700
			pcDistance = (u703.Position - _Workspace.CurrentCamera.CFrame.Position).Magnitude
			u703.AlignOrientation.Enabled = false
			u700.DragPart.AlignPosition.Enabled = false

			task.spawn(function()
				while u700.Parent do
					u703.Position = _Workspace.Camera.CFrame.Position + _Workspace.Camera.CFrame.LookVector * pcDistance

					task.wait()
				end

				pcDistance = 0
			end)
		end
		if _G.FutherExtend and IsMobile() then
			toggleDefaultExtendButtons(false)
			toggleButtonState(true)
		end
	end
end)

local u704 = nil

workspace.ChildRemoved:Connect(function(p705)
	if p705.Name == 'GrabParts' and p705:IsA('Model') then
		toggleButtonState(false)
		toggleDefaultExtendButtons(true)

		_G.HoldingObjectGrabPart = nil

		local v706 = WhatIsHolding(p705)
		local _Part17 = p705.GrabPart.WeldConstraint.Part1
		local v708

		if _Part17.Parent and _Part17.Parent:IsA('Model') then
			v708 = _Part17.Parent:GetAttribute('IsAnchored')
		else
			v708 = nil
		end

		_DestroyGrabLine.Parent = _ReplicatedStorage.GrabEvents

		if u704 then
			task.cancel(u704)
		end
		if v706 == 'Player' or v706 == 'Follow NPC' then
			p705:GetAttribute('IsAnchored')

			if _G.TornadoAura and _G.TornadoMode == 'Click' or v708 then
				_DestroyGrabLine.Parent = nil
				u704 = task.delay(0.2, function()
					_DestroyGrabLine.Parent = _ReplicatedStorage.GrabEvents
				end)
			end
		end

		_CreateGrabLine:FireServer()
	end
end)

local u709 = false

local function u710()
	while u709 do
		buttonClicked()
		wait(0.1)
	end
end
local function u711()
	while u709 do
		buttonClickedDE()
		wait(0.1)
	end
end

local u712 = _UserInputService

imageButton.InputBegan:Connect(function(p713, p714)
	if not p714 and (u712.TouchEnabled and p713.UserInputType == Enum.UserInputType.Touch) then
		u709 = true

		u710()
	end
end)
imageButton.InputEnded:Connect(function(p715)
	if u712.TouchEnabled and p715.UserInputType == Enum.UserInputType.Touch then
		u709 = false
	end
end)
imageButtonDe.InputBegan:Connect(function(p716, p717)
	if not p717 and (u712.TouchEnabled and p716.UserInputType == Enum.UserInputType.Touch) then
		u709 = true

		u711()
	end
end)
imageButtonDe.InputEnded:Connect(function(p718)
	if u712.TouchEnabled and p718.UserInputType == Enum.UserInputType.Touch then
		u709 = false
	end
end)
_UserInputService.InputChanged:Connect(function(p719)
	if p719.UserInputType == Enum.UserInputType.MouseWheel then
		if pcDistance < 11 then
			pcDistance = 11
		end
		if p719.Position.Z <= 0 then
			if p719.Position.Z < 0 then
				pcDistance = pcDistance - IncreaseLineExtend
			end
		else
			pcDistance = pcDistance + IncreaseLineExtend
		end
	end
end)

getgenv().Settings = {
	Fov = 150,
	Hitbox = {
		'Head',
		'Torso',
		'Left Leg',
		'Right Leg',
	},
	FovCircle = false,
}

local u720 = _Players
local u721 = _LocalPlayer
local _CurrentCamera2 = _Workspace.CurrentCamera
local v723 = u721

u721.GetMouse(v723)

local u724 = nil

local function u736(_)
	local _huge = math.huge
	local v726 = u720
	local v727, v728, v729 = pairs(v726:GetPlayers())
	local v730 = nil

	while true do
		local v731

		v729, v731 = v727(v728, v729)

		if v729 == nil then
			break
		end
		if v731.Name ~= u721.Name and v731.Character and (u721 and u721.Character) and u721.Character:FindFirstChild('HumanoidRootPart') then
			local _HumanoidRootPart4 = v731.Character:FindFirstChild('HumanoidRootPart')

			if _HumanoidRootPart4 then
				local _Position2 = u721.Character.HumanoidRootPart.Position
				local _, v734 = _CurrentCamera2:WorldToScreenPoint(_HumanoidRootPart4.Position)

				if v734 then
					local _magnitude = (_Position2 - _HumanoidRootPart4.Position).magnitude

					if _magnitude < _huge then
						v730 = v731
						_huge = _magnitude
					end
				end
			end
		end
	end

	return v730
end

local u737 = nil
local u738 = nil
local u739 = nil
local u740 = nil
local _Circle = Drawing.new('Circle')
local _Circle2 = Drawing.new('Circle')

_RunService.RenderStepped:Connect(function()
	if _Circle then
		_Circle.Radius = getgenv().Settings.Fov
		_Circle.Thickness = 2
		_Circle.Position = Vector2.new(_CurrentCamera2.ViewportSize.X / 2, _CurrentCamera2.ViewportSize.Y / 2 + 36)
		_Circle.Transparency = 1
		_Circle.Filled = false
		_Circle.Color = Color3.fromRGB(255, 255, 255)
		_Circle.Visible = getgenv().Settings.FovCircle
		_Circle.ZIndex = 2
	end
	if _Circle2 then
		_Circle2.Radius = getgenv().Settings.Fov
		_Circle2.Thickness = 4
		_Circle2.Position = Vector2.new(_CurrentCamera2.ViewportSize.X / 2, _CurrentCamera2.ViewportSize.Y / 2 + 36)
		_Circle2.Transparency = 1
		_Circle2.Filled = false
		_Circle2.Color = Color3.new()
		_Circle2.Visible = getgenv().Settings.FovCircle
		_Circle2.ZIndex = 1
	end

	u737 = u736(getgenv().Settings.Fov)
end)

local function u746(p743, p744, p745)
	return (p744 - p743).Unit * p745
end

if hookmetamethod then
	local u747 = nil

	u747 = hookmetamethod(game, '__namecall', function(...)
		local v748 = {...}
		local v749 = v748[1]
		local v750 = getnamecallmethod()

		if v749 == workspace and (not checkcaller() and v750 == 'Raycast') and (u737 and u737.Character and (u737.Character.HumanoidRootPart and u721.Character.HumanoidRootPart)) and (u737.Character.Humanoid and 0 < u737.Character.Humanoid.Health and (not u737.InPlot.Value and _G.SilentAim)) then
			local _magnitude2 = (u721.Character.HumanoidRootPart.Position - u737.Character.HumanoidRootPart.Position).magnitude

			u738 = math.random(1, #getgenv().Settings.Hitbox)
			u739 = getgenv().Settings.Hitbox[u738]
			u740 = u737.Character[u739]

			if _magnitude2 <= u724 and u740 then
				v748[3] = u746(v748[2], u737.Character[u739].Position, 1000)
				v748[4] = RaycastParams.new()
				v748[4].FilterDescendantsInstances = {
					u737.Character,
				}
				v748[4].FilterType = Enum.RaycastFilterType.Include
				u738 = nil
				u739 = nil
				u740 = nil
			end
		end

		return u747(unpack(v748))
	end)
end

local function u757()
	local v752, v753, v754 = pairs(_Workspace.Slots:GetChildren())
	local v755 = nil

	while true do
		local v756

		v754, v756 = v752(v753, v754)

		if v754 == nil then
			break
		end
		if v756.SlotHandle.LightBall.Material ~= Enum.Material.Neon then
			v755 = false

			break
		end

		v755 = true
	end

	return v755
end
local function u760(p758)
	local v759

	if _LocalPlayer.Character and _LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
		v759 = _LocalPlayer.Character.HumanoidRootPart
	else
		v759 = nil
	end
	if p758 == 'Spin' then
		if v759 then
			_G.SavedPositionInSpin = v759.CFrame
		end
	elseif p758 == 'House' and v759 then
		_G.SavedPositionOutHouse = v759.CFrame
	end
end
local function u763(p761)
	local v762

	if _LocalPlayer.Character and _LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
		v762 = _LocalPlayer.Character.HumanoidRootPart
	else
		v762 = nil
	end
	if p761 == 'Spin' then
		if v762 then
			v762.CFrame = _G.SavedPositionInSpin
		end
	elseif p761 == 'House' and v762 then
		v762.CFrame = _G.SavedPositionOutHouse
	end
end

local v764 = v656:AddSection({
	Name = 'Auto Get Coins',
})
local v765 = v656:AddSection({
	Name = 'Auto Time-Reset',
})
local v766 = v656:AddSection({
	Name = 'Auto Claim-Plot',
})

timelefttextlabelingame = _Workspace.Slots.Slots.Screen.SlotGui.TimeLeftFrame.TimeText

v764:AddToggle({
	Name = 'Auto-Spin',
	Default = false,
	Callback = function(p767)
		_G.AutoFarmCoins = p767

		if p767 then
			while _G.AutoFarmCoins do
				if u757() and ChangeActivityPriority(5) then
					u760('Spin')

					local u768 = nil
					local v769 = task.spawn(function()
						while true do
							if u768 then
								TeleportPlayer(u768.CFrame + Vector3.new(0, 5, 0), 5)
								task.wait(0.2)
								SNOWship(u768)
							end

							task.wait()
						end
					end)
					local v770, v771, v772 = pairs(_Workspace.Slots:GetChildren())

					while true do
						local v773

						v772, v773 = v770(v771, v772)

						if v772 == nil then
							break
						end

						u768 = v773.SlotHandle.Handle
						u768.CanCollide = false

						local v774 = u768

						for _ = 1, 5 do
							task.wait(0.2)
						end

						v774.CanCollide = true

						if not u757() then
							break
						end
					end

					task.cancel(v769)

					newtask = nil

					ChangeActivityPriority(0)
					u763('Spin')
				end

				task.wait(5)
			end
		end
	end,
	Save = true,
	Flag = 'autofarmcoins_toggle',
})

TimeRemainingLabel = v764:AddLabel('Time Remaining: 0:00')
CoinsWonLabel = v764:AddLabel('Coins Won: 0')

timelefttextlabelingame.Changed:Connect(function(p775)
	if p775 == 'Text' then
		TimeRemainingLabel:Set('Time Remaining: ' .. timelefttextlabelingame.Text)
	end
end)
task.spawn(function()
	local v776, v777, v778 = pairs(_Workspace.Slots:GetDescendants())

	while true do
		local u779

		v778, u779 = v776(v777, v778)

		if v778 == nil then
			break
		end
		if u779.Name == 'CoinAmount' and tostring(u779.Parent) == 'CoinsFrame' then
			u779.Changed:Connect(function(p780)
				local _PlayerName = u779.Parent.Parent.SpinningFrame.PlayerName

				if p780 == 'Text' and (_PlayerName.Text == _LocalPlayer.DisplayName and CoinsWonLabel) then
					CoinsWonLabel:Set(u779.Text)
				end
			end)
		end
	end

	_Workspace.Plots.DescendantAdded:Connect(function(p782)
		if p782.Name == 'Value' and (tostring(p782.Parent) == 'ThisPlotsOwners' and p782.Value == _LocalPlayer.Name) then
			RTime = p782:WaitForChild('TimeRemainingNum', 1)

			if RTime then
				RTime.Changed:Connect(function(p783)
					TimeInHouseLabel:Set('Time: ' .. p783)
				end)
			end
		end
	end)
end)

local function v789()
	local v784, v785, v786 = pairs(_Workspace.Plots:GetDescendants())

	while true do
		local v787

		v786, v787 = v784(v785, v786)

		if v786 == nil then
			break
		end
		if v787.Name == 'TimeRemainingNum' and v787.Parent.Value == _LocalPlayer.Name then
			_G.RemainingTimeInHouse = v787

			v787.Changed:Connect(function(p788)
				TimeInHouseLabel:Set('Time: ' .. p788)
			end)
		end
	end
end

task.spawn(v789)

local u790 = nil

u790 = v765:AddToggle({
	Name = 'Preserve Time',
	Default = false,
	Callback = function(p791)
		_G.AutoSaveHouseTime = p791

		if p791 then
			while _G.AutoSaveHouseTime do
				if _LocalPlayer.InfiniteHouseTime.Value then
					u790:Set(false)
					u3:MakeNotification({
						Name = 'Stop being greedy!',
						Content = 'You already own infinity house gamepass!',
						Image = 'rbxassetid://4483345998',
						Time = 5,
					})

					break
				end

				local _RemainingTimeInHouse3 = _G.RemainingTimeInHouse

				if typeof(_RemainingTimeInHouse3) == 'Instance' and _RemainingTimeInHouse3:IsDescendantOf(_Workspace) and _RemainingTimeInHouse3:IsA('IntValue') then
					local _PlotArea = _G.RemainingTimeInHouse.Parent.Parent.Parent.Parent:FindFirstChild('PlotArea')

					if _RemainingTimeInHouse3.Value < 20 and ChangeActivityPriority(4) then
						u760('House')
						task.wait()

						repeat
							TeleportPlayer(CFrame.new(_PlotArea.Position), 4)
							task.wait(1)
						until _RemainingTimeInHouse3.Parent ~= nil or (not _G.AutoSaveHouseTime or 15 < _RemainingTimeInHouse3.Value)

						u763('House')
						ChangeActivityPriority(0)
					end
				end

				task.wait(2)
			end
		end
	end,
	Save = true,
	Flag = 'autosavehousetimeremaining_toggle',
})
TimeInHouseLabel = v765:AddLabel('Plot Time: 0')

local _IntValue = Instance.new('IntValue')

PlotWorkspace = _Workspace.Plots:GetDescendants()

function GetPlotModel(_)
	local _Plots = _Workspace.Plots
	local _PlotName = _G.PlotName

	if _PlotName == 'Witch House' then
		_Plots = _Plots:FindFirstChild('Plot3')
	elseif _PlotName == 'Lumber House' then
		_Plots = _Plots:FindFirstChild('Plot2')
	elseif _PlotName == 'Common House' then
		_Plots = _Plots:FindFirstChild('Plot1')
	elseif _PlotName == 'American House' then
		_Plots = _Plots:FindFirstChild('Plot4')
	elseif _PlotName == 'Chinese House' then
		_Plots = _Plots:FindFirstChild('Plot5')
	end

	return _Plots
end
function ClaimPlot()
	local v797 = not IsThereOwnerOnPlot() and GetPlotModel(_G.PlotName)

	if v797 then
		local _PlotSign = v797.PlotSign

		local function v804()
			local v799, v800, v801 = pairs(_PlotSign.ThisPlotsOwners:GetChildren())
			local v802 = false

			while true do
				local v803

				v801, v803 = v799(v800, v801)

				if v801 == nil then
					break
				end
				if v803.Value == _LocalPlayer.Name then
					v802 = true
				end
			end

			return v802
		end

		local v805 = _PlotSign
		local v806, v807, v808 = pairs(_PlotSign.GetChildren(v805))

		while true do
			local v809

			v808, v809 = v806(v807, v808)

			if v808 == nil or v804() then
				break
			end
			if v809.Name == 'Sign' and ChangeActivityPriority(3) then
				local _PlusGrabPart = v809.Plus.PlusGrabPart

				TeleportPlayer(_PlusGrabPart.CFrame * CFrame.new(-5, 0, -5), 3)

				for _ = 0, 15 do
					SNOWship(_PlusGrabPart)
					wait()
				end

				ChangeActivityPriority(0)
			end
		end
	end
end
function UpdatePlotOwner()
	local v811 = PlotWorkspace
	local v812, v813, v814 = pairs(v811)

	while true do
		local v815

		v814, v815 = v812(v813, v814)

		if v814 == nil then
			break
		end
		if v815.Name == 'PlayerRole' then
			local _PlayerDisplayName = v815.Parent.PlayerDisplayName
			local u817 = v815
			local _Parent8 = v815.Parent
			local u819 = nil
			local u820 = false

			local function u826()
				u820 = false
				u819 = GetPlotModel(_G.PlotName)

				if u819 and (u817:IsDescendantOf(u819) and u817.Text == 'Owner' and _Parent8.Visible) then
					wait()

					local v821 = _Players
					local v822, v823, v824 = pairs(v821:GetPlayers())

					while true do
						local v825

						v824, v825 = v822(v823, v824)

						if v824 == nil then
							break
						end
						if v825.DisplayName == _PlayerDisplayName.Text then
							u820 = true
						end
					end

					if PlotOwner and u820 then
						PlotOwner:Set('Plot Owner: ' .. _PlayerDisplayName.Text)
					else
						PlotOwner:Set('Plot Available!')
					end
				end
			end

			u817.Changed:Connect(function(p827)
				if p827 == 'Text' then
					u826()
				end
			end)
			_IntValue.Changed:Connect(function(_)
				u826()
			end)
			u826()
		end
	end
end
function IsThereOwnerOnPlot()
	local v828 = GetPlotModel()

	if v828 and v828.PlotSign.ThisPlotsOwners:FindFirstChild('Value') then
		return true
	end
end
function UpdatePeopleInPlot()
	local v829 = PlotWorkspace
	local v830, v831, v832 = pairs(v829)

	while true do
		local u833

		v832, u833 = v830(v831, v832)

		if v832 == nil then
			break
		end
		if u833.Name == 'ThisPlotsOwners' then
			local function u838()
				local v834 = u833
				local v835 = GetPlotModel(_G.PlotName)
				local v836 = v834:GetChildren()

				if v835 and u833:IsDescendantOf(v835) then
					local v837 = table.getn(v836)

					if PlayersInPlot then
						PlayersInPlot:Set('Players in Plot: ' .. v837)
					end
					if v837 == 0 and PlotOwner then
						PlotOwner:Set('Plot Available!')
					end
				end
			end

			_IntValue.Changed:Connect(function(_)
				u838()
			end)
			u833.ChildAdded:Connect(u838)
			u833.ChildRemoved:Connect(u838)
			u838()
		end
	end
end

v766:AddDropdown({
	Name = 'Plot',
	Default = 'Witch House',
	Options = {
		'Witch House',
		'Lumber House',
		'Common House',
		'American House',
		'Chinese House',
	},
	Callback = function(p839)
		_G.PlotName = p839
		_IntValue.Value = _IntValue.Value + 1
	end,
})
task.spawn(function()
	UpdatePlotOwner()
	task.wait()
	UpdatePeopleInPlot()
end)

PlotOwner = v766:AddLabel('Plot Owner:')
PlayersInPlot = v766:AddLabel('Players in Plot: 0')

v766:AddButton({
	Name = 'Claim Plot!',
	Callback = function()
		ClaimPlot()
	end,
})

function ExplodeSb(p840)
	local v841 = {
		{
			Radius = 17.5,
			TimeLength = 0.1,
			Hitbox = p840:FindFirstChild('SoundPart'),
			ExplodesByFire = true,
			MaxForcePerStudSquared = -100,
			DestroysModel = true,
			Model = p840,
			ExplodesByPointy = false,
			ImpactSpeed = 100,
			PositionPart = _LocalPlayer.Character.HumanoidRootPart,
		},
		_LocalPlayer.Character.HumanoidRootPart.Position,
	}

	BombEvents.BombExplode:FireServer(unpack(v841))
end

getgenv().MaxSize = 15

local u842 = {}
local u843 = 0
local u844 = v766:AddLabel("25ms was here")
snowballEffectConnection = nil
snowballMaxAmmount = 20

if _ToysLimitCap.Value == 200 then
	snowballMaxAmmount = 40
end

function checkSize(p845)
	while _G.SnowbalEffectSpam do
		if p845 and p845:IsDescendantOf(_Workspace) and p845:FindFirstChild('SoundPart') then
			local _SoundPart2 = p845:FindFirstChild('SoundPart')
			local _Size = _SoundPart2.Size

			if _Size.X >= MaxSize and _Size.Y >= MaxSize and (_Size.Z >= MaxSize and not u842[_SoundPart2]) then
				u842[_SoundPart2] = true

				break
			end
		end

		task.wait()
	end
end
function checkSnowBall(p848)
	if p848 and p848:FindFirstChild('SoundPart') then
		local _SoundPart3 = p848.SoundPart
		local v850 = RaycastParams.new()

		v850.FilterDescendantsInstances = {p848}
		v850.FilterType = Enum.RaycastFilterType.Exclude

		local v851 = _Workspace:Raycast(_SoundPart3.Position, Vector3.new(0, -100, 0), v850)

		if v851 and v851.Material == Enum.Material.Sand then
			return true
		end
	end
end

lastpossb = nil

function holdOwnership()
	if not _G.SnowbalEffectSpam then
		return
	end

	local v852 = u17
	local v853, v854, v855 = pairs(v852:GetChildren())

	if v857 and v857.Name == 'BallSnowball' and v857:FindFirstChild('SoundPart') then
		local _SoundPart4 = v857:FindFirstChild('SoundPart')

		if not CheckNetworkOwnerShipOnPart(_SoundPart4) then
			if not lastpossb then
				lastpossb = GetPlayerCFrame()
			end

			for _ = 1, 10 do
				if SNOWshipOnce(_SoundPart4) then
					_SoundPart4.CanTouch = false
					_SoundPart4.CanCollide = false

					break
				end

				TeleportPlayer(CFrame.new(_SoundPart4.Position + Vector3.new(0, -10, 0)))
				task.wait(0.1)
			end

			TeleportPlayer(lastpossb)

			lastpossb = nil
		end
	end

	local v857

	v855, v857 = v853(v854, v855)

	if v855 ~= nil and _G.SnowbalEffectSpam then
	else
	end

	task.wait()
end
function CountGrownSnowsballs()
	local v858, v859, v860 = pairs(u842)
	local v861 = 0

	while true do
		local v862

		v860, v862 = v858(v859, v860)

		if v860 == nil then
			break
		end
		if v860:IsDescendantOf(_Workspace) then
			v861 = v861 + 1
		else
			u842[v860] = nil
		end
	end

	u844:Set('Grown Snowballs: ' .. v861)

	return v861
end
function modify(p863)
	local v864 = CFrame.new(-410, 228.394, 510, -0.246182978, 3.22764193e-9, -0.96922338, 1.2914926e-8, 1, 4.97377278e-11, 0.96922338, -1.2505204e-8, -0.246182978)

	while _G.SnowbalEffectSpam and p863 do
		if p863:FindFirstChild('SoundPart') then
			local _SoundPart5 = p863.SoundPart
			local _FarmSnowball = _SoundPart5:FindFirstChild('FarmSnowball')

			if CheckNetworkOwnerShipOnPart(_SoundPart5) then
				if _FarmSnowball then
					if u842[_SoundPart5] then
						_FarmSnowball.Position = Vector3.new(math.random(-10000, 10000), 10000, math.random(-10000, 10000))
					else
						_FarmSnowball.Position = v864.Position + Vector3.new(25, 0, 0) + Vector3.new(0, _SoundPart5.Size.X / 2 - 0.65, 0)

						wait(0.5)

						_FarmSnowball.Position = v864.Position + Vector3.new(-25, 0, 0) + Vector3.new(0, _SoundPart5.Size.X / 2 - 0.65, 0)

						wait(0.5)

						_FarmSnowball.Position = v864.Position + Vector3.new(0, _SoundPart5.Size.X / 2 - 0.65, 0)
					end
				else
					local _BodyPosition6 = Instance.new('BodyPosition', _SoundPart5)

					_BodyPosition6.MaxForce = Vector3.new(12500, 12500, 12500)
					_BodyPosition6.Name = 'FarmSnowball'
					_BodyPosition6.Position = _SoundPart5.Position
				end
			end
		end

		wait()
	end
end
function newSnowball(p868)
	if p868.Name == 'BallSnowball' and _G.SnowbalEffectSpam then
		task.spawn(function()
			checkSize(p868)
		end)
		task.spawn(function()
			modify(p868)
		end)
	end
end

task.spawn(function()
	while task.wait() do
		CountGrownSnowsballs()
	end
end)

local v869 = v650:AddSection({
	Name = 'Snowball',
})

v869:AddSlider({
	Name = 'Ammount',
	Min = 5,
	Max = snowballMaxAmmount,
	Default = 5,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = 'Snowballs you want to make to explode them!',
	Callback = function(p870)
		u843 = p870
	end,
	Save = true,
	Flag = 'ammountsnowballtomake_slider',
})

automakesnowballtoggle = nil
automakesnowballtoggle = v869:AddToggle({
	Name = 'Auto Make Snowball',
	Default = false,
	Callback = function(p871)
		_G.SnowbalEffectSpam = p871

		if p871 then
			snowballEffectConnection = u17.ChildAdded:Connect(newSnowball)

			task.spawn(function()
				while _G.SnowbalEffectSpam do
					if u843 > countToys('BallSnowball') then
						SpawnToy({
							'BallSnowball',
							CFrame.new(-389, 228, 550, -0.3092496991157532, 0.2610282301902771, -0.9144555330276489, 0, 0.9615919589996338, 0.2744831442832947, 0.9509809017181396, 0.08488383144140244, -0.2973720133304596),
							Vector3.new(0, 97.69000244140625, 0),
						})
						task.wait(0.1)
					end
					if u843 <= CountGrownSnowsballs() then
						automakesnowballtoggle:Set(false)
					end

					task.wait()
				end
			end)
			task.spawn(function()
				holdOwnership()
			end)

			local v872 = u17
			local v873, v874, v875 = ipairs(v872:GetChildren())

			while true do
				local v876

				v875, v876 = v873(v874, v875)

				if v875 == nil then
					break
				end

				newSnowball(v876)
			end
		elseif snowballEffectConnection then
			snowballEffectConnection:Disconnect()
		end
	end,
	Save = true,
	Flag = 'autofarmsnowball_toggle',
})

local _ = v869:AddLabel('Grown Snowballs:')

v869:AddButton({
	Name = 'Explode Snowballs',
	Callback = function()
		local v877, v878, v879 = pairs(u842)

		while true do
			local v880

			v879, v880 = v877(v878, v879)

			if v879 == nil then
				break
			end
			if v879:IsDescendantOf(_Workspace) then
				ExplodeSb(v879.Parent)
			end
		end
	end,
})

spamexplosiontype = nil
spamexplosiontarget = 0
bombsammountoexplode = 1
reachedrightammount = false
explosionInterval = nil
canExplode = false
maxBombstoexplode = 8

if _ToysLimitCap.Value == 200 then
	maxBombstoexplode = 18
end

_ContextActionService:BindAction('FireBomb', fireBombs, false, Enum.KeyCode.F)

function ExplodeFw()
	local v881 = u17
	local v882, v883, v884 = pairs(v881:GetChildren())

	while true do
		local v885

		v884, v885 = v882(v883, v884)

		if v884 == nil then
			break
		end
		if v885.Name == spamexplosiontype then
			local v886 = {
				{
					Radius = 17.5,
					TimeLength = 0.5,
					Hitbox = v885:FindFirstChild('PartHitDetector'),
					ExplodesByFire = true,
					MaxForcePerStudSquared = 225,
					DestroysModel = true,
					Model = v885,
					ExplodesByPointy = false,
					ImpactSpeed = 20,
					PositionPart = workspace.SpawnLocation,
				},
				Vector3.new(0, -10, 0),
			}

			if spamexplosiontype ~= 'BombBalloon' then
				if spamexplosiontype == 'PresentBig' or spamexplosiontype == 'PresentSmall' then
					v886[1].Hitbox = v885.Box
				end
			else
				v886[1].Hitbox = v885.Balloon
			end
			if spamexplosiontarget ~= 0 then
				if spamexplosiontarget ~= 1 then
					local v887 = spamexplosiontarget == 2 and GetFakeAim2()

					if v887 then
						v886[1].PositionPart = v887
						v886[2] = v887.Position
					end
				else
					local v888

					if _G.TargetToBombPlayer then
						v888 = _Players:FindFirstChild(_G.TargetToBombPlayer)
					else
						v888 = nil
					end
					if v888 and not IsPlayerInsideSafeZone(v888) and v888.Character and (v888.Character:FindFirstChild('HumanoidRootPart') and not u54(v888)) then
						local _HumanoidRootPart5 = v888.Character.HumanoidRootPart

						v886[1].PositionPart = _HumanoidRootPart5
						v886[2] = _HumanoidRootPart5.Position
					end
				end
			else
				v886[1].PositionPart = workspace.SpawnLocation
				v886[2] = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10))
			end

			BombEvents.BombExplode:FireServer(unpack(v886))
		end
		if explosionInterval > 0 then
			task.wait(explosionInterval)
		end
	end
end

firework_section = v650:AddSection({
	Name = 'Explosions Spam',
})
explosionexplanation = v650:AddSection({
	Name = 'FAQ about (Explosions Spam)',
})

firework_section:AddToggle({
	Name = 'Explode',
	Default = false,
	Callback = function(p890)
		_G.FireworkEffectSpam = p890

		if p890 then
			task.spawn(function()
				while _G.FireworkEffectSpam do
					local v891 = GetPlayerCFrame()

					if countToys(spamexplosiontype) < bombsammountoexplode and not reachedrightammount and (spamexplosiontarget ~= 2 or GetFakeAim()) and v891 then
						SpawnToy({
							spamexplosiontype,
							CFrame.new(v891.Position.X, v891.Position.Y, v891.Position.Z, -0.3092496991157532, 0.2610282301902771, -0.9144555330276489, 0, 0.9615919589996338, 0.2744831442832947, 0.9509809017181396, 0.08488383144140244, -0.2973720133304596),
							Vector3.new(0, 97.69000244140625, 0),
						})
					end

					task.wait()
				end
			end)
			task.spawn(function()
				while _G.FireworkEffectSpam do
					local v892 = u17
					local v893, v894, v895 = pairs(v892:GetChildren())

					while true do
						local v896

						v895, v896 = v893(v894, v895)

						if v895 == nil then
							break
						end
						if v896.Name == spamexplosiontype then
							local v897 = nil

							if spamexplosiontype ~= 'BombDarkMatter' then
								if spamexplosiontype ~= 'BombMissile' then
									if spamexplosiontype ~= 'BombBalloon' then
										if spamexplosiontype ~= 'FireworkMissile' then
											if spamexplosiontype == 'PresentBig' or spamexplosiontype == 'PresentSmall' then
												v897 = v896:FindFirstChild('Box')
											end
										else
											v897 = v896:FindFirstChild('Hitbox')
										end
									else
										v897 = v896:FindFirstChild('Balloon')
									end
								else
									v897 = v896:FindFirstChild('Body')
								end
							else
								v897 = v896:FindFirstChild('Pyramid')
							end
							if v897 and not SNOWshipOnce(v897) and _LocalPlayer:DistanceFromCharacter(v897.Position) > 30 then
								DeleteToyRE:FireServer(v896)
								print('Deletado!')
							elseif v897 and CheckNetworkOwnerShipOnPart(v897) and not v896:GetAttribute('MissileTeleported') then
								wait()

								if v896.PrimaryPart then
									local _BodyVelocity3 = Instance.new('BodyVelocity', v896.PrimaryPart)

									_BodyVelocity3.Velocity = Vector3.new(0, 0, 0)
									_BodyVelocity3.MaxForce = Vector3.new(1, 1, 1) * math.huge

									v896:SetPrimaryPartCFrame(CFrame.new(math.random(-1000, 1000), 10000, math.random(-1000, 1000)))
									v896:SetAttribute('MissileTeleported', true)
								end

								print('ownershipped!')
							end
						end
					end

					task.wait(0.1)
				end
			end)
			task.spawn(function()
				while _G.FireworkEffectSpam do
					if countToys(spamexplosiontype) < bombsammountoexplode then
						_G.CanExplodeBombs = false
					else
						if spamexplosiontarget ~= 2 or not _G.FireBomb then
							if spamexplosiontarget ~= 2 then
								canExplode = true
							end
						else
							canExplode = true
						end

						_G.CanExplodeBombs = true

						if canExplode then
							ExplodeFw()

							reachedrightammount = false
							canExplode = false
						end
					end

					task.wait()
				end
			end)
			task.spawn(function()
				while _G.FireworkEffectSpam do
					if spamexplosiontarget == 2 then
						GetFakeAim2()
					end

					wait(0.1)
				end
			end)
		end
	end,
})
firework_section:AddDropdown({
	Name = 'Explosion Type',
	Default = 'Firework',
	Options = {
		'Firework',
		'Missile',
		'Void',
		'Ballon',
		'Small Present',
		'Big Present',
	},
	Callback = function(p899)
		if p899 == 'Firework' then
			spamexplosiontype = 'FireworkMissile'
		elseif p899 == 'Missile' then
			spamexplosiontype = 'BombMissile'
		elseif p899 == 'Void' then
			spamexplosiontype = 'BombDarkMatter'
		elseif p899 == 'Ballon' then
			spamexplosiontype = 'BombBalloon'
		elseif p899 == 'Small Present' then
			spamexplosiontype = 'PresentSmall'
		elseif p899 == 'Big Present' then
			spamexplosiontype = 'PresentBig'
		end
	end,
})
firework_section:AddSlider({
	Name = 'Ammount to Explode',
	Min = 1,
	Max = maxBombstoexplode,
	Default = 1,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = 'to explode the player brutally',
	Callback = function(p900)
		bombsammountoexplode = p900
	end,
})
firework_section:AddSlider({
	Name = 'Delay',
	Min = 0,
	Max = 1,
	Default = 0,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 0.1,
	ValueName = 'interval between every explosion',
	Callback = function(p901)
		explosionInterval = p901
	end,
})
firework_section:AddDropdown({
	Name = 'Target',
	Default = 'Spawn',
	Options = {
		'Spawn',
		'Player',
		'Mouse',
	},
	Callback = function(p902)
		if p902 == 'Spawn' then
			spamexplosiontarget = 0
		elseif p902 == 'Player' then
			spamexplosiontarget = 1
		elseif p902 == 'Mouse' then
			spamexplosiontarget = 2
		end
	end,
})

PlayerToTarget = firework_section:AddDropdown({
	Name = 'Select Player',
	Default = 'Macaco (negro)',
	Options = {
		'',
	},
	Callback = function(p903)
		local v904 = string.split(p903, ' ')

		_G.TargetToBombPlayer = v904[1]
	end,
})

explosionexplanation:AddParagraph('How to use target mouse?', 'Press/Hold the keybind (F) and then BOOM!')
explosionexplanation:AddParagraph('How to target player?', 'Select Target to Player and then select the player you want to target')
explosionexplanation:AddParagraph('How to change the explosive', 'Click on Explosive Type and select any type')
_LocalPlayer.Idled:connect(function()
	_VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	wait(1)
	_VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

SilentAim_Section = v657:AddSection({
	Name = 'Silent-Aim',
})

SilentAim_Section:AddToggle({
	Name = 'Silent Aim',
	Default = false,
	Callback = function(p905)
		_G.SilentAim = p905
	end,
	Save = true,
	Flag = 'SilentAim_toggle',
})
SilentAim_Section:AddSlider({
	Name = 'Silent-Aim Range',
	Min = 0,
	Max = 50,
	Default = 50,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = '',
	Callback = function(p906)
		u724 = p906
	end,
	Save = true,
	Flag = 'silentaimrange_slider',
})

FurtherLineExtend_Section = v652:AddSection({
	Name = 'Line Extender',
})

FurtherLineExtend_Section:AddToggle({
	Name = 'Further Extend',
	Default = false,
	Callback = function(p907)
		_G.FutherExtend = p907
	end,
	Save = true,
	Flag = 'FurtherLineExtend_toggle',
})

MaxExtendLine = 0
MinExtendLine = 0

if _UserInputService.TouchEnabled then
	MinExtendLine = 3
	MaxExtendLine = 25
elseif _UserInputService.MouseEnabled then
	MinExtendLine = 3
	MaxExtendLine = 25
end

FurtherLineExtend_Section:AddSlider({
	Name = 'Increase Extend',
	Min = MinExtendLine,
	Max = MaxExtendLine,
	Default = 3,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = 'Ammount',
	Callback = function(p908)
		IncreaseLineExtend = p908
	end,
	Save = true,
	Flag = 'FurtherLineExtend_slider',
})

local v909 = v653:AddSection({
	Name = 'Normal Auras',
})
local v910 = v653:AddSection({
	Name = 'Fling Aura',
})
local v911 = v653:AddSection({
	Name = 'Telekinesis Aura',
})
local v912 = v653:AddSection({
	Name = 'Anchor Aura',
})
local v913 = v653:AddSection({
	Name = 'Kick Aura',
})
local v914 = v653:AddSection({
	Name = 'Auras Whitelist',
})

local function u917()
	local _Character5 = _LocalPlayer.Character
	local v916

	if _Character5 then
		v916 = _Character5:FindFirstChildOfClass('Humanoid')
	else
		v916 = nil
	end
	if not (_Character5 and v916) or (not v916.Sit or v916.SeatPart == nil) or tostring(v916.SeatPart.Parent) ~= 'CreatureBlobman' then
		return false
	end

	_G.LastBlobmanWasSeat = v916.SeatPart.Parent

	return true
end

function IsPlayerKickingWithBlobman()
	if u917() and _G.LoopKick then
		return true
	end
end

local function u924(p918)
	local v919 = false

	_Players:FindFirstChild(p918)

	if u917() and _G.LoopKick then
		local v920, v921, v922 = pairs(u70)

		while true do
			local v923

			v922, v923 = v920(v921, v922)

			if v922 == nil then
				break
			end
			if p918 == v923 then
				v919 = true
			end
		end
	end

	return v919
end

function CheckPlayer(p925)
	if typeof(p925) == 'Instance' and (p925 ~= _LocalPlayer and not u54(p925)) and (p925.Character and p925.Character:IsDescendantOf(_Workspace)) and (p925.Character:FindFirstChild('HumanoidRootPart') and (p925.Character:FindFirstChildOfClass('Humanoid') and 0 < p925.Character.Humanoid.Health)) then
		return true
	end
end
function CheckPlayerForLoopKill(p926)
	if CheckPlayer(p926) and not IsPlayerInsideSafeZone(p926) then
		return true
	end
end
function CheckPlayerAuras(p927)
	if CheckPlayer(p927) and not (u105(p927.Name) and _G.WhitelistFriends) and not (u924(p927.Name) or (p927.Character:GetAttribute('Kicking') or _G.KickAura)) then
		return true
	end
end
function CheckPlayerAurasKick(p928)
	if CheckPlayer(p928) and not (u105(p928.Name) and _G.WhitelistFriends) and not (u924(p928.Name) or p928.Character:GetAttribute('Kicking')) then
		return true
	end
end
function CheckPlayerAnnoyAll(p929)
	if CheckPlayer(p929) and not (u105(p929.Name) and _G.WhitelistFriends3) and not (u924(p929.Name) or p929.Character:GetAttribute('Kicking')) then
		return true
	end
end
function CheckPlayerKill(p930)
	if CheckPlayer(p930) and not (u105(p930.Name) and _G.WhitelistFriends3) and not IsPlayerInsideSafeZone(p930) then
		return true
	end
end
function CheckPlayerKick(p931)
	if CheckPlayer(p931) and not (u105(p931.Name) and _G.WhitelistFriends3) and not (IsPlayerInsideSafeZone(p931) or IsPlayerFloating(p931)) then
		return true
	end
end
function CheckPlayerBring(p932, _)
	if CheckPlayer(p932) and not (u105(p932.Name) and _G.WhitelistFriends3) and (not IsPlayerInsideSafeZone(p932) and CheckPlayerVelocity(p932) < 20) then
		return true
	end
end
function CreateSkyVelocity(p933)
	if not p933:FindFirstChild('SkyVelocity') then
		local _BodyVelocity4 = Instance.new('BodyVelocity', p933)

		_BodyVelocity4.Name = 'SkyVelocity'
		_BodyVelocity4.Velocity = Vector3.new(0, 100000000000000, 0)
		_BodyVelocity4.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	end
end
function CreateBringBody(p935, p936)
	if p935:FindFirstChild('BringBody') then
		p935:FindFirstChild('BringBody').Position = p936.Position
	else
		local _BodyPosition7 = Instance.new('BodyPosition', p935)

		_BodyPosition7.Name = 'BringBody'
		_BodyPosition7.Position = p936.Position
		_BodyPosition7.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		_BodyPosition7.D = 5000
		_BodyPosition7.P = 1500000
	end
end

local _OuterUFO = _Workspace.Map.AlwaysHereTweenedObjects:FindFirstChild('OuterUFO')

if _OuterUFO and _OuterUFO:FindFirstChild('Object') and _OuterUFO.Object:FindFirstChild('ObjectModel') then
	_OuterUFO = _OuterUFO.Object.ObjectModel.PaintPlayerPart
	_OuterUFO:WaitForChild('WeldConstraint').Enabled = false
	_OuterUFO.Anchored = true
	_OuterUFO.Shape = Enum.PartType.Block
	_OuterUFO.Transparency = 1
	_OuterUFO.Size = Vector3.new(0.5, 0.5, 0.5)
	_OuterUFO.Position = Vector3.new(0, -50, 0)
end

v909:AddToggle({
	Name = 'Poison Aura',
	Default = false,
	Callback = function(p939)
		_G.Poison_Aura = p939

		if p939 then
			while _G.Poison_Aura do
				local v940 = _Players
				local v941, v942, v943 = pairs(v940:GetPlayers())

				while true do
					local v944

					v943, v944 = v941(v942, v943)

					if v943 == nil then
						break
					end
					if CheckPlayerAuras(v944) then
						local _Head3 = v944.Character:FindFirstChild('Head')

						if _Head3 and SNOWshipPlayer(v944) then
							_PoisonHurtPart.CFrame = _Head3.CFrame
							_PoisonHurtPart2.CFrame = _Head3.CFrame
							_PoisonHurtPart3.CFrame = _Head3.CFrame

							task.wait()

							_PoisonHurtPart3.Position = Vector3.new(0, -50, 0)
							_PoisonHurtPart2.Position = Vector3.new(0, -50, 0)
							_PoisonHurtPart.Position = Vector3.new(0, -50, 0)
						end
					end
				end

				task.wait()
			end
		end
	end,
	Save = true,
	Flag = 'poisonaura_toggle',
})
v909:AddToggle({
	Name = 'Death Aura',
	Default = false,
	Callback = function(p946)
		_G.DeathAura = p946

		if p946 then
			while _G.DeathAura do
				local v947 = _Players
				local v948, v949, v950 = pairs(v947:GetPlayers())

				while true do
					local v951

					v950, v951 = v948(v949, v950)

					if v950 == nil then
						break
					end
					if CheckPlayerAuras(v951) then
						local _Character6 = v951.Character
						local _HumanoidRootPart6 = _Character6:FindFirstChild('HumanoidRootPart')
						local _Humanoid5 = _Character6:FindFirstChildOfClass('Humanoid')

						if _HumanoidRootPart6 and _Humanoid5 and SNOWshipPlayer(v951) then
							_DestroyGrabLine:FireServer(_HumanoidRootPart6)
							CreateSkyVelocity(_HumanoidRootPart6)

							_Humanoid5.BreakJointsOnDeath = false

							_Humanoid5:ChangeState(Enum.HumanoidStateType.Dead)

							_Humanoid5.Jump = true
							_Humanoid5.Sit = false

							if _Humanoid5:GetStateEnabled(Enum.HumanoidStateType.Dead) then
								_DestroyGrabLine:FireServer(_HumanoidRootPart6)
							end
						end
					end
				end

				task.wait()
			end
		end
	end,
	Save = true,
	Flag = 'deathaura_toggle',
})

if _OuterUFO then
	v909:AddToggle({
		Name = 'Radioactive Aura',
		Default = false,
		Callback = function(p955)
			_G.RadioactiveAura = p955

			if p955 then
				while _G.RadioactiveAura do
					local v956 = _Players
					local v957, v958, v959 = pairs(v956:GetPlayers())

					while true do
						local v960

						v959, v960 = v957(v958, v959)

						if v959 == nil then
							break
						end
						if CheckPlayerAuras(v960) then
							local _HumanoidRootPart7 = v960.Character:FindFirstChild('HumanoidRootPart')

							if _HumanoidRootPart7 and SNOWshipPlayer(v960) then
								_OuterUFO.Position = _HumanoidRootPart7.Position

								task.wait()

								_OuterUFO.Position = Vector3.new(0, -50, 0)
							end
						end
					end

					task.wait()
				end
			end
		end,
		Save = true,
		Flag = 'radioaura_toggle',
	})
end

v909:AddToggle({
	Name = 'Burn Aura',
	Default = false,
	Callback = function(p962)
		_G.BurnAura = p962

		if p962 then
			while _G.BurnAura do
				local v963 = _Players
				local v964, v965, v966 = pairs(v963:GetPlayers())

				while true do
					local v967

					v966, v967 = v964(v965, v966)

					if v966 == nil then
						break
					end
					if CheckPlayerAuras(v967) then
						local _HumanoidRootPart8 = v967.Character:FindFirstChild('HumanoidRootPart')

						if _HumanoidRootPart8 and _LocalPlayer:DistanceFromCharacter(_HumanoidRootPart8.Position) < 30 then
							u613(_HumanoidRootPart8)
						end
					end
				end

				task.wait()
			end
		end
	end,
	Save = true,
	Flag = 'burnaura_toggle',
})
v910:AddToggle({
	Name = 'Fling Aura',
	Default = false,
	Callback = function(p969)
		_G.FlingAura = p969

		if p969 then
			while _G.FlingAura do
				if _G.FlingTarget == 2 or _G.FlingTarget == 3 then
					local v970, v971 = CheckObjectsAroundPlayer()

					if v970 then
						local v972, v973, v974 = pairs(v970)

						while true do
							local v975

							v974, v975 = v972(v973, v974)

							if v974 == nil then
								break
							end

							local v976 = 0

							if v975 then
								local _Head4 = v975:FindFirstChild('Head')
								local v978, v979, v980 = pairs(v975:GetChildren())

								while true do
									local v981

									v980, v981 = v978(v979, v980)

									if v980 == nil then
										break
									end
									if v981:IsA('BasePart') and v981.CanQuery then
										local v982 = SNOWshipTrack(v981)
										local v983 = GetPlayerRoot()

										if not v982 and _Head4 then
											v982 = CheckNetworkOwnerShipOnPart(_Head4)
										end
										if v982 and v983 then
											if v971 then
												local _Position3 = v971.Position

												v971.Position = v981.Position

												task.wait()

												v971.Position = _Position3
											elseif not v981:FindFirstChild('FlingAuraVelocity') then
												local v985 = lookAt(v983.Position, v981.Position)
												local _BodyVelocity5 = Instance.new('BodyVelocity', v981)

												_BodyVelocity5.Name = 'FlingAuraVelocity'
												_BodyVelocity5.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
												_BodyVelocity5.Velocity = Vector3.new(v985.lookVector.X, 0.5, v985.lookVector.Z) * math.clamp(_G.FlingStrength, 400, 600)

												_Debris:AddItem(_BodyVelocity5)
											end

											v976 = v976 + 1
										end
										if v976 >= 3 then
											break
										end
									end
								end
							end
						end
					end
				end
				if _G.FlingTarget == 1 or _G.FlingTarget == 3 then
					local v987 = _Players
					local v988, v989, v990 = pairs(v987:GetPlayers())

					while true do
						local v991

						v990, v991 = v988(v989, v990)

						if v990 == nil then
							break
						end
						if CheckPlayerAuras(v991) then
							local _HumanoidRootPart9 = v991.Character:FindFirstChild('HumanoidRootPart')
							local v993 = SNOWshipPlayer(v991)
							local v994 = GetPlayerCharacter()

							if _HumanoidRootPart9 and v993 and (v994 and not _HumanoidRootPart9:FindFirstChild('FlingAuraVelocity')) then
								local v995 = lookAt(v994.HumanoidRootPart.Position, _HumanoidRootPart9.Position)
								local _BodyVelocity6 = Instance.new('BodyVelocity', _HumanoidRootPart9)

								_BodyVelocity6.Name = 'FlingAuraVelocity'
								_BodyVelocity6.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								_BodyVelocity6.Velocity = Vector3.new(v995.lookVector.X, 0.5, v995.lookVector.Z) * _G.FlingStrength

								_Debris:AddItem(_BodyVelocity6)
							end
						end
					end
				end

				task.wait(0.1)
			end
		end
	end,
	Save = true,
	Flag = 'flingaura_toggle',
})
v910:AddSlider({
	Name = 'Strength',
	Min = 400,
	Max = 10000,
	Default = 400,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 100,
	ValueName = '',
	Callback = function(p997)
		_G.FlingStrength = p997
	end,
	Save = true,
	Flag = 'flingstrengthvalue_toggle',
})
v910:AddDropdown({
	Name = 'Target',
	Default = 'Players',
	Options = {
		'Players',
		'Objects',
		'Players and Objects',
	},
	Callback = function(p998)
		if p998 == 'Players' then
			_G.FlingTarget = 1
		elseif p998 == 'Objects' then
			_G.FlingTarget = 2
		elseif p998 == 'Players and Objects' then
			_G.FlingTarget = 3
		end
	end,
	Save = true,
	Flag = 'flingtarget_dropdown',
})
v912:AddToggle({
	Name = 'Anchor Aura',
	Default = false,
	Callback = function(p999)
		_G.AnchorAura = p999

		if p999 then
			while _G.AnchorAura do
				if _G.AnchorTarget == 2 or _G.AnchorTarget == 3 then
					local v1000, _ = CheckObjectsAroundPlayer()

					if v1000 then
						local v1001, v1002, v1003 = pairs(v1000)

						while true do
							local v1004

							v1003, v1004 = v1001(v1002, v1003)

							if v1003 == nil then
								break
							end

							local v1005 = 0

							if v1004 and not v1004:GetAttribute('IsAnchored') then
								local v1006, v1007, v1008 = pairs(v1004:GetChildren())

								while true do
									local v1009

									v1008, v1009 = v1006(v1007, v1008)

									if v1008 == nil then
										break
									end
									if v1009:IsA('BasePart') and v1009.CanQuery then
										if SNOWshipTrack(v1009) or CheckNetworkOwnerShipOnPart(head) then
											setanchorObject(v1009)

											v1005 = v1005 + 1
										end
										if v1005 >= 3 then
											break
										end
									end
								end
							end
						end
					end
				end
				if _G.AnchorTarget == 1 or _G.AnchorTarget == 3 then
					local v1010 = _Players
					local v1011, v1012, v1013 = pairs(v1010:GetPlayers())

					while true do
						local v1014

						v1013, v1014 = v1011(v1012, v1013)

						if v1013 == nil then
							break
						end
						if CheckPlayerAuras(v1014) then
							local _Character7 = v1014.Character
							local _HumanoidRootPart10 = _Character7:FindFirstChild('HumanoidRootPart')

							if SNOWshipPlayer(v1014) and _HumanoidRootPart10 and not _Character7:GetAttribute('IsAnchored') then
								setanchorObject(_HumanoidRootPart10)
							end
						end
					end
				end

				task.wait(0.1)
			end
		end
	end,
	Save = true,
	Flag = 'anchoraura_toggle',
})
v912:AddDropdown({
	Name = 'Target',
	Default = 'Players',
	Options = {
		'Players',
		'Objects',
		'Players and Objects',
	},
	Callback = function(p1017)
		if p1017 == 'Players' then
			_G.AnchorTarget = 1
		elseif p1017 == 'Objects' then
			_G.AnchorTarget = 2
		elseif p1017 == 'Players and Objects' then
			_G.AnchorTarget = 3
		end
	end,
	Save = true,
	Flag = 'anchortarget_dropdown',
})

GroupCollisionData = {}

function SetCollisionObjectOff(p1018)
	if typeof(p1018) == 'Instance' and (p1018:IsA('Model') and not p1018:GetAttribute('ObjectCollisions')) then
		p1018:SetAttribute('ObjectCollisions', true)

		local v1019 = p1018:GetDescendants()
		local v1020, v1021, v1022 = pairs(v1019)
		local v1023 = {}

		while true do
			local v1024

			v1022, v1024 = v1020(v1021, v1022)

			if v1022 == nil then
				break
			end
			if v1024:IsA('BasePart') or v1024:IsA('Part') or v1024:IsA('MeshPart') then
				v1023[v1024] = v1024.CanCollide
			end
		end

		table.insert(GroupCollisionData, {
			Model = p1018,
			OldValues = v1023,
		})

		local v1025, v1026, v1027 = pairs(v1019)

		while true do
			local v1028

			v1027, v1028 = v1025(v1026, v1027)

			if v1027 == nil then
				break
			end
			if v1028:IsA('BasePart') or v1028:IsA('Part') or v1028:IsA('MeshPart') then
				v1028.CanCollide = false
			end
		end
	end
end
function SetCollisionObjectOn(p1029)
	if typeof(p1029) == 'Instance' and (p1029:IsA('Model') and p1029:GetAttribute('ObjectCollisions')) then
		local v1030, v1031, v1032 = pairs(GroupCollisionData)

		while true do
			local v1033

			v1032, v1033 = v1030(v1031, v1032)

			if v1032 == nil then
				break
			end

			local v1034, v1035, v1036 = pairs(v1033)
			local v1037 = v1032

			while true do
				local v1038

				v1036, v1038 = v1034(v1035, v1036)

				if v1036 == nil then
					break
				end
				if v1036 == 'Model' and v1038 == p1029 then
					local v1039, v1040, v1041 = pairs(p1029:GetDescendants())

					while true do
						local v1042

						v1041, v1042 = v1039(v1040, v1041)

						if v1041 == nil then
							break
						end
						if v1042:IsA('BasePart') or v1042:IsA('Part') or v1042:IsA('MeshPart') then
							v1042.CanCollide = v1033.OldValues[v1042]
						end
					end

					p1029:SetAttribute('ObjectCollisions', false)
					table.remove(GroupCollisionData, v1037)
				end
			end
		end
	end
end

TornadoOffset = 0
TornadoHeight = 0

function SpiralFormulaCalculation(p1043, p1044, p1045, p1046)
	if _G.TornadoShape == 'Tornado' then
		return Vector3.new(p1043.X + 15 * p1046 * math.sin(p1044), p1043.Y + 20 + p1046 * 2 + math.sin(p1044 * 0.5) * 40 + math.random(-20, 20), p1043.Z + 15 * p1046 * math.cos(p1044))
	end
	if _G.TornadoShape == 'Blackhole' then
		local _ = Vector3.new
		local _ = p1043.X + p1045 * math.sin(p1044)
		local _ = p1043.Y + TornadoHeight
		local _ = p1043.Z + p1045 * math.cos(p1044)
	end
end

_G.LastPartToGet = nil
_G.LastTheta = 0
TelekinesisBodiesPosition = {}

v911:AddToggle({
	Name = 'Telekinesis Aura',
	Default = false,
	Callback = function(p1047)
		_G.TornadoAura = p1047

		if p1047 then
			local u1048 = {}
			local u1049 = 0

			local function v1063(p1050, p1051)
				if not p1050:GetAttribute('TornadoSetup') then
					p1050:SetAttribute('TornadoSetup', true)

					if u1049 <= 1 then
						u1049 = u1049 + 0.1
					else
						u1049 = 0.1
					end

					_G.LastPartToGet = p1050

					local u1052 = 40 * u1049

					table.insert(u1048, p1050)

					local u1053 = table.find(u1048, p1050)
					local _BodyPosition8 = Instance.new('BodyPosition', p1051)

					_BodyPosition8.Name = 'TornadoAuraVelocity'
					_BodyPosition8.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

					table.insert(TelekinesisBodiesPosition, _BodyPosition8)

					local u1055 = #TelekinesisBodiesPosition

					task.spawn(function()
						local _LastTheta = _G.LastTheta
						local v1057 = Vector3.new(0, 0, 0)
						local v1058 = Vector3.new(1250000, 1250000, 1250000)
						local v1059 = nil

						while p1050.Parent and _BodyPosition8.Parent do
							local v1060

							if _G.TornadoAura then
								if _G.LastPartToGet == p1050 then
									_G.LastTheta = _LastTheta + 0.5
								end

								_LastTheta = _LastTheta + TornadoSpeed

								local v1061 = TornadoOffset

								if _G.TornadoFollowType ~= 'Mouse' or not _LocalPlayer.Character or not _LocalPlayer.Character:FindFirstChild('CamPart') then
									v1060 = v1059
								else
									local v1062

									v1062, v1060 = _Workspace:FindPartOnRayWithIgnoreList(Ray.new(_LocalPlayer.Character.CamPart.Position, _LocalPlayer.Character.CamPart.CFrame.lookVector * 5000), {
										_LocalPlayer.Character,
										table.unpack(u1048),
									})

									if v1062 and v1060 then
										v1059 = v1060
									else
										v1060 = v1059
									end
									if v1059 then
										_BodyPosition8.Position = SpiralFormulaCalculation(v1059, _LastTheta, v1061, u1052)
									end
								end
								if _G.TornadoFollowType == 'Player' then
									MainPart = GetPlayerHRPByName(_G.TornadoFollowPlayer)

									if MainPart then
										_BodyPosition8.Position = SpiralFormulaCalculation(MainPart.Position, _LastTheta, v1061, u1052)
									end
								end
							else
								v1060 = v1059
							end
							if _G.TornadoAura then
								_BodyPosition8.MaxForce = v1058

								SetCollisionObjectOff(p1050)
							else
								SetCollisionObjectOn(p1050)

								_BodyPosition8.MaxForce = v1057
							end

							wait()

							v1059 = v1060
						end

						table.remove(u1048, u1053)
						table.remove(TelekinesisBodiesPosition, u1055)
						SetCollisionObjectOn(p1050)
						_BodyPosition8:Destroy()
						p1050:SetAttribute('TornadoSetup', false)
					end)
				end
			end

			while _G.TornadoAura do
				if _G.TornadoMode ~= 'Aura' then
					if _G.TornadoMode == 'Click' and _G.HoldingObjectGrabPart then
						local _HoldingObjectGrabPart = _G.HoldingObjectGrabPart

						if _HoldingObjectGrabPart.Parent and _HoldingObjectGrabPart.Parent:IsA('Model') then
							local _Parent9 = _HoldingObjectGrabPart.Parent
							local v1066 = _Players:GetPlayerFromCharacter(_Parent9)
							local _Head5 = _Parent9:FindFirstChild('Head')

							if v1066 then
								if CheckNetworkOwnerShipOnPlayer(v1066) then
									v1063(_Parent9, _HoldingObjectGrabPart)
								end
							elseif not v1066 and CheckNetworkOwnerShipOnPart(_Head5 or _HoldingObjectGrabPart) then
								v1063(_Parent9, _Head5 or _HoldingObjectGrabPart)
							end
						end
					end
				else
					if _G.TornadoTarget == 2 or _G.TornadoTarget == 3 then
						local v1068 = CheckObjectsAroundPlayer()

						if v1068 then
							local v1069, v1070, v1071 = pairs(v1068)

							while true do
								local v1072

								v1071, v1072 = v1069(v1070, v1071)

								if v1071 == nil then
									break
								end

								local v1073 = 0

								if v1072 then
									local _Head6 = v1072:FindFirstChild('Head')
									local v1075, v1076, v1077 = pairs(v1072:GetChildren())

									while true do
										local v1078

										v1077, v1078 = v1075(v1076, v1077)

										if v1077 == nil then
											break
										end
										if v1078:IsA('BasePart') and v1078.CanQuery then
											local v1079 = SNOWshipTrack(v1078)
											local v1080 = GetPlayerRoot()

											if not v1079 and _Head6 then
												v1079 = CheckNetworkOwnerShipOnPart(_Head6)
											end
											if v1079 and v1080 then
												v1063(v1072, v1078)

												v1073 = v1073 + 1
											end
											if v1073 >= 3 then
												break
											end
										end
									end
								end
							end
						end
					end
					if _G.TornadoTarget == 1 or _G.TornadoTarget == 3 then
						local v1081 = _Players
						local v1082, v1083, v1084 = pairs(v1081:GetPlayers())

						while true do
							local v1085

							v1084, v1085 = v1082(v1083, v1084)

							if v1084 == nil then
								break
							end
							if CheckPlayerAuras(v1085) then
								local _Character8 = v1085.Character
								local _HumanoidRootPart11 = _Character8:FindFirstChild('HumanoidRootPart')

								if _HumanoidRootPart11 and SNOWshipPlayer(v1085) and GetPlayerCharacter() then
									v1063(_Character8, _HumanoidRootPart11)
								end
							end
						end
					end

					task.wait(0.1)
				end

				task.wait()
			end
		end
	end,
	Save = true,
	Flag = 'tornadoaura_toggle',
})
v911:AddDropdown({
	Name = 'Select Mode',
	Default = 'Aura',
	Options = {
		'Click',
		'Aura',
	},
	Callback = function(p1088)
		if p1088 then
			_G.TornadoMode = p1088
		end
	end,
})

telekenesisshapedropdown = nil
telekenesisshapedropdown = v911:AddDropdown({
	Name = 'Shape',
	Default = 'Blackhole',
	Options = {
		'Blackhole',
		'Tornado',
	},
	Callback = function(p1089)
		if p1089 then
			if p1089 == 'Tornado' then
				telekenesissliderspeed:Set(0.495)
			end

			_G.TornadoShape = p1089
		end
	end,
})

v911:AddDropdown({
	Name = 'Follow Type:',
	Default = 'Player',
	Options = {
		'Player',
		'Mouse',
	},
	Callback = function(p1090)
		if p1090 then
			_G.TornadoFollowType = p1090
		end
	end,
})

RotationAuraList = v911:AddDropdown({
	Name = 'Follow Player:',
	Default = '',
	Options = {
		'',
	},
	Callback = function(p1091)
		if p1091 then
			_G.TornadoFollowPlayer = string.split(p1091, ' ')[1]
		end
	end,
})
_G.TornadoFollowPlayer = _LocalPlayer.Name

v911:AddDropdown({
	Name = 'Target',
	Default = 'Players',
	Options = {
		'Players',
		'Objects',
		'Players and Objects',
	},
	Callback = function(p1092)
		if p1092 == 'Players' then
			_G.TornadoTarget = 1
		elseif p1092 == 'Objects' then
			_G.TornadoTarget = 2
		elseif p1092 == 'Players and Objects' then
			_G.TornadoTarget = 3
		end
	end,
	Save = true,
	Flag = 'tornadotarget_dropdown',
})
v911:AddSlider({
	Name = 'Distance',
	Min = 5,
	Max = 1000,
	Default = 10,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 5,
	ValueName = 'Offset',
	Callback = function(p1093)
		TornadoOffset = p1093
	end,
	Save = true,
	Flag = 'tornadodistance_toggle',
})
v911:AddSlider({
	Name = 'Height',
	Min = 5,
	Max = 1000,
	Default = 10,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 5,
	ValueName = 'Offset',
	Callback = function(p1094)
		TornadoHeight = p1094
	end,
	Save = true,
	Flag = 'tornadoheight_toggle',
})

telekenesissliderspeed = nil
telekenesissliderspeed = v911:AddSlider({
	Name = 'Speed',
	Min = 0.01,
	Max = 0.5,
	Default = 0.01,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 0.015,
	ValueName = 'Rotation Speed',
	Callback = function(p1095)
		TornadoSpeed = p1095
	end,
	Save = true,
	Flag = 'tornadospeed_toggle',
})

v911:AddButton({
	Name = 'Disconnect All',
	Callback = function()
		local v1096, v1097, v1098 = pairs(TelekinesisBodiesPosition)

		while true do
			local v1099

			v1098, v1099 = v1096(v1097, v1098)

			if v1098 == nil then
				break
			end

			v1099:Destroy()
		end
	end,
})
v909:AddToggle({
	Name = 'Attraction Aura',
	Default = false,
	Callback = function(p1100)
		_G.AttractionAura = p1100

		if p1100 then
			while _G.AttractionAura do
				local v1101 = _Players
				local v1102, v1103, v1104 = pairs(v1101:GetPlayers())

				while true do
					local v1105

					v1104, v1105 = v1102(v1103, v1104)

					if v1104 == nil then
						break
					end
					if CheckPlayerAuras(v1105) then
						local _Character9 = v1105.Character
						local _HumanoidRootPart12 = _Character9:FindFirstChild('HumanoidRootPart')
						local _Humanoid6 = _Character9:FindFirstChildOfClass('Humanoid')
						local v1109 = GetPlayerCharacter()

						if _Humanoid6 and _HumanoidRootPart12 and v1109 then
							SNOWship(_HumanoidRootPart12)

							_Humanoid6.Sit = false
							_Humanoid6.WalkSpeed = 25

							_Humanoid6:MoveTo(v1109.HumanoidRootPart.Position)
						end
					end
				end

				task.wait()
			end
		end
	end,
	Save = true,
	Flag = 'attractaura_toggle',
})

kickauratoggle = nil
KickTypesList = {
	'Silent',
	'Float',
	'Sky Anchor',
}

function CreateKickPhysical(p1110, p1111, p1112)
	if p1111:FindFirstChild('KickAuraP') then
		p1111.KickAuraP:SetAttribute('TypeFunction', p1112)
	else
		local _BodyPosition9 = Instance.new('BodyPosition', p1111)

		_BodyPosition9.Name = 'KickAuraP'

		local v1114 = _BodyPosition9

		_BodyPosition9.SetAttribute(v1114, 'TypeFunction', p1112)

		local _BodyVelocity7 = Instance.new('BodyVelocity', p1111)

		_BodyVelocity7.Name = 'KickAuraP1'
		_BodyVelocity7.Velocity = Vector3.new(0, 400, 0)

		task.spawn(function()
			local u1116 = nil
			local u1117 = nil
			local u1118 = Vector3.new(0, -100, 0)
			local u1119 = Vector3.new(0, 0, 0)
			local u1120 = Vector3.new(0, 12500, 0)
			local u1121 = Vector3.new(4000, 4000, 4000)
			local u1122 = Vector3.new(math.random(50, 250), 250, math.random(50, 250))
			local u1123 = RaycastParams.new()

			u1123.FilterDescendantsInstances = {p1110}
			u1123.FilterType = Enum.RaycastFilterType.Exclude

			local function v1125(p1124)
				if p1124 == 'Silent' then
					_BodyPosition9.MaxForce = u1120
					_BodyVelocity7.MaxForce = u1119
					u1116 = p1111.Position
					u1117 = _Workspace:Raycast(u1116, u1118, u1123)

					if u1117 then
						_BodyPosition9.Position = u1117.Position + Vector3.new(0, 5, 0)
					end
				elseif p1124 == 'Float' then
					_BodyVelocity7.MaxForce = u1121
					_BodyPosition9.MaxForce = u1119
				elseif p1124 == 'Sky Anchor' then
					_BodyPosition9.MaxForce = u1121
					_BodyPosition9.Position = u1122
					_BodyVelocity7.MaxForce = u1119
				end
			end

			while _BodyPosition9.Parent and p1110.Parent do
				p1112 = _BodyPosition9:GetAttribute('TypeFunction')

				if p1112 == 'Aura' or not p1112 then
					if not _G.KickAura then
						break
					end

					v1125(_G.KickAuraType)
				elseif p1112 ~= 'Counter' then
					if p1112 ~= 'Kick_All' then
						if p1112 == 'LoopKick' then
							if not _G.LoopKickOwnership then
								break
							end

							v1125(_G.LoopKickOwnerType)
						end
					else
						if not _G.KickAll then
							break
						end

						v1125(_G.KickAllType)
					end
				else
					if not _G.AutoAttacker then
						break
					end

					v1125(_G.KickCounterType)
				end

				task.wait()
			end

			_BodyPosition9:Destroy()
			_BodyVelocity7:Destroy()
		end)
	end
end

kickauratoggle = v913:AddToggle({
	Name = 'Kick Aura',
	Default = false,
	Callback = function(p1126)
		_G.KickAura = p1126

		if p1126 then
			while _G.KickAura do
				if GetKey() ~= 'Xana' then
					kickauratoggle:Set(false)
					u33('Only for premium users! Buy premium in my discord server!')

					break
				end

				local v1127 = _Players
				local v1128, v1129, v1130 = pairs(v1127:GetPlayers())

				while true do
					local v1131

					v1130, v1131 = v1128(v1129, v1130)

					if v1130 == nil then
						break
					end
					if CheckPlayerAurasKick(v1131) then
						local _Character10 = v1131.Character
						local _HumanoidRootPart13 = _Character10:FindFirstChild('HumanoidRootPart')

						if _HumanoidRootPart13 and _Character10:FindFirstChildOfClass('Humanoid') and (_HumanoidRootPart13:FindFirstChild('FirePlayerPart') and SNOWshipPlayer(v1131)) then
							CreateSkyVelocity(_HumanoidRootPart13)
							_DestroyGrabLine:FireServer(_HumanoidRootPart13)
						end
					end
				end

				task.wait()
			end
		end
	end,
})

v913:AddDropdown({
	Name = 'Kick Type',
	Default = 'Go to the heaven!',
	Options = {
		'Go to the heaven!',
	},
	Callback = function(p1134)
		_G.KickAuraType = p1134
	end,
	Save = true,
	Flag = 'kickauratype_dropdown',
})
v914:AddToggle({
	Name = 'Whitelist Friends',
	Default = false,
	Callback = function(p1135)
		_G.WhitelistFriends = p1135
	end,
	Save = true,
	Flag = 'whitelistaura_toggle',
})

local v1136 = v647:AddSection({
	Name = 'Strength',
})
local v1137 = v647:AddSection({
	Name = 'Others',
})
local v1138 = v647:AddSection({
	Name = 'Perspective',
})

v1136:AddToggle({
	Name = 'Super Strength',
	Default = false,
	Callback = function(p1139)
		_G.SuperStrength = p1139
	end,
	Save = true,
	Flag = 'superstrengthgrab_toggle',
})
v1136:AddSlider({
	Name = 'Strength',
	Min = 400,
	Max = 10000,
	Default = 400,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 100,
	ValueName = '',
	Callback = function(p1140)
		_G.Strength = p1140
	end,
	Save = true,
	Flag = 'superstrengthvalue_toggle',
})
v1137:AddToggle({
	Name = 'Poison Grab',
	Default = false,
	Callback = function(p1141)
		_G.Poison_Grab = p1141
	end,
	Save = true,
	Flag = 'poisongrab_toggle',
})
v1137:AddToggle({
	Name = 'Burn Grab',
	Default = false,
	Callback = function(p1142)
		_G.Burn_Grab = p1142
	end,
	Save = true,
	Flag = 'burngrab_toggle',
})
v1137:AddToggle({
	Name = 'Death Grab',
	Default = false,
	Callback = function(p1143)
		_G.Death_Grab = p1143
	end,
	Save = true,
	Flag = 'deathgrab_toggle',
})
v1137:AddToggle({
	Name = 'Massless Grab',
	Default = false,
	Callback = function(p1144)
		_G.MasslessGrab = p1144
	end,
	Save = true,
	Flag = 'masslessgrab_toggle',
})

if _OuterUFO then
	v1137:AddToggle({
		Name = 'Radiactive Grab',
		Default = false,
		Callback = function(p1145)
			_G.Radiactive_Grab = p1145
		end,
		Save = true,
		Flag = 'radiactivegrab_toggle',
	})
end

v1137:AddToggle({
	Name = 'Noclip Grab',
	Default = false,
	Callback = function(p1146)
		_G.NoclipGrab = p1146
	end,
	Save = true,
	Flag = 'noclipgrab_toggle',
})

local u1147 = nil
local u1148 = 50

kickgrabtoggle = nil

v1138:AddToggle({
	Name = 'Perspective Grab',
	Default = false,
	Callback = function(p1149)
		_G.PerspectiveGrab = p1149
	end,
	Save = true,
	Flag = 'perspectivegrab_toggle',
})
v1138:AddSlider({
	Name = 'Speed',
	Min = 50,
	Max = 150,
	Default = 50,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = '',
	Callback = function(p1150)
		u1148 = p1150
	end,
	Save = true,
	Flag = 'perspectivespeedvalue_toggle',
})

local v1151 = v657:AddSection({
	Name = 'Annoy Players',
})
local v1152 = v657:AddSection({
	Name = 'Kick All',
})
local v1153 = v657:AddSection({
	Name = 'Bring All',
})
local v1154 = v657:AddSection({
	Name = 'Whitelist',
})

freezecampart = Instance.new('Part', _Workspace)
freezecampart.Anchored = true
freezecampart.CanCollide = false
freezecampart.Transparency = 1
freezecampart.CanQuery = false
freezecampart.Size = Vector3.new()

function FreezeCam(p1155)
	freezecampart.CFrame = p1155
	workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
	workspace.CurrentCamera.CameraSubject = freezecampart
end
function unFreezeCam()
	workspace.CurrentCamera.CameraSubject = _LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
end

local u1156 = nil

u1156 = v1151:AddToggle({
	Name = 'Fire All',
	Default = false,
	Callback = function(p1157)
		_G.FireAllPlayers = p1157

		if p1157 then
			while _G.FireAllPlayers do
				if GetKey() ~= 'Xana' then
					u1156:Set(false)
					u33('Only for premium users! Buy premium in my discord server!')

					break
				end

				local v1158 = _Players
				local v1159, v1160, v1161 = pairs(v1158:GetPlayers())

				while true do
					local v1162

					v1161, v1162 = v1159(v1160, v1161)

					if v1161 == nil then
						break
					end
					if CheckPlayerAnnoyAll(v1162) then
						local _ = v1162.Character
						local _HumanoidRootPart14 = v1162.Character:FindFirstChild('HumanoidRootPart')
						local v1164

						if _HumanoidRootPart14:FindFirstChild('FirePlayerPart') and _HumanoidRootPart14.FirePlayerPart:FindFirstChild('CanBurn') then
							v1164 = _HumanoidRootPart14.FirePlayerPart.CanBurn.Value
						else
							v1164 = nil
						end
						if _HumanoidRootPart14 and v1162 and not (IsPlayerInsideSafeZone(v1162) or v1164) then
							u613(_HumanoidRootPart14)
							task.wait(0.015)
						end
					end
				end

				task.wait()
			end
		end
	end,
})
annoyalltoggle = v1151:AddToggle({
	Name = 'Ragdoll All',
	Default = false,
	Callback = function(p1165)
		_G.AnnoyAllPlayers = p1165

		if p1165 then
			while _G.AnnoyAllPlayers do
				if GetKey() ~= 'Xana' then
					annoyalltoggle:Set(false)
					u33('Only for premium users! Buy premium in my discord server!')

					break
				end

				local v1166 = _Players
				local v1167, v1168, v1169 = pairs(v1166:GetPlayers())

				while true do
					local v1170

					v1169, v1170 = v1167(v1168, v1169)

					if v1169 == nil then
						break
					end
					if CheckPlayerAnnoyAll(v1170) then
						local _Character11 = v1170.Character
						local _HumanoidRootPart15 = v1170.Character:FindFirstChild('HumanoidRootPart')
						local _Ragdolled = _Character11:FindFirstChildOfClass('Humanoid'):FindFirstChild('Ragdolled')

						if _HumanoidRootPart15 and _Ragdolled and not _Ragdolled.Value then
							u582(_HumanoidRootPart15)
							task.wait(0.015)
						end
					end
				end

				task.wait()
			end
		end
	end,
})
killalltoggle = v1151:AddToggle({
	Name = 'Kill All',
	Default = false,
	Callback = function(p1174)
		_G.KillAll = p1174

		if p1174 then
			if GetKey() ~= 'Xana' then
				_G.KillAll = false

				killalltoggle:Set(false)
				u33('Only for premium users! Buy premium in my discord server!')

				return
			end

			while _G.KillAll do
				ipos = GetPlayerCFrame()

				local v1175 = _Players
				local v1176, v1177, v1178 = pairs(v1175:GetPlayers())

				while true do
					local v1179

					v1178, v1179 = v1176(v1177, v1178)

					if v1178 == nil then
						break
					end
					if CheckPlayerKill(v1179) then
						local _HumanoidRootPart16 = v1179.Character:FindFirstChild('HumanoidRootPart')
						local _Humanoid7 = v1179.Character:FindFirstChild('Humanoid')

						if v1179 and _HumanoidRootPart16 and _Humanoid7 then
							for _ = 0, 50 do
								u406()
								SNOWship(_HumanoidRootPart16)

								if not (CheckPlayerKill(v1179) and _G.KillAll) or (CheckNetworkOwnerShipOnPlayer(v1179) or 500 < _HumanoidRootPart16.AssemblyLinearVelocity.Magnitude) then
									CreateSkyVelocity(_HumanoidRootPart16)
									_DestroyGrabLine:FireServer(_HumanoidRootPart16)

									break
								end

								task.wait()

								if _HumanoidRootPart16.Position.Y <= -12 then
									TeleportPlayer(CFrame.new(_HumanoidRootPart16.Position + Vector3.new(0, 5, -15)))
								else
									TeleportPlayer(CFrame.new(_HumanoidRootPart16.Position + Vector3.new(0, -10, -10)))
								end

								_Humanoid7.BreakJointsOnDeath = false

								_Humanoid7:ChangeState(Enum.HumanoidStateType.Dead)

								_Humanoid7.Jump = true
								_Humanoid7.Sit = false
							end
						end
					end
				end

				TeleportPlayer(ipos)
				task.wait(0.2)
			end

			u405()
			TeleportPlayer(ipos)
		end
	end,
})
kickalltoggle = v1152:AddToggle({
	Name = 'Kick All',
	Default = false,
	Callback = function(p1182)
		_G.KickAll = p1182

		if p1182 then
			if GetKey() ~= 'Xana' then
				_G.KickAll = false

				kickalltoggle:Set(false)
				u33('Only for premium users! Buy premium in my discord server!')

				return
			end

			while _G.KickAll do
				ipos = GetPlayerCFrame()

				local v1183 = _Players
				local v1184, v1185, v1186 = pairs(v1183:GetPlayers())

				while true do
					local v1187

					v1186, v1187 = v1184(v1185, v1186)

					if v1186 == nil then
						break
					end
					if CheckPlayerKick(v1187) then
						local _HumanoidRootPart17 = v1187.Character:FindFirstChild('HumanoidRootPart')

						if v1187 and _HumanoidRootPart17 then
							for _ = 0, 50 do
								u406()
								SNOWship(_HumanoidRootPart17)

								if not (CheckPlayerKick(v1187) and _G.KickAll) or (CheckNetworkOwnerShipOnPlayer(v1187) or 500 < _HumanoidRootPart17.AssemblyLinearVelocity.Magnitude) then
									CreateSkyVelocity(_HumanoidRootPart17)
									_DestroyGrabLine:FireServer(_HumanoidRootPart17)

									break
								end

								task.wait()

								if _HumanoidRootPart17.Position.Y <= -12 then
									TeleportPlayer(CFrame.new(_HumanoidRootPart17.Position + Vector3.new(0, 5, -15)))
								else
									TeleportPlayer(CFrame.new(_HumanoidRootPart17.Position + Vector3.new(0, -10, -10)))
								end
							end
						end
					end
				end

				TeleportPlayer(ipos)
				task.wait(0.2)
			end

			u405()
			TeleportPlayer(ipos)
		end
	end,
})
bringalltoggle = v1153:AddToggle({
	Name = 'Bring All',
	Default = false,
	Callback = function(p1189)
		_G.BringAll = p1189

		if p1189 then
			if GetKey() ~= 'Xana' then
				_G.BringAll = false

				bringalltoggle:Set(false)
				u33('Only for premium users! Buy premium in my discord server!')

				return
			end

			local v1190 = GetPlayerCFrame()
			local v1191 = CFrame.lookAt(_Workspace.CurrentCamera.CFrame.Position + Vector3.new(-15, 15, 0), v1190.Position)

			workspace.CurrentCamera.CFrame = v1191

			while _G.BringAll do
				FreezeCam(v1191)

				local v1192 = _Players
				local v1193, v1194, v1195 = pairs(v1192:GetPlayers())

				while true do
					local v1196

					v1195, v1196 = v1193(v1194, v1195)

					if v1195 == nil then
						break
					end
					if CheckPlayerBring(v1196) then
						local _HumanoidRootPart18 = v1196.Character:FindFirstChild('HumanoidRootPart')
						local _Humanoid8 = v1196.Character:FindFirstChildOfClass('Humanoid')
						local v1199

						if _Humanoid8 and _Humanoid8:FindFirstChild('Ragdolled') then
							v1199 = _Humanoid8.Ragdolled
						else
							v1199 = nil
						end
						if v1196 and _HumanoidRootPart18 and (_Humanoid8 and v1199) then
							for _ = 0, 50 do
								if not _G.BringAll then
									break
								end

								u406()
								SNOWshipOnce(_HumanoidRootPart18)

								if CheckNetworkOwnerShipOnPlayer(v1196) then
									if not v1199.Value and 10 < v1196:DistanceFromCharacter(v1190.Position) then
										_HumanoidRootPart18.CFrame = v1190
									end

									CreateBringBody(_HumanoidRootPart18, v1190)

									break
								end

								task.wait()

								if _HumanoidRootPart18.Position.Y <= -12 then
									TeleportPlayer(CFrame.new(_HumanoidRootPart18.Position + Vector3.new(0, 5, -15)))
								else
									TeleportPlayer(CFrame.new(_HumanoidRootPart18.Position + Vector3.new(0, -10, -10)))
								end
							end
						end
					end
				end

				TeleportPlayer(CFrame.new(527, 123, -376))
				task.wait()
			end

			unFreezeCam()
			u405()
			TeleportPlayer(v1190)
		end
	end,
})

v1152:AddDropdown({
	Name = 'Kick Type',
	Default = 'Go to the heaven!',
	Options = {
		'Go to the heaven!',
	},
	Callback = function(p1200)
		_G.KickAllType = p1200
	end,
	Save = true,
	Flag = 'kickalltype_dropdown',
})
v1154:AddToggle({
	Name = 'Whitelist Friends',
	Default = false,
	Callback = function(p1201)
		_G.WhitelistFriends3 = p1201
	end,
	Save = true,
	Flag = 'whitelistfriends3_toggle',
})

local v1202 = v648:AddSection({
	Name = 'Invulnerability',
})
local v1203 = v648:AddSection({
	Name = 'Counter-Attack',
})

v1202:AddToggle({
	Name = 'Anti-Grab',
	Default = false,
	Callback = function(p1204)
		_G.AntiGrab = p1204

		if p1204 and not u54(u28) then
			_Struggle:FireServer(_LocalPlayer)
		end
	end,
	Save = true,
	Flag = 'antigrab_toggle',
})
v1202:AddToggle({
	Name = 'Anti-Burn',
	Default = false,
	Callback = function(p1205)
		_G.AntiBurn = p1205
	end,
	Save = true,
	Flag = 'antiburn_toggle',
})
v1202:AddToggle({
	Name = 'Anti-Explosion',
	Default = false,
	Callback = function(p1206)
		_G.AntiExplosion = p1206
	end,
	Save = true,
	Flag = 'antiexplosion_toggle',
})
v1203:AddToggle({
	Name = 'Auto-Attacker',
	Default = false,
	Callback = function(p1207)
		_G.AutoAttacker = p1207
	end,
	Save = true,
	Flag = 'rinnegan_toggle',
})

counterdropdownselection = nil
counterdropdownselection = v1203:AddDropdown({
	Name = 'Counter Mode',
	Default = 'Repulsion',
	Options = {
		'Repulsion',
		'Freeze',
		'Death',
		'Kick',
	},
	Callback = function(p1208)
		if p1208 == 'Kick' and GetKey() ~= 'Xana' then
			counterdropdownselection:Set('Repulsion')
			u33('Only for premium users! Buy premium in my discord server!')
		else
			_G.CounterMode = p1208
		end
	end,
})
floppadialogo = Instance.new('ScreenGui')
Floppa = Instance.new('ImageLabel')
Bubble_chat = Instance.new('ImageLabel')
BubbleTextchat = Instance.new('TextLabel')
typingsoundeffect = Instance.new('Sound', _Workspace)
typingsoundeffect2 = Instance.new('Sound', _Workspace)
typingsoundeffect.SoundId = 'rbxassetid://' .. 9120299506
typingsoundeffect.Volume = 0.345
typingsoundeffect2.SoundId = 'rbxassetid://' .. 9118870964
typingsoundeffect2.Volume = 1
typingsoundeffect2.PlaybackSpeed = 1.5
floppadialogo.IgnoreGuiInset = true
floppadialogo.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
floppadialogo.Name = 'floppadialogo'
floppadialogo.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
floppadialogo.Parent = _PlayerGui
floppadialogo.DisplayOrder = 10
floppadialogo.Enabled = false
floppadialogo.ResetOnSpawn = false
Floppa.ZIndex = 0
Floppa.BorderSizePixel = 0
Floppa.BackgroundColor3 = Color3.new(1, 1, 1)
Floppa.Image = 'rbxassetid://15668608167'
Floppa.Size = UDim2.new(0.195372716, 0, 0.305668026, 0)
Floppa.BorderColor3 = Color3.new(0, 0, 0)
Floppa.Position = UDim2.new(0.0185752641, 0, 0.661330521, 0)
Floppa.Name = 'Floppa'
Floppa.Parent = floppadialogo
Bubble_chat.BorderSizePixel = 0
Bubble_chat.Transparency = 1
Bubble_chatBackgroundColor3 = Color3.new(1, 1, 1)
Bubble_chat.Image = 'rbxassetid://1395860348'
Bubble_chat.Size = UDim2.new(1.03356743, 0, 0.79455024, 0)
Bubble_chat.BorderColor3 = Color3.new(0, 0, 0)
Bubble_chat.BackgroundTransparency = 1
Bubble_chat.Position = UDim2.new(0.678329766, 0, -0.292054504, 0)
Bubble_chat.Name = 'Bubble chat'
Bubble_chat.Parent = Floppa
BubbleTextchat.TextWrapped = true
BubbleTextchat.BorderSizePixel = 0
BubbleTextchat.Transparency = 1
BubbleTextchat.TextScaled = true
BubbleTextchat.BackgroundColor3 = Color3.new(1, 1, 1)
BubbleTextchat.TextSize = 14
BubbleTextchat.Size = UDim2.new(0.634431362, 0, 0.268763244, 0)
BubbleTextchat.TextColor3 = Color3.new(0, 0, 0)
BubbleTextchat.BorderColor3 = Color3.new(0, 0, 0)
BubbleTextchat.Text = 'I saved you from falling on the void, my son!'
BubbleTextchat.Font = Enum.Font.SourceSans
BubbleTextchat.Position = UDim2.new(0.18163082, 0, 0.365639389, 0)
BubbleTextchat.BackgroundTransparency = 1
BubbleTextchat.TextTransparency = 0
BubbleTextchat.Parent = Bubble_chat
floppatweeninfo1 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)

local v1209 = _TweenService

floppatween = _TweenService.Create(v1209, Floppa, floppatweeninfo1, {
	Position = UDim2.new(0.0185752641, 0, 0.661330521, 0),
})
floppamessageoncooldown = false

function antivoidmesssage()
	if not floppamessageoncooldown then
		Floppa.Position = UDim2.new(0.0185752641, 0, 2, 0)
		floppadialogo.Enabled = true
		Floppa.Visible = true
		Bubble_chat.Visible = false
		BubbleTextchat.Visible = false
		floppamessageoncooldown = true

		floppatween:Play()
		floppatween.Completed:Connect(function(p1210)
			if p1210 == Enum.PlaybackState.Completed then
				Bubble_chat.Visible = true
				BubbleTextchat.Visible = true
				BubbleTextchat.Text = ''

				local v1211 = 'I saved you from falling on the void, my son!'

				for v1212 = 0, #v1211 do
					BubbleTextchat.Text = string.sub(v1211, 1, v1212)

					typingsoundeffect:Play()
					task.wait(0.05)
				end

				task.wait(1)
				typingsoundeffect2:Play()

				floppadialogo.Enabled = false
				floppamessageoncooldown = false
			end
		end)
	end
end

v1202:AddToggle({
	Name = 'Anti-Void',
	Default = false,
	Callback = function(p1213)
		_G.AntiVoid = p1213

		if p1213 then
			_Workspace.FallenPartsDestroyHeight = -1000

			while _G.AntiVoid do
				local v1214 = GetPlayerCharacter()

				if v1214 and v1214.HumanoidRootPart.Position.Y < -800 then
					v1214:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))
					antivoidmesssage()
				end

				wait(0.1)
			end
		else
			_Workspace.FallenPartsDestroyHeight = -100
		end
	end,
	Save = true,
	Flag = 'antivoid_toggle',
})
v1202:AddToggle({
	Name = 'Anti-Lag',
	Default = false,
	Callback = function(p1215)
		anticreatelinelocalscript.Disabled = p1215
	end,
	Save = true,
	Flag = 'antilag_toggle',
})

antikicktoggle = v1202:AddToggle({
	Name = 'Anti-Kick',
	Default = false,
	Callback = function(p1216)
		_G.AntiKick = p1216

		if p1216 then
			while _G.AntiKick do
				GetKunai()
				task.wait()
			end
		end
	end,
	Save = true,
	Flag = 'antikick_toggle',
})
playersCharFolder = Instance.new('Model', _Workspace)
playersCharFolder.Name = 'Characters'
highlightesp = Instance.new('Highlight')
highlightesp.Enabled = true
ESP_Section1 = Esp_Tab:AddSection({
	Name = 'ESP Highlight',
})
ESP_Section2 = Esp_Tab:AddSection({
	Name = 'ESP Billboard',
})

ESP_Section1:AddToggle({
	Name = 'ESP (Highlight)',
	Default = false,
	Callback = function(p1217)
		_G.ESP_Hightlight = p1217

		if p1217 then
			highlightesp.Parent = playersCharFolder

			local function u1220(p1218)
				local v1219 = p1218 ~= _LocalPlayer and p1218.Character

				if v1219 then
					v1219.Parent = playersCharFolder
				end
			end
			local function v1226()
				local v1221 = _Players
				local v1222, v1223, v1224 = pairs(v1221:GetPlayers())

				while true do
					local v1225

					v1224, v1225 = v1222(v1223, v1224)

					if v1224 == nil then
						break
					end

					u1220(v1225)
				end
			end

			v1226()

			while _G.ESP_Hightlight do
				v1226()
				wait(2)
			end

			highlightesp.Parent = nil
		end
	end,
})
ESP_Section1:AddColorpicker({
	Name = 'Fill Color',
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(p1227)
		highlightesp.FillColor = p1227
	end,
	Save = true,
	Flag = 'espHighlightFillcolor_picker',
})
ESP_Section1:AddSlider({
	Name = 'Fill Transparency',
	Min = 0,
	Max = 1,
	Default = 0.5,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 0.1,
	ValueName = 'Fill color transparency:',
	Callback = function(p1228)
		highlightesp.FillTransparency = p1228
	end,
	Save = true,
	Flag = 'espHighlightFillTransparency_slider',
})
ESP_Section1:AddColorpicker({
	Name = 'Outline Color',
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(p1229)
		highlightesp.OutlineColor = p1229
	end,
	Save = true,
	Flag = 'espHighlightOutlinecolor_picker',
})
ESP_Section1:AddSlider({
	Name = 'Outline Transparency',
	Min = 0,
	Max = 1,
	Default = 0.5,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 0.1,
	ValueName = 'Outline color transparency:',
	Callback = function(p1230)
		highlightesp.OutlineTransparency = p1230
	end,
	Save = true,
	Flag = 'espHighlightOutlineTransparency_slider',
})
ESP_Section1:AddDropdown({
	Name = 'Highlight Mode',
	Default = 'AlwaysOnTop',
	Options = {
		'AlwaysOnTop',
		'Occluded',
	},
	Callback = function(p1231)
		highlightesp.DepthMode = Enum.HighlightDepthMode[p1231]
	end,
	Save = true,
	Flag = 'espHighlightMode_dropdown',
})

function ESPIconCreation()
	local _BillboardGui3 = Instance.new('BillboardGui')
	local _ImageButton = Instance.new('ImageButton')
	local _UICorner = Instance.new('UICorner')
	local _TextLabel3 = Instance.new('TextLabel')
	local _UITextSizeConstraint3 = Instance.new('UITextSizeConstraint')
	local _UIAspectRatioConstraint2 = Instance.new('UIAspectRatioConstraint')

	_BillboardGui3.Name = 'ESP'
	_BillboardGui3.Parent = nil
	_BillboardGui3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	_BillboardGui3.Active = true
	_BillboardGui3.Adornee = nil
	_BillboardGui3.AlwaysOnTop = true
	_BillboardGui3.ExtentsOffset = Vector3.new(0, 10, 0)
	_BillboardGui3.Size = UDim2.new(3, 50, 3, 45)
	_ImageButton.Name = 'UserImage'
	_ImageButton.Parent = _BillboardGui3
	_ImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
	_ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_ImageButton.BackgroundTransparency = 1
	_ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_ImageButton.BorderSizePixel = 0
	_ImageButton.Position = UDim2.new(0.5, 0, 0.300000012, 0)
	_ImageButton.Size = UDim2.new(0.5, 5, 0.5, 5)
	_ImageButton.Image = ''
	_UICorner.CornerRadius = UDim.new(2, 0)
	_UICorner.Parent = _ImageButton
	_TextLabel3.Name = 'Username'
	_TextLabel3.Parent = _BillboardGui3
	_TextLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
	_TextLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_TextLabel3.BackgroundTransparency = 1
	_TextLabel3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	_TextLabel3.BorderSizePixel = 0
	_TextLabel3.Position = UDim2.new(0.5, 0, 0.75999999, 0)
	_TextLabel3.Size = UDim2.new(1, 5, 0.340000004, 5)
	_TextLabel3.Font = Enum.Font.SourceSans
	_TextLabel3.Text = ''
	_TextLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
	_TextLabel3.TextScaled = true
	_TextLabel3.TextSize = 35
	_TextLabel3.TextStrokeTransparency = 0
	_TextLabel3.TextWrapped = true
	_UITextSizeConstraint3.Parent = _TextLabel3
	_UITextSizeConstraint3.MaxTextSize = 35
	_UITextSizeConstraint3.MinTextSize = 15
	_UIAspectRatioConstraint2.Parent = _BillboardGui3
	_UIAspectRatioConstraint2.AspectRatio = 1.043

	return _BillboardGui3
end

ESPIconCreation = ESPIconCreation()

function CreateIconOnPlayer(p1238)
	if p1238.Character then
		local _Character12 = p1238.Character
		local _Head7 = _Character12:WaitForChild('Head', 1)

		if not _Character12:FindFirstChild('ESP') and _Head7 then
			local u1241 = ESPIconCreation:Clone()

			u1241.Parent = _Character12
			u1241.Adornee = _Head7
			u1241.Username.Text = p1238.Name
			u1241.UserImage.Image = 'https://www.roblox.com/headshot-thumbnail/image?userId=' .. p1238.UserId .. '&width=420&height=420&format=png'

			task.spawn(function()
				while _Character12.Parent and _G.ESP_Icon do
					task.wait(0.25)
				end

				u1241:Destroy()
			end)
		end
	end
end

ESP_Section2:AddToggle({
	Name = 'ESP (Icon)',
	Default = false,
	Callback = function(p1242)
		_G.ESP_Icon = p1242

		if p1242 then
			local u1243 = {}

			local function v1248()
				local v1244, v1245, v1246 = pairs(u1243)

				while true do
					local v1247

					v1246, v1247 = v1244(v1245, v1246)

					if v1246 == nil then
						break
					end
					if typeof(v1247) == 'RBXScriptConnection' then
						v1247:Disconnect()
						print('Desconectado!')
					end
				end

				table.clear(u1243)
			end
			local function u1250(p1249)
				if p1249 ~= _LocalPlayer and (p1249.Character or p1249.CharacterAdded:Wait()) then
					CreateIconOnPlayer(p1249)

					u1243[#u1243 + 1] = p1249.CharacterAdded:Connect(function(_)
						CreateIconOnPlayer(p1249)
					end)
				end
			end
			local function v1256()
				local v1251 = _Players
				local v1252, v1253, v1254 = pairs(v1251:GetPlayers())

				while true do
					local v1255

					v1254, v1255 = v1252(v1253, v1254)

					if v1254 == nil then
						break
					end

					u1250(v1255)
				end
			end

			local v1258 = _Players.PlayerAdded:Connect(function(p1257)
				u1250(p1257)
			end)

			v1256()

			while _G.ESP_Icon do
				wait(0.1)
			end

			v1258:Disconnect()
			v1248()
		end
	end,
})

MapTeleport_Section = v651:AddSection({
	Name = 'Place TP',
})
PlayerTeleport_Section = v651:AddSection({
	Name = 'Player TP',
})
placeLocations = {
	['Green House'] = CFrame.new(-352, 99, 354),
	['Green Safe-House'] = CFrame.new(-584, -6, 93),
	['Chinese Safe-House'] = CFrame.new(579, 124, -94),
	['Farm House'] = CFrame.new(-234, 83, -324),
	Spawn = CFrame.new(4, -7, -3),
	['Blue Safe-House'] = CFrame.new(538, 96, -372),
	['Secret Big Cave'] = CFrame.new(17, -7, 539),
	['Secret Train Cave'] = CFrame.new(500, 62, -307),
	['Mine Cave'] = CFrame.new(-254, -7, 518),
	['Witch Safe-House'] = CFrame.new(296, -4, 494),
	['Red Safe-House'] = CFrame.new(-516, -6, -162),
}

MapTeleport_Section:AddDropdown({
	Name = 'Place to Teleport',
	Default = 'Green House',
	Options = {
		'Green House',
		'Chinese Safe-House',
		'Spawn',
		'Blue Safe-House',
		'Secret Big Cave',
		'Secret Train Cave',
		'Mine Cave',
		'Farm House',
		'Witch Safe-House',
		'Green Safe-House',
		'Red Safe-House',
	},
	Callback = function(p1259)
		_G.PlaceToTeleport = p1259
	end,
})
MapTeleport_Section:AddButton({
	Name = 'Teleport',
	Callback = function()
		TeleportPlayer(placeLocations[_G.PlaceToTeleport])
	end,
})

PlayerToTeleport = PlayerTeleport_Section:AddDropdown({
	Name = 'Select Player',
	Default = '',
	Options = {
		'',
	},
	Callback = function(p1260)
		local v1261 = string.split(p1260, ' ')

		_G.PlayerToTeleport = v1261[1]
	end,
})

function teleportplayerfunctionoffset(p1262, p1263, p1264, p1265)
	local v1266 = nil

	if _G.PlayerToTeleportDirection ~= 'Behind' then
		if _G.PlayerToTeleportDirection ~= 'Front' then
			if _G.PlayerToTeleportDirection ~= 'Right' then
				if _G.PlayerToTeleportDirection ~= 'Left' then
					if _G.PlayerToTeleportDirection == 'Rotate' and (p1263 and p1264) then
						local v1267 = 0

						while _G.PlayerToTeleportDirection == 'Rotate' and _G.LoopPlayerTP and (p1264:IsDescendantOf(_Workspace) and p1265 == _G.PlayerToTeleport) do
							v1267 = v1267 + 0.1
							v1266 = CFrame.new(p1263.Position + Vector3.new(math.clamp(math.cos(v1267), -1, 1), 0, math.clamp(math.sin(v1267), -1, 1)) * (TeleportPlayerOffset + 1), p1263.Position)

							TeleportPlayer(v1266)
							task.wait()
						end
					end
				else
					v1266 = CFrame.new(p1262.Position - p1262.rightVector * (TeleportPlayerOffset + 1))
				end
			else
				v1266 = CFrame.new(p1262.Position + p1262.rightVector * (TeleportPlayerOffset + 1))
			end
		else
			v1266 = CFrame.new(p1262.Position + p1262.lookVector * (TeleportPlayerOffset + 1))
		end
	else
		v1266 = CFrame.new(p1262.Position - p1262.lookVector * (TeleportPlayerOffset + 1))
	end
	if _G.PlayerToTeleportDirection ~= 'Rotate' then
		TeleportPlayer(v1266)
	end
end

PlayerTeleport_Section:AddButton({
	Name = 'Teleport',
	Callback = function()
		local v1268 = _Players:FindFirstChild(_G.PlayerToTeleport)
		local v1269 = GetPlayerRoot()
		local v1270 = v1268 and (v1268.Character and v1269) and v1268.Character:FindFirstChild('HumanoidRootPart')

		if v1270 then
			teleportplayerfunctionoffset(v1270.CFrame, v1269)
		end
	end,
})

PlayerLoopTeleport = PlayerTeleport_Section:AddToggle({
	Name = 'Loop Teleport',
	Default = false,
	Callback = function(p1271)
		_G.LoopPlayerTP = p1271

		if p1271 then
			while _G.LoopPlayerTP do
				local v1272 = _Players:FindFirstChild(_G.PlayerToTeleport)

				if v1272 and v1272.Character and not IsPlayerKickingWithBlobman() then
					local _Character13 = v1272.Character
					local _HumanoidRootPart19 = _Character13:FindFirstChild('HumanoidRootPart')

					if _HumanoidRootPart19 then
						teleportplayerfunctionoffset(_HumanoidRootPart19.CFrame, _HumanoidRootPart19, _Character13, v1272.Name)
					end
				elseif not v1272 then
					if PlayerLoopTeleport then
						PlayerLoopTeleport:Set(false)
					end

					_G.LoopPlayerTP = false
				end

				task.wait()
			end
		end
	end,
})
PlayerLockCamera = PlayerTeleport_Section:AddToggle({
	Name = 'Lock Camera',
	Default = false,
	Callback = function(p1275)
		_G.LockCameraOnPlayer = p1275

		if p1275 then
			local u1276 = nil
			local u1277 = nil
			local u1278 = nil
			local u1279 = nil
			local u1280 = nil

			u1280 = _RunService.RenderStepped:Connect(function()
				u1276 = _Players:FindFirstChild(_G.PlayerToTeleport)
				u1279 = _Workspace.CurrentCamera

				if not _G.LockCameraOnPlayer then
					u1280:Disconnect()
				end
				if u1276 and u1276.Character and u1279 then
					u1278 = u1276.Character
					u1277 = u1278:FindFirstChild('HumanoidRootPart')

					if u1277 then
						u1279.CFrame = CFrame.lookAt(u1279.CFrame.Position, u1277.CFrame.Position + Vector3.new(0, 1, 0))
					end
				elseif not u1276 then
					if PlayerLockCamera then
						PlayerLockCamera:Set(false)
					end

					_G.LockCameraOnPlayer = false
				end

				task.wait()
			end)
		end
	end,
})
PlayerViewCamera = PlayerTeleport_Section:AddToggle({
	Name = 'View',
	Default = false,
	Callback = function(p1281)
		_G.ViewCameraOnPlayer = p1281

		if p1281 then
			local _CurrentCamera3 = _Workspace.CurrentCamera
			local _CameraSubject = _CurrentCamera3.CameraSubject

			while _G.ViewCameraOnPlayer do
				local v1284 = _Players:FindFirstChild(_G.PlayerToTeleport)

				if v1284 and v1284.Character and _CurrentCamera3 then
					local _Humanoid9 = v1284.Character:FindFirstChildOfClass('Humanoid')

					if _Humanoid9 then
						_CurrentCamera3.CameraSubject = _Humanoid9
					end
				elseif not v1284 then
					if PlayerViewCamera then
						PlayerViewCamera:Set(false)
					end

					_G.ViewCameraOnPlayer = false
				end

				wait()
			end

			_CurrentCamera3.CameraSubject = _CameraSubject
		end
	end,
})

PlayerTeleport_Section:AddSlider({
	Name = 'Offset',
	Min = 1,
	Max = 20,
	Default = 1,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = 'Teleport Offset',
	Callback = function(p1286)
		TeleportPlayerOffset = p1286
	end,
	Save = true,
	Flag = 'speed_slider',
})
PlayerTeleport_Section:AddDropdown({
	Name = 'Behavior',
	Default = 'Behind',
	Options = {
		'Behind',
		'Left',
		'Right',
		'Front',
		'Rotate',
	},
	Callback = function(p1287)
		_G.PlayerToTeleportDirection = p1287
	end,
})

WS_Section = v649:AddSection({
	Name = 'Walkspeed',
})
JP_Section = v649:AddSection({
	Name = 'Infinite Power Jump',
})
NC_Section = v649:AddSection({
	Name = 'Noclip',
})

WS_Section:AddToggle({
	Name = 'Walkspeed',
	Default = false,
	Callback = function(p1288)
		_G.SuperSpeed = p1288
	end,
	Save = true,
	Flag = 'walkspeed_toggle',
})
WS_Section:AddSlider({
	Name = 'Speed',
	Min = 0.1,
	Max = 5,
	Default = 0.1,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 0.01,
	ValueName = '',
	Callback = function(p1289)
		Multiplier = p1289
	end,
	Save = true,
	Flag = 'speed_slider',
})
JP_Section:AddToggle({
	Name = 'Infinite Jump',
	Default = false,
	Callback = function(p1290)
		_G.InfiniteJump = p1290
	end,
	Save = true,
	Flag = 'infinitejump_toggle',
})
JP_Section:AddSlider({
	Name = 'Jump Power',
	Min = 24,
	Max = 1000,
	Default = 24,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 10,
	ValueName = '',
	Callback = function(p1291)
		_G.InfiniteJumpPower = p1291
		_LocalPlayer.Character:FindFirstChildOfClass('Humanoid').JumpPower = p1291
	end,
	Save = true,
	Flag = 'jumppower_slider',
})
NC_Section:AddToggle({
	Name = 'Noclip',
	Default = false,
	Callback = function(p1292)
		_G.NoclipToggle = p1292

		if p1292 then
			u406()
		else
			u405()
		end
	end,
	Save = true,
	Flag = 'noclip_toggle',
})

local u1293 = {
	Color3.new(1, 0, 0),
	Color3.new(1, 0, 0),
	Color3.new(1, 0, 0),
	Color3.new(1, 0, 0),
	Color3.new(1, 0, 0),
	Color3.new(1, 0, 0),
	Color3.new(1, 0, 0),
	Color3.new(1, 0, 0),
	Color3.new(1, 0, 0),
	Color3.new(1, 0, 0),
}
local v1294 = v652:AddSection({
	Name = 'Change your entire line color',
})
local v1295 = v652:AddSection({
	Name = 'Line Effects',
})
local v1296 = v652:AddSection({
	Name = 'Stress Server',
})

LagServerToggle = nil
LagServerToggle = v1296:AddToggle({
	Name = 'Lag Server',
	Default = false,
	Callback = function(p1297)
		laggg = p1297

		while laggg do
			if GetKey() ~= 'Xana' then
				LagServerToggle:Set(false)
				u33('Only for premium users! Buy premium in my discord server!')

				break
			end

			for _ = 0, Lag_Intensity do
				local v1298, v1299, v1300 = ipairs(game:GetService('Players'):GetPlayers())

				while true do
					local v1301

					v1300, v1301 = v1298(v1299, v1300)

					if v1300 == nil then
						break
					end
					if v1301.Character.Torso ~= nil then
						_CreateGrabLine:FireServer(v1301.Character.Torso, v1301.Character.Torso.CFrame)
					end
				end
			end

			wait(1)
		end
	end,
})

v1296:AddSlider({
	Name = 'Lag Intensity',
	Min = 1,
	Max = 400,
	Default = 150,
	Color = Color3.fromRGB(255, 255, 255),
	Increment = 1,
	ValueName = 'This can have you kicked or kick someone in the server!',
	Save = true,
	Flag = 'Lag-Intensity',
	Callback = function(p1302)
		Lag_Intensity = p1302
	end,
})
v1294:AddColorpicker({
	Name = 'Choose the color',
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(p1303)
		_G.LineColorChangeValue = p1303
	end,
	Save = true,
	Flag = 'changelinecolor_picker',
})
v1294:AddButton({
	Name = 'Apply Colors',
	Callback = function()
		local v1304, v1305, v1306 = pairs(u1293)

		while true do
			local v1307

			v1306, v1307 = v1304(v1305, v1306)

			if v1306 == nil then
				break
			end
			if v1306 == 1 then
				u1293[v1306] = ColorSequence.new(_G.LineColorChangeValue, 1)
			else
				u1293[v1306] = Color3.new(_G.LineColorChangeValue.R / 255, _G.LineColorChangeValue.G / 255, _G.LineColorChangeValue.B / 255)
			end
		end

		_UpdateLineColorsEvent:FireServer(unpack(u1293))
	end,
})
v1295:AddToggle({
	Name = 'Crazy Line (Soft Lag)',
	Default = false,
	Callback = function(p1308)
		if p1308 then
			_G.CrazyLine = p1308

			while _G.CrazyLine do
				local v1309 = _Players
				local v1310, v1311, v1312 = pairs(v1309:GetPlayers())

				while true do
					local v1313

					v1312, v1313 = v1310(v1311, v1312)

					if v1312 == nil then
						break
					end
					if v1313 and v1313 ~= _LocalPlayer and v1313.Character and v1313.Character:FindFirstChild('Torso') then
						_CreateGrabLine:FireServer(v1313.Character:FindFirstChild('Torso'), CFrame.new(0.12640380859375, 0.9606337547302246, -0.5000009536743164, 0.9985212683677673, 0, -0.05436277016997337, -6.4805472099749295e-9, 1, -1.1903301100346653e-7, 0.05436277016997337, 5.9604644775390625e-8, 0.9985212683677673))
					end

					task.wait()
				end
			end
		else
			_G.CrazyLine = p1308
		end
	end,
	Save = true,
	Flag = 'softlagline_toggle',
})
v1295:AddToggle({
	Name = 'Invisible Line',
	Default = false,
	Callback = function(p1314)
		if p1314 then
			_G.InvisibleLine = p1314
		else
			_G.InvisibleLine = p1314
		end
	end,
	Save = true,
	Flag = 'invisLine_toggle',
})
_ContextActionService:BindAction('Godmode', GodModeFTry, false, Enum.KeyCode.T)
v1295:AddParagraph('Note!', "You can't see the effects line, but others player can see it. And Invisible Line won't work if Crazy Line is Enabled")

gui2 = Instance.new('ScreenGui')
gui2.ResetOnSpawn = false
gui2.Name = 'CAG2'

if _UserInputService.TouchEnabled then
	gui2.Parent = _LocalPlayer.PlayerGui
end

imageButtonTeleport = Instance.new('ImageButton')
imageButtonTeleport.Size = UDim2.new(0, 70, 0, 70)
imageButtonTeleport.Position = UDim2.new(1, -267, 1, -90)
imageButtonTeleport.Image = 'rbxassetid://97166444'
imageButtonTeleport.BackgroundTransparency = 1
imageButtonTeleport.ImageTransparency = 0.2
imageButtonTeleport.ImageColor3 = Color3.fromRGB(142, 142, 142)
imageButtonTeleport.Parent = gui2
imageTLabel = Instance.new('ImageLabel')
imageTLabel.Size = UDim2.new(1, 0, 1, 0)
imageTLabel.Image = 'rbxassetid://6723742952'
imageTLabel.BackgroundTransparency = 1
imageTLabel.Parent = imageButtonTeleport
imageButtonControl = Instance.new('ImageButton')
imageButtonControl.Size = UDim2.new(0, 50, 0, 50)
imageButtonControl.Position = UDim2.new(1, -378, 1, -80)
imageButtonControl.Image = 'rbxassetid://97166444'
imageButtonControl.BackgroundTransparency = 1
imageButtonControl.ImageTransparency = 0.2
imageButtonControl.ImageColor3 = Color3.fromRGB(142, 142, 142)
imageButtonControl.Parent = gui2
imageCLabel = Instance.new('ImageLabel')
imageCLabel.Size = UDim2.new(1, 0, 1, 0)
imageCLabel.Image = 'rbxassetid://14436167187'
imageCLabel.BackgroundTransparency = 1
imageCLabel.Parent = imageButtonControl
imageButtonAnchor = Instance.new('ImageButton')
imageButtonAnchor.Size = UDim2.new(0, 50, 0, 50)
imageButtonAnchor.Position = UDim2.new(1, -325, 1, -80)
imageButtonAnchor.Image = 'rbxassetid://97166444'
imageButtonAnchor.BackgroundTransparency = 1
imageButtonAnchor.ImageTransparency = 0.2
imageButtonAnchor.ImageColor3 = Color3.fromRGB(142, 142, 142)
imageButtonAnchor.Parent = gui2
imageKLabelDe = Instance.new('ImageLabel')
imageKLabelDe.Size = UDim2.new(1, 0, 1, 0)
imageKLabelDe.Image = 'rbxassetid://3040311268'
imageKLabelDe.BackgroundTransparency = 1
imageKLabelDe.Parent = imageButtonAnchor

imageButtonAnchor.InputBegan:Connect(function(p1315, p1316)
	if not p1316 and (u712.TouchEnabled and p1315.UserInputType == Enum.UserInputType.Touch) then
		anchorfunc()
	end
end)
imageButtonTeleport.InputBegan:Connect(function(p1317, p1318)
	if not p1318 and (u712.TouchEnabled and p1317.UserInputType == Enum.UserInputType.Touch) then
		teleportfunc()
	end
end)
imageButtonControl.InputBegan:Connect(function(p1319, p1320)
	if not p1320 and (u712.TouchEnabled and p1319.UserInputType == Enum.UserInputType.Touch) then
		controlBind('Control(C)', Enum.UserInputState.Begin)
	end
end)

local v1321 = v654:AddSection({
	Name = 'Teleport',
})
local v1322 = v654:AddSection({
	Name = 'Spawn Toy',
})
local v1323 = v654:AddSection({
	Name = 'Anchor Objects',
})
local v1324 = v654:AddSection({
	Name = 'Compile Objects',
})
local v1325 = v654:AddSection({
	Name = 'Control Player/NPC',
})

v1323:AddToggle({
	Name = 'Anchor (K)',
	Default = false,
	Callback = function(p1326)
		imageButtonAnchor.Visible = p1326
		imageButtonAnchor.Active = p1326

		if p1326 then
			_ContextActionService:BindAction('AnchorK', anchorobject, false, Enum.KeyCode.K)
		else
			_ContextActionService:UnbindAction('AnchorK')
		end
	end,
	Save = true,
	Flag = 'anchorbind_toggle',
})
v1323:AddButton({
	Name = 'Unanchor All',
	Callback = function(_)
		local v1327, v1328, v1329 = pairs(AnchoredObjects)

		while true do
			local v1330

			v1329, v1330 = v1327(v1328, v1329)

			if v1329 == nil then
				break
			end
			if typeof(v1330.PartAnchored) == 'Instance' then
				unAnchorObject(v1330.PartAnchored)
			end
		end
	end,
})
v1324:AddButton({
	Name = 'Compile New Group',
	Callback = function()
		u350()
	end,
})

CompileGroups_Dropdown = v1324:AddDropdown({
	Name = 'Groups',
	Default = '',
	Options = {
		'',
	},
	Callback = function(p1331)
		_G.CompileGroupSelected = p1331
	end,
})

v1324:AddButton({
	Name = 'Delete Group',
	Callback = function()
		RemoveGroupCompileFromName(_G.CompileGroupSelected)
		updateCompileGroupsDropdown(CompileGroups_Dropdown)
	end,
})
v1321:AddToggle({
	Name = 'Teleport (Z)',
	Default = false,
	Callback = function(p1332)
		imageButtonTeleport.Visible = p1332
		imageButtonTeleport.Active = p1332

		if p1332 then
			_ContextActionService:BindAction('Teleport(Z)', u103, false, Enum.KeyCode.Z)
		else
			_ContextActionService:UnbindAction('Teleport(Z)')
		end
	end,
	Save = true,
	Flag = 'teleportbind_toggle',
})
v1325:AddToggle({
	Name = 'Control (C)',
	Default = false,
	Callback = function(p1333)
		imageButtonControl.Visible = p1333
		imageButtonControl.Active = p1333

		if p1333 then
			_ContextActionService:BindAction('Control(C)', controlBind, false, Enum.KeyCode.C)
		else
			_ContextActionService:UnbindAction('Control(C)')
		end
	end,
	Save = true,
	Flag = 'controlbind_toggle',
})
v1322:AddDropdown({
	Name = 'Select Toy',
	Default = 'Pallet',
	Options = {
		'Pallet',
		'BombMissile',
	},
	Callback = function(p1334)
		if p1334 == 'Pallet' then
			_G.SelectedToy = 'PalletLightBrown'
		else
			_G.SelectedToy = p1334
		end
	end,
	Save = true,
	Flag = 'selecttoy_dropdown',
})
v1322:AddToggle({
	Name = 'Spawn Toy (TAB)',
	Default = false,
	Callback = function(p1335)
		if p1335 then
			_ContextActionService:BindAction('Spawn Toy (TAB)', u96, false, Enum.KeyCode.Tab)
			_ContextActionService:SetImage('Spawn Toy (TAB)', 'rbxassetid://6723742952')
			_ContextActionService:SetPosition('Spawn Toy (TAB)', UDim2.new(1, -367, 1, -90))

			local _SpawnToyTAB = _ContextActionService:GetButton('Spawn Toy (TAB)')

			if _SpawnToyTAB then
				_SpawnToyTAB.Size = UDim2.new(0, 70, 0, 70)
			end
		else
			_ContextActionService:UnbindAction('Spawn Toy (TAB)')
		end
	end,
	Save = true,
	Flag = 'spawntoy_toggle',
})

local v1337 = v659:AddSection({
	Name = 'Whitelist',
})
local u1339 = v1337:AddDropdown({
	Name = 'Select Player',
	Default = '',
	Options = {
		'',
	},
	Callback = function(p1338)
		if p1338 then
			_G.PlayerToAddWhitelist = string.split(p1338, ' ')[1]
		end
	end,
})
local u1340 = nil

v1337:AddButton({
	Name = 'Add',
	Callback = function()
		if not u105(_G.PlayerToAddWhitelist) then
			table.insert(u404, _G.PlayerToAddWhitelist)
			u79(u1340, u404)
		end
	end,
})

u1340 = v1337:AddDropdown({
	Name = 'Players in Whitelist',
	Default = '',
	Options = {
		'',
	},
	Callback = function(p1341)
		_G.PlayerToRemoveWhitelist = p1341
	end,
})

v1337:AddButton({
	Name = 'Remove',
	Callback = function()
		local v1342, v1343, v1344 = pairs(u404)

		while true do
			local v1345

			v1344, v1345 = v1342(v1343, v1344)

			if v1344 == nil then
				break
			end
			if v1345 == _G.PlayerToRemoveWhitelist then
				u404[v1344] = nil
			end
		end

		u79(u1340, u404)
	end,
})

local v1346 = v659:AddSection({
	Name = 'Blobman Loopkick',
})
local v1347 = v659:AddSection({
	Name = 'Perspective',
})

v659:AddSection({
	Name = 'Anchor Objects/Compiled Groups',
}):AddToggle({
	Name = 'Auto Ownership',
	Default = false,
	Callback = function(p1348)
		_G.AutoOwnershipAnchor = p1348

		if p1348 then
			while _G.AutoOwnershipAnchor do
				autosetownership()
				task.wait(0.1)
			end
		end
	end,
	Save = true,
	Flag = 'autoownershipanchorconfig_toggle',
})
v1346:AddToggle({
	Name = 'Heavy Blobman',
	Default = false,
	Callback = function(p1349)
		_G.RockBlobman = p1349
	end,
	Save = true,
	Flag = 'heavyblobmanconfig_toggle',
})

_G.PerspectiveEffectsAllow = true

v1347:AddToggle({
	Name = 'Teleport to Camera Position',
	Default = true,
	Callback = function(p1350)
		_G.PerspectiveTeleportToCameraPos = p1350
	end,
	Save = true,
	Flag = 'perspectiveconfig1_toggle',
})
v1347:AddDropdown({
	Name = 'Camera Effect',
	Default = 'Default',
	Options = {
		'Default',
		'Old TV',
	},
	Callback = function(p1351)
		if p1351 == 'Default' then
			ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Size = UDim2.new(1, 0, 1, 0)
			ImageLabel.Image = 'rbxassetid://5945121255'
			ImageLabel.ImageColor3 = Color3.new(0, 0, 0)
			imagestransparencyeffect = 0.45
			saturationvalue = -0.6
			perspectiveON_effect1 = _TweenService:Create(ImageLabel, t1p, {ImageTransparency = imagestransparencyeffect})
			perspectiveON_effect2 = _TweenService:Create(PerspectiveSaturation, t1p, {Saturation = saturationvalue})
		elseif p1351 == 'Old TV' then
			ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Size = UDim2.new(1, 0, 1, 0)
			ImageLabel.Image = 'rbxassetid://8586979842'
			ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
			imagestransparencyeffect = 0.7
			saturationvalue = -0.3
			perspectiveON_effect1 = _TweenService:Create(ImageLabel, t1p, {ImageTransparency = imagestransparencyeffect})
			perspectiveON_effect2 = _TweenService:Create(PerspectiveSaturation, t1p, {Saturation = saturationvalue})
		end
	end,
	Save = true,
	Flag = 'perspectivevisualeffect_dropdown',
})

local v1352 = v655:AddSection({
	Name = 'Loop Players',
})
local v1353 = v655:AddSection({
	Name = 'Players in Loop',
})
local v1354 = v655:AddSection({
	Name = 'Loop Kill Functions',
})
local v1355 = v655:AddSection({
	Name = 'Loop Kick (Blobman)',
})
local u1357 = v1352:AddDropdown({
	Name = 'Select Player',
	Default = '',
	Options = {
		'',
	},
	Callback = function(p1356)
		if p1356 then
			_G.PlayerToAdd = string.split(p1356, ' ')[1]
		end
	end,
})
local u1358 = nil
local u1359 = 3

v1352:AddButton({
	Name = 'Add',
	Callback = function()
		if not table.find(u70, _G.PlayerToAdd) then
			if u1359 <= #u70 then
				u33('You reached the max ammount of players in loop, buy premium to unlock more space!')
			else
				table.insert(u70, _G.PlayerToAdd)
				u79(u1358, u70)
			end
		end
	end,
})

local u1361 = v1353:AddDropdown({
	Name = 'Players in Loop',
	Default = '',
	Options = {
		'',
	},
	Callback = function(p1360)
		_G.PlayerToRemove = p1360
	end,
})

v1353:AddButton({
	Name = 'Remove',
	Callback = function()
		local v1362, v1363, v1364 = pairs(u70)

		while true do
			local v1365

			v1364, v1365 = v1362(v1363, v1364)

			if v1364 == nil then
				break
			end
			if v1365 == _G.PlayerToRemove then
				u70[v1364] = nil
			end
		end

		u79(u1361, u70)
	end,
})

local function u1372()
	if typeof(_G.LastBlobmanWasSeat) ~= 'Instance' or not _G.LastBlobmanWasSeat.Parent then
		_G.LastBlobmanWasSeat = u644()
	else
		local v1366 = GetPlayerCharacter()
		local _VehicleSeat = _G.LastBlobmanWasSeat:FindFirstChild('VehicleSeat')

		if not (_VehicleSeat and _VehicleSeat:FindFirstChild('ProximityPrompt')) then
			DeleteToyRE:FireServer(_G.LastBlobmanWasSeat)

			return
		end

		local _ProximityPrompt = _VehicleSeat.ProximityPrompt
		local _Weld = _VehicleSeat:FindFirstChildOfClass('Weld')

		if _LocalPlayer:DistanceFromCharacter(_VehicleSeat.Position) >= 150 then
			DeleteToyRE:FireServer(_G.LastBlobmanWasSeat)

			return
		end
		if v1366 and _Weld and _Weld.Part1 and not _Weld.Part1:IsDescendantOf(v1366) then
			local _Part18 = _Weld.Part1
			local v1371 = _Players

			SNOWshipPlayer(v1371:GetPlayerFromCharacter(_Part18.Parent))
		end
		if _ProximityPrompt and _VehicleSeat then
			for _ = 0, 15 do
				if u917() or not _G.LoopKick then
					break
				end

				fireproximityprompt(_ProximityPrompt)
				TeleportPlayer(_VehicleSeat.CFrame + Vector3.new(0, 3.5, 0), 1.5)
				task.wait(0.1)
			end
		end
	end
end

function CountRealNumberPlayersInLoop()
	local v1373, v1374, v1375 = pairs(u70)
	local v1376 = 0

	while true do
		local v1377

		v1375, v1377 = v1373(v1374, v1375)

		if v1375 == nil then
			break
		end
		if _Players:FindFirstChild(v1377) then
			v1376 = v1376 + 1
		end
	end

	return v1376
end
function IsThereAnyPlayersInLoopAlive()
	local v1378, v1379, v1380 = pairs(u70)
	local v1381 = false

	while true do
		local v1382

		v1380, v1382 = v1378(v1379, v1380)

		if v1380 == nil then
			break
		end
		if _Players:FindFirstChild(v1382) and v1382.Character then
			if v1382.Character:FindFirstChildOfClass('Humanoid') and 0 < v1382.Character.Humanoid.Health then
				v1381 = true
			end
		end
	end

	return v1381
end
function ResetCharacterStats()
	local v1383, v1384, v1385 = pairs(u70)

	while true do
		local v1386

		v1385, v1386 = v1383(v1384, v1385)

		if v1385 == nil then
			break
		end

		local v1387 = _Players:FindFirstChild(v1386)

		if v1387 and v1387.Character and v1387.Character:FindFirstChild('HumanoidRootPart') then
			local _HumanoidRootPart20 = v1387.Character.HumanoidRootPart

			v1387.Character:SetAttribute('Kick', 0)
			v1387.Character:SetAttribute('Kicking', nil)
			v1387.Character:SetAttribute('Kicking2', nil)

			if _HumanoidRootPart20:FindFirstChild('KickAuraVelocity') then
				_HumanoidRootPart20.KickAuraVelocity:Destroy()
			end
		end
	end
end
function verifyPlayerinBlobmanHand()
	local _Humanoid10 = _LocalPlayer.Character:FindFirstChildOfClass('Humanoid')

	if u917() then
		local _Attachment0 = _Humanoid10.SeatPart.Parent:WaitForChild('LeftDetector'):WaitForChild('LeftWeld').Attachment0
		local v1391 = _Attachment0 and _Attachment0.Parent and _Players:GetPlayerFromCharacter(_Attachment0.Parent.Parent)

		if v1391 then
			return v1391
		end
	end
end

local u1392 = nil

v1354:AddToggle({
	Name = 'Loop Kill',
	Default = false,
	Callback = function(p1393)
		_G.LoopKill = p1393

		if p1393 then
			while _G.LoopKill do
				u1392 = GetPlayerCFrame()

				local v1394, v1395, v1396 = pairs(u70)

				while true do
					local v1397

					v1396, v1397 = v1394(v1395, v1396)

					if v1396 == nil then
						break
					end

					local v1398 = _Players:FindFirstChild(v1397)

					if CheckPlayerForLoopKill(v1398) and ChangeActivityPriority(2) then
						local _HumanoidRootPart21 = v1398.Character:FindFirstChild('HumanoidRootPart')
						local _Head8 = v1398.Character:FindFirstChild('Head')
						local _Humanoid11 = v1398.Character:FindFirstChild('Humanoid')

						if v1398 and _HumanoidRootPart21 and _Head8 then
							for _ = 0, 50 do
								u406()
								SNOWship(_HumanoidRootPart21)

								if not (CheckPlayerForLoopKill(v1398) and _G.LoopKill) or (CheckNetworkOwnerShipOnPlayer(v1398) or 500 < _HumanoidRootPart21.AssemblyLinearVelocity.Magnitude) then
									_DestroyGrabLine:FireServer(_HumanoidRootPart21)
									CreateSkyVelocity(_HumanoidRootPart21)

									break
								end

								task.wait()

								if _HumanoidRootPart21.Position.Y <= -12 then
									TeleportPlayer(CFrame.new(_HumanoidRootPart21.Position + Vector3.new(0, 5, -15)), 2)
								else
									TeleportPlayer(CFrame.new(_HumanoidRootPart21.Position + Vector3.new(0, -10, -10)), 2)
								end

								_Humanoid11.BreakJointsOnDeath = false

								_Humanoid11:ChangeState(Enum.HumanoidStateType.Dead)

								_Humanoid11.Jump = true
								_Humanoid11.Sit = false
							end
						end

						ChangeActivityPriority(0)
					end
				end

				TeleportPlayer(u1392)
				task.wait(0.2)
			end

			u405()
			TeleportPlayer(u1392)
			print('End LoopKill')
		end
	end,
	Save = true,
	Flag = 'lk_toggle',
})

local v1402 = v655:AddSection({
	Name = 'Loop Kick (Ownership)',
})

loopkickownertoggle = v1402:AddToggle({
	Name = 'Loop Kick',
	Default = false,
	Callback = function(p1403)
		_G.LoopKickOwnership = p1403

		if p1403 then
			while _G.LoopKickOwnership do
				if GetKey() ~= 'Xana' then
					_G.LoopKickOwnership = false

					u33('Only for premium users! Buy premium in my discord server!')
					loopkickownertoggle:Set(false)
				end

				u1392 = GetPlayerCFrame()

				local v1404, v1405, v1406 = pairs(u70)

				while true do
					local v1407

					v1406, v1407 = v1404(v1405, v1406)

					if v1406 == nil then
						break
					end

					local v1408 = _Players:FindFirstChild(v1407)

					if CheckPlayerForLoopKill(v1408) and ChangeActivityPriority(2) then
						local _HumanoidRootPart22 = v1408.Character:FindFirstChild('HumanoidRootPart')
						local _Head9 = v1408.Character:FindFirstChild('Head')

						v1408.Character:FindFirstChild('Humanoid')

						if v1408 and _HumanoidRootPart22 and _Head9 then
							for _ = 0, 50 do
								u406()
								SNOWship(_HumanoidRootPart22)

								if not (CheckPlayerForLoopKill(v1408) and _G.LoopKickOwnership) or (CheckNetworkOwnerShipOnPlayer(v1408) or 500 < _HumanoidRootPart22.AssemblyLinearVelocity.Magnitude) then
									_DestroyGrabLine:FireServer(_HumanoidRootPart22)
									wait()
									CreateSkyVelocity(_HumanoidRootPart22)

									break
								end

								task.wait()

								if _HumanoidRootPart22.Position.Y <= -12 then
									TeleportPlayer(CFrame.new(_HumanoidRootPart22.Position + Vector3.new(0, 5, -15)), 2)
								else
									TeleportPlayer(CFrame.new(_HumanoidRootPart22.Position + Vector3.new(0, -10, -10)), 2)
								end
							end
						end

						ChangeActivityPriority(0)
					end
				end

				TeleportPlayer(u1392)
				task.wait(0.2)
			end

			u405()
			TeleportPlayer(u1392)
		end
	end,
	Save = true,
	Flag = 'lkickowner_toggle',
})

v1402:AddDropdown({
	Name = 'Kick Type',
	Default = 'Go to the heaven!',
	Options = {
		'Go to the heaven!',
	},
	Callback = function(p1411)
		_G.LoopKickOwnerType = p1411
	end,
	Save = true,
	Flag = 'loopkickownershiptype_dropdown',
})

loopRagdoll = v1354:AddToggle({
	Name = 'Loop Ragdoll',
	Default = false,
	Callback = function(p1412)
		_G.LoopRagdoll = p1412

		if p1412 then
			while _G.LoopRagdoll do
				if GetKey() ~= 'Xana' then
					loopRagdoll:Set(false)

					_G.LoopRagdoll = false

					u33('Only for premium users! Buy premium in my discord server!')

					break
				end

				local v1413, v1414, v1415 = pairs(u70)

				while true do
					local v1416

					v1415, v1416 = v1413(v1414, v1415)

					if v1415 == nil then
						break
					end

					local v1417 = _Players:FindFirstChild(v1416)

					if CheckPlayerAnnoyAll(v1417) then
						local _Character14 = v1417.Character
						local _HumanoidRootPart23 = v1417.Character:FindFirstChild('HumanoidRootPart')
						local _Ragdolled2 = _Character14:FindFirstChildOfClass('Humanoid'):FindFirstChild('Ragdolled')

						if _HumanoidRootPart23 and _Ragdolled2 and not _Ragdolled2.Value then
							u582(_HumanoidRootPart23)
							task.wait(0.015)
						end
					end
				end

				task.wait()
			end
		end
	end,
})
loopFire = v1354:AddToggle({
	Name = 'Loop Fire',
	Default = false,
	Callback = function(p1421)
		_G.LoopFire = p1421

		if p1421 then
			while _G.LoopFire do
				if GetKey() ~= 'Xana' then
					loopFire:Set(false)

					_G.LoopFire = false

					u33('Only for premium users! Buy premium in my discord server!')

					break
				end

				local v1422, v1423, v1424 = pairs(u70)

				while true do
					local v1425

					v1424, v1425 = v1422(v1423, v1424)

					if v1424 == nil then
						break
					end

					local v1426 = _Players:FindFirstChild(v1425)

					if CheckPlayerAnnoyAll(v1426) then
						local _ = v1426.Character
						local _HumanoidRootPart24 = v1426.Character:FindFirstChild('HumanoidRootPart')
						local v1428

						if _HumanoidRootPart24:FindFirstChild('FirePlayerPart') and _HumanoidRootPart24.FirePlayerPart:FindFirstChild('CanBurn') then
							v1428 = _HumanoidRootPart24.FirePlayerPart.CanBurn.Value
						else
							v1428 = nil
						end
						if _HumanoidRootPart24 and v1426 and not (IsPlayerInsideSafeZone(v1426) or v1428) then
							u613(_HumanoidRootPart24)
							task.wait(0.015)
						end
					end
				end

				task.wait()
			end
		end
	end,
})

local function u1443(p1429, p1430)
	local _Humanoid12 = _LocalPlayer.Character:FindFirstChildOfClass('Humanoid')

	if u917() then
		local _Parent10 = _Humanoid12.SeatPart.Parent
		local v1433 = _Players:FindFirstChild(p1429)

		if v1433 and v1433.Character and (v1433.Character:FindFirstChild('HumanoidRootPart') and _Parent10) and not u54(v1433) then
			local v1434 = {
				_Parent10.LeftDetector,
				v1433.Character.HumanoidRootPart,
				_Parent10.LeftDetector.LeftWeld,
			}
			local v1435 = {
				_Parent10.LeftDetector.LeftWeld,
				v1433.Character.HumanoidRootPart,
			}

			CreatureGrab = _Parent10.BlobmanSeatAndOwnerScript.CreatureGrab

			local _CreatureDrop = _Parent10.BlobmanSeatAndOwnerScript.CreatureDrop

			if _Parent10 then
				if p1430 == 1 then
					if _Parent10.Parent ~= u17 then
						u3:MakeNotification({
							Name = 'You need to be seated on Blobman',
							Content = 'The Blobman needs to be your own toy',
							Image = 'rbxassetid://4483345998',
							Time = 5,
						})
					else
						task.wait(0.2)
						DeleteToyRE:FireServer(_Parent10)
					end
				elseif p1430 == 2 then
					CreatureGrab:FireServer(unpack(v1434))
					task.wait(0.155)

					_Humanoid12.Sit = false
				elseif p1430 == 3 and not v1433.Character:GetAttribute('Kicking') and not v1433.Character:GetAttribute('Kicking2') then
					local v1437 = _Players:FindFirstChild(p1429)
					local _Character15 = v1437.Character
					local _HumanoidRootPart25 = _Character15.HumanoidRootPart
					local _ = _Character15.Head
					local _Humanoid13 = _Character15:FindFirstChildOfClass('Humanoid')
					local v1441 = nil

					_Character15:SetAttribute('Kicking', true)

					if _HumanoidRootPart25:FindFirstChild('FlingAuraVelocity') then
						_HumanoidRootPart25.FlingAuraVelocity:Destroy()
					end

					print('Kick')

					for _ = 0, 50 do
						if not u917() or CheckNetworkOwnerShipOnPlayer(v1437) then
							break
						end
						if verifyPlayerinBlobmanHand() == v1437 then
							_CreatureDrop:FireServer(unpack(v1435))

							break
						end

						CreatureGrab:FireServer(unpack(v1434))
						task.wait()
					end

					print('End Loop Here!')

					for _ = 0, 25 do
						if SNOWshipPlayer(v1437) then
							if not _HumanoidRootPart25:FindFirstChild('KickAuraVelocity') then
								v1441 = Instance.new('BodyVelocity', _HumanoidRootPart25)
								v1441.Name = 'KickAuraVelocity'
								v1441.MaxForce = Vector3.new(0, 12500, 0)
								v1441.Velocity = Vector3.new(0, 100, 0)
							end

							local v1442 = 0

							while u917() and v1442 < 100 do
								if _Humanoid13.FloorMaterial == Enum.Material.Air and _LocalPlayer:DistanceFromCharacter(_HumanoidRootPart25.Position) > 100 then
									_Character15:SetAttribute('Kicking2', true)
									_DestroyGrabLine:FireServer(_HumanoidRootPart25)
									CreatureGrab:FireServer(unpack(v1434))
									print('Destroyed!')

									break
								end

								SNOWshipPlayer(v1437)

								v1442 = v1442 + 1

								task.wait()
							end

							break
						end
						if not u917() then
							break
						end

						task.wait()
					end

					if v1441 then
						v1441:Destroy()
					end

					_Character15:SetAttribute('Kicking', nil)
				elseif not p1430 then
					CreatureGrab:FireServer(unpack(v1434))
				end
			end
		end
	else
		u3:MakeNotification({
			Name = 'You need to be seated on Blobman',
			Content = 'Please, sit on any Blobman',
			Image = 'rbxassetid://4483345998',
			Time = 5,
		})
	end
end

v1355:AddToggle({
	Name = 'Loop Kick (Blobman)',
	Default = false,
	Callback = function(p1444)
		if p1444 then
			_G.LoopKick = p1444

			while _G.LoopKick do
				local v1445, v1446, v1447 = pairs(u70)

				while true do
					local v1448

					v1447, v1448 = v1445(v1446, v1447)

					if v1447 == nil then
						break
					end
					if _Players:FindFirstChild(v1448) and ChangeActivityPriority(1.5) then
						if u917() then
							u1443(v1448, 3)
						else
							u1372()
						end

						ChangeActivityPriority(0)
					end
				end

				task.wait()
			end
		else
			_G.LoopKick = p1444
		end
	end,
	Save = true,
	Flag = 'lkick_toggle',
})

function blobmangraball()
	local v1449 = _Players
	local v1450, v1451, v1452 = pairs(v1449:GetPlayers())

	while true do
		local v1453

		v1452, v1453 = v1450(v1451, v1452)

		if v1452 == nil then
			break
		end
		if not u54(v1453) and v1453 ~= _LocalPlayer and v1453.Character and (v1453.Character:FindFirstChild('HumanoidRootPart') and not (u105(v1453.Name) and _G.WhitelistFriends2)) and (_LocalPlayer.Character and _LocalPlayer.Character:FindFirstChildOfClass('Humanoid')) then
			local _Parent11 = _LocalPlayer.Character:FindFirstChildOfClass('Humanoid').SeatPart.Parent
			local v1455 = {
				_Parent11:WaitForChild('LeftDetector'),
				v1453.Character:FindFirstChild('HumanoidRootPart'),
				_Parent11:WaitForChild('LeftDetector'):WaitForChild('LeftWeld'),
			}

			_Parent11:WaitForChild('BlobmanSeatAndOwnerScript'):WaitForChild('CreatureGrab'):FireServer(unpack(v1455))
		end

		task.wait()
	end
end

PlayerToSelect = LongReachGrab_Player:AddDropdown({
	Name = 'Select Player',
	Default = '',
	Options = {
		'',
	},
	Callback = function(p1456)
		local v1457 = string.split(p1456, ' ')

		_G.PlayerToLongGrab = v1457[1]
	end,
})

LongReachGrab_Player:AddButton({
	Name = 'Lock',
	Callback = function()
		u1443(_G.PlayerToLongGrab, 2)
	end,
})
LongReachGrab_Player:AddButton({
	Name = 'Bring',
	Callback = function()
		u1443(_G.PlayerToLongGrab)
	end,
})
LongReachGrab_Player:AddButton({
	Name = 'Kick',
	Callback = function()
		u1443(_G.PlayerToLongGrab, 3)
	end,
})

local v1458 = LongReachGrab_Player:AddSection({
	Name = 'Destroy Everything',
})
local u1459 = nil

u1459 = v1458:AddToggle({
	Name = 'Destroy Server',
	Default = false,
	Callback = function(p1460)
		if p1460 then
			_G.BringAllLongReach = true

			if GetKey() ~= 'Xana' and _InPlot.Value then
				u1459:Set(false)
				u33("You can't use destroy server inside a house!, buy premium to be able to do that!")

				return
			end
			if u917() then
				while _G.BringAllLongReach do
					if u917() then
						blobmangraball()
					else
						task.wait(1)
					end
				end
			else
				u1459:Set(false)
				u3:MakeNotification({
					Name = 'You need to be seated on Blobman',
					Content = 'Please, sit on any Blobman',
					Image = 'rbxassetid://4483345998',
					Time = 5,
				})
			end
		else
			_G.BringAllLongReach = false
		end
	end,
	Save = true,
	Flag = 'BringAllLongReach_toggle',
})
u1459 = v1458:AddToggle({
	Name = 'Whitelist Friends',
	Default = false,
	Callback = function(p1461)
		_G.WhitelistFriends2 = p1461
	end,
	Save = true,
	Flag = 'Whitelistfreinds2_toggle',
})
apagarfogo = _Workspace.Map.Hole.PoisonBigHole.ExtinguishPart
apagarfogo.Size = Vector3.new(0.5, 0.5, 0.5)
apagarfogo.Transparency = 1
apagarfogo.Tex.Transparency = 1

_Workspace.ChildAdded:Connect(function(p1462)
	if p1462.Name == 'GrabParts' then
		local _Part19 = p1462.GrabPart.WeldConstraint.Part1
		local u1464 = nil

		if _Part19 then
			if u54(_Part19.Parent) then
				return
			end
			if _G.InvisibleLine then
				_CreateGrabLine:FireServer()
			end
			if _G.SuperStrength then
				u1464 = Instance.new('BodyVelocity', _Part19)
				u1464.MaxForce = Vector3.new(0, 0, 0)
				u1464.Velocity = Vector3.new()
				u1464.Name = 'SuperStrength'
			end

			_G.HoldingObjectGrabPart = _Part19

			if _G.MasslessGrab then
				task.spawn(function()
					local _AlignOrientation = p1462.DragPart.AlignOrientation
					local _AlignPosition = p1462.DragPart.AlignPosition

					while _G.MasslessGrab do
						_AlignOrientation.MaxTorque = 1e46
						_AlignOrientation.Responsiveness = 20099
						_AlignPosition.MaxForce = 1e51
						_AlignPosition.Responsiveness = 20099

						task.wait(0.245)
					end

					_AlignOrientation.MaxTorque = 600000
					_AlignOrientation.Responsiveness = 30
					_AlignPosition.MaxForce = 60000
					_AlignPosition.Responsiveness = 40
				end)
			end
			if _G.NoclipGrab and not _Part19.Anchored then
				task.spawn(function()
					if _Part19.Parent and _Part19.Parent:IsA('Model') then
						local v1467 = _Part19.Parent:GetDescendants()
						local _Humanoid14 = _Part19.Parent:FindFirstChildOfClass('Humanoid')
						local v1469, v1470, v1471 = pairs(v1467)
						local v1472 = {}

						while true do
							local v1473

							v1471, v1473 = v1469(v1470, v1471)

							if v1471 == nil then
								break
							end
							if v1473:IsA('BasePart') or v1473:IsA('Part') or v1473:IsA('MeshPart') then
								v1472[v1473] = v1473.CanCollide
							end
						end
						while p1462.Parent do
							local v1474, v1475, v1476 = pairs(v1467)

							while true do
								local v1477

								v1476, v1477 = v1474(v1475, v1476)

								if v1476 == nil then
									break
								end
								if v1477:IsA('BasePart') or v1477:IsA('Part') or v1477:IsA('MeshPart') then
									v1477.CanCollide = false
								end
							end

							wait(0.214)
						end

						if _Humanoid14 then
							task.wait(0.5)
						end

						local v1478, v1479, v1480 = pairs(v1467)

						while true do
							local v1481

							v1480, v1481 = v1478(v1479, v1480)

							if v1480 == nil then
								break
							end
							if v1481:IsA('BasePart') or v1481:IsA('Part') or v1481:IsA('MeshPart') then
								v1481.CanCollide = v1472[v1481]
							end
						end
					end
				end)
			end
			if _G.PerspectiveGrab and not _Part19.Anchored then
				task.spawn(function()
					local v1482 = GetPlayerCharacter()

					_CreateGrabLine:FireServer()

					local u1483, u1484

					if v1482 then
						u1483 = v1482:FindFirstChildOfClass('Humanoid')
						u1484 = v1482:FindFirstChild('HumanoidRootPart')
					else
						u1483 = nil
						u1484 = nil
					end

					local _Part = Instance.new('Part', _Workspace)

					_Part.Anchored = true
					_Part.CanCollide = false
					_Part.Transparency = 1
					_Part.CanQuery = false
					_Part.Size = Vector3.new()
					_Part.CFrame = workspace.CurrentCamera.CFrame
					workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
					workspace.CurrentCamera.CameraSubject = _Part

					if u1147 then
						u1147:Disconnect()
					end
					if u1483 and u1484 then
						local v1486 = GetPlayerCFrame()

						u692(true)

						local u1487 = nil
						local u1488 = nil
						local u1489 = nil
						local u1490 = nil
						local u1491 = nil
						local u1492 = nil
						local u1493 = nil

						u1147 = _RunService.Heartbeat:Connect(function(p1494)
							u1487 = u1483.MoveDirection * (u1148 * p1494)
							u1488 = _Part.CFrame
							u1489 = workspace.CurrentCamera.CFrame
							u1490 = u1488:ToObjectSpace(u1489).Position
							u1489 = u1489 * CFrame.new(-u1490.X, -u1490.Y, -u1490.Z + 1)
							u1491 = u1489.Position
							u1492 = u1488.Position
							u1493 = CFrame.new(u1491, Vector3.new(u1492.X, u1491.Y, u1492.Z)):VectorToObjectSpace(u1487)
							_Part.CFrame = CFrame.new(u1492) * (u1489 - u1491) * CFrame.new(u1493)
							u1484.CFrame = CFrame.new(527, 123, -376)
						end)

						while p1462.Parent do
							task.wait()
						end

						local _CFrame = workspace.CurrentCamera.CFrame

						u692(false)

						workspace.CurrentCamera.CameraSubject = _LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
						workspace.CurrentCamera.CameraType = Enum.CameraType.Custom

						if u1147 then
							u1147:Disconnect()
						end
						if _G.PerspectiveTeleportToCameraPos then
							u1484.CFrame = _CFrame
						else
							u1484.CFrame = v1486
						end
					end
				end)
			end

			task.spawn(function()
				if u1464 then
					if not _LocalPlayer.PlayerGui:FindFirstChild('ContextActionGui') then
						return
					end

					local v1496 = nil
					local u1497 = nil
					local u1498 = nil

					while v1496 == nil and p1462.Parent do
						local v1499, v1500, v1501 = pairs(game.Players.LocalPlayer.PlayerGui.ContextActionGui:GetDescendants())

						while true do
							local v1502

							v1501, v1502 = v1499(v1500, v1501)

							if v1501 == nil then
								break
							end
							if v1502:IsA('ImageLabel') and v1502.Image == 'http://www.roblox.com/asset/?id=9603678090' then
								v1496 = v1502.Parent
							end
						end

						task.wait()
					end

					v1496.Active = true

					if v1496 then
						u1497 = v1496.MouseButton1Down:Connect(function()
							print('Launched Mobile!')

							pressedStrength = true
							u1464.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
							u1464.Velocity = workspace.CurrentCamera.CFrame.lookVector * _G.Strength
						end)
					end

					local _ = p1462:GetPropertyChangedSignal('Parent'):Connect(function()
						if not p1462.Parent then
							_Debris:AddItem(u1464, 1)

							if u1497 then
								u1497:Disconnect()
							end

							u1498:Disconnect()
						end
					end)
				end
			end)
			task.spawn(function()
				if u1464 then
					local u1503 = nil

					u1503 = p1462:GetPropertyChangedSignal('Parent'):Connect(function()
						if not p1462.Parent then
							if _UserInputService:GetLastInputType() ~= Enum.UserInputType.MouseButton2 or not _G.SuperStrength then
								if _UserInputService:GetLastInputType() == Enum.UserInputType.MouseButton1 then
									u1464:Destroy()
								end
							else
								print('Launched!')

								pressedStrength = true
								u1464.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								u1464.Velocity = workspace.CurrentCamera.CFrame.lookVector * _G.Strength

								_Debris:AddItem(u1464, 1)
							end

							u1503:Disconnect()
						end
					end)
				end
			end)

			if _G.Poison_Grab then
				task.spawn(function()
					if _Part19.Parent:FindFirstChildOfClass('Humanoid') then
						local _Head10 = _Part19.Parent.Head

						while p1462.Parent and _G.Poison_Grab do
							_PoisonHurtPart.CFrame = _Head10.CFrame
							_PoisonHurtPart2.CFrame = _Head10.CFrame
							_PoisonHurtPart3.CFrame = _Head10.CFrame

							task.wait()

							_PoisonHurtPart3.Position = Vector3.new(0, -50, 0)
							_PoisonHurtPart2.Position = Vector3.new(0, -50, 0)
							_PoisonHurtPart.Position = Vector3.new(0, -50, 0)
						end
					end
				end)
			end
			if _G.Burn_Grab then
				task.spawn(function()
					while p1462.Parent and _G.Burn_Grab do
						if _Part19.Parent:FindFirstChildOfClass('Humanoid') then
							u613(_Part19.Parent.HumanoidRootPart)
						elseif _Part19.Parent:FindFirstChild('FireDetector') then
							u613(_Part19.Parent.FireDetector)
						else
							u613(_Part19)
						end

						task.wait()
					end
				end)
			end
			if _G.Radiactive_Grab then
				task.spawn(function()
					if _Part19.Parent:FindFirstChildOfClass('Humanoid') then
						while p1462.Parent and _G.Radiactive_Grab do
							_OuterUFO.Position = _Part19.Position

							task.wait()
						end

						_OuterUFO.Position = Vector3.new(0, -50, 0)
					end
				end)
			end
			if _G.Death_Grab then
				task.spawn(function()
					if _Part19.Parent:FindFirstChildOfClass('Humanoid') then
						local _Humanoid15 = _Part19.Parent:FindFirstChildOfClass('Humanoid')
						local _ = _Part19.Parent.HumanoidRootPart

						while _Part19.Parent do
							local v1506 = _Players

							if CheckNetworkOwnerShipOnPlayer(v1506:GetPlayerFromCharacter(_Part19.Parent)) then
								_Humanoid15.BreakJointsOnDeath = false

								_Humanoid15:ChangeState(Enum.HumanoidStateType.Dead)

								_Humanoid15.Jump = true
								_Humanoid15.Sit = false

								if _Humanoid15:GetStateEnabled(Enum.HumanoidStateType.Dead) then
									_DestroyGrabLine:FireServer(_Part19)
								end
							end

							task.wait()
						end
					end
				end)
			end
		end
	end
end)
workspace.DescendantAdded:Connect(function(p1507)
	if p1507.Name == 'PartOwner' and p1507.Parent.Name == 'Head' then
		local _HumanoidRootPart26 = p1507.Parent.Parent:FindFirstChild('HumanoidRootPart')

		if _HumanoidRootPart26:FindFirstChild('KickAuraP') then
			_HumanoidRootPart26.KickAuraP:Destroy()
		end
		if _HumanoidRootPart26:FindFirstChild('KickAuraP1') then
			_HumanoidRootPart26.KickAuraP1:Destroy()
		end
		if _HumanoidRootPart26:FindFirstChild('SkyVelocity') then
			_HumanoidRootPart26.SkyVelocity:Destroy()
		end
		if _HumanoidRootPart26:FindFirstChild('BringBody') then
			_HumanoidRootPart26.BringBody:Destroy()
		end
	end
	if p1507.Name == 'TimeRemainingNum' and p1507.Parent.Value == _LocalPlayer.Name then
		_G.RemainingTimeInHouse = p1507
	end
end)
_IsHeld.Changed:Connect(function(p1509)
	if p1509 == true and (not u54(_Players:FindFirstChild(u28)) and _G.AntiGrab) then
		local _HumanoidRootPart27 = (_LocalPlayer.Character or _LocalPlayer.CharacterAdded:Wait()):WaitForChild('HumanoidRootPart')

		if _IsHeld.Value then
			local u1511 = nil

			u1511 = _RunService.Heartbeat:Connect(function()
				if _IsHeld.Value then
					_HumanoidRootPart27.Velocity = Vector3.new()
					_HumanoidRootPart27.Anchored = true

					_Struggle:FireServer(_LocalPlayer)
					_RagdollRemote:FireServer(_HumanoidRootPart27, 0)
				else
					_HumanoidRootPart27.Velocity = Vector3.new()
					_HumanoidRootPart27.Anchored = false

					u1511:Disconnect()
				end
			end)
		end
	end
end)

function IsReallyBeingHeld()
	if _IsHeld.Value and not _G.AntiGrab then
		return true
	end
	if _IsHeld.Value and u54(_Players:FindFirstChild(u28)) then
		return true
	end
end
function setMasslessFalse(p1512)
	local v1513, v1514, v1515 = ipairs(p1512:GetDescendants())

	while true do
		local v1516

		v1515, v1516 = v1513(v1514, v1515)

		if v1515 == nil then
			break
		end
		if v1516:IsA('BasePart') then
			v1516.Massless = false
		end
	end
end
function enforceMasslessFalse(p1517)
	p1517.DescendantAdded:Connect(function(p1518)
		if p1518:IsA('BasePart') then
			p1518:GetPropertyChangedSignal('Massless'):Connect(function()
				if p1518.Massless then
					p1518.Massless = false
				end
			end)
		end
	end)

	local v1519, v1520, v1521 = ipairs(p1517:GetDescendants())

	while true do
		local u1522

		v1521, u1522 = v1519(v1520, v1521)

		if v1521 == nil then
			break
		end
		if u1522:IsA('BasePart') then
			u1522:GetPropertyChangedSignal('Massless'):Connect(function()
				if u1522.Massless then
					u1522.Massless = false
				end
			end)
		end
	end
end
local function reconnect()
	local v1523 = _LocalPlayer.Character or _LocalPlayer.CharacterAdded:Wait()
	local u1524 = v1523:FindFirstChildWhichIsA('Humanoid') or v1523:WaitForChild('Humanoid')
	local _HumanoidRootPart28 = v1523:WaitForChild('HumanoidRootPart')

	v1523:WaitForChild('Head')

	CharacterRaycastFilter.FilterDescendantsInstances[1] = v1523
	COAroundPParams.FilterDescendantsInstances[1] = v1523
	_G.UniversalPlayerRoot = _HumanoidRootPart28
	scriptToGetSenv = v1523:WaitForChild('GrabbingScript')

	if scriptToGetSenv and getsenv then
		senv = getsenv(scriptToGetSenv)
	end

	local _CanBurn = _HumanoidRootPart28:WaitForChild('FirePlayerPart'):WaitForChild('CanBurn')
	local _Ragdolled3 = u1524:WaitForChild('Ragdolled')

	if true then
		local u1528 = _HumanoidRootPart28 and _HumanoidRootPart28:FindFirstChild('RootAttachment')

		if u1528 then
			task.delay(1, function()
				u1528:Destroy()
			end)
		end

		setMasslessFalse(v1523)
		enforceMasslessFalse(v1523)
	end

	local _BodyPosition10 = Instance.new('BodyPosition', _HumanoidRootPart28)

	_BodyPosition10.MaxForce = Vector3.new(0, 0, 0)
	u1524.JumpPower = _G.InfiniteJumpPower

	if _G.NoclipToggle then
		u406()
	end

	v1523.DescendantAdded:Connect(function(p1530)
		if p1530.Name == 'PartOwner' then
			u28 = tostring(p1530.Value)

			if _G.AutoAttacker then
				local u1531 = _Players:FindFirstChild(u28)
				local u1532 = nil
				local u1533 = nil

				if u1531 and u1531.Character then
					local _Character16 = u1531.Character

					if _Character16 then
						u1532 = _Character16:FindFirstChildOfClass('Humanoid')
						u1533 = _Character16:FindFirstChild('HumanoidRootPart')
					end
				end
				if u1531 and u54(u1531) == false and u1531 ~= _LocalPlayer then
					local v1535 = nil
					local u1536 = nil
					local v1537 = false
					local v1538

					if _G.CounterMode == 'Repulsion' or not _G.CounterMode then
						v1538 = function()
							u1536 = lookAt(_LocalPlayer.Character.HumanoidRootPart.Position, u1533.Position)

							local _BodyVelocity8 = Instance.new('BodyVelocity', u1531.Character.HumanoidRootPart)

							_BodyVelocity8.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
							_BodyVelocity8.Velocity = Vector3.new(u1536.lookVector.X, 0.5, u1536.lookVector.Z) * 100

							wait()
							_BodyVelocity8:Destroy()
							_DestroyGrabLine:FireServer(u1533)
						end
					elseif _G.CounterMode ~= 'Freeze' then
						if _G.CounterMode ~= 'Kick' then
							v1538 = _G.CounterMode == 'Death' and function()
								local v1540 = u1532

								if v1540 then
									CreateSkyVelocity(u1533)

									for _ = 0, 20 do
										v1540.BreakJointsOnDeath = false

										v1540:ChangeState(Enum.HumanoidStateType.Dead)

										v1540.Jump = true
										v1540.Sit = true
									end

									task.wait()
									_DestroyGrabLine:FireServer(u1533)
								end
							end or v1535
						else
							v1538 = function()
								CreateSkyVelocity(u1533)
								wait(1)
								_DestroyGrabLine:FireServer(u1533)
							end
						end
					else
						v1538 = function()
							local v1541 = u1532

							if v1541 then
								v1541.WalkSpeed = 0
								v1541.Sit = false
								v1541.JumpPower = 0
							end
						end
					end
					if v1537 then
						for _ = 1, 50 do
							SNOWshipPermanentPlayer(u1531, v1538)
							task.wait()
						end
					else
						for _ = 1, 50 do
							if SNOWshipPlayer(u1531, v1538) then
								break
							end

							task.wait()
						end
					end
				end
			end
		end
	end)
	_CanBurn.Changed:Connect(function(p1542)
		if p1542 and _G.AntiBurn then
			while _CanBurn.Value do
				if firetouchinterest then
					firetouchinterest(_HumanoidRootPart28.FirePlayerPart, apagarfogo, 0)
					task.wait()
					firetouchinterest(_HumanoidRootPart28.FirePlayerPart, apagarfogo, 1)
				else
					apagarfogo.CFrame = _HumanoidRootPart28.FirePlayerPart.CFrame * CFrame.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))

					task.wait()

					apagarfogo.Position = Vector3.new(0, -100, 0)
				end
			end
		end
	end)
	_Ragdolled3.Changed:Connect(function(p1543)
		if p1543 and _G.AntiExplosion then
			while _Ragdolled3.Value do
				if IsReallyBeingHeld() then
					_HumanoidRootPart28.Anchored = false
				else
					_HumanoidRootPart28.Anchored = true
					_HumanoidRootPart28.Velocity = Vector3.new()
				end

				task.wait()
			end

			_HumanoidRootPart28.Velocity = Vector3.new()
			_HumanoidRootPart28.Anchored = false
		end
	end)
	u1524.Changed:Connect(function(p1544)
		if p1544 == 'Sit' and u1524.Sit == true then
			if u1524.SeatPart == nil or tostring(u1524.SeatPart.Parent) ~= 'CreatureBlobman' then
				if u1524.SeatPart == nil and _G.AntiGrab then
					u1524:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)

					u1524.Sit = false
				end
			elseif _G.RockBlobman then
				_BodyPosition10.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				_BodyPosition10.Position = _HumanoidRootPart28.Position
			end
		end
		if p1544 == 'SeatPart' and u1524.SeatPart == nil then
			ResetCharacterStats()

			if _HumanoidRootPart28:FindFirstChild('BodyPositionFloat') then
				_HumanoidRootPart28.BodyPositionFloat:Destroy()
			end

			_BodyPosition10.MaxForce = Vector3.new(0, 0, 0)
		end
		if p1544 == 'MoveDirection' and _G.RockBlobman and u917() then
			_BodyPosition10.Position = _HumanoidRootPart28.Position

			if u1524.MoveDirection.Magnitude <= 0 then
				_BodyPosition10.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			else
				_BodyPosition10.MaxForce = Vector3.new(0, 0, 0)
			end
		end
	end)

	local v1545 = u1524 and u1524:WaitForChild('Animator', 1)

	if v1545 then
		TypeAnimation = v1545:LoadAnimation(typeAnimation)
		FlailAnimation = v1545:LoadAnimation(flailAnimation)
	end
end

_UserInputService.JumpRequest:Connect(function()
	if _G.InfiniteJump then
		_LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState('Jumping')
	end
end)
_RunService.Heartbeat:Connect(function()
	if _G.SuperSpeed then
		_LocalPlayer.Character.HumanoidRootPart.CFrame = _LocalPlayer.Character.HumanoidRootPart.CFrame + _LocalPlayer.Character:FindFirstChildOfClass('Humanoid').MoveDirection * Multiplier
	end
end)

function CanRemoveStickyPart(_, p1546, _)
	return p1546:GetAttribute('Kicking2') and true or nil
end

task.spawn(function()
	while task.wait() do
		local v1547 = _Players
		local v1548, v1549, v1550 = pairs(v1547:GetPlayers())

		while true do
			local v1551

			v1550, v1551 = v1548(v1549, v1550)

			if v1550 == nil then
				break
			end
			if CheckPlayer(v1551) then
				local _Character17 = v1551.Character
				local _HumanoidRootPart29 = v1551.Character:FindFirstChild('HumanoidRootPart')

				if v1551 and _Character17 and (_HumanoidRootPart29 and CanRemoveStickyPart(v1551, _Character17, _HumanoidRootPart29)) then
					u522(_HumanoidRootPart29)
				end
			end
		end
	end
end)

function PlayerRemoving_Added(_)
	u69(PlayerToSelect)
	u69(u1357)
	u69(u1339)
	u69(PlayerToTeleport)
	u87(RotationAuraList)
	u87(PlayerToTarget)
end

local _ = PlayerRemoving_Added

_Players.PlayerAdded:Connect(PlayerRemoving_Added)
_Players.PlayerRemoving:Connect(PlayerRemoving_Added)
task.spawn(PlayerRemoving_Added)
task.spawn(reconnect)
_Players.PlayerAdded:Connect(function(p1554)
	local v1555, v1556 = pcall(function()
		return p1554:IsFriendsWith(_LocalPlayer.UserId)
	end)

	if v1555 then
		if v1556 and not u105(p1554.Name) then
			table.insert(u404, p1554.Name)
		end

		u79(u1340, u404)
	end
end)
task.spawn(function()
	local v1557 = _Players
	local v1558, v1559, v1560 = pairs(v1557:GetPlayers())

	while true do
		local v1561

		v1560, v1561 = v1558(v1559, v1560)

		if v1560 == nil then
			break
		end
		if v1561:IsFriendsWith(_LocalPlayer.UserId) then
			table.insert(u404, v1561.Name)
		end
	end

	u79(u1340, u404)
end)
_LocalPlayer.CharacterAdded:Connect(reconnect)
u3:Init()