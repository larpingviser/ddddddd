-- This file was generated at discord.gg/syncrypt

local t1 = {}
local v2 = unpack or table.unpack
if not _G.FTAPWindow then
    _G.OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Bruhiscrazy/codespaces-blank/refs/heads/main/Bruhui"))()
    _G.FTAPWindow = _G.OrionLib:MakeWindow({
		Name = "FTAP Hub",
		HidePremium = false,
		SaveConfig = false
	})
end
t1.value1 = _G.OrionLib
t1.value2 = _G.FTAPWindow
local v3 = t1.value2:MakeTab({
	Name = "Scanner",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local v4 = t1.value2:MakeTab({
	Name = "Reach/Grabs",
	Icon = "rbxassetid://13255969414"
})
local v5 = t1.value2:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://6031075927"
})
t1.value3 = game:GetService("Players")

local _ = t1.value3.LocalPlayer
game:GetService("RunService")
game:GetService("UserInputService")
t1.value4 = 923966831
t1.value5 = {
	2219572186,
	90063030,
	3037300800,
	779443300,
	55960935,
	6166604182,
	5518109188,
	3876624202,
	5333134516,
	1232132139,
	1432007658,
	2298910483,
	6228315528,
	7346686860,
	6168002069,
	7769517148,
	5096830050,
	1684474366,
	2738032063,
	3714108493,
	7714746437,
	3856013232,
	2260874946,
	7566930708,
	8574463898,
	1174673092,
	115211703,
	1325117607,
	1047546351,
	2795574352,
	7197612236,
	3774740358,
	8257887218,
	4633127905,
	4677516859,
	1656527356,
	4736659862,
	463805978,
	3892170520,
	1340824300,
	8070573089,
	3931453699,
	9415770424,
	4300907235,
	9584241219,
	8437777008,
	3606734034,
	1762306425,
	3791956,
	1390422876,
	1137443778,
	6183926320,
	9903166160
}
t1.value6 = {
	7612639370,
	8545847274,
	2036489330,
	593390769,
	1990214639,
	1990214639,
	9561147814,
	9295114805,
	8651981299,
	3734312245
}
t1.value7 = {
	4080908195,
	7693276571,
	1277915393,
	5137818116,
	3033633286,
	6173344543,
	4777732061,
	4502456808,
	8040246662,
	7229405846,
	4170228367,
	3428335004,
	7280113503,
	8012068320,
	8316412573,
	8318397204,
	8131985649,
	2329903035,
	2313046401,
	4072061820,
	7278735072,
	8341012133,
	3535592249,
	5044473020,
	2300589071,
	5240193892,
	3541618333,
	3428335004,
	8565978728,
	7207364682,
	9535225511,
	3026548993,
	5515789455,
	5552154255,
	8300674795,
	10001821251,
	10018288235,
	3136812354,
	2887850840,
	8954510075,
	3783162167,
	927232182,
	9909274366
}
t1.value8 = {
	6191318395,
	2219572186,
	8012068320,
	4736659862,
	5776338932,
	3037300800,
	7672223472,
	7489561619,
	1256211715,
	4961330154,
	7592963747,
	10081518368,
	1286354240,
	5599697741
}
local function v7(p1)
    if p1 == t1.value4 then
        return "⚠\239\184\143 Caca"
    end

    if table.find(t1.value5, p1) then
        return "⚠\239\184\143 Blitz"
    end

    if table.find(t1.value6, p1) then
        return "⚠\239\184\143 Posral"
    end

    if table.find(t1.value7, p1) then
        return "⚠\239\184\143 Verbal"
    end

    if table.find(t1.value8, p1) then
        return "⚠\239\184\143 Cosmic"
    end

    return nil
end
t1.value9 = v3:AddLabel("some executers may not work for some scripts so use VPN")
v3:AddLabel("staffs has better scripts then you dont attack")
v3:AddLabel("they have test scripts or they can kick you if using their scripts")
v3:AddLabel("they dont have admin to this script")
v3:AddLabel("This script is very weak and wait for ui to load dont spam")
t1.value10 = v3:AddLabel("BLITZ,VERBAL,POSRAL,COSMIC STAFF WATCH scanner button")

local function v8()
    local t2 = {}

    for _, player in ipairs(t1.value3:GetPlayers()) do
        local v106 = v7(player.UserId)
        local v107 = if v106 then string.format("%s\nUser: %s\nUserId: %d", v106, player.Name, player.UserId) else nil

        if v107 then
            table.insert(t2, v107)
        end
    end

    if #t2 > 0 then
        t1.value10:SetText("👑 Staff Found:\n\n" .. table.concat(t2, "\n\n"))
        t1.value9:SetText("⚠\239\184\143 Staff detected")

        return
    end

    t1.value10:SetText("✅ No staff found")
    t1.value9:SetText("✅ Safe")
end
v3:AddButton({
	Name = "🔍 Refresh Scan",
	Callback = function()
    t1.value1:MakeNotification({
			Name = "Scanning",
			Content = "Scanning all players...",
			Time = 2
		})

    local n1 = 0

    for _, player in ipairs(t1.value3:GetPlayers()) do
        local v111 = v7(player.UserId)

        if v111 then
            local value1 = t1.value1

            n1 += 1

            local v113 = v111 .. " Found"
            local v114 = "User: " .. player.Name .. "\nUserId: " .. player.UserId

            value1:MakeNotification({
					Name = v113,
					Content = v114,
					Time = 2
				})
        end
    end

    if n1 == 0 then
        t1.value1:MakeNotification({
				Name = "✅ Safe",
				Content = "No admins detected!",
				Time = 3
			})
    end

    v8()

    local value1 = t1.value1
    local MakeNotification = value1.MakeNotification
    local v117 = "Checked " .. #t1.value3:GetPlayers() .. " players"

    MakeNotification(value1, {
			Name = "Scan Complete",
			Content = v117,
			Time = 2
		})
end
})
v3:AddButton({
	Name = "Ftap Blitz (Key system)",
	Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-FTAP-BLITZ-43504"))()
    t1.value1:MakeNotification({
			Name = "✅ Loaded",
			Content = "Script Ftap Blitz!",
			Time = 2
		})
end
})
v3:AddButton({
	Name = "👁\239\184\143Verbal New OP Hub (keyless + CustomMenu)",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VerbalHubz/scripts/refs/heads/main/op%20hub"))()
    t1.value1:MakeNotification({
			Name = "✅ Loaded",
			Content = "Script Verbal OP Hub!",
			Time = 2
		})
end
})
v3:AddButton({
	Name = "VerbalV3 Old (keyless)",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VerbalHubz/Verbal-Hub/refs/heads/main/Verbal%20Hub%20V3"))()
    t1.value1:MakeNotification({
			Name = "✅ Loaded",
			Content = "Script Verbal!",
			Time = 2
		})
end
})
v3:AddButton({
	Name = "RuHub (Key: escooter)",
	Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-RuHUB-OP-FTAP-SCRIPT-UPDATED-39324"))()
    t1.value1:MakeNotification({
			Name = "✅ Loaded",
			Content = "Script RuHub!",
			Time = 2
		})
end
})
v3:AddButton({
	Name = "Posral (IP Grabber maybe) (KeySystem)",
	Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-Posral-79224"))()
    t1.value1:MakeNotification({
			Name = "✅ Loaded",
			Content = "Script Posral!",
			Time = 2
		})
end
})
v3:AddButton({
	Name = "YukiHub (Exposes you in chat) (keyless)",
	Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-Yuki-Hub-Ftap-BETA-75713"))()
    t1.value1:MakeNotification({
			Name = "✅ Loaded",
			Content = "Script YukiHub beta!",
			Time = 2
		})
end
})
v3:AddButton({
	Name = "Comisc Hub (Exposes you in chat) (keyless)",
	Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-CRACKED-COSMICHUB-FTAP-73528"))()
    t1.value1:MakeNotification({
			Name = "✅ Loaded",
			Content = "Script CosmicHub!",
			Time = 2
		})
end
})
v3:AddButton({
	Name = "Phoenix Hub (Free version) (keyless)",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kiberblogr-coder/phoenix-hub/main/hub.lua"))()
    t1.value1:MakeNotification({
			Name = "✅ Loaded",
			Content = "Script Phoenix!",
			Time = 2
		})
end
})
v3:AddButton({
	Name = "K Hub (Key: ftap k hub beta)",
	Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-Ftap-k-hub-73977"))()
    t1.value1:MakeNotification({
			Name = "✅ Loaded",
			Content = "Script K Hub!",
			Time = 2
		})
end
})
v3:AddButton({
	Name = "SRV9 (key system)",
	Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-SRV9-Fling-Things-and-people-55961"))()
    t1.value1:MakeNotification({
			Name = "✅ Loaded",
			Content = "Script SRV9!",
			Time = 2
		})
end
})
v3:AddButton({
	Name = "BloodyV2 (Exposes you in chat) (keyless)",
	Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-*-V2-62163"))()
    t1.value1:MakeNotification({
			Name = "✅ Loaded",
			Content = "Script bloodyV2!",
			Time = 2
		})
end
})
v3:AddButton({
	Name = "TcoHub (Key system)",
	Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-tco-hub-75571"))()
    t1.value1:MakeNotification({
			Name = "✅ Loaded",
			Content = "Script tcohub!",
			Time = 2
		})
end
})
v3:AddButton({
	Name = "Mobile Tab in air",
	Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-tab-button-by-Camakatikk-63397"))()
    t1.value1:MakeNotification({
			Name = "✅ Loaded",
			Content = "Script Tab!",
			Time = 2
		})
end
})
v3:AddButton({
	Name = "IY script",
	Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-yield-73483"))()
    t1.value1:MakeNotification({
			Name = "✅ Loaded",
			Content = "Script IY!",
			Time = 2
		})
end
})
t1.value3.PlayerAdded:Connect(function(player)
    local v119 = v7(player.UserId)

    if v119 then
        local value1 = t1.value1
        local v121 = v119 .. " Joined"
        local MakeNotification = value1.MakeNotification
        local v123 = "User: " .. player.Name .. "\nUserId: " .. player.UserId

        MakeNotification(value1, {
			Name = v121,
			Content = v123,
			Time = 5
		})
    end

    v8()
end)
t1.value3.PlayerRemoving:Connect(function(player)
    local v125 = v7(player.UserId)

    if v125 then
        local value1 = t1.value1
        local v127 = v125 .. " Left"
        local MakeNotification = value1.MakeNotification
        local v129 = "User: " .. player.Name .. "\nUserId: " .. player.UserId

        MakeNotification(value1, {
			Name = v127,
			Content = v129,
			Time = 3
		})
    end

    v8()
end)

for _, player in ipairs(t1.value3:GetPlayers()) do
    local v11 = v7(player.UserId)

    if v11 then
        local value1 = t1.value1
        local v13 = v11 .. " Detected"
        local MakeNotification = value1.MakeNotification
        local v15 = "User: " .. player.Name .. "\nUserId: " .. player.UserId

        MakeNotification(value1, {
			Name = v13,
			Content = v15,
			Time = 5
		})
    end
end
t1.value11 = game:GetService("Players")
t1.value12 = t1.value11.LocalPlayer
t1.value13 = game:GetService("Workspace")
t1.value14 = game:GetService("UserInputService")
t1.value15 = game:GetService("RunService")
t1.value16 = game:GetService("Debris")
t1.value17 = game:GetService("ReplicatedStorage")
t1.value18 = t1.value13.CurrentCamera
local PlayerGui = t1.value12:WaitForChild("PlayerGui")

t1.value19 = false
t1.value20 = false
t1.value21 = nil
t1.value22 = 1000
t1.value23 = false
t1.value24 = nil
t1.value25 = false
t1.value26 = 30
t1.value27 = {
	"Head",
	"Torso",
	"Left Leg",
	"Right Leg"
}
local Seven = Enum.KeyCode.Seven
local Eight = Enum.KeyCode.Eight
local t3 = {
	Toggle = Seven,
	Unload = Eight,
	Working = false,
	MinReach = 6,
	MaxReach = 30,
	ZoomSpeed = 1
}
t1.value28 = nil
t1.value28 = t3
function t1.value29()
    if t1.value20 then
        return
    end

    t1.value20 = true

    local _ = t1.value17.GrabEvents.ExtendGrabLine
    local RaycastModule = require(t1.value12.PlayerScripts:WaitForChild("RaycastModule"))
    local _ = t1.value28.MinReach
    local u136 = false

    if hookmetamethod then
        local v137 = getrawmetatable(game)
        local __namecall = v137.__namecall

        setreadonly(v137, false)
        v137.__namecall = newcclosure(function(p2, ...)
            if getnamecallmethod() == "InvokeServer" and (p2.Name == "CheckForGamepass" and ... == 20837132) then
                return true
            end

            return __namecall(p2, ...)
        end)
        setreadonly(v137, true)
    end

    task.spawn(function()
        while t1.value20 do
            pcall(function()
                local v702 = t1.value12:FindFirstChild("FartherReach") or Instance.new("BoolValue", t1.value12)

                v702.Name = "FartherReach"
                v702.Value = true
            end)
            task.wait()
        end
    end)

    local RaycastFromCam = RaycastModule.RaycastFromCam

    function RaycastModule.RaycastFromCam(p3, _, ...)
        return RaycastFromCam(p3, t1.value28.MaxReach, ...)
    end

    task.spawn(function()
        while t1.value20 do
            u136 = t1.value13:FindFirstChild("GrabParts") ~= nil
            task.wait(0.1)
        end
    end)
    t1.value15.RenderStepped:Connect(function()
        if not t1.value28.Working or not u136 then
            return
        end
    end)
    t1.value14.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end

        if input.KeyCode == t1.value28.Toggle then
            t1.value28.Working = not t1.value28.Working
            print(not ("[Reach] " .. t1.value28.Working) and "Disabled" or "Enabled")

            if t1.value28.Working then
                local _ = t1.value28.MinReach

                if t1.value12.Character then
                    local GrabbingScript = t1.value12.Character:FindFirstChild("GrabbingScript")

                    if GrabbingScript then
                        GrabbingScript.Disabled = true
                        task.wait()
                        GrabbingScript.Disabled = false

                        return
                    end
                end
            end
        elseif input.KeyCode == t1.value28.Unload then
            t1.value28.Working = not t1.value28.Working

            if t1.value28.Working then
                local _ = t1.value28.MinReach

                if t1.value12.Character then
                    local GrabbingScript = t1.value12.Character:FindFirstChild("GrabbingScript")

                    if GrabbingScript then
                        GrabbingScript.Disabled = true
                        task.wait()
                        GrabbingScript.Disabled = false

                        return
                    end
                end
            end
        elseif input.KeyCode ~= Enum.KeyCode.E then
            if input.KeyCode ~= Enum.KeyCode.Q then
            end
        end
    end)
    t1.value14.InputEnded:Connect(function(input)
        if input.KeyCode ~= Enum.KeyCode.E then
            if input.KeyCode ~= Enum.KeyCode.Q then
            end
        end
    end)
    t1.value12.CharacterAdded:Connect(function()
        task.wait(0.2)

        if t1.value12.Character then
            local GrabbingScript = t1.value12.Character:FindFirstChild("GrabbingScript")

            if GrabbingScript then
                GrabbingScript.Disabled = true
                task.wait()
                GrabbingScript.Disabled = false
            end
        end

        local _ = t1.value28.MinReach
    end)
    t1.value28.Working = not t1.value28.Working

    if t1.value28.Working then
        local _ = t1.value28.MinReach

        if t1.value12.Character then
            local GrabbingScript = t1.value12.Character:FindFirstChild("GrabbingScript")

            if GrabbingScript then
                GrabbingScript.Disabled = true
                task.wait()
                GrabbingScript.Disabled = false
            end
        end
    end
