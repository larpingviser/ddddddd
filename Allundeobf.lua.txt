-- By FTAP Reverse
-- t.me/ReverseFTAP

local Env = getfenv();
local U = {};
k = game;
r24 = k.GetService(k, "HttpService");
N = game;
r25 = N.GetService(N, "Players");
L = game;
r26 = L.GetService(L, "ReplicatedStorage");
r27 = r25.LocalPlayer;
F = r27;
d = v8;
C = "Character";
v7 = F[C];
o = v7;
if v7 then
    v8 = v8;
    r28 = o;
    o = workspace;
    r29 = o.FindFirstChild(o, r27.Name .. "SpawnedInToys");
    v7 = r26;
    F = v7.WaitForChild(v7, "MenuToys");
    r30 = F.WaitForChild(F, "DestroyToy");
    v7 = r26;
    C = v7.WaitForChild(v7, "GrabEvents");
    r31 = {};
    r32 = {};
    r33 = {};
    local function r34(arg1_2, ...)
        v1 = arg1_2;
        for v3, v4 in ipairs(v1) do
            v4.Disconnect(v4); 
        end;
        table.clear(v1);
        return; 
    end;
    r23.state = {
        ["anchoredParts"] = r31,
        ["anchoredConnections"] = r32,
        ["playerList"] = r33,
        ["toysFolder"] = r29,
        ["localPlayer"] = r27,
        ["SetNetworkOwner"] = C.WaitForChild(C, "SetNetworkOwner")
    };
    local function Ee(arg1_3, arg2_3, ...)
        v1 = arg1_3;
        v3 = v1 and v1.Parent;
        while v3 do
            if v3 == arg2_3 then
                return true;
            else
                v3 = (p and v1.Parent).Parent;
            end; 
        end;
        return false; 
    end;
    r23.isDescendantOf = Ee;
    local function Ee(arg1_4, ...)
        v1 = arg1_4;
        if v1 then
            G = v1;
            if G then
                v8 = r30;
                v8.FireServer(v8, G);
            end;
            return;
        end; 
    end;
    r23.DestroyT = Ee;
    local function Ee(arg1_5, ...)
        G = {};
        v8 = workspace;
        v3 = v8.FindFirstChild(v8, "Map");
        if not v3 then
            return G;
        end;
        v4 = {
            v3.GetDescendants(v3)
        };
        for v2, v6 in ipairs(D("ipairs")) do
            k = v2;
            if v6.IsA(v6, "Part") and v6.Name == arg1_5 then
                table.insert({}, v6);
            end; 
        end;
        return G; 
    end;
    r23.getDescendantParts = Ee;
    local function Ee(...)
        table.clear(r33);
        v3 = r25;
        v3 = "ipairs";
        for G, v2 in ipairs(v3.GetPlayers(v3)) do
            z = G;
            table.insert(r33, v2.Name); 
        end;
        return; 
    end;
    r23.updatePlayerList = Ee;
    local function Ee(arg1_6, ...)
        table.insert(r33, arg1_6.Name);
        return; 
    end;
    r23.onPlayerAdded = Ee;
    local function Ee(arg1_7, ...)
        z = r33;
        for v3, v4 in ipairs("ipairs") do
            v2 = v3;
            if v4 == arg1_7.Name then
                table.remove(r33, v3);
                break;
            else
                
            end; 
        end;
        return; 
    end;
    r23.onPlayerRemoving = Ee;
    local function Ee(...)
        z = r28;
        G = math.huge;
        if not z or not z.FindFirstChild(z, "HumanoidRootPart") then
            return nil;
        end;
        v2 = r25;
        v2 = "ipairs";
        for z, k in ipairs(v2.GetPlayers(v2)) do
            v4 = z;
            if k ~= r27 and k.Character then
                v6 = (r28.HumanoidRootPart.Position - k.Character.HumanoidRootPart.Position).Magnitude;
                v8 = v6 < math.huge;
                if v8 then
                    v8 = (r28.HumanoidRootPart.Position - k.Character[r14[r15("\xe9\xa1QOn\x8e\x17\x1d\xc7\xd4.AkD6d", Q)]][r14[F]])[N];
                    G = v6;
                    v1 = k;
                end;
            end; 
        end;
        return nil; 
    end;
    r23.getNearestPlayer = Ee;
    r23.cleanupConnections = r34;
    local function Ee(...)
        r35 = "https://raw.githubusercontent.com/Undebolted/FTAP/main/VERSION.json";
        z = {
            pcall(function(...)
                v8 = game;
                return v8.HttpGet(v8, r35); 
            end)
        };
        G = z[2];
        if pcall(function(...)
            v8 = game;
            return v8.HttpGet(v8, r35); 
        end) then
            v8 = r24;
            return v8.JSONDecode(v8, G).version;
        end;
        warn("Failed to get version: " .. tostring(G));
        return "Unknown"; 
    end;
    r23.getVersion = Ee;
    local function Ee(arg1_8, arg2_8, arg3_8, ...)
        r36 = arg1_8;
        r37 = arg2_8;
        r38 = arg3_8;
        task.spawn(function(...)
            CFrame.new(r37);
            v8 = r26.MenuToys.SpawnToyRemoteFunction;
            v2 = r38;
            if v2 then
                v8 = v8;
                v8.InvokeServer(v8, r36, CFrame.new(r37), v2);
                return;
            else
                v3 = Vector3.new(0, 90, 0);
            end; 
        end);
        return; 
    end;
    r23.spawnItem = Ee;
    local function Ee(arg1_9, arg2_9, ...)
        r39 = arg1_9;
        r40 = arg2_9;
        task.spawn(function(...)
            v8 = r26.MenuToys.SpawnToyRemoteFunction;
            v8.InvokeServer(v8, r39, r40, Vector3.new(0, 0, 0));
            return; 
        end);
        return; 
    end;
    r23.spawnItemCf = Ee;
    local function Ee(arg1_10, ...)
        G = Instance.new("Highlight");
        G.DepthMode = Enum.HighlightDepthMode.Occluded;
        G.FillTransparency = 1;
        G.Name = "Highlight";
        G.OutlineColor = Color3.new(0, 0, 1);
        G.OutlineTransparency = 0.5;
        G.Parent = arg1_10;
        return G; 
    end;
    r23.createHighlight = Ee;
    r23.createBodyMovers = function(arg1_11, arg2_11, arg3_11, ...)
        v1 = arg1_11;
        z = Instance.new("BodyPosition");
        v2 = Instance.new("BodyGyro");
        z.P = 15000;
        z.D = 200;
        z.MaxForce = Vector3.new(5000000, 5000000, 5000000);
        p = arg2_11;
        z.Position = p;
        p = v1;
        z.Parent = p;
        v2.P = 15000;
        v2.D = 200;
        v2.MaxTorque = Vector3.new(5000000, 5000000, 5000000);
        p = arg3_11;
        v2.CFrame = p;
        v2.Parent = v1;
        return; 
    end;
    Ue = r23;
    Ue.cleanupAnchoredParts = function(...)
        v3 = r31;
        for G, v2 in ipairs(p) do
            z = G;
            if v2 then
                v8 = v2.FindFirstChild(v2, "BodyPosition");
                if v8 then
                    v8 = v2.BodyPosition;
                    v8.Destroy(v8);
                end;
                v8 = v2.FindFirstChild(v2, "BodyGyro");
                if v8 then
                    v8 = v2.BodyGyro;
                    v8.Destroy(v8);
                end;
                v4 = v2.FindFirstChild(v2, "Highlight") or v2.Parent;
                if v4 then
                    v4.Destroy(v4);
                end;
            end; 
        end;
        r34(r32);
        table.clear(r31);
        return; 
    end;
    getgenv().AllunFunctions = r23;
    k = game;
    k.GetService(k, "HttpService");
    k = game;
    Ae = "\xb1\xbbOC\xcd2\x01D-";
    L = k.GetService(k, "RunService");
    k = game;
    o = k.GetService(k, "Players");
    k = game;
    k.GetService(k, "UserInputService");
    k = game;
    d = k.GetService(k, "ReplicatedStorage");
    k = game;
    k.GetService(k, "Debris");
    k = d.WaitForChild(d, "GrabEvents");
    F = d.WaitForChild(d, "MenuToys");
    C = d.WaitForChild(d, "CharacterEvents");
    k.WaitForChild(k, "SetNetworkOwner");
    C.WaitForChild(C, "Struggle");
    k.WaitForChild(k, "CreateGrabLine");
    k.WaitForChild(k, "DestroyGrabLine");
    F.WaitForChild(F, "DestroyToy");
    s = v8;
    r41 = o.LocalPlayer;
    Ye = r41[r14[r15(Ae, 29162827396364)]];
    x = Ye;
    if Ye then
        v8 = v8;
        r42 = x;
        x = workspace;
        OQ_53 = "kickMode";
        OQ_54 = 1;
        r43 = {
            ["AutoRecoverDroppedPartsCoroutine"] = nil,
            ["connectionBombReload"] = nil,
            ["reloadBombCoroutine"] = nil,
            ["antiExplosionConnection"] = nil,
            ["poisonAuraCoroutine"] = nil,
            ["deathAuraCoroutine"] = nil,
            ["poisonCoroutines"] = {},
            ["strengthConnection"] = nil,
            ["coroutineRunning"] = false,
            ["autoStruggleCoroutine"] = nil,
            ["autoDefendCoroutine"] = nil,
            ["auraCoroutine"] = nil,
            ["gravityCoroutine"] = nil,
            ["kickCoroutine"] = nil,
            ["kickGrabCoroutine"] = nil,
            ["hellSendGrabCoroutine"] = nil,
            ["anchoredParts"] = {},
            ["anchoredConnections"] = {},
            ["compiledGroups"] = {},
            ["compileConnections"] = {},
            ["compileCoroutine"] = nil,
            ["fireAllCoroutine"] = nil,
            ["connections"] = {},
            ["renderSteppedConnections"] = {},
            ["ragdollAllCoroutine"] = nil,
            ["crouchJumpCoroutine"] = nil,
            ["crouchSpeedCoroutine"] = nil,
            ["anchorGrabCoroutine"] = nil,
            ["poisonGrabCoroutine"] = nil,
            ["ufoGrabCoroutine"] = nil,
            ["burnPart"] = nil,
            ["fireGrabCoroutine"] = nil,
            ["noclipGrabCoroutine"] = nil,
            ["furtherReachEnabled"] = false,
            ["furtherReachRespawnConnection"] = nil,
            ["antiKickCoroutine"] = nil,
            ["kickGrabConnections"] = {},
            ["blobmanCoroutine"] = nil,
            ["lighBitSpeedCoroutine"] = nil,
            ["lightbitpos"] = {},
            ["lightbitparts"] = {},
            ["lightbitcon"] = nil,
            ["lightbitcon2"] = nil,
            ["lightorbitcon"] = nil,
            ["bodyPositions"] = {},
            ["alignOrientations"] = {},
            ["playerList"] = {},
            ["selection"] = nil,
            ["blobman"] = nil,
            ["platforms"] = {},
            ["ownedToys"] = {},
            ["bombList"] = {},
            ["decoyOffset"] = 15,
            ["stopDistance"] = 5,
            ["circleRadius"] = 10,
            ["circleSpeed"] = 2,
            ["auraToggle"] = 1,
            ["crouchWalkSpeed"] = 50,
            ["crouchJumpPower"] = 50,
            [OQ_53] = OQ_54,
            ["auraRadius"] = 20,
            ["lightbit"] = 0.3125,
            ["lightbitoffset"] = 1,
            ["lightbitradius"] = 20,
            ["usingradius"] = 20,
            ["followMode"] = true,
            ["blobalter"] = 1,
            ["toysFolder"] = x.FindFirstChild(x, r41.Name .. "SpawnedInToys"),
            ["localPlayer"] = r41,
            ["playerCharacter"] = r42,
            ["SetNetworkOwner"] = k.WaitForChild(k, "SetNetworkOwner"),
            ["Struggle"] = C.WaitForChild(C, "Struggle"),
            ["CreateLine"] = k.WaitForChild(k, "CreateGrabLine"),
            ["DestroyLine"] = k.WaitForChild(k, "DestroyGrabLine"),
            ["DestroyToy"] = F.WaitForChild(F, "DestroyToy"),
            ["OrionLib"] = nil,
            ["Utilities"] = nil
        };
        _G.ToyToLoad = _G.ToyToLoad or "BombMissile";
        Ae = v8;
        _G.MaxMissiles = _G.MaxMissiles or 9;
        Ae = v8;
        _G.BlobmanDelay = _G.BlobmanDelay or .005;
        r43.usingradius = r43.lightbitradius;
        ue = r41.CharacterAdded;
        ue.Connect(ue, function(arg1_12, ...)
            v1 = arg1_12;
            r42 = v1;
            r43.playerCharacter = v1;
            return; 
        end);
        local function ue(arg1_13, ...)
            G = {};
            v8 = workspace;
            v3 = v8.FindFirstChild(v8, "Map");
            if not v3 then
                return G;
            end;
            v4 = {
                v3.GetDescendants(v3)
            };
            for v2, v6 in ipairs(D("ipairs")) do
                k = v2;
                if v6.IsA(v6, "Part") and v6.Name == arg1_13 then
                    table.insert({}, v6);
                end; 
            end;
            return G; 
        end;
        r43.poisonHurtParts = ue("PoisonHurtPart");
        r43.paintPlayerParts = ue("PaintPlayerPart");
        task.spawn(function(...)
            v1 = r41;
            v1 = v1.FindFirstChild(v1, "PlayerGui") or v1.WaitForChild(v1, "PlayerGui", 10);
            G = v1 and v1.FindFirstChild(v1, "MenuGui");
            v3 = G and G.FindFirstChild(G, "Menu");
            z = v3 and v3.FindFirstChild(v3, "TabContents");
            v2 = z and z.FindFirstChild(z, "Toys");
            v4 = v2 and v2.FindFirstChild(v2, "Contents");
            if not v4 then
                return;
            end;
            N = {
                v4.GetChildren(v4)
            };
            for v6, o in ipairs(D("ipairs")) do
                L = v6;
                if o.Name ~= "UIGridLayout" then
                    r43.ownedToys[o.Name] = true;
                end; 
            end;
            return; 
        end);
        r23.state = r43;
        r23.refs = {
            ["HttpService"] = k.GetService(k, "HttpService"),
            ["RunService"] = k.GetService(k, "RunService"),
            ["Players"] = k.GetService(k, "Players"),
            ["UserInputService"] = k.GetService(k, "UserInputService"),
            ["ReplicatedStorage"] = k.GetService(k, "ReplicatedStorage"),
            ["Debris"] = k.GetService(k, "Debris")
        };
        r44 = r23.state;
        r45 = r23.refs;
        r46 = r45.Players;
        k = r45.RunService;
        n = r45.UserInputService;
        r47 = r45.ReplicatedStorage;
        d = r45.Debris;
        r23.isDescendantOf = function(arg1_14, arg2_14, ...)
            v1 = arg1_14;
            v3 = v1 and v1.Parent;
            while v3 do
                if v3 == arg2_14 then
                    return true;
                else
                    v3 = (p and v1.Parent).Parent;
                end; 
            end;
            return false; 
        end;
        r23.DestroyT = function(arg1_15, ...)
            v1 = arg1_15;
            if v1 then
                G = v1;
                if G then
                    v8 = r44.DestroyToy;
                    v8.FireServer(v8, G);
                end;
                return;
            end; 
        end;
        r23.updatePlayerList = function(...)
            table.clear(r44.playerList);
            v3 = r46;
            v3 = "ipairs";
            for G, v2 in ipairs(v3.GetPlayers(v3)) do
                z = G;
                table.insert(r44.playerList, v2.Name); 
            end;
            return; 
        end;
        r23.onPlayerAdded = function(arg1_16, ...)
            table.insert(r44.playerList, arg1_16.Name);
            return; 
        end;
        r23.onPlayerRemoving = function(arg1_17, ...)
            z = r44.playerList;
            for v3, v4 in ipairs("ipairs") do
                v2 = v3;
                if v4 == arg1_17.Name then
                    table.remove(r44.playerList, v3);
                    break;
                else
                    
                end; 
            end;
            return; 
        end;
        F = r46.PlayerAdded;
        F.Connect(F, r23.onPlayerAdded);
        F = r46.PlayerRemoving;
        F.Connect(F, r23.onPlayerRemoving);
        r23.updatePlayerList();
        r23.getNearestPlayer = function(...)
            G = math.huge;
            v3 = r44.playerCharacter;
            if not v3 or not v3.FindFirstChild(v3, "HumanoidRootPart") then
                return nil;
            end;
            v4 = r46;
            v4 = "ipairs";
            for v2, v6 in ipairs(v4.GetPlayers(v4)) do
                k = v2;
                if v6 ~= r44.localPlayer and v6.Character then
                    N = r44.playerCharacter.HumanoidRootPart.Position - v6.Character.HumanoidRootPart.Position;
                    v8 = (N.Magnitude and N) < math.huge;
                end; 
            end;
            return nil; 
        end;
        r23.cleanupConnections = function(arg1_18, ...)
            v1 = arg1_18;
            for v3, v4 in ipairs(v1) do
                v4.Disconnect(v4); 
            end;
            table.clear(v1);
            return; 
        end;
        r23.getVersion = function(...)
            r48 = "https://raw.githubusercontent.com/Undebolted/FTAP/main/VERSION.json";
            z = {
                pcall(function(...)
                    v8 = game;
                    return v8.HttpGet(v8, r48); 
                end)
            };
            G = z[2];
            if pcall(function(...)
                v8 = game;
                return v8.HttpGet(v8, r48); 
            end) then
                v8 = r45.HttpService;
                return v8.JSONDecode(v8, G).version;
            end;
            warn("Failed to get version: " .. tostring(G));
            return "Unknown"; 
        end;
        r23.spawnItem = function(arg1_19, arg2_19, arg3_19, ...)
            r49 = arg1_19;
            r50 = arg2_19;
            r51 = arg3_19;
            task.spawn(function(...)
                v8 = r47.MenuToys.SpawnToyRemoteFunction;
                v2 = r51;
                if v2 then
                    v8 = v8;
                    v8.InvokeServer(v8, r49, CFrame.new(r50), v2);
                    return;
                else
                    G = Vector3.new(0, 90, 0);
                end; 
            end);
            return; 
        end;
        r23.spawnItemCf = function(arg1_20, arg2_20, ...)
            r52 = arg1_20;
            r53 = arg2_20;
            task.spawn(function(...)
                v8 = r47.MenuToys.SpawnToyRemoteFunction;
                v8.InvokeServer(v8, r52, r53, Vector3.new(0, 0, 0));
                return; 
            end);
            return; 
        end;
        r23.arson = function(arg1_21, ...)
            p = r44.toysFolder;
            if not p.FindFirstChild(p, "Campfire") then
                r23.spawnItem("Campfire", Vector3.new(-72.9304581, -5.96906614, -265.543732));
            end;
            v8 = r44.toysFolder;
            G = v8.FindFirstChild(v8, "Campfire");
            if not G then
                return;
            end;
            r44.burnPart = G.FindFirstChild(G, "FirePlayerPart") or G.FirePlayerPart;
            r44.burnPart.Size = Vector3.new(7, 7, 7);
            r44.burnPart.Position = arg1_21.Position;
            task.wait(.3);
            r44.burnPart.Position = Vector3.new(0, -50, 0);
            return; 
        end;
        r23.handleCharacterAdded = function(arg1_22, ...)
            v8 = arg1_22.CharacterAdded;
            table.insert(r44.kickGrabConnections, v8.Connect(v8, function(arg1_23, ...)
                v1 = arg1_23;
                G = v1.WaitForChild(v1, "HumanoidRootPart");
                v3 = G.WaitForChild(G, "FirePlayerPart");
                v3.Size = Vector3.new(4.5, 5, 4.5);
                v3.CollisionGroup = "1";
                v3.CanQuery = true;
                return; 
            end));
            return; 
        end;
        r23.kickGrab = function(...)
            v3 = r46;
            for G, v2 in ipairs(v3.GetPlayers(v3)) do
                z = G;
                k = v2.Character;
                if k then
                    k = v2.Character;
                    v4 = k.FindFirstChild(k, "HumanoidRootPart");
                end;
                if k then
                    v4 = v2.Character.HumanoidRootPart;
                    if v4.FindFirstChild(v4, "FirePlayerPart") then
                        k = v4.FirePlayerPart;
                        k.Size = Vector3.new(4.5, 5.5, 4.5);
                        k.CollisionGroup = "1";
                        k.CanQuery = true;
                    end;
                end;
                r23.handleCharacterAdded(v2); 
            end;
            v8 = r46.PlayerAdded;
            table.insert(r44.kickGrabConnections, v8.Connect(v8, r23.handleCharacterAdded));
            return; 
        end;
        r23.grabHandler = function(arg1_24, ...)
            r54 = arg1_24;
            while true do
                pcall(function(...)
                    v8 = workspace;
                    v1 = v8.FindFirstChild(v8, "GrabParts");
                    if v1 then
                        p = v1.Name == "GrabParts";
                    end;
                    if v1 then
                        v8 = v1.FindFirstChild(v1, "GrabPart");
                        v3 = G and v8.FindFirstChild(v8, "WeldConstraint");
                        z = v3 and v3.Part1;
                        if z and z.Parent then
                            v1.FindFirstChild(v1, r14[r15("m\xf84\x815\x1a]\xc2", v4)]);
                            p = r54 == "poison" and r44.poisonHurtParts and z;
                            v4 = r44.paintPlayerParts;
                            v8 = workspace;
                            while v8.FindFirstChild(v8, "GrabParts") do
                                N = "ipairs";
                                for v6, o in ipairs(v4) do
                                    o.Size = Vector3.new(2, 2, 2);
                                    o.Transparency = 1;
                                    o.Position = (p and z.Parent).Position; 
                                end;
                                task.wait();
                                for N, o in ipairs(v4) do
                                    L = N;
                                    o.Position = Vector3.new(0, -200, 0); 
                                end; 
                            end;
                        end;
                    end;
                    return; 
                end);
                task.wait(); 
            end;
            return; 
        end;
        r23.fireGrab = function(...)
            while true do
                pcall(function(...)
                    v8 = workspace;
                    v1 = v8.FindFirstChild(v8, "GrabParts");
                    if v1 then
                        p = v1.Name == "GrabParts";
                    end;
                    if v1 then
                        G = v1.FindFirstChild(v1, "GrabPart");
                        v3 = G and G.FindFirstChild(G, "WeldConstraint");
                        z = v3 and v3.Part1;
                        v2 = z and z.Parent;
                        if v2 then
                            r23.arson(v2);
                        end;
                    end;
                    return; 
                end);
                task.wait(); 
            end;
            return; 
        end;
        r23.noclipGrab = function(...)
            while true do
                pcall(function(...)
                    v8 = workspace;
                    v1 = v8.FindFirstChild(v8, "GrabParts");
                    if v1 then
                        p = v1.Name == "GrabParts";
                    end;
                    if v1 then
                        G = v1.FindFirstChild(v1, "GrabPart");
                        v3 = G and G.FindFirstChild(G, "WeldConstraint");
                        z = v3 and v3.Part1;
                        v2 = z and z.Parent;
                        if v2 then
                            p = v2.FindFirstChild(v2, "HumanoidRootPart");
                        end;
                        if v2 then
                            v8 = workspace;
                            while v8.FindFirstChild(v8, "GrabParts") do
                                v6 = {
                                    v2.GetChildren(v2)
                                };
                                for k, L in ipairs(D(p)) do
                                    N = k;
                                    if L.IsA(L, "BasePart") then
                                        L.CanCollide = false;
                                    end; 
                                end;
                                task.wait(); 
                            end;
                            for v6, L in ipairs(v2.GetChildren(v2)) do
                                N = v6;
                                if L.IsA(L, "BasePart") then
                                    L.CanCollide = true;
                                end; 
                            end;
                        end;
                    end;
                    return; 
                end);
                task.wait(); 
            end;
            return; 
        end;
        local function r55(...)
            v8 = r47;
            v1 = v8.FindFirstChild(v8, "GamepassEvents");
            v8 = r47;
            G = v8.FindFirstChild(v8, "MenuToys");
            v3 = v1 and v1.FindFirstChild(v1, "FurtherReachBoughtNotifier");
            z = G and G.FindFirstChild(G, "LimitedTimeToyEvent");
            if not v3 or not z then
                return nil, nil, "Further Reach remotes are unavailable";
            end;
            return v3, z; 
        end;
        local function r56(...)
            v8 = r44.localPlayer;
            v1 = v8.FindFirstChild(v8, "FartherReach");
            if v1 then
                v1.Destroy(v1);
            end;
            return; 
        end;
        local function r57(...)
            r56();
            v1 = Instance.new("BoolValue");
            v1.Name = "FartherReach";
            v1.Value = true;
            v1.Parent = r44.localPlayer;
            return v1; 
        end;
        local function r58(...)
            v1 = r44.localPlayer.Character or r44.playerCharacter;
            if not v1 then
                return false, "character is unavailable";
            end;
            G = v1.FindFirstChild(v1, "GrabbingScript") or v1.WaitForChild(v1, "GrabbingScript", 5);
            if not G then
                return false, "GrabbingScript is unavailable";
            end;
            G.Enabled = false;
            G.Enabled = true;
            return true; 
        end;
        local function r59(...)
            if r44.furtherReachRespawnConnection then
                v8 = r44.furtherReachRespawnConnection;
                v8.Disconnect(v8);
                r44.furtherReachRespawnConnection = nil;
            end;
            return; 
        end;
        local function r60(...)
            v1 = hookinstance;
            if typeof(v1) ~= "function" then
                return false, "hookinstance is unavailable";
            end;
            z = {
                r55()
            };
            r61 = z[2];
            z = r55();
            if not z or not r61 then
                return false, z[3];
            end;
            r57();
            if not pcall(v1, z, r61) then
                r56();
                return false, k[2];
            end;
            if not r58() then
                pcall(v1, z, z);
                r56();
                return false, v6[2];
            end;
            task.delay(.1, function(...)
                if not r44.furtherReachEnabled then
                    return;
                end;
                pcall(function(...)
                    v8 = U[309];
                    v8.FireServer(v8);
                    return; 
                end);
                return; 
            end);
            return true; 
        end;
        r23.setFurtherReachEnabled = function(arg1_25, ...)
            v8 = arg1_25 == true;
            v3 = r44;
            v2 = r14;
            if v8 == v3.furtherReachEnabled then
                return true;
            end;
            if v8 then
                r44.furtherReachEnabled = true;
                z = {
                    r60()
                };
                v3 = z[2];
                if not r60() then
                    r44.furtherReachEnabled = false;
                    warn("Further Reach failed to enable: " .. tostring(v3));
                    return false, v3;
                end;
                r59();
                v2 = r44.localPlayer.CharacterAdded;
                r44.furtherReachRespawnConnection = v2.Connect(v2, function(arg1_26, ...)
                    r62 = arg1_26;
                    r44.playerCharacter = r62;
                    task.spawn(function(...)
                        v8 = r62;
                        if not r44.furtherReachEnabled or not v8.WaitForChild(v8, "GrabbingScript", 5) then
                            return;
                        end;
                        task.wait(.1);
                        v3 = r60();
                        if not v3 then
                            warn("Further Reach failed to reapply: " .. tostring(v3[2]));
                        end;
                        return; 
                    end);
                    return; 
                end);
                return true;
            end;
            r44.furtherReachEnabled = false;
            r59();
            r56();
            G = hookinstance;
            v3 = select(1, r55());
            v2 = typeof(G) == "function";
            if v2 then
                p = select(1, r55());
            end;
            v8 = v8;
            if v2 then
                pcall(G, v3, v3);
            end;
            v4 = {
                r58()
            };
            v2 = v4[2];
            if not r58() then
                warn("Further Reach cleanup failed: " .. tostring(v2));
                return false, v2;
            end;
            return true; 
        end;
        r23.reapplyFurtherReach = function(...)
            if not r44.furtherReachEnabled then
                return false, "disabled";
            end;
            return r60(); 
        end;
        r23.fireAll = function(...)
            while true do
                if not pcall(function(...)
                    v8 = r44.toysFolder;
                    if v8.FindFirstChild(v8, "Campfire") then
                        v1 = r44.toysFolder;
                        r23.DestroyT(v1.FindFirstChild(v1, "Campfire"));
                        task.wait(0.5);
                    end;
                    r63 = r44.playerCharacter;
                    v3 = r63;
                    if not v3 or not v3.FindFirstChild(v3, "Head") then
                        return;
                    end;
                    r23.spawnItemCf("Campfire", r63.Head.CFrame);
                    v8 = r44.toysFolder;
                    G = v8.WaitForChild(v8, "Campfire");
                    v8 = ipairs;
                    v4 = {
                        G.GetChildren(G)
                    };
                    for v2, v6 in v8(D(p)) do
                        k = v2;
                        if v6.Name == "FirePlayerPart" then
                            v6.Size = Vector3.new(10, 10, 10);
                            r64 = v6;
                        else
                            
                        end; 
                    end;
                    z = r63;
                    v2 = z.FindFirstChild(z, "Torso");
                    v8 = v8;
                    if not v2 or not r64 then
                        return;
                    end;
                    v4 = r44.SetNetworkOwner;
                    v4.FireServer(v4, r64, r64.CFrame);
                    v4 = r63;
                    v4.MoveTo(v4, r64.Position);
                    task.wait(.3);
                    v4 = r63;
                    v4.MoveTo(v4, v2.Position);
                    r65 = Instance.new("BodyPosition");
                    r65.P = 20000;
                    r65.Position = r63.Head.Position + Vector3.new(0, 600, 0);
                    r65.Parent = G.Main;
                    while true do
                        o = r46;
                        for L, o in ipairs(o.GetChildren(o)) do
                            k = L;
                            r66 = o;
                            pcall(function(...)
                                r65.Position = r63.Head.Position + Vector3.new(0, 600, 0);
                                v3 = "Character";
                                if r66[v3] and v3.FindFirstChild(v3, "HumanoidRootPart") then
                                    r64.Position = r66.Character.HumanoidRootPart.Position;
                                    task.wait();
                                end;
                                return; 
                            end); 
                        end;
                        task.wait(); 
                    end;
                    return; 
                end) then
                    warn("Error in fireAll: " .. tostring(v3[2]));
                end;
                task.wait(); 
            end;
            return; 
        end;
        r23.createHighlight = function(arg1_27, ...)
            G = Instance.new("Highlight");
            G.DepthMode = Enum.HighlightDepthMode.Occluded;
            G.FillTransparency = 1;
            G.Name = "Highlight";
            G.OutlineColor = Color3.new(0, 0, 1);
            G.OutlineTransparency = 0.5;
            G.Parent = arg1_27;
            return G; 
        end;
        r23.onPartOwnerAdded = function(arg1_28, arg2_28, ...)
            v1 = arg1_28;
            G = arg2_28;
            if v1.Name == "PartOwner" and v1.Value ~= r44.localPlayer.Name then
                v3 = G.FindFirstChild(G, "Highlight");
                if v3 then
                    v3 = v3;
                    if v3 then
                        v8 = "OutlineColor";
                        v2 = arg1_28.Value ~= r44.localPlayer.Name;
                        v8 = v8;
                        if v2 then
                            v8 = v8;
                            v3[v8] = v2 and Color3.new(1, 0, 0);
                            return;
                        else
                            p = Color3.new(0, 0, 1);
                        end;
                    end;
                else
                    p = r44.Utilities.GetDescendant(r44.Utilities.FindFirstAncestorOfType(arg2_28, "Model"), "Highlight", "Highlight");
                end;
            end; 
        end;
        r23.createBodyMovers = function(arg1_29, arg2_29, arg3_29, ...)
            v1 = arg1_29;
            z = Instance.new("BodyPosition");
            v2 = Instance.new("BodyGyro");
            z.P = 15000;
            z.D = 200;
            z.MaxForce = Vector3.new(5000000, 5000000, 5000000);
            p = arg2_29;
            z.Position = p;
            p = v1;
            z.Parent = p;
            v2.P = 15000;
            v2.D = 200;
            v2.MaxTorque = Vector3.new(5000000, 5000000, 5000000);
            p = arg3_29;
            v2.CFrame = p;
            v2.Parent = v1;
            return; 
        end;
        r67 = r23.state;
        k = r23.refs;
        r68 = k.Players;
        r69 = k.RunService;
        r70 = k.Debris;
        L = k.ReplicatedStorage;
        r23.anchorGrab = function(...)
            while true do
                pcall(function(...)
                    v8 = workspace;
                    v1 = v8.FindFirstChild(v8, "GrabParts");
                    if not v1 then
                        return;
                    end;
                    G = v1.FindFirstChild(v1, "GrabPart");
                    if not G then
                        return;
                    end;
                    v8 = G.FindFirstChild(G, "WeldConstraint");
                    if not v8 or not v8.Part1 then
                        return;
                    end;
                    v6 = v8.Part1.Parent;
                    if v6 then
                        v6 = v8.Part1.Parent;
                        v6.FindFirstChild(v6, "SoundPart");
                    end;
                    v8 = v8;
                    v8 = v8;
                    v8 = v8;
                    v8 = v8;
                    r71 = v8.Part1.Name == "SoundPart" and v8.Part1 or (v6 or (v8.Part1.Parent and v8.Part1.Parent.PrimaryPart or v8.Part1));
                    if not r71 or r71.Anchored then
                        return;
                    end;
                    v4 = workspace;
                    o = "Map";
                    if r23.isDescendantOf(r71, v4.FindFirstChild(v4, r14[o])) then
                        return;
                    end;
                    k = r68;
                    for v4, N in ipairs(k.GetChildren(k)) do
                        v6 = v4;
                        o = N.Character;
                        if o then
                            L = r23.isDescendantOf(r71, N.Character);
                        end;
                        if o then
                            return;
                        else
                            
                        end; 
                    end;
                    v8 = ipairs;
                    N = r71;
                    L = {
                        N.GetDescendants(N)
                    };
                    for v6, L in v8(D(L)) do
                        N = v6;
                        if table.find(r67.anchoredParts, L) then
                            v2 = false;
                        end; 
                    end;
                    if true then
                        v4 = not table.find(r67.anchoredParts, r71);
                    end;
                    v8 = v8;
                    if v2 then
                        v6 = r67.Utilities.FindFirstAncestorOfType(r71, "Model");
                        k = v6;
                        if v6 then
                            k = v6 ~= workspace;
                        end;
                        v8 = k;
                        if k then
                            k = r67.Utilities.FindFirstAncestorOfType(U[z], L);
                            v4 = v6;
                        else
                            v4 = r71;
                        end;
                        r23.createHighlight(nil);
                        table.insert(r67.anchoredParts, r71);
                        L = nil.DescendantAdded;
                        table.insert(r67.anchoredConnections, L.Connect(L, function(arg1_30, ...)
                            r23.onPartOwnerAdded(arg1_30, r71);
                            return; 
                        end));
                    end;
                    v6 = r67.Utilities.FindFirstAncestorOfType(r71, "Model");
                    if v6 then
                        v4 = v6 ~= workspace;
                    end;
                    v8 = v8;
                    if v6 then
                        d = {
                            v6.GetDescendants(v6)
                        };
                        for n, d in ipairs(D(d)) do
                            v4 = n;
                            v8 = L;
                            if d.IsA(d, "BodyPosition") or d.IsA(d, "BodyGyro") then
                                d.Destroy(d);
                            end; 
                        end;
                    else
                        d = r71;
                        for n, d in ipairs(d.GetChildren(d)) do
                            v4 = n;
                            v8 = L;
                            if d.IsA(d, "BodyPosition") or d.IsA(d, "BodyGyro") then
                                d.Destroy(d);
                            end; 
                        end;
                        v4 = workspace;
                        while v4.FindFirstChild(v4, "GrabParts") do
                            task.wait(); 
                        end;
                        r23.createBodyMovers(r71, r71.Position, r71.CFrame);
                        return;
                    end; 
                end);
                task.wait(); 
            end;
            return; 
        end;
        r23.anchorKickGrab = function(...)
            while true do
                pcall(function(...)
                    v8 = workspace;
                    v1 = v8.FindFirstChild(v8, "GrabParts");
                    if not v1 then
                        return;
                    end;
                    G = v1.FindFirstChild(v1, "GrabPart");
                    if not G then
                        return;
                    end;
                    v3 = G.FindFirstChild(G, "WeldConstraint");
                    if not v3 or not v3.Part1 then
                        return;
                    end;
                    z = v3.Part1;
                    if not z then
                        return;
                    end;
                    o = "\x0f\xf5\x02";
                    v2 = workspace;
                    if r23.isDescendantOf(z, v2.FindFirstChild(v2, "Map")) then
                        return;
                    end;
                    if z.Name ~= "FirePlayerPart" then
                        return;
                    end;
                    k = {
                        z.GetChildren(z)
                    };
                    for v4, N in ipairs(D(p)) do
                        o = N.IsA(N, "BodyPosition");
                        v6 = v4;
                        if o then
                            if o then
                                N.Destroy(N);
                            end;
                        else
                            L = N.IsA(N, "BodyGyro");
                        end; 
                    end;
                    v8 = workspace;
                    while v8.FindFirstChild(v8, "GrabParts") do
                        task.wait(); 
                    end;
                    r23.createBodyMovers(z, z.Position, z.CFrame);
                    return; 
                end);
                task.wait(); 
            end;
            return; 
        end;
        r23.cleanupAnchoredParts = function(...)
            v3 = r67.anchoredParts;
            for G, v2 in ipairs(p) do
                z = G;
                if v2 then
                    v8 = v2.FindFirstChild(v2, "BodyPosition");
                    if v8 then
                        v8 = v2.BodyPosition;
                        v8.Destroy(v8);
                    end;
                    v8 = v2.FindFirstChild(v2, "BodyGyro");
                    if v8 then
                        v8 = v2.BodyGyro;
                        v8.Destroy(v8);
                    end;
                    v4 = v2.FindFirstChild(v2, "Highlight") or v2.Parent;
                    if v4 then
                        v4.Destroy(v4);
                    end;
                end; 
            end;
            r23.cleanupConnections(r67.anchoredConnections);
            table.clear(r67.anchoredParts);
            return; 
        end;
        r23.updateBodyMovers = function(arg1_31, ...)
            z = r67.compiledGroups;
            for v3, v4 in ipairs("ipairs") do
                v2 = v3;
                if v4.primaryPart == arg1_31 then
                    v8 = ipairs;
                    for N, o in v8(v4.group) do
                        L = N;
                        v8 = o.part;
                        n = v8.FindFirstChild(v8, "BodyPosition");
                        v8 = o.part;
                        d = v8.FindFirstChild(v8, "BodyGyro");
                        if n then
                            n.Position = (arg1_31.CFrame * o.offset).Position;
                        end;
                        if d then
                            d.CFrame = arg1_31.CFrame * o.offset;
                        end; 
                    end;
                end; 
            end;
            return; 
        end;
        r23.compileGroup = function(...)
            v8 = #r67.anchoredParts == 0;
            if v8 then
                v8 = r67.OrionLib;
                v8.MakeNotification(v8, {
                    ["Name"] = "Error",
                    ["Content"] = "No anchored parts found",
                    ["Image"] = "rbxassetid://4483345998",
                    ["Time"] = 5
                });
            else
                v8 = r67.OrionLib;
                v8.MakeNotification(v8, {
                    ["Name"] = "Success",
                    ["Content"] = "Compiled " .. #r67.anchoredParts .. " Toys together",
                    ["Image"] = "rbxassetid://4483345998",
                    ["Time"] = 5
                });
            end;
            r72 = r67.anchoredParts[1];
            if not r72 then
                return;
            end;
            G = r72;
            v3 = G.FindFirstChild(G, "Highlight");
            if v3 then
                G = v3;
                v8 = not G;
                if v8 then
                    v8 = r23.createHighlight;
                    v4 = z;
                    z = v8;
                    N = "Parent";
                    v8 = v4;
                    v8 = z;
                    G = v8(r72[N] and N.IsA(N, "Model") or r72);
                end;
                G.OutlineColor = Color3.new(0, 1, 0);
                for v4, v6 in ipairs(r67.anchoredParts) do
                    k = v4;
                    if v6 ~= r72 then
                        v8 = r72.CFrame;
                        table.insert({}, {
                            ["part"] = v6,
                            ["offset"] = v8.ToObjectSpace(v8, v6.CFrame)
                        });
                    end; 
                end;
                table.insert(r67.compiledGroups, {
                    ["primaryPart"] = r72,
                    ["group"] = {}
                });
                v8 = r72;
                z = v8.GetPropertyChangedSignal(v8, "CFrame");
                table.insert(r67.compileConnections, z.Connect(z, function(...)
                    r23.updateBodyMovers(r72);
                    return; 
                end));
                v8 = r69.Heartbeat;
                table.insert(r67.renderSteppedConnections, v8.Connect(v8, function(...)
                    r23.updateBodyMovers(r72);
                    return; 
                end));
                return;
            end; 
        end;
        r23.cleanupCompiledGroups = function(...)
            v3 = r67.compiledGroups;
            for G, v2 in ipairs(p) do
                z = G;
                for v6, L in ipairs(v2.group) do
                    N = v6;
                    if L.part then
                        v8 = L.part;
                        if v8.FindFirstChild(v8, "BodyPosition") then
                            v8 = L.part.BodyPosition;
                            v8.Destroy(v8);
                        end;
                        v8 = L.part;
                        if v8.FindFirstChild(v8, "BodyGyro") then
                            v8 = L.part.BodyGyro;
                            v8.Destroy(v8);
                        end;
                    end; 
                end;
                k = v2.primaryPart;
                if k and v2.primaryPart.Parent then
                    k = v2.primaryPart;
                    v4 = k.FindFirstChild(k, "Highlight") or k.FindFirstChild(k, "Highlight");
                    if v4 then
                        v4.Destroy(v4);
                    end;
                end; 
            end;
            r23.cleanupConnections(r67.compileConnections);
            r23.cleanupConnections(r67.renderSteppedConnections);
            table.clear(r67.compiledGroups);
            return; 
        end;
        r23.compileCoroutineFunc = function(...)
            while true do
                pcall(function(...)
                    v3 = r67.compiledGroups;
                    for G, v2 in ipairs("ipairs") do
                        z = G;
                        r23.updateBodyMovers(v2.primaryPart); 
                    end;
                    return; 
                end);
                task.wait(); 
            end;
            return; 
        end;
        r23.unanchorPrimaryPart = function(...)
            v1 = r67.anchoredParts[1];
            if not v1 then
                return;
            end;
            v8 = v1.FindFirstChild(v1, "BodyPosition");
            if v8 then
                v8 = v1.BodyPosition;
                v8.Destroy(v8);
            end;
            v8 = v1.FindFirstChild(v1, "BodyGyro");
            if v8 then
                v8 = v1.BodyGyro;
                v8.Destroy(v8);
            end;
            z = v1.Parent;
            if z then
                z = v1.Parent;
                G = z.FindFirstChild(z, "Highlight");
            end;
            v8 = v8;
            G = z or v1.FindFirstChild(v1, "Highlight");
            if G then
                G.Destroy(G);
            end;
            return; 
        end;
        r23.recoverParts = function(...)
            while true do
                pcall(function(...)
                    v1 = r67.localPlayer.Character;
                    if v1 then
                        v8 = r67[r14[r15("C\\\x1a\xe0v\xf3\xacM\xc1\xa2\xa1", k)]][G[z]];
                        p = v1.FindFirstChild(v1, "Head") and v1.FindFirstChild(v1, "HumanoidRootPart");
                    end;
                    if v1 then
                        r73 = v1.HumanoidRootPart;
                        v2 = r67.anchoredParts;
                        for z, k in ipairs("ipairs") do
                            v4 = z;
                            r74 = k;
                            coroutine.wrap(function(...)
                                if r74 then
                                    G = r14;
                                    v3 = r15;
                                    if (r74.Position - r73.Position).Magnitude <= 30 then
                                        G = r74;
                                        v3 = G.FindFirstChild(G, "Highlight");
                                        p = v3;
                                        if v3 then
                                            if v3 then
                                                p = v3.OutlineColor == Color3.new(1, 0, 0);
                                            end;
                                            if v3 then
                                                v8 = r67.SetNetworkOwner;
                                                v8.FireServer(v8, r74, r74.CFrame);
                                                v3 = r74;
                                                z = v3.WaitForChild(v3, "PartOwner");
                                                if z then
                                                    p = r74.PartOwner.Value == r67.localPlayer.Name;
                                                end;
                                                if z then
                                                    v3.OutlineColor = Color3.new(0, 0, 1);
                                                end;
                                            end;
                                            return;
                                        end;
                                    end;
                                end; 
                            end)(); 
                        end;
                    end;
                    return; 
                end);
                task.wait(.02); 
            end;
            return; 
        end;
        r23.ragdollAll = function(...)
            while true do
                if not pcall(function(...)
                    p = r67.toysFolder;
                    if not p.FindFirstChild(p, "FoodBanana") then
                        r23.spawnItem("FoodBanana", Vector3.new(-72.9304581, -5.96906614, -265.543732));
                    end;
                    v8 = r67.toysFolder;
                    v1 = v8.WaitForChild(v8, "FoodBanana");
                    v2 = {
                        v1.GetChildren(v1)
                    };
                    for z, k in ipairs(D(p)) do
                        v4 = z;
                        if k.Name == "BananaPeel" and k.FindFirstChild(k, "TouchInterest") then
                            k.Size = Vector3.new(10, 10, 10);
                            k.Transparency = 1;
                            r75 = k;
                        else
                            
                        end; 
                    end;
                    r76 = Instance.new("BodyPosition");
                    r76.P = 20000;
                    r76.Parent = v1.Main;
                    while true do
                        v6 = r68;
                        for k, v6 in ipairs(v6.GetChildren(v6)) do
                            r77 = v6;
                            z = k;
                            v6 = 28;
                            pcall(function(...)
                                if U[N].Character and U[N].Character ~= r67.playerCharacter then
                                    r75.Position = U[N].Character.HumanoidRootPart.Position;
                                    r76.Position = r67.playerCharacter.Head.Position + Vector3.new(0, 600, 0);
                                    task.wait();
                                end;
                                return; 
                            end); 
                        end;
                        task.wait(); 
                    end;
                    return; 
                end) then
                    warn("Error in ragdollAll: " .. tostring(v3[2]));
                end;
                task.wait(); 
            end;
            return; 
        end;
        r23.reloadMissile = function(arg1_32, ...)
            if arg1_32 then
                v8 = not r67.ownedToys[_G.ToyToLoad];
                if v8 then
                    v8 = r67.OrionLib;
                    v8.MakeNotification(v8, {
                        ["Name"] = "Missing toy",
                        ["Content"] = "You do not own the " .. _G.ToyToLoad .. " toy.",
                        ["Image"] = "rbxassetid://4483345998",
                        ["Time"] = 3
                    });
                    return;
                end;
                if not r67.reloadBombCoroutine then
                    r67.reloadBombCoroutine = coroutine.create(function(...)
                        v1 = r67.toysFolder.ChildAdded;
                        r67.connectionBombReload = v1.Connect(v1, function(arg1_33, ...)
                            r78 = arg1_33;
                            G = r78.Name == _G.ToyToLoad;
                            if G then
                                G = r78;
                                p = G.WaitForChild(G, "ThisToysNumber", 1);
                            end;
                            if G then
                                if r78.ThisToysNumber.Value == r67.toysFolder.ToyNumber.Value - 1 then
                                    v8 = r67.toysFolder.ChildRemoved;
                                    r79 = v8.Connect(v8, function(arg1_34, ...)
                                        v8 = arg1_34 == r78;
                                        if v8 then
                                            v8 = r79;
                                            v8.Disconnect(v8);
                                        end;
                                        return; 
                                    end);
                                    v8 = r67.SetNetworkOwner;
                                    v8.FireServer(v8, r78.Body, r78.Body.CFrame);
                                    v8 = r78.Body;
                                    v3 = v8.WaitForChild(v8, "PartOwner", 0.5);
                                    v8 = r78.DescendantAdded;
                                    r80 = v8.Connect(v8, function(arg1_35, ...)
                                        v1 = arg1_35;
                                        if v1.Name == "PartOwner" and v1.Value ~= r67.localPlayer.Name then
                                            r23.DestroyT(r78);
                                            v8 = r80;
                                            v8.Disconnect(v8);
                                        end;
                                        return; 
                                    end);
                                    v8 = r70;
                                    v8.AddItem(v8, r80, 60);
                                    if v3 then
                                        v4 = v3.Value == r67.localPlayer.Name;
                                    end;
                                    if v3 then
                                        N = r78;
                                        L = {
                                            N.GetChildren(N)
                                        };
                                        for v6, L in ipairs(D(L)) do
                                            N = v6;
                                            if L.IsA(L, "BasePart") then
                                                L.CanCollide = false;
                                            end; 
                                        end;
                                        v8 = r78;
                                        v8.SetPrimaryPartCFrame(v8, CFrame.new(-72.9304581, -3.96906614, -265.543732));
                                        task.wait(.2);
                                        N = r78;
                                        L = {
                                            N.GetChildren(N)
                                        };
                                        for v6, L in ipairs(D(L)) do
                                            N = v6;
                                            if L.IsA(L, "BasePart") then
                                                L.Anchored = true;
                                            end; 
                                        end;
                                        table.insert(r67.bombList, r78);
                                        v8 = r78.AncestryChanged;
                                        v8.Connect(v8, function(...)
                                            if not r78.Parent then
                                                v3 = r67.bombList;
                                                for G, v2 in ipairs(p) do
                                                    z = G;
                                                    if v2 == r78 then
                                                        table.remove(r67.bombList, G);
                                                    else
                                                        
                                                    end; 
                                                end;
                                            end;
                                            return; 
                                        end);
                                        v8 = r79;
                                        v8.Disconnect(v8);
                                    else
                                        r23.DestroyT(r78);
                                    end;
                                end;
                            end;
                            return; 
                        end);
                        v8 = true;
                        while v8 do
                            v1 = r67.localPlayer;
                            G = v1.FindFirstChild(v1, "CanSpawnToy");
                            if G then
                                v8 = true;
                                p = r67.localPlayer.CanSpawnToy.Value and #r67.bombList < _G.MaxMissiles;
                            end;
                            if G then
                                r23.spawnItemCf(_G.ToyToLoad, r67.playerCharacter.Head.CFrame);
                            end;
                            v8 = r69.Heartbeat;
                            v8.Wait(v8); 
                        end;
                        return; 
                    end);
                    coroutine.resume(r67.reloadBombCoroutine);
                end;
            else
                if r67.reloadBombCoroutine then
                    coroutine.close(r67.reloadBombCoroutine);
                    r67.reloadBombCoroutine = nil;
                end;
                if r67.connectionBombReload then
                    v8 = r67.connectionBombReload;
                    v8.Disconnect(v8);
                    r67.connectionBombReload = nil;
                end;
                return;
            end; 
        end;
        r23.setupAntiExplosion = function(arg1_36, ...)
            r81 = arg1_36;
            v8 = r81;
            p = v8.WaitForChild(v8, "Humanoid");
            z = r15;
            r82 = p.FindFirstChild(p, "Ragdolled");
            if r82 then
                v3 = r82;
                z = v3.GetPropertyChangedSignal(v3, "Value");
                r67.antiExplosionConnection = z.Connect(z, function(...)
                    v3 = r81;
                    v3 = "ipairs";
                    for G, v2 in ipairs(v3.GetChildren(v3)) do
                        z = G;
                        if v2.IsA(v2, "BasePart") then
                            v2.Anchored = r82.Value;
                        end; 
                    end;
                    return; 
                end);
            end;
            return; 
        end;
        r23.blobGrabPlayer = function(arg1_37, arg2_37, ...)
            G = arg2_37;
            if r67.blobalter == 1 then
                v3 = arg1_37.Character;
                if v3 then
                    v3 = arg1_37.Character;
                    p = v3.FindFirstChild(v3, "HumanoidRootPart");
                end;
                if v3 then
                    v3 = arg1_37.Character;
                    v3 = G.FindFirstChild(G, "LeftDetector");
                    v8 = G.WaitForChild(G, "BlobmanSeatAndOwnerScript");
                    p = v8.WaitForChild(v8, "CreatureGrab");
                    p.FireServer(p, unpack({
                        G.FindFirstChild(G, "LeftDetector"),
                        v3.FindFirstChild(v3, "HumanoidRootPart"),
                        v3.FindFirstChild(v3, "LeftWeld")
                    }));
                    r67.blobalter = 2;
                end;
            else
                v3 = arg1_37.Character;
                if v3 then
                    v3 = arg1_37.Character;
                    p = v3.FindFirstChild(v3, "HumanoidRootPart");
                end;
                if v3 then
                    v3 = arg1_37.Character;
                    v3 = G.FindFirstChild(G, "RightDetector");
                    v8 = G.WaitForChild(G, "BlobmanSeatAndOwnerScript");
                    p = v8.WaitForChild(v8, "CreatureGrab");
                    p.FireServer(p, unpack({
                        G.FindFirstChild(G, "RightDetector"),
                        v3.FindFirstChild(v3, "HumanoidRootPart"),
                        v3.FindFirstChild(v3, "RightWeld")
                    }));
                    r67.blobalter = 1;
                end;
                return;
            end; 
        end;
        r83 = {};
        k = game;
        r84 = k.GetService(k, "Players");
        L = game;
        r85 = L.GetService(L, "RunService");
        o = game;
        r86 = o.GetService(o, "HttpService");
        n = game;
        r87 = n.GetService(n, "ReplicatedStorage");
        d = game;
        r88 = d.GetService(d, "Workspace");
        v7 = game;
        r89 = v7.GetService(v7, "UserInputService");
        F = game;
        r90 = F.GetService(F, "TextChatService");
        r91 = r84.LocalPlayer;
        C = r87;
        r92 = C.WaitForChild(C, "GrabEvents");
        J = r87;
        r93 = J.WaitForChild(J, "CharacterEvents");
        y = r87;
        r94 = y.WaitForChild(y, "MenuToys");
        g = r93;
        r95 = g.FindFirstChild(g, "RagdollRemote");
        r83.state = {
            ["dropdowns"] = {},
            ["movement"] = {
                ["Walkspeed"] = false,
                ["WalkspeedValue"] = 5,
                ["InfiniteJump"] = false,
                ["InfiniteJumpPower"] = 100,
                ["Noclip"] = false,
                ["Connections"] = {}
            },
            ["anti"] = {
                ["AntiGrab"] = false,
                ["AntiExplode"] = false,
                ["AntiBlobman"] = false,
                ["AntiLag"] = false,
                ["AntiFire"] = false,
                ["AntiBarrier"] = false,
                ["BarrierOriginals"] = {},
                ["ExtinguishPart"] = nil,
                ["ExtinguishCFrame"] = nil
            },
            ["attack"] = {
                ["SelectedPlayer"] = nil,
                ["Targets"] = {},
                ["Kick"] = {
                    ["E"] = false,
                    ["S"] = nil,
                    ["D"] = 2,
                    ["Off"] = Vector3.new(5, -18.5, 0),
                    ["H"] = 10000,
                    ["Del"] = 0.5
                },
                ["Kill"] = {
                    ["E"] = false,
                    ["S"] = nil,
                    ["D"] = 2,
                    ["Off"] = Vector3.new(5, -18.5, 0),
                    ["H"] = 10000,
                    ["Del"] = 0.5
                }
            },
            ["strength"] = {
                ["Enabled"] = false,
                ["Strength"] = 800,
                ["GrabConn"] = nil
            },
            ["snowball"] = {
                ["TargetPlayer"] = nil,
                ["TeleportEnabled"] = false,
                ["SpawnEnabled"] = false,
                ["AutoBlobEnabled"] = false,
                ["RagdollTargets"] = {},
                ["Dropdown"] = nil
            },
            ["blobman"] = {
                ["SelectedPlayer"] = nil,
                ["TargetList"] = {},
                ["ToggleEnabled"] = false,
                ["HoverEnabled"] = false,
                ["GodLoopEnabled"] = false,
                ["CurrentBlobman"] = nil,
                ["MasterRunning"] = false,
                ["OriginPos"] = nil,
                ["MaxTeleportDist"] = 500,
                ["HoverHeight"] = 25,
                ["HoverDistance"] = 500,
                ["BlobAlter"] = 1
            },
            ["aura"] = {
                ["LaunchEnabled"] = false,
                ["TelekinesisEnabled"] = false,
                ["DeathEnabled"] = false,
                ["Radius"] = 25,
                ["LaunchThread"] = nil,
                ["TeleThread"] = nil,
                ["DeathThread"] = nil
            },
            ["teleport"] = {
                ["Enabled"] = false,
                ["SelectedPlayer"] = nil,
                ["SelectedLocation"] = nil,
                ["LocationValues"] = {},
                ["LocationMap"] = {},
                ["LocationDropdown"] = nil,
                ["LoopThread"] = nil
            },
            ["random"] = {
                ["LagEnabled"] = false,
                ["LagIntensity"] = 5,
                ["BringAll"] = false,
                ["BringAllFriends"] = false,
                ["BringRadius"] = 15,
                ["BringQueue"] = {},
                ["BringOrigin"] = nil,
                ["BringThread"] = nil,
                ["FrozenCameraCFrame"] = nil,
                ["CameraBlock"] = nil,
                ["LeaveNotify"] = false
            },
            ["limbs"] = {
                ["FallenPartsDestroyHeight"] = r88.FallenPartsDestroyHeight,
                ["Parts"] = {
                    "Left Leg",
                    "Right Leg",
                    "Left Arm",
                    "Right Arm",
                    "HumanoidRootPart"
                }
            },
            ["camera"] = {
                ["SecondPerson"] = false,
                ["OriginalMaxZoom"] = nil,
                ["OriginalMode"] = nil
            },
            ["toys"] = {
                ["SelectedToy"] = nil,
                ["AttachMode"] = "Front",
                ["AttachDistance"] = 8,
                ["AttachHeight"] = 1,
                ["AttachSpin"] = 2,
                ["AttachEnabled"] = false,
                ["ToyDropdown"] = nil,
                ["BoardToy"] = nil,
                ["BoardKey"] = "B",
                ["BoardBindEnabled"] = false,
                ["BoardDropdown"] = nil,
                ["BoardConnection"] = nil
            }
        };
        r83.state.random.CameraBlock = Instance.new("Part");
        r83.state.random.CameraBlock.Anchored = true;
        r83.state.random.CameraBlock.CanCollide = false;
        r83.state.random.CameraBlock.Transparency = 1;
        r83.state.random.CameraBlock.CanQuery = false;
        r83.state.random.CameraBlock.Size = Vector3.new(10, 10, 10);
        r83.getAllPlayers = function(arg1_38, ...)
            v1 = arg1_38;
            v2 = r84;
            v2 = "ipairs";
            for z, k in ipairs(v2.GetPlayers(v2)) do
                v4 = z;
                if v1 then
                    if v1 then
                        table.insert({}, k.Name);
                    end;
                else
                    v6 = k ~= r91;
                end; 
            end;
            return {}; 
        end;
        r83.registerDropdown = function(arg1_39, arg2_39, ...)
            G = arg2_39;
            v1 = arg1_39;
            table.insert(r83.state.dropdowns, {
                ["ref"] = v1,
                ["includeLocalPlayer"] = G == true
            });
            if v1 then
                p = v1.Refresh;
            end;
            if v1 then
                v1.Refresh(v1, r83.getAllPlayers(G == true), true);
            end;
            return; 
        end;
        r83.refreshRegisteredDropdowns = function(...)
            v3 = r83.state.dropdowns;
            for G, v2 in ipairs("ipairs") do
                z = G;
                if v2.ref and v2.ref.Refresh then
                    v8 = v2.ref;
                    v8.Refresh(v8, r83.getAllPlayers(v2.includeLocalPlayer), true);
                end; 
            end;
            return; 
        end;
        r83.sendChatMessage = function(arg1_40, ...)
            v1 = arg1_40;
            v8 = r90.ChatVersion ~= Enum.ChatVersion.TextChatService;
            if v8 then
                v8 = r87.DefaultChatSystemChatEvents.SayMessageRequest;
                v8.FireServer(v8, v1, "All");
            else
                v8 = r90.TextChannels.RBXGeneral;
                v8.SendAsync(v8, v1);
            end;
            return; 
        end;
        r83.notify = function(arg1_41, arg2_41, arg3_41, ...)
            r96 = arg1_41;
            r97 = arg2_41;
            r98 = arg3_41;
            r99 = false;
            r100 = r23.ObsidianLibrary;
            pcall(function(...)
                if r100 and typeof(r100.Notify) == "function" then
                    v8 = r100;
                    v6 = v8;
                    v8.Notify(v8, {
                        ["Title"] = r96,
                        ["Description"] = r97,
                        ["Time"] = r98 or 4
                    });
                    r99 = true;
                end;
                return; 
            end);
            if r99 then
                return;
            end;
            pcall(function(...)
                v8 = game;
                p = v8.GetService(v8, "StarterGui");
                N = v8;
                p.SetCore(p, "SendNotification", {
                    ["Title"] = r96,
                    ["Text"] = r97,
                    ["Duration"] = r98 or 4
                });
                return; 
            end);
            return; 
        end;
        r83.getOwnedToyNames = function(arg1_42, ...)
            v1 = arg1_42;
            z = {};
            k = pairs(r23.state.ownedToys);
            v4 = k(k[2], k[3]);
            while v4 do
                v6 = k(v2, k[3]);
                N = string.lower(v6);
                if v1 == "board" then
                    L = N.find(N, "board", 1, true) or (N.find(N, "skate", 1, true) or (N.find(N, "surf", 1, true) or (N.find(N, "snow", 1, true) or N.find(N, "hover", 1, true))));
                end;
                if true then
                    table.insert({}, v6);
                end; 
            end;
            table.sort(z);
            if #z == 0 then
                if v1 == "board" then
                    z = {
                        "Skateboard",
                        "Hoverboard",
                        "Snowboard",
                        "Surfboard"
                    };
                else
                    z = {
                        "CreatureBlobman",
                        "BallSnowball",
                        "Campfire",
                        "Skateboard",
                        "Hoverboard"
                    };
                end;
            end;
            return z; 
        end;
        r83.refreshToyDropdowns = function(...)
            v1 = r83.state.toys;
            G = r83.getOwnedToyNames();
            v8 = r83.getOwnedToyNames;
            v3 = v8("board");
            if v1.ToyDropdown and v1.ToyDropdown.Refresh then
                v8 = v1.ToyDropdown;
                v8.Refresh(v8, G, true);
            end;
            if v1.BoardDropdown and v1.BoardDropdown.Refresh then
                v8 = v1.BoardDropdown;
                v8.Refresh(v8, v3, true);
            end;
            if not v1.SelectedToy or not table.find(G, v1.SelectedToy) then
                v1.SelectedToy = G[1];
            end;
            if not v1.BoardToy or not table.find(v3, v1.BoardToy) then
                v1.BoardToy = v3[1];
            end;
            return; 
        end;
        r83.findSpawnedToy = function(arg1_43, ...)
            v1 = arg1_43;
            if typeof(v1) ~= "string" or v1 == "" then
                return nil;
            end;
            v8 = r88;
            G = v8.FindFirstChild(v8, r91.Name .. "SpawnedInToys");
            if not G then
                return nil;
            end;
            return G.FindFirstChild(G, v1); 
        end;
        r83.getToyPrimaryPart = function(arg1_44, ...)
            v1 = arg1_44;
            if not v1 then
                return nil;
            end;
            if v1.IsA(v1, "BasePart") then
                return v1;
            end;
            G = r14;
            if v1.IsA(v1, "Model") then
                G = v1.PrimaryPart;
                if G then
                    return G;
                else
                    p = v1.FindFirstChildWhichIsA(v1, "BasePart", true);
                end;
            end;
            return nil; 
        end;
        r83.ensureToyBodyMovers = function(arg1_45, ...)
            v1 = arg1_45;
            v3 = "CompatToyBodyPosition";
            G = v1.FindFirstChild(v1, v3);
            p = G;
            if G then
                G.Name = "CompatToyBodyPosition";
                G.P = 18000;
                G.D = 300;
                G.MaxForce = Vector3.new(6000000, 6000000, 6000000);
                G.Parent = v1;
                v3 = v1.FindFirstChild(v1, "CompatToyBodyGyro");
                p = v3;
                if v3 then
                    v3.Name = "CompatToyBodyGyro";
                    v3.P = 18000;
                    v3.D = 300;
                    v3.MaxTorque = Vector3.new(6000000, 6000000, 6000000);
                    v3.Parent = arg1_45;
                    return G, v3;
                else
                    p = Instance.new("BodyGyro");
                end;
            else
                p = Instance.new("BodyPosition");
            end; 
        end;
        r83.clearToyBodyMovers = function(...)
            v8 = r88;
            v1 = v8.FindFirstChild(v8, r91.Name .. "SpawnedInToys");
            if not v1 then
                return;
            end;
            z = {
                v1.GetDescendants(v1)
            };
            for v3, v4 in ipairs(D("ipairs")) do
                v2 = v3;
                if v4.Name == "CompatToyBodyPosition" or v4.Name == "CompatToyBodyGyro" then
                    v4.Destroy(v4);
                end; 
            end;
            return; 
        end;
        r83.getToyTargetCFrame = function(arg1_46, arg2_46, ...)
            G = arg2_46;
            v1 = arg1_46;
            v3 = v1.CFrame;
            z = string.lower(G.AttachMode or "front");
            Vector3.new(0, G.AttachHeight, 0);
            if z == "front" then
                Vector3.new(0, G[r14[r15(o, n)]], 0) = Vector3.new(0, G[r14[r15(o, n)]], 0) + v3.LookVector * G.AttachDistance;
            else
                if z == "back" then
                    Vector3.new(0, G[r14[r15(o, n)]], 0) = Vector3.new(0, G[r14[r15(o, n)]], 0) - v1.CFrame.LookVector * arg2_46.AttachDistance;
                else
                    if string.lower(G.AttachMode or "front") == "left wing" then
                        Vector3.new(0, G[r14[r15(o, n)]], 0) - v3.RightVector * arg2_46.AttachDistance = Vector3.new(0, G[r14[r15(o, n)]], 0) - v3.RightVector * arg2_46.AttachDistance - v3.LookVector * 2;
                    else
                        if string.lower(G.AttachMode or "front") == "right wing" then
                            Vector3.new(0, G[r14[r15(o, n)]], 0) + v3.RightVector * arg2_46.AttachDistance = Vector3.new(0, G[r14[r15(o, n)]], 0) + v3.RightVector * arg2_46.AttachDistance - v3.LookVector * 2;
                        else
                            if string.lower(G.AttachMode or "front") == "orbit" then
                                L = tick() * math.max(G.AttachSpin, .1);
                                Vector3.new(0, G[r14[r15(o, n)]], 0) = Vector3.new(0, G[r14[r15(o, n)]], 0) + Vector3.new(math.cos(L), 0, math.sin(L)) * G.AttachDistance;
                            end;
                            return CFrame.new(v1.Position + Vector3.new(0, G[r14[r15(o, n)]], 0), v1.Position);
                        end;
                    end;
                end;
            end; 
        end;
        r83.toyTelekinesisStep = function(...)
            v1 = r83.state.toys;
            if not v1.AttachEnabled then
                return;
            end;
            G = r91.Character;
            if G then
                G = r91.Character;
                p = G.FindFirstChild(G, "HumanoidRootPart");
            end;
            v8 = r83.getToyPrimaryPart;
            r101 = v8(r83.findSpawnedToy(v1.SelectedToy));
            if G then
                p = r101;
            end;
            v8 = v8;
            if not G then
                return;
            end;
            pcall(function(...)
                v8 = r92.SetNetworkOwner;
                v8.FireServer(v8, r101, r101.CFrame);
                return; 
            end);
            r101.CanCollide = false;
            r101.CanTouch = false;
            r101.CanQuery = false;
            k = {
                r83.ensureToyBodyMovers(r101)
            };
            k = r83.getToyTargetCFrame(G, v1);
            k[1].Position = k.Position;
            k[2].CFrame = k;
            return; 
        end;
        r83.spawnSelectedToy = function(...)
            v1 = r91.Character;
            v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
            G = r83.state.toys.SelectedToy;
            if v1 then
                p = v8;
            end;
            if v1 then
                r83.spawnToy(G, v1.Position + v1.CFrame.LookVector * 6 + Vector3.new(0, 2, 0));
                return true;
            end;
            return false; 
        end;
        r83.spawnBoard = function(...)
            v1 = r91.Character;
            v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
            G = r83.state.toys.BoardToy;
            if v1 then
                p = v8;
            end;
            if v1 then
                r83.spawnToy(G, v1.Position + v1.CFrame.LookVector * 5 + Vector3.new(0, 1.5, 0));
                return true;
            end;
            return false; 
        end;
        r83.ensureBoardConnection = function(...)
            r102 = r83.state.toys;
            if r102.BoardConnection then
                return;
            end;
            G = r89.InputBegan;
            r102.BoardConnection = G.Connect(G, function(arg1_47, arg2_47, ...)
                v1 = arg1_47;
                G = arg2_47;
                p = G;
                if G then
                    if G then
                        return;
                    end;
                    v3 = Enum.KeyCode[r102.BoardKey];
                    if v3 then
                        p = arg1_47.KeyCode == v3;
                    end;
                    if v3 then
                        r83.spawnBoard();
                    end;
                    return;
                else
                    p = not r102.BoardBindEnabled;
                end; 
            end);
            return; 
        end;
        r83.findExtinguishPart = function(...)
            v1 = r83.state.anti;
            if v1.ExtinguishPart and v1.ExtinguishPart.Parent then
                return v1.ExtinguishPart;
            end;
            v8 = r88;
            G = v8.FindFirstChild(v8, "Map");
            v3 = G and G.FindFirstChild(G, "Hole");
            z = v3 and v3.FindFirstChild(v3, "PoisonBigHole");
            v2 = z and z.FindFirstChild(z, "ExtinguishPart");
            if v2 then
                p = v2;
                v1.ExtinguishPart = p;
                v1.ExtinguishCFrame = v2.CFrame;
            end;
            return v2; 
        end;
        r83.antiFireStep = function(...)
            if not r83.state.anti.AntiFire then
                r83.resetAntiFire();
                return;
            end;
            v8 = r83.findExtinguishPart;
            v1 = v8();
            G = r91.Character;
            if G then
                G = r91.Character;
                p = G.FindFirstChild(G, "HumanoidRootPart");
            end;
            v3 = v8;
            if v1 then
                p = G;
            end;
            v8 = v3;
            if not v1 then
                return;
            end;
            if G.FindFirstChild(G, "FireLight") or G.FindFirstChild(G, "FireParticleEmitter") then
                v1.CFrame = CFrame.new(G.Position);
            else
                if r83.state.anti.ExtinguishCFrame then
                    v8().CFrame = r83.state.anti.ExtinguishCFrame;
                end;
                return;
            end; 
        end;
        r83.resetAntiFire = function(...)
            v1 = r83.state.anti;
            if v1.ExtinguishPart and (v1.ExtinguishPart.Parent and v1.ExtinguishCFrame) then
                v1.ExtinguishPart.CFrame = v1.ExtinguishCFrame;
            end;
            return; 
        end;
        r83.isBarrierPart = function(arg1_48, ...)
            v1 = arg1_48;
            if not v1.IsA(v1, "BasePart") then
                return false;
            end;
            G = string.lower(v1.Name);
            v3 = G.find(G, "barrier", 1, true);
            if v3 then
                return v3;
            else
                p = G.find(G, "border", 1, true) or (G.find(G, "boundary", 1, true) or (G.find(G, "kill", 1, true) or G.find(G, "invisible", 1, true)));
                v8 = string.lower;
            end; 
        end;
        r83.applyAntiBarrier = function(...)
            if not r83.state.anti.AntiBarrier then
                r83.restoreAntiBarrier();
                return;
            end;
            v3 = r88;
            v3 = "ipairs";
            for G, v2 in ipairs(v3.GetDescendants(v3)) do
                z = G;
                if r83.isBarrierPart(v2) then
                    if not r83.state.anti.BarrierOriginals[v2] then
                        r83.state.anti.BarrierOriginals[v2] = {
                            ["CanCollide"] = v2.CanCollide,
                            ["CanTouch"] = v2.CanTouch,
                            ["CanQuery"] = v2.CanQuery,
                            ["LocalTransparencyModifier"] = v2.LocalTransparencyModifier
                        };
                    end;
                    v2.CanCollide = false;
                    v2.CanTouch = false;
                    v2.CanQuery = false;
                    v2.LocalTransparencyModifier = math.max(v2.LocalTransparencyModifier, .45);
                end; 
            end;
            return; 
        end;
        r83.restoreAntiBarrier = function(...)
            v3 = r83.state.anti.BarrierOriginals;
            for G, v2 in pairs(p) do
                if G then
                    v4 = G.Parent;
                end;
                if G then
                    G.CanCollide = v2.CanCollide;
                    G.CanTouch = v2.CanTouch;
                    G.CanQuery = v2.CanQuery;
                    G.LocalTransparencyModifier = v2.LocalTransparencyModifier;
                end; 
            end;
            table.clear(r83.state.anti.BarrierOriginals);
            return; 
        end;
        r83.setSecondPersonEnabled = function(arg1_49, ...)
            v1 = arg1_49;
            G = r83.state.camera;
            v3 = r91;
            if v1 then
                if not G.SecondPerson then
                    G.SecondPerson = true;
                    G.OriginalMaxZoom = v3.CameraMaxZoomDistance;
                    G.OriginalMode = v3.CameraMode;
                end;
                v3.CameraMaxZoomDistance = 99999;
                v3.CameraMode = Enum.CameraMode.Classic;
                return;
            end;
            if not v1 and G.SecondPerson then
                G.SecondPerson = false;
                if G.OriginalMaxZoom then
                    v3.CameraMaxZoomDistance = r83[r14[r15("L\"\x8e[\x10", v6)]][r14[v2]].OriginalMaxZoom;
                end;
                if G.OriginalMode then
                    v3.CameraMode = r83[r14[r15("L\"\x8e[\x10", v6)]][r14[v2]].OriginalMode;
                end;
            end;
            return; 
        end;
        r83.getTeleportCFrame = function(arg1_50, ...)
            v1 = arg1_50;
            if not v1 then
                return nil;
            end;
            if v1.IsA(v1, "BasePart") or v1.IsA(v1, "SpawnLocation") then
                return v1.CFrame + Vector3.new(0, 4, 0);
            end;
            if v1.IsA(v1, "Model") then
                return v1.GetPivot(v1) + Vector3.new(0, 4, 0);
            end;
            return nil; 
        end;
        r83.refreshTeleportLocations = function(...)
            r103 = {};
            r104 = {};
            v8 = r88;
            z = v8.FindFirstChild(v8, "Map");
            if z then
                (function(arg1_51, arg2_51, ...)
                    v1 = arg1_51;
                    if typeof(v1) == "string" and v1 ~= "" then
                        p = arg2_51;
                        r104[v1] = p;
                        table.insert(r103, v1);
                    end;
                    return; 
                end)("Map Center", z.GetPivot(z) + Vector3.new(0, 5, 0));
            end;
            k = r88;
            k = "ipairs";
            for v4, N in ipairs(k.GetDescendants(k)) do
                v6 = v4;
                if N.IsA(N, "SpawnLocation") then
                    (function(arg1_52, arg2_52, ...)
                        v1 = arg1_52;
                        if typeof(v1) == "string" and v1 ~= "" then
                            p = arg2_52;
                            r104[v1] = p;
                            table.insert(r103, v1);
                        end;
                        return; 
                    end)("Spawn - " .. N.Name, N.CFrame + Vector3.new(0, 4, 0));
                end; 
            end;
            for k, N in ipairs({
                "Lobby",
                "Shop",
                "Arena",
                "Center",
                "Middle",
                "Spawn",
                "SafeZone",
                "Map"
            }) do
                v6 = k;
                v8 = r88;
                o = r83.getTeleportCFrame(v8.FindFirstChild(v8, N, true));
                if o then
                    (function(arg1_53, arg2_53, ...)
                        v1 = arg1_53;
                        if typeof(v1) == "string" and v1 ~= "" then
                            p = arg2_53;
                            r104[v1] = p;
                            table.insert(r103, v1);
                        end;
                        return; 
                    end)(N, o);
                end; 
            end;
            table.sort(r103);
            r83.state.teleport.LocationValues = r103;
            v8 = r83.state.teleport;
            v8.LocationMap = r104;
            if r83.state.teleport.LocationDropdown and r83.state.teleport.LocationDropdown.Refresh then
                v8 = r83.state.teleport.LocationDropdown;
                v8.Refresh(v8, r103, true);
            end;
            if r83.state.teleport.SelectedLocation and not r104[r83.state.teleport.SelectedLocation] then
                r83.state.teleport.SelectedLocation = r103[1];
            else
                if not r83.state.teleport.SelectedLocation then
                    r83.state.teleport.SelectedLocation = r103[1];
                end;
                return r103;
            end; 
        end;
        r83.teleportToLocation = function(...)
            v1 = r83.state.teleport.LocationMap[r83.state.teleport.SelectedLocation];
            G = r91.Character;
            G = G and G.FindFirstChild(G, "HumanoidRootPart");
            p = v1;
            if v1 then
                p = G and G.FindFirstChild(G, "HumanoidRootPart");
            end;
            if p then
                p = true;
                G.CFrame = p;
                return true;
            end;
            return false; 
        end;
        r83.walkspeedFunc = function(...)
            r105 = r83.state.movement;
            if r105.Connections.WS then
                v8 = r105.Connections.WS;
                v8.Disconnect(v8);
                r105.Connections.WS = nil;
            end;
            if not r105.Walkspeed then
                return;
            end;
            G = r85.Stepped;
            r105.Connections.WS = G.Connect(G, function(...)
                v1 = r91.Character;
                G = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
                v3 = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
                if G then
                    if v3 then
                        z = typeof(r105.WalkspeedValue) == "number";
                    end;
                    v8 = r91[r14[z]];
                    p = v3;
                end;
                if G then
                    G.CFrame = G.CFrame + v3.MoveDirection * 16 * r105.WalkspeedValue / 10;
                end;
                return; 
            end);
            return; 
        end;
        r83.infiniteJumpFunc = function(...)
            r106 = r83.state.movement;
            if r106.Connections.JP then
                v8 = r106.Connections.JP;
                v8.Disconnect(v8);
                r106.Connections.JP = nil;
            end;
            if not r106.InfiniteJump then
                return;
            end;
            G = r89.JumpRequest;
            r106.Connections.JP = G.Connect(G, function(...)
                v1 = r91.Character;
                G = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
                if not G then
                    return;
                end;
                G.ChangeState(G, Enum.HumanoidStateType.Freefall);
                task.wait();
                G.ChangeState(G, Enum.HumanoidStateType.Jumping);
                if G.UseJumpPower == false then
                    G.JumpHeight = math.clamp(r106.InfiniteJumpPower / 10, 7.2, 50);
                else
                    G.JumpPower = r106.InfiniteJumpPower;
                end;
                return; 
            end);
            return; 
        end;
        r83.noclipFunc = function(...)
            v1 = r83.state.movement;
            if v1.Connections.NC then
                v8 = v1.Connections.NC;
                v8.Disconnect(v8);
                v1.Connections.NC = nil;
            end;
            if not v1.Noclip then
                return;
            end;
            G = r85.Stepped;
            v1.Connections.NC = G.Connect(G, function(...)
                v1 = r91.Character;
                if not v1 then
                    return;
                end;
                z = {
                    v1.GetDescendants(v1)
                };
                for v3, v4 in ipairs(D("ipairs")) do
                    v2 = v3;
                    if v4.IsA(v4, "BasePart") then
                        v4.CanCollide = false;
                    end; 
                end;
                return; 
            end);
            return; 
        end;
        r83.ragdollAllPlayers = function(...)
            if not r95 then
                return false;
            end;
            v3 = r84;
            v3 = "ipairs";
            for G, v2 in ipairs(v3.GetPlayers(v3)) do
                z = G;
                k = v2.Character;
                if k then
                    k = v2.Character;
                    v4 = k.FindFirstChild(k, "HumanoidRootPart");
                end;
                if k then
                    for R = 1, 150 do
                        k = v6;
                        v8 = r95;
                        v8.FireServer(v8, k, 9999999);
                        task.wait(); 
                    end;
                end; 
            end;
            return true; 
        end;
        r83.antiGrabStep = function(...)
            if not r83.state.anti.AntiGrab then
                return;
            end;
            v8 = r91;
            v1 = v8.FindFirstChild(v8, "IsHeld");
            v2 = r14;
            G = r91.Character;
            if v1 then
                v2 = v1.Value == true;
                if v2 then
                    v3 = G and G.FindFirstChild(G, "HumanoidRootPart");
                end;
                v8 = r91;
                p = v2;
            end;
            if v1 then
                (G and G.FindFirstChild(G, "HumanoidRootPart")).Anchored = true;
                v3 = r83.state.anti.AntiGrab;
                p = v1.Value == true;
                while not v3 do
                    if v3 then
                        v8 = r93.Struggle;
                        v8.FireServer(v8, r91);
                        task.wait(.001);
                    end;
                    (G and G.FindFirstChild(G, "HumanoidRootPart")).Anchored = false;
                    break; 
                end;
                p = v1.Value == true;
            end;
            return; 
        end;
        r83.antiExplodeStep = function(arg1_54, ...)
            v1 = arg1_54;
            if not r83.state.anti.AntiExplode or (not v1.IsA(v1, "Part") or v1.Name ~= "Part") then
                return;
            end;
            G = r91.Character;
            v3 = G and G.FindFirstChild(G, "HumanoidRootPart");
            z = G and G.FindFirstChild(G, "Right Arm");
            if v3 then
                if z then
                    v2 = (arg1_54.Position - (G and G.FindFirstChild(G, "HumanoidRootPart")).Position).Magnitude <= 20;
                end;
                v8 = r91[r14[v2]];
                p = z;
            end;
            if v3 then
                v3.Anchored = true;
                task.wait(.01);
                v2 = z.FindFirstChild(z, "RagdollLimbPart");
                p = z.RagdollLimbPart.CanCollide == true;
                while not v2 do
                    if v2 then
                        task.wait(.001);
                    end;
                    (G and G.FindFirstChild(G, "HumanoidRootPart")).Anchored = false;
                    break; 
                end;
                p = z.RagdollLimbPart.CanCollide == true;
            end;
            return; 
        end;
        r83.antiLag = function(...)
            v1 = r91.Character;
            v8 = r91;
            G = v8.FindFirstChild(v8, "PlayerScripts");
            v3 = G and G.FindFirstChild(G, "CharacterAndBeamMove");
            if v3 then
                v3.Disabled = r83.state.anti.AntiLag;
            end;
            return; 
        end;
        r83.removeDetectors = function(...)
            v1 = r91.Character;
            if not (v1 and v1.FindFirstChild(v1, "HumanoidRootPart")) then
                return;
            end;
            v2 = r88;
            v2 = "ipairs";
            for z, k in ipairs(v2.GetDescendants(v2)) do
                v4 = z;
                N = k.IsA(k, "BasePart");
                if N then
                    v8 = v8;
                    v6 = (k.Name == "LeftDetector" or k.Name == "RightDetector") and ((v1 and v1.FindFirstChild(v1, "HumanoidRootPart")).Position - k.Position).Magnitude > 10;
                    v8 = v8;
                end;
                if N then
                    k.Destroy(k);
                end; 
            end;
            return; 
        end;
        r83.applyAntiMassless = function(...)
            if not r83.state.anti.AntiBlobman then
                return;
            end;
            v1 = r91.Character;
            if not v1 then
                return;
            end;
            z = {
                v1.GetDescendants(v1)
            };
            for v3, v4 in ipairs(D("ipairs")) do
                v2 = v3;
                if v4.IsA(v4, "BasePart") and v4.Massless then
                    v4.Massless = false;
                end; 
            end;
            return; 
        end;
        r83.upd = function(arg1_55, arg2_55, ...)
            v1 = arg1_55;
            if v1 then
                p = v1.Refresh;
            end;
            if v1 then
                v1.Refresh(v1, r83.getAllPlayers(arg2_55 == true), true);
            end;
            return; 
        end;
        r83.nocoll = function(arg1_56, ...)
            v1 = arg1_56;
            z = {
                v1.GetDescendants(v1)
            };
            for v3, v4 in ipairs(D("ipairs")) do
                v2 = v3;
                if v4.IsA(v4, "BasePart") then
                    v4.CanCollide = false;
                end; 
            end;
            return; 
        end;
        r83.fling = function(arg1_57, arg2_57, ...)
            v1 = arg1_57;
            G = arg2_57;
            r83.nocoll(v1.Parent);
            r107 = Instance.new("BodyVelocity");
            r107.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
            r107.Velocity = Vector3.new(0, 1000000000, 0);
            r107.Parent = v1;
            G.Jump = true;
            G.Sit = false;
            task.delay(3, function(...)
                v8 = r107.Parent;
                if v8 then
                    v8 = r107;
                    v8.Destroy(v8);
                end;
                return; 
            end);
            return; 
        end;
        r83.above = function(arg1_58, arg2_58, ...)
            v1 = arg1_58;
            v3 = v1.Character;
            if v3 then
                v3 = v1.Character;
                p = v3.FindFirstChild(v3, "HumanoidRootPart");
            end;
            v8 = v8;
            return (not v3 or arg2_58 < v3.Position.v8) and true or false; 
        end;
        r83.save = function(arg1_59, ...)
            G = r91.Character;
            if G then
                p = G.FindFirstChild(G, "HumanoidRootPart");
            end;
            if G then
                arg1_59.S = G.GetPivot(G);
            end;
            return; 
        end;
        r83.ret = function(arg1_60, ...)
            v1 = arg1_60;
            G = r91.Character;
            v3 = G and G.FindFirstChild(G, "HumanoidRootPart");
            if v3 then
                v8 = r91[r14[v2]];
                p = v1.S and (v3.Position - v1.S.Position).Magnitude > v1.D;
            end;
            if v3 then
                G.PivotTo(G, v1.S);
            end;
            return; 
        end;
        r83.act = function(arg1_61, arg2_61, arg3_61, ...)
            v1 = arg1_61;
            r108 = arg2_61;
            r109 = arg3_61;
            if not r108.v1 then
                return;
            end;
            z = r88;
            v4 = "PlotItems";
            v2 = z.FindFirstChild(z, v4);
            p = v2;
            if v2 then
                v4 = r88.PlotItems;
                p = v4.FindFirstChild(v4, "PlayersInPlots") and v4.FindFirstChild(v4, v1.Name);
                v8 = not U[G].v1;
            end;
            if p then
                return;
            end;
            r110 = v1.Character;
            v2 = r110;
            p = v2;
            if v2 then
                v2 = r110;
                p = v2.FindFirstChild(v2, "HumanoidRootPart");
            end;
            r111 = p;
            v4 = r110;
            p = v4;
            if v4 then
                v4 = r110;
                p = v4.FindFirstChildOfClass(v4, "Humanoid");
            end;
            r112 = p;
            k = r110;
            p = k;
            if k then
                k = r110;
                p = k.FindFirstChild(k, "Head");
            end;
            r113 = p;
            v8 = r91.Character;
            r114 = v8;
            N = r114;
            if N then
                N = r114;
                p = N.FindFirstChild(N, "HumanoidRootPart");
            end;
            L = not (r111 and r112);
            N = N;
            v8 = L;
            if not (r111 and r112) then
                return;
            end;
            L = r112.Health <= 0;
            p = L;
            if L then
                if L then
                    return;
                end;
                pcall(function(...)
                    r83.save(r108);
                    v8 = r114;
                    v8.PivotTo(v8, CFrame.new(r111.Position + r108.Off));
                    r83.nocoll(r110);
                    v8 = r92.SetNetworkOwner;
                    v8.FireServer(v8, r111, r111.CFrame);
                    task.wait();
                    r83.ret(r108);
                    task.wait(.1);
                    v8 = r92.DestroyGrabLine;
                    v8.FireServer(v8, r111);
                    task.wait(.1);
                    v1 = r113;
                    G = v1.FindFirstChild(v1, "PartOwner");
                    if G then
                        p = r113.PartOwner.Value == r91.Name;
                    end;
                    if G then
                        r83.fling(r111, r112);
                        if r109 then
                            task.wait(.1);
                            r112.Health = 0;
                        end;
                    end;
                    return; 
                end);
                task.wait(r108.Del);
                return;
            else
                p = r83.above(v1, r108.H);
            end; 
        end;
        r83.loop = function(arg1_62, arg2_62, ...)
            v1 = arg1_62;
            G = arg2_62;
            r83.save(v1);
            v4 = {
                pairs(r83.state.attack.Targets)
            };
            z = pairs(r83.state.attack.Targets)(v4[2], v4[3]);
            while z do
                v4 = z;
                v8 = not v1.v1;
                if v8 then
                    break;
                else
                    v8 = r84;
                    k = v8.FindFirstChild(v8, z);
                    if k then
                        r83.act(k, arg1_62, arg2_62);
                    end;
                end; 
            end;
            return; 
        end;
        r83.loopCtrl = function(arg1_63, arg2_63, ...)
            r115 = arg1_63;
            r116 = arg2_63;
            v8 = r85.Heartbeat;
            return v8.Connect(v8, function(...)
                if r115.v1 then
                    r83.loop(r115, r116);
                end;
                return; 
            end); 
        end;
        r83.stopLoop = function(arg1_64, arg2_64, ...)
            G = arg2_64;
            v1 = arg1_64;
            G.v1 = false;
            if v1 then
                v1.Disconnect(v1);
            end;
            G.S = nil;
            return; 
        end;
        r83.killGrabStep = function(arg1_65, ...)
            v1 = arg1_65;
            v8 = not r83.state.strength.Enabled;
            if v8 then
                return;
            end;
            G = v8;
            v8 = G;
            if not (v1.IsA(v1, "Model") and v1.Name == "GrabParts") then
                return;
            end;
            G = v1.FindFirstChild(v1, "GrabPart");
            v3 = G and G.FindFirstChild(G, "WeldConstraint");
            z = v3 and v3.Part1;
            v2 = z and z.Parent;
            if v2 then
                v2.Health = 0;
            end;
            return; 
        end;
        r83.onGrabAdded = function(arg1_66, ...)
            r117 = arg1_66;
            if not r83.state.strength.Enabled or r117.Name ~= "GrabParts" then
                return;
            end;
            v8 = r117;
            G = v8.FindFirstChild(v8, "GrabPart");
            v3 = G and G.FindFirstChild(G, "WeldConstraint");
            z = v3 and v3.Part1;
            if not z then
                return;
            end;
            r118 = Instance.new("BodyVelocity");
            r118.MaxForce = Vector3.new(0, 0, 0);
            r118.Parent = z;
            local function r119(...)
                v1 = r88.CurrentCamera;
                if not v1 then
                    return;
                end;
                r118.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
                r118.Velocity = v1.CFrame.LookVector * r83.state.strength.Strength;
                return; 
            end;
            v8 = r89.InputEnded;
            r120 = v8.Connect(v8, function(arg1_67, ...)
                if arg1_67.UserInputType == Enum.UserInputType.MouseButton1 then
                    r119();
                end;
                return; 
            end);
            v8 = r89.InputBegan;
            r121 = v8.Connect(v8, function(arg1_68, arg2_68, ...)
                if not arg2_68 and arg1_68.UserInputType == Enum.UserInputType.MouseButton1 then
                    r119();
                end;
                return; 
            end);
            v8 = r117;
            p = v8.GetPropertyChangedSignal(v8, "Parent");
            p.Connect(p, function(...)
                p = r117.Parent;
                if not p then
                    v8 = r120;
                    v8.Disconnect(v8);
                    v8 = r121;
                    v8.Disconnect(v8);
                    v8 = game;
                    p = v8.GetService(v8, "Debris");
                    p.AddItem(p, r118, 1);
                end;
                return; 
            end);
            return; 
        end;
        r83.toggleStrengthConnections = function(arg1_69, ...)
            v1 = arg1_69;
            G = v1;
            r83.state.strength.Enabled = G;
            if v1 then
                G = r88.ChildAdded;
                r83.state.strength.GrabConn = G.Connect(G, r83.onGrabAdded);
            else
                if r83.state.strength.GrabConn then
                    v8 = r83.state.strength.GrabConn;
                    v8.Disconnect(v8);
                    r83.state.strength.GrabConn = nil;
                end;
                return;
            end; 
        end;
        r83.spawnToy = function(arg1_70, arg2_70, ...)
            r122 = arg1_70;
            r123 = arg2_70;
            task.spawn(function(...)
                v8 = r94;
                r124 = v8.FindFirstChild(v8, "SpawnToyRemoteFunction");
                if r124 then
                    pcall(function(...)
                        v8 = r124;
                        v8.InvokeServer(v8, r122, CFrame.new(r123), Vector3.new());
                        return; 
                    end);
                end;
                return; 
            end);
            return; 
        end;
        r83.updateSnowballDropdown = function(...)
            v1 = r83.state.snowball.Dropdown;
            if v1 then
                p = v1.Refresh;
            end;
            if v1 then
                v1.Refresh(v1, r83.getAllPlayers(false), true);
            end;
            return; 
        end;
        r83.spawnBallsStep = function(...)
            v1 = r91.Character;
            v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
            if v1 then
                r83.spawnToy("BallSnowball", v1.Position + Vector3.new(0, 2, 0));
            end;
            return; 
        end;
        r83.tpBallStep = function(...)
            v8 = r88;
            v1 = v8.FindFirstChild(v8, r91.Name .. "SpawnedInToys");
            v2 = r14;
            G = r83.state.snowball.TargetPlayer;
            p = G;
            G = p and G.FindFirstChild(G, r83.state.snowball.TargetPlayer);
            if G then
                v2 = G.Character;
                p = v2 and v2.FindFirstChild(v2, "HumanoidRootPart");
                v8 = r88;
            end;
            z = ipairs;
            if v1 then
                p = G;
            end;
            v8 = z;
            if not v1 then
                return;
            end;
            v4 = {
                v1.GetChildren(v1)
            };
            for v2, v6 in ipairs(D("ipairs")) do
                k = v2;
                if v6.IsA(v6, "Model") and v6.Name == "BallSnowball" then
                    for o, d in ipairs(v6.GetDescendants(v6)) do
                        n = o;
                        if d.IsA(d, "BasePart") then
                            d.Position = G.Position;
                        end; 
                    end;
                end; 
            end;
            return; 
        end;
        r83.autoBlobStep = function(...)
            r83.state.snowball.RagdollTargets = {};
            v3 = r84;
            v3 = "ipairs";
            for G, v2 in ipairs(v3.GetPlayers(v3)) do
                z = G;
                if v2 ~= r91 and v2.Character then
                    v8 = v2.Character;
                    v4 = v8.FindFirstChildOfClass(v8, "Humanoid");
                    if v4 then
                        v8 = v2.Character;
                        k = v4.SeatPart and (v4.SeatPart.Parent and v4.SeatPart.Parent.Name == "CreatureBlobman");
                    end;
                    if v4 then
                        table.insert(r83.state.snowball.RagdollTargets, v2);
                        v6 = r91.Character;
                        if v6 then
                            v6 = r91.Character;
                            k = v6.FindFirstChild(v6, "HumanoidRootPart");
                        end;
                        if v6 then
                            r83.spawnToy("BallSnowball", v6.Position + Vector3.new(0, 2, 0));
                        end;
                    end;
                end; 
            end;
            return; 
        end;
        r83.tpSnowStep = function(...)
            v8 = r88;
            v1 = v8.FindFirstChild(v8, r91.Name .. "SpawnedInToys");
            if not v1 then
                return;
            end;
            z = r83.state.snowball.RagdollTargets;
            for v3, v4 in ipairs("ipairs") do
                v2 = v3;
                v6 = v4.Character;
                if v6 then
                    v6 = v4.Character;
                    k = v6.FindFirstChild(v6, "HumanoidRootPart");
                end;
                if v6 then
                    for L, n in ipairs(v1.GetChildren(v1)) do
                        o = L;
                        if n.IsA(n, "Model") and n.Name == "BallSnowball" then
                            for F, q in ipairs(n.GetDescendants(n)) do
                                S = F;
                                if q.IsA(q, "BasePart") then
                                    q.Position = v6.Position;
                                end; 
                            end;
                        end; 
                    end;
                end; 
            end;
            return; 
        end;
        r83.teleportToPlayer = function(...)
            v1 = r83.state.teleport.SelectedPlayer;
            if not v1 then
                return false;
            end;
            v8 = r84;
            G = v8.FindFirstChild(v8, v1);
            v3 = G and G.Character;
            z = r91.Character;
            z = z and z.FindFirstChild(z, "HumanoidRootPart");
            if v3 then
                p = z and z.FindFirstChild(z, "HumanoidRootPart");
            end;
            if v3 then
                z.CFrame = CFrame.new(v3.Position);
                return true;
            end;
            return false; 
        end;
        r83.startLoopTeleport = function(...)
            r83.state.teleport.Enabled = true;
            r83.state.teleport.LoopThread = task.spawn(function(...)
                while r83.state.teleport.Enabled do
                    r83.teleportToPlayer();
                    task.wait(.02); 
                end;
                return; 
            end);
            return; 
        end;
        r83.stopLoopTeleport = function(...)
            r83.state.teleport.Enabled = false;
            r83.state.teleport.LoopThread = nil;
            return; 
        end;
        r83.lagStep = function(...)
            if not r83.state.random.LagEnabled then
                return;
            end;
            for E = 1, r83.state.random.LagIntensity do
                v2 = v1;
                v6 = r84;
                v6 = "ipairs";
                for k, L in ipairs(v6.GetPlayers(v6)) do
                    N = k;
                    n = L.Character;
                    if n then
                        n = L.Character;
                        o = n.FindFirstChild(n, "Torso");
                    end;
                    if n then
                        v8 = r92.CreateGrabLine;
                        v8.FireServer(v8, n, n.CFrame);
                    end; 
                end; 
            end;
            return; 
        end;
        r83.getMountedBlobman = function(...)
            v1 = r91.Character;
            G = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
            if G then
                p = G.SeatPart and (G.SeatPart.Parent and G.SeatPart.Parent.Name == "CreatureBlobman");
                v8 = r91[r14[z]];
            end;
            if G then
                return G.SeatPart.Parent;
            end;
            return nil; 
        end;
        r83.findGroundBelow = function(arg1_71, ...)
            v1 = arg1_71;
            G = RaycastParams.new();
            G.FilterDescendantsInstances = {
                r91.Character
            };
            G.FilterType = Enum.RaycastFilterType.Blacklist;
            v8 = r88;
            v3 = v8.Raycast(v8, v1 + Vector3.new(0, 50, 0), Vector3.new(0, -400, 0), G);
            if v3 then
                z = v3.Position;
            end;
            v8 = v8;
            if v3 then
                return v3;
            else
                p = arg1_71;
            end; 
        end;
        r83.findExistingBlobman = function(...)
            v8 = r88;
            v1 = v8.FindFirstChild(v8, r91.Name .. "SpawnedInToys");
            if v1 then
                G = v1.FindFirstChild(v1, "CreatureBlobman");
            end;
            v8 = v8;
            return v1 or nil; 
        end;
        r83.spawnBlobman = function(...)
            v1 = r91.Character;
            p = v1;
            v1 = p and v1.FindFirstChild(v1, "HumanoidRootPart");
            if not v1 then
                return nil;
            end;
            L = "\xbf\x1f\r";
            N = 323527786646;
            r125 = CFrame.new(r83.findGroundBelow(v1.Position) + Vector3.new(0, 3, 0));
            pcall(function(...)
                v8 = r87.MenuToys.SpawnToyRemoteFunction;
                v8.InvokeServer(v8, "CreatureBlobman", r125, Vector3.new(0, 59.667, 0));
                return; 
            end);
            v8 = r91[r14[r15("\x0f\xb4\xdd>", N)]] .. "SpawnedInToys";
            for z = 1, 30 do
                v6 = z;
                v8 = r88;
                N = v8.FindFirstChild(v8, v3);
                L = N and N.FindFirstChild(N, "CreatureBlobman");
                if L then
                    r83.state.blobman.CurrentBlobman = L;
                    return L;
                else
                    task.wait(.15);
                end; 
            end;
            return nil; 
        end;
        r83.seatOnBlobman = function(arg1_72, ...)
            v1 = arg1_72;
            G = r91.Character;
            if G then
                p = G.FindFirstChildOfClass(G, "Humanoid");
            end;
            r126 = G;
            z = G and G.FindFirstChild(G, "HumanoidRootPart");
            if v1 then
                p = v1.FindFirstChild(v1, "VehicleSeat");
            end;
            r127 = v1;
            if r126 and z then
                z.CFrame = r127.CFrame + Vector3.new(0, 2, 0);
                pcall(function(...)
                    v8 = r127;
                    v8.Sit(v8, r126);
                    return; 
                end);
                task.wait(0.25);
            end;
            return; 
        end;
        r83.teleportBlobman = function(arg1_73, arg2_73, ...)
            v3 = v8;
            r128 = arg1_73;
            r129 = arg2_73;
            v8 = v3;
            if not (r128 and r128.PrimaryPart) then
                return;
            end;
            v3 = r91.Character;
            if v3 then
                v3 = r91.Character;
                p = v3.FindFirstChild(v3, "HumanoidRootPart");
            end;
            r130 = v3;
            if not r130 then
                return;
            end;
            z = Instance.new("BodyPosition");
            z.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
            z.P = 100000;
            z.Position = r129;
            z.Parent = r128.PrimaryPart;
            pcall(function(...)
                r130.CFrame = CFrame.new(r129);
                v8 = r128;
                v8.SetPrimaryPartCFrame(v8, CFrame.new(r129));
                return; 
            end);
            task.wait(.1);
            if z.Parent then
                z.Destroy(z);
            end;
            return; 
        end;
        r83.addBlobmanTarget = function(arg1_74, ...)
            v1 = arg1_74;
            v8 = v8;
            v8 = r84;
            v3 = v8.FindFirstChild(v8, typeof(v1) == "string" and v1.match(v1, "^%s*(.-)%s*$") or "");
            if v3 then
                r83.state.blobman.TargetList[v3.UserId] = v3.Name;
                return true;
            end;
            return false; 
        end;
        r83.removeBlobmanTarget = function(arg1_75, ...)
            v1 = arg1_75;
            v8 = v8;
            v8 = r84;
            v3 = v8.FindFirstChild(v8, typeof(v1) == "string" and v1.match(v1, "^%s*(.-)%s*$") or "");
            if v3 then
                r83.state.blobman.TargetList[v3.UserId] = nil;
                return true;
            end;
            return false; 
        end;
        r83.blobGrabPlayerCompat = function(arg1_76, arg2_76, ...)
            r131 = arg1_76;
            r132 = arg2_76;
            v8 = r23.blobGrabPlayer;
            if v8 then
                pcall(function(...)
                    r23.blobGrabPlayer(r131, r132);
                    return; 
                end);
                return;
            end;
            z = r132;
            v3 = r131 and r131.Character;
            z = z and z.FindFirstChild(z, "LeftDetector");
            v2 = r132;
            if v2 then
                v2 = r132;
                p = v2.FindFirstChild(v2, "RightDetector");
            end;
            v4 = r132;
            p = v4;
            v4 = p and v4.FindFirstChild(v4, "BlobmanSeatAndOwnerScript");
            if v4 then
                p = v4.FindFirstChild(v4, "CreatureGrab");
            end;
            v6 = v8;
            if v3 then
                p = v4;
            end;
            v8 = v6;
            if not v3 then
                return;
            end;
            if r83.state.blobman.BlobAlter ~= 1 then
                v6 = v2 and v2.FindFirstChild(v2, "RightWeld");
                if v2 then
                    p = v2 and v2.FindFirstChild(v2, "RightWeld");
                end;
                if v2 then
                    v4.FireServer(v4, v2, U[v1] and U[v1].Character, v6);
                    r83.state.blobman.BlobAlter = 1;
                end;
            else
                v6 = z and z.FindFirstChild(z, "LeftWeld");
                if z then
                    p = z and z.FindFirstChild(z, "LeftWeld");
                end;
                if z then
                    v4.FireServer(v4, z and z.FindFirstChild(z, "LeftDetector"), U[v1] and U[v1].Character, v6);
                    r83.state.blobman.BlobAlter = 2;
                end;
                return;
            end; 
        end;
        r83.attemptTeleportAndGrab = function(arg1_77, arg2_77, arg3_77, arg4_77, ...)
            v3 = arg3_77;
            G = arg2_77;
            v2 = arg4_77 or 20;
            v1 = arg1_77;
            if v1 then
                N = v1.Character;
                if N then
                    N = arg1_77.Character;
                    k = N.FindFirstChild(N, "HumanoidRootPart");
                end;
                v8 = v8;
                p = N;
            end;
            v8 = v8;
            v6 = v8;
            if v1 then
                N = arg2_77;
                k = N and v8;
                v8 = v8;
            end;
            v8 = U[N].state.blobman.OriginPos;
            if not v1 then
                return false;
            end;
            if U[N].state.blobman.OriginPos and (v1.Position - U[N].state.blobman.OriginPos).Magnitude > U[N].state.blobman.MaxTeleportDist then
                return false;
            end;
            if (v1.Position - v3).Magnitude <= v2 then
                U[N].blobGrabPlayerCompat(v1, G);
                task.wait(.1);
                return true;
            end;
            U[N].teleportBlobman(G, v1.Position + Vector3.new(0, 2, 0));
            task.wait(.2);
            U[N].blobGrabPlayerCompat(v1, G);
            task.wait(.2);
            U[N].teleportBlobman(G, v3);
            task.wait(.2);
            k = v8;
            n = r14;
            L = v1.Character;
            if L then
                n = v1.Character;
                L = n.FindFirstChild(n, "HumanoidRootPart");
                v6 = L and (v1.Character.HumanoidRootPart.Position - v3).Magnitude <= v2;
                v8 = v8;
            end;
            v8 = v8;
            return L or false; 
        end;
        r83.blobDropAndRegrabCycle = function(arg1_78, arg2_78, arg3_78, ...)
            z = v8;
            v1 = arg1_78;
            v3 = arg3_78;
            G = arg2_78;
            if v1 then
                k = v1.Character;
                if k then
                    if G then
                        k = arg2_78.Parent;
                    end;
                    v8 = v8;
                    v2 = G;
                end;
                v8 = v8;
                p = k;
            end;
            v8 = z;
            if not v1 then
                return;
            end;
            v8 = v1.Character;
            r133 = v8.FindFirstChild(v8, "HumanoidRootPart");
            v8 = G.FindFirstChild(G, "BlobmanSeatAndOwnerScript");
            v2 = v8;
            if v2 then
                p = v2.FindFirstChild(v2, "CreatureDrop");
            end;
            r134 = v2;
            k = not (r133 and r134);
            v8 = k;
            if not (r133 and r134) then
                return;
            end;
            for k = 1, 4 do
                o = k;
                if not r83.state.blobman.ToggleEnabled then
                    
                else
                    q = v3;
                    Q = r83.teleportBlobman;
                    if v3 then
                        v8 = v8;
                        v8(G, v3 + Vector3.new(0, 10 * k, 0));
                        task.wait(.1);
                        n = G.FindFirstChild(G, "LeftDetector");
                        d = G.FindFirstChild(G, "RightDetector");
                        if n then
                            G.FindFirstChild(G, S[Q]);
                            p = n.FindFirstChild(n, "RigidConstraint") or n.FindFirstChild(n, "LeftWeld");
                        end;
                        r135 = n;
                        if d then
                            p = d.FindFirstChild(d, "RightWeld") or d.FindFirstChild(d, "RigidConstraint");
                            G.FindFirstChild(G, S[Q]);
                        end;
                        r136 = d;
                        if r135 then
                            pcall(function(...)
                                v8 = r134;
                                v8.FireServer(v8, r135, r133);
                                return; 
                            end);
                        end;
                        if r136 then
                            pcall(function(...)
                                v8 = r134;
                                v8.FireServer(v8, r136, r133);
                                return; 
                            end);
                        end;
                        task.wait(.1);
                        r83.blobGrabPlayerCompat(arg1_78, G);
                        task.wait(.1);
                    else
                        q = Vector3.new();
                    end;
                end; 
            end;
            return; 
        end;
        r83.masterLoop = function(...)
            if r83.state.blobman.MasterRunning then
                return;
            end;
            r83.state.blobman.MasterRunning = true;
            v1 = r91.Character;
            v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
            if v1 then
                r83.state.blobman.OriginPos = v1.Position;
            end;
            task.spawn(function(...)
                while r83.state.blobman.ToggleEnabled do
                    if not r83.state.blobman.CurrentBlobman or not r83.state.blobman.CurrentBlobman.Parent then
                        r83.state.blobman.CurrentBlobman = r83.findExistingBlobman() or r83.spawnBlobman();
                    end;
                    if r83.state.blobman.CurrentBlobman and r83.getMountedBlobman() ~= r83.state.blobman.CurrentBlobman then
                        r83.seatOnBlobman(r83.state.blobman.CurrentBlobman);
                    end;
                    r137 = r83.getMountedBlobman();
                    v2 = r14;
                    k = "Character";
                    G = r91[v2[k]];
                    if G then
                        G = r91.Character;
                        p = G.FindFirstChild(G, "HumanoidRootPart");
                    end;
                    v3 = r137;
                    if v3 then
                        p = G;
                    end;
                    if v3 then
                        r138 = G.Position;
                        k = {
                            pairs(r83.state.blobman.TargetList)
                        };
                        v2 = pairs(r83.state.blobman.TargetList)(k[2], k[3]);
                        while v2 do
                            k = v2;
                            v8 = not r83.state.blobman.ToggleEnabled;
                            if v8 then
                                
                            else
                                v8 = r84;
                                r139 = v8.GetPlayerByUserId(v8, v2);
                                N = r139 and r139.Character;
                                if N then
                                    L = (N.Position - r138).Magnitude <= r83.state.blobman.MaxTeleportDist;
                                end;
                                if N then
                                    v8 = (N.Position - r138).Magnitude <= 20;
                                    if v8 then
                                        r83.blobGrabPlayerCompat(r139, r137);
                                        v8 = task.wait;
                                        n = task.wait;
                                        v8(_G.BlobmanDelay or .1);
                                        pcall(function(...)
                                            r83.blobDropAndRegrabCycle(r139, r137, r138);
                                            return; 
                                        end);
                                    else
                                        r83.attemptTeleportAndGrab(r139, r137, r138, 20);
                                    end;
                                end;
                            end; 
                        end;
                    end;
                    task.wait(0.25); 
                end;
                r83.state.blobman.MasterRunning = false;
                return; 
            end);
            return; 
        end;
        r83.godLoopTargetStep = function(...)
            if not r83.getMountedBlobman() then
                return;
            end;
            v2 = {
                pairs(r83.state.blobman.TargetList)
            };
            v3 = pairs(r83.state.blobman.TargetList)(v2[2], v2[3]);
            while v3 do
                v2 = v3;
                v8 = v2 ~= r91.UserId;
                if v8 then
                    v8 = r84;
                    v4 = v8.GetPlayerByUserId(v8, v3);
                    if v4 then
                        L = v4.Character;
                        if L then
                            L = v8.GetPlayerByUserId(v8, v2).Character;
                            v6 = L.FindFirstChild(L, "HumanoidRootPart");
                        end;
                        v8 = r84;
                        k = L;
                    end;
                    if v4 then
                        r83.blobGrabPlayerCompat(v4, r83.getMountedBlobman());
                    end;
                end; 
            end;
            return; 
        end;
        r83.hoverFollowTargetStep = function(...)
            v1 = r83.getMountedBlobman();
            G = r83.state.blobman.SelectedPlayer;
            p = G;
            G = p and G.FindFirstChild(G, r83.state.blobman.SelectedPlayer);
            if G then
                v2 = G.Character;
                if v2 then
                    v2 = (p and G.FindFirstChild(G, r83.state.blobman.SelectedPlayer)).Character;
                    v3 = v2.FindFirstChild(v2, "HumanoidRootPart");
                end;
                v8 = r83.getMountedBlobman;
                p = v2;
            end;
            z = r91.Character;
            z = z and z.FindFirstChild(z, "HumanoidRootPart");
            if v1 then
                if G then
                    if z then
                        k = ((z and z.FindFirstChild(z, "HumanoidRootPart")).Position - G.Position).Magnitude <= r83.state.blobman.HoverDistance;
                    end;
                    v8 = r83.getMountedBlobman;
                    v2 = z;
                end;
                p = v3;
                v8 = r83.getMountedBlobman;
            end;
            if v1 then
                r83.teleportBlobman(v1, G.Position + Vector3.new(0, r83.state.blobman.HoverHeight, 0));
            end;
            return; 
        end;
        r83.startAirSuspendAura = function(...)
            r83.state.aura.LaunchEnabled = true;
            if r83.state.aura.LaunchThread then
                return;
            end;
            r83.state.aura.LaunchThread = task.spawn(function(...)
                while r83.state.aura.LaunchEnabled do
                    v1 = r91.Character;
                    if v1 and v1.FindFirstChild(v1, "HumanoidRootPart") then
                        z = r84;
                        z = "ipairs";
                        for v3, v4 in ipairs(z.GetPlayers(z)) do
                            v2 = v3;
                            if v4 ~= r91 and v4.Character then
                                v8 = v4.Character;
                                r140 = v8.FindFirstChild(v8, "Torso");
                                v8 = v4.Character;
                                r141 = v8.FindFirstChild(v8, "HumanoidRootPart");
                                if r140 and (r141 and (r140.Position - (p and v1.FindFirstChild(v1, "HumanoidRootPart")).Position).Magnitude <= r83.state.aura.Radius) then
                                    pcall(function(...)
                                        v8 = r92.SetNetworkOwner;
                                        v4 = r141;
                                        z = v4.FindFirstChild(v4, "FirePlayerPart");
                                        v8 = v8;
                                        if z then
                                            v8 = v8;
                                            v8.FireServer(v8, r140, z and r141.FirePlayerPart.CFrame);
                                            return;
                                        else
                                            G = r140.CFrame;
                                        end; 
                                    end);
                                    task.wait(.1);
                                    L = r140;
                                    k = L.FindFirstChild(L, "CompatLaunchVelocity") or Instance.new("BodyVelocity");
                                    k.Name = "CompatLaunchVelocity";
                                    k.Velocity = Vector3.new(0, 200000000000, 0);
                                    k.MaxForce = Vector3.new(0, math.huge, 0);
                                    k.Parent = r140;
                                end;
                            end; 
                        end;
                    end;
                    task.wait(.02); 
                end;
                r83.state.aura.LaunchThread = nil;
                return; 
            end);
            return; 
        end;
        r83.stopAirSuspendAura = function(...)
            r83.state.aura.LaunchEnabled = false;
            return; 
        end;
        r83.startHellSendAura = function(...)
            r83.state.aura.TelekinesisEnabled = true;
            if r83.state.aura.TeleThread then
                return;
            end;
            r83.state.aura.TeleThread = task.spawn(function(...)
                while r83.state.aura.TelekinesisEnabled do
                    v1 = r91.Character;
                    v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
                    G = r88.CurrentCamera;
                    if v1 then
                        p = v8;
                    end;
                    if v1 then
                        v2 = r84;
                        v2 = "ipairs";
                        for z, k in ipairs(v2.GetPlayers(v2)) do
                            v4 = z;
                            v6 = k ~= r91 and k.Character;
                            if v6 then
                                v8 = k.Character;
                                L = r14;
                                v6 = v8.FindFirstChild(v8, "Torso");
                                if v6 then
                                    N = (v6.Position - (v1 and v1.FindFirstChild(v1, "HumanoidRootPart")).Position).Magnitude <= r83.state.aura.Radius;
                                end;
                                if v6 then
                                    v8 = r92.SetNetworkOwner;
                                    v8.FireServer(v8, v6, v1.CFrame);
                                    n = k.Character;
                                    d = {
                                        n.GetDescendants(n)
                                    };
                                    for o, d in ipairs(D(d)) do
                                        n = o;
                                        if d.IsA(d, "BasePart") then
                                            d.CanCollide = false;
                                        end; 
                                    end;
                                    o = "HellAuraPos";
                                    L = v6.FindFirstChild(v6, o);
                                    if L then
                                        L.Name = "HellAuraPos";
                                        L.MaxForce = Vector3.new(100000, 100000, 100000);
                                        L.D = 500;
                                        L.P = 50000;
                                        L.Parent = v6;
                                        o = v6.FindFirstChild(v6, "HellAuraGyro");
                                        L = o;
                                        if o then
                                            L.Name = "HellAuraGyro";
                                            L.MaxTorque = Vector3.new(100000, 100000, 100000);
                                            L.D = 500;
                                            L.P = 50000;
                                            o = v8.FindFirstChild(v8, L[n]);
                                            L.Parent = o;
                                            L.Position = v1.Position + v8.CFrame.LookVector * 15 + Vector3.new(0, 5, 0);
                                            L.CFrame = CFrame.new(v6.Position, v1.Position);
                                        else
                                            L = Instance.new("BodyGyro");
                                        end;
                                    else
                                        N = Instance.new("BodyPosition");
                                    end;
                                end;
                            end; 
                        end;
                    end;
                    task.wait(.05); 
                end;
                r83.state.aura.TeleThread = nil;
                return; 
            end);
            return; 
        end;
        r83.stopHellSendAura = function(...)
            r83.state.aura.TelekinesisEnabled = false;
            return; 
        end;
        r83.deathAuraStep = function(...)
            v6 = 21369969583839;
            v1 = r91.Character;
            p = v1;
            if not (p and v1.FindFirstChild(v1, "HumanoidRootPart")) then
                return;
            end;
            z = r84;
            z = "ipairs";
            for v3, v4 in ipairs(z.GetPlayers(z)) do
                v6 = v4 ~= r91;
                v2 = v3;
                if v6 then
                    k = v4.Character;
                end;
                if v6 then
                    v8 = v4.Character;
                    r142 = v8.FindFirstChild(v8, "HumanoidRootPart");
                    v8 = v4.Character;
                    r143 = v8.FindFirstChild(v8, "Head");
                    v8 = v4.Character;
                    r144 = v8.FindFirstChildOfClass(v8, "Humanoid");
                    if r142 and (r143 and (r144 and (r144.Health > 0 and (r142.Position - (p and v1.FindFirstChild(v1, "HumanoidRootPart")).Position).Magnitude <= r83.state.aura.Radius))) then
                        pcall(function(...)
                            v8 = r92.SetNetworkOwner;
                            v8.FireServer(v8, r142, r142.CFrame);
                            task.wait(.1);
                            v8 = r92.DestroyGrabLine;
                            v8.FireServer(v8, r142);
                            v1 = r143;
                            G = v1.FindFirstChild(v1, "PartOwner");
                            if G then
                                p = r143.PartOwner.Value == r91.Name;
                            end;
                            if G then
                                v3 = r144.Parent;
                                v3 = "ipairs";
                                for G, v2 in ipairs(v3.GetChildren(v3)) do
                                    z = G;
                                    if v2.IsA(v2, "BasePart") then
                                        v2.CFrame = CFrame.new(-1000000000, 1000000000, -1000000000);
                                    end; 
                                end;
                                r145 = Instance.new("BodyVelocity");
                                r145.Velocity = Vector3.new(0, -9999999, 0);
                                r145.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000);
                                r145.P = 100000075;
                                r145.Parent = r142;
                                r144.Sit = false;
                                r144.Jump = true;
                                r144.BreakJointsOnDeath = false;
                                v8 = r144;
                                v8.ChangeState(v8, Enum.HumanoidStateType.Dead);
                                task.delay(2, function(...)
                                    v8 = r145.Parent;
                                    if v8 then
                                        v8 = r145;
                                        v8.Destroy(v8);
                                    end;
                                    return; 
                                end);
                            end;
                            return; 
                        end);
                    end;
                end; 
            end;
            return; 
        end;
        r83.freezeCamera = function(...)
            v1 = r88.CurrentCamera;
            if not v1 then
                return;
            end;
            r83.state.random.FrozenCameraCFrame = v1.CFrame;
            r83.state.random.CameraBlock.CFrame = v1.CFrame;
            r83.state.random.CameraBlock.Parent = r88;
            v1.CameraType = Enum.CameraType.Scriptable;
            v1.CFrame = r83.state.random.FrozenCameraCFrame;
            return; 
        end;
        r83.unfreezeCamera = function(...)
            r83.state.random.CameraBlock.Parent = nil;
            v1 = r88.CurrentCamera;
            if v1 then
                v1.CameraType = Enum.CameraType.Custom;
                if r83.state.random.FrozenCameraCFrame then
                    v1.CFrame = r83.state.random.FrozenCameraCFrame;
                end;
            end;
            return; 
        end;
        r83.bringNoCollide = function(arg1_79, ...)
            v1 = arg1_79;
            z = {
                v1.GetDescendants(v1)
            };
            for v3, v4 in ipairs(D("ipairs")) do
                v2 = v3;
                if v4.IsA(v4, "BasePart") then
                    v4.CanCollide = false;
                end; 
            end;
            return; 
        end;
        r83.playerInPlot = function(arg1_80, ...)
            v8 = r88;
            G = v8.FindFirstChild(v8, "PlotItems");
            v3 = G and G.FindFirstChild(G, "PlayersInPlots");
            if v3 then
                p = v3.FindFirstChild(v3, arg1_80.Name) ~= nil;
            end;
            return v3; 
        end;
        r83.playerIgnored = function(arg1_81, ...)
            G = arg1_81 == r91;
            if G then
                return G;
            else
                z = r83.state.random.BringAllFriends;
                if z then
                    z = r91;
                    G = z.IsFriendsWith(z, arg1_81.UserId);
                end;
                v8 = v8;
                p = z;
            end; 
        end;
        r83.rebuildBringQueue = function(...)
            r83.state.random.BringQueue = {};
            v3 = r84;
            v3 = "ipairs";
            for G, v2 in ipairs(v3.GetPlayers(v3)) do
                z = G;
                if not r83.playerIgnored(v2) and (v2.Character and not r83.playerInPlot(v2)) then
                    v8 = v2.Character;
                    v4 = v8.FindFirstChild(v8, "HumanoidRootPart");
                    if v4 then
                        v8 = v2.Character;
                        k = r83.state.random.BringOrigin and (v4.Position - r83.state.random.BringOrigin).Magnitude > r83.state.random.BringRadius;
                    end;
                    if v4 then
                        table.insert(r83.state.random.BringQueue, v2);
                    end;
                end; 
            end;
            return; 
        end;
        r83.bringNextStep = function(...)
            if #r83.state.random.BringQueue == 0 then
                r83.rebuildBringQueue();
                if #r83.state.random.BringQueue == 0 then
                    return;
                end;
            end;
            v1 = table.remove(r83.state.random.BringQueue, 1);
            G = v1 and v1.Character;
            v3 = v1 and v1.Character;
            k = "Character";
            z = r91[r14[k]];
            v2 = z and z.FindFirstChild(z, "HumanoidRootPart");
            if G then
                if v3 then
                    if v8 then
                        v6 = z and z.FindFirstChild(z, "HumanoidRootPart");
                    end;
                    v8 = r91[r14[k]];
                    v4 = v8;
                end;
                v8 = r91[r14[k]];
                p = v3;
            end;
            if G then
                z.PivotTo(z, G.CFrame * CFrame.new(0, -6, 0));
                r83.bringNoCollide(z);
                k = 0 > 20;
                p = k;
                if k then
                    v8 = r92.SetNetworkOwner;
                    v8.FireServer(v8, v1 and v1.Character, (z and z.FindFirstChild(z, "HumanoidRootPart")).CFrame);
                    task.wait(.15);
                    v8 = v4 + 1;
                    v8 = v8;
                    v8 = v8;
                    v8 = v8;
                    if v8 > 20 or (v3.FindFirstChild(v3, "PartOwner") and v3.PartOwner.Value == r91.Name or not r83.state.random.BringAll) then
                        v8 = v8;
                        if r83.state.random.BringAll and (v3.FindFirstChild(v3, "PartOwner") and v3.PartOwner.Value == r91.Name) then
                            G.CFrame = CFrame.new(r83.state.random.BringOrigin);
                            G.Position = r83.state.random.BringOrigin;
                            G.AssemblyLinearVelocity = Vector3.zero;
                            task.wait(.8);
                        end;
                        return;
                    end;
                else
                    v8 = 0;
                    v8 = 0;
                    p = v3.FindFirstChild(v3, "PartOwner") and v3.PartOwner.Value == r91.Name or not r83.state.random.BringAll;
                end;
            end; 
        end;
        r83.startBringAll = function(...)
            v1 = r91.Character;
            p = v1;
            v1 = p and v1.FindFirstChild(v1, "HumanoidRootPart");
            if not v1 then
                return;
            end;
            r83.state.random.BringAll = true;
            r83.state.random.BringOrigin = v1.Position;
            r83.rebuildBringQueue();
            r83.freezeCamera();
            if r83.state.random.BringThread then
                return;
            end;
            G = r85.Heartbeat;
            r83.state.random.BringThread = G.Connect(G, function(...)
                if r83.state.random.BringAll then
                    r83.bringNextStep();
                    v1 = r88.CurrentCamera;
                    if v1 then
                        p = r83.state.random.FrozenCameraCFrame;
                    end;
                    if v1 then
                        v1.CameraType = Enum.CameraType.Scriptable;
                        v1.CFrame = r83.state.random.FrozenCameraCFrame;
                        r83.state.random.CameraBlock.CFrame = r83.state.random.FrozenCameraCFrame;
                        r83.state.random.CameraBlock.Parent = r88;
                    end;
                end;
                return; 
            end);
            return; 
        end;
        r83.stopBringAll = function(...)
            r83.state.random.BringAll = false;
            if r83.state.random.BringThread then
                v8 = r83.state.random.BringThread;
                v8.Disconnect(v8);
                r83.state.random.BringThread = nil;
            end;
            r83.unfreezeCamera();
            v1 = r91.Character;
            p = v1;
            v1 = p and v1.FindFirstChild(v1, "HumanoidRootPart");
            if v1 then
                p = r83.state.random.BringOrigin;
            end;
            if v1 then
                v1.AssemblyLinearVelocity = Vector3.zero;
                v1.CFrame = CFrame.new(r83.state.random.BringOrigin);
            end;
            return; 
        end;
        r83.findHeldPlayer = function(...)
            v8 = r88;
            v1 = v8.FindFirstChild(v8, "GrabParts");
            if not v1 then
                return nil;
            end;
            z = {
                v1.GetChildren(v1)
            };
            for v3, v4 in ipairs(D("ipairs")) do
                v2 = v3;
                if v4.IsA(v4, "BasePart") then
                    for N, o in ipairs(v4.GetChildren(v4)) do
                        L = N;
                        n = o.IsA(o, "WeldConstraint") and o.Part1;
                        if n then
                            n = o.Part1.Parent;
                            v8 = n.FindFirstChildOfClass(n, "Humanoid");
                            if v8 then
                                v8 = r84;
                                return v8.GetPlayerFromCharacter(v8, n);
                            else
                                
                            end;
                        end; 
                    end;
                end; 
            end;
            return nil; 
        end;
        r83.teleportLimbParts = function(arg1_82, ...)
            v1 = arg1_82;
            G = v1 and v1.Character;
            if not G then
                return;
            end;
            N = r14;
            v4 = r83.state.limbs.Parts;
            for v2, v6 in ipairs(p) do
                k = v2;
                N = G.FindFirstChild(G, v6);
                if N then
                    d = r88;
                    v7 = {
                        d.GetDescendants(d)
                    };
                    for n, v7 in ipairs(D(v7)) do
                        d = n;
                        if v7.IsA(v7, "WeldConstraint") and v7.Part0 == v8 then
                            v7.Enabled = false;
                            table.insert({}, v7);
                        end; 
                    end;
                    for n, v7 in ipairs(N.GetChildren(N)) do
                        d = n;
                        if v7.IsA(v7, "Motor6D") or v7.IsA(v7, "Weld") then
                            v7.Enabled = false;
                            table.insert({}, v7);
                        end; 
                    end;
                    N.Anchored = false;
                    N.CFrame = CFrame.new(Vector3.new(N.Position.X, r83.state.limbs.FallenPartsDestroyHeight - 100, N.Position.Z));
                    task.wait(.1);
                end; 
            end;
            for v4, v6 in ipairs({}) do
                k = v4;
                v6.Enabled = true; 
            end;
            return; 
        end;
        r83.deleteHeldPlayerLimbs = function(...)
            v1 = r83.findHeldPlayer();
            if v1 then
                r83.teleportLimbParts(v1);
            end;
            return; 
        end;
        r83.checkShutdown = function(arg1_83, ...)
            v1 = arg1_83;
            p = v1;
            if v1 then
                r146 = v1;
                v2 = {
                    pcall(function(...)
                        v8 = game;
                        return v8.HttpGet(v8, r146); 
                    end)
                };
                r147 = v2[2];
                if not pcall(function(...)
                    v8 = game;
                    return v8.HttpGet(v8, r146); 
                end) or not r147 then
                    return false, nil;
                end;
                pcall(function(...)
                    v8 = U[o];
                    r148 = v8.JSONDecode(v8, r147);
                    return; 
                end);
                return r148 == true, r148;
            else
                p = "https://raw.githubusercontent.com/Jeffepicy/yeah/refs/heads/main/yeah";
            end; 
        end;
        w = r84.PlayerAdded;
        w.Connect(w, function(...)
            r83.refreshRegisteredDropdowns();
            r83.updateSnowballDropdown();
            r83.refreshTeleportLocations();
            return; 
        end);
        w = r84.PlayerRemoving;
        w.Connect(w, function(arg1_84, ...)
            r83.refreshRegisteredDropdowns();
            r83.updateSnowballDropdown();
            r83.refreshTeleportLocations();
            if r83.state.random.LeaveNotify then
                r83.notify("Player Left", arg1_84.Name .. " left the server.", 4);
            end;
            return; 
        end);
        w = r91.CharacterAdded;
        w.Connect(w, function(...)
            task.defer(function(...)
                r83.refreshTeleportLocations();
                r83.refreshToyDropdowns();
                r83.ensureBoardConnection();
                if r83.state.camera.SecondPerson then
                    r91.CameraMaxZoomDistance = 99999;
                    r91.CameraMode = Enum.CameraMode.Classic;
                end;
                return; 
            end);
            return; 
        end);
        w = r88.ChildAdded;
        w.Connect(w, function(arg1_85, ...)
            v1 = arg1_85;
            r83.antiExplodeStep(v1);
            r83.killGrabStep(v1);
            return; 
        end);
        r83.refreshTeleportLocations();
        r83.ensureBoardConnection();
        task.delay(2, r83.refreshToyDropdowns);
        r23.CosmicCompatibility = r83;
        k = game;
        k = game;
        r149 = k.GetService(k, "Workspace");
        L = game;
        r150 = L.GetService(L, "RunService");
        o = game;
        r151 = o.GetService(o, "Lighting");
        r152 = k.GetService(k, "Players").LocalPlayer;
        r153 = {
            ["DefaultLighting"] = {
                ["Brightness"] = r151.Brightness,
                ["ClockTime"] = r151.ClockTime,
                ["GlobalShadows"] = r151.GlobalShadows,
                ["OutdoorAmbient"] = r151.OutdoorAmbient,
                ["Ambient"] = r151.Ambient,
                ["FogStart"] = r151.FogStart,
                ["FogEnd"] = r151.FogEnd,
                ["FogColor"] = r151.FogColor,
                ["ExposureCompensation"] = r151.ExposureCompensation
            },
            ["DefaultSkySettings"] = {},
            ["HatEnabled"] = false,
            ["HatTransparency"] = .3,
            ["HatRainbow"] = false,
            ["HatColor"] = Color3.fromRGB(0, 255, 255),
            ["HatParts"] = {},
            ["TrailEnabled"] = false,
            ["TrailGradient"] = false,
            ["TrailLifetime"] = 0.5,
            ["TrailTransparencyStart"] = 0,
            ["TrailRainbow"] = false,
            ["TrailColorStatic"] = Color3.fromRGB(0, 255, 255),
            ["TrailGradient1"] = Color3.fromRGB(0, 86, 255),
            ["TrailGradient2"] = Color3.fromRGB(255, 0, 0),
            ["TrailParts"] = {},
            ["SkinTrailEnabled"] = false,
            ["SkinTrailColor"] = Color3.fromRGB(255, 0, 0),
            ["SkinTrailLife"] = 0.5,
            ["ForceFieldEnabled"] = false,
            ["ForceFieldColor"] = Color3.fromRGB(128, 128, 128),
            ["ForceFieldRainbow"] = false,
            ["OriginalColors"] = {},
            ["AuraEnabled"] = false,
            ["AuraType"] = "Godly",
            ["CustomAuraID"] = "",
            ["CurrentAuraModel"] = nil,
            ["AuraEffects"] = {},
            ["WorldTimeEnabled"] = false,
            ["WorldTimeValue"] = 12,
            ["FullBrightEnabled"] = false,
            ["NebulaEnabled"] = false,
            ["NebulaThemeColor"] = Color3.fromRGB(173, 216, 230),
            ["CurrentSkybox"] = "HD",
            ["CustomSkyEnabled"] = false,
            ["ScreenEnabled"] = false,
            ["ScreenIntensity"] = 0,
            ["ScreenConnection"] = nil,
            ["AnimeImageEnabled"] = false,
            ["AnimeImageGui"] = nil,
            ["FpsPingEnabled"] = false,
            ["FpsPingEnabled2"] = false
        };
        n = r151;
        F = n.FindFirstChildOfClass(n, "Sky");
        if F then
            r153.DefaultSkySettings = {
                ["SkyboxBk"] = F.SkyboxBk,
                ["SkyboxDn"] = F.SkyboxDn,
                ["SkyboxFt"] = F.SkyboxFt,
                ["SkyboxLf"] = F.SkyboxLf,
                ["SkyboxRt"] = F.SkyboxRt,
                ["SkyboxUp"] = F.SkyboxUp
            };
        end;
        r153.AuraModels = {
            ["Godly"] = "rbxassetid://16699750981",
            ["Super Sayien"] = "rbxassetid://116109508364297",
            ["North Star"] = "rbxassetid://83945069652732",
            ["Blue Lord"] = "rbxassetid://10974316799",
            ["Pink Aura"] = "rbxassetid://115980859615239",
            ["Angel Wing"] = "rbxassetid://90022969696073",
            ["Sweet Heart"] = "rbxassetid://91724768175470",
            ["Ethereal Aura"] = "rbxassetid://97041568674250"
        };
        r153.SkyboxAssets = {
            ["Black Storm"] = {
                ["Bk"] = "rbxassetid://15502511288",
                ["Dn"] = "rbxassetid://15502508460",
                ["Ft"] = "rbxassetid://15502510289",
                ["Lf"] = "rbxassetid://15502507918",
                ["Rt"] = "rbxassetid://15502509398",
                ["Up"] = "rbxassetid://15502511911"
            },
            ["HD"] = {
                ["Bk"] = "http://www.roblox.com/asset/?id=16553658937",
                ["Dn"] = "http://www.roblox.com/asset/?id=16553660713",
                ["Ft"] = "http://www.roblox.com/asset/?id=16553662144",
                ["Lf"] = "http://www.roblox.com/asset/?id=16553664042",
                ["Rt"] = "http://www.roblox.com/asset/?id=16553665766",
                ["Up"] = "http://www.roblox.com/asset/?id=16553667750"
            },
            ["Snow"] = {
                ["Bk"] = "http://www.roblox.com/asset/?id=155657655",
                ["Dn"] = "http://www.roblox.com/asset/?id=155674246",
                ["Ft"] = "http://www.roblox.com/asset/?id=155657609",
                ["Lf"] = "http://www.roblox.com/asset/?id=155657671",
                ["Rt"] = "http://www.roblox.com/asset/?id=155657619",
                ["Up"] = "http://www.roblox.com/asset/?id=155674931"
            },
            ["Blue Space"] = {
                ["Bk"] = "rbxassetid://15536110634",
                ["Dn"] = "rbxassetid://15536112543",
                ["Ft"] = "rbxassetid://15536116141",
                ["Lf"] = "rbxassetid://15536114370",
                ["Rt"] = "rbxassetid://15536118762",
                ["Up"] = "rbxassetid://15536117282"
            },
            ["Realistic"] = {
                ["Bk"] = "rbxassetid://653719502",
                ["Dn"] = "rbxassetid://653718790",
                ["Ft"] = "rbxassetid://653719067",
                ["Lf"] = "rbxassetid://653719190",
                ["Rt"] = "rbxassetid://653718931",
                ["Up"] = "rbxassetid://653719321"
            },
            ["Stormy"] = {
                ["Bk"] = "http://www.roblox.com/asset/?id=18703245834",
                ["Dn"] = "http://www.roblox.com/asset/?id=18703243349",
                ["Ft"] = "http://www.roblox.com/asset/?id=18703240532",
                ["Lf"] = "http://www.roblox.com/asset/?id=18703237556",
                ["Rt"] = "http://www.roblox.com/asset/?id=18703235430",
                ["Up"] = "http://www.roblox.com/asset/?id=18703232671"
            },
            ["Pink"] = {
                ["Bk"] = "rbxassetid://12216109205",
                ["Dn"] = "rbxassetid://12216109875",
                ["Ft"] = "rbxassetid://12216109489",
                ["Lf"] = "rbxassetid://12216110170",
                ["Rt"] = "rbxassetid://12216110471",
                ["Up"] = "rbxassetid://12216108877"
            },
            ["Sunset"] = {
                ["Bk"] = "rbxassetid://600830446",
                ["Dn"] = "rbxassetid://600831635",
                ["Ft"] = "rbxassetid://600832720",
                ["Lf"] = "rbxassetid://600886090",
                ["Rt"] = "rbxassetid://600833862",
                ["Up"] = "rbxassetid://600835177"
            },
            ["Arctic"] = {
                ["Bk"] = "http://www.roblox.com/asset/?id=225469390",
                ["Dn"] = "http://www.roblox.com/asset/?id=225469395",
                ["Ft"] = "http://www.roblox.com/asset/?id=225469403",
                ["Lf"] = "http://www.roblox.com/asset/?id=225469450",
                ["Rt"] = "http://www.roblox.com/asset/?id=225469471",
                ["Up"] = "http://www.roblox.com/asset/?id=225469481"
            },
            ["Space"] = {
                ["Bk"] = "http://www.roblox.com/asset/?id=166509999",
                ["Dn"] = "http://www.roblox.com/asset/?id=166510057",
                ["Ft"] = "http://www.roblox.com/asset/?id=166510116",
                ["Lf"] = "http://www.roblox.com/asset/?id=166510092",
                ["Rt"] = "http://www.roblox.com/asset/?id=166510131",
                ["Up"] = "http://www.roblox.com/asset/?id=166510114"
            },
            ["Roblox Default"] = {
                ["Bk"] = "rbxasset://textures/sky/sky512_bk.tex",
                ["Dn"] = "rbxasset://textures/sky/sky512_dn.tex",
                ["Ft"] = "rbxasset://textures/sky/sky512_ft.tex",
                ["Lf"] = "rbxasset://textures/sky/sky512_lf.tex",
                ["Rt"] = "rbxasset://textures/sky/sky512_rt.tex",
                ["Up"] = "rbxasset://textures/sky/sky512_up.tex"
            },
            ["Red Night"] = {
                ["Bk"] = "http://www.roblox.com/asset/?id=401664839",
                ["Dn"] = "http://www.roblox.com/asset/?id=401664862",
                ["Ft"] = "http://www.roblox.com/asset/?id=401664960",
                ["Lf"] = "http://www.roblox.com/asset/?id=401664881",
                ["Rt"] = "http://www.roblox.com/asset/?id=401664901",
                ["Up"] = "http://www.roblox.com/asset/?id=401664936"
            },
            ["Deep Space 1"] = {
                ["Bk"] = "http://www.roblox.com/asset/?id=149397692",
                ["Dn"] = "http://www.roblox.com/asset/?id=149397686",
                ["Ft"] = "http://www.roblox.com/asset/?id=149397697",
                ["Lf"] = "http://www.roblox.com/asset/?id=149397684",
                ["Rt"] = "http://www.roblox.com/asset/?id=149397688",
                ["Up"] = "http://www.roblox.com/asset/?id=149397702"
            },
            ["Pink Skies"] = {
                ["Bk"] = "http://www.roblox.com/asset/?id=151165214",
                ["Dn"] = "http://www.roblox.com/asset/?id=151165197",
                ["Ft"] = "http://www.roblox.com/asset/?id=151165224",
                ["Lf"] = "http://www.roblox.com/asset/?id=151165191",
                ["Rt"] = "http://www.roblox.com/asset/?id=151165206",
                ["Up"] = "http://www.roblox.com/asset/?id=151165227"
            },
            ["Purple Sunset"] = {
                ["Bk"] = "rbxassetid://264908339",
                ["Dn"] = "rbxassetid://264907909",
                ["Ft"] = "rbxassetid://264909420",
                ["Lf"] = "rbxassetid://264909758",
                ["Rt"] = "rbxassetid://264908886",
                ["Up"] = "rbxassetid://264907379"
            },
            ["Blue Night"] = {
                ["Bk"] = "http://www.roblox.com/asset/?id=12064107",
                ["Dn"] = "http://www.roblox.com/asset/?id=12064152",
                ["Ft"] = "http://www.roblox.com/asset/?id=12064121",
                ["Lf"] = "http://www.roblox.com/asset/?id=12063984",
                ["Rt"] = "http://www.roblox.com/asset/?id=12064115",
                ["Up"] = "http://www.roblox.com/asset/?id=12064131"
            },
            ["Blossom Daylight"] = {
                ["Bk"] = "http://www.roblox.com/asset/?id=271042516",
                ["Dn"] = "http://www.roblox.com/asset/?id=271077243",
                ["Ft"] = "http://www.roblox.com/asset/?id=271042556",
                ["Lf"] = "http://www.roblox.com/asset/?id=271042310",
                ["Rt"] = "http://www.roblox.com/asset/?id=271042467",
                ["Up"] = "http://www.roblox.com/asset/?id=271077958"
            },
            ["Blue Nebula"] = {
                ["Bk"] = "http://www.roblox.com/asset?id=135207744",
                ["Dn"] = "http://www.roblox.com/asset?id=135207662",
                ["Ft"] = "http://www.roblox.com/asset?id=135207770",
                ["Lf"] = "http://www.roblox.com/asset?id=135207615",
                ["Rt"] = "http://www.roblox.com/asset?id=135207695",
                ["Up"] = "http://www.roblox.com/asset?id=135207794"
            },
            ["Blue Planet"] = {
                ["Bk"] = "rbxassetid://218955819",
                ["Dn"] = "rbxassetid://218953419",
                ["Ft"] = "rbxassetid://218954524",
                ["Lf"] = "rbxassetid://218958493",
                ["Rt"] = "rbxassetid://218957134",
                ["Up"] = "rbxassetid://218950090"
            },
            ["Deep Space 2"] = {
                ["Bk"] = "http://www.roblox.com/asset/?id=159248188",
                ["Dn"] = "http://www.roblox.com/asset/?id=159248183",
                ["Ft"] = "http://www.roblox.com/asset/?id=159248187",
                ["Lf"] = "http://www.roblox.com/asset/?id=159248173",
                ["Rt"] = "http://www.roblox.com/asset/?id=159248192",
                ["Up"] = "http://www.roblox.com/asset/?id=159248176"
            },
            ["Summer"] = {
                ["Bk"] = "rbxassetid://16648590964",
                ["Dn"] = "rbxassetid://16648617436",
                ["Ft"] = "rbxassetid://16648595424",
                ["Lf"] = "rbxassetid://16648566370",
                ["Rt"] = "rbxassetid://16648577071",
                ["Up"] = "rbxassetid://16648598180"
            },
            ["Galaxy"] = {
                ["Bk"] = "rbxassetid://15983968922",
                ["Dn"] = "rbxassetid://15983966825",
                ["Ft"] = "rbxassetid://15983965025",
                ["Lf"] = "rbxassetid://15983967420",
                ["Rt"] = "rbxassetid://15983966246",
                ["Up"] = "rbxassetid://15983964246"
            },
            ["Stylized"] = {
                ["Bk"] = "rbxassetid://18351376859",
                ["Dn"] = "rbxassetid://18351374919",
                ["Ft"] = "rbxassetid://18351376800",
                ["Lf"] = "rbxassetid://18351376469",
                ["Rt"] = "rbxassetid://18351376457",
                ["Up"] = "rbxassetid://18351377189"
            },
            ["Minecraft"] = {
                ["Bk"] = "rbxassetid://8735166756",
                ["Dn"] = "http://www.roblox.com/asset/?id=8735166707",
                ["Ft"] = "http://www.roblox.com/asset/?id=8735231668",
                ["Lf"] = "http://www.roblox.com/asset/?id=8735166755",
                ["Rt"] = "http://www.roblox.com/asset/?id=8735166751",
                ["Up"] = "http://www.roblox.com/asset/?id=8735166729"
            },
            ["Sunset 2"] = {
                ["Bk"] = "http://www.roblox.com/asset/?id=151165214",
                ["Dn"] = "http://www.roblox.com/asset/?id=151165197",
                ["Ft"] = "http://www.roblox.com/asset/?id=151165224",
                ["Lf"] = "http://www.roblox.com/asset/?id=151165191",
                ["Rt"] = "http://www.roblox.com/asset/?id=151165206",
                ["Up"] = "http://www.roblox.com/asset/?id=151165227"
            },
            ["Cloudy Rain"] = {
                ["Bk"] = "http://www.roblox.com/asset/?id=4498828382",
                ["Dn"] = "http://www.roblox.com/asset/?id=4498828812",
                ["Ft"] = "http://www.roblox.com/asset/?id=4498829917",
                ["Lf"] = "http://www.roblox.com/asset/?id=4498830911",
                ["Rt"] = "http://www.roblox.com/asset/?id=4498830417",
                ["Up"] = "http://www.roblox.com/asset/?id=4498831746"
            },
            ["Black Cloudy Rain"] = {
                ["Bk"] = "http://www.roblox.com/asset/?id=149679669",
                ["Dn"] = "http://www.roblox.com/asset/?id=149681979",
                ["Ft"] = "http://www.roblox.com/asset/?id=149679690",
                ["Lf"] = "http://www.roblox.com/asset/?id=149679709",
                ["Rt"] = "http://www.roblox.com/asset/?id=149679722",
                ["Up"] = "http://www.roblox.com/asset/?id=149680199"
            }
        };
        r153.removeHat = function(arg1_86, ...)
            v1 = arg1_86;
            G = r153.HatParts[v1];
            if G then
                G.Destroy(G);
                r153.HatParts[v1] = nil;
            end;
            return; 
        end;
        r153.addHat = function(arg1_87, ...)
            v1 = arg1_87;
            task.wait(.1);
            G = v1 and v1.FindFirstChild(v1, "Head");
            if not G then
                return;
            end;
            r153.removeHat(v1);
            v3 = Instance.new("Part");
            v3.Name = "Hat";
            v3.Transparency = r153.HatTransparency;
            v3.Color = r153.HatColor;
            v3.Material = Enum.Material.Neon;
            v3.CanCollide = false;
            v3.CanTouch = false;
            v3.CanQuery = false;
            v3.Massless = true;
            z = Instance.new("SpecialMesh");
            z.MeshId = "rbxassetid://1033714";
            z.Scale = Vector3.new(2.4, 1.6, 2.4);
            z.Parent = v3;
            v2 = Instance.new("WeldConstraint");
            v2.Part0 = G;
            v2.Part1 = v3;
            v2.Parent = v3;
            v3.CFrame = G.CFrame * CFrame.new(0, 1.1, 0);
            v3.Parent = v1;
            r153.HatParts[v1] = v3;
            return; 
        end;
        r153.updateHats = function(...)
            v1 = r152.Character;
            z = r153.HatParts;
            for v3, v4 in pairs("pairs") do
                if v4 then
                    k = v4.Parent and v3 == r152.Character;
                    v8 = Env[p];
                end;
                if v4 then
                    v4.Transparency = r153.HatTransparency;
                    v8 = "Color";
                    N = r153.HatRainbow;
                    v8 = v8;
                    if N then
                        v8 = v8;
                        v4[v8] = N and Color3.fromHSV(tick() % 5 / 5, 1, 1);
                    else
                        k = r153.HatColor;
                    end;
                end; 
            end;
            return; 
        end;
        r153.removeTrail = function(arg1_88, ...)
            v1 = arg1_88;
            if r153.TrailParts[v1] then
                v8 = r153.TrailParts[v1];
                v8.Destroy(v8);
                r153.TrailParts[v1] = nil;
            end;
            G = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
            if G then
                v3 = G.FindFirstChild(G, "TrailAttach0");
                z = G.FindFirstChild(G, "TrailAttach1");
                if v3 then
                    v3.Destroy(v3);
                end;
                if z then
                    z.Destroy(z);
                end;
            end;
            return; 
        end;
        r153.addTrail = function(arg1_89, ...)
            v1 = arg1_89;
            G = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
            if not G then
                return;
            end;
            r153.removeTrail(v1);
            v3 = Instance.new("Attachment");
            v3.Name = "TrailAttach0";
            v3.Position = Vector3.new(0, 2, 0);
            v3.Parent = G;
            z = Instance.new("Attachment");
            z.Name = "TrailAttach1";
            z.Position = Vector3.new(0, -2, 0);
            z.Parent = G;
            v2 = Instance.new("Trail");
            v2.Attachment0 = v3;
            v2.Attachment1 = z;
            v2.Lifetime = r153.TrailLifetime;
            v2.LightEmission = .2;
            v2.Enabled = true;
            v2.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, r153.TrailTransparencyStart),
                NumberSequenceKeypoint.new(1, 1)
            });
            if r153.TrailGradient then
                v2.Color = ColorSequence.new(r153.TrailGradient1, r153.TrailGradient2);
            else
                v2.Color = ColorSequence.new(r153.TrailColorStatic);
            end;
            v2.Parent = v1;
            r153.TrailParts[v1] = v2;
            return; 
        end;
        r153.updateTrails = function(...)
            v1 = r152.Character;
            z = r153.TrailParts;
            for v3, v4 in pairs("pairs") do
                if v4 then
                    v8 = Env[p];
                    k = v4.Parent and v3 == r152.Character;
                end;
                if v4 then
                    v4.Lifetime = r153.TrailLifetime;
                    v4.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, r153.TrailTransparencyStart),
                        NumberSequenceKeypoint.new(1, 1)
                    });
                    if r153.TrailGradient then
                        v4.Color = ColorSequence.new(r153.TrailGradient1, r153.TrailGradient2);
                    else
                        L = r153.TrailRainbow;
                        if L then
                            v6 = Color3.fromHSV(tick() % 5 / 5, 1, 1);
                        end;
                        v8 = k[v6];
                        v4.Color = ColorSequence.new(L or r153.TrailColorStatic);
                    end;
                end; 
            end;
            return; 
        end;
        r153.saveOriginalColors = function(arg1_90, ...)
            v1 = arg1_90;
            r153.OriginalColors[v1] = {};
            z = {
                v1.GetDescendants(v1)
            };
            for v3, v4 in ipairs(D("ipairs")) do
                v2 = v3;
                if v4.IsA(v4, "BasePart") and v4.Name ~= "Hat" then
                    r153.OriginalColors[arg1_90][v4] = {
                        ["Color"] = v4.Color,
                        ["Material"] = v4.Material
                    };
                end; 
            end;
            return; 
        end;
        r153.applyForceField = function(arg1_91, ...)
            v1 = arg1_91;
            r153.saveOriginalColors(v1);
            z = {
                v1.GetDescendants(v1)
            };
            for v3, v4 in ipairs(D("ipairs")) do
                v2 = v3;
                if v4.IsA(v4, "BasePart") and v4.Name ~= "Hat" then
                    v4.Color = r153.ForceFieldColor;
                    v4.Material = Enum.Material.ForceField;
                end; 
            end;
            return; 
        end;
        r153.removeForceField = function(arg1_92, ...)
            v1 = arg1_92;
            G = r153.OriginalColors[v1];
            if not G then
                return;
            end;
            for z, k in pairs(G) do
                if z then
                    v8 = Env[p];
                    v6 = z.Parent and z.IsA(z, "BasePart");
                end;
                if z then
                    z.Color = k.Color;
                    z.Material = k.Material;
                end; 
            end;
            r153.OriginalColors[v1] = nil;
            return; 
        end;
        r153.updateForceField = function(...)
            v1 = ipairs;
            v8 = v1;
            if not (r152.Character and r153.ForceFieldEnabled) then
                return;
            end;
            v3 = r152.Character;
            v3 = "ipairs";
            for G, v2 in ipairs(v3.GetDescendants(v3)) do
                N = r14;
                z = G;
                L = r15;
                k = v2.IsA(v2, "BasePart");
                if k and (v2.Name ~= "Hat" and v2.Material == Enum.Material.ForceField) then
                    v8 = "Color";
                    N = k;
                    k = v8;
                    L = r153.ForceFieldRainbow;
                    if L then
                        v6 = Color3.fromHSV(tick() % 5 / 5, 1, 1);
                    end;
                    v8 = N;
                    v8 = k;
                    v2[v8] = L or r153.ForceFieldColor;
                end; 
            end;
            return; 
        end;
        r153.toggleSkinTrail = function(arg1_93, ...)
            G = r152.Character;
            if not G then
                return;
            end;
            v3 = G.FindFirstChild(G, "HumanoidRootPart");
            if not v3 then
                return;
            end;
            v4 = {
                G.GetChildren(G)
            };
            for v2, v6 in ipairs(D("ipairs")) do
                k = v2;
                if v6.IsA(v6, "BasePart") and v6 ~= v3 then
                    if arg1_93 then
                        if not v6.FindFirstChild(v6, "SkinTrail") then
                            N = Instance.new("Trail");
                            N.Name = "SkinTrail";
                            N.Texture = "rbxassetid://1390780157";
                            N.Color = ColorSequence.new(r153.SkinTrailColor);
                            N.Lifetime = r153.SkinTrailLife;
                            N.Parent = v6;
                            L = Instance.new("Attachment");
                            L.Name = "SkinPointer1";
                            L.Parent = v6;
                            o = Instance.new("Attachment");
                            o.Name = "SkinPointer2";
                            n = G.FindFirstChild(G, "HumanoidRootPart");
                            o.Parent = n;
                            N.Attachment0 = L;
                            N.Attachment1 = o;
                        end;
                    else
                        N = v6.FindFirstChild(v6, "SkinTrail");
                        L = v6.FindFirstChild(v6, "SkinPointer1");
                        if N then
                            N.Destroy(N);
                        end;
                        if L then
                            L.Destroy(L);
                        end;
                    end;
                end; 
            end;
            if not arg1_93 then
                z = v3.FindFirstChild(v3, "SkinPointer2");
                if z then
                    z.Destroy(z);
                end;
            end;
            return; 
        end;
        r153.updateSkinTrail = function(...)
            v1 = r152.Character;
            if not v1 then
                return;
            end;
            z = {
                v1.GetDescendants(v1)
            };
            for v3, v4 in ipairs(D("ipairs")) do
                v2 = v3;
                if v4.IsA(v4, "Trail") and v4.Name == "SkinTrail" then
                    v4.Color = ColorSequence.new(r153.SkinTrailColor);
                    v4.Lifetime = r153.SkinTrailLife;
                end; 
            end;
            return; 
        end;
        r153.loadAuraModel = function(arg1_94, ...)
            r154 = arg1_94;
            z = {
                pcall(function(...)
                    p = game;
                    return p.GetObjects(p, r154)[1]; 
                end)
            };
            if pcall(function(...)
                p = game;
                return p.GetObjects(p, r154)[1]; 
            end) then
                return z[2];
            end;
            return nil; 
        end;
        r153.disableAura = function(...)
            v3 = r153.AuraEffects;
            for G, v2 in ipairs(p) do
                z = G;
                if v2 then
                    v4 = v2.Parent;
                end;
                if v2 then
                    v2.Destroy(v2);
                end; 
            end;
            table.clear(r153.AuraEffects);
            return; 
        end;
        r153.enableAura = function(arg1_95, ...)
            v1 = arg1_95;
            r153.disableAura();
            if not r153.CurrentAuraModel then
                return;
            end;
            v8 = r153.CurrentAuraModel;
            G = v8.Clone(v8);
            v2 = {
                G.GetDescendants(G)
            };
            for z, k in ipairs(D("ipairs")) do
                v4 = z;
                if not k.IsA(k, "BasePart") then
                    v6 = k.Clone(k);
                    N = k.Parent and k.Parent.Name;
                    if N then
                        L = v1.FindFirstChild(v1, N);
                    end;
                    v8 = not N;
                    if v8 then
                        L = v1.FindFirstChildWhichIsA(v1, "BasePart");
                    end;
                    if N then
                        o = not N.FindFirstChild(N, v6.Name);
                    end;
                    v8 = v8;
                    if N then
                        n = N;
                        v6.Parent = n;
                        table.insert(r153.AuraEffects, v6);
                    end;
                end; 
            end;
            G.Destroy(G);
            return; 
        end;
        r153.updateAuraLogic = function(...)
            G = v8;
            v2 = "";
            v8 = G;
            v1 = r153.CustomAuraID ~= v2 and "rbxassetid://" .. v2.gsub(v2, "%D", "") or r153.AuraModels[r153.AuraType];
            if not v1 then
                return;
            end;
            G = r153.loadAuraModel(v1);
            if G then
                v3 = p;
                r153.CurrentAuraModel = v3;
                if r153.AuraEnabled and r152.Character then
                    r153.enableAura(r152.Character);
                end;
            end;
            return; 
        end;
        r153.applySkybox = function(arg1_96, ...)
            G = r153.SkyboxAssets[arg1_96];
            if not G then
                return;
            end;
            v8 = r151;
            v3 = v8.FindFirstChildOfClass(v8, "Sky");
            if not v3 then
                v3 = Instance.new("Sky");
                v3.Name = "Sky";
                v3.Parent = r151;
            end;
            v3.SkyboxBk = G.Bk;
            v3.SkyboxDn = G.Dn;
            v3.SkyboxFt = G.Ft;
            v3.SkyboxLf = G.Lf;
            v3.SkyboxRt = G.Rt;
            v3.SkyboxUp = G.Up;
            return; 
        end;
        r153.restoreDefaultSky = function(...)
            v8 = r151;
            v1 = v8.FindFirstChildOfClass(v8, "Sky");
            if v1 then
                p = r153.DefaultSkySettings.SkyboxBk;
            end;
            if v1 then
                v1.SkyboxBk = r153.DefaultSkySettings.SkyboxBk;
                v1.SkyboxDn = r153.DefaultSkySettings.SkyboxDn;
                v1.SkyboxFt = r153.DefaultSkySettings.SkyboxFt;
                v1.SkyboxLf = r153.DefaultSkySettings.SkyboxLf;
                v1.SkyboxRt = r153.DefaultSkySettings.SkyboxRt;
                v1.SkyboxUp = r153.DefaultSkySettings.SkyboxUp;
            else
                if v1 then
                    v1.Destroy(v1);
                end;
                return;
            end; 
        end;
        r153.setNebulaEnabled = function(arg1_97, ...)
            v1 = arg1_97;
            r153.NebulaEnabled = v1;
            if v1 then
                G = r151;
                G = G.FindFirstChild(G, "NebulaBloom") or Instance.new("BloomEffect");
                G.Name = "NebulaBloom";
                G.Intensity = .7;
                G.Size = 24;
                G.Threshold = 1;
                G.Parent = r151;
                v3 = r151;
                v3 = v3.FindFirstChild(v3, "NebulaColorCorrection") or Instance.new("ColorCorrectionEffect");
                v3.Name = "NebulaColorCorrection";
                v3.Saturation = 0.5;
                v3.Contrast = .2;
                v3.TintColor = r153.NebulaThemeColor;
                v3.Parent = r151;
                z = r151;
                p = z.FindFirstChild(z, "NebulaAtmosphere") and r153.NebulaThemeColor;
                p = Instance.new("Atmosphere");
                p.Name = "NebulaAtmosphere";
                p.Density = .4;
                p.Offset = 0.25;
                p.Glare = 1;
                p.Haze = 2;
                p.Color = r153.NebulaThemeColor;
                p.Decay = Color3.fromRGB(173, 216, 230);
                p.Parent = r151;
                r151.Ambient = r153.NebulaThemeColor;
                r151.OutdoorAmbient = r153.NebulaThemeColor;
                r151.FogStart = 100;
                r151.FogEnd = 500;
                r151.FogColor = r153.NebulaThemeColor;
            else
                v8 = ipairs;
                for v3, v4 in v8(p) do
                    v8 = r151;
                    v2 = v3;
                    k = v8.FindFirstChild(v8, v4);
                    if k then
                        k.Destroy(k);
                    end; 
                end;
                r151.Ambient = r153.DefaultLighting.Ambient;
                r151.OutdoorAmbient = r153.DefaultLighting.OutdoorAmbient;
                r151.FogStart = r153.DefaultLighting.FogStart;
                r151.FogEnd = r153.DefaultLighting.FogEnd;
                r151.FogColor = r153.DefaultLighting.FogColor;
                return;
            end; 
        end;
        r153.setFullBrightEnabled = function(arg1_98, ...)
            v1 = arg1_98;
            r153.FullBrightEnabled = v1;
            if not v1 then
                r151.Brightness = r153.DefaultLighting.Brightness;
                r151.GlobalShadows = r153.DefaultLighting.GlobalShadows;
                r151.OutdoorAmbient = r153.DefaultLighting.OutdoorAmbient;
                r151.ExposureCompensation = r153.DefaultLighting.ExposureCompensation;
            end;
            return; 
        end;
        r153.setScreenEnabled = function(arg1_99, ...)
            v1 = arg1_99;
            G = v1;
            r153.ScreenEnabled = G;
            if v1 then
                v8 = r153.ScreenConnection;
                if v8 then
                    v8 = r153.ScreenConnection;
                    v8.Disconnect(v8);
                end;
                G = r150.RenderStepped;
                r153.ScreenConnection = G.Connect(G, function(...)
                    v1 = r149.CurrentCamera;
                    if v1 then
                        v1.CFrame = v1.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, .65 + r153.ScreenIntensity, 0, 0, 0, 1);
                    end;
                    return; 
                end);
            else
                if r153.ScreenConnection then
                    v8 = r153.ScreenConnection;
                    v8.Disconnect(v8);
                    r153.ScreenConnection = nil;
                end;
                return;
            end; 
        end;
        r153.toggleAnimeImage = function(arg1_100, ...)
            v1 = arg1_100;
            r153.AnimeImageEnabled = v1;
            if v1 then
                v8 = r153.AnimeImageGui;
                if v8 then
                    v8 = r153.AnimeImageGui;
                    v8.Destroy(v8);
                end;
                G = Instance.new("ScreenGui");
                G.Name = "AnimeImageGui";
                G.ResetOnSpawn = false;
                p = r152;
                G.Parent = p.WaitForChild(p, "PlayerGui");
                v3 = Instance.new("ImageLabel");
                v3.Name = "AnimeImage";
                v3.Image = "http://www.roblox.com/asset/?id=117783035423570";
                v3.Size = UDim2.new(0, 350, 0, 400);
                v3.Position = UDim2.new(1, -25, 0, 10);
                v3.AnchorPoint = Vector2.new(1, 0);
                v3.BackgroundTransparency = 1;
                v3.Parent = G;
                r153.AnimeImageGui = G;
            else
                if r153.AnimeImageGui then
                    v8 = r153.AnimeImageGui;
                    v8.Destroy(v8);
                    r153.AnimeImageGui = nil;
                end;
                return;
            end; 
        end;
        r153.reapplyVisuals = function(arg1_101, ...)
            v1 = arg1_101;
            task.wait(1);
            if r153.HatEnabled then
                r153.addHat(v1);
            end;
            if r153.TrailEnabled then
                r153.addTrail(v1);
            end;
            if r153.ForceFieldEnabled then
                r153.applyForceField(v1);
            end;
            if r153.AuraEnabled then
                r153.enableAura(v1);
            end;
            if r153.SkinTrailEnabled then
                r153.toggleSkinTrail(true);
            end;
            if r153.AnimeImageEnabled then
                r153.toggleAnimeImage(true);
            end;
            return; 
        end;
        n = r150.Heartbeat;
        n.Connect(n, function(...)
            if r153.HatEnabled then
                r153.updateHats();
            end;
            if r153.TrailEnabled then
                r153.updateTrails();
            end;
            if r153.ForceFieldEnabled then
                r153.updateForceField();
            end;
            if r153.WorldTimeEnabled then
                r151.ClockTime = r153.WorldTimeValue;
            end;
            if r153.FullBrightEnabled then
                r151.Brightness = 3;
                r151.GlobalShadows = false;
                r151.OutdoorAmbient = Color3.new(1, 1, 1);
                r151.ExposureCompensation = .3;
            end;
            return; 
        end);
        n = r152.CharacterAdded;
        n.Connect(n, r153.reapplyVisuals);
        if r152.Character then
            task.defer(function(...)
                r153.reapplyVisuals(r152.Character);
                return; 
            end);
        end;
        r23.Visuals = r153;
        L = game;
        r155 = loadstring(L.HttpGet(L, v3 .. "Library.lua"))();
        r23.ObsidianLibrary = r155;
        o = game;
        k = loadstring(o.HttpGet(o, v3 .. "addons/ThemeManager.lua"))();
        k.SetLibrary(k, r155);
        k.SetFolder(k, "AllunSettings");
        k.SetDefaultTheme(k, {
            ["FontColor"] = "#F4F7FB",
            ["MainColor"] = "#161A20",
            ["AccentColor"] = "#89BCE8",
            ["BackgroundColor"] = "#101319",
            ["OutlineColor"] = "#1A2028",
            ["FontFace"] = Enum.Font.Gotham
        });
        r155.ShowCustomCursor = false;
        n = 14;
        r155.CornerRadius = n;
        r155.NotifySide = "Right";
        r155.ToggleKeybind = Enum.KeyCode.RightControl;
        L = r155;
        o = L.CreateWindow(L, {
            ["Title"] = "Allun",
            ["Footer"] = "visual shell",
            ["Icon"] = 72656457634929,
            ["Center"] = true,
            ["AutoShow"] = true,
            ["Resizable"] = false,
            ["ShowCustomCursor"] = false,
            ["CornerRadius"] = 14,
            ["Font"] = Enum.Font.Gotham,
            ["NotifySide"] = "Right",
            ["IconSize"] = UDim2.fromOffset(22, 22),
            ["SearchbarSize"] = UDim2.fromScale(.92, 1)
        });
        L = {
            ["Combat"] = o.AddTab(o, "Combat", "swords"),
            ["Defense"] = o.AddTab(o, "Defense", "shield"),
            ["Auras"] = o.AddTab(o, "Auras", "sparkles"),
            ["Character"] = o.AddTab(o, "Character", "user"),
            ["Visuals"] = o.AddTab(o, "Visuals", "sparkles"),
            ["Explosions"] = o.AddTab(o, "Explosions", "flame"),
            ["Snowball"] = o.AddTab(o, "Snowball", "flame"),
            ["Blobman"] = o.AddTab(o, "Blobman", "user"),
            ["Teleport"] = o.AddTab(o, "Teleport", "user"),
            ["Utility"] = o.AddTab(o, "Utility", "settings"),
            ["Style"] = o.AddTab(o, "Style", "palette"),
            ["Settings"] = o.AddTab(o, "Settings", "settings")
        };
        n = L.Combat;
        r156 = n.AddLeftGroupbox(n, "Combat");
        d = L.Combat;
        r157 = d.AddRightGroupbox(d, "Cosmic Combat");
        v7 = L.Defense;
        r158 = v7.AddLeftGroupbox(v7, "Defense");
        F = L.Defense;
        r159 = F.AddRightGroupbox(F, "Anti");
        C = L.Auras;
        r160 = C.AddLeftGroupbox(C, "Auras");
        r = L.Auras;
        r161 = r.AddRightGroupbox(r, "Force");
        J = L.Character;
        r162 = J.AddLeftGroupbox(J, "Character");
        y = L.Character;
        r163 = y.AddRightGroupbox(y, "Movement");
        g = L.Visuals;
        r164 = g.AddLeftGroupbox(g, "Hat & Trail");
        w = L.Visuals;
        r165 = w.AddRightGroupbox(w, "Skin & Aura");
        x = L.Visuals;
        r166 = x.AddLeftGroupbox(x, "World");
        B = L.Visuals;
        r167 = B.AddRightGroupbox(B, "Screen & Other");
        s = L.Explosions;
        r168 = s.AddLeftGroupbox(s, "Explosions");
        Ye = L.Snowball;
        r169 = Ye.AddLeftGroupbox(Ye, "Snowball");
        be = L.Blobman;
        r170 = be.AddLeftGroupbox(be, "Blobman");
        ue = L.Teleport;
        r171 = ue.AddLeftGroupbox(ue, "Teleport");
        Me = L.Utility;
        r172 = Me.AddLeftGroupbox(Me, "Utility");
        te = L.Utility;
        r173 = te.AddRightGroupbox(te, "Bring All");
        Xe = L.Style;
        Ae = Xe.AddLeftGroupbox(Xe, "Surface");
        Xe = L.Style;
        r174 = Xe.AddRightGroupbox(Xe, "Theme");
        pe = L.Settings;
        Ue = pe.AddRightGroupbox(pe, "Window");
        r175 = r23.CosmicCompatibility;
        r176 = r23.Visuals;
        pe = game;
        r177 = pe.GetService(pe, "Players");
        local function r180(arg1_102, ...)
            v1 = arg1_102;
            if typeof(v1) ~= "string" then
                return "";
            end;
            return v1.match(v1, "^%s*(.-)%s*$"); 
        end;
        local function r181(arg1_103, ...)
            G = r180(arg1_103);
            if G == "" then
                return nil;
            end;
            v8 = r177;
            return v8.FindFirstChild(v8, G); 
        end;
        local function r182(arg1_104, arg2_104, arg3_104, ...)
            r183 = arg1_104;
            r184 = arg2_104;
            r185 = arg3_104;
            task.spawn(function(...)
                v8 = r183;
                while v8() do
                    r184();
                    v8 = task.wait;
                    G = v8;
                    v8(r185 or 0); 
                end;
                return; 
            end);
            return; 
        end;
        local function r186(...)
            return r23.MergedHub; 
        end;
        local function r187(arg1_105, ...)
            v1 = arg1_105;
            v3 = r186();
            if v3 then
                p = v3[v1];
            end;
            if typeof(v3) ~= "function" then
                warn("Imported function not found: " .. tostring(v1));
                return false;
            end;
            v4 = pcall(v3, ...);
            if not v4 then
                warn("Imported function failed: " .. tostring(v1) .. " | " .. tostring(v4[2]));
                return false;
            end;
            return true; 
        end;
        Pe = {
            pcall(function(...)
                v8 = r156;
                v8.AddLabel(v8, "Combat actions are added on the groupbox in Obsidian.", true);
                v8 = r156;
                v8.AddLabel(v8, "Further Reach has been moved into Allun and reapplies on respawn.", true);
                v8 = r156;
                v8.AddToggle(v8, "FurtherReachToggle", {
                    ["Text"] = "Further Reach",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_106, ...)
                        v1 = arg1_106;
                        if not r23.setFurtherReachEnabled(v1) and v1 then
                            task.defer(function(...)
                                v8 = r155.Options.FurtherReachToggle;
                                v8.SetValue(v8, false);
                                return; 
                            end);
                        end;
                        return; 
                    end
                });
                v8 = r156;
                v8.AddButton(v8, {
                    ["Text"] = "Reapply Further Reach",
                    ["Func"] = function(...)
                        G = {
                            r23.reapplyFurtherReach()
                        };
                        v1 = G[2];
                        if not r23.reapplyFurtherReach() and v1 ~= "disabled" then
                            warn("Further Reach reapply failed: " .. tostring(v1));
                        end;
                        return; 
                    end
                });
                v8 = r156;
                v8.AddToggle(v8, "FireGrabToggle", {
                    ["Text"] = "Fire Grab",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_107, ...)
                        G = r23.state;
                        if arg1_107 then
                            G.fireGrabCoroutine = coroutine.create(r23.fireGrab);
                            coroutine.resume(G.fireGrabCoroutine);
                        else
                            if G.fireGrabCoroutine then
                                coroutine.close(G.fireGrabCoroutine);
                                G.fireGrabCoroutine = nil;
                            end;
                            return;
                        end; 
                    end
                });
                v8 = r156;
                v8.AddToggle(v8, "NoclipGrabToggle", {
                    ["Text"] = "No-clip Grab",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_108, ...)
                        G = r23.state;
                        if arg1_108 then
                            G.noclipGrabCoroutine = coroutine.create(r23.noclipGrab);
                            coroutine.resume(G.noclipGrabCoroutine);
                        else
                            if G.noclipGrabCoroutine then
                                coroutine.close(G.noclipGrabCoroutine);
                                G.noclipGrabCoroutine = nil;
                            end;
                            return;
                        end; 
                    end
                });
                v8 = r158;
                v8.AddLabel(v8, "Extra defense, anti-barrier, notifications and safety tools.", true);
                v8 = r158;
                v8.AddButton(v8, {
                    ["Text"] = "Refresh lists",
                    ["Func"] = function(...)
                        r23.updatePlayerList();
                        r175.refreshRegisteredDropdowns();
                        r175.refreshTeleportLocations();
                        r175.refreshToyDropdowns();
                        return; 
                    end
                });
                v8 = r158;
                v8.AddToggle(v8, "CompatAntiFireToggle", {
                    ["Text"] = "Anti Fire",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_109, ...)
                        v1 = arg1_109;
                        r175.state.anti.AntiFire = v1;
                        if v1 then
                            r182(function(...)
                                return r175.state.anti.AntiFire; 
                            end, r175.antiFireStep, .1);
                        else
                            r175.resetAntiFire();
                        end;
                        return; 
                    end
                });
                v8 = r158;
                v8.AddToggle(v8, "CompatAntiBarrierToggle", {
                    ["Text"] = "Anti Barrier",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_110, ...)
                        v1 = arg1_110;
                        r175.state.anti.AntiBarrier = v1;
                        if v1 then
                            r182(function(...)
                                return r175.state.anti.AntiBarrier; 
                            end, r175.applyAntiBarrier, 1);
                        else
                            r175.restoreAntiBarrier();
                        end;
                        return; 
                    end
                });
                v8 = r158;
                v8.AddButton(v8, {
                    ["Text"] = "Destroy Void",
                    ["Func"] = function(...)
                        workspace.FallenPartsDestroyHeight = -1e+95;
                        r175.notify("Defense", "Void height destroyed.", 4);
                        return; 
                    end
                });
                v8 = r158;
                v8.AddToggle(v8, "CompatLeaveNotifyToggle", {
                    ["Text"] = "Player Leave Notify",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_111, ...)
                        r175.state.random.LeaveNotify = arg1_111;
                        return; 
                    end
                });
                v8 = r160;
                v8.AddLabel(v8, "Aura controls should also be added through a groupbox.", true);
                v8 = r164;
                v8.AddLabel(v8, "Local visuals: Chinese hat and trail.", true);
                v8 = r164;
                v1 = v8.AddToggle(v8, "VisualHatToggle", {
                    ["Text"] = "Enable Chinese Hat",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_112, ...)
                        v1 = arg1_112;
                        r176.HatEnabled = v1;
                        if v1 then
                            p = game.Players.LocalPlayer.Character;
                        end;
                        if v1 then
                            r176.addHat(game.Players.LocalPlayer.Character);
                        else
                            if game.Players.LocalPlayer.Character then
                                r176.removeHat(game.Players.LocalPlayer.Character);
                            end;
                            return;
                        end; 
                    end
                });
                v1.AddColorPicker(v1, "VisualHatColor", {
                    ["Default"] = r176.HatColor,
                    ["Title"] = "Hat Color",
                    ["Callback"] = function(arg1_113, ...)
                        r176.HatColor = arg1_113;
                        return; 
                    end
                });
                v8 = r164;
                v8.AddToggle(v8, "VisualHatRainbowToggle", {
                    ["Text"] = "Rainbow Hat",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_114, ...)
                        r176.HatRainbow = arg1_114;
                        return; 
                    end
                });
                v8 = r164;
                v8.AddSlider(v8, "VisualHatTransparency", {
                    ["Text"] = "Hat transparency",
                    ["Default"] = r176.HatTransparency,
                    ["Min"] = 0,
                    ["Max"] = 1,
                    ["Rounding"] = 2,
                    ["Callback"] = function(arg1_115, ...)
                        r176.HatTransparency = arg1_115;
                        return; 
                    end
                });
                v8 = r164;
                G = v8.AddToggle(v8, "VisualTrailToggle", {
                    ["Text"] = "Enable Trail",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_116, ...)
                        v1 = arg1_116;
                        r176.TrailEnabled = v1;
                        if v1 then
                            p = game.Players.LocalPlayer.Character;
                        end;
                        if v1 then
                            r176.addTrail(game.Players.LocalPlayer.Character);
                        else
                            if game.Players.LocalPlayer.Character then
                                r176.removeTrail(game.Players.LocalPlayer.Character);
                            end;
                            return;
                        end; 
                    end
                });
                G.AddColorPicker(G, "VisualTrailColor", {
                    ["Default"] = r176.TrailColorStatic,
                    ["Title"] = "Trail Color",
                    ["Callback"] = function(arg1_117, ...)
                        r176.TrailColorStatic = arg1_117;
                        return; 
                    end
                });
                v8 = r164;
                v3 = v8.AddToggle(v8, "VisualTrailGradientToggle", {
                    ["Text"] = "Use Gradient Mode",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_118, ...)
                        G = arg1_118;
                        r176.TrailGradient = G;
                        if r176.TrailEnabled and game.Players.LocalPlayer.Character then
                            r176.addTrail(game.Players.LocalPlayer.Character);
                        end;
                        return; 
                    end
                });
                v3.AddColorPicker(v3, "VisualTrailGradient1", {
                    ["Default"] = r176.TrailGradient1,
                    ["Title"] = "Gradient Color 1",
                    ["Callback"] = function(arg1_119, ...)
                        r176.TrailGradient1 = arg1_119;
                        return; 
                    end
                });
                v3.AddColorPicker(v3, "VisualTrailGradient2", {
                    ["Default"] = r176.TrailGradient2,
                    ["Title"] = "Gradient Color 2",
                    ["Callback"] = function(arg1_120, ...)
                        r176.TrailGradient2 = arg1_120;
                        return; 
                    end
                });
                v8 = r164;
                v8.AddToggle(v8, "VisualTrailRainbowToggle", {
                    ["Text"] = "Trail Rainbow",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_121, ...)
                        r176.TrailRainbow = arg1_121;
                        return; 
                    end
                });
                v8 = r164;
                v8.AddSlider(v8, "VisualTrailLifetime", {
                    ["Text"] = "Trail lifetime",
                    ["Default"] = r176.TrailLifetime,
                    ["Min"] = .1,
                    ["Max"] = 3,
                    ["Rounding"] = 1,
                    ["Callback"] = function(arg1_122, ...)
                        r176.TrailLifetime = arg1_122;
                        return; 
                    end
                });
                v8 = r164;
                v8.AddSlider(v8, "VisualTrailTransparency", {
                    ["Text"] = "Trail transparency",
                    ["Default"] = r176.TrailTransparencyStart,
                    ["Min"] = 0,
                    ["Max"] = 1,
                    ["Rounding"] = 2,
                    ["Callback"] = function(arg1_123, ...)
                        r176.TrailTransparencyStart = arg1_123;
                        return; 
                    end
                });
                v8 = r165;
                v8.AddLabel(v8, "ForceField skin, skin trail and aura models.", true);
                v8 = r165;
                z = v8.AddToggle(v8, "VisualForceFieldToggle", {
                    ["Text"] = "Enable ForceField",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_124, ...)
                        v1 = arg1_124;
                        G = arg1_124;
                        r176.ForceFieldEnabled = G;
                        G = game.Players.LocalPlayer.Character;
                        if G then
                            if v1 then
                                r176.applyForceField(v8);
                            else
                                r176.removeForceField(v8);
                            end;
                        end;
                        return; 
                    end
                });
                z.AddColorPicker(z, "VisualForceFieldColor", {
                    ["Default"] = r176.ForceFieldColor,
                    ["Title"] = "ForceField Color",
                    ["Callback"] = function(arg1_125, ...)
                        G = arg1_125;
                        r176.ForceFieldColor = G;
                        if r176.ForceFieldEnabled and (game.Players.LocalPlayer.Character and not r176.ForceFieldRainbow) then
                            r176.applyForceField(game.Players.LocalPlayer.Character);
                        end;
                        return; 
                    end
                });
                v8 = r165;
                v8.AddToggle(v8, "VisualForceFieldRainbowToggle", {
                    ["Text"] = "Rainbow ForceField",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_126, ...)
                        r176.ForceFieldRainbow = arg1_126;
                        return; 
                    end
                });
                v8 = r165;
                v2 = v8.AddToggle(v8, "VisualSkinTrailToggle", {
                    ["Text"] = "Enable Skin Trail",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_127, ...)
                        v1 = arg1_127;
                        G = arg1_127;
                        r176.SkinTrailEnabled = G;
                        r176.toggleSkinTrail(v1);
                        return; 
                    end
                });
                v2.AddColorPicker(v2, "VisualSkinTrailColor", {
                    ["Default"] = r176.SkinTrailColor,
                    ["Title"] = "Skin Trail Color",
                    ["Callback"] = function(arg1_128, ...)
                        G = arg1_128;
                        r176.SkinTrailColor = G;
                        if r176.SkinTrailEnabled then
                            r176.updateSkinTrail();
                        end;
                        return; 
                    end
                });
                v8 = r165;
                v8.AddSlider(v8, "VisualSkinTrailLife", {
                    ["Text"] = "Skin trail life",
                    ["Default"] = r176.SkinTrailLife,
                    ["Min"] = .1,
                    ["Max"] = 3,
                    ["Rounding"] = 1,
                    ["Callback"] = function(arg1_129, ...)
                        G = arg1_129;
                        r176.SkinTrailLife = G;
                        if r176.SkinTrailEnabled then
                            r176.updateSkinTrail();
                        end;
                        return; 
                    end
                });
                v8 = r165;
                v8.AddToggle(v8, "VisualAuraToggle", {
                    ["Text"] = "Enable Local Aura",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_130, ...)
                        v1 = arg1_130;
                        r176.AuraEnabled = v1;
                        if v1 then
                            if not r176.CurrentAuraModel then
                                r176.updateAuraLogic();
                            end;
                            if game.Players.LocalPlayer.Character then
                                r176.enableAura(game.Players.LocalPlayer.Character);
                            end;
                        else
                            r176.disableAura();
                        end;
                        return; 
                    end
                });
                v4 = {};
                L = {
                    pairs(r176.AuraModels)
                };
                N = pairs(r176.AuraModels);
                v6 = N(L[2], L[3]);
                while v6 do
                    L = v6;
                    table.insert(v4, L); 
                end;
                table.sort(v4);
                v8 = r165;
                v8.AddDropdown(v8, "VisualAuraTypeDropdown", {
                    ["Text"] = "Aura Type",
                    ["Values"] = v4,
                    ["Default"] = r176.AuraType,
                    ["Multi"] = false,
                    ["Callback"] = function(arg1_131, ...)
                        G = arg1_131;
                        r176.AuraType = G;
                        r176.CustomAuraID = "";
                        if r176.AuraEnabled then
                            r176.updateAuraLogic();
                        end;
                        return; 
                    end
                });
                v8 = r165;
                v8.AddInput(v8, "VisualCustomAuraInput", {
                    ["Text"] = "Custom Aura ID",
                    ["Default"] = "",
                    ["Placeholder"] = "Asset ID",
                    ["Callback"] = function(arg1_132, ...)
                        r176.CustomAuraID = r180(arg1_132);
                        if r176.AuraEnabled and r176.CustomAuraID ~= "" then
                            r176.updateAuraLogic();
                        end;
                        return; 
                    end
                });
                v8 = r166;
                v8.AddLabel(v8, "Skyboxes, nebula theme and lighting.", true);
                k = {};
                n = {
                    pairs(r176.SkyboxAssets)
                };
                L = pairs(r176.SkyboxAssets)(n[2], n[3]);
                while L do
                    o = v6(N, n[3]);
                    table.insert(k, o); 
                end;
                table.sort(k);
                v8 = r166;
                v8.AddDropdown(v8, "VisualSkyboxDropdown", {
                    ["Text"] = "Select Skybox",
                    ["Values"] = k,
                    ["Default"] = r176.CurrentSkybox,
                    ["Multi"] = false,
                    ["Callback"] = function(arg1_133, ...)
                        v1 = arg1_133;
                        G = arg1_133;
                        r176.CurrentSkybox = G;
                        if not r176.CustomSkyEnabled then
                            r176.CustomSkyEnabled = true;
                        end;
                        r176.applySkybox(v1);
                        return; 
                    end
                });
                v8 = r166;
                v8.AddToggle(v8, "VisualSkyboxToggle", {
                    ["Text"] = "Enable Custom Skybox",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_134, ...)
                        v1 = arg1_134;
                        r176.CustomSkyEnabled = v1;
                        if v1 then
                            r176.applySkybox(r176.CurrentSkybox);
                        else
                            r176.restoreDefaultSky();
                        end;
                        return; 
                    end
                });
                v8 = r166;
                v6 = v8.AddToggle(v8, "VisualNebulaToggle", {
                    ["Text"] = "Nebula Theme",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_135, ...)
                        r176.setNebulaEnabled(arg1_135);
                        return; 
                    end
                });
                v6.AddColorPicker(v6, "VisualNebulaColor", {
                    ["Default"] = r176.NebulaThemeColor,
                    ["Title"] = "Nebula Color",
                    ["Callback"] = function(arg1_136, ...)
                        G = arg1_136;
                        r176.NebulaThemeColor = G;
                        if r176.NebulaEnabled then
                            r176.setNebulaEnabled(false);
                            r176.setNebulaEnabled(true);
                        end;
                        return; 
                    end
                });
                v8 = r166;
                v8.AddToggle(v8, "VisualTimeToggle", {
                    ["Text"] = "Enable Time Changer",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_137, ...)
                        r176.WorldTimeEnabled = arg1_137;
                        return; 
                    end
                });
                v8 = r166;
                v8.AddSlider(v8, "VisualTimeValue", {
                    ["Text"] = "Time (0-24)",
                    ["Default"] = r176.WorldTimeValue,
                    ["Min"] = 0,
                    ["Max"] = 24,
                    ["Rounding"] = 1,
                    ["Callback"] = function(arg1_138, ...)
                        r176.WorldTimeValue = arg1_138;
                        return; 
                    end
                });
                v8 = r166;
                v8.AddToggle(v8, "VisualFullBrightToggle", {
                    ["Text"] = "Full Bright",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_139, ...)
                        r176.setFullBrightEnabled(arg1_139);
                        return; 
                    end
                });
                v8 = r167;
                v8.AddLabel(v8, "Camera stretch, anime image and quick counters.", true);
                v8 = r167;
                v8.AddToggle(v8, "VisualScreenToggle", {
                    ["Text"] = "Enable Screen Effect",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_140, ...)
                        r176.setScreenEnabled(arg1_140);
                        return; 
                    end
                });
                v8 = r167;
                v8.AddSlider(v8, "VisualScreenIntensity", {
                    ["Text"] = "Screen Stretch",
                    ["Default"] = r176.ScreenIntensity,
                    ["Min"] = 0,
                    ["Max"] = .2,
                    ["Rounding"] = 3,
                    ["Callback"] = function(arg1_141, ...)
                        r176.ScreenIntensity = arg1_141;
                        return; 
                    end
                });
                v8 = r167;
                v8.AddToggle(v8, "VisualAnimeImageToggle", {
                    ["Text"] = "Anime Image",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_142, ...)
                        r176.toggleAnimeImage(arg1_142);
                        return; 
                    end
                });
                v8 = r167;
                v8.AddButton(v8, {
                    ["Text"] = "Activate FPS/Ping Counter",
                    ["Func"] = function(...)
                        if not r176.FpsPingEnabled then
                            v1 = game;
                            loadstring(v1.HttpGet(v1, "https://raw.githubusercontent.com/GLAMOHGA/fling/refs/heads/main/%D1%85%D0%B7%20%D0%BA%D0%B0%D0%BA%20%D0%BD%D0%B0%D0%B7%D0%B2%D0%B0%D1%82%D1%8C%20%D1%82%D0%B8%D0%BF%D0%BE%20%D1%84%D0%BF%D1%81%20%D0%B8%20%D0%BF%D0%B8%D0%BD%D0%B3.md"))();
                            r176.FpsPingEnabled = true;
                        end;
                        return; 
                    end
                });
                v8 = r167;
                v8.AddButton(v8, {
                    ["Text"] = "Activate FPS/Ping Counter 2",
                    ["Func"] = function(...)
                        if not r176.FpsPingEnabled2 then
                            v1 = game;
                            loadstring(v1.HttpGet(v1, "https://raw.githubusercontent.com/VetrexTheBest/Fps-ping/refs/heads/main/fps%2Bping.txt"))();
                            r176.FpsPingEnabled2 = true;
                        end;
                        return; 
                    end
                });
                v8 = r162;
                v8.AddSlider(v8, "CrouchSpeedValue", {
                    ["Text"] = "Crouch speed",
                    ["Default"] = r23.state.crouchWalkSpeed,
                    ["Min"] = 6,
                    ["Max"] = 100,
                    ["Rounding"] = 0,
                    ["Callback"] = function(arg1_143, ...)
                        r23.state.crouchWalkSpeed = arg1_143;
                        return; 
                    end
                });
                v8 = r162;
                v8.AddToggle(v8, "CompatSecondPersonToggle", {
                    ["Text"] = "Second Person Camera",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_144, ...)
                        r175.setSecondPersonEnabled(arg1_144);
                        return; 
                    end
                });
                v8 = r163;
                v8.AddToggle(v8, "CompatWalkspeedToggle", {
                    ["Text"] = "Walkspeed",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_145, ...)
                        r175.state.movement.Walkspeed = arg1_145;
                        r175.walkspeedFunc();
                        return; 
                    end
                });
                v8 = r163;
                v8.AddSlider(v8, "CompatWalkspeedValue", {
                    ["Text"] = "Speed multiplier",
                    ["Default"] = r175.state.movement.WalkspeedValue,
                    ["Min"] = 1,
                    ["Max"] = 5,
                    ["Rounding"] = 1,
                    ["Callback"] = function(arg1_146, ...)
                        r175.state.movement.WalkspeedValue = arg1_146;
                        return; 
                    end
                });
                v8 = r163;
                v8.AddToggle(v8, "CompatInfiniteJumpToggle", {
                    ["Text"] = "Infinite Jump",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_147, ...)
                        G = arg1_147;
                        r175.state.movement.InfiniteJump = G;
                        r175.infiniteJumpFunc();
                        return; 
                    end
                });
                v8 = r163;
                v8.AddSlider(v8, "CompatJumpPowerValue", {
                    ["Text"] = "Jump power",
                    ["Default"] = r175.state.movement.InfiniteJumpPower,
                    ["Min"] = 16,
                    ["Max"] = 500,
                    ["Rounding"] = 0,
                    ["Callback"] = function(arg1_148, ...)
                        r175.state.movement.InfiniteJumpPower = arg1_148;
                        return; 
                    end
                });
                v8 = r163;
                v8.AddToggle(v8, "CompatNoclipToggle", {
                    ["Text"] = "Noclip",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_149, ...)
                        G = arg1_149;
                        r175.state.movement.Noclip = G;
                        r175.noclipFunc();
                        return; 
                    end
                });
                v8 = r159;
                v8.AddButton(v8, {
                    ["Text"] = "Ragdoll All",
                    ["Func"] = function(...)
                        r175.ragdollAllPlayers();
                        return; 
                    end
                });
                v8 = r159;
                v8.AddToggle(v8, "CompatAntiGrabToggle", {
                    ["Text"] = "Anti Grab",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_150, ...)
                        v1 = arg1_150;
                        r175.state.anti.AntiGrab = v1;
                        if v1 then
                            r182(function(...)
                                return r175.state.anti.AntiGrab; 
                            end, r175.antiGrabStep, 0);
                        end;
                        return; 
                    end
                });
                v8 = r159;
                v8.AddToggle(v8, "CompatAntiExplodeToggle", {
                    ["Text"] = "Anti Explode",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_151, ...)
                        r175.state.anti.AntiExplode = arg1_151;
                        return; 
                    end
                });
                v8 = r159;
                v8.AddToggle(v8, "CompatAntiLagToggle", {
                    ["Text"] = "Anti Lag",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_152, ...)
                        r175.state.anti.AntiLag = arg1_152;
                        r175.antiLag();
                        return; 
                    end
                });
                v8 = r159;
                v8.AddToggle(v8, "CompatAntiBlobmanToggle", {
                    ["Text"] = "Anti Blobman",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_153, ...)
                        v1 = arg1_153;
                        r175.state.anti.AntiBlobman = v1;
                        if v1 then
                            r182(function(...)
                                return r175.state.anti.AntiBlobman; 
                            end, function(...)
                                r175.removeDetectors();
                                r175.applyAntiMassless();
                                return; 
                            end, 1);
                        end;
                        return; 
                    end
                });
                v8 = r157;
                r175.registerDropdown(v8.AddDropdown(v8, "CompatAttackPlayerDropdown", {
                    ["Text"] = "Target player",
                    ["Values"] = r175.getAllPlayers(false),
                    ["Default"] = r175.state.attack.SelectedPlayer,
                    ["Multi"] = false,
                    ["Callback"] = function(arg1_154, ...)
                        r175.state.attack.SelectedPlayer = arg1_154;
                        return; 
                    end
                }), false);
                v8 = r157;
                v8.AddButton(v8, {
                    ["Text"] = "Add Target",
                    ["Func"] = function(...)
                        v1 = r181(r175.state.attack.SelectedPlayer);
                        if v1 then
                            r175.state.attack.Targets[v1.Name] = true;
                        end;
                        return; 
                    end
                });
                v8 = r157;
                v8.AddButton(v8, {
                    ["Text"] = "Remove Target",
                    ["Func"] = function(...)
                        v1 = r181(r175.state.attack.SelectedPlayer);
                        if v1 then
                            r175.state.attack.Targets[v1.Name] = nil;
                        end;
                        return; 
                    end
                });
                v8 = r157;
                v8.AddButton(v8, {
                    ["Text"] = "Clear Targets",
                    ["Func"] = function(...)
                        table.clear(r175.state.attack.Targets);
                        return; 
                    end
                });
                v8 = r157;
                v8.AddToggle(v8, "CompatLoopKickToggle", {
                    ["Text"] = "Loop Kick",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_155, ...)
                        v1 = arg1_155;
                        r175.state.attack.Kick.v1 = v1;
                        if v1 then
                            v8 = r178;
                            if v8 then
                                v8 = U[t[21]];
                                v8.Disconnect(v8);
                            end;
                            r178 = r175.loopCtrl(r175.state.attack.Kick, false);
                        else
                            if r178 then
                                r175.stopLoop(r178, r175.state.attack.Kick);
                            end;
                            return;
                        end; 
                    end
                });
                v8 = r157;
                v8.AddToggle(v8, "CompatLoopKillToggle", {
                    ["Text"] = "Loop Kill",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_156, ...)
                        v1 = arg1_156;
                        r175.state.attack.Kill.v1 = v1;
                        if v1 then
                            v8 = r179;
                            if v8 then
                                v8 = U[t[22]];
                                v8.Disconnect(v8);
                            end;
                            r179 = r175.loopCtrl(r175.state.attack.Kill, true);
                        else
                            if r179 then
                                r175.stopLoop(r179, r175.state.attack.Kill);
                            end;
                            return;
                        end; 
                    end
                });
                v8 = r161;
                v8.AddToggle(v8, "CompatStrengthToggle", {
                    ["Text"] = "Grab Strength",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_157, ...)
                        r175.toggleStrengthConnections(arg1_157);
                        return; 
                    end
                });
                v8 = r161;
                v8.AddSlider(v8, "CompatStrengthValue", {
                    ["Text"] = "Launch strength",
                    ["Default"] = r175.state.strength.Strength,
                    ["Min"] = 10,
                    ["Max"] = 3000,
                    ["Rounding"] = 0,
                    ["Callback"] = function(arg1_158, ...)
                        r175.state.strength.Strength = arg1_158;
                        return; 
                    end
                });
                v8 = r160;
                v8.AddSlider(v8, "CompatAuraRadiusValue", {
                    ["Text"] = "Aura radius",
                    ["Default"] = r175.state.aura.Radius,
                    ["Min"] = 5,
                    ["Max"] = 50,
                    ["Rounding"] = 0,
                    ["Callback"] = function(arg1_159, ...)
                        r175.state.aura.Radius = arg1_159;
                        return; 
                    end
                });
                v8 = r160;
                v8.AddToggle(v8, "CompatLaunchAuraToggle", {
                    ["Text"] = "Launch Aura",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_160, ...)
                        if arg1_160 then
                            r175.startAirSuspendAura();
                        else
                            r175.stopAirSuspendAura();
                        end;
                        return; 
                    end
                });
                v8 = r160;
                v8.AddToggle(v8, "CompatTelekinesisAuraToggle", {
                    ["Text"] = "Telekinesis Aura",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_161, ...)
                        if arg1_161 then
                            r175.startHellSendAura();
                        else
                            r175.stopHellSendAura();
                        end;
                        return; 
                    end
                });
                v8 = r160;
                v8.AddToggle(v8, "CompatDeathAuraToggle", {
                    ["Text"] = "Death Aura",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_162, ...)
                        v1 = arg1_162;
                        r175.state.aura.DeathEnabled = v1;
                        if v1 then
                            r182(function(...)
                                return r175.state.aura.DeathEnabled; 
                            end, r175.deathAuraStep, 0);
                        end;
                        return; 
                    end
                });
                v8 = r169;
                L = v8.AddDropdown(v8, "CompatSnowballPlayerDropdown", {
                    ["Text"] = "Snowball target",
                    ["Values"] = r175.getAllPlayers(false),
                    ["Default"] = r175.state.snowball.TargetPlayer,
                    ["Multi"] = false,
                    ["Callback"] = function(arg1_163, ...)
                        r175.state.snowball.TargetPlayer = arg1_163;
                        return; 
                    end
                });
                n = v8.AddDropdown(v8, "CompatSnowballPlayerDropdown", {
                    ["Text"] = "Snowball target",
                    ["Values"] = r175.getAllPlayers(false),
                    ["Default"] = r175.state.snowball.TargetPlayer,
                    ["Multi"] = false,
                    ["Callback"] = function(arg1_163, ...)
                        r175.state.snowball.TargetPlayer = arg1_163;
                        return; 
                    end
                });
                r175.state.snowball.Dropdown = n;
                r175.registerDropdown(L, false);
                v8 = r169;
                v8.AddToggle(v8, "CompatSnowballRagdollToggle", {
                    ["Text"] = "Snowball Ragdoll",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_164, ...)
                        v1 = arg1_164;
                        r175.state.snowball.TeleportEnabled = v1;
                        if v1 then
                            r182(function(...)
                                return r175.state.snowball.TeleportEnabled; 
                            end, r175.tpBallStep, .1);
                        end;
                        return; 
                    end
                });
                v8 = r169;
                v8.AddToggle(v8, "CompatSnowballSpawnToggle", {
                    ["Text"] = "Auto Spawn Snowballs",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_165, ...)
                        v1 = arg1_165;
                        r175.state.snowball.SpawnEnabled = v1;
                        if v1 then
                            r182(function(...)
                                return r175.state.snowball.SpawnEnabled; 
                            end, r175.spawnBallsStep, 1);
                        end;
                        return; 
                    end
                });
                v8 = r169;
                v8.AddToggle(v8, "CompatSnowballBlobToggle", {
                    ["Text"] = "Auto Kick Blob",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_166, ...)
                        v1 = arg1_166;
                        r175.state.snowball.AutoBlobEnabled = v1;
                        if v1 then
                            r182(function(...)
                                return r175.state.snowball.AutoBlobEnabled; 
                            end, function(...)
                                r175.autoBlobStep();
                                r175.tpSnowStep();
                                return; 
                            end, .1);
                        end;
                        return; 
                    end
                });
                v8 = r170;
                r175.registerDropdown(v8.AddDropdown(v8, "CompatBlobmanPlayerDropdown", {
                    ["Text"] = "Blobman player",
                    ["Values"] = r175.getAllPlayers(false),
                    ["Default"] = r175.state.blobman.SelectedPlayer,
                    ["Multi"] = false,
                    ["Callback"] = function(arg1_167, ...)
                        r175.state.blobman.SelectedPlayer = arg1_167;
                        return; 
                    end
                }), false);
                v8 = r170;
                v8.AddButton(v8, {
                    ["Text"] = "Add Blobman Target",
                    ["Func"] = function(...)
                        r175.addBlobmanTarget(r175.state.blobman.SelectedPlayer);
                        return; 
                    end
                });
                v8 = r170;
                v8.AddButton(v8, {
                    ["Text"] = "Remove Blobman Target",
                    ["Func"] = function(...)
                        r175.removeBlobmanTarget(r175.state.blobman.SelectedPlayer);
                        return; 
                    end
                });
                v8 = r170;
                v8.AddToggle(v8, "CompatBlobmanKickToggle", {
                    ["Text"] = "Blobman Target",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_168, ...)
                        v1 = arg1_168;
                        r175.state.blobman.ToggleEnabled = v1;
                        if v1 then
                            r175.masterLoop();
                        end;
                        return; 
                    end
                });
                v8 = r170;
                v8.AddToggle(v8, "CompatBlobmanGodLoopToggle", {
                    ["Text"] = "God Loop Target",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_169, ...)
                        v1 = arg1_169;
                        r175.state.blobman.GodLoopEnabled = v1;
                        if v1 then
                            r182(function(...)
                                return r175.state.blobman.GodLoopEnabled; 
                            end, r175.godLoopTargetStep, .01);
                        end;
                        return; 
                    end
                });
                v8 = r170;
                v8.AddToggle(v8, "CompatBlobmanHoverToggle", {
                    ["Text"] = "Hover Above Target",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_170, ...)
                        v1 = arg1_170;
                        r175.state.blobman.HoverEnabled = v1;
                        if v1 then
                            r182(function(...)
                                return r175.state.blobman.HoverEnabled; 
                            end, r175.hoverFollowTargetStep, .06);
                        end;
                        return; 
                    end
                });
                v8 = r170;
                v8.AddSlider(v8, "CompatBlobmanHoverHeight", {
                    ["Text"] = "Hover height",
                    ["Default"] = r175.state.blobman.HoverHeight,
                    ["Min"] = 5,
                    ["Max"] = 100,
                    ["Rounding"] = 0,
                    ["Callback"] = function(arg1_171, ...)
                        r175.state.blobman.HoverHeight = arg1_171;
                        return; 
                    end
                });
                v8 = r168;
                v8.AddDropdown(v8, "ToyToLoadDropdown", {
                    ["Text"] = "Toy to load",
                    ["Values"] = {
                        "BombMissile",
                        "FireworkMissile"
                    },
                    ["Default"] = _G.ToyToLoad,
                    ["Multi"] = false,
                    ["Callback"] = function(arg1_172, ...)
                        _G.ToyToLoad = arg1_172;
                        return; 
                    end
                });
                v8 = r168;
                v8.AddSlider(v8, "MaxMissilesValue", {
                    ["Text"] = "Max missiles",
                    ["Default"] = _G.MaxMissiles,
                    ["Min"] = 1,
                    ["Max"] = 20,
                    ["Rounding"] = 0,
                    ["Callback"] = function(arg1_173, ...)
                        _G.MaxMissiles = arg1_173;
                        return; 
                    end
                });
                v8 = r168;
                v8.AddToggle(v8, "AutoReloadMissiles", {
                    ["Text"] = "Auto Reload Cache",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_174, ...)
                        r23.reloadMissile(arg1_174);
                        return; 
                    end
                });
                v8 = r171;
                r175.registerDropdown(v8.AddDropdown(v8, "CompatTeleportPlayerDropdown", {
                    ["Text"] = "Teleport target",
                    ["Values"] = r175.getAllPlayers(false),
                    ["Default"] = r175.state.teleport.SelectedPlayer,
                    ["Multi"] = false,
                    ["Callback"] = function(arg1_175, ...)
                        r175.state.teleport.SelectedPlayer = arg1_175;
                        return; 
                    end
                }), false);
                v8 = r171;
                v8.AddButton(v8, {
                    ["Text"] = "Teleport to Player",
                    ["Func"] = function(...)
                        r175.teleportToPlayer();
                        return; 
                    end
                });
                v8 = r171;
                F = v8.AddDropdown(v8, "CompatTeleportLocationDropdown", {
                    ["Text"] = "Teleport place",
                    ["Values"] = r175.refreshTeleportLocations(),
                    ["Default"] = r175.state.teleport.SelectedLocation,
                    ["Multi"] = false,
                    ["Callback"] = function(arg1_176, ...)
                        r175.state.teleport.SelectedLocation = arg1_176;
                        return; 
                    end
                });
                r175.state.teleport.LocationDropdown = F;
                r175.refreshTeleportLocations();
                v8 = r171;
                v8.AddButton(v8, {
                    ["Text"] = "Refresh places",
                    ["Func"] = function(...)
                        r175.refreshTeleportLocations();
                        return; 
                    end
                });
                v8 = r171;
                v8.AddButton(v8, {
                    ["Text"] = "Teleport to Place",
                    ["Func"] = function(...)
                        r175.teleportToLocation();
                        return; 
                    end
                });
                v8 = r171;
                v8.AddToggle(v8, "CompatLoopTeleportToggle", {
                    ["Text"] = "Loop Teleport",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_177, ...)
                        if arg1_177 then
                            r175.startLoopTeleport();
                        else
                            r175.stopLoopTeleport();
                        end;
                        return; 
                    end
                });
                v8 = r172;
                v8.AddToggle(v8, "CompatLagToggle", {
                    ["Text"] = "Lag",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_178, ...)
                        v1 = arg1_178;
                        r175.state.random.LagEnabled = v1;
                        if v1 then
                            r182(function(...)
                                return r175.state.random.LagEnabled; 
                            end, r175.lagStep, 1);
                        end;
                        return; 
                    end
                });
                v8 = r172;
                v8.AddSlider(v8, "CompatLagIntensityValue", {
                    ["Text"] = "Lag intensity",
                    ["Default"] = r175.state.random.LagIntensity,
                    ["Min"] = 1,
                    ["Max"] = 1000,
                    ["Rounding"] = 0,
                    ["Callback"] = function(arg1_179, ...)
                        r175.state.random.LagIntensity = arg1_179;
                        return; 
                    end
                });
                v8 = r172;
                S = v8.AddDropdown(v8, "CompatToyDropdown", {
                    ["Text"] = "Toy control",
                    ["Values"] = r175.getOwnedToyNames(),
                    ["Default"] = r175.state.toys.SelectedToy,
                    ["Multi"] = false,
                    ["Callback"] = function(arg1_180, ...)
                        r175.state.toys.SelectedToy = arg1_180;
                        return; 
                    end
                });
                r175.state.toys.ToyDropdown = S;
                v8 = r172;
                v8.AddDropdown(v8, "CompatToyAttachModeDropdown", {
                    ["Text"] = "Toy mode",
                    ["Values"] = {
                        "Front",
                        "Back",
                        "Left Wing",
                        "Right Wing",
                        "Orbit"
                    },
                    ["Default"] = r175.state.toys.AttachMode,
                    ["Multi"] = false,
                    ["Callback"] = function(arg1_181, ...)
                        r175.state.toys.AttachMode = arg1_181;
                        return; 
                    end
                });
                v8 = r172;
                v8.AddSlider(v8, "CompatToyDistanceValue", {
                    ["Text"] = "Toy distance",
                    ["Default"] = r175.state.toys.AttachDistance,
                    ["Min"] = 2,
                    ["Max"] = 20,
                    ["Rounding"] = 0,
                    ["Callback"] = function(arg1_182, ...)
                        r175.state.toys.AttachDistance = arg1_182;
                        return; 
                    end
                });
                v8 = r172;
                v8.AddSlider(v8, "CompatToyHeightValue", {
                    ["Text"] = "Toy height",
                    ["Default"] = r175.state.toys.AttachHeight,
                    ["Min"] = -8,
                    ["Max"] = 12,
                    ["Rounding"] = 0,
                    ["Callback"] = function(arg1_183, ...)
                        r175.state.toys.AttachHeight = arg1_183;
                        return; 
                    end
                });
                v8 = r172;
                v8.AddSlider(v8, "CompatToySpinValue", {
                    ["Text"] = "Toy orbit speed",
                    ["Default"] = r175.state.toys.AttachSpin,
                    ["Min"] = 1,
                    ["Max"] = 12,
                    ["Rounding"] = 1,
                    ["Callback"] = function(arg1_184, ...)
                        r175.state.toys.AttachSpin = arg1_184;
                        return; 
                    end
                });
                v8 = r172;
                v8.AddButton(v8, {
                    ["Text"] = "Refresh toys",
                    ["Func"] = function(...)
                        r175.refreshToyDropdowns();
                        return; 
                    end
                });
                v8 = r172;
                v8.AddButton(v8, {
                    ["Text"] = "Spawn selected toy",
                    ["Func"] = function(...)
                        r175.spawnSelectedToy();
                        return; 
                    end
                });
                v8 = r172;
                v8.AddToggle(v8, "CompatToyTelekinesisToggle", {
                    ["Text"] = "Toy Telekinesis",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_185, ...)
                        v1 = arg1_185;
                        r175.state.toys.AttachEnabled = v1;
                        if v1 then
                            r182(function(...)
                                return r175.state.toys.AttachEnabled; 
                            end, r175.toyTelekinesisStep, 0);
                        else
                            r175.clearToyBodyMovers();
                        end;
                        return; 
                    end
                });
                v8 = r172;
                q = v8.AddDropdown(v8, "CompatBoardToyDropdown", {
                    ["Text"] = "Board toy",
                    ["Values"] = r175.getOwnedToyNames("board"),
                    ["Default"] = r175.state.toys.BoardToy,
                    ["Multi"] = false,
                    ["Callback"] = function(arg1_186, ...)
                        r175.state.toys.BoardToy = arg1_186;
                        return; 
                    end
                });
                r175.state.toys.BoardDropdown = q;
                r175.refreshToyDropdowns();
                v8 = r172;
                v8.AddDropdown(v8, "CompatBoardKeyDropdown", {
                    ["Text"] = "Board key",
                    ["Values"] = {
                        "B",
                        "V",
                        "C",
                        "X",
                        "Z",
                        "T",
                        "R",
                        "G",
                        "F",
                        "Q"
                    },
                    ["Default"] = r175.state.toys.BoardKey,
                    ["Multi"] = false,
                    ["Callback"] = function(arg1_187, ...)
                        r175.state.toys.BoardKey = arg1_187;
                        return; 
                    end
                });
                v8 = r172;
                v8.AddButton(v8, {
                    ["Text"] = "Spawn Board",
                    ["Func"] = function(...)
                        r175.spawnBoard();
                        return; 
                    end
                });
                v8 = r172;
                v8.AddToggle(v8, "CompatBoardBindToggle", {
                    ["Text"] = "Board on Key",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_188, ...)
                        r175.state.toys.BoardBindEnabled = arg1_188;
                        r175.ensureBoardConnection();
                        return; 
                    end
                });
                v8 = r173;
                v8.AddToggle(v8, "CompatBringAllToggle", {
                    ["Text"] = "Bring All",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_189, ...)
                        if arg1_189 then
                            r175.startBringAll();
                        else
                            r175.stopBringAll();
                        end;
                        return; 
                    end
                });
                v8 = r173;
                v8.AddToggle(v8, "CompatBringFriendsToggle", {
                    ["Text"] = "Whitelist Friends",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_190, ...)
                        r175.state.random.BringAllFriends = arg1_190;
                        return; 
                    end
                });
                v8 = r173;
                v8.AddSlider(v8, "CompatBringRadiusValue", {
                    ["Text"] = "Bring radius",
                    ["Default"] = r175.state.random.BringRadius,
                    ["Min"] = 5,
                    ["Max"] = 50,
                    ["Rounding"] = 0,
                    ["Callback"] = function(arg1_191, ...)
                        r175.state.random.BringRadius = arg1_191;
                        return; 
                    end
                });
                v8 = r173;
                v8.AddButton(v8, {
                    ["Text"] = "Delete Held Player Limbs",
                    ["Func"] = function(...)
                        r175.deleteHeldPlayerLimbs();
                        return; 
                    end
                });
                v8 = r156;
                v8.AddToggle(v8, "MergedSilentAimToggle", {
                    ["Text"] = "Silent Aim",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_192, ...)
                        r187("setSilentAimEnabled", arg1_192);
                        return; 
                    end
                });
                v8 = r156;
                v8.AddSlider(v8, "MergedSilentAimRange", {
                    ["Text"] = "Silent aim range",
                    ["Default"] = 30,
                    ["Min"] = 5,
                    ["Max"] = 200,
                    ["Rounding"] = 0,
                    ["Callback"] = function(arg1_193, ...)
                        r187("setSilentAimRange", arg1_193);
                        return; 
                    end
                });
                v8 = r156;
                v8.AddButton(v8, {
                    ["Text"] = "Create Grab Lines",
                    ["Func"] = function(...)
                        r187("createGrabLineForAll");
                        return; 
                    end
                });
                v8 = r156;
                v8.AddToggle(v8, "MergedGrabLineLagToggle", {
                    ["Text"] = "Grab Line Lag",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_194, ...)
                        r187("setGrabLineLagEnabled", arg1_194);
                        return; 
                    end
                });
                v8 = r156;
                v8.AddSlider(v8, "MergedGrabLineLagSpeed", {
                    ["Text"] = "Grab line speed",
                    ["Default"] = 0.5,
                    ["Min"] = .01,
                    ["Max"] = 2,
                    ["Rounding"] = 2,
                    ["Callback"] = function(arg1_195, ...)
                        r187("setGrabLineSpeed", arg1_195);
                        return; 
                    end
                });
                v8 = r156;
                v8.AddToggle(v8, "MergedLineAllToggle", {
                    ["Text"] = "Line All Players",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_196, ...)
                        r187("setLineAllEnabled", arg1_196);
                        return; 
                    end
                });
                v8 = r156;
                v8.AddSlider(v8, "MergedLineAllDelay", {
                    ["Text"] = "Line all delay",
                    ["Default"] = 0.5,
                    ["Min"] = .01,
                    ["Max"] = 2,
                    ["Rounding"] = 2,
                    ["Callback"] = function(arg1_197, ...)
                        r187("setLineAllSpeed", arg1_197);
                        return; 
                    end
                });
                v8 = r157;
                v8.AddButton(v8, {
                    ["Text"] = "Grab Nearby Once",
                    ["Func"] = function(...)
                        r187("grabNearbyPlayers");
                        return; 
                    end
                });
                v8 = r157;
                v8.AddToggle(v8, "MergedNearbyGrabLoopToggle", {
                    ["Text"] = "Auto Grab Nearby",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_198, ...)
                        r187("setAutoGrabNearbyEnabled", arg1_198);
                        return; 
                    end
                });
                v8 = r162;
                v8.AddToggle(v8, "MergedFireAnimationToggle", {
                    ["Text"] = "Fire Flail Animation",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_199, ...)
                        r187("setFireAnimationEnabled", arg1_199);
                        return; 
                    end
                });
                v8 = r162;
                v8.AddToggle(v8, "MergedMouseTeleportToggle", {
                    ["Text"] = "Mouse Teleport (Z)",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_200, ...)
                        r187("setMouseTeleportEnabled", arg1_200);
                        return; 
                    end
                });
                v8 = r162;
                v8.AddToggle(v8, "MergedVoidRescueToggle", {
                    ["Text"] = "Void Rescue",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_201, ...)
                        r187("setVoidRescueEnabled", arg1_201);
                        return; 
                    end
                });
                v8 = r163;
                v8.AddToggle(v8, "MergedGhostNoclipToggle", {
                    ["Text"] = "Ghost Noclip",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_202, ...)
                        r187("setGhostNoclipEnabled", arg1_202);
                        return; 
                    end
                });
                v8 = r159;
                v8.AddToggle(v8, "MergedAntiKickToggle", {
                    ["Text"] = "Anti Kick",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_203, ...)
                        r187("setAntiKickEnabled", arg1_203);
                        return; 
                    end
                });
                v8 = r160;
                v8.AddButton(v8, {
                    ["Text"] = "Random Beam Colors",
                    ["Func"] = function(...)
                        r187("updateBeamColors");
                        return; 
                    end
                });
                v8 = r160;
                v8.AddToggle(v8, "MergedBeamCycleToggle", {
                    ["Text"] = "Beam Color Cycle",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_204, ...)
                        r187("setBeamCycleEnabled", arg1_204);
                        return; 
                    end
                });
                v8 = r172;
                v8.AddToggle(v8, "MergedGrabEverythingToggle", {
                    ["Text"] = "Grab Everything",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_205, ...)
                        r187("setGrabEverythingEnabled", arg1_205);
                        return; 
                    end
                });
                v8 = r172;
                v8.AddSlider(v8, "MergedGrabEverythingSpeed", {
                    ["Text"] = "Grab everything speed",
                    ["Default"] = .1,
                    ["Min"] = .01,
                    ["Max"] = 10,
                    ["Rounding"] = 2,
                    ["Callback"] = function(arg1_206, ...)
                        r187("setGrabEverythingSpeed", arg1_206);
                        return; 
                    end
                });
                v8 = r172;
                v8.AddButton(v8, {
                    ["Text"] = "Grab My Toys",
                    ["Func"] = function(...)
                        v3 = game;
                        r187("grabAllToys", v3.GetService(v3, "Players").LocalPlayer);
                        return; 
                    end
                });
                v8 = r172;
                v8.AddToggle(v8, "MergedGrabMyToysLoopToggle", {
                    ["Text"] = "Loop Grab My Toys",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_207, ...)
                        r187("setGrabAllToysLoopEnabled", arg1_207);
                        return; 
                    end
                });
                v8 = r172;
                v8.AddButton(v8, {
                    ["Text"] = "Grab And Move Toys",
                    ["Func"] = function(...)
                        r187("grabAndMoveToys");
                        return; 
                    end
                });
                v8 = r172;
                v8.AddButton(v8, {
                    ["Text"] = "Clear Toy Forces",
                    ["Func"] = function(...)
                        r187("clearEffects");
                        return; 
                    end
                });
                v8 = r172;
                v8.AddButton(v8, {
                    ["Text"] = "Spawn Banana",
                    ["Func"] = function(...)
                        r187("spawnBanana");
                        return; 
                    end
                });
                v8 = r172;
                v8.AddButton(v8, {
                    ["Text"] = "Hold Banana",
                    ["Func"] = function(...)
                        r187("holdBanana");
                        return; 
                    end
                });
                v8 = r172;
                v8.AddButton(v8, {
                    ["Text"] = "Use Banana",
                    ["Func"] = function(...)
                        r187("useBanana");
                        return; 
                    end
                });
                v8 = r170;
                v8.AddButton(v8, {
                    ["Text"] = "Drop Random Player",
                    ["Func"] = function(...)
                        r187("grabAndDropRandomPlayer");
                        return; 
                    end
                });
                v8 = r170;
                v8.AddToggle(v8, "MergedBlobDropLoopToggle", {
                    ["Text"] = "Drop Loop",
                    ["Default"] = false,
                    ["Callback"] = function(arg1_208, ...)
                        r187("setBlobDropLoopEnabled", arg1_208);
                        return; 
                    end
                });
                v8 = r174;
                v8.AddButton(v8, {
                    ["Text"] = "Enable World FX",
                    ["Func"] = function(...)
                        r187("enableGraphics");
                        return; 
                    end
                });
                v8 = r174;
                v8.AddButton(v8, {
                    ["Text"] = "Disable World FX",
                    ["Func"] = function(...)
                        r187("disableGraphics");
                        return; 
                    end
                });
                return; 
            end)
        };
        if not pcall(function(...)
            v8 = r156;
            v8.AddLabel(v8, "Combat actions are added on the groupbox in Obsidian.", true);
            v8 = r156;
            v8.AddLabel(v8, "Further Reach has been moved into Allun and reapplies on respawn.", true);
            v8 = r156;
            v8.AddToggle(v8, "FurtherReachToggle", {
                ["Text"] = "Further Reach",
                ["Default"] = false,
                ["Callback"] = function(arg1_209, ...)
                    v1 = arg1_209;
                    if not r23.setFurtherReachEnabled(v1) and v1 then
                        task.defer(function(...)
                            v8 = r155.Options.FurtherReachToggle;
                            v8.SetValue(v8, false);
                            return; 
                        end);
                    end;
                    return; 
                end
            });
            v8 = r156;
            v8.AddButton(v8, {
                ["Text"] = "Reapply Further Reach",
                ["Func"] = function(...)
                    G = {
                        r23.reapplyFurtherReach()
                    };
                    v1 = G[2];
                    if not r23.reapplyFurtherReach() and v1 ~= "disabled" then
                        warn("Further Reach reapply failed: " .. tostring(v1));
                    end;
                    return; 
                end
            });
            v8 = r156;
            v8.AddToggle(v8, "FireGrabToggle", {
                ["Text"] = "Fire Grab",
                ["Default"] = false,
                ["Callback"] = function(arg1_210, ...)
                    G = r23.state;
                    if arg1_210 then
                        G.fireGrabCoroutine = coroutine.create(r23.fireGrab);
                        coroutine.resume(G.fireGrabCoroutine);
                    else
                        if G.fireGrabCoroutine then
                            coroutine.close(G.fireGrabCoroutine);
                            G.fireGrabCoroutine = nil;
                        end;
                        return;
                    end; 
                end
            });
            v8 = r156;
            v8.AddToggle(v8, "NoclipGrabToggle", {
                ["Text"] = "No-clip Grab",
                ["Default"] = false,
                ["Callback"] = function(arg1_211, ...)
                    G = r23.state;
                    if arg1_211 then
                        G.noclipGrabCoroutine = coroutine.create(r23.noclipGrab);
                        coroutine.resume(G.noclipGrabCoroutine);
                    else
                        if G.noclipGrabCoroutine then
                            coroutine.close(G.noclipGrabCoroutine);
                            G.noclipGrabCoroutine = nil;
                        end;
                        return;
                    end; 
                end
            });
            v8 = r158;
            v8.AddLabel(v8, "Extra defense, anti-barrier, notifications and safety tools.", true);
            v8 = r158;
            v8.AddButton(v8, {
                ["Text"] = "Refresh lists",
                ["Func"] = function(...)
                    r23.updatePlayerList();
                    r175.refreshRegisteredDropdowns();
                    r175.refreshTeleportLocations();
                    r175.refreshToyDropdowns();
                    return; 
                end
            });
            v8 = r158;
            v8.AddToggle(v8, "CompatAntiFireToggle", {
                ["Text"] = "Anti Fire",
                ["Default"] = false,
                ["Callback"] = function(arg1_212, ...)
                    v1 = arg1_212;
                    r175.state.anti.AntiFire = v1;
                    if v1 then
                        r182(function(...)
                            return r175.state.anti.AntiFire; 
                        end, r175.antiFireStep, .1);
                    else
                        r175.resetAntiFire();
                    end;
                    return; 
                end
            });
            v8 = r158;
            v8.AddToggle(v8, "CompatAntiBarrierToggle", {
                ["Text"] = "Anti Barrier",
                ["Default"] = false,
                ["Callback"] = function(arg1_213, ...)
                    v1 = arg1_213;
                    r175.state.anti.AntiBarrier = v1;
                    if v1 then
                        r182(function(...)
                            return r175.state.anti.AntiBarrier; 
                        end, r175.applyAntiBarrier, 1);
                    else
                        r175.restoreAntiBarrier();
                    end;
                    return; 
                end
            });
            v8 = r158;
            v8.AddButton(v8, {
                ["Text"] = "Destroy Void",
                ["Func"] = function(...)
                    workspace.FallenPartsDestroyHeight = -1e+95;
                    r175.notify("Defense", "Void height destroyed.", 4);
                    return; 
                end
            });
            v8 = r158;
            v8.AddToggle(v8, "CompatLeaveNotifyToggle", {
                ["Text"] = "Player Leave Notify",
                ["Default"] = false,
                ["Callback"] = function(arg1_214, ...)
                    r175.state.random.LeaveNotify = arg1_214;
                    return; 
                end
            });
            v8 = r160;
            v8.AddLabel(v8, "Aura controls should also be added through a groupbox.", true);
            v8 = r164;
            v8.AddLabel(v8, "Local visuals: Chinese hat and trail.", true);
            v8 = r164;
            v1 = v8.AddToggle(v8, "VisualHatToggle", {
                ["Text"] = "Enable Chinese Hat",
                ["Default"] = false,
                ["Callback"] = function(arg1_215, ...)
                    v1 = arg1_215;
                    r176.HatEnabled = v1;
                    if v1 then
                        p = game.Players.LocalPlayer.Character;
                    end;
                    if v1 then
                        r176.addHat(game.Players.LocalPlayer.Character);
                    else
                        if game.Players.LocalPlayer.Character then
                            r176.removeHat(game.Players.LocalPlayer.Character);
                        end;
                        return;
                    end; 
                end
            });
            v1.AddColorPicker(v1, "VisualHatColor", {
                ["Default"] = r176.HatColor,
                ["Title"] = "Hat Color",
                ["Callback"] = function(arg1_216, ...)
                    r176.HatColor = arg1_216;
                    return; 
                end
            });
            v8 = r164;
            v8.AddToggle(v8, "VisualHatRainbowToggle", {
                ["Text"] = "Rainbow Hat",
                ["Default"] = false,
                ["Callback"] = function(arg1_217, ...)
                    r176.HatRainbow = arg1_217;
                    return; 
                end
            });
            v8 = r164;
            v8.AddSlider(v8, "VisualHatTransparency", {
                ["Text"] = "Hat transparency",
                ["Default"] = r176.HatTransparency,
                ["Min"] = 0,
                ["Max"] = 1,
                ["Rounding"] = 2,
                ["Callback"] = function(arg1_218, ...)
                    r176.HatTransparency = arg1_218;
                    return; 
                end
            });
            v8 = r164;
            G = v8.AddToggle(v8, "VisualTrailToggle", {
                ["Text"] = "Enable Trail",
                ["Default"] = false,
                ["Callback"] = function(arg1_219, ...)
                    v1 = arg1_219;
                    r176.TrailEnabled = v1;
                    if v1 then
                        p = game.Players.LocalPlayer.Character;
                    end;
                    if v1 then
                        r176.addTrail(game.Players.LocalPlayer.Character);
                    else
                        if game.Players.LocalPlayer.Character then
                            r176.removeTrail(game.Players.LocalPlayer.Character);
                        end;
                        return;
                    end; 
                end
            });
            G.AddColorPicker(G, "VisualTrailColor", {
                ["Default"] = r176.TrailColorStatic,
                ["Title"] = "Trail Color",
                ["Callback"] = function(arg1_220, ...)
                    r176.TrailColorStatic = arg1_220;
                    return; 
                end
            });
            v8 = r164;
            v3 = v8.AddToggle(v8, "VisualTrailGradientToggle", {
                ["Text"] = "Use Gradient Mode",
                ["Default"] = false,
                ["Callback"] = function(arg1_221, ...)
                    G = arg1_221;
                    r176.TrailGradient = G;
                    if r176.TrailEnabled and game.Players.LocalPlayer.Character then
                        r176.addTrail(game.Players.LocalPlayer.Character);
                    end;
                    return; 
                end
            });
            v3.AddColorPicker(v3, "VisualTrailGradient1", {
                ["Default"] = r176.TrailGradient1,
                ["Title"] = "Gradient Color 1",
                ["Callback"] = function(arg1_222, ...)
                    r176.TrailGradient1 = arg1_222;
                    return; 
                end
            });
            v3.AddColorPicker(v3, "VisualTrailGradient2", {
                ["Default"] = r176.TrailGradient2,
                ["Title"] = "Gradient Color 2",
                ["Callback"] = function(arg1_223, ...)
                    r176.TrailGradient2 = arg1_223;
                    return; 
                end
            });
            v8 = r164;
            v8.AddToggle(v8, "VisualTrailRainbowToggle", {
                ["Text"] = "Trail Rainbow",
                ["Default"] = false,
                ["Callback"] = function(arg1_224, ...)
                    r176.TrailRainbow = arg1_224;
                    return; 
                end
            });
            v8 = r164;
            v8.AddSlider(v8, "VisualTrailLifetime", {
                ["Text"] = "Trail lifetime",
                ["Default"] = r176.TrailLifetime,
                ["Min"] = .1,
                ["Max"] = 3,
                ["Rounding"] = 1,
                ["Callback"] = function(arg1_225, ...)
                    r176.TrailLifetime = arg1_225;
                    return; 
                end
            });
            v8 = r164;
            v8.AddSlider(v8, "VisualTrailTransparency", {
                ["Text"] = "Trail transparency",
                ["Default"] = r176.TrailTransparencyStart,
                ["Min"] = 0,
                ["Max"] = 1,
                ["Rounding"] = 2,
                ["Callback"] = function(arg1_226, ...)
                    r176.TrailTransparencyStart = arg1_226;
                    return; 
                end
            });
            v8 = r165;
            v8.AddLabel(v8, "ForceField skin, skin trail and aura models.", true);
            v8 = r165;
            z = v8.AddToggle(v8, "VisualForceFieldToggle", {
                ["Text"] = "Enable ForceField",
                ["Default"] = false,
                ["Callback"] = function(arg1_227, ...)
                    v1 = arg1_227;
                    G = arg1_227;
                    r176.ForceFieldEnabled = G;
                    G = game.Players.LocalPlayer.Character;
                    if G then
                        if v1 then
                            r176.applyForceField(v8);
                        else
                            r176.removeForceField(v8);
                        end;
                    end;
                    return; 
                end
            });
            z.AddColorPicker(z, "VisualForceFieldColor", {
                ["Default"] = r176.ForceFieldColor,
                ["Title"] = "ForceField Color",
                ["Callback"] = function(arg1_228, ...)
                    G = arg1_228;
                    r176.ForceFieldColor = G;
                    if r176.ForceFieldEnabled and (game.Players.LocalPlayer.Character and not r176.ForceFieldRainbow) then
                        r176.applyForceField(game.Players.LocalPlayer.Character);
                    end;
                    return; 
                end
            });
            v8 = r165;
            v8.AddToggle(v8, "VisualForceFieldRainbowToggle", {
                ["Text"] = "Rainbow ForceField",
                ["Default"] = false,
                ["Callback"] = function(arg1_229, ...)
                    r176.ForceFieldRainbow = arg1_229;
                    return; 
                end
            });
            v8 = r165;
            v2 = v8.AddToggle(v8, "VisualSkinTrailToggle", {
                ["Text"] = "Enable Skin Trail",
                ["Default"] = false,
                ["Callback"] = function(arg1_230, ...)
                    v1 = arg1_230;
                    G = arg1_230;
                    r176.SkinTrailEnabled = G;
                    r176.toggleSkinTrail(v1);
                    return; 
                end
            });
            v2.AddColorPicker(v2, "VisualSkinTrailColor", {
                ["Default"] = r176.SkinTrailColor,
                ["Title"] = "Skin Trail Color",
                ["Callback"] = function(arg1_231, ...)
                    G = arg1_231;
                    r176.SkinTrailColor = G;
                    if r176.SkinTrailEnabled then
                        r176.updateSkinTrail();
                    end;
                    return; 
                end
            });
            v8 = r165;
            v8.AddSlider(v8, "VisualSkinTrailLife", {
                ["Text"] = "Skin trail life",
                ["Default"] = r176.SkinTrailLife,
                ["Min"] = .1,
                ["Max"] = 3,
                ["Rounding"] = 1,
                ["Callback"] = function(arg1_232, ...)
                    G = arg1_232;
                    r176.SkinTrailLife = G;
                    if r176.SkinTrailEnabled then
                        r176.updateSkinTrail();
                    end;
                    return; 
                end
            });
            v8 = r165;
            v8.AddToggle(v8, "VisualAuraToggle", {
                ["Text"] = "Enable Local Aura",
                ["Default"] = false,
                ["Callback"] = function(arg1_233, ...)
                    v1 = arg1_233;
                    r176.AuraEnabled = v1;
                    if v1 then
                        if not r176.CurrentAuraModel then
                            r176.updateAuraLogic();
                        end;
                        if game.Players.LocalPlayer.Character then
                            r176.enableAura(game.Players.LocalPlayer.Character);
                        end;
                    else
                        r176.disableAura();
                    end;
                    return; 
                end
            });
            v4 = {};
            L = {
                pairs(r176.AuraModels)
            };
            N = pairs(r176.AuraModels);
            v6 = N(L[2], L[3]);
            while v6 do
                L = v6;
                table.insert(v4, L); 
            end;
            table.sort(v4);
            v8 = r165;
            v8.AddDropdown(v8, "VisualAuraTypeDropdown", {
                ["Text"] = "Aura Type",
                ["Values"] = v4,
                ["Default"] = r176.AuraType,
                ["Multi"] = false,
                ["Callback"] = function(arg1_234, ...)
                    G = arg1_234;
                    r176.AuraType = G;
                    r176.CustomAuraID = "";
                    if r176.AuraEnabled then
                        r176.updateAuraLogic();
                    end;
                    return; 
                end
            });
            v8 = r165;
            v8.AddInput(v8, "VisualCustomAuraInput", {
                ["Text"] = "Custom Aura ID",
                ["Default"] = "",
                ["Placeholder"] = "Asset ID",
                ["Callback"] = function(arg1_235, ...)
                    r176.CustomAuraID = r180(arg1_235);
                    if r176.AuraEnabled and r176.CustomAuraID ~= "" then
                        r176.updateAuraLogic();
                    end;
                    return; 
                end
            });
            v8 = r166;
            v8.AddLabel(v8, "Skyboxes, nebula theme and lighting.", true);
            k = {};
            n = {
                pairs(r176.SkyboxAssets)
            };
            L = pairs(r176.SkyboxAssets)(n[2], n[3]);
            while L do
                o = v6(N, n[3]);
                table.insert(k, o); 
            end;
            table.sort(k);
            v8 = r166;
            v8.AddDropdown(v8, "VisualSkyboxDropdown", {
                ["Text"] = "Select Skybox",
                ["Values"] = k,
                ["Default"] = r176.CurrentSkybox,
                ["Multi"] = false,
                ["Callback"] = function(arg1_236, ...)
                    v1 = arg1_236;
                    G = arg1_236;
                    r176.CurrentSkybox = G;
                    if not r176.CustomSkyEnabled then
                        r176.CustomSkyEnabled = true;
                    end;
                    r176.applySkybox(v1);
                    return; 
                end
            });
            v8 = r166;
            v8.AddToggle(v8, "VisualSkyboxToggle", {
                ["Text"] = "Enable Custom Skybox",
                ["Default"] = false,
                ["Callback"] = function(arg1_237, ...)
                    v1 = arg1_237;
                    r176.CustomSkyEnabled = v1;
                    if v1 then
                        r176.applySkybox(r176.CurrentSkybox);
                    else
                        r176.restoreDefaultSky();
                    end;
                    return; 
                end
            });
            v8 = r166;
            v6 = v8.AddToggle(v8, "VisualNebulaToggle", {
                ["Text"] = "Nebula Theme",
                ["Default"] = false,
                ["Callback"] = function(arg1_238, ...)
                    r176.setNebulaEnabled(arg1_238);
                    return; 
                end
            });
            v6.AddColorPicker(v6, "VisualNebulaColor", {
                ["Default"] = r176.NebulaThemeColor,
                ["Title"] = "Nebula Color",
                ["Callback"] = function(arg1_239, ...)
                    G = arg1_239;
                    r176.NebulaThemeColor = G;
                    if r176.NebulaEnabled then
                        r176.setNebulaEnabled(false);
                        r176.setNebulaEnabled(true);
                    end;
                    return; 
                end
            });
            v8 = r166;
            v8.AddToggle(v8, "VisualTimeToggle", {
                ["Text"] = "Enable Time Changer",
                ["Default"] = false,
                ["Callback"] = function(arg1_240, ...)
                    r176.WorldTimeEnabled = arg1_240;
                    return; 
                end
            });
            v8 = r166;
            v8.AddSlider(v8, "VisualTimeValue", {
                ["Text"] = "Time (0-24)",
                ["Default"] = r176.WorldTimeValue,
                ["Min"] = 0,
                ["Max"] = 24,
                ["Rounding"] = 1,
                ["Callback"] = function(arg1_241, ...)
                    r176.WorldTimeValue = arg1_241;
                    return; 
                end
            });
            v8 = r166;
            v8.AddToggle(v8, "VisualFullBrightToggle", {
                ["Text"] = "Full Bright",
                ["Default"] = false,
                ["Callback"] = function(arg1_242, ...)
                    r176.setFullBrightEnabled(arg1_242);
                    return; 
                end
            });
            v8 = r167;
            v8.AddLabel(v8, "Camera stretch, anime image and quick counters.", true);
            v8 = r167;
            v8.AddToggle(v8, "VisualScreenToggle", {
                ["Text"] = "Enable Screen Effect",
                ["Default"] = false,
                ["Callback"] = function(arg1_243, ...)
                    r176.setScreenEnabled(arg1_243);
                    return; 
                end
            });
            v8 = r167;
            v8.AddSlider(v8, "VisualScreenIntensity", {
                ["Text"] = "Screen Stretch",
                ["Default"] = r176.ScreenIntensity,
                ["Min"] = 0,
                ["Max"] = .2,
                ["Rounding"] = 3,
                ["Callback"] = function(arg1_244, ...)
                    r176.ScreenIntensity = arg1_244;
                    return; 
                end
            });
            v8 = r167;
            v8.AddToggle(v8, "VisualAnimeImageToggle", {
                ["Text"] = "Anime Image",
                ["Default"] = false,
                ["Callback"] = function(arg1_245, ...)
                    r176.toggleAnimeImage(arg1_245);
                    return; 
                end
            });
            v8 = r167;
            v8.AddButton(v8, {
                ["Text"] = "Activate FPS/Ping Counter",
                ["Func"] = function(...)
                    if not r176.FpsPingEnabled then
                        v1 = game;
                        loadstring(v1.HttpGet(v1, "https://raw.githubusercontent.com/GLAMOHGA/fling/refs/heads/main/%D1%85%D0%B7%20%D0%BA%D0%B0%D0%BA%20%D0%BD%D0%B0%D0%B7%D0%B2%D0%B0%D1%82%D1%8C%20%D1%82%D0%B8%D0%BF%D0%BE%20%D1%84%D0%BF%D1%81%20%D0%B8%20%D0%BF%D0%B8%D0%BD%D0%B3.md"))();
                        r176.FpsPingEnabled = true;
                    end;
                    return; 
                end
            });
            v8 = r167;
            v8.AddButton(v8, {
                ["Text"] = "Activate FPS/Ping Counter 2",
                ["Func"] = function(...)
                    if not r176.FpsPingEnabled2 then
                        v1 = game;
                        loadstring(v1.HttpGet(v1, "https://raw.githubusercontent.com/VetrexTheBest/Fps-ping/refs/heads/main/fps%2Bping.txt"))();
                        r176.FpsPingEnabled2 = true;
                    end;
                    return; 
                end
            });
            v8 = r162;
            v8.AddSlider(v8, "CrouchSpeedValue", {
                ["Text"] = "Crouch speed",
                ["Default"] = r23.state.crouchWalkSpeed,
                ["Min"] = 6,
                ["Max"] = 100,
                ["Rounding"] = 0,
                ["Callback"] = function(arg1_246, ...)
                    r23.state.crouchWalkSpeed = arg1_246;
                    return; 
                end
            });
            v8 = r162;
            v8.AddToggle(v8, "CompatSecondPersonToggle", {
                ["Text"] = "Second Person Camera",
                ["Default"] = false,
                ["Callback"] = function(arg1_247, ...)
                    r175.setSecondPersonEnabled(arg1_247);
                    return; 
                end
            });
            v8 = r163;
            v8.AddToggle(v8, "CompatWalkspeedToggle", {
                ["Text"] = "Walkspeed",
                ["Default"] = false,
                ["Callback"] = function(arg1_248, ...)
                    r175.state.movement.Walkspeed = arg1_248;
                    r175.walkspeedFunc();
                    return; 
                end
            });
            v8 = r163;
            v8.AddSlider(v8, "CompatWalkspeedValue", {
                ["Text"] = "Speed multiplier",
                ["Default"] = r175.state.movement.WalkspeedValue,
                ["Min"] = 1,
                ["Max"] = 5,
                ["Rounding"] = 1,
                ["Callback"] = function(arg1_249, ...)
                    r175.state.movement.WalkspeedValue = arg1_249;
                    return; 
                end
            });
            v8 = r163;
            v8.AddToggle(v8, "CompatInfiniteJumpToggle", {
                ["Text"] = "Infinite Jump",
                ["Default"] = false,
                ["Callback"] = function(arg1_250, ...)
                    G = arg1_250;
                    r175.state.movement.InfiniteJump = G;
                    r175.infiniteJumpFunc();
                    return; 
                end
            });
            v8 = r163;
            v8.AddSlider(v8, "CompatJumpPowerValue", {
                ["Text"] = "Jump power",
                ["Default"] = r175.state.movement.InfiniteJumpPower,
                ["Min"] = 16,
                ["Max"] = 500,
                ["Rounding"] = 0,
                ["Callback"] = function(arg1_251, ...)
                    r175.state.movement.InfiniteJumpPower = arg1_251;
                    return; 
                end
            });
            v8 = r163;
            v8.AddToggle(v8, "CompatNoclipToggle", {
                ["Text"] = "Noclip",
                ["Default"] = false,
                ["Callback"] = function(arg1_252, ...)
                    G = arg1_252;
                    r175.state.movement.Noclip = G;
                    r175.noclipFunc();
                    return; 
                end
            });
            v8 = r159;
            v8.AddButton(v8, {
                ["Text"] = "Ragdoll All",
                ["Func"] = function(...)
                    r175.ragdollAllPlayers();
                    return; 
                end
            });
            v8 = r159;
            v8.AddToggle(v8, "CompatAntiGrabToggle", {
                ["Text"] = "Anti Grab",
                ["Default"] = false,
                ["Callback"] = function(arg1_253, ...)
                    v1 = arg1_253;
                    r175.state.anti.AntiGrab = v1;
                    if v1 then
                        r182(function(...)
                            return r175.state.anti.AntiGrab; 
                        end, r175.antiGrabStep, 0);
                    end;
                    return; 
                end
            });
            v8 = r159;
            v8.AddToggle(v8, "CompatAntiExplodeToggle", {
                ["Text"] = "Anti Explode",
                ["Default"] = false,
                ["Callback"] = function(arg1_254, ...)
                    r175.state.anti.AntiExplode = arg1_254;
                    return; 
                end
            });
            v8 = r159;
            v8.AddToggle(v8, "CompatAntiLagToggle", {
                ["Text"] = "Anti Lag",
                ["Default"] = false,
                ["Callback"] = function(arg1_255, ...)
                    r175.state.anti.AntiLag = arg1_255;
                    r175.antiLag();
                    return; 
                end
            });
            v8 = r159;
            v8.AddToggle(v8, "CompatAntiBlobmanToggle", {
                ["Text"] = "Anti Blobman",
                ["Default"] = false,
                ["Callback"] = function(arg1_256, ...)
                    v1 = arg1_256;
                    r175.state.anti.AntiBlobman = v1;
                    if v1 then
                        r182(function(...)
                            return r175.state.anti.AntiBlobman; 
                        end, function(...)
                            r175.removeDetectors();
                            r175.applyAntiMassless();
                            return; 
                        end, 1);
                    end;
                    return; 
                end
            });
            v8 = r157;
            r175.registerDropdown(v8.AddDropdown(v8, "CompatAttackPlayerDropdown", {
                ["Text"] = "Target player",
                ["Values"] = r175.getAllPlayers(false),
                ["Default"] = r175.state.attack.SelectedPlayer,
                ["Multi"] = false,
                ["Callback"] = function(arg1_257, ...)
                    r175.state.attack.SelectedPlayer = arg1_257;
                    return; 
                end
            }), false);
            v8 = r157;
            v8.AddButton(v8, {
                ["Text"] = "Add Target",
                ["Func"] = function(...)
                    v1 = r181(r175.state.attack.SelectedPlayer);
                    if v1 then
                        r175.state.attack.Targets[v1.Name] = true;
                    end;
                    return; 
                end
            });
            v8 = r157;
            v8.AddButton(v8, {
                ["Text"] = "Remove Target",
                ["Func"] = function(...)
                    v1 = r181(r175.state.attack.SelectedPlayer);
                    if v1 then
                        r175.state.attack.Targets[v1.Name] = nil;
                    end;
                    return; 
                end
            });
            v8 = r157;
            v8.AddButton(v8, {
                ["Text"] = "Clear Targets",
                ["Func"] = function(...)
                    table.clear(r175.state.attack.Targets);
                    return; 
                end
            });
            v8 = r157;
            v8.AddToggle(v8, "CompatLoopKickToggle", {
                ["Text"] = "Loop Kick",
                ["Default"] = false,
                ["Callback"] = function(arg1_258, ...)
                    v1 = arg1_258;
                    r175.state.attack.Kick.v1 = v1;
                    if v1 then
                        v8 = r178;
                        if v8 then
                            v8 = U[t[21]];
                            v8.Disconnect(v8);
                        end;
                        r178 = r175.loopCtrl(r175.state.attack.Kick, false);
                    else
                        if r178 then
                            r175.stopLoop(r178, r175.state.attack.Kick);
                        end;
                        return;
                    end; 
                end
            });
            v8 = r157;
            v8.AddToggle(v8, "CompatLoopKillToggle", {
                ["Text"] = "Loop Kill",
                ["Default"] = false,
                ["Callback"] = function(arg1_259, ...)
                    v1 = arg1_259;
                    r175.state.attack.Kill.v1 = v1;
                    if v1 then
                        v8 = r179;
                        if v8 then
                            v8 = U[t[22]];
                            v8.Disconnect(v8);
                        end;
                        r179 = r175.loopCtrl(r175.state.attack.Kill, true);
                    else
                        if r179 then
                            r175.stopLoop(r179, r175.state.attack.Kill);
                        end;
                        return;
                    end; 
                end
            });
            v8 = r161;
            v8.AddToggle(v8, "CompatStrengthToggle", {
                ["Text"] = "Grab Strength",
                ["Default"] = false,
                ["Callback"] = function(arg1_260, ...)
                    r175.toggleStrengthConnections(arg1_260);
                    return; 
                end
            });
            v8 = r161;
            v8.AddSlider(v8, "CompatStrengthValue", {
                ["Text"] = "Launch strength",
                ["Default"] = r175.state.strength.Strength,
                ["Min"] = 10,
                ["Max"] = 3000,
                ["Rounding"] = 0,
                ["Callback"] = function(arg1_261, ...)
                    r175.state.strength.Strength = arg1_261;
                    return; 
                end
            });
            v8 = r160;
            v8.AddSlider(v8, "CompatAuraRadiusValue", {
                ["Text"] = "Aura radius",
                ["Default"] = r175.state.aura.Radius,
                ["Min"] = 5,
                ["Max"] = 50,
                ["Rounding"] = 0,
                ["Callback"] = function(arg1_262, ...)
                    r175.state.aura.Radius = arg1_262;
                    return; 
                end
            });
            v8 = r160;
            v8.AddToggle(v8, "CompatLaunchAuraToggle", {
                ["Text"] = "Launch Aura",
                ["Default"] = false,
                ["Callback"] = function(arg1_263, ...)
                    if arg1_263 then
                        r175.startAirSuspendAura();
                    else
                        r175.stopAirSuspendAura();
                    end;
                    return; 
                end
            });
            v8 = r160;
            v8.AddToggle(v8, "CompatTelekinesisAuraToggle", {
                ["Text"] = "Telekinesis Aura",
                ["Default"] = false,
                ["Callback"] = function(arg1_264, ...)
                    if arg1_264 then
                        r175.startHellSendAura();
                    else
                        r175.stopHellSendAura();
                    end;
                    return; 
                end
            });
            v8 = r160;
            v8.AddToggle(v8, "CompatDeathAuraToggle", {
                ["Text"] = "Death Aura",
                ["Default"] = false,
                ["Callback"] = function(arg1_265, ...)
                    v1 = arg1_265;
                    r175.state.aura.DeathEnabled = v1;
                    if v1 then
                        r182(function(...)
                            return r175.state.aura.DeathEnabled; 
                        end, r175.deathAuraStep, 0);
                    end;
                    return; 
                end
            });
            v8 = r169;
            L = v8.AddDropdown(v8, "CompatSnowballPlayerDropdown", {
                ["Text"] = "Snowball target",
                ["Values"] = r175.getAllPlayers(false),
                ["Default"] = r175.state.snowball.TargetPlayer,
                ["Multi"] = false,
                ["Callback"] = function(arg1_266, ...)
                    r175.state.snowball.TargetPlayer = arg1_266;
                    return; 
                end
            });
            n = v8.AddDropdown(v8, "CompatSnowballPlayerDropdown", {
                ["Text"] = "Snowball target",
                ["Values"] = r175.getAllPlayers(false),
                ["Default"] = r175.state.snowball.TargetPlayer,
                ["Multi"] = false,
                ["Callback"] = function(arg1_266, ...)
                    r175.state.snowball.TargetPlayer = arg1_266;
                    return; 
                end
            });
            r175.state.snowball.Dropdown = n;
            r175.registerDropdown(L, false);
            v8 = r169;
            v8.AddToggle(v8, "CompatSnowballRagdollToggle", {
                ["Text"] = "Snowball Ragdoll",
                ["Default"] = false,
                ["Callback"] = function(arg1_267, ...)
                    v1 = arg1_267;
                    r175.state.snowball.TeleportEnabled = v1;
                    if v1 then
                        r182(function(...)
                            return r175.state.snowball.TeleportEnabled; 
                        end, r175.tpBallStep, .1);
                    end;
                    return; 
                end
            });
            v8 = r169;
            v8.AddToggle(v8, "CompatSnowballSpawnToggle", {
                ["Text"] = "Auto Spawn Snowballs",
                ["Default"] = false,
                ["Callback"] = function(arg1_268, ...)
                    v1 = arg1_268;
                    r175.state.snowball.SpawnEnabled = v1;
                    if v1 then
                        r182(function(...)
                            return r175.state.snowball.SpawnEnabled; 
                        end, r175.spawnBallsStep, 1);
                    end;
                    return; 
                end
            });
            v8 = r169;
            v8.AddToggle(v8, "CompatSnowballBlobToggle", {
                ["Text"] = "Auto Kick Blob",
                ["Default"] = false,
                ["Callback"] = function(arg1_269, ...)
                    v1 = arg1_269;
                    r175.state.snowball.AutoBlobEnabled = v1;
                    if v1 then
                        r182(function(...)
                            return r175.state.snowball.AutoBlobEnabled; 
                        end, function(...)
                            r175.autoBlobStep();
                            r175.tpSnowStep();
                            return; 
                        end, .1);
                    end;
                    return; 
                end
            });
            v8 = r170;
            r175.registerDropdown(v8.AddDropdown(v8, "CompatBlobmanPlayerDropdown", {
                ["Text"] = "Blobman player",
                ["Values"] = r175.getAllPlayers(false),
                ["Default"] = r175.state.blobman.SelectedPlayer,
                ["Multi"] = false,
                ["Callback"] = function(arg1_270, ...)
                    r175.state.blobman.SelectedPlayer = arg1_270;
                    return; 
                end
            }), false);
            v8 = r170;
            v8.AddButton(v8, {
                ["Text"] = "Add Blobman Target",
                ["Func"] = function(...)
                    r175.addBlobmanTarget(r175.state.blobman.SelectedPlayer);
                    return; 
                end
            });
            v8 = r170;
            v8.AddButton(v8, {
                ["Text"] = "Remove Blobman Target",
                ["Func"] = function(...)
                    r175.removeBlobmanTarget(r175.state.blobman.SelectedPlayer);
                    return; 
                end
            });
            v8 = r170;
            v8.AddToggle(v8, "CompatBlobmanKickToggle", {
                ["Text"] = "Blobman Target",
                ["Default"] = false,
                ["Callback"] = function(arg1_271, ...)
                    v1 = arg1_271;
                    r175.state.blobman.ToggleEnabled = v1;
                    if v1 then
                        r175.masterLoop();
                    end;
                    return; 
                end
            });
            v8 = r170;
            v8.AddToggle(v8, "CompatBlobmanGodLoopToggle", {
                ["Text"] = "God Loop Target",
                ["Default"] = false,
                ["Callback"] = function(arg1_272, ...)
                    v1 = arg1_272;
                    r175.state.blobman.GodLoopEnabled = v1;
                    if v1 then
                        r182(function(...)
                            return r175.state.blobman.GodLoopEnabled; 
                        end, r175.godLoopTargetStep, .01);
                    end;
                    return; 
                end
            });
            v8 = r170;
            v8.AddToggle(v8, "CompatBlobmanHoverToggle", {
                ["Text"] = "Hover Above Target",
                ["Default"] = false,
                ["Callback"] = function(arg1_273, ...)
                    v1 = arg1_273;
                    r175.state.blobman.HoverEnabled = v1;
                    if v1 then
                        r182(function(...)
                            return r175.state.blobman.HoverEnabled; 
                        end, r175.hoverFollowTargetStep, .06);
                    end;
                    return; 
                end
            });
            v8 = r170;
            v8.AddSlider(v8, "CompatBlobmanHoverHeight", {
                ["Text"] = "Hover height",
                ["Default"] = r175.state.blobman.HoverHeight,
                ["Min"] = 5,
                ["Max"] = 100,
                ["Rounding"] = 0,
                ["Callback"] = function(arg1_274, ...)
                    r175.state.blobman.HoverHeight = arg1_274;
                    return; 
                end
            });
            v8 = r168;
            v8.AddDropdown(v8, "ToyToLoadDropdown", {
                ["Text"] = "Toy to load",
                ["Values"] = {
                    "BombMissile",
                    "FireworkMissile"
                },
                ["Default"] = _G.ToyToLoad,
                ["Multi"] = false,
                ["Callback"] = function(arg1_275, ...)
                    _G.ToyToLoad = arg1_275;
                    return; 
                end
            });
            v8 = r168;
            v8.AddSlider(v8, "MaxMissilesValue", {
                ["Text"] = "Max missiles",
                ["Default"] = _G.MaxMissiles,
                ["Min"] = 1,
                ["Max"] = 20,
                ["Rounding"] = 0,
                ["Callback"] = function(arg1_276, ...)
                    _G.MaxMissiles = arg1_276;
                    return; 
                end
            });
            v8 = r168;
            v8.AddToggle(v8, "AutoReloadMissiles", {
                ["Text"] = "Auto Reload Cache",
                ["Default"] = false,
                ["Callback"] = function(arg1_277, ...)
                    r23.reloadMissile(arg1_277);
                    return; 
                end
            });
            v8 = r171;
            r175.registerDropdown(v8.AddDropdown(v8, "CompatTeleportPlayerDropdown", {
                ["Text"] = "Teleport target",
                ["Values"] = r175.getAllPlayers(false),
                ["Default"] = r175.state.teleport.SelectedPlayer,
                ["Multi"] = false,
                ["Callback"] = function(arg1_278, ...)
                    r175.state.teleport.SelectedPlayer = arg1_278;
                    return; 
                end
            }), false);
            v8 = r171;
            v8.AddButton(v8, {
                ["Text"] = "Teleport to Player",
                ["Func"] = function(...)
                    r175.teleportToPlayer();
                    return; 
                end
            });
            v8 = r171;
            F = v8.AddDropdown(v8, "CompatTeleportLocationDropdown", {
                ["Text"] = "Teleport place",
                ["Values"] = r175.refreshTeleportLocations(),
                ["Default"] = r175.state.teleport.SelectedLocation,
                ["Multi"] = false,
                ["Callback"] = function(arg1_279, ...)
                    r175.state.teleport.SelectedLocation = arg1_279;
                    return; 
                end
            });
            r175.state.teleport.LocationDropdown = F;
            r175.refreshTeleportLocations();
            v8 = r171;
            v8.AddButton(v8, {
                ["Text"] = "Refresh places",
                ["Func"] = function(...)
                    r175.refreshTeleportLocations();
                    return; 
                end
            });
            v8 = r171;
            v8.AddButton(v8, {
                ["Text"] = "Teleport to Place",
                ["Func"] = function(...)
                    r175.teleportToLocation();
                    return; 
                end
            });
            v8 = r171;
            v8.AddToggle(v8, "CompatLoopTeleportToggle", {
                ["Text"] = "Loop Teleport",
                ["Default"] = false,
                ["Callback"] = function(arg1_280, ...)
                    if arg1_280 then
                        r175.startLoopTeleport();
                    else
                        r175.stopLoopTeleport();
                    end;
                    return; 
                end
            });
            v8 = r172;
            v8.AddToggle(v8, "CompatLagToggle", {
                ["Text"] = "Lag",
                ["Default"] = false,
                ["Callback"] = function(arg1_281, ...)
                    v1 = arg1_281;
                    r175.state.random.LagEnabled = v1;
                    if v1 then
                        r182(function(...)
                            return r175.state.random.LagEnabled; 
                        end, r175.lagStep, 1);
                    end;
                    return; 
                end
            });
            v8 = r172;
            v8.AddSlider(v8, "CompatLagIntensityValue", {
                ["Text"] = "Lag intensity",
                ["Default"] = r175.state.random.LagIntensity,
                ["Min"] = 1,
                ["Max"] = 1000,
                ["Rounding"] = 0,
                ["Callback"] = function(arg1_282, ...)
                    r175.state.random.LagIntensity = arg1_282;
                    return; 
                end
            });
            v8 = r172;
            S = v8.AddDropdown(v8, "CompatToyDropdown", {
                ["Text"] = "Toy control",
                ["Values"] = r175.getOwnedToyNames(),
                ["Default"] = r175.state.toys.SelectedToy,
                ["Multi"] = false,
                ["Callback"] = function(arg1_283, ...)
                    r175.state.toys.SelectedToy = arg1_283;
                    return; 
                end
            });
            r175.state.toys.ToyDropdown = S;
            v8 = r172;
            v8.AddDropdown(v8, "CompatToyAttachModeDropdown", {
                ["Text"] = "Toy mode",
                ["Values"] = {
                    "Front",
                    "Back",
                    "Left Wing",
                    "Right Wing",
                    "Orbit"
                },
                ["Default"] = r175.state.toys.AttachMode,
                ["Multi"] = false,
                ["Callback"] = function(arg1_284, ...)
                    r175.state.toys.AttachMode = arg1_284;
                    return; 
                end
            });
            v8 = r172;
            v8.AddSlider(v8, "CompatToyDistanceValue", {
                ["Text"] = "Toy distance",
                ["Default"] = r175.state.toys.AttachDistance,
                ["Min"] = 2,
                ["Max"] = 20,
                ["Rounding"] = 0,
                ["Callback"] = function(arg1_285, ...)
                    r175.state.toys.AttachDistance = arg1_285;
                    return; 
                end
            });
            v8 = r172;
            v8.AddSlider(v8, "CompatToyHeightValue", {
                ["Text"] = "Toy height",
                ["Default"] = r175.state.toys.AttachHeight,
                ["Min"] = -8,
                ["Max"] = 12,
                ["Rounding"] = 0,
                ["Callback"] = function(arg1_286, ...)
                    r175.state.toys.AttachHeight = arg1_286;
                    return; 
                end
            });
            v8 = r172;
            v8.AddSlider(v8, "CompatToySpinValue", {
                ["Text"] = "Toy orbit speed",
                ["Default"] = r175.state.toys.AttachSpin,
                ["Min"] = 1,
                ["Max"] = 12,
                ["Rounding"] = 1,
                ["Callback"] = function(arg1_287, ...)
                    r175.state.toys.AttachSpin = arg1_287;
                    return; 
                end
            });
            v8 = r172;
            v8.AddButton(v8, {
                ["Text"] = "Refresh toys",
                ["Func"] = function(...)
                    r175.refreshToyDropdowns();
                    return; 
                end
            });
            v8 = r172;
            v8.AddButton(v8, {
                ["Text"] = "Spawn selected toy",
                ["Func"] = function(...)
                    r175.spawnSelectedToy();
                    return; 
                end
            });
            v8 = r172;
            v8.AddToggle(v8, "CompatToyTelekinesisToggle", {
                ["Text"] = "Toy Telekinesis",
                ["Default"] = false,
                ["Callback"] = function(arg1_288, ...)
                    v1 = arg1_288;
                    r175.state.toys.AttachEnabled = v1;
                    if v1 then
                        r182(function(...)
                            return r175.state.toys.AttachEnabled; 
                        end, r175.toyTelekinesisStep, 0);
                    else
                        r175.clearToyBodyMovers();
                    end;
                    return; 
                end
            });
            v8 = r172;
            q = v8.AddDropdown(v8, "CompatBoardToyDropdown", {
                ["Text"] = "Board toy",
                ["Values"] = r175.getOwnedToyNames("board"),
                ["Default"] = r175.state.toys.BoardToy,
                ["Multi"] = false,
                ["Callback"] = function(arg1_289, ...)
                    r175.state.toys.BoardToy = arg1_289;
                    return; 
                end
            });
            r175.state.toys.BoardDropdown = q;
            r175.refreshToyDropdowns();
            v8 = r172;
            v8.AddDropdown(v8, "CompatBoardKeyDropdown", {
                ["Text"] = "Board key",
                ["Values"] = {
                    "B",
                    "V",
                    "C",
                    "X",
                    "Z",
                    "T",
                    "R",
                    "G",
                    "F",
                    "Q"
                },
                ["Default"] = r175.state.toys.BoardKey,
                ["Multi"] = false,
                ["Callback"] = function(arg1_290, ...)
                    r175.state.toys.BoardKey = arg1_290;
                    return; 
                end
            });
            v8 = r172;
            v8.AddButton(v8, {
                ["Text"] = "Spawn Board",
                ["Func"] = function(...)
                    r175.spawnBoard();
                    return; 
                end
            });
            v8 = r172;
            v8.AddToggle(v8, "CompatBoardBindToggle", {
                ["Text"] = "Board on Key",
                ["Default"] = false,
                ["Callback"] = function(arg1_291, ...)
                    r175.state.toys.BoardBindEnabled = arg1_291;
                    r175.ensureBoardConnection();
                    return; 
                end
            });
            v8 = r173;
            v8.AddToggle(v8, "CompatBringAllToggle", {
                ["Text"] = "Bring All",
                ["Default"] = false,
                ["Callback"] = function(arg1_292, ...)
                    if arg1_292 then
                        r175.startBringAll();
                    else
                        r175.stopBringAll();
                    end;
                    return; 
                end
            });
            v8 = r173;
            v8.AddToggle(v8, "CompatBringFriendsToggle", {
                ["Text"] = "Whitelist Friends",
                ["Default"] = false,
                ["Callback"] = function(arg1_293, ...)
                    r175.state.random.BringAllFriends = arg1_293;
                    return; 
                end
            });
            v8 = r173;
            v8.AddSlider(v8, "CompatBringRadiusValue", {
                ["Text"] = "Bring radius",
                ["Default"] = r175.state.random.BringRadius,
                ["Min"] = 5,
                ["Max"] = 50,
                ["Rounding"] = 0,
                ["Callback"] = function(arg1_294, ...)
                    r175.state.random.BringRadius = arg1_294;
                    return; 
                end
            });
            v8 = r173;
            v8.AddButton(v8, {
                ["Text"] = "Delete Held Player Limbs",
                ["Func"] = function(...)
                    r175.deleteHeldPlayerLimbs();
                    return; 
                end
            });
            v8 = r156;
            v8.AddToggle(v8, "MergedSilentAimToggle", {
                ["Text"] = "Silent Aim",
                ["Default"] = false,
                ["Callback"] = function(arg1_295, ...)
                    r187("setSilentAimEnabled", arg1_295);
                    return; 
                end
            });
            v8 = r156;
            v8.AddSlider(v8, "MergedSilentAimRange", {
                ["Text"] = "Silent aim range",
                ["Default"] = 30,
                ["Min"] = 5,
                ["Max"] = 200,
                ["Rounding"] = 0,
                ["Callback"] = function(arg1_296, ...)
                    r187("setSilentAimRange", arg1_296);
                    return; 
                end
            });
            v8 = r156;
            v8.AddButton(v8, {
                ["Text"] = "Create Grab Lines",
                ["Func"] = function(...)
                    r187("createGrabLineForAll");
                    return; 
                end
            });
            v8 = r156;
            v8.AddToggle(v8, "MergedGrabLineLagToggle", {
                ["Text"] = "Grab Line Lag",
                ["Default"] = false,
                ["Callback"] = function(arg1_297, ...)
                    r187("setGrabLineLagEnabled", arg1_297);
                    return; 
                end
            });
            v8 = r156;
            v8.AddSlider(v8, "MergedGrabLineLagSpeed", {
                ["Text"] = "Grab line speed",
                ["Default"] = 0.5,
                ["Min"] = .01,
                ["Max"] = 2,
                ["Rounding"] = 2,
                ["Callback"] = function(arg1_298, ...)
                    r187("setGrabLineSpeed", arg1_298);
                    return; 
                end
            });
            v8 = r156;
            v8.AddToggle(v8, "MergedLineAllToggle", {
                ["Text"] = "Line All Players",
                ["Default"] = false,
                ["Callback"] = function(arg1_299, ...)
                    r187("setLineAllEnabled", arg1_299);
                    return; 
                end
            });
            v8 = r156;
            v8.AddSlider(v8, "MergedLineAllDelay", {
                ["Text"] = "Line all delay",
                ["Default"] = 0.5,
                ["Min"] = .01,
                ["Max"] = 2,
                ["Rounding"] = 2,
                ["Callback"] = function(arg1_300, ...)
                    r187("setLineAllSpeed", arg1_300);
                    return; 
                end
            });
            v8 = r157;
            v8.AddButton(v8, {
                ["Text"] = "Grab Nearby Once",
                ["Func"] = function(...)
                    r187("grabNearbyPlayers");
                    return; 
                end
            });
            v8 = r157;
            v8.AddToggle(v8, "MergedNearbyGrabLoopToggle", {
                ["Text"] = "Auto Grab Nearby",
                ["Default"] = false,
                ["Callback"] = function(arg1_301, ...)
                    r187("setAutoGrabNearbyEnabled", arg1_301);
                    return; 
                end
            });
            v8 = r162;
            v8.AddToggle(v8, "MergedFireAnimationToggle", {
                ["Text"] = "Fire Flail Animation",
                ["Default"] = false,
                ["Callback"] = function(arg1_302, ...)
                    r187("setFireAnimationEnabled", arg1_302);
                    return; 
                end
            });
            v8 = r162;
            v8.AddToggle(v8, "MergedMouseTeleportToggle", {
                ["Text"] = "Mouse Teleport (Z)",
                ["Default"] = false,
                ["Callback"] = function(arg1_303, ...)
                    r187("setMouseTeleportEnabled", arg1_303);
                    return; 
                end
            });
            v8 = r162;
            v8.AddToggle(v8, "MergedVoidRescueToggle", {
                ["Text"] = "Void Rescue",
                ["Default"] = false,
                ["Callback"] = function(arg1_304, ...)
                    r187("setVoidRescueEnabled", arg1_304);
                    return; 
                end
            });
            v8 = r163;
            v8.AddToggle(v8, "MergedGhostNoclipToggle", {
                ["Text"] = "Ghost Noclip",
                ["Default"] = false,
                ["Callback"] = function(arg1_305, ...)
                    r187("setGhostNoclipEnabled", arg1_305);
                    return; 
                end
            });
            v8 = r159;
            v8.AddToggle(v8, "MergedAntiKickToggle", {
                ["Text"] = "Anti Kick",
                ["Default"] = false,
                ["Callback"] = function(arg1_306, ...)
                    r187("setAntiKickEnabled", arg1_306);
                    return; 
                end
            });
            v8 = r160;
            v8.AddButton(v8, {
                ["Text"] = "Random Beam Colors",
                ["Func"] = function(...)
                    r187("updateBeamColors");
                    return; 
                end
            });
            v8 = r160;
            v8.AddToggle(v8, "MergedBeamCycleToggle", {
                ["Text"] = "Beam Color Cycle",
                ["Default"] = false,
                ["Callback"] = function(arg1_307, ...)
                    r187("setBeamCycleEnabled", arg1_307);
                    return; 
                end
            });
            v8 = r172;
            v8.AddToggle(v8, "MergedGrabEverythingToggle", {
                ["Text"] = "Grab Everything",
                ["Default"] = false,
                ["Callback"] = function(arg1_308, ...)
                    r187("setGrabEverythingEnabled", arg1_308);
                    return; 
                end
            });
            v8 = r172;
            v8.AddSlider(v8, "MergedGrabEverythingSpeed", {
                ["Text"] = "Grab everything speed",
                ["Default"] = .1,
                ["Min"] = .01,
                ["Max"] = 10,
                ["Rounding"] = 2,
                ["Callback"] = function(arg1_309, ...)
                    r187("setGrabEverythingSpeed", arg1_309);
                    return; 
                end
            });
            v8 = r172;
            v8.AddButton(v8, {
                ["Text"] = "Grab My Toys",
                ["Func"] = function(...)
                    v3 = game;
                    r187("grabAllToys", v3.GetService(v3, "Players").LocalPlayer);
                    return; 
                end
            });
            v8 = r172;
            v8.AddToggle(v8, "MergedGrabMyToysLoopToggle", {
                ["Text"] = "Loop Grab My Toys",
                ["Default"] = false,
                ["Callback"] = function(arg1_310, ...)
                    r187("setGrabAllToysLoopEnabled", arg1_310);
                    return; 
                end
            });
            v8 = r172;
            v8.AddButton(v8, {
                ["Text"] = "Grab And Move Toys",
                ["Func"] = function(...)
                    r187("grabAndMoveToys");
                    return; 
                end
            });
            v8 = r172;
            v8.AddButton(v8, {
                ["Text"] = "Clear Toy Forces",
                ["Func"] = function(...)
                    r187("clearEffects");
                    return; 
                end
            });
            v8 = r172;
            v8.AddButton(v8, {
                ["Text"] = "Spawn Banana",
                ["Func"] = function(...)
                    r187("spawnBanana");
                    return; 
                end
            });
            v8 = r172;
            v8.AddButton(v8, {
                ["Text"] = "Hold Banana",
                ["Func"] = function(...)
                    r187("holdBanana");
                    return; 
                end
            });
            v8 = r172;
            v8.AddButton(v8, {
                ["Text"] = "Use Banana",
                ["Func"] = function(...)
                    r187("useBanana");
                    return; 
                end
            });
            v8 = r170;
            v8.AddButton(v8, {
                ["Text"] = "Drop Random Player",
                ["Func"] = function(...)
                    r187("grabAndDropRandomPlayer");
                    return; 
                end
            });
            v8 = r170;
            v8.AddToggle(v8, "MergedBlobDropLoopToggle", {
                ["Text"] = "Drop Loop",
                ["Default"] = false,
                ["Callback"] = function(arg1_311, ...)
                    r187("setBlobDropLoopEnabled", arg1_311);
                    return; 
                end
            });
            v8 = r174;
            v8.AddButton(v8, {
                ["Text"] = "Enable World FX",
                ["Func"] = function(...)
                    r187("enableGraphics");
                    return; 
                end
            });
            v8 = r174;
            v8.AddButton(v8, {
                ["Text"] = "Disable World FX",
                ["Func"] = function(...)
                    r187("disableGraphics");
                    return; 
                end
            });
            return; 
        end) then
            warn("Allun extras failed to load: " .. tostring(Pe[2]));
        end;
        local function r188(arg1_312, ...)
            v8 = math.clamp;
            v3 = v8;
            z = v8(tonumber(arg1_312) or 14, 0, 28);
            r155.CornerRadius = z;
            if typeof(r155.Corners) == "table" then
                for v2, k in pairs(r155.Corners) do
                    v4 = v2;
                    v8 = math.clamp;
                    if typeof(k) == "Instance" and k.IsA(k, "UICorner") then
                        k.CornerRadius = UDim.new(0, v8(tonumber(v1) or 14, 0, 28));
                    end; 
                end;
            end;
            return; 
        end;
        local function r189(arg1_313, ...)
            v1 = arg1_313;
            if v1 == "Slate" then
                r155.Scheme.BackgroundColor = Color3.fromRGB(16, 19, 25);
                r155.Scheme.MainColor = Color3.fromRGB(22, 26, 33);
                r155.Scheme.OutlineColor = Color3.fromRGB(27, 33, 42);
                r155.Scheme.AccentColor = Color3.fromRGB(137, 188, 232);
            else
                v8 = v1 == "Smoke";
                if v8 then
                    r155.Scheme.BackgroundColor = Color3.fromRGB(18, 20, 24);
                    r155.Scheme.MainColor = Color3.fromRGB(27, 30, 36);
                    r155.Scheme.OutlineColor = Color3.fromRGB(32, 36, 43);
                    r155.Scheme.AccentColor = Color3.fromRGB(158, 194, 223);
                else
                    if arg1_313 == "Night" then
                        r155.Scheme.BackgroundColor = Color3.fromRGB(13, 15, 20);
                        r155.Scheme.MainColor = Color3.fromRGB(18, 21, 28);
                        r155.Scheme.OutlineColor = Color3.fromRGB(24, 29, 37);
                        r155.Scheme.AccentColor = Color3.fromRGB(113, 163, 214);
                    end;
                    v8 = r155;
                    v8.UpdateColorsUsingRegistry(v8);
                    return;
                end;
            end; 
        end;
        Ae.AddDropdown(Ae, "SurfacePreset", {
            ["Text"] = "Palette",
            ["Values"] = {
                "Slate",
                "Smoke",
                "Night"
            },
            ["Default"] = v2,
            ["Callback"] = function(arg1_314, ...)
                r189(arg1_314);
                return; 
            end
        });
        Ae.AddSlider(Ae, "WindowRoundness", {
            ["Text"] = "Corner radius",
            ["Default"] = 14,
            ["Min"] = 4,
            ["Max"] = 24,
            ["Rounding"] = 0,
            ["Callback"] = function(arg1_315, ...)
                r188(arg1_315);
                return; 
            end
        });
        Ae.AddDropdown(Ae, "FontPreset", {
            ["Text"] = "Font",
            ["Values"] = {
                "Gotham",
                "BuilderSans",
                "SourceSans",
                "Roboto"
            },
            ["Default"] = "Gotham",
            ["Callback"] = function(arg1_316, ...)
                v8 = r155;
                v8.SetFont(v8, Enum.Font[arg1_316]);
                v8 = r155;
                v8.UpdateColorsUsingRegistry(v8);
                return; 
            end
        });
        k.ApplyToTab(k, L.Settings);
        Ue.AddSlider(Ue, "ManualCornerRadius", {
            ["Text"] = "Live corner control",
            ["Default"] = 14,
            ["Min"] = 4,
            ["Max"] = 24,
            ["Rounding"] = 0,
            ["Callback"] = function(arg1_317, ...)
                v8 = r188;
                v1 = arg1_317;
                v8(v1);
                if r155.Options.WindowRoundness and r155.Options.WindowRoundness.Value ~= v1 then
                    v8 = r155.Options.WindowRoundness;
                    v8.SetValue(v8, v1);
                end;
                return; 
            end
        });
        Ue.AddDropdown(Ue, "QuickPalette", {
            ["Text"] = "Quick palette",
            ["Values"] = {
                "Slate",
                "Smoke",
                "Night"
            },
            ["Default"] = v2,
            ["Callback"] = function(arg1_318, ...)
                v8 = r189;
                v1 = arg1_318;
                v8(v1);
                if r155.Options.SurfacePreset and r155.Options.SurfacePreset.Value ~= v1 then
                    v8 = r155.Options.SurfacePreset;
                    v8.SetValue(v8, v1);
                end;
                return; 
            end
        });
        r190 = "rbxassetid://72656457634929";
        r191 = "Style 1";
        r192 = {
            ["UserIcon"] = "rbxassetid://88517795223986",
            ["PlaceIcon"] = "rbxassetid://138047651582987",
            ["FpsIcon"] = "rbxassetid://108400895461990"
        };
        r193 = {
            ["BrandIcon"] = "rbxassetid://77856985540406",
            ["FpsIcon"] = "rbxassetid://112589113282360",
            ["PingIcon"] = "rbxassetid://129826901381657"
        };
        r194 = {
            ["RenderConnection"] = nil,
            ["InputConnection"] = nil,
            ["Gui"] = nil
        };
        local function r196(arg1_319, ...)
            v1 = arg1_319;
            G = r194[v1];
            if G then
                G.Disconnect(G);
                r194[v1] = nil;
            end;
            return; 
        end;
        local function r197(arg1_320, arg2_320, ...)
            v1 = arg1_320;
            v8 = tostring;
            v3 = v1;
            G = arg2_320;
            if v1 then
                v8 = v8;
                v3 = v8(v1);
                if G then
                    p = #v3 > arg2_320;
                end;
                if G then
                    return v3.sub(v3, 1, arg2_320) .. "...";
                end;
                return v3;
            else
                v3 = "";
            end; 
        end;
        local function r198(arg1_321, arg2_321, arg3_321, ...)
            v1 = arg1_321;
            v8 = game;
            k = v8;
            z = v8.GetService(v8, "TextService");
            v4 = v1;
            p = tostring;
            if v1 then
                v8 = v8;
                return z.GetTextSize(z, Env[v2](v1), arg3_321, arg2_321, Vector2.new(1000, 24)).X;
            else
                v4 = "";
            end; 
        end;
        local function r199(...)
            if r195 then
                return r195;
            end;
            v8 = game;
            r200 = v8.GetService(v8, "MarketplaceService");
            G = game;
            v3 = G.GetService(G, "Workspace");
            v2 = {
                pcall(function(...)
                    v8 = r200;
                    return v8.GetProductInfo(v8, game.PlaceId); 
                end)
            };
            v3 = v2[2];
            z = pcall(function(...)
                v8 = r200;
                return v8.GetProductInfo(v8, game.PlaceId); 
            end);
            if z then
                p = type(v3) == "table" and (typeof(v3.Name) == "string" and v3.Name ~= "");
                v8 = pcall;
            end;
            if z then
                r195 = v3.Name;
            else
                r195 = tostring(v3.GetAttribute(v3, "PlaceName") or (game.Name or "Place " .. tostring(game.PlaceId)));
            end;
            return r195; 
        end;
        local function r201(...)
            r196("RenderConnection");
            r196("InputConnection");
            p = game;
            v1 = p.GetService(p, "Players").LocalPlayer;
            G = v1 and v1.FindFirstChildOfClass(v1, "PlayerGui");
            if G then
                v3 = G.FindFirstChild(G, "AllunHud");
                if v3 then
                    v3.Destroy(v3);
                end;
            end;
            r194.Gui = nil;
            return; 
        end;
        local function r202(arg1_322, arg2_322, ...)
            v1 = arg1_322;
            r203 = arg2_322;
            r196("InputConnection");
            v8 = game;
            r204 = false;
            v8 = v1.InputBegan;
            v8.Connect(v8, function(arg1_323, ...)
                v1 = arg1_323;
                if v1.UserInputType == Enum.UserInputType.MouseButton1 or v1.UserInputType == Enum.UserInputType.Touch then
                    r204 = true;
                    r205 = v1.Position;
                    r206 = r203.Position;
                end;
                return; 
            end);
            v8 = v1.InputEnded;
            v8.Connect(v8, function(arg1_324, ...)
                v1 = arg1_324;
                if v1.UserInputType == Enum.UserInputType.MouseButton1 or v1.UserInputType == Enum.UserInputType.Touch then
                    r204 = false;
                end;
                return; 
            end);
            k = v8.GetService(v8, "UserInputService").InputChanged;
            r194.InputConnection = k.Connect(k, function(arg1_325, ...)
                v1 = arg1_325;
                if not r204 then
                    return;
                end;
                if v1.UserInputType == Enum.UserInputType.MouseMovement or v1.UserInputType == Enum.UserInputType.Touch then
                    G = v1.Position - r205;
                    r203.Position = UDim2.fromOffset(r206.X.Offset + G.X, r206.v8.Offset + G.v8);
                end;
                return; 
            end);
            return; 
        end;
        local function r207(arg1_326, arg2_326, ...)
            G = arg2_326;
            v3 = Instance.new("Frame");
            v3.Name = "IconHolder";
            v3.Size = UDim2.fromOffset(12, 12);
            v3.BackgroundTransparency = 1;
            p = arg1_326;
            v3.Parent = p;
            z = r14;
            p = "";
            if G ~= p then
                z = Instance.new("ImageLabel");
                z.Name = "Icon";
                z.BackgroundTransparency = 1;
                z.AnchorPoint = Vector2.new(0.5, 0.5);
                z.Position = UDim2.fromScale(0.5, 0.5);
                z.Size = UDim2.fromOffset(12, 12);
                p = arg2_326;
                z.Image = p;
                p = Instance.new("Frame");
                z.Parent = p;
                return;
            end;
            z = Instance.new("Frame");
            z.Name = "Fallback";
            z.AnchorPoint = Vector2.new(0.5, 0.5);
            z.Position = UDim2.fromScale(0.5, 0.5);
            z.Size = UDim2.fromOffset(8, 8);
            z.BackgroundColor3 = Color3.fromRGB(123, 93, 255);
            z.BorderSizePixel = 0;
            z.Parent = v3;
            v2 = Instance.new("UICorner");
            v2.CornerRadius = UDim.new(0, 3);
            v2.Parent = z;
            v4 = Instance.new("UIGradient");
            v4.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(113, 95, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(83, 63, 214))
            });
            v4.Parent = z;
            return; 
        end;
        local function r208(arg1_327, arg2_327, arg3_327, arg4_327, ...)
            G = arg2_327;
            v2 = Instance.new("Frame");
            v2.Name = "Segment";
            v2.Size = UDim2.fromOffset(G, 18);
            v2.BackgroundTransparency = 1;
            p = arg1_327;
            v2.Parent = p;
            v4 = Instance.new("UIListLayout");
            v4.FillDirection = Enum.FillDirection.Horizontal;
            v4.VerticalAlignment = Enum.VerticalAlignment.Center;
            v4.Padding = UDim.new(0, 6);
            v4.Parent = v2;
            r207(v2, arg3_327);
            k = Instance.new("TextLabel");
            k.Name = "Text";
            k.BackgroundTransparency = 1;
            k.Size = UDim2.fromOffset(G - 18, 18);
            k.Font = Enum.Font.GothamSemibold;
            p = arg4_327;
            k.Text = p;
            k.TextColor3 = Color3.fromRGB(223, 224, 241);
            k.TextSize = 11;
            k.TextXAlignment = Enum.TextXAlignment.Left;
            k.TextTruncate = Enum.TextTruncate.AtEnd;
            k.Parent = v2;
            return v2, k; 
        end;
        local function r209(arg1_328, arg2_328, arg3_328, arg4_328, arg5_328, ...)
            z = arg4_328;
            v3 = arg3_328;
            v4 = Instance.new("Frame");
            v4.Name = "Stat";
            v4.BackgroundTransparency = 1;
            v4.Size = UDim2.fromOffset(arg2_328, 18);
            p = arg1_328;
            v4.Parent = p;
            r210 = Instance.new("Frame");
            r210.BackgroundTransparency = 1;
            r210.BorderSizePixel = 0;
            r210.Size = UDim2.fromOffset(14, 14);
            r210.Position = UDim2.fromOffset(0, 3);
            r210.Parent = v4;
            if v3 ~= "" then
                v6 = Instance.new("ImageLabel");
                v6.Name = "Icon";
                v6.BackgroundTransparency = 1;
                v6.AnchorPoint = Vector2.new(0.5, 0.5);
                v6.Position = UDim2.fromScale(0.5, 0.5);
                v6.Size = UDim2.fromOffset(14, 14);
                p = arg3_328;
                v6.Image = p;
                v6.Parent = r210;
            else
                v6 = r14;
                if arg5_328 == "fps" then
                    r211 = Instance.new("Frame");
                    r211.BorderSizePixel = 0;
                    r211.BackgroundColor3 = Color3.fromRGB(110, 149, 255);
                    r211.BackgroundTransparency = .18;
                    r211.Position = UDim2.fromOffset(0, 1);
                    r211.Size = UDim2.fromOffset(14, 10);
                    r211.Parent = r210;
                    N = Instance.new("UICorner");
                    N.CornerRadius = UDim.new(0, 2);
                    N.Parent = r211;
                    L = Instance.new("Frame");
                    L.BorderSizePixel = 0;
                    L.BackgroundColor3 = Color3.fromRGB(188, 208, 255);
                    L.Position = UDim2.fromOffset(5, 12);
                    L.Size = UDim2.fromOffset(4, 1);
                    L.Parent = r210;
                    local function o(arg1_329, arg2_329, ...)
                        G = arg2_329;
                        v3 = Instance.new("Frame");
                        v3.BorderSizePixel = 0;
                        v3.BackgroundColor3 = Color3.fromRGB(226, 236, 255);
                        v3.Position = UDim2.fromOffset(arg1_329, 9 - G);
                        v3.Size = UDim2.fromOffset(1, G);
                        v3.Parent = r211;
                        return; 
                    end;
                    o(3, 3);
                    o(6, 5);
                    o(9, 7);
                else
                    if arg5_328 == "ping" then
                        local function v6(arg1_330, arg2_330, arg3_330, ...)
                            z = Instance.new("Frame");
                            z.BorderSizePixel = 0;
                            z.BackgroundColor3 = Color3.fromRGB(104, 142, 255);
                            p = arg3_330;
                            z.BackgroundTransparency = p;
                            p = arg2_330;
                            z.Position = p;
                            p = arg1_330;
                            z.Size = p;
                            z.Parent = r210;
                            v2 = Instance.new("UICorner");
                            v2.CornerRadius = UDim.new(1, 0);
                            v2.Parent = z;
                            return; 
                        end;
                        v6(UDim2.fromOffset(14, 14), UDim2.fromOffset(0, 0), .8);
                        v6(UDim2.fromOffset(10, 10), UDim2.fromOffset(2, 2), .18);
                        N = Instance.new("Frame");
                        N.BorderSizePixel = 0;
                        N.BackgroundColor3 = Color3.fromRGB(232, 238, 255);
                        N.AnchorPoint = Vector2.new(0.5, 0.5);
                        N.Position = UDim2.fromScale(0.5, 0.5);
                        N.Size = UDim2.fromOffset(4, 4);
                        N.Parent = r210;
                        L = Instance.new("UICorner");
                        L.CornerRadius = UDim.new(1, 0);
                        L.Parent = N;
                    end;
                    v6 = Instance.new("TextLabel");
                    v6.Name = "Value";
                    v6.BackgroundTransparency = 1;
                    v6.Position = UDim2.fromOffset(20, 0);
                    v6.Size = UDim2.fromOffset(arg2_328 - 20, 18);
                    v6.Font = Enum.Font.GothamMedium;
                    p = arg4_328;
                    v6.Text = p;
                    v6.TextColor3 = Color3.fromRGB(228, 233, 245);
                    v6.TextSize = 11;
                    v6.TextXAlignment = Enum.TextXAlignment.Left;
                    v6.TextYAlignment = Enum.TextYAlignment.Center;
                    v6.TextTruncate = Enum.TextTruncate.AtEnd;
                    v6.Parent = v4;
                    return v4, v6;
                end;
            end; 
        end;
        local function r212(arg1_331, arg2_331, ...)
            v3 = Instance.new("Frame");
            v3.Name = "Container";
            v3.Position = UDim2.fromOffset(22, 20);
            v3.Size = UDim2.fromOffset(350, 50);
            v3.BackgroundColor3 = Color3.fromRGB(12, 13, 18);
            v3.BackgroundTransparency = .02;
            v3.BorderSizePixel = 0;
            p = arg1_331;
            v3.Parent = p;
            z = Instance.new("UICorner");
            z.CornerRadius = UDim.new(1, 0);
            z.Parent = v3;
            v2 = Instance.new("UIStroke");
            v2.Color = Color3.fromRGB(50, 56, 74);
            v2.Transparency = .28;
            v2.Thickness = 1;
            v2.Parent = v3;
            v4 = Instance.new("UIGradient");
            v4.Rotation = 0;
            v4.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 20, 29)),
                ColorSequenceKeypoint.new(.35, Color3.fromRGB(12, 13, 20)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(9, 10, 15))
            });
            v4.Parent = v3;
            k = Instance.new("Frame");
            k.Name = "Brand";
            k.Position = UDim2.fromOffset(8, 7);
            k.Size = UDim2.fromOffset(96, 36);
            k.BackgroundColor3 = Color3.fromRGB(14, 16, 24);
            k.BorderSizePixel = 0;
            k.Parent = v3;
            v6 = Instance.new("UICorner");
            v6.CornerRadius = UDim.new(1, 0);
            v6.Parent = k;
            N = Instance.new("UIStroke");
            N.Color = Color3.fromRGB(52, 58, 76);
            N.Transparency = .22;
            N.Thickness = 1;
            N.Parent = k;
            L = Instance.new("Frame");
            L.Name = "Content";
            L.BackgroundTransparency = 1;
            L.AnchorPoint = Vector2.new(0.5, 0.5);
            L.Position = UDim2.fromScale(0.5, 0.5);
            L.Size = UDim2.fromOffset(68, 18);
            L.Parent = k;
            o = Instance.new("UIListLayout");
            o.FillDirection = Enum.FillDirection.Horizontal;
            o.HorizontalAlignment = Enum.HorizontalAlignment.Center;
            o.VerticalAlignment = Enum.VerticalAlignment.Center;
            o.Padding = UDim.new(0, 6);
            o.Parent = L;
            n = Instance.new("Frame");
            n.Size = UDim2.fromOffset(14, 14);
            n.BackgroundColor3 = Color3.fromRGB(19, 26, 46);
            n.BorderSizePixel = 0;
            n.Parent = L;
            d = Instance.new("UICorner");
            d.CornerRadius = UDim.new(1, 0);
            d.Parent = n;
            v7 = Instance.new("ImageLabel");
            v7.Name = "Logo";
            v7.BackgroundTransparency = 1;
            v7.Position = UDim2.fromScale(0.5, 0.5);
            v7.AnchorPoint = Vector2.new(0.5, 0.5);
            v7.Size = UDim2.fromOffset(12, 12);
            v7.Image = r190;
            v7.Parent = n;
            F = Instance.new("TextLabel");
            F.BackgroundTransparency = 1;
            F.Size = UDim2.fromOffset(46, 18);
            F.Font = Enum.Font.GothamBold;
            F.Text = "Allun";
            F.TextColor3 = Color3.fromRGB(255, 255, 255);
            F.TextSize = 14;
            F.TextXAlignment = Enum.TextXAlignment.Left;
            F.TextYAlignment = Enum.TextYAlignment.Center;
            F.Parent = L;
            S = Instance.new("UIGradient");
            S.Rotation = 0;
            S.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(142, 161, 255)),
                ColorSequenceKeypoint.new(.55, Color3.fromRGB(112, 127, 245)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(90, 108, 228))
            });
            S.Parent = F;
            r213 = Instance.new("TextLabel");
            r213.Name = "Stats";
            r213.BackgroundTransparency = 1;
            r213.Position = UDim2.fromOffset(112, 0);
            r213.Size = UDim2.fromOffset(222, 50);
            r213.Font = Enum.Font.Gotham;
            r213.Text = "Ping --   FPS --   Username " .. arg2_331.Name;
            r213.TextColor3 = Color3.fromRGB(226, 231, 243);
            r213.TextSize = 11;
            r213.TextXAlignment = Enum.TextXAlignment.Left;
            r213.TextTruncate = Enum.TextTruncate.AtEnd;
            r213.Parent = v3;
            r202(k, v3);
            return function(arg1_332, ...)
                v1 = arg1_332;
                r213.Text = string.format("Ping %s  |  FPS %d  |  Username %s", v1.ping, v1.fps, r197(v1.username, 14));
                return; 
            end; 
        end;
        local function r214(arg1_333, arg2_333, ...)
            r215 = Instance.new("Frame");
            r215.Name = "Container";
            r215.Position = UDim2.fromOffset(22, 20);
            r215.Size = UDim2.fromOffset(418, 46);
            r215.BackgroundColor3 = Color3.fromRGB(16, 11, 26);
            r215.BackgroundTransparency = .03;
            r215.BorderSizePixel = 0;
            z = arg1_333;
            r215.Parent = z;
            z = Instance.new("UICorner");
            z.CornerRadius = UDim.new(0, 14);
            z.Parent = r215;
            v2 = Instance.new("UIStroke");
            v2.Color = Color3.fromRGB(90, 60, 140);
            v2.Transparency = .12;
            v2.Thickness = 1;
            v2.Parent = r215;
            v4 = Instance.new("UIGradient");
            v4.Rotation = 0;
            v4.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(69, 37, 108)),
                ColorSequenceKeypoint.new(.1, Color3.fromRGB(36, 23, 60)),
                ColorSequenceKeypoint.new(.42, Color3.fromRGB(19, 14, 32)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 10, 20))
            });
            v4.Parent = r215;
            k = Instance.new("Frame");
            k.Name = "InnerGlow";
            k.BackgroundColor3 = Color3.fromRGB(111, 80, 182);
            k.BackgroundTransparency = .88;
            k.BorderSizePixel = 0;
            k.Size = UDim2.new(1, -8, 1, -10);
            k.Position = UDim2.fromOffset(4, 5);
            k.Parent = r215;
            v6 = Instance.new("UICorner");
            v6.CornerRadius = UDim.new(0, 12);
            v6.Parent = k;
            N = Instance.new("Frame");
            N.Name = "Brand";
            N.BackgroundTransparency = 1;
            N.Size = UDim2.fromOffset(80, 18);
            N.Position = UDim2.fromOffset(14, 14);
            N.Parent = r215;
            L = Instance.new("UIListLayout");
            L.FillDirection = Enum.FillDirection.Horizontal;
            L.HorizontalAlignment = Enum.HorizontalAlignment.Center;
            L.VerticalAlignment = Enum.VerticalAlignment.Center;
            L.Padding = UDim.new(0, 5);
            L.Parent = N;
            o = Instance.new("ImageLabel");
            o.Name = "Logo";
            o.BackgroundTransparency = 1;
            o.Size = UDim2.fromOffset(11, 11);
            o.Image = r190;
            o.ImageTransparency = 0;
            o.Parent = N;
            n = Instance.new("Frame");
            n.Name = "TextHolder";
            n.BackgroundTransparency = 1;
            n.Size = UDim2.fromOffset(50, 18);
            n.Parent = N;
            d = Instance.new("TextLabel");
            d.Name = "Glow";
            d.BackgroundTransparency = 1;
            d.Position = UDim2.fromOffset(0, 1);
            d.Size = UDim2.fromScale(1, 1);
            d.Font = Enum.Font.GothamBold;
            d.Text = "Allun";
            d.TextColor3 = Color3.fromRGB(16, 19, 34);
            d.TextTransparency = .42;
            d.TextStrokeTransparency = 1;
            d.TextSize = 12;
            d.TextXAlignment = Enum.TextXAlignment.Left;
            d.TextYAlignment = Enum.TextYAlignment.Center;
            d.Parent = n;
            v7 = Instance.new("TextLabel");
            v7.Name = "Text";
            v7.BackgroundTransparency = 1;
            v7.Size = UDim2.fromScale(1, 1);
            v7.Font = Enum.Font.GothamBold;
            v7.Text = "Allun";
            v7.TextColor3 = Color3.fromRGB(255, 255, 255);
            v7.TextSize = 12;
            v7.TextXAlignment = Enum.TextXAlignment.Left;
            v7.TextYAlignment = Enum.TextYAlignment.Center;
            v7.Parent = n;
            r216 = Instance.new("UIGradient");
            r216.Rotation = 0;
            r216.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 24, 38)),
                ColorSequenceKeypoint.new(.34, Color3.fromRGB(116, 137, 255)),
                ColorSequenceKeypoint.new(.68, Color3.fromRGB(20, 22, 36)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(84, 106, 236))
            });
            r216.Parent = v7;
            local function S(...)
                v1 = Instance.new("Frame");
                v1.Name = "Divider";
                v1.Size = UDim2.fromOffset(1, 13);
                v1.BackgroundColor3 = Color3.fromRGB(96, 86, 118);
                v1.BackgroundTransparency = .44;
                v1.BorderSizePixel = 0;
                v1.Parent = r215;
                return v1; 
            end;
            r217 = S();
            y = {
                r208(r215, 90, r192.UserIcon, arg2_333.Name)
            };
            r218 = r208(r215, 90, r192.UserIcon, arg2_333.Name);
            r219 = y[2];
            r220 = S();
            w = {
                r208(r215, 124, r192.PlaceIcon, r199())
            };
            r221 = r208(r215, 124, r192.PlaceIcon, r199());
            r222 = w[2];
            r223 = S();
            B = {
                r208(r215, 52, r192.FpsIcon, "0fps")
            };
            r224 = r208(r215, 52, r192.FpsIcon, "0fps");
            r225 = B[2];
            r202(r215, r215);
            local function r226(arg1_334, arg2_334, arg3_334, ...)
                v3 = arg3_334;
                arg1_334.Size = UDim2.fromOffset(v3, 18);
                arg2_334.Size = UDim2.fromOffset(math.max(18, v3 - 18), 18);
                return; 
            end;
            return function(arg1_335, ...)
                v1 = arg1_335;
                G = r197(v1.username, 10);
                v3 = r197(v1.place, 14);
                z = string.format("%d fps", v1.fps);
                v2 = r197(v1.username, 10);
                r219.Text = v2;
                v2 = r197(v1.place, 14);
                r222.Text = v2;
                v2 = string.format("%d fps", v1.fps);
                r225.Text = v2;
                v2 = math.clamp(r198(G, Enum.Font.GothamSemibold, 11) + 22, 72, 98);
                v4 = math.clamp(r198(v3, Enum.Font.GothamSemibold, 11) + 22, 92, 138);
                k = math.clamp(r198(z, Enum.Font.GothamSemibold, 11) + 22, 50, 70);
                r226(r218, r219, v2);
                r226(r221, r222, v4);
                r226(r224, r225, k);
                v8 = r216;
                F = r216;
                v8.Offset = Vector2.new(math.sin((v1.time or 0) * 1.15) * .22, 0);
                r217.Position = UDim2.fromOffset(14 + 80 + 7, 16);
                r218.Position = UDim2.fromOffset(14 + 80 + 7 + 1 + 7, 14);
                r220.Position = UDim2.fromOffset(14 + 80 + 7 + 1 + 7 + v2 + 7, 16);
                r221.Position = UDim2.fromOffset(14 + 80 + 7 + 1 + 7 + v2 + 7 + 1 + 7, 14);
                r223.Position = UDim2.fromOffset(14 + 80 + 7 + 1 + 7 + v2 + 7 + 1 + 7 + v4 + 7, 16);
                r224.Position = UDim2.fromOffset(14 + 80 + 7 + 1 + 7 + v2 + 7 + 1 + 7 + v4 + 7 + 1 + 7, 14);
                r215.Size = UDim2.fromOffset(14 + 80 + 7 + 1 + 7 + v2 + 7 + 1 + 7 + v4 + 7 + 1 + 7 + k + 14, 46);
                return; 
            end; 
        end;
        local function r227(arg1_336, arg2_336, ...)
            G = arg2_336;
            r228 = Instance.new("Frame");
            r228.Name = "Container";
            r228.Position = UDim2.fromOffset(22, 20);
            r228.Size = UDim2.fromOffset(214, 34);
            r228.BackgroundColor3 = Color3.fromRGB(29, 25, 53);
            r228.BackgroundTransparency = .14;
            r228.BorderSizePixel = 0;
            z = arg1_336;
            r228.Parent = z;
            z = Instance.new("UICorner");
            z.CornerRadius = UDim.new(0, 7);
            z.Parent = r228;
            v2 = Instance.new("UIStroke");
            v2.Color = Color3.fromRGB(96, 87, 176);
            v2.Transparency = .32;
            v2.Thickness = 1;
            v2.Parent = r228;
            r229 = Instance.new("UIGradient");
            r229.Rotation = 0;
            r229.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(92, 112, 196)),
                ColorSequenceKeypoint.new(.22, Color3.fromRGB(42, 48, 86)),
                ColorSequenceKeypoint.new(.62, Color3.fromRGB(20, 23, 40)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 12, 21))
            });
            r229.Parent = r228;
            k = Instance.new("Frame");
            k.Name = "LeftGlow";
            k.BackgroundColor3 = Color3.fromRGB(125, 90, 216);
            k.BackgroundTransparency = .7;
            k.BorderSizePixel = 0;
            k.Position = UDim2.fromOffset(0, 0);
            k.Size = UDim2.fromOffset(110, 34);
            k.Parent = r228;
            v6 = Instance.new("UICorner");
            v6.CornerRadius = UDim.new(0, 7);
            v6.Parent = k;
            r230 = Instance.new("UIGradient");
            r230.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(131, 96, 224)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(131, 96, 224))
            });
            r230.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, .08),
                NumberSequenceKeypoint.new(0.75, .78),
                NumberSequenceKeypoint.new(1, 1)
            });
            r230.Parent = k;
            L = Instance.new("Frame");
            L.Name = "InnerLine";
            L.BackgroundColor3 = Color3.fromRGB(133, 112, 219);
            L.BackgroundTransparency = .72;
            L.BorderSizePixel = 0;
            L.Position = UDim2.fromOffset(1, 1);
            L.Size = UDim2.new(1, -2, 0, 1);
            L.Parent = r228;
            r231 = Instance.new("Frame");
            r231.Name = "Brand";
            r231.BackgroundTransparency = 1;
            r231.BorderSizePixel = 0;
            r231.Position = UDim2.fromOffset(10, 8);
            r231.Size = UDim2.fromOffset(62, 18);
            r231.Parent = r228;
            n = Instance.new("Frame");
            n.Name = "BrandIconHolder";
            n.Size = UDim2.fromOffset(14, 14);
            n.BackgroundTransparency = 1;
            n.BorderSizePixel = 0;
            n.Position = UDim2.fromOffset(0, 3);
            v8 = "Parent";
            n[v8] = r231;
            v8 = v8;
            d = r193.BrandIcon ~= "" and r193.BrandIcon or r190;
            p = "";
            if d ~= p then
                v7 = Instance.new("ImageLabel");
                v7.Name = "BrandIcon";
                v7.BackgroundTransparency = 1;
                v7.AnchorPoint = Vector2.new(0.5, 0.5);
                v7.Position = UDim2.fromScale(0.5, 0.5);
                v7.Size = UDim2.fromOffset(14, 14);
                p = r193[r14[r15("H\xe9\xbc\xa6\x7fa\xe4\x0c\x9f", y)]] ~= r14[r] and r193.BrandIcon or r190;
                v7.Image = p;
                p = Instance.new("Frame");
                v7.Parent = p;
            end;
            r232 = Instance.new("TextLabel");
            r232.Name = "BrandText";
            r232.BackgroundTransparency = 1;
            r232.Position = UDim2.fromOffset(19, 2);
            r232.Size = UDim2.fromOffset(40, 16);
            r232.Font = Enum.Font.GothamSemibold;
            r232.Text = "Allun";
            r232.TextColor3 = Color3.fromRGB(229, 231, 241);
            r232.TextSize = 11;
            r232.TextXAlignment = Enum.TextXAlignment.Left;
            r232.TextYAlignment = Enum.TextYAlignment.Center;
            r232.Parent = r231;
            F = Instance.new("UIGradient");
            F.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(243, 246, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(190, 199, 255))
            });
            F.Parent = r232;
            local function S(...)
                v1 = Instance.new("Frame");
                v1.BackgroundColor3 = Color3.fromRGB(126, 118, 190);
                v1.BackgroundTransparency = .34;
                v1.BorderSizePixel = 0;
                v1.Size = UDim2.fromOffset(1, 12);
                v1.Parent = r228;
                G = Instance.new("UIGradient");
                G.Rotation = 90;
                G.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.25, .45),
                    NumberSequenceKeypoint.new(0.75, .45),
                    NumberSequenceKeypoint.new(1, 1)
                });
                G.Parent = v1;
                return v1; 
            end;
            r233 = S();
            g = {
                r209(r228, 62, r193.FpsIcon, "0Fps", "fps")
            };
            r234 = r209(r228, 62, r193.FpsIcon, "0Fps", "fps");
            r235 = g[2];
            r234.Position = UDim2.fromOffset(111, 9);
            r236 = S();
            De = {
                r209(r228, 60, r193.PingIcon, "0ms", "ping")
            };
            r237 = r209(r228, 60, r193.PingIcon, "0ms", "ping");
            r238 = De[2];
            r237.Position = UDim2.fromOffset(170, 9);
            r202(r228, r228);
            return function(arg1_337, ...)
                v1 = arg1_337;
                G = string.format("%dFps", v1.fps);
                v3 = string.format("%sms", v1.ping);
                z = string.format("%dFps", v1.fps);
                r235.Text = z;
                z = string.format("%sms", v1.ping);
                r238.Text = z;
                v8 = r229;
                o = r229;
                v8.Offset = Vector2.new(math.sin((v1.time or 0) * 1.08) * .26, 0);
                n = v8;
                r230.Offset = Vector2.new(math.sin((v1.time or 0) * 1.08) * .14, 0);
                z = math.max(58, 19 + r198("Allun", Enum.Font.GothamSemibold, 11) + 2);
                v2 = math.clamp(r198(G, Enum.Font.GothamMedium, 11) + 24, 58, 82);
                v4 = math.clamp(r198(v3, Enum.Font.GothamMedium, 11) + 24, 56, 84);
                r231.Size = UDim2.fromOffset(z, 18);
                r232.Size = UDim2.fromOffset(math.max(28, z - 19), 16);
                r234.Size = UDim2.fromOffset(v2, 18);
                r235.Size = UDim2.fromOffset(v2 - 20, 18);
                r237.Size = UDim2.fromOffset(v4, 18);
                r238.Size = UDim2.fromOffset(v4 - 20, 18);
                r231.Position = UDim2.fromOffset(10, 8);
                r233.Position = UDim2.fromOffset(10 + z + 8, 11);
                r234.Position = UDim2.fromOffset(10 + z + 8 + 7, 9);
                r236.Position = UDim2.fromOffset(10 + z + 8 + 7 + v2 + 8, 11);
                r237.Position = UDim2.fromOffset(10 + z + 8 + 7 + v2 + 8 + 7, 9);
                r228.Size = UDim2.fromOffset(10 + z + 8 + 7 + v2 + 8 + 7 + v4 + 10, 34);
                return; 
            end; 
        end;
        local function r239(...)
            v8 = game;
            v8 = game;
            v8.GetService(v8, "RunService");
            v8 = game;
            r240 = v8.GetService(v8, "Stats");
            r241 = v8.GetService(v8, "Players").LocalPlayer;
            v2 = r241;
            r201();
            v4 = Instance.new("ScreenGui");
            v4.Name = "AllunHud";
            v4.ResetOnSpawn = false;
            v4.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            p = v2.FindFirstChildOfClass(v2, "PlayerGui") or v2.WaitForChild(v2, "PlayerGui");
            v4.Parent = p;
            r194.Gui = v4;
            if r191 == "Style 3" then
                r242 = r227(v4, r241);
            else
                if r191 == "Style 2" then
                    r242 = r214(Instance.new("ScreenGui"), r241);
                else
                    r242 = r212(Instance.new("ScreenGui"), r241);
                end;
                r243 = os.clock();
                r244 = 0;
                r245 = 0;
                r246 = 0;
                r247 = "--";
                pcall(function(...)
                    r248 = r240.Network.ServerStatsItem["Data Ping"];
                    return; 
                end);
                q = v8.GetService(v8, "RunService").RenderStepped;
                r194.RenderConnection = q.Connect(q, function(...)
                    v1 = os.clock();
                    r243 = v1;
                    r244 = r244 + v1 - r243;
                    r245 = r245 + 1;
                    if r244 >= 0.25 then
                        L = r244;
                        r246 = math.floor(r245 / math.max(L, .001) + 0.5);
                        r244 = 0;
                        r245 = 0;
                        if r248 then
                            L = {
                                pcall(function(...)
                                    G = r248;
                                    return math.floor(G.GetValue(G) + 0.5); 
                                end)
                            };
                            if pcall(function(...)
                                G = r248;
                                return math.floor(G.GetValue(G) + 0.5); 
                            end) then
                                U[v7] = tostring(L[2]);
                            end;
                        end;
                    end;
                    r242({
                        ["ping"] = r247,
                        ["fps"] = r246,
                        ["username"] = r241.Name,
                        ["place"] = r199(),
                        ["time"] = v1
                    });
                    return; 
                end);
                return;
            end; 
        end;
        Ue.AddDropdown(Ue, "HudStylePreset", {
            ["Text"] = "HUD style",
            ["Values"] = {
                "Style 1",
                "Style 2",
                "Style 3"
            },
            ["Default"] = r191,
            ["Callback"] = function(arg1_338, ...)
                r191 = arg1_338;
                if not pcall(r239) then
                    warn("Allun HUD failed to switch: " .. tostring(v2[2]));
                end;
                return; 
            end
        });
        r189(v2);
        r188(14);
        task.spawn(function(...)
            task.wait(.3);
            if not r155.ScreenGui then
                return;
            end;
            z = r155.ScreenGui;
            z = "ipairs";
            for v3, v4 in ipairs(z.GetDescendants(z)) do
                v2 = v3;
                v6 = r14;
                k = "ImageButton";
                if v4.IsA(v4, k) then
                    k = v4.AbsoluteSize;
                    v6 = v4.AbsolutePosition;
                    if k.X <= 28 and (k.v8 <= 28 and (v6.v8 <= 180 and v6.X >= 900)) then
                        v1 = v4;
                    else
                        
                    end;
                end; 
            end;
            if nil then
                nil.Visible = false;
                nil.Active = false;
            end;
            return; 
        end);
        task.spawn(function(...)
            G = pcall(r239);
            if not G then
                warn("Allun HUD failed to load: " .. tostring(v3[2]));
            end;
            return; 
        end);
        r249 = r23.state;
        Ze = r23.refs;
        ge = Ze.Players;
        we = Ze.UserInputService;
        xe = Ze.ReplicatedStorage;
        v8 = v8;
        uQ = r23.MergedHub;
        r23.MergedHub = uQ;
        r250 = Ze.RunService;
        r251 = ge;
        r252 = xe;
        r253 = Ze.Debris;
        DQ = xe.WaitForChild(xe, "GrabEvents");
        MQ = xe.WaitForChild(xe, "MenuToys");
        xe.WaitForChild(xe, "CharacterEvents");
        v8 = v8;
        r254 = OrionLib or {
            ["MakeNotification"] = function(...)
                 
            end
        };
        r255 = DQ.WaitForChild(DQ, "SetNetworkOwner");
        r256 = MQ.WaitForChild(MQ, "DestroyToy");
        DQ.WaitForChild(DQ, "CreateGrabLine");
        DQ.WaitForChild(DQ, "DestroyGrabLine");
        zQ = v8;
        r257 = ge.LocalPlayer;
        r258 = r257;
        fQ = r257.Character;
        TQ = fQ;
        if fQ then
            v8 = v8;
            r259 = fQ;
            vQ = r259;
            if vQ then
                vQ = r259;
                TQ = vQ.FindFirstChildOfClass(vQ, "Humanoid");
            end;
            v8 = v8;
            r260 = vQ;
            eQ = r260;
            TQ = r249;
            if eQ then
                eQ = r260;
                TQ = eQ.FindFirstChildOfClass(eQ, "Animator");
            end;
            v8 = v8;
            r261 = TQ;
            r262 = r249.playerCharacter;
            r263 = r249.toysFolder;
            r264 = r249.ownedToys;
            r265 = r249.bombList;
            r266 = r249.playerList;
            TQ = r249.anchoredParts;
            OQ_5 = r249.anchoredConnections;
            OQ_6 = r249.compiledGroups;
            OQ_7 = r249.compileConnections;
            r267 = r249.renderSteppedConnections;
            OQ_8 = r249.auraRadius;
            OQ_10 = r249.lightbitradius;
            OQ_11 = r249.usingradius;
            r268 = {};
            r269 = Color3.fromRGB(128, 0, 128);
            r270 = 0.5;
            r271 = xe;
            r274 = false;
            r275 = ye;
            OQ_16 = false;
            r276 = ge;
            r277 = xe;
            r278 = ye;
            r279 = ye;
            r280 = ge;
            mouseTeleportInitialized = false;
            beamCycleEnabled = false;
            isLagging = false;
            lagSpeed = .05;
            grabEnabled = false;
            grabSpeed = .1;
            looping = false;
            isLooping = false;
            loopInterval = .4;
            players = ge;
            vu326 = DQ;
            vu327 = 0.5;
            toggle = false;
            angles = {};
            isFollowActive = false;
            followDistance = 18;
            followSpeed = 4;
            vu547 = ge;
            vu548 = ye;
            vu549 = workspace.CurrentCamera;
            vu550 = false;
            vu551 = 30;
            vu552 = nil;
            vu553 = nil;
            playerNames = {};
            playerInfoEnabled = false;
            vu516 = r257;
            OQ_55 = r259;
            OQ_53 = workspace.CurrentCamera;
            if OQ_55 then
                OQ_55 = r259;
                OQ_53 = OQ_55.FindFirstChild(OQ_55, "Head");
            end;
            v8 = v8;
            head = OQ_53;
            OQ_56 = r259;
            OQ_54 = false;
            if OQ_56 then
                OQ_56 = r259;
                OQ_54 = OQ_56.FindFirstChild(OQ_56, "HumanoidRootPart");
            end;
            OQ_109 = r257;
            "mouse" = OQ_109.WaitForChild(OQ_109, "PlayerGui");
            v8 = v8;
            humanoidRootPart = OQ_54;
            camera = workspace.CurrentCamera;
            noclipEnabled = false;
            depth = 20;
            cameraOffset = 10;
            effectDuration = 3;
            effectColorSpeed = 3;
            minSpeed = .2;
            maxSpeed = 2;
            audioDuration = 10;
            initialized = true;
            antiVoidEnabled = false;
            safePosition = Vector3.new(0, 50, 0);
            voidYLevel = -50;
            screenGui = nil;
            infoBox = nil;
            imageLabel = nil;
            messageLabel = nil;
            sound = nil;
            rainbowColors = {
                Color3.fromRGB(255, 0, 0),
                Color3.fromRGB(255, 127, 0),
                Color3.fromRGB(255, 255, 0),
                Color3.fromRGB(0, 255, 0),
                Color3.fromRGB(0, 0, 255),
                Color3.fromRGB(75, 0, 130),
                Color3.fromRGB(148, 0, 211)
            };
            toggleActiveAntiKick = false;
            antiKickLoopStarted = false;
            toggleActiveAntiGrabAndBlobman = false;
            autoStruggleCoroutine = nil;
            vu675 = nil;
            vu676 = 10;
            vu677 = 1000;
            vu680 = xe;
            vu682 = tQ.WaitForChild(tQ, "Struggle");
            vu932 = ge;
            LocalPlayer = r257;
            GrabRange = 50;
            grabbedPlayers = {};
            vu933 = nil;
            vu934 = 6000;
            GrabEvent = DQ.WaitForChild(DQ, "SetNetworkOwner");
            whitelist = {};
            vu1207 = ge;
            vu1208 = xe;
            vu1209 = false;
            vu1210 = false;
            vu1211 = nil;
            vu1272 = ge;
            vu1273 = false;
            vu1274 = nil;
            spawnerPlayer = nil;
            vu1275 = {};
            vu1276 = r257.Name;
            vu1277 = {};
            loopActive = false;
            noclipConnection = nil;
            hum = humanoidRootPart;
            mouse = nil;
            OQ_109 = r257;
            OQ_107 = OQ_109.FindFirstChildOfClass(OQ_109, "PlayerGui") or "mouse";
            v8 = v8;
            OQ_112 = "AllunMergedOverlay";
            screenGui = OQ_107.FindFirstChild(OQ_107, r14[OQ_112]);
            if not screenGui then
                screenGui = Instance.new("ScreenGui");
                screenGui.Name = "AllunMergedOverlay";
                screenGui.ResetOnSpawn = false;
                OQ_112 = OQ_109.FindFirstChildOfClass(OQ_109, U[z][U[G](OQ_115, OQ_116)]) or "mouse";
                screenGui.Parent = OQ_112;
            end;
            OQ_109 = screenGui;
            infoBox = OQ_109.FindFirstChild(OQ_109, "InfoBox");
            if not infoBox then
                infoBox = Instance.new("Frame");
                infoBox.Name = "InfoBox";
                infoBox.Position = UDim2.new(1, -150, 1, -150);
                infoBox.Size = UDim2.new(0, 150, 0, 150);
                infoBox.BackgroundTransparency = 0.5;
                infoBox.BackgroundColor3 = Color3.new(0, 0, 0);
                infoBox.Visible = false;
                infoBox.Parent = screenGui;
            end;
            OQ_109 = infoBox;
            imageLabel = OQ_109.FindFirstChild(OQ_109, "ImageLabel");
            if not imageLabel then
                imageLabel = Instance.new("ImageLabel");
                imageLabel.Name = "ImageLabel";
                imageLabel.Size = UDim2.new(1, 0, 1, 0);
                imageLabel.Position = UDim2.new(0, 0, 0, 0);
                imageLabel.BackgroundTransparency = 1;
                imageLabel.Image = "rbxassetid://75142123538746";
                imageLabel.ScaleType = Enum.ScaleType.Stretch;
                imageLabel.Parent = infoBox;
            end;
            OQ_109 = infoBox;
            messageLabel = OQ_109.FindFirstChild(OQ_109, "MessageLabel");
            if not messageLabel then
                messageLabel = Instance.new("TextLabel");
                messageLabel.Name = "MessageLabel";
                messageLabel.Size = UDim2.new(1, 0, 1, 0);
                messageLabel.Position = UDim2.new(0, 0, 0, 0);
                messageLabel.BackgroundTransparency = 1;
                messageLabel.Font = Enum.Font.SourceSansBold;
                messageLabel.TextSize = 16;
                messageLabel.TextWrapped = true;
                messageLabel.TextColor3 = Color3.new(1, 1, 1);
                messageLabel.Text = "";
                messageLabel.Parent = infoBox;
            end;
            OQ_109 = infoBox;
            sound = OQ_109.FindFirstChild(OQ_109, "LoopSound");
            if not sound then
                sound = Instance.new("Sound");
                sound.Name = "LoopSound";
                sound.SoundId = "rbxassetid://8887499160";
                sound.Volume = 1;
                sound.Looped = true;
                sound.Parent = infoBox;
            end;
            pcall(function(...)
                v8 = r271;
                p = v8.WaitForChild(v8, "DataEvents");
                r272 = p.WaitForChild(p, "UpdateLineColorsEvent");
                return; 
            end);
            pcall(function(...)
                v8 = game;
                p = v8.GetService(v8, "ReplicatedFirst");
                v8 = p.WaitForChild(p, "CatchFire");
                v8 = r261;
                v1 = v8.WaitForChild(v8, "FireFlailAnimation");
                if v8 then
                    v8 = r261;
                    r273 = v8.LoadAnimation(v8, v1);
                end;
                return; 
            end);
            OQ_109 = r257.CharacterAdded;
            OQ_109.Connect(OQ_109, function(arg1_339, ...)
                v1 = arg1_339;
                r262 = v1;
                r258 = r257;
                r259 = v1;
                v2 = r259;
                v3 = k;
                r260 = v3 and v2.FindFirstChildOfClass(v2, "Humanoid");
                v4 = r260;
                z = v6;
                r261 = z and v4.FindFirstChildOfClass(v4, "Animator");
                k = r259;
                v2 = humanoidRootPart;
                if k then
                    k = r259;
                    v2 = k.FindFirstChild(k, "Head");
                end;
                head = v2;
                v6 = r259;
                v4 = workspace.CurrentCamera;
                if v6 then
                    v6 = r259;
                    v4 = v6.FindFirstChild(v6, "HumanoidRootPart");
                end;
                v8 = v1;
                humanoidRootPart = v4;
                hum = humanoidRootPart;
                camera = workspace.CurrentCamera;
                pcall(function(...)
                    v8 = game;
                    p = v8.GetService(v8, "ReplicatedFirst");
                    v8 = p.WaitForChild(p, "CatchFire");
                    v1 = v8.WaitForChild(v8, "FireFlailAnimation");
                    v8 = r261;
                    if v8 then
                        v8 = r261;
                        r273 = v8.LoadAnimation(v8, v1);
                    end;
                    return; 
                end);
                r249.playerCharacter = v1;
                return; 
            end);
            playFireFlailAnimation = function(...)
                v8 = r273;
                if v8 then
                    v8 = r273;
                    v8.Play(v8);
                end;
                return; 
            end;
            ae.playFireFlailAnimation = playFireFlailAnimation;
            stopFireFlailAnimation = function(...)
                v8 = r273;
                if v8 then
                    v8 = r273;
                    v8.Stop(v8);
                end;
                return; 
            end;
            ae.stopFireFlailAnimation = stopFireFlailAnimation;
            setupCharacter = function(arg1_340, ...)
                v1 = arg1_340;
                hum = v1.WaitForChild(v1, "HumanoidRootPart");
                p = game.Players.LocalPlayer;
                mouse = p.GetMouse(p);
                p = mouse.KeyDown;
                p.Connect(p, function(arg1_341, ...)
                    z = r14;
                    G = arg1_341 == "z";
                    if G then
                        z = r274;
                        if z then
                            G = mouse.Target;
                        end;
                        v1.WaitForChild(v1, "HumanoidRootPart");
                        p = z;
                    end;
                    if G then
                        hum.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0, 5, 0));
                    end;
                    return; 
                end);
                return; 
            end;
            ae.setupCharacter = setupCharacter;
            randomColor = function(...)
                return Color3.new(math.random(), math.random(), math.random()); 
            end;
            ae.randomColor = randomColor;
            generateRandomColorSequence = function(...)
                v1 = {};
                for G = 0, 1, .1 do
                    table.insert(v1, ColorSequenceKeypoint.new(G, randomColor())); 
                end;
                return ColorSequence.new(v1); 
            end;
            ae.generateRandomColorSequence = generateRandomColorSequence;
            updateBeamColors = function(...)
                if not r272 then
                    return;
                end;
                v8 = r272;
                v8.FireServer(v8, unpack({
                    generateRandomColorSequence()
                }));
                return; 
            end;
            ae.updateBeamColors = updateBeamColors;
            DestroyT = function(arg1_342, ...)
                v1 = arg1_342;
                p = v1;
                if v1 then
                    v8 = r256;
                    v8.FireServer(v8, v1);
                    return;
                else
                    G = r263;
                    p = G.FindFirstChildWhichIsA(G, "Model");
                end; 
            end;
            r23.DestroyT = DestroyT;
            onPlayerAdded = function(arg1_343, ...)
                table.insert(r266, arg1_343.Name);
                return; 
            end;
            r23.onPlayerAdded = onPlayerAdded;
            onPlayerRemoving = function(arg1_344, ...)
                v1 = arg1_344;
                v2 = {
                    ipairs(r266)
                };
                v3 = v2[3];
                z = ipairs(r266);
                while true do
                    v4 = {
                        z(v2[2], v2[3])
                    };
                    v2 = v4[2];
                    if z(v2[2], v2[3]) == nil then
                        break;
                    else
                        if v2 == arg1_344.Name then
                            table.remove(r266, v8);
                            break;
                        else
                            
                        end;
                    end; 
                end;
                return; 
            end;
            r23.onPlayerRemoving = onPlayerRemoving;
            getNearestPlayer = function(...)
                v1 = math.huge;
                G = r251;
                v4 = {
                    pairs(G.GetPlayers(G))
                };
                z = v4[3];
                while true do
                    v6 = {
                        pairs(G.GetPlayers(G))(v4[2], v4[3])
                    };
                    k = v6[2];
                    if pairs(G.GetPlayers(G))(v4[2], v4[3]) == nil then
                        break;
                    else
                        v8 = pairs(G.GetPlayers(G))(v4[2], v4[3]);
                        if p ~= r257 and p.Character then
                            L = "Magnitude";
                            v6 = (r262.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position)[L];
                            if v6 < math.huge then
                                v4 = p;
                                L = v6;
                                v1 = v6;
                            end;
                        end;
                    end; 
                end;
                return nil; 
            end;
            r23.getNearestPlayer = getNearestPlayer;
            spawnItemCf = function(arg1_345, arg2_345, ...)
                r281 = arg1_345;
                r282 = arg2_345;
                task.spawn(function(...)
                    v8 = r252.MenuToys.SpawnToyRemoteFunction;
                    v8.InvokeServer(v8, r281, r282, Vector3.new(0, 0, 0));
                    return; 
                end);
                return; 
            end;
            r23.spawnItemCf = spawnItemCf;
            local function OQ_120(arg1_346, ...)
                if arg1_346 then
                    v8 = not r264[_G.ToyToLoad];
                    if v8 then
                        v8 = r254;
                        v8.MakeNotification(v8, {
                            ["Name"] = "Missing toy",
                            ["Content"] = "You do not own the " .. _G.ToyToLoad .. " toy.",
                            ["Image"] = "rbxassetid://4483345998",
                            ["Time"] = 3
                        });
                        return;
                    end;
                    if not vu8 then
                        vu8 = coroutine.create(function(...)
                            v8 = r263.ChildAdded;
                            vu7 = v8.Connect(v8, function(arg1_347, ...)
                                r283 = arg1_347;
                                z = _G.ToyToLoad;
                                if r283.Name == z and z.WaitForChild(z, "ThisToysNumber", 1) then
                                    d = 28723257603135;
                                    v8 = r263.ChildRemoved;
                                    r284 = v8.Connect(v8, function(arg1_348, ...)
                                        v8 = arg1_348 == r283;
                                        if v8 then
                                            v8 = r284;
                                            v8.Disconnect(v8);
                                        end;
                                        return; 
                                    end);
                                    v8 = r255;
                                    v8.FireServer(v8, r283.Body, r283[r14[r15("_\x9cK\x88", d)]].CFrame);
                                    v8 = r283.Body;
                                    v3 = v8.WaitForChild(v8, "PartOwner", 0.5);
                                    v8 = r283.DescendantAdded;
                                    v8.Connect(v8, function(arg1_349, ...)
                                        v1 = arg1_349;
                                        if v1.Name == "PartOwner" and v1.Value ~= r257.Name then
                                            DestroyT(r283);
                                            v8 = connection;
                                            v8.Disconnect(v8);
                                        end;
                                        return; 
                                    end);
                                    v8 = r253;
                                    v8.AddItem(v8, connectio, 60);
                                    if v3 then
                                        z = v3.Value == r257.Name;
                                    end;
                                    if v3 then
                                        k = r283;
                                        k = {
                                            pairs(k.GetChildren(k))
                                        };
                                        v4 = k[3];
                                        k = r284;
                                        while true do
                                            L = {
                                                k[1](k[2], k[3])
                                            };
                                            v6 = L[2];
                                            if k[1](k[2], k[3]) == nil then
                                                
                                            else
                                                if N.IsA(N, "BasePart") then
                                                    N.CanCollide = false;
                                                end;
                                            end; 
                                        end;
                                        v6 = r283;
                                        v6.SetPrimaryPartCFrame(v6, CFrame.new(-72.9304581, -3.96906614, -265.543732));
                                        wait(.2);
                                        d = r283;
                                        d = {
                                            pairs(d.GetChildren(d))
                                        };
                                        n = d[3];
                                        while true do
                                            F = {
                                                pairs(d.GetChildren(d))(d[2], d[3])
                                            };
                                            v6 = F[2];
                                            if pairs(d.GetChildren(d))(d[2], d[3]) == nil then
                                                
                                            else
                                                if v7.IsA(v7, "BasePart") then
                                                    v7.Anchored = true;
                                                end;
                                            end; 
                                        end;
                                        table.insert(r265, r283);
                                        v6 = r283.AncestryChanged;
                                        v6.Connect(v6, function(...)
                                            if not r283.Parent then
                                                z = {
                                                    ipairs(r265)
                                                };
                                                G = z[3];
                                                v3 = ipairs(r265);
                                                while true do
                                                    v2 = {
                                                        v3(z[2], z[3])
                                                    };
                                                    z = v2[2];
                                                    if v3(z[2], z[3]) == nil then
                                                        
                                                    else
                                                        if z == r283 then
                                                            table.remove(r265, v8);
                                                        else
                                                            
                                                        end;
                                                    end; 
                                                end;
                                            end;
                                            return; 
                                        end);
                                        k.Disconnect(k);
                                    else
                                        DestroyT(r283);
                                    end;
                                end;
                                return; 
                            end);
                            v8 = true;
                            while v8 do
                                z = "CanSpawnToy";
                                G = r257[z];
                                if G then
                                    z = r257.CanSpawnToy.Value and #r265 < _G.MaxMissiles;
                                    v8 = true;
                                    v1 = z and z.FindFirstChild(z, "Head");
                                    v8 = true;
                                end;
                                if G then
                                    spawnItemCf(_G.ToyToLoad, r262.Head.CFrame or r262.HumanoidRootPart.CFrame);
                                end;
                                v8 = r250.Heartbeat;
                                v8.Wait(v8); 
                            end;
                            return; 
                        end);
                        coroutine.resume(vu8);
                    end;
                else
                    if vu8 then
                        coroutine.close(vu8);
                        vu8 = nil;
                    end;
                    G = vu7;
                    if G then
                        G = vu7;
                        G.Disconnect(G);
                    end;
                    return;
                end; 
            end;
            ae.vu78 = OQ_120;
            enableGraphics = function(...)
                v8 = game;
                Lighting = v8.GetService(v8, "Lighting");
                Lighting.Brightness = 2.14;
                Lighting.ColorShift_Bottom = Color3.fromRGB(11, 0, 20);
                Lighting.ColorShift_Top = Color3.fromRGB(240, 127, 14);
                Lighting.OutdoorAmbient = Color3.fromRGB(34, 0, 49);
                Lighting.ClockTime = 6.7;
                Lighting.FogColor = Color3.fromRGB(94, 76, 106);
                Lighting.FogEnd = 1000;
                Lighting.FogStart = 0;
                Lighting.ExposureCompensation = .24;
                Lighting.ShadowSoftness = 0;
                Lighting.Ambient = Color3.fromRGB(59, 33, 27);
                Bloom = Instance.new("BloomEffect");
                Bloom.Intensity = .1;
                Bloom.Threshold = 0;
                Bloom.Size = 100;
                Bloom.Parent = Lighting;
                Blur = Instance.new("BlurEffect");
                Blur.Size = 2;
                Blur.Parent = Lighting;
                ColorCorrection = Instance.new("ColorCorrectionEffect");
                ColorCorrection.Name = "WarmTint";
                ColorCorrection.Saturation = .05;
                ColorCorrection.TintColor = Color3.fromRGB(255, 224, 219);
                ColorCorrection.Parent = Lighting;
                SunRays = Instance.new("SunRaysEffect");
                SunRays.Intensity = .05;
                SunRays.Parent = Lighting;
                Tropic = Instance.new("Sky");
                Tropic.Name = "Tropic";
                Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149";
                Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133";
                Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090";
                Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121";
                Tropic.StarCount = 100;
                Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108";
                Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143";
                Tropic.Parent = Lighting;
                return; 
            end;
            ae.enableGraphics = enableGraphics;
            disableGraphics = function(...)
                v8 = game;
                Lighting = v8.GetService(v8, "Lighting");
                v8 = Lighting;
                v8.ClearAllChildren(v8);
                Lighting.Brightness = 1;
                Lighting.OutdoorAmbient = Color3.new(1, 1, 1);
                Lighting.FogEnd = 10000;
                return; 
            end;
            ae.disableGraphics = disableGraphics;
            applyToAllSigns = function(arg1_350, arg2_350, arg3_350, arg4_350, ...)
                G = arg2_350;
                v3 = arg3_350;
                v1 = arg1_350;
                z = arg4_350;
                v6 = {
                    ipairs(v1.GetChildren(v1))
                };
                k = v6[3];
                v6 = ipairs(v1.GetChildren(v1));
                while true do
                    L = {
                        v6(v6[2], v6[3])
                    };
                    N = L[2];
                    if v6(v6[2], v6[3]) == nil then
                        break;
                    else
                        n = v6(v6[2], v6[3]);
                        L = p.FindFirstChild(p, arg4_350);
                        if L then
                            o = L.FindFirstChild(L, arg4_350 .. "GrabPart");
                        end;
                        v8 = n;
                        if L then
                            n = vu122.GrabEvents.SetNetworkOwner;
                            n.FireServer(n, unpack({
                                L[arg4_350 .. "GrabPart"],
                                arg2_350 * arg3_350
                            }));
                        end;
                    end; 
                end;
                return; 
            end;
            ae.applyToAllSigns = applyToAllSigns;
            handleLoop = function(...)
                while looping do
                    v1 = selectedPlot;
                    v8 = workspace.Plots;
                    G = v8.FindFirstChild(v8, v1);
                    if G then
                        p = G.FindFirstChild(G, "PlotSign");
                    end;
                    if G then
                        z = positionsAndAngles[v1];
                        applyToAllSigns(G.PlotSign, z.position, z.angles, selectedSignType);
                    else
                        warn("Plot or PlotSign not found for: " .. v1);
                    end;
                    wait(1); 
                end;
                return; 
            end;
            ae.handleLoop = handleLoop;
            grabAllToys = function(arg1_351, ...)
                v8 = workspace;
                k = "SpawnedInToys";
                playerToysFolder = v8.FindFirstChild(v8, arg1_351.Name .. r14[k]);
                if playerToysFolder then
                    v8 = playerToysFolder;
                    spawnedToys = v8.GetChildren(v8);
                    k = {
                        ipairs(spawnedToys)
                    };
                    v2 = k[3];
                    while true do
                        v6 = {
                            ipairs(spawnedToys)(k[2], k[3])
                        };
                        v4 = v6[2];
                        if ipairs(spawnedToys)(k[2], k[3]) == nil then
                            
                        else
                            d = k.IsA(k, "Model");
                            if d then
                                d = k.Name;
                                o = d.match(d, "MusicKeyboard");
                            end;
                            v8 = v8;
                            v8 = v8;
                            if not d and k.IsA(k, "Model") then
                                d = {
                                    ipairs(k.GetDescendants(k))
                                };
                                o = d[3];
                                while true do
                                    v7 = {
                                        ipairs(k.GetDescendants(k))(d[2], d[3])
                                    };
                                    v6 = v7[2];
                                    if ipairs(k.GetDescendants(k))(d[2], d[3]) == nil then
                                        
                                    else
                                        F = "Part";
                                        if d.IsA(d, F) then
                                            q = game;
                                            F = q.GetService(q, "ReplicatedStorage").GrabEvents.SetNetworkOwner;
                                            F.FireServer(F, unpack({
                                                d,
                                                CFrame.new(d.Position)
                                            }));
                                        end;
                                    end; 
                                end;
                            end;
                        end; 
                    end;
                else
                    print("Player's toys folder not found.");
                end;
                return; 
            end;
            ae.grabAllToys = grabAllToys;
            handleToggle = function(arg1_352, ...)
                isLooping = arg1_352;
                if isLooping then
                    print("Looping started.");
                    spawn(function(...)
                        while isLooping do
                            grabAllToys(game.Players.LocalPlayer);
                            wait(loopInterval); 
                        end;
                        return; 
                    end);
                else
                    print("Looping stopped.");
                end;
                return; 
            end;
            ae.handleToggle = handleToggle;
            local function r285(...)
                v8 = game;
                v1 = v8.GetService(v8, "Players");
                G = v1.LocalPlayer;
                v3 = G.Character;
                if v3 then
                    v3 = G.Character.PrimaryPart.Position;
                end;
                if v3 then
                    v6 = {
                        ipairs(v1.GetPlayers(v1))
                    };
                    v4 = v6[3];
                    while true do
                        N = {
                            ipairs(v1.GetPlayers(v1))(v6[2], v6[3])
                        };
                        k = N[2];
                        if ipairs(v1.GetPlayers(v1))(v6[2], v6[3]) == nil then
                            
                        else
                            N = v6 ~= v1.LocalPlayer;
                            if N then
                                N = workspace;
                                F = r15;
                                L = N.FindFirstChild(N, v6.Name .. "SpawnedInToys");
                                if L then
                                    F = {
                                        ipairs(L.GetChildren(L))
                                    };
                                    d = F[3];
                                    while true do
                                        S = {
                                            ipairs(L.GetChildren(L))(F[2], F[3])
                                        };
                                        N = S[2];
                                        if ipairs(L.GetChildren(L))(F[2], F[3]) == nil then
                                            
                                        else
                                            Z = r15;
                                            v8 = G[p];
                                            if F.IsA(F, "Model") or F.IsA(F, "Part") then
                                                Z = {
                                                    ipairs(F.GetDescendants(F))
                                                };
                                                C = Z[3];
                                                while true do
                                                    J = {
                                                        ipairs(F.GetDescendants(F))(Z[2], Z[3])
                                                    };
                                                    S = J[2];
                                                    if ipairs(F.GetDescendants(F))(Z[2], Z[3]) == nil then
                                                        
                                                    else
                                                        y = q;
                                                        v8 = y;
                                                        if Z.IsA(Z, "Part") and (Z.Position - v8).magnitude <= vu155 then
                                                            w = game;
                                                            y = w.GetService(w, "ReplicatedStorage").GrabEvents.SetNetworkOwner;
                                                            y.FireServer(y, unpack({
                                                                Z,
                                                                CFrame.new(Z.Position)
                                                            }));
                                                        end;
                                                    end; 
                                                end;
                                            end;
                                        end; 
                                    end;
                                end;
                            end;
                        end; 
                    end;
                end;
                return; 
            end;
            ae.vu173 = r285;
            local function OQ_122(arg1_353, ...)
                if arg1_353 then
                    if not vu154 then
                        vu154 = true;
                        print("����� Looping started.");
                        while vu154 do
                            r285();
                            wait(loopInterval); 
                        end;
                    end;
                else
                    if vu154 then
                        vu154 = false;
                        print("����� Looping stopped.");
                    end;
                    return;
                end; 
            end;
            ae.vu175 = OQ_122;
            OrbitPlayers = function(...)
                v8 = r275.RenderStepped;
                v8.Connect(v8, function(...)
                    if isFollowActive then
                        r262 = r258.Character;
                        p = r262;
                        if p then
                            p = r262;
                            v1 = p.FindFirstChild(p, "HumanoidRootPart");
                            if v1 then
                                v1 = r262.HumanoidRootPart.Position;
                            end;
                            playerPosition = v1;
                            if playerPosition then
                                v3 = r276;
                                N = {
                                    ipairs(v3.GetPlayers(v3))
                                };
                                k = N[3];
                                while true do
                                    L = {
                                        ipairs(v3.GetPlayers(v3))(N[2], N[3])
                                    };
                                    z = L[2];
                                    if ipairs(v3.GetPlayers(v3))(N[2], N[3]) == nil then
                                        
                                    else
                                        if N ~= r258 then
                                            r259 = N.Character;
                                            o = r259;
                                            if o then
                                                o = r259;
                                                n = o.FindFirstChild(o, "HumanoidRootPart");
                                                if n then
                                                    if not angles[N] then
                                                        angles[N] = 0;
                                                    end;
                                                    q = r275.RenderStepped;
                                                    angles[N] = angles[N] + followSpeed * q.Wait(q);
                                                    angle = angles[N];
                                                    offsetX = math.cos(angle) * followDistance;
                                                    offsetZ = math.sin(angle) * followDistance;
                                                    newPosition = playerPosition + Vector3.new(offsetX, 0, offsetZ);
                                                    n.CFrame = CFrame.new(newPosition, playerPosition);
                                                end;
                                            end;
                                        end;
                                    end; 
                                end;
                            end;
                            return;
                        end;
                        return;
                    end;
                    return; 
                end);
                return; 
            end;
            ae.OrbitPlayers = OrbitPlayers;
            saveOriginalProperties = function(arg1_354, ...)
                v1 = arg1_354;
                if not r268[v1] then
                    r268[v1] = {};
                    v2 = {
                        ipairs(v1.GetChildren(v1))
                    };
                    v3 = v2[3];
                    z = ipairs(v1.GetChildren(v1));
                    while true do
                        v4 = {
                            z(v2[2], v2[3])
                        };
                        v2 = v4[2];
                        if z(v2[2], v2[3]) == nil then
                            
                        else
                            if p.IsA(p, "BasePart") then
                                r268[arg1_354][p] = {
                                    ["Material"] = p.Material,
                                    ["BrickColor"] = p.BrickColor,
                                    ["Transparency"] = p.Transparency
                                };
                            end;
                        end; 
                    end;
                end;
                return; 
            end;
            ae.saveOriginalProperties = saveOriginalProperties;
            applyHighlight = function(arg1_355, ...)
                v1 = arg1_355;
                saveOriginalProperties(v1);
                v2 = {
                    ipairs(v1.GetChildren(v1))
                };
                v3 = v2[3];
                z = ipairs(v1.GetChildren(v1));
                while true do
                    v4 = {
                        z(v2[2], v2[3])
                    };
                    v2 = v4[2];
                    if z(v2[2], v2[3]) == nil then
                        break;
                    else
                        if p.IsA(p, "BasePart") then
                            p.Material = Enum.Material.Neon;
                            p.BrickColor = BrickColor.new(r269);
                            p.Transparency = r270;
                        end;
                    end; 
                end;
                return; 
            end;
            ae.applyHighlight = applyHighlight;
            removeHighlight = function(arg1_356, ...)
                v1 = arg1_356;
                G = r268[v1];
                if G then
                    v2 = {
                        pairs(G)
                    };
                    z = v2[3];
                    v2 = pairs(G);
                    while true do
                        k = {
                            v2(v2[2], v2[3])
                        };
                        v4 = k[2];
                        z = v2(v2[2], v2[3]);
                        if z == nil then
                            
                        else
                            if z.IsA(z, "BasePart") then
                                v8.Material = p.Material;
                                v8.BrickColor = p.BrickColor;
                                v8.Transparency = p.Transparency;
                            end;
                        end; 
                    end;
                    r268[v1] = nil;
                end;
                return; 
            end;
            ae.removeHighlight = removeHighlight;
            grabAndMoveToys = function(...)
                v8 = workspace;
                v2 = r15;
                v1 = v8.FindFirstChild(v8, r258.Name .. "SpawnedInToys");
                if v1 then
                    v2 = {
                        pairs(v1.GetChildren(v1))
                    };
                    z = pairs(v1.GetChildren(v1));
                    v3 = v2[3];
                    while true do
                        v4 = {
                            z(v2[2], v2[3])
                        };
                        v2 = v4[2];
                        if z(v2[2], v2[3]) == nil then
                            
                        else
                            if p.IsA(p, "Model") then
                                o = r15;
                                if (p.PrimaryPart.Position - r258.Character.HumanoidRootPart.Position).magnitude > grabRadius then
                                    removeHighlight(p);
                                else
                                    applyHighlight(p);
                                    o = {
                                        ipairs({
                                            "Main",
                                            "Hitbox",
                                            "SoundPart",
                                            "Base",
                                            "BackPart",
                                            "Axel2",
                                            "Stick"
                                        })
                                    };
                                    N = o[3];
                                    while true do
                                        n = {
                                            ipairs({
                                                "Main",
                                                "Hitbox",
                                                "SoundPart",
                                                "Base",
                                                "BackPart",
                                                "Axel2",
                                                "Stick"
                                            })(o[2], o[3])
                                        };
                                        v4 = n[2];
                                        if ipairs({
                                            "Main",
                                            "Hitbox",
                                            "SoundPart",
                                            "Base",
                                            "BackPart",
                                            "Axel2",
                                            "Stick"
                                        })(o[2], o[3]) == nil then
                                            
                                        else
                                            n = p.FindFirstChild(p, o);
                                            if n then
                                                v7 = r277.GrabEvents.SetNetworkOwner;
                                                v7.FireServer(v7, unpack({
                                                    n,
                                                    CFrame.new(n.Position)
                                                }));
                                            end;
                                        end; 
                                    end;
                                end;
                            end;
                        end; 
                    end;
                end;
                return; 
            end;
            ae.grabAndMoveToys = grabAndMoveToys;
            clearEffects = function(...)
                v3 = workspace[r258.Name .. "SpawnedInToys"];
                v3 = {
                    pairs(v3.GetChildren(v3))
                };
                G = v3[3];
                v3 = pairs(v3.GetChildren(v3));
                while true do
                    v2 = {
                        v3(v3[2], v3[3])
                    };
                    z = v2[2];
                    if v3(v3[2], v3[3]) == nil then
                        break;
                    else
                        d = {
                            pairs(p.GetDescendants(p))
                        };
                        v4 = d[2];
                        v2 = pairs(p.GetDescendants(p));
                        k = d[3];
                        while true do
                            o = {
                                v2(v4, o)
                            };
                            v6 = o[2];
                            if v2(v4, o) == nil then
                                
                            else
                                if L.IsA(L, "BasePart") then
                                    o = L.FindFirstChild(L, "BodyVelocity");
                                    n = L.FindFirstChild(L, "BodyGyro");
                                    if o then
                                        o.Destroy(o);
                                    end;
                                    if n then
                                        n.Destroy(n);
                                    end;
                                    L.CanCollide = true;
                                end;
                            end; 
                        end;
                    end; 
                end;
                return; 
            end;
            ae.clearEffects = clearEffects;
            local function OQ_123(...)
                G = workspace[r258.Name .. "SpawnedInToys"];
                v1 = 360 / #G.GetChildren(G);
                G = 0;
                v3 = isMoving;
                p = v3;
                while not v3 do
                    if p then
                        p = r259;
                        v3 = p.WaitForChild(p, "HumanoidRootPart").Position;
                        G = (G + speed * .1) % 360;
                        k = workspace[r258.Name .. "SpawnedInToys"];
                        k = {
                            pairs(k.GetChildren(k))
                        };
                        v4 = k[3];
                        k = 1;
                        while true do
                            L = {
                                k[1](k[2], k[3])
                            };
                            v6 = L[2];
                            if k[1](k[2], k[3]) == nil then
                                wait(.05);
                            else
                                Q = {
                                    pairs(N.GetDescendants(N))
                                };
                                L = pairs(N.GetDescendants(N));
                                n = Q[3];
                                o = Q[2];
                                d = true;
                                while d do
                                    S = {
                                        L(o, S)
                                    };
                                    d = S[2];
                                    if L(o, S) == nil then
                                        
                                    else
                                        S = d.IsA(d, "BasePart");
                                        if S then
                                            S = v8 + 360 / #G.GetChildren(G) * (1 - 1);
                                            Vector3.new(v3.X + radius * math.cos(math.rad(S)), v3.v8 + math.sin(math.rad(S)) * height, v3.Z + radius * math.sin(math.rad(S)));
                                            J = (G + speed * .1) % 360;
                                            y = F.FindFirstChild(F, "BodyVelocity");
                                            r = y;
                                            if y then
                                                v8 = v8;
                                                r.MaxForce = Vector3.new(10000, 10000, 10000);
                                                r.Velocity = (Z - F.Position) * speed * .1;
                                                J = F.FindFirstChild(F, "BodyGyro") and false;
                                                J = Instance.new("BodyGyro", F);
                                                v8 = v8;
                                                J.MaxTorque = Vector3.new(10000, 10000, 10000);
                                                J.CFrame = CFrame.new(Z) * CFrame.Angles(math.rad(xRotation), math.rad(yRotation), math.rad(zRotation));
                                                F.CanCollide = false;
                                                F.Anchored = false;
                                            else
                                                r = Instance.new("BodyVelocity", F);
                                            end;
                                        end;
                                    end; 
                                end;
                                k = 1 + 1;
                            end; 
                        end;
                    end;
                    return; 
                end;
                p = selectedEffect == "Ferris Wheel ������"; 
            end;
            ae.vu257 = OQ_123;
            local function OQ_124(...)
                G = workspace[r258.Name .. "SpawnedInToys"];
                v1 = 360 / #G.GetChildren(G);
                G = 0;
                v3 = isMoving;
                p = v3;
                while not v3 do
                    if p then
                        p = r259;
                        v3 = p.WaitForChild(p, "HumanoidRootPart").Position;
                        G = (G + speed * .1) % 360;
                        k = workspace[r258.Name .. "SpawnedInToys"];
                        k = {
                            pairs(k.GetChildren(k))
                        };
                        v4 = k[3];
                        k = 1;
                        while true do
                            L = {
                                k[1](k[2], k[3])
                            };
                            v6 = L[2];
                            if k[1](k[2], k[3]) == nil then
                                wait(.05);
                            else
                                L = v8 + 360 / #G.GetChildren(G) * (1 - 1);
                                d = Vector3.new(v3.X + radius * math.cos(math.rad(L)), v3.v8 + height, v3.Z + radius * math.sin(math.rad(L)));
                                J = {
                                    pairs(N.GetDescendants(N))
                                };
                                v7 = pairs(N.GetDescendants(N));
                                S = J[3];
                                F = J[2];
                                q = true;
                                while q do
                                    r = {
                                        v7(F, r)
                                    };
                                    q = r[2];
                                    if v7(F, r) == nil then
                                        
                                    else
                                        J = r14;
                                        if q.IsA(q, "BasePart") then
                                            Z = (G + speed * .1) % 360;
                                            J = C.FindFirstChild(C, "BodyVelocity");
                                            r = J;
                                            if J then
                                                v8 = v8;
                                                J.MaxForce = Vector3.new(10000, 10000, 10000);
                                                J.Velocity = (d - C.Position) * speed * .1;
                                                Z = C.FindFirstChild(C, "BodyGyro") and false;
                                                Z = Instance.new("BodyGyro", C);
                                                v8 = v8;
                                                Z.MaxTorque = Vector3.new(10000, 10000, 10000);
                                                Z.CFrame = CFrame.new(d) * CFrame.Angles(math.rad(xRotation), math.rad(yRotation), math.rad(zRotation));
                                                C.CanCollide = false;
                                                C.Anchored = false;
                                            else
                                                r = Instance.new("BodyVelocity", C);
                                            end;
                                        end;
                                    end; 
                                end;
                                k = 1 + 1;
                            end; 
                        end;
                    end;
                    return; 
                end;
                p = selectedEffect == "Orbit ������"; 
            end;
            ae.vu276 = OQ_124;
            local function OQ_125(...)
                G = workspace[r258.Name .. "SpawnedInToys"];
                v1 = 360 / #G.GetChildren(G);
                G = 0;
                v3 = isMoving;
                p = v3;
                while not v3 do
                    if p then
                        p = r259;
                        v3 = p.WaitForChild(p, "HumanoidRootPart").Position;
                        G = (G + speed * .1) % 360;
                        k = workspace[r258.Name .. "SpawnedInToys"];
                        k = {
                            pairs(k.GetChildren(k))
                        };
                        v4 = k[3];
                        k = 1;
                        while true do
                            L = {
                                k[1](k[2], k[3])
                            };
                            v6 = L[2];
                            if k[1](k[2], k[3]) == nil then
                                wait(.05);
                            else
                                Q = {
                                    pairs(N.GetDescendants(N))
                                };
                                L = pairs(N.GetDescendants(N));
                                o = Q[2];
                                n = Q[3];
                                d = true;
                                while d do
                                    S = {
                                        L(o, S)
                                    };
                                    d = S[2];
                                    if L(o, S) == nil then
                                        
                                    else
                                        S = d.IsA(d, "BasePart");
                                        if S then
                                            S = v8 + 360 / #G.GetChildren(G) * (1 - 1);
                                            Vector3.new(v3.X + radius * math.cos(math.rad(S)), v3.v8 + 1 % layers * height, v3.Z + radius * math.sin(math.rad(S)));
                                            J = (G + speed * .1) % 360;
                                            y = F.FindFirstChild(F, "BodyVelocity");
                                            r = y;
                                            if y then
                                                v8 = v8;
                                                r.MaxForce = Vector3.new(10000, 10000, 10000);
                                                r.Velocity = (Z - F.Position) * speed * .1;
                                                J = F.FindFirstChild(F, "BodyGyro") and false;
                                                J = Instance.new("BodyGyro", F);
                                                v8 = v8;
                                                J.MaxTorque = Vector3.new(10000, 10000, 10000);
                                                J.CFrame = CFrame.new(Z) * CFrame.Angles(math.rad(xRotation), math.rad(yRotation), math.rad(zRotation));
                                                F.CanCollide = false;
                                                F.Anchored = false;
                                            else
                                                r = Instance.new("BodyVelocity", F);
                                            end;
                                        end;
                                    end; 
                                end;
                                k = 1 + 1;
                            end; 
                        end;
                    end;
                    return; 
                end;
                p = selectedEffect == "Tornado ������️"; 
            end;
            ae.vu296 = OQ_125;
            grabEverything = function(...)
                G = grabEnabled;
                p = G;
                while not G do
                    if p then
                        z = workspace;
                        z = {
                            pairs(z.GetDescendants(z))
                        };
                        v3 = z[3];
                        z = pairs(z.GetDescendants(z));
                        while true do
                            v4 = {
                                z(z[2], z[3])
                            };
                            v2 = v4[2];
                            v8 = z(z[2], z[3]);
                            v8 = v8;
                            if v8 == nil or not grabEnabled then
                                
                            else
                                k = "BasePart";
                                if p.IsA(p, k) then
                                    k = CreateGrabLine;
                                    k.FireServer(k, unpack({
                                        p,
                                        CFrame.new(-18.161, 91, -36.838) * CFrame.Angles(0, 0, 0)
                                    }));
                                end;
                            end; 
                        end;
                        wait(grabSpeed);
                    end;
                    return; 
                end;
                p = tick() - tick() < 2; 
            end;
            ae.grabEverything = grabEverything;
            local function r286(...)
                if grabEnabled then
                    grabEverything();
                    task.delay(5, r286);
                end;
                return; 
            end;
            ae.vu313 = r286;
            createGrabLineForAll = function(...)
                v1 = r276;
                v2 = {
                    ipairs(v1.GetPlayers(v1))
                };
                v3 = v2[3];
                z = ipairs(v1.GetPlayers(v1));
                while true do
                    v4 = {
                        z(v2[2], v2[3])
                    };
                    v2 = v4[2];
                    if z(v2[2], v2[3]) == nil then
                        break;
                    else
                        k = z(v2[2], v2[3]);
                        v6 = p.Character;
                        if v6 then
                            v6 = p.Character;
                            v4 = v6.FindFirstChild(v6, "Head");
                        end;
                        v8 = k;
                        if v6 then
                            k = r277.GrabEvents.CreateGrabLine;
                            k.FireServer(k, unpack({
                                p.Character.Head,
                                CFrame.new(.303462266922, .17847490310669, -0.5) * CFrame.Angles(.25703716278076, -1.5707963705063, 0)
                            }));
                        end;
                    end; 
                end;
                return; 
            end;
            ae.createGrabLineForAll = createGrabLineForAll;
            toggleLag = function(arg1_357, ...)
                isLagging = arg1_357;
                p = isLagging;
                if p then
                    p = r278;
                    p.BindToRenderStep(p, "LagEffect", Enum.RenderPriority.Last.Value, function(...)
                        createGrabLineForAll();
                        wait(lagSpeed);
                        return; 
                    end);
                else
                    p = r278;
                    p.UnbindFromRenderStep(p, "LagEffect");
                end;
                return; 
            end;
            ae.toggleLag = toggleLag;
            updateLagSpeed = function(arg1_358, ...)
                lagSpeed = 1 - arg1_358 / 20 * .95;
                return; 
            end;
            ae.updateLagSpeed = updateLagSpeed;
            applyGrabLineLag = function(...)
                while toggle do
                    v3 = players;
                    v3 = {
                        pairs(v3.GetPlayers(v3))
                    };
                    G = v3[3];
                    v3 = pairs(v3.GetPlayers(v3));
                    while true do
                        v2 = {
                            v3(v3[2], v3[3])
                        };
                        z = v2[2];
                        if v3(v3[2], v3[3]) == nil then
                            wait(vu327);
                        else
                            v4 = v3(v3[2], v3[3]);
                            k = p.Character;
                            if k then
                                k = p.Character;
                                v2 = k.FindFirstChild(k, "Head");
                            end;
                            v8 = v4;
                            if k then
                                v4 = vu326.CreateGrabLine;
                                v4.FireServer(v4, unpack({
                                    p.Character.Head,
                                    CFrame.new(.303, .178, -0.5) * CFrame.Angles(.257, -1.571, 0)
                                }));
                                p.Character.HumanoidRootPart.Velocity = Vector3.new(0, 500, 0);
                                k = game;
                                v4 = k.GetService(k, "RunService").Stepped;
                                v4.Wait(v4);
                            end;
                        end; 
                    end; 
                end;
                return; 
            end;
            ae.applyGrabLineLag = applyGrabLineLag;
            makePlayerFall = function(arg1_359, ...)
                v1 = arg1_359;
                G = v1.Character;
                if G then
                    G = v1.Character;
                    p = G.FindFirstChild(G, "HumanoidRootPart");
                end;
                if G then
                    v1.Character.HumanoidRootPart.Velocity = Vector3.new(0, -50, 0);
                end;
                return; 
            end;
            ae.makePlayerFall = makePlayerFall;
            toggleScript = function(arg1_360, ...)
                toggle = arg1_360;
                if toggle then
                    applyGrabLineLag();
                else
                    v2 = players;
                    v2 = {
                        pairs(v2.GetPlayers(v2))
                    };
                    z = v2[3];
                    while true do
                        k = {
                            pairs(v2.GetPlayers(v2))(v2[2], v2[3])
                        };
                        v2 = k[2];
                        if pairs(v2.GetPlayers(v2))(v2[2], v2[3]) == nil then
                            
                        else
                            makePlayerFall(v4);
                        end; 
                    end;
                    return;
                end; 
            end;
            ae.toggleScript = toggleScript;
            isDescendantOf = function(arg1_361, arg2_361, ...)
                v3 = arg1_361.Parent;
                while v3 do
                    if v3 == arg2_361 then
                        return true;
                    else
                        v3 = v3.Parent;
                    end; 
                end;
                return false; 
            end;
            r23.isDescendantOf = isDescendantOf;
            GetDescendant = function(arg1_362, arg2_362, ...)
                v1 = arg1_362;
                G = arg2_362;
                v4 = {
                    ipairs(v1.GetDescendants(v1))
                };
                z = v4[3];
                while true do
                    k = {
                        ipairs(v1.GetDescendants(v1))(v4[2], v4[3])
                    };
                    v4 = k[2];
                    if ipairs(v1.GetDescendants(v1))(v4[2], v4[3]) == nil then
                        break;
                    else
                        if v4.Name == arg2_362 then
                            return p;
                        else
                            
                        end;
                    end; 
                end;
                return nil; 
            end;
            ae.GetDescendant = GetDescendant;
            FindFirstAncestorOfType = function(arg1_363, arg2_363, ...)
                v1 = arg1_363;
                if v1 then
                    v3 = v1.FindFirstAncestorWhichIsA(v1, arg2_363);
                end;
                v8 = v8;
                return v1 or nil; 
            end;
            ae.FindFirstAncestorOfType = FindFirstAncestorOfType;
            cleanupConnections = function(arg1_364, ...)
                v1 = arg1_364;
                z = {
                    ipairs(v1)
                };
                v3 = z[3];
                z = ipairs(v1);
                while true do
                    v4 = {
                        z(z[2], z[3])
                    };
                    v2 = v4[2];
                    if z(z[2], z[3]) == nil then
                        
                    else
                        p.Disconnect(p);
                    end; 
                end;
                for h = #v1, 1, -1 do
                    table.remove(v1, v4); 
                end;
                return; 
            end;
            r23.cleanupConnections = cleanupConnections;
            createHighlightAndImage = function(arg1_365, ...)
                v1 = arg1_365;
                G = Instance.new("Highlight");
                G.DepthMode = Enum.HighlightDepthMode.Occluded;
                G.FillTransparency = 1;
                G.Name = "Highlight";
                G.OutlineColor = Color3.fromRGB(0, 255, 255);
                G.OutlineTransparency = 0.5;
                p = v1;
                G.Parent = p;
                print("Created highlight and set on " .. v1.Name);
                v3 = Instance.new("BillboardGui");
                v3.Name = "ImageOverlay";
                v3.Size = UDim2.new(0, 70, 0, 70);
                v3.StudsOffset = Vector3.new(0, 3, 0);
                v3.AlwaysOnTop = true;
                v3.Adornee = v1;
                v3.Parent = v1;
                z = Instance.new("ImageLabel");
                z.Size = UDim2.new(1, 0, 1, 0);
                z.Position = UDim2.new(0, 0, 0, 0);
                z.BackgroundTransparency = 1;
                z.Image = "rbxassetid://122000268316876";
                z.Parent = v3;
                print("Added image overlay to " .. v1.Name);
                return {
                    ["Highlight"] = G,
                    ["BillboardGui"] = v3
                }; 
            end;
            ae.createHighlightAndImage = createHighlightAndImage;
            onPartOwnerAdded = function(arg1_366, arg2_366, ...)
                v1 = arg1_366;
                G = arg2_366;
                v3 = v1.Name == "PartOwner" and (v1.Value ~= r257.Name and GetDescendant(G, "Highlight"));
                if v3 then
                    if v1.Value == r257.Name then
                        v3.OutlineColor = Color3.fromRGB(0, 255, 255);
                    else
                        v3.OutlineColor = Color3.new(1, 0, 0);
                    end;
                    print("Updated highlight color for", G.Name, "to", v3.OutlineColor);
                end;
                return; 
            end;
            r23.onPartOwnerAdded = onPartOwnerAdded;
            createBodyMovers = function(arg1_367, arg2_367, arg3_367, ...)
                v1 = arg1_367;
                z = Instance.new("BodyPosition");
                v2 = Instance.new("BodyGyro");
                z.P = 15000;
                z.D = 200;
                z.MaxForce = Vector3.new(5000000, 5000000, 5000000);
                p = arg2_367;
                z.Position = p;
                p = v1;
                z.Parent = p;
                v2.P = 15000;
                v2.D = 200;
                v2.MaxTorque = Vector3.new(5000000, 5000000, 5000000);
                p = arg3_367;
                v2.CFrame = p;
                v2.Parent = v1;
                print("Created BodyMovers for", v1.Name);
                return; 
            end;
            r23.createBodyMovers = createBodyMovers;
            anchorGrab = function(...)
                v8 = true;
                while v8 do
                    pcall(function(...)
                        v8 = workspace;
                        v1 = v8.FindFirstChild(v8, "GrabParts");
                        if not v1 then
                            return;
                        end;
                        G = v1.FindFirstChild(v1, "GrabPart");
                        if not G then
                            return;
                        end;
                        v8 = G.FindFirstChild(G, "WeldConstraint");
                        z = v8;
                        v3 = v3.Part1.Name ~= "SoundPart";
                        if v3 then
                            p = v3.Part1;
                        end;
                        v8 = z;
                        if not v3 then
                            return;
                        end;
                        if v3.Part1.Name ~= "SoundPart" then
                            v2 = "Parent";
                            if v3.Part1[v2] then
                                n = 6196805815109;
                                v2 = v8.Part1.Parent;
                                v4 = v2.FindFirstChild(v2, r14[r15("P\x02\xd1\x10_s\x9b\x8f\xb6", n)]);
                                if v4 then
                                    r287 = v4;
                                    if not r287 then
                                        return;
                                    end;
                                    if r287.Anchored then
                                        return;
                                    end;
                                    v6 = workspace;
                                    if v6.FindFirstChild(v6, "Map") and isDescendantOf(r287, workspace.Map) then
                                        return;
                                    end;
                                    v4 = r280;
                                    n = {
                                        pairs(v4.GetPlayers(v4))
                                    };
                                    L = n[3];
                                    while true do
                                        d = {
                                            pairs(v4.GetPlayers(v4))(n[2], n[3])
                                        };
                                        if pairs(v4.GetPlayers(v4))(n[2], n[3]) == nil then
                                            
                                        else
                                            if isDescendantOf(r287, d[2].Character) then
                                                return;
                                            else
                                                
                                            end;
                                        end; 
                                    end;
                                    S = r287;
                                    S = {
                                        pairs(S.GetDescendants(S))
                                    };
                                    F = S[3];
                                    S = true;
                                    while S do
                                        C = {
                                            S[1](S[2], S[3])
                                        };
                                        S = C[2];
                                        if S[1](S[2], S[3]) == nil then
                                            
                                        else
                                            if table.find(vu10, S) then
                                                k = false;
                                            else
                                                
                                            end;
                                        end; 
                                    end;
                                    if true then
                                        S = not table.find(vu10, r287);
                                    end;
                                    v8 = p[v2];
                                    if true then
                                        Z = r;
                                        y = FindFirstAncestorOfType(r287, "Model");
                                        if y then
                                            r = FindFirstAncestorOfType(r287, "Model") ~= workspace;
                                        end;
                                        if y then
                                            Z = Z;
                                            J = FindFirstAncestorOfType;
                                            y = J(r287, "Model");
                                            if y then
                                                S = y;
                                                v8 = Z;
                                                createHighlightAndImage(S);
                                                table.insert(vu10, r287);
                                                print("Anchored part:", S.Name);
                                                J = S.DescendantAdded;
                                                table.insert(vu11, J.Connect(J, function(arg1_368, ...)
                                                    onPartOwnerAdded(arg1_368, r287);
                                                    return; 
                                                end));
                                                a = "\xf9Z\x81\x99\x0f";
                                                De = "Model";
                                                J = FindFirstAncestorOfType(r287, r14[De]);
                                                if J then
                                                    S = J ~= workspace;
                                                end;
                                                v8 = v8;
                                                if J then
                                                    De = {
                                                        ipairs(J.GetDescendants(J))
                                                    };
                                                    w = De[3];
                                                    while true do
                                                        a = {
                                                            ipairs(J.GetDescendants(J))(De[2], De[3])
                                                        };
                                                        S = a[2];
                                                        if ipairs(J.GetDescendants(J))(De[2], De[3]) == nil then
                                                            
                                                        else
                                                            v8 = y;
                                                            if De.IsA(De, "BodyPosition") or De.IsA(De, "BodyGyro") then
                                                                De.Destroy(De);
                                                                print("Destroyed BodyMover:", De.Name, "from", FindFirstAncestorOfType(U[z], g).Name);
                                                            end;
                                                        end; 
                                                    end;
                                                else
                                                    a = r287;
                                                    a = {
                                                        ipairs(a.GetChildren(a))
                                                    };
                                                    w = a[3];
                                                    while true do
                                                        s = {
                                                            ipairs(a.GetChildren(a))(a[2], a[3])
                                                        };
                                                        S = s[2];
                                                        if ipairs(a.GetChildren(a))(a[2], a[3]) == nil then
                                                            
                                                        else
                                                            v8 = y;
                                                            if B.IsA(B, "BodyPosition") or B.IsA(B, "BodyGyro") then
                                                                B.Destroy(B);
                                                                print("Destroyed BodyMover:", B.Name, "from", r287.Name);
                                                            end;
                                                        end; 
                                                    end;
                                                    S = workspace;
                                                    while S.FindFirstChild(S, "GrabParts") do
                                                        S = r279.Heartbeat;
                                                        S.Wait(S); 
                                                    end;
                                                    createBodyMovers(r287, r287.Position, r287.CFrame);
                                                    return;
                                                end;
                                            else
                                                r = r287;
                                            end;
                                        else
                                            S = r287;
                                        end;
                                    end;
                                end;
                            else
                                r287 = v3.Part1;
                            end;
                        else
                            r287 = v3.Part1;
                        end; 
                    end);
                    v8 = r279.Heartbeat;
                    v8.Wait(v8); 
                end;
                return; 
            end;
            r23.anchorGrab = anchorGrab;
            cleanupAnchoredParts = function(...)
                z = {
                    ipairs(vu10)
                };
                v3 = ipairs(vu10);
                G = z[3];
                while true do
                    v2 = {
                        v3(z[2], z[3])
                    };
                    z = v2[2];
                    if v3(z[2], z[3]) == nil then
                        break;
                    else
                        if z then
                            if p.FindFirstChild(p, "BodyPosition") then
                                v2 = p.BodyPosition;
                                v2.Destroy(v2);
                                print("Destroyed BodyPosition for", p.Name);
                            end;
                            if p.FindFirstChild(p, "BodyGyro") then
                                v2 = p.BodyGyro;
                                v2.Destroy(v2);
                                print("Destroyed BodyGyro for", p.Name);
                            end;
                            k = not GetDescendant(p, "Highlight");
                            if k then
                                v2 = FindFirstAncestorOfType(p, "Model");
                            end;
                            v8 = v2[1];
                            if k then
                                k = FindFirstAncestorOfType(p, "Model");
                                v2 = k.FindFirstChild(k, "Highlight");
                            end;
                            if k then
                                k.Destroy(k);
                                print("Destroyed Highlight for", p.Name);
                            end;
                            N = not GetDescendant(p, "ImageOverlay");
                            if N then
                                k = FindFirstAncestorOfType(p, "Model");
                            end;
                            v8 = v8;
                            if N then
                                N = FindFirstAncestorOfType(p, "Model");
                                k = N.FindFirstChild(N, "ImageOverlay");
                            end;
                            if N then
                                N.Destroy(N);
                                print("Destroyed Image Overlay for", p.Name);
                            end;
                        end;
                    end; 
                end;
                cleanupConnections(vu11);
                vu10 = {};
                print("Cleaned up all anchored parts and connections.");
                return; 
            end;
            r23.cleanupAnchoredParts = cleanupAnchoredParts;
            updateBodyMovers = function(arg1_369, ...)
                v1 = arg1_369;
                v2 = {
                    ipairs(vu12)
                };
                z = ipairs(vu12);
                v3 = v2[3];
                while true do
                    v4 = {
                        z(v2[2], v2[3])
                    };
                    v2 = v4[2];
                    if z(v2[2], v2[3]) == nil then
                        break;
                    else
                        o = r15;
                        v8 = z(v2[2], v2[3]);
                        if p.primaryPart and p.primaryPart == arg1_369 then
                            o = {
                                ipairs(p.group)
                            };
                            N = o[3];
                            while true do
                                n = {
                                    ipairs(p.group)(o[2], o[3])
                                };
                                v4 = n[2];
                                if ipairs(p.group)(o[2], o[3]) == nil then
                                    
                                else
                                    v7 = o.part;
                                    n = v7.FindFirstChild(v7, "BodyPosition");
                                    v7 = o.part;
                                    d = v7.FindFirstChild(v7, "BodyGyro");
                                    if n then
                                        n.Position = (arg1_369.CFrame * o.offset).Position;
                                    end;
                                    if d then
                                        d.CFrame = arg1_369.CFrame * o.offset;
                                    end;
                                end; 
                            end;
                        end;
                    end; 
                end;
                return; 
            end;
            r23.updateBodyMovers = updateBodyMovers;
            compileGroup = function(...)
                v8 = #vu10 ~= 0;
                if v8 then
                    v8 = r254;
                    v8.MakeNotification(v8, {
                        ["Name"] = "Success",
                        ["Content"] = "Compiled " .. #vu10 .. " Toys together",
                        ["Image"] = "rbxassetid://4483345998",
                        ["Time"] = 5
                    });
                else
                    v8 = r254;
                    v8.MakeNotification(v8, {
                        ["Name"] = "Error",
                        ["Content"] = "No anchored parts found",
                        ["Image"] = "rbxassetid://4483345998",
                        ["Time"] = 5
                    });
                end;
                r288 = vu10[1];
                if r288 then
                    v3 = r288;
                    p = not v3.FindFirstChild(v3, "Highlight");
                    G = p and FindFirstAncestorOfType(r288, "Model");
                    if G then
                        p = FindFirstAncestorOfType(r288, "Model");
                        G = p.FindFirstChild(p, "Highlight");
                    end;
                    p = not G;
                    if p then
                        p = r288.Parent;
                        if p.IsA(p, "Model") then
                            v8 = U[v1];
                            z = r288.Parent or r288;
                        else
                            z = r288;
                        end;
                        G = createHighlightAndImage(nil).Highlight;
                    end;
                    G.OutlineColor = Color3.new(0, 1, 0);
                    G.FillColor = Color3.new(0, 1, 0);
                    G.FillTransparency = 0;
                    G.FillTransparency = 0;
                    G.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
                    L = {
                        ipairs(vu10)
                    };
                    v6 = L[3];
                    while true do
                        n = {
                            ipairs(vu10)(L[2], L[3])
                        };
                        N = n[2];
                        if ipairs(vu10)(L[2], L[3]) == nil then
                            
                        else
                            if o ~= r288 then
                                F = r288.CFrame;
                                table.insert({}, {
                                    ["part"] = o,
                                    ["offset"] = F.ToObjectSpace(F, o.CFrame)
                                });
                            end;
                        end; 
                    end;
                    table.insert(vu12, {
                        ["primaryPart"] = r288,
                        ["group"] = {}
                    });
                    N = r288;
                    n = N.GetPropertyChangedSignal(N, "CFrame");
                    table.insert(vu13, n.Connect(n, function(...)
                        updateBodyMovers(r288);
                        return; 
                    end));
                    n = r279.Heartbeat;
                    table.insert(r267, n.Connect(n, function(...)
                        updateBodyMovers(r288);
                        return; 
                    end));
                    print("Compiled group with primary part:", r288.Name);
                end;
                return; 
            end;
            r23.compileGroup = compileGroup;
            cleanupCompiledGroups = function(...)
                z = {
                    ipairs(vu12)
                };
                G = z[3];
                v3 = ipairs(vu12);
                while true do
                    v2 = {
                        v3(z[2], z[3])
                    };
                    z = v2[2];
                    if v3(z[2], z[3]) == nil then
                        break;
                    else
                        d = {
                            ipairs(p.group)
                        };
                        v2 = ipairs(p.group);
                        v4 = d[2];
                        k = d[3];
                        while true do
                            o = {
                                v2(v4, o)
                            };
                            v6 = o[2];
                            if v2(v4, o) == nil then
                                
                            else
                                o = L.part;
                                if o then
                                    o = L.part;
                                    if o.FindFirstChild(o, "BodyPosition") then
                                        o = L.part.BodyPosition;
                                        o.Destroy(o);
                                        print("Destroyed BodyPosition for", L.part.Name);
                                    end;
                                    o = L.part;
                                    if o.FindFirstChild(o, "BodyGyro") then
                                        o = L.part.BodyGyro;
                                        o.Destroy(o);
                                        print("Destroyed BodyGyro for", L.part.Name);
                                    end;
                                end;
                            end; 
                        end;
                        F = r15;
                        v8 = v2[1];
                        if p.primaryPart and p.primaryPart.Parent then
                            d = p.primaryPart;
                            n = not d.FindFirstChild(d, "Highlight");
                            if n then
                                v6 = FindFirstAncestorOfType(p.primaryPart, "Model");
                            end;
                            v8 = v8;
                            if n then
                                n = FindFirstAncestorOfType(p.primaryPart, "Model");
                                v6 = n.FindFirstChild(n, "Highlight");
                            end;
                            if n then
                                n.Destroy(n);
                                print("Destroyed Highlight for", p.primaryPart.Name);
                            end;
                            F = p.primaryPart;
                            v7 = not F.FindFirstChild(F, "ImageOverlay");
                            if v7 then
                                n = FindFirstAncestorOfType(p.primaryPart, "Model");
                            end;
                            v8 = v8;
                            if v7 then
                                v7 = FindFirstAncestorOfType(p.primaryPart, "Model");
                                n = v7.FindFirstChild(v7, "ImageOverlay");
                            end;
                            if v7 then
                                v7.Destroy(v7);
                                print("Destroyed Image Overlay for", p.primaryPart.Name);
                            end;
                        end;
                    end; 
                end;
                cleanupConnections(vu13);
                cleanupConnections(r267);
                vu12 = {};
                print("Cleaned up all compiled groups.");
                return; 
            end;
            r23.cleanupCompiledGroups = cleanupCompiledGroups;
            compileCoroutineFunc = function(...)
                v8 = true;
                while v8 do
                    pcall(function(...)
                        z = {
                            ipairs(vu12)
                        };
                        G = z[3];
                        v3 = ipairs(vu12);
                        while true do
                            v2 = {
                                v3(z[2], z[3])
                            };
                            z = v2[2];
                            if v3(z[2], z[3]) == nil then
                                break;
                            else
                                updateBodyMovers(p.primaryPart);
                            end; 
                        end;
                        return; 
                    end);
                    v8 = r279.Heartbeat;
                    v8.Wait(v8); 
                end;
                return; 
            end;
            r23.compileCoroutineFunc = compileCoroutineFunc;
            unanchorPrimaryPart = function(...)
                v1 = vu10[1];
                if v1 then
                    if v1.FindFirstChild(v1, "BodyPosition") then
                        v8 = v1.BodyPosition;
                        v8.Destroy(v8);
                        print("Destroyed BodyPosition for primary part:", v1.Name);
                    end;
                    if v1.FindFirstChild(v1, "BodyGyro") then
                        v8 = v1.BodyGyro;
                        v8.Destroy(v8);
                        print("Destroyed BodyGyro for primary part:", v1.Name);
                    end;
                    G = v1.FindFirstChild(v1, "Highlight");
                    if G then
                        G.Destroy(G);
                        print("Destroyed Highlight for primary part:", v1.Name);
                    end;
                    p = not v1.FindFirstChild(v1, "ImageOverlay");
                    v3 = p and FindFirstAncestorOfType(v1, "Model");
                    if v3 then
                        p = FindFirstAncestorOfType(v1, "Model");
                        v3 = p.FindFirstChild(p, "ImageOverlay");
                    end;
                    if v3 then
                        v3.Destroy(v3);
                        print("Destroyed Image Overlay for primary part:", v8.Name);
                    end;
                else
                    print("No primary part to unanchor.");
                end;
                return; 
            end;
            r23.unanchorPrimaryPart = unanchorPrimaryPart;
            recoverParts = function(...)
                v8 = true;
                while v8 do
                    pcall(function(...)
                        v4 = 26972789043472;
                        v1 = r257.Character;
                        if v1 then
                            v8 = r257[G[z]];
                            p = v1.FindFirstChild(v1, "Head") and v1.FindFirstChild(v1, "HumanoidRootPart");
                        end;
                        if v1 then
                            G = v1.HumanoidRootPart;
                            v4 = {
                                pairs(vu10)
                            };
                            z = v4[3];
                            v2 = pairs(vu10);
                            while true do
                                k = {
                                    v2(v4[2], v4[3])
                                };
                                v4 = k[2];
                                if v2(v4[2], v4[3]) == nil then
                                    
                                else
                                    if p then
                                        k = (p.Position - v1.HumanoidRootPart.Position).Magnitude <= 30;
                                    end;
                                    v8 = k[1];
                                    if p then
                                        N = not GetDescendant(p, "Highlight");
                                        k = N;
                                        if N then
                                            k = FindFirstAncestorOfType(p, "Model");
                                        end;
                                        v8 = v8;
                                        if k then
                                            N = FindFirstAncestorOfType(p, "Model");
                                            k = N.FindFirstChild(N, "Highlight");
                                        end;
                                        if k then
                                            N = k.OutlineColor == Color3.new(1, 0, 0);
                                        end;
                                        v8 = v8;
                                        if k then
                                            N = r255;
                                            N.FireServer(N, p, p.CFrame);
                                            v8 = v8;
                                            if p.FindFirstChild(p, "PartOwner") and p.PartOwner.Value == r257.Name then
                                                k.OutlineColor = Color3.fromRGB(0, 255, 255);
                                                print("Recovered and set ownership for", p.Name);
                                            end;
                                        end;
                                    end;
                                end; 
                            end;
                        end;
                        return; 
                    end);
                    v8 = r279.Heartbeat;
                    v8.Wait(v8); 
                end;
                return; 
            end;
            r23.recoverParts = recoverParts;
            local function r289(...)
                v8 = workspace;
                v4 = "SpawnedInToys";
                v1 = v8.FindFirstChild(v8, r258.Name .. r14[v4]);
                if v1 then
                    v4 = {
                        pairs(v1.GetChildren(v1))
                    };
                    v2 = pairs(v1.GetChildren(v1));
                    z = v4[3];
                    while true do
                        k = {
                            v2(v4[2], v4[3])
                        };
                        v4 = k[2];
                        if v2(v4[2], v4[3]) == nil then
                            
                        else
                            if p.Name == "MusicKeyboard" then
                                table.insert(v8, p);
                            end;
                        end; 
                    end;
                end;
                return {}; 
            end;
            ae.vu469 = r289;
            local function r290(...)
                G = {
                    "Key1F",
                    "Key1E",
                    "Key1G",
                    "Key3C",
                    "Key1C",
                    "Key1D",
                    "Key2Fsharp"
                };
                v8 = #r289() <= 0;
                if v8 then
                    warn("No MusicKeyboard toys found");
                else
                    v3 = v8;
                    z = r258.Character;
                    p = z;
                    if z then
                        v3 = p.WaitForChild(p, "HumanoidRootPart").Position;
                        v4 = {
                            pairs(r289())
                        };
                        v2 = v4[3];
                        v4 = pairs(r289());
                        while true do
                            v6 = {
                                v4(v4[2], v4[3])
                            };
                            k = v6[2];
                            if v4(v4[2], v4[3]) == nil then
                                
                            else
                                F = {
                                    ipairs({
                                        "Key1F",
                                        "Key1E",
                                        "Key1G",
                                        z,
                                        v2,
                                        v4,
                                        k
                                    })
                                };
                                N = F[2];
                                v6 = ipairs({
                                    "Key1F",
                                    "Key1E",
                                    "Key1G",
                                    z,
                                    v2,
                                    v4,
                                    k
                                });
                                L = F[3];
                                while true do
                                    v7 = {
                                        v6(N, v7)
                                    };
                                    o = v7[2];
                                    if v6(N, v7) == nil then
                                        
                                    else
                                        v7 = p.FindFirstChild(p, d);
                                        if v7 then
                                            Q = game;
                                            S = Q.GetService(Q, "ReplicatedStorage").GrabEvents.SetNetworkOwner;
                                            S.FireServer(S, unpack({
                                                v7,
                                                CFrame.new(v3.X, v3.v8 - 5, v3.Z)
                                            }));
                                        else
                                            warn("Part " .. d .. " not found in toy " .. p.Name);
                                        end;
                                    end; 
                                end;
                            end; 
                        end;
                        return;
                    else
                        z = r258.CharacterAdded;
                        p = z.Wait(z);
                    end;
                end; 
            end;
            ae.vu483 = r290;
            executeLoop = function(...)
                while loopActive do
                    r290();
                    wait(vu327); 
                end;
                return; 
            end;
            ae.executeLoop = executeLoop;
            local function OQ_129(arg1_370, ...)
                vu327 = math.clamp(arg1_370, .05, 5);
                print("��️ Loop speed set to: " .. vu327);
                return; 
            end;
            ae.v485 = OQ_129;
            local function r291(...)
                v8 = workspace;
                v4 = "SpawnedInToys";
                v1 = v8.FindFirstChild(v8, r258.Name .. r14[v4]);
                if v1 then
                    v4 = {
                        pairs(v1.GetChildren(v1))
                    };
                    v2 = pairs(v1.GetChildren(v1));
                    z = v4[3];
                    while true do
                        k = {
                            v2(v4[2], v4[3])
                        };
                        v4 = k[2];
                        if v2(v4[2], v4[3]) == nil then
                            
                        else
                            if p.Name == "MusicKeyboard" then
                                table.insert(v8, p);
                            end;
                        end; 
                    end;
                end;
                return {}; 
            end;
            ae.vu493 = r291;
            local function r292(...)
                v8 = #r291() <= 0;
                if v8 then
                    warn("No MusicKeyboard toys found");
                else
                    G = v8;
                    v4 = r14;
                    v3 = r258.Character;
                    p = v3;
                    if v3 then
                        G = p.WaitForChild(p, "HumanoidRootPart").Position;
                        v4 = {
                            ipairs(currentSong)
                        };
                        z = v4[3];
                        v2 = ipairs(currentSong);
                        while true do
                            k = {
                                v2(v4[2], v4[3])
                            };
                            v4 = k[2];
                            if v2(v4[2], v4[3]) == nil then
                                
                            else
                                k = p[1];
                                S = {
                                    pairs(r291())
                                };
                                L = S[2];
                                N = pairs(r291());
                                o = S[3];
                                while true do
                                    F = {
                                        N(L, F)
                                    };
                                    n = F[2];
                                    if N(L, F) == nil then
                                        
                                    else
                                        F = v7.FindFirstChild(v7, v4[1]);
                                        if F then
                                            C = game;
                                            q = C.GetService(C, "ReplicatedStorage").GrabEvents.SetNetworkOwner;
                                            q.FireServer(q, unpack({
                                                F,
                                                CFrame.new(G.X, G.v8 - 5, G.Z)
                                            }));
                                        else
                                            warn("Part " .. v4[1] .. " not found in toy " .. v7.Name);
                                        end;
                                    end; 
                                end;
                                wait(p[2] * playSpeed);
                            end; 
                        end;
                        return;
                    else
                        v3 = r258.CharacterAdded;
                        p = v3.Wait(v3);
                    end;
                end; 
            end;
            ae.vu510 = r292;
            local function r293(...)
                while loopActive do
                    r292(); 
                end;
                return; 
            end;
            ae.vu511 = r293;
            local function OQ_133(arg1_371, ...)
                if arg1_371 then
                    loopActive = true;
                    print("����� Loop activated ������");
                    spawn(r293);
                else
                    loopActive = false;
                    print("����� Loop deactivated ������");
                end;
                return; 
            end;
            ae.v513 = OQ_133;
            local function r294(...)
                v8 = workspace;
                v4 = "SpawnedInToys";
                v1 = v8.FindFirstChild(v8, vu516.Name .. r14[v4]);
                if v1 then
                    v4 = {
                        pairs(v1.GetChildren(v1))
                    };
                    z = v4[3];
                    v2 = pairs(v1.GetChildren(v1));
                    while true do
                        k = {
                            v2(v4[2], v4[3])
                        };
                        v4 = k[2];
                        if v2(v4[2], v4[3]) == nil then
                            
                        else
                            if p.Name == "MusicKeyboard" then
                                table.insert(v8, p);
                            end;
                        end; 
                    end;
                end;
                return {}; 
            end;
            ae.vu523 = r294;
            local function r295(arg1_372, ...)
                v1 = arg1_372;
                if #r294() ~= 0 then
                    v3 = vu516.Character;
                    if v3 then
                        v3 = v3.FindFirstChild(v3, "HumanoidRootPart");
                        if v3 then
                            z = v3.Position;
                            k = {
                                ipairs(arg1_372)
                            };
                            v4 = k[3];
                            k = ipairs(arg1_372);
                            while true do
                                N = {
                                    k(k[2], k[3])
                                };
                                v6 = N[2];
                                if k(k[2], k[3]) == nil then
                                    
                                else
                                    S = {
                                        pairs(r294())
                                    };
                                    L = S[2];
                                    o = S[3];
                                    N = pairs(r294());
                                    while true do
                                        F = {
                                            N(L, F)
                                        };
                                        n = F[2];
                                        if N(L, F) == nil then
                                            
                                        else
                                            F = v7.FindFirstChild(v7, p);
                                            if F then
                                                q = vu526.GrabEvents.SetNetworkOwner;
                                                q.FireServer(q, unpack({
                                                    F,
                                                    CFrame.new(z.X, z.v8 - 5, z.Z)
                                                }));
                                            else
                                                warn("Part " .. p .. " not found in toy " .. v7.Name);
                                            end;
                                        end; 
                                    end;
                                    wait(vu327);
                                end; 
                            end;
                        else
                            warn("HumanoidRootPart not found in character");
                        end;
                        return;
                    else
                        v3 = vu516.CharacterAdded;
                        p = v3.Wait(v3);
                    end;
                end;
                warn("No MusicKeyboard toys found");
                return; 
            end;
            ae.vu541 = r295;
            local function r296(...)
                while loopActive do
                    r295(vu524[vu525]); 
                end;
                return; 
            end;
            ae.vu542 = r296;
            local function OQ_137(arg1_373, ...)
                if arg1_373 then
                    if not loopActive then
                        loopActive = true;
                        print("Loop activated");
                        spawn(r296);
                    end;
                else
                    loopActive = false;
                    print("Loop deactivated");
                end;
                return; 
            end;
            ae.v544 = OQ_137;
            SilentAim = function(...)
                r297 = {
                    "Head",
                    "Torso",
                    "Left Leg",
                    "Right Leg"
                };
                local function r298(...)
                    v1 = math.huge;
                    G = vu547;
                    v4 = {
                        pairs(G.GetPlayers(G))
                    };
                    z = v4[3];
                    while true do
                        v6 = {
                            pairs(G.GetPlayers(G))(v4[2], v4[3])
                        };
                        k = v6[2];
                        if pairs(G.GetPlayers(G))(v4[2], v4[3]) == nil then
                            break;
                        else
                            v7 = "Name";
                            L = p.Name ~= r257[v7];
                            v8 = pairs(G.GetPlayers(G))(v4[2], v4[3]);
                            if L and p.Character then
                                N = p.Character.HumanoidRootPart;
                                L = vu549;
                                v7 = {
                                    L.WorldToScreenPoint(L, N.Position)
                                };
                                o = L.WorldToScreenPoint(L, N.Position);
                                if v7[2] then
                                    v7 = "magnitude";
                                    L = (r257.Character.HumanoidRootPart.Position - N.Position)[v7];
                                    if L < math.huge then
                                        v7 = L;
                                        v1 = L;
                                        v4 = p;
                                    end;
                                end;
                            end;
                        end; 
                    end;
                    return nil; 
                end;
                v8 = vu548.RenderStepped;
                vu552 = v8.Connect(v8, function(...)
                    if vu550 then
                        r298();
                    end;
                    return; 
                end);
                if not vu553 then
                    vu553 = hookmetamethod(game, "__namecall", function(...)
                        if select(-1, ...) == workspace and (not checkcaller() and (getnamecallmethod() == "Raycast" and vu550)) then
                            v2 = r298();
                            if v2 then
                                v8 = r298;
                                p = v2.Character and (v2.Character.HumanoidRootPart and (r257.Character.HumanoidRootPart and v2.Character.Humanoid.Health > 0));
                            end;
                            if v2 then
                                k = r297[math.random(1, #r297)];
                                v6 = v2.Character[k];
                                N = (r257.Character.HumanoidRootPart.Position - v2.Character.HumanoidRootPart.Position).magnitude <= vu551;
                                if N then
                                    p = v8;
                                end;
                                if N then
                                    G[3] = (v2.Character[k].Position - G[2]).Unit * 1000;
                                    G[4] = RaycastParams.new();
                                    G[4].FilterDescendantsInstances = {
                                        v2.Character
                                    };
                                    G[4].FilterType = Enum.RaycastFilterType.Include;
                                end;
                            end;
                        end;
                        return vu553(unpack(G)); 
                    end);
                end;
                return; 
            end;
            ae.SilentAim = SilentAim;
            ToggleSilentAim = function(arg1_374, ...)
                if arg1_374 then
                    if not vu552 then
                        SilentAim();
                    end;
                else
                    if vu552 then
                        v8 = vu552;
                        v8.Disconnect(v8);
                        vu552 = nil;
                    end;
                    return;
                end; 
            end;
            ae.ToggleSilentAim = ToggleSilentAim;
            updatePlayersDropdown = function(arg1_375, ...)
                v1 = arg1_375;
                table.clear(playerNames);
                z = game.Players;
                z = {
                    pairs(z.GetPlayers(z))
                };
                v3 = z[3];
                z = pairs(z.GetPlayers(z));
                while true do
                    v4 = {
                        z(z[2], z[3])
                    };
                    v2 = v4[2];
                    if z(z[2], z[3]) == nil then
                        break;
                    else
                        table.insert(playerNames, p.DisplayName);
                    end; 
                end;
                v1.Refresh(v1, playerNames);
                return; 
            end;
            ae.updatePlayersDropdown = updatePlayersDropdown;
            createPlayerInfoGui = function(arg1_376, ...)
                v1 = arg1_376;
                playerInfoFrame = Instance.new("BillboardGui");
                playerInfoFrame.Size = UDim2.new(0, 200, 0, 60);
                playerInfoFrame.StudsOffset = Vector3.new(0, 3, 0);
                v2 = v1.Character;
                v8 = playerInfoFrame;
                v8.Adornee = v2.FindFirstChild(v2, "Head") or v2.FindFirstChild(v2, "HumanoidRootPart");
                playerInfoFrame.Parent = v1.Character;
                G = Instance.new("Frame", playerInfoFrame);
                G.Size = UDim2.new(1, 0, 1, 0);
                G.BackgroundTransparency = 1;
                G.BorderSizePixel = 0;
                imageLabel = Instance.new("ImageLabel", playerInfoFrame);
                imageLabel.Size = UDim2.new(.3, 0, 1, 0);
                imageLabel.Position = UDim2.new(0, 0, 0, 0);
                imageLabel.BackgroundTransparency = 1;
                imageLabel.Image = "rbxassetid://0000000000";
                imageLabel.ClipsDescendants = true;
                imageLabel.BorderSizePixel = 0;
                imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                cornerRadius = Instance.new("UICorner");
                cornerRadius.CornerRadius = UDim.new(0.5, 0);
                cornerRadius.Parent = imageLabel;
                textLabel = Instance.new("TextLabel", playerInfoFrame);
                textLabel.Size = UDim2.new(.7, 0, 1, 0);
                textLabel.Position = UDim2.new(.35, 0, 0, 0);
                textLabel.BackgroundTransparency = 1;
                textLabel.TextColor3 = Color3.fromRGB(0, 0, 0);
                textLabel.TextStrokeTransparency = .8;
                textLabel.TextScaled = true;
                textLabel.TextWrapped = true;
                textLabel.Text = "";
                textCornerRadius = Instance.new("UICorner");
                textCornerRadius.CornerRadius = UDim.new(0.5, 0);
                textCornerRadius.Parent = textLabel;
                rainbowText = function(...)
                    G = 1;
                    while playerInfoEnabled do
                        textLabel.TextColor3 = Color3.fromRGB(255, 0, 0);
                        G = 1 % #v1 + 1;
                        wait(.1); 
                    end;
                    return; 
                end;
                coroutine.wrap(rainbowText)();
                return playerInfoFrame, imageLabel, textLabel; 
            end;
            ae.createPlayerInfoGui = createPlayerInfoGui;
            createFlowerEffect = function(...)
                r299 = Instance.new("ScreenGui");
                r299.Parent = vu516.PlayerGui;
                r300 = Instance.new("Frame");
                r300.Size = UDim2.new(1, 0, 1, 0);
                r300.Position = UDim2.new(0, 0, 0, 0);
                r300.BackgroundTransparency = 1;
                r300.Parent = r299;
                for V = 1, 12 do
                    N = Instance.new("ImageLabel");
                    N.Size = UDim2.new(.2, 0, .4, 0);
                    N.Position = UDim2.new(0.5, -10, 0.5, -20);
                    N.AnchorPoint = Vector2.new(0.5, 0.5);
                    N.BackgroundTransparency = 1;
                    N.Image = "rbxassetid://12345678";
                    N.Rotation = v3 * 30;
                    N.Parent = r300;
                    N.ImageColor3 = Color3.fromHSV(v3 / 12, 1, 1);
                    N.ImageTransparency = 0.5; 
                end;
                r301 = tick();
                p = game;
                v8 = p.GetService(p, "RunService").RenderStepped;
                v8.Connect(v8, function(...)
                    v1 = (tick() - r301) * effectColorSpeed % 1;
                    G = r300;
                    v4 = {
                        ipairs(G.GetChildren(G))
                    };
                    v2 = ipairs(G.GetChildren(G));
                    z = v4[3];
                    while true do
                        k = {
                            v2(v4[2], v4[3])
                        };
                        v4 = k[2];
                        if v2(v4[2], v4[3]) == nil then
                            break;
                        else
                            n = "\x8fS\xc9b\xf6c\xa5\x13d5";
                            if p.IsA(p, "ImageLabel") then
                                p.ImageColor3 = Color3.fromHSV((tick() - r301) * effectColorSpeed % 1, 1, 1);
                                d = game;
                                n = d.GetService(d, "RunService").RenderStepped;
                                p.Rotation = p.Rotation + effectColorSpeed * 50 * n.Wait(n);
                            end;
                        end; 
                    end;
                    return; 
                end);
                delay(effectDuration, function(...)
                    v8 = r299;
                    if v8 then
                        v8 = r299;
                        v8.Destroy(v8);
                    end;
                    return; 
                end);
                return; 
            end;
            ae.createFlowerEffect = createFlowerEffect;
            playRandomSpeedAudio = function(arg1_377, ...)
                G = Instance.new("Sound");
                p = arg1_377;
                G.SoundId = p;
                G.Parent = vu516.PlayerGui;
                G.PlaybackSpeed = math.random() * (maxSpeed - minSpeed) + minSpeed;
                G.Play(G);
                v8 = game;
                p = v8.GetService(v8, "Debris");
                p.AddItem(p, G, audioDuration);
                return; 
            end;
            ae.playRandomSpeedAudio = playRandomSpeedAudio;
            setNoclip = function(arg1_378, ...)
                if arg1_378 then
                    p = game;
                    v8 = p.GetService(p, "RunService").Stepped;
                    noclipConnection = v8.Connect(v8, function(...)
                        v3 = r259;
                        v3 = {
                            pairs(v3.GetChildren(v3))
                        };
                        G = v3[3];
                        v3 = pairs(v3.GetChildren(v3));
                        while true do
                            v2 = {
                                v3(v3[2], v3[3])
                            };
                            z = v2[2];
                            if v3(v3[2], v3[3]) == nil then
                                break;
                            else
                                if p.IsA(p, "BasePart") then
                                    p.CanCollide = false;
                                end;
                            end; 
                        end;
                        return; 
                    end);
                else
                    if noclipConnection then
                        v8 = noclipConnection;
                        v8.Disconnect(v8);
                        noclipConnection = nil;
                    end;
                    return;
                end; 
            end;
            ae.setNoclip = setNoclip;
            toggleNoclip = function(arg1_379, ...)
                v1 = arg1_379;
                v8 = noclipEnabled ~= v1;
                if v8 then
                    v8 = arg1_379;
                    noclipEnabled = v8;
                    setNoclip(noclipEnabled);
                    if noclipEnabled then
                        createFlowerEffect();
                        playRandomSpeedAudio("rbxassetid://1835952552");
                        v2 = r259;
                        v2 = {
                            pairs(v2.GetChildren(v2))
                        };
                        z = v2[3];
                        while true do
                            k = {
                                pairs(v2.GetChildren(v2))(v2[2], v2[3])
                            };
                            v2 = k[2];
                            if pairs(v2.GetChildren(v2))(v2[2], v2[3]) == nil then
                                
                            else
                                v8 = v1;
                                if v4.IsA(v4, "BasePart") and v4.Name ~= "Head" then
                                    v4.Transparency = 1;
                                end;
                            end; 
                        end;
                        humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position - Vector3.new(0, depth, 0));
                        head.CFrame = CFrame.new(humanoidRootPart.Position + Vector3.new(0, depth, 0));
                    else
                        playRandomSpeedAudio("rbxassetid://858508159");
                        humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position + Vector3.new(0, depth, 0));
                        v6 = r259;
                        v6 = {
                            pairs(v6.GetChildren(v6))
                        };
                        k = v6[3];
                        while true do
                            L = {
                                pairs(v6.GetChildren(v6))(v6[2], v6[3])
                            };
                            v3 = L[2];
                            if pairs(v6.GetChildren(v6))(v6[2], v6[3]) == nil then
                                
                            else
                                v8 = v1;
                                if N.IsA(N, "BasePart") and N.Name ~= "Head" then
                                    N.Transparency = 0;
                                end;
                            end; 
                        end;
                    end;
                end;
                return; 
            end;
            ae.toggleNoclip = toggleNoclip;
            typeMessage = function(arg1_380, ...)
                v1 = arg1_380;
                messageLabel.Text = "";
                G = 1;
                for V = 1, #v1 do
                    messageLabel.Text = string.sub(v1, 1, v3);
                    messageLabel.TextColor3 = rainbowColors[G];
                    G = G % #rainbowColors + 1;
                    wait(.05); 
                end;
                return; 
            end;
            ae.typeMessage = typeMessage;
            showTypedMessage = function(...)
                infoBox.Visible = true;
                v8 = sound;
                v8.Play(v8);
                typeMessage("Void rescue activated.");
                wait(6.2);
                infoBox.Visible = false;
                v8 = sound;
                v8.Stop(v8);
                return; 
            end;
            ae.showTypedMessage = showTypedMessage;
            checkVoid = function(...)
                while antiVoidEnabled do
                    v4 = 32001222818357;
                    v1 = game.Players.LocalPlayer;
                    if v1 then
                        v4 = r14;
                        v8 = game[r14[r15("M\x84\x9aY\xc5:\xff", k)]][G[z]];
                        p = v1.Character and v4.FindFirstChild(v4, "HumanoidRootPart");
                    end;
                    if v1 then
                        v1.Character.HumanoidRootPart.CFrame = CFrame.new(safePosition);
                        showTypedMessage();
                    end;
                    wait(.1); 
                end;
                return; 
            end;
            ae.checkVoid = checkVoid;
            local function OQ_138(...)
                v8 = r278.Heartbeat;
                autoStruggleCoroutine = v8.Connect(v8, function(...)
                    z = "Character";
                    v1 = r257[r14[z]];
                    if v1 then
                        z = v1.FindFirstChild(v1, "Head");
                        p = z and z.FindFirstChild(z, "PartOwner");
                        v8 = r257[G[z]];
                    end;
                    if v1 then
                        v8 = vu682;
                        v8.FireServer(v8);
                        v8 = vu680.GameCorrectionEvents.StopAllVelocity;
                        v8.FireServer(v8);
                        v2 = {
                            pairs(v1.GetChildren(v1))
                        };
                        v3 = v2[3];
                        z = pairs(v1.GetChildren(v1));
                        while true do
                            v4 = {
                                z(v2[2], v2[3])
                            };
                            v2 = v4[2];
                            if z(v2[2], v2[3]) == nil then
                                
                            else
                                if p.IsA(p, "BasePart") then
                                    p.Anchored = true;
                                end;
                            end; 
                        end;
                        while r257.IsHeld.Value do
                            wait(); 
                        end;
                        L = {
                            pairs(v1.GetChildren(v1))
                        };
                        v6 = L[3];
                        while true do
                            o = {
                                pairs(v1.GetChildren(v1))(L[2], L[3])
                            };
                            v2 = o[2];
                            if pairs(v1.GetChildren(v1))(L[2], L[3]) == nil then
                                
                            else
                                if L.IsA(L, "BasePart") then
                                    L.Anchored = false;
                                end;
                            end; 
                        end;
                    end;
                    return; 
                end);
                return; 
            end;
            ae.vu693 = OQ_138;
            local function r302(...)
                if toggleActiveAntiGrabAndBlobman and vu675 then
                    v1 = r257.Character;
                    G = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
                    if G then
                        G.CFrame = CFrame.new(vu675);
                    end;
                end;
                return; 
            end;
            ae.vu696 = r302;
            local function OQ_140(...)
                if toggleActiveAntiGrabAndBlobman then
                    v1 = r257.Character;
                    G = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
                    if G then
                        z = (G.Position - vu675).Magnitude;
                        if vu677 < G.AssemblyLinearVelocity.Magnitude and vu676 < z then
                            G.AssemblyLinearVelocity = Vector3.new(0, 0, 0);
                            G.AssemblyAngularVelocity = Vector3.new(0, 0, 0);
                            r302();
                        end;
                    end;
                end;
                return; 
            end;
            ae.v701 = OQ_140;
            local function r303(...)
                if toggleActiveAntiGrabAndBlobman then
                    v1 = r257.Character;
                    p = v1;
                    if v1 then
                        r304 = v1.FindFirstChildWhichIsA(v1, "Humanoid") or v1.WaitForChild(v1, "Humanoid");
                        v1.WaitForChild(v1, "HumanoidRootPart");
                        local function v3(...)
                            if r304.SeatPart and tostring(r304.SeatPart.Parent) == "CreatureBlobman" then
                                v8 = r304;
                                v8 = r304;
                                v1 = v8.FindFirstChild(v8, "RightGrabAnimation");
                                G = v8.FindFirstChild(v8, "LeftGrabAnimation");
                                if v1 then
                                    v1.AnimationId = "";
                                end;
                                if G then
                                    G.AnimationId = "";
                                end;
                            end;
                            return; 
                        end;
                        p = r304.GetPropertyChangedSignal(r304, "SeatPart");
                        p.Connect(p, v3);
                        v3();
                        return;
                    else
                        v1 = r257.CharacterAdded;
                        v1.Wait(v1);
                    end;
                end; 
            end;
            ae.vu712 = r303;
            local function OQ_142(...)
                v1 = r257.Character;
                p = v1;
                if v1 then
                    r305 = v1.FindFirstChildWhichIsA(v1, "Humanoid") or v1.WaitForChild(v1, "Humanoid");
                    v8 = v1.WaitForChild(v1, "HumanoidRootPart").ChildAdded;
                    v8.Connect(v8, function(arg1_381, ...)
                        v1 = arg1_381;
                        if toggleActiveAntiGrabAndBlobman and v1.IsA(v1, "Fire") then
                            v1.Destroy(v1);
                        end;
                        return; 
                    end);
                    r303();
                    v8 = r305.Changed;
                    v8.Connect(v8, function(arg1_382, ...)
                        G = toggleActiveAntiGrabAndBlobman;
                        if G then
                            v8 = v8;
                            p = arg1_382 == "Sit" and (r305.Sit and not r305.SeatPart) and not r305.SeatPart;
                            v8 = v8;
                        end;
                        if G then
                            v8 = r305;
                            v8.SetStateEnabled(v8, Enum.HumanoidStateType.Jumping, true);
                            r305.Sit = false;
                        end;
                        return; 
                    end);
                    return;
                else
                    v1 = r257.CharacterAdded;
                    p = v1.Wait(v1);
                end; 
            end;
            ae.v717 = OQ_142;
            setupAntiExplosion = function(arg1_383, ...)
                r306 = arg1_383;
                v8 = r306;
                p = v8.WaitForChild(v8, "Humanoid");
                r307 = p.FindFirstChild(p, "Ragdolled") and p.Connect(p, function(...)
                    v2 = "\t\xefV6\xfb";
                    if r307.Value then
                        v1 = r306;
                        v2 = {
                            ipairs(v1.GetChildren(v1))
                        };
                        v3 = v2[3];
                        while true do
                            v4 = {
                                ipairs(v1.GetChildren(v1))(v2[2], v2[3])
                            };
                            v2 = v4[2];
                            if ipairs(v1.GetChildren(v1))(v2[2], v2[3]) == nil then
                                
                            else
                                if v2.IsA(v2, "BasePart") then
                                    v8.WaitForChild(v8, "Humanoid").Anchored = true;
                                end;
                            end; 
                        end;
                    else
                        v1 = r306;
                        k = {
                            ipairs(v1.GetChildren(v1))
                        };
                        v2 = k[3];
                        while true do
                            v6 = {
                                ipairs(v1.GetChildren(v1))(k[2], k[3])
                            };
                            G = v6[2];
                            if ipairs(v1.GetChildren(v1))(k[2], k[3]) == nil then
                                
                            else
                                if G.IsA(G, "BasePart") then
                                    ({
                                        ipairs(v1.GetChildren(v1))
                                    }).Anchored = false;
                                end;
                            end; 
                        end;
                        return;
                    end; 
                end);
                v8 = r307;
                return; 
            end;
            r23.setupAntiExplosion = setupAntiExplosion;
            runAntiKickLoop = function(...)
                while true do
                    p = "toggleActiveAntiKick";
                    if Env[p] then
                        p = game.Players.LocalPlayer.Character;
                        v8 = game;
                        p = v8.GetService(v8, "ReplicatedStorage");
                        v8 = p.WaitForChild(p, "CharacterEvents");
                        p = v8.WaitForChild(v8, "RagdollRemote");
                        p.FireServer(p, unpack({
                            p.WaitForChild(p, "HumanoidRootPart"),
                            0
                        }));
                    end;
                    task.wait(); 
                end;
                return; 
            end;
            ae.runAntiKickLoop = runAntiKickLoop;
            getDescendantParts = function(arg1_384, ...)
                v1 = arg1_384;
                z = workspace.Map;
                z = {
                    ipairs(z.GetDescendants(z))
                };
                v3 = z[3];
                z = ipairs(z.GetDescendants(z));
                while true do
                    k = {
                        z(z[2], z[3])
                    };
                    v4 = k[2];
                    if z(z[2], z[3]) == nil then
                        break;
                    else
                        v8 = z(z[2], z[3]);
                        if p.IsA(p, "Part") and p.Name == arg1_384 then
                            table.insert({}, p);
                        end;
                    end; 
                end;
                return {}; 
            end;
            ae.getDescendantParts = getDescendantParts;
            grabHandler = function(arg1_385, ...)
                r308 = arg1_385;
                while true do
                    v3 = pcall(function(...)
                        local t = {
                            t[1],
                            t[2],
                            8
                        };
                        v8 = workspace;
                        v1 = v8.FindFirstChild(v8, "GrabParts");
                        if v1 and v1.Name == "GrabParts" then
                            v8 = workspace;
                            while v8.FindFirstChild(v8, "GrabParts") do
                                v8 = workspace;
                                v3 = r308 == "poison" and poisonHurtParts or paintPlayerParts;
                                v4 = {
                                    pairs(v3)
                                };
                                v2 = v4[3];
                                v4 = pairs(v3);
                                while true do
                                    v6 = {
                                        v4(v4[2], v4[3])
                                    };
                                    k = v6[2];
                                    if v4(v4[2], v4[3]) == nil then
                                        
                                    else
                                        p.Size = Vector3.new(2, 2, 2);
                                        p.Transparency = 1;
                                        p.Position = (p and v1.Name == "GrabParts").Position;
                                    end; 
                                end;
                                wait();
                                o = {
                                    pairs(v3)
                                };
                                L = o[3];
                                while true do
                                    d = {
                                        pairs(v3)(o[2], o[3])
                                    };
                                    k = d[2];
                                    if pairs(v3)(o[2], o[3]) == nil then
                                        
                                    else
                                        n.Position = Vector3.new(0, -200, 0);
                                    end; 
                                end; 
                            end;
                            v6 = {
                                pairs(partsTable)
                            };
                            v4 = v6[3];
                            while true do
                                N = {
                                    pairs(partsTable)(v6[2], v6[3])
                                };
                                v3 = N[2];
                                if pairs(partsTable)(v6[2], v6[3]) == nil then
                                    
                                else
                                    v6.Position = Vector3.new(0, -200, 0);
                                end; 
                            end;
                        end;
                        return; 
                    end);
                    G = z[2];
                    wait(); 
                end;
                return; 
            end;
            r23.grabHandler = grabHandler;
            noclipGrab = function(...)
                while true do
                    v3 = {
                        pcall(function(...)
                            local t = {
                                t[1],
                                t[2]
                            };
                            v8 = workspace;
                            v1 = v8.FindFirstChild(v8, "GrabParts");
                            if v1 then
                                p = v1.Name == "GrabParts";
                            end;
                            if v1 then
                                G = v1.FindFirstChild(v1, "GrabPart");
                                v6 = 23230871185985;
                                G = G.FindFirstChild(G, "WeldConstraint").Part1.Parent;
                                v8 = G.HumanoidRootPart;
                                if v8 then
                                    v8 = workspace;
                                    v4 = "GrabParts";
                                    while v8.FindFirstChild(v8, U[t[1]][v4]) do
                                        v4 = {
                                            pairs(G.GetChildren(G))
                                        };
                                        z = v4[3];
                                        while true do
                                            k = {
                                                pairs(G.GetChildren(G))(v4[2], v4[3])
                                            };
                                            v4 = k[2];
                                            if pairs(G.GetChildren(G))(v4[2], v4[3]) == nil then
                                                wait();
                                            else
                                                if p.IsA(p, "BasePart") then
                                                    p.CanCollide = false;
                                                end;
                                            end; 
                                        end; 
                                    end;
                                    v6 = {
                                        pairs(G.GetChildren(G))
                                    };
                                    v4 = v6[3];
                                    while true do
                                        N = {
                                            pairs(G.GetChildren(G))(v6[2], v6[3])
                                        };
                                        v3 = N[2];
                                        if pairs(G.GetChildren(G))(v6[2], v6[3]) == nil then
                                            
                                        else
                                            if v6.IsA(v6, "BasePart") then
                                                v6.CanCollide = true;
                                            end;
                                        end; 
                                    end;
                                end;
                            end;
                            return; 
                        end)
                    };
                    v1 = v3[2];
                    G = pcall(function(...)
                        local t = {
                            t[1],
                            t[2]
                        };
                        v8 = workspace;
                        v1 = v8.FindFirstChild(v8, "GrabParts");
                        if v1 then
                            p = v1.Name == "GrabParts";
                        end;
                        if v1 then
                            G = v1.FindFirstChild(v1, "GrabPart");
                            v6 = 23230871185985;
                            G = G.FindFirstChild(G, "WeldConstraint").Part1.Parent;
                            v8 = G.HumanoidRootPart;
                            if v8 then
                                v8 = workspace;
                                v4 = "GrabParts";
                                while v8.FindFirstChild(v8, U[t[1]][v4]) do
                                    v4 = {
                                        pairs(G.GetChildren(G))
                                    };
                                    z = v4[3];
                                    while true do
                                        k = {
                                            pairs(G.GetChildren(G))(v4[2], v4[3])
                                        };
                                        v4 = k[2];
                                        if pairs(G.GetChildren(G))(v4[2], v4[3]) == nil then
                                            wait();
                                        else
                                            if p.IsA(p, "BasePart") then
                                                p.CanCollide = false;
                                            end;
                                        end; 
                                    end; 
                                end;
                                v6 = {
                                    pairs(G.GetChildren(G))
                                };
                                v4 = v6[3];
                                while true do
                                    N = {
                                        pairs(G.GetChildren(G))(v6[2], v6[3])
                                    };
                                    v3 = N[2];
                                    if pairs(G.GetChildren(G))(v6[2], v6[3]) == nil then
                                        
                                    else
                                        if v6.IsA(v6, "BasePart") then
                                            v6.CanCollide = true;
                                        end;
                                    end; 
                                end;
                            end;
                        end;
                        return; 
                    end);
                    wait(); 
                end;
                return; 
            end;
            r23.noclipGrab = noclipGrab;
            local function OQ_143(arg1_386, ...)
                v8 = arg1_386.GrabPart.WeldConstraint.Part1;
                if v8 then
                    v8 = v8.Parent;
                    z = r14;
                    v3 = v8.FindFirstChildOfClass(v8, "Humanoid");
                    z = v3 and z.FindFirstChild(z, "HumanoidRootPart");
                    if z then
                        z.CFrame = CFrame.new(z.Position + Vector3.new(0, 30, 0));
                        v3.PlatformStand = true;
                        v3.AutoRotate = false;
                        v3.AutoCrouch = false;
                        v3.Sit = false;
                        v3.SetStateEnabled(v3, Enum.HumanoidStateType.Ragdoll, false);
                    end;
                end;
                return; 
            end;
            ae.vu827 = OQ_143;
            local function OQ_144(arg1_387, ...)
                v8 = arg1_387.GrabPart.WeldConstraint.Part1;
                if v8 then
                    v8 = v8.Parent;
                    z = r14;
                    v3 = v8.FindFirstChildOfClass(v8, "Humanoid");
                    z = v3 and z.FindFirstChild(z, "HumanoidRootPart");
                    if z then
                        z.CFrame = CFrame.new(z.Position + Vector3.new(0, -50, 0));
                        v3.PlatformStand = true;
                        v3.AutoRotate = false;
                        v3.AutoCrouch = false;
                        v3.Sit = false;
                        v3.SetStateEnabled(v3, Enum.HumanoidStateType.Ragdoll, false);
                    end;
                end;
                return; 
            end;
            ae.vu843 = OQ_144;
            local function r309(arg1_388, ...)
                v1 = arg1_388;
                if v1.Name == "GrabParts" then
                    G = v1.FindFirstChild(v1, "GrabPart");
                    p = G;
                    G = p and G.FindFirstChild(G, "WeldConstraint");
                    if G then
                        G = arg1_388.GrabPart.WeldConstraint.Part1;
                    end;
                    if G then
                        p = G.Parent;
                        p.BreakJoints(p);
                    end;
                end;
                return; 
            end;
            ae.vu858 = r309;
            local function OQ_146(...)
                if vu855 then
                    v8 = vu854.ChildAdded;
                    vu859 = v8.Connect(v8, r309);
                else
                    if vu859 then
                        v8 = vu859;
                        v8.Disconnect(v8);
                        vu859 = nil;
                    end;
                    return;
                end; 
            end;
            ae.vu860 = OQ_146;
            updatePlayerList = function(...)
                r266 = {};
                v1 = vu836;
                v4 = {
                    ipairs(v1.GetPlayers(v1))
                };
                z = v4[3];
                while true do
                    k = {
                        ipairs(v1.GetPlayers(v1))(v4[2], v4[3])
                    };
                    v2 = k[2];
                    if ipairs(v1.GetPlayers(v1))(v4[2], v4[3]) == nil then
                        break;
                    else
                        table.insert(r266, v4.Name);
                    end; 
                end;
                return; 
            end;
            r23.updatePlayerList = updatePlayerList;
            MakePlayerStand = function(arg1_389, ...)
                v8 = arg1_389.Character;
                G = v8.FindFirstChild(v8, "Humanoid");
                if G then
                    p = G.Sit;
                end;
                if G then
                    G.Sit = false;
                    G.PlatformStand = false;
                end;
                return; 
            end;
            ae.MakePlayerStand = MakePlayerStand;
            SetBodyPartProperties = function(arg1_390, ...)
                v1 = arg1_390;
                if v1 ~= players.LocalPlayer or toggle then
                    MakePlayerStand(v1);
                    z = v1.Character;
                    z = {
                        pairs(z.GetDescendants(z))
                    };
                    v3 = z[3];
                    z = pairs(z.GetDescendants(z));
                    while true do
                        v4 = {
                            z(z[2], z[3])
                        };
                        v2 = v4[2];
                        if z(z[2], z[3]) == nil then
                            
                        else
                            v8 = z(z[2], z[3]);
                            if p.IsA(p, "BasePart") and p.Name ~= "HumanoidRootPart" then
                                p.CanCollide = not p.CanCollide;
                                p.CanQuery = not p.CanQuery;
                                p.CanTouch = not p.CanTouch;
                                p.Massless = not p.Massless;
                                p.CollisionGroup = "n";
                            end;
                        end; 
                    end;
                end;
                return; 
            end;
            ae.SetBodyPartProperties = SetBodyPartProperties;
            ApplySettingsLoop = function(...)
                while toggle do
                    v3 = players;
                    v3 = {
                        pairs(v3.GetPlayers(v3))
                    };
                    G = v3[3];
                    v3 = pairs(v3.GetPlayers(v3));
                    while true do
                        v2 = {
                            v3(v3[2], v3[3])
                        };
                        z = v2[2];
                        if v3(v3[2], v3[3]) == nil then
                            wait(1);
                        else
                            v8 = v3(v3[2], v3[3]);
                            if p ~= players.LocalPlayer and p.Character then
                                SetBodyPartProperties(p);
                            end;
                        end; 
                    end; 
                end;
                return; 
            end;
            ae.ApplySettingsLoop = ApplySettingsLoop;
            grabNearbyPlayers = function(...)
                v8 = vu932;
                players = v8.GetPlayers(v8);
                v2 = {
                    pairs(players)
                };
                v3 = v2[3];
                while true do
                    v4 = {
                        pairs(players)(v2[2], v2[3])
                    };
                    z = v4[2];
                    if pairs(players)(v2[2], v2[3]) == nil then
                        break;
                    else
                        v8 = pairs(players)(v2[2], v2[3]);
                        if v2 ~= LocalPlayer and (v2.Character and 279.FindFirstChild(279, "Left Arm")) then
                            playerPosition = v2.Character.HumanoidRootPart.Position;
                            localPlayerPosition = LocalPlayer.Character.HumanoidRootPart.Position;
                            distance = (playerPosition - localPlayerPosition).Magnitude;
                            if distance <= GrabRange then
                                L = v2.Character;
                                args = {
                                    L.FindFirstChild(L, "Left Arm"),
                                    CFrame.new(playerPosition) * CFrame.Angles(-3.0322151184082, .45138362050056, 3.0937263965607)
                                };
                                pcall(function(...)
                                    v8 = GrabEvent;
                                    v8.FireServer(v8, unpack(args));
                                    return; 
                                end);
                            end;
                        end;
                    end; 
                end;
                return; 
            end;
            ae.grabNearbyPlayers = grabNearbyPlayers;
            ExecuteCodeOnLeftArm = function(arg1_391, ...)
                r310 = arg1_391;
                if r310 then
                    pcall(function(...)
                        v8 = GrabEvent;
                        v8.FireServer(v8, r310, r310.CFrame);
                        return; 
                    end);
                    grabbedPlayers[r310.Parent] = true;
                end;
                return; 
            end;
            ae.ExecuteCodeOnLeftArm = ExecuteCodeOnLeftArm;
            ExecuteCode1 = function(arg1_392, ...)
                r311 = arg1_392;
                if r311 then
                    pcall(function(...)
                        r311.Parent.Humanoid.Jump = true;
                        return; 
                    end);
                end;
                return; 
            end;
            ae.ExecuteCode1 = ExecuteCode1;
            ExecuteCode2 = function(arg1_393, ...)
                v1 = arg1_393;
                if v1 then
                    G = Instance.new("BodyVelocity");
                    G.Velocity = Vector3.new(0, 1000, 0);
                    G.MaxForce = Vector3.new(vu934, math.huge, vu934);
                    G.Parent = v1.Parent.HumanoidRootPart;
                end;
                return; 
            end;
            ae.ExecuteCode2 = ExecuteCode2;
            ConnectTouchEvents = function(...)
                if not vu933 then
                    v8 = r278.Heartbeat;
                    vu933 = v8.Connect(v8, function(...)
                        if loopActive then
                            v8 = vu932;
                            z = {
                                ipairs(v8.GetPlayers(v8))
                            };
                            v3 = z[3];
                            z = ipairs(v8.GetPlayers(v8));
                            while true do
                                v4 = {
                                    z(z[2], z[3])
                                };
                                v2 = v4[2];
                                if z(z[2], z[3]) == nil then
                                    
                                else
                                    v8 = z(z[2], z[3]);
                                    if p ~= LocalPlayer and not whitelist[p.Name] then
                                        v4 = p.Character;
                                        if v4 then
                                            k = v4.FindFirstChild(v4, "Left Arm");
                                            if k then
                                                v8 = v8;
                                                v6 = not grabbedPlayers[v2[k]] and (k.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= GrabRange;
                                            end;
                                            v8 = k;
                                            if k then
                                                ExecuteCodeOnLeftArm(k);
                                                ExecuteCode1(k);
                                                ExecuteCode2(k);
                                            end;
                                        end;
                                    end;
                                end; 
                            end;
                        end;
                        return; 
                    end);
                end;
                return; 
            end;
            ae.ConnectTouchEvents = ConnectTouchEvents;
            DisconnectTouchEvents = function(...)
                if vu933 then
                    v8 = vu933;
                    v8.Disconnect(v8);
                    vu933 = nil;
                end;
                return; 
            end;
            ae.DisconnectTouchEvents = DisconnectTouchEvents;
            local function r312(...)
                z = {
                    pairs(grabbedPlayers)
                };
                G = z[3];
                v3 = pairs(grabbedPlayers);
                while true do
                    v2 = {
                        v3(z[2], z[3])
                    };
                    G = v3(z[2], z[3]);
                    z = v2[2];
                    if G == nil then
                        break;
                    else
                        v2 = G.FindFirstChild(G, "HumanoidRootPart");
                        if v2 then
                            v4 = v2.FindFirstChildOfClass(v2, "BodyVelocity");
                            if v4 then
                                v4.Destroy(v4);
                            end;
                        end;
                    end; 
                end;
                grabbedPlayers = {};
                return; 
            end;
            ae.vu957 = r312;
            local function r313(arg1_394, ...)
                loopActive = arg1_394;
                if loopActive then
                    ConnectTouchEvents();
                    coroutine.wrap(function(...)
                        while loopActive do
                            grabNearbyPlayers();
                            wait(.1); 
                        end;
                        return; 
                    end)();
                else
                    DisconnectTouchEvents();
                    r312();
                end;
                return; 
            end;
            ae.vu959 = r313;
            local function r314(...)
                v8 = vu962;
                z = {
                    pairs(v8.GetPlayers(v8))
                };
                v3 = z[3];
                z = pairs(v8.GetPlayers(v8));
                while true do
                    v4 = {
                        z(z[2], z[3])
                    };
                    v2 = v4[2];
                    if z(z[2], z[3]) == nil then
                        break;
                    else
                        v8 = z(z[2], z[3]);
                        if p ~= vu971 and (p.Character and 279.FindFirstChild(279, "Left Arm")) then
                            v4 = p.Character.HumanoidRootPart.Position;
                            if (v4 - vu971.Character.HumanoidRootPart.Position).Magnitude <= vu966 then
                                r315 = {
                                    p.Character["Left Arm"],
                                    CFrame.new(v4) * CFrame.Angles(-3.0322151184082, .45138362050056, 3.0937263965607)
                                };
                                pcall(function(...)
                                    v8 = vu969;
                                    v8.FireServer(v8, unpack(r315));
                                    return; 
                                end);
                            end;
                        end;
                    end; 
                end;
                return; 
            end;
            ae.vu979 = r314;
            local function r316(arg1_395, ...)
                r317 = arg1_395;
                if r317 then
                    pcall(function(...)
                        v8 = vu969;
                        v8.FireServer(v8, r317, r317.CFrame);
                        return; 
                    end);
                    vu967[r317.Parent] = true;
                end;
                return; 
            end;
            ae.vu981 = r316;
            local function r318(arg1_396, ...)
                r319 = arg1_396;
                if r319 then
                    pcall(function(...)
                        r319.Parent.Humanoid.Jump = true;
                        return; 
                    end);
                end;
                return; 
            end;
            ae.vu983 = r318;
            local function r320(arg1_397, ...)
                v1 = arg1_397;
                if v1 then
                    G = Instance.new("BodyVelocity");
                    G.Velocity = Vector3.new(0, 0, 0);
                    G.MaxForce = Vector3.new(6000000, math.huge, 6000000);
                    G.Parent = v1.Parent.HumanoidRootPart;
                end;
                return; 
            end;
            ae.vu986 = r320;
            local function r321(...)
                if not vu968 then
                    v8 = vu964.Heartbeat;
                    vu968 = v8.Connect(v8, function(...)
                        if vu965 then
                            v8 = vu962;
                            z = {
                                ipairs(v8.GetPlayers(v8))
                            };
                            v3 = z[3];
                            z = ipairs(v8.GetPlayers(v8));
                            while true do
                                v4 = {
                                    z(z[2], z[3])
                                };
                                v2 = v4[2];
                                if z(z[2], z[3]) == nil then
                                    
                                else
                                    v8 = z(z[2], z[3]);
                                    if p ~= vu971 and not vu970[p.Name] then
                                        v4 = p.Character;
                                        if v4 then
                                            k = v4.FindFirstChild(v4, "Left Arm");
                                            if k then
                                                v8 = v8;
                                                v6 = not vu967[v2[k]] and (k.Position - vu971.Character.HumanoidRootPart.Position).Magnitude <= vu966;
                                            end;
                                            v8 = k;
                                            if k then
                                                r316(k);
                                                r318(k);
                                                r320(k);
                                            end;
                                        end;
                                    end;
                                end; 
                            end;
                        end;
                        return; 
                    end);
                end;
                return; 
            end;
            ae.vu994 = r321;
            local function r322(...)
                if vu968 then
                    v8 = vu968;
                    v8.Disconnect(v8);
                    vu968 = nil;
                end;
                return; 
            end;
            ae.vu995 = r322;
            local function r323(...)
                z = {
                    pairs(vu967)
                };
                G = z[3];
                v3 = pairs(vu967);
                while true do
                    v2 = {
                        v3(z[2], z[3])
                    };
                    z = v2[2];
                    G = v3(z[2], z[3]);
                    if G == nil then
                        break;
                    else
                        v2 = G;
                        if G then
                            v2 = v8.FindFirstChild(v8, "HumanoidRootPart");
                        end;
                        v8 = v2[1];
                        if v2 then
                            v2 = v8.HumanoidRootPart;
                            v4 = v2.FindFirstChildOfClass(v2, "BodyVelocity");
                            if v4 then
                                v4.Destroy(v4);
                            end;
                        end;
                    end; 
                end;
                vu967 = {};
                return; 
            end;
            ae.vu1001 = r323;
            local function OQ_156(arg1_398, ...)
                vu965 = arg1_398;
                if vu965 then
                    r321();
                    coroutine.wrap(function(...)
                        while vu965 do
                            r314();
                            wait(.1); 
                        end;
                        return; 
                    end)();
                else
                    r322();
                    r323();
                end;
                return; 
            end;
            ae.vu1003 = OQ_156;
            local function r324(...)
                v8 = vu1005;
                z = {
                    pairs(v8.GetPlayers(v8))
                };
                v3 = z[3];
                z = pairs(v8.GetPlayers(v8));
                while true do
                    v4 = {
                        z(z[2], z[3])
                    };
                    v2 = v4[2];
                    if z(z[2], z[3]) == nil then
                        break;
                    else
                        v8 = z(z[2], z[3]);
                        if p ~= vu1014 and (p.Character and 279.FindFirstChild(279, "HumanoidRootPart")) then
                            v4 = p.Character.HumanoidRootPart.Position;
                            if (v4 - vu1014.Character.HumanoidRootPart.Position).Magnitude <= vu1009 then
                                r325 = {
                                    p.Character.HumanoidRootPart,
                                    CFrame.new(v4) * CFrame.Angles(-3.0322151184082, .45138362050056, 3.0937263965607)
                                };
                                pcall(function(...)
                                    v8 = vu1012;
                                    v8.FireServer(v8, unpack(r325));
                                    return; 
                                end);
                            end;
                        end;
                    end; 
                end;
                return; 
            end;
            ae.vu1022 = r324;
            local function r326(arg1_399, ...)
                r327 = arg1_399;
                if r327 then
                    pcall(function(...)
                        v8 = vu1012;
                        v8.FireServer(v8, r327, r327.CFrame);
                        return; 
                    end);
                    vu1010[r327.Parent] = true;
                end;
                return; 
            end;
            ae.vu1024 = r326;
            local function r328(arg1_400, ...)
                r329 = arg1_400;
                if r329 then
                    pcall(function(...)
                        r329.Parent.Humanoid.Jump = true;
                        return; 
                    end);
                end;
                return; 
            end;
            ae.vu1026 = r328;
            local function r330(arg1_401, ...)
                v1 = arg1_401;
                if v1 then
                    G = Instance.new("BodyVelocity");
                    G.Velocity = Vector3.new(0, -500, 0);
                    G.MaxForce = Vector3.new(600000, math.huge, 600000);
                    G.Parent = v1.Parent.HumanoidRootPart;
                end;
                return; 
            end;
            ae.vu1029 = r330;
            local function r331(...)
                if not vu1011 then
                    v8 = vu1007.Heartbeat;
                    vu1011 = v8.Connect(v8, function(...)
                        if vu1008 then
                            v8 = vu1005;
                            z = {
                                ipairs(v8.GetPlayers(v8))
                            };
                            v3 = z[3];
                            z = ipairs(v8.GetPlayers(v8));
                            while true do
                                v4 = {
                                    z(z[2], z[3])
                                };
                                v2 = v4[2];
                                if z(z[2], z[3]) == nil then
                                    
                                else
                                    v8 = z(z[2], z[3]);
                                    if p ~= vu1014 and not vu1013[p.Name] then
                                        v4 = p.Character;
                                        if v4 then
                                            k = v4.FindFirstChild(v4, "HumanoidRootPart");
                                            if k then
                                                v6 = not vu1010[v2[k]] and (k.Position - vu1014.Character.HumanoidRootPart.Position).Magnitude <= vu1009;
                                                v8 = v8;
                                            end;
                                            v8 = k;
                                            if k then
                                                r326(k);
                                                r328(k);
                                                r330(k);
                                            end;
                                        end;
                                    end;
                                end; 
                            end;
                        end;
                        return; 
                    end);
                end;
                return; 
            end;
            ae.vu1037 = r331;
            local function r332(...)
                z = {
                    pairs(vu1010)
                };
                v3 = pairs(vu1010);
                G = z[3];
                while true do
                    v2 = {
                        v3(z[2], z[3])
                    };
                    z = v2[2];
                    G = v3(z[2], z[3]);
                    if G == nil then
                        break;
                    else
                        v2 = G.FindFirstChild(G, "HumanoidRootPart");
                        if v2 then
                            v4 = v2.FindFirstChildOfClass(v2, "BodyVelocity");
                            if v4 then
                                v4.Destroy(v4);
                            end;
                        end;
                    end; 
                end;
                vu1010 = {};
                return; 
            end;
            ae.vu1044 = r332;
            local function OQ_163(arg1_402, ...)
                vu1008 = arg1_402;
                if vu1008 then
                    r331();
                    coroutine.wrap(function(...)
                        while vu1008 do
                            if vu1014.Character then
                                U[t[4]]();
                            end;
                            wait(.1); 
                        end;
                        return; 
                    end)();
                else
                    r322();
                    r332();
                end;
                return; 
            end;
            ae.vu1046 = OQ_163;
            local function r333(...)
                v1 = vu1049;
                v2 = {
                    pairs(v1.GetPlayers(v1))
                };
                v3 = v2[3];
                while true do
                    k = {
                        pairs(v1.GetPlayers(v1))(v2[2], v2[3])
                    };
                    v4 = k[2];
                    if pairs(v1.GetPlayers(v1))(v2[2], v2[3]) == nil then
                        break;
                    else
                        v8 = pairs(v1.GetPlayers(v1))(v2[2], v2[3]);
                        if p ~= vu1051 and (p.Character and 280.FindFirstChild(280, "HumanoidRootPart")) then
                            table.insert({}, p);
                        end;
                    end; 
                end;
                return {}; 
            end;
            ae.vu1060 = r333;
            local function r334(...)
                v1 = r333();
                tick();
                if #v1 > 0 then
                    separationAngle = 2 * math.pi / #v1;
                end;
                v4 = {
                    pairs(v1)
                };
                v2 = v4[3];
                while true do
                    v6 = {
                        pairs(v1)(v4[2], v4[3])
                    };
                    v4 = v6[2];
                    v2 = pairs(v1)(v4[2], v4[3]);
                    if v2 == nil then
                        break;
                    else
                        v6 = k.Character.HumanoidRootPart;
                        N = tick() * orbitSpeed + v2 * separationAngle;
                        n = vu1051.Character.HumanoidRootPart.Position + Vector3.new(math.cos(N) * orbitRadius, 0, math.sin(N) * orbitRadius);
                        F = vu1050.SetNetworkOwner;
                        F.FireServer(F, unpack({
                            v6,
                            CFrame.new(n)
                        }));
                        v7 = Instance.new("BodyPosition");
                        v7.Position = n;
                        v7.MaxForce = Vector3.new(4000, 4000, 4000);
                        v7.D = 100;
                        v7.P = 3000;
                        v7.Parent = v6;
                        F = game;
                        S = F.GetService(F, "Debris");
                        S.AddItem(S, v7, .1);
                    end; 
                end;
                return; 
            end;
            ae.vu1074 = r334;
            local function OQ_166(arg1_403, ...)
                if arg1_403 then
                    if not vu154 then
                        vu154 = true;
                        p = vu1052.Heartbeat;
                        vu1053 = p.Connect(p, function(...)
                            r334();
                            return; 
                        end);
                    end;
                else
                    if vu154 then
                        if vu1053 then
                            p = vu1053;
                            p.Disconnect(p);
                            vu1053 = nil;
                        end;
                        vu154 = false;
                    end;
                    return;
                end; 
            end;
            ae.vu1076 = OQ_166;
            local function r335(...)
                v1 = vu1079;
                v2 = {
                    pairs(v1.GetPlayers(v1))
                };
                v3 = v2[3];
                while true do
                    k = {
                        pairs(v1.GetPlayers(v1))(v2[2], v2[3])
                    };
                    v4 = k[2];
                    if pairs(v1.GetPlayers(v1))(v2[2], v2[3]) == nil then
                        break;
                    else
                        v8 = pairs(v1.GetPlayers(v1))(v2[2], v2[3]);
                        if p ~= vu1081 and (p.Character and 280.FindFirstChild(280, "HumanoidRootPart")) then
                            table.insert({}, p);
                        end;
                    end; 
                end;
                return {}; 
            end;
            ae.vu1094 = r335;
            createAuraEffect = function(...)
                v1 = r335();
                if #v1 ~= 0 then
                    tick();
                    z = vu1081.Character.HumanoidRootPart.Position;
                    k = {
                        ipairs(v1)
                    };
                    v4 = k[3];
                    k = ipairs(v1);
                    while true do
                        N = {
                            k(k[2], k[3])
                        };
                        v6 = N[2];
                        v4 = k(k[2], k[3]);
                        if v4 == nil then
                            
                        else
                            L = tick() * rotationSpeed + v4 * math.pi * 2 / #v1;
                            F = vu1080.SetNetworkOwner;
                            F.FireServer(F, unpack({
                                p.Character.HumanoidRootPart,
                                CFrame.new(Vector3.new(z.X + math.cos(L) * vu1084, z.v8 + auraHeight, z.Z + math.sin(L) * vu1084))
                            }));
                        end; 
                    end;
                    n = {
                        pairs(v1)
                    };
                    o = n[3];
                    while true do
                        v7 = {
                            pairs(v1)(n[2], n[3])
                        };
                        v6 = v7[2];
                        if pairs(v1)(n[2], n[3]) == nil then
                            
                        else
                            v7 = d.Character.HumanoidRootPart;
                            F = Instance.new("BodyPosition");
                            F.MaxForce = Vector3.new(4000, 4000, 4000);
                            F.D = 100;
                            F.P = 3000;
                            Q = v7;
                            F.Parent = Q;
                            q = game;
                            Q = q.GetService(q, "Debris");
                            Q.AddItem(Q, F, .1);
                            S = Instance.new("BodyVelocity");
                            S.Velocity = (vu1081.Character.HumanoidRootPart.Position - v7.Position).Unit * vu1085;
                            S.MaxForce = Vector3.new(4000, 4000, 4000);
                            S.Parent = v7;
                            q = game;
                            Q = q.GetService(q, "Debris");
                            Q.AddItem(Q, S, .1);
                        end; 
                    end;
                end;
                return; 
            end;
            ae.createAuraEffect = createAuraEffect;
            local function OQ_168(arg1_404, ...)
                if arg1_404 then
                    if not vu1086 then
                        vu1086 = true;
                        p = vu1082.Heartbeat;
                        vu1087 = p.Connect(p, function(...)
                            createAuraEffect();
                            return; 
                        end);
                    end;
                else
                    if vu1086 then
                        if vu1087 then
                            p = vu1087;
                            p.Disconnect(p);
                            vu1087 = nil;
                        end;
                        vu1086 = false;
                    end;
                    return;
                end; 
            end;
            ae.vu1117 = OQ_168;
            local function r336(...)
                v1 = vu1119;
                v2 = {
                    pairs(v1.GetPlayers(v1))
                };
                v3 = v2[3];
                while true do
                    k = {
                        pairs(v1.GetPlayers(v1))(v2[2], v2[3])
                    };
                    v4 = k[2];
                    if pairs(v1.GetPlayers(v1))(v2[2], v2[3]) == nil then
                        break;
                    else
                        v8 = pairs(v1.GetPlayers(v1))(v2[2], v2[3]);
                        if p ~= vu1081 and (p.Character and 280.FindFirstChild(280, "HumanoidRootPart")) then
                            table.insert({}, p);
                        end;
                    end; 
                end;
                return {}; 
            end;
            ae.vu1128 = r336;
            local function r337(...)
                z = {
                    pairs(r336())
                };
                v3 = z[3];
                z = pairs(r336());
                while true do
                    v4 = {
                        z(z[2], z[3])
                    };
                    v2 = v4[2];
                    if z(z[2], z[3]) == nil then
                        break;
                    else
                        v4 = p.Character.HumanoidRootPart;
                        k = vu1081.Character.HumanoidRootPart.CFrame * CFrame.new(config.grabOffset);
                        N = vu1120.SetNetworkOwner;
                        N.FireServer(N, unpack({
                            v4,
                            k
                        }));
                        v6 = Instance.new("BodyVelocity");
                        v6.Velocity = (k.Position - v4.Position).Unit * config.grabSpeed;
                        v6.MaxForce = Vector3.new(100000, 100000, 100000);
                        v6.Parent = v4;
                        N = game;
                        L = N.GetService(N, "Debris");
                        L.AddItem(L, v6, .1);
                    end; 
                end;
                return; 
            end;
            ae.vu1137 = r337;
            local function OQ_171(arg1_405, ...)
                if arg1_405 then
                    G = r249;
                    if not G.isLooping then
                        r249.isLooping = true;
                        G = vu1121.Heartbeat;
                        r249.loopConnection = G.Connect(G, function(...)
                            v1 = vu1081.Character;
                            if v1 then
                                v1 = vu1081.Character;
                                p = v1.FindFirstChild(v1, "HumanoidRootPart");
                            end;
                            if v1 then
                                r337();
                            end;
                            return; 
                        end);
                    end;
                else
                    if r249.isLooping then
                        if r249.loopConnection then
                            v8 = r249.loopConnection;
                            v8.Disconnect(v8);
                            r249.loopConnection = nil;
                        end;
                        r249.isLooping = false;
                    end;
                    return;
                end; 
            end;
            ae.vu1139 = OQ_171;
            local function r338(arg1_406, arg2_406, ...)
                G = arg2_406;
                v1 = arg1_406;
                v4 = {
                    ipairs(v1.GetDescendants(v1))
                };
                v2 = ipairs(v1.GetDescendants(v1));
                z = v4[3];
                while true do
                    k = {
                        v2(v4[2], v4[3])
                    };
                    v4 = k[2];
                    if v2(v4[2], v4[3]) == nil then
                        break;
                    else
                        if p.IsA(p, "BasePart") then
                            p.CanCollide = not arg2_406;
                        end;
                    end; 
                end;
                return; 
            end;
            ae.vu1157 = r338;
            local function r339(arg1_407, ...)
                v1 = arg1_407;
                if v1 then
                    G = Instance.new("BodyVelocity");
                    G.Velocity = Vector3.new(0, -7, 0);
                    G.MaxForce = Vector3.new(0, math.huge, 0);
                    p = arg1_407;
                    G.Parent = p;
                end;
                return; 
            end;
            ae.vu1160 = r339;
            local function r340(...)
                v8 = vu1141;
                z = {
                    pairs(v8.GetPlayers(v8))
                };
                v3 = z[3];
                z = pairs(v8.GetPlayers(v8));
                while true do
                    v4 = {
                        z(z[2], z[3])
                    };
                    v2 = v4[2];
                    if z(z[2], z[3]) == nil then
                        break;
                    else
                        v8 = z(z[2], z[3]);
                        if p ~= vu1150 and (p.Character and 279.FindFirstChild(279, "HumanoidRootPart")) then
                            v4 = p.Character.HumanoidRootPart.Position;
                            if (v4 - vu1150.Character.HumanoidRootPart.Position).Magnitude <= vu1145 then
                                r341 = {
                                    p.Character.HumanoidRootPart,
                                    CFrame.new(v4) * CFrame.Angles(-3.0322151184082, .45138362050056, 3.0937263965607)
                                };
                                pcall(function(...)
                                    v8 = vu1148;
                                    v8.FireServer(v8, unpack(r341));
                                    return; 
                                end);
                                r338(p.Character, true);
                                r339(p.Character.HumanoidRootPart);
                                vu1146[p.Character] = true;
                            end;
                        end;
                    end; 
                end;
                return; 
            end;
            ae.vu1168 = r340;
            local function r342(arg1_408, ...)
                r343 = arg1_408;
                if r343 then
                    pcall(function(...)
                        v8 = vu1148;
                        v8.FireServer(v8, r343, r343.CFrame);
                        return; 
                    end);
                    vu1146[r343.Parent] = true;
                end;
                return; 
            end;
            ae.vu1170 = r342;
            local function r344(...)
                if not vu1147 then
                    v8 = vu1143.Heartbeat;
                    vu1147 = v8.Connect(v8, function(...)
                        if vu1144 then
                            v8 = vu1141;
                            z = {
                                ipairs(v8.GetPlayers(v8))
                            };
                            v3 = z[3];
                            z = ipairs(v8.GetPlayers(v8));
                            while true do
                                v4 = {
                                    z(z[2], z[3])
                                };
                                v2 = v4[2];
                                if z(z[2], z[3]) == nil then
                                    
                                else
                                    v8 = z(z[2], z[3]);
                                    if p ~= vu1150 and not vu1149[p.Name] then
                                        v4 = p.Character;
                                        if v4 then
                                            k = v4.FindFirstChild(v4, "HumanoidRootPart");
                                            if k then
                                                v6 = not vu1146[v2[k]] and (k.Position - vu1150.Character.HumanoidRootPart.Position).Magnitude <= vu1145;
                                                v8 = v8;
                                            end;
                                            v8 = k;
                                            if k then
                                                r342(k);
                                                r340();
                                            end;
                                        end;
                                    end;
                                end; 
                            end;
                        end;
                        return; 
                    end);
                end;
                return; 
            end;
            ae.vu1178 = r344;
            local function r345(...)
                if vu1147 then
                    v8 = vu1147;
                    v8.Disconnect(v8);
                    vu1147 = nil;
                end;
                return; 
            end;
            ae.vu1179 = r345;
            local function r346(...)
                z = {
                    pairs(vu1146)
                };
                G = z[3];
                v3 = pairs(vu1146);
                while true do
                    v2 = {
                        v3(z[2], z[3])
                    };
                    G = v3(z[2], z[3]);
                    z = v2[2];
                    if G == nil then
                        break;
                    else
                        v2 = G.FindFirstChild(G, "HumanoidRootPart");
                        if v2 then
                            v4 = v2.FindFirstChildOfClass(v2, "BodyVelocity");
                            if v4 then
                                v4.Destroy(v4);
                            end;
                            r338(v8, false);
                        end;
                    end; 
                end;
                vu1146 = {};
                return; 
            end;
            ae.vu1186 = r346;
            local function OQ_179(arg1_409, ...)
                vu1144 = arg1_409;
                if vu1144 then
                    r344();
                    coroutine.wrap(function(...)
                        while vu1144 do
                            if vu1150.Character then
                                U[t[4]]();
                            end;
                            wait(.1); 
                        end;
                        return; 
                    end)();
                else
                    r345();
                    r346();
                end;
                return; 
            end;
            ae.vu1188 = OQ_179;
            fireAll = function(...)
                while true do
                    G = pcall(function(...)
                        v8 = r263;
                        v1 = v8.FindFirstChild(v8, "Campfire");
                        v8 = not v1;
                        if v8 then
                            spawnItemCf("Campfire", r262.Head.CFrame);
                            v8 = r263;
                            v1 = v8.WaitForChild(v8, "Campfire");
                        end;
                        v4 = {
                            pairs(v1.GetChildren(v1))
                        };
                        z = v4[3];
                        while true do
                            k = {
                                pairs(v1.GetChildren(v1))(v4[2], v4[3])
                            };
                            vu1196 = k[2];
                            if pairs(v1.GetChildren(v1))(v4[2], v4[3]) == nil then
                            else
                                if vu1196.Name == "FirePlayerPart" then
                                    vu1196.Size = Vector3.new(10, 10, 10);
                                end;
                            end; 
                        end;
                        N = r255;
                        N.FireServer(N, r347, r347.CFrame);
                        N = r262;
                        N.MoveTo(N, r347.Position);
                        wait(.3);
                        N = r262;
                        N.MoveTo(N, r262.Torso.Position);
                        r348 = Instance.new("BodyPosition");
                        r348.P = 20000;
                        r348.Position = r262.Head.Position + Vector3.new(0, 600, 0);
                        r348.Parent = v1.Main;
                        pcall(function(...)
                            r348.Position = r262.Head.Position + Vector3.new(0, 600, 0);
                            if vu1200.Character and (vu1200.Character.HumanoidRootPart and vu1200.Character ~= r262) then
                                v8 = r347;
                                v8.Position = vu1200.Character.HumanoidRootPart.Position or vu1200.Character.Head.Position;
                                wait();
                            end;
                            return; 
                        end);
                        F = {
                            v1202(v1203, v1199)
                        };
                        n = F[2];
                        if v1202(v1203, v1199) ~= nil then
                        else
                        end;
                        wait();
                        L = vu1141;
                        r = {
                            pairs(L.GetChildren(L))
                        };
                        d = pairs(L.GetChildren(L));
                        v7 = r[2];
                        o = r[3];
                        return; 
                    end);
                    if not G then
                        warn("Error in fireAll: " .. tostring(v3[2]));
                    end;
                    wait(); 
                end;
                return; 
            end;
            r23.fireAll = fireAll;
            grabBanana = function(arg1_410, ...)
                p = "vu1209";
                if Env[p] then
                    print("The banana has already been grabbed.");
                else
                    vu1209 = true;
                    v3 = workspace;
                    G = v3.WaitForChild(v3, arg1_410.Name .. "SpawnedInToys").FoodBanana.SoundPart;
                    p = vu1208.GrabEvents.SetNetworkOwner;
                    p.FireServer(p, unpack({
                        G,
                        G.CFrame
                    }));
                end;
                return; 
            end;
            ae.grabBanana = grabBanana;
            spawnBanana = function(...)
                G = game;
                v8 = G.GetService(G, "ReplicatedStorage").MenuToys.SpawnToyRemoteFunction;
                v8.InvokeServer(v8, unpack({
                    "FoodBanana",
                    CFrame.new(67.553047180176, -5.7565531730652, -84.975646972656) * CFrame.Angles(-2.7022023200989, 1.1138037443161, 2.7424333095551),
                    Vector3.new(0, 113.98899841309, 0)
                }));
                return; 
            end;
            ae.spawnBanana = spawnBanana;
            holdBanana = function(...)
                v1 = game;
                G = game;
                v3 = workspace[v1.GetService(v1, "Players").LocalPlayer.Name .. "SpawnedInToys"].FoodBanana;
                v8 = v3.HoldPart.HoldItemRemoteFunction;
                v8.InvokeServer(v8, unpack({
                    v3,
                    G.GetService(G, "Players").LocalPlayer.Character
                }));
                return; 
            end;
            ae.holdBanana = holdBanana;
            useBanana = function(...)
                G = "FoodBanana";
                p = workspace;
                v3 = p.FindFirstChild(p, game.Players.LocalPlayer.Name .. "SpawnedInToys");
                v3 = {
                    v3.FindFirstChild(v3, G)
                };
                v8 = v3.FindFirstChild(v3, G);
                if v8 then
                    z = game;
                    v8 = z.GetService(z, "ReplicatedStorage").HoldEvents.Use;
                    v8.FireServer(v8, unpack(v3));
                else
                    warn("Object not found: " .. G);
                end;
                return; 
            end;
            ae.useBanana = useBanana;
            local function OQ_180(...)
                p = game;
                v1 = p.GetService(p, "Players").LocalPlayer;
                v8 = workspace;
                G = v8.FindFirstChild(v8, v1.Name .. "SpawnedInToys");
                if G then
                    p = G.FindFirstChild(G, "FoodBanana");
                end;
                if G then
                    v3 = G.FoodBanana;
                    v8 = v1.Character;
                    if v8 then
                        v8 = p.GetService(p, "Players").LocalPlayer.Character;
                        z = v8.FindFirstChild(v8, "Head");
                    end;
                    if v8 then
                        v2 = v8.Position - Vector3.new(0, 3, 0);
                        v8 = v3.HoldPart.DropItemRemoteFunction;
                        v8.InvokeServer(v8, unpack({
                            v3,
                            CFrame.new(v2 + Vector3.new(0, 5, 0)),
                            Vector3.new(0, -48.736000061035, 0)
                        }));
                    end;
                else
                    warn("FoodBanana not found in player's toys.");
                end;
                return; 
            end;
            ae.vu1228 = OQ_180;
            local function r349(...)
                while vu1210 do
                    G = pcall(function(...)
                        r350 = game.Players.LocalPlayer.Character;
                        v8 = workspace;
                        v6 = 18010135093442;
                        G = v8.FindFirstChild(v8, game.Players.LocalPlayer.Name .. "SpawnedInToys");
                        if not G.FindFirstChild(G, r14[r15("jQ\x1f\xe7\xdd\xd6/\xf9\x9e^", v6)]) then
                            spawnBanana();
                        end;
                        v3 = G.WaitForChild(G, "FoodBanana");
                        k = {
                            pairs(v3.GetChildren(v3))
                        };
                        v2 = k[3];
                        v4 = pairs(v3.GetChildren(v3));
                        while true do
                            N = v4(k[2], k[3]) == nil;
                            v6 = N[2];
                            if N then
                                
                            else
                                v8 = N[1];
                                if v6.Name == "BananaPeel" and v6.FindFirstChild(v6, "TouchInterest") then
                                    p.Size = Vector3.new(10, 10, 10);
                                    p.Transparency = 1;
                                else
                                    
                                end;
                            end; 
                        end;
                        r351 = Instance.new("BodyPosition");
                        r351.P = 20000;
                        r351.D = 1000;
                        r351.MaxForce = Vector3.new(4000, 4000, 4000);
                        r351.Parent = v3.Main;
                        r352 = Instance.new("BodyGyro");
                        r352.MaxTorque = Vector3.new(4000, 4000, 4000);
                        r352.CFrame = CFrame.Angles(0, math.rad(0), 0);
                        r352.Parent = v3.Main;
                        while vu1210 do
                            F = game.Players;
                            F = {
                                pairs(F.GetChildren(F))
                            };
                            v7 = F[3];
                            while true do
                                q = {
                                    pairs(F.GetChildren(F))(F[2], F[3])
                                };
                                r353 = q[2];
                                if pairs(F.GetChildren(F))(F[2], F[3]) == nil then
                                    
                                else
                                    pcall(function(...)
                                        if r353.Character and r353.Character ~= r350 then
                                            v8 = vu1236;
                                            v8.Position = r353.Character.HumanoidRootPart.Position or r353.Character.Head.Position;
                                            r351.Position = r350.Head.Position + Vector3.new(0, 10, 0);
                                            r352.CFrame = r352.CFrame * CFrame.Angles(0, math.rad(5), 0);
                                            wait(.03);
                                        end;
                                        return; 
                                    end);
                                end; 
                            end;
                            wait(); 
                        end;
                        return; 
                    end);
                    if not G then
                        warn("Error in ragdollAll: " .. tostring(v3[2]));
                    end;
                    wait(); 
                end;
                return; 
            end;
            ae.vu1245 = r349;
            local function OQ_182(arg1_411, ...)
                v1 = arg1_411;
                vu1210 = v1;
                if v1 then
                    vu1211 = coroutine.create(r349);
                    coroutine.resume(vu1211);
                end;
                return; 
            end;
            ae.vu1247 = OQ_182;
            ForcePart = function(arg1_412, ...)
                v1 = arg1_412;
                if v1.IsA(v1, "Part") and (not v1.Anchored and (not ("\x8f\x88\x13\x1d").FindFirstChild("\x8f\x88\x13\x1d", "Humanoid") and (not nil.FindFirstChild(nil, "Head") and v1.Name ~= "Handle"))) then
                    v2 = {
                        ipairs(v1.GetChildren(v1))
                    };
                    v3 = v2[3];
                    z = ipairs(v1.GetChildren(v1));
                    while true do
                        v4 = {
                            z(v2[2], v2[3])
                        };
                        v2 = v4[2];
                        if z(v2[2], v2[3]) == nil then
                            
                        else
                            v8 = z(v2[2], v2[3]);
                            if p.IsA(p, "BodyAngularVelocity") or (p.IsA(p, "BodyForce") or (p.IsA(p, "BodyGyro") or (p.IsA(p, "BodyPosition") or (p.IsA(p, "BodyThrust") or (p.IsA(p, "BodyVelocity") or p.IsA(p, "RocketPropulsion")))))) then
                                p.Destroy(p);
                            end;
                        end; 
                    end;
                    v2 = v1.FindFirstChild(v1, "Attachment");
                    if v2 then
                        v2 = v1.FindFirstChild(v1, "Attachment");
                        v2.Destroy(v2);
                    end;
                    v2 = v1.FindFirstChild(v1, "AlignPosition");
                    if v2 then
                        v2 = v1.FindFirstChild(v1, "AlignPosition");
                        v2.Destroy(v2);
                    end;
                    v2 = v1.FindFirstChild(v1, "Torque");
                    if v2 then
                        v2 = v1.FindFirstChild(v1, "Torque");
                        v2.Destroy(v2);
                    end;
                    v1.CanCollide = false;
                    Torque = Instance.new("Torque", v1);
                    Torque.Torque = Vector3.new(100000, 100000, 100000);
                    k = Instance.new("AlignPosition", v1);
                    v6 = Instance.new("Attachment", v1);
                    L = v6;
                    Torque.Attachment0 = L;
                    k.MaxForce = math.huge;
                    k.MaxVelocity = math.huge;
                    k.Responsiveness = 200;
                    k.Attachment0 = v6;
                    k.Attachment1 = Attachment1;
                    Network.RetainPart(v1);
                end;
                return; 
            end;
            ae.ForcePart = ForcePart;
            ReleasePart = function(arg1_413, ...)
                v1 = arg1_413;
                if v1.IsA(v1, "Part") and not v1.Anchored then
                    v8 = v1.FindFirstChild(v1, "Torque");
                    if v8 then
                        v8 = v1.FindFirstChild(v1, "Torque");
                        v8.Destroy(v8);
                    end;
                    v8 = v1.FindFirstChild(v1, "AlignPosition");
                    if v8 then
                        v8 = v1.FindFirstChild(v1, "AlignPosition");
                        v8.Destroy(v8);
                    end;
                    v1.CanCollide = true;
                end;
                return; 
            end;
            ae.ReleasePart = ReleasePart;
            toggleBlackHole = function(...)
                if blackHoleActive then
                    v1 = vu1249;
                    v2 = {
                        ipairs(v1.GetDescendants(v1))
                    };
                    v3 = v2[3];
                    z = ipairs(v1.GetDescendants(v1));
                    while true do
                        v4 = {
                            z(v2[2], v2[3])
                        };
                        v2 = v4[2];
                        if z(v2[2], v2[3]) == nil then
                            
                        else
                            ForcePart(p);
                        end; 
                    end;
                    v2 = vu1249.DescendantAdded;
                    vu1259 = v2.Connect(v2, function(arg1_414, ...)
                        if blackHoleActive then
                            ForcePart(arg1_414);
                        end;
                        return; 
                    end);
                    v2 = vu1143.RenderStepped;
                    vu1260 = v2.Connect(v2, function(...)
                        BlackHolePart.CFrame = humanoidRootPart.CFrame;
                        return; 
                    end);
                else
                    v6 = {
                        ipairs(Network.BaseParts)
                    };
                    z = v6[3];
                    while true do
                        N = {
                            ipairs(Network.BaseParts)(v6[2], v6[3])
                        };
                        v1 = N[2];
                        if ipairs(Network.BaseParts)(v6[2], v6[3]) == nil then
                            
                        else
                            ReleasePart(v6);
                        end; 
                    end;
                    if vu1259 then
                        v1 = vu1259;
                        v1.Disconnect(v1);
                        vu1259 = nil;
                    end;
                    if vu1260 then
                        N = vu1260;
                        N.Disconnect(N);
                        vu1260 = nil;
                    end;
                    o = resetDone;
                    if not o then
                        resetDone = true;
                        o = vu1143.Heartbeat;
                        o.Wait(o);
                        o = vu1150.Character;
                        o.BreakJoints(o);
                    end;
                    return;
                end; 
            end;
            ae.toggleBlackHole = toggleBlackHole;
            local function r354(...)
                v1 = vu1272;
                v2 = {
                    pairs(v1.GetPlayers(v1))
                };
                v3 = v2[3];
                while true do
                    v4 = pairs(v1.GetPlayers(v1))(v2[2], v2[3]) == nil;
                    v2 = v4[2];
                    if v4 then
                        break;
                    else
                        k = workspace;
                        v4 = k.FindFirstChild(k, v2.Name .. "SpawnedInToys");
                        k = v4;
                        if v4 then
                            k = v4.FindFirstChild(v4, "CreatureBlobman");
                        end;
                        v8 = v4[1];
                        if k then
                            k = p;
                            spawnerPlayer = k;
                            return v4.CreatureBlobman;
                        else
                            
                        end;
                    end; 
                end;
                return nil; 
            end;
            ae.vu1284 = r354;
            grabAndDropRandomPlayer = function(...)
                v8 = vu1272;
                v8.GetPlayers(v8);
                v3 = vu1274;
                if v3 then
                    vu1274 = v3;
                    if vu1274 then
                        v4 = {
                            pairs(v1)
                        };
                        v2 = v4[3];
                        while true do
                            v6 = {
                                pairs(v1)(v4[2], v4[3])
                            };
                            v4 = v6[2];
                            if pairs(v1)(v4[2], v4[3]) == nil then
                                
                            else
                                v7 = r15;
                                L = k.Name ~= vu1276;
                                if L then
                                    v7 = k ~= spawnerPlayer;
                                    v8 = v8;
                                    v6 = v7 and k.Character and (v7.FindFirstChild(v7, "HumanoidRootPart") and table.find(vu1275, k));
                                    v8 = v8;
                                end;
                                v8 = v6[1];
                                if L then
                                    table.insert(v8, k);
                                end;
                            end; 
                        end;
                        v4 = #G ~= 0;
                        if v4 then
                            v4 = v8;
                            v1 = v8;
                        else
                            vu1275 = {};
                        end;
                        if #v1 > 0 then
                            N = v1[math.random(#v1)];
                            L = N.Character;
                            n = vu1274.BlobmanSeatAndOwnerScript.CreatureGrab;
                            n.FireServer(n, unpack({
                                vu1274.RightDetector,
                                L.HumanoidRootPart,
                                vu1274.RightDetector.RightWeld
                            }));
                            table.insert(vu1275, N);
                            wait(.05);
                            d = vu1274.BlobmanSeatAndOwnerScript.CreatureDrop;
                            d.FireServer(d, unpack({
                                vu1274.BlobmanSeatAndOwnerScript.CreatureDrop,
                                L.HumanoidRootPart
                            }));
                        end;
                    end;
                    return;
                else
                    r354();
                end; 
            end;
            ae.grabAndDropRandomPlayer = grabAndDropRandomPlayer;
            startLoop = function(...)
                while vu1273 do
                    grabAndDropRandomPlayer();
                    wait(grabSpeed); 
                end;
                return; 
            end;
            ae.startLoop = startLoop;
            local function OQ_184(...)
                v1 = vu1272;
                v2 = {
                    ipairs(v1.GetPlayers(v1))
                };
                z = ipairs(v1.GetPlayers(v1));
                v3 = v2[3];
                while true do
                    k = {
                        z(v2[2], v2[3])
                    };
                    v4 = k[2];
                    if z(v2[2], v2[3]) == nil then
                        break;
                    else
                        if not table.find(vu1277, p.Name) then
                            table.insert({}, p.Name .. " (" .. p.DisplayName .. ")");
                        end;
                    end; 
                end;
                v4 = vu1299;
                v4.Refresh(v4, {}, true);
                return; 
            end;
            ae.vu1306 = OQ_184;
            local function r355(arg1_415, ...)
                v1 = arg1_415;
                v2 = {
                    ipairs(vu1309)
                };
                v3 = v2[3];
                while true do
                    v4 = {
                        ipairs(vu1309)(v2[2], v2[3])
                    };
                    v2 = v4[2];
                    if v2[1](v2[2], v2[3]) == nil then
                        break;
                    else
                        if v2 == arg1_415 then
                            return true;
                        else
                            
                        end;
                    end; 
                end;
                return false; 
            end;
            ae.vu1315 = r355;
            local function r356(arg1_416, ...)
                v1 = arg1_416;
                G = vu1307;
                v4 = {
                    pairs(G.GetPlayers(G))
                };
                z = v4[3];
                while true do
                    k = {
                        pairs(G.GetPlayers(G))(v4[2], v4[3])
                    };
                    v4 = k[2];
                    k = v4[1](v4[2], v4[3]) == nil;
                    if k then
                        break;
                    else
                        v6 = workspace;
                        k = v6.FindFirstChild(v6, v4.Name .. "SpawnedInToys");
                        if k then
                            v6 = k.FindFirstChild(k, "CreatureBlobman");
                        end;
                        v8 = k[1];
                        if k then
                            return p;
                        else
                            
                        end;
                    end; 
                end;
                return nil; 
            end;
            ae.vu1322 = r356;
            local function OQ_187(...)
                while vu1308 do
                    v1 = vu1307;
                    v2 = {
                        pairs(v1.GetPlayers(v1))
                    };
                    v3 = v2[3];
                    while true do
                        v4 = {
                            pairs(v1.GetPlayers(v1))(v2[2], v2[3])
                        };
                        v2 = v4[2];
                        if pairs(v1.GetPlayers(v1))(v2[2], v2[3]) == nil then
                            wait(grabSpeed);
                        else
                            if not r355(p.Name) then
                                v4 = p.Character;
                                v6 = v4[1];
                                if v4 then
                                    k = v4.FindFirstChild(v4, "HumanoidRootPart");
                                end;
                                v8 = v6;
                                if v4 then
                                    v6 = workspace;
                                    L = p.Name .. "SpawnedInToys";
                                    N = v6.FindFirstChild(v6, L);
                                    if N then
                                        v6 = workspace;
                                        L = v6.FindFirstChild(v6, p.Name .. "SpawnedInToys");
                                        L.FindFirstChild(L, "CreatureBlobman");
                                    end;
                                    L = r356(N);
                                    if L then
                                        o = workspace;
                                        Q = "SpawnedInToys";
                                        n = o.FindFirstChild(o, L.Name .. r14[Q]);
                                        if n then
                                            o = n.FindFirstChild(n, "CreatureBlobman");
                                        end;
                                        v8 = v6;
                                        if n then
                                            r357 = n.CreatureBlobman;
                                            r358 = {
                                                r357.LeftDetector,
                                                v2[r14[L]].HumanoidRootPart,
                                                r357.LeftDetector.LeftWeld
                                            };
                                            if not pcall(function(...)
                                                v8 = r357.BlobmanSeatAndOwnerScript.CreatureGrab;
                                                v8.FireServer(v8, unpack(r358));
                                                return; 
                                            end) then
                                                warn("Error firing server event: " .. Q[2]);
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end; 
                    end; 
                end;
                return; 
            end;
            ae.vu1337 = OQ_187;
            local function OQ_188(...)
                v1 = vu1307;
                v2 = {
                    ipairs(v1.GetPlayers(v1))
                };
                v3 = v2[3];
                z = ipairs(v1.GetPlayers(v1));
                while true do
                    k = {
                        z(v2[2], v2[3])
                    };
                    v4 = k[2];
                    if z(v2[2], v2[3]) == nil then
                        break;
                    else
                        if not r355(p.Name) then
                            table.insert({}, p.Name .. " (" .. p.DisplayName .. ")");
                        end;
                    end; 
                end;
                v4 = vu1342;
                v4.Refresh(v4, {}, true);
                return; 
            end;
            ae.vu1349 = OQ_188;
            local function r359(arg1_417, ...)
                v1 = arg1_417;
                v2 = {
                    ipairs(vu1350)
                };
                v3 = v2[3];
                while true do
                    v4 = {
                        ipairs(vu1350)(v2[2], v2[3])
                    };
                    v2 = v4[2];
                    if ipairs(vu1350)(v2[2], v2[3]) == nil then
                        break;
                    else
                        if v2 == arg1_417 then
                            return true;
                        else
                            
                        end;
                    end; 
                end;
                return false; 
            end;
            ae.vu1356 = r359;
            local function OQ_190(...)
                while vu1308 do
                    v1 = vu1307;
                    v2 = {
                        pairs(v1.GetPlayers(v1))
                    };
                    v3 = v2[3];
                    while true do
                        v4 = {
                            pairs(v1.GetPlayers(v1))(v2[2], v2[3])
                        };
                        v2 = v4[2];
                        if v2[1](v2[2], v2[3]) == nil then
                            wait(grabSpeed);
                        else
                            if not r359(p.Name) then
                                v4 = p.Character;
                                v6 = v4[1];
                                if v4 then
                                    k = v4.FindFirstChild(v4, "HumanoidRootPart");
                                end;
                                v8 = v6;
                                if v4 then
                                    v6 = workspace;
                                    L = p.Name .. "SpawnedInToys";
                                    N = v6.FindFirstChild(v6, L);
                                    if N then
                                        v6 = workspace;
                                        L = v6.FindFirstChild(v6, p.Name .. "SpawnedInToys");
                                        L.FindFirstChild(L, "CreatureBlobman");
                                    end;
                                    L = r356(N);
                                    if L then
                                        o = workspace;
                                        Q = "SpawnedInToys";
                                        n = o.FindFirstChild(o, L.Name .. r14[Q]);
                                        if n then
                                            o = n.FindFirstChild(n, "CreatureBlobman");
                                        end;
                                        v8 = v6;
                                        if n then
                                            r360 = n.CreatureBlobman;
                                            r361 = {
                                                r360.RightDetector,
                                                v2[r14[L]].HumanoidRootPart,
                                                r360.RightDetector.RightWeld
                                            };
                                            if not pcall(function(...)
                                                v8 = r360.BlobmanSeatAndOwnerScript.CreatureGrab;
                                                v8.FireServer(v8, unpack(r361));
                                                return; 
                                            end) then
                                                warn("Error firing server event: " .. Q[2]);
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end; 
                    end; 
                end;
                return; 
            end;
            ae.vu1377 = OQ_190;
            local function OQ_191(...)
                v1 = vu1307;
                v2 = {
                    ipairs(v1.GetPlayers(v1))
                };
                z = ipairs(v1.GetPlayers(v1));
                v3 = v2[3];
                while true do
                    k = {
                        z(v2[2], v2[3])
                    };
                    v4 = k[2];
                    if z(v2[2], v2[3]) == nil then
                        break;
                    else
                        if not r359(p.Name) then
                            table.insert({}, p.Name .. " (" .. p.DisplayName .. ")");
                        end;
                    end; 
                end;
                v4 = vu1382;
                v4.Refresh(v4, {}, true);
                return; 
            end;
            ae.vu1389 = OQ_191;
            executeScript = function(arg1_418, ...)
                r362 = arg1_418;
                v3 = pcall(function(...)
                    v1 = game;
                    loadstring(v1.HttpGet(v1, r362, true))();
                    return; 
                end);
                if not v3 then
                    warn("Failed to execute script: " .. z[2]);
                end;
                return; 
            end;
            ae.executeScript = executeScript;
            executeOnce = function(arg1_419, arg2_419, ...)
                G = arg2_419;
                if G then
                    return G;
                end;
                executeScript(arg1_419);
                return true; 
            end;
            ae.executeOnce = executeOnce;
            setFireAnimationEnabled = function(arg1_420, ...)
                if arg1_420 then
                    playFireFlailAnimation();
                else
                    stopFireFlailAnimation();
                end;
                return; 
            end;
            ae.setFireAnimationEnabled = setFireAnimationEnabled;
            setMouseTeleportEnabled = function(arg1_421, ...)
                v8 = arg1_421 == true;
                G = v8;
                r274 = v8;
                v8 = G;
                if r274 and not mouseTeleportInitialized then
                    v2 = G;
                    mouseTeleportInitialized = true;
                    v4 = r257.Character;
                    if v4 then
                        setupCharacter(v4);
                        v8 = v2;
                        return;
                    else
                        v4 = r257.CharacterAdded;
                        z = v4.Wait(v4);
                    end;
                end; 
            end;
            ae.setMouseTeleportEnabled = setMouseTeleportEnabled;
            setSilentAimEnabled = function(arg1_422, ...)
                vu550 = arg1_422 == true;
                ToggleSilentAim(vu550);
                return; 
            end;
            ae.setSilentAimEnabled = setSilentAimEnabled;
            setSilentAimRange = function(arg1_423, ...)
                v3 = math.clamp;
                v2 = tonumber(arg1_423);
                if v2 then
                    v8 = v8;
                    vu551 = v8(v2, 5, 500);
                    return;
                else
                    G = vu551;
                end; 
            end;
            ae.setSilentAimRange = setSilentAimRange;
            setGrabLineLagEnabled = function(arg1_424, ...)
                toggleLag(arg1_424 == true);
                return; 
            end;
            ae.setGrabLineLagEnabled = setGrabLineLagEnabled;
            setGrabLineSpeed = function(arg1_425, ...)
                v3 = math.clamp;
                v2 = tonumber(arg1_425);
                if v2 then
                    v8 = v8;
                    lagSpeed = v8(v2, .01, 2);
                    return;
                else
                    G = lagSpeed;
                end; 
            end;
            ae.setGrabLineSpeed = setGrabLineSpeed;
            setLineAllEnabled = function(arg1_426, ...)
                if arg1_426 then
                    task.spawn(function(...)
                        toggleScript(true);
                        return; 
                    end);
                else
                    toggleScript(false);
                end;
                return; 
            end;
            ae.setLineAllEnabled = setLineAllEnabled;
            setLineAllSpeed = function(arg1_427, ...)
                v3 = math.clamp;
                v2 = tonumber(arg1_427);
                if v2 then
                    v8 = v8;
                    vu327 = v8(v2, .01, 2);
                    return;
                else
                    G = vu327;
                end; 
            end;
            ae.setLineAllSpeed = setLineAllSpeed;
            setAutoGrabNearbyEnabled = function(arg1_428, ...)
                r313(arg1_428 == true);
                return; 
            end;
            ae.setAutoGrabNearbyEnabled = setAutoGrabNearbyEnabled;
            setVoidRescueEnabled = function(arg1_429, ...)
                v1 = arg1_429;
                if v1 then
                    p = not antiVoidEnabled;
                end;
                if v1 then
                    antiVoidEnabled = true;
                    task.spawn(checkVoid);
                else
                    antiVoidEnabled = v1 == true;
                end;
                return; 
            end;
            ae.setVoidRescueEnabled = setVoidRescueEnabled;
            setGhostNoclipEnabled = function(arg1_430, ...)
                toggleNoclip(arg1_430 == true);
                return; 
            end;
            ae.setGhostNoclipEnabled = setGhostNoclipEnabled;
            setAntiKickEnabled = function(arg1_431, ...)
                v8 = arg1_431 == true;
                toggleActiveAntiKick = v8;
                v8 = v8;
                if toggleActiveAntiKick and not antiKickLoopStarted then
                    antiKickLoopStarted = true;
                    task.spawn(runAntiKickLoop);
                end;
                return; 
            end;
            ae.setAntiKickEnabled = setAntiKickEnabled;
            setBeamCycleEnabled = function(arg1_432, ...)
                v1 = arg1_432;
                if v1 then
                    p = not beamCycleEnabled;
                end;
                if v1 then
                    beamCycleEnabled = true;
                    task.spawn(function(...)
                        while beamCycleEnabled do
                            updateBeamColors();
                            task.wait(1); 
                        end;
                        return; 
                    end);
                else
                    beamCycleEnabled = v1 == true;
                end;
                return; 
            end;
            ae.setBeamCycleEnabled = setBeamCycleEnabled;
            setGrabEverythingEnabled = function(arg1_433, ...)
                grabEnabled = arg1_433 == true;
                if grabEnabled then
                    task.spawn(r286);
                end;
                return; 
            end;
            ae.setGrabEverythingEnabled = setGrabEverythingEnabled;
            setGrabEverythingSpeed = function(arg1_434, ...)
                v3 = math.clamp;
                v2 = tonumber(arg1_434);
                if v2 then
                    v8 = v8;
                    grabSpeed = v8(v2, .01, 10);
                    return;
                else
                    G = grabSpeed;
                end; 
            end;
            ae.setGrabEverythingSpeed = setGrabEverythingSpeed;
            setGrabAllToysLoopEnabled = function(arg1_435, ...)
                handleToggle(arg1_435 == true);
                return; 
            end;
            ae.setGrabAllToysLoopEnabled = setGrabAllToysLoopEnabled;
            setBlobDropLoopEnabled = function(arg1_436, ...)
                vu1273 = arg1_436 == true;
                if vu1273 then
                    p = vu1274 and task.spawn(startLoop);
                    v8 = v1 == true;
                    vu1274 = r354();
                    task.spawn(startLoop);
                end;
                return; 
            end;
            ae.setBlobDropLoopEnabled = setBlobDropLoopEnabled;
            return;
        else
            fQ = r257.CharacterAdded;
            TQ = fQ.Wait(fQ);
        end;
    else
        Ye = r41.CharacterAdded;
        x = Ye.Wait(Ye);
    end;
else
    v7 = r27.CharacterAdded;
    o = v7.Wait(v7);
end;
end;
