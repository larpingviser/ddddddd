local genv, version, Library, ThemeManager, SaveManager

do
	local str = "https://raw.githubusercontent.com/uhfork/Obsidian/refs/heads/main/"
	genv = getgenv and getgenv() or _G
	genv.__PoopHubShared = genv.__PoopHubShared or {}
	local poopHubShared = genv.__PoopHubShared
	version = "Unknown"

	pcall(function()
		version = "V5.1.5"
	end)

	getShared = function(arg, arg2)
		if not poopHubShared[arg] then
			poopHubShared[arg] = arg2()
		end

		return poopHubShared[arg]
	end

	Library = getShared("Library", function()
		return loadstring(game:HttpGet("https://doitenroi.win/paste/0fggDBfu/raw"))()
	end)

	ThemeManager = getShared("ThemeManager", function()
		return loadstring(game:HttpGet("https://doitenroi.win/paste/M6JGuRBu/raw"))()
	end)

	SaveManager = getShared("SaveManager", function()
		return loadstring(game:HttpGet("https://doitenroi.win/paste/FOrFG4oS/raw"))()
	end)
end

genv.Library = Library
genv.ThemeManager = ThemeManager
genv.SaveManager = SaveManager
local getCustomIcon = Library.GetCustomIcon

Library.GetCustomIcon = function(arg, arg2)
	if typeof(arg2) == "string" and string.find(arg2, "rbxasset://") then
		return { Url = arg2, ImageRectOffset = Vector2.zero, ImageRectSize = Vector2.zero, Custom = true }
	end
	return getCustomIcon(arg, arg2)
end

genv.Services = getShared("Services", function()
	return {
		Players = game:GetService("Players"),
		ReplicatedStorage = game:GetService("ReplicatedStorage"),
		RunService = game:GetService("RunService"),
		Workspace = game:GetService("Workspace"),
		UserInputService = game:GetService("UserInputService"),
		TweenService = game:GetService("TweenService"),
	}
end)

local options
options = Library.Options
local toggles
toggles = Library.Toggles
local tbl

tbl = {
	Zaako = "rbxassetid://79347646107717",
	Poop = "rbxassetid://130990339683290",
	Rust = "rbxassetid://138750331387064",
	["Hit Marker"] = "rbxassetid://133749572213659",
	Neverlose = "rbxassetid://94970221280272",
	Onichan = "rbxassetid://114361503583259",
	WTF = "rbxassetid://136585577123891",
	["Ahh~"] = "rbxassetid://140095282951107",
	Minecraft = "rbxassetid://135478009117226",
	Mambo = "rbxassetid://124373733066783",
	["I got this"] = "rbxassetid://140084776912218",
	["Villager Died"] = "rbxassetid://3267691010",
	["Minecraft 2"] = "rbxassetid://5176930264",
}

local notify_ = Library.Notify

Library.Notify = function(arg, arg2, arg3)
	if Library.Options and Library.Options.NotificationSoundOn and Library.Options.NotificationSoundOn.Value then
		local soundId = Library.Options.NotificationSoundSelect and Library.Options.NotificationSoundSelect.Value
		soundId = soundId and tbl[soundId]

		if soundId then
			pcall(function()
				local sound = Instance.new("Sound")
				sound.SoundId = soundId
				sound.Volume = 1
				sound.Parent = game:GetService("SoundService")
				sound:Play()

				sound.Ended:Connect(function()
					sound:Destroy()
				end)
			end)
		end
	end

	return notify_(arg, arg2, arg3)
end

_G._NOTIFY = function(arg, arg2)
	if type(arg) == "table" then
		if not arg.BigIcon then
			arg.BigIcon = AdImage
		end
	else
		local str = tostring(arg)
		local pos = str:find(":")
		local flag = pos and not str:find("https?://")
		local str2 = "PoopHub"

		if flag then
			str2 = str:sub(1, pos - 1)
			str = str:sub(pos + 1):gsub("^%s+", "")
		end

		arg = { Title = str2, Description = str, BigIcon = AdImage, Time = type(arg2) == "number" and arg2 or 4 }
	end

	Library:Notify(arg)
end

genv._NOTIFY = _G._NOTIFY
local players, replicatedStorage, runService, workspace_, userInputService
local services = genv.Services
players = services.Players
replicatedStorage = services.ReplicatedStorage
runService = services.RunService
workspace_ = services.Workspace
userInputService = services.UserInputService
local localPlayer
localPlayer = players.LocalPlayer
local spawnToyRemoteFunction
spawnToyRemoteFunction = replicatedStorage:WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction")
local ragdollRemote
ragdollRemote = replicatedStorage:WaitForChild("CharacterEvents"):WaitForChild("RagdollRemote")
local v
v = workspace_:WaitForChild(localPlayer.Name .. "SpawnedInToys")
local setNetworkOwner
setNetworkOwner = replicatedStorage:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
replicatedStorage:WaitForChild("MenuToys"):WaitForChild("DestroyToy")
replicatedStorage:WaitForChild("GameCorrectionEvents"):WaitForChild("StopAllVelocity")
replicatedStorage:WaitForChild("CharacterEvents"):WaitForChild("Struggle")
replicatedStorage:WaitForChild("GrabEvents", 9e9):WaitForChild("CreateGrabLine", 9e9)
local look
look = replicatedStorage.CharacterEvents.Look

safeGetRagdollRemote = function()
	local ok, result = pcall(function()
		return replicatedStorage:WaitForChild("CharacterEvents", 1):WaitForChild("RagdollRemote", 1)
	end)

	return ok and result or nil
end

local v2
v2 = safeGetRagdollRemote()
local playerGui

do
	local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local humanoid_ = character:WaitForChild("Humanoid")
	playerGui = localPlayer:WaitForChild("PlayerGui")

	localPlayer.CharacterAdded:Connect(function(character2)
		character = character2
		humanoidRootPart = character2:WaitForChild("HumanoidRootPart")
		humanoid_ = character2:WaitForChild("Humanoid")
	end)
end

local tbl2

tbl2 = {
	skyTpEnabled = false,
	kickSpam = false,
	rebuildActive = false,
	wasdControlEnabled = false,
	wasdMoveSpeed = 1,
	torseFreezeEnabled = false,
	hvhTrackEnabled = false,
	hvhTargetPlayer = nil,
	blobmanAuraEnabled = false,
	blobmanAuraMode = "Kill Aura",
	blobmanAllEnabled = false,
	blobmanAllMode = "All Kill",
	blobmanAuraRunning = false,
	blobmanAllRunning = false,
	whitelistEnabled = false,
	targetWalkSpeed = 16,
	targetJumpPower = 50,
	targetKillEnabled = false,
	targetKillRunning = false,
	selectedTargetPlayer = nil,
	lastTargetPosition = nil,
	antiAntiLagEnabled = false,
	characterWalkSpeedEnabled = false,
	characterWalkSpeed = 1,
	characterJumpPowerEnabled = false,
	characterJumpPower = 50,
	characterInfJumpEnabled = false,
	characterFOV = 70,
	characterSpinEnabled = false,
	characterSpinSpeed = 5,
	characterSpinAngle = 0,
	thirdPersonEnabled = false,
	headEnabled = false,
	legsEnabled = false,
	obeyPartEnabled = false,
	obeyAllEnabled = false,
	feetTPDeleteEnabled = false,
	headViewEnabled = false,
	radius = 20,
	speed = 3,
	height = 3,
	lerpAlpha = 0.25,
	obeyRightDistance = 5,
	selectedPlayerName = nil,
	selectedPart = "Head",
	ragdollRunning = false,
	autoRunEnabled = false,
	targetToyName = "CreatureBlobman",
	currentInstance = nil,
	activeConnection = nil,
	originalPos = nil,
	WingsActive = false,
	SelectedItem = "TetracubeI",
	SearchMode = "My Toys",
	WingSpeed = 2,
	WingAngle = 30,
	WingLength = 5,
	TimeCounter = 0,
	autoSitEnabled = false,
	selectedPlayerFolderId = nil,
	antiblob = false,
	antigraba = false,
	antiLag1 = false,
	protectionEnabled = false,
	infjump = false,
	danceEnabled = false,
	selectedDance = "Take The L",
	danceIntensity = 1,
	playerLocationVisualEnabled = false,
	oceanRainbowEnabled = false,
	shurikenESPEnabled = false,
	rainbowSpeedESP = 2,
	hvhBlobSitLoopEnabled = false,
	verticalMoveAmount = 0,
	loopKickBlobActive = false,
	loopKickBlobTarget = nil,
	loopKickBlobAllActive = false,
	loopKickBlobMode = "Default",
	notificationSoundEnabled = false,
	selectedNotificationSound = "Ahh~",
	locationESPCornerEnabled = true,
	locationESPThickness = 2,
	locationESPCornerRoundness = 0,
	locationESPLength = 12,
	locationESPRotationSpeed = 90,
	locationESPExpandSpeed = 3,
	locationESPMinRadius = 15,
	locationESPMaxRadius = 35,
	locationESPSmoothingEnabled = true,
	locationESPSmoothingSpeed = 15,
	locationESPColor = Color3.fromRGB(160, 0, 255),
	locationESPGradientEnabled = false,
	locationESPGradientColor1 = Color3.fromRGB(160, 0, 255),
	locationESPGradientColor2 = Color3.fromRGB(0, 230, 255),
	locationESPGradientSpeed = 1,
	locationESPUIGradientAngle = 0,
	locationESPUIGradientAutoRotate = false,
	locationESPUIGradientAutoSpeed = 20,
	locationESPPartEnabled = false,
	locationESPPartTransparency = 0.7,
	locationESPPartMaterial = "Neon",
	locationESPPartColor = Color3.fromRGB(160, 0, 255),
	locationESPBoxOutlineEnabled = false,
	locationESPBoxOutlineColor = Color3.fromRGB(255, 255, 255),
	locationESPBoxOutlineThickness = 0.05,
	locationESPCornerOutlineEnabled = false,
	locationESPCornerOutlineColor = Color3.fromRGB(0, 0, 0),
	locationESPCornerOutlineThickness = 1,
	locationESPGlowEnabled = false,
	locationESPGlowColor1 = Color3.fromRGB(160, 0, 255),
	locationESPGlowColor2 = Color3.fromRGB(0, 230, 255),
	locationESPGlowTransparency = 0.5,
	locationESPGlowSize = 20,
	locationESPTrailEnabled = false,
	locationESPTrailColor = Color3.fromRGB(160, 0, 255),
	locationESPTrailLifetime = 0.5,
	kickTargetPlayerDisplay = "All Players",
	kickTargetMethod = "Blobman Kick V2",
	kickTargetHeightMode = "Spawn",
	kickExcludeFriends = true,
	kickUseWhitelist = true,
	noksEspEnabled = false,
	noksBoxEnable = false,
	noksBoxColor1 = Color3.fromRGB(180, 140, 255),
	noksBoxColor2 = Color3.fromRGB(100, 50, 200),
	noksBoxGradient = false,
	noksBoxOutline = false,
	noksBoxOutlineColor1 = Color3.fromRGB(10, 10, 10),
	noksBoxOutlineColor2 = Color3.fromRGB(40, 40, 40),
	noksBoxOutlineGradient = false,
	noksBoxStrokeThickness = 1.5,
	noksBoxStrokeTrans = 30,
	noksBoxCornerRadius = 4,
	noksMaxBoxHeight = 350,
	noksNameEnable = false,
	noksNameColor = Color3.fromRGB(255, 255, 255),
	noksNameGradient = false,
	noksTextGradColor1 = Color3.fromRGB(255, 110, 110),
	noksTextGradColor2 = Color3.fromRGB(255, 230, 110),
	noksNameScrollSpeed = 4,
	noksTextFont = "GothamBold",
	noksTextSize = 11,
	noksTextStrokeThickness = 1,
	noksTextStrokeTrans = 30,
	noksLineEnable = false,
	noksLineColor1 = Color3.fromRGB(0, 230, 255),
	noksLineColor2 = Color3.fromRGB(255, 0, 150),
	noksLineGradient = false,
	noksLineThickness = 2,
	noksLineOutline = false,
	noksLineOutlineColor = Color3.fromRGB(0, 0, 0),
	noksLineStrokeThickness = 1,
	noksLineOrigin = "Bottom",
	noksLineAttachment = "Bottom",
	noksHealthBarEnable = false,
	noksHealthBarWidth = 3,
	noksHealthBarOffset = 6,
	noksHealthTextEnable = false,
	noksHealthGradient = false,
	noksHealthGrad1 = Color3.fromRGB(50, 255, 100),
	noksHealthGrad2 = Color3.fromRGB(255, 220, 50),
	noksHealthGrad3 = Color3.fromRGB(255, 50, 50),
	noksDistanceEnable = false,
	noksDistanceColor = Color3.fromRGB(240, 240, 240),
	noksMaxDistance = 2000,
	noksFlagsEnable = false,
	noksFlagSpacing = 2,
	noksFlagTextSize = 9,
	noksFlagNameEnable = true,
	noksFlagNameColor = Color3.fromRGB(220, 220, 220),
	noksFlagWeaponEnable = true,
	noksFlagWeaponColor = Color3.fromRGB(200, 200, 200),
	noksFlagStateEnable = true,
	noksFlagStateColor = Color3.fromRGB(255, 150, 50),
	noksFlagTeamEnable = false,
	noksBoxFill = false,
	noksGradientFill = false,
	noksGradientColor1 = Color3.fromRGB(140, 90, 255),
	noksGradientColor2 = Color3.fromRGB(0, 230, 255),
	noksBoxFillOpacity1 = 25,
	noksBoxFillOpacity2 = 5,
	noksGradientRotate = false,
	noksRotateSpeed = 3,
	noksSkeletonEnable = false,
	noksSkeletonThickness = 2,
	noksSkeletonGradient = false,
	noksSkeletonColor1 = Color3.fromRGB(180, 140, 255),
	noksSkeletonColor2 = Color3.fromRGB(0, 230, 255),
	noksSkeletonScroll = false,
	noksSkeletonScrollSpeed = 4,
	noksChamsEnable = false,
	noksChamsFillColor = Color3.fromRGB(140, 90, 255),
	noksChamsOutlineColor = Color3.fromRGB(255, 255, 255),
	noksChamsFillTransparency = 50,
	noksChamsOutlineTransparency = 0,
	noksChamsOcclusion = "Always See",
	lc_cc_on = false,
	lc_cc_tint = Color3.fromRGB(255, 255, 255),
	lc_cc_sat = 0,
	lc_cc_con = 0,
	lc_cc_bri = 0,
	lc_bloom_on = false,
	lc_bloom_int = 50,
	lc_bloom_size = 24,
	lc_bloom_thresh = 90,
	lc_sun_on = false,
	lc_sun_int = 10,
	lc_sun_spread = 50,
	lc_dof_on = false,
	lc_dof_far = 0,
	lc_dof_near = 100,
	lc_dof_dist = 50,
	lc_dof_rad = 10,
	lc_blur_on = false,
	lc_blur_size = 0,
	noksFadeOutEnable = false,
	noksFadeDuration = 1.2,
	haloEnabled = false,
	haloColor = Color3.fromRGB(133, 220, 255),
	haloRate = 7,
	haloBrightness = 2,
	haloOffsetY = 1.5,
	haloOffsetX = 0,
	haloOffsetZ = 0,
	haloAttOffsetY = 0.93,
	auraEnabled = false,
	auraColor = Color3.fromRGB(133, 220, 255),
	auraRate = 20,
	auraBrightness = 2,
	auraOffsetY = 0,
	auraOffsetX = 0,
	auraOffsetZ = 0,
	angelEnabled = false,
	angelColor = Color3.fromRGB(133, 220, 255),
	angelRate = 4,
	angelBrightness = 1,
	angelOffsetY = 0,
	angelOffsetX = 0,
	angelWingSpread = 1,
	trailEnabled = false,
	trailColor = Color3.fromRGB(133, 220, 255),
	trailWidth = 1.5,
	trailLifetime = 0.4,
	rainbowEnabled = false,
	rainbowSpeed = 0.5,
	rainbowHalo = true,
	rainbowAura = true,
	rainbowAngel = true,
	rainbowTrail = true,
	mcTexturesEnabled = false,
	mcTileSize = 4,
	mcTexturesDebug = false,
	mcFontEnabled = false,
	mcFontAutoApply = false,
	mcFontDebug = false,
	customBlackholeEnabled = false,
	customBlackholeImage = "https://github.com/public-account-7/somebackup/blob/main/Ultimate%20Rainbow%20Poop.png?raw=true",
	kickAuraEnabled = false,
	kickAuraRange = 30,
	kickAuraCooldown = 0.8,
	kickAuraFriendWhitelist = false,
	lineColor1 = Color3.fromRGB(255, 0, 0),
	lineColor2 = Color3.fromRGB(0, 0, 255),
	lineColor3 = Color3.fromRGB(0, 255, 0),
	lineColor4 = Color3.fromRGB(255, 255, 0),
	lineColor5 = Color3.fromRGB(255, 0, 255),
	lineColor6 = Color3.fromRGB(0, 255, 255),
	IncreaseLineExtend = 3,
}

local tbl3

tbl3 = {
	Wings = {},
	connections = {},
	visualConnections = {},
	rainbowParts = {},
	espObjects = {},
	rainbowHue = 0,
	whitelistedPlayers = {},
	targetItems = {},
	antiExplosionConnection = nil,
	characterAddedConn = nil,
	kickAuraBlobman = nil,
	kickAuraCooldowns = {},
	forceDisabledPlayers = {},
	kickAuraConnection = nil,
	forceDisabledConnection = nil,
}

local tbl4

tbl4 = {
	ANTI_DURATION = 0.5,
	SPAWN_POS = Vector3.new(0, 1e15, 0),
	partsPosition = Vector3.new(1, -6, 1),
	tpExitPosition = Vector3.one,
	randomPositions = {
		Vector3.new(282, -4.5, 470),
		Vector3.new(570, 124, -93),
		Vector3.new(530, 96, -376),
		Vector3.new(-500, -6, -155),
		Vector3.new(-560, -6, 86),
	},
	Offsets = { CFrame.new(-4.125, 0, 1), CFrame.new(4.125, 0, 1) },
	ATTACK_TARGETS = { "CreatureBlobman", "TractorRed", "TractorGreen", "TractorOrange" },
	AllowedItems = {
		FoodHamburger = true,
		FoodCoconut = true,
		FoodPizzaCheese = true,
		FoodPizzaPepperoni = true,
		FoodHotdog = true,
		FoodMushroomPoison = true,
		FoodBread = true,
		FoodDippyEgg = true,
		FoodMayonnaise = true,
		FoodFrenchFries = true,
		FoodMeatStick = true,
		FoodDonut = true,
		FoodCakePink = true,
		InstrumentGuitarBanjo = true,
		InstrumentGuitarViolin = true,
		InstrumentGuitarUkulele = true,
		InstrumentWoodwindSaxophone = true,
		InstrumentWoodwindOcarina = true,
		InstrumentBrassVuvuzelaQwizik = true,
		InstrumentBrassTrumpet = true,
		InstrumentDrumBongos = true,
		InstrumentDrumSnare = true,
		InstrumentPianoMelodica = true,
		InstrumentVoiceMicrophone = true,
		CupMugWhite = true,
		CupMugBrown = true,
		PoopPile = true,
		PoopPileSparkle = true,
	},
}

local tbl5

tbl5 = {
	["Kill Grab"] = false,
	["Sky Grab"] = false,
	["Spin Grab"] = false,
	["Teleport Up"] = false,
	["Teleport Down"] = false,
	["Chaos Grab"] = false,
	["Supersonic Grab"] = false,
	["Freeze Grab"] = false,
	["Noclip Grab"] = false,
}

do
	local tbl6 = {}
	local flag = false

	clearAntiRagdollConnections = function()
		for _, v3 in ipairs(tbl6) do
			if v3 and v3.Disconnect then
				pcall(function()
					v3:Disconnect()
				end)
			end
		end

		tbl6 = {}
	end

	protectHumanoid = function(arg)
		if not arg or not flag then
			return
		end

		pcall(function()
			arg.BreakJointsOnDeath = false
			arg.AutoRotate = true
			arg.PlatformStand = false
		end)

		table.insert(tbl6, arg.HealthChanged:Connect(function(health)
			if flag and health <= 0 and arg.Parent then
				pcall(function()
					arg.Health = 1
				end)
			end
		end))

		table.insert(tbl6, arg:GetPropertyChangedSignal("AutoRotate"):Connect(function()
			if flag and arg.AutoRotate == false and arg.Parent then
				pcall(function()
					arg.AutoRotate = true
				end)
			end
		end))

		table.insert(tbl6, arg:GetPropertyChangedSignal("PlatformStand"):Connect(function()
			if flag and arg.PlatformStand == true and arg.Parent then
				pcall(function()
					arg.PlatformStand = false
				end)
			end
		end))

		table.insert(tbl6, runService.RenderStepped:Connect(function()
			if flag and arg and arg.Parent then
				if arg.Sit and arg.SeatPart == nil then
					pcall(function()
						arg.Sit = false
					end)
				end
			end
		end))
	end

	onCharacterAddedForProtection = function(arg)
		local humanoid_ = arg:FindFirstChild("Humanoid")

		if humanoid_ and flag then
			protectHumanoid(humanoid_)
		end
	end

	setAntiRagdollProtection = function(arg)
		flag = arg

		if arg then
			localPlayer.CharacterAdded:Connect(onCharacterAddedForProtection)
			local character = localPlayer.Character
			local humanoid_ = character and character:FindFirstChild("Humanoid")

			if humanoid_ then
				protectHumanoid(humanoid_)
			end
		else
			clearAntiRagdollConnections()
		end
	end
end

getChar = function()
	return localPlayer.Character or localPlayer.CharacterAdded:Wait()
end

getCharInfo = function()
	local character = localPlayer.Character
	return character, character and character:FindFirstChild("HumanoidRootPart"), character and character:FindFirstChildOfClass("Humanoid")
end

GetRepresentativePart = function(arg, arg2)
	if not arg then
		return nil
	end

	findAny = function(arg3)
		for _, v3 in ipairs(arg3) do
			local v4 = arg:FindFirstChild(v3)
			if v4 and v4:IsA("BasePart") then
				return v4
			end
		end
	end

	if arg2 == "Head" then
		return findAny({ "Head" })
	end

	if arg2 == "HumanoidRootPart" then
		return findAny({ "HumanoidRootPart", "Torso", "UpperTorso", "LowerTorso" })
	end

	if arg2 == "Left Arm" then
		return findAny({ "LeftHand", "LeftUpperArm", "Left Arm", "LeftLowerArm" })
	end

	if arg2 == "Right Arm" then
		return findAny({ "RightHand", "RightUpperArm", "Right Arm", "RightLowerArm" })
	end

	if arg2 == "Left Leg" then
		return findAny({ "LeftFoot", "LeftLowerLeg", "Left Leg", "LeftUpperLeg" })
	end

	if arg2 == "Right Leg" then
		return findAny({ "RightFoot", "RightLowerLeg", "Right Leg", "RightUpperLeg" })
	end
end

GetPart = function(arg, arg2)
	if not arg then
		return {}
	end
	local tbl6 = {}

	if arg2 == "HRP" then
		tbl6 = { "HumanoidRootPart", "Torso", "UpperTorso" }
	elseif arg2 == "Others" then
		tbl6 = {
			"Head",
			"Left Arm",
			"Right Arm",
			"Left Leg",
			"Right Leg",
			"LeftUpperArm",
			"RightUpperArm",
			"LeftLowerArm",
			"RightLowerArm",
			"LeftHand",
			"RightHand",
			"LeftUpperLeg",
			"RightUpperLeg",
			"LeftLowerLeg",
			"RightLowerLeg",
			"LeftFoot",
			"RightFoot",
		}
	end

	local tbl7 = {}

	for _, v3 in ipairs(tbl6) do
		local v4 = arg:FindFirstChild(v3)

		if v4 and v4:IsA("BasePart") then
			table.insert(tbl7, v4)
		end
	end

	return tbl7
end

GetPlayerList = function()
	local tbl6 = {}

	for _, player in pairs(players:GetPlayers()) do
		if player ~= localPlayer then
			table.insert(tbl6, player.Name)
		end
	end

	return tbl6
end

GetPlayerListDisplay = function()
	local tbl6 = {}

	for _, player in ipairs(players:GetPlayers()) do
		if player ~= localPlayer then
			table.insert(tbl6, player.DisplayName .. " @" .. player.Name)
		end
	end

	if #tbl6 == 0 then
		table.insert(tbl6, "No Players")
	end

	return tbl6
end

ExtractUsername = function(arg)
	if not arg or arg == "" or arg == "No Players" then
		return nil
	end
	return arg:match("@(.+)$")
end

isWhitelisted = function(arg)
	if not tbl2.whitelistEnabled then
		return false
	end

	if arg == localPlayer then
		return true
	end

	if localPlayer:IsFriendsWith(arg.UserId) then
		return true
	end

	if tbl3.whitelistedPlayers[arg.Name] then
		return true
	end
	return false
end

addToWhitelist = function(arg)
	tbl3.whitelistedPlayers[arg] = true
	_NOTIFY("Whitelist: Added " .. arg, 3)
end

getWhitelistInfo = function()
	local str = "[Protected Players]\n\n[Friends]\n"
	local n = 0

	for _, player in ipairs(players:GetPlayers()) do
		if player ~= localPlayer and localPlayer:IsFriendsWith(player.UserId) then
			str ..= "- " .. player.Name .. "\n"
			n += 1
		end
	end

	local n2 = 0

	for k in pairs(tbl3.whitelistedPlayers) do
		if n2 == 0 then
			str ..= "\n[Manually Added]\n"
		end

		str ..= "- " .. k .. "\n"
		n2 += 1
	end

	if n + n2 == 0 then
		return "No protected players"
	end
	return str
end

local tbl6 = {}

updateDropdown = function(arg)
	if arg then
		pcall(function()
			arg:SetValues(GetPlayerListDisplay())
		end)
	end
end

setupAutoRefresh = function(arg)
	updateDropdown(arg)
	table.insert(tbl6, arg)
end

_refreshAllDropdowns = function()
	for _, v3 in ipairs(tbl6) do
		updateDropdown(v3)
	end
end

players.PlayerAdded:Connect(function()
	task.wait(1)
	_refreshAllDropdowns()
end)

players.PlayerRemoving:Connect(function()
	task.wait(1)
	_refreshAllDropdowns()
end)

clearConnections = function()
	for _, connection in ipairs(tbl3.connections) do
		connection:Disconnect()
	end

	tbl3.connections = {}
end

protectHumanoidOld = function(arg)
	if not arg then
		return
	end

	pcall(function()
		arg.BreakJointsOnDeath = false
		arg.AutoRotate = true
		arg.PlatformStand = false
	end)

	table.insert(tbl3.connections, arg.HealthChanged:Connect(function(health)
		if tbl2.protectionEnabled and health <= 0 then
			pcall(function()
				arg.Health = 1
			end)
		end
	end))

	table.insert(tbl3.connections, arg:GetPropertyChangedSignal("AutoRotate"):Connect(function()
		if tbl2.protectionEnabled and not arg.AutoRotate then
			pcall(function()
				arg.AutoRotate = true
			end)
		end
	end))

	table.insert(tbl3.connections, arg:GetPropertyChangedSignal("PlatformStand"):Connect(function()
		if tbl2.protectionEnabled and arg.PlatformStand then
			pcall(function()
				arg.PlatformStand = false
			end)
		end
	end))

	table.insert(tbl3.connections, runService.RenderStepped:Connect(function()
		if tbl2.protectionEnabled and arg.Sit and arg.SeatPart == nil then
			pcall(function()
				arg.Sit = false
			end)
		end
	end))
end

setProtection = function(protectionEnabled)
	tbl2.protectionEnabled = protectionEnabled

	if protectionEnabled then
		local humanoid_ = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")

		if humanoid_ then
			protectHumanoidOld(humanoid_)
		end

		setAntiRagdollProtection(true)
	else
		clearConnections()
		setAntiRagdollProtection(false)
	end
end

localPlayer.CharacterAdded:Connect(function(character)
	local humanoid_ = character:WaitForChild("Humanoid", 5)

	if humanoid_ and tbl2.protectionEnabled then
		protectHumanoidOld(humanoid_)
	end
end)

if localPlayer.Character then
	local humanoid_ = localPlayer.Character:FindFirstChild("Humanoid")

	if humanoid_ and tbl2.protectionEnabled then
		protectHumanoidOld(humanoid_)
	end
end

bp = function()
	pcall(function()
		local plotItems = workspace_:FindFirstChild("PlotItems")
		if not plotItems then
			return
		end

		for i = 1, 5 do
			local v3 = plotItems:FindFirstChild("Plot" .. i)

			if v3 then
				local creatureBlobman = v3:FindFirstChild("CreatureBlobman")

				if creatureBlobman and creatureBlobman:IsA("Folder") then
					for _, child in ipairs(creatureBlobman:GetChildren()) do
						if child.Name == "LeftDetector" or child.Name == "RightDetector" then
							child:Destroy()
						end
					end
				end
			end
		end
	end)
end

antib1 = function()
	pcall(function()
		for _, player in ipairs(players:GetPlayers()) do
			if player ~= localPlayer then
				local v3 = workspace_:FindFirstChild(player.Name .. "SpawnedInToys")

				if v3 and v3:IsA("Folder") then
					for _, child in ipairs(v3:GetChildren()) do
						if child.Name == "CreatureBlobman" then
							for _, child2 in ipairs(child:GetChildren()) do
								if child2.Name == "LeftDetector" or child2.Name == "RightDetector" then
									child2:Destroy()
								end
							end
						end
					end
				end
			end
		end
	end)
end

task.spawn(function()
	while true do
		pcall(function()
			if tbl2.antiblob then
				bp()
				antib1()
			end
		end)

		task.wait(0.5)
	end
end)

antiLag = function()
	pcall(function()
		if tbl2.antiLag1 then
			localPlayer.PlayerScripts.CharacterAndBeamMove.Disabled = true
		else
			localPlayer.PlayerScripts.CharacterAndBeamMove.Enabled = true
		end
	end)
end

setupAntiExplosion = function(arg)
	pcall(function()
		local ragdolled = arg:WaitForChild("Humanoid"):FindFirstChild("Ragdolled")
		if not ragdolled then
			return
		end

		tbl3.antiExplosionConnection = ragdolled:GetPropertyChangedSignal("Value"):Connect(function()
			for _, child in ipairs(arg:GetChildren()) do
				if child:IsA("BasePart") then
					child.Anchored = ragdolled.Value
				end
			end
		end)
	end)
end

handleKillGrab = function(arg)
	pcall(function()
		local grabPart_ = arg:FindFirstChild("GrabPart")
		local weldConstraint = grabPart_ and grabPart_:FindFirstChild("WeldConstraint")

		if weldConstraint and weldConstraint.Part1 then
			weldConstraint.Part1.Parent:BreakJoints()
		end
	end)
end

handleSkyGrab = function(arg)
	pcall(function()
		local grabPart_ = arg:FindFirstChild("GrabPart")

		if grabPart_ and grabPart_:FindFirstChild("WeldConstraint") then
			local bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.Velocity = Vector3.new(0, 100, 0)
			bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
			bodyVelocity.Parent = grabPart_
		end
	end)
end

handleSpinGrab = function(arg)
	pcall(function()
		local grabPart_ = arg:FindFirstChild("GrabPart")
		grabPart_ = grabPart_ and grabPart_:FindFirstChild("WeldConstraint")

		if grabPart_ and grabPart_.Part1 then
			local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
			bodyAngularVelocity.AngularVelocity = Vector3.new(0, 1000, 0)
			bodyAngularVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
			bodyAngularVelocity.Parent = grabPart_.Part1

			for _, child in ipairs(arg:GetChildren()) do
				child:Destroy()
			end
		end
	end)
end

handleChaosGrab = function(arg, arg2)
	pcall(function()
		local grabPart_ = arg:FindFirstChild("GrabPart")
		if not grabPart_ then
			return
		end
		local bodyPosition = Instance.new("BodyPosition")
		bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bodyPosition.Parent = grabPart_
		local bodyGyro = Instance.new("BodyGyro")
		bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		bodyGyro.Parent = grabPart_

		task.spawn(function()
			while arg2() do
				pcall(function()
					local random = math.random
					bodyPosition.Position = grabPart_.Position + Vector3.new(math.random(-50, 50), math.random(-50, 50), random(-50, 50))
					local rad = math.rad
					local random2 = math.random
					bodyGyro.CFrame = CFrame.Angles(math.rad(math.random(-180, 180)), math.rad(math.random(-180, 180)), rad(random2(-180, 180)))
				end)

				task.wait(0.1)
			end

			bodyPosition:Destroy()
			bodyGyro:Destroy()
		end)
	end)
end

handleSupersonicGrab = function(arg)
	pcall(function()
		local grabPart_ = arg:FindFirstChild("GrabPart")

		if grabPart_ then
			local bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.Velocity = Vector3.new(0, 350, 0)
			bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
			bodyVelocity.Parent = grabPart_
		end
	end)
end

handleFreezeGrab = function(arg)
	pcall(function()
		local grabPart_ = arg:FindFirstChild("GrabPart")

		if grabPart_ then
			local bodyPosition = Instance.new("BodyPosition")
			bodyPosition.Position = grabPart_.Position
			bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bodyPosition.Parent = grabPart_
		end
	end)
end

handleNoclipGrab = function(arg)
	pcall(function()
		if arg:FindFirstChild("GrabPart") then
			for _, descendant in pairs(arg:GetDescendants()) do
				if descendant:IsA("BasePart") then
					descendant.CanCollide = false
				end
			end
		end
	end)
end

handleTeleport = function(arg, arg2)
	pcall(function()
		local grabPart_ = arg:FindFirstChild("GrabPart")

		if grabPart_ then
			grabPart_.Position = grabPart_.Position + Vector3.new(0, arg2 == "up" and 30 or -30, 0)
		end
	end)
end

clearRagdoll = function()
	local v3, v4, v5 = getCharInfo()

	if v4 and v5 then
		pcall(function()
			ragdollRemote:FireServer(v4, 0)
			v5:ChangeState(Enum.HumanoidStateType.Jumping)
		end)
	end
end

spawnBlobmanIfNeeded = function()
	local v3 = getChar()
	local v4 = workspace_:WaitForChild(localPlayer.Name .. "SpawnedInToys")
	local creatureBlobman = v4:FindFirstChild("CreatureBlobman")
	if creatureBlobman then
		return creatureBlobman
	end

	task.spawn(function()
		pcall(function()
			spawnToyRemoteFunction:InvokeServer("CreatureBlobman", v3.Head.CFrame, Vector3.zero)
		end)
	end)

	local creatureBlobman2 = nil

	for i = 1, 50 do
		creatureBlobman2 = v4:FindFirstChild("CreatureBlobman")
		if not creatureBlobman2 then
			task.wait(0.05)
			continue
		end
		break
	end

	return creatureBlobman2
end

sitOnBlobman = function(arg)
	if not arg then
		return
	end
	local vehicleSeat = arg:FindFirstChildWhichIsA("VehicleSeat", true)
	local character = localPlayer.Character
	local humanoid_ = character and character:FindFirstChildOfClass("Humanoid")

	if vehicleSeat and humanoid_ and not vehicleSeat.Occupant then
		task.wait(0.1)

		pcall(function()
			vehicleSeat:Sit(humanoid_)
		end)
	end
end

StartRagdollSpam = function()
	if tbl2.ragdollRunning then
		return
	end
	tbl2.ragdollRunning = true

	task.spawn(function()
		while tbl2.ragdollRunning do
			pcall(function()
				local humanoidRootPart = getChar()

				if humanoidRootPart then
					humanoidRootPart = humanoidRootPart:FindFirstChild("HumanoidRootPart") or humanoidRootPart:FindFirstChild("Torso") or humanoidRootPart:FindFirstChild("UpperTorso")
				end

				if humanoidRootPart then
					ragdollRemote:FireServer(humanoidRootPart, 1)
				end
			end)

			task.wait(0.05)
		end
	end)
end

StopRagdollSpam = function()
	tbl2.ragdollRunning = false
end

UpdateRagdollState = function()
	if tbl2.headEnabled or tbl2.legsEnabled or tbl2.obeyPartEnabled or tbl2.obeyAllEnabled or tbl2.feetTPDeleteEnabled or tbl2.danceEnabled then
		StartRagdollSpam()
	else
		StopRagdollSpam()
	end
end

executeSequenceGucci = function(currentInstance)
	if currentInstance.Name ~= tbl2.targetToyName then
		return
	end
	tbl2.currentInstance = currentInstance
	local v3, v4, v5 = getCharInfo()
	if not (v4 and v5) then
		return
	end
	local vehicleSeat = currentInstance:WaitForChild("VehicleSeat", 2) or currentInstance:FindFirstChildWhichIsA("VehicleSeat", true)

	if vehicleSeat and v5 then
		pcall(function()
			vehicleSeat:Sit(v5)
		end)

		local now = tick()

		while true do
			local antiDuration = tbl4.ANTI_DURATION

			if tick() - now < antiDuration and tbl2.autoRunEnabled then
				pcall(function()
					ragdollRemote:FireServer(v4, 0)
					v5:ChangeState(Enum.HumanoidStateType.Jumping)
				end)

				runService.Heartbeat:Wait()
				continue
			end

			break
		end

		local primaryPart = currentInstance.PrimaryPart or currentInstance:FindFirstChild("HumanoidRootPart", true) or currentInstance:FindFirstChild("Part", true)

		if primaryPart and tbl2.autoRunEnabled then
			pcall(function()
				if primaryPart.SetNetworkOwner then
					primaryPart:SetNetworkOwner(localPlayer)
				end

				sethiddenproperty(primaryPart, "NetworkIsSleeping", false)
			end)
		end

		if tbl2.originalPos then
			v4.CFrame = tbl2.originalPos
		end

		task.wait(0.1)

		if vehicleSeat then
			vehicleSeat:Destroy()
		end
	end
end

startSystem = function()
	local v3
	v3, v3 = getCharInfo()

	if v3 then
		tbl2.originalPos = v3.CFrame
	end

	if tbl2.activeConnection then
		tbl2.activeConnection:Disconnect()
	end

	tbl2.activeConnection = v.ChildAdded:Connect(function(child)
		task.spawn(function()
			executeSequenceGucci(child)
		end)
	end)

	task.spawn(function()
		while tbl2.autoRunEnabled do
			if not tbl2.currentInstance or not tbl2.currentInstance.Parent then
				pcall(function()
					spawnToyRemoteFunction:InvokeServer(tbl2.targetToyName, CFrame.new(tbl4.SPAWN_POS), Vector3.new(0, -15.716, 0))
				end)
			end

			task.wait(1)
		end
	end)
end

runAura = function(arg, arg2)
	local flag = false

	while arg2() do
		task.wait(0.01)
		local v3, v4 = getCharInfo()

		if v4 then
			local v5 = spawnBlobmanIfNeeded()

			if v5 then
				sitOnBlobman(v5)
				local blobmanSeatAndOwnerScript = v5:FindFirstChild("BlobmanSeatAndOwnerScript")
				local leftDetector = v5:FindFirstChild("LeftDetector")
				local leftWeld = leftDetector and leftDetector:FindFirstChild("LeftWeld")

				if blobmanSeatAndOwnerScript and leftDetector and leftWeld then
					local creatureGrab = blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
					local creatureRelease = blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
					local creatureDrop = blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")

					if creatureGrab and creatureRelease and creatureDrop then
						flag = not flag

						for _, player in ipairs(players:GetPlayers()) do
							if arg2() then
								if player ~= localPlayer and not isWhitelisted(player) then
									local character = player.Character
									local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
									local humanoid_ = character and character:FindFirstChildOfClass("Humanoid")

									if humanoidRootPart and humanoid_ and (v4.Position - humanoidRootPart.Position).Magnitude <= 30 then
										pcall(function()
											creatureGrab:FireServer(leftDetector, humanoidRootPart, leftWeld)
											creatureRelease:FireServer(leftWeld, humanoidRootPart)
											creatureDrop:FireServer(leftWeld, humanoidRootPart)

											if arg then
												humanoid_.Health = flag and 0 or 100
											end
										end)
									end
								end

								continue
							end

							break
						end
					end
				end
			end
		end
	end
end

runSpeedJumpAura = function(arg)
	while arg() do
		task.wait(0.01)
		local v3, v4 = getCharInfo()

		if v4 then
			local v5 = spawnBlobmanIfNeeded()

			if v5 then
				sitOnBlobman(v5)
				local blobmanSeatAndOwnerScript = v5:FindFirstChild("BlobmanSeatAndOwnerScript")
				local leftDetector = v5:FindFirstChild("LeftDetector")
				local leftWeld = leftDetector and leftDetector:FindFirstChild("LeftWeld")

				if blobmanSeatAndOwnerScript and leftDetector and leftWeld then
					local creatureGrab = blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
					local creatureRelease = blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
					local creatureDrop = blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")

					if creatureGrab and creatureRelease and creatureDrop then
						for _, player in ipairs(players:GetPlayers()) do
							if arg() then
								if player ~= localPlayer and not isWhitelisted(player) then
									local character = player.Character
									local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
									local humanoid_ = character and character:FindFirstChildOfClass("Humanoid")

									if humanoidRootPart and humanoid_ and (v4.Position - humanoidRootPart.Position).Magnitude <= 30 then
										pcall(function()
											creatureGrab:FireServer(leftDetector, humanoidRootPart, leftWeld)
											creatureRelease:FireServer(leftWeld, humanoidRootPart)
											creatureDrop:FireServer(leftWeld, humanoidRootPart)
											humanoid_.WalkSpeed = tbl2.targetWalkSpeed
											humanoid_.JumpPower = tbl2.targetJumpPower
										end)
									end
								end

								continue
							end

							break
						end
					end
				end
			end
		end
	end
end

runTPSpamAura = function(arg)
	while arg() do
		task.wait(0.01)
		local v3, v4 = getCharInfo()

		if v4 then
			local v5 = spawnBlobmanIfNeeded()

			if v5 then
				sitOnBlobman(v5)
				local blobmanSeatAndOwnerScript = v5:FindFirstChild("BlobmanSeatAndOwnerScript")
				local leftDetector = v5:FindFirstChild("LeftDetector")
				local leftWeld = leftDetector and leftDetector:FindFirstChild("LeftWeld")

				if blobmanSeatAndOwnerScript and leftDetector and leftWeld then
					local creatureGrab = blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
					local creatureRelease = blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
					local creatureDrop = blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")

					if creatureGrab and creatureRelease and creatureDrop then
						for _, player in ipairs(players:GetPlayers()) do
							if arg() then
								if player ~= localPlayer and not isWhitelisted(player) then
									local character = player.Character
									local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

									if humanoidRootPart and (v4.Position - humanoidRootPart.Position).Magnitude <= 30 then
										pcall(function()
											creatureGrab:FireServer(leftDetector, humanoidRootPart, leftWeld)
											creatureRelease:FireServer(leftWeld, humanoidRootPart)
											creatureDrop:FireServer(leftWeld, humanoidRootPart)
											humanoidRootPart.CFrame = CFrame.new(0, 20, 0)
										end)
									end
								end

								continue
							end

							break
						end
					end
				end
			end
		end
	end
end

tpAllWithBlobman = function(arg)
	while arg() do
		task.wait(0.1)
		local v3, v4 = getCharInfo()

		if v4 then
			local v5 = spawnBlobmanIfNeeded()

			if v5 then
				sitOnBlobman(v5)

				for _, player in ipairs(players:GetPlayers()) do
					if arg() then
						if player ~= localPlayer and not isWhitelisted(player) then
							local character = player.Character
							local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

							if humanoidRootPart then
								pcall(function()
									v4.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -3)
								end)

								task.wait(0.2)
							end
						end

						continue
					end

					break
				end
			end
		end
	end
end

runTargetKillAura = function(arg)
	while tbl2.targetKillRunning and tbl2.selectedTargetPlayer == arg do
		task.wait(0.01)
		local v3, v4 = getCharInfo()

		if v4 then
			local v5 = players:FindFirstChild(arg)

			if not v5 or not v5.Character then
				task.wait(1)
			else
				local character = v5.Character
				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
				local humanoid_ = character:FindFirstChildOfClass("Humanoid")

				if not (humanoidRootPart and humanoid_) or humanoid_.Health <= 0 then
					task.wait(1)
				else
					local v6 = spawnBlobmanIfNeeded()

					if not v6 then
						task.wait(0.5)
					else
						local vehicleSeat = v6:FindFirstChildWhichIsA("VehicleSeat", true)
						local humanoid_2 = v3 and v3:FindFirstChildOfClass("Humanoid")

						if not (vehicleSeat and humanoid_2) then
							task.wait(0.5)
						else
							if not vehicleSeat.Occupant then
								pcall(function()
									vehicleSeat:Sit(humanoid_2)
								end)

								task.wait(0.2)
							end

							if not vehicleSeat.Occupant then
								task.wait(0.5)
							else
								local blobmanSeatAndOwnerScript = v6:FindFirstChild("BlobmanSeatAndOwnerScript")
								local leftDetector = v6:FindFirstChild("LeftDetector")
								local leftWeld = leftDetector and leftDetector:FindFirstChild("LeftWeld")

								if not (blobmanSeatAndOwnerScript and leftDetector and leftWeld) then
									task.wait(0.5)
								else
									local creatureGrab = blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
									local creatureRelease = blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
									local creatureDrop = blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")

									if not (creatureGrab and creatureRelease and creatureDrop) then
										task.wait(0.5)
									else
										tbl2.lastTargetPosition = v4.CFrame

										pcall(function()
											v4.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -3)
										end)

										task.wait(0.2)
										local now = tick()

										while true do
											if tick() - now < 2 and tbl2.targetKillRunning then
												if v5 and v5.Character and humanoid_.Health > 0 then
													if vehicleSeat.Occupant then
														if (v4.Position - humanoidRootPart.Position).Magnitude <= 30 then
															pcall(function()
																creatureGrab:FireServer(leftDetector, humanoidRootPart, leftWeld)
																creatureRelease:FireServer(leftWeld, humanoidRootPart)
																creatureDrop:FireServer(leftWeld, humanoidRootPart)
																humanoid_.Health = 0
															end)
														end

														task.wait(0.01)
														continue
													end
												end
											end

											break
										end

										task.wait(0.1)

										if tbl2.lastTargetPosition then
											pcall(function()
												v4.CFrame = tbl2.lastTargetPosition
											end)
										end

										if humanoid_.Health <= 0 then
											local flag = false
											local connection = nil

											connection = arg and players:FindFirstChild(arg) and players:FindFirstChild(arg).CharacterAdded:Connect(function()
												flag = true

												if connection then
													connection:Disconnect()
												end
											end)

											local now2 = tick()

											while not flag and tbl2.targetKillRunning and tick() - now2 < 30 do
												task.wait()
											end

											if connection then
												pcall(function()
													connection:Disconnect()
												end)
											end

											task.wait(0.05)
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
end

updateTargetKill = function()
	tbl2.targetKillRunning = tbl2.targetKillEnabled and tbl2.selectedTargetPlayer ~= nil

	if tbl2.targetKillRunning then
		task.spawn(function()
			runTargetKillAura(tbl2.selectedTargetPlayer)
		end)

		_NOTIFY("Target Kill: Auto-kill started on " .. tbl2.selectedTargetPlayer, 3)
	else
		_NOTIFY("Target Kill: Auto-kill stopped", 3)
	end
end

updateBlobmanAuraMode = function()
	tbl2.blobmanAuraRunning = tbl2.blobmanAuraEnabled

	if not tbl2.blobmanAuraEnabled or tbl2.blobmanAuraMode ~= "Kick Aura" then
		if _G.stopKickAura then
			_G.stopKickAura()
		end
	end

	if not tbl2.blobmanAuraEnabled then
		return
	end
	local blobmanAuraMode = tbl2.blobmanAuraMode

	local function fn_()
		return tbl2.blobmanAuraRunning
	end

	if blobmanAuraMode == "Kill Aura" then
		task.spawn(function()
			runAura(true, fn_)
		end)
	elseif blobmanAuraMode == "Destroy Aura" then
		task.spawn(function()
			runAura(false, fn_)
		end)
	elseif blobmanAuraMode == "Speed/Jump Control" then
		task.spawn(function()
			runSpeedJumpAura(fn_)
		end)
	elseif blobmanAuraMode == "TP Spam" then
		task.spawn(function()
			runTPSpamAura(fn_)
		end)
	elseif blobmanAuraMode == "Kick Aura" then
		task.spawn(function()
			if _G.startKickAura then
				_G.startKickAura()
			end
		end)
	end
end

updateBlobmanAllMode = function()
	tbl2.blobmanAllRunning = tbl2.blobmanAllEnabled
	if not tbl2.blobmanAllEnabled then
		return
	end
	local blobmanAllMode = tbl2.blobmanAllMode

	local function fn_()
		return tbl2.blobmanAllRunning
	end

	if blobmanAllMode == "All Kill" then
		task.spawn(function()
			runAura(true, fn_)
		end)

		task.spawn(function()
			tpAllWithBlobman(fn_)
		end)
	elseif blobmanAllMode == "All Destroy" then
		task.spawn(function()
			runAura(false, fn_)
		end)

		task.spawn(function()
			tpAllWithBlobman(fn_)
		end)
	elseif blobmanAllMode == "All Speed/Jump" then
		task.spawn(function()
			runSpeedJumpAura(fn_)
		end)

		task.spawn(function()
			tpAllWithBlobman(fn_)
		end)
	elseif blobmanAllMode == "All TP Spam" then
		task.spawn(function()
			runTPSpamAura(fn_)
		end)

		task.spawn(function()
			tpAllWithBlobman(fn_)
		end)
	end
end

task.spawn(function()
	task.wait(2)

	for _, descendant in ipairs(workspace_:GetDescendants()) do
		if tbl4.AllowedItems[descendant.Name] and descendant:IsA("Model") and descendant:FindFirstChild("HoldPart") then
			table.insert(tbl3.targetItems, descendant)
		end
	end
end)

workspace_.DescendantAdded:Connect(function(descendant)
	if tbl4.AllowedItems[descendant.Name] and descendant:IsA("Model") then
		task.spawn(function()
			if descendant:WaitForChild("HoldPart", 3) then
				table.insert(tbl3.targetItems, descendant)
			end
		end)
	end
end)

runRemoveAntiLag = function()
	while tbl2.antiAntiLagEnabled do
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

		if humanoidRootPart then
			for i = #tbl3.targetItems, 1, -1 do
				local v3 = tbl3.targetItems[i]

				if not v3 or not v3.Parent or not v3:FindFirstChild("HoldPart") then
					table.remove(tbl3.targetItems, i)
				else
					local holdPart = v3.HoldPart

					pcall(function()
						holdPart.HoldItemRemoteFunction:InvokeServer(v3, character)
					end)

					task.wait()

					pcall(function()
						holdPart.DropItemRemoteFunction:InvokeServer(v3, CFrame.new(humanoidRootPart.Position + Vector3.new(0, -2000, 0)), Vector3.zero)
					end)
				end
			end
		end

		task.wait()
	end
end

CleanupWings = function()
	for _, wing in pairs(tbl3.Wings) do
		if wing.Handle then
			pcall(function()
				wing.Handle:Destroy()
			end)
		end

		for _, segment in pairs(wing.Segments) do
			if segment.Part then
				pcall(function()
					segment.Part:Destroy()
				end)
			end
		end
	end

	tbl3.Wings = {}
end

GetToyFolders = function()
	local tbl7 = {}

	pcall(function()
		if tbl2.SearchMode == "My Toys" or tbl2.SearchMode == "All Toys" then
			local v3 = workspace_:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

			if v3 then
				table.insert(tbl7, v3)
			end
		end

		if tbl2.SearchMode == "Plot Toys" or tbl2.SearchMode == "All Toys" then
			local plots = workspace_:FindFirstChild("Plots")

			if plots then
				for i = 1, 5 do
					local v3 = plots:FindFirstChild("Plot" .. i)

					if v3 then
						local plotSign = v3:FindFirstChild("PlotSign")
						local thisPlotsOwners = plotSign and plotSign:FindFirstChild("ThisPlotsOwners")

						if thisPlotsOwners then
							for _, child in ipairs(thisPlotsOwners:GetChildren()) do
								if child:IsA("ValueBase") and child.Value == localPlayer.Name then
									local plotItems = workspace_:FindFirstChild("PlotItems")

									if plotItems and plotItems:FindFirstChild(v3.Name) then
										table.insert(tbl7, plotItems:FindFirstChild(v3.Name))
									end
								end
							end
						end
					end
				end
			end
		end
	end)

	return tbl7
end

SetupPhysics = function(parent)
	local bodyPosition = parent:FindFirstChildOfClass("BodyPosition") or Instance.new("BodyPosition")
	local bodyGyro = parent:FindFirstChildOfClass("BodyGyro") or Instance.new("BodyGyro")
	bodyPosition.P = 15000
	bodyPosition.D = 200
	bodyPosition.MaxForce = Vector3.one * 1e10
	bodyPosition.Parent = parent
	bodyGyro.P = 15000
	bodyGyro.D = 200
	bodyGyro.MaxTorque = Vector3.one * 1e10
	bodyGyro.Parent = parent
	return bodyGyro, bodyPosition
end

BuildWings = function()
	CleanupWings()
	local v3 = GetToyFolders()
	local tbl7 = {}

	for _, v4 in ipairs(v3) do
		for _, descendant in ipairs(v4:GetDescendants()) do
			if descendant:IsA("Model") and descendant.Name == tbl2.SelectedItem then
				table.insert(tbl7, descendant)
			end
		end
	end

	if #tbl7 == 0 then
		return false
	end

	for i = 1, 2 do
		local tbl8 = {}

		for i2 = 1, tbl2.WingLength do
			local part_ = Instance.new("Part")
			part_.CanCollide = false
			part_.Anchored = true
			part_.Transparency = 1
			part_.Size = Vector3.new(4, 1, 4)
			part_.Parent = workspace_
			tbl8[#tbl8 + 1] = { Part = part_ }
		end

		local part_ = Instance.new("Part")
		part_.CanCollide = false
		part_.Anchored = true
		part_.Transparency = 1
		part_.Size = Vector3.new(4, 1, 4)
		part_.Parent = workspace_
		tbl3.Wings[#tbl3.Wings + 1] = { Handle = part_, Segments = tbl8, Sync = {}, Reserved = nil }
	end

	for i, v4 in ipairs(tbl7) do
		local n = i <= #tbl7 / 2 and 1 or 2
		local soundPart = v4:FindFirstChild("SoundPart") or v4:FindFirstChild("Handle") or v4:FindFirstChildWhichIsA("BasePart")

		if soundPart then
			for _, child in pairs(v4:GetChildren()) do
				if child:IsA("BasePart") then
					child.CanCollide = false
				end
			end

			local v5, v6 = SetupPhysics(soundPart)

			if not tbl3.Wings[n].Reserved then
				tbl3.Wings[n].Reserved = { BG = v5, BP = v6 }
			else
				table.insert(tbl3.Wings[n].Sync, { BG = v5, BP = v6 })
			end
		end
	end

	return true
end

_G.permOwnerList = {}
_G.permOwnerResetConns = {}

clearPermOwnerList = function()
	for _, permOwnerResetConn in pairs(_G.permOwnerResetConns) do
		pcall(function()
			permOwnerResetConn:Disconnect()
		end)
	end

	_G.permOwnerResetConns = {}
	_G.permOwnerList = {}
end

addToPermOwnerList = function(arg)
	_G.permOwnerList[arg] = true

	_G.permOwnerResetConns[arg] = arg.CharacterAdded:Connect(function()
		if _G.permOwnerList[arg] then
			_G.permOwnerList[arg] = nil
			_NOTIFY("Perm Owner: " .. arg.Name .. " reset -> excluded", 2)
		end
	end)
end

runService.Heartbeat:Connect(function()
	for k in pairs(_G.permOwnerList) do
		if k and k.Parent and k.Character then
			local head_ = k.Character:FindFirstChild("Head")

			if head_ then
				if head_:FindFirstChild("PartOwner") then
					_G.permOwnerList[k] = nil
					_NOTIFY("Perm Owner: " .. k.Name .. " not grabbed -> excluded", 2)
				end
			end
		end
	end
end)

local tbl7
tbl7 = { enabled = false, speed = 1, height = 5, radius = 8, angle = 0, connection = nil }

smartFastSitOnce = function(arg)
	local v3, v4, v5 = getCharInfo()
	if not (v4 and v5) then
		return
	end
	local vehicleSeat = arg:FindFirstChild("VehicleSeat", true)

	if vehicleSeat and not vehicleSeat:FindFirstChild("SeatWeld") then
		pcall(function()
			vehicleSeat:Sit(v5)
		end)

		local n = 0

		while true do
			task.wait(0.01)
			n += 1
			if not (vehicleSeat:FindFirstChild("SeatWeld") or n > 10) then
				continue
			end
			break
		end

		if vehicleSeat:FindFirstChild("SeatWeld") then
			v5:ChangeState(Enum.HumanoidStateType.Jumping)
		end

		task.wait(0.5)
	end
end

smartFastSitAllThenReturn = function(arg)
	local tbl8 = {}

	for _, descendant in pairs(arg:GetDescendants()) do
		if descendant:IsA("Model") and table.find(tbl4.ATTACK_TARGETS, descendant.Name) then
			table.insert(tbl8, descendant)
		end
	end

	for _, v3 in ipairs(tbl8) do
		smartFastSitOnce(v3)
	end
end

hvhSpawnAndSitOnBlob = function()
	local character = localPlayer.Character
	if not character or not character.Parent then
		return
	end
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	local humanoid_ = character:FindFirstChildOfClass("Humanoid")
	if not (humanoidRootPart and humanoid_) then
		return
	end

	if not humanoid_:IsDescendantOf(workspace_) then
		return
	end
	local v3 = workspace_:FindFirstChild(localPlayer.Name .. "SpawnedInToys") or workspace_:WaitForChild(localPlayer.Name .. "SpawnedInToys", 5)
	if not v3 then
		return
	end
	local creatureBlobman = v3:FindFirstChild("CreatureBlobman")

	if not creatureBlobman then
		pcall(function()
			spawnToyRemoteFunction:InvokeServer("CreatureBlobman", humanoidRootPart.CFrame, Vector3.zero)
		end)

		for i = 1, 60 do
			creatureBlobman = v3:FindFirstChild("CreatureBlobman")
			if not creatureBlobman then
				task.wait(0.05)
				continue
			end
			break
		end
	end

	if not creatureBlobman or not creatureBlobman.Parent then
		return
	end
	local vehicleSeat = creatureBlobman:FindFirstChildWhichIsA("VehicleSeat", true)
	if not vehicleSeat or not vehicleSeat.Parent then
		return
	end

	for i = 1, 20 do
		local character2 = localPlayer.Character

		if not (not character2 or not character2.Parent) then
			humanoidRootPart = character2:FindFirstChild("HumanoidRootPart")
			local humanoid_2 = character2:FindFirstChildOfClass("Humanoid")

			if humanoidRootPart and humanoid_2 then
				if humanoid_2:IsDescendantOf(workspace_) then
					if not (not vehicleSeat.Parent or not vehicleSeat:IsDescendantOf(workspace_)) then
						if vehicleSeat.Occupant ~= humanoid_2 then
							pcall(function()
								humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 1, 0)
							end)

							task.wait()

							if humanoid_2:IsDescendantOf(workspace_) and vehicleSeat:IsDescendantOf(workspace_) then
								pcall(function()
									vehicleSeat:Sit(humanoid_2)
								end)
							end

							task.wait()

							if v2 then
								local v4 = GetPart(character2, "HRP")

								if v4[1] then
									pcall(function()
										v2:FireServer(v4[1], 0)
									end)
								end
							end

							pcall(function()
								humanoid_2:ChangeState(Enum.HumanoidStateType.Seated)
							end)

							task.wait()
							continue
						end
					end
				end
			end
		end

		break
	end
end

_G.loopKickBlobTask = nil
_G.loopKickBlobAllTask = nil
local v3 = nil

ensureSkyKickFloor = function()
	if v3 and v3.Parent then
		return v3
	end
	local part_ = Instance.new("Part")
	part_.Name = "SkyKickFloor"
	part_.Anchored = true
	part_.CanCollide = true
	part_.Size = Vector3.new(50, 1, 50)
	part_.CFrame = CFrame.new(20000, 20000, 20000)
	part_.BrickColor = BrickColor.new("White")
	part_.Material = Enum.Material.SmoothPlastic
	part_.Parent = workspace
	v3 = part_
	return part_
end

removeSkyKickFloor = function()
	if v3 and v3.Parent then
		v3:Destroy()
		v3 = nil
	end
end

LoopKickBlobFunction = function(arg)
	local grabEvents = replicatedStorage:WaitForChild("GrabEvents")
	local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
	local seatPart = character:WaitForChild("Humanoid").SeatPart

	if not seatPart or seatPart.Parent.Name ~= "CreatureBlobman" then
		_NOTIFY("Loop Kick: Please ride Blobman first", 3)
		tbl2.loopKickBlobActive = false
		return
	end

	local parent = seatPart.Parent
	local humanoidRootPart = parent:FindFirstChild("HumanoidRootPart") or parent.PrimaryPart
	local blobmanSeatAndOwnerScript = parent:WaitForChild("BlobmanSeatAndOwnerScript")
	local creatureGrab = blobmanSeatAndOwnerScript:WaitForChild("CreatureGrab")
	local creatureDrop = blobmanSeatAndOwnerScript:WaitForChild("CreatureDrop")
	local rightDetector = parent:WaitForChild("RightDetector")
	local cframe = CFrame.new(20000, 20000, 20000)

	if tbl2.loopKickBlobMode == "TP to Sky" then
		ensureSkyKickFloor()
		local cframe2 = CFrame.new(20000, 20010.5, 20000)

		pcall(function()
			humanoidRootPart.CFrame = cframe2
		end)

		local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")

		if humanoidRootPart2 then
			pcall(function()
				humanoidRootPart2.CFrame = cframe2
			end)
		end

		task.wait(0.2)
		cframe = cframe2
	end

	local cFrame = tbl2.loopKickBlobMode == "TP to Sky" and cframe or humanoidRootPart.CFrame
	local flag = false
	local n = 0
	local n2 = 0

	while tbl2.loopKickBlobActive do
		local v4 = players:FindFirstChild(arg)

		if v4 then
			local character2 = localPlayer.Character
			local humanoid_ = character2 and character2:FindFirstChild("Humanoid")
			local seatPart2 = humanoid_ and humanoid_.SeatPart

			if not (not seatPart2 or seatPart2.Parent.Name ~= "CreatureBlobman") then
				local parent2 = seatPart2.Parent
				humanoidRootPart = parent2:FindFirstChild("HumanoidRootPart") or parent2.PrimaryPart
				local character3 = v4.Character
				local humanoidRootPart2 = character3 and character3:FindFirstChild("HumanoidRootPart")
				local humanoid_2 = character3 and character3:FindFirstChild("Humanoid")

				if humanoidRootPart2 and humanoid_2 and humanoid_2.Health > 0 and humanoidRootPart then
					humanoidRootPart2.Velocity = Vector3.zero

					if not flag then
						humanoidRootPart.CFrame = humanoidRootPart2.CFrame
						humanoidRootPart.Velocity = Vector3.zero

						if tick() - n >= 0.002 then
							n = tick()

							pcall(function()
								humanoid_2.PlatformStand = true
								humanoid_2.Sit = true
								grabEvents.SetNetworkOwner:FireServer(humanoidRootPart2, humanoidRootPart.CFrame)
								grabEvents.DestroyGrabLine:FireServer(humanoidRootPart2)
							end)
						end

						if n2 == 0 then
							n2 = tick()
						end

						if tick() - n2 > 0.35 then
							humanoidRootPart.CFrame = cFrame
							humanoidRootPart.Velocity = Vector3.zero
							flag = true
							n2 = 0
						end
					else
						humanoidRootPart.CFrame = cFrame
						humanoidRootPart.Velocity = Vector3.zero
						local cFrame2 = cFrame * CFrame.new(0, 23, 0)
						humanoidRootPart2.CFrame = cFrame2
						humanoid_2.PlatformStand = true
						humanoid_2.Sit = true

						if tick() - n >= 0.002 then
							n = tick()

							pcall(function()
								grabEvents.SetNetworkOwner:FireServer(humanoidRootPart2, cFrame2)
								grabEvents.DestroyGrabLine:FireServer(humanoidRootPart2)
								local rightWeld = rightDetector:FindFirstChild("RightWeld") or rightDetector:FindFirstChildWhichIsA("Weld")

								if rightWeld then
									creatureDrop:FireServer(rightWeld)
									creatureGrab:FireServer(rightDetector, humanoidRootPart2, rightWeld)
								end
							end)
						end
					end
				else
					flag = false
					n2 = 0
				end

				runService.Heartbeat:Wait()
				continue
			end
		end

		break
	end

	if humanoidRootPart then
		humanoidRootPart.CFrame = cFrame
		humanoidRootPart.Velocity = Vector3.zero
	end

	if tbl2.loopKickBlobMode == "TP to Sky" then
		removeSkyKickFloor()
	end
end

clearVisualConnections = function()
	for _, visualConnection in ipairs(tbl3.visualConnections) do
		visualConnection:Disconnect()
	end

	tbl3.visualConnections = {}
end

local tbl8
tbl8 = { playerLocation = nil, oceanRainbow = nil, shurikenESP = nil }

setupPlayerLocationVisual = function()
	if not tbl2.playerLocationVisualEnabled then
		return
	end
	local str = "PlayerCharacterLocationDetector"
	local CoreGui = game:GetService("CoreGui")
	local currentCamera = workspace.CurrentCamera
	local poophubLocationEsp = CoreGui:FindFirstChild("PoophubLocationEsp")

	if poophubLocationEsp then
		pcall(function()
			poophubLocationEsp:Destroy()
		end)
	end

	local poophubLocationParts = workspace:FindFirstChild("PoophubLocationParts")

	if poophubLocationParts then
		pcall(function()
			poophubLocationParts:Destroy()
		end)
	end

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "PoophubLocationEsp"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.Parent = CoreGui
	local folder = Instance.new("Folder")
	folder.Name = "PoophubLocationParts"
	folder.Parent = workspace
	local tbl9 = {}
	local tbl10 = {}

	createEspForPart = function(arg)
		local frame = Instance.new("Frame")
		frame.Size = UDim2.fromOffset(0, 0)
		frame.AnchorPoint = Vector2.new(0.5, 0.5)
		frame.BackgroundTransparency = 1
		frame.Visible = false
		frame.Parent = screenGui
		local imageLabel = Instance.new("ImageLabel")
		imageLabel.Name = "Glow"
		imageLabel.Image = "rbxassetid://110204605000367"
		imageLabel.ScaleType = Enum.ScaleType.Slice
		imageLabel.SliceCenter = Rect.new(Vector2.new(21, 21), Vector2.new(79, 79))
		imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		imageLabel.Position = UDim2.fromScale(0.5, 0.5)
		imageLabel.Size = UDim2.fromOffset(80, 80)
		imageLabel.ImageTransparency = 0.5
		imageLabel.ResampleMode = Enum.ResamplerMode.Pixelated
		imageLabel.BackgroundTransparency = 1
		imageLabel.BorderSizePixel = 0
		imageLabel.ZIndex = 0
		imageLabel.Visible = false
		imageLabel.Parent = frame
		local canvasGroup = Instance.new("CanvasGroup")
		canvasGroup.Name = "CanvasGroup"
		canvasGroup.Size = UDim2.fromOffset(0, 0)
		canvasGroup.AnchorPoint = Vector2.new(0.5, 0.5)
		canvasGroup.Position = UDim2.fromScale(0.5, 0.5)
		canvasGroup.BackgroundTransparency = 1
		canvasGroup.Parent = frame
		local frame2 = Instance.new("Frame")
		frame2.Name = "CornersContainer"
		frame2.Size = UDim2.fromOffset(0, 0)
		frame2.AnchorPoint = Vector2.new(0.5, 0.5)
		frame2.Position = UDim2.fromScale(0.5, 0.5)
		frame2.BackgroundTransparency = 1
		frame2.Parent = canvasGroup
		local tbl11 = {}
		local tbl12 = { 0, 90, 180, 270 }

		for i = 1, 4 do
			local frame3 = Instance.new("Frame")
			frame3.AnchorPoint = Vector2.new(0.5, 0.5)
			frame3.BackgroundTransparency = 1
			frame3.Size = UDim2.fromOffset(0, 0)
			frame3.Rotation = tbl12[i]
			frame3.Parent = frame2
			local frame4 = Instance.new("Frame", frame3)
			frame4.Name = "Horiz"
			frame4.BorderSizePixel = 0
			frame4.Size = UDim2.fromOffset(0, 0)
			frame4.BackgroundTransparency = 1
			local uiStroke = Instance.new("UIStroke", frame4)
			uiStroke.Name = "OutlineStroke"
			uiStroke.Enabled = false
			local frame5 = Instance.new("Frame", frame3)
			frame5.Name = "Vert"
			frame5.BorderSizePixel = 0
			frame5.Size = UDim2.fromOffset(0, 0)
			frame5.BackgroundTransparency = 1
			local uiStroke2 = Instance.new("UIStroke", frame5)
			uiStroke2.Name = "OutlineStroke"
			uiStroke2.Enabled = false
			local frame6 = Instance.new("Frame", frame3)
			frame6.Name = "Dot"
			frame6.BorderSizePixel = 0
			frame6.Size = UDim2.fromOffset(0, 0)
			frame6.BackgroundTransparency = 1
			table.insert(tbl11, frame3)
		end

		local part_ = Instance.new("Part")
		part_.Name = "PCLD_BoxPart"
		part_.Anchored = true
		part_.CanCollide = false
		part_.CastShadow = false
		part_.CanQuery = false
		part_.CanTouch = false
		part_.Locked = true
		part_.Transparency = 1
		part_.Parent = folder
		local selectionBox = Instance.new("SelectionBox")
		selectionBox.Name = "PCLD_SelectionBox"
		selectionBox.Adornee = part_
		selectionBox.Visible = false
		selectionBox.SurfaceTransparency = 1
		selectionBox.Parent = folder
		local attachment = Instance.new("Attachment", part_)
		local attachment2 = Instance.new("Attachment", part_)
		local trail = Instance.new("Trail", part_)
		trail.Attachment0 = attachment
		trail.Attachment1 = attachment2
		trail.Enabled = false
		trail.FaceCamera = true

		tbl10[arg] = {
			part = arg,
			container = frame,
			cornersContainer = frame2,
			corners = tbl11,
			boxPart = part_,
			selBox = selectionBox,
			trail = trail,
			att0 = attachment,
			att1 = attachment2,
			canvasGroup = canvasGroup,
			glow = imageLabel,
			estimatedCFrame = arg.CFrame,
			rotAngle = 0,
		}
	end

	removeEspForPart = function(arg)
		local v4 = tbl10[arg]

		if v4 then
			pcall(function()
				v4.container:Destroy()
			end)

			pcall(function()
				v4.boxPart:Destroy()
			end)

			pcall(function()
				v4.selBox:Destroy()
			end)

			tbl10[arg] = nil
		end
	end

	addPart = function(arg)
		if not table.find(tbl9, arg) then
			table.insert(tbl9, arg)
			createEspForPart(arg)
		end
	end

	removePart = function(arg)
		local v4 = table.find(tbl9, arg)

		if v4 then
			table.remove(tbl9, v4)
			removeEspForPart(arg)
		end
	end

	for _, descendant in ipairs(workspace:GetDescendants()) do
		if descendant.Name == str and descendant:IsA("BasePart") then
			addPart(descendant)
		end
	end

	local connection = workspace.DescendantAdded:Connect(function(descendant)
		if descendant.Name == str and descendant:IsA("BasePart") then
			addPart(descendant)
		end
	end)

	local connection2 = workspace.DescendantRemoving:Connect(function(descendant)
		if descendant.Name == str and descendant:IsA("BasePart") then
			removePart(descendant)
		end
	end)

	local connection3 = runService.RenderStepped:Connect(function(deltaTime)
		if not tbl2.playerLocationVisualEnabled then
			return
		end
		local now = tick()
		local locationESPColor

		if tbl2.locationESPGradientEnabled then
			locationESPColor = tbl2.locationESPGradientColor1:Lerp(tbl2.locationESPGradientColor2, 0.5 + 0.5 * math.sin(now * tbl2.locationESPGradientSpeed * 3.1415926535897931))
		else
			locationESPColor = tbl2.locationESPColor
		end

		local locationESPUIGradientAngle = tbl2.locationESPUIGradientAngle or 0

		if tbl2.locationESPUIGradientAutoRotate then
			locationESPUIGradientAngle = now * (tbl2.locationESPUIGradientAutoSpeed or 20) * 10 % 360
		end

		for k, v4 in pairs(tbl10) do
			if not k or not k.Parent then
				removePart(k)
			else
				local position = k.Position

				if math.abs(position.X) < 0.01 and math.abs(position.Y) < 0.01 and math.abs(position.Z) < 0.01 then
					v4.container.Visible = false
					v4.boxPart.Transparency = 1
					v4.selBox.Visible = false
				else
					if tbl2.locationESPSmoothingEnabled then
						v4.estimatedCFrame = v4.estimatedCFrame:Lerp(k.CFrame, 1 - math.exp(-tbl2.locationESPSmoothingSpeed * deltaTime))
					else
						v4.estimatedCFrame = k.CFrame
					end

					local locationESPGradientEnabled = tbl2.locationESPGradientEnabled and locationESPColor or tbl2.locationESPPartColor

					if tbl2.locationESPPartEnabled then
						v4.boxPart.CFrame = v4.estimatedCFrame
						v4.boxPart.Size = k.Size
						local v5 = Enum.Material[tbl2.locationESPPartMaterial]

						if v5 then
							v4.boxPart.Material = v5
						end

						v4.boxPart.Color = locationESPGradientEnabled
						v4.boxPart.Transparency = tbl2.locationESPPartTransparency

						if tbl2.locationESPBoxOutlineEnabled then
							v4.selBox.Visible = true
							v4.selBox.Color3 = tbl2.locationESPBoxOutlineColor
							v4.selBox.LineThickness = tbl2.locationESPBoxOutlineThickness
						else
							v4.selBox.Visible = false
						end
					else
						v4.boxPart.Transparency = 1
						v4.selBox.Visible = false
					end

					if tbl2.locationESPTrailEnabled then
						v4.trail.Enabled = true
						v4.trail.Color = ColorSequence.new(tbl2.locationESPTrailColor or Color3.new(1, 1, 1))
						v4.trail.Lifetime = tbl2.locationESPTrailLifetime or 0.5
					else
						v4.trail.Enabled = false
					end

					local v5, v6 = currentCamera:WorldToViewportPoint(v4.estimatedCFrame.Position)

					if v6 then
						v4.container.Visible = true
						v4.container.Position = UDim2.fromOffset(v5.X, v5.Y)

						if tbl2.locationESPCornerEnabled then
							v4.cornersContainer.Visible = true
							v4.rotAngle = (v4.rotAngle + deltaTime * tbl2.locationESPRotationSpeed) % 360
							v4.cornersContainer.Rotation = v4.rotAngle
							local n = tbl2.locationESPMinRadius + (tbl2.locationESPMaxRadius - tbl2.locationESPMinRadius) * (0.5 + 0.5 * math.sin(now * tbl2.locationESPExpandSpeed))
							local locationESPLength = tbl2.locationESPLength
							local n2 = math.min(tbl2.locationESPThickness, locationESPLength)
							v4.corners[1].Position = UDim2.fromOffset(-n, -n)
							v4.corners[2].Position = UDim2.fromOffset(n, -n)
							v4.corners[3].Position = UDim2.fromOffset(n, n)
							v4.corners[4].Position = UDim2.fromOffset(-n, n)
							local n3 = (n + locationESPLength) * 3
							v4.canvasGroup.Size = UDim2.fromOffset(n3, n3)

							for i, corner in ipairs(v4.corners) do
								corner.Size = UDim2.fromOffset(locationESPLength, locationESPLength)
								local rotation = locationESPUIGradientAngle + (i - 1) * 90

								for _, child in ipairs(corner:GetChildren()) do
									if child.Name == "Horiz" then
										child.Position = UDim2.fromOffset(0, 0)
										child.Size = UDim2.fromOffset(locationESPLength, n2)
										child.BackgroundTransparency = 0

										if tbl2.locationESPGradientEnabled then
											child.BackgroundColor3 = Color3.new(1, 1, 1)
											local uiGradient = child:FindFirstChildOfClass("UIGradient") or Instance.new("UIGradient", child)
											local colorSequence = ColorSequence.new
											local tbl11 = {}
											local v7 = ColorSequenceKeypoint.new(0, tbl2.locationESPGradientColor1)
											local v8 = ColorSequenceKeypoint.new(0.5, tbl2.locationESPGradientColor1:Lerp(tbl2.locationESPGradientColor2, 0.5))
											tbl11[1] = v7
											tbl11[2] = v8

											do
												local values = table.pack(ColorSequenceKeypoint.new(1, tbl2.locationESPGradientColor2))
												table.move(values, 1, values.n, 3, tbl11)
											end

											uiGradient.Color = colorSequence(tbl11)
											uiGradient.Rotation = rotation
										else
											child.BackgroundColor3 = locationESPColor
											local uiGradient = child:FindFirstChildOfClass("UIGradient")

											if uiGradient then
												uiGradient:Destroy()
											end
										end
										;(child:FindFirstChildOfClass("UICorner") or Instance.new("UICorner", child)).CornerRadius = UDim.new(0, tbl2.locationESPCornerRoundness or 0)
										local outlineStroke = child:FindFirstChild("OutlineStroke")

										if outlineStroke then
											outlineStroke.Enabled = tbl2.locationESPCornerOutlineEnabled
											outlineStroke.Color = tbl2.locationESPCornerOutlineColor
											outlineStroke.Thickness = tbl2.locationESPCornerOutlineThickness
										end
									elseif child.Name == "Vert" then
										child.Position = UDim2.fromOffset(0, 0)
										child.Size = UDim2.fromOffset(n2, locationESPLength)
										child.BackgroundTransparency = 0

										if tbl2.locationESPGradientEnabled then
											child.BackgroundColor3 = Color3.new(1, 1, 1)
											local uiGradient = child:FindFirstChildOfClass("UIGradient") or Instance.new("UIGradient", child)
											local colorSequence = ColorSequence.new
											local tbl11 = {}
											local v7 = ColorSequenceKeypoint.new(0, tbl2.locationESPGradientColor1)
											local v8 = ColorSequenceKeypoint.new(0.5, tbl2.locationESPGradientColor1:Lerp(tbl2.locationESPGradientColor2, 0.5))
											local new = ColorSequenceKeypoint.new
											local locationESPGradientColor2 = tbl2.locationESPGradientColor2
											tbl11[1] = v7
											tbl11[2] = v8

											do
												local values = table.pack(new(1, locationESPGradientColor2))
												table.move(values, 1, values.n, 3, tbl11)
											end

											uiGradient.Color = colorSequence(tbl11)
											uiGradient.Rotation = rotation + 90
										else
											child.BackgroundColor3 = locationESPColor
											local uiGradient = child:FindFirstChildOfClass("UIGradient")

											if uiGradient then
												uiGradient:Destroy()
											end
										end
										;(child:FindFirstChildOfClass("UICorner") or Instance.new("UICorner", child)).CornerRadius = UDim.new(0, tbl2.locationESPCornerRoundness or 0)
										local outlineStroke = child:FindFirstChild("OutlineStroke")

										if outlineStroke then
											outlineStroke.Enabled = tbl2.locationESPCornerOutlineEnabled
											outlineStroke.Color = tbl2.locationESPCornerOutlineColor
											outlineStroke.Thickness = tbl2.locationESPCornerOutlineThickness
										end
									elseif child.Name == "Dot" then
										child.Visible = false
									end
								end
							end
						else
							v4.cornersContainer.Visible = false
						end

						if tbl2.locationESPGlowEnabled then
							v4.glow.Visible = true
							local n = breath * 2 + (tbl2.locationESPGlowSize or 20)
							v4.glow.Size = UDim2.fromOffset(n, n)

							if tbl2.locationESPGradientEnabled then
								v4.glow.ImageColor3 = (tbl2.locationESPGlowColor1 or tbl2.locationESPGradientColor1):Lerp(tbl2.locationESPGlowColor2 or tbl2.locationESPGradientColor2, 0.5 + 0.5 * math.sin(now * tbl2.locationESPGradientSpeed * 3.1415926535897931))
								v4.glow.ImageTransparency = tbl2.locationESPGlowTransparency or 0.5
								local uiGradient = v4.glow:FindFirstChildOfClass("UIGradient")

								if uiGradient then
									uiGradient:Destroy()
								end
							else
								v4.glow.ImageColor3 = tbl2.locationESPGlowColor1 or Color3.new(1, 1, 1)
								v4.glow.ImageTransparency = tbl2.locationESPGlowTransparency or 0.5
							end
						else
							v4.glow.Visible = false
						end
					else
						v4.container.Visible = false
					end
				end
			end
		end
	end)

	table.insert(tbl3.visualConnections, connection3)
	table.insert(tbl3.visualConnections, connection)
	table.insert(tbl3.visualConnections, connection2)

	return function()
		connection:Disconnect()
		connection2:Disconnect()

		pcall(function()
			screenGui:Destroy()
		end)

		pcall(function()
			folder:Destroy()
		end)

		for _, v4 in pairs(tbl10) do
			pcall(function()
				v4.container:Destroy()
			end)

			pcall(function()
				v4.boxPart:Destroy()
			end)

			pcall(function()
				v4.selBox:Destroy()
			end)
		end

		table.clear(tbl10)
		table.clear(tbl9)
	end
end

setupOceanRainbow = function()
	if not tbl2.oceanRainbowEnabled then
		return
	end
	local map = workspace_:FindFirstChild("Map")
	local alwaysHereTweenedObjects = map and map:FindFirstChild("AlwaysHereTweenedObjects")
	alwaysHereTweenedObjects = alwaysHereTweenedObjects and alwaysHereTweenedObjects:FindFirstChild("Ocean")
	if not alwaysHereTweenedObjects then
		return function()
		end
	end
	local tbl9 = {}
	tbl3.rainbowParts = {}

	for _, descendant in ipairs(alwaysHereTweenedObjects:GetDescendants()) do
		if descendant:IsA("BasePart") then
			table.insert(tbl3.rainbowParts, descendant)
			tbl9[descendant] = descendant.Color
		end
	end

	local connection = alwaysHereTweenedObjects.DescendantAdded:Connect(function(descendant)
		if descendant:IsA("BasePart") and tbl2.oceanRainbowEnabled then
			table.insert(tbl3.rainbowParts, descendant)
			tbl9[descendant] = descendant.Color
		end
	end)

	table.insert(tbl3.visualConnections, connection)
	local n = 0

	local connection2 = runService.Heartbeat:Connect(function(deltaTime)
		if not tbl2.oceanRainbowEnabled then
			return
		end
		n = (n + deltaTime * 0.12) % 1
		local color = Color3.fromHSV(n, 1, 1)

		for _, rainbowPart in ipairs(tbl3.rainbowParts) do
			if rainbowPart and rainbowPart.Parent then
				rainbowPart.Color = color
			end
		end
	end)

	table.insert(tbl3.visualConnections, connection2)

	return function()
		for k, v4 in pairs(tbl9) do
			if k and k.Parent then
				k.Color = v4
			end
		end

		tbl3.rainbowParts = {}
	end
end

setupToyESPs = function()
	if not tbl2.shurikenESPEnabled and not tbl2.blobmanESPEnabled then
		return
	end

	if not tbl3.shurikenESPs then
		tbl3.shurikenESPs = {}
	end

	if not tbl3.blobmanESPs then
		tbl3.blobmanESPs = {}
	end

	addESPToPart = function(adornee, arg)
		if adornee:FindFirstChild("ToyESPBox") then
			return nil
		end
		local boxHandleAdornment = Instance.new("BoxHandleAdornment")
		boxHandleAdornment.Name = "ToyESPBox"
		boxHandleAdornment.Adornee = adornee
		boxHandleAdornment.Size = adornee.Size
		boxHandleAdornment.AlwaysOnTop = true
		boxHandleAdornment.ZIndex = 10
		boxHandleAdornment.Transparency = arg and (tbl2.blobmanESPTransparency or 0.3) or tbl2.shurikenESPTransparency or 0.3
		boxHandleAdornment.Color3 = arg and (tbl2.blobmanESPSolidColor or Color3.new(0, 1, 0)) or tbl2.shurikenESPSolidColor or Color3.new(1, 0, 0)
		boxHandleAdornment.Parent = adornee
		return boxHandleAdornment
	end

	createESPForToy = function(arg, arg2)
		local blobmanESPs = arg2 and tbl3.blobmanESPs or tbl3.shurikenESPs
		if blobmanESPs[arg] then
			return
		end
		local tbl9 = {}

		for _, descendant in ipairs(arg:GetDescendants()) do
			if descendant:IsA("BasePart") then
				local v4 = addESPToPart(descendant, arg2)

				if v4 then
					table.insert(tbl9, v4)
				end
			end
		end

		if #tbl9 > 0 then
			blobmanESPs[arg] = tbl9
		end
	end

	removeESPFromToy = function(arg, arg2)
		local blobmanESPs = arg2 and tbl3.blobmanESPs or tbl3.shurikenESPs
		if not blobmanESPs[arg] then
			return
		end

		for _, v4 in ipairs(blobmanESPs[arg]) do
			if v4 then
				v4:Destroy()
			end
		end

		blobmanESPs[arg] = nil
	end

	findAndESPTos = function()
		local tbl9 = {}
		local tbl10 = {}

		scanFolder = function(arg)
			for _, child in ipairs(arg:GetChildren()) do
				if child:IsA("Model") then
					if (child.Name == "AntiKick" or child.Name == "Shuriken" or child.Name == "ToyShuriken") and tbl2.shurikenESPEnabled then
						tbl9[child] = true
						createESPForToy(child, false)
					elseif child.Name == "CreatureBlobman" and tbl2.blobmanESPEnabled then
						tbl10[child] = true
						createESPForToy(child, true)
					end
				end
			end
		end

		for _, player in ipairs(players:GetPlayers()) do
			local v4 = workspace_:FindFirstChild(player.Name .. "SpawnedInToys")

			if v4 then
				scanFolder(v4)
			end
		end

		local plotItems = workspace_:FindFirstChild("PlotItems")

		if plotItems then
			for _, child in ipairs(plotItems:GetChildren()) do
				for _, descendant in ipairs(child:GetDescendants()) do
					if descendant:IsA("Model") then
						if (descendant.Name == "AntiKick" or descendant.Name == "Shuriken" or descendant.Name == "ToyShuriken") and tbl2.shurikenESPEnabled then
							tbl9[descendant] = true
							createESPForToy(descendant, false)
						elseif descendant.Name == "CreatureBlobman" and tbl2.blobmanESPEnabled then
							tbl10[descendant] = true
							createESPForToy(descendant, true)
						end
					end
				end
			end
		end

		for k in pairs(tbl3.shurikenESPs) do
			if not tbl9[k] or not k.Parent then
				removeESPFromToy(k, false)
			end
		end

		for k in pairs(tbl3.blobmanESPs) do
			if not tbl10[k] or not k.Parent then
				removeESPFromToy(k, true)
			end
		end
	end

	local connection = runService.Heartbeat:Connect(function()
		if tbl2.shurikenESPEnabled or tbl2.blobmanESPEnabled then
			findAndESPTos()
		end
	end)

	table.insert(tbl3.visualConnections, connection)
	local n = 0

	local connection2 = runService.RenderStepped:Connect(function(deltaTime)
		n = (n + deltaTime * 60 * (tbl2.rainbowSpeedESP or 2)) % 360
		local color = Color3.fromHSV(n / 360, 1, 1)

		if tbl2.shurikenESPEnabled then
			local shurikenESPSolidColor = tbl2.shurikenESPColorMode == "Rainbow" and color or tbl2.shurikenESPSolidColor
			local shurikenESPTransparency = tbl2.shurikenESPTransparency or 0.3

			for _, shurikenESP in pairs(tbl3.shurikenESPs) do
				for _, v4 in ipairs(shurikenESP) do
					if v4 and v4.Parent then
						v4.Color3 = shurikenESPSolidColor
						v4.Transparency = shurikenESPTransparency
					end
				end
			end
		end

		if tbl2.blobmanESPEnabled then
			color = tbl2.blobmanESPColorMode == "Rainbow" and color or tbl2.blobmanESPSolidColor
			local blobmanESPTransparency = tbl2.blobmanESPTransparency or 0.3

			for _, blobmanESP in pairs(tbl3.blobmanESPs) do
				for _, v4 in ipairs(blobmanESP) do
					if v4 and v4.Parent then
						v4.Color3 = color
						v4.Transparency = blobmanESPTransparency
					end
				end
			end
		end
	end)

	table.insert(tbl3.visualConnections, connection2)

	return function()
		local v4 = pairs
		local shurikenESPs = tbl3.shurikenESPs or {}

		for k in v4(shurikenESPs) do
			removeESPFromToy(k, false)
		end

		local v5 = pairs
		local blobmanESPs = tbl3.blobmanESPs or {}

		for k in v5(blobmanESPs) do
			removeESPFromToy(k, true)
		end

		tbl3.shurikenESPs = {}
		tbl3.blobmanESPs = {}
	end
end

resetLook = function()
	pcall(function()
		look:FireServer(CFrame.new(0, 1, 0, -1, 8.44439185e-08, -2.26266827e-08, -1.04250613e-15, 0.258819073, 0.965925813, 8.74227766e-08, 0.965925813, -0.258819073), CFrame.new(0, 0, 0, -1, 8.74227766e-08, 0, -1.04250613e-15, -1.19248806e-08, 1, 8.74227766e-08, 1, 1.19248806e-08), CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0), "high")
	end)
end

local connection
connection = nil
local connection2
connection2 = nil
Fun = {}
Fun.Players = game:GetService("Players")
Fun.RunService = game:GetService("RunService")
Fun.ReplicatedStorage = game:GetService("ReplicatedStorage")
Fun.TweenService = game:GetService("TweenService")
Fun.UserInputService = game:GetService("UserInputService")
Fun.me = Fun.Players.LocalPlayer
Fun.camera = workspace.CurrentCamera
Fun.CharacterEvents = Fun.ReplicatedStorage:WaitForChild("CharacterEvents")
Fun.RagdollRemote = Fun.CharacterEvents:WaitForChild("RagdollRemote")
Fun.poseConnection = nil
Fun.activeMode = "off"
Fun.selectedDance = "Floss Dance"

Fun.danceNames = {
	"Floss Dance",
	"Ouen Dance",
	"Head Ball",
	"Cartoon",
	"Kawaii",
	"Cool",
	"Spider",
	"Robot Lock",
	"Disco Point",
	"Wave Ripple",
	"Jazz Hands",
	"Headbang",
	"Shoulder Shimmy",
	"Boxer Bounce",
	"Salsa Hip",
	"Cheer Jump",
	"Propeller Arms",
	"Matrix Lean",
	"Victory Pump",
	"Ninja Flow",
	"Superhero Pose",
	"Snake Wave",
	"Staircase Step",
	"Windmill Arms",
	"Popcorn Pop",
	"Clap Along",
	"Zombie Shuffle",
	"Koshi huri",
	"Head dribble",
	"Angry",
	"soccer",
	"Head orbit",
	"Lol",
}

Fun.stopPose = function()
	if Fun.poseConnection then
		Fun.poseConnection:Disconnect()
		Fun.poseConnection = nil
	end

	Fun.activeMode = "off"
end

Fun.startRagdollOnly = function(arg)
	Fun.stopPose()
	rootPart = arg:WaitForChild("HumanoidRootPart")
	Fun.RagdollRemote:FireServer(rootPart, 9999999)

	offsets = {
		Torso = CFrame.new(0, 0, 0),
		Head = CFrame.new(0, 1.5, 0),
		["Left Arm"] = CFrame.new(-1.5, 0, 0),
		["Right Arm"] = CFrame.new(1.5, 0, 0),
		["Left Leg"] = CFrame.new(-0.5, -2, 0),
		["Right Leg"] = CFrame.new(0.5, -2, 0),
	}

	Fun.activeMode = "ragdoll"

	Fun.poseConnection = Fun.RunService.Heartbeat:Connect(function()
		if not arg or not arg.Parent or not rootPart or not rootPart.Parent then
			Fun.stopPose()
			return
		end
		cameraLook = Fun.camera.CFrame.LookVector
		yawAngle = math.atan2(-cameraLook.X, -cameraLook.Z)
		targetCFrame = CFrame.new(rootPart.Position) * CFrame.Angles(0, yawAngle, 0)

		for k, v4 in pairs(offsets) do
			part = arg:FindFirstChild(k)

			if part and part:IsA("BasePart") then
				part.CFrame = targetCFrame * v4
				part.AssemblyLinearVelocity = rootPart.AssemblyLinearVelocity
			end
		end
	end)
end

Fun.startFlossDance = function(arg)
	Fun.stopPose()
	rootPart = arg:WaitForChild("HumanoidRootPart")
	humanoid = arg:WaitForChild("Humanoid")
	Fun.RagdollRemote:FireServer(rootPart, 9999999)
	movePosition = rootPart.Position
	walkSpeed = humanoid.WalkSpeed > 0 and humanoid.WalkSpeed or 16
	teleportThreshold = 8
	Fun.activeMode = "dance"

	Fun.poseConnection = Fun.RunService.Heartbeat:Connect(function(deltaTime)
		if not arg or not arg.Parent or not rootPart or not rootPart.Parent then
			Fun.stopPose()
			return
		end
		t = tick()
		cameraLook = Fun.camera.CFrame.LookVector
		yawAngle = math.atan2(-cameraLook.X, -cameraLook.Z)
		actualPosition = rootPart.Position

		if (actualPosition - movePosition).Magnitude > teleportThreshold then
			movePosition = actualPosition
		end

		moveDir = humanoid.MoveDirection

		if moveDir.Magnitude > 0.01 then
			movePosition = movePosition + moveDir * walkSpeed * deltaTime
		end

		targetCFrame = CFrame.new(movePosition) * CFrame.Angles(0, yawAngle, 0)
		rootPart.CFrame = targetCFrame
		speed = 10
		phase = t * speed
		armSideAmp = 0.95993108859688125
		armSideAngle = armSideAmp * math.sin(phase)
		crossAmp = 0.9
		leftArmZ = crossAmp * math.cos(phase)
		rightArmZ = -crossAmp * math.cos(phase)
		hipAmp = 0.3490658503988659
		hipTwist = -hipAmp * math.sin(phase)
		torsoTwistAmp = 0.24434609527920614
		torsoTwist = -torsoTwistAmp * math.sin(phase)
		kneeBounceAmp = 0.12
		kneeBounce = kneeBounceAmp * math.abs(math.sin(phase * 2))
		legSpread = 100
		armHalfHeight = 1

		offsets = {
			Torso = CFrame.new(0, -kneeBounce, 0) * CFrame.Angles(0, torsoTwist, 0),
			Head = CFrame.new(0, 1.5 - kneeBounce, 0),
			["Left Arm"] = CFrame.new(-1.5, 1 - kneeBounce, leftArmZ) * CFrame.Angles(0, 0, armSideAngle) * CFrame.new(0, -armHalfHeight, 0),
			["Right Arm"] = CFrame.new(1.5, 1 - kneeBounce, rightArmZ) * CFrame.Angles(0, 0, armSideAngle) * CFrame.new(0, -armHalfHeight, 0),
			["Left Leg"] = CFrame.new(-legSpread, -2 + kneeBounce * 0.5, 0) * CFrame.Angles(0, hipTwist * 0.4, 0),
			["Right Leg"] = CFrame.new(legSpread, -2 + kneeBounce * 0.5, 0) * CFrame.Angles(0, hipTwist * 0.4, 0),
		}

		for k, v4 in pairs(offsets) do
			part = arg:FindFirstChild(k)

			if part and part:IsA("BasePart") then
				part.CFrame = targetCFrame * v4
				part.AssemblyLinearVelocity = Vector3.zero
			end
		end
	end)
end

Fun.startOrangeJustice = function(arg)
	Fun.stopPose()
	rootPart = arg:WaitForChild("HumanoidRootPart")
	humanoid = arg:WaitForChild("Humanoid")
	Fun.RagdollRemote:FireServer(rootPart, 9999999)
	movePosition = rootPart.Position
	walkSpeed = humanoid.WalkSpeed > 0 and humanoid.WalkSpeed or 16
	teleportThreshold = 8
	Fun.activeMode = "dance"

	Fun.poseConnection = Fun.RunService.Heartbeat:Connect(function(deltaTime)
		if not arg or not arg.Parent or not rootPart or not rootPart.Parent then
			Fun.stopPose()
			return
		end
		t = tick()
		cameraLook = Fun.camera.CFrame.LookVector
		yawAngle = math.atan2(-cameraLook.X, -cameraLook.Z)
		actualPosition = rootPart.Position

		if teleportThreshold < (actualPosition - movePosition).Magnitude then
			movePosition = actualPosition
		end

		moveDir = humanoid.MoveDirection

		if moveDir.Magnitude > 0.01 then
			movePosition = movePosition + moveDir * walkSpeed * deltaTime
		end

		targetCFrame = CFrame.new(movePosition) * CFrame.Angles(0, yawAngle, 0)
		rootPart.CFrame = targetCFrame
		speed = 8
		phase = t * speed
		armAngle = 0.78539816339744828 * math.sin(phase * 2)
		armUp = math.sin(phase * 2) * 1.5
		legLift = math.sin(phase) * 0.8
		jumpBounce = math.abs(math.sin(phase * 2)) * 0.3

		offsets = {
			Torso = CFrame.new(0, jumpBounce, 0),
			Head = CFrame.new(0, 1.5, 0),
			["Left Arm"] = CFrame.new(-1.5, 1 + armUp, 0) * CFrame.Angles(armAngle, 0, 0),
			["Right Arm"] = CFrame.new(1.5, 1 - armUp, 0) * CFrame.Angles(-armAngle, 0, 0),
			["Left Leg"] = CFrame.new(-0.5, -2 + legLift, 0),
			["Right Leg"] = CFrame.new(0.5, -2 - legLift, 0),
		}

		for k, v4 in pairs(offsets) do
			part = arg:FindFirstChild(k)

			if part and part:IsA("BasePart") then
				part.CFrame = targetCFrame * v4
				part.AssemblyLinearVelocity = Vector3.zero
			end
		end
	end)
end

Fun.isThrowing = false
Fun.throwProgress = 0
Fun.headStartPos = nil

Fun.startHeadThrow = function(arg)
	Fun.stopPose()
	rootPart = arg:WaitForChild("HumanoidRootPart")
	humanoid = arg:WaitForChild("Humanoid")
	head = arg:FindFirstChild("Head")
	Fun.RagdollRemote:FireServer(rootPart, 9999999)
	movePosition = rootPart.Position
	walkSpeed = humanoid.WalkSpeed > 0 and humanoid.WalkSpeed or 16
	teleportThreshold = 8
	Fun.isThrowing = false
	Fun.throwProgress = 0
	Fun.headStartPos = nil
	Fun.activeMode = "dance"

	Fun.poseConnection = Fun.RunService.Heartbeat:Connect(function(deltaTime)
		if not arg or not arg.Parent or not rootPart or not rootPart.Parent then
			Fun.stopPose()
			return
		end
		cameraLook = Fun.camera.CFrame.LookVector
		yawAngle = math.atan2(-cameraLook.X, -cameraLook.Z)
		actualPosition = rootPart.Position

		if teleportThreshold < (actualPosition - movePosition).Magnitude then
			movePosition = actualPosition
		end

		moveDir = humanoid.MoveDirection

		if moveDir.Magnitude > 0.01 then
			movePosition = movePosition + moveDir * walkSpeed * deltaTime
		end

		targetCFrame = CFrame.new(movePosition) * CFrame.Angles(0, yawAngle, 0)
		rootPart.CFrame = targetCFrame
		speed = 1.5

		if not Fun.isThrowing then
			Fun.throwProgress = Fun.throwProgress + deltaTime * speed

			if Fun.throwProgress >= 1 then
				Fun.isThrowing = true
				Fun.throwProgress = 0

				if head then
					Fun.headStartPos = head.Position
				end
			end
		else
			Fun.throwProgress = Fun.throwProgress + deltaTime * 4

			if Fun.throwProgress >= 1 then
				Fun.isThrowing = false
				Fun.throwProgress = 0

				if head then
					head.CFrame = targetCFrame * CFrame.new(0, 1.5, 0)
					head.AssemblyLinearVelocity = Vector3.zero
				end
			end
		end

		armAngle = 0
		armPosition = 0
		headOffset = 0
		bodyLean = 0

		if not Fun.isThrowing then
			smooth = Fun.throwProgress * Fun.throwProgress * (3 - 2 * Fun.throwProgress)
			armAngle = -2.0943951023931953 * smooth
			armPosition = smooth * 0.8
			headOffset = smooth * 0.5
			bodyLean = 0.26179938779914941 * smooth
		else
			smooth = Fun.throwProgress * Fun.throwProgress * (3 - 2 * Fun.throwProgress)
			armAngle = -2.0943951023931953 + 3.1415926535897931 * smooth
			armPosition = 0.8 - smooth * 1.5
			headOffset = 0.5
			bodyLean = 0.26179938779914941 - 0.52359877559829882 * smooth
		end

		offsets = {
			Torso = CFrame.new(0, 0, 0) * CFrame.Angles(bodyLean, 0, 0),
			Head = CFrame.new(0, 1.5 + headOffset, 0),
			["Left Arm"] = CFrame.new(-1.5, 1, 0) * CFrame.Angles(armAngle, 0, 0.17453292519943295) * CFrame.new(0, -1 + armPosition, 0),
			["Right Arm"] = CFrame.new(1.5, 1, 0) * CFrame.Angles(armAngle, 0, -0.17453292519943295) * CFrame.new(0, -1 + armPosition, 0),
			["Left Leg"] = CFrame.new(-0.5, -2, 0),
			["Right Leg"] = CFrame.new(0.5, -2, 0),
		}

		for k, v4 in pairs(offsets) do
			part = arg:FindFirstChild(k)

			if part and part:IsA("BasePart") and part ~= head then
				part.CFrame = targetCFrame * v4
				part.AssemblyLinearVelocity = Vector3.zero
			end
		end

		if head and Fun.isThrowing then
			startPos = Fun.headStartPos or (targetCFrame * CFrame.new(0, 1.5, 0)).Position
			throwDir = targetCFrame.LookVector * 200
			targetPos = startPos + throwDir * Fun.throwProgress * Fun.throwProgress
			head.CFrame = CFrame.new(targetPos)
			head.AssemblyLinearVelocity = Vector3.zero
		end
	end)
end

Fun.startCartoon = function(arg)
	Fun.stopPose()
	rootPart = arg:WaitForChild("HumanoidRootPart")
	humanoid = arg:WaitForChild("Humanoid")
	Fun.RagdollRemote:FireServer(rootPart, 9999999)
	movePosition = rootPart.Position
	walkSpeed = humanoid.WalkSpeed > 0 and humanoid.WalkSpeed or 16
	teleportThreshold = 8
	Fun.activeMode = "dance"

	Fun.poseConnection = Fun.RunService.Heartbeat:Connect(function(deltaTime)
		if not arg or not arg.Parent or not rootPart or not rootPart.Parent then
			Fun.stopPose()
			return
		end
		t = tick()
		cameraLook = Fun.camera.CFrame.LookVector
		yawAngle = math.atan2(-cameraLook.X, -cameraLook.Z)
		actualPosition = rootPart.Position

		if teleportThreshold < (actualPosition - movePosition).Magnitude then
			movePosition = actualPosition
		end

		moveDir = humanoid.MoveDirection

		if moveDir.Magnitude > 0.01 then
			movePosition = movePosition + moveDir * walkSpeed * deltaTime
		end

		targetCFrame = CFrame.new(movePosition) * CFrame.Angles(0, yawAngle, 0)
		rootPart.CFrame = targetCFrame
		speed = 8
		phase = t * speed
		jumpHeight = math.abs(math.sin(phase)) * 1.2
		legLift = math.sin(phase) * 1.8
		legLift2 = math.sin(phase + 3.1415926535897931) * 1.8
		armCircle = math.sin(phase) * 2.5
		armCircle2 = math.sin(phase + 3.1415926535897931) * 2.5
		armFlap = math.sin(phase * 1.5) * 1.5
		bodyTwist = math.sin(phase * 2) * 0.8
		headWobble = math.sin(phase * 2) * 0.3
		local cframe = CFrame.Angles
		local n = -2 + jumpHeight * 0.6
		local rad = math.rad

		offsets = {
			Torso = CFrame.new(math.sin(phase) * 0.1, n, 0) * cframe(0, math.rad(bodyTwist * 40), rad(math.sin(phase * 2) * 15)),
			Head = CFrame.new(headWobble * 0.2, 1.5 + jumpHeight + math.sin(phase * 2) * 0.1, 0) * cframe(math.rad(math.sin(phase * 1.5) * 20), 0, math.rad(headWobble * 30)),
			["Left Arm"] = CFrame.new(-1.5 + math.sin(phase) * 0.3, 1 + jumpHeight * 0.5 + math.sin(phase * 2) * 0.2, math.sin(phase) * 0.5) * cframe(n, math.rad(math.sin(phase * 1.5) * 30), math.rad(armFlap * 40)) * CFrame.new(0, -0.5, 0),
			["Right Arm"] = CFrame.new(1.5 + math.sin(phase + 3.1415926535897931) * 0.3, 1 + jumpHeight * 0.5 + math.sin(phase * 2 + 3.1415926535897931) * 0.2, math.sin(phase + 3.1415926535897931) * 0.5) * cframe(n, math.rad(math.sin(phase * 1.5 + 3.1415926535897931) * 30), math.rad(-armFlap * 40)) * CFrame.new(0, -0.5, 0),
			["Left Leg"] = CFrame.new(-0.3 + math.sin(phase) * 0.1, n, math.sin(phase) * 0.3) * CFrame.Angles(-1.0471975511965976 + legLift * 0.8, 0, math.rad(legLift * 30)),
			["Right Leg"] = CFrame.new(0.3 + math.sin(phase + 3.1415926535897931) * 0.1, n, math.sin(phase + 3.1415926535897931) * 0.3) * CFrame.Angles(-1.0471975511965976 + legLift2 * 0.8, 0, math.rad(-legLift2 * 30)),
		}

		for k, v4 in pairs(offsets) do
			part = arg:FindFirstChild(k)

			if part and part:IsA("BasePart") then
				part.CFrame = targetCFrame * v4
				part.AssemblyLinearVelocity = Vector3.zero
			end
		end
	end)
end

Fun.startKawaii = function(arg)
	Fun.stopPose()
	rootPart = arg:WaitForChild("HumanoidRootPart")
	humanoid = arg:WaitForChild("Humanoid")
	Fun.RagdollRemote:FireServer(rootPart, 9999999)
	movePosition = rootPart.Position
	walkSpeed = humanoid.WalkSpeed > 0 and humanoid.WalkSpeed or 16
	teleportThreshold = 8
	Fun.activeMode = "dance"

	Fun.poseConnection = Fun.RunService.Heartbeat:Connect(function(deltaTime)
		if not arg or not arg.Parent or not rootPart or not rootPart.Parent then
			Fun.stopPose()
			return
		end
		t = tick()
		cameraLook = Fun.camera.CFrame.LookVector
		yawAngle = math.atan2(-cameraLook.X, -cameraLook.Z)
		actualPosition = rootPart.Position

		if (actualPosition - movePosition).Magnitude > teleportThreshold then
			movePosition = actualPosition
		end

		moveDir = humanoid.MoveDirection

		if moveDir.Magnitude > 0.01 then
			movePosition = movePosition + moveDir * walkSpeed * deltaTime
		end

		targetCFrame = CFrame.new(movePosition) * CFrame.Angles(0, yawAngle, 0)
		rootPart.CFrame = targetCFrame
		speed = 5
		phase = t * speed
		bounce = math.abs(math.sin(phase)) * 0.15
		sway = math.sin(phase * 1.5) * 0.3
		armFold = 0.5 + math.sin(phase * 1.5) * 0.1
		armFold2 = 0.5 + math.sin(phase * 1.5 + 3.1415926535897931) * 0.1
		armForward = 0.3 + math.abs(math.sin(phase * 1.5)) * 0.2
		headTilt = math.sin(phase * 1.5) * 5
		legIn = 0.1
		local n = -headTilt * 1.5
		local cframe = CFrame.Angles
		local rad = math.rad

		offsets = {
			Torso = CFrame.new(sway * 0.1, bounce, 0) * CFrame.Angles(0, 0, math.rad(sway * 15)),
			Head = CFrame.new(0, 1.5 + bounce, 0) * cframe(math.rad(headTilt), 0, rad(n)),
			["Left Arm"] = CFrame.new(-1.2, 1 + bounce * 0.5, armForward) * cframe(math.rad(-30 - armFold * 20), 0.26179938779914941, 0.3490658503988659) * CFrame.new(0, -0.3, 0),
			["Right Arm"] = CFrame.new(1.2, 1 + bounce * 0.5, armForward) * cframe(math.rad(-30 - armFold2 * 20), -0.26179938779914941, -0.3490658503988659) * CFrame.new(0, -0.3, 0),
			["Left Leg"] = CFrame.new(-0.3 + legIn, -2 + bounce * 0.5, 0) * CFrame.Angles(-0.087266462599716474, 0.087266462599716474, 0.13962634015954636),
			["Right Leg"] = CFrame.new(0.3 - legIn, -2 + bounce * 0.5, 0) * CFrame.Angles(-0.087266462599716474, -0.087266462599716474, -0.13962634015954636),
		}

		for k, v4 in pairs(offsets) do
			part = arg:FindFirstChild(k)

			if part and part:IsA("BasePart") then
				part.CFrame = targetCFrame * v4
				part.AssemblyLinearVelocity = Vector3.zero
				part.AssemblyAngularVelocity = Vector3.zero
			end
		end
	end)
end

Fun.startCool = function(arg)
	Fun.stopPose()
	rootPart = arg:WaitForChild("HumanoidRootPart")
	humanoid = arg:WaitForChild("Humanoid")
	Fun.RagdollRemote:FireServer(rootPart, 9999999)
	movePosition = rootPart.Position
	walkSpeed = humanoid.WalkSpeed > 0 and humanoid.WalkSpeed or 16
	teleportThreshold = 8
	Fun.activeMode = "dance"

	Fun.poseConnection = Fun.RunService.Heartbeat:Connect(function(deltaTime)
		if not arg or not arg.Parent or not rootPart or not rootPart.Parent then
			Fun.stopPose()
			return
		end
		cameraLook = Fun.camera.CFrame.LookVector
		yawAngle = math.atan2(-cameraLook.X, -cameraLook.Z)
		actualPosition = rootPart.Position

		if teleportThreshold < (actualPosition - movePosition).Magnitude then
			movePosition = actualPosition
		end

		moveDir = humanoid.MoveDirection

		if moveDir.Magnitude > 0.01 then
			movePosition = movePosition + moveDir * walkSpeed * deltaTime
		end

		targetCFrame = CFrame.new(movePosition) * CFrame.Angles(0, yawAngle, 0)
		rootPart.CFrame = targetCFrame

		offsets = {
			Torso = CFrame.new(0, 0, 0),
			Head = CFrame.new(0, 1.5, 0),
			["Left Arm"] = CFrame.new(-0.2, -0.5, -2) * CFrame.Angles(-1.3962634015954636, -0.17453292519943295, 0.17453292519943295) * CFrame.new(0, -0.8, 0),
			["Left Leg"] = CFrame.new(-0.5, -2, 0),
			["Right Leg"] = CFrame.new(0.5, -2, 0),
		}

		for k, v4 in pairs(offsets) do
			part = arg:FindFirstChild(k)

			if part and part:IsA("BasePart") then
				part.CFrame = targetCFrame * v4
				part.AssemblyLinearVelocity = Vector3.zero
				part.AssemblyAngularVelocity = Vector3.zero
			end
		end
	end)
end

Fun.startSpider = function(arg)
	Fun.stopPose()
	rootPart = arg:WaitForChild("HumanoidRootPart")
	humanoid = arg:WaitForChild("Humanoid")
	Fun.RagdollRemote:FireServer(rootPart, 9999999)
	movePosition = rootPart.Position
	walkSpeed = humanoid.WalkSpeed > 0 and humanoid.WalkSpeed or 16
	teleportThreshold = 8
	stepCycle = 0
	Fun.activeMode = "dance"

	Fun.poseConnection = Fun.RunService.Heartbeat:Connect(function(deltaTime)
		if not arg or not arg.Parent or not rootPart or not rootPart.Parent then
			Fun.stopPose()
			return
		end
		cameraLook = Fun.camera.CFrame.LookVector
		yawAngle = math.atan2(-cameraLook.X, -cameraLook.Z)
		actualPosition = rootPart.Position

		if (actualPosition - movePosition).Magnitude > teleportThreshold then
			movePosition = actualPosition
		end

		moveDir = humanoid.MoveDirection
		isMoving = moveDir.Magnitude > 0.01

		if isMoving then
			movePosition = movePosition + moveDir * walkSpeed * deltaTime
			stepCycle = stepCycle + deltaTime * walkSpeed * 0.5
		else
			stepCycle = stepCycle + deltaTime * 2
		end

		targetCFrame = CFrame.new(movePosition) * CFrame.Angles(0, yawAngle, 0)
		rootPart.CFrame = targetCFrame
		phase = stepCycle
		stepSmooth = math.sin(phase)
		stepSmooth2 = math.sin(phase + 3.1415926535897931)
		footLift = math.max(0, math.sin(phase)) * 0.6
		footLift2 = math.max(0, math.sin(phase + 3.1415926535897931)) * 0.6
		legForward = math.sin(phase) * 0.5
		legForward2 = math.sin(phase + 3.1415926535897931) * 0.5
		armForward = math.sin(phase + 3.1415926535897931) * 0.5
		armForward2 = math.sin(phase) * 0.5
		bodySway = math.sin(phase * 2) * 0.03
		bodyBounce = math.abs(math.sin(phase * 2)) * 0.08
		headBob = math.sin(phase * 2) * 0.02
		legSpread = 0.35
		armSpread = 0.5
		local cframe = CFrame.Angles
		local n = -0.52359877559829882 + stepSmooth * 0.5
		local rad = math.rad

		offsets = {
			Torso = CFrame.new(bodySway, -0.6 + bodyBounce, 0) * CFrame.Angles(1.4835298641951802, 0, math.rad(bodySway * 20)),
			Head = CFrame.new(0, 0.6 - bodyBounce + headBob, 0.7) * CFrame.Angles(0, 0, 0),
			["Left Arm"] = CFrame.new(-armSpread, -0.2, armForward) * cframe(n, 0, rad(-60 + math.sin(phase) * 10)) * CFrame.new(0, -0.8 - footLift, 0),
			["Right Arm"] = CFrame.new(armSpread, -0.2, armForward2) * cframe(n, 0, rad(60 - math.sin(phase) * 10)) * CFrame.new(0, -0.8 - footLift2, 0),
			["Left Leg"] = CFrame.new(-legSpread, -0.2, legForward) * cframe(n, 0, rad(-50 + math.cos(phase) * 8)) * CFrame.new(0, -0.8 - footLift2, 0),
			["Right Leg"] = CFrame.new(legSpread, -0.2, legForward2) * cframe(n, 0, rad(50 - math.cos(phase) * 8)) * CFrame.new(0, -0.8 - footLift, 0),
		}

		for k, v4 in pairs(offsets) do
			part = arg:FindFirstChild(k)

			if part and part:IsA("BasePart") then
				part.CFrame = targetCFrame * v4
				part.AssemblyLinearVelocity = Vector3.zero
				part.AssemblyAngularVelocity = Vector3.zero
			end
		end
	end)
end

Fun.startKoshiHuri = function(arg)
	Fun.stopPose()
	rootPart = arg:WaitForChild("HumanoidRootPart")
	humanoid = arg:WaitForChild("Humanoid")
	Fun.RagdollRemote:FireServer(rootPart, 9999999)
	movePosition = rootPart.Position
	walkSpeed = humanoid.WalkSpeed > 0 and humanoid.WalkSpeed or 16
	teleportThreshold = 8
	koshiTime = 0
	Fun.activeMode = "dance"

	Fun.poseConnection = Fun.RunService.Heartbeat:Connect(function(deltaTime)
		if not arg or not arg.Parent or not rootPart or not rootPart.Parent then
			Fun.stopPose()
			return
		end
		koshiTime = koshiTime + deltaTime
		cameraLook = Fun.camera.CFrame.LookVector
		yawAngle = math.atan2(-cameraLook.X, -cameraLook.Z)
		actualPosition = rootPart.Position

		if teleportThreshold < (actualPosition - movePosition).Magnitude then
			movePosition = actualPosition
		end

		moveDir = humanoid.MoveDirection

		if moveDir.Magnitude > 0.01 then
			movePosition = movePosition + moveDir * walkSpeed * deltaTime
		end

		targetCFrame = CFrame.new(movePosition) * CFrame.Angles(0, yawAngle, 0)
		rootPart.CFrame = targetCFrame
		danceSpeed = 5
		phase = koshiTime * danceSpeed
		hipX = math.sin(phase) * 0.5
		hipZ = math.cos(phase) * 0.3
		hipBounce = math.abs(math.sin(phase * 2)) * 0.2
		bodyTiltZ = math.rad(math.sin(phase) * 15)
		bodyTiltX = math.rad(5 + math.cos(phase) * 5)
		armSway = math.sin(phase) * 0.3
		kneeBend = math.abs(math.sin(phase * 2)) * 0.2
		local n = -bodyTiltZ * 0.5
		local rad = math.rad
		local cframe = CFrame.Angles

		offsets = {
			Torso = CFrame.new(hipX, hipBounce, hipZ) * CFrame.Angles(bodyTiltX, 0, bodyTiltZ),
			Head = CFrame.new(-hipX * 0.8, 1.5 + hipBounce, -hipZ * 0.5) * cframe(-0.087266462599716474, math.rad(-hipX * 20), rad(n)),
			["Left Arm"] = CFrame.new(-1.2 + armSway, 1.3 + hipBounce, -1.5) * CFrame.Angles(-2.2689280275926285, -0.3490658503988659, 1.0471975511965976) * CFrame.new(0, -0.6, 0),
			["Right Arm"] = CFrame.new(1.2 - armSway, 1.3 + hipBounce, -1.5) * CFrame.Angles(-2.2689280275926285, 0.3490658503988659, -1.0471975511965976) * CFrame.new(0, -0.6, 0),
			["Left Leg"] = CFrame.new(-0.5 + hipX * 0.3, -2 + kneeBend * 0.3, hipZ * 0.3) * cframe(math.rad(-kneeBend * 20), math.rad(hipX * 10), 0),
			["Right Leg"] = CFrame.new(0.5 + hipX * 0.3, -2 + kneeBend * 0.3, -hipZ * 0.3) * cframe(math.rad(-kneeBend * 20), math.rad(-hipX * 10), 0),
		}

		for k, v4 in pairs(offsets) do
			part = arg:FindFirstChild(k)

			if part and part:IsA("BasePart") then
				part.CFrame = targetCFrame * v4
				part.AssemblyLinearVelocity = Vector3.zero
			end
		end
	end)
end

Fun.startHeadDribble = function(arg)
	Fun.stopPose()
	rootPart = arg:WaitForChild("HumanoidRootPart")
	humanoid = arg:WaitForChild("Humanoid")
	head = arg:FindFirstChild("Head")
	if not head then
		return
	end
	Fun.RagdollRemote:FireServer(rootPart, 9999999)
	movePosition = rootPart.Position
	walkSpeed = humanoid.WalkSpeed > 0 and humanoid.WalkSpeed or 16
	teleportThreshold = 8
	dribbleTime = 0
	Fun.activeMode = "dance"

	Fun.poseConnection = Fun.RunService.Heartbeat:Connect(function(deltaTime)
		if not arg or not arg.Parent or not rootPart or not rootPart.Parent then
			Fun.stopPose()
			return
		end
		dribbleTime = dribbleTime + deltaTime
		cameraLook = Fun.camera.CFrame.LookVector
		yawAngle = math.atan2(-cameraLook.X, -cameraLook.Z)
		actualPosition = rootPart.Position

		if teleportThreshold < (actualPosition - movePosition).Magnitude then
			movePosition = actualPosition
		end

		moveDir = humanoid.MoveDirection

		if moveDir.Magnitude > 0.01 then
			movePosition = movePosition + moveDir * walkSpeed * deltaTime
		end

		targetCFrame = CFrame.new(movePosition) * CFrame.Angles(0, yawAngle, 0)
		rootPart.CFrame = targetCFrame
		dribbleSpeed = 6
		phase = dribbleTime * dribbleSpeed
		handUpDown = math.sin(phase) * 1.5
		local cframe = CFrame.Angles
		rightHandOffset = CFrame.new(1.5, 0.8 + handUpDown, -0.5) * cframe(math.rad(-80 + math.sin(phase) * 40), 0, -0.26179938779914941) * CFrame.new(0, -1, 0)
		rightHandWorld = targetCFrame * rightHandOffset
		bounceHeight = 0.5 + math.abs(math.sin(phase)) * 2
		headWorldPos = rightHandWorld.Position + Vector3.new(0, bounceHeight, 0)
		headLookAt = CFrame.new(headWorldPos, headWorldPos + cameraLook)
		local n = dribbleTime * 2
		headRotation = headLookAt * CFrame.Angles(math.sin(phase) * 0.4, n, 0)

		offsets = {
			Torso = CFrame.new(0, 0, 0) * CFrame.Angles(0.087266462599716474, 0, 0),
			Head = targetCFrame:ToObjectSpace(headRotation),
			["Right Arm"] = rightHandOffset,
			["Left Arm"] = CFrame.new(-0.6, -0.1, 0.1) * CFrame.Angles(-0.3490658503988659, -0.52359877559829882, 1.0471975511965976) * CFrame.new(0, -1, 0),
			["Left Leg"] = CFrame.new(-0.5, -2, 0),
			["Right Leg"] = CFrame.new(0.5, -2, 0),
		}

		for k, v4 in pairs(offsets) do
			part = arg:FindFirstChild(k)

			if part and part:IsA("BasePart") then
				part.CFrame = targetCFrame * v4
				part.AssemblyLinearVelocity = Vector3.zero
			end
		end
	end)
end

Fun.angryState = "angry"
Fun.angryStateTime = 0
Fun.angryHeadStartPos = nil
Fun.angryHeadVelocity = nil

Fun.startAngry = function(arg)
	Fun.stopPose()
	rootPart = arg:WaitForChild("HumanoidRootPart")
	humanoid = arg:WaitForChild("Humanoid")
	head = arg:FindFirstChild("Head")
	if not head then
		return
	end
	Fun.RagdollRemote:FireServer(rootPart, 9999999)
	movePosition = rootPart.Position
	walkSpeed = humanoid.WalkSpeed > 0 and humanoid.WalkSpeed or 16
	teleportThreshold = 8
	Fun.angryState = "angry"
	Fun.angryStateTime = 0
	Fun.angryHeadStartPos = nil
	Fun.angryHeadVelocity = nil
	Fun.activeMode = "dance"

	Fun.poseConnection = Fun.RunService.Heartbeat:Connect(function(deltaTime)
		if not arg or not arg.Parent or not rootPart or not rootPart.Parent then
			Fun.stopPose()
			return
		end
		Fun.angryStateTime = Fun.angryStateTime + deltaTime
		cameraLook = Fun.camera.CFrame.LookVector
		yawAngle = math.atan2(-cameraLook.X, -cameraLook.Z)
		actualPosition = rootPart.Position

		if teleportThreshold < (actualPosition - movePosition).Magnitude then
			movePosition = actualPosition
		end

		moveDir = humanoid.MoveDirection

		if moveDir.Magnitude > 0.01 then
			movePosition = movePosition + moveDir * walkSpeed * deltaTime
		end

		targetCFrame = CFrame.new(movePosition) * CFrame.Angles(0, yawAngle, 0)
		rootPart.CFrame = targetCFrame

		if Fun.angryState == "angry" and Fun.angryStateTime >= 3 then
			Fun.angryState = "launch"
			Fun.angryStateTime = 0

			if head then
				Fun.angryHeadStartPos = head.Position
				Fun.angryHeadVelocity = Vector3.new(0, 600, 0)
			end
		elseif Fun.angryState == "launch" and Fun.angryStateTime >= 1.5 then
			Fun.angryState = "shock"
			Fun.angryStateTime = 0
		elseif Fun.angryState == "shock" and Fun.angryStateTime >= 1 then
			Fun.angryState = "falling"
			Fun.angryStateTime = 0
		elseif Fun.angryState == "falling" and Fun.angryStateTime >= 1.5 then
			Fun.angryState = "catch"
			Fun.angryStateTime = 0
		elseif Fun.angryState == "catch" and Fun.angryStateTime >= 0.5 then
			Fun.angryState = "angry"
			Fun.angryStateTime = 0
			Fun.angryHeadStartPos = nil
			Fun.angryHeadVelocity = nil
		end

		torsoOffset = nil
		headOffset = nil
		leftArmOffset = nil
		rightArmOffset = nil
		leftLegOffset = nil
		rightLegOffset = nil

		if Fun.angryState == "angry" then
			shakeX = math.sin(Fun.angryStateTime * 30) * 0.06
			shakeY = math.sin(Fun.angryStateTime * 35 + 1) * 0.05
			shakeZ = math.sin(Fun.angryStateTime * 28 + 2) * 0.05
			local cframe = CFrame.Angles
			local rad = math.rad
			local n = shakeY * 15
			torsoOffset = CFrame.new(shakeX, shakeY, shakeZ) * cframe(math.rad(shakeX * 20), math.rad(shakeZ * 20), rad(n))
			local cframe2 = CFrame.Angles
			local rad2 = math.rad
			local n2 = shakeY * 20
			headOffset = CFrame.new(shakeX * 1.2, 1.5 + shakeY * 1.2, shakeZ * 1.2) * cframe2(math.rad(-5 + shakeX * 30), math.rad(shakeZ * 25), rad2(n2))
			local cframe3 = CFrame.Angles
			local rad3 = math.rad
			local n3 = 15 + shakeY * 20
			leftArmOffset = CFrame.new(-2, 1, -1.5 + shakeZ) * cframe3(math.rad(10 + shakeX * 15), 0, rad3(n3)) * CFrame.new(0, -1, 0)
			local cframe4 = CFrame.Angles
			local rad4 = math.rad
			local n4 = -15 - shakeY * 20
			rightArmOffset = CFrame.new(2, 1, -1.5 + shakeZ) * cframe4(math.rad(10 + shakeX * 15), 0, rad4(n4)) * CFrame.new(0, -1, 0)
			local cframe5 = CFrame.Angles
			leftLegOffset = CFrame.new(-0.9 + shakeX * 0.5, -2 + shakeY * 0.3, shakeZ * 0.3) * cframe5(math.rad(shakeX * 8), -0.26179938779914941, 0)
			local cframe6 = CFrame.Angles
			rightLegOffset = CFrame.new(0.9 + shakeX * 0.5, -2 + shakeY * 0.3, -shakeZ * 0.3) * cframe6(math.rad(shakeX * 8), 0.26179938779914941, 0)
		elseif Fun.angryState == "launch" then
			angryT = Fun.angryStateTime
			gravity = Vector3.new(0, -workspace.Gravity, 0)
			torsoOffset = CFrame.new(0, 0, 0)

			if head and Fun.angryHeadStartPos then
				headPos = Fun.angryHeadStartPos + Fun.angryHeadVelocity * angryT + 0.5 * gravity * angryT * angryT
				head.CFrame = CFrame.new(headPos) * CFrame.Angles(angryT * 10, angryT * 8, angryT * 12)
				head.AssemblyLinearVelocity = Vector3.zero
			end

			leftArmOffset = CFrame.new(-1.5, 1, -1.5) * CFrame.Angles(-1.5707963267948966, 0, 0.26179938779914941) * CFrame.new(0, -1, 0)
			rightArmOffset = CFrame.new(1.5, 1, -1.5) * CFrame.Angles(-1.5707963267948966, 0, -0.26179938779914941) * CFrame.new(0, -1, 0)
			leftLegOffset = CFrame.new(-0.5, -2, 0)
			rightLegOffset = CFrame.new(0.5, -2, 0)
		elseif Fun.angryState == "shock" then
			shockIntensity = math.min(Fun.angryStateTime * 4, 1)
			local cframe = CFrame.Angles
			torsoOffset = CFrame.new(0, shockIntensity * 0.2, -shockIntensity * 0.3) * cframe(math.rad(-shockIntensity * 20), 0, 0)
			local cframe2 = CFrame.Angles
			leftArmOffset = CFrame.new(-1.5, 1 + shockIntensity * 1.2, -1.5) * cframe2(math.rad(-90 - shockIntensity * 80), 0, 0.52359877559829882) * CFrame.new(0, -1, 0)
			local cframe3 = CFrame.Angles
			rightArmOffset = CFrame.new(1.5, 1 + shockIntensity * 1.2, -1.5) * cframe3(math.rad(-90 - shockIntensity * 80), 0, -0.52359877559829882) * CFrame.new(0, -1, 0)
			leftLegOffset = CFrame.new(-0.6, -2, 0.1) * CFrame.Angles(-0.087266462599716474, 0.26179938779914941, 0)
			rightLegOffset = CFrame.new(0.6, -2, -0.1) * CFrame.Angles(-0.087266462599716474, -0.26179938779914941, 0)
		elseif Fun.angryState == "falling" then
			angryT = Fun.angryStateTime
			torsoOffset = CFrame.new(0, -0.3, 0) * CFrame.Angles(0.26179938779914941, 0, 0)

			if head then
				fallHeight = 150 - angryT / 1.5 * 150
				fallHeight = math.max(fallHeight, 1.5)
				headWorldPos = (targetCFrame * CFrame.new(0, fallHeight, 0)).Position
				head.CFrame = CFrame.new(headWorldPos) * CFrame.Angles(angryT * 20, angryT * 15, angryT * 18)
				head.AssemblyLinearVelocity = Vector3.zero
			end

			leftArmOffset = CFrame.new(-1.5, 1.5, -1.5) * CFrame.Angles(-2.2689280275926285, 0, 0.3490658503988659) * CFrame.new(0, -1, 0)
			rightArmOffset = CFrame.new(1.5, 1.5, -1.5) * CFrame.Angles(-2.2689280275926285, 0, -0.3490658503988659) * CFrame.new(0, -1, 0)
			leftLegOffset = CFrame.new(-0.6, -2, 0.2)
			rightLegOffset = CFrame.new(0.6, -2, -0.2) * CFrame.Angles(0, 0.3490658503988659, 0)
		elseif Fun.angryState == "catch" then
			smooth = Fun.angryStateTime / 0.5
			local cframe = CFrame.Angles
			torsoOffset = CFrame.new(0, -0.1 * (1 - smooth), 0) * cframe(math.rad(5 * (1 - smooth)), 0, 0)

			if head then
				targetHeadCFrame = targetCFrame * CFrame.new(0, 1.5, 0)
				head.CFrame = head.CFrame:Lerp(targetHeadCFrame, smooth)
				head.AssemblyLinearVelocity = Vector3.zero
			end

			leftArmOffset = CFrame.new(-1, 1, -1.5) * CFrame.Angles(-1.7453292519943295, -0.3490658503988659, 0.69813170079773179) * CFrame.new(0, -0.8, 0)
			rightArmOffset = CFrame.new(1, 1, -1.5) * CFrame.Angles(-1.7453292519943295, 0.3490658503988659, -0.69813170079773179) * CFrame.new(0, -0.8, 0)
			leftLegOffset = CFrame.new(-0.5, -2, 0)
			rightLegOffset = CFrame.new(0.5, -2, 0)
		end

		offsets = {}

		if torsoOffset then
			offsets.Torso = torsoOffset
		end

		if headOffset then
			offsets.Head = headOffset
		end

		if leftArmOffset then
			offsets["Left Arm"] = leftArmOffset
		end

		if rightArmOffset then
			offsets["Right Arm"] = rightArmOffset
		end

		if leftLegOffset then
			offsets["Left Leg"] = leftLegOffset
		end

		if rightLegOffset then
			offsets["Right Leg"] = rightLegOffset
		end

		for k, v4 in pairs(offsets) do
			part = arg:FindFirstChild(k)

			if part and part:IsA("BasePart") then
				part.CFrame = targetCFrame * v4
				part.AssemblyLinearVelocity = Vector3.zero
			end
		end
	end)
end

Fun.startSoccer = function(arg)
	Fun.stopPose()
	rootPart = arg:WaitForChild("HumanoidRootPart")
	humanoid = arg:WaitForChild("Humanoid")
	head = arg:FindFirstChild("Head")
	if not head then
		return
	end
	Fun.RagdollRemote:FireServer(rootPart, 9999999)
	movePosition = rootPart.Position
	walkSpeed = humanoid.WalkSpeed > 0 and humanoid.WalkSpeed or 16
	teleportThreshold = 8
	soccerTime = 0
	Fun.activeMode = "dance"

	Fun.poseConnection = Fun.RunService.Heartbeat:Connect(function(deltaTime)
		if not arg or not arg.Parent or not rootPart or not rootPart.Parent then
			Fun.stopPose()
			return
		end
		soccerTime = soccerTime + deltaTime
		cameraLook = Fun.camera.CFrame.LookVector
		yawAngle = math.atan2(-cameraLook.X, -cameraLook.Z)
		actualPosition = rootPart.Position

		if (actualPosition - movePosition).Magnitude > teleportThreshold then
			movePosition = actualPosition
		end

		moveDir = humanoid.MoveDirection

		if moveDir.Magnitude > 0.01 then
			movePosition = movePosition + moveDir * walkSpeed * deltaTime
		end

		targetCFrame = CFrame.new(movePosition) * CFrame.Angles(0, yawAngle, 0)
		rootPart.CFrame = targetCFrame
		kickSpeed = 4
		cycle = soccerTime * kickSpeed
		phase = cycle % 1
		legLift = 0
		headBounce = 0

		if phase < 0.25 then
			legLift = phase / 0.25
			headBounce = 0
		elseif phase < 0.35 then
			legLift = 1
			headBounce = (phase - 0.25) / 0.1
		elseif phase < 0.65 then
			legLift = 1 - (phase - 0.35) / 0.3
			headBounce = 1
		elseif phase < 0.8 then
			legLift = 0
			headBounce = 1 - (phase - 0.65) / 0.15
		else
			legLift = 0
			headBounce = 0
		end

		headForward = -1.2
		headDown = 0.2 - headBounce * 4
		rightLegUp = 0.5 + legLift * 1.5
		rightLegForward = -0.5 - legLift * 0.7
		local cframe = CFrame.Angles
		local rad = math.rad
		local n = -legLift * 10

		offsets = {
			Torso = CFrame.new(0, 0, 0) * cframe(math.rad(-legLift * 10), 0, 0),
			Head = CFrame.new(0, 1.5 - headDown, headForward) * CFrame.Angles(headBounce * 3, soccerTime * 4, headBounce * 2),
			["Left Arm"] = CFrame.new(-1.5, 1, -1.5) * CFrame.Angles(-1.7453292519943295, -0.3490658503988659, 0.52359877559829882) * CFrame.new(0, -1, 0),
			["Right Arm"] = CFrame.new(1.5, 1, -1.5) * CFrame.Angles(-1.7453292519943295, 0.3490658503988659, -0.52359877559829882) * CFrame.new(0, -1, 0),
			["Left Leg"] = CFrame.new(-0.3, -2, 0.1),
			["Right Leg"] = CFrame.new(0.5, -2 + rightLegUp, rightLegForward) * cframe(math.rad(-legLift * 100), 0, rad(n)),
		}

		for k, v4 in pairs(offsets) do
			part = arg:FindFirstChild(k)

			if part and part:IsA("BasePart") then
				part.CFrame = targetCFrame * v4
				part.AssemblyLinearVelocity = Vector3.zero
			end
		end
	end)
end

Fun.startHeadOrbit = function(arg)
	Fun.stopPose()
	rootPart = arg:WaitForChild("HumanoidRootPart")
	humanoid = arg:WaitForChild("Humanoid")
	torso = arg:FindFirstChild("Torso") or arg:FindFirstChild("UpperTorso")
	head = arg:FindFirstChild("Head")
	if not torso or not head then
		return
	end
	Fun.RagdollRemote:FireServer(rootPart, 9999999)
	movePosition = rootPart.Position
	walkSpeed = humanoid.WalkSpeed > 0 and humanoid.WalkSpeed or 16
	teleportThreshold = 8
	orbitTime = 0
	orbitSpeed = 3
	orbitRadius = 3
	orbitHeight = 0.5
	Fun.activeMode = "dance"

	Fun.poseConnection = Fun.RunService.Heartbeat:Connect(function(deltaTime)
		if not arg or not arg.Parent or not rootPart or not rootPart.Parent then
			Fun.stopPose()
			return
		end
		orbitTime = orbitTime + deltaTime
		cameraLook = Fun.camera.CFrame.LookVector
		yawAngle = math.atan2(-cameraLook.X, -cameraLook.Z)
		actualPosition = rootPart.Position

		if teleportThreshold < (actualPosition - movePosition).Magnitude then
			movePosition = actualPosition
		end

		moveDir = humanoid.MoveDirection

		if moveDir.Magnitude > 0.01 then
			movePosition = movePosition + moveDir * walkSpeed * deltaTime
		end

		targetCFrame = CFrame.new(movePosition) * CFrame.Angles(0, yawAngle, 0)
		rootPart.CFrame = targetCFrame
		torsoWorldPos = (targetCFrame * CFrame.new(0, 0.5, 0)).Position
		orbitAngle = orbitTime * orbitSpeed
		local v4 = orbitRadius
		headOffsetX = math.cos(orbitAngle) * v4
		local v5 = orbitRadius
		headOffsetZ = math.sin(orbitAngle) * v5
		headWorldPos = torsoWorldPos + Vector3.new(headOffsetX, orbitHeight, headOffsetZ)
		tangentX = -math.sin(orbitAngle)
		tangentZ = math.cos(orbitAngle)
		headForward = Vector3.new(tangentX, 0, tangentZ)
		headLookCFrame = CFrame.new(headWorldPos, headWorldPos + headForward)
		headFinalCFrame = headLookCFrame * CFrame.Angles(0, 0, orbitTime * 5)

		offsets = {
			Torso = CFrame.new(0, 0, 0),
			Head = targetCFrame:ToObjectSpace(headFinalCFrame),
			["Left Arm"] = CFrame.new(-1.5, 1, 0) * CFrame.Angles(-2.0943951023931953, 0, 0.52359877559829882) * CFrame.new(0, -1, 0),
			["Right Arm"] = CFrame.new(1.5, 1, 0) * CFrame.Angles(-2.0943951023931953, 0, -0.52359877559829882) * CFrame.new(0, -1, 0),
			["Left Leg"] = CFrame.new(-0.5, -2, 0),
			["Right Leg"] = CFrame.new(0.5, -2, 0),
		}

		for k, v6 in pairs(offsets) do
			part = arg:FindFirstChild(k)

			if part and part:IsA("BasePart") then
				part.CFrame = targetCFrame * v6
				part.AssemblyLinearVelocity = Vector3.zero
			end
		end
	end)
end

Fun.startLol = function(arg)
	Fun.stopPose()
	rootPart = arg:WaitForChild("HumanoidRootPart")
	humanoid = arg:WaitForChild("Humanoid")
	Fun.RagdollRemote:FireServer(rootPart, 9999999)
	movePosition = rootPart.Position
	walkSpeed = humanoid.WalkSpeed > 0 and humanoid.WalkSpeed or 16
	teleportThreshold = 8
	lolTime = 0
	Fun.activeMode = "dance"

	Fun.poseConnection = Fun.RunService.Heartbeat:Connect(function(deltaTime)
		if not arg or not arg.Parent or not rootPart or not rootPart.Parent then
			Fun.stopPose()
			return
		end
		lolTime = lolTime + deltaTime
		cameraLook = Fun.camera.CFrame.LookVector
		yawAngle = math.atan2(-cameraLook.X, -cameraLook.Z)
		actualPosition = rootPart.Position

		if teleportThreshold < (actualPosition - movePosition).Magnitude then
			movePosition = actualPosition
		end

		moveDir = humanoid.MoveDirection

		if moveDir.Magnitude > 0.01 then
			movePosition = movePosition + moveDir * walkSpeed * deltaTime
		end

		targetCFrame = CFrame.new(movePosition) * CFrame.Angles(0, yawAngle, 0)
		rootPart.CFrame = targetCFrame
		laughCycle = lolTime * 4
		laughIntensity = math.abs(math.sin(laughCycle))
		leanBack = math.rad(-15 - laughIntensity * 30)
		bounce = laughIntensity * 0.3
		headTilt = math.rad(10 + laughIntensity * 25)
		armsForward = -1.5 + laughIntensity * 0.3
		legSpread = 0.3 + laughIntensity * 0.3
		local v4 = headTilt
		local rad = math.rad
		local n = -50 - laughIntensity * 10
		local cframe = CFrame.Angles

		offsets = {
			Torso = CFrame.new(0, bounce, laughIntensity * 0.3) * CFrame.Angles(leanBack, 0, 0),
			Head = CFrame.new(0, 1.5 + bounce, -laughIntensity * 0.4) * cframe(v4, math.rad(math.sin(laughCycle * 2) * 15), rad(math.sin(laughCycle * 1.5) * 8)),
			["Left Arm"] = CFrame.new(-0.8, 0.3 + bounce * 0.5, armsForward) * cframe(math.rad(-70 + laughIntensity * 15), -0.26179938779914941, rad(n)) * CFrame.new(0, -0.7, 0),
			["Right Arm"] = CFrame.new(0.8, 0.3 + bounce * 0.5, armsForward) * cframe(math.rad(-70 + laughIntensity * 15), 0.26179938779914941, rad(n)) * CFrame.new(0, -0.7, 0),
			["Left Leg"] = CFrame.new(-0.5 - legSpread, -2 + bounce * 0.3, 0) * cframe(math.rad(laughIntensity * 10), math.rad(-legSpread * 30), 0),
			["Right Leg"] = CFrame.new(0.5 + legSpread, -2 + bounce * 0.3, 0) * cframe(math.rad(laughIntensity * 10), math.rad(legSpread * 30), 0),
		}

		for k, v5 in pairs(offsets) do
			part = arg:FindFirstChild(k)

			if part and part:IsA("BasePart") then
				part.CFrame = targetCFrame * v5
				part.AssemblyLinearVelocity = Vector3.zero
			end
		end
	end)
end

Fun.makeProceduralDance = function(arg)
	return function(arg2)
		Fun.stopPose()
		rootPart = arg2:WaitForChild("HumanoidRootPart")
		humanoid = arg2:WaitForChild("Humanoid")
		Fun.RagdollRemote:FireServer(rootPart, 9999999)
		movePosition = rootPart.Position
		walkSpeed = humanoid.WalkSpeed > 0 and humanoid.WalkSpeed or 16
		teleportThreshold = 8
		Fun.activeMode = "dance"

		Fun.poseConnection = Fun.RunService.Heartbeat:Connect(function(deltaTime)
			if not arg2 or not arg2.Parent or not rootPart or not rootPart.Parent then
				Fun.stopPose()
				return
			end
			t = tick()
			cameraLook = Fun.camera.CFrame.LookVector
			yawAngle = math.atan2(-cameraLook.X, -cameraLook.Z)
			actualPosition = rootPart.Position

			if (actualPosition - movePosition).Magnitude > teleportThreshold then
				movePosition = actualPosition
			end

			moveDir = humanoid.MoveDirection

			if moveDir.Magnitude > 0.01 then
				movePosition = movePosition + moveDir * walkSpeed * deltaTime
			end

			targetCFrame = CFrame.new(movePosition) * CFrame.Angles(0, yawAngle, 0)
			rootPart.CFrame = targetCFrame
			phase = t * arg.speed
			offsets = arg.pose(phase)

			for k, v4 in pairs(offsets) do
				part = arg2:FindFirstChild(k)

				if part and part:IsA("BasePart") then
					part.CFrame = targetCFrame * v4
					part.AssemblyLinearVelocity = Vector3.zero
				end
			end
		end)
	end
end

Fun.originalDanceParams = {
	["Robot Lock"] = {
		speed = 6,
		pose = function(arg)
			snap = math.floor(math.sin(arg) * 4) / 4
			snap2 = math.floor(math.sin(arg + 3.1415926535897931) * 4) / 4
			local cframe = CFrame.Angles

			return {
				Torso = CFrame.new(0, 0, 0) * cframe(0, math.rad(snap * 20), 0),
				Head = CFrame.new(0, 1.5, 0) * cframe(0, math.rad(-snap * 30), 0),
				["Left Arm"] = CFrame.new(-1.5, 1 + snap * 0.5, 0) * cframe(math.rad(snap * 90), 0, 0),
				["Right Arm"] = CFrame.new(1.5, 1 + snap2 * 0.5, 0) * cframe(math.rad(snap2 * 90), 0, 0),
				["Left Leg"] = CFrame.new(-0.5, -2, 0),
				["Right Leg"] = CFrame.new(0.5, -2, 0),
			}
		end,
	},
	["Disco Point"] = {
		speed = 4,
		pose = function(arg)
			up = math.sin(arg) > 0
			pointAngle = up and -2.6179938779914944 or 1.0471975511965976
			pointAngle2 = up and 1.0471975511965976 or -2.6179938779914944
			hip = math.sin(arg * 2) * 0.2

			return {
				Torso = CFrame.new(hip, 0, 0) * CFrame.Angles(0, 0, math.rad(hip * 15)),
				Head = CFrame.new(0, 1.5, 0),
				["Left Arm"] = CFrame.new(-1.5, 1, 0) * CFrame.Angles(pointAngle, 0, 0) * CFrame.new(0, -1, 0),
				["Right Arm"] = CFrame.new(1.5, 1, 0) * CFrame.Angles(pointAngle2, 0, 0) * CFrame.new(0, -1, 0),
				["Left Leg"] = CFrame.new(-0.5, -2, 0),
				["Right Leg"] = CFrame.new(0.5, -2, 0),
			}
		end,
	},
	["Wave Ripple"] = {
		speed = 4,
		pose = function(arg)
			local cframe = CFrame.Angles
			local rad = math.rad

			return {
				Torso = CFrame.new(0, math.sin(arg) * 0.1, 0) * cframe(0, 0, rad(math.sin(arg) * 8)),
				Head = CFrame.new(0, 1.5 + math.sin(arg + 0.3) * 0.1, 0) * cframe(rad(math.sin(arg + 0.3) * 10), 0, 0),
				["Left Arm"] = CFrame.new(-1.5, 1 + math.sin(arg + 0.6) * 0.8, 0) * CFrame.Angles(0, 0, 0.3490658503988659),
				["Right Arm"] = CFrame.new(1.5, 1 + math.sin(arg + 1.2) * 0.8, 0) * CFrame.Angles(0, 0, -0.3490658503988659),
				["Left Leg"] = CFrame.new(-0.5, -2 + math.sin(arg + 1.8) * 0.15, 0),
				["Right Leg"] = CFrame.new(0.5, -2 + math.sin(arg + 2.4) * 0.15, 0),
			}
		end,
	},
	["Jazz Hands"] = {
		speed = 14,
		pose = function(arg)
			shake = math.sin(arg) * 0.15

			return {
				Torso = CFrame.new(0, 0.1, 0),
				Head = CFrame.new(0, 1.6, 0),
				["Left Arm"] = CFrame.new(-1.8 + shake, 1.6, 0) * CFrame.Angles(-2.4434609527920612, 0, math.rad(shake * 60)),
				["Right Arm"] = CFrame.new(1.8 - shake, 1.6, 0) * CFrame.Angles(-2.4434609527920612, 0, math.rad(-shake * 60)),
				["Left Leg"] = CFrame.new(-0.5, -2, 0),
				["Right Leg"] = CFrame.new(0.5, -2, 0),
			}
		end,
	},
	Headbang = {
		speed = 12,
		pose = function(arg)
			snap = math.abs(math.sin(arg))
			local cframe = CFrame.Angles

			return {
				Torso = CFrame.new(0, 0, 0) * cframe(math.rad(snap * 15), 0, 0),
				Head = CFrame.new(0, 1.5 - snap * 0.3, 0.2 * snap) * cframe(math.rad(snap * 55), 0, 0),
				["Left Arm"] = CFrame.new(-1.5, 1, 0) * CFrame.Angles(-0.3490658503988659, 0, 0.17453292519943295),
				["Right Arm"] = CFrame.new(1.5, 1, 0) * CFrame.Angles(-0.3490658503988659, 0, -0.17453292519943295),
				["Left Leg"] = CFrame.new(-0.5, -2, 0),
				["Right Leg"] = CFrame.new(0.5, -2, 0),
			}
		end,
	},
	["Shoulder Shimmy"] = {
		speed = 16,
		pose = function(arg)
			shim = math.sin(arg) * 0.3
			shim2 = math.sin(arg + 3.1415926535897931) * 0.3

			return {
				Torso = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, math.rad(shim * 6)),
				Head = CFrame.new(0, 1.5, 0),
				["Left Arm"] = CFrame.new(-1.5, 1 + shim, 0) * CFrame.Angles(0, 0, 0.26179938779914941),
				["Right Arm"] = CFrame.new(1.5, 1 + shim2, 0) * CFrame.Angles(0, 0, -0.26179938779914941),
				["Left Leg"] = CFrame.new(-0.5, -2, 0),
				["Right Leg"] = CFrame.new(0.5, -2, 0),
			}
		end,
	},
	["Boxer Bounce"] = {
		speed = 10,
		pose = function(arg)
			bounce = math.abs(math.sin(arg)) * 0.25
			jab = math.sin(arg * 2) * 0.4

			return {
				Torso = CFrame.new(0, bounce, 0) * CFrame.Angles(0.087266462599716474, 0, 0),
				Head = CFrame.new(0, 1.4 + bounce, 0),
				["Left Arm"] = CFrame.new(-1, 1.2 + bounce, -0.3 + jab) * CFrame.Angles(-1.7453292519943295, 0, 0),
				["Right Arm"] = CFrame.new(1, 1.2 + bounce, -0.3 - jab) * CFrame.Angles(-1.7453292519943295, 0, 0),
				["Left Leg"] = CFrame.new(-0.5, -2 + bounce * 0.5, 0.2),
				["Right Leg"] = CFrame.new(0.5, -2 + bounce * 0.5, -0.2),
			}
		end,
	},
	["Salsa Hip"] = {
		speed = 7,
		pose = function(arg)
			hip = math.sin(arg) * 0.5
			local n = hip * 12
			local cframe = CFrame.Angles
			local rad = math.rad

			return {
				Torso = CFrame.new(hip * 0.3, 0, 0) * cframe(0, math.rad(hip * 10), rad(n)),
				Head = CFrame.new(0, 1.5, 0) * cframe(0, math.rad(-hip * 8), 0),
				["Left Arm"] = CFrame.new(-1.4, 1.1, 0) * CFrame.Angles(-0.69813170079773179, 0, math.rad(hip * 20)),
				["Right Arm"] = CFrame.new(1.4, 1.1, 0) * CFrame.Angles(-0.69813170079773179, 0, math.rad(-hip * 20)),
				["Left Leg"] = CFrame.new(-0.5 - hip * 0.2, -2, 0),
				["Right Leg"] = CFrame.new(0.5 + hip * 0.2, -2, 0),
			}
		end,
	},
	["Cheer Jump"] = {
		speed = 9,
		pose = function(arg)
			jump = math.abs(math.sin(arg)) * 0.6

			return {
				Torso = CFrame.new(0, jump, 0),
				Head = CFrame.new(0, 1.5 + jump, 0),
				["Left Arm"] = CFrame.new(-1.5, 2 + jump, 0) * CFrame.Angles(-2.9670597283903604, 0, 0.3490658503988659),
				["Right Arm"] = CFrame.new(1.5, 2 + jump, 0) * CFrame.Angles(-2.9670597283903604, 0, -0.3490658503988659),
				["Left Leg"] = CFrame.new(-0.5, -2 + jump * 0.4, 0),
				["Right Leg"] = CFrame.new(0.5, -2 + jump * 0.4, 0),
			}
		end,
	},
	["Propeller Arms"] = {
		speed = 10,
		pose = function(arg)
			return {
				Torso = CFrame.new(0, 0, 0),
				Head = CFrame.new(0, 1.5, 0),
				["Left Arm"] = CFrame.new(-1.5, 1, 0) * CFrame.Angles(arg, 0, 0) * CFrame.new(0, -1, 0),
				["Right Arm"] = CFrame.new(1.5, 1, 0) * CFrame.Angles(-arg, 0, 0) * CFrame.new(0, -1, 0),
				["Left Leg"] = CFrame.new(-0.5, -2, 0),
				["Right Leg"] = CFrame.new(0.5, -2, 0),
			}
		end,
	},
	["Matrix Lean"] = {
		speed = 3,
		pose = function(arg)
			lean = (math.sin(arg) + 1) / 2
			local cframe = CFrame.Angles

			return {
				Torso = CFrame.new(0, -lean * 0.4, -lean * 0.5) * cframe(math.rad(-lean * 60), 0, 0),
				Head = CFrame.new(0, 1.5 - lean * 0.3, -lean * 0.3) * cframe(math.rad(-lean * 60), 0, 0),
				["Left Arm"] = CFrame.new(-1.5, 1, 0) * cframe(math.rad(-lean * 30), 0, 0),
				["Right Arm"] = CFrame.new(1.5, 1, 0) * cframe(math.rad(-lean * 30), 0, 0),
				["Left Leg"] = CFrame.new(-0.6, -2, 0.2),
				["Right Leg"] = CFrame.new(0.4, -2, -0.2),
			}
		end,
	},
	["Victory Pump"] = {
		speed = 8,
		pose = function(arg)
			pump = math.abs(math.sin(arg))

			return {
				Torso = CFrame.new(0, pump * 0.15, 0),
				Head = CFrame.new(0, 1.5 + pump * 0.15, 0),
				["Left Arm"] = CFrame.new(-1.5, 1 + pump * 1.2, 0) * CFrame.Angles(-2.9670597283903604 * pump, 0, 0),
				["Right Arm"] = CFrame.new(1.5, 1, 0) * CFrame.Angles(-0.52359877559829882, 0, 0),
				["Left Leg"] = CFrame.new(-0.5, -2, 0),
				["Right Leg"] = CFrame.new(0.5, -2, 0),
			}
		end,
	},
	["Ninja Flow"] = {
		speed = 5,
		pose = function(arg)
			crouch = 0.4
			chop = math.sin(arg) * 0.6
			local cframe = CFrame.Angles

			return {
				Torso = CFrame.new(0, -crouch, 0) * cframe(0.17453292519943295, math.rad(chop * 10), 0),
				Head = CFrame.new(0, 1.5 - crouch, 0),
				["Left Arm"] = CFrame.new(-1.3, 1 - crouch, chop) * CFrame.Angles(-0.69813170079773179, 0, 0.3490658503988659),
				["Right Arm"] = CFrame.new(1.3, 1 - crouch, -chop) * CFrame.Angles(-0.69813170079773179, 0, -0.3490658503988659),
				["Left Leg"] = CFrame.new(-0.6, -1.8 - crouch * 0.3, 0.1) * CFrame.Angles(-0.26179938779914941, 0, 0),
				["Right Leg"] = CFrame.new(0.6, -1.8 - crouch * 0.3, -0.1) * CFrame.Angles(-0.26179938779914941, 0, 0),
			}
		end,
	},
	["Superhero Pose"] = {
		speed = 2,
		pose = function(arg)
			breathe = math.sin(arg) * 0.03

			return {
				Torso = CFrame.new(0, breathe, 0.1) * CFrame.Angles(-0.087266462599716474, 0, 0),
				Head = CFrame.new(0, 1.5 + breathe, 0.1) * CFrame.Angles(0.087266462599716474, 0, 0),
				["Left Arm"] = CFrame.new(-1.2, 1.2, 0.3) * CFrame.Angles(-1.7453292519943295, 0, 0.52359877559829882),
				["Right Arm"] = CFrame.new(1.4, 0.9, 0) * CFrame.Angles(-0.17453292519943295, 0, -0.17453292519943295),
				["Left Leg"] = CFrame.new(-0.5, -2, 0.1),
				["Right Leg"] = CFrame.new(0.6, -2, -0.3) * CFrame.Angles(0, 0.3490658503988659, 0),
			}
		end,
	},
	["Snake Wave"] = {
		speed = 5,
		pose = function(arg)
			local cframe = CFrame.Angles
			local rad = math.rad

			return {
				Torso = CFrame.new(math.sin(arg) * 0.4, 0, 0) * cframe(0, 0, rad(math.sin(arg) * 20)),
				Head = CFrame.new(math.sin(arg + 0.8) * 0.5, 1.5, 0) * cframe(0, 0, rad(math.sin(arg + 0.8) * 25)),
				["Left Arm"] = CFrame.new(-1.5 + math.sin(arg) * 0.2, 1, 0) * CFrame.Angles(0, 0, 0.26179938779914941),
				["Right Arm"] = CFrame.new(1.5 + math.sin(arg) * 0.2, 1, 0) * CFrame.Angles(0, 0, -0.26179938779914941),
				["Left Leg"] = CFrame.new(-0.5 - math.sin(arg) * 0.15, -2, 0),
				["Right Leg"] = CFrame.new(0.5 - math.sin(arg) * 0.15, -2, 0),
			}
		end,
	},
	["Staircase Step"] = {
		speed = 4,
		pose = function(arg)
			side = math.sin(arg)
			step = math.abs(math.sin(arg * 2)) * 0.3

			return {
				Torso = CFrame.new(side * 0.8, step, 0),
				Head = CFrame.new(side * 0.8, 1.5 + step, 0),
				["Left Arm"] = CFrame.new(-1.5 + side * 0.8, 1, 0) * CFrame.Angles(0, 0, 0.17453292519943295),
				["Right Arm"] = CFrame.new(1.5 + side * 0.8, 1, 0) * CFrame.Angles(0, 0, -0.17453292519943295),
				["Left Leg"] = CFrame.new(-0.5 + side * 0.8, -2 + step, 0),
				["Right Leg"] = CFrame.new(0.5 + side * 0.8, -2 + step, 0),
			}
		end,
	},
	["Windmill Arms"] = {
		speed = 6,
		pose = function(arg)
			return {
				Torso = CFrame.new(0, 0, 0),
				Head = CFrame.new(0, 1.5, 0),
				["Left Arm"] = CFrame.new(-1.5, 1, 0) * CFrame.Angles(arg, 0, 0) * CFrame.new(0, -1, 0),
				["Right Arm"] = CFrame.new(1.5, 1, 0) * CFrame.Angles(arg + 3.1415926535897931, 0, 0) * CFrame.new(0, -1, 0),
				["Left Leg"] = CFrame.new(-0.5, -2, 0),
				["Right Leg"] = CFrame.new(0.5, -2, 0),
			}
		end,
	},
	["Popcorn Pop"] = {
		speed = 13,
		pose = function(arg)
			pop = math.max(0, math.sin(arg)) ^ 3 * 0.5
			local cframe = CFrame.Angles

			return {
				Torso = CFrame.new(0, pop, 0),
				Head = CFrame.new(0, 1.5 + pop, 0),
				["Left Arm"] = CFrame.new(-1.5, 1 + pop * 1.5, 0) * cframe(math.rad(-pop * 200), 0, 0),
				["Right Arm"] = CFrame.new(1.5, 1 + pop * 1.5, 0) * cframe(math.rad(-pop * 200), 0, 0),
				["Left Leg"] = CFrame.new(-0.5, -2 + pop * 0.3, 0),
				["Right Leg"] = CFrame.new(0.5, -2 + pop * 0.3, 0),
			}
		end,
	},
	["Clap Along"] = {
		speed = 8,
		pose = function(arg)
			clap = (math.sin(arg) + 1) / 2
			local cframe = CFrame.Angles

			return {
				Torso = CFrame.new(0, math.abs(math.sin(arg)) * 0.1, 0),
				Head = CFrame.new(0, 1.5, 0) * cframe(math.rad(clap * 10), 0, 0),
				["Left Arm"] = CFrame.new(-0.7 * clap - 0.3, 1.2, 0.2) * CFrame.Angles(-1.2217304763960306, 0, 0.3490658503988659),
				["Right Arm"] = CFrame.new(0.7 * clap + 0.3, 1.2, 0.2) * CFrame.Angles(-1.2217304763960306, 0, -0.3490658503988659),
				["Left Leg"] = CFrame.new(-0.5, -2, 0),
				["Right Leg"] = CFrame.new(0.5, -2, 0),
			}
		end,
	},
	["Zombie Shuffle"] = {
		speed = 3,
		pose = function(arg)
			shuffle = math.sin(arg) * 0.3
			local cframe = CFrame.Angles

			return {
				Torso = CFrame.new(0, 0, 0) * cframe(-0.13962634015954636, math.rad(shuffle * 5), 0),
				Head = CFrame.new(0, 1.5, 0) * CFrame.Angles(0.087266462599716474, 0, math.rad(shuffle * 10)),
				["Left Arm"] = CFrame.new(-1.5, 1.3, -1) * CFrame.Angles(-1.4835298641951802, 0, 0),
				["Right Arm"] = CFrame.new(1.5, 1.3, -1) * CFrame.Angles(-1.4835298641951802, 0, 0),
				["Left Leg"] = CFrame.new(-0.5 + shuffle * 0.3, -2, 0),
				["Right Leg"] = CFrame.new(0.5 - shuffle * 0.3, -2, 0),
			}
		end,
	},
}

Fun.Dances = {
	["Floss Dance"] = Fun.startFlossDance,
	["Ouen Dance"] = Fun.startOrangeJustice,
	["Head Ball"] = Fun.startHeadThrow,
	Cartoon = Fun.startCartoon,
	Kawaii = Fun.startKawaii,
	Cool = Fun.startCool,
	Spider = Fun.startSpider,
	["Koshi huri"] = Fun.startKoshiHuri,
	["Head dribble"] = Fun.startHeadDribble,
	Angry = Fun.startAngry,
	soccer = Fun.startSoccer,
	["Head orbit"] = Fun.startHeadOrbit,
	Lol = Fun.startLol,
}

for k, originalDanceParam in pairs(Fun.originalDanceParams) do
	Fun.Dances[k] = Fun.makeProceduralDance(originalDanceParam)
end

Fun.playSelectedDance = function(arg)
	fn = Fun.Dances[Fun.selectedDance]

	if fn then
		fn(arg)
	end
end

Fun.me.CharacterAdded:Connect(function(character)
	task.wait(0.2)
	modeAtRespawn = Fun.activeMode

	if modeAtRespawn == "dance" then
		Fun.playSelectedDance(character)
	elseif modeAtRespawn == "ragdoll" then
		Fun.startRagdollOnly(character)
	end

	if Fun.isDancingV2 and Fun.activeDanceDataV2 then
		task.wait(0.3)
		Fun.startHipDanceV2(character)
	end
end)

Fun.currentDanceRawTableV2 = {}
Fun.danceListV2 = {}
Fun.activeDanceDataV2 = nil
Fun.selectedDanceNameV2 = ""
Fun.isDancingV2 = false
Fun.poseConnectionV2 = nil
Fun.frameIndexV2 = 1
Fun.frameTimerV2 = 0
local tbl9 = { HumanoidRootPart = true, Handle = true, LArmIKPart = true, RArmIKPart = true }

Fun.stopHipDanceV2 = function(arg)
	if Fun.poseConnectionV2 then
		Fun.poseConnectionV2:Disconnect()
		Fun.poseConnectionV2 = nil
	end

	if arg then
		local humanoid_ = arg:FindFirstChildOfClass("Humanoid")

		if humanoid_ then
			humanoid_.PlatformStand = false
			humanoid_.AutoRotate = true
		end
	end
end

Fun.startHipDanceV2 = function(arg)
	if not Fun.activeDanceDataV2 then
		return
	end
	Fun.stopHipDanceV2(arg)
	local humanoidRootPart = arg:WaitForChild("HumanoidRootPart")
	local humanoid_ = arg:WaitForChild("Humanoid")

	if Fun.RagdollRemote then
		Fun.RagdollRemote:FireServer(humanoidRootPart, 9999999)
	else
		humanoid_.PlatformStand = true
		humanoid_.AutoRotate = false
	end

	local position = humanoidRootPart.Position
	local walkSpeed_ = humanoid_.WalkSpeed > 0 and humanoid_.WalkSpeed or 16
	local n = 8
	local n2 = #Fun.activeDanceDataV2.frames
	if n2 == 0 then
		return
	end
	Fun.frameIndexV2 = 1
	Fun.frameTimerV2 = 0

	parseCFrameData = function(arg2)
		return CFrame.new(arg2[1], arg2[2], arg2[3], arg2[4], arg2[5], arg2[6], arg2[7], arg2[8], arg2[9], arg2[10], arg2[11], arg2[12])
	end

	Fun.poseConnectionV2 = Fun.RunService.Heartbeat:Connect(function(deltaTime)
		if not arg or not arg.Parent or not humanoidRootPart or not humanoidRootPart.Parent then
			return
		end
		local lookVector = Fun.camera.CFrame.LookVector
		local v4 = math.atan2(-lookVector.X, -lookVector.Z)
		local position2 = humanoidRootPart.Position

		if n < (position2 - position).Magnitude then
			position = position2
		end

		local moveDirection = humanoid_.MoveDirection

		if moveDirection.Magnitude > 0.01 then
			position += moveDirection * walkSpeed_ * deltaTime
		end

		local cFrame = CFrame.new(position) * CFrame.Angles(0, v4, 0)
		humanoidRootPart.CFrame = cFrame
		humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
		Fun.frameTimerV2 = Fun.frameTimerV2 + deltaTime
		local flag = false

		if Fun.activeDanceDataV2.interval <= Fun.frameTimerV2 then
			Fun.frameTimerV2 = Fun.frameTimerV2 - Fun.activeDanceDataV2.interval
			Fun.frameIndexV2 = Fun.frameIndexV2 + 1

			if n2 < Fun.frameIndexV2 then
				Fun.frameIndexV2 = 1
				flag = true
			end
		end

		local v5 = Fun.activeDanceDataV2.frames[Fun.frameIndexV2]
		local v6 = Fun.activeDanceDataV2.frames[Fun.frameIndexV2 < n2 and Fun.frameIndexV2 + 1 or 1]
		flag = flag and 1 or Fun.frameTimerV2 / Fun.activeDanceDataV2.interval

		for k, part_ in pairs(v5.parts) do
			if not tbl9[k] then
				local v7 = arg:FindFirstChild(k)

				if v7 and v7:IsA("BasePart") then
					local v8 = v6.parts[k] or part_
					v7.CFrame = cFrame * parseCFrameData(part_):Lerp(parseCFrameData(v8), flag)
					v7.AssemblyLinearVelocity = Vector3.zero
				end
			end
		end
	end)
end

Fun.refreshDanceV2List = function()
	Fun.currentDanceRawTableV2 = {}

	local ok, result = pcall(function()
		return game:HttpGet("https://raw.githubusercontent.com/dcus-official/PoopHub/refs/heads/main/Assets/Emote/List_Json.lua")
	end)

	if ok and result then
		local ok2, result2 = pcall(function()
			local chunk = loadstring(result)
			if chunk then
				return chunk()
			end
		end)

		if ok2 and type(result2) == "table" then
			for k, v4 in pairs(result2) do
				Fun.currentDanceRawTableV2[k] = v4
			end
		end
	end

	if not isfolder("PoopHub") then
		makefolder("PoopHub")
	end

	if not isfolder("PoopHub/FTAP") then
		makefolder("PoopHub/FTAP")
	end

	if not isfolder("PoopHub/FTAP/Emote") then
		makefolder("PoopHub/FTAP/Emote")
	end

	local ok2, result2 = pcall(function()
		return listfiles("PoopHub/FTAP/Emote")
	end)

	if ok2 and type(result2) == "table" then
		for _, v4 in ipairs(result2) do
			if v4:match("%.dance$") then
				local match = v4:gsub("\\", "/"):match("([^/]+)%.dance$")

				if match then
					local ok3, result3 = pcall(function()
						return readfile(v4)
					end)

					if ok3 and result3 then
						Fun.currentDanceRawTableV2[match] = result3
					end
				end
			end
		end
	end

	table.clear(Fun.danceListV2)

	for k in pairs(Fun.currentDanceRawTableV2) do
		table.insert(Fun.danceListV2, k)
	end

	table.sort(Fun.danceListV2)

	if #Fun.danceListV2 == 0 then
		table.insert(Fun.danceListV2, "No dances found")
	end

	if options.DanceV2Dropdown then
		options.DanceV2Dropdown:SetValues(Fun.danceListV2)

		if #Fun.danceListV2 > 0 and Fun.danceListV2[1] ~= "No dances found" then
			options.DanceV2Dropdown:SetValue(Fun.danceListV2[1])
		end
	end
end

Fun.SelectedPlayerForToy = nil
Fun.rotationX = 0
Fun.rotationY = 90
Fun.rotationZ = 25
Fun.typingAnimation = nil
Fun.typingTrack = nil
Fun.crouchAnimation = nil
Fun.crouchTrack = nil
Fun.throwedAnimation = nil
Fun.throwedTrack = nil
Fun.swayAnimation = nil
Fun.swayTrack = nil
Fun.jerkoffAnimation = nil
Fun.jerkoffTrack = nil
Fun.jerkoffAnimation2 = nil
Fun.jerkoffTrack2 = nil
Fun.animationSpeed = 1

Fun.InitializeAnimations = function()
	local animator = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):WaitForChild("Humanoid"):WaitForChild("Animator")

	if animator then
		Fun.typingAnimation = Instance.new("Animation")
		Fun.typingAnimation.AnimationId = "rbxassetid://7004578012"
		Fun.typingTrack = animator:LoadAnimation(Fun.typingAnimation)
		Fun.crouchAnimation = Instance.new("Animation")
		Fun.crouchAnimation.AnimationId = "rbxassetid://6980229055"
		Fun.crouchTrack = animator:LoadAnimation(Fun.crouchAnimation)
		Fun.throwedAnimation = Instance.new("Animation")
		Fun.throwedAnimation.AnimationId = "rbxassetid://7047322890"
		Fun.throwedTrack = animator:LoadAnimation(Fun.throwedAnimation)
		Fun.swayAnimation = Instance.new("Animation")
		Fun.swayAnimation.AnimationId = "rbxassetid://148840371"
		Fun.swayTrack = animator:LoadAnimation(Fun.swayAnimation)
		Fun.jerkoffAnimation = Instance.new("Animation")
		Fun.jerkoffAnimation.AnimationId = "rbxassetid://72042024"
		Fun.jerkoffTrack = animator:LoadAnimation(Fun.jerkoffAnimation)
		Fun.jerkoffAnimation2 = Instance.new("Animation")
		Fun.jerkoffAnimation2.AnimationId = "rbxassetid://168268306"
		Fun.jerkoffTrack2 = animator:LoadAnimation(Fun.jerkoffAnimation2)
	end
end

localPlayer.CharacterAdded:Connect(function()
	task.wait(1)
	pcall(Fun.InitializeAnimations)
end)

task.spawn(function()
	pcall(Fun.InitializeAnimations)
end)

Fun.spawnAndAttachToy = function(arg)
	if not Fun.SelectedPlayerForToy then
		return
	end

	pcall(function()
		local humanoidRootPart = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
		local character = Fun.SelectedPlayerForToy.Character
		if not character then
			return
		end
		local torso_ = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("HumanoidRootPart")
		if not torso_ then
			return
		end
		replicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(arg, humanoidRootPart.CFrame, Vector3.zero)
		task.wait(0.1)
		local v4 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
		if not v4 then
			return
		end
		local v5 = v4:FindFirstChild(arg)
		if not v5 then
			return
		end
		local stickyPart = v5:FindFirstChild("StickyPart")
		local soundPart = v5:FindFirstChild("SoundPart")
		if not stickyPart or not soundPart then
			return
		end
		replicatedStorage.GrabEvents.SetNetworkOwner:FireServer(soundPart, torso_.CFrame)
		local v6 = math.rad(Fun.rotationX)
		local v7 = math.rad(Fun.rotationY)
		local v8 = math.rad(Fun.rotationZ)
		replicatedStorage.PlayerEvents.StickyPartEvent:FireServer(stickyPart, torso_, CFrame.new(0, -1, 0) * CFrame.Angles(v6, v7, v8))
	end)
end

print("Poop HUB Fun (Obsidian) loaded successfully!")
_G.ShieldActive = false
local tbl10, n, v4

do
	local tbl11 = {}
	tbl10 = {}
	n = -4
	v4 = nil

	local tbl12 = {
		"GlassBoxGray",
		"PalletLightBrown",
		"BombMissile",
		"BombMissile",
		"BombMissile",
		"BombMissile",
		"BombMissile",
		"BombMissile",
	}

	local tbl13 = {
		{ x = 0, y = 10.5, z = 0, rx = -180, ry = 5, rz = 0 },
		{ x = 0, y = 2, z = 0, rx = 0, ry = 0, rz = 0 },
		{ x = 13, y = 6.5, z = -2, rx = 5, ry = -90, rz = 10 },
		{ x = 10.5, y = 6.5, z = -2, rx = 0, ry = -100, rz = 0 },
		{ x = 7, y = 6.5, z = -2, rx = 0, ry = -95, rz = 0 },
		{ x = -12, y = 6.5, z = -2, rx = 0, ry = -100, rz = 0 },
		{ x = -9, y = 6.5, z = -2, rx = -180, ry = 100, rz = 0 },
		{ x = -6, y = 6.5, z = -2, rx = 0, ry = -95, rz = 5 },
	}

	toyGetOffsetCFrame = function(arg)
		local cframe = CFrame.Angles
		local rad = math.rad
		local rz = arg.rz
		return CFrame.new(arg.x, arg.y + n, arg.z) * cframe(math.rad(arg.rx), math.rad(arg.ry), rad(rz))
	end

	toyGetShieldMainPart = function(arg)
		return arg:FindFirstChild("PyramidOctagon") or arg:FindFirstChild("SoundPart") or arg:FindFirstChild("Handle") or arg:FindFirstChildWhichIsA("BasePart")
	end

	toyClaimAndMove = function(arg, cFrame)
		pcall(function()
			setNetworkOwner:FireServer(arg, arg.CFrame)
			task.wait(0.05)
			arg.CFrame = cFrame
			arg.AssemblyLinearVelocity = Vector3.zero
			arg.AssemblyAngularVelocity = Vector3.zero
			setNetworkOwner:FireServer(arg, cFrame)
		end)
	end

	stopShield = function()
		_G.ShieldActive = false

		for _, v5 in ipairs(tbl11) do
			pcall(function()
				v5:Disconnect()
			end)
		end

		tbl11 = {}
		tbl10 = {}
	end

	startShield = function()
		stopShield()
		_G.ShieldActive = true
		local humanoidRootPart = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
		local v5 = workspace_:FindFirstChild(localPlayer.Name .. "SpawnedInToys") or workspace_:WaitForChild(localPlayer.Name .. "SpawnedInToys", 10)
		if not v5 then
			return
		end

		for _, child in ipairs(v5:GetChildren()) do
			if child.Name == "GlassBoxGray" or child.Name == "PalletLightBrown" or child.Name == "BombMissile" then
				pcall(function()
					local destroyToy = replicatedStorage.MenuToys:FindFirstChild("DestroyToy")

					if destroyToy then
						destroyToy:FireServer(child)
					end
				end)

				task.wait(0.05)
			end
		end

		task.wait(0.3)
		local n2 = humanoidRootPart.CFrame * CFrame.new(0, 0, -3)

		for _, v6 in ipairs(tbl12) do
			pcall(function()
				spawnToyRemoteFunction:InvokeServer(v6, n2, Vector3.zero)
			end)

			task.wait(0.15)
		end

		task.wait(0.3)
		local tbl14 = {}
		local n3 = 0

		for _, child in ipairs(v5:GetChildren()) do
			if child.Name == "GlassBoxGray" and not tbl14[1] then
				local v6 = toyGetShieldMainPart(child)

				if v6 then
					tbl14[1] = { part = v6, model = child }
				end
			elseif child.Name == "PalletLightBrown" and not tbl14[2] then
				local v6 = toyGetShieldMainPart(child)

				if v6 then
					tbl14[2] = { part = v6, model = child }
				end
			elseif child.Name == "BombMissile" and n3 < 6 then
				local v6 = toyGetShieldMainPart(child)

				if v6 then
					n3 += 1
					tbl14[2 + n3] = { part = v6, model = child }
				end
			end
		end

		for i = 1, 8 do
			local v6 = tbl14[i]

			if v6 and v6.part then
				local part_ = v6.part
				local cFrame = humanoidRootPart.CFrame * toyGetOffsetCFrame(tbl13[i])

				pcall(function()
					for _, descendant in ipairs(v6.model:GetDescendants()) do
						if descendant:IsA("BasePart") then
							descendant.CanCollide = false
							descendant.CanTouch = false
						end
					end
				end)

				toyClaimAndMove(part_, cFrame)
				local bodyPosition = Instance.new("BodyPosition")
				bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bodyPosition.P = 50000
				bodyPosition.D = 1000
				bodyPosition.Position = cFrame.Position
				bodyPosition.Parent = part_
				local bodyGyro = Instance.new("BodyGyro")
				bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
				bodyGyro.P = 50000
				bodyGyro.D = 1000
				bodyGyro.CFrame = cFrame
				bodyGyro.Parent = part_
				table.insert(tbl10, { part = part_, model = v6.model, index = i, bp = bodyPosition, bg = bodyGyro, launched = false })
			end
		end

		local connection3 = runService.Heartbeat:Connect(function()
			if not _G.ShieldActive then
				return
			end
			local character = localPlayer.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			if not character then
				return
			end

			for _, v6 in ipairs(tbl10) do
				if not v6.launched and v6.part and v6.part.Parent then
					local cFrame = character.CFrame * toyGetOffsetCFrame(tbl13[v6.index])

					pcall(function()
						setNetworkOwner:FireServer(v6.part, cFrame)
					end)

					v6.bp.Position = cFrame.Position
					v6.bg.CFrame = cFrame
				end
			end
		end)

		table.insert(tbl11, connection3)
	end
end

shieldObeyTarget = function(arg, arg2)
	if not arg or not arg.part or not arg.part.Parent then
		return
	end
	local model = arg.model
	local part_ = arg.part
	arg.launched = true

	if arg.bp then
		arg.bp.MaxForce = Vector3.zero
	end

	if arg.bg then
		arg.bg.MaxTorque = Vector3.zero
	end

	task.spawn(function()
		local button = model and model:FindFirstChild("Button")

		if button then
			pcall(function()
				setNetworkOwner:FireServer(button, button.CFrame)
			end)

			task.wait(0.05)
		end

		pcall(function()
			setNetworkOwner:FireServer(part_, part_.CFrame)
		end)

		task.wait(0.05)
		local connection3 = nil

		connection3 = runService.Heartbeat:Connect(function()
			if not part_ or not part_.Parent or not arg2 or not arg2.Parent then
				if connection3 then
					connection3:Disconnect()
				end

				return
			end

			pcall(function()
				if button and button.Parent then
					setNetworkOwner:FireServer(button, arg2.CFrame)
				end

				setNetworkOwner:FireServer(part_, arg2.CFrame)
				part_.CFrame = arg2.CFrame
				part_.AssemblyLinearVelocity = Vector3.zero
				part_.AssemblyAngularVelocity = Vector3.zero
			end)
		end)
	end)
end

getRandomBombData = function()
	local tbl11 = {}

	for _, v5 in ipairs(tbl10) do
		if v5.index >= 3 and not v5.launched then
			table.insert(tbl11, v5)
		end
	end

	if #tbl11 == 0 then
		return nil
	end
	return tbl11[math.random(1, #tbl11)]
end

_G.TentacleActive = false
local n2, tbl11, n3, n4, n5, flag, n6, n7, str

do
	local tbl12 = {}
	local tbl13 = {}
	n2 = 1
	tbl11 = {}

	for i = 1, 4 do
		tbl11[i] = { x = 0, y = 0, z = 0, trackingTarget = nil, trackingEnabled = false }
	end

	n3 = 40
	n4 = 0
	local n8 = 6
	n5 = 4
	flag = false
	n6 = 1
	n7 = 0
	str = "My Toys"
	local tbl14 = { { 0 }, { -2.5, 2.5 }, { -4, 0, 4 }, { -5, -1.7, 1.7, 5 } }

	getTentacleMainPart = function(arg)
		return arg:FindFirstChild("SquareTaper") or arg:FindFirstChild("PyramidOctagon") or arg:FindFirstChild("SoundPart") or arg:FindFirstChild("Handle") or arg:FindFirstChildWhichIsA("BasePart")
	end

	stopTentacle = function()
		_G.TentacleActive = false

		for _, v5 in ipairs(tbl12) do
			pcall(function()
				v5:Disconnect()
			end)
		end

		tbl12 = {}
		tbl13 = {}
	end

	getTentSegmentPosition = function(arg, arg2, arg3, arg4, arg5, arg6)
		local n9 = arg6 or 0
		local n10 = arg2 / n8
		local cframe = CFrame.Angles
		return (arg * CFrame.new(n9, 1, 3) * cframe(math.rad(arg4 * n3 * n10), math.rad(arg3 * n3 * n10 + n4 * n10), math.rad(arg5 * n3 * n10)) * CFrame.new(0, n5 * arg2, 0)).Position
	end

	getTentSegmentCFrame = function(arg, arg2, arg3, arg4, arg5, arg6)
		local v5 = getTentSegmentPosition(arg, arg2, arg3, arg4, arg5, arg6)
		local n9

		if arg2 < n8 then
			n9 = getTentSegmentPosition(arg, arg2 + 1, arg3, arg4, arg5, arg6) - v5
		else
			n9 = v5 - getTentSegmentPosition(arg, arg2 - 1, arg3, arg4, arg5, arg6)
		end

		if n9.Magnitude < 0.001 then
			return CFrame.new(v5)
		end
		local unit = n9.Unit
		local v6 = (Vector3.new(0, 1, 0)):Cross(unit)
		local vector = v6.Magnitude < 0.001 and Vector3.new(1, 0, 0) or v6.Unit
		return CFrame.fromMatrix(v5, vector, unit, -unit:Cross(vector).Unit)
	end

	calcStickToTarget = function(arg, arg2, arg3)
		local unit = arg:VectorToObjectSpace(arg2 - (arg * CFrame.new(arg3 or 0, 1, 3)).Position).Unit
		return math.clamp(unit.X * 3, -3, 3), math.clamp(unit.Y * 3, -3, 3), math.clamp(-unit.Z * 3, -3, 3)
	end

	startTentacle = function()
		stopTentacle()
		_G.TentacleActive = true
		local humanoidRootPart = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
		local flag2 = str ~= "My Toys"
		local str2 = str:gsub(" ", "")
		local plotItems = workspace_:FindFirstChild(localPlayer.Name .. "SpawnedInToys") or workspace_:WaitForChild(localPlayer.Name .. "SpawnedInToys", 10)
		if not plotItems then
			return
		end

		for _, child in ipairs(plotItems:GetChildren()) do
			if child.Name == "TetracubeI" then
				pcall(function()
					local destroyToy = replicatedStorage.MenuToys:FindFirstChild("DestroyToy")

					if destroyToy then
						destroyToy:FireServer(child)
					end
				end)

				task.wait(0.05)
			end
		end

		task.wait(0.3)
		local n9 = n8 * n2
		local n10 = humanoidRootPart.CFrame * CFrame.new(0, 0, 3)

		for i = 1, n9 do
			pcall(function()
				spawnToyRemoteFunction:InvokeServer("TetracubeI", n10, Vector3.zero)
			end)

			task.wait(0.15)
		end

		task.wait(0.3)

		if flag2 then
			local plotItems2 = workspace_:FindFirstChild("PlotItems")
			plotItems = plotItems2 and plotItems2:FindFirstChild(str2)

			if not plotItems then
				task.wait(1)
				plotItems = workspace_:FindFirstChild("PlotItems")
				plotItems = plotItems and plotItems:FindFirstChild(str2)
			end
		end

		if not plotItems then
			return
		end
		local now = tick()
		local tbl15 = {}

		for _, child in ipairs(plotItems:GetChildren()) do
			if child.Name == "TetracubeI" and #tbl15 < n9 then
				local v5 = getTentacleMainPart(child)

				if v5 then
					pcall(function()
						for _, descendant in ipairs(child:GetDescendants()) do
							if descendant:IsA("BasePart") then
								descendant.CanCollide = false
								descendant.CanTouch = false
							end
						end
					end)

					table.insert(tbl15, { part = v5, model = child })
				end
			end
		end

		local tbl16 = tbl14[n2] or { 0 }

		for i = 1, n2 do
			local n11 = tbl16[i] or 0
			local tbl17 = {}

			for i2 = 1, 6 do
				local v5 = tbl15[(i - 1) * n8 + i2]

				if v5 then
					local v6 = getTentSegmentCFrame(humanoidRootPart.CFrame, i2, tbl11[i].x, tbl11[i].y, tbl11[i].z, n11)

					if flag2 then
						pcall(function()
							setNetworkOwner:FireServer(v5.part, v5.part.CFrame)
							task.wait(0.05)
							v5.part.CFrame = v6
							v5.part.AssemblyLinearVelocity = Vector3.zero
							v5.part.AssemblyAngularVelocity = Vector3.zero
							setNetworkOwner:FireServer(v5.part, v6)
						end)
					else
						toyClaimAndMove(v5.part, v6)
					end

					local bodyPosition = Instance.new("BodyPosition")
					bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
					bodyPosition.P = 50000
					bodyPosition.D = 1000
					bodyPosition.Position = v6.Position
					bodyPosition.Parent = v5.part
					local bodyGyro = Instance.new("BodyGyro")
					bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
					bodyGyro.P = 50000
					bodyGyro.D = 1000
					bodyGyro.CFrame = v6
					bodyGyro.Parent = v5.part
					table.insert(tbl17, { part = v5.part, model = v5.model, index = i2, bp = bodyPosition, bg = bodyGyro })
				end
			end

			tbl13[i] = { parts = tbl17, sideOffset = n11 }
		end

		local connection3 = runService.Heartbeat:Connect(function(deltaTime)
			if not _G.TentacleActive then
				return
			end
			local character = localPlayer.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			if not character then
				return
			end
			local n11 = tick() - now
			local flag3 = not flag2 or n11 < 5

			if flag then
				n7 += deltaTime * n6
			end

			for i = 1, n2 do
				local v5 = tbl13[i]

				if v5 then
					local v6 = tbl11[i]
					local sideOffset = v5.sideOffset
					local x = v6.x
					local y = v6.y
					local z = v6.z

					if flag then
						local n12 = n7 + (i - 1) * 3.1415926535897931 * 0.5
						x += math.sin(n12 * 1.3) * 2
						y += math.sin(n12 * 0.9 + 1) * 1.5
						z += math.cos(n12 * 1.1 + 2) * 1.5
					end

					if v6.trackingEnabled and v6.trackingTarget then
						local character2 = v6.trackingTarget.Character
						character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

						if character2 then
							x, y, z = calcStickToTarget(character.CFrame, character2.Position, sideOffset)
						end
					end

					for _, part_ in ipairs(v5.parts) do
						if part_.part and part_.part.Parent then
							local v7 = getTentSegmentCFrame(character.CFrame, part_.index, x, y, z, sideOffset)

							if flag3 then
								pcall(function()
									setNetworkOwner:FireServer(part_.part, v7)
								end)
							end

							part_.bp.Position = v7.Position
							part_.bg.CFrame = v7
						end
					end
				end
			end
		end)

		table.insert(tbl12, connection3)
	end
end

_G.PropsActive = false

do
	local tbl12 = {}
	local tbl13 = {}
	local flag2 = false
	local str2 = "Fly"
	local n8 = 0
	local n9 = 1
	local n10 = 1
	local str3 = "My Toys"
	local n11 = 1

	local tbl14 = {
		{ name = "LadderLightBrown", count = 3 },
		{ name = "PalletLightBrown", count = 6 },
		{ name = "SpotlightRed", count = 2 },
		{ name = "YouDecoy", count = 1 },
	}

	local tbl15 = {
		DEFAULT = {
			{ x = -0.7, y = 8, z = 5.1, rx = 0, ry = 0, rz = 0 },
			{ x = 6.5, y = 8, z = 0.2, rx = -180, ry = 89, rz = 0 },
			{ x = -5.6, y = 8, z = -0.7, rx = 0, ry = 89, rz = -180 },
			{ x = 0.2, y = 20, z = 0, rx = 0, ry = 0, rz = 0 },
			{ x = 0.2, y = 30.2, z = 0, rx = 0, ry = 0, rz = 0 },
			{ x = 0.2, y = 24.9, z = -5.1, rx = 89, ry = 0, rz = 0 },
			{ x = 6, y = 24.9, z = 0, rx = 89, ry = -180, rz = 89 },
			{ x = 0.2, y = 24.9, z = 5.1, rx = 89, ry = 0, rz = 0 },
			{ x = -5.1, y = 24.9, z = 0, rx = 89, ry = 0, rz = 89 },
			{ x = -2.2, y = 26.3, z = -7, rx = 0, ry = -87, rz = 0 },
			{ x = 3.6, y = 24.9, z = -7.5, rx = -180, ry = 89, rz = 0 },
			{ x = 0, y = 23, z = -3.1, rx = 0, ry = 0, rz = 0 },
		},
		FORWARD = {
			{ x = -0.7, y = 8, z = 5.1, rx = -34, ry = 0, rz = 0 },
			{ x = 6.5, y = 8, z = 4.6, rx = -31, ry = 89, rz = 0 },
			{ x = -5.6, y = 8, z = 3.6, rx = -34, ry = 89, rz = -180 },
			{ x = 0.2, y = 20, z = 0, rx = 0, ry = 0, rz = 0 },
			{ x = 0.2, y = 30.2, z = 0, rx = 0, ry = 0, rz = 0 },
			{ x = 0.2, y = 24.9, z = -5.1, rx = 89, ry = 0, rz = 0 },
			{ x = 6, y = 24.9, z = 0, rx = 89, ry = -180, rz = 89 },
			{ x = 0.2, y = 24.9, z = 5.1, rx = 89, ry = 0, rz = 0 },
			{ x = -5.1, y = 24.9, z = 0, rx = 89, ry = 0, rz = 89 },
			{ x = -2.2, y = 26.3, z = -7, rx = 0, ry = -87, rz = 0 },
			{ x = 3.6, y = 24.9, z = -7.5, rx = -180, ry = 89, rz = 0 },
			{ x = 0, y = 23, z = -3.1, rx = 0, ry = 0, rz = 0 },
		},
		BACKWARD = {
			{ x = -0.7, y = 8, z = -5.1, rx = 46, ry = 0, rz = 0 },
			{ x = 6.5, y = 8, z = 0.7, rx = 35, ry = 89, rz = 0 },
			{ x = -5.6, y = 8, z = -2.2, rx = 35, ry = 89, rz = -180 },
			{ x = 0.2, y = 20, z = 0, rx = 0, ry = 0, rz = 0 },
			{ x = 0.2, y = 30.2, z = 0, rx = 0, ry = 0, rz = 0 },
			{ x = 0.2, y = 24.9, z = -5.1, rx = 89, ry = 0, rz = 0 },
			{ x = 6, y = 24.9, z = 0, rx = 89, ry = -180, rz = 89 },
			{ x = 0.2, y = 24.9, z = 5.1, rx = 89, ry = 0, rz = 0 },
			{ x = -5.1, y = 24.9, z = 0, rx = 89, ry = 0, rz = 89 },
			{ x = -2.2, y = 26.3, z = -7, rx = 0, ry = -87, rz = 0 },
			{ x = 3.6, y = 24.9, z = -7.5, rx = -180, ry = 89, rz = 0 },
			{ x = 0, y = 23, z = -3.1, rx = 0, ry = 0, rz = 0 },
		},
		HEAD_OVERRIDES = {
			[6] = { x = 0.2, y = 34.5, z = -5.1, rx = 89, ry = 0, rz = 0 },
			[10] = { x = -2.2, y = 36, z = -7, rx = 0, ry = -87, rz = 0 },
			[11] = { x = 3.6, y = 35, z = -7.5, rx = -180, ry = 89, rz = 0 },
		},
	}

	local tbl16 = {}
	local n12 = 0

	for _, v5 in ipairs(tbl14) do
		for i = 1, v5.count do
			n12 += 1
			local v6 = tbl15.DEFAULT[n12]

			tbl16[n12] = {
				name = v5.name,
				localIndex = i,
				x = v6.x,
				y = v6.y,
				z = v6.z,
				rx = v6.rx,
				ry = v6.ry,
				rz = v6.rz,
			}
		end
	end

	propToCF = function(arg)
		local cframe = CFrame.Angles
		local rad = math.rad
		local rz = arg.rz
		return CFrame.new(arg.x, arg.y, arg.z) * cframe(math.rad(arg.rx), math.rad(arg.ry), rad(rz))
	end

	propLerpPreset = function(arg, arg2, arg3)
		li = function(arg4, arg5)
			return arg4 + (arg5 - arg4) * arg3
		end

		la = function(arg4, arg5)
			return arg4 + ((arg5 - arg4 + 180) % 360 - 180) * arg3
		end

		return {
			x = li(arg.x, arg2.x),
			y = li(arg.y, arg2.y),
			z = li(arg.z, arg2.z),
			rx = la(arg.rx, arg2.rx),
			ry = la(arg.ry, arg2.ry),
			rz = la(arg.rz, arg2.rz),
		}
	end

	propGetPart = function(arg, arg2)
		if arg == "SpotlightRed" then
			return arg2:FindFirstChild("LightPart") or arg2:FindFirstChildWhichIsA("BasePart")
		end

		if arg == "YouDecoy" then
			return arg2:FindFirstChild("Torso") or arg2:FindFirstChild("HumanoidRootPart") or arg2:FindFirstChildWhichIsA("BasePart")
		end
		return arg2:FindFirstChild("PyramidOctagon") or arg2:FindFirstChild("SquareTaper") or arg2:FindFirstChild("SoundPart") or arg2:FindFirstChild("Handle") or arg2:FindFirstChildWhichIsA("BasePart")
	end

	propClaimAndMove = function(arg, cFrame)
		pcall(function()
			setNetworkOwner:FireServer(arg, arg.CFrame)
			task.wait(0.05)
			arg.CFrame = cFrame
			arg.AssemblyLinearVelocity = Vector3.zero
			arg.AssemblyAngularVelocity = Vector3.zero
			setNetworkOwner:FireServer(arg, cFrame)
		end)
	end

	propIsMoving = function(arg)
		local v5 = arg.CFrame:VectorToObjectSpace(arg.AssemblyLinearVelocity)
		return math.abs(v5.X) > n11 or math.abs(v5.Z) > n11
	end

	propGetWalkState = function(arg)
		local v5 = arg.CFrame:VectorToObjectSpace(arg.AssemblyLinearVelocity)
		if v5.Z < -n11 then
			return 1
		end

		if v5.Z > n11 then
			return -1
		end
		return 0
	end

	propGetTargetCF = function(arg, arg2, arg3, arg4)
		if str2 == "Walk" then
			arg4 = arg4 and propLerpPreset(tbl15.FORWARD[arg], tbl15.BACKWARD[arg], n8) or tbl15.DEFAULT[arg]
		else
			arg4 = arg3 == 1 and tbl15.FORWARD[arg] or arg3 == -1 and tbl15.BACKWARD[arg] or tbl15.DEFAULT[arg]
		end

		if flag2 and tbl15.HEAD_OVERRIDES[arg] then
			arg4 = tbl15.HEAD_OVERRIDES[arg]
		end

		local v5 = tbl16[arg]
		local v6 = tbl15.DEFAULT[arg]

		return arg2.CFrame * propToCF({
			x = arg4.x + v5.x - v6.x,
			y = arg4.y + v5.y - v6.y,
			z = arg4.z + v5.z - v6.z,
			rx = arg4.rx + v5.rx - v6.rx,
			ry = arg4.ry + v5.ry - v6.ry,
			rz = arg4.rz + v5.rz - v6.rz,
		})
	end

	stopProps = function()
		_G.PropsActive = false

		for _, v5 in ipairs(tbl12) do
			pcall(function()
				v5:Disconnect()
			end)
		end

		tbl12 = {}
		tbl13 = {}
	end

	startProps = function()
		stopProps()
		_G.PropsActive = true
		local humanoidRootPart = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
		local flag3 = str3 ~= "My Toys"
		local str4 = str3:gsub(" ", "")
		local plotItems = workspace_:FindFirstChild(localPlayer.Name .. "SpawnedInToys") or workspace_:WaitForChild(localPlayer.Name .. "SpawnedInToys", 10)
		if not plotItems then
			return
		end
		local destroyToy = replicatedStorage.MenuToys:FindFirstChild("DestroyToy")

		for _, child in ipairs(plotItems:GetChildren()) do
			for _, v5 in ipairs(tbl14) do
				if child.Name == v5.name then
					pcall(function()
						if destroyToy then
							destroyToy:FireServer(child)
						end
					end)

					task.wait(0.05)
					break
				end
			end
		end

		task.wait(0.3)
		local n13 = humanoidRootPart.CFrame * CFrame.new(0, 0, -3)

		for _, v5 in ipairs(tbl14) do
			for i = 1, v5.count do
				pcall(function()
					spawnToyRemoteFunction:InvokeServer(v5.name, n13, Vector3.zero)
				end)

				task.wait(0.15)
			end
		end

		task.wait(0.4)

		if flag3 then
			plotItems = workspace_:FindFirstChild("PlotItems")
			plotItems = plotItems and plotItems:FindFirstChild(str4)

			if not plotItems then
				task.wait(1)
				plotItems = workspace_:FindFirstChild("PlotItems")
				plotItems = plotItems and plotItems:FindFirstChild(str4)
			end
		end

		if not plotItems then
			return
		end
		local now = tick()
		local tbl17 = {}

		for i = 1, n12 do
			for _, child in ipairs(plotItems:GetChildren()) do
				if child.Name == tbl16[i].name then
					local flag4 = false

					for _, v5 in ipairs(tbl17) do
						v5 = v5 and v5.model == child
						if v5 then
							flag4 = true
							break
						end
					end

					if not flag4 then
						local v5 = propGetPart(tbl16[i].name, child)
						if v5 then
							tbl17[i] = { part = v5, model = child }
							break
						end
					end
				end
			end
		end

		for i = 1, n12 do
			local v5 = tbl17[i]

			if v5 then
				pcall(function()
					for _, descendant in ipairs(v5.model:GetDescendants()) do
						if descendant:IsA("BasePart") then
							descendant.CanCollide = false
							descendant.CanTouch = false
						end
					end
				end)

				local cFrame = humanoidRootPart.CFrame * propToCF(tbl16[i])

				if flag3 then
					pcall(function()
						setNetworkOwner:FireServer(v5.part, v5.part.CFrame)
						task.wait(0.05)
						v5.part.CFrame = cFrame
						v5.part.AssemblyLinearVelocity = Vector3.zero
						v5.part.AssemblyAngularVelocity = Vector3.zero
						setNetworkOwner:FireServer(v5.part, cFrame)
					end)
				else
					propClaimAndMove(v5.part, cFrame)
				end

				local bodyPosition = Instance.new("BodyPosition")
				bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bodyPosition.P = 50000
				bodyPosition.D = 1000
				bodyPosition.Position = cFrame.Position
				bodyPosition.Parent = v5.part
				local bodyGyro = Instance.new("BodyGyro")
				bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
				bodyGyro.P = 50000
				bodyGyro.D = 1000
				bodyGyro.CFrame = cFrame
				bodyGyro.Parent = v5.part
				table.insert(tbl13, { part = v5.part, model = v5.model, gi = i, bp = bodyPosition, bg = bodyGyro })
			end
		end

		table.insert(tbl12, runService.Heartbeat:Connect(function(deltaTime)
			if not _G.PropsActive then
				return
			end
			local character = localPlayer.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			if not character then
				return
			end
			local n14 = tick() - now
			local flag4 = not flag3 or n14 < 5
			local v5 = propGetWalkState(character)
			local v6 = propIsMoving(character)

			if str2 == "Walk" then
				if v6 then
					n8 += n9 * n10 * deltaTime

					if n8 >= 1 then
						n8 = 1
						n9 = -1
					elseif n8 <= 0 then
						n8 = 0
						n9 = 1
					end
				else
					n8 = 0
					n9 = 1
				end
			end

			for _, v7 in ipairs(tbl13) do
				if v7.part and v7.part.Parent then
					local v8 = propGetTargetCF(v7.gi, character, v5, v6)

					if flag4 then
						pcall(function()
							setNetworkOwner:FireServer(v7.part, v8)
						end)
					end

					v7.bp.Position = v8.Position
					v7.bg.CFrame = v8
				end
			end
		end))
	end

	propToJSON = function()
		local tbl17 = {}

		for i = 1, n12 do
			local v5 = tbl16[i]
			table.insert(tbl17, string.format("  {\"name\":\"%s\",\"index\":%d,\"x\":%g,\"y\":%g,\"z\":%g,\"rx\":%g,\"ry\":%g,\"rz\":%g}", v5.name, v5.localIndex, v5.x, v5.y, v5.z, v5.rx, v5.ry, v5.rz))
		end

		return "[\n" .. table.concat(tbl17, ",\n") .. "\n]"
	end

	_G.prop_startProps = startProps
	_G.prop_stopProps = stopProps
	_G.prop_toJSON = propToJSON

	_G.prop_setMode = function(arg)
		str2 = arg
		n8 = 0
		n9 = 1
	end

	_G.prop_setAnimSpeed = function(arg)
		n10 = arg
	end

	_G.prop_setHeadOn = function(arg)
		flag2 = arg
	end

	_G.prop_setSearchMode = function(arg)
		str3 = arg
	end
end

local tbl12 = {}

updateKickDropdown = function(arg)
	if arg then
		pcall(function()
			local tbl13 = { "All Players" }

			for _, player in ipairs(players:GetPlayers()) do
				if player ~= localPlayer then
					table.insert(tbl13, player.DisplayName .. " @" .. player.Name)
				end
			end

			arg:SetValues(tbl13)
		end)
	end
end

setupKickDropdown = function(arg)
	updateKickDropdown(arg)
	table.insert(tbl12, arg)
end

_refreshKickDropdowns = function()
	for _, v5 in ipairs(tbl12) do
		updateKickDropdown(v5)
	end
end

players.PlayerAdded:Connect(function()
	task.wait(1)
	_refreshKickDropdowns()
end)

players.PlayerRemoving:Connect(function()
	task.wait(1)
	_refreshKickDropdowns()
end)

getKickTargets = function()
	local tbl13 = {}
	local kickTargetPlayerDisplay = tbl2.kickTargetPlayerDisplay
	local v5 = ExtractUsername(kickTargetPlayerDisplay)

	for _, player in ipairs(players:GetPlayers()) do
		if player ~= localPlayer then
			local kickExcludeFriends = tbl2.kickExcludeFriends and localPlayer:IsFriendsWith(player.UserId)
			local flag2 = false

			if kickExcludeFriends then
				flag2 = true
			end

			if tbl2.kickUseWhitelist and isWhitelisted(player) then
				flag2 = true
			end

			if not flag2 then
				if kickTargetPlayerDisplay == "All Players" or not v5 then
					table.insert(tbl13, player)
				elseif player.Name == v5 then
					table.insert(tbl13, player)
				end
			end
		end
	end

	return tbl13
end

IsInPlot = function(arg)
	if not arg then
		return false
	end
	local inPlot = arg:FindFirstChild("InPlot")
	if inPlot and inPlot:IsA("BoolValue") then
		return inPlot.Value
	end
	local attribute = arg:GetAttribute("InPlot")
	if typeof(attribute) == "boolean" then
		return attribute
	end
	local character = arg.Character
	if not character then
		return false
	end
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
	if not humanoidRootPart then
		return false
	end
	local plots = workspace:FindFirstChild("Plots") or workspace:FindFirstChild("PlayerPlots") or workspace:FindFirstChild("Houses") or workspace:FindFirstChild("PlotsFolder")
	if not plots then
		return false
	end
	local v5 = nil

	for _, child in ipairs(plots:GetChildren()) do
		if child:IsA("Model") then
			local attribute2 = child:GetAttribute("OwnerUserId") or child:GetAttribute("OwnerId")
			local flag2 = typeof(attribute2) == "number" and attribute2 == arg.UserId
			local flag3 = false

			if flag2 then
				flag3 = true
			end

			if not flag3 then
				local attribute3 = child:GetAttribute("OwnerName")

				if typeof(attribute3) == "string" and attribute3 == arg.Name then
					flag3 = true
				end
			end

			if not flag3 then
				local owner = child:FindFirstChild("Owner") or child:FindFirstChild("PlotOwner")

				if owner then
					if owner:IsA("ObjectValue") and owner.Value == arg or owner:IsA("IntValue") and owner.Value == arg.UserId or owner:IsA("StringValue") and owner.Value == arg.Name then
						flag3 = true
					end
				end
			end

			if not flag3 then
				local ownerUserId = child:FindFirstChild("OwnerUserId") or child:FindFirstChild("OwnerId")

				if ownerUserId and ownerUserId:IsA("IntValue") and ownerUserId.Value == arg.UserId then
					flag3 = true
				end
			end

			if not flag3 then
				if child.Name == arg.Name or child.Name == tostring(arg.UserId) then
					flag3 = true
				end
			end

			if flag3 then
				v5 = child
				break
			else
				v5 = nil
			end
		else
			v5 = nil
		end
	end

	if not v5 then
		for _, descendant in ipairs(plots:GetDescendants()) do
			if descendant:IsA("Model") then
				local attribute2 = descendant:GetAttribute("OwnerUserId") or descendant:GetAttribute("OwnerId")
				local flag2 = typeof(attribute2) == "number" and attribute2 == arg.UserId
				local flag3 = false

				if flag2 then
					flag3 = true
				end

				local flag4

				if not flag3 then
					local attribute3 = descendant:GetAttribute("OwnerName")

					if typeof(attribute3) == "string" and attribute3 == arg.Name then
						flag4 = true
					else
						flag4 = flag3
					end
				else
					flag4 = flag3
				end

				if not flag4 then
					local owner = descendant:FindFirstChild("Owner") or descendant:FindFirstChild("PlotOwner")

					if owner then
						if owner:IsA("ObjectValue") and owner.Value == arg or owner:IsA("IntValue") and owner.Value == arg.UserId or owner:IsA("StringValue") and owner.Value == arg.Name then
							flag4 = true
						end
					end
				end

				if not flag4 then
					local ownerUserId = descendant:FindFirstChild("OwnerUserId") or descendant:FindFirstChild("OwnerId")

					if ownerUserId and ownerUserId:IsA("IntValue") and ownerUserId.Value == arg.UserId then
						flag4 = true
					end
				end

				local flag5

				if not flag4 then
					if descendant.Name == arg.Name or descendant.Name == tostring(arg.UserId) then
						flag5 = true
					else
						flag5 = flag4
					end
				else
					flag5 = flag4
				end

				if flag5 then
					v5 = descendant
					break
				end
			end
		end
	end

	if not v5 then
		return false
	end
	local v6 = nil

	for _, v7 in ipairs({ "PlotArea", "Area", "Region", "Bounds", "Boundary", "Base", "Baseplate", "HouseArea" }) do
		v6 = v5:FindFirstChild(v7, true)
		if not (v6 and v6:IsA("BasePart")) then
			v6 = nil
			continue
		end
		break
	end

	if v6 then
		local v7 = v6.CFrame:PointToObjectSpace(humanoidRootPart.Position)
		local n8 = v6.Size * 0.5
		local x = n8.X
		local flag2 = math.abs(v7.X) <= x

		if flag2 then
			local y = n8.Y
			flag2 = math.abs(v7.Y) <= y
		end

		if flag2 then
			local z = n8.Z
			flag2 = math.abs(v7.Z) <= z
		end

		return flag2
	end

	local boundingBox, v7 = v5:GetBoundingBox()
	local v8 = boundingBox:PointToObjectSpace(humanoidRootPart.Position)
	local n8 = (v7 + Vector3.new(6, 10, 6)) * 0.5
	local x = n8.X
	local flag2 = math.abs(v8.X) <= x

	if flag2 then
		local y = n8.Y
		flag2 = math.abs(v8.Y) <= y
	end

	if flag2 then
		local z = n8.Z
		flag2 = math.abs(v8.Z) <= z
	end

	return flag2
end

getAllPlayers = function()
	local tbl13 = {}

	for _, player in pairs(players:GetPlayers()) do
		if player ~= localPlayer then
			table.insert(tbl13, player)
		end
	end

	return tbl13
end

local grabEvents = replicatedStorage:FindFirstChild("GrabEvents")

spamOwnership = function(arg)
	if not grabEvents then
		return
	end
	local setNetworkOwner2 = grabEvents:FindFirstChild("SetNetworkOwner")

	if setNetworkOwner2 and arg then
		pcall(function()
			setNetworkOwner2:FireServer(arg, arg.CFrame)
		end)
	end
end

teleportToPlayer = function(arg, arg2)
	if not arg or not arg2 then
		return
	end

	pcall(function()
		arg.CFrame = arg2.CFrame * CFrame.new(0, 0, 3)
		arg.AssemblyLinearVelocity = Vector3.zero
	end)
end

destroyLineOnPlayer = function(arg)
	if not grabEvents then
		return
	end
	local createGrabLine = grabEvents:FindFirstChild("CreateGrabLine")
	local destroyGrabLine = grabEvents:FindFirstChild("DestroyGrabLine")
	if not createGrabLine or not destroyGrabLine then
		return
	end

	pcall(function()
		createGrabLine:FireServer(arg, CFrame.new(3e9, 4e9, 2e9))
		task.wait()
		destroyGrabLine:FireServer(arg)
	end)
end

do
	local tbl13 = {}
	local flag2 = false
	local flag3 = false
	tbl2.lineLagIntensity = 520
	tbl2.lineLagDelay = 1

	startLineLag = function()
		if flag2 then
			return
		end
		flag2 = true

		local thread = coroutine.create(function()
			while flag2 do
				local grabEvents2 = replicatedStorage:FindFirstChild("GrabEvents")
				grabEvents2 = grabEvents2 and grabEvents2:FindFirstChild("CreateGrabLine")

				if grabEvents2 then
					local spawnLocation = workspace_:FindFirstChild("SpawnLocation") or workspace_:FindFirstChild("Spawn") or localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

					if spawnLocation then
						local lineLagIntensity = tbl2.lineLagIntensity or 520

						for i = 1, lineLagIntensity do
							if flag2 then
								local n8 = math.random(-2140500000, 2104000001)
								local n9 = math.random(-2.11e9, 2101000000)
								grabEvents2:FireServer(spawnLocation, CFrame.new(n8, 0, n9))
								continue
							end

							break
						end
					end
				end

				if flag2 then
					task.wait(tbl2.lineLagDelay or 1)
				end
			end
		end)

		table.insert(tbl13, thread)
		coroutine.resume(thread)
	end

	stopLineLag = function()
		flag2 = false
		task.wait(0.1)

		for _, v5 in ipairs(tbl13) do
			pcall(coroutine.close, v5)
		end

		tbl13 = {}
	end

	_G.kt_startLineLag = startLineLag
	_G.kt_stopLineLag = stopLineLag

	executeNoBlobKick = function()
		if flag3 then
			return
		end
		flag3 = true

		task.spawn(function()
			flag2 = false
			startLineLag()
			local v5 = getAllPlayers()
			if #v5 == 0 then
				flag3 = false
				return
			end
			local tbl14 = {}

			for _, v6 in ipairs(v5) do
				if not IsInPlot(v6) then
					table.insert(tbl14, v6)
				end
			end

			if #tbl14 == 0 then
				stopLineLag()
				flag3 = false
				return
			end

			local character = localPlayer.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			if not character then
				flag3 = false
				return
			end
			local tbl15 = {}

			for _, v6 in ipairs(tbl14) do
				local character2 = v6.Character
				character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

				if character2 then
					table.insert(tbl15, { player = v6, hrp = character2 })
				end
			end

			for _, v6 in ipairs(tbl15) do
				teleportToPlayer(character, v6.hrp)
				task.wait(0.16)
				spamOwnership(v6.hrp)
				spamOwnership(v6.hrp)
				task.wait()
				spamOwnership(v6.hrp)
				task.wait()
				spamOwnership(v6.hrp)
				spamOwnership(v6.hrp)
			end

			local n8 = 6.2831853071795862 / #tbl15

			for i, v6 in ipairs(tbl15) do
				local n9 = (i - 1) * n8
				local n10 = math.cos(n9) * 80
				local n11 = math.sin(n9) * 80

				pcall(function()
					v6.hrp.CFrame = CFrame.new(n10, 32, n11)
					v6.hrp.AssemblyLinearVelocity = Vector3.zero
					v6.hrp.Velocity = Vector3.zero
				end)

				local bodyPosition = Instance.new("BodyPosition")
				bodyPosition.MaxForce = Vector3.new(3e9, 4e9, 3e9)
				bodyPosition.P = 50000000
				bodyPosition.Position = Vector3.new(n10, 32, n11)
				bodyPosition.Parent = v6.hrp

				task.delay(3, function()
					pcall(function()
						bodyPosition:Destroy()
					end)
				end)

				task.wait()
			end

			task.wait(1.3)

			for i = 1, 1 do
				for _, v6 in ipairs(tbl15) do
					destroyLineOnPlayer(v6.hrp)
				end

				task.wait(12)
			end

			stopLineLag()
			flag3 = false
		end)
	end
end

executeBlobmanKick = function()
	local v5 = getKickTargets()
	if #v5 == 0 then
		_NOTIFY("Kick Target: No targets found.", 3)
		return
	end
	_NOTIFY("Kick Target: Starting Blobman Kick V2 on " .. #v5 .. " targets...", 3)

	task.spawn(function()
		local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		local v6 = workspace_:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

		if v6 then
			local creatureBlobman = v6:FindFirstChild("CreatureBlobman")

			if creatureBlobman then
				pcall(function()
					creatureBlobman:Destroy()
				end)

				task.wait(0.133)
			end
		end

		local v7 = spawnBlobmanIfNeeded()
		if not v7 then
			_NOTIFY("Kick Target: Failed to spawn Blobman.", 3)
			return
		end
		task.wait(0.1)
		sitOnBlobman(v7)
		task.wait(0.3)
		local tbl13 = {}

		for _, descendant in ipairs(character:GetDescendants()) do
			if descendant:IsA("BasePart") then
				tbl13[descendant] = descendant.CanCollide
				descendant.CanCollide = false
			end
		end

		grab = function(arg, arg2)
			for _, v8 in ipairs({ "Left", "Right" }) do
				local v9 = arg:FindFirstChild(v8 .. "Detector")
				local v10 = v9 and v9:FindFirstChild(v8 .. "Weld")
				local blobmanSeatAndOwnerScript = arg:FindFirstChild("BlobmanSeatAndOwnerScript")
				blobmanSeatAndOwnerScript = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")

				if v9 and v10 and blobmanSeatAndOwnerScript then
					pcall(function()
						blobmanSeatAndOwnerScript:FireServer(v9, arg2, v10)
					end)
				end
			end
		end

		rere = function(arg, arg2)
			for _, v8 in ipairs({ "Left", "Right" }) do
				local v9 = arg:FindFirstChild(v8 .. "Detector")
				local v10 = v9 and v9:FindFirstChild(v8 .. "Weld")
				local blobmanSeatAndOwnerScript = arg:FindFirstChild("BlobmanSeatAndOwnerScript")
				local creatureRelease = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")

				if v10 and creatureRelease then
					pcall(function()
						creatureRelease:FireServer(v10, arg2)
					end)
				end
			end
		end

		drop = function(arg, arg2)
			for _, v8 in ipairs({ "Left", "Right" }) do
				local v9 = arg:FindFirstChild(v8 .. "Detector")
				local v10 = v9 and v9:FindFirstChild(v8 .. "Weld")
				local blobmanSeatAndOwnerScript = arg:FindFirstChild("BlobmanSeatAndOwnerScript")
				local creatureDrop = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")

				if v10 and creatureDrop then
					pcall(function()
						creatureDrop:FireServer(v10, arg2)
					end)
				end
			end
		end

		ungrab = function(arg)
			local destroyGrabLine = replicatedStorage:WaitForChild("GrabEvents"):FindFirstChild("DestroyGrabLine")

			if arg and destroyGrabLine then
				pcall(function()
					destroyGrabLine:FireServer(arg)
				end)
			end
		end

		local tbl14 = {}

		for _, v8 in ipairs(v5) do
			local character2 = v8.Character
			character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

			if character2 then
				table.insert(tbl14, { player = v8, hrp = character2 })
			end
		end

		for _, v8 in ipairs(tbl14) do
			pcall(function()
				humanoidRootPart.CFrame = v8.hrp.CFrame
				humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
			end)

			task.wait(0.11)

			if (humanoidRootPart.Position - v8.hrp.Position).Magnitude <= 35 then
				for i = 1, 5 do
					if not (not v8.hrp.Parent or not v7.Parent) then
						grab(v7, v8.hrp)
						task.wait()
						rere(v7, v8.hrp)
						continue
					end

					break
				end
			end
		end

		pcall(function()
			humanoidRootPart.CFrame = CFrame.new(0, 90, 0)
			humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
		end)

		task.wait(0.2)
		humanoidRootPart.Anchored = true
		local n8 = #tbl14

		for i, v8 in ipairs(tbl14) do
			local n9 = 6.2831853071795862 / n8 * (i - 1)
			local vector = Vector3.new(math.cos(n9) * 22, 0, math.sin(n9) * 22)

			pcall(function()
				v8.hrp.CFrame = CFrame.new(humanoidRootPart.Position.X + vector.X, 90, humanoidRootPart.Position.Z + vector.Z)
				v8.hrp.AssemblyLinearVelocity = Vector3.zero
				v8.hrp.AssemblyAngularVelocity = Vector3.zero
			end)
		end

		task.wait(0.2)
		local setNetworkOwner2 = replicatedStorage:WaitForChild("GrabEvents"):FindFirstChild("SetNetworkOwner")

		for _, v8 in ipairs(tbl14) do
			if setNetworkOwner2 then
				for i = 1, 10 do
					pcall(function()
						setNetworkOwner2:FireServer(v8.hrp, v8.hrp.CFrame)
					end)
				end
			end
		end

		task.wait(0.1)

		for _, v8 in ipairs(tbl14) do
			ungrab(v8.hrp)
		end

		for _, v8 in ipairs(tbl14) do
			drop(v7, v8.hrp)
		end

		humanoidRootPart.Anchored = false
		local now = os.clock()

		while os.clock() - now < 0.05 do
			for _, v8 in ipairs(tbl14) do
				task.spawn(function()
					if v8.hrp.Parent and v7.Parent then
						grab(v7, v8.hrp)
					end
				end)
			end

			task.wait()
		end

		for _, descendant in ipairs(character:GetDescendants()) do
			if descendant:IsA("BasePart") and tbl13[descendant] ~= nil then
				descendant.CanCollide = tbl13[descendant]
			end
		end

		_NOTIFY("Kick Target: Blobman Kick V2 execution complete.", 3)
	end)
end

_G.kt_setupDropdown = setupKickDropdown
_G.kt_executeBlobmanKick = executeBlobmanKick
_G.kt_executeNoBlobKick = executeNoBlobKick

do
	local flag2 = false
	local connection3 = nil
	local tbl13 = {}
	local n8 = 0

	gkaBlobGrab = function(arg, arg2)
		if not arg or not arg.Parent then
			return
		end

		if not arg2 or not arg2.Parent then
			return
		end

		for _, v5 in ipairs({ "Left", "Right" }) do
			local v6 = arg:FindFirstChild(v5 .. "Detector")
			local v7 = v6 and v6:FindFirstChild(v5 .. "Weld")
			local blobmanSeatAndOwnerScript = arg:FindFirstChild("BlobmanSeatAndOwnerScript")
			local creatureGrab = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")

			if v6 and v7 and creatureGrab then
				pcall(function()
					creatureGrab:FireServer(v6, arg2, v7)
				end)
			end
		end
	end

	gkaStop = function()
		flag2 = false

		if connection3 then
			pcall(function()
				connection3:Disconnect()
			end)

			connection3 = nil
		end

		tbl13 = {}
		n8 = 0

		pcall(function()
			_G.kt_stopLineLag()
		end)

		_NOTIFY("GatherKickAll: Stopped.", 2)
	end

	_G.gka_stop = gkaStop

	gkaExecute = function()
		if flag2 then
			_NOTIFY("GatherKickAll: Already running!", 2)
			return
		end
		flag2 = true

		task.spawn(function()
			local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
			local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 10)
			if not humanoidRootPart then
				gkaStop()
				return
			end
			local tbl14 = {}

			for _, player in ipairs(players:GetPlayers()) do
				if player ~= localPlayer then
					local ok, result = pcall(function()
						return localPlayer:IsFriendsWith(player.UserId)
					end)

					if not (tbl2.kickExcludeFriends and ok and result) then
						local character2 = player.Character
						character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

						if character2 then
							table.insert(tbl14, { player = player, hrp = character2 })
						end
					end
				end
			end

			if #tbl14 == 0 then
				_NOTIFY("GatherKickAll: No targets!", 3)
				gkaStop()
				return
			end

			_NOTIFY("GatherKickAll: Starting...", 3)

			pcall(function()
				_G.kt_startLineLag()
			end)

			local v5 = workspace_:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

			if v5 then
				local creatureBlobman = v5:FindFirstChild("CreatureBlobman")

				if creatureBlobman then
					pcall(function()
						creatureBlobman:Destroy()
					end)

					task.wait(0.133)
				end
			end

			local v6 = spawnBlobmanIfNeeded()

			if not v6 then
				_NOTIFY("GatherKickAll: Blobman spawn failed!", 3)
				gkaStop()
				return
			end

			task.wait(0.1)
			sitOnBlobman(v6)
			task.wait(0.3)
			local tbl15 = {}

			for _, descendant in ipairs(character:GetDescendants()) do
				if descendant:IsA("BasePart") then
					tbl15[descendant] = descendant.CanCollide
					descendant.CanCollide = false
				end
			end

			bkGrab = function(arg, arg2)
				if not arg or not arg.Parent then
					return
				end

				for _, v7 in ipairs({ "Left", "Right" }) do
					local v8 = arg:FindFirstChild(v7 .. "Detector")
					local v9 = v8 and v8:FindFirstChild(v7 .. "Weld")
					local blobmanSeatAndOwnerScript = arg:FindFirstChild("BlobmanSeatAndOwnerScript")
					local creatureGrab = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")

					if v8 and v9 and creatureGrab then
						pcall(function()
							creatureGrab:FireServer(v8, arg2, v9)
						end)
					end
				end
			end

			bkRere = function(arg, arg2)
				if not arg or not arg.Parent then
					return
				end

				for _, v7 in ipairs({ "Left", "Right" }) do
					local v8 = arg:FindFirstChild(v7 .. "Detector")
					local v9 = v8 and v8:FindFirstChild(v7 .. "Weld")
					local blobmanSeatAndOwnerScript = arg:FindFirstChild("BlobmanSeatAndOwnerScript")
					local creatureRelease = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")

					if v9 and creatureRelease then
						pcall(function()
							creatureRelease:FireServer(v9, arg2)
						end)
					end
				end
			end

			bkDrop = function(arg, arg2)
				if not arg or not arg.Parent then
					return
				end

				for _, v7 in ipairs({ "Left", "Right" }) do
					local v8 = arg:FindFirstChild(v7 .. "Detector")
					local v9 = v8 and v8:FindFirstChild(v7 .. "Weld")
					local blobmanSeatAndOwnerScript = arg:FindFirstChild("BlobmanSeatAndOwnerScript")
					local creatureDrop = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")

					if v9 and creatureDrop then
						pcall(function()
							creatureDrop:FireServer(v9, arg2)
						end)
					end
				end
			end

			local grabEvents2 = replicatedStorage:WaitForChild("GrabEvents")

			bkUngrab = function(arg)
				local destroyGrabLine = grabEvents2:FindFirstChild("DestroyGrabLine")

				if arg and destroyGrabLine then
					pcall(function()
						destroyGrabLine:FireServer(arg)
					end)
				end
			end

			_NOTIFY("GatherKickAll: Gathering...", 3)
			local setNetworkOwner2 = grabEvents2:FindFirstChild("SetNetworkOwner")

			for _, v7 in ipairs(tbl14) do
				if flag2 then
					pcall(function()
						humanoidRootPart.CFrame = v7.hrp.CFrame
						humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
					end)

					task.wait(0.11)

					if setNetworkOwner2 and v7.hrp and v7.hrp.Parent then
						for i = 1, 8 do
							pcall(function()
								setNetworkOwner2:FireServer(v7.hrp, v7.hrp.CFrame)
							end)
						end
					end

					if (humanoidRootPart.Position - v7.hrp.Position).Magnitude <= 35 then
						for i = 1, 5 do
							if not (not v7.hrp.Parent or not v6.Parent) then
								bkGrab(v6, v7.hrp)
								task.wait()
								bkRere(v6, v7.hrp)
								continue
							end

							break
						end
					end

					if setNetworkOwner2 and v7.hrp and v7.hrp.Parent then
						for i = 1, 4 do
							pcall(function()
								setNetworkOwner2:FireServer(v7.hrp, v7.hrp.CFrame)
							end)
						end
					end

					continue
				end

				break
			end

			local gkaCenterY = tbl2.gkaCenterY or 50
			local gkaCircleRadius = tbl2.gkaCircleRadius or 6
			local n9 = #tbl14

			pcall(function()
				humanoidRootPart.CFrame = CFrame.new(0, gkaCenterY, 0)
				humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
			end)

			task.wait(0.2)
			humanoidRootPart.Anchored = true

			for i, v7 in ipairs(tbl14) do
				local n10 = 6.2831853071795862 / n9 * (i - 1)
				local vector = Vector3.new(math.cos(n10) * gkaCircleRadius, 0, math.sin(n10) * gkaCircleRadius)

				pcall(function()
					v7.hrp.CFrame = CFrame.new(humanoidRootPart.Position.X + vector.X, gkaCenterY, humanoidRootPart.Position.Z + vector.Z)
					v7.hrp.AssemblyLinearVelocity = Vector3.zero
					v7.hrp.AssemblyAngularVelocity = Vector3.zero
				end)
			end

			task.wait(0.2)
			local setNetworkOwner3 = grabEvents2:FindFirstChild("SetNetworkOwner")

			for _, v7 in ipairs(tbl14) do
				if setNetworkOwner3 and v7.hrp and v7.hrp.Parent then
					for i = 1, 10 do
						pcall(function()
							setNetworkOwner3:FireServer(v7.hrp, v7.hrp.CFrame)
						end)
					end
				end
			end

			task.wait(0.1)

			for _, v7 in ipairs(tbl14) do
				bkUngrab(v7.hrp)
			end

			for _, v7 in ipairs(tbl14) do
				bkDrop(v6, v7.hrp)
			end

			humanoidRootPart.Anchored = false
			local now = os.clock()

			while os.clock() - now < 0.05 do
				for _, v7 in ipairs(tbl14) do
					task.spawn(function()
						if v7.hrp and v7.hrp.Parent and v6 and v6.Parent then
							bkGrab(v6, v7.hrp)
						end
					end)
				end

				task.wait()
			end

			for _, descendant in ipairs(character:GetDescendants()) do
				if descendant:IsA("BasePart") and tbl15[descendant] ~= nil then
					descendant.CanCollide = tbl15[descendant]
				end
			end

			_NOTIFY("GatherKickAll: Orbit starting!", 3)
			local gkaBlobRotateRadius = tbl2.gkaBlobRotateRadius or 18

			if not v6.Parent then
				_NOTIFY("GatherKickAll: Re-spawning Blobman...", 2)

				pcall(function()
					humanoidRootPart.CFrame = CFrame.new(0, gkaCenterY + 3, gkaBlobRotateRadius)
					humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
				end)

				task.wait(0.2)
				v6 = spawnBlobmanIfNeeded()

				if not v6 then
					_NOTIFY("GatherKickAll: Blobman spawn failed, orbit aborted!", 3)
					gkaStop()
					return
				end

				sitOnBlobman(v6)
				task.wait(0.35)
			else
				local humanoid_ = character:FindFirstChildOfClass("Humanoid")

				if not (humanoid_ and humanoid_.SeatPart) then
					pcall(function()
						humanoidRootPart.CFrame = CFrame.new(0, gkaCenterY + 3, gkaBlobRotateRadius)
						humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
					end)

					task.wait(0.2)
					sitOnBlobman(v6)
					task.wait(0.35)
				else
					pcall(function()
						humanoidRootPart.CFrame = CFrame.new(0, gkaCenterY + 3, gkaBlobRotateRadius)
						humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
					end)

					task.wait(0.15)
				end
			end

			local tbl16 = {}

			for i, v7 in ipairs(tbl14) do
				if v7.hrp and v7.hrp.Parent then
					local n10 = 6.2831853071795862 / n9 * (i - 1)
					local n11 = math.cos(n10) * gkaCircleRadius
					local n12 = math.sin(n10) * gkaCircleRadius

					pcall(function()
						v7.hrp.CFrame = CFrame.new(n11, gkaCenterY, n12)
						v7.hrp.AssemblyLinearVelocity = Vector3.zero
					end)

					local bodyPosition = Instance.new("BodyPosition")
					bodyPosition.MaxForce = Vector3.new(4e9, 5e9, 4e9)
					bodyPosition.P = 100000000
					bodyPosition.D = 10000
					bodyPosition.Position = Vector3.new(n11, gkaCenterY, n12)
					bodyPosition.Parent = v7.hrp
					table.insert(tbl16, bodyPosition)
				end
			end

			tbl13 = tbl14
			n8 = 0

			task.delay(8, function()
				for _, v7 in ipairs(tbl16) do
					pcall(function()
						v7:Destroy()
					end)
				end
			end)

			local n10 = 0
			local n11 = 0
			local gkaBlobRotateSpeed = tbl2.gkaBlobRotateSpeed or 4

			connection3 = runService.RenderStepped:Connect(function(deltaTime)
				if not flag2 then
					pcall(function()
						connection3:Disconnect()
					end)

					connection3 = nil
					return
				end

				if not v6 or not v6.Parent then
					return
				end
				n10 -= deltaTime

				if n10 <= 0 then
					n10 = 0.5
					local humanoid_ = character:FindFirstChildOfClass("Humanoid")

					if not (humanoid_ and humanoid_.SeatPart) then
						task.spawn(function()
							sitOnBlobman(v6)
						end)
					end
				end

				n11 -= deltaTime

				if n11 <= 0 then
					n11 = 3
					local flag3 = false

					for _, v7 in ipairs(tbl13) do
						if v7.player and v7.player.Parent then
							flag3 = true
							break
						end
					end

					if not flag3 then
						_NOTIFY("GatherKickAll: All targets gone, stopping.", 3)
						task.spawn(gkaStop)
						return
					end

					pcall(function()
						_G.kt_startLineLag()
					end)
				end

				n8 += gkaBlobRotateSpeed * deltaTime
				local n12 = math.cos(n8) * gkaBlobRotateRadius
				local n13 = math.sin(n8) * gkaBlobRotateRadius
				local humanoidRootPart2 = v6:FindFirstChild("HumanoidRootPart") or v6:FindFirstChildWhichIsA("BasePart", true)

				if humanoidRootPart2 then
					pcall(function()
						local position = humanoidRootPart2.Position
						humanoidRootPart2.AssemblyLinearVelocity = (Vector3.new(n12, gkaCenterY + 2, n13) - position) * 60
						humanoidRootPart2.CFrame = CFrame.new(humanoidRootPart2.Position) * CFrame.Angles(0, -(n8 + 1.5707963267948966), 0)
					end)
				end

				local n14 = #tbl13

				if n14 > 0 then
					local v7 = tbl13[math.random(1, n14)]

					if v7 and v7.hrp and v7.hrp.Parent then
						task.spawn(function()
							bkGrab(v6, v7.hrp)
						end)
					end

					for i, v8 in ipairs(tbl13) do
						local hrp = v8.hrp

						if hrp and hrp.Parent then
							local n15 = 6.2831853071795862 / n14 * (i - 1)

							pcall(function()
								hrp.CFrame = CFrame.new(math.cos(n15) * gkaCircleRadius, gkaCenterY, math.sin(n15) * gkaCircleRadius)
								hrp.AssemblyLinearVelocity = Vector3.zero
							end)
						end
					end
				end
			end)
		end)
	end
end

_G.gka_execute = gkaExecute
game:GetService("Lighting")
local tbl13 = {}

lcUpsert = function(arg, name, arg2)
	local Lighting = game:GetService("Lighting")

	if tbl13[name] then
		pcall(function()
			tbl13[name]:Destroy()
		end)
	end

	local instance = Instance.new(arg)
	instance.Name = name

	for k, v5 in pairs(arg2) do
		pcall(function()
			instance[k] = v5
		end)
	end

	instance.Parent = Lighting
	tbl13[name] = instance
	return instance
end

do
	local ColorCorrectionEffect = lcUpsert("ColorCorrectionEffect", "_lc_cc", {
		TintColor = Color3.fromRGB(255, 255, 255),
		Saturation = 0,
		Contrast = 0,
		Brightness = 0,
		Enabled = false,
	})

	local BloomEffect = lcUpsert("BloomEffect", "_lc_bloom", { Intensity = 0.5, Size = 24, Threshold = 0.9, Enabled = false })
	local SunRaysEffect = lcUpsert("SunRaysEffect", "_lc_sun", { Intensity = 0.1, Spread = 0.5, Enabled = false })
	local DepthOfFieldEffect = lcUpsert("DepthOfFieldEffect", "_lc_dof", { FarIntensity = 0, FocusDistance = 50, InFocusRadius = 10, NearIntensity = 1, Enabled = false })
	local BlurEffect = lcUpsert("BlurEffect", "_lc_blur", { Size = 0, Enabled = false })

	lcDisableAll = function()
		if ColorCorrectionEffect then
			ColorCorrectionEffect.Enabled = false
		end

		if BloomEffect then
			BloomEffect.Enabled = false
		end

		if SunRaysEffect then
			SunRaysEffect.Enabled = false
		end

		if DepthOfFieldEffect then
			DepthOfFieldEffect.Enabled = false
		end

		if BlurEffect then
			BlurEffect.Enabled = false
		end

		pcall(function()
			if Library.Options.lc_cc_on then
				Library.Options.lc_cc_on:SetValue(false)
			end

			if Library.Options.lc_bloom_on then
				Library.Options.lc_bloom_on:SetValue(false)
			end

			if Library.Options.lc_sun_on then
				Library.Options.lc_sun_on:SetValue(false)
			end

			if Library.Options.lc_dof_on then
				Library.Options.lc_dof_on:SetValue(false)
			end

			if Library.Options.lc_blur_on then
				Library.Options.lc_blur_on:SetValue(false)
			end
		end)
	end

	lcApplyPreset = function(arg)
		lcDisableAll()

		if arg.cc and ColorCorrectionEffect then
			ColorCorrectionEffect.TintColor = arg.cc.tint or Color3.fromRGB(255, 255, 255)
			ColorCorrectionEffect.Saturation = arg.cc.sat or 0
			ColorCorrectionEffect.Contrast = arg.cc.con or 0
			ColorCorrectionEffect.Brightness = arg.cc.bri or 0
			ColorCorrectionEffect.Enabled = true

			pcall(function()
				if Library.Options.lc_cc_on then
					Library.Options.lc_cc_on:SetValue(true)
				end

				if Library.Options.lc_cc_tint then
					Library.Options.lc_cc_tint:SetValue(ColorCorrectionEffect.TintColor)
				end

				if Library.Options.lc_cc_sat then
					Library.Options.lc_cc_sat:SetValue(math.floor(ColorCorrectionEffect.Saturation * 100))
				end

				if Library.Options.lc_cc_con then
					Library.Options.lc_cc_con:SetValue(math.floor(ColorCorrectionEffect.Contrast * 100))
				end

				if Library.Options.lc_cc_bri then
					Library.Options.lc_cc_bri:SetValue(math.floor(ColorCorrectionEffect.Brightness * 100))
				end
			end)
		end

		if arg.bloom and BloomEffect then
			BloomEffect.Intensity = arg.bloom.int or 0.5
			BloomEffect.Size = arg.bloom.size or 24
			BloomEffect.Threshold = arg.bloom.thresh or 0.9
			BloomEffect.Enabled = true

			pcall(function()
				if Library.Options.lc_bloom_on then
					Library.Options.lc_bloom_on:SetValue(true)
				end

				if Library.Options.lc_bloom_int then
					Library.Options.lc_bloom_int:SetValue(math.floor(BloomEffect.Intensity * 100))
				end

				if Library.Options.lc_bloom_size then
					Library.Options.lc_bloom_size:SetValue(BloomEffect.Size)
				end

				if Library.Options.lc_bloom_thresh then
					Library.Options.lc_bloom_thresh:SetValue(math.floor(BloomEffect.Threshold * 100))
				end
			end)
		end

		if arg.sun and SunRaysEffect then
			SunRaysEffect.Intensity = arg.sun.int or 0.1
			SunRaysEffect.Spread = arg.sun.spread or 0.5
			SunRaysEffect.Enabled = true

			pcall(function()
				if Library.Options.lc_sun_on then
					Library.Options.lc_sun_on:SetValue(true)
				end

				if Library.Options.lc_sun_int then
					Library.Options.lc_sun_int:SetValue(math.floor(SunRaysEffect.Intensity * 100))
				end

				if Library.Options.lc_sun_spread then
					Library.Options.lc_sun_spread:SetValue(math.floor(SunRaysEffect.Spread * 100))
				end
			end)
		end

		if arg.dof and DepthOfFieldEffect then
			DepthOfFieldEffect.FarIntensity = arg.dof.far or 0
			DepthOfFieldEffect.NearIntensity = arg.dof.near or 1
			DepthOfFieldEffect.FocusDistance = arg.dof.dist or 50
			DepthOfFieldEffect.InFocusRadius = arg.dof.rad or 10
			DepthOfFieldEffect.Enabled = true

			pcall(function()
				if Library.Options.lc_dof_on then
					Library.Options.lc_dof_on:SetValue(true)
				end

				if Library.Options.lc_dof_far then
					Library.Options.lc_dof_far:SetValue(math.floor(DepthOfFieldEffect.FarIntensity * 100))
				end

				if Library.Options.lc_dof_near then
					Library.Options.lc_dof_near:SetValue(math.floor(DepthOfFieldEffect.NearIntensity * 100))
				end

				if Library.Options.lc_dof_dist then
					Library.Options.lc_dof_dist:SetValue(DepthOfFieldEffect.FocusDistance)
				end

				if Library.Options.lc_dof_rad then
					Library.Options.lc_dof_rad:SetValue(DepthOfFieldEffect.InFocusRadius)
				end
			end)
		end

		if arg.blur and BlurEffect then
			BlurEffect.Size = arg.blur.size or 0
			BlurEffect.Enabled = true

			pcall(function()
				if Library.Options.lc_blur_on then
					Library.Options.lc_blur_on:SetValue(true)
				end

				if Library.Options.lc_blur_size then
					Library.Options.lc_blur_size:SetValue(BlurEffect.Size)
				end
			end)
		end
	end

	local lcPresets = {}

	local tbl14 = {
		name = "Winter",
		data = {
			cc = { tint = Color3.fromRGB(180, 200, 255), sat = 0.1, con = 0.2, bri = 0.05 },
			bloom = { int = 0.6, size = 24, thresh = 0.7 },
			sun = { int = 0.1, spread = 0.5 },
		},
	}

	local tbl15 = {
		name = "Sunset",
		data = {
			cc = { tint = Color3.fromRGB(255, 160, 80), sat = 0.35, con = 0.2, bri = 0.1 },
			bloom = { int = 1, size = 32, thresh = 0.55 },
			sun = { int = 0.3, spread = 0.85 },
		},
	}

	local tbl16 = {
		name = "Night",
		data = {
			cc = { tint = Color3.fromRGB(100, 110, 180), sat = -0.2, con = 0.25, bri = -0.3 },
			bloom = { int = 0.3, size = 16, thresh = 0.8 },
		},
	}

	local tbl17 = {
		name = "Horror",
		data = {
			cc = { tint = Color3.fromRGB(180, 100, 100), sat = -0.7, con = 0.5, bri = -0.25 },
			bloom = { int = 0.15, size = 8, thresh = 0.95 },
			blur = { size = 4 },
		},
	}

	local tbl18 = {
		name = "Vivid",
		data = {
			cc = { tint = Color3.fromRGB(255, 255, 255), sat = 0.9, con = 0.3, bri = 0.15 },
			bloom = { int = 1.5, size = 40, thresh = 0.5 },
			sun = { int = 0.2, spread = 0.6 },
		},
	}

	local tbl19 = {
		name = "Cinema",
		data = {
			cc = { tint = Color3.fromRGB(240, 230, 200), sat = -0.1, con = 0.4, bri = -0.05 },
			bloom = { int = 0.4, size = 20, thresh = 0.85 },
			dof = { far = 0.6, near = 0, dist = 30, rad = 12 },
		},
	}

	local tbl20 = {
		name = "Underwater",
		data = {
			cc = { tint = Color3.fromRGB(80, 160, 200), sat = 0.2, con = -0.1, bri = -0.1 },
			bloom = { int = 0.8, size = 30, thresh = 0.6 },
			blur = { size = 8 },
		},
	}

	local tbl21 = {
		name = "Cyberpunk",
		data = {
			cc = { tint = Color3.fromRGB(160, 100, 255), sat = 0.6, con = 0.45, bri = -0.1 },
			bloom = { int = 2, size = 48, thresh = 0.4 },
			sun = { int = 0.05, spread = 0.3 },
		},
	}

	local tbl22 = {
		name = "Foggy",
		data = {
			cc = { tint = Color3.fromRGB(210, 215, 220), sat = -0.3, con = 0.1, bri = 0.1 },
			bloom = { int = 0.3, size = 24, thresh = 0.7 },
			blur = { size = 12 },
		},
	}

	local tbl23 = {
		name = "Autumn",
		data = {
			cc = { tint = Color3.fromRGB(255, 190, 100), sat = 0.4, con = 0.15, bri = 0.05 },
			bloom = { int = 0.5, size = 20, thresh = 0.75 },
			sun = { int = 0.15, spread = 0.6 },
		},
	}

	local tbl24 = {
		name = "Nature",
		data = {
			cc = { tint = Color3.fromRGB(200, 240, 180), sat = 0.5, con = 0.1, bri = 0.1 },
			bloom = { int = 0.7, size = 28, thresh = 0.65 },
			sun = { int = 0.2, spread = 0.7 },
		},
	}

	lcPresets[1] = { name = "Reset", data = {} }
	lcPresets[2] = tbl14
	lcPresets[3] = tbl15
	lcPresets[4] = tbl16
	lcPresets[5] = tbl17
	lcPresets[6] = tbl18
	lcPresets[7] = tbl19
	lcPresets[8] = tbl20
	lcPresets[9] = tbl21
	lcPresets[10] = tbl22
	lcPresets[11] = tbl23
	lcPresets[12] = tbl24
	local flag2 = false
	local tbl25 = { "_lc_cc", "_lc_bloom", "_lc_sun", "_lc_dof", "_lc_blur" }

	runService.RenderStepped:Connect(function()
		if flag2 then
			return
		end
		local Lighting = game:GetService("Lighting")

		for _, v5 in ipairs(tbl25) do
			if not Lighting:FindFirstChild(v5) then
				flag2 = true

				pcall(function()
					if v5 == "_lc_cc" then
						ColorCorrectionEffect = lcUpsert("ColorCorrectionEffect", v5, {
							Enabled = tbl2.lc_cc_on,
							TintColor = tbl2.lc_cc_tint,
							Saturation = tbl2.lc_cc_sat,
							Contrast = tbl2.lc_cc_con,
							Brightness = tbl2.lc_cc_bri,
						})
					elseif v5 == "_lc_bloom" then
						BloomEffect = lcUpsert("BloomEffect", v5, {
							Enabled = tbl2.lc_bloom_on,
							Intensity = tbl2.lc_bloom_int,
							Size = tbl2.lc_bloom_size,
							Threshold = tbl2.lc_bloom_thresh,
						})
					elseif v5 == "_lc_sun" then
						SunRaysEffect = lcUpsert("SunRaysEffect", v5, { Enabled = tbl2.lc_sun_on, Intensity = tbl2.lc_sun_int, Spread = tbl2.lc_sun_spread })
					elseif v5 == "_lc_dof" then
						DepthOfFieldEffect = lcUpsert("DepthOfFieldEffect", v5, {
							Enabled = tbl2.lc_dof_on,
							FarIntensity = tbl2.lc_dof_far,
							NearIntensity = tbl2.lc_dof_near,
							FocusDistance = tbl2.lc_dof_dist,
							InFocusRadius = tbl2.lc_dof_rad,
						})
					elseif v5 == "_lc_blur" then
						BlurEffect = lcUpsert("BlurEffect", v5, { Enabled = tbl2.lc_blur_on, Size = tbl2.lc_blur_size })
					end
				end)

				task.wait(0.5)
				flag2 = false
				break
			end
		end
	end)

	_G.lc_CC = ColorCorrectionEffect
	_G.lc_Bloom = BloomEffect
	_G.lc_Sun = SunRaysEffect
	_G.lc_DOF = DepthOfFieldEffect
	_G.lc_Blur = BlurEffect
	_G.lc_applyPreset = lcApplyPreset
	_G.lc_disableAll = lcDisableAll
	_G.lc_presets = lcPresets
end

do
	local tbl14 = {}
	local tbl15 = {}
	local tbl16 = {}
	local tbl17 = {}
	local tbl18 = {}

	flushOldESPForPlayer = function(arg)
		local v5 = tbl15[arg]

		if v5 and tbl14[v5] then
			pcall(function()
				tbl14[v5].Gui:Destroy()
			end)

			tbl14[v5] = nil
			tbl17[v5] = nil
			tbl18[v5] = nil
		end

		tbl15[arg] = nil
	end

	hookPlayerRespawn = function(arg)
		if arg == localPlayer then
			return
		end

		arg.CharacterAdded:Connect(function()
			flushOldESPForPlayer(arg)
		end)
	end

	for _, player in ipairs(players:GetPlayers()) do
		hookPlayerRespawn(player)
	end

	players.PlayerAdded:Connect(function(player)
		hookPlayerRespawn(player)
	end)

	players.PlayerRemoving:Connect(function(player)
		flushOldESPForPlayer(player)
	end)

	local tbl19 = {
		{ "Head", "UpperTorso" },
		{ "UpperTorso", "LowerTorso" },
		{ "UpperTorso", "LeftUpperArm" },
		{ "LeftUpperArm", "LeftLowerArm" },
		{ "LeftLowerArm", "LeftHand" },
		{ "UpperTorso", "RightUpperArm" },
		{ "RightUpperArm", "RightLowerArm" },
		{ "RightLowerArm", "RightHand" },
		{ "LowerTorso", "LeftUpperLeg" },
		{ "LeftUpperLeg", "LeftLowerLeg" },
		{ "LeftLowerLeg", "LeftFoot" },
		{ "LowerTorso", "RightUpperLeg" },
		{ "RightUpperLeg", "RightLowerLeg" },
		{ "RightLowerLeg", "RightFoot" },
	}

	local tbl20 = {
		{ "Head", "Torso" },
		{ "Torso", "Left Arm" },
		{ "Torso", "Right Arm" },
		{ "Torso", "Left Leg" },
		{ "Torso", "Right Leg" },
	}

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "Noks_DamagePopups"
	screenGui.IgnoreGuiInset = true
	screenGui.Parent = game:GetService("CoreGui")

	getNoksFont = function()
		local noksTextFont = tbl2.noksTextFont
		if noksTextFont == "GothamBold" then
			return Enum.Font.GothamBold
		end

		if noksTextFont == "SourceSansBold" then
			return Enum.Font.SourceSansBold
		end

		if noksTextFont == "Arcade" then
			return Enum.Font.Arcade
		end

		if noksTextFont == "Roboto" then
			return Enum.Font.Roboto
		end
		return Enum.Font.GothamBold
	end

	noksSnapshotTransparencies = function(arg)
		local tbl21 = {}

		for _, descendant in ipairs(arg:GetDescendants()) do
			local tbl22 = {}
			local flag2 = false

			if descendant:IsA("GuiObject") then
				tbl22.BackgroundTransparency = descendant.BackgroundTransparency
				flag2 = true
			end

			if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
				tbl22.TextTransparency = descendant.TextTransparency
				flag2 = true
			end

			if descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") then
				tbl22.ImageTransparency = descendant.ImageTransparency
				flag2 = true
			end

			if descendant:IsA("UIStroke") then
				tbl22.Transparency = descendant.Transparency
				flag2 = true
			end

			if flag2 then
				tbl21[descendant] = tbl22
			end
		end

		return tbl21
	end

	noksApplyFadeTransparency = function(arg, arg2)
		for k, v5 in pairs(arg) do
			if k.Parent then
				if v5.BackgroundTransparency ~= nil then
					k.BackgroundTransparency = v5.BackgroundTransparency + (1 - v5.BackgroundTransparency) * arg2
				end

				if v5.TextTransparency ~= nil then
					k.TextTransparency = v5.TextTransparency + (1 - v5.TextTransparency) * arg2
				end

				if v5.ImageTransparency ~= nil then
					k.ImageTransparency = v5.ImageTransparency + (1 - v5.ImageTransparency) * arg2
				end

				if v5.Transparency ~= nil then
					k.Transparency = v5.Transparency + (1 - v5.Transparency) * arg2
				end
			end
		end
	end

	updateNoksLine = function(arg, arg2, arg3, arg4)
		local magnitude = (arg2 - arg3).Magnitude
		local v5 = math.atan2(arg3.Y - arg2.Y, arg3.X - arg2.X)
		arg.Size = UDim2.new(0, magnitude, 0, arg4)
		arg.Position = UDim2.new(0, (arg2.X + arg3.X) / 2, 0, (arg2.Y + arg3.Y) / 2)
		arg.AnchorPoint = Vector2.new(0.5, 0.5)
		arg.Rotation = math.deg(v5)
	end

	applyNoksChams = function(parent)
		if not tbl2.noksChamsEnable then
			if parent:FindFirstChild("Noks_Highlight") then
				parent.Noks_Highlight:Destroy()
			end

			return
		end

		local noksHighlight = parent:FindFirstChild("Noks_Highlight") or Instance.new("Highlight")
		noksHighlight.Name = "Noks_Highlight"
		noksHighlight.FillColor = tbl2.noksChamsFillColor
		noksHighlight.OutlineColor = tbl2.noksChamsOutlineColor
		noksHighlight.FillTransparency = tbl2.noksChamsFillTransparency / 100
		noksHighlight.OutlineTransparency = tbl2.noksChamsOutlineTransparency / 100
		noksHighlight.DepthMode = tbl2.noksChamsOcclusion == "Always See" and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
		noksHighlight.Parent = parent
	end

	getJointPosition = function(arg, arg2, arg3)
		local v5 = arg:FindFirstChild(arg2)
		if not v5 then
			return nil
		end
		local str2

		if arg2 == "UpperTorso" then
			if arg3 == "Head" then
				str2 = "NeckAttachment"
			elseif arg3 == "LeftUpperArm" then
				str2 = "LeftShoulderAttachment"
			elseif arg3 == "RightUpperArm" then
				str2 = "RightShoulderAttachment"
			else
				str2 = nil

				if arg3 == "LowerTorso" then
					str2 = "WaistAttachment"
				end
			end
		elseif arg2 == "LowerTorso" then
			if arg3 == "UpperTorso" then
				str2 = "WaistAttachment"
			elseif arg3 == "LeftUpperLeg" then
				str2 = "LeftHipAttachment"
			else
				str2 = nil

				if arg3 == "RightUpperLeg" then
					str2 = "RightHipAttachment"
				end
			end
		elseif arg2 == "LeftUpperArm" then
			if arg3 == "UpperTorso" then
				str2 = "LeftShoulderAttachment"
			else
				str2 = nil

				if arg3 == "LeftLowerArm" then
					str2 = "LeftElbowAttachment"
				end
			end
		elseif arg2 == "LeftLowerArm" then
			if arg3 == "LeftUpperArm" then
				str2 = "LeftElbowAttachment"
			else
				str2 = nil

				if arg3 == "LeftHand" then
					str2 = "LeftWristAttachment"
				end
			end
		elseif arg2 == "LeftHand" then
			str2 = nil

			if arg3 == "LeftLowerArm" then
				str2 = "LeftWristAttachment"
			end
		elseif arg2 == "RightUpperArm" then
			if arg3 == "UpperTorso" then
				str2 = "RightShoulderAttachment"
			else
				str2 = nil

				if arg3 == "RightLowerArm" then
					str2 = "RightElbowAttachment"
				end
			end
		elseif arg2 == "RightLowerArm" then
			if arg3 == "RightUpperArm" then
				str2 = "RightElbowAttachment"
			else
				str2 = nil

				if arg3 == "RightHand" then
					str2 = "RightWristAttachment"
				end
			end
		elseif arg2 == "RightHand" then
			str2 = nil

			if arg3 == "RightLowerArm" then
				str2 = "RightWristAttachment"
			end
		elseif arg2 == "LeftUpperLeg" then
			if arg3 == "LowerTorso" then
				str2 = "LeftHipAttachment"
			else
				str2 = nil

				if arg3 == "LeftLowerLeg" then
					str2 = "LeftKneeAttachment"
				end
			end
		elseif arg2 == "LeftLowerLeg" then
			if arg3 == "LeftUpperLeg" then
				str2 = "LeftKneeAttachment"
			else
				str2 = nil

				if arg3 == "LeftFoot" then
					str2 = "LeftAnkleAttachment"
				end
			end
		elseif arg2 == "LeftFoot" then
			str2 = nil

			if arg3 == "LeftLowerLeg" then
				str2 = "LeftAnkleAttachment"
			end
		elseif arg2 == "RightUpperLeg" then
			if arg3 == "LowerTorso" then
				str2 = "RightHipAttachment"
			else
				str2 = nil

				if arg3 == "RightLowerLeg" then
					str2 = "RightKneeAttachment"
				end
			end
		elseif arg2 == "RightLowerLeg" then
			if arg3 == "RightUpperLeg" then
				str2 = "RightKneeAttachment"
			else
				str2 = nil

				if arg3 == "RightFoot" then
					str2 = "RightAnkleAttachment"
				end
			end
		else
			str2 = nil

			if arg2 == "RightFoot" then
				str2 = nil

				if arg3 == "RightLowerLeg" then
					str2 = "RightAnkleAttachment"
				end
			end
		end

		if str2 then
			local v6 = v5:FindFirstChild(str2)
			if v6 and v6:IsA("Attachment") then
				return v6.WorldPosition
			end
		end

		return v5.Position
	end

	createNoksESP = function(arg)
		if tbl14[arg] then
			return
		end
		local name = arg.Name

		local tbl21 = {
			CharModel = arg,
			LastPosition = nil,
			LastSize = nil,
			LastNamePos = nil,
			LastLineTarget = nil,
			LastHealthRatio = 1,
			LastDistanceText = "",
			LastDistancePos = nil,
		}

		tbl17[arg] = { offset = 0, direction = 1, active = false }
		local screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "Noks_Engine_" .. name
		screenGui2.IgnoreGuiInset = true
		screenGui2.Parent = game:GetService("CoreGui")
		local canvasGroup = Instance.new("CanvasGroup")
		canvasGroup.Size = UDim2.new(1, 0, 1, 0)
		canvasGroup.BackgroundTransparency = 1
		canvasGroup.Parent = screenGui2
		local frame = Instance.new("Frame")
		frame.Name = "Noks_Box"
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.BackgroundColor3 = Color3.new(1, 1, 1)
		frame.Parent = canvasGroup
		local uiCorner = Instance.new("UICorner")
		uiCorner.Parent = frame
		local uiStroke = Instance.new("UIStroke")
		uiStroke.LineJoinMode = Enum.LineJoinMode.Round
		uiStroke.Color = Color3.fromRGB(180, 140, 255)
		uiStroke.Parent = frame
		local uiGradient = Instance.new("UIGradient")
		uiGradient.Enabled = false
		uiGradient.Parent = uiStroke
		local frame2 = Instance.new("Frame")
		frame2.Size = UDim2.new(1, 2, 1, 2)
		frame2.Position = UDim2.new(0, -1, 0, -1)
		frame2.BackgroundTransparency = 1
		frame2.BorderSizePixel = 0
		frame2.Parent = frame
		local uiCorner2 = Instance.new("UICorner")
		uiCorner2.Parent = frame2
		local uiStroke2 = Instance.new("UIStroke")
		uiStroke2.LineJoinMode = Enum.LineJoinMode.Round
		uiStroke2.Color = Color3.fromRGB(10, 10, 10)
		uiStroke2.Parent = frame2
		local uiGradient2 = Instance.new("UIGradient")
		uiGradient2.Enabled = false
		uiGradient2.Parent = uiStroke2
		local uiGradient3 = Instance.new("UIGradient")
		uiGradient3.Name = "Noks_FillGrad"
		uiGradient3.Enabled = false
		uiGradient3.Parent = frame
		local frame3 = Instance.new("Frame")
		frame3.Name = "Noks_HealthBg"
		frame3.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
		frame3.BorderSizePixel = 0
		frame3.BackgroundTransparency = 0.4
		frame3.Visible = false
		frame3.Parent = canvasGroup
		local uiStroke3 = Instance.new("UIStroke")
		uiStroke3.Thickness = 1
		uiStroke3.Color = Color3.fromRGB(0, 0, 0)
		uiStroke3.Transparency = 0.5
		uiStroke3.Parent = frame3
		local frame4 = Instance.new("Frame")
		frame4.Name = "Noks_HealthContainer"
		frame4.BackgroundTransparency = 1
		frame4.BorderSizePixel = 0
		frame4.ClipsDescendants = true
		frame4.Size = UDim2.new(1, 0, 1, 0)
		frame4.AnchorPoint = Vector2.new(0, 1)
		frame4.Position = UDim2.new(0, 0, 1, 0)
		frame4.Parent = frame3
		local frame5 = Instance.new("Frame")
		frame5.BorderSizePixel = 0
		frame5.AnchorPoint = Vector2.new(0, 1)
		frame5.Position = UDim2.new(0, 0, 1, 0)
		frame5.BackgroundColor3 = Color3.fromRGB(0, 255, 120)
		frame5.Parent = frame4
		local uiGradient4 = Instance.new("UIGradient")
		uiGradient4.Rotation = 270
		uiGradient4.Enabled = false
		uiGradient4.Parent = frame5
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "Noks_HpLabel"
		textLabel.BackgroundTransparency = 1
		textLabel.TextColor3 = Color3.new(1, 1, 1)
		textLabel.Visible = false
		textLabel.Parent = canvasGroup
		local uiStroke4 = Instance.new("UIStroke")
		uiStroke4.Color = Color3.new(0, 0, 0)
		uiStroke4.Parent = textLabel
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.Name = "NameLabel"
		textLabel2.Size = UDim2.new(0, 200, 0, 20)
		textLabel2.BackgroundTransparency = 1
		textLabel2.Text = name:upper()
		textLabel2.TextColor3 = Color3.new(1, 1, 1)
		textLabel2.Parent = canvasGroup
		local uiStroke5 = Instance.new("UIStroke")
		uiStroke5.Color = Color3.fromRGB(0, 0, 0)
		uiStroke5.Parent = textLabel2
		local uiGradient5 = Instance.new("UIGradient")
		uiGradient5.Enabled = false
		uiGradient5.Parent = textLabel2
		local textLabel3 = Instance.new("TextLabel")
		textLabel3.Name = "Noks_Dist"
		textLabel3.Size = UDim2.new(0, 200, 0, 20)
		textLabel3.BackgroundTransparency = 1
		textLabel3.TextColor3 = Color3.fromRGB(240, 240, 240)
		textLabel3.Parent = canvasGroup
		local uiStroke6 = Instance.new("UIStroke")
		uiStroke6.Color = Color3.fromRGB(0, 0, 0)
		uiStroke6.Parent = textLabel3
		local frame6 = Instance.new("Frame")
		frame6.Name = "Noks_Line"
		frame6.BorderSizePixel = 0
		frame6.BackgroundColor3 = Color3.fromRGB(0, 230, 255)
		frame6.Parent = canvasGroup
		local uiStroke7 = Instance.new("UIStroke")
		uiStroke7.LineJoinMode = Enum.LineJoinMode.Round
		uiStroke7.Parent = frame6
		local uiGradient6 = Instance.new("UIGradient")
		uiGradient6.Enabled = false
		uiGradient6.Parent = frame6
		local frame7 = Instance.new("Frame")
		frame7.Name = "Noks_Flags"
		frame7.BackgroundTransparency = 1
		frame7.BorderSizePixel = 0
		frame7.Parent = canvasGroup
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.Padding = UDim.new(0, 2)
		uiListLayout.Parent = frame7
		local textLabel4 = Instance.new("TextLabel")
		textLabel4.BackgroundTransparency = 1
		textLabel4.TextXAlignment = Enum.TextXAlignment.Left
		textLabel4.TextColor3 = Color3.fromRGB(220, 220, 220)
		textLabel4.Visible = false
		textLabel4.Parent = frame7
		local uiStroke8 = Instance.new("UIStroke")
		uiStroke8.Color = Color3.new(0, 0, 0)
		uiStroke8.Parent = textLabel4
		local textLabel5 = Instance.new("TextLabel")
		textLabel5.BackgroundTransparency = 1
		textLabel5.TextXAlignment = Enum.TextXAlignment.Left
		textLabel5.TextColor3 = Color3.fromRGB(200, 200, 200)
		textLabel5.Visible = false
		textLabel5.Parent = frame7
		local uiStroke9 = Instance.new("UIStroke")
		uiStroke9.Color = Color3.new(0, 0, 0)
		uiStroke9.Parent = textLabel5
		local textLabel6 = Instance.new("TextLabel")
		textLabel6.BackgroundTransparency = 1
		textLabel6.TextXAlignment = Enum.TextXAlignment.Left
		textLabel6.TextColor3 = Color3.fromRGB(255, 150, 50)
		textLabel6.Visible = false
		textLabel6.Parent = frame7
		local uiStroke10 = Instance.new("UIStroke")
		uiStroke10.Color = Color3.new(0, 0, 0)
		uiStroke10.Parent = textLabel6
		local textLabel7 = Instance.new("TextLabel")
		textLabel7.BackgroundTransparency = 1
		textLabel7.TextXAlignment = Enum.TextXAlignment.Left
		textLabel7.TextColor3 = Color3.fromRGB(150, 255, 150)
		textLabel7.Visible = false
		textLabel7.Parent = frame7
		local uiStroke11 = Instance.new("UIStroke")
		uiStroke11.Color = Color3.new(0, 0, 0)
		uiStroke11.Parent = textLabel7
		tbl21.Gui = screenGui2
		tbl21.Canvas = canvasGroup
		tbl21.Box = frame
		tbl21.MainStroke = uiStroke
		tbl21.BoxMainGrad = uiGradient
		tbl21.OutlineStroke = uiStroke2
		tbl21.BoxOutlineGrad = uiGradient2
		tbl21.FillGrad = uiGradient3
		tbl21.NameLabel = textLabel2
		tbl21.NameGrad = uiGradient5
		tbl21.LineFrame = frame6
		tbl21.LineStroke = uiStroke7
		tbl21.LineGrad = uiGradient6
		tbl21.HealthBarBg = frame3
		tbl21.HealthContainer = frame4
		tbl21.HealthBarVisual = frame5
		tbl21.HealthBarGrad = uiGradient4
		tbl21.HpLabel = textLabel
		tbl21.DistLabel = textLabel3
		tbl21.TextStroke = uiStroke5
		tbl21.DistStroke = uiStroke6
		tbl21.HpLabelStroke = uiStroke4
		tbl21.BoxCorner = uiCorner
		tbl21.OutlineCorner = uiCorner2
		tbl21.FlagContainer = frame7
		tbl21.FlagLayout = uiListLayout
		tbl21.FlagName = textLabel4
		tbl21.FlagNameStroke = uiStroke8
		tbl21.FlagWeapon = textLabel5
		tbl21.FlagWeaponStroke = uiStroke9
		tbl21.FlagState = textLabel6
		tbl21.FlagStateStroke = uiStroke10
		tbl21.FlagTeam = textLabel7
		tbl21.FlagTeamStroke = uiStroke11
		local frame8 = Instance.new("Frame")
		frame8.Name = "Noks_Skeleton"
		frame8.Size = UDim2.new(1, 0, 1, 0)
		frame8.BackgroundTransparency = 1
		frame8.Visible = false
		frame8.Parent = canvasGroup
		local boneFrames = {}

		for i = 1, 14 do
			local frame9 = Instance.new("Frame")
			frame9.Name = "Bone_" .. i
			frame9.BorderSizePixel = 0
			frame9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame9.Visible = false
			frame9.Parent = frame8
			local uiGradient7 = Instance.new("UIGradient")
			uiGradient7.Enabled = false
			uiGradient7.Parent = frame9
			local uiStroke12 = Instance.new("UIStroke")
			uiStroke12.Thickness = 1
			uiStroke12.Color = Color3.fromRGB(0, 0, 0)
			uiStroke12.Transparency = 0.5
			uiStroke12.Parent = frame9
			boneFrames[i] = { Frame = frame9, Grad = uiGradient7, Stroke = uiStroke12 }
		end

		tbl21.SkeletonContainer = frame8
		tbl21.BoneFrames = boneFrames
		tbl14[arg] = tbl21
		local v5 = players:FindFirstChild(arg.Name)

		if v5 then
			tbl15[v5] = arg
		end
	end

	removeNoksESP = function(arg)
		if tbl14[arg] then
			pcall(function()
				if arg:FindFirstChild("Noks_Highlight") then
					arg.Noks_Highlight:Destroy()
				end
			end)

			tbl14[arg].Gui:Destroy()
			tbl14[arg] = nil
		end

		tbl17[arg] = nil
		tbl18[arg] = nil
		local v5 = players:FindFirstChild(arg.Name)

		if v5 and tbl15[v5] == arg then
			tbl15[v5] = nil
		end
	end

	noksApplyBoxStrokeColor = function(arg)
		arg.MainStroke.Color = tbl2.noksBoxColor1

		if tbl2.noksBoxGradient then
			arg.BoxMainGrad.Color = ColorSequence.new(tbl2.noksBoxColor1, tbl2.noksBoxColor2)
			arg.BoxMainGrad.Enabled = true
		else
			arg.BoxMainGrad.Enabled = false
		end
	end

	noksApplyOutlineStrokeColor = function(arg)
		arg.OutlineStroke.Color = tbl2.noksBoxOutlineColor1

		if tbl2.noksBoxOutlineGradient then
			arg.BoxOutlineGrad.Color = ColorSequence.new(tbl2.noksBoxOutlineColor1, tbl2.noksBoxOutlineColor2)
			arg.BoxOutlineGrad.Enabled = true
		else
			arg.BoxOutlineGrad.Enabled = false
		end
	end

	noksApplyBoxFillColor = function(arg)
		local backgroundTransparency = (100 - tbl2.noksBoxFillOpacity1) / 100
		local n8 = (100 - tbl2.noksBoxFillOpacity2) / 100

		if tbl2.noksBoxFill then
			arg.Box.BackgroundColor3 = tbl2.noksGradientColor1
			arg.Box.BackgroundTransparency = backgroundTransparency

			if tbl2.noksGradientFill then
				arg.FillGrad.Color = ColorSequence.new(tbl2.noksGradientColor1, tbl2.noksGradientColor2)
				local fillGrad = arg.FillGrad
				local numberSequence = NumberSequence.new
				local tbl21 = {}
				local v5 = NumberSequenceKeypoint.new(0, backgroundTransparency)
				local new = NumberSequenceKeypoint.new
				tbl21[1] = v5

				do
					local values = table.pack(new(1, n8))
					table.move(values, 1, values.n, 2, tbl21)
				end

				fillGrad.Transparency = numberSequence(tbl21)

				if tbl2.noksGradientRotate then
					arg.FillGrad.Rotation = (arg.FillGrad.Rotation + tbl2.noksRotateSpeed) % 360
				end

				arg.FillGrad.Enabled = true
			else
				arg.FillGrad.Enabled = false
			end
		else
			arg.FillGrad.Enabled = false
			arg.Box.BackgroundTransparency = 1
		end
	end

	noksApplyLineColor = function(arg)
		arg.LineFrame.BackgroundColor3 = tbl2.noksLineColor1

		if tbl2.noksLineGradient then
			arg.LineGrad.Color = ColorSequence.new(tbl2.noksLineColor1, tbl2.noksLineColor2)
			arg.LineGrad.Enabled = true
		else
			arg.LineGrad.Enabled = false
		end
	end

	noksApplyHealthBarColor = function(arg)
		local lastHealthRatio = arg.LastHealthRatio
		arg.HealthBarVisual.BackgroundColor3 = Color3.fromRGB(255, 40, 40):Lerp(Color3.fromRGB(0, 255, 120), lastHealthRatio)

		if tbl2.noksHealthGradient then
			local healthBarGrad = arg.HealthBarGrad
			local colorSequence = ColorSequence.new
			local tbl21 = {}
			local v5 = ColorSequenceKeypoint.new(0, tbl2.noksHealthGrad3)
			local v6 = ColorSequenceKeypoint.new(0.5, tbl2.noksHealthGrad2)
			local new = ColorSequenceKeypoint.new
			local noksHealthGrad1 = tbl2.noksHealthGrad1
			tbl21[1] = v5
			tbl21[2] = v6

			do
				local values = table.pack(new(1, noksHealthGrad1))
				table.move(values, 1, values.n, 3, tbl21)
			end

			healthBarGrad.Color = colorSequence(tbl21)
			arg.HealthBarGrad.Enabled = true
		else
			arg.HealthBarGrad.Enabled = false
		end
	end

	noksUpdateNameGrad = function(arg, arg2, arg3)
		local v5 = tbl17[arg2]
		if not v5 then
			return
		end
		local n8 = tbl2.noksNameScrollSpeed / 10

		if tbl2.noksNameGradient then
			v5.offset = v5.offset + n8 * arg3 * v5.direction

			if v5.offset >= 1 then
				v5.offset = 1
				v5.direction = -1
			elseif v5.offset <= 0 then
				v5.offset = 0
				v5.direction = 1
			end

			local noksTextGradColor1 = tbl2.noksTextGradColor1
			local noksTextGradColor2 = tbl2.noksTextGradColor2
			local nameGrad = arg.NameGrad
			local colorSequence = ColorSequence.new
			local tbl21 = {}
			local v6 = ColorSequenceKeypoint.new(0, noksTextGradColor1)
			local v7 = ColorSequenceKeypoint.new(0.5, noksTextGradColor2)
			local new = ColorSequenceKeypoint.new
			tbl21[1] = v6
			tbl21[2] = v7

			do
				local values = table.pack(new(1, noksTextGradColor1))
				table.move(values, 1, values.n, 3, tbl21)
			end

			nameGrad.Color = colorSequence(tbl21)
			arg.NameGrad.Offset = Vector2.new(-v5.offset, 0)
			arg.NameGrad.Enabled = true
			arg.NameLabel.TextColor3 = tbl2.noksNameColor
		elseif v5.offset > 0.001 then
			v5.offset = math.max(0, v5.offset - n8 * arg3)
			local noksTextGradColor1 = tbl2.noksTextGradColor1
			local noksTextGradColor2 = tbl2.noksTextGradColor2
			local nameGrad = arg.NameGrad
			local colorSequence = ColorSequence.new
			local tbl21 = {}
			local v6 = ColorSequenceKeypoint.new(0, noksTextGradColor1)
			local v7 = ColorSequenceKeypoint.new(0.5, noksTextGradColor2)
			tbl21[1] = v6
			tbl21[2] = v7

			do
				local values = table.pack(ColorSequenceKeypoint.new(1, noksTextGradColor1))
				table.move(values, 1, values.n, 3, tbl21)
			end

			nameGrad.Color = colorSequence(tbl21)
			arg.NameGrad.Offset = Vector2.new(-v5.offset, 0)
			arg.NameGrad.Enabled = true
			arg.NameLabel.TextColor3 = tbl2.noksNameColor
		else
			v5.offset = 0
			v5.direction = 1
			arg.NameGrad.Enabled = false
			arg.NameLabel.TextColor3 = tbl2.noksNameColor
		end
	end

	triggerNoksFadeOut = function(arg, arg2, arg3, arg4)
		if tbl2.noksFadeOutEnable and arg2.Gui.Enabled then
			local clone = arg2.Gui:Clone()
			clone.Name = "Noks_FadeInstance_" .. arg.Name
			clone.Parent = game:GetService("CoreGui")
			local canvasGroup = clone:FindFirstChildOfClass("CanvasGroup")

			table.insert(tbl16, {
				Gui = clone,
				Canvas = canvasGroup,
				Snapshot = noksSnapshotTransparencies(clone),
				FadeStartTime = arg3,
				WorldPosition = arg4,
				DeathHeight = arg2.LastSize and arg2.LastSize.Y.Offset or 60,
				DeathWidth = arg2.LastSize and arg2.LastSize.X.Offset or 40,
				CloneBox = canvasGroup and canvasGroup:FindFirstChild("Noks_Box"),
				CloneHealthBg = canvasGroup and canvasGroup:FindFirstChild("Noks_HealthBg"),
				CloneNameLabel = canvasGroup and canvasGroup:FindFirstChild("NameLabel"),
				CloneHpLabel = canvasGroup and canvasGroup:FindFirstChild("Noks_HpLabel"),
				CloneDist = canvasGroup and canvasGroup:FindFirstChild("Noks_Dist"),
				CloneLine = canvasGroup and canvasGroup:FindFirstChild("Noks_Line"),
				CloneFlags = canvasGroup and canvasGroup:FindFirstChild("Noks_Flags"),
				LastHealthRatio = arg2.LastHealthRatio,
				BoxFillGradRotation = arg2.FillGrad.Rotation,
				NameGradientOffset = tbl17[arg] and tbl17[arg].offset or 0,
				NameGradientDirection = tbl17[arg] and tbl17[arg].direction or 1,
				LastUpdate = arg3,
			})
		end

		arg2.Gui.Enabled = false
	end

	local now = tick()

	runService.RenderStepped:Connect(function()
		local currentCamera = workspace.CurrentCamera
		if not currentCamera then
			return
		end
		local now2 = tick()
		local n8 = now2 - now
		now = now2
		local viewportSize = currentCamera.ViewportSize
		local v5 = getNoksFont()
		local tbl21 = {}

		if tbl2.noksEspEnabled then
			for _, player in ipairs(players:GetPlayers()) do
				if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChildOfClass("Humanoid") then
					if player.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
						tbl21[player.Character] = true
					end
				end
			end
		end

		for k in pairs(tbl21) do
			if not tbl14[k] then
				createNoksESP(k)
			end
		end

		local vector2 = Vector2.new(viewportSize.X / 2, viewportSize.Y)

		if tbl2.noksLineOrigin == "Top" then
			vector2 = Vector2.new(viewportSize.X / 2, 0)
		elseif tbl2.noksLineOrigin == "Center" then
			vector2 = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
		elseif tbl2.noksLineOrigin == "Mouse" then
			vector2 = userInputService:GetMouseLocation()
		end

		local tbl22 = {}

		for k, v6 in pairs(tbl14) do
			local humanoidRootPart = k:FindFirstChild("HumanoidRootPart")
			local humanoid_ = k:FindFirstChildOfClass("Humanoid")

			if not tbl21[k] then
				table.insert(tbl22, k)
				local lastWorldPosition = v6.LastWorldPosition

				if not lastWorldPosition then
					lastWorldPosition = k.PrimaryPart or k:FindFirstChild("HumanoidRootPart")
					lastWorldPosition = lastWorldPosition and lastWorldPosition.Position or Vector3.zero
				end

				humanoid_ = humanoid_ and humanoid_.Health <= 0

				if humanoid_ then
					v6.LastHealthRatio = 0

					if v6.HealthContainer then
						v6.HealthContainer.Size = UDim2.new(1, 0, 0, 0)
					end

					if v6.HpLabel then
						v6.HpLabel.Visible = false
					end

					noksApplyHealthBarColor(v6)
				end

				triggerNoksFadeOut(k, v6, now2, lastWorldPosition)

				pcall(function()
					if k:FindFirstChild("Noks_Highlight") then
						k.Noks_Highlight:Destroy()
					end
				end)
			elseif humanoidRootPart and humanoid_ then
				v6.LastWorldPosition = humanoidRootPart.Position
				local magnitude = (currentCamera.CFrame.Position - humanoidRootPart.Position).Magnitude

				if magnitude > tbl2.noksMaxDistance then
					v6.Gui.Enabled = false

					pcall(function()
						if k:FindFirstChild("Noks_Highlight") then
							k.Noks_Highlight:Destroy()
						end
					end)
				else
					local v7, v8 = currentCamera:WorldToViewportPoint(humanoidRootPart.Position)

					if v8 then
						v6.Gui.Enabled = true
						applyNoksChams(k)
						local n9 = math.clamp(math.abs(currentCamera:WorldToViewportPoint(humanoidRootPart.Position + Vector3.new(0, 3, 0)).Y - currentCamera:WorldToViewportPoint(humanoidRootPart.Position + Vector3.new(0, -3.5, 0)).Y), 25, tbl2.noksMaxBoxHeight or 350)
						local n10 = n9 / 1.6
						v6.LastPosition = UDim2.new(0, v7.X - n10 / 2, 0, v7.Y - n9 / 2)
						v6.LastSize = UDim2.new(0, n10, 0, n9)
						v6.LastNamePos = UDim2.new(0, v7.X - 100, 0, v7.Y - n9 / 2 - tbl2.noksTextSize + 7)
						local noksLineAttachment = tbl2.noksLineAttachment

						if noksLineAttachment == "Top" then
							v6.LastLineTarget = Vector2.new(v7.X, v7.Y - n9 / 2)
						elseif noksLineAttachment == "Center" then
							v6.LastLineTarget = Vector2.new(v7.X, v7.Y)
						else
							v6.LastLineTarget = Vector2.new(v7.X, v7.Y + n9 / 2)
						end

						v6.LastHealthRatio = math.clamp(humanoid_.Health / humanoid_.MaxHealth, 0, 1)
						v6.LastDistanceText = string.format("%d STUDS", math.floor(magnitude))
						v6.LastDistancePos = UDim2.new(0, v7.X - 100, 0, v7.Y + n9 / 2 + 4)
						v6.Box.Position = v6.LastPosition
						v6.Box.Size = v6.LastSize
						v6.Box.Visible = true
						local udim = UDim.new(0, tbl2.noksBoxCornerRadius)
						v6.BoxCorner.CornerRadius = udim
						v6.OutlineCorner.CornerRadius = udim
						v6.NameLabel.Font = v5
						v6.NameLabel.TextSize = tbl2.noksTextSize
						v6.NameLabel.Position = v6.LastNamePos
						v6.DistLabel.Font = v5
						v6.DistLabel.TextSize = tbl2.noksTextSize - 1
						v6.TextStroke.Thickness = tbl2.noksTextStrokeThickness
						v6.TextStroke.Transparency = tbl2.noksTextStrokeTrans / 100
						v6.DistStroke.Thickness = tbl2.noksTextStrokeThickness
						v6.DistStroke.Transparency = tbl2.noksTextStrokeTrans / 100
						v6.MainStroke.Enabled = tbl2.noksBoxEnable
						v6.MainStroke.Thickness = tbl2.noksBoxStrokeThickness
						noksApplyBoxStrokeColor(v6)
						v6.OutlineStroke.Enabled = tbl2.noksBoxEnable and tbl2.noksBoxOutline
						v6.OutlineStroke.Thickness = tbl2.noksBoxStrokeThickness
						v6.OutlineStroke.Transparency = tbl2.noksBoxStrokeTrans / 100
						noksApplyOutlineStrokeColor(v6)
						noksApplyBoxFillColor(v6)

						if tbl2.noksHealthBarEnable then
							v6.HealthBarBg.Visible = true
							v6.HealthBarBg.Position = UDim2.new(0, v7.X - n10 / 2 - tbl2.noksHealthBarOffset, 0, v7.Y - n9 / 2)
							v6.HealthBarBg.Size = UDim2.new(0, tbl2.noksHealthBarWidth, 0, n9)
							v6.HealthContainer.Size = UDim2.new(1, 0, v6.LastHealthRatio, 0)
							v6.HealthBarVisual.Size = UDim2.new(1, 0, 0, n9)
							noksApplyHealthBarColor(v6)

							if tbl2.noksHealthTextEnable and v6.LastHealthRatio < 0.98 then
								v6.HpLabel.Visible = true
								v6.HpLabel.Font = v5
								v6.HpLabel.TextSize = tbl2.noksTextSize - 2
								v6.HpLabel.Text = string.format("%d", math.floor(humanoid_.Health))
								v6.HpLabel.Position = UDim2.new(0, v7.X - n10 / 2 - tbl2.noksHealthBarOffset + 16, 0, v7.Y - n9 / 2 + n9 * (1 - v6.LastHealthRatio) - 4)
								v6.HpLabelStroke.Thickness = tbl2.noksTextStrokeThickness
								v6.HpLabelStroke.Transparency = tbl2.noksTextStrokeTrans / 100
							else
								v6.HpLabel.Visible = false
							end
						else
							v6.HealthBarBg.Visible = false
							v6.HpLabel.Visible = false
						end

						v6.NameLabel.Visible = tbl2.noksNameEnable
						noksUpdateNameGrad(v6, k, n8)

						if tbl2.noksDistanceEnable then
							v6.DistLabel.Visible = true
							v6.DistLabel.Text = v6.LastDistanceText
							v6.DistLabel.TextColor3 = tbl2.noksDistanceColor
							v6.DistLabel.Position = v6.LastDistancePos
						else
							v6.DistLabel.Visible = false
						end

						if tbl2.noksLineEnable then
							v6.LineFrame.Visible = true
							updateNoksLine(v6.LineFrame, vector2, v6.LastLineTarget, tbl2.noksLineThickness)
							v6.LineStroke.Enabled = tbl2.noksLineOutline
							v6.LineStroke.Color = tbl2.noksLineOutlineColor
							v6.LineStroke.Thickness = tbl2.noksLineStrokeThickness
							noksApplyLineColor(v6)
						else
							v6.LineFrame.Visible = false
						end

						v6.FlagContainer.Position = UDim2.new(0, v7.X + n10 / 2 + 5, 0, v7.Y - n9 / 2)
						v6.FlagContainer.Size = UDim2.new(0, 150, 0, n9)

						if v6.FlagLayout then
							v6.FlagLayout.Padding = UDim.new(0, tbl2.noksFlagSpacing)
						end

						if tbl2.noksFlagsEnable then
							local str2 = players:FindFirstChild(k.Name)
							str2 = str2 and tostring(str2.UserId) or "?"
							v6.FlagName.Visible = tbl2.noksFlagNameEnable
							v6.FlagName.Font = v5
							v6.FlagName.TextSize = tbl2.noksFlagTextSize
							v6.FlagName.TextColor3 = tbl2.noksFlagNameColor
							v6.FlagName.Text = string.format("[%s]", str2)
							v6.FlagNameStroke.Thickness = tbl2.noksTextStrokeThickness
							v6.FlagNameStroke.Transparency = tbl2.noksTextStrokeTrans / 100
							local tool = k:FindFirstChildOfClass("Tool")
							tool = tool and tool.Name or "FISTS"
							v6.FlagWeapon.Visible = tbl2.noksFlagWeaponEnable
							v6.FlagWeapon.Font = v5
							v6.FlagWeapon.TextSize = tbl2.noksFlagTextSize
							v6.FlagWeapon.TextColor3 = tbl2.noksFlagWeaponColor
							v6.FlagWeapon.Text = string.format("[%s]", tool:upper())
							v6.FlagWeaponStroke.Thickness = tbl2.noksTextStrokeThickness
							v6.FlagWeaponStroke.Transparency = tbl2.noksTextStrokeTrans / 100

							if tbl2.noksFlagStateEnable then
								if humanoid_.FloorMaterial == Enum.Material.Air then
									v6.FlagState.Visible = true
									v6.FlagState.Text = "AIR"
								elseif humanoid_.MoveDirection.Magnitude > 0 then
									v6.FlagState.Visible = true
									v6.FlagState.Text = "RUN"
								else
									v6.FlagState.Visible = false
								end

								v6.FlagState.Font = v5
								v6.FlagState.TextSize = tbl2.noksFlagTextSize
								v6.FlagState.TextColor3 = tbl2.noksFlagStateColor
								v6.FlagStateStroke.Thickness = tbl2.noksTextStrokeThickness
								v6.FlagStateStroke.Transparency = tbl2.noksTextStrokeTrans / 100
							else
								v6.FlagState.Visible = false
							end

							v6.FlagTeam.Visible = false
						else
							v6.FlagName.Visible = false
							v6.FlagWeapon.Visible = false
							v6.FlagState.Visible = false
							v6.FlagTeam.Visible = false
						end

						v6.Canvas.GroupTransparency = 0

						if tbl2.noksSkeletonEnable then
							v6.SkeletonContainer.Visible = true
							local flag2 = humanoid_.RigType == Enum.HumanoidRigType.R15 and tbl19 or tbl20
							local n11 = 0

							if tbl2.noksSkeletonScroll then
								local n12 = tbl2.noksSkeletonScrollSpeed / 10
								n11 = -(tick() * n12) % 1
							end

							for i = 1, 14 do
								local v9 = v6.BoneFrames[i]
								local v10 = flag2[i]

								if v10 then
									local v11 = v10[1]
									local v12 = v10[2]
									local v13 = k:FindFirstChild(v11)
									local v14 = k:FindFirstChild(v12)

									if v13 and v14 then
										local v15 = getJointPosition(k, v11, v12)
										local v16 = getJointPosition(k, v12, v11)

										if v15 and v16 then
											local v17, v18 = currentCamera:WorldToViewportPoint(v15)
											local v19, v20 = currentCamera:WorldToViewportPoint(v16)

											if v18 or v20 then
												v9.Frame.Visible = true
												updateNoksLine(v9.Frame, v17, v19, tbl2.noksSkeletonThickness)

												if tbl2.noksSkeletonGradient then
													v9.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
													v9.Grad.Color = ColorSequence.new(tbl2.noksSkeletonColor1, tbl2.noksSkeletonColor2)
													v9.Grad.Offset = Vector2.new(n11, 0)
													v9.Grad.Enabled = true
												else
													v9.Grad.Enabled = false
													v9.Frame.BackgroundColor3 = tbl2.noksSkeletonColor1
												end
											else
												v9.Frame.Visible = false
											end
										else
											v9.Frame.Visible = false
										end
									else
										v9.Frame.Visible = false
									end
								else
									v9.Frame.Visible = false
								end
							end
						else
							v6.SkeletonContainer.Visible = false
						end
					else
						v6.Gui.Enabled = false

						pcall(function()
							if k:FindFirstChild("Noks_Highlight") then
								k.Noks_Highlight:Destroy()
							end
						end)
					end
				end
			else
				v6.Gui.Enabled = false

				pcall(function()
					if k:FindFirstChild("Noks_Highlight") then
						k.Noks_Highlight:Destroy()
					end
				end)
			end
		end

		for _, v6 in ipairs(tbl22) do
			removeNoksESP(v6)
		end

		for i = #tbl16, 1, -1 do
			local v6 = tbl16[i]
			local n9 = now2 - v6.FadeStartTime
			local noksFadeDuration = tbl2.noksFadeDuration

			if noksFadeDuration <= n9 then
				v6.Gui:Destroy()
				table.remove(tbl16, i)
			else
				local n10 = n9 / noksFadeDuration
				local v7, v8 = currentCamera:WorldToViewportPoint(v6.WorldPosition)

				if v8 then
					v6.Gui.Enabled = true
					local deathHeight = v6.DeathHeight
					local deathWidth = v6.DeathWidth

					if v6.CloneBox then
						v6.CloneBox.Position = UDim2.new(0, v7.X - deathWidth / 2, 0, v7.Y - deathHeight / 2)
						v6.CloneBox.Size = UDim2.new(0, deathWidth, 0, deathHeight)
					end

					if v6.CloneHealthBg then
						v6.CloneHealthBg.Position = UDim2.new(0, v7.X - deathWidth / 2 - tbl2.noksHealthBarOffset, 0, v7.Y - deathHeight / 2)
						v6.CloneHealthBg.Size = UDim2.new(0, tbl2.noksHealthBarWidth, 0, deathHeight)
					end

					if v6.CloneNameLabel then
						v6.CloneNameLabel.Position = UDim2.new(0, v7.X - 100, 0, v7.Y - deathHeight / 2 - tbl2.noksTextSize + 7)
					end

					if v6.CloneHpLabel and v6.CloneHpLabel.Visible then
						v6.CloneHpLabel.Position = UDim2.new(0, v7.X - deathWidth / 2 - tbl2.noksHealthBarOffset + 16, 0, v7.Y - deathHeight / 2 + deathHeight * (1 - v6.LastHealthRatio) - 4)
					end

					if v6.CloneDist then
						v6.CloneDist.Position = UDim2.new(0, v7.X - 100, 0, v7.Y + deathHeight / 2 + 4)
					end

					if v6.CloneLine and v6.CloneLine.Visible then
						local noksLineThickness = tbl2.noksLineThickness
						updateNoksLine(v6.CloneLine, vector2, Vector2.new(v7.X, v7.Y + deathHeight / 2), noksLineThickness)
					end

					if v6.CloneFlags then
						v6.CloneFlags.Position = UDim2.new(0, v7.X + deathWidth / 2 + 5, 0, v7.Y - deathHeight / 2)
						v6.CloneFlags.Size = UDim2.new(0, 150, 0, deathHeight)
					end
				else
					v6.Gui.Enabled = false
				end

				noksApplyFadeTransparency(v6.Snapshot, n10)

				if v6.CloneBox then
					local noksFillGrad = v6.CloneBox:FindFirstChild("Noks_FillGrad")

					if noksFillGrad and tbl2.noksGradientFill and tbl2.noksGradientRotate then
						noksFillGrad.Rotation = (v6.BoxFillGradRotation + tbl2.noksRotateSpeed * n9) % 360
					end
				end

				if v6.CloneNameLabel then
					local uiGradient = v6.CloneNameLabel:FindFirstChildOfClass("UIGradient")

					if uiGradient and tbl2.noksNameGradient then
						local now3 = tick()
						local n11 = now3 - v6.LastUpdate
						v6.LastUpdate = now3
						v6.NameGradientOffset = v6.NameGradientOffset + tbl2.noksNameScrollSpeed / 10 * n11 * v6.NameGradientDirection

						if v6.NameGradientOffset >= 1 then
							v6.NameGradientOffset = 1
							v6.NameGradientDirection = -1
						elseif v6.NameGradientOffset <= 0 then
							v6.NameGradientOffset = 0
							v6.NameGradientDirection = 1
						end

						uiGradient.Offset = Vector2.new(-v6.NameGradientOffset, 0)
					end
				end
			end
		end
	end)
end

local tbl14
tbl14 = {}
local numberSequence
numberSequence = NumberSequence.new
local new
new = NumberSequenceKeypoint.new
local numberRange
numberRange = NumberRange.new

getActiveCharacterParts = function()
	local character = localPlayer.Character
	if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Head") and character:FindFirstChild("Humanoid") then
		return character, character.Head, character.HumanoidRootPart
	end
	return nil, nil, nil
end

local part_
local folder = Instance.new("Folder")
folder.Name = "PoophubHalo"
folder.Parent = workspace
part_ = Instance.new("Part")
part_.Name = "HaloPart"
part_.Size = Vector3.new(2, 1, 1)
part_.Material = Enum.Material.ForceField
part_.Anchored = true
part_.CanCollide = false
part_.Transparency = 1
part_.Parent = folder
local attachment
attachment = Instance.new("Attachment")
attachment.CFrame = CFrame.new(-0.25, 0.93, 0.25, 0.4689, -0.2499, -0.8471, -0.1171, 0.933, -0.3401, 0.8754, 0.2587, 0.4082)
attachment.Visible = false
attachment.Parent = part_

newHaloRing = function(size, name)
	local particleEmitter = Instance.new("ParticleEmitter")
	particleEmitter.Name = name
	particleEmitter.Texture = "rbxassetid://8819682608"
	particleEmitter.Rate = tbl2.haloRate
	particleEmitter.Lifetime = numberRange(1, 1)
	particleEmitter.Speed = numberRange(0.001, 0.001)
	particleEmitter.RotSpeed = numberRange(-400, 400)
	particleEmitter.Rotation = numberRange(0, 360)
	particleEmitter.Size = size
	local tbl15 = {}
	local v5 = new(0, 1)
	local v6 = new(0.2, 0)
	local v7 = new(0.8, 0)
	tbl15[1] = v5
	tbl15[2] = v6
	tbl15[3] = v7

	do
		local values = table.pack(new(1, 1))
		table.move(values, 1, values.n, 4, tbl15)
	end

	particleEmitter.Transparency = numberSequence(tbl15)
	particleEmitter.Color = ColorSequence.new(tbl2.haloColor)
	particleEmitter.LightEmission = 1
	particleEmitter.Brightness = tbl2.haloBrightness
	particleEmitter.SpreadAngle = Vector2.new(5, 5)
	particleEmitter.LockedToPart = true
	particleEmitter.Shape = Enum.ParticleEmitterShape.Box
	particleEmitter.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
	particleEmitter.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
	particleEmitter.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
	particleEmitter.Parent = attachment
	return particleEmitter
end

do
	local v5 = newHaloRing(numberSequence({ new(0, 2.5), new(1, 3) }), "Ring1")
	local v6 = newHaloRing(numberSequence({ new(0, 2), new(1, 3) }), "Ring2")

	setHaloEnabled = function(enabled)
		v5.Enabled = enabled
		v6.Enabled = enabled
	end

	updateHaloColor = function(arg)
		v5.Color = ColorSequence.new(arg)
		v6.Color = ColorSequence.new(arg)
	end

	updateHaloRate = function(rate)
		v5.Rate = rate
		v6.Rate = rate
	end

	updateHaloBright = function(brightness)
		v5.Brightness = brightness
		v6.Brightness = brightness
	end
end

local part_2
local folder2 = Instance.new("Folder")
folder2.Name = "PoophubAmbientAura"
folder2.Parent = workspace
part_2 = Instance.new("Part")
part_2.Name = "AuraRoot"
part_2.Size = Vector3.new(2, 2, 1)
part_2.Transparency = 1
part_2.Anchored = true
part_2.CanCollide = false
part_2.Massless = true
part_2.Parent = folder2

makeAura = function(arg)
	local particleEmitter = Instance.new("ParticleEmitter")

	for k, v5 in pairs(arg) do
		particleEmitter[k] = v5
	end

	particleEmitter.Parent = part_2
	return particleEmitter
end

do
	local v5 = makeAura

	local tbl15 = {
		Name = "Ambient2",
		Texture = "rbxassetid://12713358087",
		Rate = 20,
		Lifetime = numberRange(2, 2),
		Speed = numberRange(0.001, 0.001),
		RotSpeed = numberRange(-600, 600),
		Rotation = numberRange(0, 360),
	}

	local tbl16 = {}
	local v6 = new(0, 0)
	local v7 = new(0.3, 1)
	local v8 = new(0.6, 2.5)
	local v9 = new(0.8, 4)
	tbl16[1] = v6
	tbl16[2] = v7
	tbl16[3] = v8
	tbl16[4] = v9

	do
		local values = table.pack(new(1, 6))
		table.move(values, 1, values.n, 5, tbl16)
	end

	tbl15.Size = numberSequence(tbl16)
	tbl15.Transparency = numberSequence({ new(0, 0), new(1, 1) })
	tbl15.Color = ColorSequence.new(tbl2.auraColor)
	tbl15.LightEmission = 1
	tbl15.Brightness = 2
	tbl15.LockedToPart = true
	tbl15.EmissionDirection = Enum.NormalId.Top
	tbl15.Shape = Enum.ParticleEmitterShape.Box
	tbl15.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
	tbl15.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
	tbl15.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
	local v10 = v5(tbl15)
	local v11 = makeAura

	local tbl17 = {
		Name = "Stars",
		Texture = "rbxassetid://7216849325",
		Rate = 20,
		Lifetime = numberRange(2, 2),
		Speed = numberRange(0.001, 0.001),
		RotSpeed = numberRange(-30, 30),
		Rotation = numberRange(0, 360),
	}

	local tbl18 = {}
	local v12 = new(0, 0)
	local v13 = new(0.3, 1)
	local v14 = new(0.6, 2.5)
	local v15 = new(0.8, 4)
	tbl18[1] = v12
	tbl18[2] = v13
	tbl18[3] = v14
	tbl18[4] = v15

	do
		local values = table.pack(new(1, 6))
		table.move(values, 1, values.n, 5, tbl18)
	end

	tbl17.Size = numberSequence(tbl18)
	local tbl19 = {}
	local v16 = new(0, 0)
	local v17 = new(0.6, 0.2)
	tbl19[1] = v16
	tbl19[2] = v17

	do
		local values = table.pack(new(1, 1))
		table.move(values, 1, values.n, 3, tbl19)
	end

	tbl17.Transparency = numberSequence(tbl19)
	tbl17.Color = ColorSequence.new(tbl2.auraColor)
	tbl17.LightEmission = 1
	tbl17.Brightness = 2
	tbl17.LockedToPart = true
	tbl17.EmissionDirection = Enum.NormalId.Top
	tbl17.Shape = Enum.ParticleEmitterShape.Box
	tbl17.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
	tbl17.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
	tbl17.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
	local v18 = v11(tbl17)
	local v19 = makeAura

	local tbl20 = {
		Name = "Ambient1",
		Texture = "rbxassetid://7216855136",
		Rate = 20,
		Lifetime = numberRange(2, 2),
		Speed = numberRange(0.001, 0.001),
		RotSpeed = numberRange(-40, 40),
		Rotation = numberRange(0, 360),
	}

	local tbl21 = {}
	local v20 = new(0, 0)
	local v21 = new(0.3, 2)
	local v22 = new(0.6, 5)
	local v23 = new(0.8, 8)
	tbl21[1] = v20
	tbl21[2] = v21
	tbl21[3] = v22
	tbl21[4] = v23

	do
		local values = table.pack(new(1, 12))
		table.move(values, 1, values.n, 5, tbl21)
	end

	tbl20.Size = numberSequence(tbl21)
	local tbl22 = {}
	local v24 = new(0, 1)
	local v25 = new(0.2, 0.3)
	tbl22[1] = v24
	tbl22[2] = v25

	do
		local values = table.pack(new(1, 1))
		table.move(values, 1, values.n, 3, tbl22)
	end

	tbl20.Transparency = numberSequence(tbl22)
	tbl20.Color = ColorSequence.new(tbl2.auraColor)
	tbl20.LightEmission = 1
	tbl20.Brightness = 2
	tbl20.LockedToPart = true
	tbl20.EmissionDirection = Enum.NormalId.Top
	tbl20.Shape = Enum.ParticleEmitterShape.Box
	tbl20.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
	tbl20.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
	tbl20.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
	local v26 = v19(tbl20)
	local tbl23 = { v10, v18, v26 }

	setAuraEnabled = function(enabled)
		for _, v27 in ipairs(tbl23) do
			v27.Enabled = enabled
		end
	end

	updateAuraColor = function(arg)
		for _, v27 in ipairs(tbl23) do
			v27.Color = ColorSequence.new(arg)
		end
	end

	updateAuraRate = function(rate)
		for _, v27 in ipairs(tbl23) do
			v27.Rate = rate
		end
	end

	updateAuraBright = function(brightness)
		for _, v27 in ipairs(tbl23) do
			v27.Brightness = brightness
		end
	end
end

local part_3
local folder3 = Instance.new("Folder")
folder3.Name = "PoophubAngelWings"
folder3.Parent = workspace
part_3 = Instance.new("Part")
part_3.Name = "AngelRoot"
part_3.Size = Vector3.new(2, 2, 1)
part_3.Material = Enum.Material.ForceField
part_3.Anchored = true
part_3.CanCollide = false
part_3.Transparency = 1
part_3.Parent = folder3
local attachment2
attachment2 = Instance.new("Attachment")
attachment2.CFrame = CFrame.new(-1.012, 0.5, 0.852) * CFrame.Angles(0, 0.26179938779914941, 0)
attachment2.Parent = part_3
local attachment3
attachment3 = Instance.new("Attachment")
attachment3.CFrame = CFrame.new(1.167, 0.5, 0.852) * CFrame.Angles(0, -0.26179938779914941, 0)
attachment3.Parent = part_3

do
	local attachment4 = Instance.new("Attachment")
	attachment4.CFrame = CFrame.new(0, 0.3, 0)
	attachment4.Parent = part_3

	mkWingParticle = function(parent, emissionDirection)
		local particleEmitter = Instance.new("ParticleEmitter")
		particleEmitter.Texture = "http://www.roblox.com/asset/?id=13267054240"
		particleEmitter.Rate = tbl2.angelRate
		particleEmitter.Lifetime = numberRange(1, 1)
		particleEmitter.Speed = numberRange(0.05, 0.05)
		particleEmitter.RotSpeed = numberRange(0, 0)
		particleEmitter.Rotation = numberRange(-15, -15)
		particleEmitter.Size = numberSequence({ new(0, 2.75), new(1, 3.5) })
		local tbl15 = {}
		local v5 = new(0, 0.944)
		local v6 = new(0.2, 0)
		local v7 = new(0.8, 0)
		tbl15[1] = v5
		tbl15[2] = v6
		tbl15[3] = v7

		do
			local values = table.pack(new(1, 1))
			table.move(values, 1, values.n, 4, tbl15)
		end

		particleEmitter.Transparency = numberSequence(tbl15)
		particleEmitter.Color = ColorSequence.new(tbl2.angelColor)
		particleEmitter.LightEmission = 1
		particleEmitter.Brightness = tbl2.angelBrightness
		particleEmitter.LockedToPart = true
		particleEmitter.Shape = Enum.ParticleEmitterShape.Box
		particleEmitter.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
		particleEmitter.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
		particleEmitter.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
		particleEmitter.EmissionDirection = emissionDirection
		particleEmitter.SpreadAngle = Vector2.new(0, 0)
		particleEmitter.VelocitySpread = 0
		particleEmitter.Parent = parent
		return particleEmitter
	end

	mkAmbientParticle = function(parent)
		local particleEmitter = Instance.new("ParticleEmitter")
		particleEmitter.Texture = "rbxassetid://11402221943"
		particleEmitter.Rate = 5
		particleEmitter.Lifetime = numberRange(2, 2)
		particleEmitter.Speed = numberRange(0.5, 0.5)
		particleEmitter.RotSpeed = numberRange(0, 0)
		particleEmitter.Rotation = numberRange(0, 360)
		particleEmitter.Size = numberSequence({ new(0, 3), new(1, 4) })
		local tbl15 = {}
		local v5 = new(0, 1)
		local v6 = new(0.5, 0.3)
		tbl15[1] = v5
		tbl15[2] = v6

		do
			local values = table.pack(new(1, 1))
			table.move(values, 1, values.n, 3, tbl15)
		end

		particleEmitter.Transparency = numberSequence(tbl15)
		particleEmitter.Color = ColorSequence.new(tbl2.angelColor)
		particleEmitter.LightEmission = 1
		particleEmitter.Brightness = 2
		particleEmitter.LockedToPart = true
		particleEmitter.Shape = Enum.ParticleEmitterShape.Box
		particleEmitter.ShapeStyle = Enum.ParticleEmitterShapeStyle.Volume
		particleEmitter.ShapeInOut = Enum.ParticleEmitterShapeInOut.Outward
		particleEmitter.Orientation = Enum.ParticleOrientation.FacingCamera
		particleEmitter.EmissionDirection = Enum.NormalId.Top
		particleEmitter.SpreadAngle = Vector2.new(180, 180)
		particleEmitter.VelocitySpread = 180
		particleEmitter.FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4
		particleEmitter.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
		particleEmitter.Parent = parent
		return particleEmitter
	end

	local v5 = mkWingParticle(attachment2, Enum.NormalId.Back)
	local v6 = mkWingParticle(attachment3, Enum.NormalId.Front)
	local v7 = mkAmbientParticle(attachment4)
	local tbl15 = { v5, v6, v7 }

	setAngelEnabled = function(enabled)
		for _, v8 in ipairs(tbl15) do
			v8.Enabled = enabled
		end
	end

	updateAngelColor = function(arg)
		for _, v8 in ipairs(tbl15) do
			v8.Color = ColorSequence.new(arg)
		end
	end

	updateAngelRate = function(rate)
		v5.Rate = rate
		v6.Rate = rate
	end

	updateAngelBright = function(brightness)
		for _, v8 in ipairs(tbl15) do
			v8.Brightness = brightness
		end
	end
end

do
	local folder4 = Instance.new("Folder")
	folder4.Name = "PoophubTrail"
	folder4.Parent = workspace
	local part_4 = Instance.new("Part")
	part_4.Name = "TrailRoot"
	part_4.Size = Vector3.new(0.1, 0.1, 0.1)
	part_4.Transparency = 1
	part_4.Anchored = true
	part_4.CanCollide = false
	part_4.Massless = true
	part_4.Parent = folder4
	local attachment4 = Instance.new("Attachment")
	attachment4.Position = Vector3.new(0, 0.5, 0)
	attachment4.Parent = part_4
	local attachment5 = Instance.new("Attachment")
	attachment5.Position = Vector3.new(0, -0.5, 0)
	attachment5.Parent = part_4
	local trail = Instance.new("Trail")
	trail.Attachment0 = attachment4
	trail.Attachment1 = attachment5
	trail.Lifetime = tbl2.trailLifetime
	trail.MinLength = 0.01
	trail.FaceCamera = true
	trail.LightEmission = 1
	trail.LightInfluence = 0
	trail.Brightness = 2
	local tbl15 = {}
	local v5 = new(0, 1)
	local v6 = new(0.4, 0.6)
	local v7 = new(0.7, 0.25)
	tbl15[1] = v5
	tbl15[2] = v6
	tbl15[3] = v7

	do
		local values = table.pack(new(1, 0))
		table.move(values, 1, values.n, 4, tbl15)
	end

	trail.WidthScale = numberSequence(tbl15)
	local tbl16 = {}
	local v8 = new(0, 0)
	local v9 = new(0.5, 0.1)
	local v10 = new(0.8, 0.5)
	tbl16[1] = v8
	tbl16[2] = v9
	tbl16[3] = v10

	do
		local values = table.pack(new(1, 1))
		table.move(values, 1, values.n, 4, tbl16)
	end

	trail.Transparency = numberSequence(tbl16)
	trail.Color = ColorSequence.new(tbl2.trailColor)
	trail.Parent = part_4

	setTrailEnabled = function(enabled)
		trail.Enabled = enabled
	end

	updateTrailColor = function(arg)
		trail.Color = ColorSequence.new(arg)
	end

	updateTrailWidth = function(arg)
		local v11 = trail
		local tbl17 = {}
		local v12 = new(0, 1)
		local v13 = new(0.4, 0.6 * arg / 1.5)
		local v14 = new(0.7, 0.25 * arg / 1.5)
		tbl17[1] = v12
		tbl17[2] = v13
		tbl17[3] = v14

		do
			local values = table.pack(new(1, 0))
			table.move(values, 1, values.n, 4, tbl17)
		end

		v11.WidthScale = numberSequence(tbl17)
		attachment4.Position = Vector3.new(0, arg / 2, 0)
		attachment5.Position = Vector3.new(0, -arg / 2, 0)
	end

	updateTrailLifetime = function(lifetime)
		trail.Lifetime = lifetime
	end

	setHaloEnabled(false)
	setAuraEnabled(false)
	setAngelEnabled(false)
	setTrailEnabled(false)

	runService.RenderStepped:Connect(function(deltaTime)
		if tbl2.rainbowEnabled then
			tbl3.rainbowHue = (tbl3.rainbowHue + tbl2.rainbowSpeed * deltaTime) % 1
		end

		local color = Color3.fromHSV(tbl3.rainbowHue, 0.85, 1)
		local v11, v12, v13 = getActiveCharacterParts()

		if v11 and v12 and v13 then
			if tbl2.haloEnabled then
				part_.CFrame = CFrame.new(v12.Position.X + tbl2.haloOffsetX, v12.Position.Y + tbl2.haloOffsetY, v12.Position.Z + tbl2.haloOffsetZ)

				if tbl2.rainbowEnabled and tbl2.rainbowHalo then
					updateHaloColor(color)
				else
					updateHaloColor(tbl2.haloColor)
				end
			end

			if tbl2.auraEnabled then
				part_2.CFrame = CFrame.new(v13.Position.X + tbl2.auraOffsetX, v13.Position.Y + tbl2.auraOffsetY, v13.Position.Z + tbl2.auraOffsetZ)

				if tbl2.rainbowEnabled and tbl2.rainbowAura then
					updateAuraColor(color)
				else
					updateAuraColor(tbl2.auraColor)
				end
			end

			if tbl2.angelEnabled then
				part_3.CFrame = v13.CFrame * CFrame.new(tbl2.angelOffsetX, tbl2.angelOffsetY, 0)

				if tbl2.rainbowEnabled and tbl2.rainbowAngel then
					updateAngelColor(color)
				else
					updateAngelColor(tbl2.angelColor)
				end
			end

			if tbl2.trailEnabled then
				part_4.CFrame = v13.CFrame

				if tbl2.rainbowEnabled and tbl2.rainbowTrail then
					updateTrailColor(color)
				else
					updateTrailColor(tbl2.trailColor)
				end
			end
		end
	end)
end

genv.__PoopHubShared.mcOriginalPartTextures = genv.__PoopHubShared.mcOriginalPartTextures or {}

do
	local mcOriginalPartTextures = genv.__PoopHubShared.mcOriginalPartTextures

	local tbl15 = {
		Rock = "rbxassetid://5003953441",
		Grass = "rbxassetid://9267183930",
		GrassCorner = "rbxassetid://151708391",
		Sand = "rbxassetid://9277770677",
		Wood = "rbxassetid://9359131807",
		Snow = "rbxassetid://5612862976",
		Dirt = "rbxassetid://152569532",
		Glass = "rbxassetid://152239003",
		Ocean = "rbxassetid://152572260",
		DarkRock = "rbxassetid://152572250",
		Moss = "rbxassetid://152239826",
		Barn = "rbxassetid://151695075",
		Chain = "rbxassetid://4722586771",
		PlotWood = "rbxassetid://152572250",
		PlotSkin = "rbxassetid://152240077",
		PlotDarkPurp = "rbxassetid://151802104",
		PlotDarkRed = "rbxassetid://152527418",
		FenceWood = "rbxassetid://151776506",
		PinkGrass = "rbxassetid://151683222",
		TrackMetal = "rbxassetid://151776506",
		WoodBeige = "rbxassetid://152572161",
	}

	local tbl16 = {
		{ keywords = { "trunk", "deadtree", "tree", "branch", "log" }, id = tbl15.Wood },
		{ keywords = { "flowerstem", "stem", "flower" }, id = tbl15.Grass },
		{ keywords = { "rock", "stone", "cobble", "brick" }, id = tbl15.Rock },
		{ keywords = { "grass", "lawn", "turf", "ground" }, id = tbl15.Grass },
		{ keywords = { "sand", "desert", "beach", "dune" }, id = tbl15.Sand },
		{ keywords = { "wood", "plank", "lumber" }, id = tbl15.Wood },
		{ keywords = { "snow", "ice", "glacier", "frost", "frozen" }, id = tbl15.Snow },
		{ keywords = { "dirt", "soil", "mud" }, id = tbl15.Dirt },
		{ keywords = { "glass", "window", "pane" }, id = tbl15.Glass },
		{ keywords = { "ocean", "water", "sea", "river", "lake" }, id = tbl15.Ocean },
	}

	local tbl17 = {
		{ keywords = { "deadtree", "tree" }, id = tbl15.Wood },
		{ keywords = { "flowerstem", "stem" }, id = tbl15.Grass },
	}

	local tbl18 = {}

	local tbl19 = {
		color = Color3.fromRGB(202, 203, 209),
		material = Enum.Material.WoodPlanks,
		id = tbl15.Rock,
		note = "Global: WoodPlanks grey",
	}

	local tbl20 = {
		color = Color3.fromRGB(105, 102, 92),
		material = Enum.Material.WoodPlanks,
		id = tbl15.DarkRock,
		note = "Global: WoodPlanks brown",
	}

	local tbl21 = {
		color = Color3.fromRGB(90, 79, 71),
		material = Enum.Material.WoodPlanks,
		id = tbl15.DarkRock,
		note = "Global: WoodPlanks dark brown",
	}

	local tbl22 = {
		color = Color3.fromRGB(175, 148, 131),
		material = Enum.Material.WoodPlanks,
		id = tbl15.WoodBeige,
		note = "Global: WoodPlanks beige",
	}

	tbl18[1] = tbl19
	tbl18[2] = tbl20
	tbl18[3] = tbl21
	tbl18[4] = tbl22
	local tbl23 = {}

	local tbl24 = {
		pathContains = { "Map", "FactoryIsland", "Chain" },
		color = nil,
		material = nil,
		id = tbl15.Chain,
		note = "FactoryIsland.Chain",
	}

	local tbl25 = {
		pathContains = { "Plots" },
		color = Color3.fromRGB(152, 118, 84),
		material = Enum.Material.WoodPlanks,
		id = tbl15.PlotWood,
		note = "Plots: WoodPlanks tan",
	}

	local tbl26 = {
		pathContains = { "Plots" },
		color = Color3.fromRGB(255, 204, 153),
		material = Enum.Material.Plastic,
		id = tbl15.PlotSkin,
		note = "Plots: Plastic skin",
	}

	local tbl27 = {
		pathContains = { "Plots" },
		color = Color3.fromRGB(44, 16, 44),
		material = Enum.Material.Plastic,
		id = tbl15.PlotDarkPurp,
		note = "Plots: Plastic dark purple",
	}

	local tbl28 = {
		pathContains = { "Plots" },
		color = Color3.fromRGB(63, 0, 0),
		material = Enum.Material.Plastic,
		id = tbl15.PlotDarkRed,
		note = "Plots: Plastic dark red",
	}

	local tbl29 = {
		pathContains = { "Plots", "Plot5", "House" },
		color = Color3.fromRGB(255, 130, 222),
		material = Enum.Material.Grass,
		id = tbl15.PinkGrass,
		note = "Plot5.House: Grass pink",
	}

	local tbl30 = {
		pathContains = { "Map", "CaveMountain", "House" },
		classFilter = "WedgePart",
		color = Color3.fromRGB(39, 70, 45),
		material = Enum.Material.Plastic,
		id = tbl15.Moss,
		note = "CaveMountain WedgePart",
	}

	local tbl31 = {
		pathContains = { "Map", "BarnHillArea", "Barn" },
		color = Color3.fromRGB(148, 75, 75),
		material = Enum.Material.WoodPlanks,
		id = tbl15.Barn,
		note = "Barn: WoodPlanks red",
	}

	local tbl32 = {
		pathContains = { "Map", "BarnHillArea", "Farm", "FencedWheatField", "HighTensileFence" },
		color = Color3.fromRGB(115, 107, 103),
		material = Enum.Material.Wood,
		id = tbl15.FenceWood,
		note = "HighTensileFence: Wood grey",
	}

	local tbl33 = {
		pathContains = { "Map", "TrainTunnel", "TunnelTrainTracks", "TrackInvCom" },
		color = Color3.fromRGB(99, 95, 98),
		material = Enum.Material.Metal,
		id = tbl15.TrackMetal,
		note = "TrackInvCom: Metal grey",
	}

	tbl23[1] = tbl24
	tbl23[2] = tbl25
	tbl23[3] = tbl26
	tbl23[4] = tbl27
	tbl23[5] = tbl28
	tbl23[6] = tbl29
	tbl23[7] = tbl30
	tbl23[8] = tbl31
	tbl23[9] = tbl32
	tbl23[10] = tbl33

	TexLog = function(arg)
		if tbl2.mcTexturesDebug then
			print("[MCTex] " .. tostring(arg))
		end
	end

	ColorMatch = function(arg, arg2, arg3)
		local n8 = arg3 or 0.039215686274509803
		return math.abs(arg.R - arg2.R) < n8 and math.abs(arg.G - arg2.G) < n8 and math.abs(arg.B - arg2.B) < n8
	end

	GetFullPath = function(arg)
		local tbl34 = {}

		while arg do
			table.insert(tbl34, 1, arg.Name)
			arg = arg.Parent
		end

		return table.concat(tbl34, ".")
	end

	PathContainsAll = function(arg, arg2)
		local str2 = GetFullPath(arg):lower()

		for _, v5 in ipairs(arg2) do
			if not str2:find(v5:lower(), 1, true) then
				return false
			end
		end

		return true
	end

	ResolveCornerWedge = function(arg)
		if not arg:IsA("CornerWedgePart") then
			return nil, nil
		end
		local str2 = arg.Name:lower()

		for _, v5 in ipairs({ "grass", "lawn", "turf", "ground" }) do
			if str2:find(v5) then
				return tbl15.GrassCorner, "CornerWedge:" .. v5
			end
		end

		return nil, nil
	end

	ResolveByPathColor = function(arg)
		for _, v5 in ipairs(tbl23) do
			if PathContainsAll(arg, v5.pathContains) then
				local isA = v5.classFilter == nil or arg:IsA(v5.classFilter)
				local flag2 = v5.color == nil or ColorMatch(arg.Color, v5.color)
				if isA and flag2 and (v5.material == nil or arg.Material == v5.material) then
					return v5.id, v5.note
				end
			end
		end

		return nil, nil
	end

	ResolveByColorMaterial = function(arg)
		for _, v5 in ipairs(tbl18) do
			if arg.Material == v5.material and ColorMatch(arg.Color, v5.color) then
				return v5.id, v5.note
			end
		end

		return nil, nil
	end

	ResolveByParentModel = function(arg)
		local parent = arg.Parent
		local n8 = 0

		while parent and n8 < 6 do
			if parent:IsA("Model") or parent:IsA("Folder") then
				local str2 = parent.Name:lower()

				for _, v5 in ipairs(tbl17) do
					for _, keyword in ipairs(v5.keywords) do
						if str2:find(keyword) then
							return v5.id, "parent:" .. keyword
						end
					end
				end
			end

			parent = parent.Parent
			n8 += 1
		end

		return nil, nil
	end

	ResolveByName = function(arg)
		local str2 = arg.Name:lower()

		for _, v5 in ipairs(tbl16) do
			for _, keyword in ipairs(v5.keywords) do
				if str2:find(keyword) then
					return v5.id, "name:" .. keyword
				end
			end
		end

		return nil, nil
	end

	Resolve = function(arg)
		local v5, v6 = ResolveCornerWedge(arg)
		if v5 then
			return v5, v6
		end
		local v7, v8 = ResolveByPathColor(arg)
		if v7 then
			return v7, v8
		end
		local v9, v10 = ResolveByColorMaterial(arg)
		if v9 then
			return v9, v10
		end
		local v11, v12 = ResolveByParentModel(arg)
		if v11 then
			return v11, v12
		end
		local v13, v14 = ResolveByName(arg)
		if v13 then
			return v13, v14
		end
		return nil, nil
	end

	ShouldSkipMCPart = function(arg)
		local str2 = GetFullPath(arg):lower()

		if arg.Name == "SNOWPART" then
			local parent = arg.Parent
			if parent and parent:IsA("Model") and parent.Name == "_PoophubSnowSystem" then
				return true
			end
		end

		for _, v5 in ipairs({ "sky", "skybox", "cloud", "sun", "moon", "star" }) do
			if str2:find(v5, 1, true) then
				return true
			end
		end

		return false
	end

	PasteFace = function(parent, face, texture)
		local texture2 = Instance.new("Texture")
		texture2.Texture = texture
		texture2.Face = face
		texture2.StudsPerTileU = tbl2.mcTileSize
		texture2.StudsPerTileV = tbl2.mcTileSize
		texture2.Parent = parent
	end

	ApplyAllFaces = function(arg, arg2)
		for _, v5 in ipairs({
			Enum.NormalId.Top,
			Enum.NormalId.Bottom,
			Enum.NormalId.Front,
			Enum.NormalId.Back,
			Enum.NormalId.Left,
			Enum.NormalId.Right,
		}) do
			PasteFace(arg, v5, arg2)
		end
	end

	ApplyMCTextures = function()
		local tbl34 = {}
		local n8 = 0
		local n9 = 0
		local n10 = 0

		for _, descendant in ipairs(workspace:GetDescendants()) do
			if descendant:IsA("BasePart") and not descendant:IsA("Terrain") then
				n8 += 1

				if ShouldSkipMCPart(descendant) then
					n9 += 1
					TexLog(string.format("SKIP [sky/snow] 鬩包ｽｶ驗呻ｽｫ郢晢ｽｻ%s", descendant:GetFullName()))
				else
					local v5, v6 = Resolve(descendant)

					if v5 == tbl15.Snow then
						n9 += 1
						TexLog(string.format("SKIP [snow] 鬩包ｽｶ驗呻ｽｫ郢晢ｽｻ%s", descendant:GetFullName()))
					elseif v5 then
						if mcOriginalPartTextures[descendant] == nil then
							local tbl35 = {}

							for _, child in ipairs(descendant:GetChildren()) do
								if child:IsA("Texture") or child:IsA("Decal") then
									table.insert(tbl35, child:Clone())
									child:Destroy()
								end
							end

							if #tbl35 == 0 then
								tbl35 = { "empty" }
							end

							mcOriginalPartTextures[descendant] = tbl35
						else
							for _, child in ipairs(descendant:GetChildren()) do
								if child:IsA("Texture") or child:IsA("Decal") then
									child:Destroy()
								end
							end
						end

						ApplyAllFaces(descendant, v5)
						n10 += 1
						tbl34[v6] = (tbl34[v6] or 0) + 1
						TexLog(string.format("HIT [%s] 鬩包ｽｶ驗呻ｽｫ郢晢ｽｻ%s", v6, descendant:GetFullName()))
					else
						n9 += 1
						TexLog(string.format("SKIP 鬩包ｽｶ驗呻ｽｫ郢晢ｽｻ%s", descendant:GetFullName()))
					end
				end
			end
		end

		TexLog(string.format("Scanned:%d Applied:%d Skipped:%d", n8, n10, n9))
		return n10, n9
	end

	RestoreOriginalTextures = function()
		local n8 = 0

		for k, mcOriginalPartTexture in pairs(mcOriginalPartTextures) do
			if k and k.Parent then
				for _, child in ipairs(k:GetChildren()) do
					if child:IsA("Texture") or child:IsA("Decal") then
						child:Destroy()
					end
				end

				for _, v5 in ipairs(mcOriginalPartTexture) do
					if v5 ~= "empty" then
						v5:Clone().Parent = k
					end
				end

				n8 += 1
			end
		end

		table.clear(mcOriginalPartTextures)
		TexLog(string.format("Restored %d parts", n8))
	end
end

do
	local tbl15 = { "TextLabel", "TextButton", "TextBox" }
	local tbl16 = {}
	local tbl17 = {}

	FontLog = function(arg)
		if tbl2.mcFontDebug then
			print("[MCFont] " .. tostring(arg))
		end
	end

	ApplyFontObj = function(arg)
		for _, v5 in ipairs(tbl15) do
			if arg:IsA(v5) then
				if tbl16[arg] == nil then
					tbl16[arg] = arg.FontFace
				end

				pcall(function()
					arg.FontFace = Font.new("rbxassetid://12187371840")
				end)

				FontLog("Applied 鬩包ｽｶ驗呻ｽｫ郢晢ｽｻ" .. arg:GetFullName())
				return
			end
		end
	end

	ApplyFontToRoot = function(arg)
		local n8 = 0

		pcall(function()
			for _, descendant in ipairs(arg:GetDescendants()) do
				for _, v5 in ipairs(tbl15) do
					if descendant:IsA(v5) then
						if tbl16[descendant] == nil then
							tbl16[descendant] = descendant.FontFace
						end

						pcall(function()
							descendant.FontFace = Font.new("rbxassetid://12187371840")
						end)

						n8 += 1
						FontLog("Applied 鬩包ｽｶ驗呻ｽｫ郢晢ｽｻ" .. descendant:GetFullName())
						break
					end
				end
			end
		end)

		return n8
	end

	ApplyFontAll = function()
		local n8 = 0

		if playerGui then
			n8 = 0 + ApplyFontToRoot(playerGui)
		end

		FontLog(string.format("Total applied: %d", n8))
		return n8
	end

	RestoreOriginalFonts = function()
		local n8 = 0

		for k, v5 in pairs(tbl16) do
			if k and k.Parent then
				pcall(function()
					k.FontFace = v5
				end)

				n8 += 1
			end
		end

		table.clear(tbl16)
		FontLog(string.format("Restored %d elements", n8))
	end

	StartFontAutoApply = function()
		for _, v5 in ipairs(tbl17) do
			v5:Disconnect()
		end

		tbl17 = {}

		watch = function(arg)
			pcall(function()
				local connection3 = arg.DescendantAdded:Connect(function(descendant)
					task.defer(function()
						if tbl2.mcFontEnabled then
							ApplyFontObj(descendant)
						end
					end)
				end)

				table.insert(tbl17, connection3)
			end)
		end

		if playerGui then
			watch(playerGui)
		end

		FontLog("Auto-apply started.")
	end

	StopFontAutoApply = function()
		for _, v5 in ipairs(tbl17) do
			v5:Disconnect()
		end

		tbl17 = {}
		FontLog("Auto-apply stopped.")
	end
end

tbl14.setHaloEnabled = setHaloEnabled
tbl14.updateHaloColor = updateHaloColor
tbl14.updateHaloRate = updateHaloRate
tbl14.updateHaloBright = updateHaloBright
tbl14.haloAtt = attachment
tbl14.setAuraEnabled = setAuraEnabled
tbl14.updateAuraColor = updateAuraColor
tbl14.updateAuraRate = updateAuraRate
tbl14.updateAuraBright = updateAuraBright
tbl14.setAngelEnabled = setAngelEnabled
tbl14.updateAngelColor = updateAngelColor
tbl14.updateAngelRate = updateAngelRate
tbl14.updateAngelBright = updateAngelBright
tbl14.attL = attachment2
tbl14.attR = attachment3
tbl14.setTrailEnabled = setTrailEnabled
tbl14.updateTrailColor = updateTrailColor
tbl14.updateTrailWidth = updateTrailWidth
tbl14.updateTrailLifetime = updateTrailLifetime
tbl14.ApplyMCTextures = ApplyMCTextures
tbl14.RestoreOriginalTextures = RestoreOriginalTextures
tbl14.ApplyFontAll = ApplyFontAll
tbl14.RestoreOriginalFonts = RestoreOriginalFonts
tbl14.StartFontAutoApply = StartFontAutoApply
tbl14.StopFontAutoApply = StopFontAutoApply

pcall(function()
	if not isfolder("PoopHub") then
		makefolder("PoopHub")
	end

	if not isfolder("PoopHub/Logo") then
		makefolder("PoopHub/Logo")
	end

	if not isfolder("PoopHub/Logo/UBG") then
		makefolder("PoopHub/Logo/UBG")
	end

	if not isfolder("PoopHub/Logo/FTAP") then
		makefolder("PoopHub/Logo/FTAP")
	end

	if not isfolder("PoopHub/Logo/FTAP/ASSET") then
		makefolder("PoopHub/Logo/FTAP/ASSET")
	end
end)

pcall(function()
	writefile("PoopHub/Logo/FTAP/dcusplanet.png", game:HttpGet("https://dcus.pro/planet.png"))
end)

local result
local ok

ok, result = pcall(function()
	return getcustomasset("PoopHub/Logo/FTAP/dcusplanet.png")
end)

if not (ok and result) then
	result = "rbxassetid://117677503754205"
end

local v5

v5 = Library:CreateWindow({
	Title = "PoopHub",
	SubTitle = "Premium",
	Footer = "FTAP | V5 | Made by dcus",
	TabShowTime = 1.5,
	Icon = result,
	ShowCustomCursor = true,
	AutoShow = true,
	NotifySide = "Right",
})

local tbl15

tbl15 = {
	Home = v5:AddTab("Home", "house", "Home page & script status"),
	Defense = v5:AddTab("Defense", "shield", "Protection features"),
	Grab = v5:AddTab("Grab", "rbxassetid://10723404472", "Grab controls & exploits"),
	Blobman = v5:AddTab("Blobman", "rbxassetid://10709782230", "Blobman control & loops"),
	Aura = v5:AddTab("Aura", "zap", "Aura exploits"),
	Target = v5:AddTab("Target", "crosshair", "Track & target options"),
	Kick = v5:AddTab("Kick", "ban", "Kick & lag methods"),
	Wing = v5:AddTab("Wing", "feather", "Wing visuals"),
	Attack = v5:AddTab("Attack", "swords", "Sit loops & breakers"),
	Character = v5:AddTab("Character", "rbxassetid://10747372167", "Walkspeed & character options"),
	ESP = v5:AddTab("ESP", "eye", "Player ESP & visual chams"),
	Visual = v5:AddTab("Visual", "palette", "Visual toggles & themes"),
	Lighting = v5:AddTab("Lighting", "sun", "Lighting & snow options"),
	Fun = v5:AddTab("Fun", "smile", "Emotes & animations"),
	ToyMod = v5:AddTab("Toy Mod", "package", "Toy shields & modifiers"),
	Misc = v5:AddTab("Misc", "rbxassetid://10734897250", "Trigger Bot & Silent Aim"),
	World = v5:AddTab("World", "globe", "World settings & custom blackholes"),
	UISettings = v5:AddTab("UI Settings", "settings", "UI settings & configuration"),
}

local Information = tbl15.Home:AddLeftGroupbox("Information")
Information:AddLabel("Version: " .. version)
Information:AddLabel("User: " .. localPlayer.DisplayName .. " (@" .. localPlayer.Name .. ")")
Information:AddLabel("User ID: " .. tostring(localPlayer.UserId))

do
	local v6 = tbl15.Home:AddRightGroupbox("Server Information")
	local v7 = v6:AddLabel("Server Time: Loading...")
	local v8 = v6:AddLabel("Players: 0/0")
	local v9 = v6:AddLabel("Ping: Calculating...")
	local v10 = v6:AddLabel("FPS: Calculating...")

	task.spawn(function()
		local Stats = game:GetService("Stats")
		local Players = game:GetService("Players")
		local n8 = 0
		local n9 = 0
		local n10 = 60

		local connection3 = game:GetService("RunService").Heartbeat:Connect(function()
			n9 += 1
			local now = os.clock()

			if now - n8 >= 1 then
				n10 = math.round(n9 / (now - n8))
				n9 = 0
				n8 = now
			end
		end)

		while task.wait(1) do
			if not tbl15.Home then
				if connection3 then
					connection3:Disconnect()
				end

				break
			else
				pcall(function()
					v7:SetText("Server Time: " .. os.date("%H:%M:%S"))
					local maxPlayers = Players.MaxPlayers
					v8:SetText("Players: " .. tostring(#Players:GetPlayers()) .. "/" .. tostring(maxPlayers))
					local v11 = math.round(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
					v9:SetText("Ping: " .. tostring(v11) .. " ms")
					v10:SetText("FPS: " .. tostring(n10))
				end)
			end
		end
	end)
end

local Links = tbl15.Home:AddLeftGroupbox("Links")

Links:AddButton({
	Text = "Official Page",
	Func = function()
		if setclipboard then
			setclipboard("https://dcus.pro")
			_NOTIFY("Official Page link copied to clipboard!", 3)
		else
			_NOTIFY("https://dcus.pro", 5)
		end
	end,
})

Links:AddButton({
	Text = "Shop Page",
	Func = function()
		if setclipboard then
			setclipboard("https://dcus.mysellauth.com")
			_NOTIFY("Shop Page link copied to clipboard!", 3)
		else
			_NOTIFY("https://dcus.mysellauth.com", 5)
		end
	end,
})

Links:AddButton({
	Text = "Discord Link",
	Func = function()
		if setclipboard then
			setclipboard("https://discord.gg/bUeHwyjdb7")
			_NOTIFY("Discord link copied to clipboard!", 3)
		else
			_NOTIFY("https://discord.gg/bUeHwyjdb7", 5)
		end
	end,
})

do
	local v6 = tbl15.Defense:AddRightGroupbox("R6 Limb Delete")
	local v7 = nil

	v6:AddDropdown("R6LimbSelect", {
		Text = "Select Limb",
		Values = { "Left Arm", "Right Arm", "Left Leg", "Right Leg" },
		Default = 1,
		Callback = function(arg)
			v7 = arg
		end,
	})

	v6:AddButton({
		Text = "Delete Selected Limb",
		Func = function()
			if not v7 then
				_NOTIFY("Select a limb first.", 3)
				return
			end
			local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
			local v8 = character:FindFirstChild(v7)
			local torso_ = character:FindFirstChild("Torso")
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			if not v8 or not torso_ or not humanoidRootPart then
				_NOTIFY("R6 character parts not found.", 3)
				return
			end
			local ragdollRemote2 = replicatedStorage:WaitForChild("CharacterEvents"):WaitForChild("RagdollRemote")
			local fallenPartsDestroyHeight = workspace_.FallenPartsDestroyHeight
			local cFrame = torso_.CFrame
			workspace_.FallenPartsDestroyHeight = -100

			pcall(function()
				ragdollRemote2:FireServer(humanoidRootPart, 2)
			end)

			task.wait(0.5)
			v8.CFrame = CFrame.new(0, -10000, 0)
			task.wait(0.3)
			torso_.CFrame = CFrame.new(0, -9970, 0)
			task.wait(0.5)
			torso_.CFrame = cFrame
			task.wait(0.5)
			workspace_.FallenPartsDestroyHeight = fallenPartsDestroyHeight
			_NOTIFY(v7 .. " deleted.", 3)
		end,
	})

	v6:AddButton({
		Text = "Break PCLD (Kick Byebye)",
		Func = function()
			task.spawn(function()
				local tbl16 = {}
				local humanoidRootPart = nil
				local connection3 = nil
				local flag2 = false
				local cframe = CFrame.new(-272.2197265625, -7.3504037857055664, 475.01089477539062)
				workspace.FallenPartsDestroyHeight = (0/0)

				breakPCLD = function()
					local character = localPlayer.Character
					if not character then
						return
					end
					humanoidRootPart = character:WaitForChild("HumanoidRootPart")

					for _, descendant in ipairs(character:GetDescendants()) do
						if descendant:IsA("Motor6D") then
							tbl16[descendant] = descendant.Part0
							descendant.Part0 = nil
						end
					end

					humanoidRootPart.CFrame = cframe

					connection3 = runService.RenderStepped:Connect(function()
						if humanoidRootPart and humanoidRootPart.Parent then
							humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
							humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
						end
					end)
				end

				restorePCLD = function()
					if connection3 then
						connection3:Disconnect()
						connection3 = nil
					end

					for k, v8 in pairs(tbl16) do
						if k and k.Parent then
							k.Part0 = v8
						end
					end

					tbl16 = {}
				end

				togglePCLD = function()
					flag2 = not flag2

					if flag2 then
						breakPCLD()
					else
						restorePCLD()
					end
				end

				togglePCLD()
				task.wait(0.12)
				togglePCLD()

				localPlayer.CharacterAdded:Once(function()
					task.wait(0.25)
					togglePCLD()
					task.wait(0.12)
					togglePCLD()
				end)

				_NOTIFY("Break PCLD: Done!", 3)
			end)
		end,
	})
end

do
	local textButton = Instance.new("TextButton")
	textButton.BackgroundTransparency = 1
	textButton.Text = ""
	textButton.Active = false
	textButton.Visible = false

	setupThrowButton = function()
		task.spawn(function()
			local playerGui2 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui", 5)
			playerGui2 = playerGui2 and playerGui2:WaitForChild("ContextActionGui", 5)
			playerGui2 = playerGui2 and playerGui2:WaitForChild("ContextButtonFrame", 5)
			if not playerGui2 then
				return
			end
			local connection3 = nil

			checkAndMove = function(arg)
				if arg:IsA("ImageLabel") and arg.Image == "rbxassetid://9603669631" then
					if arg.Parent and arg.Parent:IsA("GuiObject") then
						textButton.Parent = arg.Parent
						textButton.Position = UDim2.new(0, 0, 0, 0)
						textButton.Size = UDim2.new(1, 0, 1, 0)
						return true
					end
				end

				return false
			end

			for _, descendant in ipairs(playerGui2:GetDescendants()) do
				if checkAndMove(descendant) then
					return
				end
			end

			connection3 = playerGui2.DescendantAdded:Connect(function(descendant)
				if checkAndMove(descendant) then
					if connection3 then
						connection3:Disconnect()
					end
				end
			end)
		end)
	end

	setupThrowButton()

	textButton.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
			if textButton.Visible then
				_G.MobileSuperStrengthTriggered = true

				task.delay(0.5, function()
					_G.MobileSuperStrengthTriggered = false
				end)
			end
		end
	end)

	local v6 = tbl15.Grab:AddLeftGroupbox("Super Strength")

	v6:AddToggle("SuperStrengthGrab", {
		Text = "Super Strength",
		Default = false,
		Callback = function(superStrength)
			tbl2.SuperStrength = superStrength
			textButton.Visible = superStrength
		end,
	})

	v6:AddSlider("StrengthValue", {
		Text = "Strength",
		Default = 5000,
		Min = 10,
		Max = 10000,
		Rounding = 0,
		Callback = function(strength)
			tbl2.Strength = strength
		end,
	})
end

local v6 = tbl15.Grab:AddLeftGroupbox("Grab Mode")

for k in pairs(tbl5) do
	v6:AddToggle("Grab_" .. k, {
		Text = k,
		Default = false,
		Callback = function(arg)
			tbl5[k] = arg
		end,
	})
end

tbl15.Grab:AddLeftGroupbox("Free Gamepass"):AddToggle("FreeGamepassReach", {
	Text = "Further Reach",
	Default = false,
	Callback = function(arg)
		local fartherReach = game.Players.LocalPlayer:FindFirstChild("FartherReach")

		if arg then
			if not fartherReach then
				fartherReach = Instance.new("BoolValue")
				fartherReach.Name = "FartherReach"
				fartherReach.Parent = game.Players.LocalPlayer
			end

			fartherReach.Value = true
			local furtherReachBoughtNotifier = game.ReplicatedStorage.GamepassEvents:FindFirstChild("FurtherReachBoughtNotifier")

			if furtherReachBoughtNotifier then
				for _, v7 in ipairs(getconnections(furtherReachBoughtNotifier.OnClientEvent)) do
					pcall(v7.Function)
				end
			end
		elseif fartherReach then
			fartherReach:Destroy()
		end
	end,
})

local v7 = tbl15.Grab:AddRightGroupbox("Line Colors")

for i = 1, 6 do
	local v8 = i

	v7:AddLabel("Line Color " .. v8):AddColorPicker("LineColor" .. v8, {
		Text = "LineColor " .. v8,
		Default = tbl2["lineColor" .. v8],
		Callback = function(arg)
			tbl2["lineColor" .. v8] = arg
		end,
	})
end

v7:AddButton({
	Text = "Apply Line Color",
	Func = function()
		local tbl16 = {}

		for i = 1, 6 do
			table.insert(tbl16, ColorSequenceKeypoint.new((i - 1) / 5, tbl2["lineColor" .. i]))
		end

		pcall(function()
			game:GetService("ReplicatedStorage").DataEvents.UpdateLineColorsEvent:FireServer(ColorSequence.new(tbl16))
		end)
	end,
})

local v8 = tbl15.Grab:AddRightGroupbox("Line Extend")

v8:AddToggle("InfiniteLineExtend", {
	Text = "Infinity Extend Line",
	Default = false,
	Callback = function(furtherExtend)
		_G.FurtherExtend = furtherExtend
		toggleFurtherExtendButtonState(furtherExtend)
	end,
})

v8:AddSlider("ExtendSpeed", {
	Text = "Speed",
	Min = 3,
	Max = 25,
	Default = 3,
	Rounding = 0,
	Callback = function(increaseLineExtend)
		tbl2.IncreaseLineExtend = increaseLineExtend
	end,
})

v8:AddLabel("Mobile / Pc Supported")

do
	local n8 = 0
	local flag2 = false
	local flag3 = false
	local distance = 3
	local flag4 = false
	local v9 = nil
	local currentCamera = workspace.CurrentCamera
	local screenGui = Instance.new("ScreenGui")
	screenGui.ResetOnSpawn = false
	screenGui.Name = "FurtherExtendGUI"

	if userInputService.TouchEnabled then
		screenGui.Parent = localPlayer.PlayerGui
	end

	local imageButton = Instance.new("ImageButton")
	imageButton.Size = UDim2.new(0, 45, 0, 45)
	imageButton.Position = UDim2.new(1, -70, 1, -259)
	imageButton.Image = "rbxassetid://97166444"
	imageButton.BackgroundTransparency = 1
	imageButton.ImageTransparency = 1
	imageButton.Visible = false
	imageButton.ImageColor3 = Color3.fromRGB(142, 142, 142)
	imageButton.Parent = screenGui
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Size = UDim2.new(1, 0, 1, 0)
	imageLabel.Image = "rbxassetid://9603831913"
	imageLabel.BackgroundTransparency = 1
	imageLabel.Visible = false
	imageLabel.Parent = imageButton
	local imageButton2 = Instance.new("ImageButton")
	imageButton2.Size = UDim2.new(0, 45, 0, 45)
	imageButton2.Position = UDim2.new(1, -70, 1, -211)
	imageButton2.Image = "rbxassetid://97166444"
	imageButton2.BackgroundTransparency = 1
	imageButton2.ImageTransparency = 1
	imageButton2.Visible = false
	imageButton2.ImageColor3 = Color3.fromRGB(142, 142, 142)
	imageButton2.Parent = screenGui
	local imageLabel2 = Instance.new("ImageLabel")
	imageLabel2.Size = UDim2.new(1, 0, 1, 0)
	imageLabel2.Image = "rbxassetid://9603826756"
	imageLabel2.BackgroundTransparency = 1
	imageLabel2.Visible = false
	imageLabel2.Parent = imageButton2

	setupAutoPosition = function(arg, arg2)
		task.spawn(function()
			local playerGui2 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui", 5)
			playerGui2 = playerGui2 and playerGui2:WaitForChild("ContextActionGui", 5)
			playerGui2 = playerGui2 and playerGui2:WaitForChild("ContextButtonFrame", 5)
			if not playerGui2 then
				return
			end
			local connection3 = nil

			checkAndMove = function(arg3)
				if arg3:IsA("ImageLabel") and arg3.Image == arg2 then
					if arg3.Parent and arg3.Parent:IsA("GuiObject") then
						arg.Parent = arg3.Parent
						arg.Position = UDim2.new(0, 0, 0, 0)
						arg.Size = UDim2.new(1, 0, 1, 0)
						return true
					end
				end

				return false
			end

			for _, descendant in ipairs(playerGui2:GetDescendants()) do
				if checkAndMove(descendant) then
					return
				end
			end

			connection3 = playerGui2.DescendantAdded:Connect(function(descendant)
				if checkAndMove(descendant) then
					if connection3 then
						connection3:Disconnect()
					end
				end
			end)
		end)
	end

	setupAutoPosition(imageButton, "rbxassetid://9603831913")
	setupAutoPosition(imageButton2, "rbxassetid://9603826756")

	toggleFurtherExtendButtonState = function(arg)
		local furtherExtend = arg and _G.FurtherExtend
		imageButton.Visible = furtherExtend
		imageButton.Active = furtherExtend
		imageButton2.Visible = furtherExtend
		imageButton2.Active = furtherExtend
	end

	buttonClicked = function()
		if flag2 and flag2.distance and _G.FurtherExtend then
			flag2.distance = (flag2.distance or 0) + tbl2.IncreaseLineExtend

			if flag2.distance < distance then
				flag2.distance = distance
			end
		end
	end

	buttonClickedDE = function()
		if flag2 and flag2.distance and _G.FurtherExtend then
			flag2.distance = (flag2.distance or 0) - tbl2.IncreaseLineExtend

			if flag2.distance < distance then
				flag2.distance = distance
			end
		end
	end

	workspace.ChildAdded:Connect(function(child)
		if child.Name == "GrabParts" and child:IsA("Model") and _G.FurtherExtend then
			if userInputService.MouseEnabled then
				v9 = child

				pcall(function()
					v9:WaitForChild("GrabPart")
					v9:WaitForChild("DragPart")
					local bodyPosition = Instance.new("BodyPosition", v9.GrabPart)
					bodyPosition.MaxForce = Vector3.new(275000, 275000, 275000)
					bodyPosition.P = 20000
					bodyPosition.D = 950
					bodyPosition.Position = v9.GrabPart.WeldConstraint.Part1.Position
					n8 = (v9.GrabPart.Position - currentCamera.CFrame.Position).Magnitude
					v9.DragPart.AlignPosition.Enabled = false

					task.spawn(function()
						while v9.Parent do
							bodyPosition.Position = currentCamera.CFrame.Position + currentCamera.CFrame.LookVector * n8
							task.wait()
						end

						n8 = 0
						bodyPosition:Destroy()
					end)
				end)
			end

			toggleFurtherExtendButtonState(true)
		end
	end)

	workspace.ChildRemoved:Connect(function(child)
		if child.Name == "GrabParts" and child:IsA("Model") then
			toggleFurtherExtendButtonState(false)
		end
	end)

	userInputService.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseWheel and _G.FurtherExtend then
			if n8 < 11 then
				n8 = 11
			end

			if input.Position.Z <= 0 then
				if input.Position.Z < 0 then
					n8 -= tbl2.IncreaseLineExtend
				end
			else
				n8 += tbl2.IncreaseLineExtend
			end
		end
	end)

	continuousIncrease = function()
		while flag4 do
			buttonClicked()
			task.wait(0.1)
		end
	end

	continuousDecrease = function()
		while flag4 do
			buttonClickedDE()
			task.wait(0.1)
		end
	end

	imageButton.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and userInputService.TouchEnabled and input.UserInputType == Enum.UserInputType.Touch then
			flag4 = true
			task.spawn(continuousIncrease)
		end
	end)

	imageButton.InputEnded:Connect(function(input)
		if userInputService.TouchEnabled and input.UserInputType == Enum.UserInputType.Touch then
			flag4 = false
		end
	end)

	imageButton2.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and userInputService.TouchEnabled and input.UserInputType == Enum.UserInputType.Touch then
			flag4 = true
			task.spawn(continuousDecrease)
		end
	end)

	imageButton2.InputEnded:Connect(function(input)
		if userInputService.TouchEnabled and input.UserInputType == Enum.UserInputType.Touch then
			flag4 = false
		end
	end)

	reconnectSenv = function()
		local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
		character:WaitForChild("HumanoidRootPart")
		flag3 = character:WaitForChild("GrabbingScript", 5)

		if flag3 and getsenv then
			flag2 = getsenv(flag3)
		end
	end
end

localPlayer.CharacterAdded:Connect(reconnectSenv)
task.spawn(reconnectSenv)

do
	local tbl16 = {
		Lightning = "rbxassetid://446111271",
		Heartrate = "rbxassetid://5830549480",
		Chain = "rbxassetid://9632168658",
		Glitch = "rbxassetid://8089467613",
		Swirl = "rbxassetid://5638168605",
		Slend = "rbxassetid://5638169715",
		["Custom ID"] = "rbxassetid://0",
	}

	local tbl17 = {}

	for k in pairs(tbl16) do
		table.insert(tbl17, k)
	end

	table.sort(tbl17)
	local slend = tbl16.Slend
	local str2 = ""
	local flag2 = false

	local tbl18 = {
		TextureLength = 5,
		TextureSpeed = 6,
		Width0 = 0.375,
		Width1 = 0.375,
		CurveSize0 = 0,
		CurveSize1 = 0.8481442928314209,
		Segments = 50,
		LightEmission = 0,
		LightInfluence = 1,
		Transparency = 0,
		ZOffset = 0,
	}

	getBeam = function()
		local ok2, result2 = pcall(function()
			return workspace.GrabParts.BeamPart.GrabBeam
		end)

		return ok2 and result2 and result2 or nil
	end

	applyAll = function(arg)
		if not arg then
			return
		end

		pcall(function()
			if slend ~= "rbxassetid://0" then
				arg.Texture = slend
			end

			arg.TextureLength = tbl18.TextureLength
			arg.TextureSpeed = tbl18.TextureSpeed
			arg.Width0 = tbl18.Width0
			arg.Width1 = tbl18.Width1
			arg.CurveSize0 = tbl18.CurveSize0
			arg.CurveSize1 = tbl18.CurveSize1
			arg.Segments = tbl18.Segments
			arg.LightEmission = tbl18.LightEmission
			arg.LightInfluence = tbl18.LightInfluence
			arg.Transparency = NumberSequence.new(tbl18.Transparency)
			arg.ZOffset = tbl18.ZOffset
		end)
	end

	applyProp = function(arg, arg2)
		tbl18[arg] = arg2
		local v9 = getBeam()
		if not v9 then
			return
		end

		pcall(function()
			if arg == "Transparency" then
				v9.Transparency = NumberSequence.new(arg2)
			else
				v9[arg] = arg2
			end
		end)
	end

	local v9 = nil
	local connection3 = nil

	connectBeam = function(arg)
		if not arg then
			return
		end

		if connection3 then
			connection3:Disconnect()
		end

		connection3 = arg.AncestryChanged:Connect(function(child, parent)
			if not parent then
				v9 = nil
			end
		end)

		v9 = arg
		applyAll(arg)
	end

	startWatcher = function()
		local v10 = getBeam()

		if v10 then
			connectBeam(v10)
		end

		workspace.DescendantAdded:Connect(function(descendant)
			if descendant.Name == "GrabBeam" and flag2 then
				connectBeam(descendant)
			end
		end)
	end

	local v10 = tbl15.Grab:AddRightGroupbox("Trail Customizer")
	local tbl19 = {}

	v10:AddDropdown("TrailCategory", {
		Values = { "Texture", "Shape & Wave", "Optics" },
		Default = 1,
		Multi = false,
		Text = "Settings Category",
		Tooltip = "Select which settings to modify",
		Callback = function(arg)
			for k, v11 in pairs(tbl19) do
				local flag3 = k == arg

				for _, v12 in ipairs(v11) do
					if v12 and typeof(v12) == "table" and v12.SetVisible then
						v12:SetVisible(flag3)
					end
				end
			end
		end,
	})

	v10:AddDivider()

	local TexturePicker = v10:AddDropdown("TexturePicker", {
		Values = tbl17,
		Default = 1,
		Multi = false,
		Text = "Texture Select",
		Tooltip = "Select a texture for the trail",
		Callback = function(arg)
			if arg == "Custom ID" then
				local str3 = str2:gsub("rbxassetid://", "")
				slend = #str3 > 0 and "rbxassetid://" .. str3 or "rbxassetid://0"
			else
				slend = tbl16[arg] or "rbxassetid://0"
			end

			local v11 = getBeam() or v9

			if v11 and slend ~= "rbxassetid://0" then
				pcall(function()
					v11.Texture = slend
				end)
			end
		end,
	})

	local CustomIDInput = v10:AddInput("CustomIDInput", {
		Default = "",
		Numeric = false,
		Finished = false,
		Text = "Custom Texture ID",
		Tooltip = "rbxassetid://XXXXXXXXX (Effective when Custom ID is selected)",
		Placeholder = "rbxassetid://...",
		Callback = function(arg)
			str2 = arg
			slend = "rbxassetid://" .. arg:gsub("rbxassetid://", "")
			local v11 = getBeam() or v9

			if v11 and slend ~= "rbxassetid://0" then
				pcall(function()
					v11.Texture = slend
				end)
			end
		end,
	})

	local WatcherToggle = v10:AddToggle("WatcherToggle", {
		Text = "Auto Apply to New Trails",
		Default = false,
		Tooltip = "Automatically apply properties to newly created GrabBeams",
		Callback = function(arg)
			flag2 = arg
		end,
	})

	local v11 = v10:AddButton({
		Text = "Apply All Properties",
		Func = function()
			local v11 = getBeam() or v9

			if v11 then
				applyAll(v11)
				_NOTIFY("Applied all properties!", 3)
			else
				_NOTIFY("Trail not found", 3)
			end
		end,
	})

	local v12 = v10:AddButton({
		Text = "Reset Beam Properties",
		Func = function()
			tbl18 = {
				TextureLength = 5,
				TextureSpeed = 6,
				Width0 = 0.375,
				Width1 = 0.375,
				CurveSize0 = 0,
				CurveSize1 = 0.8481442928314209,
				Segments = 50,
				LightEmission = 0,
				LightInfluence = 1,
				Transparency = 0,
				ZOffset = 0,
			}

			applyAll(getBeam() or v9)
			_NOTIFY("Beam properties reset", 3)
		end,
	})

	local SliderTexLen = v10:AddSlider("SliderTexLen", {
		Text = "Texture Length",
		Default = tbl18.TextureLength,
		Min = 0.01,
		Max = 20,
		Rounding = 2,
		Callback = function(arg)
			applyProp("TextureLength", arg)
		end,
	})

	local SliderTexSpeed = v10:AddSlider("SliderTexSpeed", {
		Text = "Texture Speed",
		Default = tbl18.TextureSpeed,
		Min = -10,
		Max = 10,
		Rounding = 1,
		Callback = function(arg)
			applyProp("TextureSpeed", arg)
		end,
	})

	local SliderW0 = v10:AddSlider("SliderW0", {
		Text = "Start Width",
		Default = tbl18.Width0,
		Min = 0,
		Max = 10,
		Rounding = 2,
		Callback = function(arg)
			applyProp("Width0", arg)
		end,
	})

	local SliderW1 = v10:AddSlider("SliderW1", {
		Text = "End Width",
		Default = tbl18.Width1,
		Min = 0,
		Max = 10,
		Rounding = 2,
		Callback = function(arg)
			applyProp("Width1", arg)
		end,
	})

	local SliderCurve0 = v10:AddSlider("SliderCurve0", {
		Text = "Start Curve Size",
		Default = tbl18.CurveSize0,
		Min = -10,
		Max = 10,
		Rounding = 2,
		Callback = function(arg)
			applyProp("CurveSize0", arg)
		end,
	})

	local SliderCurve1 = v10:AddSlider("SliderCurve1", {
		Text = "End Curve Size",
		Default = tbl18.CurveSize1,
		Min = -10,
		Max = 10,
		Rounding = 2,
		Callback = function(arg)
			applyProp("CurveSize1", arg)
		end,
	})

	local SliderSegments = v10:AddSlider("SliderSegments", {
		Text = "Curve Segments",
		Default = tbl18.Segments,
		Min = 1,
		Max = 60,
		Rounding = 0,
		Callback = function(arg)
			applyProp("Segments", math.floor(arg))
		end,
	})

	local SliderEmission = v10:AddSlider("SliderEmission", {
		Text = "Light Emission",
		Default = tbl18.LightEmission,
		Min = 0,
		Max = 1,
		Rounding = 2,
		Callback = function(arg)
			applyProp("LightEmission", arg)
		end,
	})

	local SliderInfluence = v10:AddSlider("SliderInfluence", {
		Text = "Light Influence",
		Default = tbl18.LightInfluence,
		Min = 0,
		Max = 1,
		Rounding = 2,
		Callback = function(arg)
			applyProp("LightInfluence", arg)
		end,
	})

	local SliderTransparency = v10:AddSlider("SliderTransparency", {
		Text = "Transparency",
		Default = tbl18.Transparency,
		Min = 0,
		Max = 1,
		Rounding = 2,
		Callback = function(arg)
			applyProp("Transparency", arg)
		end,
	})

	local SliderZOffset = v10:AddSlider("SliderZOffset", {
		Text = "Z-Offset",
		Default = tbl18.ZOffset,
		Min = -10,
		Max = 10,
		Rounding = 1,
		Callback = function(arg)
			applyProp("ZOffset", arg)
		end,
	})

	tbl19.Texture = { TexturePicker, CustomIDInput, WatcherToggle, v11, v12 }
	tbl19["Shape & Wave"] = { SliderTexLen, SliderTexSpeed, SliderW0, SliderW1, SliderCurve0, SliderCurve1, SliderSegments }
	tbl19.Optics = { SliderEmission, SliderInfluence, SliderTransparency, SliderZOffset }

	for k, v13 in pairs(tbl19) do
		local flag3 = k == "Texture"

		for _, v14 in ipairs(v13) do
			if v14 and typeof(v14) == "table" and v14.SetVisible then
				v14:SetVisible(flag3)
			end
		end
	end
end

startWatcher()

do
	local v9 = tbl15.Aura:AddLeftGroupbox("Sex Aura")

	CheckPlayerAuras = function(arg)
		if arg == localPlayer then
			return false
		end

		if not arg.Character or not arg.Character:FindFirstChild("HumanoidRootPart") then
			return false
		end

		if not localPlayer.Character or not localPlayer.Character:FindFirstChild("HumanoidRootPart") then
			return false
		end

		if tbl2.AuraWhitelist and table.find(tbl2.AuraWhitelist, arg.Name) then
			return false
		end

		if tbl2.WhitelistFriends and localPlayer:IsFriendsWith(arg.UserId) then
			return false
		end

		if (arg.Character.HumanoidRootPart.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= (tbl2.AuraRadius or 20) then
			return true
		end
		return false
	end

	local v10 = tbl15.Aura:AddRightGroupbox("Grab Auras")

	v10:AddSlider("AuraRadius", {
		Text = "Aura Radius",
		Default = 20,
		Min = 5,
		Max = 100,
		Rounding = 0,
		Callback = function(auraRadius)
			tbl2.AuraRadius = auraRadius
		end,
	})

	v10:AddToggle("TelekinesisAura", {
		Text = "Telekinesis Aura",
		Default = false,
		Callback = function(telekinesisAura)
			tbl2.TelekinesisAura = telekinesisAura

			if telekinesisAura then
				task.spawn(function()
					while tbl2.TelekinesisAura do
						for _, player in pairs(players:GetPlayers()) do
							if CheckPlayerAuras(player) then
								pcall(function()
									player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 50, 0)
								end)
							end
						end

						task.wait(0.1)
					end
				end)
			end
		end,
	})

	v10:AddToggle("AnchorAura", {
		Text = "Anchor Aura",
		Default = false,
		Callback = function(anchorAura)
			tbl2.AnchorAura = anchorAura

			if anchorAura then
				task.spawn(function()
					while tbl2.AnchorAura do
						for _, player in pairs(players:GetPlayers()) do
							if CheckPlayerAuras(player) then
								pcall(function()
									for _, child in pairs(player.Character:GetChildren()) do
										if child:IsA("BasePart") then
											child.Anchored = true
										end
									end
								end)
							end
						end

						task.wait(0.1)
					end
				end)
			end
		end,
	})

	tbl2.FlingStrength = 400
	tbl2.FlingTargetType = "Players"

	v10:AddToggle("FlingAura", {
		Text = "Fling Aura",
		Default = false,
		Callback = function(flingAura)
			tbl2.FlingAura = flingAura

			if flingAura then
				task.spawn(function()
					while tbl2.FlingAura do
						local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart then
							if tbl2.FlingTargetType == "Players" or tbl2.FlingTargetType == "Players and Objects" then
								for _, player in pairs(players:GetPlayers()) do
									if CheckPlayerAuras(player) then
										local humanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")

										if humanoidRootPart2 and not humanoidRootPart2:FindFirstChild("FlingAuraVelocity") then
											pcall(function()
												local cframe = CFrame.lookAt(humanoidRootPart.Position, humanoidRootPart2.Position)
												local bodyVelocity = Instance.new("BodyVelocity")
												bodyVelocity.Name = "FlingAuraVelocity"
												bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
												bodyVelocity.Velocity = Vector3.new(cframe.LookVector.X, 0.5, cframe.LookVector.Z) * tbl2.FlingStrength
												bodyVelocity.Parent = humanoidRootPart2
												game:GetService("Debris"):AddItem(bodyVelocity, 0.5)
											end)
										end
									end
								end
							end

							if tbl2.FlingTargetType == "Objects" or tbl2.FlingTargetType == "Players and Objects" then
								local auraRadius = tbl2.AuraRadius or 20

								for _, descendant in pairs(workspace:GetDescendants()) do
									if descendant:IsA("BasePart") and not descendant.Anchored and not descendant:IsDescendantOf(localPlayer.Character) then
										if (descendant.Position - humanoidRootPart.Position).Magnitude <= auraRadius and not descendant:FindFirstChild("FlingAuraVelocity") then
											pcall(function()
												if game:GetService("ReplicatedStorage"):FindFirstChild("GrabEvents") and game:GetService("ReplicatedStorage").GrabEvents:FindFirstChild("SetNetworkOwner") then
													game:GetService("ReplicatedStorage").GrabEvents.SetNetworkOwner:FireServer(descendant, descendant.CFrame)
												end

												local cframe = CFrame.lookAt(humanoidRootPart.Position, descendant.Position)
												local bodyVelocity = Instance.new("BodyVelocity")
												bodyVelocity.Name = "FlingAuraVelocity"
												bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
												bodyVelocity.Velocity = Vector3.new(cframe.LookVector.X, 0.5, cframe.LookVector.Z) * tbl2.FlingStrength
												bodyVelocity.Parent = descendant
												game:GetService("Debris"):AddItem(bodyVelocity, 0.5)
											end)
										end
									end
								end
							end
						end

						task.wait(0.1)
					end
				end)
			end
		end,
	})

	v10:AddSlider("FlingStrength", {
		Text = "Fling Strength",
		Default = 400,
		Min = 400,
		Max = 10000,
		Rounding = 0,
		Callback = function(flingStrength)
			tbl2.FlingStrength = flingStrength
		end,
	})

	v10:AddDropdown("FlingTargetType", {
		Text = "Fling Target",
		Values = { "Players", "Objects", "Players and Objects" },
		Default = "Players",
		Callback = function(flingTargetType)
			tbl2.FlingTargetType = flingTargetType
		end,
	})

	local flag2 = false
	local str2 = "Y"
	local n8 = 0
	local n9 = 3
	local n10 = -0.5
	local n11 = 2
	local n12 = 1
	local flag3 = false
	local str3 = "HumanoidRootPart"
	local n13 = 20

	enableNoClip = function(arg)
		for _, descendant in pairs(arg:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.CanCollide = false
			end
		end
	end

	calculateThrustPosition = function(arg, arg2, arg3)
		return arg + arg2 * n9 + Vector3.new(0, n10, 0) + arg2 * math.sin(arg3 * n11) * n12
	end

	local thread = nil

	sexAuraLoop = function()
		local now = tick()

		while flag3 do
			pcall(function()
				local character = localPlayer.Character

				if character and character:FindFirstChild("HumanoidRootPart") then
					local humanoidRootPart = character.HumanoidRootPart
					local n14 = tick() - now
					local v11 = math.rad(n8)
					local cframe = CFrame.new()

					if str2 == "X" then
						cframe = CFrame.Angles(v11, 0, 0)
					elseif str2 == "Y" then
						cframe = CFrame.Angles(0, v11, 0)
					end

					local n15 = humanoidRootPart.CFrame * cframe

					for _, player in pairs(players:GetPlayers()) do
						local character2 = player ~= localPlayer and player.Character

						if character2 then
							character2 = not (flag2 and localPlayer:IsFriendsWith(player.UserId))
						end

						if character2 then
							local character3 = player.Character
							local v12 = character3:FindFirstChild(str3)
							local humanoid_ = character3:FindFirstChildOfClass("Humanoid")

							if v12 and v12:IsA("BasePart") then
								if (v12.Position - humanoidRootPart.Position).Magnitude <= n13 then
									enableNoClip(character3)
									local setNetworkOwner2 = replicatedStorage:WaitForChild("GrabEvents", 5):WaitForChild("SetNetworkOwner", 5)

									if setNetworkOwner2 then
										setNetworkOwner2:FireServer(v12, v12.CFrame)
									end

									if humanoid_ then
										humanoid_.PlatformStand = true
										humanoid_.Sit = false
									end

									local bodyPosition = v12:FindFirstChildOfClass("BodyPosition")
									local bodyGyro = v12:FindFirstChildOfClass("BodyGyro")
									local v13 = calculateThrustPosition(humanoidRootPart.Position, humanoidRootPart.CFrame.LookVector, n14)

									if not bodyPosition then
										local bodyPosition2 = Instance.new("BodyPosition")
										bodyPosition2.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
										bodyPosition2.P = 5000
										bodyPosition2.D = 100
										bodyPosition2.Position = v13
										bodyPosition2.Parent = v12
									else
										bodyPosition.Position = v13
									end

									local rotation = n15.Rotation
									local cFrame = CFrame.new(v12.Position) * rotation

									if not bodyGyro then
										local bodyGyro2 = Instance.new("BodyGyro")
										bodyGyro2.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
										bodyGyro2.P = 3000
										bodyGyro2.CFrame = cFrame
										bodyGyro2.Parent = v12
									else
										bodyGyro.CFrame = cFrame
									end
								end
							end
						end
					end
				end
			end)

			task.wait(0.05)
		end
	end

	v9:AddToggle("SexAuraToggle", {
		Text = "Sex Aura",
		Default = false,
		Callback = function(arg)
			flag3 = arg

			if arg then
				if thread then
					task.cancel(thread)
				end

				thread = task.spawn(sexAuraLoop)
			else
				if thread then
					task.cancel(thread)
					thread = nil
				end

				for _, player in pairs(players:GetPlayers()) do
					if player ~= localPlayer and player.Character then
						local v11 = player.Character:FindFirstChild(str3)

						if v11 then
							local bodyPosition = v11:FindFirstChildOfClass("BodyPosition")
							local bodyGyro = v11:FindFirstChildOfClass("BodyGyro")

							if bodyPosition then
								bodyPosition:Destroy()
							end

							if bodyGyro then
								bodyGyro:Destroy()
							end

							local humanoid_ = player.Character:FindFirstChildOfClass("Humanoid")

							if humanoid_ then
								humanoid_.PlatformStand = false
							end
						end
					end
				end
			end
		end,
	})

	v9:AddDropdown("SexAuraPart", {
		Text = "Select Target Part",
		Values = { "Head", "Torso", "HumanoidRootPart", "Left Foot", "Right Foot" },
		Default = 3,
		Callback = function(arg)
			if arg == "Torso" then
				str3 = "Torso"
			elseif arg == "Left Foot" then
				str3 = "LeftFoot"
			elseif arg == "Right Foot" then
				str3 = "RightFoot"
			else
				str3 = arg
			end
		end,
	})

	v9:AddDropdown("SexAuraAxis", {
		Text = "Select Rotation Axis",
		Values = { "X Axis (Tilt)", "Y Axis (Spin)" },
		Default = 2,
		Callback = function(arg)
			if arg == "X Axis (Tilt)" then
				str2 = "X"
			else
				str2 = "Y"
			end
		end,
	})

	v9:AddSlider("SexAuraAngle", {
		Text = "Rotation Angle",
		Min = -180,
		Max = 180,
		Default = 0,
		Rounding = 0,
		Callback = function(arg)
			n8 = arg
		end,
	})

	v9:AddSlider("SexAuraDist", {
		Text = "Distance from Player",
		Min = 1,
		Max = 10,
		Default = 3,
		Rounding = 1,
		Callback = function(arg)
			n9 = arg
		end,
	})

	v9:AddSlider("SexAuraHeight", {
		Text = "Height Offset",
		Min = -3,
		Max = 3,
		Default = -0.5,
		Rounding = 1,
		Callback = function(arg)
			n10 = arg
		end,
	})

	v9:AddSlider("SexAuraSpeed", {
		Text = "Thrust Speed",
		Min = 0.1,
		Max = 200,
		Default = 2,
		Rounding = 1,
		Callback = function(arg)
			n11 = arg
		end,
	})

	v9:AddSlider("SexAuraRadius", {
		Text = "Aura Radius",
		Min = 5,
		Max = 100,
		Default = 20,
		Rounding = 0,
		Callback = function(arg)
			n13 = arg
		end,
	})

	v9:AddToggle("SexAuraWhitelist", {
		Text = "Whitelist (Friends)",
		Default = false,
		Callback = function(arg)
			flag2 = arg
		end,
	})
end

do
	local Target = tbl15.Blobman:AddLeftGroupbox("Target")
	local v9 = tbl15.Blobman:AddRightGroupbox("Aura Mode")

	local BlobKickTargetDropdown = Target:AddDropdown("BlobKickTargetDropdown", {
		Text = "Select Target",
		Values = GetPlayerListDisplay(),
		Default = 1,
		Callback = function(arg)
			local v10 = ExtractUsername(arg)

			if v10 then
				tbl2.selectedTargetPlayer = v10
			end
		end,
	})

	setupAutoRefresh(BlobKickTargetDropdown)
	local flag2 = false

	Target:AddButton({
		Text = "Kick",
		Func = function()
			if flag2 then
				_NOTIFY("Already kicking...", 2)
				return
			end

			if not tbl2.selectedTargetPlayer then
				_NOTIFY("Please select a target first", 3)
				return
			end
			local v10 = players:FindFirstChild(tbl2.selectedTargetPlayer)
			if not v10 then
				_NOTIFY("Target not found", 3)
				return
			end
			flag2 = true

			task.spawn(function()
				pcall(function()
					local character = localPlayer.Character
					local humanoidRootPart = character and (character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso"))
					character = character and character:FindFirstChildOfClass("Humanoid")

					if not (humanoidRootPart and character) then
						_NOTIFY("Character not ready", 3)
						flag2 = false
						return
					end

					local v11 = workspace_:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
					local creatureBlobman = v11 and v11:FindFirstChild("CreatureBlobman")

					if not creatureBlobman then
						replicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer("CreatureBlobman", humanoidRootPart.CFrame * CFrame.new(0, 0, -5), Vector3.new(0, -15.716, 0))
						task.wait(0.05)
						creatureBlobman = v11 and v11:FindFirstChild("CreatureBlobman")
					end

					if not creatureBlobman then
						_NOTIFY("Failed to spawn Blobman", 3)
						flag2 = false
						return
					end

					local vehicleSeat = creatureBlobman:FindFirstChildOfClass("VehicleSeat")

					if vehicleSeat then
						vehicleSeat:Sit(character)
					end

					local n8 = tick() + 1

					while true do
						task.wait(0.05)
						if not (character.Sit or tick() > n8) then
							continue
						end
						break
					end

					if not character.Sit then
						_NOTIFY("Failed to sit on Blobman", 3)
						flag2 = false
						return
					end

					local character2 = v10.Character
					local humanoidRootPart2 = character2 and (character2:FindFirstChild("HumanoidRootPart") or character2:FindFirstChild("Torso"))

					if not humanoidRootPart2 then
						_NOTIFY("Target has no root part", 3)
						flag2 = false
						return
					end

					local setNetworkOwner2 = replicatedStorage.GrabEvents.SetNetworkOwner
					local destroyGrabLine = replicatedStorage.GrabEvents.DestroyGrabLine
					local creatureGrab = creatureBlobman.BlobmanSeatAndOwnerScript.CreatureGrab
					local leftDetector = creatureBlobman:FindFirstChild("LeftDetector")
					local leftWeld = leftDetector and leftDetector:FindFirstChild("LeftWeld")

					grabPart = function(arg)
						if leftDetector and leftWeld then
							creatureGrab:FireServer(leftDetector, arg, leftWeld)
						end
					end

					local cFrame = humanoidRootPart.CFrame
					humanoidRootPart.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, 3)
					task.wait(0.1)
					grabPart(humanoidRootPart)
					task.wait(0.12)

					for i = 1, 7 do
						setNetworkOwner2:FireServer(humanoidRootPart2, humanoidRootPart2.CFrame)
					end

					task.wait(0.02)
					humanoidRootPart2.CFrame = humanoidRootPart2.CFrame + Vector3.new(0, 10, 0)
					task.wait()
					humanoidRootPart2.CFrame = humanoidRootPart2.CFrame + Vector3.new(0, 18, 0)
					task.wait()
					humanoidRootPart2.CFrame = humanoidRootPart2.CFrame + Vector3.new(0, 8, 0)
					task.wait()
					humanoidRootPart2.CFrame = humanoidRootPart2.CFrame + Vector3.new(0, 5, 0)
					destroyGrabLine:FireServer(humanoidRootPart2)
					task.wait(0.03)
					grabPart(humanoidRootPart2)
					humanoidRootPart.CFrame = cFrame
					task.wait(0.1)

					if creatureBlobman and creatureBlobman.Parent then
						replicatedStorage.MenuToys.DestroyToy:FireServer(creatureBlobman)
					end

					_NOTIFY("Kick completed on " .. v10.Name, 3)
					flag2 = false
				end)

				if flag2 then
					flag2 = false
				end
			end)
		end,
	})

	v9:AddDropdown("AuraModeSelect", {
		Text = "Aura Mode",
		Values = { "Kill Aura", "Destroy Aura", "Speed/Jump Control", "TP Spam", "Kick Aura" },
		Default = 1,
		Callback = function(blobmanAuraMode)
			tbl2.blobmanAuraMode = blobmanAuraMode

			if tbl2.blobmanAuraEnabled then
				tbl2.blobmanAuraRunning = false
				task.wait(0.1)
				updateBlobmanAuraMode()
			end
		end,
	})

	v9:AddToggle("EnableAura", {
		Text = "Enable Aura",
		Default = false,
		Callback = function(blobmanAuraEnabled)
			tbl2.blobmanAuraEnabled = blobmanAuraEnabled
			updateBlobmanAuraMode()
		end,
	})

	v9:AddSlider("TargetWalkSpeed", {
		Text = "Target WalkSpeed",
		Default = 16,
		Min = 0,
		Max = 500,
		Rounding = 0,
		Callback = function(targetWalkSpeed)
			tbl2.targetWalkSpeed = targetWalkSpeed
		end,
	})

	v9:AddSlider("TargetJumpPower", {
		Text = "Target JumpPower",
		Default = 50,
		Min = 0,
		Max = 500,
		Rounding = 0,
		Callback = function(targetJumpPower)
			tbl2.targetJumpPower = targetJumpPower
		end,
	})

	v9:AddToggle("KickAuraFriendWhitelist", {
		Text = "Kick Aura: Friend Whitelist",
		Default = false,
		Callback = function(kickAuraFriendWhitelist)
			tbl2.kickAuraFriendWhitelist = kickAuraFriendWhitelist
		end,
	})

	v9:AddDropdown("AllModeSelect", {
		Text = "All Mode",
		Values = { "All Kill", "All Destroy", "All Speed/Jump", "All TP Spam" },
		Default = 1,
		Callback = function(blobmanAllMode)
			tbl2.blobmanAllMode = blobmanAllMode

			if tbl2.blobmanAllEnabled then
				tbl2.blobmanAllRunning = false
				task.wait(0.1)
				updateBlobmanAllMode()
			end
		end,
	})

	v9:AddToggle("EnableAll", {
		Text = "Enable All",
		Default = false,
		Callback = function(blobmanAllEnabled)
			tbl2.blobmanAllEnabled = blobmanAllEnabled
			updateBlobmanAllMode()
		end,
	})

	v9:AddToggle("SkyTP", {
		Text = "Auto TP to Sky (15s)",
		Default = false,
		Callback = function(skyTpEnabled)
			tbl2.skyTpEnabled = skyTpEnabled
		end,
	})

	Target:AddToggle("LoopKickBlobman", {
		Text = "Loop Kick",
		Default = false,
		Callback = function(loopKickBlobman)
			tbl2.LoopKickBlobman = loopKickBlobman

			if loopKickBlobman then
				task.spawn(function()
					while tbl2.LoopKickBlobman do
						if not isKicking and tbl2.selectedTargetPlayer then
							local v10 = players:FindFirstChild(tbl2.selectedTargetPlayer)

							if v10 and v10.Character and v10.Character:FindFirstChild("HumanoidRootPart") then
								isKicking = true

								pcall(function()
									local character = localPlayer.Character
									local humanoidRootPart = character and (character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso"))
									character = character and character:FindFirstChildOfClass("Humanoid")
									if not (humanoidRootPart and character) then
										isKicking = false
										return
									end
									local v11 = workspace_:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
									local creatureBlobman = v11 and v11:FindFirstChild("CreatureBlobman")

									if not creatureBlobman then
										replicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer("CreatureBlobman", humanoidRootPart.CFrame * CFrame.new(0, 0, -5), Vector3.new(0, -15.716, 0))
										task.wait(0.1)
										creatureBlobman = v11 and v11:FindFirstChild("CreatureBlobman")
									end

									if not creatureBlobman then
										isKicking = false
										return
									end
									local vehicleSeat = creatureBlobman:FindFirstChildOfClass("VehicleSeat")

									if vehicleSeat then
										vehicleSeat:Sit(character)
									end

									local n8 = tick() + 1

									while true do
										task.wait(0.05)
										if not (character.Sit or tick() > n8) then
											continue
										end
										break
									end

									if not character.Sit then
										isKicking = false
										return
									end
									local character2 = v10.Character

									if character2 then
										character2 = character2:FindFirstChild("HumanoidRootPart") or character2:FindFirstChild("Torso")
									end

									if not character2 then
										isKicking = false
										return
									end
									local creatureGrab = creatureBlobman.BlobmanSeatAndOwnerScript.CreatureGrab
									local leftDetector = creatureBlobman:FindFirstChild("LeftDetector")
									local leftWeld = leftDetector and leftDetector:FindFirstChild("LeftWeld")

									if leftDetector and leftWeld then
										creatureGrab:FireServer(leftDetector, character2, leftWeld)
									end

									task.wait(0.2)
									local creatureRelease = creatureBlobman.BlobmanSeatAndOwnerScript.CreatureRelease
									local creatureDrop = creatureBlobman.BlobmanSeatAndOwnerScript.CreatureDrop

									if leftWeld then
										creatureRelease:FireServer(leftWeld, character2)
										creatureDrop:FireServer(leftWeld, character2)
									end
								end)

								task.wait(0.5)
								isKicking = false
							end
						end

						task.wait(0.1)
					end
				end)
			end
		end,
	})
end

local v9 = tbl15.Blobman:AddLeftGroupbox("Perm Owner")

v9:AddButton({
	Text = "Perm Owner All",
	Func = function()
		task.spawn(function()
			clearPermOwnerList()
			local v10
			v10, v10 = getCharInfo()
			if not v10 then
				return
			end
			local v11 = spawnBlobmanIfNeeded()
			if not v11 then
				_NOTIFY("Blobman spawn failed", 3)
				return
			end
			sitOnBlobman(v11)
			local blobmanSeatAndOwnerScript = v11:FindFirstChild("BlobmanSeatAndOwnerScript")
			local leftDetector = v11:FindFirstChild("LeftDetector")
			local leftWeld = leftDetector and leftDetector:FindFirstChild("LeftWeld")
			local creatureGrab = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
			local creatureRelease = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
			local creatureDrop = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
			local tbl16 = {}

			for _, player in ipairs(players:GetPlayers()) do
				if player ~= localPlayer then
					table.insert(tbl16, player)
				end
			end

			if #tbl16 == 0 then
				_NOTIFY("No target players", 3)
				return
			end
			_NOTIFY(#tbl16 .. " targets starting...", 3)

			for _, v12 in ipairs(tbl16) do
				local character = v12.Character

				if character and character:FindFirstChild("HumanoidRootPart") then
					local connection3 = runService.RenderStepped:Connect(function()
						pcall(function()
							local v13, v14 = getCharInfo()
							local character2 = v12.Character
							character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

							if v14 and character2 then
								v14.CFrame = character2.CFrame * CFrame.new(0, 0, -3)
							end
						end)
					end)

					task.wait(0.3)
					connection3:Disconnect()

					pcall(function()
						local character2 = v12.Character
						local humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
						character2 = character2 and character2:FindFirstChildOfClass("Humanoid")

						if blobmanSeatAndOwnerScript and leftDetector and leftWeld and creatureGrab and creatureRelease and creatureDrop and humanoidRootPart and character2 then
							creatureGrab:FireServer(leftDetector, humanoidRootPart, leftWeld)
							creatureRelease:FireServer(leftWeld, humanoidRootPart)
							creatureDrop:FireServer(leftWeld, humanoidRootPart)
						end
					end)

					addToPermOwnerList(v12)
				end
			end

			_NOTIFY("Done! Auto-removed on reset", 4)
		end)
	end,
})

v9:AddButton({
	Text = "Quick Kill All",
	Func = function()
		task.spawn(function()
			local n8 = 0

			for k in pairs(_G.permOwnerList) do
				if k and k.Parent then
					local character = k.Character
					local humanoid_ = character and character:FindFirstChildOfClass("Humanoid")

					if humanoid_ and humanoid_.Health > 0 then
						pcall(function()
							humanoid_.Health = 0
						end)

						n8 += 1
					end
				end
			end

			_NOTIFY(n8 > 0 and n8 .. " players HP set to 0" or "No targets", 3)
		end)
	end,
})

v9:AddButton({
	Text = "Bring All",
	Func = function()
		task.spawn(function()
			local v10, v11 = getCharInfo()
			if not v11 then
				return
			end
			local n8 = 0

			for k in pairs(_G.permOwnerList) do
				if k and k.Parent then
					local character = k.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart then
						pcall(function()
							humanoidRootPart.CFrame = v11.CFrame * CFrame.new(0, 0, -(3 + n8 * 2))
						end)

						n8 += 1
					end
				end
			end

			_NOTIFY(n8 .. " players moved in front", 3)
		end)
	end,
})

v9:AddButton({
	Text = "Heaven All",
	Func = function()
		task.spawn(function()
			local n8 = 0

			for k in pairs(_G.permOwnerList) do
				if k and k.Parent then
					local character = k.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart then
						pcall(function()
							humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, 1, humanoidRootPart.Position.Z)
						end)

						n8 += 1
					end
				end
			end

			_NOTIFY(n8 .. " players sent to the sky", 3)
		end)
	end,
})

local v10 = tbl15.Blobman:AddRightGroupbox("Toy Mod / Orbit")

v10:AddToggle("OrbitAll", {
	Text = "Orbit All (Clockwise)",
	Default = false,
	Callback = function(enabled)
		tbl7.enabled = enabled

		if enabled then
			if tbl7.connection then
				pcall(function()
					tbl7.connection:Disconnect()
				end)

				tbl7.connection = nil
			end

			tbl7.angle = 0

			tbl7.connection = runService.RenderStepped:Connect(function(deltaTime)
				if not tbl7.enabled then
					return
				end
				tbl7.angle = tbl7.angle - tbl7.speed * deltaTime
				local v11
				v11, v11 = getCharInfo()
				if not v11 then
					return
				end
				local position = v11.Position
				local tbl16 = {}

				for k in pairs(_G.permOwnerList) do
					if k and k.Parent then
						local character = k.Character
						character = character and character:FindFirstChild("HumanoidRootPart")

						if character then
							table.insert(tbl16, character)
						end
					end
				end

				local n8 = #tbl16
				if n8 == 0 then
					return
				end
				local n9 = 6.2831853071795862 / n8

				for i, v12 in ipairs(tbl16) do
					local n10 = tbl7.angle + n9 * (i - 1)

					pcall(function()
						local radius = tbl7.radius
						local radius2 = tbl7.radius
						v12.CFrame = CFrame.new(position.X + math.cos(n10) * radius, position.Y + tbl7.height, position.Z + math.sin(n10) * radius2)
					end)
				end
			end)

			_NOTIFY("Orbit All: Started!", 2)
		else
			if tbl7.connection then
				pcall(function()
					tbl7.connection:Disconnect()
				end)

				tbl7.connection = nil
			end

			_NOTIFY("Orbit All: Stopped", 2)
		end
	end,
})

v10:AddSlider("OrbitSpeed", {
	Text = "Orbit Speed",
	Default = 1,
	Min = 1,
	Max = 20,
	Rounding = 0,
	Callback = function(speed_)
		tbl7.speed = speed_
	end,
})

v10:AddSlider("OrbitHeight", {
	Text = "Orbit Height",
	Default = 5,
	Min = 0,
	Max = 50,
	Rounding = 0,
	Callback = function(height)
		tbl7.height = height
	end,
})

v10:AddSlider("OrbitRadius", {
	Text = "Orbit Radius",
	Default = 8,
	Min = 2,
	Max = 60,
	Rounding = 0,
	Callback = function(radius)
		tbl7.radius = radius
	end,
})

do
	local v11 = tbl15.Kick:AddLeftGroupbox("Kick Configuration")
	local v12 = tbl15.Kick:AddRightGroupbox("Execute Kick")

	local kickTargetPlayerDisplay = v11:AddDropdown("kickTargetPlayerDisplay", {
		Text = "Target Player",
		Values = { "All Players" },
		Default = 1,
		Callback = function(kickTargetPlayerDisplay)
			tbl2.kickTargetPlayerDisplay = kickTargetPlayerDisplay
		end,
	})

	_G.kt_setupDropdown(kickTargetPlayerDisplay)

	v11:AddToggle("kickExcludeFriends", {
		Text = "Exclude Friends",
		Default = true,
		Callback = function(kickExcludeFriends)
			tbl2.kickExcludeFriends = kickExcludeFriends
		end,
	})

	v11:AddToggle("kickUseWhitelist", {
		Text = "Exclude Whitelisted Players",
		Default = true,
		Callback = function(kickUseWhitelist)
			tbl2.kickUseWhitelist = kickUseWhitelist
		end,
	})

	v12:AddDropdown("kickTargetHeightMode", {
		Text = "NoBlob Kick Height Mode",
		Values = { "Spawn", "Water" },
		Default = 1,
		Callback = function(kickTargetHeightMode)
			tbl2.kickTargetHeightMode = kickTargetHeightMode
		end,
	})

	v12:AddButton({
		Text = "Execute NoBlob Kick",
		Func = function()
			_G.kt_executeNoBlobKick()
		end,
	})

	v12:AddButton({
		Text = "Execute Blobman Kick V2",
		Func = function()
			_G.kt_executeBlobmanKick()
		end,
	})

	v12:AddDivider()

	v12:AddButton({
		Text = "Gather + Blobman Orbit Kick (All)",
		Func = function()
			_G.gka_execute()
		end,
	})

	v12:AddButton({
		Text = "Stop Gather Kick All",
		Func = function()
			_G.gka_stop()
		end,
	})
end

local v11 = tbl15.Kick:AddLeftGroupbox("Gather Kick Settings")

v11:AddSlider("gkaCircleRadius", {
	Text = "Circle Radius",
	Default = 6,
	Min = 2,
	Max = 25,
	Rounding = 1,
	Callback = function(gkaCircleRadius)
		tbl2.gkaCircleRadius = gkaCircleRadius
	end,
})

v11:AddSlider("gkaCenterY", {
	Text = "Center Height Y",
	Default = 50,
	Min = 10,
	Max = 300,
	Rounding = 0,
	Callback = function(gkaCenterY)
		tbl2.gkaCenterY = gkaCenterY
	end,
})

v11:AddSlider("gkaBlobRotateRadius", {
	Text = "Blob Orbit Radius",
	Default = 18,
	Min = 5,
	Max = 60,
	Rounding = 1,
	Callback = function(gkaBlobRotateRadius)
		tbl2.gkaBlobRotateRadius = gkaBlobRotateRadius
	end,
})

v11:AddSlider("gkaBlobRotateSpeed", {
	Text = "Blob Orbit Speed x0.1",
	Default = 40,
	Min = 5,
	Max = 200,
	Rounding = 0,
	Callback = function(arg)
		tbl2.gkaBlobRotateSpeed = arg * 0.1
	end,
})

local v12 = tbl15.World:AddLeftGroupbox("Lag Server")

v12:AddToggle("LagServerToggle", {
	Text = "Lag Server",
	Default = false,
	Callback = function(arg)
		if arg then
			if _G.kt_startLineLag then
				_G.kt_startLineLag()
			end

			_NOTIFY("Lag Server: Started", 3)
		else
			if _G.kt_stopLineLag then
				_G.kt_stopLineLag()
			end

			_NOTIFY("Lag Server: Stopped", 3)
		end
	end,
})

v12:AddSlider("LagIntensity", {
	Text = "Lag Intensity",
	Default = 520,
	Min = 1,
	Max = 2000,
	Rounding = 0,
	Callback = function(lineLagIntensity)
		tbl2.lineLagIntensity = lineLagIntensity
	end,
})

v12:AddSlider("LagDelay", {
	Text = "Lag Delay",
	Default = 1,
	Min = 0.1,
	Max = 5,
	Rounding = 1,
	Callback = function(lineLagDelay)
		tbl2.lineLagDelay = lineLagDelay
	end,
})

local v13 = tbl15.World:AddLeftGroupbox("Blackhole Customizer")

v13:AddToggle("CustomBlackholeToggle", {
	Text = "Enable Custom Image",
	Default = false,
	Callback = function(customBlackholeEnabled)
		tbl2.customBlackholeEnabled = customBlackholeEnabled

		if _G.updateAllBlackholes then
			_G.updateAllBlackholes()
		end
	end,
})

v13:AddInput("CustomBlackholeImageInput", {
	Default = "https://raw.githubusercontent.com/dcus-official/PoopHub.Free/refs/heads/main/Assets/Logo/Ultimate%20Rainbow%20Poop.png",
	Numeric = false,
	Finished = false,
	Text = "Custom Image URL/ID",
	Tooltip = "rbxassetid://... or https://...",
	Placeholder = "Enter image asset ID or URL",
	Callback = function(customBlackholeImage)
		tbl2.customBlackholeImage = customBlackholeImage

		if _G.updateBlackholeImage then
			_G.updateBlackholeImage(customBlackholeImage)
		end
	end,
})

do
	local v14 = tbl15.Kick:AddLeftGroupbox("Loop Kick Blob")
	local v15 = tbl15.Kick:AddRightGroupbox("Loop Kick Settings")

	local LoopKickBlobTargetDropdown = v14:AddDropdown("LoopKickBlobTargetDropdown", {
		Text = "Loop Kick Target",
		Values = GetPlayerListDisplay(),
		Default = 1,
		Callback = function(arg)
			local v16 = ExtractUsername(arg)

			if v16 then
				tbl2.loopKickBlobTarget = v16
			end
		end,
	})

	setupAutoRefresh(LoopKickBlobTargetDropdown)

	v14:AddToggle("LoopKickBlobToggle", {
		Text = "Loop Kick Blob (Single Target)",
		Default = false,
		Callback = function(loopKickBlobActive)
			tbl2.loopKickBlobActive = loopKickBlobActive

			if loopKickBlobActive then
				if not tbl2.loopKickBlobTarget then
					_NOTIFY("Loop Kick: Please select a target first", 3)
					tbl2.loopKickBlobActive = false

					if toggles.LoopKickBlobToggle then
						toggles.LoopKickBlobToggle:SetValue(false)
					end

					return
				end

				_G.loopKickBlobTask = task.spawn(function()
					LoopKickBlobFunction(tbl2.loopKickBlobTarget)
				end)

				_NOTIFY("Loop Kick Blob: Started on " .. tbl2.loopKickBlobTarget, 3)
			else
				tbl2.loopKickBlobActive = false
				_NOTIFY("Loop Kick Blob: Stopped", 2)
			end
		end,
	})

	v15:AddDropdown("LoopKickBlobModeDropdown", {
		Text = "Loop Kick Mode",
		Values = { "Default", "TP to Sky" },
		Default = 1,
		Callback = function(loopKickBlobMode)
			tbl2.loopKickBlobMode = loopKickBlobMode
		end,
	})

	local flag2 = false
	local v16 = nil
	local n8 = 10
	local flag3 = true
	local tbl16 = {}
	local flag4 = false
	local flag5 = false
	local thread = nil

	local tbl17 = {
		Players = game:GetService("Players"),
		ReplicatedStorage = game:GetService("ReplicatedStorage"),
		RunService = game:GetService("RunService"),
	}

	local localPlayer2 = tbl17.Players.LocalPlayer

	local function fn_()
		return localPlayer2.Character
	end

	local function fn_2()
		local v17 = fn_()
		return v17 and v17:FindFirstChildOfClass("Humanoid")
	end

	local function fn_3()
		local v17 = fn_()
		if not v17 then
			return nil
		end
		return v17:FindFirstChild("HumanoidRootPart") or v17:FindFirstChild("Torso")
	end

	local function fn_4()
		return workspace:FindFirstChild(localPlayer2.Name .. "SpawnedInToys")
	end

	local function fn_5(arg)
		if not arg then
			return nil
		end
		local model = arg:FindFirstAncestorOfClass("Model")
		if model and model.Name == "CreatureBlobman" then
			return model
		end
		return nil
	end

	local function fn_6()
		if v16 and v16.Parent then
			local menuToys = tbl17.ReplicatedStorage:FindFirstChild("MenuToys")
			local destroyToy = menuToys and menuToys:FindFirstChild("DestroyToy")

			if destroyToy then
				destroyToy:FireServer(v16)
			else
				v16:Destroy()
			end
		end

		v16 = nil
	end

	local function fn_7(arg)
		local v17 = fn_3()
		if not (arg and v17) then
			return
		end
		tbl17.ReplicatedStorage.GrabEvents.SetNetworkOwner:FireServer(arg, v17.CFrame)
	end

	local function fn_8(arg, arg2)
		local n9 = os.clock() + (arg2 or 3)
		task.wait()

		while os.clock() < n9 do
			if not (arg and arg.Parent) then
				return false
			end
			fn_7(arg)
			task.wait()
			if not (arg and arg.Parent) then
				return false
			end
			local n10 = arg.Position.Y + 0.1
			arg.CFrame = arg.CFrame + Vector3.new(0, 0.1, 0)
			task.wait()
			if not (arg and arg.Parent) then
				return false
			end

			if not (n10 - 0.05 <= arg.Position.Y) then
				continue
			end
			return true
		end

		return false
	end

	local function fn_9(arg, arg2, arg3)
		local v17 = arg and arg:FindFirstChild(arg3 .. "Detector")
		local v18 = v17 and v17:FindFirstChild(arg3 .. "Weld")
		local blobmanSeatAndOwnerScript = arg and arg:FindFirstChild("BlobmanSeatAndOwnerScript")
		blobmanSeatAndOwnerScript = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")

		if v17 and v18 and blobmanSeatAndOwnerScript and arg2 then
			blobmanSeatAndOwnerScript:FireServer(v17, arg2, v18)
		end
	end

	local function fn_10(arg)
		if arg then
			tbl17.ReplicatedStorage.GrabEvents.DestroyGrabLine:FireServer(arg)
		end
	end

	local function fn_11(arg, arg2, arg3)
		local v17 = fn_2()
		if not (v17 and v17.Sit and v16 and v16.Parent and arg2) then
			return
		end

		for i = 1, 3 do
			fn_9(arg, fn_3(), arg3)
		end

		task.wait(0.12)
		fn_8(arg2, 2)

		if arg2 and arg2.Parent then
			for i = 1, 2 do
				arg2.CFrame = arg2.CFrame + Vector3.new(0, 20, 0)
			end
		end

		fn_10(arg2)
		task.wait(0.02)
		fn_9(arg, arg2, arg3)
	end

	local function fn_12(arg)
		return arg and arg.UserId and localPlayer2:IsFriendsWith(arg.UserId)
	end

	local function fn_13(arg)
		return arg.InPlot and arg.InPlot.Value
	end

	local function fn_14(arg)
		local character = arg.Character
		if not character then
			return false
		end
		local humanoid_ = character:FindFirstChildOfClass("Humanoid")
		return humanoid_ and humanoid_.Health > 0
	end

	local function fn_15(arg)
		for _, descendant in ipairs(arg:GetDescendants()) do
			if descendant:IsA("BodyForce") or descendant:IsA("BodyVelocity") or descendant:IsA("BodyAngularVelocity") or descendant:IsA("BodyGyro") or descendant:IsA("VectorForce") or descendant:IsA("LinearVelocity") or descendant:IsA("AngularVelocity") or descendant:IsA("AlignPosition") or descendant:IsA("AlignOrientation") then
				descendant:Destroy()
			end
		end
	end

	local function fn_16(arg)
		local v17 = fn_()
		if not v17 then
			return
		end

		for _, descendant in ipairs(v17:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.CanCollide = not arg
			end
		end
	end

	local function fn_17()
		if not v16 then
			return
		end
		local leftDetector = v16:FindFirstChild("LeftDetector", true)
		if not leftDetector then
			return
		end
		local attachPlayer = leftDetector:FindFirstChild("AttachPlayer")

		if attachPlayer then
			attachPlayer:Destroy()
		end
	end

	local function fn_18()
		if not flag5 then
			return
		end
		local v17 = fn_2()
		local v18 = fn_3()
		if not (v17 and v18) then
			return
		end

		if v17.SeatPart then
			local v19 = fn_5(v17.SeatPart)
			if v19 then
				v16 = v19
				return
			end
		end

		if not (v16 and v16.Parent) then
			local menuToys = tbl17.ReplicatedStorage:FindFirstChild("MenuToys")
			menuToys = menuToys and menuToys:FindFirstChild("SpawnToyRemoteFunction")
			if not menuToys then
				return
			end
			menuToys:InvokeServer("CreatureBlobman", v18.CFrame * CFrame.new(0, 0, -5), Vector3.new(0, -15.716, 0))
			local v19 = fn_4()

			if v19 then
				for _, child in ipairs(v19:GetChildren()) do
					if child.Name == "CreatureBlobman" and child:FindFirstChildOfClass("VehicleSeat") then
						v16 = child
						break
					end
				end
			end
		end

		local vehicleSeat = v16 and v16:FindFirstChildOfClass("VehicleSeat")

		if vehicleSeat and not v17.Sit then
			vehicleSeat:Sit(v17)
		end
	end

	local function fn_19(arg)
		arg = arg and arg.Character
		if not arg then
			return nil
		end
		return arg:FindFirstChild("HumanoidRootPart") or arg:FindFirstChild("Torso")
	end

	local function fn_20(arg)
		if arg == localPlayer2 then
			return false
		end

		if not fn_14(arg) then
			return false
		end
		local flag6 = true

		if flag3 then
			flag6 = fn_12(arg)
		end

		if flag6 then
			return false
		end

		if fn_13(arg) then
			return false
		end
		local character = arg.Character
		local v17 = tbl16[arg.UserId]
		local flag7

		if v17 then
			local time = v17.time
			flag7 = os.clock() - time < n8
		else
			flag7 = v17
		end

		if flag7 and v17.char == character then
			return false
		end
		local v18 = fn_19(arg)
		if not v18 then
			return false
		end
		return true, v18, character
	end

	local function fn_21()
		local v17 = fn_3()
		if not v17 then
			return {}
		end
		local tbl18 = {}

		for _, player in ipairs(tbl17.Players:GetPlayers()) do
			local v18, v19, v20 = fn_20(player)

			if v18 then
				tbl18[#tbl18 + 1] = { player = player, root = v19, char = v20, distance = (v19.Position - v17.Position).Magnitude }
			end
		end

		table.sort(tbl18, function(arg, arg2)
			return arg.distance < arg2.distance
		end)

		return tbl18
	end

	tbl17.RunService.Heartbeat:Connect(function()
		if not flag2 or not flag5 then
			return
		end
		fn_18()
		local v17 = fn_2()
		local sit = v17 and v17.Sit or false

		if sit and not flag4 then
			flag5 = false
		end

		flag4 = sit
	end)

	local function fn_22()
		if thread then
			thread = nil
		end

		flag5 = true
		flag4 = false

		thread = task.spawn(function()
			while flag2 do
				local v17 = fn_2()

				if v17 and v17.Sit and v16 and v16.Parent then
					local v18 = fn_3()

					if v18 then
						fn_17()
						local v19 = fn_21()

						if #v19 == 0 then
							task.wait()
						else
							for _, v20 in ipairs(v19) do
								if flag2 then
									local player = v20.player
									local root = v20.root
									local char = v20.char

									if player and root and char and char.Parent then
										local position = root.Position
										local n9 = position.Y - 7
										local cFrame = v18.CFrame
										fn_16(true)
										v18.CFrame = CFrame.new(position.X, n9, position.Z)
										local flag6 = true

										local thread2 = task.spawn(function()
											local v21 = math.atan2(v18.Position.Z - position.Z, v18.Position.X - position.X)

											while flag6 and flag2 and root.Parent and char.Parent do
												v21 += 50 * task.wait()
												local z = position.Z
												v18.CFrame = CFrame.new(Vector3.new(position.X + math.cos(v21) * 20, n9, z + math.sin(v21) * 20), Vector3.new(position.X, n9, position.Z))
											end
										end)

										fn_11(v16, root, "Left")
										flag6 = false
										task.cancel(thread2)
										v18.CFrame = cFrame
										fn_16(false)
										fn_15(char)
										tbl16[player.UserId] = { time = os.clock(), char = char }
										task.wait(0.02)
									end

									continue
								end

								break
							end

							task.wait(0)
						end
					else
						task.wait()
					end
				else
					flag5 = true
					task.wait()
				end
			end
		end)
	end

	local function fn_23()
		flag2 = false

		if thread then
			thread = nil
		end

		flag5 = false
		flag4 = false
		tbl16 = {}
		fn_6()
	end

	v15:AddToggle("LoopKickAllBeta", {
		Text = "Loop Kick All (Beta)",
		Default = false,
		Callback = function(arg)
			flag2 = arg

			if arg then
				fn_22()
			else
				fn_23()
			end
		end,
	})
end

local Wings = tbl15.Wing:AddLeftGroupbox("Wings")

Wings:AddDropdown("WingItem", {
	Text = "1. Select Item",
	Values = { "TetracubeI", "FireworkSparkler", "PoopPile" },
	Default = 1,
	Callback = function(selectedItem)
		tbl2.SelectedItem = selectedItem

		if tbl2.WingsActive then
			BuildWings()
		end
	end,
})

Wings:AddDropdown("WingSearch", {
	Text = "2. Search Range",
	Values = { "My Toys", "Plot Toys", "All Toys" },
	Default = 1,
	Callback = function(searchMode)
		tbl2.SearchMode = searchMode

		if tbl2.WingsActive then
			BuildWings()
		end
	end,
})

Wings:AddToggle("EnableWings", {
	Text = "3. Enable Wings",
	Default = false,
	Callback = function(arg)
		if arg then
			if BuildWings() then
				tbl2.WingsActive = true
			else
				_NOTIFY("Target not found", 3)
				tbl2.WingsActive = false
			end
		else
			tbl2.WingsActive = false
			CleanupWings()
		end
	end,
})

Wings:AddSlider("WingSpeed", {
	Text = "Wing Speed",
	Default = 2,
	Min = 1,
	Max = 10,
	Rounding = 1,
	Callback = function(wingSpeed)
		tbl2.WingSpeed = wingSpeed
	end,
})

do
	local Target = tbl15.Fun:AddLeftGroupbox("Target")
	local Controls = tbl15.Fun:AddRightGroupbox("Controls")

	local BodyTargetDropdown = Target:AddDropdown("BodyTargetDropdown", {
		Text = "Target Player",
		Values = GetPlayerListDisplay(),
		Default = 1,
		Callback = function(arg)
			tbl2.selectedPlayerName = ExtractUsername(arg)
		end,
	})

	setupAutoRefresh(BodyTargetDropdown)
	Controls:AddDivider("Head")

	Controls:AddToggle("HeadSpin", {
		Text = "Head Spin",
		Default = false,
		Callback = function(headEnabled)
			tbl2.headEnabled = headEnabled
			UpdateRagdollState()
		end,
	})

	Controls:AddSlider("HeadRadius", {
		Text = "Head Radius",
		Default = 20,
		Min = 1,
		Max = 200,
		Rounding = 0,
		Callback = function(radius)
			tbl2.radius = radius
		end,
	})

	Controls:AddSlider("HeadSpeed", {
		Text = "Head Speed",
		Default = 3,
		Min = 0.1,
		Max = 20,
		Rounding = 1,
		Callback = function(speed_)
			tbl2.speed = speed_
		end,
	})

	Controls:AddSlider("HeadHeight", {
		Text = "Head Height",
		Default = 3,
		Min = -50,
		Max = 100,
		Rounding = 0,
		Callback = function(height)
			tbl2.height = height
		end,
	})

	Controls:AddDivider("Legs")

	Controls:AddToggle("LegsOrigin", {
		Text = "Legs to (0,0,0)",
		Default = false,
		Callback = function(legsEnabled)
			tbl2.legsEnabled = legsEnabled
			UpdateRagdollState()
		end,
	})

	Controls:AddDivider("Obey")

	Controls:AddDropdown("ObeyPart", {
		Text = "Part to Obey",
		Values = { "Head", "Left Arm", "Right Arm", "Left Leg", "Right Leg" },
		Default = 1,
		Callback = function(selectedPart)
			tbl2.selectedPart = selectedPart
		end,
	})

	Controls:AddToggle("ObeyPart2", {
		Text = "Obey Part",
		Default = false,
		Callback = function(obeyPartEnabled)
			tbl2.obeyPartEnabled = obeyPartEnabled
			UpdateRagdollState()
		end,
	})

	Controls:AddToggle("ObeyAll", {
		Text = "Obey All (Mirror)",
		Default = false,
		Callback = function(obeyAllEnabled)
			tbl2.obeyAllEnabled = obeyAllEnabled
			UpdateRagdollState()
		end,
	})

	Controls:AddSlider("ObeySmooth", {
		Text = "Obey Smoothness",
		Default = 0.25,
		Min = 0.01,
		Max = 1,
		Rounding = 2,
		Callback = function(lerpAlpha)
			tbl2.lerpAlpha = lerpAlpha
		end,
	})

	Controls:AddSlider("ObeyDist", {
		Text = "Obey Distance",
		Default = 5,
		Min = 1,
		Max = 50,
		Rounding = 0,
		Callback = function(obeyRightDistance)
			tbl2.obeyRightDistance = obeyRightDistance
		end,
	})

	Controls:AddDivider("Feet TP")

	Controls:AddToggle("FeetTPDelete", {
		Text = "Feet TP+Delete",
		Default = false,
		Callback = function(feetTPDeleteEnabled)
			tbl2.feetTPDeleteEnabled = feetTPDeleteEnabled
			UpdateRagdollState()
		end,
	})
end

do
	local v14 = tbl15.Attack:AddLeftGroupbox("All Break")
	local v15 = tbl15.Attack:AddRightGroupbox("Target Break")

	v14:AddToggle("LoopAllGucci", {
		Text = "Loop All Gucci Breaker",
		Default = false,
		Callback = function(autoSitEnabled)
			tbl2.autoSitEnabled = autoSitEnabled
		end,
	})

	v14:AddButton({
		Text = "All Gucci Breaker",
		Func = function()
			smartFastSitAllThenReturn(workspace_)
		end,
	})

	local CvCTargetDropdown = v15:AddDropdown("CvCTargetDropdown", {
		Text = "Select Player",
		Values = GetPlayerListDisplay(),
		Default = 1,
		Callback = function(arg)
			tbl2.selectedPlayerFolderId = ExtractUsername(arg)
		end,
	})

	setupAutoRefresh(CvCTargetDropdown)

	v15:AddButton({
		Text = "Targeted All Gucci Breaker",
		Func = function()
			if not tbl2.selectedPlayerFolderId then
				return
			end
			local v16 = workspace_:FindFirstChild(tbl2.selectedPlayerFolderId .. "SpawnedInToys")

			if v16 then
				smartFastSitAllThenReturn(v16)
			end
		end,
	})
end

do
	local Movement = tbl15.Character:AddLeftGroupbox("Movement")
	local v14 = tbl15.Character:AddRightGroupbox("Camera / Spin")

	Movement:AddToggle("CustomWalkSpeed", {
		Text = "Enable Custom WalkSpeed",
		Default = false,
		Callback = function(characterWalkSpeedEnabled)
			tbl2.characterWalkSpeedEnabled = characterWalkSpeedEnabled
			_NOTIFY(characterWalkSpeedEnabled and "WalkSpeed Enabled" or "WalkSpeed Disabled", 3)
		end,
	})

	Movement:AddSlider("WalkSpeed", {
		Text = "WalkSpeed",
		Default = 1,
		Min = 0.1,
		Max = 10,
		Rounding = 1,
		Callback = function(characterWalkSpeed)
			tbl2.characterWalkSpeed = characterWalkSpeed
		end,
	})

	Movement:AddToggle("CustomJumpPower", {
		Text = "Enable Custom JumpPower",
		Default = false,
		Callback = function(characterJumpPowerEnabled)
			tbl2.characterJumpPowerEnabled = characterJumpPowerEnabled
			local humanoid_ = getChar():FindFirstChildOfClass("Humanoid")

			if humanoid_ then
				humanoid_.JumpPower = characterJumpPowerEnabled and tbl2.characterJumpPower or 50
			end
		end,
	})

	Movement:AddSlider("JumpPower", {
		Text = "JumpPower",
		Default = 50,
		Min = 0,
		Max = 500,
		Rounding = 0,
		Callback = function(characterJumpPower)
			tbl2.characterJumpPower = characterJumpPower

			if tbl2.characterJumpPowerEnabled then
				local humanoid_ = getChar():FindFirstChildOfClass("Humanoid")

				if humanoid_ then
					humanoid_.JumpPower = characterJumpPower
				end
			end
		end,
	})

	Movement:AddToggle("CharInfJump", {
		Text = "Infinite Jump",
		Default = false,
		Callback = function(characterInfJumpEnabled)
			tbl2.characterInfJumpEnabled = characterInfJumpEnabled
		end,
	})

	Movement:AddDivider("Look Glitch")

	Movement:AddToggle("OMGHead", {
		Text = "OMG HEAD!!",
		Default = false,
		Callback = function(arg)
			if arg then
				connection = runService.RenderStepped:Connect(function()
					pcall(function()
						look:FireServer(CFrame.new(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1), CFrame.new(0, 0, 0, -1, 8.74227766e-08, 0, -1.04250613e-15, -1.19248806e-08, 1, 8.74227766e-08, 1, 1.19248806e-08), CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0), "high")
					end)
				end)
			else
				if connection then
					connection:Disconnect()
					connection = nil
				end

				resetLook()
			end
		end,
	})

	Movement:AddToggle("OMGBody", {
		Text = "OMG BODY",
		Default = false,
		Callback = function(arg)
			if arg then
				connection2 = runService.RenderStepped:Connect(function()
					pcall(function()
						local cframe = CFrame.new
						look:FireServer(CFrame.new(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1), CFrame.new(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1), cframe(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1), "high")
					end)
				end)
			else
				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end

				resetLook()
			end
		end,
	})

	v14:AddSlider("FOV", {
		Text = "FOV",
		Default = 70,
		Min = 1,
		Max = 120,
		Rounding = 0,
		Callback = function(characterFOV)
			tbl2.characterFOV = characterFOV
			workspace.CurrentCamera.FieldOfView = characterFOV
		end,
	})

	v14:AddToggle("ThirdPerson", {
		Text = "Third Person View",
		Default = false,
		Callback = function(thirdPersonEnabled)
			tbl2.thirdPersonEnabled = thirdPersonEnabled

			if thirdPersonEnabled then
				localPlayer.CameraMaxZoomDistance = 3000000
			else
				localPlayer.CameraMaxZoomDistance = 128
			end

			localPlayer.CameraMode = Enum.CameraMode.Classic
		end,
	})

	v14:AddDivider("Spin")

	v14:AddToggle("CharSpin", {
		Text = "Enable Spin",
		Default = false,
		Callback = function(characterSpinEnabled)
			tbl2.characterSpinEnabled = characterSpinEnabled

			if not characterSpinEnabled then
				tbl2.characterSpinAngle = 0
			end
		end,
	})

	v14:AddSlider("SpinSpeed", {
		Text = "Spin Speed",
		Default = 5,
		Min = 0.1,
		Max = 20,
		Rounding = 1,
		Callback = function(characterSpinSpeed)
			tbl2.characterSpinSpeed = characterSpinSpeed
		end,
	})
end

do
	local v14 = tbl15.Character:AddRightGroupbox("Free Camera")
	local v15 = tbl15.Character:AddLeftGroupbox("Body Material Override")
	local flag2 = false
	local flag3 = true
	local flag4 = false
	local str2 = "ForceField"
	local color = Color3.fromRGB(180, 200, 255)
	local tbl16 = {}
	local tbl17 = {}
	local folder4 = nil

	setBodyVisible = function(arg)
		local character = localPlayer.Character
		if not character then
			return
		end

		for _, descendant in ipairs(character:GetDescendants()) do
			if descendant:IsA("BasePart") then
				pcall(function()
					descendant.LocalTransparencyModifier = arg and 0 or 0
				end)
			end
		end
	end

	applyBodyMaterial = function()
		local character = localPlayer.Character
		if not character then
			return
		end

		if folder4 then
			pcall(function()
				folder4:Destroy()
			end)
		end

		folder4 = Instance.new("Folder")
		folder4.Name = "_phBodyMatStash"
		folder4.Parent = localPlayer
		tbl17 = {}

		for _, child in ipairs(character:GetChildren()) do
			if child:IsA("Shirt") or child:IsA("Pants") or child:IsA("ShirtGraphic") then
				local parent = child.Parent
				child.Parent = folder4
				table.insert(tbl17, { obj = child, orig = parent })
			end
		end

		for _, descendant in ipairs(character:GetDescendants()) do
			if descendant:IsA("SurfaceAppearance") then
				local parent = descendant.Parent
				descendant.Parent = folder4
				table.insert(tbl17, { obj = descendant, orig = parent })
			end
		end

		tbl16 = {}

		for _, descendant in ipairs(character:GetDescendants()) do
			if descendant:IsA("BasePart") and descendant.Name ~= "HumanoidRootPart" then
				tbl16[descendant] = { mat = descendant.Material, col = descendant.Color }

				pcall(function()
					descendant.Material = Enum.Material[str2]
					descendant.Color = color
				end)
			end
		end
	end

	removeBodyMaterial = function()
		for k, v16 in pairs(tbl16) do
			if k and k.Parent then
				pcall(function()
					k.Material = v16.mat
					k.Color = v16.col
				end)
			end
		end

		tbl16 = {}

		for _, v16 in ipairs(tbl17) do
			pcall(function()
				v16.obj.Parent = v16.orig
			end)
		end

		tbl17 = {}

		if folder4 then
			pcall(function()
				folder4:Destroy()
			end)

			folder4 = nil
		end
	end

	localPlayer.CharacterAdded:Connect(function()
		if flag4 then
			task.wait(1.5)
			applyBodyMaterial()
		end
	end)

	local flag5 = false
	local connection3 = nil

	startBodyMatRainbow = function()
		if connection3 then
			return
		end

		connection3 = runService.RenderStepped:Connect(function()
			if not flag4 then
				return
			end
			local color2 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
			color = color2

			for k in pairs(tbl16) do
				if k and k.Parent then
					pcall(function()
						k.Color = color2
					end)
				end
			end
		end)
	end

	stopBodyMatRainbow = function()
		if connection3 then
			connection3:Disconnect()
			connection3 = nil
		end
	end

	enableFreeCamera = function()
		flag2 = true
		local character = localPlayer.Character

		if character then
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart then
				humanoidRootPart.Anchored = true
			end
		end

		if flag3 then
			setBodyVisible(true)
		end
	end

	disableFreeCamera = function()
		flag2 = false
		local character = localPlayer.Character

		if character then
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart then
				humanoidRootPart.Anchored = false
			end
		end

		userInputService.MouseBehavior = Enum.MouseBehavior.Default

		pcall(function()
			workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		end)
	end

	v14:AddToggle("FreeCamToggle", {
		Text = "Enable Free Camera",
		Default = false,
		Callback = function(arg)
			if arg then
				enableFreeCamera()
			else
				disableFreeCamera()
			end

			_NOTIFY(arg and "Free Camera ON (Character Anchored)" or "Free Camera OFF", 3)
		end,
	})

	v14:AddToggle("FreeCamShowBody", {
		Text = "Show Own Body",
		Default = true,
		Callback = function(arg)
			flag3 = arg

			if flag2 then
				setBodyVisible(arg)
			end
		end,
	})

	v15:AddToggle("BodyMatToggle", {
		Text = "Enable Body Material",
		Default = false,
		Callback = function(arg)
			flag4 = arg

			if arg then
				applyBodyMaterial()
			else
				removeBodyMaterial()
			end

			_NOTIFY(arg and "Body Material: " .. str2 .. " ON" or "Body Material OFF", 3)
		end,
	}):AddColorPicker("BodyMatColor", {
		Default = Color3.fromRGB(180, 200, 255),
		Title = "Body Color",
		Callback = function(color2)
			color = color2

			if flag4 then
				for k in pairs(tbl16) do
					if k and k.Parent then
						pcall(function()
							k.Color = color2
						end)
					end
				end
			end
		end,
	})

	v15:AddDropdown("BodyMaterialDd", {
		Text = "Select Material",
		Values = {
			"ForceField",
			"Neon",
			"Glass",
			"Metal",
			"SmoothPlastic",
			"Plastic",
			"Wood",
			"Marble",
			"Granite",
			"Slate",
			"WoodPlanks",
			"Cobblestone",
			"Brick",
			"Fabric",
		},
		Default = 1,
		Callback = function(arg)
			str2 = arg

			if flag4 then
				removeBodyMaterial()
				applyBodyMaterial()
			end
		end,
	})

	v15:AddButton({
		Text = "Re-apply (after respawn / refresh)",
		Func = function()
			if flag4 then
				removeBodyMaterial()
				applyBodyMaterial()
				_NOTIFY("Body material re-applied!", 3)
			else
				_NOTIFY("Enable Body Material first", 2)
			end
		end,
	})

	v15:AddLabel("Clothing is hidden while enabled")
	v15:AddLabel("Materials: ForceField, Neon, Glass ...")

	v15:AddToggle("BodyMatRainbow", {
		Text = "Rainbow Body Material",
		Default = false,
		Callback = function(arg)
			flag5 = arg

			if arg then
				startBodyMatRainbow()
			else
				stopBodyMatRainbow()
			end

			_NOTIFY(arg and "Body Rainbow ON" or "Body Rainbow OFF", 3)
		end,
	})
end

do
	local Umbrella = tbl15.Character:AddRightGroupbox("Umbrella")
	local v14 = tbl15.Character:AddRightGroupbox("Local Aura")
	local flag2 = false
	local flag3 = false
	local transparency = 0.3
	local color = Color3.fromRGB(255, 255, 255)
	local neon = Enum.Material.Neon
	local n8 = 2.4
	local n9 = 1.1
	local v15 = nil
	local connection3 = nil

	destroyHat = function()
		if v15 then
			pcall(function()
				v15:Destroy()
			end)

			v15 = nil
		end

		if connection3 then
			connection3:Disconnect()
			connection3 = nil
		end
	end

	buildHat = function()
		destroyHat()
		local character = localPlayer.Character
		if not character then
			return
		end
		local head_ = character:FindFirstChild("Head")
		if not head_ then
			return
		end
		local part_4 = Instance.new("Part")
		part_4.Name = "_phChineseHat"
		part_4.Transparency = transparency
		part_4.Color = color
		part_4.Material = neon
		part_4.CanCollide = false
		part_4.CanTouch = false
		part_4.CanQuery = false
		part_4.Massless = true
		local specialMesh = Instance.new("SpecialMesh")
		specialMesh.MeshId = "rbxassetid://1033714"
		specialMesh.Scale = Vector3.new(n8, n8 * 0.66666666666666674, n8)
		specialMesh.Parent = part_4
		local weldConstraint = Instance.new("WeldConstraint")
		weldConstraint.Part0 = head_
		weldConstraint.Part1 = part_4
		weldConstraint.Parent = part_4
		part_4.CFrame = head_.CFrame * CFrame.new(0, n9, 0)
		part_4.Parent = character
		v15 = part_4

		if flag3 then
			connection3 = runService.RenderStepped:Connect(function()
				if not flag2 or not v15 then
					return
				end
				local n10 = tick() % 5 / 5

				pcall(function()
					v15.Color = Color3.fromHSV(n10, 1, 1)
				end)
			end)
		end
	end

	local flag4 = false
	local tbl16 = { "Godly" }
	local str2 = ""
	local str3 = "Auto"
	local tbl17 = {}
	local tbl18 = {}
	local n10 = 1
	local tbl19 = {}

	local tbl20 = {
		Godly = "rbxassetid://16699750981",
		["Super Sayien"] = "rbxassetid://116109508364297",
		["North Star"] = "rbxassetid://83945069652732",
		["Blue Lord"] = "rbxassetid://10974316799",
		["Pink Aura"] = "rbxassetid://115980859615239",
		["Angel Wing"] = "rbxassetid://90022969696073",
		["Sweet Heart"] = "rbxassetid://91724768175470",
		["Ethereal Aura"] = "rbxassetid://97041568674250",
	}

	disableAura = function()
		for _, v16 in ipairs(tbl18) do
			if v16 and v16.Parent then
				pcall(function()
					v16:Destroy()
				end)
			end
		end

		table.clear(tbl18)
		table.clear(tbl19)
		local character = localPlayer.Character

		if character then
			local phAuraFeetPart = character:FindFirstChild("_phAuraFeetPart")

			if phAuraFeetPart then
				pcall(function()
					phAuraFeetPart:Destroy()
				end)
			end
		end
	end

	enableAura = function()
		disableAura()
		local character = localPlayer.Character
		if not character or #tbl17 == 0 then
			return
		end

		for _, v16 in ipairs(tbl17) do
			local clone = v16:Clone()

			for _, descendant in ipairs(clone:GetDescendants()) do
				if not descendant:IsA("BasePart") then
					local clone2 = descendant:Clone()
					local name = descendant.Parent and descendant.Parent.Name
					local basePart

					if str3 == "Auto" then
						basePart = name and character:FindFirstChild(name) or character:FindFirstChildWhichIsA("BasePart")
					elseif str3 == "Under Feet" then
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						basePart = nil

						if humanoidRootPart then
							basePart = character:FindFirstChild("_phAuraFeetPart")

							if not basePart then
								basePart = Instance.new("Part")
								basePart.Name = "_phAuraFeetPart"
								basePart.Transparency = 1
								basePart.CanCollide = false
								basePart.Anchored = false
								basePart.Massless = true
								basePart.Size = Vector3.one
								local weldConstraint = Instance.new("WeldConstraint")
								weldConstraint.Part0 = humanoidRootPart
								weldConstraint.Part1 = basePart
								weldConstraint.Parent = basePart
								basePart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -3.1, 0)
								basePart.Parent = character
							end
						end
					else
						basePart = character:FindFirstChild(str3) or character:FindFirstChild("HumanoidRootPart")
					end

					if basePart then
						clone2.Parent = basePart
						table.insert(tbl18, clone2)

						applyRate = function(arg)
							if arg:IsA("ParticleEmitter") then
								tbl19[arg] = arg.Rate
								arg.Rate = arg.Rate * n10
							end
						end

						applyRate(clone2)

						for _, descendant2 in ipairs(clone2:GetDescendants()) do
							applyRate(descendant2)
						end
					end
				end
			end

			clone:Destroy()
		end
	end

	updateAuraLogic = function()
		local tbl21 = {}

		if str2 ~= "" then
			table.insert(tbl21, "rbxassetid://" .. str2:gsub("%D", ""))
		elseif type(tbl16) == "table" then
			for k, v16 in pairs(tbl16) do
				v16 = v16 and tbl20[k]

				if v16 then
					table.insert(tbl21, tbl20[k])
				end
			end
		elseif type(tbl16) == "string" and tbl20[tbl16] then
			table.insert(tbl21, tbl20[tbl16])
		end

		table.clear(tbl17)

		for k, v16 in pairs(tbl21) do
			local ok2, result2 = pcall(function()
				return game:GetObjects(v16)[1]
			end)

			if ok2 and result2 then
				k = type(k) == "string" and k or "Custom"
				result2.Name = k
				table.insert(tbl17, result2)
			end
		end

		if flag4 then
			enableAura()
		end
	end

	localPlayer.CharacterAdded:Connect(function()
		task.wait(1.5)

		if flag2 then
			buildHat()
		end

		if flag4 then
			enableAura()
		end
	end)

	Umbrella:AddToggle("UmbrellaMeshToggle", {
		Text = "Umbrella",
		Default = false,
		Callback = function(arg)
			flag2 = arg

			if arg then
				buildHat()
			else
				destroyHat()
			end
		end,
	}):AddColorPicker("UmbrellaMeshColor", {
		Default = Color3.fromRGB(255, 255, 255),
		Title = "Umbrella Color",
		Callback = function(color2)
			color = color2

			if v15 then
				pcall(function()
					v15.Color = color2
				end)
			end
		end,
	})

	Umbrella:AddToggle("UmbrellaMeshRainbow", {
		Text = "Rainbow Umbrella",
		Default = false,
		Callback = function(arg)
			flag3 = arg

			if flag2 then
				destroyHat()
				buildHat()
			end
		end,
	})

	Umbrella:AddSlider("UmbrellaMeshTrans", {
		Text = "Umbrella Transparency",
		Min = 0,
		Max = 100,
		Default = 30,
		Rounding = 0,
		Callback = function(arg)
			transparency = arg / 100

			if v15 then
				pcall(function()
					v15.Transparency = transparency
				end)
			end
		end,
	})

	Umbrella:AddSlider("UmbrellaMeshSize", {
		Text = "Umbrella Size",
		Min = 0.5,
		Max = 10,
		Default = 2.4,
		Rounding = 1,
		Callback = function(arg)
			n8 = arg

			if v15 and v15:FindFirstChildOfClass("SpecialMesh") then
				pcall(function()
					v15:FindFirstChildOfClass("SpecialMesh").Scale = Vector3.new(arg, arg * 0.66666666666666674, arg)
				end)
			end
		end,
	})

	Umbrella:AddSlider("UmbrellaMeshHeight", {
		Text = "Umbrella Height",
		Min = -10,
		Max = 10,
		Default = 1.1,
		Rounding = 1,
		Callback = function(arg)
			n9 = arg

			if flag2 then
				destroyHat()
				buildHat()
			end
		end,
	})

	Umbrella:AddDropdown("UmbrellaMeshMaterial", {
		Values = {
			"Neon",
			"ForceField",
			"Plastic",
			"SmoothPlastic",
			"Glass",
			"Ice",
			"Wood",
			"Metal",
			"Foil",
		},
		Default = "Neon",
		Multi = false,
		Text = "Umbrella Material",
		Callback = function(arg)
			neon = Enum.Material[arg]

			if v15 then
				pcall(function()
					v15.Material = neon
				end)
			end
		end,
	})

	v14:AddToggle("LocalAuraToggle", {
		Text = "Local Aura",
		Default = false,
		Callback = function(arg)
			flag4 = arg

			if arg then
				if #tbl17 == 0 then
					updateAuraLogic()
				end

				enableAura()
			else
				disableAura()
			end
		end,
	})

	local tbl21 = {}

	for k in pairs(tbl20) do
		table.insert(tbl21, k)
	end

	table.sort(tbl21)
	local tbl22 = {}
	local tbl23 = {}
	local tbl24 = {}

	updateDynamicUIVisibility = function()
		for k, v16 in pairs(tbl24) do
			local visible = tbl16 and type(tbl16) == "table" and tbl16[k] == true

			for _, v17 in ipairs(v16) do
				if v17.SetVisible then
					pcall(function()
						v17:SetVisible(visible)
					end)
				elseif v17.Container then
					v17.Container.Visible = visible
				end
			end
		end
	end

	v14:AddDropdown("LocalAuraType", {
		Values = tbl21,
		Default = 1,
		Multi = true,
		Text = "Aura Type",
		Callback = function(arg)
			tbl16 = arg
			str2 = ""
			updateDynamicUIVisibility()

			if flag4 then
				updateAuraLogic()
			end
		end,
	})

	for _, v16 in ipairs(tbl21) do
		tbl22[v16] = "Auto"
		tbl23[v16] = 1
		local v17 = v14:AddDivider("" .. v16 .. " Settings")

		local v18 = v14:AddDropdown("LocalAuraTarget_" .. v16, {
			Values = {
				"Auto",
				"Under Feet",
				"HumanoidRootPart",
				"Head",
				"Torso",
				"Right Arm",
				"Left Arm",
				"Right Leg",
				"Left Leg",
			},
			Default = "Auto",
			Multi = false,
			Text = v16 .. " Target",
			Callback = function(arg)
				tbl22[v16] = arg

				if flag4 and type(tbl16) == "table" and tbl16[v16] then
					enableAura()
				end
			end,
		})

		local v19 = v14:AddSlider("LocalAuraRateMult_" .. v16, {
			Text = v16 .. " Rate",
			Min = 0.1,
			Max = 10,
			Default = 1,
			Rounding = 1,
			Callback = function(arg)
				tbl23[v16] = arg

				if flag4 and type(tbl16) == "table" and tbl16[v16] then
					enableAura()
				end
			end,
		})

		if v17.SetVisible then
			pcall(function()
				v17:SetVisible(false)
			end)
		elseif v17.Container then
			v17.Container.Visible = false
		end

		if v18.SetVisible then
			pcall(function()
				v18:SetVisible(false)
			end)
		elseif v18.Container then
			v18.Container.Visible = false
		end

		if v19.SetVisible then
			pcall(function()
				v19:SetVisible(false)
			end)
		elseif v19.Container then
			v19.Container.Visible = false
		end

		tbl24[v16] = { v17, v18, v19 }
	end

	updateDynamicUIVisibility()

	v14:AddDropdown("LocalAuraTarget", {
		Values = {
			"Auto",
			"Under Feet",
			"HumanoidRootPart",
			"Head",
			"Torso",
			"Right Arm",
			"Left Arm",
			"Right Leg",
			"Left Leg",
		},
		Default = "Auto",
		Multi = false,
		Text = "Aura Target Part",
		Callback = function(arg)
			str3 = arg

			if flag4 then
				enableAura()
			end
		end,
	})

	v14:AddInput("LocalAuraCustom", {
		Default = "",
		Numeric = false,
		Finished = true,
		Text = "Custom Aura ID",
		Placeholder = "Asset ID...",
		Callback = function(arg)
			str2 = arg:match("^%s*(.-)%s*$") or ""

			if flag4 and str2 ~= "" then
				updateAuraLogic()
			end
		end,
	})

	v14:AddSlider("LocalAuraRateMult", {
		Text = "Particle Rate Multiplier",
		Min = 0.1,
		Max = 10,
		Default = 1,
		Rounding = 1,
		Callback = function(arg)
			n10 = arg

			for k, v16 in pairs(tbl19) do
				if k and k.Parent then
					pcall(function()
						k.Rate = v16 * arg
					end)
				end
			end
		end,
	})
end

do
	local v14 = tbl15.Character:AddLeftGroupbox("Visual Effects Configuration")
	local tbl16 = { Halo = {}, Aura = {}, ["Angel Wings"] = {}, Trail = {} }

	addFxElement = function(arg, arg2)
		table.insert(tbl16[arg], arg2)
		return arg2
	end

	local FXSelect = v14:AddDropdown("FXSelect", {
		Text = "Select Effect to Configure",
		Values = { "Halo", "Aura", "Angel Wings", "Trail" },
		Default = 1,
		Callback = function(arg)
			for k, v15 in pairs(tbl16) do
				local visible = k == arg

				for _, v16 in ipairs(v15) do
					if v16.SetVisible then
						pcall(function()
							v16:SetVisible(visible)
						end)
					elseif v16.Container then
						v16.Container.Visible = visible
					end
				end
			end
		end,
	})

	v14:AddDivider()
	addFxElement("Halo", v14:AddDivider("Halo Settings"))

	addFxElement("Halo", v14:AddToggle("HaloEnable", {
		Text = "Enable Halo",
		Default = false,
		Callback = function(haloEnabled)
			tbl2.haloEnabled = haloEnabled
			tbl14.setHaloEnabled(haloEnabled)
		end,
	})):AddColorPicker("HaloColor", {
		Default = Color3.fromRGB(133, 220, 255),
		Title = "Halo Color",
		Callback = function(haloColor)
			tbl2.haloColor = haloColor
			tbl14.updateHaloColor(haloColor)
		end,
	})

	addFxElement("Halo", v14:AddSlider("HaloRate", {
		Text = "Halo Particle Rate",
		Default = 7,
		Min = 1,
		Max = 50,
		Rounding = 0,
		Callback = function(haloRate)
			tbl2.haloRate = haloRate
			tbl14.updateHaloRate(haloRate)
		end,
	}))

	addFxElement("Halo", v14:AddSlider("HaloBrightness", {
		Text = "Halo Brightness",
		Default = 2,
		Min = 0,
		Max = 10,
		Rounding = 1,
		Callback = function(haloBrightness)
			tbl2.haloBrightness = haloBrightness
			tbl14.updateHaloBright(haloBrightness)
		end,
	}))

	addFxElement("Halo", v14:AddSlider("HaloHeight", {
		Text = "Halo Height (Y)",
		Default = 1.5,
		Min = -3,
		Max = 5,
		Rounding = 1,
		Callback = function(haloOffsetY)
			tbl2.haloOffsetY = haloOffsetY
		end,
	}))

	addFxElement("Halo", v14:AddSlider("HaloSide", {
		Text = "Halo Side (X)",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 1,
		Callback = function(haloOffsetX)
			tbl2.haloOffsetX = haloOffsetX
		end,
	}))

	addFxElement("Halo", v14:AddSlider("HaloDepth", {
		Text = "Halo Depth (Z)",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 1,
		Callback = function(haloOffsetZ)
			tbl2.haloOffsetZ = haloOffsetZ
		end,
	}))

	addFxElement("Halo", v14:AddSlider("HaloRingHeight", {
		Text = "Halo Ring Height Offset",
		Default = 0.93,
		Min = -2,
		Max = 3,
		Rounding = 2,
		Callback = function(haloAttOffsetY)
			tbl2.haloAttOffsetY = haloAttOffsetY
			tbl14.haloAtt.CFrame = CFrame.new(-0.25, haloAttOffsetY, 0.25, 0.4689, -0.2499, -0.8471, -0.1171, 0.933, -0.3401, 0.8754, 0.2587, 0.4082)
		end,
	}))

	addFxElement("Aura", v14:AddDivider("Aura Settings"))

	addFxElement("Aura", v14:AddToggle("AuraEnable", {
		Text = "Enable Aura",
		Default = false,
		Callback = function(auraEnabled)
			tbl2.auraEnabled = auraEnabled
			tbl14.setAuraEnabled(auraEnabled)
		end,
	})):AddColorPicker("AuraColor", {
		Default = Color3.fromRGB(133, 220, 255),
		Title = "Aura Color",
		Callback = function(auraColor)
			tbl2.auraColor = auraColor
			tbl14.updateAuraColor(auraColor)
		end,
	})

	addFxElement("Aura", v14:AddSlider("AuraRate", {
		Text = "Aura Particle Rate",
		Default = 20,
		Min = 1,
		Max = 60,
		Rounding = 0,
		Callback = function(auraRate)
			tbl2.auraRate = auraRate
			tbl14.updateAuraRate(auraRate)
		end,
	}))

	addFxElement("Aura", v14:AddSlider("AuraBrightness", {
		Text = "Aura Brightness",
		Default = 2,
		Min = 0,
		Max = 10,
		Rounding = 1,
		Callback = function(auraBrightness)
			tbl2.auraBrightness = auraBrightness
			tbl14.updateAuraBright(auraBrightness)
		end,
	}))

	addFxElement("Aura", v14:AddSlider("AuraHeight", {
		Text = "Aura Height (Y)",
		Default = 0,
		Min = -3,
		Max = 5,
		Rounding = 1,
		Callback = function(auraOffsetY)
			tbl2.auraOffsetY = auraOffsetY
		end,
	}))

	addFxElement("Aura", v14:AddSlider("AuraSide", {
		Text = "Aura Side (X)",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 1,
		Callback = function(auraOffsetX)
			tbl2.auraOffsetX = auraOffsetX
		end,
	}))

	addFxElement("Aura", v14:AddSlider("AuraDepth", {
		Text = "Aura Depth (Z)",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 1,
		Callback = function(auraOffsetZ)
			tbl2.auraOffsetZ = auraOffsetZ
		end,
	}))

	addFxElement("Angel Wings", v14:AddDivider("Angel Wings Settings"))

	addFxElement("Angel Wings", v14:AddToggle("AngelEnable", {
		Text = "Enable Angel Wings",
		Default = false,
		Callback = function(angelEnabled)
			tbl2.angelEnabled = angelEnabled
			tbl14.setAngelEnabled(angelEnabled)
		end,
	})):AddColorPicker("AngelColor", {
		Default = Color3.fromRGB(133, 220, 255),
		Title = "Wings Color",
		Callback = function(angelColor)
			tbl2.angelColor = angelColor
			tbl14.updateAngelColor(angelColor)
		end,
	})

	addFxElement("Angel Wings", v14:AddSlider("AngelRate", {
		Text = "Wings Particle Rate",
		Default = 4,
		Min = 1,
		Max = 30,
		Rounding = 0,
		Callback = function(angelRate)
			tbl2.angelRate = angelRate
			tbl14.updateAngelRate(angelRate)
		end,
	}))

	addFxElement("Angel Wings", v14:AddSlider("AngelBrightness", {
		Text = "Wings Brightness",
		Default = 1,
		Min = 0,
		Max = 5,
		Rounding = 1,
		Callback = function(angelBrightness)
			tbl2.angelBrightness = angelBrightness
			tbl14.updateAngelBright(angelBrightness)
		end,
	}))

	addFxElement("Angel Wings", v14:AddSlider("AngelHeight", {
		Text = "Wings Height Offset (Y)",
		Default = 0,
		Min = -3,
		Max = 5,
		Rounding = 1,
		Callback = function(angelOffsetY)
			tbl2.angelOffsetY = angelOffsetY
		end,
	}))

	addFxElement("Angel Wings", v14:AddSlider("AngelSide", {
		Text = "Wings Side Offset (X)",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 1,
		Callback = function(angelOffsetX)
			tbl2.angelOffsetX = angelOffsetX
		end,
	}))

	addFxElement("Angel Wings", v14:AddSlider("AngelSpread", {
		Text = "Wings Spread",
		Default = 1,
		Min = 0.3,
		Max = 3,
		Rounding = 1,
		Callback = function(angelWingSpread)
			tbl2.angelWingSpread = angelWingSpread
			tbl14.attL.CFrame = CFrame.new(-1.012 * angelWingSpread, 0.5, 0.852) * CFrame.Angles(0, 0.26179938779914941, 0)
			tbl14.attR.CFrame = CFrame.new(1.167 * angelWingSpread, 0.5, 0.852) * CFrame.Angles(0, -0.26179938779914941, 0)
		end,
	}))

	addFxElement("Trail", v14:AddDivider("Trail Settings"))

	addFxElement("Trail", v14:AddToggle("TrailEnable", {
		Text = "Enable Trail",
		Default = false,
		Callback = function(trailEnabled)
			tbl2.trailEnabled = trailEnabled
			tbl14.setTrailEnabled(trailEnabled)
		end,
	})):AddColorPicker("TrailColor", {
		Default = Color3.fromRGB(133, 220, 255),
		Title = "Trail Color",
		Callback = function(trailColor)
			tbl2.trailColor = trailColor
			tbl14.updateTrailColor(trailColor)
		end,
	})

	addFxElement("Trail", v14:AddSlider("TrailWidth", {
		Text = "Trail Width",
		Default = 1.5,
		Min = 0.2,
		Max = 5,
		Rounding = 1,
		Callback = function(trailWidth)
			tbl2.trailWidth = trailWidth
			tbl14.updateTrailWidth(trailWidth)
		end,
	}))

	addFxElement("Trail", v14:AddSlider("TrailLifetime", {
		Text = "Trail Lifetime",
		Default = 0.4,
		Min = 0.05,
		Max = 3,
		Rounding = 2,
		Callback = function(trailLifetime)
			tbl2.trailLifetime = trailLifetime
			tbl14.updateTrailLifetime(trailLifetime)
		end,
	}))

	pcall(function()
		FXSelect:SetValue("Halo")
	end)
end

local v14 = tbl15.Character:AddRightGroupbox("Rainbow Settings")

v14:AddToggle("RainbowEnable", {
	Text = "Enable Rainbow Mode",
	Default = false,
	Callback = function(rainbowEnabled)
		tbl2.rainbowEnabled = rainbowEnabled
	end,
})

v14:AddSlider("RainbowSpeed", {
	Text = "Rainbow Speed",
	Default = 0.5,
	Min = 0.1,
	Max = 5,
	Rounding = 1,
	Callback = function(rainbowSpeed)
		tbl2.rainbowSpeed = rainbowSpeed
	end,
})

v14:AddToggle("RainbowHalo", {
	Text = "Apply Rainbow to Halo",
	Default = true,
	Callback = function(rainbowHalo)
		tbl2.rainbowHalo = rainbowHalo
	end,
})

v14:AddToggle("RainbowAura", {
	Text = "Apply Rainbow to Aura",
	Default = true,
	Callback = function(rainbowAura)
		tbl2.rainbowAura = rainbowAura
	end,
})

v14:AddToggle("RainbowAngel", {
	Text = "Apply Rainbow to Wings",
	Default = true,
	Callback = function(rainbowAngel)
		tbl2.rainbowAngel = rainbowAngel
	end,
})

v14:AddToggle("RainbowTrail", {
	Text = "Apply Rainbow to Trail",
	Default = true,
	Callback = function(rainbowTrail)
		tbl2.rainbowTrail = rainbowTrail
	end,
})

local v15 = tbl15.ESP:AddLeftGroupbox("Toy ESP")

v15:AddToggle("ShurikenESP", {
	Text = "Shuriken (AntiKick) ESP",
	Default = false,
	Callback = function(shurikenESPEnabled)
		tbl2.shurikenESPEnabled = shurikenESPEnabled

		if shurikenESPEnabled or tbl2.blobmanESPEnabled then
			if not tbl8.toyESP then
				tbl8.toyESP = setupToyESPs()
			end
		elseif tbl8.toyESP and not tbl2.blobmanESPEnabled then
			tbl8.toyESP()
			tbl8.toyESP = nil
		end
	end,
})

v15:AddDropdown("ShurikenColorMode", {
	Text = "Shuriken Color Mode",
	Values = { "Rainbow", "Custom" },
	Default = "Rainbow",
	Callback = function(shurikenESPColorMode)
		tbl2.shurikenESPColorMode = shurikenESPColorMode
	end,
})

v15:AddLabel("Shuriken Custom Color"):AddColorPicker("ShurikenSolidColor", {
	Title = "Shuriken Custom Color",
	Default = Color3.fromRGB(0, 230, 255),
	Callback = function(shurikenESPSolidColor)
		tbl2.shurikenESPSolidColor = shurikenESPSolidColor
	end,
})

v15:AddSlider("ShurikenESPTrans", {
	Text = "Shuriken Transparency",
	Default = 0.3,
	Min = 0,
	Max = 1,
	Rounding = 1,
	Callback = function(shurikenESPTransparency)
		tbl2.shurikenESPTransparency = shurikenESPTransparency
	end,
})

v15:AddDivider()

v15:AddToggle("BlobmanESP", {
	Text = "Blobman ESP",
	Default = false,
	Callback = function(blobmanESPEnabled)
		tbl2.blobmanESPEnabled = blobmanESPEnabled

		if blobmanESPEnabled or tbl2.shurikenESPEnabled then
			if not tbl8.toyESP then
				tbl8.toyESP = setupToyESPs()
			end
		elseif tbl8.toyESP and not tbl2.shurikenESPEnabled then
			tbl8.toyESP()
			tbl8.toyESP = nil
		end
	end,
})

v15:AddDropdown("BlobmanColorMode", {
	Text = "Blobman Color Mode",
	Values = { "Rainbow", "Custom" },
	Default = "Rainbow",
	Callback = function(blobmanESPColorMode)
		tbl2.blobmanESPColorMode = blobmanESPColorMode
	end,
})

v15:AddLabel("Blobman Custom Color"):AddColorPicker("BlobmanSolidColor", {
	Title = "Blobman Custom Color",
	Default = Color3.fromRGB(160, 0, 255),
	Callback = function(blobmanESPSolidColor)
		tbl2.blobmanESPSolidColor = blobmanESPSolidColor
	end,
})

v15:AddSlider("BlobmanESPTrans", {
	Text = "Blobman Transparency",
	Default = 0.3,
	Min = 0,
	Max = 1,
	Rounding = 1,
	Callback = function(blobmanESPTransparency)
		tbl2.blobmanESPTransparency = blobmanESPTransparency
	end,
})

v15:AddDivider()

v15:AddSlider("ESPRainbowSpeed", {
	Text = "Rainbow ESP Speed",
	Default = 2,
	Min = 0.1,
	Max = 10,
	Rounding = 1,
	Callback = function(rainbowSpeedESP)
		tbl2.rainbowSpeedESP = rainbowSpeedESP
	end,
})

do
	local v16 = tbl15.Visual:AddLeftGroupbox("Visual Effects")
	local Notifications = tbl15.Visual:AddRightGroupbox("Notifications")

	v16:AddToggle("OceanRainbow", {
		Text = "Ocean Rainbow",
		Default = false,
		Callback = function(oceanRainbowEnabled)
			tbl2.oceanRainbowEnabled = oceanRainbowEnabled

			if oceanRainbowEnabled then
				tbl8.oceanRainbow = setupOceanRainbow()
			elseif tbl8.oceanRainbow then
				tbl8.oceanRainbow()
				tbl8.oceanRainbow = nil
			end

			_NOTIFY(oceanRainbowEnabled and "Sea Rainbow ON" or "OFF", 3)
		end,
	})

	v16:AddButton({
		Text = "Cleanup All Visual Effects",
		Func = function()
			if toggles.LocationDetector then
				toggles.LocationDetector:SetValue(false)
			end

			if toggles.OceanRainbow then
				toggles.OceanRainbow:SetValue(false)
			end

			if toggles.ShurikenESP then
				toggles.ShurikenESP:SetValue(false)
			end

			if toggles.MCTexEnabled then
				toggles.MCTexEnabled:SetValue(false)
			end

			if toggles.MCFontEnabled then
				toggles.MCFontEnabled:SetValue(false)
			end

			_NOTIFY("All visuals cleaned up", 3)
		end,
	})

	local v17 = tbl15.Visual:AddRightGroupbox("Minecraft Texture & Font")

	v17:AddToggle("MCTexEnabled", {
		Text = "Enable Minecraft Textures",
		Default = false,
		Callback = function(mcTexturesEnabled)
			tbl2.mcTexturesEnabled = mcTexturesEnabled

			if mcTexturesEnabled then
				local v18, v19 = tbl14.ApplyMCTextures()
				_NOTIFY(string.format("Applied: %d | Skipped: %d", v18, v19), 3)
			else
				tbl14.RestoreOriginalTextures()
				_NOTIFY("Original textures restored.", 3)
			end
		end,
	})

	v17:AddSlider("MCTileSize", {
		Text = "Studs Per Tile",
		Default = 4,
		Min = 1,
		Max = 16,
		Rounding = 0,
		Callback = function(mcTileSize)
			tbl2.mcTileSize = mcTileSize

			for _, descendant in ipairs(workspace:GetDescendants()) do
				if descendant:IsA("BasePart") then
					for _, child in ipairs(descendant:GetChildren()) do
						if child:IsA("Texture") then
							child.StudsPerTileU = mcTileSize
							child.StudsPerTileV = mcTileSize
						end
					end
				end
			end
		end,
	})

	v17:AddToggle("MCTexDebug", {
		Text = "Debug Log (Texture)",
		Default = false,
		Callback = function(mcTexturesDebug)
			tbl2.mcTexturesDebug = mcTexturesDebug
		end,
	})

	v17:AddDivider()

	v17:AddToggle("MCFontEnabled", {
		Text = "Enable Minecraft Font",
		Default = false,
		Callback = function(mcFontEnabled)
			tbl2.mcFontEnabled = mcFontEnabled

			if mcFontEnabled then
				local v18 = tbl14.ApplyFontAll()
				_NOTIFY(string.format("Applied Minecraft font to %d elements.", v18), 3)
			else
				tbl14.RestoreOriginalFonts()
				_NOTIFY("Restored original fonts.", 3)
			end
		end,
	})

	v17:AddToggle("MCFontAutoApply", {
		Text = "Auto Apply to New Elements",
		Default = false,
		Callback = function(mcFontAutoApply)
			tbl2.mcFontAutoApply = mcFontAutoApply

			if mcFontAutoApply then
				tbl14.StartFontAutoApply()

				if tbl2.mcFontEnabled then
					tbl14.ApplyFontAll()
				end
			else
				tbl14.StopFontAutoApply()
			end
		end,
	})

	v17:AddToggle("MCFontDebug", {
		Text = "Debug Log (Font)",
		Default = false,
		Callback = function(mcFontDebug)
			tbl2.mcFontDebug = mcFontDebug
		end,
	})

	_G.kickNotifyConnection = nil

	getClosestPlayerKN = function(arg)
		local huge = math.huge
		local v18 = nil

		for _, player in pairs(players:GetPlayers()) do
			if player.Character then
				local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					local magnitude = (humanoidRootPart.Position - arg).Magnitude

					if magnitude < huge then
						huge = magnitude
						v18 = player
					end
				end
			end
		end

		return v18
	end

	KickNotify = function(arg, arg2)
		local v18 = tbl[tbl2.selectedNotificationSound]
		if not v18 then
			return
		end

		pcall(function()
			if not tbl2.notificationSoundEnabled then
				return
			end
			local sound = Instance.new("Sound")
			sound.SoundId = v18
			sound.Volume = 1
			sound.Parent = game:GetService("SoundService")
			sound:Play()

			sound.Ended:Connect(function()
				sound:Destroy()
			end)
		end)

		_NOTIFY(arg, arg2)
	end

	Notifications:AddToggle("KickNotify", {
		Text = "Kick Notify",
		Default = false,
		Callback = function(arg)
			if arg then
				local tbl16 = {
					blackholekick = true,
					["blackholekicktweens(old)"] = true,
					blackholekicktweens = true,
					jhole = true,
					blackhole = true,
					black_hole = true,
					voidhole = true,
					singularity = true,
				}

				_G.kickNotifyConnection = workspace.ChildAdded:Connect(function(child)
					if not child.Name or not tbl16[child.Name:lower()] then
						return
					end
					task.wait(0.1)
					local position

					if child:IsA("BasePart") then
						position = child.Position
					else
						local basePart = child:FindFirstChildWhichIsA("BasePart", true)
						position = nil

						if basePart then
							position = basePart.Position
						end
					end

					if not position then
						return
					end
					local v18 = getClosestPlayerKN(position)
					local str2 = v18 and " by " .. v18.Name or ""
					_NOTIFY("Kick Notify: Kick detected" .. str2, 4)
					KickNotify("Kick Notify: Kick detected" .. str2, 4)
				end)

				_NOTIFY("Kick Notify: Enabled", 2)
			else
				if _G.kickNotifyConnection then
					_G.kickNotifyConnection:Disconnect()
					_G.kickNotifyConnection = nil
				end

				_NOTIFY("Kick Notify: Disabled", 2)
			end
		end,
	})
end

do
	local v16 = tbl15.Visual:AddLeftGroupbox("Location Detector ESP (PCLD)")

	v16:AddToggle("LocationDetector", {
		Text = "Enable PCLD ESP",
		Default = false,
		Callback = function(playerLocationVisualEnabled)
			tbl2.playerLocationVisualEnabled = playerLocationVisualEnabled

			if playerLocationVisualEnabled then
				tbl8.playerLocation = setupPlayerLocationVisual()
			elseif tbl8.playerLocation then
				tbl8.playerLocation()
				tbl8.playerLocation = nil
			end

			_NOTIFY(playerLocationVisualEnabled and "PCLD ESP ON" or "PCLD ESP OFF", 3)
		end,
	}):AddColorPicker("PCLD_Color", {
		Default = Color3.fromRGB(160, 0, 255),
		Title = "PCLD Color",
		Callback = function(locationESPColor)
			tbl2.locationESPColor = locationESPColor
		end,
	})

	local PCLD_GradientEnabled = v16:AddToggle("PCLD_GradientEnabled", {
		Text = "Enable Gradient Color",
		Default = false,
		Callback = function(locationESPGradientEnabled)
			tbl2.locationESPGradientEnabled = locationESPGradientEnabled
		end,
	})

	PCLD_GradientEnabled:AddColorPicker("PCLD_GradientColor1", {
		Default = Color3.fromRGB(160, 0, 255),
		Title = "Gradient Color 1",
		Callback = function(locationESPGradientColor1)
			tbl2.locationESPGradientColor1 = locationESPGradientColor1
		end,
	})

	PCLD_GradientEnabled:AddColorPicker("PCLD_GradientColor2", {
		Default = Color3.fromRGB(0, 230, 255),
		Title = "Gradient Color 2",
		Callback = function(locationESPGradientColor2)
			tbl2.locationESPGradientColor2 = locationESPGradientColor2
		end,
	})

	v16:AddSlider("PCLD_GradientSpeed", {
		Text = "Gradient Cycle Speed",
		Min = 0.1,
		Max = 5,
		Default = 1,
		Rounding = 1,
		Callback = function(locationESPGradientSpeed)
			tbl2.locationESPGradientSpeed = locationESPGradientSpeed
		end,
	})

	v16:AddSlider("PCLD_UIGradientAngle", {
		Text = "Gradient Angle",
		Min = 0,
		Max = 360,
		Default = 0,
		Rounding = 1,
		Callback = function(locationESPUIGradientAngle)
			tbl2.locationESPUIGradientAngle = locationESPUIGradientAngle
		end,
	})

	v16:AddToggle("PCLD_UIGradientAutoRotate", {
		Text = "Gradient Auto Rotate",
		Default = false,
		Callback = function(locationESPUIGradientAutoRotate)
			tbl2.locationESPUIGradientAutoRotate = locationESPUIGradientAutoRotate
		end,
	})

	v16:AddSlider("PCLD_UIGradientAutoSpeed", {
		Text = "Auto Rotate Speed",
		Min = 1,
		Max = 100,
		Default = 20,
		Rounding = 1,
		Callback = function(locationESPUIGradientAutoSpeed)
			tbl2.locationESPUIGradientAutoSpeed = locationESPUIGradientAutoSpeed
		end,
	})

	v16:AddToggle("PCLD_CornerEnabled", {
		Text = "Enable Corner Render",
		Default = true,
		Callback = function(locationESPCornerEnabled)
			tbl2.locationESPCornerEnabled = locationESPCornerEnabled
		end,
	})

	v16:AddSlider("PCLD_Thickness", {
		Text = "Corner Line Thickness",
		Min = 1,
		Max = 10,
		Default = 2,
		Rounding = 1,
		Callback = function(locationESPThickness)
			tbl2.locationESPThickness = locationESPThickness
		end,
	})

	v16:AddSlider("PCLD_CornerRoundness", {
		Text = "Corner Roundness",
		Min = 0,
		Max = 50,
		Default = 0,
		Rounding = 1,
		Callback = function(locationESPCornerRoundness)
			tbl2.locationESPCornerRoundness = locationESPCornerRoundness
		end,
	})

	v16:AddSlider("PCLD_Length", {
		Text = "Corner Line Length",
		Min = 5,
		Max = 50,
		Default = 12,
		Rounding = 1,
		Callback = function(locationESPLength)
			tbl2.locationESPLength = locationESPLength
		end,
	})

	v16:AddSlider("PCLD_RotationSpeed", {
		Text = "Rotation Speed",
		Min = 0,
		Max = 360,
		Default = 90,
		Rounding = 1,
		Callback = function(locationESPRotationSpeed)
			tbl2.locationESPRotationSpeed = locationESPRotationSpeed
		end,
	})

	v16:AddSlider("PCLD_ExpandSpeed", {
		Text = "Breathing Expand Speed",
		Min = 0,
		Max = 10,
		Default = 3,
		Rounding = 1,
		Callback = function(locationESPExpandSpeed)
			tbl2.locationESPExpandSpeed = locationESPExpandSpeed
		end,
	})

	v16:AddSlider("PCLD_MinRadius", {
		Text = "Min Pulse Radius",
		Min = 5,
		Max = 100,
		Default = 15,
		Rounding = 1,
		Callback = function(locationESPMinRadius)
			tbl2.locationESPMinRadius = locationESPMinRadius
		end,
	})

	v16:AddSlider("PCLD_MaxRadius", {
		Text = "Max Pulse Radius",
		Min = 5,
		Max = 150,
		Default = 35,
		Rounding = 1,
		Callback = function(locationESPMaxRadius)
			tbl2.locationESPMaxRadius = locationESPMaxRadius
		end,
	})

	v16:AddToggle("PCLD_CornerOutline", {
		Text = "Corner Outline",
		Default = false,
		Callback = function(locationESPCornerOutlineEnabled)
			tbl2.locationESPCornerOutlineEnabled = locationESPCornerOutlineEnabled
		end,
	}):AddColorPicker("PCLD_CornerOutlineColor", {
		Default = Color3.fromRGB(0, 0, 0),
		Title = "Corner Outline Color",
		Callback = function(locationESPCornerOutlineColor)
			tbl2.locationESPCornerOutlineColor = locationESPCornerOutlineColor
		end,
	})

	v16:AddSlider("PCLD_CornerOutlineThick", {
		Text = "Corner Outline Thickness",
		Min = 1,
		Max = 5,
		Default = 1,
		Rounding = 1,
		Callback = function(locationESPCornerOutlineThicknes)
			tbl2.locationESPCornerOutlineThickness = locationESPCornerOutlineThicknes
		end,
	})

	v16:AddToggle("PCLD_SmoothingEnabled", {
		Text = "Enable Smooth Lerp",
		Default = true,
		Callback = function(locationESPSmoothingEnabled)
			tbl2.locationESPSmoothingEnabled = locationESPSmoothingEnabled
		end,
	})

	v16:AddSlider("PCLD_SmoothingSpeed", {
		Text = "Smoothing Responsiveness",
		Min = 1,
		Max = 50,
		Default = 15,
		Rounding = 1,
		Callback = function(locationESPSmoothingSpeed)
			tbl2.locationESPSmoothingSpeed = locationESPSmoothingSpeed
		end,
	})

	v16:AddToggle("PCLD_PartEnabled", {
		Text = "Enable 3D Part Box",
		Default = false,
		Callback = function(locationESPPartEnabled)
			tbl2.locationESPPartEnabled = locationESPPartEnabled
		end,
	}):AddColorPicker("PCLD_PartColor", {
		Default = Color3.fromRGB(160, 0, 255),
		Title = "Part Box Color",
		Callback = function(locationESPPartColor)
			tbl2.locationESPPartColor = locationESPPartColor
		end,
	})

	v16:AddSlider("PCLD_PartTransparency", {
		Text = "Part Transparency",
		Min = 0,
		Max = 100,
		Default = 70,
		Rounding = 1,
		Callback = function(arg)
			tbl2.locationESPPartTransparency = arg / 100
		end,
	})

	v16:AddDropdown("PCLD_PartMaterial", {
		Text = "Part Material",
		Values = { "Neon", "ForceField", "Glass", "SmoothPlastic", "Metal", "Wood" },
		Default = "Neon",
		Callback = function(locationESPPartMaterial)
			tbl2.locationESPPartMaterial = locationESPPartMaterial
		end,
	})

	v16:AddToggle("PCLD_BoxOutline", {
		Text = "Part Box Outline",
		Default = false,
		Callback = function(locationESPBoxOutlineEnabled)
			tbl2.locationESPBoxOutlineEnabled = locationESPBoxOutlineEnabled
		end,
	}):AddColorPicker("PCLD_BoxOutlineColor", {
		Default = Color3.fromRGB(255, 255, 255),
		Title = "Box Outline Color",
		Callback = function(locationESPBoxOutlineColor)
			tbl2.locationESPBoxOutlineColor = locationESPBoxOutlineColor
		end,
	})

	v16:AddSlider("PCLD_BoxOutlineThick", {
		Text = "Box Outline Thickness",
		Min = 1,
		Max = 100,
		Default = 5,
		Rounding = 1,
		Callback = function(arg)
			tbl2.locationESPBoxOutlineThickness = arg / 100
		end,
	})

	v16:AddToggle("PCLD_TrailEnabled", {
		Text = "Enable Box Trail",
		Default = false,
		Callback = function(locationESPTrailEnabled)
			tbl2.locationESPTrailEnabled = locationESPTrailEnabled
		end,
	}):AddColorPicker("PCLD_TrailColor", {
		Default = Color3.fromRGB(160, 0, 255),
		Title = "Trail Color",
		Callback = function(locationESPTrailColor)
			tbl2.locationESPTrailColor = locationESPTrailColor
		end,
	})

	v16:AddSlider("PCLD_TrailLifetime", {
		Text = "Trail Lifetime",
		Min = 0.1,
		Max = 5,
		Default = 0.5,
		Rounding = 1,
		Callback = function(locationESPTrailLifetime)
			tbl2.locationESPTrailLifetime = locationESPTrailLifetime
		end,
	})

	local PCLD_GlowEnabled = v16:AddToggle("PCLD_GlowEnabled", {
		Text = "Enable Glow",
		Default = false,
		Callback = function(locationESPGlowEnabled)
			tbl2.locationESPGlowEnabled = locationESPGlowEnabled
		end,
	})

	PCLD_GlowEnabled:AddColorPicker("PCLD_GlowColor1", {
		Default = Color3.fromRGB(160, 0, 255),
		Title = "Glow Color 1",
		Callback = function(locationESPGlowColor1)
			tbl2.locationESPGlowColor1 = locationESPGlowColor1
		end,
	})

	PCLD_GlowEnabled:AddColorPicker("PCLD_GlowColor2", {
		Default = Color3.fromRGB(0, 230, 255),
		Title = "Glow Color 2",
		Callback = function(locationESPGlowColor2)
			tbl2.locationESPGlowColor2 = locationESPGlowColor2
		end,
	})

	v16:AddSlider("PCLD_GlowTransparency", {
		Text = "Glow Transparency",
		Min = 0,
		Max = 100,
		Default = 50,
		Rounding = 1,
		Callback = function(arg)
			tbl2.locationESPGlowTransparency = arg / 100
		end,
	})

	v16:AddSlider("PCLD_GlowSize", {
		Text = "Glow Size",
		Min = 0,
		Max = 100,
		Default = 20,
		Rounding = 1,
		Callback = function(locationESPGlowSize)
			tbl2.locationESPGlowSize = locationESPGlowSize
		end,
	})
end

tbl15.Visual:AddLeftGroupbox("Crosshair Control"):AddToggle("ShowCrosshairToggle", {
	Text = "Show Crosshair",
	Default = true,
	Callback = function(enabled)
		pcall(function()
			local crosshairs = localPlayer.PlayerGui:FindFirstChild("Crosshairs")

			if crosshairs then
				crosshairs.Enabled = enabled
			end
		end)
	end,
})

tbl15.ESP:AddLeftGroupbox("Noks Premium ESP"):AddToggle("NoksEspMaster", {
	Text = "Enable Premium ESP",
	Default = false,
	Callback = function(noksEspEnabled)
		tbl2.noksEspEnabled = noksEspEnabled
	end,
})

local v16 = tbl15.ESP:AddLeftGroupbox("Player Box Overlay")

v16:AddToggle("NoksBoxEnable", {
	Text = "Enable Box Render",
	Default = false,
	Callback = function(noksBoxEnable)
		tbl2.noksBoxEnable = noksBoxEnable
	end,
}):AddColorPicker("NoksBoxColor1", {
	Default = Color3.fromRGB(180, 140, 255),
	Title = "Box Color 1",
	Callback = function(noksBoxColor1)
		tbl2.noksBoxColor1 = noksBoxColor1
	end,
})

v16:AddToggle("NoksBoxGradient", {
	Text = "Enable Box Gradient",
	Default = false,
	Callback = function(noksBoxGradient)
		tbl2.noksBoxGradient = noksBoxGradient
	end,
}):AddColorPicker("NoksBoxColor2", {
	Default = Color3.fromRGB(100, 50, 200),
	Title = "Box Color 2",
	Callback = function(noksBoxColor2)
		tbl2.noksBoxColor2 = noksBoxColor2
	end,
})

v16:AddToggle("NoksBoxOutline", {
	Text = "Enable Box Outline",
	Default = false,
	Callback = function(noksBoxOutline)
		tbl2.noksBoxOutline = noksBoxOutline
	end,
}):AddColorPicker("NoksBoxOutlineColor1", {
	Default = Color3.fromRGB(10, 10, 10),
	Title = "Outline Color 1",
	Callback = function(noksBoxOutlineColor1)
		tbl2.noksBoxOutlineColor1 = noksBoxOutlineColor1
	end,
})

v16:AddToggle("NoksBoxOutlineGradient", {
	Text = "Enable Outline Gradient",
	Default = false,
	Callback = function(noksBoxOutlineGradient)
		tbl2.noksBoxOutlineGradient = noksBoxOutlineGradient
	end,
}):AddColorPicker("NoksBoxOutlineColor2", {
	Default = Color3.fromRGB(40, 40, 40),
	Title = "Outline Color 2",
	Callback = function(noksBoxOutlineColor2)
		tbl2.noksBoxOutlineColor2 = noksBoxOutlineColor2
	end,
})

v16:AddSlider("NoksBoxStrokeThickness", {
	Text = "Outline Thickness",
	Min = 1,
	Max = 5,
	Default = 1.5,
	Rounding = 1,
	Callback = function(noksBoxStrokeThickness)
		tbl2.noksBoxStrokeThickness = noksBoxStrokeThickness
	end,
})

v16:AddSlider("NoksBoxStrokeTrans", {
	Text = "Outline Transparency (%)",
	Min = 0,
	Max = 100,
	Default = 30,
	Rounding = 1,
	Callback = function(noksBoxStrokeTrans)
		tbl2.noksBoxStrokeTrans = noksBoxStrokeTrans
	end,
})

v16:AddSlider("NoksBoxCornerRadius", {
	Text = "Box Smooth Corners (px)",
	Min = 0,
	Max = 20,
	Default = 4,
	Rounding = 1,
	Callback = function(noksBoxCornerRadius)
		tbl2.noksBoxCornerRadius = noksBoxCornerRadius
	end,
})

v16:AddSlider("NoksMaxBoxHeight", {
	Text = "Max ESP Box Height (px)",
	Min = 50,
	Max = 1000,
	Default = 350,
	Rounding = 1,
	Callback = function(noksMaxBoxHeight)
		tbl2.noksMaxBoxHeight = noksMaxBoxHeight
	end,
})

do
	local v17 = tbl15.ESP:AddLeftGroupbox("Player Identity Overlay")

	v17:AddToggle("NoksNameEnable", {
		Text = "Enable Text Name",
		Default = false,
		Callback = function(noksNameEnable)
			tbl2.noksNameEnable = noksNameEnable
		end,
	}):AddColorPicker("NoksNameColor", {
		Default = Color3.fromRGB(255, 255, 255),
		Title = "Text Base Color",
		Callback = function(noksNameColor)
			tbl2.noksNameColor = noksNameColor
		end,
	})

	local NoksNameGradient = v17:AddToggle("NoksNameGradient", {
		Text = "Use Seamless Gradient Loop",
		Default = false,
		Callback = function(noksNameGradient)
			tbl2.noksNameGradient = noksNameGradient
		end,
	})

	NoksNameGradient:AddColorPicker("NoksTextGradColor1", {
		Default = Color3.fromRGB(255, 110, 110),
		Title = "Grad Left",
		Callback = function(noksTextGradColor1)
			tbl2.noksTextGradColor1 = noksTextGradColor1
		end,
	})

	NoksNameGradient:AddColorPicker("NoksTextGradColor2", {
		Default = Color3.fromRGB(255, 230, 110),
		Title = "Grad Right",
		Callback = function(noksTextGradColor2)
			tbl2.noksTextGradColor2 = noksTextGradColor2
		end,
	})

	v17:AddSlider("NoksNameScrollSpeed", {
		Text = "Chroma Wave Velocity",
		Min = 1,
		Max = 10,
		Default = 4,
		Rounding = 1,
		Callback = function(noksNameScrollSpeed)
			tbl2.noksNameScrollSpeed = noksNameScrollSpeed
		end,
	})

	v17:AddDropdown("NoksTextFont", {
		Text = "Global Text Font",
		Default = "GothamBold",
		Values = { "GothamBold", "SourceSansBold", "Arcade", "Roboto" },
		Callback = function(noksTextFont)
			tbl2.noksTextFont = noksTextFont
		end,
	})

	v17:AddSlider("NoksTextSize", {
		Text = "Text Font Size",
		Min = 8,
		Max = 16,
		Default = 11,
		Rounding = 1,
		Callback = function(noksTextSize)
			tbl2.noksTextSize = noksTextSize
		end,
	})

	v17:AddSlider("NoksTextStrokeThickness", {
		Text = "Text Shadow Thickness",
		Min = 0.5,
		Max = 3,
		Default = 1,
		Rounding = 1,
		Callback = function(noksTextStrokeThickness)
			tbl2.noksTextStrokeThickness = noksTextStrokeThickness
		end,
	})

	v17:AddSlider("NoksTextStrokeTrans", {
		Text = "Text Shadow Trans (%)",
		Min = 0,
		Max = 100,
		Default = 30,
		Rounding = 1,
		Callback = function(noksTextStrokeTrans)
			tbl2.noksTextStrokeTrans = noksTextStrokeTrans
		end,
	})
end

local v17 = tbl15.ESP:AddLeftGroupbox("Target Tracer Lines")

v17:AddToggle("NoksLineEnable", {
	Text = "Enable Snaplines",
	Default = false,
	Callback = function(noksLineEnable)
		tbl2.noksLineEnable = noksLineEnable
	end,
}):AddColorPicker("NoksLineColor1", {
	Default = Color3.fromRGB(0, 230, 255),
	Title = "Line Color 1",
	Callback = function(noksLineColor1)
		tbl2.noksLineColor1 = noksLineColor1
	end,
})

v17:AddToggle("NoksLineGradient", {
	Text = "Enable Line Gradient",
	Default = false,
	Callback = function(noksLineGradient)
		tbl2.noksLineGradient = noksLineGradient
	end,
}):AddColorPicker("NoksLineColor2", {
	Default = Color3.fromRGB(255, 0, 150),
	Title = "Line Color 2",
	Callback = function(noksLineColor2)
		tbl2.noksLineColor2 = noksLineColor2
	end,
})

v17:AddSlider("NoksLineThickness", {
	Text = "Line Core Width",
	Min = 1,
	Max = 6,
	Default = 2,
	Rounding = 1,
	Callback = function(noksLineThickness)
		tbl2.noksLineThickness = noksLineThickness
	end,
})

v17:AddToggle("NoksLineOutline", {
	Text = "Enable Line Shadow",
	Default = false,
	Callback = function(noksLineOutline)
		tbl2.noksLineOutline = noksLineOutline
	end,
}):AddColorPicker("NoksLineOutlineColor", {
	Default = Color3.fromRGB(0, 0, 0),
	Title = "Line Shadow Color",
	Callback = function(noksLineOutlineColor)
		tbl2.noksLineOutlineColor = noksLineOutlineColor
	end,
})

v17:AddSlider("NoksLineStrokeThickness", {
	Text = "Line Shadow Thickness",
	Min = 1,
	Max = 4,
	Default = 1,
	Rounding = 1,
	Callback = function(noksLineStrokeThickness)
		tbl2.noksLineStrokeThickness = noksLineStrokeThickness
	end,
})

v17:AddDropdown("NoksLineOrigin", {
	Text = "Line Origin Position",
	Default = "Bottom",
	Values = { "Top", "Center", "Bottom", "Mouse" },
	Callback = function(noksLineOrigin)
		tbl2.noksLineOrigin = noksLineOrigin
	end,
})

v17:AddDropdown("NoksLineAttachment", {
	Text = "Line Target Position",
	Default = "Bottom",
	Values = { "Top", "Center", "Bottom" },
	Callback = function(noksLineAttachment)
		tbl2.noksLineAttachment = noksLineAttachment
	end,
})

do
	local v18 = tbl15.ESP:AddRightGroupbox("Indicators & Flags")

	v18:AddToggle("NoksHealthBarEnable", {
		Text = "Enable Premium Health Bar",
		Default = false,
		Callback = function(noksHealthBarEnable)
			tbl2.noksHealthBarEnable = noksHealthBarEnable
		end,
	})

	v18:AddSlider("NoksHealthBarWidth", {
		Text = "Health Bar Width",
		Min = 2,
		Max = 8,
		Default = 3,
		Rounding = 1,
		Callback = function(noksHealthBarWidth)
			tbl2.noksHealthBarWidth = noksHealthBarWidth
		end,
	})

	v18:AddSlider("NoksHealthBarOffset", {
		Text = "Health Bar Offset",
		Min = 4,
		Max = 15,
		Default = 6,
		Rounding = 1,
		Callback = function(noksHealthBarOffset)
			tbl2.noksHealthBarOffset = noksHealthBarOffset
		end,
	})

	v18:AddToggle("NoksHealthTextEnable", {
		Text = "Show Health Percentage Text",
		Default = false,
		Callback = function(noksHealthTextEnable)
			tbl2.noksHealthTextEnable = noksHealthTextEnable
		end,
	})

	local NoksHealthGradient = v18:AddToggle("NoksHealthGradient", {
		Text = "Enable 3-Color Gradient",
		Default = false,
		Callback = function(noksHealthGradient)
			tbl2.noksHealthGradient = noksHealthGradient
		end,
	})

	NoksHealthGradient:AddColorPicker("NoksHealthGrad1", {
		Default = Color3.fromRGB(50, 255, 100),
		Title = "High Health",
		Callback = function(noksHealthGrad1)
			tbl2.noksHealthGrad1 = noksHealthGrad1
		end,
	})

	NoksHealthGradient:AddColorPicker("NoksHealthGrad2", {
		Default = Color3.fromRGB(255, 220, 50),
		Title = "Mid Health",
		Callback = function(noksHealthGrad2)
			tbl2.noksHealthGrad2 = noksHealthGrad2
		end,
	})

	NoksHealthGradient:AddColorPicker("NoksHealthGrad3", {
		Default = Color3.fromRGB(255, 50, 50),
		Title = "Low Health",
		Callback = function(noksHealthGrad3)
			tbl2.noksHealthGrad3 = noksHealthGrad3
		end,
	})

	v18:AddToggle("NoksDistanceEnable", {
		Text = "Show Distance (Studs)",
		Default = false,
		Callback = function(noksDistanceEnable)
			tbl2.noksDistanceEnable = noksDistanceEnable
		end,
	}):AddColorPicker("NoksDistanceColor", {
		Default = Color3.fromRGB(240, 240, 240),
		Title = "Distance Color",
		Callback = function(noksDistanceColor)
			tbl2.noksDistanceColor = noksDistanceColor
		end,
	})

	v18:AddSlider("NoksMaxDistance", {
		Text = "Max Render Distance",
		Min = 100,
		Max = 5000,
		Default = 2000,
		Rounding = 1,
		Callback = function(noksMaxDistance)
			tbl2.noksMaxDistance = noksMaxDistance
		end,
	})

	v18:AddToggle("NoksFlagsEnable", {
		Text = "Enable Premium Flags ESP",
		Default = false,
		Callback = function(noksFlagsEnable)
			tbl2.noksFlagsEnable = noksFlagsEnable
		end,
	})

	v18:AddSlider("NoksFlagSpacing", {
		Text = "Flag Spacing",
		Min = 0,
		Max = 10,
		Default = 2,
		Rounding = 1,
		Callback = function(noksFlagSpacing)
			tbl2.noksFlagSpacing = noksFlagSpacing
		end,
	})

	v18:AddSlider("NoksFlagTextSize", {
		Text = "Flag Text Size",
		Min = 6,
		Max = 16,
		Default = 9,
		Rounding = 1,
		Callback = function(noksFlagTextSize)
			tbl2.noksFlagTextSize = noksFlagTextSize
		end,
	})

	v18:AddToggle("NoksFlagNameEnable", {
		Text = "Show UserID Flag",
		Default = true,
		Callback = function(noksFlagNameEnable)
			tbl2.noksFlagNameEnable = noksFlagNameEnable
		end,
	}):AddColorPicker("NoksFlagNameColor", {
		Default = Color3.fromRGB(220, 220, 220),
		Title = "UserID Color",
		Callback = function(noksFlagNameColor)
			tbl2.noksFlagNameColor = noksFlagNameColor
		end,
	})

	v18:AddToggle("NoksFlagWeaponEnable", {
		Text = "Show Weapon Flag",
		Default = true,
		Callback = function(noksFlagWeaponEnable)
			tbl2.noksFlagWeaponEnable = noksFlagWeaponEnable
		end,
	}):AddColorPicker("NoksFlagWeaponColor", {
		Default = Color3.fromRGB(200, 200, 200),
		Title = "Weapon Color",
		Callback = function(noksFlagWeaponColor)
			tbl2.noksFlagWeaponColor = noksFlagWeaponColor
		end,
	})

	v18:AddToggle("NoksFlagStateEnable", {
		Text = "Show State Flag",
		Default = true,
		Callback = function(noksFlagStateEnable)
			tbl2.noksFlagStateEnable = noksFlagStateEnable
		end,
	}):AddColorPicker("NoksFlagStateColor", {
		Default = Color3.fromRGB(255, 150, 50),
		Title = "State Color",
		Callback = function(noksFlagStateColor)
			tbl2.noksFlagStateColor = noksFlagStateColor
		end,
	})
end

do
	local v18 = tbl15.ESP:AddRightGroupbox("Box Internal Fill")

	v18:AddToggle("NoksBoxFill", {
		Text = "Use Translucent Fill",
		Default = false,
		Callback = function(noksBoxFill)
			tbl2.noksBoxFill = noksBoxFill
		end,
	})

	local NoksGradientFill = v18:AddToggle("NoksGradientFill", {
		Text = "Use Gradient Fill",
		Default = false,
		Callback = function(noksGradientFill)
			tbl2.noksGradientFill = noksGradientFill
		end,
	})

	NoksGradientFill:AddColorPicker("NoksGradientColor1", {
		Default = Color3.fromRGB(140, 90, 255),
		Title = "Gradient Node 1",
		Callback = function(noksGradientColor1)
			tbl2.noksGradientColor1 = noksGradientColor1
		end,
	})

	NoksGradientFill:AddColorPicker("NoksGradientColor2", {
		Default = Color3.fromRGB(0, 230, 255),
		Title = "Gradient Node 2",
		Callback = function(noksGradientColor2)
			tbl2.noksGradientColor2 = noksGradientColor2
		end,
	})

	v18:AddSlider("NoksBoxFillOpacity1", {
		Text = "Node 1 Opacity (%)",
		Min = 0,
		Max = 100,
		Default = 25,
		Rounding = 1,
		Callback = function(noksBoxFillOpacity1)
			tbl2.noksBoxFillOpacity1 = noksBoxFillOpacity1
		end,
	})

	v18:AddSlider("NoksBoxFillOpacity2", {
		Text = "Node 2 Opacity (%)",
		Min = 0,
		Max = 100,
		Default = 5,
		Rounding = 1,
		Callback = function(noksBoxFillOpacity2)
			tbl2.noksBoxFillOpacity2 = noksBoxFillOpacity2
		end,
	})

	v18:AddToggle("NoksGradientRotate", {
		Text = "Auto Rotate Spectrum",
		Default = false,
		Callback = function(noksGradientRotate)
			tbl2.noksGradientRotate = noksGradientRotate
		end,
	})

	v18:AddSlider("NoksRotateSpeed", {
		Text = "Rotation Velocity",
		Min = 1,
		Max = 10,
		Default = 3,
		Rounding = 1,
		Callback = function(noksRotateSpeed)
			tbl2.noksRotateSpeed = noksRotateSpeed
		end,
	})
end

local v18 = tbl15.ESP:AddRightGroupbox("Cinematic Effects")

v18:AddToggle("NoksFadeOutEnable", {
	Text = "Player Death Fade Out",
	Default = false,
	Callback = function(noksFadeOutEnable)
		tbl2.noksFadeOutEnable = noksFadeOutEnable
	end,
})

v18:AddSlider("NoksFadeDuration", {
	Text = "Fade Out Speed (Seconds)",
	Min = 0.2,
	Max = 5,
	Default = 1.2,
	Rounding = 1,
	Callback = function(noksFadeDuration)
		tbl2.noksFadeDuration = noksFadeDuration
	end,
})

do
	local v19 = tbl15.ESP:AddRightGroupbox("Premium Glow Chams")

	local NoksChamsEnable = v19:AddToggle("NoksChamsEnable", {
		Text = "Enable Character Chams",
		Default = false,
		Callback = function(noksChamsEnable)
			tbl2.noksChamsEnable = noksChamsEnable
		end,
	})

	NoksChamsEnable:AddColorPicker("NoksChamsFillColor", {
		Default = Color3.fromRGB(140, 90, 255),
		Title = "Chams Fill",
		Callback = function(noksChamsFillColor)
			tbl2.noksChamsFillColor = noksChamsFillColor
		end,
	})

	NoksChamsEnable:AddColorPicker("NoksChamsOutlineColor", {
		Default = Color3.fromRGB(255, 255, 255),
		Title = "Chams Outline",
		Callback = function(noksChamsOutlineColor)
			tbl2.noksChamsOutlineColor = noksChamsOutlineColor
		end,
	})

	v19:AddSlider("NoksChamsFillTransparency", {
		Text = "Fill Opacity (%)",
		Min = 0,
		Max = 100,
		Default = 50,
		Rounding = 1,
		Callback = function(noksChamsFillTransparency)
			tbl2.noksChamsFillTransparency = noksChamsFillTransparency
		end,
	})

	v19:AddSlider("NoksChamsOutlineTransparency", {
		Text = "Outline Opacity (%)",
		Min = 0,
		Max = 100,
		Default = 0,
		Rounding = 1,
		Callback = function(noksChamsOutlineTransparency)
			tbl2.noksChamsOutlineTransparency = noksChamsOutlineTransparency
		end,
	})

	v19:AddDropdown("NoksChamsOcclusion", {
		Text = "Occlusion Mode",
		Default = "Always See",
		Values = { "Always See", "Behind Wall Only" },
		Callback = function(noksChamsOcclusion)
			tbl2.noksChamsOcclusion = noksChamsOcclusion
		end,
	})
end

do
	local v19 = tbl15.ESP:AddRightGroupbox("Skeleton Settings")

	v19:AddToggle("NoksSkeletonEnable", {
		Text = "Enable Skeleton ESP",
		Default = false,
		Callback = function(noksSkeletonEnable)
			tbl2.noksSkeletonEnable = noksSkeletonEnable
		end,
	})

	v19:AddSlider("NoksSkeletonThickness", {
		Text = "Bone Width",
		Min = 1,
		Max = 5,
		Default = 2,
		Rounding = 1,
		Callback = function(noksSkeletonThickness)
			tbl2.noksSkeletonThickness = noksSkeletonThickness
		end,
	})

	local NoksSkeletonGradient = v19:AddToggle("NoksSkeletonGradient", {
		Text = "Enable Bone Gradient",
		Default = false,
		Callback = function(noksSkeletonGradient)
			tbl2.noksSkeletonGradient = noksSkeletonGradient
		end,
	})

	NoksSkeletonGradient:AddColorPicker("NoksSkeletonColor1", {
		Default = Color3.fromRGB(180, 140, 255),
		Title = "Bone Color 1",
		Callback = function(noksSkeletonColor1)
			tbl2.noksSkeletonColor1 = noksSkeletonColor1
		end,
	})

	NoksSkeletonGradient:AddColorPicker("NoksSkeletonColor2", {
		Default = Color3.fromRGB(0, 230, 255),
		Title = "Bone Color 2",
		Callback = function(noksSkeletonColor2)
			tbl2.noksSkeletonColor2 = noksSkeletonColor2
		end,
	})

	v19:AddToggle("NoksSkeletonScroll", {
		Text = "Chroma Wave Animation",
		Default = false,
		Callback = function(noksSkeletonScroll)
			tbl2.noksSkeletonScroll = noksSkeletonScroll
		end,
	})

	v19:AddSlider("NoksSkeletonScrollSpeed", {
		Text = "Wave Speed",
		Min = 1,
		Max = 10,
		Default = 4,
		Rounding = 1,
		Callback = function(noksSkeletonScrollSpeed)
			tbl2.noksSkeletonScrollSpeed = noksSkeletonScrollSpeed
		end,
	})
end

local tbl16 = {}

lcUpsert = function(arg, name, arg2)
	local Lighting = game:GetService("Lighting")

	if tbl16[name] then
		pcall(function()
			tbl16[name]:Destroy()
		end)
	end

	local instance = Instance.new(arg)
	instance.Name = name

	for k, v19 in pairs(arg2) do
		pcall(function()
			instance[k] = v19
		end)
	end

	instance.Parent = Lighting
	tbl16[name] = instance
	return instance
end

do
	local ColorCorrectionEffect = lcUpsert("ColorCorrectionEffect", "_ph_cc", {
		TintColor = Color3.fromRGB(255, 255, 255),
		Saturation = 0,
		Contrast = 0,
		Brightness = 0,
		Enabled = false,
	})

	local BloomEffect = lcUpsert("BloomEffect", "_ph_bloom", { Intensity = 0.5, Size = 24, Threshold = 0.9, Enabled = false })
	local SunRaysEffect = lcUpsert("SunRaysEffect", "_ph_sun", { Intensity = 0.1, Spread = 0.5, Enabled = false })
	local DepthOfFieldEffect = lcUpsert("DepthOfFieldEffect", "_ph_dof", { FarIntensity = 0, FocusDistance = 50, InFocusRadius = 10, NearIntensity = 1, Enabled = false })
	local BlurEffect = lcUpsert("BlurEffect", "_ph_blur", { Size = 0, Enabled = false })

	lcDisableAll = function()
		ColorCorrectionEffect.Enabled = false
		BloomEffect.Enabled = false
		SunRaysEffect.Enabled = false
		DepthOfFieldEffect.Enabled = false
		BlurEffect.Enabled = false
	end

	lcApplyPreset = function(arg)
		lcDisableAll()

		if arg.cc then
			ColorCorrectionEffect.TintColor = arg.cc.tint or Color3.fromRGB(255, 255, 255)
			ColorCorrectionEffect.Saturation = arg.cc.sat or 0
			ColorCorrectionEffect.Contrast = arg.cc.con or 0
			ColorCorrectionEffect.Brightness = arg.cc.bri or 0
			ColorCorrectionEffect.Enabled = true
		end

		if arg.bloom then
			BloomEffect.Intensity = arg.bloom.int or 0.5
			BloomEffect.Size = arg.bloom.size or 24
			BloomEffect.Threshold = arg.bloom.thresh or 0.9
			BloomEffect.Enabled = true
		end

		if arg.sun then
			SunRaysEffect.Intensity = arg.sun.int or 0.1
			SunRaysEffect.Spread = arg.sun.spread or 0.5
			SunRaysEffect.Enabled = true
		end

		if arg.dof then
			DepthOfFieldEffect.FarIntensity = arg.dof.far or 0
			DepthOfFieldEffect.NearIntensity = arg.dof.near or 1
			DepthOfFieldEffect.FocusDistance = arg.dof.dist or 50
			DepthOfFieldEffect.InFocusRadius = arg.dof.rad or 10
			DepthOfFieldEffect.Enabled = true
		end

		if arg.blur then
			BlurEffect.Size = arg.blur.size or 0
			BlurEffect.Enabled = true
		end
	end

	local tbl17 = {}

	local tbl18 = {
		name = "Winter",
		data = {
			cc = { tint = Color3.fromRGB(180, 200, 255), sat = 0.1, con = 0.2, bri = 0.05 },
			bloom = { int = 0.6, size = 24, thresh = 0.7 },
			sun = { int = 0.1, spread = 0.5 },
		},
	}

	local tbl19 = {
		name = "Sunset",
		data = {
			cc = { tint = Color3.fromRGB(255, 160, 80), sat = 0.35, con = 0.2, bri = 0.1 },
			bloom = { int = 1, size = 32, thresh = 0.55 },
			sun = { int = 0.3, spread = 0.85 },
		},
	}

	local tbl20 = {
		name = "Night",
		data = {
			cc = { tint = Color3.fromRGB(100, 110, 180), sat = -0.2, con = 0.25, bri = -0.3 },
			bloom = { int = 0.3, size = 16, thresh = 0.8 },
		},
	}

	local tbl21 = {
		name = "Horror",
		data = {
			cc = { tint = Color3.fromRGB(180, 100, 100), sat = -0.7, con = 0.5, bri = -0.25 },
			bloom = { int = 0.15, size = 8, thresh = 0.95 },
			blur = { size = 4 },
		},
	}

	local tbl22 = {
		name = "Vivid",
		data = {
			cc = { tint = Color3.fromRGB(255, 255, 255), sat = 0.9, con = 0.3, bri = 0.15 },
			bloom = { int = 1.5, size = 40, thresh = 0.5 },
			sun = { int = 0.2, spread = 0.6 },
		},
	}

	local tbl23 = {
		name = "Cinema",
		data = {
			cc = { tint = Color3.fromRGB(240, 230, 200), sat = -0.1, con = 0.4, bri = -0.05 },
			bloom = { int = 0.4, size = 20, thresh = 0.85 },
			dof = { far = 0.6, near = 0, dist = 30, rad = 12 },
		},
	}

	local tbl24 = {
		name = "Underwater",
		data = {
			cc = { tint = Color3.fromRGB(80, 160, 200), sat = 0.2, con = -0.1, bri = -0.1 },
			bloom = { int = 0.8, size = 30, thresh = 0.6 },
			blur = { size = 8 },
		},
	}

	local tbl25 = {
		name = "Cyberpunk",
		data = {
			cc = { tint = Color3.fromRGB(160, 100, 255), sat = 0.6, con = 0.45, bri = -0.1 },
			bloom = { int = 2, size = 48, thresh = 0.4 },
			sun = { int = 0.05, spread = 0.3 },
		},
	}

	local tbl26 = {
		name = "Foggy",
		data = {
			cc = { tint = Color3.fromRGB(210, 215, 220), sat = -0.3, con = 0.1, bri = 0.1 },
			bloom = { int = 0.3, size = 24, thresh = 0.7 },
			blur = { size = 12 },
		},
	}

	local tbl27 = {
		name = "Autumn",
		data = {
			cc = { tint = Color3.fromRGB(255, 190, 100), sat = 0.4, con = 0.15, bri = 0.05 },
			bloom = { int = 0.5, size = 20, thresh = 0.75 },
			sun = { int = 0.15, spread = 0.6 },
		},
	}

	local tbl28 = {
		name = "Nature",
		data = {
			cc = { tint = Color3.fromRGB(200, 240, 180), sat = 0.5, con = 0.1, bri = 0.1 },
			bloom = { int = 0.7, size = 28, thresh = 0.65 },
			sun = { int = 0.2, spread = 0.7 },
		},
	}

	tbl17[1] = { name = "Reset", data = {} }
	tbl17[2] = tbl18
	tbl17[3] = tbl19
	tbl17[4] = tbl20
	tbl17[5] = tbl21
	tbl17[6] = tbl22
	tbl17[7] = tbl23
	tbl17[8] = tbl24
	tbl17[9] = tbl25
	tbl17[10] = tbl26
	tbl17[11] = tbl27
	tbl17[12] = tbl28
	local v19 = tbl15.Lighting:AddLeftGroupbox("Lighting Changer")
	local v20 = tbl15.Lighting:AddRightGroupbox("Lighting Controls")

	for _, v21 in ipairs(tbl17) do
		local v22 = v21

		v19:AddButton({
			Text = v22.name,
			Func = function()
				lcApplyPreset(v22.data)
			end,
		})
	end

	v19:AddButton({
		Text = "Random",
		Func = function()
			lcApplyPreset(tbl17[math.random(2, #tbl17)].data)
		end,
	})

	v19:AddButton({ Text = "Disable All Effects", Func = lcDisableAll })

	v20:AddToggle("lc_cc_on", {
		Text = "Color Correction",
		Default = false,
		Callback = function(enabled)
			ColorCorrectionEffect.Enabled = enabled
		end,
	}):AddColorPicker("lc_cc_tint", {
		Default = Color3.fromRGB(255, 255, 255),
		Title = "Tint Color",
		Callback = function(tintColor)
			ColorCorrectionEffect.TintColor = tintColor
		end,
	})

	v20:AddSlider("lc_cc_sat", {
		Text = "Saturation",
		Default = 0,
		Min = -100,
		Max = 200,
		Rounding = 0,
		Callback = function(arg)
			ColorCorrectionEffect.Saturation = arg / 100
		end,
	})

	v20:AddSlider("lc_cc_con", {
		Text = "Contrast",
		Default = 0,
		Min = -100,
		Max = 200,
		Rounding = 0,
		Callback = function(arg)
			ColorCorrectionEffect.Contrast = arg / 100
		end,
	})

	v20:AddSlider("lc_cc_bri", {
		Text = "Brightness",
		Default = 0,
		Min = -100,
		Max = 200,
		Rounding = 0,
		Callback = function(arg)
			ColorCorrectionEffect.Brightness = arg / 100
		end,
	})

	v20:AddDivider()

	v20:AddToggle("lc_bloom_on", {
		Text = "Bloom",
		Default = false,
		Callback = function(enabled)
			BloomEffect.Enabled = enabled
		end,
	})

	v20:AddSlider("lc_bloom_int", {
		Text = "Bloom Intensity",
		Default = 50,
		Min = 0,
		Max = 1000,
		Rounding = 0,
		Callback = function(arg)
			BloomEffect.Intensity = arg / 100
		end,
	})

	v20:AddSlider("lc_bloom_size", {
		Text = "Bloom Size",
		Default = 24,
		Min = 0,
		Max = 56,
		Rounding = 0,
		Callback = function(size)
			BloomEffect.Size = size
		end,
	})

	v20:AddSlider("lc_bloom_thresh", {
		Text = "Bloom Threshold",
		Default = 90,
		Min = 0,
		Max = 200,
		Rounding = 0,
		Callback = function(arg)
			BloomEffect.Threshold = arg / 100
		end,
	})

	v20:AddDivider()

	v20:AddToggle("lc_sun_on", {
		Text = "Sun Rays",
		Default = false,
		Callback = function(enabled)
			SunRaysEffect.Enabled = enabled
		end,
	})

	v20:AddSlider("lc_sun_int", {
		Text = "Sun Intensity",
		Default = 10,
		Min = 0,
		Max = 100,
		Rounding = 0,
		Callback = function(arg)
			SunRaysEffect.Intensity = arg / 100
		end,
	})

	v20:AddSlider("lc_sun_spread", {
		Text = "Sun Spread",
		Default = 50,
		Min = 0,
		Max = 100,
		Rounding = 0,
		Callback = function(arg)
			SunRaysEffect.Spread = arg / 100
		end,
	})

	v20:AddDivider()

	v20:AddToggle("lc_dof_on", {
		Text = "Depth of Field",
		Default = false,
		Callback = function(enabled)
			DepthOfFieldEffect.Enabled = enabled
		end,
	})

	v20:AddSlider("lc_dof_far", {
		Text = "DOF Far",
		Default = 0,
		Min = 0,
		Max = 100,
		Rounding = 0,
		Callback = function(arg)
			DepthOfFieldEffect.FarIntensity = arg / 100
		end,
	})

	v20:AddSlider("lc_dof_near", {
		Text = "DOF Near",
		Default = 100,
		Min = 0,
		Max = 100,
		Rounding = 0,
		Callback = function(arg)
			DepthOfFieldEffect.NearIntensity = arg / 100
		end,
	})

	v20:AddSlider("lc_dof_dist", {
		Text = "Focus Distance",
		Default = 50,
		Min = 0,
		Max = 500,
		Rounding = 0,
		Callback = function(focusDistance)
			DepthOfFieldEffect.FocusDistance = focusDistance
		end,
	})

	v20:AddSlider("lc_dof_rad", {
		Text = "Focus Radius",
		Default = 10,
		Min = 0,
		Max = 100,
		Rounding = 0,
		Callback = function(inFocusRadius)
			DepthOfFieldEffect.InFocusRadius = inFocusRadius
		end,
	})

	v20:AddDivider()

	v20:AddToggle("lc_blur_on", {
		Text = "Motion Blur",
		Default = false,
		Callback = function(enabled)
			BlurEffect.Enabled = enabled
		end,
	})

	v20:AddSlider("lc_blur_size", {
		Text = "Blur Size",
		Default = 0,
		Min = 0,
		Max = 56,
		Rounding = 0,
		Callback = function(size)
			BlurEffect.Size = size
		end,
	})

	local v21 = tbl15.Lighting:AddRightGroupbox("Time & Ambient Aesthetics")

	v21:AddSlider("lc_clock_time", {
		Text = "Time of Day",
		Min = 0,
		Max = 24,
		Default = 14,
		Rounding = 1,
		Callback = function(clockTime)
			game:GetService("Lighting").ClockTime = clockTime
		end,
	})

	v21:AddToggle("lc_rgb_ambient", {
		Text = "Rainbow Ambient",
		Default = false,
		Callback = function(rgbAmbientEnabled)
			tbl2.rgbAmbientEnabled = rgbAmbientEnabled
		end,
	})

	v21:AddSlider("lc_rgb_speed", {
		Text = "Rainbow Ambient Speed",
		Min = 0.1,
		Max = 5,
		Default = 1,
		Rounding = 1,
		Callback = function(rgbAmbientSpeed)
			tbl2.rgbAmbientSpeed = rgbAmbientSpeed
		end,
	})

	runService.RenderStepped:Connect(function()
		if tbl2.rgbAmbientEnabled then
			local color = Color3.fromHSV(tick() * (tbl2.rgbAmbientSpeed or 1) * 0.1 % 1, 1, 1)
			game:GetService("Lighting").Ambient = color
			game:GetService("Lighting").OutdoorAmbient = color
		end
	end)

	local flag2 = false
	local tbl29 = { "_ph_cc", "_ph_bloom", "_ph_sun", "_ph_dof", "_ph_blur" }

	runService.RenderStepped:Connect(function()
		if flag2 then
			return
		end
		local Lighting = game:GetService("Lighting")

		for _, v22 in ipairs(tbl29) do
			if not Lighting:FindFirstChild(v22) then
				flag2 = true

				pcall(function()
					if v22 == "_ph_cc" then
						ColorCorrectionEffect = lcUpsert("ColorCorrectionEffect", v22, { Enabled = false })
					elseif v22 == "_ph_bloom" then
						BloomEffect = lcUpsert("BloomEffect", v22, { Enabled = false })
					elseif v22 == "_ph_sun" then
						SunRaysEffect = lcUpsert("SunRaysEffect", v22, { Enabled = false })
					elseif v22 == "_ph_dof" then
						DepthOfFieldEffect = lcUpsert("DepthOfFieldEffect", v22, { Enabled = false })
					elseif v22 == "_ph_blur" then
						BlurEffect = lcUpsert("BlurEffect", v22, { Enabled = false })
					end
				end)

				task.wait(0.5)
				flag2 = false
				break
			end
		end
	end)
end

do
	local tbl17 = {
		Rate = 60,
		SpeedMin = 10,
		SpeedMax = 20,
		LifeMin = 4,
		LifeMax = 10,
		SizeStart = 0.3,
		SizeEnd = 0.15,
		Height = 60,
		PartSize = 300,
		Gravity = 5,
		Spread = 8,
		Color = Color3.new(1, 1, 1),
		Count = 20,
	}

	local model = nil
	local part_4 = nil
	local tbl18 = {}
	local flag2 = false

	destroySnow = function()
		if model then
			pcall(function()
				model:Destroy()
			end)
		end

		model = nil
		part_4 = nil
		tbl18 = {}
		flag2 = false
	end

	buildSnow = function()
		destroySnow()
		model = Instance.new("Model", workspace)
		model.Name = "_PoophubSnowSystem"
		part_4 = Instance.new("Part", model)
		part_4.Name = "SNOWPART"
		part_4.Anchored = true
		part_4.CanCollide = false
		part_4.Transparency = 1
		part_4.Size = Vector3.new(tbl17.PartSize, 1, tbl17.PartSize)

		mk = function()
			local particleEmitter = Instance.new("ParticleEmitter", part_4)
			particleEmitter.Texture = "rbxassetid://118641183"
			particleEmitter.Color = ColorSequence.new(tbl17.Color)
			particleEmitter.Enabled = true
			particleEmitter.Rate = tbl17.Rate
			particleEmitter.Speed = NumberRange.new(tbl17.SpeedMin, tbl17.SpeedMax)
			particleEmitter.Lifetime = NumberRange.new(tbl17.LifeMin, tbl17.LifeMax)
			particleEmitter.Size = NumberSequence.new(tbl17.SizeStart, tbl17.SizeEnd)
			particleEmitter.Transparency = NumberSequence.new(0, 1)
			particleEmitter.EmissionDirection = Enum.NormalId.Bottom
			particleEmitter.Shape = Enum.ParticleEmitterShape.Box
			particleEmitter.Acceleration = Vector3.new(0, -tbl17.Gravity, 0)
			particleEmitter.Drag = 1
			particleEmitter.LightInfluence = 1
			particleEmitter.Rotation = NumberRange.new(0, 360)
			particleEmitter.SpreadAngle = Vector2.new(tbl17.Spread, tbl17.Spread)
			return particleEmitter
		end

		for i = 1, tbl17.Count do
			table.insert(tbl18, mk())
		end

		flag2 = true
	end

	applySnowParams = function()
		for _, v19 in ipairs(tbl18) do
			pcall(function()
				v19.Rate = tbl17.Rate
				v19.Color = ColorSequence.new(tbl17.Color)
				v19.Speed = NumberRange.new(tbl17.SpeedMin, tbl17.SpeedMax)
				v19.Lifetime = NumberRange.new(tbl17.LifeMin, tbl17.LifeMax)
				v19.Size = NumberSequence.new(tbl17.SizeStart, tbl17.SizeEnd)
				v19.Acceleration = Vector3.new(0, -tbl17.Gravity, 0)
				v19.SpreadAngle = Vector2.new(tbl17.Spread, tbl17.Spread)
			end)
		end
	end

	runService.Heartbeat:Connect(function()
		if not flag2 or not part_4 then
			return
		end
		local character = localPlayer.Character
		if not character then
			return
		end
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

		if humanoidRootPart then
			part_4.CFrame = CFrame.new(humanoidRootPart.Position.X, humanoidRootPart.Position.Y + tbl17.Height, humanoidRootPart.Position.Z)
		end
	end)

	local v19 = tbl15.Lighting:AddLeftGroupbox("Snow System")

	v19:AddToggle("SnowToggle", {
		Text = "Enable Snow",
		Default = false,
		Callback = function(arg)
			if arg then
				buildSnow()
			else
				destroySnow()
			end
		end,
	})

	v19:AddSlider("SnowRate", {
		Text = "Particle Rate",
		Default = 60,
		Min = 10,
		Max = 300,
		Rounding = 0,
		Callback = function(rate)
			tbl17.Rate = rate
			applySnowParams()
		end,
	})

	v19:AddSlider("SnowSpeedMin", {
		Text = "Speed Min",
		Default = 10,
		Min = 1,
		Max = 50,
		Rounding = 0,
		Callback = function(speedMin)
			tbl17.SpeedMin = speedMin
			applySnowParams()
		end,
	})

	v19:AddSlider("SnowSpeedMax", {
		Text = "Speed Max",
		Default = 20,
		Min = 1,
		Max = 100,
		Rounding = 0,
		Callback = function(speedMax)
			tbl17.SpeedMax = speedMax
			applySnowParams()
		end,
	})

	v19:AddSlider("SnowHeight", {
		Text = "Spawn Height",
		Default = 60,
		Min = 20,
		Max = 200,
		Rounding = 0,
		Callback = function(height)
			tbl17.Height = height
		end,
	})

	v19:AddSlider("SnowGravity", {
		Text = "Gravity",
		Default = 5,
		Min = 0,
		Max = 30,
		Rounding = 0,
		Callback = function(gravity_)
			tbl17.Gravity = gravity_
			applySnowParams()
		end,
	})

	v19:AddSlider("SnowSpread", {
		Text = "Wind Spread",
		Default = 8,
		Min = 0,
		Max = 45,
		Rounding = 0,
		Callback = function(spread)
			tbl17.Spread = spread
			applySnowParams()
		end,
	})

	v19:AddSlider("SnowSizeStart", {
		Text = "Flake Size",
		Default = 30,
		Min = 5,
		Max = 200,
		Rounding = 0,
		Callback = function(arg)
			tbl17.SizeStart = arg / 100
			applySnowParams()
		end,
	})

	v19:AddLabel("Flake Color"):AddColorPicker("SnowColor", {
		Default = Color3.new(1, 1, 1),
		Title = "Snow Color",
		Callback = function(color)
			tbl17.Color = color
			applySnowParams()
		end,
	})
end

local Dance = tbl15.Fun:AddLeftGroupbox("Dance")

Dance:AddDropdown("DanceType", {
	Text = "Dance Type",
	Values = Fun.danceNames,
	Default = 1,
	Callback = function(selectedDance)
		tbl2.selectedDance = selectedDance
		Fun.selectedDance = selectedDance

		if tbl2.danceEnabled then
			local v19 = getChar()

			if v19 then
				Fun.playSelectedDance(v19)
			end
		end
	end,
})

Dance:AddSlider("DanceIntensity", {
	Text = "Dance Intensity",
	Default = 1,
	Min = 0.1,
	Max = 3,
	Rounding = 1,
	Callback = function(danceIntensity)
		tbl2.danceIntensity = danceIntensity
	end,
})

Dance:AddToggle("RagdollDance", {
	Text = "Ragdoll Dance ON/OFF",
	Default = false,
	Callback = function(danceEnabled)
		tbl2.danceEnabled = danceEnabled
		UpdateRagdollState()

		if danceEnabled then
			local v19 = getChar()

			if v19 then
				Fun.playSelectedDance(v19)
			end
		else
			Fun.stopPose()
		end
	end,
})

local v19 = tbl15.Fun:AddLeftGroupbox("Dance V2")

v19:AddDropdown("DanceV2Dropdown", {
	Values = { "Click Refresh..." },
	Default = 1,
	Multi = false,
	Searchable = true,
	Text = "Select Dance V2",
	Callback = function(selectedDanceNameV2)
		if selectedDanceNameV2 == "Click Refresh..." or selectedDanceNameV2 == "No dances found" or selectedDanceNameV2 == "" then
			return
		end
		Fun.selectedDanceNameV2 = selectedDanceNameV2
		local v20 = Fun.currentDanceRawTableV2[selectedDanceNameV2]

		if v20 then
			local ok2, activeDanceDataV2 = pcall(function()
				return game:GetService("HttpService"):JSONDecode(v20)
			end)

			if ok2 then
				Fun.activeDanceDataV2 = activeDanceDataV2

				if Fun.isDancingV2 and Fun.me.Character then
					Fun.startHipDanceV2(Fun.me.Character)
				end
			else
				_NOTIFY("鬮ｫ・ｨ繝ｻ・ｶ驛｢譎｢・ｽ・ｻFailed to parse JSON", 3)
				Fun.activeDanceDataV2 = nil
			end
		end
	end,
})

v19:AddToggle("DanceV2Toggle", {
	Text = "Enable Dance V2",
	Default = false,
	Callback = function(isDancingV2)
		Fun.isDancingV2 = isDancingV2

		if isDancingV2 then
			if Fun.activeDanceDataV2 and Fun.me.Character then
				Fun.startHipDanceV2(Fun.me.Character)
			else
				_NOTIFY("鬮ｫ・ｨ繝ｻ・ｶ驛｢譎｢・ｽ・ｻNo dance data selected/loaded", 3)
				toggles.DanceV2Toggle:SetValue(false)
			end
		else
			Fun.stopHipDanceV2(Fun.me.Character)
		end
	end,
})

v19:AddButton({
	Text = "Refresh List",
	Func = function()
		Fun.refreshDanceV2List()
		_NOTIFY("Dance list refreshed", 3)
	end,
})

Fun.refreshDanceV2List()

do
	local v20 = tbl15.Fun:AddRightGroupbox("Custom Toy Attachments")

	local ToyTargetPlayer = v20:AddDropdown("ToyTargetPlayer", {
		Text = "Target Player",
		Values = GetPlayerListDisplay(),
		Default = 1,
		Callback = function(arg)
			local v21 = ExtractUsername(arg)

			if v21 then
				Fun.SelectedPlayerForToy = players:FindFirstChild(v21)
			end
		end,
	})

	setupAutoRefresh(ToyTargetPlayer)

	v20:AddButton({
		Text = "Pencil Dick (Custom)",
		Func = function()
			Fun.spawnAndAttachToy("ToolPencil")
		end,
	})

	v20:AddLabel("Pencil tip: x=free, y=180, z=free")

	v20:AddButton({
		Text = "Kunai Dick Execute (Custom)",
		Func = function()
			Fun.spawnAndAttachToy("NinjaKunai")
		end,
	})

	v20:AddLabel("Kunai tip: x=free, y=90, z=free")

	v20:AddButton({
		Text = "Katana Dick Execute (Test)",
		Func = function()
			Fun.spawnAndAttachToy("NinjaKatana")
		end,
	})

	v20:AddSlider("ToyAttachRotX", {
		Text = "X Axis Rotation",
		Min = -180,
		Max = 180,
		Default = 0,
		Rounding = 0,
		Callback = function(rotationX)
			Fun.rotationX = rotationX
		end,
	})

	v20:AddSlider("ToyAttachRotY", {
		Text = "Y Axis Rotation",
		Min = -180,
		Max = 180,
		Default = 90,
		Rounding = 0,
		Callback = function(rotationY)
			Fun.rotationY = rotationY
		end,
	})

	v20:AddSlider("ToyAttachRotZ", {
		Text = "Z Axis Rotation",
		Min = -180,
		Max = 180,
		Default = 25,
		Rounding = 0,
		Callback = function(rotationZ)
			Fun.rotationZ = rotationZ
		end,
	})
end

local Animations = tbl15.Fun:AddRightGroupbox("Animations")

Animations:AddSlider("AnimSpeed", {
	Text = "Animation Speed",
	Min = 1,
	Max = 100,
	Default = 1,
	Rounding = 0,
	Callback = function(animationSpeed)
		Fun.animationSpeed = animationSpeed

		if Fun.typingTrack then
			Fun.typingTrack:AdjustSpeed(animationSpeed)
		end

		if Fun.crouchTrack then
			Fun.crouchTrack:AdjustSpeed(animationSpeed)
		end

		if Fun.throwedTrack then
			Fun.throwedTrack:AdjustSpeed(animationSpeed)
		end

		if Fun.swayTrack then
			Fun.swayTrack:AdjustSpeed(animationSpeed)
		end

		if Fun.jerkoffTrack then
			Fun.jerkoffTrack:AdjustSpeed(animationSpeed)
		end

		if Fun.jerkoffTrack2 then
			Fun.jerkoffTrack2:AdjustSpeed(animationSpeed)
		end
	end,
})

Animations:AddToggle("FakeKeyboard", {
	Text = "Fake Keyboard",
	Default = false,
	Callback = function(arg)
		local characterEvents = replicatedStorage:FindFirstChild("CharacterEvents")

		if characterEvents and characterEvents:FindFirstChild("ChatTyping") then
			characterEvents.ChatTyping:FireServer(arg and "begin" or "end")
		end
	end,
})

Animations:AddToggle("PlayTypingAnim", {
	Text = "Play Typing Animation",
	Default = false,
	Callback = function(arg)
		if Fun.typingTrack then
			if arg then
				Fun.typingTrack.Looped = true
				Fun.typingTrack:AdjustSpeed(Fun.animationSpeed)
				Fun.typingTrack:Play()
			else
				Fun.typingTrack:Stop()
			end
		end
	end,
})

Animations:AddToggle("PlayCrouchAnim", {
	Text = "Play Crouch Animation",
	Default = false,
	Callback = function(arg)
		if Fun.crouchTrack then
			if arg then
				Fun.crouchTrack.Looped = true
				Fun.crouchTrack:AdjustSpeed(Fun.animationSpeed)
				Fun.crouchTrack:Play()
			else
				Fun.crouchTrack:Stop()
			end
		end
	end,
})

Animations:AddToggle("PlayThrownAnim", {
	Text = "Play Thrown Animation",
	Default = false,
	Callback = function(arg)
		if Fun.throwedTrack then
			if arg then
				Fun.throwedTrack.Looped = true
				Fun.throwedTrack:AdjustSpeed(Fun.animationSpeed)
				Fun.throwedTrack:Play()
			else
				Fun.throwedTrack:Stop()
			end
		end
	end,
})

Animations:AddToggle("PlaySwayAnim", {
	Text = "Play Sway Animation",
	Default = false,
	Callback = function(arg)
		if Fun.swayTrack then
			if arg then
				Fun.swayTrack.Looped = true
				Fun.swayTrack:AdjustSpeed(Fun.animationSpeed)
				Fun.swayTrack:Play()
			else
				Fun.swayTrack:Stop()
			end
		end
	end,
})

Animations:AddToggle("PlayJerkoffAnim", {
	Text = "Play Jerkoff Animation",
	Default = false,
	Callback = function(arg)
		if Fun.jerkoffTrack and Fun.jerkoffTrack2 then
			if arg then
				Fun.jerkoffTrack.Looped = true
				Fun.jerkoffTrack:AdjustSpeed(Fun.animationSpeed)
				Fun.jerkoffTrack:Play()
				Fun.jerkoffTrack2.Looped = true
				Fun.jerkoffTrack2:AdjustSpeed(Fun.animationSpeed)
				Fun.jerkoffTrack2:Play()
			else
				Fun.jerkoffTrack:Stop()
				Fun.jerkoffTrack2:Stop()
			end
		end
	end,
})

Animations:AddButton({
	Text = "Stop All Animation",
	Func = function()
		if Fun.typingTrack then
			Fun.typingTrack:Stop()
		end

		if Fun.crouchTrack then
			Fun.crouchTrack:Stop()
		end

		if Fun.throwedTrack then
			Fun.throwedTrack:Stop()
		end

		if Fun.swayTrack then
			Fun.swayTrack:Stop()
		end

		if Fun.jerkoffTrack then
			Fun.jerkoffTrack:Stop()
		end

		if Fun.jerkoffTrack2 then
			Fun.jerkoffTrack2:Stop()
		end

		if toggles.PlayTypingAnim then
			toggles.PlayTypingAnim:SetValue(false)
		end

		if toggles.PlayCrouchAnim then
			toggles.PlayCrouchAnim:SetValue(false)
		end

		if toggles.PlayThrownAnim then
			toggles.PlayThrownAnim:SetValue(false)
		end

		if toggles.PlaySwayAnim then
			toggles.PlaySwayAnim:SetValue(false)
		end

		if toggles.PlayJerkoffAnim then
			toggles.PlayJerkoffAnim:SetValue(false)
		end
	end,
})

do
	local v20 = tbl15.Attack:AddLeftGroupbox("Torso Freeze")
	local v21 = tbl15.Attack:AddRightGroupbox("Blob Sit")

	v20:AddToggle("TorsoFreeze", {
		Text = "Torso Freeze [God Mode]",
		Default = false,
		Callback = function(torseFreezeEnabled)
			if not tbl2.rebuildActive then
				_NOTIFY("Please enable GOD MODE first", 3)
				return
			end
			tbl2.torseFreezeEnabled = torseFreezeEnabled

			if torseFreezeEnabled then
				pcall(function()
					local cFrame = workspace.CurrentCamera.CFrame
					local n8 = cFrame.Position + cFrame.LookVector * 3
					tbl4.partsPosition = Vector3.new(n8.X, n8.Y, n8.Z)
				end)

				_NOTIFY("Torso Freeze: Fixed in front of camera", 3)
			end
		end,
	})

	local HVHTrackDropdown = v20:AddDropdown("HVHTrackDropdown", {
		Text = "Select Track Target",
		Values = GetPlayerListDisplay(),
		Default = 1,
		Callback = function(arg)
			local v22 = ExtractUsername(arg)

			if v22 then
				tbl2.hvhTargetPlayer = v22
			end
		end,
	})

	setupAutoRefresh(HVHTrackDropdown)

	v20:AddToggle("HVHTrack", {
		Text = "Track Target (3 studs)",
		Default = false,
		Callback = function(hvhTrackEnabled)
			if not tbl2.rebuildActive then
				_NOTIFY("Please enable GOD MODE first", 3)
				return
			end

			if hvhTrackEnabled and not tbl2.hvhTargetPlayer then
				_NOTIFY("Please select a player first", 3)
				return
			end
			tbl2.hvhTrackEnabled = hvhTrackEnabled
			_NOTIFY(hvhTrackEnabled and tbl2.hvhTargetPlayer .. " is being tracked" or "Tracking stopped", 3)
		end,
	})

	v21:AddButton({
		Text = "Blob Spawn & Sit (One Shot)",
		Func = function()
			if not tbl2.rebuildActive then
				_NOTIFY("Please enable GOD MODE first", 3)
				return
			end

			task.spawn(function()
				hvhSpawnAndSitOnBlob()
				_NOTIFY("Blob Sit: Done!", 2)
			end)
		end,
	})

	v21:AddToggle("BlobAutoSit", {
		Text = "Blob Auto Sit Loop",
		Default = false,
		Callback = function(hvhBlobSitLoopEnabled)
			if hvhBlobSitLoopEnabled and not tbl2.rebuildActive then
				_NOTIFY("Please enable GOD MODE first", 3)
				return
			end
			tbl2.hvhBlobSitLoopEnabled = hvhBlobSitLoopEnabled

			if hvhBlobSitLoopEnabled then
				_NOTIFY("Blob Auto Sit: Started", 3)

				task.spawn(function()
					while tbl2.hvhBlobSitLoopEnabled do
						pcall(function()
							local character = localPlayer.Character
							if not character or not character.Parent then
								return
							end
							local humanoid_ = character:FindFirstChildOfClass("Humanoid")
							if not humanoid_ or not humanoid_:IsDescendantOf(workspace_) then
								return
							end
							local v22 = workspace_:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
							local creatureBlobman = v22 and v22:FindFirstChild("CreatureBlobman")
							local vehicleSeat = creatureBlobman and creatureBlobman:IsDescendantOf(workspace_) and creatureBlobman:FindFirstChildWhichIsA("VehicleSeat", true)

							if not vehicleSeat or not vehicleSeat:IsDescendantOf(workspace_) or vehicleSeat.Occupant ~= humanoid_ then
								hvhSpawnAndSitOnBlob()
							end
						end)

						task.wait(0.05)
					end
				end)
			else
				_NOTIFY("Blob Auto Sit: Stopped", 3)
			end
		end,
	})
end

do
	local Shield = tbl15.ToyMod:AddLeftGroupbox("Shield")
	local Missile = tbl15.ToyMod:AddRightGroupbox("Missile")

	Shield:AddSlider("ToyHeightOffset", {
		Text = "Height Offset",
		Default = -4,
		Min = -20,
		Max = 20,
		Rounding = 1,
		Callback = function(arg)
			n = arg
		end,
	})

	Shield:AddToggle("ShieldToggle", {
		Text = "Shield ON/OFF",
		Default = false,
		Callback = function(arg)
			if arg then
				startShield()
			else
				stopShield()
			end
		end,
	})

	Shield:AddButton({
		Text = "Refresh Shield",
		Func = function()
			if _G.ShieldActive then
				startShield()
			end
		end,
	})

	local tbl17 = {}

	for _, player in ipairs(players:GetPlayers()) do
		if player ~= localPlayer then
			table.insert(tbl17, player.Name)
		end
	end

	Missile:AddDropdown("ShieldTarget", {
		Text = "Target Player",
		Values = tbl17,
		Default = 1,
		Callback = function(arg)
			if arg then
				v4 = players:FindFirstChild(arg)
			else
				v4 = nil
			end
		end,
	})

	refreshShieldDropdown = function()
		local tbl18 = {}

		for _, player in ipairs(players:GetPlayers()) do
			if player ~= localPlayer then
				table.insert(tbl18, player.Name)
			end
		end

		options.ShieldTarget:SetValues(tbl18)
	end

	players.PlayerAdded:Connect(function()
		task.wait(1)
		refreshShieldDropdown()
	end)

	players.PlayerRemoving:Connect(function()
		task.wait(0.5)
		refreshShieldDropdown()
	end)

	Missile:AddButton({
		Text = "Launch 1 Missile -> Target",
		Func = function()
			if not v4 or not v4.Character then
				return
			end
			local humanoidRootPart = v4.Character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return
			end
			local v20 = getRandomBombData()
			if not v20 then
				return
			end
			shieldObeyTarget(v20, humanoidRootPart)
		end,
	})

	Missile:AddButton({
		Text = "Launch ALL -> Random Players",
		Func = function()
			local character = localPlayer.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			if not character then
				return
			end
			local tbl18 = {}

			for _, player in ipairs(players:GetPlayers()) do
				if player ~= localPlayer and player.Character then
					local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart and (humanoidRootPart.Position - character.Position).Magnitude <= 200 then
						table.insert(tbl18, humanoidRootPart)
					end
				end
			end

			if #tbl18 == 0 then
				return
			end

			for _, v20 in ipairs(tbl10) do
				if v20.index >= 3 and not v20.launched then
					shieldObeyTarget(v20, tbl18[math.random(1, #tbl18)])
					task.wait(0.05)
				end
			end
		end,
	})
end

do
	local Tentacle = tbl15.ToyMod:AddLeftGroupbox("Tentacle")
	local v20 = tbl15.ToyMod:AddRightGroupbox("Stick Control")

	Tentacle:AddDropdown("TentSearchMode", {
		Text = "Search Mode",
		Values = { "My Toys", "Plot 1", "Plot 2", "Plot 3", "Plot 4", "Plot 5" },
		Default = 1,
		Callback = function(arg)
			str = arg
		end,
	})

	Tentacle:AddDropdown("StickCountDropdown", {
		Text = "Stick Count",
		Values = { "1", "2", "3", "4" },
		Default = 1,
		Callback = function(arg)
			n2 = tonumber(arg) or 1
		end,
	})

	Tentacle:AddToggle("TentacleToggle", {
		Text = "Tentacle ON/OFF",
		Default = false,
		Callback = function(arg)
			if arg then
				startTentacle()
			else
				stopTentacle()
			end
		end,
	})

	Tentacle:AddButton({
		Text = "Refresh Tentacle",
		Func = function()
			if _G.TentacleActive then
				startTentacle()
			end
		end,
	})

	Tentacle:AddSlider("TentSegmentSpacing", {
		Text = "Segment Spacing",
		Default = 4,
		Min = 2,
		Max = 7,
		Rounding = 1,
		Callback = function(arg)
			n5 = arg
		end,
	})

	Tentacle:AddSlider("TentBendStrength", {
		Text = "Bend Strength",
		Default = 40,
		Min = 0,
		Max = 120,
		Rounding = 0,
		Callback = function(arg)
			n3 = arg
		end,
	})

	Tentacle:AddSlider("TentTwistAngle", {
		Text = "Twist Angle",
		Default = 0,
		Min = -180,
		Max = 180,
		Rounding = 0,
		Callback = function(arg)
			n4 = arg
		end,
	})

	Tentacle:AddToggle("TentWiggleToggle", {
		Text = "Wiggle ON/OFF",
		Default = false,
		Callback = function(arg)
			flag = arg
			n7 = 0
		end,
	})

	Tentacle:AddSlider("TentWiggleSpeed", {
		Text = "Wiggle Speed",
		Default = 1,
		Min = 0.1,
		Max = 5,
		Rounding = 1,
		Callback = function(arg)
			n6 = arg
		end,
	})

	Tentacle:AddLabel("-- Stick Tracking --")
	local tbl17 = {}

	for _, player in ipairs(players:GetPlayers()) do
		if player ~= localPlayer then
			table.insert(tbl17, player.Name)
		end
	end

	Tentacle:AddDropdown("StickTrackTarget", {
		Text = "Track: Target Player",
		Values = #tbl17 > 0 and tbl17 or { "No Players" },
		Default = 1,
		Callback = function(arg)
			local v21 = players:FindFirstChild(arg)

			if options.StickTrackIndex then
				tbl11[({ ["Stick 1"] = 1, ["Stick 2"] = 2, ["Stick 3"] = 3, ["Stick 4"] = 4 })[options.StickTrackIndex.Value] or 1].trackingTarget = v21
			end
		end,
	})

	refreshStickTrackDropdown = function()
		local tbl18 = {}

		for _, player in ipairs(players:GetPlayers()) do
			if player ~= localPlayer then
				table.insert(tbl18, player.Name)
			end
		end

		if #tbl18 == 0 then
			tbl18 = { "No Players" }
		end

		options.StickTrackTarget:SetValues(tbl18)
	end

	players.PlayerAdded:Connect(function()
		task.wait(1)
		refreshStickTrackDropdown()
	end)

	players.PlayerRemoving:Connect(function()
		task.wait(0.5)
		refreshStickTrackDropdown()
	end)

	local n8 = 1

	Tentacle:AddDropdown("StickTrackIndex", {
		Text = "Track: Stick No.",
		Values = { "Stick 1", "Stick 2", "Stick 3", "Stick 4" },
		Default = 1,
		Callback = function(arg)
			local n9 = ({ ["Stick 1"] = 1, ["Stick 2"] = 2, ["Stick 3"] = 3, ["Stick 4"] = 4 })[arg] or 1
			n8 = n9

			if options.StickTrackTarget then
				local value = options.StickTrackTarget.Value
				tbl11[n9].trackingTarget = value and players:FindFirstChild(value) or nil
			end
		end,
	})

	Tentacle:AddToggle("StickTrackToggle", {
		Text = "Stick Tracking ON/OFF",
		Default = false,
		Callback = function(trackingEnabled)
			tbl11[n8].trackingEnabled = trackingEnabled
		end,
	})

	v20:AddLabel("-- Stick 1 --")

	v20:AddSlider("Stick1UpDown", {
		Text = "[1] Up / Down",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 2,
		Callback = function(y)
			tbl11[1].y = y
		end,
	})

	v20:AddSlider("Stick1LeftRight", {
		Text = "[1] Left / Right",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 2,
		Callback = function(x)
			tbl11[1].x = x
		end,
	})

	v20:AddSlider("Stick1ForwardBack", {
		Text = "[1] Forward / Back",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 2,
		Callback = function(z)
			tbl11[1].z = z
		end,
	})

	v20:AddLabel("-- Stick 2 --")

	v20:AddSlider("Stick2UpDown", {
		Text = "[2] Up / Down",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 2,
		Callback = function(y)
			tbl11[2].y = y
		end,
	})

	v20:AddSlider("Stick2LeftRight", {
		Text = "[2] Left / Right",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 2,
		Callback = function(x)
			tbl11[2].x = x
		end,
	})

	v20:AddSlider("Stick2ForwardBack", {
		Text = "[2] Forward / Back",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 2,
		Callback = function(z)
			tbl11[2].z = z
		end,
	})

	v20:AddLabel("-- Stick 3 --")

	v20:AddSlider("Stick3UpDown", {
		Text = "[3] Up / Down",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 2,
		Callback = function(y)
			tbl11[3].y = y
		end,
	})

	v20:AddSlider("Stick3LeftRight", {
		Text = "[3] Left / Right",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 2,
		Callback = function(x)
			tbl11[3].x = x
		end,
	})

	v20:AddSlider("Stick3ForwardBack", {
		Text = "[3] Forward / Back",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 2,
		Callback = function(z)
			tbl11[3].z = z
		end,
	})

	v20:AddLabel("-- Stick 4 --")

	v20:AddSlider("Stick4UpDown", {
		Text = "[4] Up / Down",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 2,
		Callback = function(y)
			tbl11[4].y = y
		end,
	})

	v20:AddSlider("Stick4LeftRight", {
		Text = "[4] Left / Right",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 2,
		Callback = function(x)
			tbl11[4].x = x
		end,
	})

	v20:AddSlider("Stick4ForwardBack", {
		Text = "[4] Forward / Back",
		Default = 0,
		Min = -3,
		Max = 3,
		Rounding = 2,
		Callback = function(z)
			tbl11[4].z = z
		end,
	})
end

do
	local v20 = tbl15.ToyMod:AddLeftGroupbox("Prop Controller")
	local v21 = tbl15.ToyMod:AddRightGroupbox("Prop Export")

	v20:AddDropdown("PropSearchMode", {
		Text = "Search Mode",
		Values = { "My Toys", "Plot 1", "Plot 2", "Plot 3", "Plot 4", "Plot 5" },
		Default = 1,
		Callback = function(arg)
			_G.prop_setSearchMode(arg)
		end,
	})

	v20:AddDropdown("PropModeDropdown", {
		Text = "Mode",
		Values = { "Fly", "Walk" },
		Default = 1,
		Callback = function(arg)
			_G.prop_setMode(arg)
		end,
	})

	v20:AddSlider("PropWalkSpeed", {
		Text = "Walk Anim Speed",
		Default = 1,
		Min = 0.1,
		Max = 5,
		Rounding = 1,
		Callback = function(arg)
			_G.prop_setAnimSpeed(arg)
		end,
	})

	v20:AddToggle("PropsToggle", {
		Text = "Props ON/OFF",
		Default = false,
		Callback = function(arg)
			if arg then
				_G.prop_startProps()
			else
				_G.prop_stopProps()
			end
		end,
	})

	v20:AddToggle("PropHeadToggle", {
		Text = "head",
		Default = false,
		Callback = function(arg)
			_G.prop_setHeadOn(arg)
		end,
	})

	v20:AddButton({
		Text = "Refresh Props",
		Func = function()
			if _G.PropsActive then
				_G.prop_startProps()
			end
		end,
	})

	v21:AddButton({
		Text = "Copy Settings (JSON)",
		Func = function()
			local v22 = _G.prop_toJSON()

			if setclipboard then
				setclipboard(v22)
			elseif toclipboard then
				toclipboard(v22)
			else
				warn("[PropCopy]\n" .. v22)
			end
		end,
	})
end

tbl15.Misc:AddLeftGroupbox("Plot"):AddButton({
	Text = "House Owner",
	Func = function()
		local localPlayer2 = players.LocalPlayer
		local humanoidRootPart = (localPlayer2.Character or localPlayer2.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
		local plusGrabPart = workspace.Plots.Plot3.PlotSign.Sign.Plus.PlusGrabPart
		local setNetworkOwner2 = replicatedStorage.GrabEvents.SetNetworkOwner
		local tbl17 = {}
		local cframe = CFrame.new(250.84436, -5.24371815, 462.951447, -0.673443735, 0.26791954, -0.688979447, 0, 0.932012439, 0.3624264, 0.739238441, 0.244073793, -0.62765795)
		local cframe2 = CFrame.new(250.834167, -5.39054346, 462.914734, -0.702982426, 0.0497284494, -0.709466577, 0, 0.997552574, 0.0699211806, 0.711207211, 0.0491533615, -0.701261938)
		local cframe3 = CFrame.new(250.834167, -5.39054346, 462.914734, -0.702982426, 0.0497284494, -0.709466577, 0, 0.997552574, 0.0699211806, 0.711207211, 0.0491533615, -0.701261938)
		local cframe4 = CFrame.new(250.834167, -5.39054346, 462.914734, -0.702982426, 0.0497284494, -0.709466577, 0, 0.997552574, 0.0699211806, 0.711207211, 0.0491533615, -0.701261938)
		local cframe5 = CFrame.new
		tbl17[1] = cframe
		tbl17[2] = cframe2
		tbl17[3] = cframe3
		tbl17[4] = cframe4

		do
			local values = table.pack(cframe5(255.426346, -4.96855879, 466.861481, -0.754711211, 0.337141216, -0.562802672, 0, 0.857856154, 0.513889968, 0.656057179, 0.387838513, -0.647433639))
			table.move(values, 1, values.n, 5, tbl17)
		end

		task.spawn(function()
			humanoidRootPart.CFrame = CFrame.new(259, -7, 468)
			task.wait(0.1)

			for i = 1, 50 do
				task.spawn(function()
					for _, v20 in ipairs(tbl17) do
						setNetworkOwner2:FireServer(plusGrabPart, v20)
					end
				end)

				task.wait(0.01)
			end

			humanoidRootPart.CFrame = CFrame.new(279, -7, 468)
		end)

		_NOTIFY("House Owner: Execution complete", 3)
	end,
})

do
	local v20 = tbl15.Misc:AddLeftGroupbox("Barrier Break")

	v20:AddButton({
		Text = "Barrier Break",
		Func = function()
			local localPlayer2 = players.LocalPlayer
			local character = localPlayer2.Character
			if not character then
				return
			end
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			local humanoid_ = character:FindFirstChildOfClass("Humanoid")
			if not humanoidRootPart or not humanoid_ then
				return
			end
			local cFrame = humanoidRootPart.CFrame
			local walkSpeed_ = humanoid_.WalkSpeed
			humanoid_.WalkSpeed = 0
			replicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer("InstrumentWoodwindOcarina", CFrame.new(184.148834, -5.54824972, 498.136749), Vector3.new(0, 34, 0))
			task.wait(0.4)
			local instrumentWoodwindOcarina = workspace:FindFirstChild(localPlayer2.Name .. "SpawnedInToys")
			instrumentWoodwindOcarina = instrumentWoodwindOcarina and instrumentWoodwindOcarina:FindFirstChild("InstrumentWoodwindOcarina")

			if not instrumentWoodwindOcarina then
				humanoid_.WalkSpeed = walkSpeed_
				_NOTIFY("Barrier Break: Ocarina not found", 3)
				return
			end

			instrumentWoodwindOcarina.HoldPart.HoldItemRemoteFunction:InvokeServer(instrumentWoodwindOcarina, workspace[localPlayer2.Name])
			humanoidRootPart.CFrame = CFrame.new(304.06, 25.77, 488.54)
			task.wait(0.2)
			replicatedStorage.MenuToys.DestroyToy:FireServer(instrumentWoodwindOcarina)
			humanoidRootPart.CFrame = cFrame
			task.wait(0.7)
			replicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer("Campfire", CFrame.new(257.638672, -5.57392979, 450.103638), Vector3.new(0, 161.97, 0))
			humanoid_.WalkSpeed = walkSpeed_
			_NOTIFY("Barrier Break: Completed", 3)
		end,
	})

	local flag2 = false

	v20:AddToggle("AutoBarrierBreakToggle", {
		Text = "Auto Barrier Break Beta",
		Default = false,
		Callback = function(arg)
			flag2 = arg
			if not arg then
				return
			end

			task.spawn(function()
				while flag2 do
					local localPlayer2 = players.LocalPlayer
					local character = localPlayer2.Character

					if character then
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						local humanoid_ = character:FindFirstChildOfClass("Humanoid")

						if humanoidRootPart and humanoid_ then
							local walkSpeed_ = humanoid_.WalkSpeed
							humanoid_.WalkSpeed = 0
							replicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer("InstrumentWoodwindOcarina", CFrame.new(184.148834, -5.54824972, 498.136749), Vector3.new(0, 34, 0))
							task.wait(0.5)
							local v21 = workspace:FindFirstChild(localPlayer2.Name .. "SpawnedInToys")
							local instrumentWoodwindOcarina = v21 and v21:FindFirstChild("InstrumentWoodwindOcarina")

							if instrumentWoodwindOcarina then
								instrumentWoodwindOcarina.HoldPart.HoldItemRemoteFunction:InvokeServer(instrumentWoodwindOcarina, workspace[localPlayer2.Name])
								local cFrame = humanoidRootPart.CFrame
								humanoidRootPart.CFrame = CFrame.new(304.06, 25.77, 488.54)
								task.wait(0.185)
								replicatedStorage.MenuToys.DestroyToy:FireServer(instrumentWoodwindOcarina)
								humanoidRootPart.CFrame = cFrame
								task.wait(0.7)
								replicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer("Campfire", CFrame.new(257.638672, -5.57392979, 450.103638), Vector3.new(0, 161.97, 0))
								task.wait(0.5)
								local v22 = workspace:FindFirstChild(localPlayer2.Name .. "SpawnedInToys")

								if v22 and v22:FindFirstChild("Campfire") then
									humanoid_.WalkSpeed = walkSpeed_
									_NOTIFY("Barrier Break: Success!", 2)
									flag2 = false

									if toggles.AutoBarrierBreakToggle then
										toggles.AutoBarrierBreakToggle:SetValue(false)
									end
								else
									humanoid_.WalkSpeed = walkSpeed_
									task.wait(0.5)
								end
							else
								humanoid_.WalkSpeed = walkSpeed_
								task.wait(0.5)
							end
						else
							task.wait(0.3)
						end
					else
						task.wait(0.3)
					end
				end
			end)
		end,
	})
end

do
	local flag2 = false
	local flag3 = true
	local str2 = "All Players"
	local str3 = ""
	local n8 = 0.125
	local radius = 150
	local flag4 = false
	local flag5 = true
	local circle = Drawing.new("Circle")
	circle.Thickness = 1.5
	circle.NumSides = 64
	circle.Color = Color3.fromRGB(255, 255, 255)
	circle.Filled = false
	circle.Visible = false
	local localPlayer2 = game.Players.LocalPlayer
	local currentCamera = workspace.CurrentCamera
	local RunService = game:GetService("RunService")

	updatePlayerList = function()
		local tbl17 = { "(none)" }

		for _, player in ipairs(game.Players:GetPlayers()) do
			if player ~= localPlayer2 then
				table.insert(tbl17, player.Name)
			end
		end

		return tbl17
	end

	local TriggerSingleTarget = nil

	game.Players.PlayerAdded:Connect(function()
		if TriggerSingleTarget then
			TriggerSingleTarget:SetValues(updatePlayerList())
		end
	end)

	game.Players.PlayerRemoving:Connect(function()
		if TriggerSingleTarget then
			TriggerSingleTarget:SetValues(updatePlayerList())
		end
	end)

	getTriggerTarget = function()
		if str2 == "All Players" then
			local mouseLocation = game:GetService("UserInputService"):GetMouseLocation()
			local n9 = 150
			local humanoidRootPart = nil

			for _, player in ipairs(game.Players:GetPlayers()) do
				if player ~= localPlayer2 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					local humanoid_ = player.Character:FindFirstChildOfClass("Humanoid")

					if humanoid_ and humanoid_.Health > 0 then
						local v20, v21 = currentCamera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)

						if v21 then
							local magnitude = (Vector2.new(v20.X, v20.Y) - mouseLocation).Magnitude

							if magnitude < n9 then
								humanoidRootPart = player.Character.HumanoidRootPart
								n9 = magnitude
							end
						end
					end
				end
			end

			return humanoidRootPart
		end

		if str2 == "Single" then
			if str3 ~= "" then
				local v20 = game.Players:FindFirstChild(str3)

				if v20 and v20.Character and v20.Character:FindFirstChild("HumanoidRootPart") then
					local humanoid_ = v20.Character:FindFirstChildOfClass("Humanoid")
					if humanoid_ and humanoid_.Health > 0 then
						return v20.Character.HumanoidRootPart
					end
				end
			end
		end

		return nil
	end

	task.spawn(function()
		while true do
			task.wait(0.01)

			if flag2 then
				pcall(function()
					local v20 = getTriggerTarget()

					if v20 then
						local position = v20.Position

						if flag3 then
							position += v20.AssemblyLinearVelocity * n8
						end

						local grabParts = workspace:FindFirstChild("GrabParts")

						if grabParts and grabParts:FindFirstChild("DragPart") then
							grabParts.DragPart.Position = position
						end
					end
				end)
			end
		end
	end)

	RunService.RenderStepped:Connect(function()
		pcall(function()
			if flag4 then
				circle.Position = game:GetService("UserInputService"):GetMouseLocation()
				circle.Radius = radius
				circle.Visible = true

				if flag5 then
					circle.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
				else
					circle.Color = Color3.fromRGB(255, 255, 255)
				end
			else
				circle.Visible = false
			end
		end)
	end)

	local v20 = tbl15.Misc:AddRightGroupbox("Trigger Bot")
	local v21 = tbl15.Misc:AddRightGroupbox("Trigger Bot Setting")

	v20:AddToggle("TriggerBotEnabled", {
		Text = "Enable Trigger Bot",
		Default = false,
		Callback = function(arg)
			flag2 = arg
		end,
	})

	v20:AddToggle("TriggerPrediction", {
		Text = "Velocity Prediction",
		Default = true,
		Callback = function(arg)
			flag3 = arg
		end,
	})

	v20:AddDropdown("TriggerTargetMode", {
		Text = "Target Mode",
		Values = { "All Players", "Single", "Multiple" },
		Default = 1,
		Callback = function(arg)
			str2 = arg
		end,
	})

	TriggerSingleTarget = v21:AddDropdown("TriggerSingleTarget", {
		Text = "Single Target",
		Values = updatePlayerList(),
		Default = 1,
		Callback = function(arg)
			str3 = arg == "(none)" and "" or arg
		end,
	})
end

do
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local localPlayer2 = Players.LocalPlayer
	local currentCamera = workspace.CurrentCamera

	while not currentCamera do
		task.wait()
		currentCamera = workspace.CurrentCamera
	end

	local clone = currentCamera:Clone()
	clone.Parent = workspace
	clone.Name = "SilentCamera"
	local tbl17 = {}
	local v20 = nil
	local humanoid_ = nil
	local humanoidRootPart = nil
	local tbl18 = { SilentAimEnabled = false, AimMode = "Camera", AimStrength = 50 }
	local n8 = 30

	SilentUpdateCharacter = function(arg)
		if not (arg and arg:IsDescendantOf(workspace)) then
			return
		end
		v20 = arg
		humanoid_ = v20:WaitForChild("Humanoid", 3)
		humanoidRootPart = v20:WaitForChild("HumanoidRootPart", 3)
		local currentReach = localPlayer2:FindFirstChild("CurrentReach")

		if currentReach then
			n8 = currentReach.Value
		end

		tbl17[humanoidRootPart] = nil
	end

	if localPlayer2.Character then
		SilentUpdateCharacter(localPlayer2.Character)
	end

	localPlayer2.CharacterAdded:Connect(SilentUpdateCharacter)

	SilentGetTarget = function()
		if not tbl18.SilentAimEnabled then
			return nil
		end

		if not currentCamera or not humanoidRootPart then
			return nil
		end
		local n9 = currentCamera.ViewportSize / 2
		local n10 = (tbl18.AimStrength or 50) / 100 * (currentCamera.ViewportSize.X + currentCamera.ViewportSize.Y) / 2
		local huge = math.huge
		local v21 = nil

		for k in pairs(tbl17) do
			if k and k.Parent and k ~= humanoidRootPart and k:IsDescendantOf(workspace) then
				local humanoid_2 = k.Parent:FindFirstChildWhichIsA("Humanoid")

				if humanoid_2 and humanoid_2.Health > 0 then
					local v22, v23 = currentCamera:WorldToScreenPoint(k.Position)

					if v23 then
						if (k.Position - currentCamera.CFrame.Position).Magnitude <= n8 then
							local magnitude = (Vector2.new(v22.X, v22.Y) - n9).Magnitude

							if magnitude <= n10 and magnitude < huge then
								huge = magnitude
								v21 = k
							end
						end
					end
				end
			end
		end

		return v21
	end

	local currentCamera2 = workspace.CurrentCamera

	updateSilentAimState = function()
		if tbl18.SilentAimEnabled and tbl18.AimMode == "Camera" then
			workspace.CurrentCamera = clone
		else
			workspace.CurrentCamera = currentCamera2
		end
	end

	RunService.RenderStepped:Connect(function()
		if tbl18.SilentAimEnabled and tbl18.AimMode == "Camera" then
			local cFrame = clone.CFrame

			if not workspace:FindFirstChild("GrabParts") then
				local v21 = SilentGetTarget()

				if v21 and v21 ~= humanoidRootPart then
					local v22, v23 = currentCamera:WorldToScreenPoint(v21.Position)

					if v23 and cFrame.LookVector:Dot((v21.Position - cFrame.Position).Unit) > 0 then
						cFrame = CFrame.new(cFrame.Position, v21.Position)
					end
				end
			end

			currentCamera.CFrame = cFrame
		end
	end)

	workspace.DescendantAdded:Connect(function(descendant)
		if descendant:IsA("BasePart") and descendant.Name == "HumanoidRootPart" and descendant ~= humanoidRootPart then
			tbl17[descendant] = true
		end
	end)

	workspace.DescendantRemoving:Connect(function(descendant)
		if tbl17[descendant] then
			tbl17[descendant] = nil
		end
	end)

	for _, descendant in ipairs(workspace:GetDescendants()) do
		if descendant:IsA("BasePart") and descendant.Name == "HumanoidRootPart" and descendant ~= humanoidRootPart then
			tbl17[descendant] = true
		end
	end

	local v21 = nil

	local function fn_(arg, ...)
		local v22 = table.pack(...)
		local tbl19 = { ... }
		local v23 = getnamecallmethod()

		if arg == workspace and not checkcaller() and v23 == "Raycast" then
			if tbl18.SilentAimEnabled and tbl18.AimMode == "Raycast" then
				local v24 = SilentGetTarget()

				if v24 and v24.Parent then
					local parent = v24.Parent
					local humanoid_2 = parent:FindFirstChildOfClass("Humanoid")
					local playerFromCharacter = players:GetPlayerFromCharacter(parent)
					local flag2 = false

					if playerFromCharacter then
						local inPlot = playerFromCharacter:FindFirstChild("InPlot")

						if inPlot and inPlot:IsA("BoolValue") then
							flag2 = inPlot.Value
						end
					end

					if humanoid_2 and humanoid_2.Health > 0 and not flag2 then
						local tbl20 = { "Head", "Torso", "Left Leg", "Right Leg" }
						local v25 = parent:FindFirstChild(tbl20[math.random(1, #tbl20)])

						if v25 then
							local localPlayer3 = players.LocalPlayer
							local humanoidRootPart2 = localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart")
							local position = humanoidRootPart2 and humanoidRootPart2.Position or type(tbl19[1]) == "Vector3" and tbl19[1] or tbl19[2]
							tbl19[1] = position
							tbl19[2] = (v25.Position - position).Unit * 1000
							local raycastParams = RaycastParams.new()
							raycastParams.FilterDescendantsInstances = { parent }
							raycastParams.FilterType = Enum.RaycastFilterType.Include
							tbl19[3] = raycastParams
							tbl19[4] = nil
							return v21(arg, unpack(tbl19))
						end
					end
				end
			end
		end

		return v21(arg, table.unpack(v22, 1, v22.n))
	end

	v21 = hookmetamethod
	v21 = v21(game, "__namecall", fn_)
	local v22 = nil
	local grabParts = game:GetService("ReplicatedFirst"):FindFirstChild("GrabParts")

	GrabPartFake = function(part1)
		if not localPlayer.Character or not part1 or not part1:IsA("Part") then
			return
		end

		if v22 then
			return
		end

		if workspace:FindFirstChild("GrabParts") and not workspace:FindFirstChild("GrabParts"):GetAttribute("Fake") then
			return
		end
		local humanoid_2 = part1.Parent:FindFirstChildOfClass("Humanoid")
		if humanoid_2 and humanoid_2.Health < 1 then
			return
		end

		if not grabParts then
			return
		end
		local magnitude = (part1.Position - workspace.CurrentCamera.CFrame.Position).Magnitude
		local clone2 = grabParts:Clone()
		clone2:SetAttribute("Fake", true)
		clone2.Name = "GrabParts"

		pcall(function()
			clone2.GrabPart.Color = localPlayer.BeamColor.BallColorHolder.Value
		end)

		pcall(function()
			clone2.BeamPart.GrabBeam.Color = localPlayer.BeamColor.ColorSequenceHolder.Color
		end)

		clone2.DragPart.Anchored = true

		pcall(function()
			clone2.GrabPart.GrabAttach.Orientation = workspace.RotateOrientPart.PartOrient.WorldOrientation
			clone2.DragPart.DragAttach.WorldOrientation = workspace.RotateOrientPart.PartOrient.WorldOrientation
		end)

		clone2.GrabPart.WeldConstraint.Part1 = part1
		clone2.GrabPart.Position = part1.Position
		clone2.GrabPart.Anchored = false
		clone2.BeamPart.Anchored = true
		local camPart = localPlayer.Character:FindFirstChild("CamPart")

		if camPart then
			clone2.BeamPart.GrabBeam.Attachment0 = camPart:FindFirstChild("Attachment") or camPart:FindFirstChildOfClass("Attachment")
		end

		clone2.Parent = workspace
		v22 = clone2

		local connection3 = userInputService.InputChanged:Connect(function(input, gameProcessed)
			if not gameProcessed then
				if input.UserInputType == Enum.UserInputType.MouseWheel then
					if input.Position.Z < 0 then
						magnitude = math.floor(magnitude + input.Position.Z * 2)
					elseif input.Position.Z > 0 then
						magnitude = math.floor(magnitude + input.Position.Z * 2)
					end
				end
			end
		end)

		local connection4 = nil

		connection4 = runService.RenderStepped:Connect(function()
			if v22 and v22.Parent then
				local v23 = workspace.CurrentCamera:ScreenPointToRay(userInputService:GetMouseLocation().X, userInputService:GetMouseLocation().Y)
				v22.DragPart.Position = v23.Origin + v23.Direction * magnitude

				if camPart then
					v22.BeamPart.Position = camPart.Position
				end
			else
				connection3:Disconnect()
				connection4:Disconnect()
			end
		end)
	end

	userInputService.InputBegan:Connect(function(input, gameProcessed)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and not gameProcessed then
			if v22 then
				v22:Destroy()
				v22 = nil
				return
			end

			if tbl18.SilentAimEnabled and tbl18.AimMode == "V2 (Fake Grab)" then
				local v23 = SilentGetTarget()

				if v23 then
					if (localPlayer.Character.HumanoidRootPart.Position - v23.Position).Magnitude <= tbl18.AimReach then
						GrabPartFake(v23)
					end
				end
			end
		end
	end)

	local v23 = tbl15.Misc:AddRightGroupbox("Silent Aim")

	v23:AddToggle("SilentAimEnabled", {
		Text = "Enable Silent Aim",
		Default = false,
		Callback = function(silentAimEnabled)
			tbl18.SilentAimEnabled = silentAimEnabled
			updateSilentAimState()
		end,
	})

	v23:AddDropdown("SilentAimMode", {
		Text = "Aim Mode",
		Values = { "Camera", "Raycast", "V2 (Fake Grab)" },
		Default = "Camera",
		Callback = function(aimMode)
			tbl18.AimMode = aimMode
			updateSilentAimState()
		end,
	})

	v23:AddSlider("SilentAimStrength", {
		Text = "Aim Strength",
		Default = 50,
		Min = 1,
		Max = 100,
		Rounding = 0,
		Callback = function(aimStrength)
			tbl18.AimStrength = aimStrength
		end,
	})

	v23:AddSlider("SilentAimReach", {
		Text = "Max Reach (studs)",
		Default = 30,
		Min = 1,
		Max = 200,
		Rounding = 0,
		Callback = function(arg)
			n8 = arg
		end,
	})
end

local Theme = tbl15.UISettings:AddLeftGroupbox("Theme")
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
SaveManager:SetFolder("PoopHUB")
ThemeManager:ApplyToGroupbox(Theme)
SaveManager:BuildConfigSection(tbl15.UISettings)
local v20 = tbl15.UISettings:AddRightGroupbox("Background Image")

v20:AddToggle("BgImageEnabled", {
	Text = "Enable Background Image",
	Default = false,
	Callback = function(arg)
		if Library.Window and Library.Window.EnableBackgroundImage then
			Library.Window:EnableBackgroundImage(arg)
		end
	end,
})

v20:AddInput("BgImageURL", {
	Default = "",
	Numeric = false,
	Finished = false,
	Text = "Image URL / Asset ID",
	Placeholder = "https://... or rbxassetid://...",
	Callback = function(arg)
		if Library.Window and Library.Window.SetBackgroundImage then
			if arg == "" then
				Library.Window:SetBackgroundImage("")
			else
				Library.Window:SetBackgroundImage(arg)
			end
		end
	end,
})

do
	local v21 = tbl15.UISettings:AddLeftGroupbox("Notification Sounds")

	v21:AddToggle("NotificationSoundOn", {
		Text = "Enable Sound",
		Default = false,
		Callback = function(notificationSoundEnabled)
			tbl2.notificationSoundEnabled = notificationSoundEnabled
		end,
	})

	local tbl17 = {}

	for k in pairs(tbl) do
		table.insert(tbl17, k)
	end

	table.sort(tbl17)

	v21:AddDropdown("NotificationSoundSelect", {
		Text = "Notify Sound",
		Values = tbl17,
		Default = 1,
		Callback = function(selectedNotificationSound)
			tbl2.selectedNotificationSound = selectedNotificationSound
		end,
	})

	v21:AddButton({
		Text = "Preview Sound",
		Func = function()
			local v22 = tbl[tbl2.selectedNotificationSound]
			if not v22 then
				return
			end

			pcall(function()
				local sound = Instance.new("Sound")
				sound.SoundId = v22
				sound.Volume = 1
				sound.Parent = game:GetService("SoundService")
				sound:Play()

				sound.Ended:Connect(function()
					sound:Destroy()
				end)
			end)
		end,
	})
end

do
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "VerticalMoveUI"
	screenGui.ResetOnSpawn = false
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.IgnoreGuiInset = true
	screenGui.Parent = localPlayer:WaitForChild("PlayerGui")
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 90, 0, 200)
	frame.Position = UDim2.new(1, -110, 0.5, -100)
	frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	frame.BackgroundTransparency = 0.3
	frame.BorderSizePixel = 0
	frame.Active = true
	frame.Parent = screenGui
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 0, 30)
	textLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	textLabel.BackgroundTransparency = 0.3
	textLabel.BorderSizePixel = 0
	textLabel.Text = "Up/Down"
	textLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	textLabel.TextSize = 14
	textLabel.Font = Enum.Font.GothamBold
	textLabel.Parent = frame
	Instance.new("UICorner", textLabel).CornerRadius = UDim.new(0, 12)

	makeBtn = function(arg, backgroundColor3, text)
		local textButton = Instance.new("TextButton")
		textButton.Size = UDim2.new(1, -10, 0, 70)
		textButton.Position = UDim2.new(0, 5, 0, arg)
		textButton.BackgroundColor3 = backgroundColor3
		textButton.BorderSizePixel = 0
		textButton.Text = text
		textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton.TextSize = 16
		textButton.Font = Enum.Font.GothamBold
		textButton.AutoButtonColor = false
		textButton.Parent = frame
		Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 8)
		return textButton
	end

	local v21 = makeBtn(35, Color3.fromRGB(50, 120, 220), "Up")
	local v22 = makeBtn(115, Color3.fromRGB(180, 60, 60), "Down")
	local flag2 = false
	local flag3 = false

	bindBtn = function(arg, backgroundColor3, backgroundColor32, arg2)
		arg.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
				if arg2 == "up" then
					flag2 = true
					arg.BackgroundColor3 = backgroundColor3
				else
					flag3 = true
					arg.BackgroundColor3 = backgroundColor3
				end
			end
		end)

		arg.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
				if arg2 == "up" then
					flag2 = false
					arg.BackgroundColor3 = backgroundColor32
				else
					flag3 = false
					arg.BackgroundColor3 = backgroundColor32
				end
			end
		end)
	end

	bindBtn(v21, Color3.fromRGB(80, 160, 255), Color3.fromRGB(50, 120, 220), "up")
	bindBtn(v22, Color3.fromRGB(220, 90, 90), Color3.fromRGB(180, 60, 60), "down")

	task.spawn(function()
		while screenGui.Parent do
			task.wait(0.01)
			screenGui.Enabled = tbl2.rebuildActive == true

			if tbl2.wasdControlEnabled and tbl2.rebuildActive then
				tbl2.verticalMoveAmount = flag2 and 1 or flag3 and -1 or 0
			else
				tbl2.verticalMoveAmount = 0
				flag2 = false
				flag3 = false
			end
		end
	end)

	local flag4 = false
	local position = nil
	local position2 = nil

	textLabel.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
			flag4 = true
			position = input.Position
			position2 = frame.Position
		end
	end)

	userInputService.InputChanged:Connect(function(input)
		if flag4 and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMove) then
			local n8 = input.Position - position
			frame.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n8.X, position2.Y.Scale, position2.Y.Offset + n8.Y)
		end
	end)

	userInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
			flag4 = false
		end
	end)
end

task.spawn(function()
	while true do
		if tbl2.rebuildActive then
			pcall(function()
				local character = localPlayer.Character
				if not character then
					return
				end

				if v2 then
					local v21 = GetPart(character, "HRP")

					if v21[1] then
						v2:FireServer(v21[1], 1)
					end
				end

				local head_ = character:FindFirstChild("Head")
				local tbl17 = {}

				for _, randomPosition in ipairs(tbl4.randomPositions) do
					table.insert(tbl17, randomPosition)
				end

				if head_ then
					table.insert(tbl17, head_.Position)
				end

				local n8 = tbl17[math.random(1, #tbl17)]

				if tbl2.torseFreezeEnabled then
					pcall(function()
						local cFrame = workspace.CurrentCamera.CFrame
						n8 = cFrame.Position + cFrame.LookVector * 3
					end)
				elseif tbl2.hvhTrackEnabled and tbl2.hvhTargetPlayer then
					pcall(function()
						local character2 = players:FindFirstChild(tbl2.hvhTargetPlayer)
						character2 = character2 and character2.Character
						character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

						if character2 then
							local n9 = character2.CFrame * CFrame.new(0, 0, -3)
							n8 = Vector3.new(n9.X, n9.Y, n9.Z)
						end
					end)
				end

				local v21 = GetPart(character, "HRP")

				for _, v22 in ipairs(v21) do
					v22.CFrame = CFrame.new(n8)
					v22.AssemblyLinearVelocity = Vector3.zero
				end

				local v22 = GetPart(character, "Others")

				for _, v23 in ipairs(v22) do
					v23.CFrame = CFrame.new(tbl4.partsPosition)
					v23.AssemblyLinearVelocity = Vector3.zero
				end
			end)
		end

		task.wait(1e-05)
	end
end)

task.spawn(function()
	while true do
		task.wait(0.01)

		if tbl2.wasdControlEnabled and tbl2.rebuildActive then
			pcall(function()
				local cFrame = workspace.CurrentCamera.CFrame
				local unit = Vector3.new(cFrame.LookVector.X, 0, cFrame.LookVector.Z).Unit
				local unit2 = Vector3.new(cFrame.RightVector.X, 0, cFrame.RightVector.Z).Unit
				local vector = Vector3.zero

				if userInputService:IsKeyDown(Enum.KeyCode.W) then
					vector = Vector3.zero + unit
				end

				if userInputService:IsKeyDown(Enum.KeyCode.S) then
					vector -= unit
				end

				if userInputService:IsKeyDown(Enum.KeyCode.A) then
					vector -= unit2
				end

				if userInputService:IsKeyDown(Enum.KeyCode.D) then
					vector += unit2
				end

				if userInputService:IsKeyDown(Enum.KeyCode.Space) then
					vector += Vector3.new(0, 1, 0)
				end

				if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
					vector -= Vector3.new(0, 1, 0)
				end

				local character = localPlayer.Character
				character = character and character:FindFirstChildOfClass("Humanoid")

				if character then
					local moveDirection = character.MoveDirection

					if moveDirection.Magnitude > 0.1 then
						local vector2 = Vector3.new(moveDirection.X, 0, moveDirection.Z)

						if vector2.Magnitude > 0 then
							vector += vector2.Unit
						end
					end
				end

				if tbl2.verticalMoveAmount ~= 0 then
					vector += Vector3.new(0, tbl2.verticalMoveAmount, 0)
				end

				if vector.Magnitude > 0 then
					tbl4.partsPosition = tbl4.partsPosition + vector.Unit * tbl2.wasdMoveSpeed
				end
			end)
		end
	end
end)

task.spawn(function()
	while true do
		task.wait(0.01)

		if tbl2.autoSitEnabled then
			pcall(function()
				for _, descendant in pairs(workspace_:GetDescendants()) do
					if tbl2.autoSitEnabled then
						if descendant:IsA("Model") and table.find(tbl4.ATTACK_TARGETS, descendant.Name) then
							smartFastSitOnce(descendant)
						end

						continue
					end

					break
				end
			end)
		end
	end
end)

task.spawn(function()
	while true do
		task.wait()

		if tbl2.characterWalkSpeedEnabled then
			pcall(function()
				local humanoid_ = getChar()
				local humanoidRootPart = humanoid_ and humanoid_:FindFirstChild("HumanoidRootPart")
				humanoid_ = humanoid_ and humanoid_:FindFirstChildOfClass("Humanoid")

				if humanoidRootPart and humanoid_ and humanoid_.MoveDirection.Magnitude > 0 then
					local moveDirection = humanoid_.MoveDirection
					humanoidRootPart.CFrame = humanoidRootPart.CFrame + Vector3.new(moveDirection.X, 0, moveDirection.Z).Unit * tbl2.characterWalkSpeed
				end
			end)
		end
	end
end)

task.spawn(function()
	while true do
		task.wait(0.1)

		if tbl2.characterJumpPowerEnabled then
			pcall(function()
				local humanoid_ = getChar():FindFirstChildOfClass("Humanoid")

				if humanoid_ and humanoid_.JumpPower ~= tbl2.characterJumpPower then
					humanoid_.JumpPower = tbl2.characterJumpPower
				end
			end)
		end
	end
end)

userInputService.JumpRequest:Connect(function()
	if tbl2.characterInfJumpEnabled or tbl2.infjump then
		pcall(function()
			local humanoid_ = getChar():FindFirstChildOfClass("Humanoid")

			if humanoid_ then
				humanoid_:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end)
	end
end)

_G.spinAngle = 0

runService.RenderStepped:Connect(function(deltaTime)
	if tbl2.WingsActive and #tbl3.Wings > 0 then
		pcall(function()
			local character = localPlayer.Character
			local torso_

			if character then
				torso_ = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
			else
				torso_ = character
			end

			if torso_ and character:FindFirstChild("HumanoidRootPart") then
				tbl2.TimeCounter = tbl2.TimeCounter + deltaTime * (tbl2.WingSpeed + character.HumanoidRootPart.Velocity.Magnitude / 40)

				for i, wing in ipairs(tbl3.Wings) do
					local n8 = i == 1 and 1 or -1
					wing.Handle.CFrame = torso_.CFrame * tbl4.Offsets[i] * CFrame.Angles(0, 0, math.sin(tbl2.TimeCounter) * math.rad(tbl2.WingAngle + character.HumanoidRootPart.Velocity.Magnitude / 4) * n8)

					if wing.Reserved then
						wing.Reserved.BP.Position = wing.Handle.Position
						wing.Reserved.BG.CFrame = wing.Handle.CFrame * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966)
					end

					for i2, segment in ipairs(wing.Segments) do
						segment.Part.CFrame = segment.Part.CFrame:Lerp((i2 == 1 and wing.Handle.CFrame or wing.Segments[i2 - 1].Part.CFrame) * tbl4.Offsets[i], 0.5)

						if wing.Sync[i2] then
							wing.Sync[i2].BP.Position = segment.Part.Position
							wing.Sync[i2].BG.CFrame = segment.Part.CFrame * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966)
						end
					end
				end
			end
		end)
	end

	if tbl2.headEnabled and not tbl2.danceEnabled then
		pcall(function()
			local v21 = getChar()
			local v22 = GetRepresentativePart(v21, "HumanoidRootPart")
			local v23 = GetRepresentativePart(v21, "Head")

			if v22 and v23 then
				_G.spinAngle = _G.spinAngle + tbl2.speed * deltaTime
				local position = v22.Position
				local radius = tbl2.radius
				local n8 = position.Y + tbl2.height
				local radius2 = tbl2.radius
				v23.CFrame = CFrame.new(Vector3.new(position.X + math.cos(_G.spinAngle) * radius, n8, position.Z + math.sin(_G.spinAngle) * radius2)) * (v23.CFrame - v23.CFrame.p)
			end
		end)
	end

	if tbl2.characterSpinEnabled then
		pcall(function()
			local humanoidRootPart = getChar()
			humanoidRootPart = humanoidRootPart and humanoidRootPart:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart then
				humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(tbl2.characterSpinSpeed * 100 * deltaTime), 0)
			end
		end)
	end
end)

task.spawn(function()
	while true do
		task.wait(15)

		if tbl2.skyTpEnabled then
			local now = os.clock()

			while os.clock() - now <= 2 do
				if not tbl2.skyTpEnabled then
					break
				end
				local v21
				v21, v21 = getCharInfo()

				if v21 then
					pcall(function()
						v21.CFrame = CFrame.new(0, 100, 0)
					end)
				end

				task.wait(0.01)
			end
		end
	end
end)

task.spawn(function()
	while true do
		task.wait()

		if tbl2.legsEnabled and not tbl2.danceEnabled then
			pcall(function()
				local v21 = getChar()
				local v22 = GetRepresentativePart(v21, "Left Leg")
				local v23 = GetRepresentativePart(v21, "Right Leg")

				if v22 then
					v22.CFrame = CFrame.new(0, 0, 0)
				end

				if v23 then
					v23.CFrame = CFrame.new(0, 0, 0)
				end
			end)
		end
	end
end)

task.spawn(function()
	while true do
		task.wait()

		if (tbl2.obeyPartEnabled or tbl2.obeyAllEnabled) and tbl2.selectedPlayerName and not tbl2.danceEnabled then
			pcall(function()
				local v21 = players:FindFirstChild(tbl2.selectedPlayerName)
				if not (v21 and v21.Character) then
					return
				end
				local v22 = getChar()

				if tbl2.obeyPartEnabled then
					local v23 = GetRepresentativePart(v21.Character, tbl2.selectedPart)
					local v24 = GetRepresentativePart(v22, tbl2.selectedPart)

					if v23 and v24 then
						v24.CFrame = v24.CFrame:Lerp(v23.CFrame, tbl2.lerpAlpha)
					end
				end

				if tbl2.obeyAllEnabled then
					local v23 = GetRepresentativePart(v21.Character, "HumanoidRootPart")
					if not v23 then
						return
					end
					local n8 = v23.CFrame.RightVector * tbl2.obeyRightDistance

					for _, v24 in ipairs({ "Head", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }) do
						local v25 = GetRepresentativePart(v21.Character, v24)
						local v26 = GetRepresentativePart(v22, v24)

						if v25 and v26 then
							local n9 = v26.CFrame - v26.CFrame.p
							local lerpAlpha = tbl2.lerpAlpha
							v26.CFrame = v26.CFrame:Lerp(CFrame.new(v25.Position + n8) * n9, lerpAlpha)
						end
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	while true do
		task.wait()

		if tbl2.feetTPDeleteEnabled then
			pcall(function()
				local v21 = getChar()
				local tbl17 = {}

				for _, v22 in pairs({ "Head", "Left Arm", "Right Arm", "HumanoidRootPart" }) do
					local v23 = GetRepresentativePart(v21, v22)

					if v23 then
						tbl17[v22] = v23.CFrame
					end
				end

				local v22 = GetRepresentativePart(v21, "Left Leg")
				local v23 = GetRepresentativePart(v21, "Right Leg")

				if v22 then
					v22.CFrame = CFrame.new(0, 999999999, 0)
				end

				if v23 then
					v23.CFrame = CFrame.new(0, 999999999, 0)
				end

				task.wait(0.1)

				if v22 then
					v22:Destroy()
				end

				if v23 then
					v23:Destroy()
				end

				task.wait(0.1)

				for k, v24 in pairs(tbl17) do
					local v25 = GetRepresentativePart(v21, k)

					if v25 then
						v25.CFrame = v24
					end
				end

				tbl2.feetTPDeleteEnabled = false
			end)
		end
	end
end)

task.spawn(function()
	while true do
		task.wait()

		if tbl2.headViewEnabled then
			pcall(function()
				local v21 = GetRepresentativePart(getChar(), "Head")

				if v21 then
					workspace.CurrentCamera.CameraSubject = v21
				end
			end)
		end
	end
end)

workspace_.ChildAdded:Connect(function(child)
	if child.Name == "GrabParts" then
		if tbl5["Kill Grab"] then
			handleKillGrab(child)
		end

		if tbl5["Sky Grab"] then
			handleSkyGrab(child)
		end

		if tbl5["Spin Grab"] then
			handleSpinGrab(child)
		end

		if tbl5["Teleport Up"] then
			handleTeleport(child, "up")
		end

		if tbl5["Teleport Down"] then
			handleTeleport(child, "down")
		end

		if tbl5["Chaos Grab"] then
			handleChaosGrab(child, function()
				return tbl5["Chaos Grab"]
			end)
		end

		if tbl5["Supersonic Grab"] then
			handleSupersonicGrab(child)
		end

		if tbl5["Freeze Grab"] then
			handleFreezeGrab(child)
		end

		if tbl5["Noclip Grab"] then
			handleNoclipGrab(child)
		end

		if tbl2.SuperStrength then
			task.spawn(function()
				local grabPart_ = child:WaitForChild("GrabPart", 5)

				if grabPart_ and grabPart_:FindFirstChild("WeldConstraint") then
					local part1 = grabPart_.WeldConstraint.Part1

					if part1 then
						local bodyVelocity = Instance.new("BodyVelocity", part1)
						bodyVelocity.MaxForce = Vector3.zero
						bodyVelocity.Velocity = Vector3.new()
						bodyVelocity.Name = "SuperStrength"
						local connection3 = nil

						connection3 = child:GetPropertyChangedSignal("Parent"):Connect(function()
							if not child.Parent then
								local mouseButton2 = Enum.UserInputType.MouseButton2

								if not (userInputService:GetLastInputType() == mouseButton2) and not _G.MobileSuperStrengthTriggered or not tbl2.SuperStrength then
									local mouseButton1 = Enum.UserInputType.MouseButton1
									local flag2 = userInputService:GetLastInputType() == mouseButton1

									if not flag2 then
										local touch = Enum.UserInputType.Touch
										flag2 = userInputService:GetLastInputType() == touch
									end

									if flag2 then
										bodyVelocity:Destroy()
									end
								else
									bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
									bodyVelocity.Velocity = workspace.CurrentCamera.CFrame.lookVector * (tbl2.Strength or 5000)
									game:GetService("Debris"):AddItem(bodyVelocity, 1)
								end

								connection3:Disconnect()
							end
						end)
					end

					return
				end
			end)
		end
	end
end)

players.PlayerRemoving:Connect(function(player)
	if player.Name == tbl2.selectedPlayerName then
		tbl2.selectedPlayerName = nil
	end

	if player.Name == tbl2.selectedTargetPlayer then
		tbl2.selectedTargetPlayer = nil
		tbl2.targetKillEnabled = false
		tbl2.targetKillRunning = false
	end

	tbl3.forceDisabledPlayers[player] = nil
	tbl3.kickAuraCooldowns[player.UserId] = nil
end)

getAuraBlobman = function()
	local v21 = workspace_:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

	if v21 then
		for _, child in ipairs(v21:GetChildren()) do
			if child.Name == "CreatureBlobman" and child:FindFirstChildOfClass("VehicleSeat") then
				return child
			end
		end
	end

	return nil
end

destroyAuraBlobman = function()
	local kickAuraBlobman = tbl3.kickAuraBlobman or getAuraBlobman()

	if kickAuraBlobman and kickAuraBlobman.Parent then
		pcall(function()
			if replicatedStorage.MenuToys:FindFirstChild("DestroyToy") then
				replicatedStorage.MenuToys.DestroyToy:FireServer(kickAuraBlobman)
			else
				kickAuraBlobman:Destroy()
			end
		end)
	end

	tbl3.kickAuraBlobman = nil
end

removeAttachPlayer = function(arg)
	if not arg then
		return
	end
	local leftDetector = arg:FindFirstChild("LeftDetector", true)
	if not leftDetector then
		return
	end
	local attachPlayer = leftDetector:FindFirstChild("AttachPlayer")

	if attachPlayer then
		pcall(function()
			attachPlayer:Destroy()
		end)
	end
end

removeAllForces = function(arg)
	for _, descendant in ipairs(arg:GetDescendants()) do
		if descendant:IsA("BodyForce") or descendant:IsA("BodyVelocity") or descendant:IsA("BodyAngularVelocity") or descendant:IsA("BodyGyro") or descendant:IsA("VectorForce") or descendant:IsA("LinearVelocity") or descendant:IsA("AngularVelocity") or descendant:IsA("AlignPosition") or descendant:IsA("AlignOrientation") then
			pcall(function()
				descendant:Destroy()
			end)
		end
	end
end

ensureAuraBlobmanAndSit = function()
	local character = localPlayer.Character
	local humanoid_ = character and character:FindFirstChildOfClass("Humanoid")
	local humanoidRootPart

	if character then
		humanoidRootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
	else
		humanoidRootPart = character
	end

	if not (humanoid_ and humanoidRootPart) then
		return
	end

	if humanoid_.Sit then
		return
	end
	local v21 = getAuraBlobman()

	if not v21 then
		pcall(function()
			spawnToyRemoteFunction:InvokeServer("CreatureBlobman", humanoidRootPart.CFrame * CFrame.new(0, 0, -5), Vector3.new(0, -15.716, 0))
		end)

		task.wait(0.2)
		v21 = getAuraBlobman()
	end

	tbl3.kickAuraBlobman = v21
	local vehicleSeat = v21 and v21:FindFirstChildOfClass("VehicleSeat")

	if vehicleSeat and not humanoid_.Sit then
		pcall(function()
			vehicleSeat:Sit(humanoid_)
		end)
	end
end

isPlayerAlive = function(arg)
	local character = arg.Character
	if not character then
		return false
	end
	local humanoid_ = character:FindFirstChildOfClass("Humanoid")
	return humanoid_ and humanoid_.Health > 0
end

isPlayerInPlot = function(arg)
	return arg:FindFirstChild("InPlot") and arg.InPlot.Value
end

shouldProcessAuraPlayer = function(arg)
	if arg == localPlayer then
		return false
	end

	if tbl2.kickAuraFriendWhitelist and localPlayer:IsFriendsWith(arg.UserId) then
		return false
	end

	if isPlayerInPlot(arg) then
		return false
	end

	if not isPlayerAlive(arg) then
		return false
	end
	local v21 = tbl3.kickAuraCooldowns[arg.UserId]
	local flag2

	if v21 then
		local kickAuraCooldown = tbl2.kickAuraCooldown
		flag2 = os.clock() - v21 < kickAuraCooldown
	else
		flag2 = v21
	end

	if flag2 then
		return false
	end
	return true
end

runAuraKick = function(arg, arg2, arg3)
	local character = localPlayer.Character
	local humanoidRootPart

	if character then
		humanoidRootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
	else
		humanoidRootPart = character
	end

	if not humanoidRootPart then
		return
	end
	local setNetworkOwner2 = replicatedStorage.GrabEvents.SetNetworkOwner
	local destroyGrabLine = replicatedStorage.GrabEvents.DestroyGrabLine
	local creatureGrab = arg.BlobmanSeatAndOwnerScript.CreatureGrab
	local v21 = arg:FindFirstChild(arg3 .. "Detector")
	local v22 = v21 and v21:FindFirstChild(arg3 .. "Weld")

	grabPart = function(arg4)
		if v21 and v22 then
			pcall(function()
				creatureGrab:FireServer(v21, arg4, v22)
			end)
		end
	end

	ungrabPart = function(arg4)
		pcall(function()
			destroyGrabLine:FireServer(arg4)
		end)
	end

	grabPart(humanoidRootPart)
	task.wait(0.076923076923076927)

	pcall(function()
		setNetworkOwner2:FireServer(arg2, humanoidRootPart.CFrame)
	end)

	task.wait()
	arg2.CFrame = arg2.CFrame + Vector3.new(0, 11, 0)
	ungrabPart(arg2)
	task.wait(0.076923076923076927)
	grabPart(arg2)
end

_G.stopKickAura = function()
	if tbl3.kickAuraConnection then
		tbl3.kickAuraConnection:Disconnect()
		tbl3.kickAuraConnection = nil
	end

	if tbl3.forceDisabledConnection then
		tbl3.forceDisabledConnection:Disconnect()
		tbl3.forceDisabledConnection = nil
	end

	tbl3.kickAuraCooldowns = {}
	tbl3.forceDisabledPlayers = {}
	destroyAuraBlobman()
end

_G.startKickAura = function()
	_G.stopKickAura()

	tbl3.forceDisabledConnection = runService.Heartbeat:Connect(function()
		if not (tbl2.blobmanAuraEnabled and tbl2.blobmanAuraMode == "Kick Aura") then
			return
		end

		for k in pairs(tbl3.forceDisabledPlayers) do
			if k.Character then
				removeAllForces(k.Character)
			end
		end
	end)

	tbl3.kickAuraConnection = runService.Heartbeat:Connect(function()
		if not (tbl2.blobmanAuraEnabled and tbl2.blobmanAuraMode == "Kick Aura") then
			return
		end
		ensureAuraBlobmanAndSit()
		local kickAuraBlobman = tbl3.kickAuraBlobman or getAuraBlobman()
		if not kickAuraBlobman then
			return
		end
		removeAttachPlayer(kickAuraBlobman)
		local character = localPlayer.Character

		if character then
			character = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
		end

		if not character then
			return
		end

		for _, player in ipairs(players:GetPlayers()) do
			if shouldProcessAuraPlayer(player) then
				local character2 = player.Character
				local humanoidRootPart = character2 and (character2:FindFirstChild("HumanoidRootPart") or character2:FindFirstChild("Torso"))

				if humanoidRootPart and (humanoidRootPart.Position - character.Position).Magnitude <= tbl2.kickAuraRange then
					runAuraKick(kickAuraBlobman, humanoidRootPart, "Left")
					tbl3.forceDisabledPlayers[player] = true
					removeAllForces(character2)
					tbl3.kickAuraCooldowns[player.UserId] = os.clock()
					break
				end
			end
		end
	end)
end

SaveManager:LoadAutoloadConfig()
_NOTIFY("Poop HUB (Obsidian UI Edition) Loaded!", 4)
print("========================================")
print("Poop HUB - Premium (Obsidian UI Edition)")
print("========================================")
local Players
Players = game:GetService("Players")
local Workspace
Workspace = game:GetService("Workspace")

do
	local tbl17 = {}
	local image = ""

	ensureFolders = function()
		for _, v21 in ipairs({ "PoopHub", "PoopHub/Logo", "PoopHub/Logo/UBG" }) do
			if isfolder and not isfolder(v21) then
				makefolder(v21)
			end
		end
	end

	ensureFolders()

	_G.updateBlackholeImage = function(arg)
		local match = arg:match("^%s*(.-)%s*$")
		if not match or match == "" then
			return
		end

		if string.find(match, "rbxassetid://") then
			image = match
			_G.updateAllBlackholes()
		elseif string.find(match, "http") then
			task.spawn(function()
				local ok2, result2 = pcall(function()
					return game:HttpGet(match)
				end)

				if ok2 and result2 and #result2 > 0 then
					local flag2 = result2:sub(1, 4) == "\137PNG" or result2:sub(1, 2) == "\255\216" or result2:sub(1, 3) == "GIF"
					local flag3 = false

					if flag2 then
						flag3 = true
					end

					if not flag3 then
						if Library and Library.Notify then
							_NOTIFY("Invalid image! Ensure URL points directly to an image file.", 4)
						end

						return
					end

					pcall(function()
						local str2 = match:gsub("[^%w]", "")

						if #str2 > 40 then
							str2 = str2:sub(#str2 - 40)
						end

						local str3 = "PoopHub/custom_blackhole_" .. str2 .. "_" .. tostring(math.random(10000, 99999)) .. ".png"
						writefile(str3, result2)

						local ok3, result3 = pcall(function()
							return getcustomasset(str3)
						end)

						if ok3 and result3 then
							image = result3
						else
							image = "rbxassetid://117677503754205"
						end

						_G.updateAllBlackholes()

						if Library and Library.Notify then
							_NOTIFY("Success! Blackhole Image Applied.", 3)
						end
					end)
				elseif Library and Library.Notify then
					_NOTIFY("Failed to download image from URL", 3)
				end
			end)
		end
	end

	if tbl2.customBlackholeImage and tbl2.customBlackholeImage ~= "" then
		_G.updateBlackholeImage(tbl2.customBlackholeImage)
	end

	applyVisualSettings = function(arg)
		if tbl2.customBlackholeEnabled then
			if arg.large then
				arg.large.Image = image
				arg.large.ImageColor3 = Color3.new(1, 1, 1)
				arg.large.ImageTransparency = 0
				arg.large.Visible = true

				pcall(function()
					arg.large.ResampleMode = Enum.ResamplerMode.Pixelated
				end)
			end

			if arg.small then
				arg.small.Visible = false
			end

			if arg.hole then
				arg.hole.Transparency = 1
			end
		else
			if arg.large then
				arg.large.Image = arg.originalLargeImage
				arg.large.ImageColor3 = arg.originalLargeImageColor3 or Color3.new(1, 1, 1)
				arg.large.ImageTransparency = arg.originalLargeImageTrans or 0
			end

			if arg.small then
				arg.small.Visible = arg.originalSmallVisible
			end

			if arg.hole then
				arg.hole.Transparency = arg.originalHoleTransparency
			end
		end
	end

	_G.updateAllBlackholes = function()
		for _, v21 in pairs(tbl17) do
			applyVisualSettings(v21)
		end
	end

	processInstance = function(arg)
		if tbl17[arg] then
			return
		end

		if arg:IsA("Model") and string.find(string.lower(arg.Name), "blackhole") then
			local tbl18 = {
				large = nil,
				small = nil,
				hole = nil,
				originalLargeImage = "",
				originalLargeImageColor3 = Color3.new(1, 1, 1),
				originalLargeImageTrans = 0,
				originalSmallVisible = true,
				originalHoleTransparency = 0,
			}

			tbl17[arg] = tbl18

			applyToChild = function(large)
				if large.Name == "Large" and (large:IsA("ImageLabel") or large:IsA("ImageButton")) then
					if not tbl18.large then
						tbl18.large = large
						tbl18.originalLargeImage = large.Image
						tbl18.originalLargeImageColor3 = large.ImageColor3
						tbl18.originalLargeImageTrans = large.ImageTransparency
					end

					if tbl2.customBlackholeEnabled and image ~= "" then
						large.Image = image
						large.ImageColor3 = Color3.new(1, 1, 1)
						large.ImageTransparency = 0
						large.Visible = true

						pcall(function()
							large.ResampleMode = Enum.ResamplerMode.Pixelated
						end)
					end
				elseif large.Name == "Small" and (large:IsA("ImageLabel") or large:IsA("ImageButton")) then
					if not tbl18.small then
						tbl18.small = large
						tbl18.originalSmallVisible = large.Visible
					end

					if tbl2.customBlackholeEnabled then
						large.Visible = false
					end
				elseif large.Name == "Hole" and large:IsA("BasePart") then
					if not tbl18.hole then
						tbl18.hole = large
						tbl18.originalHoleTransparency = large.Transparency
					end

					if tbl2.customBlackholeEnabled then
						large.Transparency = 1
					end
				end
			end

			for _, descendant in ipairs(arg:GetDescendants()) do
				applyToChild(descendant)
			end

			local connection3 = arg.DescendantAdded:Connect(function(descendant)
				applyToChild(descendant)
			end)

			local connection4 = nil

			connection4 = arg.AncestryChanged:Connect(function(child, parent)
				if not parent then
					tbl17[arg] = nil
					connection3:Disconnect()
					connection4:Disconnect()
				end
			end)
		end
	end
end

for _, descendant in ipairs(Workspace:GetDescendants()) do
	processInstance(descendant)
end

Workspace.DescendantAdded:Connect(function(descendant)
	processInstance(descendant)
end)

print("[PoopHub Monitor] Dynamic BlackHole Customizer Engine Active!")

do
	local n8 = 0
	local UserInputService = game:GetService("UserInputService")
	local currentCamera = workspace.CurrentCamera

	UserInputService.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseWheel and _G.FurtherExtend then
			if n8 < 11 then
				n8 = 11
			end

			if input.Position.Z <= 0 then
				if input.Position.Z < 0 then
					n8 -= tbl2.IncreaseLineExtend
				end
			else
				n8 += tbl2.IncreaseLineExtend
			end
		end
	end)

	workspace.ChildAdded:Connect(function(child)
		if child.Name == "GrabParts" and child:IsA("Model") and _G.FurtherExtend then
			if UserInputService.MouseEnabled then
				local v21 = child
				v21:WaitForChild("GrabPart")
				v21:WaitForChild("DragPart")
				local bodyPosition = Instance.new("BodyPosition", v21.GrabPart)
				bodyPosition.MaxForce = Vector3.new(275000, 275000, 275000)
				bodyPosition.P = 20000
				bodyPosition.D = 950
				bodyPosition.Position = v21.GrabPart.WeldConstraint.Part1.Position
				n8 = (v21.GrabPart.Position - currentCamera.CFrame.Position).Magnitude
				v21.DragPart.AlignPosition.Enabled = false

				task.spawn(function()
					while v21.Parent do
						bodyPosition.Position = currentCamera.CFrame.Position + currentCamera.CFrame.LookVector * n8
						task.wait()
					end

					n8 = 0
					bodyPosition:Destroy()
				end)
			end
		end
	end)
end

do
	local v21 = v5:MakeBar({
		Texts = { "PoopHub", "V5 New Release!", (os.date("%H:%M")) },
		UseDivider = true,
		Icon = result,
		Size = UDim2.new(0, 350, 0, 30),
	})

	local v22 = v21:AddInfoWindow({
		Plan = tostring(DCUS_Plan),
		Expires = tostring(DCUS_Expires):gsub("T.*", ""),
		HubName = "PoopHub",
		SubContent = "#1 FTAP",
	})

	v22:AddChangeLog({
		Icon = result,
		Title = "New Release!",
		Content = [[# V5.1.5 Release!
- Ragdoll Kill V2 [New]
- Loop Banana Ragdoll [New]
	]],
		Version = "5.1.5",
		Tag = { { Color3.fromRGB(162, 48, 255), "New Release" } },
		UseGradient = { FixTag = false, Tag = true, NewTag = true, Version = false, Removed = false },
		GradientSpeed = 0.004,
	})

	v22:AddChangeLog({
		Icon = result,
		Title = "Release",
		Content = [[# V5.1.3 Release!
- UI [Fix]
- Ragdoll Kill [New]
- Defense [New]
	]],
		Version = "5.1.3",
		Tag = { { Color3.fromRGB(162, 48, 255), "New Release" } },
		UseGradient = { FixTag = false, Tag = true, NewTag = true, Version = false, Removed = false },
		GradientSpeed = 0.004,
	})

	task.spawn(function()
		local n8 = tick() + 10

		while tick() < n8 do
			v21:SetText({ "PoopHub", version .. " New Release!", os.date("%H:%M") .. "      " })
			task.wait(1)
		end

		while true do
			v21:SetText({ version, { 10734952479, true, "Buy, Get Key: https://dcus.pro", true }, (os.date("%H:%M")) })
			task.wait(1)
		end
	end)
end

do
	local Players2 = game:GetService("Players")
	local Workspace2 = game:GetService("Workspace")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local localPlayer2 = Players2.LocalPlayer
	local spawnToyRemoteFunction2 = ReplicatedStorage:WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction")
	local setNetworkOwner2 = ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
	local stickyPartEvent = ReplicatedStorage:WaitForChild("PlayerEvents"):WaitForChild("StickyPartEvent")
	local destroyToy = ReplicatedStorage:WaitForChild("MenuToys"):WaitForChild("DestroyToy")
	local v21 = Workspace2:WaitForChild(localPlayer2.Name .. "SpawnedInToys")
	local character = localPlayer2.Character or localPlayer2.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

	localPlayer2.CharacterAdded:Connect(function(character2)
		character = character2
		humanoidRootPart = character2:WaitForChild("HumanoidRootPart")
	end)

	local tbl17 = {}
	local flag2 = false

	enqueueSpawn = function(arg)
		table.insert(tbl17, arg)

		if not flag2 then
			flag2 = true

			task.spawn(function()
				while #tbl17 > 0 do
					local v22 = table.remove(tbl17, 1)
					pcall(v22)
					task.wait(0.05)
				end

				flag2 = false
			end)
		end
	end

	GetMag = function(arg, arg2)
		return (arg.Position - arg2.Position).Magnitude
	end

	sno = function(arg)
		setNetworkOwner2:FireServer(arg, arg.CFrame)
	end

	CheckForHome = function()
		for i = 1, 5 do
			local plots = workspace.Plots and workspace.Plots:FindFirstChild("Plot" .. i)

			if plots then
				local thisPlotsOwners = plots.PlotSign and plots.PlotSign:FindFirstChild("ThisPlotsOwners")

				if thisPlotsOwners then
					for _, child in pairs(thisPlotsOwners:GetChildren()) do
						if child.Value == localPlayer2.Name then
							local plotItems = workspace:FindFirstChild("PlotItems")
							if plotItems then
								return plotItems:FindFirstChild("Plot" .. i)
							end
						end
					end
				end
			end
		end
	end

	SpawnToy = function(arg)
		local inPlot = localPlayer2:FindFirstChild("InPlot")
		local inOwnedPlot = localPlayer2:FindFirstChild("InOwnedPlot")
		local canSpawnToy = localPlayer2:FindFirstChild("CanSpawnToy")

		if inPlot and inPlot.Value and inOwnedPlot and not inOwnedPlot.Value then
			inPlot:GetPropertyChangedSignal("Value"):Wait()
		end

		if canSpawnToy and not canSpawnToy.Value then
			canSpawnToy:GetPropertyChangedSignal("Value"):Wait()
		end

		local v22 = nil

		for _, child in pairs(workspace:GetChildren()) do
			if child.Name == "PlayerCharacterLocationDetector" and GetMag(child, humanoidRootPart) <= 2 then
				v22 = child
				break
			else
				v22 = nil
			end
		end

		local n8 = (v22 or humanoidRootPart).CFrame * CFrame.new(0, 14, 20)
		inOwnedPlot = inOwnedPlot and inOwnedPlot.Value and CheckForHome() or v21
		if not inOwnedPlot then
			return nil
		end
		local v23 = nil

		local connection3 = inOwnedPlot.ChildAdded:Connect(function(child)
			if child.Name == arg then
				v23 = child
			end
		end)

		task.spawn(function()
			pcall(function()
				spawnToyRemoteFunction2:InvokeServer(arg, n8, Vector3.zero)
			end)
		end)

		local now = tick()

		while true do
			task.wait()
			if not (v23 or tick() - now > 3) then
				continue
			end
			break
		end

		connection3:Disconnect()
		return v23
	end

	BuildPlayerList = function()
		local tbl18 = {}

		for _, player in pairs(Players2:GetPlayers()) do
			if player ~= localPlayer2 then
				table.insert(tbl18, player.Name .. " (@" .. player.DisplayName .. ")")
			end
		end

		if #tbl18 == 0 then
			table.insert(tbl18, "No Players")
		end

		return tbl18
	end

	CleanupPencils = function()
		local tbl18 = {}

		for _, child in ipairs(v21:GetChildren()) do
			if child.Name == "ToolPencil" then
				table.insert(tbl18, child)
			end
		end

		local v22 = CheckForHome()

		if v22 then
			for _, child in ipairs(v22:GetChildren()) do
				if child.Name == "ToolPencil" then
					table.insert(tbl18, child)
				end
			end
		end

		for _, v23 in ipairs(tbl18) do
			pcall(function()
				destroyToy:FireServer(v23)
			end)
		end

		local now = tick()

		while true do
			task.wait(0.05)
			local flag3 = true

			for _, v23 in ipairs(tbl18) do
				v23 = v23 and v23.Parent
				if v23 then
					flag3 = false
					break
				end
			end

			if not flag3 then
				if not (tick() - now > 3) then
					continue
				end
			end

			break
		end
	end

	DoSticky = function(arg, arg2)
		for i = 1, 5 do
			pcall(function()
				sno(arg)
				task.wait(0.05)
				stickyPartEvent:FireServer(arg, arg2, CFrame.new(0, (0/0), 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
			end)

			task.wait(0.1)
			if arg:FindFirstChild("StickyWeld") then
				return true
			end
		end

		return false
	end

	SpawnAndStickPencil = function(arg)
		if not arg or not arg.Character then
			return false
		end
		local head_ = arg.Character:FindFirstChild("Head")
		if not head_ then
			return false
		end
		local flag3 = false
		local flag4 = false

		enqueueSpawn(function()
			CleanupPencils()
			local ToolPencil = SpawnToy("ToolPencil")
			if not ToolPencil then
				flag4 = true
				return
			end
			local stickyPart = ToolPencil:FindFirstChild("StickyPart") or ToolPencil:WaitForChild("StickyPart", 3)
			if not stickyPart then
				flag4 = true
				return
			end

			if not arg.Character or not arg.Character:FindFirstChild("Head") then
				flag4 = true
				return
			end
			head_ = arg.Character:FindFirstChild("Head")
			flag3 = DoSticky(stickyPart, head_)
			flag4 = true
		end)

		local now = tick()

		while true do
			task.wait(0.05)
			if not (flag4 or tick() - now > 15) then
				continue
			end
			break
		end

		return flag3
	end

	local tbl18 = { TP = nil, TE = false, SE = false, BME = false, BMSE = false }

	tpToys = function(arg)
		while true do
			local te

			if arg == "BallSnowball" then
				te = tbl18.TE
			else
				te = false

				if arg == "BombDarkMatter" then
					te = tbl18.BME
				end
			end

			if te then
				local v22 = Workspace2:FindFirstChild(localPlayer2.Name .. "SpawnedInToys")

				if v22 and tbl18.TP then
					local character2 = Players2:FindFirstChild(tbl18.TP)
					character2 = character2 and character2.Character
					local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart2 then
						for _, child in ipairs(v22:GetChildren()) do
							if child:IsA("Model") and child.Name == arg then
								for _, descendant in ipairs(child:GetDescendants()) do
									if descendant:IsA("BasePart") then
										descendant.Position = humanoidRootPart2.Position
									end
								end
							end
						end
					end
				end

				task.wait(0.1)
				continue
			end

			break
		end
	end

	spawnToy = function(arg)
		local flag3 = false

		enqueueSpawn(function()
			SpawnToy(arg)
			flag3 = true
		end)

		local now = tick()

		while true do
			task.wait(0.05)
			if not (flag3 or tick() - now > 10) then
				continue
			end
			break
		end
	end

	autoSpawnToys = function(arg, arg2)
		while tbl18[arg2] do
			spawnToy(arg)
			task.wait(1)
		end
	end

	local tbl19 = { AntiAntiKickBlackhole = false, selectedPlrName = nil }
	local tbl20 = { BlackholeTask = nil }

	StartBlackhole = function()
		if tbl20.BlackholeTask then
			task.cancel(tbl20.BlackholeTask)
			tbl20.BlackholeTask = nil
		end

		tbl20.BlackholeTask = task.spawn(function()
			local v22 = Players2:FindFirstChild(tbl19.selectedPlrName)
			if not v22 then
				tbl19.AntiAntiKickBlackhole = false
				return
			end
			local character2 = nil

			while true do
				if tbl19.AntiAntiKickBlackhole and v22 and v22.Parent then
					local character3 = v22.Character

					if character3 ~= character2 then
						character2 = character3

						if character3 then
							task.wait(0.3)
						end
					end

					if not v22.Character then
						local connection3 = nil
						local flag3 = false

						connection3 = v22.CharacterAdded:Connect(function()
							flag3 = true
							character2 = v22.Character
							connection3:Disconnect()
						end)

						local now = tick()

						while true do
							if not flag3 and tbl19.AntiAntiKickBlackhole then
								task.wait(0.1)
								if not (tick() - now > 30) then
									continue
								end
							end

							break
						end

						task.wait(0.3)
					end

					if tbl19.AntiAntiKickBlackhole then
						if not v22.Character then
							task.wait(0.5)
							continue
						else
							if not v22.Character:FindFirstChild("Head") then
								local now = tick()

								while true do
									task.wait(0.05)
									if not (v22.Character and v22.Character:FindFirstChild("Head") or not tbl19.AntiAntiKickBlackhole or tick() - now > 5) then
										continue
									end
									break
								end
							end

							if tbl19.AntiAntiKickBlackhole then
								local character4 = v22.Character
								local humanoid_ = character4 and character4:FindFirstChildOfClass("Humanoid")
								local flag3 = false

								local function fn_()
									if flag3 then
										return
									end
									flag3 = true
									if not tbl19.AntiAntiKickBlackhole then
										return
									end
									tbl19.RagdollKillCounts = tbl19.RagdollKillCounts or {}
									local name = v22.Name
									tbl19.RagdollKillCounts[name] = (tbl19.RagdollKillCounts[name] or 0) + 1

									if _G.RagdollTargetCard then
										_G.RagdollTargetCard:SetText({ "Total Kills: " .. tostring(tbl19.RagdollKillCounts[name]) })
									end

									if tbl19.RagdollKillNotify then
										if KickNotify then
											KickNotify({
												Title = "Ragdoll Kill",
												Description = v22.DisplayName .. " Died!\nCount: " .. tostring(tbl19.RagdollKillCounts[name]),
												Time = 5,
											})
										end
									end
								end

								local connection3 = nil
								local connection4 = nil

								if humanoid_ then
									connection3 = humanoid_.Died:Connect(fn_)

									connection4 = humanoid_:GetPropertyChangedSignal("Health"):Connect(function()
										if humanoid_.Health <= 0 then
											fn_()
										end
									end)

									if humanoid_.Health <= 0 then
										fn_()
									end
								end

								SpawnAndStickPencil(v22)

								if not tbl19.AntiAntiKickBlackhole then
									if connection3 then
										connection3:Disconnect()
									end

									if connection4 then
										connection4:Disconnect()
									end

									break
								else
									local now = tick()

									while true do
										if tbl19.AntiAntiKickBlackhole and v22.Character == character4 and v22.Parent then
											if not flag3 then
												task.wait(0.1)

												if tick() - now >= 2 then
													SpawnAndStickPencil(v22)
													now = tick()
												end

												continue
											end
										end

										break
									end

									if connection3 then
										connection3:Disconnect()
									end

									if connection4 then
										connection4:Disconnect()
									end

									if tbl19.AntiAntiKickBlackhole and v22.Parent then
										task.wait(0.2)
									end

									continue
								end
							end
						end
					end
				end

				break
			end
		end)
	end

	local v22 = tbl15.Attack:AddLeftGroupbox("Ragdoll Kill")
	_G.RagdollTargetCard = tbl15.Attack:AddRightGroupbox("RAGDOLL KILL INFO"):AddTargetCard({ Text = { "Total Kills: 0" } })

	v22:AddDropdown("RagdollTargetDropdown", {
		Values = BuildPlayerList(),
		Default = 1,
		Multi = false,
		Text = "Select Target",
		Searchable = true,
		Callback = function(arg)
			local match = arg:match("^(.-)%s")
			tbl19.selectedPlrName = match
			tbl18.TP = match

			if _G.RagdollTargetCard then
				_G.RagdollTargetCard:NewTarget(match)
				tbl19.RagdollKillCounts = tbl19.RagdollKillCounts or {}
				_G.RagdollTargetCard:SetText({ "Total Kills: " .. tostring(tbl19.RagdollKillCounts[match] or 0) })
			end
		end,
	})

	v22:AddToggle("BlackholeToggle", {
		Text = "Ragdoll Kill (Basket Ball)",
		Default = false,
		Callback = function(antiAntiKickBlackhole)
			if antiAntiKickBlackhole and not tbl19.selectedPlrName then
				_NOTIFY("Please select a target first!", 3)
				options.BlackholeToggle:SetValue(false)
				return
			end

			tbl19.AntiAntiKickBlackhole = antiAntiKickBlackhole

			if antiAntiKickBlackhole then
				StartBlackhole()
			elseif tbl20.BlackholeTask then
				task.cancel(tbl20.BlackholeTask)
				tbl20.BlackholeTask = nil
			end
		end,
	})

	v22:AddToggle("RagdollKillNotify", {
		Text = "Ragdoll Kill Notify",
		Default = false,
		Callback = function(ragdollKillNotify)
			tbl19.RagdollKillNotify = ragdollKillNotify
		end,
	})

	v22:AddToggle("SnowballRagdoll", {
		Text = "Snowball Ragdoll",
		Default = false,
		Callback = function(te)
			tbl18.TE = te

			if te then
				task.spawn(function()
					tpToys("BallSnowball")
				end)
			end
		end,
	})

	v22:AddToggle("AutoSpawnSnowballs", {
		Text = "Auto Spawn Snowballs",
		Default = false,
		Callback = function(se)
			tbl18.SE = se

			if se then
				task.spawn(function()
					autoSpawnToys("BallSnowball", "SE")
				end)
			end
		end,
	})

	v22:AddToggle("BombDarkMatterRagdoll", {
		Text = "BombDarkMatter Ragdoll",
		Default = false,
		Callback = function(bme)
			tbl18.BME = bme

			if bme then
				task.spawn(function()
					tpToys("BombDarkMatter")
				end)
			end
		end,
	})

	v22:AddToggle("AutoSpawnBombDarkMatter", {
		Text = "Auto Spawn BombDarkMatter",
		Default = false,
		Callback = function(bmse)
			tbl18.BMSE = bmse

			if bmse then
				task.spawn(function()
					autoSpawnToys("BombDarkMatter", "BMSE")
				end)
			end
		end,
	})

	Players2.PlayerAdded:Connect(function()
		task.wait(1)

		if options.RagdollTargetDropdown then
			options.RagdollTargetDropdown:SetValues(BuildPlayerList())
		end
	end)

	Players2.PlayerRemoving:Connect(function()
		task.wait(0.5)

		if options.RagdollTargetDropdown then
			options.RagdollTargetDropdown:SetValues(BuildPlayerList())
		end
	end)
end

local tbl17
tbl17 = {}
local isHeld
isHeld = game:GetService("Players").LocalPlayer:WaitForChild("IsHeld", 5)
local tbl18

tbl18 = {
	CounterMethod = "Kill",
	TargetedLimbCA = "All",
	AntiLagSens = 3,
	AGType = "Normal",
	GucciType = "CreatureBlobman",
	AntiInputType = "FoodHamburger",
	InputLgDelay = 0.05,
	AILTransparency = 1,
	NKOffset = 15,
	NKDelayMode = "Normal",
}

local tbl19

tbl19 = {
	AntiGrab = false,
	GucciAntiGrab = false,
	AntiBlobman = false,
	AntiInputLag = false,
	AntiExplosion = false,
	AntiBurn = false,
	AntiVoid = false,
	AntiKick = false,
	AntiKick2 = false,
	AntiSticky = false,
	AntiSnowball = false,
	AntiBanana = false,
	AntiPaint = false,
	AntiPoison = false,
	AntiLag = false,
	AutoAntiLag = true,
	AntiInvis = false,
	AutoReset = true,
	LoopTP = false,
	DestroyVoid = true,
	WaterWalk = false,
	DeleteBarriers = false,
	OtherInvCollisions = false,
	CounterAttack = false,
	LoopApplyMethodT = false,
	LoopApplyMethodTServer = false,
	RagdollInNK = true,
	RagdollInRG = false,
	DeleteShurInNK = true,
}

local tbl20

tbl20 = {
	SelectedPlayers = {},
	TargetMethods = {},
	Whitelisted = {},
	PlayerDropdowns = {},
	WhoGrabbed = nil,
	KickFlags = 0,
	LastKickFlagTime = 0,
	States = { Owning = false, Spawning = false, Ragdolling = false, Escaping = false },
	BrokenPlots = {},
	FailedToys = {},
	GrabbableParts = setmetatable({}, { __mode = "k" }),
	LimbOffsetsRL = {
		Head = CFrame.new(0, 1.5, 0),
		["Left Arm"] = CFrame.new(-1.5, 0, 0),
		["Right Arm"] = CFrame.new(1.5, 0, 0),
		["Left Leg"] = CFrame.new(-0.5, -2, 0),
		["Right Leg"] = CFrame.new(0.5, -2, 0),
		Torso = CFrame.new(),
	},
	NetworkKickQueue = {},
	DestroyThread = nil,
	AKType = "Shuriken",
	AntiKickSettings = {
		Highlight = false,
		HighlightFill = Color3.new(1, 0, 0),
		HighlightOutl = Color3.new(1, 1, 1),
		HighlightFT = 0.5,
		HighlightOT = 0,
		Transparency = 0.9,
	},
}

local tbl21, tbl22, DisblVoid, tbl23, v21

do
	local resonanceExtractAdapters = getgenv and getgenv().ResonanceExtractAdapters or {}
	tbl21 = {}
	tbl22 = {}
	local tbl24 = {}
	local obj = setmetatable({}, { __mode = "k" })
	local obj2 = setmetatable({}, { __mode = "k" })
	local tbl25 = {}
	local tbl26 = {}
	DisblVoid = nil

	notify = function(arg, arg2)
		if _NOTIFY then
			local v22 = _NOTIFY
			arg2 = arg2 and arg2 .. ": " or ""
			v22(arg2 .. tostring(arg), 3)
		else
			warn((arg2 and arg2 .. ": " or "") .. tostring(arg))
		end
	end

	methodSelected = function(arg, arg2)
		if type(arg) ~= "table" then
			return arg == arg2
		end

		if arg[arg2] ~= nil then
			return arg[arg2] == true or arg[arg2] == arg2
		end

		for k, v22 in pairs(arg) do
			if k == arg2 or v22 == arg2 then
				return true
			end
		end

		return false
	end

	tbl23 = {}
	v21 = nil

	locateRemoteRoot = function()
		isRemoteRoot = function(arg)
			return arg and arg:FindFirstChild("GrabEvents") and arg:FindFirstChild("MenuToys") and arg:FindFirstChild("CharacterEvents")
		end

		if isRemoteRoot(replicatedStorage) then
			return replicatedStorage
		end

		for _, descendant in ipairs(replicatedStorage:GetDescendants()) do
			if isRemoteRoot(descendant) then
				return descendant
			end
		end

		return replicatedStorage
	end

	refreshRemotes = function()
		v21 = locateRemoteRoot()
		local grabEvents2 = replicatedStorage:FindFirstChild("GrabEvents")
		local menuToys = v21 and v21:FindFirstChild("MenuToys")
		local characterEvents = v21 and v21:FindFirstChild("CharacterEvents")
		local playerEvents = v21 and v21:FindFirstChild("PlayerEvents")
		tbl23.sno = grabEvents2 and grabEvents2:FindFirstChild("SetNetworkOwner") or nil
		tbl23.cgl = grabEvents2 and grabEvents2:FindFirstChild("CreateGrabLine") or nil
		tbl23.dgl = grabEvents2 and grabEvents2:FindFirstChild("DestroyGrabLine") or nil
		tbl23.Struggle = characterEvents and characterEvents:FindFirstChild("Struggle") or nil
		tbl23.RagdollRemote = characterEvents and characterEvents:FindFirstChild("RagdollRemote") or nil
		tbl23.spe = playerEvents and playerEvents:FindFirstChild("StickyPartEvent") or nil
		tbl23.spawnEvent = menuToys and menuToys:FindFirstChild("SpawnToyRemoteFunction") or nil
		tbl23.destroyToyEvent = menuToys and menuToys:FindFirstChild("DestroyToy") or nil
		return v21
	end

	refreshRemotes()

	fireRemote = function(arg, ...)
		if not arg then
			return false, nil
		end

		local ok2, result2 = pcall(function(...)
			if arg:IsA("RemoteFunction") then
				return arg:InvokeServer(...)
			end
			arg:FireServer(...)
			return true
		end, ...)

		return ok2, result2
	end

	tbl17.charp = function(arg)
		local character = arg or localPlayer
		character = character and character.Character
		if not character then
			return nil, nil, nil
		end
		return character, character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso"), (character:FindFirstChildWhichIsA("Humanoid"))
	end

	tbl17.getMagnitude = function(arg, arg2)
		if not arg or not arg2 or not arg:IsA("BasePart") or not arg2:IsA("BasePart") then
			return math.huge
		end
		return (arg.Position - arg2.Position).Magnitude
	end

	tbl17.isnetworkowner = function(arg)
		if typeof(arg) ~= "Instance" or not arg:IsA("BasePart") then
			return false
		end
		local assemblyRootPart = arg

		if arg.Massless and arg.AssemblyRootPart then
			assemblyRootPart = arg.AssemblyRootPart
		end

		if not assemblyRootPart or assemblyRootPart.Anchored then
			return false
		end

		if type(isnetworkowner) == "function" then
			local ok2, result2 = pcall(isnetworkowner, assemblyRootPart)
			if ok2 and type(result2) == "boolean" then
				return result2
			end
		end

		local ok2, result2 = pcall(function()
			return assemblyRootPart.ReceiveAge
		end)

		return ok2 and result2 == 0
	end

	tbl17.ispartowner = function(arg)
		if typeof(arg) ~= "Instance" or not arg:IsA("BasePart") then
			return false
		end

		if arg.Name == "HumanoidRootPart" then
			local parent = arg.Parent

			if parent then
				local head_ = parent:FindFirstChild("Head")

				if head_ then
					local partOwner = head_:FindFirstChild("PartOwner")
					if partOwner then
						return partOwner.Value == localPlayer.Name
					end
				end
			end
		end

		local partOwner = arg:FindFirstChild("PartOwner")
		if partOwner and partOwner.Value == localPlayer.Name then
			return true
		end
		local parent = arg.Parent
		if not parent then
			return false
		end
		local partOwner2 = parent:FindFirstChild("PartOwner", true)
		if not partOwner2 then
			return false
		end
		return partOwner2.Value == localPlayer.Name
	end

	tbl17.WhichPlot = function(arg)
		if typeof(arg) ~= "Instance" or not arg:IsA("Player") then
			return nil, nil
		end
		local plots = Workspace:FindFirstChild("Plots")
		if not plots then
			return nil, nil
		end

		for _, child in pairs(plots:GetChildren()) do
			local plotArea = child:FindFirstChild("PlotArea")

			if plotArea and plotArea:IsA("BasePart") then
				local ok2, result2 = pcall(function()
					return Workspace:GetPartsInPart(plotArea)
				end)

				if ok2 and type(result2) == "table" then
					for _, v22 in pairs(result2) do
						v22 = v22 and v22.Parent
						if (v22 and Players:GetPlayerFromCharacter(v22)) == arg then
							local inOwnedPlot = arg:FindFirstChild("InOwnedPlot")
							return child, inOwnedPlot and inOwnedPlot.Value
						end
					end
				end
			end
		end

		return nil, nil
	end

	removeSpawnSound = function(arg)
		task.spawn(function()
			local main = arg and arg:WaitForChild("Main", 0.4)
			local itemSpawnSound = main and main:WaitForChild("ItemSpawnSound", 0.4)

			if itemSpawnSound then
				itemSpawnSound:Destroy()
			end
		end)
	end

	tbl17.BreakPlot = function(arg)
		if resonanceExtractAdapters.BreakPlot then
			return resonanceExtractAdapters.BreakPlot(arg)
		end

		if typeof(arg) ~= "Instance" then
			return false
		end
		local v22 = arg
		local inPlot = nil

		if arg:IsA("Player") then
			inPlot = arg:FindFirstChild("InPlot")
			if not inPlot then
				return false
			end
			v22 = tbl17.WhichPlot(arg)
			if not v22 then
				return false
			end
		end

		if typeof(v22) ~= "Instance" then
			return false
		end

		if tbl20.BrokenPlots[v22.Name] then
			return true
		end
		local plotArea = v22:FindFirstChild("PlotArea")
		if not plotArea then
			return false
		end
		refreshRemotes()
		if not tbl23.spe then
			return false
		end
		local NinjaShuriken = tbl17.st("NinjaShuriken")
		if not NinjaShuriken then
			return false
		end
		removeSpawnSound(NinjaShuriken)
		NinjaShuriken.Parent = nil
		local stickyPart = NinjaShuriken:WaitForChild("StickyPart", 0.4)
		local stickyWeld = stickyPart and stickyPart:WaitForChild("StickyWeld", 0.4)
		if not stickyPart or not stickyWeld then
			tbl17.dt(NinjaShuriken)
			return false
		end
		local cframe = CFrame.new(1099511627776, 1099511627776, 1099511627776)

		if v22.Name == "Plot5" then
			cframe = CFrame.new(2147483648, 2147483648, 2147483648)
		end

		if not tbl17.sno(stickyPart) then
			tbl17.dt(NinjaShuriken)
			return false
		end
		fireRemote(tbl23.spe, stickyPart, plotArea, cframe)
		local now = tick()

		while true do
			if stickyWeld.Parent and tick() - now <= 0.8 then
				if not (stickyWeld.Part1 == plotArea and (not inPlot or inPlot.Value ~= true)) then
					task.wait()
					continue
				end
			end

			break
		end

		if not stickyWeld.Parent or stickyWeld.Part1 ~= plotArea or inPlot and inPlot.Value == true then
			tbl17.dt(NinjaShuriken)
			return false
		end
		tbl20.BrokenPlots[v22.Name] = NinjaShuriken

		pcall(function()
			NinjaShuriken.Destroying:Once(function()
				if tbl20.BrokenPlots[v22.Name] == NinjaShuriken then
					tbl20.BrokenPlots[v22.Name] = nil
				end
			end)
		end)

		return NinjaShuriken
	end

	performOwnershipGrabLoop = function(arg, arg2, arg3, arg4, arg5, arg6)
		local cframe = CFrame.new()
		local cframe2 = CFrame.new()
		local cframe3 = CFrame.new()
		local connection3 = nil

		setupHiddenMove = function()
			cframe = arg3.CFrame
			cframe2 = arg4.CFrame
			cframe3 = arg3.CFrame

			pcall(function()
				runService:UnbindFromRenderStep("RSCClient")
			end)

			runService:BindToRenderStep("RSCClient", Enum.RenderPriority.Camera.Value - 1, function()
				if arg3.Parent then
					arg3.CFrame = cframe
				end

				if arg4.Parent then
					arg4.CFrame = cframe2
				end
			end)

			connection3 = runService.Heartbeat:Connect(function()
				if not arg3.Parent or not arg4.Parent then
					return
				end
				cframe = arg3.CFrame
				cframe2 = arg4.CFrame
				arg3.CFrame = cframe3
				arg4.CFrame = cframe3
			end)
		end

		cleanupHiddenMove = function()
			pcall(function()
				runService:UnbindFromRenderStep("RSCClient")
			end)

			if connection3 then
				connection3:Disconnect()
				connection3 = nil
			end

			if arg4.Parent then
				arg4.CFrame = cframe2
			end

			if arg3.Parent then
				arg3.CFrame = cframe
			end
		end

		local n8 = tonumber(arg2) or 0.65
		local now = tick()

		local ok2, result2 = pcall(function()
			if arg6 then
				setupHiddenMove()
			end

			while arg.Parent and not tbl17.ispartowner(arg) and arg5.Health ~= 0 and arg3.Parent and tick() - now < n8 do
				if arg6 then
					cframe3 = arg.CFrame - Vector3.new(0, 22, 0)
				end

				runService.Heartbeat:Wait()
				tbl17.grab(arg, arg6 and cframe3 or nil)
			end
		end)

		if arg6 then
			pcall(cleanupHiddenMove)
		end

		return ok2, result2
	end

	tbl17.sno = function(arg, arg2)
		if resonanceExtractAdapters.sno then
			return resonanceExtractAdapters.sno(arg, arg2)
		end

		if typeof(arg) ~= "Instance" or not arg:IsA("BasePart") or not arg.Parent then
			return false
		end
		local v22, v23, v24 = tbl17.charp()
		local head_ = v22 and v22:FindFirstChild("Head")
		local ragdolled = v24 and v24:FindFirstChild("Ragdolled")
		if not v22 or not head_ or not v23 or not v24 or not ragdolled or v24.Health <= 0 then
			return false
		end
		local spawnLocation = Workspace:FindFirstChild("SpawnLocation")
		if not spawnLocation or tbl17.getMagnitude(arg, spawnLocation) > 10000000 then
			return false
		end

		if tbl17.ispartowner(arg) then
			return true
		end
		local flag2 = (v23.Position - arg.Position).Magnitude >= 31
		if flag2 and tbl20.States.Owning == true then
			return false
		end
		local flag3 = arg.Name == "HumanoidRootPart" or arg.Name == "Torso"
		local v25 = nil

		if flag3 then
			local parent = arg.Parent and Players:FindFirstChild(arg.Parent.Name)
			local isPlayer = parent and parent:IsA("Player")
			v25 = nil

			if isPlayer then
				local v26, v27, v28 = tbl17.charp(parent)
				if not v28 or v28.Health == 0 then
					return false
				end
				local inPlot = parent:FindFirstChild("InPlot")
				inPlot = inPlot and inPlot.Value == true
				v25 = nil

				if inPlot then
					v25 = tbl17.BreakPlot(parent)
					if not v25 then
						return false
					end
				end
			end
		end

		tbl20.States.Owning = true
		local v26, v27 = performOwnershipGrabLoop(arg, arg2, v23, head_, v24, flag2)
		tbl20.States.Owning = false

		if typeof(v25) == "Instance" then
			task.delay(1, tbl17.dt, v25)
		end

		if not v26 then
			warn("[Resonance sno] " .. tostring(v27))
			return false
		end
		return tbl17.ispartowner(arg)
	end

	tbl17.unsno = function(arg)
		if resonanceExtractAdapters.unsno then
			return resonanceExtractAdapters.unsno(arg)
		end

		if not arg then
			return false
		end
		refreshRemotes()
		if tbl23.dgl then
			return (fireRemote(tbl23.dgl, arg))
		end
		return false
	end

	tbl17.teleport = function(arg, arg2, arg3)
		if not arg then
			return false
		end

		if typeof(arg) == "Instance" and arg:IsA("Model") then
			arg = arg.PrimaryPart or arg:FindFirstChildWhichIsA("BasePart", true)
		end

		if typeof(arg) ~= "Instance" or not arg:IsA("BasePart") then
			return false
		end
		local cframe

		if typeof(arg2) == "CFrame" then
			cframe = arg2
		elseif typeof(arg2) == "Vector3" then
			cframe = CFrame.new(arg2)
		else
			cframe = nil

			if typeof(arg2) == "Instance" then
				if arg2:IsA("BasePart") then
					cframe = arg2.CFrame
				else
					cframe = nil

					if arg2:IsA("Model") then
						cframe = arg2:GetPivot()
					end
				end
			end
		end

		if not cframe then
			return false
		end

		if typeof(arg3) == "CFrame" then
			cframe *= arg3
		end

		arg.CFrame = cframe
		tbl17.resetVelocity(arg)
		return true
	end

	tbl17.resetVelocity = function(arg)
		if arg and arg:IsA("BasePart") then
			arg.AssemblyLinearVelocity = Vector3.zero
			arg.AssemblyAngularVelocity = Vector3.zero
		end
	end

	tbl17.FormatPlayer = function(arg)
		if typeof(arg) ~= "Instance" or not arg:IsA("Player") then
			return tostring(arg)
		end

		if arg == localPlayer then
			return "You"
		end

		if arg.DisplayName == arg.Name then
			return arg.Name
		end
		return string.format("%s (@%s)", arg.DisplayName, arg.Name)
	end

	tbl17.findNicePart = function(arg)
		if typeof(arg) ~= "Instance" or not arg:IsA("Model") then
			return nil
		end
		local v22 = tbl20.GrabbableParts[arg]

		if v22 then
			if v22.Parent and v22:IsA("BasePart") and v22.CanQuery and v22.Name ~= "Button" then
				return v22
			end
			tbl20.GrabbableParts[arg] = nil
		end

		for _, child in pairs(arg:GetChildren()) do
			if child:IsA("BasePart") and child.CanQuery and child.Name ~= "Button" then
				tbl20.GrabbableParts[arg] = child
				return child
			end
		end

		return nil
	end

	tbl17.DestroyObject = function(arg)
		if resonanceExtractAdapters.DestroyObject then
			return resonanceExtractAdapters.DestroyObject(arg)
		end

		if typeof(arg) ~= "Instance" or not arg:IsA("Model") then
			return false
		end
		local v22 = tbl17.findNicePart(arg)
		if not v22 or not tbl17.sno(v22) then
			return false
		end

		if DisblVoid and type(DisblVoid.SetDisabled) == "function" then
			pcall(function()
				DisblVoid:SetDisabled(true)
			end)
		end

		Workspace.FallenPartsDestroyHeight = (0/0)
		arg:PivotTo(CFrame.new(0, -11111, 0))

		if tbl20.DestroyThread then
			pcall(task.cancel, tbl20.DestroyThread)
		end

		tbl20.DestroyThread = task.delay(0.25, function()
			Workspace.FallenPartsDestroyHeight = -10000
			task.wait()
			Workspace.FallenPartsDestroyHeight = tbl19.DestroyVoid and (0/0) or -100

			if DisblVoid and type(DisblVoid.SetDisabled) == "function" then
				pcall(function()
					DisblVoid:SetDisabled(false)
				end)
			end
		end)

		return true
	end

	tbl17.getInventory = function(arg)
		if resonanceExtractAdapters.getInventory then
			return resonanceExtractAdapters.getInventory(arg)
		end

		if typeof(arg) ~= "Instance" or not arg:IsA("Player") then
			return nil, nil
		end
		local v22 = Workspace:FindFirstChild(arg.Name .. "SpawnedInToys")
		local plots = Workspace:FindFirstChild("Plots")
		local plotItems = Workspace:FindFirstChild("PlotItems")
		local v23 = plots and plotItems
		local v24 = nil

		if v23 then
			v24 = nil

			for _, child in pairs(plots:GetChildren()) do
				local plotSign = child:FindFirstChild("PlotSign")
				plotSign = plotSign and plotSign:FindFirstChild("ThisPlotsOwners")

				if plotSign then
					for _, child2 in pairs(plotSign:GetChildren()) do
						if child2:IsA("StringValue") and child2.Value == arg.Name then
							v24 = plotItems:FindFirstChild(child.Name)
						end
					end
				end
			end
		end

		return v22, v24
	end

	tbl17.kill = function(arg)
		local v22, v23, v24 = tbl17.charp(arg)

		if v24 and v24.Health ~= 0 and v23 then
			if Workspace:FindFirstChild("SpawnLocation") then
				tbl17.getMagnitude(Workspace.SpawnLocation, v23)
			end

			if tbl17.sno(v23) then
				v24.BreakJointsOnDeath = false
				v24.Sit = false
				v24:ChangeState(Enum.HumanoidStateType.Dead)
				tbl17.teleport(v23, CFrame.new(0, 9e9, 0))
				task.delay(2, tbl17.unsno, v23)
			end
		end
	end

	tbl17.void = function(arg)
		local v22, v23, v24 = tbl17.charp(arg)

		if v24 and v24.Health ~= 0 and v23 then
			local spawnLocation = Workspace:FindFirstChild("SpawnLocation")

			if (not spawnLocation or tbl17.getMagnitude(spawnLocation, v23) < 15000) and tbl17.sno(v23) then
				tbl17.teleport(v23, CFrame.new(0, 9e9, 0))
				v23.Velocity = Vector3.new(0, 9e9, 0)
				task.delay(0.35, tbl17.unsno, v23)
			end
		end
	end

	tbl17.grab = function(arg, arg2)
		if resonanceExtractAdapters.grab then
			return resonanceExtractAdapters.grab(arg, arg2)
		end
		local v22, v23, v24 = tbl17.charp()
		if not v23 or not v24 or v24.Health == 0 then
			return
		end

		if not arg or not arg.Parent or not arg:IsA("BasePart") then
			return
		end
		refreshRemotes()
		if not tbl23.sno then
			return
		end
		arg2 = arg2 or v23.CFrame
		if typeof(arg2) ~= "CFrame" then
			return
		end
		local position = arg.Position
		local cframe = CFrame.new((arg2 * CFrame.new(0, 1.593, 0)).Position, position)
		tbl23.sno:FireServer(arg, cframe)
	end

	limbMatchesMode = function(arg, arg2)
		if not arg:IsA("BasePart") then
			return false
		end
		local flag2 = arg.Name:find("Arm") ~= nil
		local flag3 = arg.Name:find("Leg") ~= nil
		if arg2 == "Arms" then
			return flag2
		end

		if arg2 == "Legs" then
			return flag3
		end

		if arg2 == "All" then
			return flag2 or flag3
		end
		return false
	end

	tbl17.breaklimb = function(arg, arg2)
		if resonanceExtractAdapters.breaklimb then
			return resonanceExtractAdapters.breaklimb(arg, arg2)
		end
		local flag2 = arg == localPlayer
		if flag2 and tbl19.GucciAntiGrab then
			notify("Can't break limbs while in Gucci!")
			return false
		end
		local v22, v23, v24 = tbl17.charp(arg)
		local ragdolled = v24 and v24:FindFirstChild("Ragdolled")
		if not v23 or not v24 or v24.Health == 0 or not ragdolled then
			return false
		end
		local children = v22:GetChildren()
		local flag3 = false

		for _, child in ipairs(children) do
			if limbMatchesMode(child, arg2) then
				flag3 = true
				break
			end
		end

		if not flag3 then
			return false
		end

		if flag2 then
			refreshRemotes()
			if not tbl23.RagdollRemote then
				return false
			end
			fireRemote(tbl23.RagdollRemote, v23, 0.35)
			local now = tick()

			while true do
				task.wait()

				if ragdolled.Value then
					break
				elseif tick() - now > 0.5 then
					break
				end
			end
		else
			if not tbl17.sno(v23) then
				return false
			end

			if not tbl17.ragdoll(v22) then
				return false
			end
		end

		if not ragdolled.Value then
			return false
		end

		for _, child in ipairs(children) do
			if limbMatchesMode(child, arg2) then
				child.CFrame = CFrame.new(0, -100000, 0)
			end
		end

		task.wait(0.15)

		if flag2 then
			tbl17.grab(v23)
			task.wait()
			refreshRemotes()

			if tbl23.RagdollRemote then
				fireRemote(tbl23.RagdollRemote, v23, 0)
			end
		else
			Workspace.FallenPartsDestroyHeight = -1000
			tbl17.teleport(v23, CFrame.new(0, -1100, 0))
			task.wait()
			Workspace.FallenPartsDestroyHeight = tbl19.DestroyVoid and (0/0) or -100
			tbl17.unsno(v23)
		end

		return true
	end

	recoveredYield = function(arg)
		local n8 = arg or 0
		local now = tick()

		repeat
			runService.Heartbeat:Wait()
		until n8 <= tick() - now

		return true
	end

	tbl17.ExtraEscape = function()
		local v22, v23, v24 = tbl17.charp()
		if not v23 or not v24 or v24.Health == 0 or tbl20.States.Escaping then
			return
		end
		local inPlot = localPlayer:FindFirstChild("InPlot")
		if not inPlot or inPlot.Value then
			return
		end
		tbl20.States.Escaping = true
		local waypoints = Workspace:FindFirstChild("Waypoints")
		waypoints = waypoints and waypoints:FindFirstChild("TudorHouse")
		if not waypoints then
			tbl20.States.Escaping = false
			return
		end
		local TractorGreen = tbl17.st("TractorGreen", waypoints.CFrame)
		if not TractorGreen then
			tbl20.States.Escaping = false
			return
		end
		local vehicleSeat = TractorGreen:WaitForChild("VehicleSeat", 1)
		if not vehicleSeat then
			tbl20.States.Escaping = false
			return tbl17.dt(TractorGreen)
		end
		local now = tick()
		local flag2 = false
		v24.Sit = false
		vehicleSeat:Sit(v24)

		local connection3 = vehicleSeat.ChildAdded:Connect(function(child)
			if child.Name == "SeatWeld" then
				child.Enabled = false
				flag2 = true
				child:Destroy()
			end
		end)

		while true do
			recoveredYield()

			if flag2 then
				break
			elseif tick() - now > 0.7 then
				break
			end
		end

		connection3:Disconnect()
		v24.Sit = false
		tbl20.States.Escaping = false
		return tbl17.dt(TractorGreen)
	end

	collectInventoryModels = function(arg)
		local v22, v23 = tbl17.getInventory(arg)
		local tbl27 = {}

		if v22 then
			for _, child in ipairs(v22:GetChildren()) do
				table.insert(tbl27, child)
			end
		end

		if v23 then
			for _, child in ipairs(v23:GetChildren()) do
				table.insert(tbl27, child)
			end
		end

		return tbl27
	end

	breakVehicleSeat = function(arg, arg2, arg3, arg4)
		if tbl19.GucciAntiGrab then
			return false
		end

		if not arg or not arg.Parent then
			return false
		end

		if not (arg:IsA("VehicleSeat") or arg:IsA("Seat")) then
			return false
		end

		if arg.Occupant or arg:GetAttribute("broken") then
			return false
		end

		if not arg2 or arg2.Health == 0 or not arg3 then
			return false
		end
		arg2.Sit = false

		if tbl19.RagdollInRG and arg4 then
			tbl17.sno(arg4, 1.5)
		end

		arg.CanCollide = false
		local flag2 = false

		local connection3 = arg.ChildAdded:Connect(function(child)
			if child.Name == "SeatWeld" then
				pcall(function()
					child.Enabled = false
				end)

				child:Destroy()
				flag2 = true
			end
		end)

		local now = tick()

		while arg.Parent and arg2.Parent and not flag2 and tick() - now <= 0.5 do
			runService.Heartbeat:Wait()
			arg:Sit(arg2)
		end

		arg2.Sit = false
		local parent = arg.Parent

		task.delay(0.5, function()
			if arg and parent then
				pcall(function()
					arg.Parent = replicatedStorage
					task.wait()
					arg.Parent = parent
				end)
			end
		end)

		if flag2 then
			arg:SetAttribute("broken", true)

			if connection3 then
				connection3:Disconnect()
			end

			local connection4 = nil

			connection4 = arg.ChildAdded:Connect(function(child)
				if child.Name ~= "SeatWeld" then
					return
				end
				local v22
				v22, v22 = tbl17.charp()
				local part1 = nil

				pcall(function()
					part1 = child.Part1
				end)

				if part1 ~= v22 then
					arg:SetAttribute("broken", false)

					if connection4 then
						connection4:Disconnect()
					end
				end
			end)

			return true
		end

		arg2.Sit = true
		task.wait(0.05)
		arg2.Sit = false

		if connection3 then
			connection3:Disconnect()
		end

		return false
	end

	applySeatBreakerToInventory = function(arg, arg2, arg3, arg4)
		if not arg then
			return
		end

		for _, child in ipairs(arg:GetChildren()) do
			if child:IsA("Model") then
				local vehicleSeat = child:FindFirstChildWhichIsA("VehicleSeat") or child:FindFirstChildWhichIsA("Seat")

				if vehicleSeat then
					breakVehicleSeat(vehicleSeat, arg2, arg3, arg4)
				end
			end
		end
	end

	tbl17.RemoveGucci = function(arg)
		if resonanceExtractAdapters.RemoveGucci then
			return resonanceExtractAdapters.RemoveGucci(arg)
		end
		local v22, v23, v24 = tbl17.charp()
		local v25, v26, v27 = tbl17.charp(arg)
		local v28, v29 = tbl17.getInventory(arg)
		if not v24 or v24.Health <= 0 or not v23 or not v28 or not v27 then
			return false
		end
		local seatPart = v27.SeatPart

		if not seatPart then
			applySeatBreakerToInventory(v28, v24, v23, v26)

			if v29 then
				applySeatBreakerToInventory(v29, v24, v23, v26)
			end

			return nil
		end

		if v27.Sit then
			applySeatBreakerToInventory(v28, v24, v23, v26)

			if v29 then
				applySeatBreakerToInventory(v29, v24, v23, v26)
			end

			return nil
		end

		seatPart:SetAttribute("broken", false)
		return breakVehicleSeat(seatPart, v24, v23, v26)
	end

	tbl17.DeleteSeatables = function(arg)
		if resonanceExtractAdapters.DeleteSeatables then
			return resonanceExtractAdapters.DeleteSeatables(arg)
		end
		local v22, v23, v24 = tbl17.charp()
		local v25, v26 = tbl17.getInventory(arg)
		if not v24 or v24.Health <= 0 or not v23 or not v25 then
			return false
		end

		processFolder = function(arg2)
			if not arg2 then
				return
			end

			for _, child in ipairs(arg2:GetChildren()) do
				if child:IsA("Model") then
					local primaryPart = child.PrimaryPart or tbl17.findNicePart(child)

					if primaryPart and primaryPart:IsA("BasePart") and primaryPart.Velocity.Magnitude <= 10 then
						local vehicleSeat = child:FindFirstChild("VehicleSeat")

						if vehicleSeat and not vehicleSeat.Occupant then
							tbl17.DestroyObject(child)
						end
					end
				end
			end
		end

		processFolder(v25)

		if v26 then
			processFolder(v26)
		end

		return nil
	end

	tbl17.EatAntiInput = function(arg)
		if resonanceExtractAdapters.EatAntiInput then
			return resonanceExtractAdapters.EatAntiInput(arg)
		end
		local character = arg and arg.Character
		character = character and character:FindFirstChild("Left Arm")
		local v22, v23, v24 = tbl17.charp()
		local leftArm = v22 and v22:FindFirstChild("Left Arm")
		leftArm = leftArm and leftArm:FindFirstChild("LeftGripAttachment")
		local plotItems = Workspace:FindFirstChild("PlotItems")
		if not character or not v22 or not leftArm or not v24 or v24.Health == 0 or not plotItems then
			return false
		end
		local flag2 = false

		for _, v25 in pairs(character:GetConnectedParts()) do
			if v25.Name == "HoldPart" and not v25:IsDescendantOf(plotItems) then
				local parent = v25.Parent
				local holdItemRemoteFunction = v25:WaitForChild("HoldItemRemoteFunction", 0.45)
				local dropItemRemoteFunction = v25:WaitForChild("DropItemRemoteFunction", 0.45)
				local rigidConstraint = v25:WaitForChild("RigidConstraint", 0.45)

				if holdItemRemoteFunction and dropItemRemoteFunction and rigidConstraint then
					rigidConstraint.Enabled = false
					local now = tick()

					while v22.Parent and parent.Parent and leftArm.Parent and rigidConstraint.Parent and rigidConstraint.Attachment1 ~= leftArm and v24.Health ~= 0 and tick() - now < 1 do
						task.spawn(function()
							local ok2, result2 = pcall(function()
								holdItemRemoteFunction:InvokeServer(parent, v22)
							end)

							if not ok2 then
								warn("[Resonance Destroy Food/hold] " .. tostring(result2))
							end
						end)

						task.wait()
					end

					if rigidConstraint.Parent and rigidConstraint.Attachment1 == leftArm then
						task.spawn(function()
							local ok2, result2 = pcall(function()
								dropItemRemoteFunction:InvokeServer(parent)
							end)

							if not ok2 then
								warn("[Resonance Destroy Food/drop] " .. tostring(result2))
							end
						end)

						pcall(function()
							dropItemRemoteFunction:Destroy()
						end)

						flag2 = true
					end
				end
			end
		end

		return flag2
	end

	tbl17.RemoveInvisibility = function(arg)
		if resonanceExtractAdapters.RemoveInvisibility then
			return resonanceExtractAdapters.RemoveInvisibility(arg)
		end
		local v22, v23, v24 = tbl17.charp(arg)
		if not v23 or not v24 or v24.Health == 0 then
			return false
		end
		v23.Massless = false
		return true
	end

	destroyNamedMover = function(arg, arg2)
		arg = arg and arg:FindFirstChild(arg2)

		if arg then
			arg:Destroy()
		end
	end

	releaseKickOwnership = function(arg, arg2)
		if arg2 == "Faster but worse" then
			tbl17.unsno(arg)
			return
		end

		if arg2 == "Normal" then
			task.delay(0.2, tbl17.unsno, arg)
			return
		end

		if arg2 == "Slower but better" then
			task.spawn(function()
				task.wait()
				tbl17.unsno(arg)
			end)
		end
	end

	tbl17.ToggleCollisions = function(arg, arg2, arg3, arg4)
		if resonanceExtractAdapters.ToggleCollisions then
			return resonanceExtractAdapters.ToggleCollisions(arg, arg2, arg3, arg4)
		end

		if typeof(arg) ~= "Instance" or not arg:IsA("Model") then
			return
		end

		for _, child in pairs(arg:GetChildren()) do
			if child:IsA("BasePart") then
				if arg2 then
					if child.Name == "Torso" or child.Name == "Head" then
						child.CanCollide = true
					end
				else
					child.CanCollide = false

					if not arg3 then
						local ragdollLimbPart = child:FindFirstChild("RagdollLimbPart")

						if ragdollLimbPart then
							ragdollLimbPart.CanCollide = false
						end
					end
				end

				if child.Name ~= "HumanoidRootPart" then
					local physicalProperties = nil

					if arg4 then
						physicalProperties = PhysicalProperties.new(0.01, 0.01, 0.01, 0.01, 0.01)
					end

					child.CustomPhysicalProperties = physicalProperties
				end
			end
		end
	end

	tbl17.ToggleMotor6D = function(arg, enabled, arg2)
		if resonanceExtractAdapters.ToggleMotor6D then
			return resonanceExtractAdapters.ToggleMotor6D(arg, enabled, arg2)
		end

		if typeof(arg) ~= "Instance" or not arg:IsA("Model") then
			return false
		end
		local humanoid_ = arg:FindFirstChild("Humanoid")
		local torso_ = arg:FindFirstChild("Torso")
		if not humanoid_ or not torso_ then
			return false
		end
		local ragdolled = humanoid_:FindFirstChild("Ragdolled")
		if not ragdolled then
			return false
		end

		if ragdolled.Value ~= true then
			for _, child in pairs(torso_:GetChildren()) do
				if child:IsA("Motor6D") then
					child.Enabled = enabled
				end
			end

			return true
		end

		if not arg2 then
			return false
		end

		for _, v22 in pairs({ "Left Leg", "Right Leg", "Left Arm", "Right Arm", "Head" }) do
			local v23 = arg:FindFirstChild(v22)

			if v23 then
				local ballSocketConstraint = v23:FindFirstChild("BallSocketConstraint")

				if ballSocketConstraint then
					ballSocketConstraint.Enabled = enabled
				end
			end
		end

		return true
	end

	tbl17.RepositionLimbs = function(arg, arg2)
		if resonanceExtractAdapters.RepositionLimbs then
			return resonanceExtractAdapters.RepositionLimbs(arg, arg2)
		end

		if typeof(arg) ~= "Instance" or not arg:IsA("Model") then
			return false
		end
		local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return false
		end
		local weldHRP = humanoidRootPart:FindFirstChild("WeldHRP")
		local torso_ = arg:FindFirstChild("Torso")
		if not torso_ then
			return false
		end
		local neck = torso_:FindFirstChild("Neck")
		if neck and neck.Enabled == true then
			return false
		end

		if weldHRP then
		end

		for k, v22 in pairs(tbl20.LimbOffsetsRL) do
			local v23 = arg:FindFirstChild(k)

			if v23 and v23:IsA("BasePart") then
				v23.CFrame = humanoidRootPart.CFrame * v22

				if arg2 then
					tbl17.resetVelocity(v23)
				end
			end
		end

		return true
	end

	tbl17.removesticky = function(arg)
		if resonanceExtractAdapters.removesticky then
			return resonanceExtractAdapters.removesticky(arg)
		end

		if typeof(arg) ~= "Instance" or not arg:IsA("Model") or not arg.Parent then
			return false
		end
		local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart") or arg:FindFirstChild("Torso")
		if not humanoidRootPart or not humanoidRootPart:IsA("BasePart") then
			return false
		end
		local plotItems = Workspace:FindFirstChild("PlotItems")
		local obj3 = setmetatable({}, { __mode = "k" })

		registerModel = function(arg2)
			if typeof(arg2) ~= "Instance" then
				return
			end
			local parent

			if arg2:IsA("BasePart") then
				parent = arg2.Parent
			else
				parent = arg2
			end

			if parent and parent:IsA("Model") and parent ~= arg and parent.Parent then
				obj3[parent] = true
			end
		end

		for _, descendant in pairs(arg:GetDescendants()) do
			if descendant:IsA("BasePart") then
				for _, v22 in pairs(descendant:GetConnectedParts()) do
					if v22.Name == "StickyPart" then
						for _, child in pairs(v22:GetChildren()) do
							if child:IsA("TouchInterest") then
								child:Destroy()
							end
						end

						registerModel(v22)
					end
				end
			end
		end

		local playerFromCharacter = Players:GetPlayerFromCharacter(arg)

		if playerFromCharacter then
			local v22, v23 = tbl17.getInventory(playerFromCharacter)

			if v22 then
				for _, child in pairs(v22:GetChildren()) do
					registerModel(child)
				end
			end

			if v23 then
				for _, child in pairs(v23:GetChildren()) do
					registerModel(child)
				end
			end
		end

		local flag2 = false

		for k in pairs(obj3) do
			if k.Parent then
				local ok2, result2 = pcall(k.GetPivot, k)

				if ok2 and (result2.Position - humanoidRootPart.Position).Magnitude <= 10 then
					local v22 = tbl17.findNicePart(k)

					if v22 and v22:IsA("BasePart") then
						local rscBV = v22:FindFirstChild("RscBV")

						if rscBV and not rscBV:IsA("BodyVelocity") then
							rscBV:Destroy()
							rscBV = nil
						end

						if not rscBV then
							local bodyVelocity = Instance.new("BodyVelocity")
							bodyVelocity.Velocity = Vector3.new(0, -50000, 0)
							bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
							bodyVelocity.Name = "RscBV"
							bodyVelocity.Parent = v22
						end

						tbl17.ToggleCollisions(k, false)

						if not (plotItems and k:IsDescendantOf(plotItems)) then
							tbl17.grab(v22)
						end

						local stickyPart = k:FindFirstChild("StickyPart")

						if stickyPart then
							for _, child in pairs(stickyPart:GetChildren()) do
								child:Destroy()
							end
						end

						k:PivotTo(CFrame.new(0, -50000, 0))
						task.delay(1, tbl17.unsno, v22)
						flag2 = true
					end
				end
			end
		end

		return flag2
	end

	tbl17.ragdoll = function(arg, arg2)
		if resonanceExtractAdapters.ragdoll then
			return resonanceExtractAdapters.ragdoll(arg, arg2)
		end

		if typeof(arg) ~= "Instance" then
			return
		end
		local torso_, humanoid_

		if arg:IsA("Player") then
			local character = arg.Character
			torso_ = nil
			humanoid_ = nil

			if character then
				torso_ = character:FindFirstChild("Torso")
				humanoid_ = character:FindFirstChild("Humanoid")
			end
		elseif arg:IsA("Model") then
			local head_ = arg:FindFirstChild("Head")
			torso_ = arg:FindFirstChild("Torso")
			humanoid_ = arg:FindFirstChild("Humanoid")
			if not head_ then
				return
			end
		else
			if not arg:IsA("BasePart") then
				return
			end
			local isModel = arg.Parent and arg.Parent:IsA("Model")
			humanoid_ = nil

			if isModel then
				humanoid_ = arg.Parent:FindFirstChild("Humanoid")
				torso_ = arg
			else
				torso_ = arg
			end
		end

		if not torso_ or not torso_:IsA("BasePart") or not torso_.Parent or not humanoid_ then
			return
		end
		local ragdolled = humanoid_:FindFirstChild("Ragdolled")
		if not ragdolled then
			return
		end

		if ragdolled.Value ~= false then
			return
		end

		if tbl20.States.Ragdolling then
			return
		end
		torso_.CanCollide = false
		tbl20.States.Ragdolling = true
		local v22 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
		if not v22 then
			tbl20.States.Ragdolling = false
			return
		end
		local ragdollRSC = v22:FindFirstChild("RagdollRSC") or tbl17.st("PalletLightBrown")
		if not ragdollRSC then
			tbl20.States.Ragdolling = false
			return
		end
		local soundPart = ragdollRSC:WaitForChild("SoundPart", 0.5)

		if not soundPart or not soundPart:IsA("BasePart") then
			tbl20.States.Ragdolling = false
			tbl17.dt(ragdollRSC)
			return
		end

		local main = ragdollRSC:WaitForChild("Main", 0.5)

		if not main or not main:IsA("BasePart") then
			tbl20.States.Ragdolling = false
			tbl17.dt(ragdollRSC)
			return
		end

		if not tbl17.sno(soundPart) then
			tbl20.States.Ragdolling = false
			tbl17.dt(ragdollRSC)
			return
		end

		ragdollRSC.Name = "RagdollRSC"
		local ragdollBP = main:FindFirstChild("RagdollBP")

		if ragdollBP and not ragdollBP:IsA("BodyPosition") then
			ragdollBP:Destroy()
			ragdollBP = nil
		end

		if not ragdollBP then
			local bodyPosition = Instance.new("BodyPosition")
			bodyPosition.Name = "RagdollBP"
			bodyPosition.D = 1500
			bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bodyPosition.Position = Vector3.new(0, 100000, 0)
			bodyPosition.Parent = main
		else
			ragdollBP.D = 1500
			ragdollBP.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			ragdollBP.Position = Vector3.new(0, 100000, 0)
		end

		local now = tick()

		while ragdollRSC.Parent and soundPart.Parent and torso_.Parent and ragdolled.Parent and ragdolled.Value ~= true and tick() - now <= 0.5 do
			soundPart.Position = torso_.Position
			soundPart.Velocity = Vector3.new(0, -10, 0)
			task.wait(0.1)
		end

		tbl20.States.Ragdolling = false
		return ragdolled.Value
	end

	tbl17.st = function(arg, arg2)
		if resonanceExtractAdapters.st then
			return resonanceExtractAdapters.st(arg, arg2)
		end

		if type(arg) ~= "string" or tbl20.FailedToys[arg] then
			return nil
		end
		local v22, v23 = tbl17.charp()
		if not v23 or tbl20.States.Spawning then
			return nil
		end
		local inPlot = localPlayer:FindFirstChild("InPlot")
		local inOwnedPlot = localPlayer:FindFirstChild("InOwnedPlot")
		local flag2 = inPlot ~= nil and inPlot.Value == true

		if flag2 then
			flag2 = not (inOwnedPlot ~= nil and inOwnedPlot.Value == true)
		end

		if flag2 and tbl20.States.Owning then
			return nil
		end
		refreshRemotes()
		if not tbl23.spawnEvent or not tbl23.spawnEvent:IsA("RemoteFunction") then
			return nil
		end
		local v24 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
		if not v24 then
			return nil
		end
		tbl20.States.Spawning = true

		if flag2 then
			tbl20.States.Owning = true
		end

		local connection3 = nil
		local connection4 = nil
		local flag3 = false
		local cFrame = v23.CFrame
		local v25 = nil

		cleanup = function()
			if flag3 then
				pcall(function()
					runService:UnbindFromRenderStep("STClient")
				end)

				flag3 = false
			end

			if connection4 then
				connection4:Disconnect()
				connection4 = nil
			end

			if connection3 then
				connection3:Disconnect()
				connection3 = nil
			end

			if flag2 and v23 and v23.Parent then
				v23.CFrame = cFrame
			end

			tbl20.States.Spawning = false

			if flag2 then
				tbl20.States.Owning = false
			end
		end

		local ok2, result2 = pcall(function()
			local canSpawnToy = localPlayer:FindFirstChild("CanSpawnToy")

			if canSpawnToy then
				while canSpawnToy.Value == false do
					task.wait()
					if not v23.Parent then
						return
					end
				end
			end

			local cframe = flag2 and CFrame.new(0, 25, 0) or v23.CFrame + Vector3.new(0, 15, 0)
			local n8 = CFrame.new((typeof(arg2) == "CFrame" and arg2 or cframe).Position) + Vector3.new(0, 0, 20)
			local rotateOrientPart = Workspace:FindFirstChild("RotateOrientPart")
			local rotation = rotateOrientPart and rotateOrientPart.Rotation or Vector3.zero

			connection3 = v24.ChildAdded:Connect(function(child)
				if child.Name == arg then
					v25 = child

					if connection3 then
						connection3:Disconnect()
						connection3 = nil
					end
				end
			end)

			cFrame = v23.CFrame

			if flag2 then
				local cframe2 = CFrame.new(0, 10, 0)

				pcall(function()
					runService:UnbindFromRenderStep("STClient")
				end)

				runService:BindToRenderStep("STClient", Enum.RenderPriority.Camera.Value - 1, function()
					if v23.Parent then
						v23.CFrame = cFrame
					end
				end)

				flag3 = true

				connection4 = runService.Heartbeat:Connect(function()
					if v23.Parent then
						cFrame = v23.CFrame
						v23.CFrame = cframe2
					end
				end)
			end

			invokeSpawn = function()
				fireRemote(tbl23.spawnEvent, arg, n8, rotation)
			end

			task.spawn(invokeSpawn)
			local now = tick()

			while true do
				runService.Heartbeat:Wait()

				if flag2 then
					task.spawn(invokeSpawn)
				end

				local v26 = v25
				local flag4

				if v25 then
					flag4 = v26
				else
					flag4 = tick() - now > 1.3
				end

				if not flag4 then
					continue
				end
				break
			end
		end)

		cleanup()
		if not ok2 then
			warn(("[Resonance st] %s"):format(tostring(result2)))
			return nil
		end

		if not v25 then
			tbl20.FailedToys[arg] = true

			task.delay(2, function()
				tbl20.FailedToys[arg] = nil
			end)
		end

		return v25
	end

	tbl17.dt = function(arg)
		if resonanceExtractAdapters.dt then
			return resonanceExtractAdapters.dt(arg)
		end

		if typeof(arg) ~= "Instance" or not arg:IsA("Model") then
			return false
		end
		refreshRemotes()
		if not tbl23.destroyToyEvent then
			return false
		end
		return fireRemote(tbl23.destroyToyEvent, arg) == true
	end

	removeTargetAntiKickShuriken = function(arg)
		if not arg then
			return
		end

		destroyStickyOwner = function(arg2)
			if not arg2 or not arg2:IsA("BasePart") then
				return
			end

			for _, v22 in ipairs(arg2:GetConnectedParts()) do
				if v22.Name == "StickyPart" then
					local parent = v22.Parent

					if parent and (parent.Name == "NinjaShuriken" or parent.Name == "ShurikenRSC") then
						tbl17.dt(parent)
					end
				end
			end
		end

		for _, descendant in ipairs(arg:GetDescendants()) do
			if descendant:IsA("BasePart") then
				destroyStickyOwner(descendant)
			end
		end
	end

	cleanupNetworkKickPlayer = function(arg)
		local v22, v23, v24 = tbl17.charp(arg)
		if not v22 or not v23 or not v24 then
			return false
		end
		local kickAP = v23:FindFirstChild("KickAP")
		local kickAO = v23:FindFirstChild("KickAO")
		local weldHRP = v23:FindFirstChild("WeldHRP")

		if kickAP then
			kickAP:Destroy()
		end

		if kickAO then
			kickAO:Destroy()
		end

		local ragdolled = v24:FindFirstChild("Ragdolled")

		if ragdolled and ragdolled.Value == true and weldHRP then
			weldHRP.Enabled = true
		end

		task.spawn(tbl17.ToggleMotor6D, v22, true, true)
		task.spawn(tbl17.ToggleCollisions, v22, true)
		return true
	end

	createNetworkKickMovers = function(parent, position)
		local bodyPosition = Instance.new("BodyPosition")
		bodyPosition.Name = "KickAP"
		bodyPosition.D = 500
		bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bodyPosition.Position = position
		bodyPosition.Parent = parent
		local bodyGyro = Instance.new("BodyGyro")
		bodyGyro.Name = "KickAO"
		bodyGyro.D = 500
		bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		bodyGyro.CFrame = CFrame.new()
		bodyGyro.Parent = parent
		return bodyPosition, bodyGyro
	end

	prepareNetworkKickMovers = function(arg, position)
		local kickAP = arg:FindFirstChild("KickAP")
		local kickAO = arg:FindFirstChild("KickAO")
		local weldHRP = arg:FindFirstChild("WeldHRP")

		if not kickAP or not kickAO then
			if kickAP then
				kickAP:Destroy()
			end

			if kickAO then
				kickAO:Destroy()
			end

			kickAP, kickAO = createNetworkKickMovers(arg, position)
		end

		if weldHRP then
			weldHRP.Enabled = false
		end

		kickAP.Position = position
		return kickAP, kickAO, weldHRP
	end

	getRecoveredKickPosition = function(arg, arg2, arg3)
		local n8 = (arg2 - 1) * 6.2831853071795862 / arg3
		local nkOffset = tbl18.NKOffset
		return arg.Position + Vector3.new(math.cos(n8) * 10, nkOffset, math.sin(n8) * 10)
	end

	performNetworkKickPass = function(arg, arg2, arg3, arg4)
		if resonanceExtractAdapters.NetworkKick then
			return resonanceExtractAdapters.NetworkKick(arg, arg4 == true, false, tbl18, tbl19, tbl20)
		end

		if typeof(arg) ~= "Instance" or not arg:IsA("Player") or arg == localPlayer or not arg.Parent then
			return false
		end
		local v22, v23, v24 = tbl17.charp()
		if not v22 or not v23 or not v24 or v24.Health <= 0 then
			return false
		end
		local inPlot = localPlayer:FindFirstChild("InPlot")
		if inPlot and inPlot.Value == true then
			return false
		end
		local v25, v26, v27 = tbl17.charp(arg)
		if not v25 or not v26 or not v27 or v27.Health <= 0 then
			return false
		end

		if not v25:FindFirstChild("Torso") then
			return false
		end
		local v28 = getRecoveredKickPosition(v23, arg2, arg3)
		prepareNetworkKickMovers(v26, v28)

		if tbl17.getMagnitude(v23, v26) > 33 then
			if not tbl17.sno(v26) then
				return false
			end
			tbl17.teleport(v26, v28)
		end

		tbl17.grab(v26)
		releaseKickOwnership(v26, tbl18.NKDelayMode)

		if tbl19.RagdollInNK then
			task.spawn(tbl17.ragdoll, v25)
		end

		if tbl19.DeleteShurInNK then
			task.spawn(tbl17.removesticky, v25)
		end

		tbl17.ToggleCollisions(v25, false)
		tbl17.RepositionLimbs(v25, true)

		if not arg4 then
			task.delay(0.5, function()
				pcall(cleanupNetworkKickPlayer, arg)
				obj[arg] = nil
			end)
		end

		return true
	end

	tbl17.NetworkKick = function(arg, arg2, arg3)
		if typeof(arg) ~= "Instance" or not arg:IsA("Player") or arg == localPlayer then
			return false
		end
		tbl20.NetworkKickQueue[arg] = { loopCall = arg2 == true, isServer = arg3 == true, queuedAt = tick() }
		return true
	end

	runNetworkKickWorker = function()
		while task.wait() do
			local tbl27 = {}

			for k, v22 in pairs(tbl20.NetworkKickQueue) do
				tbl20.NetworkKickQueue[k] = nil

				if k.Parent and not tbl20.Whitelisted[k] and not obj[k] then
					table.insert(tbl27, { player = k, request = v22 })
				end
			end

			local n8 = #tbl27

			for i, v22 in ipairs(tbl27) do
				local player = v22.player

				if player.Parent and not obj[player] then
					obj[player] = true
					local ok2, result2 = pcall(performNetworkKickPass, player, i, n8, false)
					local flag2 = not ok2

					if flag2 or result2 ~= true then
						obj[player] = nil
					end

					if flag2 then
						warn(("[Resonance Target/Kick] %s: %s"):format(player.Name, tostring(result2)))
					end
				end
			end
		end
	end

	tbl17.queue = function(arg, arg2, arg3)
		if arg == nil or type(arg2) ~= "function" or not arg3 then
			return false
		end
		local tbl27 = tbl25[arg]

		if not tbl27 then
			tbl27 = {}
			tbl25[arg] = tbl27
		end

		if not table.find(tbl27, arg3) then
			table.insert(tbl27, arg3)
		end

		if tbl26[arg] then
			return true
		end
		tbl26[arg] = true

		task.spawn(function()
			while #tbl27 > 0 do
				local v22 = table.remove(tbl27, 1)

				if v22 and v22.Parent then
					local ok2, result2 = pcall(arg2, v22)

					if not ok2 then
						local v23 = tostring
						warn(("[Resonance Target/queue:%s] %s"):format(tostring(arg), v23(result2)))
					end

					task.wait()
				end
			end

			tbl26[arg] = nil
		end)

		return true
	end

	tbl17.clearAllQueues = function(arg)
		if arg then
			tbl22[arg] = (tbl22[arg] or 0) + 1
		else
			for k in pairs(tbl22) do
				tbl22[k] = tbl22[k] + 1
			end
		end

		for _, v22 in pairs(tbl25) do
			table.clear(v22)
		end

		table.clear(tbl20.NetworkKickQueue)
	end

	tbl17.GetTargets = function(arg, arg2)
		local tbl27 = {}

		if arg then
			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= localPlayer and not tbl20.Whitelisted[player] then
					table.insert(tbl27, player)
				end
			end

			return tbl27
		end

		local v22 = pairs
		local tbl28 = arg2 or {}

		for k, v23 in v22(tbl28) do
			local flag2 = v23 ~= false

			if not (typeof(k) == "Instance" and k:IsA("Player")) then
				if type(k) == "string" then
					k = Players:FindFirstChild(k)
				elseif typeof(v23) == "Instance" and v23:IsA("Player") then
					flag2 = true
					k = v23
				else
					k = nil

					if type(v23) == "string" then
						k = Players:FindFirstChild(v23)
						flag2 = true
					end
				end
			end

			if k and flag2 and k ~= localPlayer and not tbl20.Whitelisted[k] then
				table.insert(tbl27, k)
			end
		end

		return tbl27
	end

	tbl17.ProcessPlayer = function(arg, arg2, arg3, arg4)
		if arg4 then
			return
		end

		if not arg or arg == localPlayer or tbl20.Whitelisted[arg] then
			return
		end
		local targetMethods = tbl20.TargetMethods

		if methodSelected(targetMethods, "Kick") then
			if not arg2 or arg3 then
				tbl17.NetworkKick(arg, arg2, arg3)
			end
		end

		if methodSelected(targetMethods, "Kill") then
			if arg2 then
				tbl17.queue("Kill", tbl17.kill, arg)
			else
				tbl17.kill(arg)
			end
		end

		if methodSelected(targetMethods, "Void") then
			if arg2 then
				tbl17.queue("Void", tbl17.void, arg)
			else
				tbl17.void(arg)
			end
		end

		if methodSelected(targetMethods, "Remove Gucci") then
			if arg2 then
				tbl17.queue("Remove Gucci", tbl17.RemoveGucci, arg)
			else
				tbl17.RemoveGucci(arg)
			end
		end

		if methodSelected(targetMethods, "Destroy Food") then
			if arg2 then
				tbl17.queue("Destroy Food", tbl17.EatAntiInput, arg)
			else
				tbl17.EatAntiInput(arg)
			end
		end

		if methodSelected(targetMethods, "Remove Invisibility") then
			tbl17.RemoveInvisibility(arg)
		end

		if methodSelected(targetMethods, "Delete Seatables") then
			if arg2 then
				tbl17.queue("Delete Seatables", tbl17.DeleteSeatables, arg)
			else
				tbl17.DeleteSeatables(arg)
			end
		end

		if methodSelected(targetMethods, "Bring") then
			local v22, v23, v24 = tbl17.charp(arg)
			local v25
			v25, v25 = tbl17.charp()

			if v23 and v25 and v24 and v24.Health ~= 0 and tbl17.sno(v23) then
				tbl17.teleport(v23, v25, CFrame.new(0, 0, -5))
				task.delay(0.2, tbl17.unsno, v23)
			end
		end
	end

	runSelectedNetworkKickLoop = function()
		while task.wait() do
			local flag2 = tbl19.LoopApplyMethodT == true
			local v22 = methodSelected(tbl20.TargetMethods, "Kick")
			local inPlot = localPlayer:FindFirstChild("InPlot")
			inPlot = inPlot and inPlot.Value == true

			for k in pairs(obj2) do
				if not k or not k.Parent or not flag2 or not v22 or inPlot or tbl20.SelectedPlayers[k] ~= true then
					pcall(cleanupNetworkKickPlayer, k)
					obj2[k] = nil
				end
			end

			if flag2 and v22 and not inPlot then
				local v23, v24, v25 = tbl17.charp()

				if v24 and v25 and v25.Health > 0 then
					local tbl27 = {}

					for k, selectedPlayer in pairs(tbl20.SelectedPlayers) do
						if selectedPlayer == true and typeof(k) == "Instance" and k:IsA("Player") and k.Parent then
							table.insert(tbl27, k)
							obj2[k] = true
						end
					end

					local n8 = #tbl27

					if n8 > 0 then
						for i, v26 in ipairs(tbl27) do
							if tbl19.LoopApplyMethodT == true then
								local inPlot2 = localPlayer:FindFirstChild("InPlot")

								if not (inPlot2 and inPlot2.Value == true) then
									local v27, v28, v29 = tbl17.charp()
									if not (not v28 or not v29 or v29.Health <= 0) then
										pcall(performNetworkKickPass, v26, i, n8, true)
										continue
									end
								end
							end

							break
						end

						if tbl18.NKDelayMode == "Slower but better" then
							task.wait()
						end
					end
				end
			end
		end
	end

	safeProcessPlayer = function(arg, arg2, arg3, arg4)
		local ok2, result2 = pcall(tbl17.ProcessPlayer, arg, arg2, arg3, arg4)

		if not ok2 then
			local name = typeof(arg) == "Instance" and arg.Name or tostring(arg)
			local now = tick()

			if now - (tbl24[name] or 0) >= 1 then
				tbl24[name] = now
				warn(("[Resonance Target] %s: %s"):format(name, tostring(result2)))
			end

			return false, result2
		end

		return true, result2
	end
end

validateTargetRuntime = function()
	refreshRemotes()
	local tbl24 = {}

	if not Workspace:FindFirstChild("SpawnLocation") then
		table.insert(tbl24, "workspace.SpawnLocation")
	end

	if not Workspace:FindFirstChild("Plots") then
		table.insert(tbl24, "workspace.Plots")
	end

	if not Workspace:FindFirstChild("PlotItems") then
		table.insert(tbl24, "workspace.PlotItems")
	end

	if not tbl23.sno then
		table.insert(tbl24, "GrabEvents.SetNetworkOwner")
	end

	if not tbl23.dgl then
		table.insert(tbl24, "GrabEvents.DestroyGrabLine")
	end

	if #tbl24 > 0 then
		warn("[Resonance Target/self-check] missing: " .. table.concat(tbl24, ", "))
		return false, tbl24
	end
	return true, tbl24
end

tbl17.ValidateTargetRuntime = validateTargetRuntime
task.spawn(runNetworkKickWorker)
task.spawn(runSelectedNetworkKickLoop)
task.defer(validateTargetRuntime)

syncSelectedPlayers = function(arg)
	table.clear(tbl20.SelectedPlayers)

	if typeof(arg) == "Instance" and arg:IsA("Player") then
		tbl20.SelectedPlayers[arg] = true
	elseif type(arg) == "table" then
		for k, v22 in pairs(arg) do
			if typeof(k) == "Instance" and k:IsA("Player") then
				tbl20.SelectedPlayers[k] = v22 ~= false
			elseif typeof(v22) == "Instance" and v22:IsA("Player") then
				tbl20.SelectedPlayers[v22] = true
			end
		end
	end
end

createPlayerDropdown = function(arg, arg2, arg3, arg4, arg5, arg6)
	if not arg or not arg3 then
		notify("Something went wrong, tell the owner about this notification.")
		return
	end

	local v22 = arg:AddDropdown(arg2 .. "Dropdown", {
		Values = BuildPlayerList(),
		Default = 1,
		Multi = false,
		Text = "Select Target",
		Searchable = true,
		Callback = function(arg7)
			local match = arg7:match("^(.-)%s")
			local v22 = Players:FindFirstChild(match)
			table.clear(tbl20.SelectedPlayers)

			if v22 then
				tbl20.SelectedPlayers[v22] = true
			end

			if arg6 then
				arg6(arg7)
			end
		end,
	})

	Players.PlayerAdded:Connect(function()
		task.wait(1)

		if v22 then
			v22:SetValues(BuildPlayerList())
		end
	end)

	Players.PlayerRemoving:Connect(function()
		task.wait(0.5)

		if v22 then
			v22:SetValues(BuildPlayerList())
		end
	end)

	return v22
end

processLoop = function(arg, arg2, arg3, arg4)
	while tbl19[arg] and tbl22[arg] == arg4 do
		for _, v22 in ipairs(tbl17.GetTargets(arg2, arg3)) do
			if not (not tbl19[arg] or tbl22[arg] ~= arg4) then
				safeProcessPlayer(v22, true, arg2, false)
				continue
			end
			break
		end

		task.wait()
	end
end

createLoopToggle = function(arg, arg2, arg3, arg4, arg5, arg6)
	arg:AddToggle(arg2, {
		Text = arg4 and "Server" or "Selected",
		Default = false,
		Tooltip = (arg4 and "all" or "selected") .. " players",
		Callback = function(arg7)
			tbl19[arg3] = arg7
			tbl22[arg3] = (tbl22[arg3] or 0) + 1
			local v22 = tbl22[arg3]

			if arg7 then
				task.spawn(processLoop, arg3, arg4, arg6, v22)
			else
				tbl17.clearAllQueues(arg3)
			end
		end,
	})
end

createApplyButton = function(arg, arg2, arg3, arg4)
	arg:AddButton({
		Text = arg2 and "Server" or "Selected",
		Func = function()
			local v22 = tbl17.GetTargets(arg2, arg4)
			if #v22 == 0 then
				notify("No valid targets selected.", "Target")
				return
			end

			for _, v23 in ipairs(v22) do
				safeProcessPlayer(v23, false, arg2, arg3)
			end
		end,
	})
end

handleCounterAttackChild = function(arg, arg2)
	if not arg:IsA("StringValue") or arg.Name ~= "PartOwner" then
		return
	end
	local v22 = Players:FindFirstChild(arg.Value)
	if not v22 then
		return
	end
	tbl20.WhoGrabbed = tbl17.FormatPlayer(v22)
	if not tbl19.CounterAttack or tbl20.Whitelisted[v22] then
		return
	end
	local v23, v24 = tbl17.charp(v22)

	if tbl18.CounterMethod == "Kill" then
		tbl17.kill(v22)
	elseif tbl18.CounterMethod == "Void" then
		tbl17.void(v22)
	elseif tbl18.CounterMethod == "Grab" then
		tbl17.grab(v24)
	elseif tbl18.CounterMethod == "Delete Limbs" then
		tbl17.breaklimb(v22, tbl18.TargetedLimbCA)
	elseif tbl18.CounterMethod == "Fling" then
		if v24 and arg2 and tbl17.sno(v24) then
			v24.Velocity = arg2.CFrame.LookVector * 100 + Vector3.new(0, 25, 0)
		end
	elseif tbl18.CounterMethod == "Teleport to Spawn" then
		if v24 and tbl17.sno(v24) then
			tbl17.teleport(v24, CFrame.new(0, 10, 0))
		end
	end
end

bindCounterAttack = function(arg)
	local v22, v23 = tbl17.charp()
	arg = arg and arg:FindFirstChild("Head")
	if not arg then
		return
	end

	if tbl21.CounterAttack then
		tbl21.CounterAttack:Disconnect()
	end

	tbl21.CounterAttack = arg.ChildAdded:Connect(function(child)
		handleCounterAttackChild(child, v23)
	end)
end

if localPlayer.Character then
	task.defer(bindCounterAttack, localPlayer.Character)
end

localPlayer.CharacterAdded:Connect(function(character)
	task.wait()
	bindCounterAttack(character)
end)

getMap = function()
	return Workspace:FindFirstChild("Map")
end

getInOwnedPlotValue = function()
	local inOwnedPlot = localPlayer:FindFirstChild("InOwnedPlot", true)
	if inOwnedPlot and inOwnedPlot:IsA("BoolValue") then
		return inOwnedPlot.Value
	end
	return false
end

isLocallySpawnedToy = function(arg)
	local v22 = Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
	return v22 and arg:IsDescendantOf(v22) or false
end

isGrabbed = function()
	return isHeld.Value == true
end

do
	local connection3 = nil
	local cFrame = nil

	stopAntiGrab = function()
		if connection3 then
			connection3:Disconnect()
			connection3 = nil
		end

		tbl20.States["Anti Grab"] = false
		local v22, v23, v24 = tbl17.charp()

		if v24 then
			if tbl18.AGType == "Anti-Kill" then
				task.delay(0.1, function()
					if v24.Parent then
						v24.Sit = false
					end
				end)
			end

			v24.AutoRotate = true
		end
	end

	startAntiGrabIfNeeded = function()
		if not tbl19.AntiGrab or not isHeld.Value or tbl20.States["Anti Grab"] then
			return
		end
		refreshRemotes()

		if tbl23.Struggle then
			fireRemote(tbl23.Struggle)
		end

		local v22, v23, v24 = tbl17.charp()
		local torso_ = v22 and v22:FindFirstChild("Torso")
		local neck = torso_ and torso_:FindFirstChild("Neck")
		if not v24 or not torso_ then
			return
		end
		v24.RequiresNeck = false
		tbl17.resetVelocity(v23 or torso_)
		cFrame = torso_.CFrame
		tbl20.States["Anti Grab"] = true
		local flag2 = tbl18.AGType == "Escapes Anything, but buggy"
		local sit = tbl18.AGType == "Anti-Kill"
		local flag3 = tbl18.AGType == "No Ragdoll"

		if flag2 then
			task.spawn(tbl17.ExtraEscape)
		end

		local now = tick()

		connection3 = runService.Heartbeat:Connect(function(deltaTime)
			if tbl23.Struggle then
				fireRemote(tbl23.Struggle)
			end

			if v23 and not flag2 and not flag3 and tbl23.RagdollRemote then
				fireRemote(tbl23.RagdollRemote, v23, sit and 0.11 or 0)
			end

			if flag2 then
				if tick() - now > 2 then
					task.spawn(tbl17.ExtraEscape)
					now = tick()
				end
			end

			local moveDirection = v24.MoveDirection
			local n8 = 16

			if v24.WalkSpeed > 16 then
				n8 = v24.WalkSpeed
			end

			if moveDirection.Magnitude > 0 then
				cFrame += moveDirection.Unit * n8 * deltaTime
				local vector = Vector3.new(moveDirection.X, 0, moveDirection.Z)

				if vector.Magnitude > 0 then
					local position = cFrame.Position
					cFrame = cFrame:Lerp(CFrame.lookAt(position, position + vector.Unit), 0.12)
				end
			end

			tbl17.resetVelocity(v23 or torso_)
			torso_.CFrame = cFrame
			v24.Sit = sit
			task.spawn(tbl17.ToggleCollisions, v22, false)

			if not neck or not neck.Enabled then
				task.spawn(tbl17.RepositionLimbs, v22)
			end

			for _, v25 in ipairs(v24:GetPlayingAnimationTracks()) do
				local animation = v25.Animation

				if animation and animation.AnimationId == "rbxassetid://7047322890" then
					v25:Stop()
				end
			end

			if v23 then
				local scream = v23:FindFirstChild("Scream")

				if scream then
					scream.Playing = false
				end
			end

			if not isHeld.Value or not tbl19.AntiGrab then
				tbl20.States["Anti Grab"] = false

				if sit then
					task.delay(0.1, function()
						if v24.Parent then
							v24.Sit = false
						end
					end)
				end

				v24.AutoRotate = true

				if connection3 then
					connection3:Disconnect()
					connection3 = nil
				end
			end
		end)
	end
end

task.spawn(function()
	while task.wait(0.03) do
		if tbl19.AntiGrab then
			startAntiGrabIfNeeded()
		elseif tbl20.States["Anti Grab"] then
			stopAntiGrab()
		end
	end
end)

do
	local n8 = 0
	local v22 = nil

	stopGucciAntiGrab = function()
		n8 += 1

		if v22 then
			local v23 = v22
			v22 = nil
			pcall(v23)
		end
	end

	runGucciAntiGrab = function()
		n8 += 1
		local v23 = n8
		local v24 = nil
		local seat = nil
		local v25 = nil
		local v26 = nil
		local connection3 = nil
		local flag2 = false

		cleanup = function()
			if connection3 then
				connection3:Disconnect()
				connection3 = nil
			end

			if v24 then
				tbl17.dt(v24)
				v24 = nil
			end

			seat = nil
			v25 = nil
			v26 = nil
		end

		v22 = cleanup

		waitTypeChange = function(arg)
			while true do
				task.wait()
				if not (tbl18.GucciType ~= arg or not tbl19.GucciAntiGrab or v23 ~= n8) then
					continue
				end
				break
			end
		end

		hideDescendant = function(arg)
			if arg:IsA("BasePart") then
				arg.Transparency = 1
				arg.CanCollide = false
			elseif arg:IsA("Decal") or arg:IsA("Texture") then
				arg.Transparency = 1
			elseif arg.Name == "ItemSpawnSound" then
				arg:Destroy()
			end
		end

		local exitTo2 = nil
		local exitTo, v27, v28, ragdolled, gucciType, flag3

		while true do
			local flag4 = tbl19.GucciAntiGrab and v23 == n8
			exitTo = nil
			local v29, v30, v31, gucciBP, flag5, cFrame, now, flag6, flag7, flag8, flag9, flag10, plotItems, v32, v33, random, vector, bodyPosition, parent, flag11, occupant, parent2, v34, flag12, seatPart, parent3

			while true do
				flag4 = flag4 and task.wait()

				if flag4 then
					local v35
					v35, v27, v28 = tbl17.charp()

					if not v28 or v28.Health == 0 then
						exitTo = 1
						break
					else
						ragdolled = v28:FindFirstChild("Ragdolled")

						if not v27 or not ragdolled or isHeld.Value or ragdolled.Value or v28.Health <= 0 then
							exitTo = 2
							break
						else
							if v28.Sit then
								v28.Sit = false
							end

							gucciType = tbl18.GucciType
							local flag13 = v24 and v24.Parent and seat and seat.Parent and v26 == gucciType
							local flag14 = false

							if flag13 then
								local occupant2 = seat.Occupant

								if occupant2 == nil or occupant2 == v28 then
									flag14 = true
								end
							end

							if not flag14 then
								cleanup()

								if gucciType == "Train" then
									local map = Workspace:FindFirstChild("Map")
									map = map and map:FindFirstChild("AlwaysHereTweenedObjects")
									map = map and map:FindFirstChild("Train")
									local object = map and map:FindFirstChild("Object")
									object = object and object:FindFirstChild("ObjectModel")

									if not object then
										exitTo = 6
										break
									else
										v24 = object
										seat = v24:FindFirstChildWhichIsA("Seat")
										v25 = nil
										v26 = gucciType

										if not seat then
											exitTo = 7
											break
										else
											v29 = v24
											v30 = seat
											v31 = v25
											flag3 = true

											if v31 then
												gucciBP = v31:FindFirstChild("GucciBP")

												if gucciBP then
													gucciBP:Destroy()
												end
											end

											v30.Transparency = 1
											v30.CanCollide = false
											flag5 = false
											cFrame = v27.CFrame
											now = tick()

											v30.ChildAdded:Once(function(child)
												if child.Name == "SeatWeld" then
													child.Enabled = false
													child:Destroy()
													flag5 = true
												end
											end)

											flag6 = false
											refreshRemotes()

											task.defer(function()
												while v28 and v28.Health > 0 and flag3 and task.wait() do
													flag6 = true

													if tbl23.RagdollRemote then
														fireRemote(tbl23.RagdollRemote, v27, 0)
													end
												end

												flag6 = true
											end)

											while true do
												task.wait()
												flag7 = flag6 or v23 ~= n8
												if not flag7 then
													continue
												end
												break
											end

											if v23 ~= n8 then
												exitTo = 8
												break
											else
												v30:Sit(v28)

												while true do
													task.wait()
													flag8 = v28.Health <= 0 or not v27.Parent or not v29.Parent or not v30.Parent

													if not flag8 then
														flag9 = isHeld.Value or ragdolled.Value or flag5 or tick() - now > 0.75
														if not flag9 then
															continue
														end
													end

													break
												end

												if flag5 then
													v28.Sit = false

													task.delay(0.15, function()
														flag3 = false
														task.wait()

														if tbl23.RagdollRemote and v27.Parent then
															fireRemote(tbl23.RagdollRemote, v27, 0.15)
														end
													end)

													if flag2 then
														tbl17.teleport(v27, cFrame)
													end

													flag10 = tbl18.GucciType ~= "Train" and v31

													if flag10 then
														plotItems = Workspace:FindFirstChild("PlotItems")
														v32 = plotItems and v31:IsDescendantOf(plotItems) or tbl17.isnetworkowner(v31)
														v33 = v32 or tbl17.sno(v31)

														if v33 then
															random = math.random
															vector = Vector3.new(math.random(-100000, 100000), 100000, random(-100000, 100000))
															bodyPosition = Instance.new("BodyPosition")
															bodyPosition.Name = "GucciBP"
															bodyPosition.D = 200
															bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
															bodyPosition.Position = vector
															v29.Name = "GucciRSC"
															bodyPosition.Parent = v31
														end
													end

													task.delay(0.75, function()
														if not v30 or not v30.Parent or not v29 or not v29.Parent then
															return
														end
														v30.Parent = replicatedStorage
														task.wait()

														if v28 and v28.Parent then
															v28:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
														end

														if v29 and v29.Parent and v30 then
															v30.Parent = v29
														end
													end)

													while true do
														parent = v29.Parent and v30.Parent and v28.Parent
														flag11 = parent and v28.Health > 0 and not isHeld.Value and not ragdolled.Value and (v30.Occupant == nil or v30.Occupant == v28) and tbl19.GucciAntiGrab and tbl18.GucciType == gucciType and v23 == n8
														if flag11 then
															task.wait()
															continue
														end
														break
													end

													occupant = v30.Occupant
													parent2 = occupant and occupant ~= v28 and occupant.Parent

													if parent2 then
														v34 = Players:FindFirstChild(occupant.Parent.Name)

														if v34 then
															notify(v34.DisplayName .. " sat on your gucci!")
														end
													end

													flag12 = v28 and v28.Parent and v28.Health > 0

													if flag12 then
														seatPart = v28.SeatPart
														seatPart = seatPart and seatPart ~= v30

														if seatPart then
															notify("You can't sit on other Vehicles while in Gucci!", "Invincibility")
														end

														v28.Sit = true
														task.wait(0.05)
														v28.Sit = false
														task.wait(0.05)
													end
												end

												if connection3 then
													connection3:Disconnect()
													connection3 = nil
												end

												parent3 = v29 and v29.Parent

												if parent3 then
													tbl17.dt(v29)
												end

												v24 = nil
												seat = nil
												v25 = nil
												v26 = nil
												flag3 = false
												task.wait(0.05)
												flag4 = tbl19.GucciAntiGrab and v23 == n8
												continue
											end
										end
									end
								else
									v24 = tbl17.st(gucciType, CFrame.new(100000, 500000, 0))
									seat = v24 and v24:WaitForChild("VehicleSeat", 1.25)
									v25 = seat and tbl17.findNicePart(v24) or nil
									v26 = gucciType

									if v24 then
										for _, descendant in pairs(v24:GetDescendants()) do
											hideDescendant(descendant)
										end

										connection3 = v24.DescendantAdded:Connect(hideDescendant)
									end

									if not seat then
										exitTo = 4
										break
									else
										v29 = v24
										v30 = seat
										v31 = v25
										flag3 = true

										if v31 then
											gucciBP = v31:FindFirstChild("GucciBP")

											if gucciBP then
												gucciBP:Destroy()
											end
										end

										v30.Transparency = 1
										v30.CanCollide = false
										flag5 = false
										cFrame = v27.CFrame
										now = tick()

										v30.ChildAdded:Once(function(child)
											if child.Name == "SeatWeld" then
												child.Enabled = false
												child:Destroy()
												flag5 = true
											end
										end)

										flag6 = false
										refreshRemotes()

										task.defer(function()
											while v28 and v28.Health > 0 and flag3 and task.wait() do
												flag6 = true

												if tbl23.RagdollRemote then
													fireRemote(tbl23.RagdollRemote, v27, 0)
												end
											end

											flag6 = true
										end)

										while true do
											task.wait()
											flag7 = flag6 or v23 ~= n8
											if not flag7 then
												continue
											end
											break
										end

										if v23 ~= n8 then
											exitTo = 5
											break
										else
											v30:Sit(v28)

											while true do
												task.wait()
												flag8 = v28.Health <= 0 or not v27.Parent or not v29.Parent or not v30.Parent

												if not flag8 then
													flag9 = isHeld.Value or ragdolled.Value or flag5 or tick() - now > 0.75
													if not flag9 then
														continue
													end
												end

												break
											end

											if flag5 then
												v28.Sit = false

												task.delay(0.15, function()
													flag3 = false
													task.wait()

													if tbl23.RagdollRemote and v27.Parent then
														fireRemote(tbl23.RagdollRemote, v27, 0.15)
													end
												end)

												if flag2 then
													tbl17.teleport(v27, cFrame)
												end

												flag10 = tbl18.GucciType ~= "Train" and v31

												if flag10 then
													plotItems = Workspace:FindFirstChild("PlotItems")
													v32 = plotItems and v31:IsDescendantOf(plotItems) or tbl17.isnetworkowner(v31)
													v33 = v32 or tbl17.sno(v31)

													if v33 then
														random = math.random
														vector = Vector3.new(math.random(-100000, 100000), 100000, random(-100000, 100000))
														bodyPosition = Instance.new("BodyPosition")
														bodyPosition.Name = "GucciBP"
														bodyPosition.D = 200
														bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
														bodyPosition.Position = vector
														v29.Name = "GucciRSC"
														bodyPosition.Parent = v31
													end
												end

												task.delay(0.75, function()
													if not v30 or not v30.Parent or not v29 or not v29.Parent then
														return
													end
													v30.Parent = replicatedStorage
													task.wait()

													if v28 and v28.Parent then
														v28:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
													end

													if v29 and v29.Parent and v30 then
														v30.Parent = v29
													end
												end)

												while true do
													parent = v29.Parent and v30.Parent and v28.Parent
													flag11 = parent and v28.Health > 0 and not isHeld.Value and not ragdolled.Value and (v30.Occupant == nil or v30.Occupant == v28) and tbl19.GucciAntiGrab and tbl18.GucciType == gucciType and v23 == n8
													if flag11 then
														task.wait()
														continue
													end
													break
												end

												occupant = v30.Occupant
												parent2 = occupant and occupant ~= v28 and occupant.Parent

												if parent2 then
													v34 = Players:FindFirstChild(occupant.Parent.Name)

													if v34 then
														notify(v34.DisplayName .. " sat on your gucci!")
													end
												end

												flag12 = v28 and v28.Parent and v28.Health > 0

												if flag12 then
													seatPart = v28.SeatPart
													seatPart = seatPart and seatPart ~= v30

													if seatPart then
														notify("You can't sit on other Vehicles while in Gucci!", "Invincibility")
													end

													v28.Sit = true
													task.wait(0.05)
													v28.Sit = false
													task.wait(0.05)
												end
											end

											if connection3 then
												connection3:Disconnect()
												connection3 = nil
											end

											parent3 = v29 and v29.Parent

											if parent3 then
												tbl17.dt(v29)
											end

											v24 = nil
											seat = nil
											v25 = nil
											v26 = nil
											flag3 = false
											task.wait(0.05)
											flag4 = tbl19.GucciAntiGrab and v23 == n8
											continue
										end
									end
								end
							else
								exitTo = 3
								break
							end
						end
					end
				end

				break
			end

			if exitTo == 1 then
				localPlayer.CharacterAdded:Wait()
				flag2 = true

				task.delay(1, function()
					flag2 = false
				end)

				task.wait(0.16)
				continue
			end

			if exitTo == 2 then
				continue
			end

			if exitTo == 3 then
				v29 = v24
				v30 = seat
				v31 = v25
				flag3 = true

				if v31 then
					gucciBP = v31:FindFirstChild("GucciBP")

					if gucciBP then
						gucciBP:Destroy()
					end
				end

				v30.Transparency = 1
				v30.CanCollide = false
				flag5 = false
				cFrame = v27.CFrame
				now = tick()

				v30.ChildAdded:Once(function(child)
					if child.Name == "SeatWeld" then
						child.Enabled = false
						child:Destroy()
						flag5 = true
					end
				end)

				flag6 = false
				refreshRemotes()

				task.defer(function()
					while v28 and v28.Health > 0 and flag3 and task.wait() do
						flag6 = true

						if tbl23.RagdollRemote then
							fireRemote(tbl23.RagdollRemote, v27, 0)
						end
					end

					flag6 = true
				end)

				while true do
					task.wait()
					flag7 = flag6 or v23 ~= n8
					if not flag7 then
						continue
					end
					break
				end

				if v23 ~= n8 then
					exitTo2 = 2
					break
				else
					v30:Sit(v28)

					while true do
						task.wait()
						flag8 = v28.Health <= 0 or not v27.Parent or not v29.Parent or not v30.Parent

						if not flag8 then
							flag9 = isHeld.Value or ragdolled.Value or flag5 or tick() - now > 0.75
							if not flag9 then
								continue
							end
						end

						break
					end

					if flag5 then
						v28.Sit = false

						task.delay(0.15, function()
							flag3 = false
							task.wait()

							if tbl23.RagdollRemote and v27.Parent then
								fireRemote(tbl23.RagdollRemote, v27, 0.15)
							end
						end)

						if flag2 then
							tbl17.teleport(v27, cFrame)
						end

						flag10 = tbl18.GucciType ~= "Train" and v31

						if flag10 then
							plotItems = Workspace:FindFirstChild("PlotItems")
							v32 = plotItems and v31:IsDescendantOf(plotItems) or tbl17.isnetworkowner(v31)
							v33 = v32 or tbl17.sno(v31)

							if v33 then
								random = math.random
								vector = Vector3.new(math.random(-100000, 100000), 100000, random(-100000, 100000))
								bodyPosition = Instance.new("BodyPosition")
								bodyPosition.Name = "GucciBP"
								bodyPosition.D = 200
								bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								bodyPosition.Position = vector
								v29.Name = "GucciRSC"
								bodyPosition.Parent = v31
							end
						end

						task.delay(0.75, function()
							if not v30 or not v30.Parent or not v29 or not v29.Parent then
								return
							end
							v30.Parent = replicatedStorage
							task.wait()

							if v28 and v28.Parent then
								v28:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
							end

							if v29 and v29.Parent and v30 then
								v30.Parent = v29
							end
						end)

						while true do
							parent = v29.Parent and v30.Parent and v28.Parent
							flag11 = parent and v28.Health > 0 and not isHeld.Value and not ragdolled.Value and (v30.Occupant == nil or v30.Occupant == v28) and tbl19.GucciAntiGrab and tbl18.GucciType == gucciType and v23 == n8
							if flag11 then
								task.wait()
								continue
							end
							break
						end

						occupant = v30.Occupant
						parent2 = occupant and occupant ~= v28 and occupant.Parent

						if parent2 then
							v34 = Players:FindFirstChild(occupant.Parent.Name)

							if v34 then
								notify(v34.DisplayName .. " sat on your gucci!")
							end
						end

						flag12 = v28 and v28.Parent and v28.Health > 0

						if flag12 then
							seatPart = v28.SeatPart
							seatPart = seatPart and seatPart ~= v30

							if seatPart then
								notify("You can't sit on other Vehicles while in Gucci!", "Invincibility")
							end

							v28.Sit = true
							task.wait(0.05)
							v28.Sit = false
							task.wait(0.05)
						end
					end

					if connection3 then
						connection3:Disconnect()
						connection3 = nil
					end

					parent3 = v29 and v29.Parent

					if parent3 then
						tbl17.dt(v29)
					end

					v24 = nil
					seat = nil
					v25 = nil
					v26 = nil
					flag3 = false
					task.wait(0.05)
					continue
				end
			elseif exitTo == 4 then
				cleanup()
				continue
			elseif exitTo == 5 then
				exitTo2 = 1
				break
			elseif exitTo == 6 then
				notify("Train doesn't exist!")
				waitTypeChange(gucciType)
				continue
			elseif exitTo == 7 then
				notify("Train doesn't have seats!")
				waitTypeChange(gucciType)
				cleanup()
				continue
			end

			break
		end

		if exitTo2 == 1 then
			flag3 = false
		elseif exitTo2 == 2 then
			flag3 = false
		elseif exitTo == 8 then
			flag3 = false
		end

		cleanup()

		if v22 == cleanup then
			v22 = nil
		end
	end
end

task.spawn(function()
	local v22 = nil
	local boolValue

	while task.wait() do
		local v23, v24, v25 = tbl17.charp()

		if not v24 or not v25 then
			if v22 and v22.Parent then
				v22:Destroy()
			end

			v22 = nil
		elseif tbl19.AntiBlobman then
			if (not v22 or not v22.Parent) and v24:FindFirstChild("RootAttachment") then
				task.wait(0.5)
				local rootAttachment = v24:FindFirstChild("RootAttachment")

				if rootAttachment and v21 then
					rootAttachment.Parent = replicatedStorage
					boolValue = Instance.new("BoolValue")
					boolValue.Name = "RootAttachment"
					boolValue.Parent = v24
					v22 = rootAttachment
				end
			end

			v24.Massless = false
		else
			if v22 then
				v22.Parent = v24
				v22 = nil
			end

			if boolValue then
				boolValue:Destroy()
				boolValue = nil
			end
		end
	end
end)

task.spawn(function()
	local v22 = nil
	local remoteEvent = nil

	while true do
		task.wait(tbl18.InputLgDelay)

		if tbl19.AntiInputLag then
			refreshRemotes()
			local grabEvents2 = v21 and v21:FindFirstChild("GrabEvents")

			if grabEvents2 and not remoteEvent then
				local endGrabEarly = grabEvents2:FindFirstChild("EndGrabEarly")

				if endGrabEarly then
					endGrabEarly:Destroy()
				end

				remoteEvent = Instance.new("RemoteEvent")
				remoteEvent.Name = "EndGrabEarly"
				remoteEvent.Parent = grabEvents2
			end

			local v23, v24, v25 = tbl17.charp()
			v22 = v22 or tbl17.st(tbl18.AntiInputType, CFrame.new(0, 1e20, 0))

			if v22 and v22.Parent then
				local holdPart = v22:WaitForChild("HoldPart", 2)
				local holdItemRemoteFunction = holdPart and holdPart:WaitForChild("HoldItemRemoteFunction", 2)
				local dropItemRemoteFunction = holdItemRemoteFunction and holdPart:WaitForChild("DropItemRemoteFunction", 2)
				local rigidConstraint = holdPart and holdPart:FindFirstChild("RigidConstraint")

				for _, descendant in ipairs(v22:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.CanCollide = false
						if descendant:IsA("MeshPart") or descendant.Name == "Part" then
							descendant.Transparency = tbl18.AILTransparency
							continue
						end
						continue
					end

					if descendant:IsA("Decal") then
						descendant.Transparency = tbl18.AILTransparency
					end
				end

				if v23 and v25 and v25.Health > 0 and holdPart and holdItemRemoteFunction and dropItemRemoteFunction then
					task.spawn(function()
						pcall(function()
							local vector = Vector3.new
							dropItemRemoteFunction:InvokeServer(v22, CFrame.new(0, 1e20, 0), vector())
						end)
					end)

					task.spawn(function()
						pcall(function()
							holdItemRemoteFunction:InvokeServer(v22, v23)
						end)
					end)

					if rigidConstraint then
						local leftArm = v23:FindFirstChild("Left Arm")
						local rightArm = v23:FindFirstChild("Right Arm")
						leftArm = leftArm and leftArm:FindFirstChild("LeftGripAttachment")
						rightArm = rightArm and rightArm:FindFirstChild("RightGripAttachment")
						local attachment1 = rigidConstraint.Attachment1

						if attachment1 and attachment1 ~= leftArm and attachment1 ~= rightArm then
							tbl17.dt(v22)
							v22 = nil
							continue
						end

						continue
					end

					continue
				end

				tbl17.dt(v22)
				v22 = nil
			end
		else
			if v22 then
				tbl17.dt(v22)
				v22 = nil
			end

			if remoteEvent then
				remoteEvent:Destroy()
				remoteEvent = nil
			end
		end
	end
end)

Workspace.ChildAdded:Connect(function(child)
	if child.Name ~= "Part" or not tbl19.AntiExplosion or not child:IsA("BasePart") then
		return
	end
	local v22, v23, v24 = tbl17.charp()
	if not v22 or not v23 or not v24 or (child.Position - v23.Position).Magnitude > 20 then
		return
	end
	v23.Anchored = true
	task.wait(0.02)

	if not v24.SeatPart then
		v24.Sit = false
	end

	local v25 = nil

	pcall(function()
		v25 = v22:QueryDescendants("#RagdollLimbPart")
	end)

	if v25 then
		for _, v26 in pairs(v25) do
			v26.CanCollide = false
		end
	else
		for _, descendant in ipairs(v22:GetDescendants()) do
			if descendant:IsA("BasePart") and (descendant.Name == "RagdollLimbPart" or descendant:GetAttribute("RagdollLimbPart")) then
				descendant.CanCollide = false
			end
		end
	end

	tbl17.resetVelocity(v23)
	v23.Anchored = false
end)

bindAntiBurn = function(arg)
	local humanoidRootPart = arg and arg:WaitForChild("HumanoidRootPart", 2)
	if not humanoidRootPart then
		return
	end

	humanoidRootPart.ChildAdded:Connect(function(child)
		if child.Name ~= "FireParticleEmitter" or not tbl19.AntiBurn then
			return
		end
		local v22 = getMap()
		local hole = v22 and v22:FindFirstChild("Hole")
		hole = hole and hole:FindFirstChild("PoisonSmallHole")
		hole = hole and hole:FindFirstChild("ExtinguishPart")
		if not hole or not hole:IsA("BasePart") then
			return
		end
		local cFrame = hole.CFrame
		local fireLight = humanoidRootPart:FindFirstChild("FireLight")

		if fireLight then
			fireLight:Destroy()
		end

		if child:IsA("ParticleEmitter") then
			child.Enabled = false
		end

		local playerGui2 = localPlayer:FindFirstChildOfClass("PlayerGui")
		playerGui2 = playerGui2 and playerGui2:FindFirstChild("ScreenOverlayGui")
		playerGui2 = playerGui2 and playerGui2:FindFirstChild("FireFade")

		if playerGui2 and playerGui2:IsA("GuiObject") then
			playerGui2.Visible = false
		end

		while child and child.Parent and humanoidRootPart.Parent do
			hole.CFrame = humanoidRootPart.CFrame
			task.wait()
		end

		if hole.Parent then
			hole.CFrame = cFrame
		end
	end)
end

do
	local v22 = getMap()
	local hole = v22 and v22:FindFirstChild("Hole")
	hole = hole and hole:FindFirstChild("PoisonSmallHole")
	hole = hole and hole:FindFirstChild("ExtinguishPart")

	if hole and hole:IsA("BasePart") then
		local tex = hole:FindFirstChild("Tex")

		if tex then
			tex:Destroy()
		end

		hole.Transparency = 1
	end
end

localPlayer.CharacterAdded:Connect(bindAntiBurn)

if localPlayer.Character then
	task.defer(bindAntiBurn, localPlayer.Character)
end

task.spawn(function()
	while task.wait(0.03) do
		if tbl19.AntiVoid then
			local v22, v23 = tbl17.charp()

			if v23 and (v23.Position.Y >= 10000 or v23.Position.Y <= -500) then
				tbl17.teleport(v23, CFrame.new(0, 15, 0))
			end
		end
	end
end)

syncRecoveredProperties = function(arg, arg2)
	for k, v22 in next, arg2, nil do
		if arg[k] ~= v22 then
			local v23 = arg[k]

			if type(v23) ~= "number" then
				arg[k] = v22
			elseif type(v22) ~= "number" then
				arg[k] = v22
			elseif math.abs(v23 - v22) > 1e-05 then
				arg[k] = v22
			end
		end
	end
end

local NinjaShuriken = nil

destroyAntiKickShuriken = function()
	if NinjaShuriken then
		tbl17.dt(NinjaShuriken)
		NinjaShuriken = nil
	end
end

getAntiKickParts = function()
	if not NinjaShuriken or not NinjaShuriken.Parent then
		return nil, nil
	end
	local stickyPart = NinjaShuriken:FindFirstChild("StickyPart")
	if not stickyPart then
		return nil, nil
	end
	return stickyPart, (stickyPart:FindFirstChild("StickyWeld"))
end

antiKickAttachedTo = function(arg)
	if not NinjaShuriken or not NinjaShuriken.Parent or NinjaShuriken.Name ~= "ShurikenRSC" then
		return false
	end
	local v22, v23 = getAntiKickParts()
	if not v22 or not v23 then
		return false
	end
	return v23.Part1 == arg
end

applyAntiKickAppearance = function()
	if not NinjaShuriken or not NinjaShuriken.Parent then
		return
	end
	local shurHighlight = NinjaShuriken:FindFirstChild("ShurHighlight")

	if not shurHighlight then
		shurHighlight = Instance.new("Highlight")
		shurHighlight.Name = "ShurHighlight"
		shurHighlight.Adornee = NinjaShuriken
		shurHighlight.Parent = NinjaShuriken
	end

	syncRecoveredProperties(shurHighlight, {
		Enabled = tbl20.AntiKickSettings.Highlight,
		FillColor = tbl20.AntiKickSettings.HighlightFill,
		OutlineColor = tbl20.AntiKickSettings.HighlightOutl,
		FillTransparency = tbl20.AntiKickSettings.HighlightFT,
		OutlineTransparency = tbl20.AntiKickSettings.HighlightOT,
	})

	local transparency = tbl20.AntiKickSettings.Transparency

	for _, child in ipairs(NinjaShuriken:GetChildren()) do
		if child:IsA("BasePart") then
			if child.Transparency ~= transparency then
				if child:IsA("MeshPart") or child.Name == "Part" then
					syncRecoveredProperties(child, { Transparency = transparency })
				end
			end

			child.CanCollide = false
			child.CanQuery = false
		end
	end
end

attachAntiKickShuriken = function(arg)
	if not NinjaShuriken or not NinjaShuriken.Parent then
		if NinjaShuriken then
			tbl17.dt(NinjaShuriken)
		end

		NinjaShuriken = tbl17.st("NinjaShuriken", arg.CFrame + Vector3.new(0, 15, 0))
		if not NinjaShuriken then
			return false
		end
	end

	local stickyPart = NinjaShuriken:WaitForChild("StickyPart", 1.5)
	if not stickyPart then
		destroyAntiKickShuriken()
		return false
	end
	local stickyWeld = stickyPart:WaitForChild("StickyWeld", 1.5)
	if not stickyWeld then
		destroyAntiKickShuriken()
		return false
	end

	if not tbl17.sno(stickyPart) then
		destroyAntiKickShuriken()
		return false
	end
	NinjaShuriken.Name = "ShurikenRSC"

	task.spawn(function()
		local touchInterest = stickyPart:WaitForChild("TouchInterest", 2.5)

		if touchInterest then
			touchInterest:Destroy()
		end
	end)

	refreshRemotes()

	if tbl23.spe then
		fireRemote(tbl23.spe, stickyPart, arg, CFrame.new(0, -0.3, 0) * CFrame.Angles(1.5707963267948966, 0, 0))
	end

	local now = tick()

	while true do
		recoveredYield()

		if stickyWeld.Part1 == arg then
			break
		else
			if not (not stickyWeld.Parent or not arg.Parent or not stickyPart.Parent or not NinjaShuriken or not NinjaShuriken.Parent) then
				local v22, v23, v24 = tbl17.charp()

				if not (not v24 or v24.Health == 0) then
					if not (tick() - now > 0.5) then
						continue
					end
				end
			end

			break
		end
	end

	return stickyWeld.Parent ~= nil
end

task.spawn(function()
	while task.wait(0.03) do
		if tbl19.AntiKick then
			local v22, v23, v24 = tbl17.charp()

			if v23 and v24 then
				local ragdollTouchedHitbox = v23:FindFirstChild("RagdollTouchedHitbox")

				if ragdollTouchedHitbox and v24.Health > 0 then
					local inPlot = localPlayer:FindFirstChild("InPlot")
					local inOwnedPlot = localPlayer:FindFirstChild("InOwnedPlot")

					if inPlot and inPlot.Value then
						while inPlot.Value and (not inOwnedPlot or not inOwnedPlot.Value) do
							task.wait()
						end
					end

					if tbl20.AKType == "Shuriken" then
						if (antiKickAttachedTo(ragdollTouchedHitbox) or attachAntiKickShuriken(ragdollTouchedHitbox)) and NinjaShuriken and NinjaShuriken.Parent then
							applyAntiKickAppearance()
						end
					end
				end
			end
		else
			destroyAntiKickShuriken()
		end
	end
end)

runPCLDKillLoop = function(arg, arg2)
	repeat
		arg.Health = 0

		pcall(function()
			arg:ChangeState(Enum.HumanoidStateType.Dead)
		end)

		recoveredYield()
	until arg2()
end

runPCLDBreakSequence = function(arg)
	local result2 = nil

	if arg.Health <= 0 then
		notify("Detected death, breaking PCLD again...", "PCLD Breaker")
	else
		notify("Starting PCLD Break...", "PCLD Breaker")

		task.spawn(runPCLDKillLoop, arg, function()
			return result2 ~= nil
		end)
	end

	result2 = localPlayer.CharacterAdded:Wait()
	local humanoid_ = result2:WaitForChild("Humanoid", 5)
	if not humanoid_ then
		return
	end
	local result3 = nil

	task.spawn(runPCLDKillLoop, humanoid_, function()
		return result3 ~= nil
	end)

	result3 = localPlayer.CharacterAdded:Wait()
	local humanoid_2 = result3:WaitForChild("Humanoid", 5)
	if not humanoid_2 then
		return
	end
	humanoid_2:SetAttribute("BrokenPCLD", true)
	notify("Done!", "PCLD Breaker")
end

task.spawn(function()
	while task.wait(0.2) do
		if tbl19.AntiKick2 then
			local v22, v23, v24 = tbl17.charp()

			if v24 then
				if not v24:GetAttribute("BrokenPCLD") or v24.Health <= 0 then
					runPCLDBreakSequence(v24)
				end
			end
		end
	end
end)

do
	local n8 = 0

	startAntiStickyLoop = function()
		n8 += 1
		local v22 = n8

		task.spawn(function()
			while tbl19.AntiSticky and v22 == n8 and task.wait(0.1) do
				local v23 = tbl17.charp()

				if v23 then
					for _, descendant in ipairs(v23:GetDescendants()) do
						if descendant:IsA("BasePart") then
							for _, v24 in ipairs(descendant:GetConnectedParts()) do
								if v24.Name == "StickyPart" and not isLocallySpawnedToy(v24) then
									local plotItems = Workspace:FindFirstChild("PlotItems")

									if not plotItems or not v24:IsDescendantOf(plotItems) or getInOwnedPlotValue() then
										for _, child in ipairs(v24:GetChildren()) do
											if child:IsA("TouchInterest") then
												child:Destroy()
											end
										end

										local v25 = tbl17.findNicePart(v24.Parent)

										if v25 then
											tbl17.grab(v25)
										end
									end
								end
							end
						end
					end
				end
			end
		end)
	end

	task.spawn(function()
		task.wait(0.5)

		while task.wait(0.03) do
			if tbl19.AntiSnowball then
				if tbl19.GucciAntiGrab then
					repeat
						task.wait()
					until not tbl19.GucciAntiGrab

					task.wait(1)
				end

				if tbl19.AntiBanana then
					local rightLeg = tbl17.charp()
					rightLeg = rightLeg and rightLeg:FindFirstChild("Right Leg")

					while rightLeg do
						task.wait()
						local v22 = tbl17.charp()

						if not v22 then
							rightLeg = nil
						else
							rightLeg = v22:FindFirstChild("Right Leg")
						end
					end
				end

				local v22, v23, v24 = tbl17.charp()

				if v23 and v24 and v24.Health ~= 0 then
					local weldHRP = v23:FindFirstChild("WeldHRP")

					if weldHRP then
						refreshRemotes()

						if tbl23.RagdollRemote then
							fireRemote(tbl23.RagdollRemote, v23, 0.5)
						end

						if not v24.SeatPart then
							v24.Sit = false
						end

						v24.AutoRotate = true

						if weldHRP.Enabled then
							ContextActionService:UnbindAction("JumpRemover")
							v24:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
							tbl17.RepositionLimbs(v22)
							tbl17.ToggleCollisions(v22, false, false, true)
						end
					end
				end
			end
		end
	end)

	task.spawn(function()
		task.wait(2)

		while task.wait(0.03) do
			if tbl19.AntiBanana then
				local v22, v23, v24 = tbl17.charp()
				local rightLeg = v22 and v22:FindFirstChild("Right Leg")

				if v22 and rightLeg and v23 and v24 then
					if v24.Health == 0 then
						localPlayer.CharacterAdded:Wait()
						task.wait(0.5)
					elseif tbl17.isnetworkowner(v23) then
						local gucciAntiGrab = tbl19.GucciAntiGrab

						if gucciAntiGrab then
							local gucciAntiGrab2 = toggles.GucciAntiGrab

							if gucciAntiGrab2 then
								gucciAntiGrab2:SetValue(false)
							end

							task.wait(0.25)
						end

						v24.Sit = false
						v24.HipHeight = 2
						tbl17.breaklimb(localPlayer, "Legs")
						local connection3 = nil

						connection3 = v24:GetPropertyChangedSignal("HipHeight"):Connect(function()
							if tbl19.AntiBanana then
								v24.HipHeight = 2
							elseif connection3 then
								connection3:Disconnect()
							end
						end)

						local now = tick()

						while true do
							task.wait()

							if not rightLeg.Parent then
								break
							else
								if v24.Health ~= 0 then
									if not (tick() - now > 0.75) then
										continue
									end
								end

								break
							end
						end

						if gucciAntiGrab then
							local gucciAntiGrab2 = toggles.GucciAntiGrab

							if gucciAntiGrab2 then
								gucciAntiGrab2:SetValue(true)
							end
						end
					end
				end
			end
		end
	end)

	local tbl24 = {}
	local connection3 = nil

	applyPaintPart = function(arg, arg2)
		if not arg:IsA("BasePart") or arg.Name ~= "PaintPlayerPart" then
			return
		end
		arg.CanTouch = not arg2

		if arg2 and not tbl24[arg] then
			tbl24[arg] = arg:GetPropertyChangedSignal("CanTouch"):Connect(function()
				if tbl19.AntiPaint and arg.Parent then
					arg.CanTouch = false
				end
			end)
		end
	end

	applyAntiPaint = function(arg)
		for k, v22 in pairs(tbl24) do
			v22:Disconnect()
			tbl24[k] = nil

			if k.Parent then
				k.CanTouch = true
			end
		end

		if connection3 then
			connection3:Disconnect()
			connection3 = nil
		end

		for _, descendant in ipairs(Workspace:GetDescendants()) do
			applyPaintPart(descendant, arg)
		end

		if arg then
			connection3 = Workspace.DescendantAdded:Connect(function(descendant)
				applyPaintPart(descendant, true)
			end)
		end
	end

	applyAntiPoison = function(arg)
		local hole = getMap()
		hole = hole and hole:FindFirstChild("Hole")
		if not hole then
			return
		end
		local tbl25 = {}
		local poisonBigHole = hole:FindFirstChild("PoisonBigHole")
		local v22 = hole
		local findFirstChild = v22.FindFirstChild
		tbl25[1] = poisonBigHole

		do
			local values = table.pack(findFirstChild(v22, "PoisonSmallHole"))
			table.move(values, 1, values.n, 2, tbl25)
		end

		for _, v23 in ipairs(tbl25) do
			if v23 then
				local poisonHurtPart = v23:FindFirstChild("PoisonHurtPart")
				local paintPlayerPart = v23:FindFirstChild("PaintPlayerPart")

				if poisonHurtPart and poisonHurtPart:IsA("BasePart") then
					poisonHurtPart.CanTouch = not arg
				end

				if paintPlayerPart and paintPlayerPart:IsA("BasePart") then
					paintPlayerPart.CanTouch = not arg
				end
			end
		end
	end

	applyAntiLag = function(antiLag_)
		tbl19.AntiLag = antiLag_
		local playerScripts = localPlayer:FindFirstChild("PlayerScripts")
		local characterAndBeamMove = playerScripts and playerScripts:FindFirstChild("CharacterAndBeamMove")
		playerScripts = playerScripts and playerScripts:FindFirstChild("StickyPartsTouchDetection")

		if characterAndBeamMove then
			characterAndBeamMove.Enabled = not antiLag_
		end

		if playerScripts then
			playerScripts.Enabled = not antiLag_
		end

		if antiLag_ then
			task.delay(1.5, function()
				for _, player in ipairs(Players:GetPlayers()) do
					local character = player.Character

					if character then
						for _, child in ipairs(character:GetChildren()) do
							if child.Name == "GrabParts" then
								child:Destroy()
							end
						end
					end
				end
			end)
		end
	end

	local n9 = 0

	runService.RenderStepped:Connect(function(deltaTime)
		if not tbl19.AutoAntiLag or os.clock() - n9 < 2.5 or deltaTime <= 0 then
			return
		end
		n9 = os.clock()
		local antiLagSens = tbl18.AntiLagSens

		if math.floor(1 / deltaTime) < antiLagSens and toggles.AntiLag and not toggles.AntiLag.Value then
			notify("Anti Lag Enabled || Too low fps", "Auto Anti Lag")
			toggles.AntiLag:SetValue(true)
		end
	end)

	local n10 = 0

	startAntiInvisLoop = function()
		n10 += 1
		local v22 = n10

		task.spawn(function()
			while tbl19.AntiInvis and v22 == n10 and task.wait(0.1) do
				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= localPlayer then
						local v23, v24, v25 = tbl17.charp(player)

						if v24 then
							v24.Massless = false
						end

						if v25 and v25.Sit and v25.SeatPart then
							local seatWeld = v25.SeatPart:FindFirstChild("SeatWeld")

							if seatWeld and not seatWeld.Enabled then
								seatWeld.Enabled = true
							end
						end
					end
				end
			end
		end)
	end

	local connection4 = nil

	onPossibleKickFlag = function(arg)
		if arg ~= "Flying" then
			return
		end
		local now = tick()

		if now - tbl20.LastKickFlagTime <= 1 then
			tbl20.KickFlags = tbl20.KickFlags + 1
		else
			tbl20.LastKickFlagTime = now
			tbl20.KickFlags = 1
		end

		if not tbl19.AutoReset then
			return
		end

		if tbl20.KickFlags < 4 then
			local v22, v23, v24 = tbl17.charp()

			if v24 then
				pcall(function()
					v24:ChangeState(Enum.HumanoidStateType.Running)
					v24:ChangeState(Enum.HumanoidStateType.Dead)
				end)

				if tbl20.KickFlags == 1 then
					notify("Reset due to kick flag", "Auto Reset")
				end
			end
		else
			localPlayer:Kick("Resonance (Auto Reset)\nAvoided Kick")
		end
	end

	bindAutoResetRemote = function()
		refreshRemotes()
		local gameCorrectionEvents = v21 and v21:FindFirstChild("GameCorrectionEvents")
		gameCorrectionEvents = gameCorrectionEvents and gameCorrectionEvents:FindFirstChild("GameCorrectionsNotify")
		if not gameCorrectionEvents or not gameCorrectionEvents:IsA("RemoteEvent") then
			return false
		end

		if connection4 then
			connection4:Disconnect()
		end

		connection4 = gameCorrectionEvents.OnClientEvent:Connect(onPossibleKickFlag)
		return true
	end

	if not bindAutoResetRemote() then
		task.spawn(function()
			while task.wait(0.5) do
				if not bindAutoResetRemote() then
					continue
				end
				break
			end
		end)
	end

	local n11 = 0

	startLoopTP = function()
		n11 += 1
		local v22 = n11

		task.spawn(function()
			local v23, cFrame = tbl17.charp()
			cFrame = cFrame and cFrame.CFrame or CFrame.new(0, -5, 0)

			while tbl19.LoopTP and v22 == n11 and task.wait(0.04) do
				local v24 = tbl17.charp()

				if v24 then
					local random = math.random
					v24:PivotTo(CFrame.new(math.random(-1000, 1000), -7.35, random(-1000, 1000)))
				end
			end

			local v24 = tbl17.charp()

			if v24 then
				v24:PivotTo(cFrame)
			end
		end)
	end

	applyDisableVoid = function(destroyVoid)
		tbl19.DestroyVoid = destroyVoid

		if destroyVoid then
			Workspace.FallenPartsDestroyHeight = (0/0)
		else
			Workspace.FallenPartsDestroyHeight = -100
		end
	end

	applyWaterWalk = function(waterWalk)
		tbl19.WaterWalk = waterWalk
		local alwaysHereTweenedObjects = getMap()
		alwaysHereTweenedObjects = alwaysHereTweenedObjects and alwaysHereTweenedObjects:FindFirstChild("AlwaysHereTweenedObjects")
		local ocean = alwaysHereTweenedObjects and alwaysHereTweenedObjects:FindFirstChild("Ocean")
		ocean = ocean and ocean:FindFirstChild("Object")
		ocean = ocean and ocean:FindFirstChild("ObjectModel")
		if not ocean then
			return
		end

		for _, child in ipairs(ocean:GetChildren()) do
			if child:IsA("BasePart") then
				if waterWalk then
					child.CanCollide = true

					if child.Transparency ~= 1 then
						child.Transparency = 0.5
					end
				else
					child.CanCollide = false

					if child.Transparency ~= 1 then
						child.Transparency = 0
					end
				end
			end
		end
	end

	applyDeleteBarriers = function(deleteBarriers)
		tbl19.DeleteBarriers = deleteBarriers
		local plots = Workspace:FindFirstChild("Plots")
		if not plots then
			return
		end

		for _, child in ipairs(plots:GetChildren()) do
			local barrier = child:FindFirstChild("Barrier")

			if barrier then
				for _, child2 in ipairs(barrier:GetChildren()) do
					if child2:IsA("BasePart") and child2.Name == "PlotBarrier" then
						child2.CanCollide = not deleteBarriers
					end
				end
			end
		end
	end

	local n12 = 0

	startOtherInvCollisions = function()
		n12 += 1
		local v22 = n12

		task.spawn(function()
			while tbl19.OtherInvCollisions and v22 == n12 and task.wait(0.1) do
				local v23 = tbl17.charp()

				if v23 then
					for _, descendant in ipairs(v23:GetDescendants()) do
						if descendant:IsA("BasePart") then
							pcall(function()
								PhysicsService:SetPartCollisionGroup(descendant, "PlotPlayers")
							end)
						end
					end
				end
			end

			local v23 = tbl17.charp()

			if v23 then
				local str2 = getInOwnedPlotValue() and "PlotPlayers" or "Players"

				for _, descendant in ipairs(v23:GetDescendants()) do
					if descendant:IsA("BasePart") then
						pcall(function()
							PhysicsService:SetPartCollisionGroup(descendant, str2)
						end)
					end
				end
			end
		end)
	end

	local part_4 = Instance.new("Part")
	part_4.Name = "Safe Platform"
	part_4.Size = Vector3.new(250, 5, 250)
	local random = math.random
	part_4.Position = Vector3.new(math.random(-25000, 25000), -500, random(-25000, 25000))
	part_4.Anchored = true
	part_4.CanCollide = true
	part_4.Material = Enum.Material.Neon
	part_4.Parent = Workspace

	setupDeathNotification = function()
		TargetTab_DeathNotif = false
		TargetTab_DeathSound = false
		local v22 = tbl15.Target:AddRightGroupbox("Target Extras")

		v22:AddToggle("TargetDeathNotif", {
			Text = "Death Notification",
			Default = false,
			Callback = function(arg)
				TargetTab_DeathNotif = arg
			end,
		})

		v22:AddToggle("TargetDeathSound", {
			Text = "Death Sound",
			Default = false,
			Callback = function(arg)
				TargetTab_DeathSound = arg
			end,
		})

		local tbl25 = {}

		game:GetService("RunService").Heartbeat:Connect(function()
			for k, selectedPlayer in pairs(tbl20.SelectedPlayers) do
				if selectedPlayer then
					local character = k.Character
					local humanoid_ = character and character:FindFirstChild("Humanoid")

					if humanoid_ and humanoid_.Health <= 0 and not tbl25[k] then
						tbl25[k] = true

						if TargetTab_DeathNotif then
							if _NOTIFY then
								_NOTIFY("Target Dead: " .. k.Name, 3)
							end
						end

						if TargetTab_DeathSound then
							if tbl2.notificationSoundEnabled then
								local v23 = tbl[tbl2.selectedNotificationSound]

								if v23 then
									pcall(function()
										local sound = Instance.new("Sound")
										sound.SoundId = v23
										sound.Volume = 1
										sound.Parent = game:GetService("SoundService")
										sound:Play()

										sound.Ended:Connect(function()
											sound:Destroy()
										end)
									end)
								end
							end
						end
					elseif character and humanoid_ and humanoid_.Health > 0 then
						tbl25[k] = false
					end
				end
			end
		end)
	end

	setupDeathNotification()
	local Antis = tbl15.Defense:AddLeftGroupbox("Antis")

	Antis:AddToggle("AntiGrab", {
		Text = "Anti Grab",
		Default = false,
		Tooltip = "The most default anti-grab",
		Callback = function(antiGrab)
			tbl19.AntiGrab = antiGrab

			if antiGrab then
				startAntiGrabIfNeeded()
			else
				stopAntiGrab()
			end
		end,
	})

	Antis:AddToggle("GucciAntiGrab", {
		Text = "[GUCCI] Anti Grab",
		Default = false,
		Tooltip = "Can't be touched.",
		Callback = function(gucciAntiGrab)
			tbl19.GucciAntiGrab = gucciAntiGrab

			if gucciAntiGrab then
				task.spawn(runGucciAntiGrab)
			else
				stopGucciAntiGrab()
				task.spawn(runGucciAntiGrab)
			end
		end,
	}):AddKeyPicker("GucciK", { Text = "[GUCCI] Anti Grab", Mode = "Toggle", NoUI = false, SyncToggleState = true })

	Antis:AddToggle("AntiBlobman", {
		Text = "Anti Blobman",
		Default = false,
		Tooltip = "People can't grab you using Blobman",
		Callback = function(antiBlobman)
			tbl19.AntiBlobman = antiBlobman
		end,
	})

	Antis:AddToggle("AntiInputLag", {
		Text = "Anti Network Ownership",
		Default = false,
		Tooltip = "Anti Blob-kill, etc.",
		Callback = function(antiInputLag)
			tbl19.AntiInputLag = antiInputLag
		end,
	}):AddKeyPicker("AntiNetK", { Text = "Anti Network Ownership", Mode = "Toggle", NoUI = false, SyncToggleState = true })

	Antis:AddToggle("AntiExplosion", {
		Text = "Anti Explosion",
		Default = false,
		Tooltip = "Makes you not able to be exploded",
		Callback = function(antiExplosion)
			tbl19.AntiExplosion = antiExplosion
		end,
	})

	Antis:AddToggle("AntiBurn", {
		Text = "Anti Burn",
		Default = false,
		Tooltip = "Makes you not able to be burnt",
		Callback = function(antiBurn)
			tbl19.AntiBurn = antiBurn
		end,
	})

	Antis:AddToggle("AntiVoid", {
		Text = "Anti Void",
		Default = false,
		Tooltip = "Teleports you up if you go far down into the void",
		Callback = function(antiVoid)
			tbl19.AntiVoid = antiVoid
		end,
	})

	Antis:AddToggle("AntiKick", {
		Text = "Anti Kick",
		Default = false,
		Tooltip = "Default shuriken anti-kick",
		Callback = function(antiKick)
			tbl19.AntiKick = antiKick
		end,
	})

	Antis:AddToggle("AntiKick2", {
		Text = "[Break PCLD] Anti Kick",
		Default = false,
		Tooltip = "Unable to get kicked at all",
		Callback = function(antiKick2)
			tbl19.AntiKick2 = antiKick2
		end,
	})

	Antis:AddToggle("AntiSticky", {
		Text = "Anti Sticky",
		Default = false,
		Callback = function(antiSticky)
			tbl19.AntiSticky = antiSticky
			n8 += 1

			if antiSticky then
				startAntiStickyLoop()
			end
		end,
	})

	Antis:AddToggle("AntiSnowball", {
		Text = "Anti Snowball",
		Default = false,
		Tooltip = "Prevents you from getting snowballed",
		Callback = function(antiSnowball)
			tbl19.AntiSnowball = antiSnowball

			if not antiSnowball then
				local v22 = tbl17.charp()

				if v22 then
					tbl17.ToggleCollisions(v22, true)
				end
			end
		end,
	})

	Antis:AddToggle("AntiBanana", {
		Text = "Anti Banana",
		Default = false,
		Tooltip = "Bananas won't touch you",
		Callback = function(antiBanana)
			tbl19.AntiBanana = antiBanana
		end,
	})

	Antis:AddToggle("AntiPaint", {
		Text = "Anti Paint",
		Default = false,
		Tooltip = "You won't get painted",
		Callback = function(antiPaint)
			tbl19.AntiPaint = antiPaint
			task.spawn(applyAntiPaint, antiPaint)
		end,
	})

	Antis:AddToggle("AntiPoison", {
		Text = "Anti Poison",
		Default = false,
		Tooltip = "Poison parts won't kill you",
		Callback = function(antiPoison)
			tbl19.AntiPoison = antiPoison
			applyAntiPoison(antiPoison)
		end,
	})

	Antis:AddToggle("AntiLag", {
		Text = "Anti Lag",
		Default = false,
		Tooltip = "Anti Line-Lag, Shuriken-Lag",
		Callback = applyAntiLag,
	}):AddKeyPicker("AntiLagK", { Text = "Anti Lag", Mode = "Toggle", NoUI = false, SyncToggleState = true })

	Antis:AddToggle("AutoAntiLag", {
		Text = "Auto Anti Lag",
		Default = true,
		Tooltip = "Enables anti-lag for you if too low fps",
		Callback = function(autoAntiLag)
			tbl19.AutoAntiLag = autoAntiLag
		end,
	})

	Antis:AddToggle("AntiInvis", {
		Text = "Anti Invis",
		Default = false,
		Tooltip = "Makes any invisible players visible",
		Callback = function(antiInvis)
			tbl19.AntiInvis = antiInvis
			n10 += 1

			if antiInvis then
				startAntiInvisLoop()
			end
		end,
	})

	Antis:AddToggle("AutoReset", {
		Text = "Auto Reset",
		Default = true,
		Tooltip = "Checks for kick frame and resets when needed",
		Callback = function(autoReset)
			tbl19.AutoReset = autoReset
		end,
	})

	Antis:AddToggle("LoopTP", {
		Text = "Loop TP",
		Default = false,
		Tooltip = "Teleports you infinitely so you're unable to be grabbed",
		Callback = function(loopTP)
			tbl19.LoopTP = loopTP
			n11 += 1

			if loopTP then
				startLoopTP()
			end
		end,
	})

	local Miscellaneous = tbl15.Defense:AddRightGroupbox("Miscellaneous")

	DisblVoid = Miscellaneous:AddToggle("DisblVoid", {
		Text = "Disable Void",
		Default = true,
		Tooltip = "Makes you not get killed in void",
		DisabledTooltip = "This function is currently being managed by another function.",
		Callback = applyDisableVoid,
	})

	Miscellaneous:AddToggle("WaterWalk", { Text = "Water Walk", Default = false, Tooltip = "Walk on water", Callback = applyWaterWalk })
	Miscellaneous:AddToggle("DeleteBarriers", { Text = "Noclip Barrier", Default = false, Callback = applyDeleteBarriers })

	Miscellaneous:AddToggle("OtherInvCollisions", {
		Text = "Anti-Fling [Objects Noclip]",
		Default = false,
		Callback = function(otherInvCollisions)
			tbl19.OtherInvCollisions = otherInvCollisions
			n12 += 1

			if otherInvCollisions then
				startOtherInvCollisions()
			else
				task.spawn(startOtherInvCollisions)
			end
		end,
	})

	local LastGrabbedLabel = Miscellaneous:AddLabel("LastGrabbedLabel", { Text = "This is a label", DoesWrap = true })

	task.spawn(function()
		local v22 = nil

		while task.wait(0.05) do
			local whoGrabbed = tbl20.WhoGrabbed
			local flag2 = whoGrabbed ~= v22

			if LastGrabbedLabel.SetVisible then
				LastGrabbedLabel:SetVisible(whoGrabbed ~= nil)
			end

			if flag2 then
				local text = "Last person who grabbed you: " .. tostring(whoGrabbed)

				if LastGrabbedLabel.SetText then
					LastGrabbedLabel:SetText(text)
					v22 = whoGrabbed
				else
					LastGrabbedLabel.Text = text
					v22 = whoGrabbed
				end
			end
		end
	end)

	local v22 = tbl15.Defense:AddLeftGroupbox("Counter-attack")

	v22:AddDropdown("CADropdown", {
		Values = { "Grab", "Kill", "Void", "Delete Limbs", "Fling", "Teleport to Spawn" },
		Default = "Kill",
		Multi = false,
		Text = "Consequences",
		Tooltip = "What will you do when someone touches you and you have Counter-attack on",
		Callback = function(counterMethod)
			tbl18.CounterMethod = counterMethod
		end,
	})

	v22:AddToggle("CAToggle", {
		Text = "Counter Attack",
		Default = false,
		Tooltip = "People who touch you will have the selected consequences",
		Callback = function(counterAttack)
			tbl19.CounterAttack = counterAttack
		end,
	})

	local v23 = v22:AddDependencyBox()
	v23:SetupDependencies({ { options.CADropdown, "Delete Limbs" } })
	v23:AddDivider("Delete Limb Settings")

	v23:AddDropdown("DLCADropdown", {
		Values = { "Legs", "Arms", "All" },
		Default = 3,
		Multi = false,
		Searchable = true,
		Text = "Limbs to delete",
		Tooltip = "What limbs will you delete",
		Callback = function(targetedLimbCA)
			tbl18.TargetedLimbCA = targetedLimbCA
		end,
	})

	local Config = tbl15.Defense:AddRightGroupbox("Config")

	Config:AddSlider("AntiLagSens", {
		Text = "Auto Anti-Lag Sensitivity",
		Default = 3,
		Min = 1,
		Max = 20,
		Prefix = "FPS",
		Callback = function(antiLagSens)
			tbl18.AntiLagSens = antiLagSens
		end,
	})

	Config:AddDivider("Anti-Grabs")

	Config:AddDropdown("AGTDropdown", {
		Values = { "Normal", "No Ragdoll", "Anti-Kill", "Escapes Anything, but buggy" },
		Default = 1,
		Multi = false,
		Text = "Anti-Grab Type",
		Tooltip = "Type of default Anti-Grab",
		Callback = function(agType)
			tbl18.AGType = agType
		end,
	})

	Config:AddDropdown("GTDropdown", {
		Values = { "Blobman", "Tractor [Invisible]", "Train [Invisible]", "Sleigh [Invisible]" },
		Default = 1,
		Multi = false,
		Text = "GUCCI Type",
		Tooltip = "What vehicle will you sit on during Gucci Anti Grab",
		Callback = function(arg)
			if arg == "Blobman" then
				tbl18.GucciType = "CreatureBlobman"
			elseif arg == "Tractor [Invisible]" then
				tbl18.GucciType = "TractorGreen"
			elseif arg == "Train [Invisible]" then
				tbl18.GucciType = "Train"
			elseif arg == "Sleigh [Invisible]" then
				tbl18.GucciType = "SantaSleigh"
			end
		end,
	})

	Config:AddDivider("Anti Net-Owner")

	Config:AddDropdown("AITDropdown", {
		Values = {
			"FoodHamburger",
			"InstrumentDrumBongos",
			"InstrumentBrassTrumpet",
			"InstrumentBrassBugle",
			"InstrumentVoiceMicrophone",
			"InstrumentWoodwindOcarina",
			"InstrumentGuitarUkulele",
			"InstrumentGuitarLyre",
			"InstrumentGuitarBanjo",
			"InstrumentGuitarAcoustic",
			"CupMugBrown",
			"CupMugWhite",
			"FoodBanana",
			"FoodBread",
			"FoodBroccoli",
			"FoodCakePink",
			"FoodCoconut",
			"FoodDippyEgg",
			"FoodDonut",
			"FoodFrenchFries",
			"FoodHotdog",
			"FoodMayonnaise",
			"FoodMeatStick",
			"FoodMushroomPoison",
			"FoodPizzaCheese",
			"FoodPizzaPepperoni",
			"FoodSodaCan",
			"PoopPile",
			"PoopPileSparkle",
		},
		Default = 1,
		Multi = false,
		Text = "Type",
		Tooltip = "What interactable item will you use when doing anti-Net Owner",
		Callback = function(antiInputType)
			tbl18.AntiInputType = antiInputType
		end,
	})

	Config:AddSlider("AntiInpLagDel", {
		Text = "Grab & Drop Delay",
		Default = 0.05,
		Min = 0,
		Max = 0.3,
		Prefix = "sec",
		Rounding = 2,
		Callback = function(inputLgDelay)
			tbl18.InputLgDelay = inputLgDelay
		end,
	})

	Config:AddLabel("Below 0.05 can cause high ping")

	Config:AddSlider("ItemTransAK", {
		Text = "Item Transparency",
		Default = tbl18.AILTransparency,
		Min = 0,
		Max = 1,
		Rounding = 2,
		Callback = function(ailTransparency)
			tbl18.AILTransparency = ailTransparency
		end,
	})

	local selectedPlayers = tbl20.SelectedPlayers
	createPlayerDropdown(tbl15.Target:AddLeftGroupbox("Target"), "Target", selectedPlayers)
	local Apply = tbl15.Target:AddLeftGroupbox("Apply")
	createLoopToggle(Apply, "LoopApplyMethodTSel", "LoopApplyMethodT", false, false, tbl20.SelectedPlayers)
	createLoopToggle(Apply, "LoopApplyMethodTServ", "LoopApplyMethodTServer", true, false, tbl20.SelectedPlayers)
	createApplyButton(Apply, false, false, tbl20.SelectedPlayers)
	createApplyButton(Apply, true, false, tbl20.SelectedPlayers)
	local v24 = tbl15.Target:AddRightGroupbox("Method Settings")

	v24:AddDropdown("MethodSettingsTargets", {
		Values = {
			"Kick",
			"Void",
			"Kill",
			"Bring",
			"Destroy Food",
			"Remove Gucci",
			"Remove Invisibility",
			"Delete Seatables",
		},
		Multi = true,
		Text = "Methods",
		Callback = function(targetMethods)
			tbl20.TargetMethods = targetMethods
		end,
	})

	local v25 = v24:AddDependencyBox()
	v25:SetupDependencies({ { options.MethodSettingsTargets, "Kick" } })
	v25:AddDivider("Kick Settings")

	v25:AddDropdown("NKDelayConf", {
		Values = { "Normal", "Slower but better", "Faster but worse" },
		Multi = false,
		Default = 1,
		Text = "Delay Mode",
		Callback = function(nkDelayMode)
			tbl18.NKDelayMode = nkDelayMode
		end,
	})

	v25:AddToggle("RagdollNK", {
		Text = "Loop Ragdoll",
		Default = true,
		Callback = function(ragdollInNK)
			tbl19.RagdollInNK = ragdollInNK
		end,
	})

	v25:AddToggle("AntiKickRemoverNK", {
		Text = "Remove Anti-Kick",
		Default = true,
		Callback = function(deleteShurInNK)
			tbl19.DeleteShurInNK = deleteShurInNK
		end,
	})

	v25:AddSlider("HeightNK", {
		Text = "Kick Height",
		Default = 15,
		Min = 0,
		Max = 28,
		Compact = true,
		Rounding = 0,
		Callback = function(nkOffset)
			tbl18.NKOffset = nkOffset
		end,
	})

	v25:AddButton({
		Text = "TP To Void Platform",
		Tooltip = "Teleports you to a platform where victim cant spawn anti-kick shurikens, though it affects you as well [ONLY WORKS WHEN YOU HAVE RESONANCE ANTI-KICK ON AND ONLY WORKS GOOD ON CHEATERS]",
		Func = function()
			local v26
			v26, v26 = tbl17.charp()

			if v26 then
				tbl17.teleport(v26, part_4.CFrame + Vector3.new(0, 10, 0))
			end
		end,
	})

	local v26 = v24:AddDependencyBox()
	v26:SetupDependencies({ { options.MethodSettingsTargets, "Remove Gucci" } })
	v26:AddDivider("Remove-Gucci Settings")

	v26:AddToggle("RagdollInRG", {
		Text = "Break Player? [Inf Ragdoll]",
		Default = false,
		Tooltip = "This takes 1.5 seconds, use only if you have time!",
		Callback = function(ragdollInRG)
			tbl19.RagdollInRG = ragdollInRG
		end,
	})

	v26:AddButton({
		Text = "Fix Gucci Remover",
		Tooltip = "Fixes Remove Gucci bugs if it's not working",
		Func = function()
			for k, selectedPlayer in pairs(tbl20.SelectedPlayers) do
				if selectedPlayer then
					local v27, v28 = tbl17.getInventory(k)

					if v27 then
						for _, child in ipairs(v27:GetChildren()) do
							local vehicleSeat = child:FindFirstChild("VehicleSeat")

							if vehicleSeat then
								vehicleSeat:SetAttribute("broken", false)
							end
						end

						if v28 then
							for _, child in ipairs(v28:GetChildren()) do
								local vehicleSeat = child:FindFirstChild("VehicleSeat")

								if vehicleSeat then
									vehicleSeat:SetAttribute("broken", false)
								end
							end
						end
					end
				end
			end
		end,
	})
end

applyDisableVoid(true)

do
	local v22 = tbl15.Attack:AddRightGroupbox("Ragdoll V2")
	local v23 = nil
	local flag2 = false
	local connection3 = nil
	local connection4 = nil
	local v24 = nil
	local flag3 = false
	local LoopBananaRagdoll = nil
	local flag4 = false
	local thread = nil

	local function fn_()
		return localPlayer.Character
	end

	local function fn_2()
		local v25 = fn_()
		if v25 then
			return v25:FindFirstChild("HumanoidRootPart")
		end
		return nil
	end

	local function fn_3()
		return Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
	end

	local function fn_4()
		local v25 = fn_3()
		if not v25 then
			return
		end
		local destroyToy = replicatedStorage:FindFirstChild("MenuToys") and replicatedStorage.MenuToys:FindFirstChild("DestroyToy")
		if not destroyToy then
			return
		end

		for _, child in pairs(v25:GetChildren()) do
			if child.Name == "ToolPencil" then
				pcall(function()
					destroyToy:FireServer(child)
				end)
			end
		end
	end

	local function fn_5()
		local v25 = fn_3()
		if not v25 then
			return 0
		end
		local n8 = 0

		for _, child in pairs(v25:GetChildren()) do
			if child.Name == "ToolPencil" then
				n8 += 1
			end
		end

		return n8
	end

	local function fn_6()
		local v25 = fn_3()
		if not v25 then
			return false
		end
		local v26 = Players:FindFirstChild(v23)
		if not v26 or not v26.Character then
			return false
		end
		local head_ = v26.Character:FindFirstChild("Head")
		if not head_ then
			return false
		end

		for _, child in pairs(v25:GetChildren()) do
			if child.Name ~= "ToolPencil" then
				continue
			end
			local stickyPart = child:FindFirstChild("StickyPart")

			if stickyPart then
				local stickyWeld = stickyPart:FindFirstChild("StickyWeld")
				if stickyWeld and stickyWeld.Part1 == head_ then
					return true
				end
			end
		end

		return false
	end

	local function fn_7()
		local v25 = fn_2()
		if not v25 then
			return nil
		end
		local n8 = v25.CFrame * CFrame.new(0, 14, 20)
		local menuToys = replicatedStorage:FindFirstChild("MenuToys")
		if not menuToys then
			return nil
		end
		local spawnToyRemoteFunction2 = menuToys:FindFirstChild("SpawnToyRemoteFunction")
		if not spawnToyRemoteFunction2 then
			return nil
		end
		local v26 = nil
		local v27 = fn_3()
		if not v27 then
			return nil
		end
		local connection5 = nil

		connection5 = v27.ChildAdded:Connect(function(child)
			if child.Name == "ToolPencil" then
				v26 = child
				connection5:Disconnect()
			end
		end)

		task.spawn(function()
			pcall(function()
				spawnToyRemoteFunction2:InvokeServer("ToolPencil", n8, Vector3.zero)
			end)
		end)

		local now = tick()

		while true do
			task.wait(0.05)
			if not (v26 or tick() - now > 3) then
				continue
			end
			break
		end

		if connection5 then
			pcall(function()
				connection5:Disconnect()
			end)
		end

		return v26
	end

	local function fn_8(arg)
		if not arg then
			return
		end
		local grabEvents2 = replicatedStorage:FindFirstChild("GrabEvents")
		if not grabEvents2 then
			return
		end
		local setNetworkOwner2 = grabEvents2:FindFirstChild("SetNetworkOwner")
		if not setNetworkOwner2 then
			return
		end

		pcall(function()
			setNetworkOwner2:FireServer(arg, arg.CFrame)
			setNetworkOwner2:FireServer(arg, arg.CFrame)
			setNetworkOwner2:FireServer(arg, arg.CFrame)
			setNetworkOwner2:FireServer(arg, arg.CFrame)
			setNetworkOwner2:FireServer(arg, arg.CFrame)
		end)
	end

	local fn_9 = nil

	fn_9 = function()
		if not v23 or v23 == "" then
			return false
		end
		local v25 = Players:FindFirstChild(v23)
		if not v25 or not v25.Character then
			return false
		end
		local head_ = v25.Character:FindFirstChild("Head")
		if not head_ then
			return false
		end
		fn_4()
		task.wait(0.05)
		local v26 = fn_7()
		if not v26 then
			return false
		end
		local soundPart = v26:FindFirstChild("SoundPart")
		local stickyPart = v26:FindFirstChild("StickyPart")

		if soundPart then
			fn_8(soundPart)
		end

		task.wait(0.05)

		if stickyPart then
			local stickyPartEvent = replicatedStorage:FindFirstChild("PlayerEvents") and replicatedStorage.PlayerEvents:FindFirstChild("StickyPartEvent")

			if stickyPartEvent then
				pcall(function()
					stickyPartEvent:FireServer(stickyPart, head_, CFrame.new(0, (0/0), 0))
					stickyPartEvent:FireServer(stickyPart, head_, CFrame.new(0, (0/0), 0))
				end)

				task.wait(0.5)

				if not fn_6() then
					fn_4()
					task.wait(0.05)
					fn_9()
				end

				return true
			end
		end

		return false
	end

	local function fn_10()
		local v25 = Players:FindFirstChild(v23)
		if not v25 then
			return
		end

		v25.CharacterAdded:Connect(function()
			if flag4 then
				if v23 then
					tbl2.RagdollKillCounts = tbl2.RagdollKillCounts or {}
					tbl2.RagdollKillCounts[v23] = (tbl2.RagdollKillCounts[v23] or 0) + 1

					if _G.RagdollTargetCard then
						_G.RagdollTargetCard:SetText({ "Total Kills: " .. tostring(tbl2.RagdollKillCounts[v23]) })
					end

					if tbl2.RagdollKillNotify then
						Library:Notify({
							Title = "Ragdoll V2 Kill",
							Description = v25.DisplayName .. " Died!\nCount: " .. tostring(tbl2.RagdollKillCounts[v23]),
							Time = 5,
						})
					end
				end

				fn_9()
			end
		end)
	end

	local function fn_11()
		while flag4 do
			local v25 = fn_5()

			if v25 == 0 then
				fn_9()
			elseif v25 >= 2 then
				fn_4()
				task.wait(0.05)
				fn_9()
			elseif v25 == 1 then
				if not fn_6() then
					fn_4()
					task.wait(0.05)
					fn_9()
				end
			end

			task.wait(0.1)
		end
	end

	local function fn_12(arg)
		if not arg then
			return
		end
		local grabEvents2 = replicatedStorage:FindFirstChild("GrabEvents")
		if not grabEvents2 then
			return
		end
		local setNetworkOwner2 = grabEvents2:FindFirstChild("SetNetworkOwner")
		if not setNetworkOwner2 then
			return
		end

		pcall(function()
			setNetworkOwner2:FireServer(arg, arg.CFrame)
		end)
	end

	local function fn_13(arg)
		if not arg then
			return
		end
		local grabEvents2 = replicatedStorage:FindFirstChild("GrabEvents")
		if not grabEvents2 then
			return
		end
		local destroyGrabLine = grabEvents2:FindFirstChild("DestroyGrabLine")
		if not destroyGrabLine then
			return
		end

		pcall(function()
			destroyGrabLine:FireServer(arg)
		end)
	end

	local function fn_14(arg)
		if not arg then
			return
		end
		local menuToys = replicatedStorage:FindFirstChild("MenuToys")
		if not menuToys then
			return
		end
		local destroyToy = menuToys:FindFirstChild("DestroyToy")
		if not destroyToy then
			return
		end

		pcall(function()
			destroyToy:FireServer(arg)
		end)
	end

	local function fn_15()
		local v25 = fn_2()
		if not v25 then
			return nil
		end
		local n8 = v25.CFrame * CFrame.new(0, 14, 20)
		local menuToys = replicatedStorage:FindFirstChild("MenuToys")
		if not menuToys then
			return nil
		end
		local spawnToyRemoteFunction2 = menuToys:FindFirstChild("SpawnToyRemoteFunction")
		if not spawnToyRemoteFunction2 then
			return nil
		end
		local v26 = nil
		local v27 = fn_3()
		if not v27 then
			return nil
		end
		local connection5 = nil

		connection5 = v27.ChildAdded:Connect(function(child)
			if child.Name == "FoodBanana" then
				v26 = child
				connection5:Disconnect()
			end
		end)

		task.spawn(function()
			pcall(function()
				spawnToyRemoteFunction2:InvokeServer("FoodBanana", n8, Vector3.zero)
			end)
		end)

		local now = tick()

		while true do
			task.wait(0.05)
			if not (v26 or tick() - now > 3) then
				continue
			end
			break
		end

		if connection5 then
			pcall(function()
				connection5:Disconnect()
			end)
		end

		return v26
	end

	local function fn_16(arg)
		if not arg then
			return
		end
		local holdPart = arg:FindFirstChild("HoldPart")
		if not holdPart then
			return
		end
		local holdItemRemoteFunction = holdPart:FindFirstChild("HoldItemRemoteFunction")
		if not holdItemRemoteFunction then
			return
		end
		local v25 = fn_()
		if not v25 then
			return
		end
		local flag5 = false

		for i = 1, 5 do
			if not (not arg or not arg.Parent) then
				if pcall(function()
					return holdItemRemoteFunction:InvokeServer(arg, v25)
				end) then
					flag5 = true
					break
				else
					task.wait(0.05)
					continue
				end
			end

			break
		end

		return flag5
	end

	local function fn_17(arg)
		if not arg then
			return
		end
		local use = replicatedStorage:FindFirstChild("HoldEvents") and replicatedStorage.HoldEvents:FindFirstChild("Use")
		if not use then
			return
		end

		pcall(function()
			use:FireServer(arg)
		end)
	end

	local function fn_18(arg)
		if not arg then
			return
		end
		local holdPart = arg:FindFirstChild("HoldPart")
		if not holdPart then
			return
		end
		local dropItemRemoteFunction = holdPart:FindFirstChild("DropItemRemoteFunction")
		if not dropItemRemoteFunction then
			return
		end
		local v25 = fn_2()
		if not v25 then
			return
		end
		local n8 = v25.CFrame * CFrame.new(0, 15, 0)

		pcall(function()
			dropItemRemoteFunction:InvokeServer(arg, n8, n8)
		end)
	end

	local function fn_19()
		if not v23 then
			return nil
		end
		local v25 = Players:FindFirstChild(v23)
		if not v25 or not v25.Character then
			return nil
		end
		return v25.Character:FindFirstChild("Left Leg")
	end

	local function fn_20()
		if not v23 then
			return 0
		end
		local v25 = Players:FindFirstChild(v23)
		if not v25 or not v25.Character then
			return 0
		end
		local humanoid_ = v25.Character:FindFirstChildOfClass("Humanoid")
		if not humanoid_ then
			return 0
		end
		return humanoid_.Health
	end

	local function fn_21()
		if not v23 or v23 == "" then
			return false
		end
		local v25 = fn_15()
		if not v25 then
			return false
		end
		fn_16(v25)
		task.wait(0.05)
		fn_16(v25)
		task.wait(0.05)
		task.wait(0.5)
		fn_17(v25)
		task.wait(2.3)
		fn_18(v25)
		task.wait(0.05)
		fn_18(v25)
		task.wait(0.3)
		return v25
	end

	local function fn_22(arg)
		if connection3 then
			connection3:Disconnect()
			connection3 = nil
		end

		v24 = arg
		local hitboxPart = arg:FindFirstChild("HitboxPart")
		if not hitboxPart then
			return
		end

		connection3 = runService.Heartbeat:Connect(function()
			if not flag2 then
				stopLoop()
				return
			end

			if not v24 or not v24.Parent then
				return
			end
			local v25 = fn_3()
			local flag5 = false

			if v25 then
				local flag6 = false

				for _, child in pairs(v25:GetChildren()) do
					if child.Name == "FoodBanana" then
						v24 = child
						hitboxPart = child:FindFirstChild("HitboxPart")
						flag6 = true
						break
					end
				end

				flag5 = flag6
			end

			if not flag5 or not hitboxPart then
				connection3:Disconnect()
				connection3 = nil
				v24 = nil

				if flag2 then
					task.wait(0.05)
				end

				return
			end

			local v26 = fn_2()
			if not v26 then
				return
			end
			local n8, cframe

			if fn_20() <= 0 then
				if not flag3 then
					flag3 = true

					if v23 then
						local v27 = Players:FindFirstChild(v23)
						tbl2.RagdollKillCounts = tbl2.RagdollKillCounts or {}
						tbl2.RagdollKillCounts[v23] = (tbl2.RagdollKillCounts[v23] or 0) + 1

						if _G.RagdollTargetCard then
							_G.RagdollTargetCard:SetText({ "Total Kills: " .. tostring(tbl2.RagdollKillCounts[v23]) })
						end

						if tbl2.RagdollKillNotify then
							Library:Notify({
								Title = "Banana Ragdoll Kill",
								Description = (v27 and v27.DisplayName or v23) .. " Died!\nCount: " .. tostring(tbl2.RagdollKillCounts[v23]),
								Time = 5,
							})
						end
					end
				end

				n8 = v26.CFrame * CFrame.new(0, 7, 0)
				cframe = CFrame.new(n8.Position)
			else
				flag3 = false
				local v27 = fn_19()

				if v27 then
					n8 = v27.CFrame * CFrame.new(0, 0.5, 0)
					cframe = v27.CFrame
				else
					n8 = v26.CFrame * CFrame.new(0, 7, 0)
					cframe = CFrame.new(n8.Position)
				end
			end

			fn_12(hitboxPart)
			fn_13(hitboxPart)
			local bodyPosition = hitboxPart:FindFirstChild("BodyPosition")

			if bodyPosition then
				bodyPosition.Position = n8.Position
			else
				local bodyPosition2 = Instance.new("BodyPosition")
				bodyPosition2.P = 10000
				bodyPosition2.D = 100
				bodyPosition2.MaxForce = Vector3.new(1e9, 1e9, 1e9)
				bodyPosition2.Position = n8.Position
				bodyPosition2.Parent = hitboxPart
			end

			local bodyGyro = hitboxPart:FindFirstChild("BodyGyro")

			if bodyGyro then
				bodyGyro.CFrame = cframe
			else
				local bodyGyro2 = Instance.new("BodyGyro")
				bodyGyro2.P = 10000
				bodyGyro2.D = 100
				bodyGyro2.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
				bodyGyro2.CFrame = cframe
				bodyGyro2.Parent = hitboxPart
			end
		end)
	end

	local function fn_23()
		if flag2 then
			return
		end

		if not v23 or v23 == "" then
			return
		end
		flag2 = true
		flag3 = false
		local v25 = fn_21()

		if v25 then
			fn_22(v25)
		end

		connection4 = runService.Heartbeat:Connect(function()
			if not flag2 then
				return
			end
			local v26 = fn_3()
			local flag5 = false

			if v26 then
				for _, child in pairs(v26:GetChildren()) do
					if child.Name == "FoodBanana" then
						flag5 = true
						break
					end
				end
			end

			if not flag5 then
				if connection3 then
					connection3:Disconnect()
					connection3 = nil
				end

				task.wait(0.05)
				local v27 = fn_21()

				if v27 then
					fn_22(v27)
				end
			end
		end)
	end

	local function fn_24()
		flag2 = false

		if connection3 then
			connection3:Disconnect()
			connection3 = nil
		end

		if connection4 then
			connection4:Disconnect()
			connection4 = nil
		end

		if v24 then
			fn_14(v24)
			local hitboxPart = v24:FindFirstChild("HitboxPart")

			if hitboxPart then
				local bodyPosition = hitboxPart:FindFirstChild("BodyPosition")

				if bodyPosition then
					bodyPosition:Destroy()
				end

				local bodyGyro = hitboxPart:FindFirstChild("BodyGyro")

				if bodyGyro then
					bodyGyro:Destroy()
				end
			end

			v24 = nil
		end

		local v25 = fn_3()

		if v25 then
			for _, child in pairs(v25:GetChildren()) do
				if child.Name == "FoodBanana" then
					fn_14(child)
				end
			end
		end
	end

	local function fn_25()
		local tbl24 = {}

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer then
				table.insert(tbl24, player.DisplayName .. " (" .. player.Name .. ")")
			end
		end

		return tbl24
	end

	local function fn_26(arg)
		if not arg or arg == "" then
			return nil
		end
		local v25 = string.find(arg, "%(")
		if v25 then
			return string.sub(arg, v25 + 1, -2)
		end
		return nil
	end

	local TargetSelect = v22:AddDropdown("TargetSelect", {
		Text = "Select Player",
		Default = "",
		Values = fn_25(),
		Callback = function(arg)
			local v25 = fn_26(arg)

			if v25 then
				v23 = v25

				if _G.RagdollTargetCard then
					_G.RagdollTargetCard:NewTarget(v25)
					tbl2.RagdollKillCounts = tbl2.RagdollKillCounts or {}
					_G.RagdollTargetCard:SetText({ "Total Kills: " .. tostring(tbl2.RagdollKillCounts[v25] or 0) })
				end
			else
				v23 = nil
			end
		end,
	})

	local function fn_27()
		if TargetSelect then
			TargetSelect:SetValues(fn_25())
		end
	end

	Players.PlayerAdded:Connect(function()
		task.wait(0.5)
		fn_27()
	end)

	Players.PlayerRemoving:Connect(function()
		task.wait(0.2)
		fn_27()
	end)

	task.spawn(function()
		task.wait(1)
		fn_27()
	end)

	v22:AddToggle("RagdollKill", {
		Text = "Ragdoll Kill",
		Default = false,
		Callback = function(arg)
			if arg then
				if not v23 or v23 == "" then
					return
				end
				flag4 = true
				fn_9()
				fn_10()
				thread = task.spawn(fn_11)
			else
				flag4 = false

				if thread then
					task.cancel(thread)
					thread = nil
				end

				fn_4()
			end
		end,
	})

	LoopBananaRagdoll = v22:AddToggle("LoopBananaRagdoll", {
		Text = "Banana Ragdoll",
		Default = false,
		Callback = function(arg)
			if arg then
				if not v23 or v23 == "" then
					LoopBananaRagdoll:Set(false)
					return
				end
				fn_24()
				fn_23()
			else
				fn_24()
			end
		end,
	})
end