end
function t1.value30()
    t1.value20 = false

    if t1.value21 then
        t1.value21:Disconnect()
    end
end
function t1.value31()
    if t1.value24 then
        t1.value24:Disconnect()
    end

    if t1.value23 then
        t1.value13.ChildAdded:Connect(function(child)
            if child.Name == "GrabParts" then
                child:GetPropertyChangedSignal("Parent"):Connect(function()
                    if not child.Parent then
                        local GrabPart = child:FindFirstChild("GrabPart")

                        if GrabPart and (GrabPart:FindFirstChild("WeldConstraint") and GrabPart.WeldConstraint.Part1) then
                            local WeldConstraintPart1 = GrabPart.WeldConstraint.Part1
                            local BodyVelocity = Instance.new("BodyVelocity")

                            BodyVelocity.MaxForce = Vector3.new(1e999, 1e999, 1e999)
                            BodyVelocity.Velocity = t1.value18.CFrame.LookVector * t1.value22
                            BodyVelocity.Parent = WeldConstraintPart1
                            t1.value16:AddItem(BodyVelocity, 1)
                        end
                    end
                end)
            end
        end)
    end
end
function t1.value32()
    local RaycastModule = t1.value12:WaitForChild("PlayerScripts"):FindFirstChild("RaycastModule")

    if RaycastModule then
        local lib = require(RaycastModule)

        if lib.RaycastFromCam then
            local RaycastFromCam = lib.RaycastFromCam

            function lib.RaycastFromCam(p5, p6)
                if not t1.value25 then
                    return RaycastFromCam(p5, p6)
                end
                local n2 = 1e999
                local v557
                for v560, v561 in pairs(t1.value11:GetPlayers()) do

                    local v562 = v561 ~= t1.value12

                    if v562 then
                        v562 = v561.Character

                        if v562 then
                            v562 = v561.Character:FindFirstChild("HumanoidRootPart") and (v561.Character:FindFirstChild("Humanoid") and v561.Character.Humanoid.Health > 0)
                        end
                    end

                    if v562 then
                        local HumanoidRootPart = v561.Character.HumanoidRootPart
                        local magnitude = (t1.value12.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).magnitude

                        if magnitude <= t1.value26 and magnitude < n2 then
                            v557 = v561
                            n2 = magnitude
                        end
                    end
                end
                if v557 and v557.Character then
                    local v565 = v557.Character[t1.value27[math.random(1, #t1.value27)]]

                    if v565 then
                        local Position = v565.Position
                        local vector3 = Vector3.new(0, 1, 0)
                        local t4 = {
							Instance = v565,
							Position = Position,
							Normal = vector3
						}
                        local CFrame2 = v565.CFrame
                        local t5 = { CFrame.new(v565.Position) }

                        return t4, CFrame2:ToObjectSpace(v2(t5))
                    end
                end

                return RaycastFromCam(p5, p6)
            end
        end
    end
end
t1.value33 = false
t1.value34 = 3
t1.value35 = 3
t1.value36 = 0
t1.value37 = Instance.new("ScreenGui")
t1.value37.ResetOnSpawn = false
if t1.value14.TouchEnabled then
    t1.value37.Parent = PlayerGui
end
local function v20(p7, p8)
    local ImageButton = Instance.new("ImageButton")

    ImageButton.Size = UDim2.new(0, 45, 0, 45)
    ImageButton.Position = UDim2.new(1, -70, 1, p7)
    ImageButton.Image = "rbxassetid://97166444"
    ImageButton.ImageTransparency = 0.2
    ImageButton.BackgroundTransparency = 1
    ImageButton.ImageColor3 = Color3.fromRGB(142, 142, 142)
    ImageButton.Visible = false
    ImageButton.Parent = t1.value37

    local ImageLabel = Instance.new("ImageLabel")

    ImageLabel.Size = UDim2.new(1, 0, 1, 0)
    ImageLabel.Image = p8
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Parent = ImageButton

    return ImageButton
end
t1.value38 = v20(-259, "rbxassetid://9603831913")

local v21 = v20(-211, "rbxassetid://9603826756")

t1.value39 = nil
t1.value39 = v21
function t1.value40(p9)
    t1.value38.Visible = p9
    t1.value38.Active = p9
    t1.value39.Visible = p9
    t1.value39.Active = p9
end
function t1.value41()
    if t1.value33 then
        local v148 = t1

        v148.value36 = v148.value36 + t1.value34

        if t1.value36 < t1.value35 then
            t1.value36 = t1.value35
        end
    end
end
function t1.value42()
    if t1.value33 then
        local v147 = t1

        v147.value36 = v147.value36 - t1.value34

        if t1.value36 < t1.value35 then
            t1.value36 = t1.value35
        end
    end
end
t1.value13.ChildAdded:Connect(function(child)
    if child.Name ~= "GrabParts" or not child:IsA("Model") then
        return
    end
    if not t1.value33 then
        return
    end
    local CurrentCamera = t1.value13.CurrentCamera
    local GrabPart = child:WaitForChild("GrabPart")
    child:WaitForChild("DragPart").AlignPosition.Enabled = false
    local BodyPosition = Instance.new("BodyPosition")
    BodyPosition.MaxForce = Vector3.new(275000, 275000, 275000)
    BodyPosition.P = 20000
    BodyPosition.D = 950
    BodyPosition.Parent = GrabPart
    task.wait()
    if t1.value36 < t1.value35 then
        t1.value36 = (GrabPart.Position - CurrentCamera.CFrame.Position).Magnitude
    end
    local connection
    connection = t1.value15.Heartbeat:Connect(function()
        if child.Parent then
            BodyPosition.Position = CurrentCamera.CFrame.Position + CurrentCamera.CFrame.LookVector * t1.value36

            return
        end

        connection:Disconnect()
        BodyPosition:Destroy()
        t1.value36 = 0
    end)
    t1.value40(true)
end)
t1.value13.ChildRemoved:Connect(function(child)
    if child.Name == "GrabParts" then
        t1.value40(false)
    end
end)
t1.value43 = false
local function v22(p10)
    while t1.value43 do
        p10()
        task.wait(0.1)
    end
end
t1.value38.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then
        return
    end

    if t1.value14.TouchEnabled and input.UserInputType == Enum.UserInputType.Touch then
        v22(t1.value41)
    end
end)
t1.value38.InputEnded:Connect(function(input)
    if input.UserInputType ~= Enum.UserInputType.Touch then
    end
end)
t1.value39.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then
        return
    end

    if t1.value14.TouchEnabled and input.UserInputType == Enum.UserInputType.Touch then
        v22(t1.value42)
    end
end)
t1.value39.InputEnded:Connect(function(input)
    if input.UserInputType ~= Enum.UserInputType.Touch then
    end
end)
t1.value14.InputChanged:Connect(function(input)
    if input.UserInputType ~= Enum.UserInputType.MouseWheel then
        return
    end

    if t1.value36 < 11 then
        t1.value36 = 11
    end

    if input.Position.Z < 0 then
        local value34 = t1.value34
        local v164 = t1

        v164.value36 = v164.value36 - value34

        return
    end

    local value34 = t1.value34
    local v166 = t1

    v166.value36 = v166.value36 + value34
end)
v4:AddLabel("dm for source dont ask for my whole script")
v4:AddLabel("dont turn off the gamepass reach it wont work when killed")
v4:AddToggle({
	Name = "Reach (Free Gamepass 30 Studs)",
	Default = false,
	Callback = function(p11)
    t1.value19 = p11

    if p11 then
        t1.value29()

        return
    end

    t1.value30()
end
})
v4:AddSection({
	Name = "Further extend"
})
v4:AddToggle({
	Name = "Further Extend",
	Default = false,
	Callback = function(p12)
    t1.value33 = p12
    t1.value40(p12)
end
})
v4:AddSlider({
	Name = "Extend Amount",
	Min = 3,
	Max = 25,
	Default = 3,
	Increment = 1,
	ValueName = "Studs",
	Callback = function(p13)
    t1.value34 = p13
end
})
v4:AddSection({
	Name = "Throw"
})
v4:AddSlider({
	Name = "Super Throw",
	Min = 100,
	Max = 10000,
	Default = 1000,
	Increment = 50,
	ValueName = "Power",
	Callback = function(p14)
    t1.value22 = p14
end
})
v4:AddToggle({
	Name = "Enable Super Throw",
	Default = false,
	Callback = function(p15)
    t1.value23 = p15
    t1.value31()
end
})
v4:AddSection({
	Name = "Silent aim"
})
v4:AddToggle({
	Name = "Enable Silent Aim",
	Default = false,
	Callback = function(p16)
    t1.value25 = p16
    t1.value32()
end
})
v4:AddSlider({
	Name = "Silent Aim Distance",
	Min = 1,
	Max = 50,
	Default = 30,
	Increment = 1,
	ValueName = "Studs",
	Callback = function(p17)
    t1.value26 = p17
end
})
v5:AddSection({
	Name = "Movement"
})
t1.value44 = {
	Walkspeed = false,
	WalkspeedValue = 5,
	InfiniteJump = false,
	InfiniteJumpPower = 100,
	Noclip = false,
	Connections = {}
}
t1.value45 = game:GetService("Players").LocalPlayer
t1.value46 = game:GetService("RunService")
t1.value47 = game:GetService("UserInputService")

function t1.value48()
    if t1.value44.Connections.WS then
        t1.value44.Connections.WS:Disconnect()
    end

    if t1.value44.Walkspeed then
        t1.value44.Connections.WS = t1.value46.Stepped:Connect(function()
            local Character = t1.value45.Character

            if Character and (Character:FindFirstChild("Humanoid") and Character:FindFirstChild("HumanoidRootPart")) then
                local Humanoid = Character.Humanoid
                local HumanoidRootPart = Character.HumanoidRootPart

                if Humanoid.MoveDirection.Magnitude > 0 then
                    HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + Humanoid.MoveDirection * (t1.value44.WalkspeedValue / 10)
                end
            end
        end)
    end
end
local function v23()
    if t1.value44.Connections.IJ then
        t1.value44.Connections.IJ:Disconnect()
    end

    if t1.value44.InfiniteJump then
        t1.value44.Connections.IJ = t1.value47.JumpRequest:Connect(function()
            local Character = t1.value45.Character

            if Character and Character:FindFirstChildOfClass("Humanoid") then
                Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end
function t1.value49()
    if t1.value44.Connections.NC then
        t1.value44.Connections.NC:Disconnect()
    end

    if t1.value44.Noclip then
        t1.value44.Connections.NC = t1.value46.Stepped:Connect(function()
            local Character = t1.value45.Character

            if Character then
                for _, descendant in pairs(Character:GetDescendants()) do
                    if descendant:IsA("BasePart") then
                        descendant.CanCollide = false
                    end
                end
            end
        end)
    end
end
v5:AddToggle({
	Name = "Walkspeed",
	Default = false,
	Callback = function(p18)
    t1.value44.Walkspeed = p18
    t1.value48()
end
})
v5:AddSlider({
	Name = "Speed Multiplier",
	Min = 1,
	Max = 50,
	Default = 5,
	Increment = 1,
	Callback = function(p19)
    t1.value44.WalkspeedValue = p19
end
})
v5:AddToggle({
	Name = "Infinite Jump",
	Default = false,
	Callback = function(p20)
    t1.value44.InfiniteJump = p20
    v23()
end
})
v5:AddSlider({
	Name = "Jump Power",
	Min = 50,
	Max = 500,
	Default = 100,
	Increment = 10,
	Callback = function(p21)
    t1.value44.InfiniteJumpPower = p21
end
})
v5:AddToggle({
	Name = "Noclip",
	Default = false,
	Callback = function(p22)
    t1.value44.Noclip = p22
    t1.value49()
end
})
t1.value50 = t1.value2:MakeTab({
	Name = "⭐\239\184\143Invincibility",
	Icon = "rbxassetid://4483362458"
})
t1.value51 = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

_G.AutoAttacker = _G.AutoAttacker or false
_G.CounterMode = _G.CounterMode or "Repulsion"
local GrabEvents = ReplicatedStorage:FindFirstChild("GrabEvents")

t1.value52 = GrabEvents and GrabEvents:FindFirstChild("DestroyGrabLine") or nil
t1.value53 = GrabEvents and GrabEvents:FindFirstChild("SetNetworkOwner") or nil
function t1.value54(p23, p24)
    local Unit = (p24 - p23).Unit
    local v184 = Unit:Cross(Vector3.new(0, 1, 0))
    local v185 = v184:Cross(Unit)

    return CFrame.fromMatrix(p23, v184, v185)
end
function t1.value55(p25)
    if not p25:FindFirstChild("SkyVelocity") then
        local BodyVelocity = Instance.new("BodyVelocity")

        BodyVelocity.Name = "SkyVelocity"
        BodyVelocity.Velocity = Vector3.new(0, 100000000000000, 0)
        BodyVelocity.MaxForce = Vector3.new(1e999, 1e999, 1e999)
        BodyVelocity.Parent = p25
    end
end
local t6 = {
	Repulsion = function(_, p27)
    local Character = t1.value51.LocalPlayer.Character

    if not Character or not p27 then
        return
    end

    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

    if not HumanoidRootPart then
        return
    end

    local v190 = t1.value54(HumanoidRootPart.Position, p27.Position)
    local BodyVelocity = Instance.new("BodyVelocity", p27)

    BodyVelocity.Name = "CounterRepulsion"
    BodyVelocity.MaxForce = Vector3.new(1e999, 1e999, 1e999)
    BodyVelocity.Velocity = Vector3.new(v190.lookVector.X, 0.5, v190.lookVector.Z) * 100
    t1.value16:AddItem(BodyVelocity, 0.3)
    task.wait(0.1)

    if t1.value52 then
        pcall(function()
            t1.value52:FireServer(p27)
        end)
    end
end,
	Freeze = function(p28, _)
    local v194 = p28.Character and p28.Character:FindFirstChildOfClass("Humanoid")

    if v194 then
        v194.WalkSpeed = 0
        v194.JumpPower = 0
        v194.Sit = false
        v194.PlatformStand = true
    end
end,
	Death = function(p30, p31)
    local v197 = p30.Character and p30.Character:FindFirstChildOfClass("Humanoid")

    if v197 and p31 then
        t1.value55(p31)

        for _ = 1, 20 do
            v197.BreakJointsOnDeath = false
            v197:ChangeState(Enum.HumanoidStateType.Dead)
            v197.Jump = true
            v197.Sit = true
            task.wait(0.05)
        end

        if t1.value52 then
            pcall(function()
                t1.value52:FireServer(p31)
            end)
        end
    end
end,
	Kick = function(_, p33)
    if p33 then
        t1.value55(p33)
        task.wait(1)

        if t1.value52 then
            pcall(function()
                t1.value52:FireServer(p33)
            end)
        end
    end
end
}
t1.value56 = nil
t1.value56 = t6
t1.value57 = nil
function t1.value57(p34)
    if not p34 or not p34.Character then
        return
    end

    local HumanoidRootPart = p34.Character:FindFirstChild("HumanoidRootPart")

    if not HumanoidRootPart then
        return
    end

    if t1.value53 then
        pcall(function()
            t1.value53:FireServer(HumanoidRootPart, HumanoidRootPart.CFrame)
        end)
    end

    local v203 = t1.value56[_G.CounterMode]

    if v203 then
        v203(p34, HumanoidRootPart)
    end
end
function t1.value58(p35)
    p35.DescendantAdded:Connect(function(descendant)
        if descendant.Name == "PartOwner" and _G.AutoAttacker then
            local v598 = t1.value51:FindFirstChild((tostring(descendant.Value)))

            if v598 and v598 ~= t1.value51.LocalPlayer then
                task.wait(0.3)
                t1.value57(v598)
            end
        end
    end)

    local Head = p35:WaitForChild("Head", 5)

    if Head then
        Head.ChildAdded:Connect(function(child)
            if child.Name == "PartOwner" and _G.AutoAttacker then
                local v600 = t1.value51:FindFirstChild((tostring(child.Value)))

                if v600 and v600 ~= t1.value51.LocalPlayer then
                    task.wait(0.3)
                    t1.value57(v600)
                end
            end
        end)
    end
end;
(function()
    local LocalPlayer = t1.value51.LocalPlayer
    local v213 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

    t1.value58(v213)
    LocalPlayer.CharacterAdded:Connect(function(character)
        t1.value58(character)
    end)
end)()
local ok, result = pcall(function()
    t1.value50:AddSection({
		Name = "Counter Attack Protection"
	})

    local value50 = t1.value50
    local __G = _G
    local AddToggle = value50.AddToggle
    local AutoAttacker = __G.AutoAttacker

    AddToggle(value50, {
		Name = "Auto Counter Attack",
		Default = AutoAttacker,
		Callback = function(p36)
        _G.AutoAttacker = p36
    end
	})

    local value50_2 = t1.value50
    local CounterMode = _G.CounterMode

    value50_2:AddDropdown({
		Name = "Counter Mode",
		Default = CounterMode,
		Options = {
			"Repulsion",
			"Freeze",
			"Death",
			"Kick"
		},
		Callback = function(p37)
        _G.CounterMode = p37
    end
	})
end)

if not ok then
    warn("Counter-Attack UI Error: " .. tostring(result))
end
t1.value50:AddSection({
	Name = "Anti"
})
t1.value59 = game:GetService("Players")
t1.value60 = game:GetService("Workspace")
t1.value61 = game:GetService("ReplicatedStorage")
t1.value62 = game:GetService("RunService")
t1.value63 = t1.value59.LocalPlayer
t1.value64 = t1.value61:WaitForChild("CharacterEvents"):FindFirstChild("RagdollRemote")
t1.value50:AddButton({
	Name = "Anti Ragdoll/Snowball",
	Callback = function()
    if t1.value64 then
        for _, player in pairs(t1.value59:GetPlayers()) do
            if player ~= t1.value63 and (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
                for _ = 1, 150 do
                    t1.value64:FireServer(player.Character.HumanoidRootPart, 9999999)
                    task.wait()
                end
            end
        end
    end
end
})
t1.value50:AddButton({
	Name = "Destroy Void",
	Callback = function()
    t1.value60.FallenPartsDestroyHeight = -1E+95
end
})
t1.value65 = {
	enabled = false,
	hbConn = nil,
	savedCF = nil,
	seat = nil,
	blob = nil
}
t1.value50:AddToggle({
	Name = "Gucci Anti (Sit On Blob First turn on wait 1s then off button)",
	Default = false,
	Callback = function(p38)
    t1.value65.enabled = p38

    local v218 = t1.value63.Character or t1.value63.CharacterAdded:Wait()
    local Humanoid = v218:WaitForChild("Humanoid")
    local HumanoidRootPart = v218:WaitForChild("HumanoidRootPart")

    if p38 then
        t1.value65.savedCF = HumanoidRootPart.CFrame

        local SeatPart = Humanoid.SeatPart

        if not SeatPart or not SeatPart:IsA("VehicleSeat") then
            warn("You are not sitting on a Blobman!")

            return
        end

        local Model = SeatPart:FindFirstAncestorOfClass("Model")

        if not Model or not Model.PrimaryPart then
            warn("Blobman model not found!")

            return
        end

        t1.value65.seat = SeatPart
        t1.value65.blob = Model
        Model:SetPrimaryPartCFrame(CFrame.new(0, 150000, 0))
        task.wait(0.2)

        for _, descendant in ipairs(Model:GetDescendants()) do
            if descendant:IsA("BasePart") then
                descendant.Anchored = true
            end
        end

        t1.value65.hbConn = t1.value62.Heartbeat:Connect(function()
            if not t1.value65.enabled or (not SeatPart or not SeatPart.Parent) then
                return
            end

            if Humanoid.SeatPart ~= SeatPart then
                SeatPart:Sit(Humanoid)
            end

            pcall(function()
                t1.value61.CharacterEvents.RagdollRemote:FireServer(HumanoidRootPart, 0)
            end)
            Humanoid:ChangeState(Enum.HumanoidStateType.Running)
            HumanoidRootPart.Velocity = Vector3.zero
            HumanoidRootPart.CFrame = t1.value65.savedCF

            if (HumanoidRootPart.Position - t1.value65.savedCF.Position).Magnitude > 5 then
                t1.value65.savedCF = HumanoidRootPart.CFrame
            end
        end)

        return
    end

    if t1.value65.hbConn then
        t1.value65.hbConn:Disconnect()
        t1.value65.hbConn = nil
    end

    if Humanoid.SeatPart then
        Humanoid.Sit = false
    end

    if t1.value65.savedCF then
        HumanoidRootPart.CFrame = t1.value65.savedCF
    end
end
})
t1.value50:AddButton({
	Name = "Destroy Gucci (All)",
	Callback = function()
    for _, descendant in pairs(t1.value60:GetDescendants()) do
        if descendant.Name == "CreatureBlobman" and descendant:FindFirstChild("VehicleSeat") then
            descendant.VehicleSeat:Sit(t1.value63.Character.Humanoid)
            task.wait(0.05)
            t1.value63.Character.Humanoid.Jump = true
        end
    end
end
})
t1.value66 = nil
t1.value66 = false
function t1.value67()
    while t1.value66 do
        task.wait()

        if t1.value63:FindFirstChild("IsHeld") and t1.value63.IsHeld.Value then
            local v227 = t1.value63.Character and t1.value63.Character:FindFirstChild("HumanoidRootPart")

            if v227 then
                v227.Anchored = true

                while t1.value63.IsHeld.Value and t1.value66 do
                    t1.value61.CharacterEvents.Struggle:FireServer(t1.value63)
                    task.wait(0.001)
                end

                v227.Anchored = false
            end
        end
    end
end
t1.value50:AddToggle({
	Name = "Anti Grab",
	Default = false,
	Callback = function(p39)
    t1.value66 = p39

    if p39 then
        task.spawn(t1.value67)
    end
end
})
t1.value68 = false
local function v29()
    t1.value60.ChildAdded:Connect(function(child)
        if t1.value68 and (child:IsA("Part") and child.Name == "Part") then
            local v603 = t1.value63.Character and t1.value63.Character:FindFirstChild("HumanoidRootPart")
            local v604 = child:FindFirstChild("Right Arm")

            if v603 and (v604 and (child.Position - v603.Position).Magnitude <= 20) then
                v603.Anchored = true
                task.wait(0.01)

                while v604:FindFirstChild("RagdollLimbPart") and v604.RagdollLimbPart.CanCollide do
                    task.wait(0.001)
                end

                v603.Anchored = false
            end
        end
    end)
end
t1.value50:AddToggle({
	Name = "Anti Explode",
	Default = false,
	Callback = function(p40)
    t1.value68 = p40

    if p40 then
        task.spawn(v29)
    end
end
})
t1.value50:AddToggle({
	Name = "Anti Fire",
	Default = false,
	Callback = function(p41)
    local ExtinguishPart = t1.value60.Map.Hole.PoisonBigHole.ExtinguishPart
    local ExtinguishPartPosition = ExtinguishPart.Position

    if p41 then
        t1.value62.Heartbeat:Connect(function()
            local v605 = t1.value63.Character and t1.value63.Character:FindFirstChild("HumanoidRootPart")

            if v605 and v605:FindFirstChild("FireLight") or v605:FindFirstChild("FireParticleEmitter") then
                ExtinguishPart.CFrame = CFrame.new(v605.Position)
            end
        end)

        return
    end

    ExtinguishPart.CFrame = CFrame.new(ExtinguishPartPosition)
end
})
t1.value50:AddToggle({
	Name = "Anti Lag",
	Default = false,
	Callback = function(p42)
    local PlayerScripts = t1.value63:FindFirstChild("PlayerScripts")

    if PlayerScripts then
        local CharacterAndBeamMove = PlayerScripts:FindFirstChild("CharacterAndBeamMove")

        if CharacterAndBeamMove then
            CharacterAndBeamMove.Disabled = p42
        end
    end
end
})
t1.value69 = false
function t1.value70()
    local v236 = t1.value63.Character and t1.value63.Character:FindFirstChild("HumanoidRootPart")

    if v236 then
        for _, descendant in pairs(t1.value60:GetDescendants()) do
            if descendant:IsA("BasePart") and descendant.Name == "LeftDetector" or descendant.Name == "RightDetector" and (v236.Position - descendant.Position).Magnitude > 10 then
                descendant:Destroy()
            end
        end
    end
end
function t1.value71()
    while t1.value69 do
        local Character = t1.value63.Character

        if Character then
            for _, descendant in pairs(Character:GetDescendants()) do
                if descendant:IsA("BasePart") and descendant.Massless then
                    descendant.Massless = false
                end
            end
        end

        task.wait(1)
    end
end
t1.value50:AddToggle({
	Name = "Anti Blobman",
	Default = false,
	Callback = function(p43)
    t1.value69 = p43

    if p43 then
        task.spawn(function()
            while t1.value69 do
                t1.value70()
                task.wait(1)
            end
        end)
        task.spawn(t1.value71)
    end
end
})
t1.value72 = t1.value2:MakeTab({
	Name = "💣Attack",
	Icon = "rbxassetid://6031094674",
	PremiumOnly = false
})
t1.value73 = game:GetService("Players")
t1.value74 = game:GetService("ReplicatedStorage")
t1.value75 = game:GetService("Workspace")
t1.value76 = t1.value73.LocalPlayer
local GrabEvents2 = t1.value74:FindFirstChild("GrabEvents")

t1.value77 = GrabEvents2 and GrabEvents2:FindFirstChild("SetNetworkOwner") or nil
if GrabEvents2 then
    GrabEvents2 = GrabEvents2:FindFirstChild("DestroyGrabLine")
end
t1.value78 = GrabEvents2 or nil
pcall(function()
    t1.value72:AddSection({
		Name = "Fire all"
	})
end)

function t1.value79(p44)
    local PlotItems = t1.value75:FindFirstChild("PlotItems")

    if not PlotItems then
        return false
    end

    local PlayersInPlots = PlotItems:FindFirstChild("PlayersInPlots")

    if not PlayersInPlots then
        return false
    end

    return PlayersInPlots:FindFirstChild(p44.Name) ~= nil
end
function t1.value80()
    return t1.value75:FindFirstChild(t1.value76.Name .. "SpawnedInToys")
end
local function v31(p45, p46)
    local MenuToys = t1.value74:FindFirstChild("MenuToys")

    if not MenuToys then
        return nil
    end

    local SpawnToyRemoteFunction = MenuToys:FindFirstChild("SpawnToyRemoteFunction")

    if not SpawnToyRemoteFunction then
        return nil
    end

    pcall(function()
        SpawnToyRemoteFunction:InvokeServer(p45, p46, Vector3.zero)
    end)
    task.wait(0.25)

    local v252 = t1.value80()

    if v252 then
        v252 = v252:FindFirstChild(p45)
    end

    return v252
end
function t1.value81(p47)
    if not p47.Character then
        return nil
    end

    return p47.Character:FindFirstChild("UpperTorso") or (p47.Character:FindFirstChild("Torso") or p47.Character:FindFirstChild("HumanoidRootPart"))
end
function t1.value82(p48)
    if not p48 or not p48:IsA("BasePart") then
        return
    end

    p48.Massless = true
    p48.CanCollide = false
    p48.Anchored = false
    p48.Size = Vector3.new(2.2, 2.2, 2.2)
    p48.Transparency = 0.25
    p48.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
end
function t1.value83()
    local v253 = t1.value80()

    if not v253 then
        return nil, nil
    end

    local Campfire = v253:FindFirstChild("Campfire")

    if not Campfire then
        local Character = t1.value76.Character
        local v256 = Character and Character:FindFirstChild("Head")

        if v256 then
            Campfire = v31("Campfire", v256.CFrame)
        end
    end

    if not Campfire then
        return nil, nil
    end

    local FirePlayerPart = Campfire:FindFirstChild("FirePlayerPart", true)

    if not FirePlayerPart or not FirePlayerPart:IsA("BasePart") then
        local GetDescendants = Campfire.GetDescendants

        for _, v in ipairs(GetDescendants(Campfire)) do
            if v.Name == "FirePlayerPart" and v:IsA("BasePart") then
                return Campfire, v
            end
        end
    end

    return Campfire, FirePlayerPart
end
t1.value84 = false
t1.value85 = nil
function t1.value86()
    while t1.value84 do
        local success, result = pcall(function()
            local Character = t1.value76.Character
            if not Character or not Character:FindFirstChild("HumanoidRootPart") then
                return
            end
            local v607, v608 = t1.value83()
            local v609 = v608
            if not v607 or not v609 then
                return
            end
            t1.value82(v609)
            local t7 = {}
            for v613, v614 in ipairs(t1.value73:GetPlayers()) do

                if v614 ~= t1.value76 and (v614.Character and not t1.value79(v614)) then
                    table.insert(t7, v614)
                end
            end
            for _, v in ipairs(t7) do
                if not t1.value84 then
                    return
                end

                local v617 = t1.value81(v)
                local v618 = v.Character and v.Character:FindFirstChildOfClass("Humanoid")

                if v617 and (v618 and v618.Health > 0) then
                    local v619 = v617.Position + Vector3.new(0, 0.6, 0)

                    if t1.value77 then
                        pcall(function()
                            t1.value77:FireServer(v609, CFrame.new(v619))
                        end)
                    end

                    task.wait()
                    v609.CFrame = CFrame.new(v619)
                    v609.AssemblyLinearVelocity = Vector3.zero
                    v609.AssemblyAngularVelocity = Vector3.zero

                    if t1.value78 then
                        pcall(function()
                            t1.value78:FireServer(v617)
                        end)
                    end

                    task.wait(0.08)
                end
            end
        end)
        if not success then
            warn("[AttackTab FireAll] error:", result)
        end
        task.wait(0.05)
    end
end
t1.value72:AddLabel("auto spwans fire click on it before it goes itself")
t1.value72:AddToggle({
	Name = "Fire All (ignores plots / working!!)",
	Default = false,
	Callback = function(p49)
    t1.value84 = p49

    if p49 then
        if t1.value85 then
            pcall(function()
                task.cancel(t1.value85)
            end)
            t1.value85 = nil
        end

        t1.value85 = task.spawn(t1.value86)

        return
    end

    if t1.value85 then
        pcall(function()
            task.cancel(t1.value85)
        end)
        t1.value85 = nil
    end
end
})
t1.value87 = game:GetService("Players")
t1.value88 = game:GetService("RunService")
t1.value89 = game:GetService("Workspace")
t1.value90 = game:GetService("ReplicatedStorage")
t1.value91 = t1.value87.LocalPlayer
t1.value92 = {}
t1.value93 = nil
local vector3 = Vector3.new(5, -18.5, 0)

t1.value94 = {
	Enabled = false,
	SavedPivot = nil,
	DistanceThreshold = 2,
	Offset = vector3,
	HeightThreshold = 10000,
	Delay = 0.5
}
t1.value72:AddSection({
	Name = "loop kill"
})
function updateDropdown(p50)
    local t9 = {}

    for _, player in ipairs(t1.value87:GetPlayers()) do
        table.insert(t9, player.Name)
    end

    p50:Refresh(t9, true)
end
function updateLoopDropdown(p51)
    local t10 = {}

    for k, _ in pairs(t1.value92) do
        table.insert(t10, k)
    end

    p51:Refresh(t10, true)
end
function disableCollisions(p52)
    for _, descendant in ipairs(p52:GetDescendants()) do
        if descendant:IsA("BasePart") then
            descendant.CanCollide = false
        end
    end
end
function flingPlayer(p53, p54)
    disableCollisions(p54.Parent)

    local BodyVelocity = Instance.new("BodyVelocity", p53)

    BodyVelocity.MaxForce = Vector3.new(1e999, 1e999, 1e999)
    BodyVelocity.Velocity = Vector3.new(0, 1000000000, 0)
    p54.Jump = true
    p54.Sit = false
    task.delay(3, function()
        if BodyVelocity.Parent then
            BodyVelocity:Destroy()
        end
    end)
end
function isAboveThreshold(p55, p56)
    local v280 = p55.Character and p55.Character:FindFirstChild("HumanoidRootPart")

    return not v280 or p56 < v280.Position.Y
end
function savePivot(p57)
    if t1.value91.Character and t1.value91.Character:FindFirstChild("HumanoidRootPart") then
        p57.SavedPivot = t1.value91.Character:GetPivot()
    end
end
function resetPivot(p58)
    local v283 = t1.value91.Character and t1.value91.Character:FindFirstChild("HumanoidRootPart")

    if v283 and (p58.SavedPivot and (v283.Position - p58.SavedPivot.Position).Magnitude > p58.DistanceThreshold) then
        t1.value91.Character:PivotTo(p58.SavedPivot)
    end
end
function actionOnPlayer(p59, p60)
    if not p60.Enabled then
        return
    end

    if t1.value89:FindFirstChild("PlotItems") and t1.value89.PlotItems.PlayersInPlots:FindFirstChild(p59.Name) then
        return
    end

    local Character = p59.Character

    if not Character then
        return
    end

    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local Head = Character:FindFirstChild("Head")
    local v290 = HumanoidRootPart

    if v290 then
        v290 = Humanoid

        if v290 then
            v290 = Head and (Humanoid.Health > 0 and not isAboveThreshold(p59, p60.HeightThreshold))
        end
    end

    if v290 then
        local Character2 = t1.value91.Character

        if not Character2 then
            return
        end

        if not Character2:FindFirstChild("HumanoidRootPart") then
            return
        end

        pcall(function()
            savePivot(p60)
            Character2:PivotTo(CFrame.new(HumanoidRootPart.Position + p60.Offset))
            disableCollisions(Character)
            t1.value90.GrabEvents.SetNetworkOwner:FireServer(HumanoidRootPart, HumanoidRootPart.CFrame)
            task.wait()
            resetPivot(p60)
            task.wait(0.1)
            t1.value90.GrabEvents.DestroyGrabLine:FireServer(HumanoidRootPart)
            task.wait(0.1)

            if Head:FindFirstChild("PartOwner") and Head.PartOwner.Value == t1.value91.Name then
                flingPlayer(HumanoidRootPart, Humanoid)
                task.wait(0.1)
                Humanoid.Health = 0
            end
        end)
        task.wait(p60.Delay)
    end
end
function loopKill()
    for k, _ in pairs(t1.value92) do
        local k2 = t1.value87:FindFirstChild(k)

        if k2 then
            actionOnPlayer(k2, t1.value94)
        end
    end
end
t1.value95 = nil
function loopControl()
    t1.value95 = t1.value88.Heartbeat:Connect(function()
        if t1.value94.Enabled then
            loopKill()
        end
    end)
end
function stopLoop()
    t1.value94.Enabled = false

    if t1.value95 then
        t1.value95:Disconnect()
    end

    t1.value94.SavedPivot = nil
end
t1.value96 = t1.value72:AddDropdown({
	Name = "Select Player",
	Options = {},
	Callback = function(p61)
    t1.value93 = t1.value87:FindFirstChild(p61)
end
})
t1.value97 = t1.value72:AddDropdown({
	Name = "Players in Loop",
	Options = {},
	Callback = function(p62)
    t1.value93 = t1.value87:FindFirstChild(p62)
end
})
t1.value72:AddButton({
	Name = "Add Player",
	Callback = function()
    if t1.value93 and not t1.value92[t1.value93.Name] then
        t1.value92[t1.value93.Name] = true
        updateLoopDropdown(t1.value97)
    end
end
})
t1.value72:AddButton({
	Name = "Remove Player",
	Callback = function()
    if t1.value93 and t1.value92[t1.value93.Name] then
        t1.value92[t1.value93.Name] = nil
        updateDropdown(t1.value96)
        updateLoopDropdown(t1.value97)
    end
end
})
t1.value72:AddToggle({
	Name = "Loop Kill",
	Callback = function(p63)
    t1.value94.Enabled = p63

    if p63 then
        loopControl()

        return
    end

    stopLoop()
end
})
t1.value87.PlayerAdded:Connect(function()
    updateDropdown(t1.value96)
end)
t1.value87.PlayerRemoving:Connect(function(player)
    if t1.value92[player.Name] then
        t1.value92[player.Name] = nil
        updateLoopDropdown(t1.value97)
    end

    updateDropdown(t1.value96)
end)
updateDropdown(t1.value96)
updateLoopDropdown(t1.value97)
t1.value98 = game:GetService("Players")
t1.value99 = game:GetService("ReplicatedStorage")
t1.value100 = game:GetService("Workspace")

local RunService = game:GetService("RunService")

t1.value101 = t1.value98.LocalPlayer
local GrabEvents3 = t1.value99:WaitForChild("GrabEvents", 5)

t1.value102 = GrabEvents3 and GrabEvents3:WaitForChild("SetNetworkOwner", 5)
t1.value103 = GrabEvents3 and GrabEvents3:WaitForChild("DestroyGrabLine", 5)
t1.value72:AddSection({
	Name = "Loop kick"
})
t1.value104 = false
t1.value105 = false
t1.value106 = false
t1.value107 = {}
t1.value108 = false
function t1.value109(p64)
    local PlotItems = t1.value100:FindFirstChild("PlotItems")

    if not PlotItems then
        return false
    end

    local PlayersInPlots = PlotItems:FindFirstChild("PlayersInPlots")

    if not PlayersInPlots then
        return false
    end

    return PlayersInPlots:FindFirstChild(p64.Name) ~= nil
end
function t1.value110()
    return t1.value100:FindFirstChild(t1.value101.Name .. "SpawnedInToys")
end
local function v35(p65, p66)
    t1.value99.MenuToys.SpawnToyRemoteFunction:InvokeServer(p65, p66, Vector3.zero)
    task.wait(0.15)

    local v313 = t1.value110()

    return v313 and v313:FindFirstChild(p65)
end
function t1.value111(p67)
    if p67 and t1.value99.MenuToys.DestroyToy then
        t1.value99.MenuToys.DestroyToy:FireServer(p67)
    end
end
function t1.value112(p68)
    local Character = p68.Character

    return Character and Character:FindFirstChild("HumanoidRootPart")
end
function t1.value113()
    local v314 = t1.value110()

    return v314 and v314:FindFirstChild("CreatureBlobman", true)
end
t1.value114 = nil
function t1.value114(p69, p70, p71)
    local v307 = p69:FindFirstChild(p71 .. "Detector")

    if not v307 then
        return
    end

    local v308 = v307:FindFirstChild(p71 .. "Weld")
    local BlobmanSeatAndOwnerScript = p69:FindFirstChild("BlobmanSeatAndOwnerScript")

    if BlobmanSeatAndOwnerScript and BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab") then
        BlobmanSeatAndOwnerScript.CreatureGrab:FireServer(v307, p70, v308)
    end
end
function t1.value115(p72, p73)
    local v317 = t1.value112(t1.value101)

    if not v317 then
        return
    end

    t1.value114(p72, v317, "Left")
    t1.value114(p72, v317, "Right")
    task.wait(0.1)

    if t1.value102 then
        t1.value102:FireServer(p73, v317.CFrame)
    end

    task.wait()
    p73.CFrame = p73.CFrame + Vector3.new(0, 16, 0)
    task.wait(0.1)

    if t1.value103 then
        t1.value103:FireServer(p73)
    end

    t1.value114(p72, p73, "Left")
    t1.value114(p72, p73, "Right")
end
function t1.value116()
    local t11 = {}

    for _, player in ipairs(t1.value98:GetPlayers()) do
        if player ~= t1.value101 and not t1.value109(player) then
            table.insert(t11, player.Name)
        end
    end

    return #t11 > 0 and t11 or { "No Players" }
end
local value72 = t1.value72
local v37 = t1.value116()
t1.value117 = value72:AddDropdown({
	Name = "Select Target Player",
	Options = v37,
	Default = "Select player",
	Callback = function(p74)
    if p74 == "No Players" then
        return
    end

    local v322 = table.find(t1.value107, p74)

    if v322 then
        table.remove(t1.value107, v322)

        return
    end

    table.insert(t1.value107, p74)
end
})
task.spawn(function()
    local PlayersInPlots = t1.value100:WaitForChild("PlotItems"):WaitForChild("PlayersInPlots")

    PlayersInPlots.ChildAdded:Connect(function()
        task.wait(0.1)
        t1.value117:Refresh(t1.value116(), true)
    end)
    PlayersInPlots.ChildRemoved:Connect(function()
        task.wait(0.1)
        t1.value117:Refresh(t1.value116(), true)
    end)
end)
t1.value72:AddToggle({
	Name = "Auto Sit Blobman",
	Default = false,
	Callback = function(p75)
    t1.value104 = p75
end
})
RunService.Heartbeat:Connect(function()
    if not t1.value104 then
        return
    end

    local Character = t1.value101.Character
    local v326 = Character and Character:FindFirstChild("Humanoid")

    if not v326 or v326.SeatPart then
        return
    end

    local v327 = t1.value110()
    local v328 = v327 and v327:FindFirstChild("CreatureBlobman")

    if v328 and v328:FindFirstChild("VehicleSeat") then
        if not v328.VehicleSeat.Occupant then
            v328.VehicleSeat:Sit(v326)

            return
        end

        t1.value111(v328)

        return
    end

    if not t1.value108 and (t1.value101:FindFirstChild("CanSpawnToy") and t1.value101.CanSpawnToy.Value) then
        v35("CreatureBlobman", Character.HumanoidRootPart.CFrame)
        task.delay(1.5, function()
        end)
    end
end)
t1.value72:AddToggle({
	Name = "Kick Selected Targets",
	Default = false,
	Callback = function(p76)
    t1.value106 = p76

    if p76 then
        task.spawn(function()
            while t1.value106 do
                local v620 = t1.value113()
                local v621 = t1.value112(t1.value101)

                if not v620 or not v621 then
                    return
                end

                for _, v in ipairs(t1.value107) do
                    if not t1.value106 then
                        break
                    end

                    local v6 = t1.value98:FindFirstChild(v)

                    if v6 and not t1.value109(v6) then
                        local v625 = t1.value112(v6)

                        if v625 then
                            local CFrame3 = v621.CFrame

                            v621.CFrame = v625.CFrame
                            task.wait(0.2)
                            t1.value115(v620, v625)
                            task.wait(0.2)
                            v621.CFrame = CFrame3
                        end
                    end
                end

                task.wait(0.5)
            end
        end)
    end
end
})
t1.value72:AddToggle({
	Name = "Kick All Players",
	Default = false,
	Callback = function(p77)
    t1.value105 = p77

    if p77 then
        task.spawn(function()
            while t1.value105 do
                local v627 = t1.value113()
                local v628 = t1.value112(t1.value101)

                if not v627 or not v628 then
                    return
                end

                local CFrame4 = v628.CFrame

                for _, player in ipairs(t1.value98:GetPlayers()) do
                    if not t1.value105 then
                        break
                    end

                    if player ~= t1.value101 and not t1.value109(player) then
                        local v632 = t1.value112(player)

                        if v632 then
                            v628.CFrame = v632.CFrame
                            task.wait(0.2)
                            t1.value115(v627, v632)
                        end
                    end
                end

                v628.CFrame = CFrame4
                task.wait(1)
            end
        end)
    end
end
})
t1.value118 = game:GetService("Players")
t1.value119 = t1.value118.LocalPlayer
local ReplicatedStorage2 = game:GetService("ReplicatedStorage")

t1.value120 = game:GetService("Workspace")
t1.value121 = game:GetService("RunService")

local BombEvents = ReplicatedStorage2:FindFirstChild("BombEvents")

t1.value122 = BombEvents and BombEvents:FindFirstChild("BombExplode")

local MenuToys = ReplicatedStorage2:FindFirstChild("MenuToys")

t1.value123 = MenuToys and MenuToys:FindFirstChild("SpawnToyRemoteFunction")

local __G = _G
t1.value124 = nil
__G.FireworkEffectSpam = false
_G.TargetToBombPlayer = nil
t1.value125 = "BombMissile"
t1.value126 = 0
t1.value127 = 10
function t1.value128()
    local Character = t1.value119.Character

    if Character and Character:FindFirstChild("HumanoidRootPart") then
        return Character.HumanoidRootPart.CFrame
    end

    return CFrame.new(0, 10, 0)
end
function t1.value129(p78)
    local PartHitDetector = p78:FindFirstChild("PartHitDetector")

    if not PartHitDetector then
        PartHitDetector = p78:FindFirstChild("Box")

        if not PartHitDetector then
            PartHitDetector = p78:FindFirstChild("Balloon") or (p78:FindFirstChild("Body") or p78:FindFirstChild("Pyramid"))
        end
    end

    return PartHitDetector
end
function t1.value130()
    local Part = Instance.new("Part")

    Part.Name = "FakeAimPart"
    Part.Anchored = true
    Part.CanCollide = false
    Part.Transparency = 1
    Part.Size = Vector3.new(1, 1, 1)

    if t1.value119.Character and t1.value119.Character:FindFirstChild("CamPart") then
        local ray = Ray.new(t1.value119.Character.CamPart.Position, t1.value119.Character.CamPart.CFrame.LookVector * 5000)
        local _, position = t1.value120:FindPartOnRayWithIgnoreList(ray, { t1.value119.Character })

        if not position then
            position = t1.value119.Character.CamPart.Position + t1.value119.Character.CamPart.CFrame.LookVector * 100
        end

        Part.Position = position
    else
        Part.Position = Vector3.new(0, 100, 0)
    end

    Part.Parent = t1.value120
    game:GetService("Debris"):AddItem(Part, 5)

    return Part
end
function t1.value131()
    if t1.value126 == 0 then
        return t1.value120.SpawnLocation or t1.value120, Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10))
    end

    if t1.value126 == 1 then
        local _GTargetToBombPlayer = t1.value118:FindFirstChild(_G.TargetToBombPlayer)

        if _GTargetToBombPlayer and (_GTargetToBombPlayer.Character and _GTargetToBombPlayer.Character:FindFirstChild("HumanoidRootPart")) then
            local HumanoidRootPart = _GTargetToBombPlayer.Character.HumanoidRootPart

            return HumanoidRootPart, HumanoidRootPart.Position
        end

        return t1.value120.SpawnLocation or t1.value120, Vector3.new(0, -10, 0)
    end

    local v340 = t1.value130()

    return v340, v340.Position
end
t1.value132 = false
t1.value124 = nil
function t1.value133()
    if t1.value132 then
        return
    end

    local cFrame = CFrame.new(0, 10, 0)

    t1.value124 = t1.value121.Heartbeat:Connect(function()
        if not _G.FireworkEffectSpam then
            t1.value124:Disconnect()

            return
        end

        if tick() - 0 > 0.1 then
            cFrame = t1.value128() or cFrame
            tick()
        end

        if t1.value123 then
            for _ = 1, t1.value127 do
                task.spawn(function()
                    pcall(t1.value123.InvokeServer, t1.value123, t1.value125, cFrame, Vector3.new(0, 97.69, 0))
                end)
            end
        end

        local v634 = t1.value120:FindFirstChild(t1.value119.Name .. "SpawnedInToys")

        if v634 and t1.value122 then
            local v635, v636 = t1.value131()
            local v637 = v635
            local v638 = v636

            for _, child in pairs(v634:GetChildren()) do
                local v641 = child

                if v641.Name == t1.value125 then
                    local v642 = t1.value129(v641)

                    if v642 then
                        task.spawn(function()
                            pcall(t1.value122.FireServer, t1.value122, {
								Radius = 17.5,
								TimeLength = 0.1,
								Hitbox = v642,
								ExplodesByFire = true,
								MaxForcePerStudSquared = 225,
								DestroysModel = true,
								Model = v641,
								ExplodesByPointy = false,
								ImpactSpeed = 20,
								PositionPart = v637
							}, v638)
                        end)
                    end
                end
            end
        end
    end)
end
pcall(function()
    t1.value72:AddSection({
		Name = "Explosion spam"
	})
    t1.value72:AddToggle({
		Name = "Loop Spawn & Explode",
		Default = false,
		Callback = function(p79)
        _G.FireworkEffectSpam = p79

        if p79 then
            t1.value127 = 1.3
            t1.value133()
        end
    end
	})
    t1.value72:AddDropdown({
		Name = "ExplosionType",
		Default = "Missile",
		Options = {
			"Firework",
			"Missile",
			"Void",
			"Balloon"
		},
		Callback = function(p80)
        if p80 == "Firework" then
            t1.value125 = "FireworkMissile"

            return
        end

        if p80 == "Missile" then
            t1.value125 = "BombMissile"

            return
        end

        if p80 == "Void" then
            t1.value125 = "BombDarkMatter"

            return
        end

        if p80 == "Balloon" then
            t1.value125 = "BombBalloon"
        end
    end
	})
    t1.value72:AddSlider({
		Name = "Spawn Rate (idk if this work)",
		Min = 1,
		Max = 20,
		Default = 1,
		Increment = 1,
		Callback = function(p81)
        t1.value127 = p81
    end
	})
    t1.value72:AddDropdown({
		Name = "Target",
		Default = "Player",
		Options = {
			"Spawn",
			"Player",
			"Mouse"
		},
		Callback = function(p82)
        if p82 ~= "Spawn" and p82 ~= "Player" then
            if p82 ~= "Mouse" then
            end
        end
    end
	})

    local v342 = t1.value72:AddDropdown({
		Name = "Select Player",
		Default = "",
		Options = { "" },
		Callback = function(p83)
        if p83 ~= "" then
            _G.TargetToBombPlayer = string.split(p83, " ")[1]
        end
    end
	})

    local function v343()
        local t12 = {}

        for _, player in ipairs(t1.value118:GetPlayers()) do
            if player ~= t1.value119 then
                table.insert(t12, player.Name .. " (" .. player.DisplayName .. ")")
            end
        end

        table.sort(t12, function(p84, p85)
            return p84:lower() < p85:lower()
        end)
        v342:Refresh(t12, true)
    end

    t1.value118.PlayerAdded:Connect(v343)
    t1.value118.PlayerRemoving:Connect(v343)
    task.spawn(v343)
    t1.value72:AddButton({
		Name = "Explode All Bombs (Instant)",
		Callback = function()
        local v651 = t1.value120:FindFirstChild(t1.value119.Name .. "SpawnedInToys")

        if not v651 or not t1.value122 then
            return
        end

        local v652, v653 = t1.value131()
        local v654 = v652
        local GetChildren = v651.GetChildren
        local v656 = v653

        for _, v in pairs(GetChildren(v651)) do
            local v659 = v

            if v659.Name == t1.value125 then
                local v660 = t1.value129(v659)

                if v660 then
                    task.spawn(function()
                        pcall(t1.value122.FireServer, t1.value122, {
								Radius = 17.5,
								TimeLength = 0.1,
								Hitbox = v660,
								ExplodesByFire = true,
								MaxForcePerStudSquared = 225,
								DestroysModel = true,
								Model = v659,
								ExplodesByPointy = false,
								ImpactSpeed = 20,
								PositionPart = v654
							}, v656)
                    end)
                end
            end
        end
    end
	})
end)
t1.value134 = game:GetService("Players")
t1.value135 = t1.value134.LocalPlayer
local ReplicatedStorage3 = game:GetService("ReplicatedStorage")

t1.value136 = game:GetService("RunService")
game:GetService("Workspace")
game:GetService("UserInputService")
game:GetService("HttpService")
game:GetService("TextChatService")
t1.value137 = nil
local GrabEvents4 = ReplicatedStorage3:WaitForChild("GrabEvents")

t1.value138 = GrabEvents4:WaitForChild("SetNetworkOwner")
GrabEvents4:WaitForChild("DestroyGrabLine")
t1.value139 = ReplicatedStorage3:WaitForChild("CharacterEvents"):WaitForChild("RagdollRemote")
t1.value140 = false
t1.value141 = nil
t1.value142 = nil
t1.value143 = nil
t1.value144 = 10
t1.value137 = 3.5
function t1.value145()
    local t13 = {}

    for _, player in ipairs(t1.value134:GetPlayers()) do
        if player ~= t1.value135 then
            table.insert(t13, player.Name)
        end
    end

    return t13
end
function t1.value146(p86)
    if not p86 or not t1.value135.Character then
        return
    end

    local HumanoidRootPart = p86:WaitForChild("HumanoidRootPart", 2)
    local HumanoidRootPart2 = t1.value135.Character:WaitForChild("HumanoidRootPart", 2)

    if not HumanoidRootPart or not HumanoidRootPart2 then
        return
    end

    local v350 = CFrame.new(HumanoidRootPart.Position) * CFrame.Angles(0, HumanoidRootPart.Orientation.Y * 3.141592653589793 / 180, 0) * CFrame.new(0, 0, 3)

    HumanoidRootPart2.CFrame = CFrame.new(v350.Position.X, HumanoidRootPart.Position.Y, v350.Position.Z)
end
function t1.value147()
    if t1.value143 then
        t1.value143:Disconnect()
    end

    if not t1.value142 then
        return
    end

    t1.value143 = t1.value136.Heartbeat:Connect(function()
        if not t1.value140 then
            return
        end

        if not t1.value142 or (not t1.value142.Character or not t1.value135.Character) then
            return
        end

        local HumanoidRootPart = t1.value142.Character:FindFirstChild("HumanoidRootPart")
        local HumanoidRootPart3 = t1.value135.Character:FindFirstChild("HumanoidRootPart")

        if not HumanoidRootPart or not HumanoidRootPart3 then
            return
        end

        if HumanoidRootPart ~= nil then
            HumanoidRootPart3.CFrame = HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
        end

        for _ = 1, t1.value137 do
            t1.value138:FireServer(HumanoidRootPart, HumanoidRootPart.CFrame)
            t1.value139:FireServer(HumanoidRootPart, 0)
        end

        HumanoidRootPart.CFrame = HumanoidRootPart3.CFrame * CFrame.new(0, t1.value144, 0)
    end)
end
t1.value135.CharacterAdded:Connect(function(character)
    character:WaitForChild("HumanoidRootPart", 3)
    task.wait(0.05)

    if t1.value140 and (t1.value142 and t1.value142.Character) then
        t1.value146(t1.value142.Character)
        t1.value147()
    end
end)
t1.value72:AddSection({
	Name = "annoy replaced"
})
t1.value72:AddLabel("This makes players above you and spam them use gucci/AntiGrab")
t1.value72:AddLabel("This one makes player temp ragdoll if they reset")

local value72_2 = t1.value72
local v45 = t1.value145()
t1.value148 = value72_2:AddDropdown({
	Name = "Select Player",
	Options = v45,
	Callback = function(p87)
    t1.value141 = t1.value134:FindFirstChild(p87)
end
})
local value72_3 = t1.value72
local AddSlider = value72_3.AddSlider
local value144 = t1.value144
AddSlider(value72_3, {
	Name = "Grab Height",
	Min = 5,
	Max = 30,
	Default = value144,
	Increment = 1,
	Callback = function(p88)
    t1.value144 = p88
end
})
t1.value72:AddToggle({
	Name = "TP + Grab (Annoy Player)",
	Default = false,
	Callback = function(p89)
    t1.value140 = p89

    if p89 then
        if not t1.value141 then
            t1.value1:MakeNotification({
					Name = "Error",
					Content = "Select a player first",
					Time = 1
				})

            return
        end

        t1.value142 = t1.value141

        if t1.value142.Character then
            t1.value146(t1.value142.Character)
        end

        t1.value147()

        local value1 = t1.value1
        local MakeNotification = value1.MakeNotification
        local v357 = "Locked onto " .. t1.value142.Name

        MakeNotification(value1, {
				Name = "ON",
				Content = v357,
				Time = 2
			})

        return
    end

    if t1.value143 then
        t1.value143:Disconnect()
    end
end
})
t1.value149 = {}
function registerDropdown(p90)
    table.insert(t1.value149, p90)
    p90:Refresh(t1.value145(), true)
end
t1.value150 = {
	TargetList = {},
	BlobmanDelay = 0.1
}
t1.value151 = game:GetService("Players")
t1.value152 = t1.value151.LocalPlayer
t1.value153 = game:GetService("Workspace")
t1.value154 = false
t1.value155 = 1
local v49 = t1.value2:MakeTab({
	Name = "Plot kicker",
	Icon = "rbxassetid://6031091005",
	PremiumOnly = false
})
v49:AddSection({
	Name = "Blobman Target"
})
local Players = game:GetService("Players")
local ReplicatedStorage4 = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local v53 = t1.value150.TargetList or {}
t1.value156 = {
	Players = Players,
	ReplicatedStorage = ReplicatedStorage4,
	Workspace = Workspace,
	LocalPlayer = nil,
	TargetList = v53,
	selectedPlayer = nil,
	toggleEnabled = false,
	teleportAllEnabled = false,
	teleportDelay = 1,
	currentBlobman = nil,
	masterRunning = false,
	blobmanAlter = 1,
	ORIGIN_POS = nil,
	MAX_TELEPORT_DIST = 500,
	targetPlayerDropdown = nil
}
t1.value156.LocalPlayer = t1.value156.Players.LocalPlayer
t1.value150.TargetList = t1.value156.TargetList
function t1.value145()
    local t14 = {}

    for _, player in pairs(t1.value156.Players:GetPlayers()) do
        if player ~= t1.value156.LocalPlayer then
            table.insert(t14, player.Name)
        end
    end

    return t14
end
function refreshDropdown()
    if t1.value156.targetPlayerDropdown then
        t1.value156.targetPlayerDropdown:Refresh(t1.value145(), true)
    end
end
task.wait(1)

local value156 = t1.value156
local AddDropdown = v49.AddDropdown
local v56 = t1.value145()
value156.targetPlayerDropdown = AddDropdown(v49, {
	Name = "Select Player",
	Default = "",
	Options = v56,
	Callback = function(p91)
    t1.value156.selectedPlayer = t1.value156.Players:FindFirstChild(p91)
end
})
registerDropdown(t1.value156.targetPlayerDropdown)
v49:AddButton({
	Name = "Add Selected Player to Target List",
	Callback = function()
    if t1.value156.selectedPlayer and not t1.value156.TargetList[t1.value156.selectedPlayer.UserId] then
        t1.value156.TargetList[t1.value156.selectedPlayer.UserId] = t1.value156.selectedPlayer.Name

        local value1 = t1.value1
        local selectedPlayerName = t1.value156.selectedPlayer.Name
        local MakeNotification = value1.MakeNotification
        local v366 = selectedPlayerName .. " added to target list."

        MakeNotification(value1, {
				Name = "Player Added",
				Content = v366,
				Time = 2
			})
    end
end
})
v49:AddButton({
	Name = "Remove Selected Player from Target List",
	Callback = function()
    if t1.value156.selectedPlayer and t1.value156.TargetList[t1.value156.selectedPlayer.UserId] then
        t1.value156.TargetList[t1.value156.selectedPlayer.UserId] = nil

        local value1 = t1.value1
        local MakeNotification = value1.MakeNotification
        local v369 = t1.value156.selectedPlayer.Name .. " removed from target list."

        MakeNotification(value1, {
				Name = "Player Removed",
				Content = v369,
				Time = 2
			})
    end
end
})
function blobGrabPlayer(p92, p93)
    if t1.value155 ~= 1 then
        if p92.Character and p92.Character:FindFirstChild("HumanoidRootPart") then
            local t15 = {
				p93:FindFirstChild("RightDetector"),
				p92.Character:FindFirstChild("HumanoidRootPart"),
				p93:FindFirstChild("RightDetector"):FindFirstChild("RightWeld")
			}
            local CreatureGrab = p93:WaitForChild("BlobmanSeatAndOwnerScript"):WaitForChild("CreatureGrab")
            local t16 = { unpack(t15) }

            CreatureGrab:FireServer(v2(t16))

            return
        end
    elseif p92.Character and p92.Character:FindFirstChild("HumanoidRootPart") then
        local t17 = {
			p93:FindFirstChild("LeftDetector"),
			p92.Character:FindFirstChild("HumanoidRootPart"),
			p93:FindFirstChild("LeftDetector"):FindFirstChild("LeftWeld")
		}
        local CreatureGrab = p93:WaitForChild("BlobmanSeatAndOwnerScript"):WaitForChild("CreatureGrab")
        local t18 = { unpack(t17) }

        CreatureGrab:FireServer(v2(t18))
    end
end
function getMountedBlobman()
    local Character = t1.value152.Character

    if Character then
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")

        if Humanoid and (Humanoid.SeatPart and Humanoid.SeatPart.Parent.Name == "CreatureBlobman") then
            return Humanoid.SeatPart.Parent
        end
    end

    return nil
end
function teleportBlobman(p94, p95)
    local v382 = t1.value152.Character and t1.value152.Character:FindFirstChild("HumanoidRootPart")

    if v382 then
        local BodyPosition = Instance.new("BodyPosition")

        BodyPosition.MaxForce = Vector3.new(1e999, 1e999, 1e999)
        BodyPosition.P = 100000
        BodyPosition.Position = p95
        BodyPosition.Parent = p94.PrimaryPart
        v382.CFrame = CFrame.new(p95)

        local t19 = { CFrame.new(p95) }

        p94:SetPrimaryPartCFrame(v2(t19))
        task.wait(0.1)
        BodyPosition:Destroy()
    end
end
function startGrabbingPlayers()
    task.spawn(function()
        local g669
        while t1.value154 do
            local v664, v665, v666 = pairs(t1.value153:GetDescendants())
            local v667
            local v668
            repeat
                v666, v668 = v664(v665, v666)

                if v666 == nil then
                    g669 = true
                end

                if g669 then
                    break
                end

                local v670 = v668.Name == "CreatureBlobman"

                if v670 then
                    v670 = v668:FindFirstChild("VehicleSeat")

                    if v670 then
                        v670 = v668.VehicleSeat:FindFirstChild("SeatWeld")

                        if v670 then
                            v670 = v668.VehicleSeat.SeatWeld.Part1:IsDescendantOf(t1.value152.Character)
                        end
                    end
                end
            until v670
            if not g669 then
                v667 = v668
            end
            g669 = false
            if not v667 then
                t1.value1:MakeNotification({
					Name = "Error",
					Content = "You must be mounted on a Blobman!",
					Time = 5
				})
                t1.value154 = false

                return
            end
            for k, _ in pairs(t1.value150.TargetList) do
                local PlayerByUserId = t1.value151:GetPlayerByUserId(k)

                if PlayerByUserId then
                    blobGrabPlayer(PlayerByUserId, v667)
                    task.wait(t1.value150.BlobmanDelay or 0.1)
                end
            end
            task.wait(0.02)
        end
    end)
end
function attemptTeleportAndGrab(p96, p97, p98)
    if not t1.value152.Character or not t1.value152.Character:FindFirstChild("HumanoidRootPart") or (not p96.Character or not p96.Character:FindFirstChild("HumanoidRootPart")) then
        return false
    end

    local HumanoidRootPart = p96.Character.HumanoidRootPart

    if (HumanoidRootPart.Position - p98).Magnitude <= 20 then
        return true
    end

    local v389 = HumanoidRootPart.Position + Vector3.new(0, 2, 0)

    teleportBlobman(p97, v389)
    task.wait(0.2)
    blobGrabPlayer(p96, p97)
    task.wait(0.2)
    teleportBlobman(p97, p98)
    task.wait(0.2)

    return (HumanoidRootPart.Position - p98).Magnitude <= 20
end
function startTeleportingPlayers()
    task.spawn(function()
        while t1.value154 do
            local v674 = getMountedBlobman()
            local v675 = t1.value152.Character and t1.value152.Character:FindFirstChild("HumanoidRootPart")

            if v674 and v675 then
                local Position = v675.Position

                for k, _ in pairs(t1.value150.TargetList) do
                    local PlayerByUserId = t1.value151:GetPlayerByUserId(k)
                    local v680 = PlayerByUserId

                    if PlayerByUserId then
                        v680 = PlayerByUserId.Character and (PlayerByUserId.Character:FindFirstChild("HumanoidRootPart") and (PlayerByUserId.Character.HumanoidRootPart.Position - Position).Magnitude > 20)
                    end

                    if v680 then
                        local v681 = false
                        local n3 = 0

                        while t1.value154 and (not v681 and n3 < 3) do
                            v681 = attemptTeleportAndGrab(PlayerByUserId, v674, Position)
                            n3 += 1

                            if not v681 then
                                task.wait(0.5)
                            end
                        end
                    end
                end
            end

            task.wait(0.2)
        end
    end)
end
v49:AddToggle({
	Name = "Blobman Target (If you are in safe zone/void)",
	Default = false,
	Callback = function(p99)
    t1.value154 = p99

    if p99 then
        startGrabbingPlayers()
        startTeleportingPlayers()
    end
end
})
function findGroundBelow(p100)
    local raycastParams = RaycastParams.new()

    raycastParams.FilterDescendantsInstances = { t1.value156.LocalPlayer.Character }
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

    local raycastResult = t1.value156.Workspace:Raycast(p100 + Vector3.new(0, 50, 0), Vector3.new(0, -400), raycastParams)

    if raycastResult then
        p100 = raycastResult.Position or p100
    end

    return p100
end
function spawnBlobman()
    local Character = t1.value156.LocalPlayer.Character

    if Character then
        Character = Character:FindFirstChild("HumanoidRootPart")
    end

    if not Character then
        return nil
    end

    local v395 = findGroundBelow(Character.Position)
    local cFrame = CFrame.new(v395 + Vector3.new(0, 3, 0))

    pcall(function()
        local SpawnToyRemoteFunction = t1.value156.ReplicatedStorage.MenuToys.SpawnToyRemoteFunction
        local v684 = cFrame
        local t20 = { Vector3.new(0, 59.667, 0) }

        SpawnToyRemoteFunction:InvokeServer("CreatureBlobman", v684, v2(t20))
    end)

    local v397 = t1.value156.LocalPlayer.Name .. "SpawnedInToys"

    for _ = 1, 30 do
        local v399 = t1.value156.Workspace:FindFirstChild(v397)
        local v400 = v399 and v399:FindFirstChild("CreatureBlobman")

        if v400 then
            t1.value156.blobmanAlter = 1

            return v400
        end

        task.wait(0.15)
    end

    return nil
end
function findExistingBlobman()
    local v401 = t1.value156.Workspace:FindFirstChild(t1.value156.LocalPlayer.Name .. "SpawnedInToys")

    return v401 and v401:FindFirstChild("CreatureBlobman") or nil
end
function seatOnBlobman(p101)
    if p101 and t1.value156.LocalPlayer.Character then
        local Character = t1.value156.LocalPlayer.Character
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

        if Humanoid and HumanoidRootPart then
            local VehicleSeat = p101:FindFirstChild("VehicleSeat")

            if VehicleSeat and VehicleSeat:IsA("VehicleSeat") then
                HumanoidRootPart.CFrame = VehicleSeat.CFrame + Vector3.new(0, 2, 0)
                pcall(function()
                    VehicleSeat:Sit(Humanoid)
                end)
                task.wait(0.25)
            end
        end
    end
end
function teleportBlobman(p102, p103)
    if p102 and p102.PrimaryPart then
        local Character = t1.value156.LocalPlayer.Character

        if Character then
            local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

            if HumanoidRootPart then
                local BodyPosition = Instance.new("BodyPosition")

                BodyPosition.MaxForce = Vector3.new(1e999, 1e999, 1e999)
                BodyPosition.P = 100000
                BodyPosition.Position = p103
                BodyPosition.Parent = p102.PrimaryPart
                pcall(function()
                    HumanoidRootPart.CFrame = CFrame.new(p103)
                    p102:SetPrimaryPartCFrame(CFrame.new(p103))
                end)
                task.wait(0.1)

                if BodyPosition.Parent then
                    BodyPosition:Destroy()
                end
            end
        end
    end
end
function blobGrabPlayer(p104, p105)
    if p104 and p105 and (p104.Character and p104.Character:FindFirstChild("HumanoidRootPart")) then
        local LeftDetector = p105:FindFirstChild("LeftDetector")
        local RightDetector = p105:FindFirstChild("RightDetector")
        local BlobmanSeatAndOwnerScript = p105:FindFirstChild("BlobmanSeatAndOwnerScript")

        if BlobmanSeatAndOwnerScript then
            local CreatureGrab = BlobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")

            if CreatureGrab then
                if t1.value156.blobmanAlter ~= 1 then
                    local v418 = RightDetector and RightDetector:FindFirstChild("RightWeld")

                    if RightDetector and v418 then
                        pcall(function()
                            CreatureGrab:FireServer(RightDetector, p104.Character.HumanoidRootPart, v418)
                        end)
                        t1.value156.blobmanAlter = 1

                        return
                    end
                else
                    local v419 = LeftDetector and LeftDetector:FindFirstChild("LeftWeld")

                    if LeftDetector and v419 then
                        pcall(function()
                            CreatureGrab:FireServer(LeftDetector, p104.Character.HumanoidRootPart, v419)
                        end)
                        t1.value156.blobmanAlter = 2
                    end
                end
            end
        end
    end
end
t1.value157 = game:GetService("Players")
t1.value158 = game:GetService("ReplicatedStorage")
t1.value159 = game:GetService("RunService")
t1.value160 = game:GetService("Workspace")
t1.value161 = t1.value157.LocalPlayer
t1.value162 = t1.value158:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")

local v57 = t1.value2:MakeTab({
	Name = "Random",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
v57:AddSection({
	Name = "Working"
})
t1.value163 = false
t1.value164 = 0
function lag()
    while t1.value163 do
        for _ = 1, t1.value164 do
            for _, player in ipairs(t1.value157:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("Torso") then
                    t1.value158.GrabEvents.CreateGrabLine:FireServer(player.Character.Torso, player.Character.Torso.CFrame)
                end
            end
        end

        task.wait(1)
    end
end
v57:AddToggle({
	Name = "Lag Ping killer",
	Default = false,
	Callback = function(p106)
    t1.value163 = p106

    if p106 then
        task.spawn(lag)
    end
end
})
t1.value164 = 0
local value164 = t1.value164
v57:AddSlider({
	Name = "Lag Intensity",
	Min = 1,
	Max = 9999,
	Default = value164,
	Increment = 1,
	ValueName = "",
	Callback = function(p107)
    t1.value164 = p107
    print("Lag intensity set to:", t1.value164)
end
})
local value157 = t1.value157
local value159 = t1.value159
local value160 = t1.value160
local Part = Instance.new("Part")

t1.value165 = {
	Players = value157,
	RunService = value159,
	Workspace = value160,
	Enabled = false,
	Queue = {},
	Position = nil,
	Camera = nil,
	Radius = 15,
	Conn = nil,
	WhitelistFriends = false,
	CameraBlock = Part
}
t1.value165.CameraBlock.Anchored = true
t1.value165.CameraBlock.CanCollide = false
t1.value165.CameraBlock.Transparency = 1
t1.value165.CameraBlock.CanQuery = false
t1.value165.CameraBlock.Size = Vector3.new(10, 10, 10)

function freezeCamera()
    local CurrentCamera = t1.value160.CurrentCamera

    t1.value165.CameraBlock.CFrame = t1.value165.Camera
    t1.value165.CameraBlock.Parent = t1.value160
    CurrentCamera.CameraType = Enum.CameraType.Scriptable
    CurrentCamera.CFrame = t1.value165.Camera
end
function unfreezeCamera()
    t1.value165.CameraBlock.Parent = nil

    local CurrentCamera = t1.value160.CurrentCamera

    CurrentCamera.CameraType = Enum.CameraType.Custom

    if t1.value165.Camera then
        CurrentCamera.CFrame = t1.value165.Camera
    end

    t1.value165.Camera = nil
end
function disableCollisions(p108)
    local GetDescendants = p108.GetDescendants

    for _, v in pairs(GetDescendants(p108)) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
end
function t1.value109(p109)
    local PlotItems = t1.value160:FindFirstChild("PlotItems")

    if PlotItems then
        local PlayersInPlots = PlotItems:FindFirstChild("PlayersInPlots")

        if PlayersInPlots then
            return PlayersInPlots:FindFirstChild(p109.Name)
        end
    end

    return nil
end
function isInRadius(p110)
    return (p110 - t1.value165.Position).Magnitude <= t1.value165.Radius
end
function shouldIgnore(p111)
    if p111 == t1.value161 then
        return true
    end

    if t1.value165.WhitelistFriends and t1.value161:IsFriendsWith(p111.UserId) then
        return true
    end

    return false
end
function refreshQueue()
    t1.value165.Queue = {}

    for _, player in pairs(t1.value157:GetPlayers()) do
        if not shouldIgnore(player) and (player.Character and not t1.value109(player)) then
            local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

            if HumanoidRootPart and not isInRadius(HumanoidRootPart.Position) then
                table.insert(t1.value165.Queue, player)
            end
        end
    end
end
function processNext()
    if #t1.value165.Queue == 0 then
        refreshQueue()

        if #t1.value165.Queue == 0 then
            return
        end
    end

    local v439 = table.remove(t1.value165.Queue, 1)

    if v439 and v439.Character then
        local HumanoidRootPart = v439.Character:FindFirstChild("HumanoidRootPart")
        local Head = v439.Character:FindFirstChild("Head")
        local v442 = t1.value161.Character and t1.value161.Character:FindFirstChild("HumanoidRootPart")

        if HumanoidRootPart and (Head and v442) then
            t1.value161.Character:PivotTo(HumanoidRootPart.CFrame * CFrame.new(0, -6, 0))
            disableCollisions(t1.value161.Character)

            local n4 = 0

            if not false and (not Head:FindFirstChild("PartOwner") or Head.PartOwner.Value ~= t1.value161.Name) then
                local _ = t1.value165.Enabled
            end

            repeat
                t1.value162:FireServer(HumanoidRootPart, v442.CFrame)
                task.wait(0.15)
                n4 += 1
            until n4 > 20 or (Head:FindFirstChild("PartOwner") and Head.PartOwner.Value == t1.value161.Name or not t1.value165.Enabled)

            if t1.value165.Enabled and (Head:FindFirstChild("PartOwner") and Head.PartOwner.Value == t1.value161.Name) then
                HumanoidRootPart.CFrame = CFrame.new(t1.value165.Position)
                HumanoidRootPart.Position = t1.value165.Position
                HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
                task.wait(0.8)
            end
        end
    end
end
function startBringAll()
    local v445 = t1.value161.Character and t1.value161.Character:FindFirstChild("HumanoidRootPart")

    if v445 then
        t1.value165.Position = v445.Position
        t1.value165.Camera = t1.value160.CurrentCamera.CFrame
        refreshQueue()
        freezeCamera()
        t1.value165.Conn = t1.value159.Heartbeat:Connect(function()
            if t1.value165.Enabled then
                processNext()

                if t1.value165.Camera then
                    local CurrentCamera = t1.value160.CurrentCamera

                    CurrentCamera.CameraType = Enum.CameraType.Scriptable
                    CurrentCamera.CFrame = t1.value165.Camera
                    t1.value165.CameraBlock.CFrame = t1.value165.Camera
                    t1.value165.CameraBlock.Parent = t1.value160
                end
            end
        end)
    end
end
function stopBringAll()
    if t1.value165.Conn then
        t1.value165.Conn:Disconnect()
        t1.value165.Conn = nil
    end

    unfreezeCamera()

    local v446 = t1.value161.Character and t1.value161.Character:FindFirstChild("HumanoidRootPart")

    if v446 and t1.value165.Position then
        v446.AssemblyLinearVelocity = Vector3.zero
        v446.CFrame = CFrame.new(t1.value165.Position)
    end
end
function onCharacterAdded(p112)
    p112:WaitForChild("Humanoid").Died:Connect(function()
        if t1.value165.Conn then
            t1.value165.Conn:Disconnect()
            t1.value165.Conn = nil
        end

        unfreezeCamera()
    end)

    if t1.value165.Enabled then
        local HumanoidRootPart = p112:WaitForChild("HumanoidRootPart")
        local value165 = t1.value165
        local value165Position = t1.value165.Position

        if not value165Position then
            value165Position = HumanoidRootPart.Position
        end

        value165.Position = value165Position
        t1.value165.Camera = t1.value165.Camera or t1.value160.CurrentCamera.CFrame
        freezeCamera()
        t1.value165.Conn = t1.value159.Heartbeat:Connect(function()
            if t1.value165.Enabled then
                processNext()

                if t1.value165.Camera then
                    local CurrentCamera = t1.value160.CurrentCamera

                    CurrentCamera.CameraType = Enum.CameraType.Scriptable
                    CurrentCamera.CFrame = t1.value165.Camera
                    t1.value165.CameraBlock.CFrame = t1.value165.Camera
                    t1.value165.CameraBlock.Parent = t1.value160
                end
            end
        end)
    end
end
t1.value161.CharacterAdded:Connect(onCharacterAdded)
t1.value157.PlayerAdded:Connect(function()
    if t1.value165.Enabled then
        refreshQueue()
    end
end)
t1.value157.PlayerRemoving:Connect(function(player)
    for i = #t1.value165.Queue, 1, -1 do
        local v453 = i

        if player == t1.value165.Queue[v453] then
            table.remove(t1.value165.Queue, v453)
        end
    end
end)
v57:AddToggle({
	Name = "Bring All (Works sometimes)",
	Default = false,
	Callback = function(p113)
    t1.value165.Enabled = p113

    if p113 then
        startBringAll()

        return
    end

    stopBringAll()
end
})
v57:AddToggle({
	Name = "Whitelist Friends",
	Default = false,
	Callback = function(p114)
    t1.value165.WhitelistFriends = p114
end
})
local value160_2 = t1.value160
local value157_2 = t1.value157
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")
local FallenPartsDestroyHeight = t1.value160.FallenPartsDestroyHeight
t1.value166 = {
	workspace = value160_2,
	players = value157_2,
	debris = Debris,
	userInputService = UserInputService,
	fpdHeight = FallenPartsDestroyHeight,
	limbs = {
		"Left Leg",
		"Right Leg",
		"Left Arm",
		"Right Arm",
		"HumanoidRootPart"
	}
}
function findHeldPlayer()
    local GrabParts = t1.value166.workspace:FindFirstChild("GrabParts")

    if not GrabParts then
        return nil
    end

    local GetChildren = GrabParts.GetChildren

    for _, v in pairs(GetChildren(GrabParts)) do
        if v:IsA("BasePart") then
            for _, child in pairs(v:GetChildren()) do
                if not (child:IsA("WeldConstraint") and (child.Part1 and child.Part1.Parent:IsA("Model"))) then
                    continue
                end

                local Part1Parent = child.Part1.Parent

                if Part1Parent:FindFirstChildOfClass("Humanoid") then
                    return t1.value157:GetPlayerFromCharacter(Part1Parent)
                end
            end
        end
    end

    return nil
end
function teleportLimbs(p115)
    if not p115 or not p115.Character then
        return
    end
    local Character = p115.Character
    local t21 = {}
    for v468, v469 in pairs(t1.value166.limbs) do

        local v470 = Character:FindFirstChild(v469)

        if v470 then

            for v473, v474 in pairs(t1.value160:GetDescendants()) do

                if v474:IsA("WeldConstraint") and v470 == v474.Part0 or v470 == v474.Part1 then
                    v474.Enabled = false
                    table.insert(t21, v474)
                end
            end
            for _, child in pairs(v470:GetChildren()) do
                if child:IsA("Motor6D") or child:IsA("Weld") then
                    child.Enabled = false
                    table.insert(t21, child)
                end
            end
            v470.Anchored = false
            local vector3_2 = Vector3.new(v470.Position.X, t1.value166.fpdHeight - 100, v470.Position.Z)
            pcall(function()
                if v470:IsA("Model") then
                    if v470.PrimaryPart or v470:FindFirstChildWhichIsA("BasePart") then
                        v470:SetPrimaryPartCFrame(CFrame.new(vector3_2))

                        return
                    end
                else
                    v470.CFrame = CFrame.new(vector3_2)
                end
            end)
            task.wait(0.1)
        end
    end
    for _, v in pairs(t21) do
        v.Enabled = true
    end
end
function deleteUserLimbs()
    local v480 = findHeldPlayer()

    if v480 then
        teleportLimbs(v480)
    end
end
if t1.value166.userInputService.TouchEnabled then
    local AddButton = v57.AddButton
    local _deleteUserLimbs = deleteUserLimbs

    AddButton(v57, {
		Name = "Delete Limbs (Hold and ragdoll player)",
		Callback = _deleteUserLimbs
	})
else
    local AddButton = v57.AddButton
    local _deleteUserLimbs = deleteUserLimbs

    AddButton(v57, {
		Name = "Delete Limbs (Hold and ragdoll player)",
		Callback = _deleteUserLimbs
	})
end
t1.value157.PlayerAdded:Connect(function()
    t1.value148:Refresh(t1.value145(), true)
end)
t1.value157.PlayerRemoving:Connect(function()
    t1.value148:Refresh(t1.value145(), true)
end)

local v72 = t1.value2:MakeTab({
	Name = "Request",
	Icon = "rbxassetid://6031094674",
	PremiumOnly = false
})
local Players2 = game:GetService("Players")

t1.value167 = game:GetService("ReplicatedStorage")
t1.value168 = Players2.LocalPlayer
t1.value169 = workspace.CurrentCamera
t1.value170 = game:GetService("UserInputService")
t1.value171 = false
t1.value172 = 300
t1.value173 = 400
t1.value174 = 40
t1.value175 = "Pallet"
t1.value176 = nil
t1.value177 = nil
t1.value178 = (function()
    if t1.value167:FindFirstChild("MenuToys") and t1.value167.MenuToys:FindFirstChild("SpawnToyRemoteFunction") then
        return t1.value167.MenuToys.SpawnToyRemoteFunction
    end

    if t1.value167:FindFirstChild("ToyEvents") and t1.value167.ToyEvents:FindFirstChild("SpawnToy") then
        return t1.value167.ToyEvents.SpawnToy
    end

    if t1.value167:FindFirstChild("CharacterEvents") and t1.value167.CharacterEvents:FindFirstChild("SpawnToy") then
        return t1.value167.CharacterEvents.SpawnToy
    end

    return nil
end)()
function t1.value179()
    if t1.value176 then
        t1.value176:Destroy()
    end

    t1.value176 = Instance.new("ScreenGui")
    t1.value176.Name = "ToyMobileGui"
    t1.value176.ResetOnSpawn = false
    t1.value176.IgnoreGuiInset = true
    t1.value176.Parent = t1.value168:WaitForChild("PlayerGui")
    t1.value177 = Instance.new("ImageButton")
    t1.value177.Name = "ToyButton"
    t1.value177.Active = true
    t1.value177.AutoButtonColor = true
    t1.value177.BackgroundTransparency = 1
    t1.value177.ZIndex = 10
    t1.value177.Size = UDim2.fromOffset(t1.value174, t1.value174)
    t1.value177.Position = UDim2.fromOffset(t1.value172, t1.value173)
    t1.value177.Parent = t1.value176

    if t1.value175 == "Pallet" then
        t1.value177.Image = "rbxassetid://72414557626355"
    elseif t1.value175 == "Missile" then
        t1.value177.Image = "rbxassetid://76009942745580"
    end

    t1.value177.ScaleType = Enum.ScaleType.Fit

    local ImageLabel = Instance.new("ImageLabel")

    ImageLabel.Image = "rbxassetid://97166444"
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Size = UDim2.fromScale(1.3, 1.3)
    ImageLabel.Position = UDim2.fromScale(-0.15, -0.15)
    ImageLabel.ZIndex = 9
    ImageLabel.Parent = t1.value177

    local v482 = false
    local u483 = v482
    local v484 = v482

    local function v485(p116)
        local v689 = p116.Position - nil
        local v690 = math.clamp((nil).X + v689.X, 0, t1.value169.ViewportSize.X - t1.value177.AbsoluteSize.X)
        local v691 = math.clamp((nil).Y + v689.Y, 0, t1.value169.ViewportSize.Y - t1.value177.AbsoluteSize.Y)

        t1.value177.Position = UDim2.fromOffset(v690, v691)
        t1.value172 = v690
        t1.value173 = v691
        t1.value2:SetConfig("Toy_X", t1.value172)
        t1.value2:SetConfig("Toy_Y", t1.value173)
    end

    t1.value177.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            u483 = true

            local _ = input.Position

            Vector2.new(t1.value172, t1.value173)
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    u483 = false
                end
            end)
        end
    end)
    t1.value170.InputChanged:Connect(function(input)
        if input == v484 and u483 then
            v485(input)
        end
    end)
    t1.value177.MouseButton1Click:Connect(function()
        if t1.value178 and t1.value178:IsA("RemoteFunction") then
            local v695 = workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -5)
            local vector3_3 = Vector3.new(0, 0, 0)

            if t1.value175 == "Pallet" then
                t1.value178:InvokeServer("PalletLightBrown", v695, vector3_3)

                return
            end

            if t1.value175 == "Missile" then
                t1.value178:InvokeServer("BombMissile", v695, vector3_3)
            end
        end
    end)
end
function t1.value180()
    if t1.value176 then
        t1.value176:Destroy()
        t1.value176 = nil
        t1.value177 = nil
    end
end
v72:AddLabel("If you have any request, DM me what you want.")
v72:AddLabel("Spawn Pallet or Missile without inventory, mobile-friendly")
v72:AddToggle({
	Name = "Show Toy Button",
	Default = false,
	Callback = function(p117)
    t1.value171 = p117

    if p117 then
        t1.value179()

        return
    end

    t1.value180()
end
})
local AddDropdown2 = v72.AddDropdown
local value175 = t1.value175
AddDropdown2(v72, {
	Name = "Select Toy",
	Options = {
		"Pallet",
		"Missile"
	},
	Default = value175,
	Callback = function(p118)
    t1.value175 = p118

    if t1.value177 then
        if t1.value175 == "Pallet" then
            t1.value177.Image = "rbxassetid://72414557626355"

            return
        end

        if t1.value175 == "Missile" then
            t1.value177.Image = "rbxassetid://76009942745580"
        end
    end
end
})
local value169 = t1.value169
local AddSlider2 = v72.AddSlider
local v78 = value169.ViewportSize.X - 10
local value172 = t1.value172
AddSlider2(v72, {
	Name = "Position X",
	Min = 0,
	Max = v78,
	Increment = 1,
	CurrentValue = value172,
	Callback = function(p119)
    t1.value172 = p119

    if t1.value177 then
        t1.value177.Position = UDim2.fromOffset(t1.value172, t1.value173)
    end
end
})
local v80 = t1.value169.ViewportSize.Y - 10
local AddSlider3 = v72.AddSlider
local value173 = t1.value173
AddSlider3(v72, {
	Name = "Position Y",
	Min = 0,
	Max = v80,
	Increment = 1,
	CurrentValue = value173,
	Callback = function(p120)
    t1.value173 = p120

    if t1.value177 then
        t1.value177.Position = UDim2.fromOffset(t1.value172, t1.value173)
    end
end
})
local value174 = t1.value174
v72:AddSlider({
	Name = "Button Size",
	Min = 1,
	Max = 60,
	Increment = 1,
	CurrentValue = value174,
	Callback = function(p121)
    t1.value174 = p121

    if t1.value177 then
        t1.value177.Size = UDim2.fromOffset(t1.value174, t1.value174)
    end
end
})
local v84 = t1.value2:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://6035047375",
	PremiumOnly = false
})
v84:AddLabel("SCRIPT CREDIT: TCU clan")
v84:AddLabel("Dm (Deathtime0585) For any problems on discord")
v84:AddLabel("HELPERS -CHATGPT-GROK-KIMI-GEMINI")
v84:AddLabel("i dont have any testers bruh just me broo")
v84:AddButton({
	Name = "theres no discord for now i guesssss",
	Callback = function()
    setclipboard("NO DISCORD FOR NOW BRUH")
    t1.value1:MakeNotification({
			Name = "Copied!",
			Content = "Discord link has been copied to your clipboard.",
			Image = "rbxassetid://4483345998",
			Time = 3
		})
end
})
t1.value181 = game:GetService("Players")
t1.value182 = t1.value181.LocalPlayer
t1.value183 = game:GetService("HttpService")
t1.value184 = game:GetService("TextChatService")
t1.value185 = game:GetService("ReplicatedStorage")
game:GetService("Workspace")

local RunService2 = game:GetService("RunService")

game:GetService("UserInputService")
game:GetService("GuiService")
t1.value186 = {}
t1.value187 = "https://raw.githubusercontent.com/Bruhiscrazy/Obsidian-/refs/heads/main/Whitelist"
local ok2, result2 = pcall(function()
    return game:HttpGet(t1.value187)
end)

t1.value188 = result2
if ok2 then
    ok2 = t1.value188
end
if ok2 then
    local ok3, result3 = pcall(function()
        return t1.value183:JSONDecode(t1.value188)
    end)

    if ok3 then
        ok3 = typeof(result3) == "table"
    end

    if ok3 then
        t1.value186 = result3

        local t22 = {}
        local t23 = {}
        local t24 = {}
        local t25 = {}

        local function v94(p122)
            return table.find(t1.value186, p122.UserId) ~= nil
        end
        local function v95(p123)
            if t1.value184.ChatVersion == Enum.ChatVersion.TextChatService then
                local TextChannels = t1.value184:FindFirstChild("TextChannels")

                if TextChannels then
                    local RBXGeneral = TextChannels:FindFirstChild("RBXGeneral")

                    if RBXGeneral then
                        RBXGeneral:SendAsync(p123)

                        return
                    end
                end
            else
                local DefaultChatSystemChatEvents = t1.value185:FindFirstChild("DefaultChatSystemChatEvents")

                if DefaultChatSystemChatEvents and DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest") then
                    DefaultChatSystemChatEvents.SayMessageRequest:FireServer(p123, "All")
                end
            end
        end
        local function v96(p124)
            local ok4, _ = pcall(function()
                p124:Kick("You were kicked by an admin!")
            end)

            if ok4 then
                local value1 = t1.value1
                local MakeNotification = value1.MakeNotification
                local v501 = p124.Name .. " has been kicked!"

                MakeNotification(value1, {
					Name = "💀 Kicked",
					Content = v501,
					Time = 4
				})

                return
            end

            for _ = 1, 50 do
                local Part2 = Instance.new("Part")

                Part2.Size = Vector3.new(9000000000, 9000000000, 9000000000)
                Part2.Parent = workspace
                game:GetService("Debris"):AddItem(Part2, 0.01)
            end
        end
        local function v97(p125)
            local v509 = p125:lower()

            for _, player in ipairs(t1.value181:GetPlayers()) do
                if player.Name:lower():find(v509) or player.DisplayName:lower():find(v509) then
                    return player
                end
            end

            return nil
        end
        local function u98(p126)
            t24[p126] = not t24[p126]

            local BlindEffect = t1.value182.PlayerGui:FindFirstChild("BlindEffect")

            if t24[p126] then
                if not BlindEffect then
                    local ScreenGui = Instance.new("ScreenGui")

                    ScreenGui.Name = "BlindEffect"
                    ScreenGui.ResetOnSpawn = false

                    local Frame = Instance.new("Frame")

                    Frame.Size = UDim2.new(1, 0, 1, 0)
                    Frame.BackgroundColor3 = Color3.new(0, 0, 0)
                    Frame.Parent = ScreenGui
                    ScreenGui.Parent = t1.value182:WaitForChild("PlayerGui")

                    return
                end
            elseif BlindEffect then
                BlindEffect:Destroy()
            end
        end
        local function v99(p127, p128)
            if not v94(p127) then
                return
            end

            if p128:sub(1, 1) ~= ":" then
                return
            end

            local parts = string.split(p128:sub(2), " ")
            local v515 = parts[1]:lower()

            table.remove(parts, 1)

            local v516 = table.concat(parts, " ")

            if v515 == "say" then
                if v516 ~= "" then
                    v95(v516)

                    return
                end
            else
                if v515 == "kick" and v516 ~= "" then
                    local v517 = v97(v516)

                    if v517 then
                        v96(v517)

                        return
                    end

                    v95("Player not found")

                    return
                end

                if v515 == "killall" or v515 == "kill" then
                    local value181 = t1.value181
                    local v519, v520, v521 = ipairs(value181:GetPlayers())

                    while true do
                        local v522

                        v521, v522 = v519(v520, v521)

                        if v521 == nil then
                            break
                        end

                        if v522 ~= p127 and (v522.Character and v522.Character:FindFirstChild("Humanoid")) then
                            v522.Character.Humanoid.Health = 0
                        end
                    end

                    return
                end

                if v515 == "banall" then
                    for _, player in ipairs(t1.value181:GetPlayers()) do
                        if player ~= p127 then
                            player:Kick("Banned by admin")
                        end
                    end

                    return
                end

                if v515 == "aura" then
                    t23[p127] = not t23[p127]

                    return
                end

                if v515 == "e" then
                    u98(p127)

                    return
                end

                if v515 == "sb" then
                    local num = tonumber(v516)

                    if num and num > 0 then
                        t25[p127] = num
                        v95("Safety bubble set to " .. num)

                        return
                    end

                    t25[p127] = nil
                    v95("Safety bubble disabled")

                    return
                end

                if v515 == "1" and (p127.Character and p127.Character:FindFirstChild("HumanoidRootPart")) then
                    local HumanoidRootPart = p127.Character.HumanoidRootPart

                    for _, player in ipairs(t1.value181:GetPlayers()) do
                        if player ~= p127 and (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
                            player.Character.HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + Vector3.new(3, 0, 0)
                        end
                    end

                    return
                end

                if v515 == "reveal" then
                    v95("best ftap player is bruh")
                end
            end
        end;

        (function()
            if t1.value184.ChatVersion == Enum.ChatVersion.TextChatService then
                local TextChannels = t1.value184:FindFirstChild("TextChannels")

                if TextChannels then
                    local RBXGeneral = TextChannels:FindFirstChild("RBXGeneral")

                    if RBXGeneral then
                        RBXGeneral.MessageReceived:Connect(function(p129)
                            local TextSource = p129.TextSource

                            if TextSource then
                                local PlayerByUserId = t1.value181:GetPlayerByUserId(TextSource.UserId)

                                if PlayerByUserId then
                                    v99(PlayerByUserId, p129.Text)
                                end
                            end
                        end)

                        return
                    end
                end
            else
                for _, player in ipairs(t1.value181:GetPlayers()) do
                    local v533 = player

                    v533.Chatted:Connect(function(message)
                        v99(v533, message)
                    end)
                end

                t1.value181.PlayerAdded:Connect(function(player)
                    player.Chatted:Connect(function(message)
                        v99(player, message)
                    end)
                end)
            end
        end)()
        RunService2.Heartbeat:Connect(function()
            for k, v in pairs(t23) do
                local v536 = k

                if v and (v536.Character and v536.Character:FindFirstChild("HumanoidRootPart")) then
                    local HumanoidRootPart = v536.Character.HumanoidRootPart
                    local timestamp = tick()

                    for k3, _ in pairs(t22) do
                        local v541 = k3

                        if v541 ~= v536 and (v541.Character and v541.Character:FindFirstChild("HumanoidRootPart")) then
                            local v542 = (timestamp + v541.UserId) % 6.283185307179586
                            local vector3_4 = Vector3.new(math.cos(v542) * 10, 0, math.sin(v542) * 10)

                            v541.Character.HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + vector3_4
                        end
                    end
                end
            end
        end)
        RunService2.Heartbeat:Connect(function()
            for k, v in pairs(t25) do
                local v546 = k
                local Character = v546.Character

                if Character then
                    Character = v546.Character:FindFirstChild("HumanoidRootPart")
                end

                if Character then
                    local HumanoidRootPart = v546.Character.HumanoidRootPart

                    for k4, _ in pairs(t22) do
                        local v551 = k4

                        if v551 ~= v546 and (v551.Character and v551.Character:FindFirstChild("HumanoidRootPart")) then
                            local HumanoidRootPart4 = v551.Character.HumanoidRootPart

                            if v > (HumanoidRootPart.Position - HumanoidRootPart4.Position).Magnitude then
                                local Unit = (HumanoidRootPart4.Position - HumanoidRootPart.Position).Unit

                                HumanoidRootPart4.CFrame = CFrame.new(HumanoidRootPart.Position + Unit * v)
                            end
                        end
                    end
                end
            end
        end)
        t22[t1.value182] = true
        Orion:lnit()

        return
    end

    t1.value182:Kick("Whitelist data invalid")

    return
end
t1.value182:Kick("Whitelist services down. Try again later.")
