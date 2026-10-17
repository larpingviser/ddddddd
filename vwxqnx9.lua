-- FTAP Reverse
-- https://t.me/ReverseFTAP

local Env = getfenv();
local Q = {};
v2 = game;
loadstring(v2.HttpGet(v2, "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))();
task.spawn(function(...)
    v1 = Instance.new("ScreenGui");
    v1.Name = "UltimateLoader";
    v1.ResetOnSpawn = false;
    v1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    v1.DisplayOrder = 999999;
    v1.IgnoreGuiInset = true;
    v1.Parent = CG;
    X = Instance.new("Frame");
    X.Name = "Background";
    X.Size = UDim2.new(1, 0, 1, 0);
    X.Position = UDim2.new(0, 0, 0, 0);
    X.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    X.BorderSizePixel = 0;
    X.ZIndex = 999999;
    X.Parent = v1;
    J = Instance.new("Frame");
    J.Name = "Particles";
    J.Size = UDim2.new(1, 0, 1, 0);
    J.BackgroundTransparency = 1;
    J.ZIndex = 999999;
    J.Parent = X;
    for e = 1, 50 do
        v4 = e;
        r24 = Instance.new("Frame");
        r24.Size = UDim2.new(0, math.random(2, 6), 0, math.random(2, 6));
        r24.Position = UDim2.new(math.random(0, 100) / 100, 0, math.random(0, 100) / 100, 0);
        r24.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
        r24.BackgroundTransparency = math.random(50, 90) / 100;
        r24.BorderSizePixel = 0;
        r24.ZIndex = 999999;
        w = Instance.new("Frame");
        r24.Parent = w;
        Instance.new("UICorner", r24).CornerRadius = UDim.new(1, 0);
        task.spawn(function(...)
            e = r16("zd>\x93J\xfe", 12046231983593);
            while r24[r15[e]] do
                v3 = TS;
                i = v3.Create(v3, r24, TweenInfo.new(math.random(20, 40) / 10, Enum.EasingStyle.Linear), {
                    ["BackgroundTransparency"] = 1
                });
                i.Play(i);
                task.wait(math.random(20, 40) / 10);
                v3 = TS;
                i = v3.Create(v3, r24, TweenInfo.new(math.random(20, 40) / 10, Enum.EasingStyle.Linear), {
                    ["BackgroundTransparency"] = math.random(50, 90) / 100
                });
                i.Play(i);
                task.wait(math.random(20, 40) / 10); 
            end;
            return; 
        end); 
    end;
    e = Instance.new("TextLabel");
    e.Name = "Logo";
    e.Size = UDim2.new(0, 0, 0, 0);
    e.Position = UDim2.new(0.5, 0, .35, 0);
    e.AnchorPoint = Vector2.new(0.5, 0.5);
    e.BackgroundTransparency = 1;
    e.Text = "VUHUT";
    e.TextColor3 = Color3.fromRGB(255, 255, 255);
    e.Font = Enum.Font.GothamBold;
    e.TextSize = 0;
    e.TextTransparency = 1;
    e.ZIndex = 999999;
    e.Parent = X;
    o = Instance.new("UIStroke");
    o.Color = Color3.fromRGB(255, 255, 255);
    o.Thickness = 0;
    o.Transparency = 1;
    o.Parent = e;
    v3 = TS;
    i = v3.Create(v3, e, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        ["Size"] = UDim2.new(0, 500, 0, 120),
        ["TextSize"] = 72,
        ["TextTransparency"] = 0
    });
    i.Play(i);
    v3 = TS;
    i = v3.Create(v3, o, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        ["Thickness"] = 3,
        ["Transparency"] = 0
    });
    i.Play(i);
    task.wait(1.2);
    v2 = Instance.new("TextLabel");
    v2.Name = "Subtitle";
    v2.Size = UDim2.new(0, 600, 0, 40);
    v2.Position = UDim2.new(0.5, 0, 0.5, 0);
    v2.AnchorPoint = Vector2.new(0.5, 0.5);
    v2.BackgroundTransparency = 1;
    v2.Text = "Ultimate Edition";
    v2.TextColor3 = Color3.fromRGB(200, 200, 200);
    v2.Font = Enum.Font.Gotham;
    v2.TextSize = 24;
    v2.TextTransparency = 1;
    v2.ZIndex = 999999;
    v2.Parent = X;
    v3 = TS;
    i = v3.Create(v3, v2, TweenInfo.new(.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["TextTransparency"] = 0
    });
    i.Play(i);
    task.wait(1);
    n = Instance.new("Frame");
    n.Name = "ProgressBG";
    n.Size = UDim2.new(0, 400, 0, 4);
    n.Position = UDim2.new(0.5, -200, .65, 0);
    n.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
    n.BorderSizePixel = 0;
    n.ZIndex = 999999;
    n.Parent = X;
    Instance.new("UICorner", n).CornerRadius = UDim.new(1, 0);
    v4 = Instance.new("Frame");
    v4.Name = "Bar";
    v4.Size = UDim2.new(0, 0, 1, 0);
    v4.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    v4.BorderSizePixel = 0;
    v4.ZIndex = 999999;
    v4.Parent = n;
    Instance.new("UICorner", v4).CornerRadius = UDim.new(1, 0);
    K = Instance.new("TextLabel");
    K.Name = "Status";
    K.Size = UDim2.new(0, 400, 0, 30);
    K.Position = UDim2.new(0.5, -200, .72, 0);
    K.BackgroundTransparency = 1;
    K.Text = "Initializing...";
    K.TextColor3 = Color3.fromRGB(180, 180, 180);
    K.Font = Enum.Font.GothamMedium;
    K.TextSize = 16;
    K.ZIndex = 999999;
    K.Parent = X;
    v5 = "t";
    v6 = "t";
    F = "Building interface...";
    Y = "w";
    w = {
        {
            ["t"] = "Loading services...",
            ["w"] = 0.5
        },
        {
            ["t"] = "Connecting to server...",
            ["w"] = .6
        },
        {
            ["t"] = "Injecting hooks...",
            ["w"] = .4
        },
        {
            [v5] = "Loading UI library...",
            ["w"] = .7
        },
        v5,
        {
            ["t"] = "Finalizing...",
            ["w"] = .3
        }
    };
    t = v5[3];
    v5 = v5[1];
    for t, F in v5, ipairs(w), v5, F do
        K.Text = F.t;
        v3 = TS;
        Y = v3.Create(v3, v4, TweenInfo.new(F.w, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["Size"] = UDim2.new(t / #w, 0, 1, 0)
        });
        Y.Play(Y);
        task.wait(F.w); 
    end;
    K.Text = "Ready!";
    task.wait(0.5);
    v3 = TS;
    a = v3.Create(v3, e, TweenInfo.new(.8, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        ["TextTransparency"] = 1,
        ["Size"] = UDim2.new(0, 0, 0, 0)
    });
    a.Play(a);
    v3 = TS;
    a = v3.Create(v3, v2, TweenInfo.new(.8, Enum.EasingStyle.Quad), {
        ["TextTransparency"] = 1
    });
    a.Play(a);
    v3 = TS;
    a = v3.Create(v3, K, TweenInfo.new(.8, Enum.EasingStyle.Quad), {
        ["TextTransparency"] = 1
    });
    a.Play(a);
    v3 = TS;
    a = v3.Create(v3, n, TweenInfo.new(.8, Enum.EasingStyle.Quad), {
        ["BackgroundTransparency"] = 1
    });
    a.Play(a);
    v3 = TS;
    a = v3.Create(v3, v4, TweenInfo.new(.8, Enum.EasingStyle.Quad), {
        ["BackgroundTransparency"] = 1
    });
    a.Play(a);
    v3 = TS;
    a = v3.Create(v3, o, TweenInfo.new(.8, Enum.EasingStyle.Quad), {
        ["Transparency"] = 1
    });
    a.Play(a);
    v3 = TS;
    a = v3.Create(v3, X, TweenInfo.new(1.2, Enum.EasingStyle.Quad), {
        ["BackgroundTransparency"] = 1
    });
    a.Play(a);
    task.wait(1.3);
    v1.Destroy(v1);
    return; 
end);
J = game;
r25 = J.GetService(J, "Players");
r26 = r25.LocalPlayer;
o = game;
r27 = o.GetService(o, "CoreGui");
n = game;
r28 = n.GetService(n, "UserInputService");
v4 = game;
r29 = v4.GetService(v4, "ReplicatedStorage");
K = game;
r30 = K.GetService(K, "RunService");
r31 = workspace;
r32 = r31.CurrentCamera;
w = game;
r33 = w.GetService(w, "Debris");
v5 = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/";
s = game;
r34 = loadstring(s.HttpGet(s, v5 .. "Library.lua"))();
D = game;
v6 = loadstring(D.HttpGet(D, v5 .. "addons/ThemeManager.lua"))();
E = game;
s = loadstring(E.HttpGet(E, v5 .. "addons/SaveManager.lua"))();
r34.ForceCheckbox = true;
r35 = r34.Options;
r36 = r34.Toggles;
local function r37(arg1_2, arg2_2, arg3_2, ...)
    v3 = r34;
    v1 = arg1_2;
    J = arg3_2;
    X = arg2_2;
    v4 = v3;
    if X then
        v3 = "Time";
        w = v3;
        v3.Notify(v3, {
            ["Title"] = arg1_2,
            ["Description"] = X,
            ["Time"] = arg3_2 or 5
        });
        return;
    else
        n = "";
    end; 
end;
E = r34;
b = E.CreateWindow(E, {
    ["Title"] = "Rut:sob",
    ["Icon"] = "sword",
    ["Footer"] = "No Footer |Free :3",
    ["NotifySide"] = "Right",
    ["ShowCustomCursor"] = false
});
b.SetCornerRadius(b, 4);
v6.SetLibrary(v6, r34);
E = r27;
R = E.FindFirstChild(E, "GGOGFPSWindow");
if not R then
    R = Instance.new("ScreenGui");
    R.Name = "GGOGFPSWindow";
    R.ResetOnSpawn = false;
    R.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    R.Parent = r27;
end;
r38 = R.FindFirstChild(R, "FPSFrame");
if not r38 then
    r38 = Instance.new("Frame");
    r38.Name = "FPSFrame";
    r38.Size = UDim2.new(0, 200, 0, 40);
    r38.Position = UDim2.new(0.5, -100, .3, -20);
    r38.BackgroundColor3 = Color3.new(.06, .06, .06);
    r38.BorderSizePixel = 0;
    r38.ZIndex = 1000000;
    r38.Active = true;
    r38.Parent = R;
    Instance.new("UICorner", r38).CornerRadius = UDim.new(0, 20);
    l = Instance.new("UIStroke");
    l.Parent = r38;
    l.Color = Color3.new(1, 1, 1);
    l.Transparency = .8;
    l.Thickness = 1;
end;
E = r38;
r39 = E.FindFirstChild(E, "FPSValue");
if not r39 then
    r39 = Instance.new("TextLabel");
    r39.Name = "FPSValue";
    r39.Size = UDim2.new(1, -16, 1, -14);
    r39.Position = UDim2.new(0, 8, 0, 7);
    r39.BackgroundTransparency = 1;
    r39.Active = true;
    r39.Selectable = true;
    r39.Font = Enum.Font.GothamBold;
    r39.TextSize = 16;
    r39.TextColor3 = Color3.new(1, 1, 1);
    r39.Text = "\xf0\x9f\x8c\x99 FPS: ... | MS: ...";
    r39.TextXAlignment = Enum.TextXAlignment.Left;
    r39.TextYAlignment = Enum.TextYAlignment.Center;
    r39.Parent = r38;
end;
if not _G.GGOGFPSInitialized then
    _G.GGOGFPSInitialized = true;
    r40 = false;
    r41 = Vector2.new(0, 0);
    r43 = false;
    In = r38.MouseEnter;
    In.Connect(In, function(...)
        r43 = true;
        return; 
    end);
    In = r38.MouseLeave;
    In.Connect(In, function(...)
        r43 = false;
        return; 
    end);
    In = r28.InputBegan;
    In.Connect(In, function(arg1_3, arg2_3, ...)
        X = arg2_3;
        if r43 then
            if arg1_3.UserInputType == Enum.UserInputType.MouseButton1 then
                r40 = true;
                i = r28;
                r41 = i.GetMouseLocation(i);
                r42 = r38.Position;
            else
                if arg1_3.UserInputType == Enum.UserInputType.Touch then
                    r40 = true;
                    r41 = arg1_3.Position;
                    r42 = r38.Position;
                end;
            end;
        end;
        return; 
    end);
    In = r28.InputEnded;
    In.Connect(In, function(arg1_4, arg2_4, ...)
        X = arg2_4;
        v1 = arg1_4;
        if v1.UserInputType == Enum.UserInputType.MouseButton1 or v1.UserInputType == Enum.UserInputType.Touch then
            r40 = false;
        end;
        return; 
    end);
    In = r28.InputChanged;
    In.Connect(In, function(arg1_5, arg2_5, ...)
        X = arg2_5;
        if r40 then
            Vector2.new(0, 0);
            v3 = arg1_5.UserInputType == Enum.UserInputType.MouseMovement;
            if v3 then
                v3 = r28;
                v3.GetMouseLocation(v3);
            else
                if arg1_5.UserInputType == Enum.UserInputType.Touch then
                    J = arg1_5.Position;
                    e = J - r41;
                    r38.Position = UDim2.new(r42.X.Scale, r42.X.Offset + e.X, r42.Y.Scale, r42.Y.Offset + e.Y);
                end;
                return;
            end;
        end;
        return; 
    end);
    r44 = tick();
    r45 = 0;
    r46 = 0;
    r47 = 0;
    r48 = 0;
    en = r30.RenderStepped;
    _G.GGOGFPSConnection = en.Connect(en, function(arg1_6, ...)
        r45 = r45 + 1;
        r47 = r47 + arg1_6;
        if tick() - r44 >= 0.5 then
            r46 = math.floor(r45 / (tick() - r44) + 0.5);
            r48 = math.floor(r47 / r45 * 1000 + 0.5);
            r39.Text = "\xf0\x9f\x8c\x99 FPS: " .. tostring(r46) .. " | MS: " .. tostring(r48);
            r44 = tick();
            r45 = 0;
            r47 = 0;
        end;
        return; 
    end);
end;
l = {
    ["Main"] = b.AddTab(b, "Main", "house"),
    ["LocalPlayer"] = b.AddTab(b, "LocalPlayer", "user"),
    ["Visual"] = b.AddTab(b, "Visual", "palette"),
    ["Target"] = b.AddTab(b, "Target", "crosshair"),
    ["AnimCreator"] = b.AddTab(b, "Anim Creator", "human"),
    ["Server"] = b.AddTab(b, "Server", "server"),
    ["Keybinds"] = b.AddTab(b, "Keybinds", "keyboard"),
    ["Teleport"] = b.AddTab(b, "Teleport", "zap"),
    ["Misc"] = b.AddTab(b, "Misc", "layers"),
    ["Whitelist"] = b.AddTab(b, "Whitelist", "book-open"),
    ["Code"] = b.AddTab(b, "Code", "code"),
    ["CMD"] = b.AddTab(b, "CMD", "terminal"),
    ["Developers"] = b.AddTab(b, "Developers", "pickaxe"),
    ["VUHUT"] = b.AddTab(b, "VUHUT", "info"),
    ["UI"] = b.AddTab(b, "UI Settings", "settings")
};
Tn = r29;
r49 = Tn.WaitForChild(Tn, "CharacterEvents", 10);
In = r29;
Zn = In.WaitForChild(In, "GrabEvents", 10);
r50 = Zn.WaitForChild(Zn, "SetNetworkOwner");
r51 = Zn.WaitForChild(Zn, "CreateGrabLine");
r52 = Zn.WaitForChild(Zn, "DestroyGrabLine");
In = r49;
r53 = In.FindFirstChild(In, "RagdollRemote");
local function r54(arg1_7, arg2_7, ...)
    v1 = arg1_7;
    if not v1 or not v1.Parent then
        return;
    end;
    J = Instance.new("BodyVelocity");
    J.MaxForce = Vector3.new(100000000, 100000000, 100000000);
    J.Velocity = arg2_7;
    J.Parent = v1;
    v3 = r33;
    v3.AddItem(v3, J, 1);
    return; 
end;
local function r55(arg1_8, arg2_8, ...)
    v1 = arg1_8;
    J = not v1;
    i = J;
    X = arg2_8;
    if J then
        if i then
            return;
        end;
        J = Instance.new("BodyPosition");
        J.MaxForce = Vector3.new(100000000, 100000000, 100000000);
        J.Position = arg2_8.Position;
        J.P = 20000;
        J.D = 5000;
        i = arg1_8;
        J.Parent = i;
        v3 = r33;
        v3.AddItem(v3, J, 1);
        return;
    else
        i = not v1.Parent;
    end; 
end;
local function r57(...)
    e = Q[J];
    X = e[2];
    e = e[1];
    for J, v2 in ipairs(e.GetPlayers(e)) do
        o = J;
        if v2 ~= r26 then
            table.insert({}, v2.DisplayName .. " (" .. v2.Name .. ")");
        end; 
    end;
    return {}; 
end;
local function r58(arg1_9, ...)
    v1 = arg1_9;
    if not v1 then
        return nil;
    end;
    J = r16;
    X = v1.match(v1, "%((.-)%)");
    if X then
        J = r25;
        i = J.FindFirstChild(J, X);
    end;
    return X; 
end;
local function r59(...)
    v1 = r26.Character;
    X = v1 and v1.FindFirstChild(v1, "Humanoid");
    J = X and X.SeatPart;
    if not J or (not J.Parent or J.Parent.Name ~= "CreatureBlobman") then
        return nil;
    end;
    e = J.Parent;
    o = e.FindFirstChild(e, "HumanoidRootPart") or e.PrimaryPart;
    v2 = e.FindFirstChild(e, "BlobmanSeatAndOwnerScript");
    if not v2 then
        return nil;
    end;
    n = v2.FindFirstChild(v2, "CreatureGrab");
    v4 = v2.FindFirstChild(v2, "CreatureDrop");
    K = e.FindFirstChild(e, "RightDetector");
    v3 = e.FindFirstChild(e, "LeftDetector");
    w = v3;
    a = K and K.FindFirstChild(K, "RightWeld");
    v5 = not n;
    if n then
        if v4 then
            if K then
                if a then
                    W = e.FindFirstChild(e, "HumanoidRootPart") or e.PrimaryPart;
                end;
                e.FindFirstChild(e, r15[r16("\x00W\x1f\x02\xd5[\x11`\x16)\x0c\xf9", v6)]);
                Y = a;
            end;
            v6 = K;
            e.FindFirstChild(e, r15[r16("\x00W\x1f\x02\xd5[\x11`\x16)\x0c\xf9", v6)]);
        end;
        e.FindFirstChild(e, r15[r16("\x00W\x1f\x02\xd5[\x11`\x16)\x0c\xf9", v6)]);
        i = v4;
    end;
    v3 = v5;
    if not n then
        return nil;
    end;
    return {
        ["bl"] = e,
        ["br"] = o,
        ["cg"] = n,
        ["cd"] = v4,
        ["rd"] = K,
        ["ld"] = w,
        ["rw"] = a,
        ["lw"] = w and w.FindFirstChild(w, "LeftWeld"),
        ["sp"] = o.CFrame
    }; 
end;
local function r60(...)
    X = r26;
    v1 = X.Character;
    i = v1;
    if v1 then
        v2 = "\xf8\xcbKC\x10\xb9\x16\xde\xe4R\x7f\xd8<\xea\xd3\x83";
        n = 7671486762484;
        X = v1.WaitForChild(v1, "Humanoid", 5);
        e = not X;
        i = e;
        r61 = v1.WaitForChild(v1, r15[r16(v2, n)], 5);
        if e then
            if i then
                return false;
            end;
            if X.SeatPart and (X.SeatPart.Parent and X.SeatPart.Parent.Name == "CreatureBlobman") then
                return true;
            end;
            e = r26.Name .. "SpawnedInToys";
            v3 = r31;
            o = v3.FindFirstChild(v3, e);
            v2 = o and o.FindFirstChild(o, "CreatureBlobman");
            v3 = not v2;
            if v3 then
                pcall(function(...)
                    v3 = r29.MenuToys.SpawnToyRemoteFunction;
                    v3.InvokeServer(v3, "CreatureBlobman", r61.CFrame, Vector3.zero);
                    return; 
                end);
                task.wait(0.5);
                v3 = r31;
                o = v3.WaitForChild(v3, e, 5);
                if o then
                    v2 = o.WaitForChild(o, "CreatureBlobman", 5);
                end;
            end;
            if not v2 then
                return false;
            end;
            n = v2.FindFirstChildWhichIsA(v2, "VehicleSeat", true);
            if not n then
                return false;
            end;
            K = tick();
            v4 = X.SeatPart == n or tick() - K > 3;
            v3 = v3;
            r61.CFrame = n.CFrame + Vector3.new(0, 1, 0);
            r61.Velocity = Vector3.zero;
            n.Sit(n, X);
            v4 = r30.Heartbeat;
            v4.Wait(v4);
            v3 = v3;
            if X.SeatPart == n or tick() - K > 3 then
                return v1.WaitForChild(v1, "Humanoid", 5).SeatPart == n;
            end;
        else
            i = not r61;
        end;
    else
        v1 = r26.CharacterAdded;
        i = v1.Wait(v1);
    end; 
end;
local function r62(arg1_10, ...)
    r63 = arg1_10;
    task.spawn(function(...)
        while r63() do
            v1 = r26.Character;
            i = v1;
            v1 = i and v1.FindFirstChild(v1, "Humanoid");
            if v1 then
                i = not v1.SeatPart;
            end;
            if v1 then
                r16();
            end;
            task.wait(.3); 
        end;
        return; 
    end);
    return; 
end;
r64 = false;
r65 = 0;
CFrame.new(-145.5, -29.9, 574.8);
local function r67(...)
    r65 = r65 + 1;
    if r66 then
        return;
    end;
    i = r30.Heartbeat;
    r66 = i.Connect(i, function(...)
        if r65 > 0 and (r56 and r56.Parent) then
        end;
        return; 
    end);
    return; 
end;
local function r68(...)
    r65 = math.max(0, r65 - 1);
    if r65 == 0 and r66 then
        v3 = r66;
        v3.Disconnect(v3);
    end;
    return; 
end;
local function r69(arg1_11, arg2_11, arg3_11, ...)
    J = arg3_11;
    v1 = arg1_11;
    if not v1 or not v1.Parent then
        return nil, nil;
    end;
    if nil then
        if nil then
            w = nil.Health > 0;
        end;
    end;
    if nil then
        task.wait(.2);
        v3 = v1.Character;
        v4 = v3;
        while not v3 do
            n = v2;
            v3 = v3;
            o = v2 and v3.FindFirstChild(v3, "Humanoid");
            if n then
                if o then
                    v5 = (v4 and v2.FindFirstChild(v2, "Humanoid")).Health > 0;
                end;
                a = o;
                v3 = K;
            end;
            v3 = v3;
            v3 = v3;
            if n or tick() - tick() > (arg2_11 or 15) then
                if n then
                    if o then
                        a = (v4 and v2.FindFirstChild(v2, "Humanoid")).Health > 0;
                    end;
                    K = o;
                    v3 = w;
                end;
                v3 = v3;
                if n then
                    return i, v4 and v2.FindFirstChild(v2, "Humanoid");
                end;
                return nil, nil;
            end; 
        end;
        v3.FindFirstChild(v3, "HumanoidRootPart");
    else
        if J then
            w = not arg3_11();
        end;
        v3 = v3;
        v5 = v3;
        v3 = v3;
        i = tick() - tick() > (arg2_11 or 15) or J;
    end; 
end;
local function r70(...)
    v1 = r26.Character;
    if v1 then
        return v1.FindFirstChild(v1, "HumanoidRootPart");
    end;
    return nil; 
end;
local function r71(arg1_12, arg2_12, ...)
    v1 = arg1_12;
    return CFrame.new(v1, v1 + (arg2_12 - v1).Unit); 
end;
local function r72(arg1_13, ...)
    v1 = arg1_13;
    if v1 then
        i = v1.Parent;
    end;
    if v1 then
        v3 = v1.Parent;
        X = v3.FindFirstChildOfClass(v3, "Humanoid");
        if X then
            X.PlatformStand = true;
            task.wait(.1);
            X.PlatformStand = false;
        end;
    end;
    return; 
end;
Hn = l.Main;
Gn = Hn.AddLeftGroupbox(Hn, "Combat", "sword");
Hn = l.Main;
wn = Hn.AddRightGroupbox(Hn, "Settings", "settings");
_G.str = 750;
wn.AddSlider(wn, "Strength", {
    ["Text"] = "Strength",
    ["Min"] = 0,
    ["Max"] = 40000,
    ["Default"] = 300,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_14, ...)
        _G.str = arg1_14;
        return; 
    end
});
Gn.AddToggle(Gn, "SuperStrength", {
    ["Text"] = "Super Strength",
    ["Default"] = false,
    ["Callback"] = function(arg1_15, ...)
        if arg1_15 then
            v3 = r31.ChildAdded;
            r73 = v3.Connect(v3, function(arg1_16, ...)
                r74 = arg1_16;
                if r74.Name == "GrabParts" then
                    i = r74.GrabPart.WeldConstraint;
                    X = i.Part1;
                    if X then
                        r75 = Instance.new("BodyVelocity", X);
                        v3 = r74;
                        i = v3.GetPropertyChangedSignal(v3, "Parent");
                        i.Connect(i, function(...)
                            if not r74.Parent then
                                i = r28;
                                v3 = i.GetLastInputType(i) == Enum.UserInputType.MouseButton2;
                                if v3 then
                                    r75.MaxForce = Vector3.new(100000000, 100000000, 100000000);
                                    r75.Velocity = r32.CFrame.LookVector * _G.str;
                                    v3 = r33;
                                    v3.AddItem(v3, r75, 1);
                                else
                                    v3 = r75;
                                    v3.Destroy(v3);
                                end;
                            end;
                            return; 
                        end);
                    end;
                end;
                return; 
            end);
        else
            if r73 then
                v3 = r73;
                v3.Disconnect(v3);
            end;
            return;
        end; 
    end
});
r76 = false;
Hn = r31.ChildAdded;
Hn.Connect(Hn, function(arg1_17, ...)
    v1 = arg1_17;
    if v1.IsA(v1, "Model") and (v1.Name == "GrabParts" and r76) then
        task.wait(.05);
        X = v1.FindFirstChild(v1, "GrabPart");
        if X then
            i = X.FindFirstChild(X, "WeldConstraint");
        end;
        if X then
            r77 = X.WeldConstraint.Part1;
            if r77 and (r77.Parent and r77.Parent ~= r26.Character) then
                pcall(function(...)
                    v3 = r77.Parent;
                    v3.FindFirstChildOfClass(v3, "Humanoid").Health = 0;
                    v3 = r77.Parent;
                    v3.BreakJoints(v3);
                    return; 
                end);
            end;
        end;
    end;
    return; 
end);
Hn = r31.ChildAdded;
Hn.Connect(Hn, function(arg1_18, ...)
    v1 = arg1_18;
    if v1.IsA(v1, "Model") and v1.Name == "GrabParts" then
        X = v1.FindFirstChild(v1, "GrabPart");
        if not X then
            return;
        end;
        J = X.FindFirstChild(X, "WeldConstraint");
        if not J or not J.Part1 then
            return;
        end;
        r78 = J.Part1;
        task.spawn(function(...)
            task.wait(.05);
            if r76 then
                if r78 and (r78.Parent and r78.Parent ~= r26.Character) then
                    pcall(function(...)
                        v3 = r78.Parent;
                        v3.FindFirstChildOfClass(v3, "Humanoid").Health = 0;
                        v3 = r78.Parent;
                        v3.BreakJoints(v3);
                        return; 
                    end);
                end;
            end;
            if _G.eAncG then
                v3 = r50;
                v3.FireServer(v3, r78);
                v1 = r78.CFrame;
                for X = 1, 2 do
                    v2 = X;
                    v3 = r50;
                    v3.FireServer(v3, r78);
                    n = Instance.new("BodyPosition");
                    n.Position = v1.Position;
                    n.MaxForce = Vector3.new(100000000, 100000000, 100000000);
                    n.Parent = r78;
                    v4 = Instance.new("BodyGyro");
                    v4.CFrame = v1;
                    v4.MaxTorque = Vector3.new(100000000, 100000000, 100000000);
                    v4.Parent = r78;
                    task.wait(0.5); 
                end;
            end;
            return; 
        end);
    end;
    return; 
end);
Gn.AddToggle(Gn, "KillGrab", {
    ["Text"] = "Kill Grab",
    ["Default"] = false,
    ["Callback"] = function(arg1_19, ...)
        r76 = arg1_19;
        return; 
    end
});
Gn.AddToggle(Gn, "MasslessGrab", {
    ["Text"] = "Massless Grab",
    ["Default"] = false,
    ["Callback"] = function(arg1_20, ...)
        v1 = arg1_20;
        _G.MLG = v1;
        if not v1 then
            if _G.MLC then
                v3 = _G.MLC;
                v3.Disconnect(v3);
                _G.MLC = nil;
            end;
            return;
        end;
        v3 = _G.MLC;
        if v3 then
            v3 = _G.MLC;
            v3.Disconnect(v3);
        end;
        X = r30.Heartbeat;
        _G.MLC = X.Connect(X, function(...)
            if not _G.MLG then
                return;
            end;
            v3 = r31;
            v1 = v3.FindFirstChild(v3, "GrabParts");
            if not v1 then
                return;
            end;
            X = v1.FindFirstChild(v1, "DragPart");
            if not X then
                return;
            end;
            J = X.FindFirstChild(X, "AlignPosition");
            if J then
                J.Responsiveness = 200;
                J.MaxForce = 100000000;
                J.MaxVelocity = 100000000;
            end;
            e = X.FindFirstChild(X, "AlignOrientation");
            if e then
                e.Responsiveness = 200;
                e.MaxTorque = 100000000;
            end;
            return; 
        end);
        return; 
    end
});
Gn.AddToggle(Gn, "SpinGrab", {
    ["Text"] = "Spin Grab",
    ["Default"] = false,
    ["Callback"] = function(arg1_21, ...)
        v1 = arg1_21;
        _G.SpinGrab = v1;
        if v1 then
            task.spawn(function(...)
                v1 = "SpinGrab";
                v3 = _G[v1];
                while v3 do
                    v3 = r31;
                    v1 = v3.FindFirstChild(v3, "GrabParts");
                    if v1 then
                        i = v1.FindFirstChild(v1, "GrabPart");
                    end;
                    if v1 then
                        v3 = v3.FindFirstChild(v3, X[e]).GrabPart.WeldConstraint.Part1;
                        if v3 then
                            o = v3.Parent;
                            if o then
                                o = v3.Parent;
                                J = o.FindFirstChildOfClass(o, "Humanoid");
                            end;
                            v3 = v1.GrabPart[r15[r16("\xc6\x17\xd7\x11\x98\x92\xc0\x17\xba\x9a\x18l\xca\x85", v4)]][J[o]];
                            i = o;
                        end;
                        if v3 then
                            v3 = v3.Parent;
                            J = v3.FindFirstChild(v3, "HumanoidRootPart");
                            if J then
                                e = Instance.new("BodyAngularVelocity", J);
                                e.Name = "SpinGrabVelocity";
                                e.MaxTorque = Vector3.new(math.huge, math.huge, math.huge);
                                e.AngularVelocity = Vector3.new(0, 50, 0);
                                e.P = 3000;
                                v3 = r33;
                                v3.AddItem(v3, e, 0.5);
                                task.wait(.1);
                            end;
                        end;
                        task.wait(.1);
                    end; 
                end;
                return; 
            end);
        end;
        return; 
    end
});
Gn.AddToggle(Gn, "RagdollGrab", {
    ["Text"] = "Ragdoll Grab",
    ["Default"] = false,
    ["Callback"] = function(arg1_22, ...)
        v1 = arg1_22;
        _G.RagdollGrab = v1;
        if v1 then
            task.spawn(function(...)
                v1 = "RagdollGrab";
                v3 = _G[v1];
                while v3 do
                    v3 = r31;
                    v1 = v3.FindFirstChild(v3, "GrabParts");
                    if v1 then
                        i = v1.FindFirstChild(v1, "GrabPart");
                    end;
                    if v1 then
                        o = r16("\xd5)l\xae\x04", 253242327157);
                        X = v3.FindFirstChild(v3, X[e]).GrabPart.WeldConstraint[r15[o]];
                        i = "task";
                        if X then
                            o = X.Parent;
                            i = o and o.FindFirstChildOfClass(o, "Humanoid");
                            v3 = v1.GrabPart[r15[r16("\x9d\x8a\xfd9B\"\xce\xbd\x83+\xbe\\\xb0\xd1", v4)]][J[o]];
                        end;
                        if i then
                            J = X.Parent;
                            e = J.FindFirstChildOfClass(J, "Humanoid");
                            o = e.FindFirstChild(e, "Ragdolled");
                            if o then
                                i = not o.Value;
                            end;
                            if o then
                                r72(X);
                                task.wait(.015);
                            end;
                        end;
                        task.wait(.1);
                    end; 
                end;
                return; 
            end);
        end;
        return; 
    end
});
Gn.AddToggle(Gn, "FlingGrab", {
    ["Text"] = "Fling Grab",
    ["Default"] = false,
    ["Callback"] = function(arg1_23, ...)
        v1 = arg1_23;
        _G.FlingGrab = v1;
        if v1 then
            task.spawn(function(...)
                v1 = "FlingGrab";
                v3 = _G[v1];
                while v3 do
                    v3 = r31;
                    v1 = v3.FindFirstChild(v3, "GrabParts");
                    if v1 then
                        i = v1.FindFirstChild(v1, "GrabPart");
                    end;
                    if v1 then
                        o = r16("\xfe0\x07\x90\x89", 13825566595366);
                        v3 = v3.FindFirstChild(v3, X[e]).GrabPart.WeldConstraint[r15[o]];
                        if v3 then
                            o = v3.Parent;
                            i = o and o.FindFirstChildOfClass(o, "Humanoid");
                            v3 = v1.GrabPart[r15[r16("\xf4\x88\xcc\xaeN\x01\x16>5M\xa1\x87\xa5\x13", v4)]][J[o]];
                        end;
                        if v3 then
                            v3 = v3.Parent;
                            J = v3.FindFirstChild(v3, "HumanoidRootPart");
                            if J then
                                e = r70();
                                if e then
                                    o = r71(e.Position, i.Position);
                                    v2 = Instance.new("BodyVelocity", i);
                                    v2.Name = "FlingGrabVelocity";
                                    v2.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
                                    v2.Velocity = Vector3.new(o.lookVector.X, 0.5, o.lookVector.Z) * 300;
                                    v3 = r33;
                                    v3.AddItem(v3, v2, 0.5);
                                    task.wait(.1);
                                end;
                            end;
                        end;
                        task.wait(.1);
                    end; 
                end;
                return; 
            end);
        end;
        return; 
    end
});
Gn.AddLabel(Gn, "Auras");
pcall(function(...)
    r79 = r31.Map.Hole.PoisonBigHole.PoisonHurtPart;
    r80 = r31.Map.Hole.PoisonSmallHole.PoisonHurtPart;
    r81 = r31.Map.FactoryIsland.PoisonContainer.PoisonHurtPart;
    if r81 then
        r81.Size = Vector3.new(2, 2, 2);
    end;
    if r80 then
        r80.Size = Vector3.new(2, 2, 2);
    end;
    if r79 then
        r79.Size = Vector3.new(2, 2, 2);
    end;
    return; 
end);
local function r82(arg1_24, ...)
    v1 = arg1_24;
    if typeof(v1) ~= "Instance" or not v1.Character then
        return false;
    end;
    if v1 == r26 then
        return false;
    end;
    v3 = v1.Character;
    J = v1.Character;
    if J then
        J = v1.Character;
        i = J.FindFirstChildOfClass(J, "Humanoid");
    end;
    if not v3.FindFirstChild(v3, "HumanoidRootPart") or (not J or J.Health <= 0) then
        return false;
    end;
    return true; 
end;
local function r83(arg1_25, ...)
    return r82(arg1_25); 
end;
local function r84(arg1_26, ...)
    v1 = arg1_26;
    J = r26;
    i = J;
    if J then
        o = r26.Character;
        i = o and o.FindFirstChild(o, "HumanoidRootPart");
        v3 = Q[X];
    end;
    v3 = Q[X];
    if not i then
        return false;
    end;
    if typeof(v1) ~= "Instance" or not v1.Character then
        return false;
    end;
    v3 = v1.Character;
    r85 = v3.FindFirstChild(v3, "HumanoidRootPart");
    if not r85 then
        return false;
    end;
    if (r85.Position - r26.Character.HumanoidRootPart.Position).Magnitude <= 30 then
        pcall(function(...)
            v3 = r50;
            v3.FireServer(v3, r85, r71(r26.Character.HumanoidRootPart.Position, r85.Position));
            return; 
        end);
        return true;
    end;
    return false; 
end;
local function r86(arg1_27, ...)
    v1 = arg1_27;
    if not v1 or not v1.Parent then
        return;
    end;
    if not v1.FindFirstChild(v1, "SkyVelocity") then
        X = Instance.new("BodyVelocity", v1);
        X.Name = "SkyVelocity";
        X.Velocity = Vector3.new(0, 1000000000, 0);
        X.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
    end;
    return; 
end;
Gn.AddToggle(Gn, "PoisonAura", {
    ["Text"] = "Poison Aura",
    ["Default"] = false,
    ["Callback"] = function(arg1_28, ...)
        v1 = arg1_28;
        _G.Poison_Aura = v1;
        if v1 then
            task.spawn(function(...)
                while _G.Poison_Aura do
                    J = r25;
                    X = J[3];
                    v1 = J[2];
                    J = "ipairs";
                    for X, o in ipairs(J.GetPlayers(J)) do
                        e = X;
                        v4 = r83(o);
                        if v4 then
                            v2 = o.Character;
                        end;
                        if v4 then
                            v3 = o.Character;
                            v2 = v3.FindFirstChild(v3, "Head");
                            if v2 then
                                r84(o);
                            end;
                            if v2 then
                                if r79 and (r80 and r81) then
                                    r79.CFrame = v2.CFrame;
                                    r80.CFrame = v2.CFrame;
                                    r81.CFrame = v2.CFrame;
                                    task.wait();
                                    r81.Position = Vector3.new(0, -50, 0);
                                    r80.Position = Vector3.new(0, -50, 0);
                                    r79.Position = Vector3.new(0, -50, 0);
                                end;
                            end;
                        end; 
                    end;
                    task.wait(); 
                end;
                return; 
            end);
        end;
        return; 
    end
});
Gn.AddToggle(Gn, "DeathAura", {
    ["Text"] = "Kill Aura",
    ["Default"] = false,
    ["Callback"] = function(arg1_29, ...)
        v1 = arg1_29;
        _G.DeathAura = v1;
        if v1 then
            task.spawn(function(...)
                local Z = {
                    641,
                    643,
                    274,
                    247,
                    248,
                    224,
                    249
                }; 
            end);
        end;
        return; 
    end
});
if r79 then
    Gn.AddToggle(Gn, "RadioactiveAura", {
        ["Text"] = "Radioactive Aura",
        ["Default"] = false,
        ["Callback"] = function(arg1_30, ...)
            v1 = arg1_30;
            _G.RadioactiveAura = v1;
            if v1 then
                task.spawn(function(...)
                    while _G.RadioactiveAura do
                        J = r25;
                        v1 = J[2];
                        J = J[1];
                        for X, o in ipairs(J.GetPlayers(J)) do
                            v4 = r83(o);
                            e = X;
                            if v4 then
                                v2 = o.Character;
                            end;
                            if v4 then
                                v3 = o.Character;
                                v2 = v3.FindFirstChild(v3, "HumanoidRootPart");
                                if v2 then
                                    r84(o);
                                end;
                                if v2 then
                                    r79.Position = v2.Position;
                                    task.wait();
                                    r79.Position = Vector3.new(0, -50, 0);
                                end;
                            end; 
                        end;
                        task.wait(); 
                    end;
                    return; 
                end);
            end;
            return; 
        end
    });
end;
Gn.AddToggle(Gn, "BurnAura", {
    ["Text"] = "Burn Aura",
    ["Default"] = false,
    ["Callback"] = function(arg1_31, ...)
        v1 = arg1_31;
        _G.BurnAura = v1;
        if v1 then
            task.spawn(function(...)
                while _G.BurnAura do
                    J = r25;
                    v1 = J[2];
                    J = J[1];
                    for X, o in ipairs(J.GetPlayers(J)) do
                        e = X;
                        v3 = 470;
                        Q[v3] = o;
                        v2 = Q[v3] ~= r26 and Q[v3].Character;
                        if v2 then
                            v3 = Q[v3].Character;
                            v2 = v3.FindFirstChild(v3, "HumanoidRootPart");
                            v3 = Q[v3].Character;
                            a = r16("o\xd6\xb3\xf9\xedP/\xd9", 7349593247070);
                            r87 = v3.FindFirstChildOfClass(v3, r15[a]);
                            if v2 then
                                v3 = Q[o].Character;
                                n = r87 and r87.Health > 0;
                            end;
                            if v2 then
                                n = v2.Position;
                                F = "Character";
                                a = r26[F] and F.FindFirstChild(F, "HumanoidRootPart");
                                K = a;
                                v3 = v3;
                                if a then
                                    v3 = v3;
                                    v3 = v2.Position - a;
                                    if v3.Magnitude(v3) < 30 then
                                        pcall(function(...)
                                            r87.Health = 0;
                                            v3 = Q[v3].Character;
                                            v3.BreakJoints(v3);
                                            return; 
                                        end);
                                    end;
                                else
                                    K = Vector3.new();
                                end;
                            end;
                        end; 
                    end;
                    task.wait(); 
                end;
                return; 
            end);
        end;
        return; 
    end
});
Gn.AddToggle(Gn, "FlingAura2", {
    ["Text"] = "Fling Aura",
    ["Default"] = false,
    ["Callback"] = function(arg1_32, ...)
        v1 = arg1_32;
        _G.FlingAura = v1;
        if v1 then
            task.spawn(function(...)
                while _G.FlingAura do
                    if _G.FlingTarget == 2 or _G.FlingTarget == 3 then
                        e = r15;
                        v1 = r26.Character;
                        if v1 and v1.FindFirstChild(v1, "HumanoidRootPart") then
                            e = r25;
                            J = e[3];
                            e = e[1];
                            for J, v2 in e, ipairs(e.GetPlayers(e)) do
                                o = J;
                                if v2 ~= r26 and v2.Character then
                                    v3 = v2.Character;
                                    n = v3.FindFirstChild(v3, "HumanoidRootPart");
                                    if n then
                                        v4 = (n.Position - (i and v1.FindFirstChild(v1, "HumanoidRootPart")).Position).Magnitude <= 20;
                                    end;
                                    if n then
                                        v4 = Instance.new("BodyVelocity");
                                        v4.MaxForce = Vector3.new(100000000, 100000000, 100000000);
                                        v4.Velocity = (n.Position - (i and v1.FindFirstChild(v1, "HumanoidRootPart")).Position).Unit * 300;
                                        v4.Parent = n;
                                        v3 = r33;
                                        v3.AddItem(v3, v4, 0.5);
                                    end;
                                end; 
                            end;
                        end;
                    end;
                    task.wait(0.5); 
                end;
                return; 
            end);
        end;
        return; 
    end
});
r88 = false;
r90 = 25;
r91 = .05;
r92 = .05;
r93 = 1;
local function r94(arg1_33, arg2_33, ...)
    v1 = arg1_33;
    X = arg2_33;
    if not v1 or (not v1.Character or not X) then
        return;
    end;
    v3 = v1.Character;
    r95 = v3.FindFirstChild(v3, "HumanoidRootPart");
    if not r95 then
        return;
    end;
    e = X.BlobmanSeatAndOwnerScript;
    if e then
        e = X.BlobmanSeatAndOwnerScript;
        i = e.FindFirstChild(e, "CreatureGrab");
    end;
    r96 = e;
    if not r96 then
        return;
    end;
    o = r29.CharacterEvents;
    i = o;
    if o then
        o = r29.CharacterEvents;
        i = o.FindFirstChild(o, "CreatureToss");
    end;
    r97 = i;
    v2 = r29.GrabEvents;
    i = v2;
    if v2 then
        v2 = r29.GrabEvents;
        i = v2.FindFirstChild(v2, "EndGrabEarly");
    end;
    r98 = i;
    for n = 1, 2 do
        v3 = r93;
        a = n;
        r93 = r93 == 1 and 2 or 1;
        u = v3 == 1;
        Y = v3;
        if u then
            F = "LeftDetector";
        end;
        v3 = Y;
        v3 = v3;
        W = v3 == 1;
        u = v3;
        if W then
            Y = "LeftWeld";
        end;
        v3 = u;
        v3 = v3;
        r99 = X.FindFirstChild(X, u or "RightDetector");
        W = r99;
        if W then
            W = r99;
            F = W.FindFirstChild(W, W or "RightWeld");
        end;
        v3 = v3;
        r100 = W;
        v3 = v3;
        if r99 and r100 then
            pcall(function(...)
                v3 = r96;
                v3.FireServer(v3, r99, r95, r100);
                return; 
            end);
            task.wait(r92);
            if r97 then
                pcall(function(...)
                    v3 = r97;
                    v3.FireServer(v3);
                    return; 
                end);
            end;
            if r98 then
                pcall(function(...)
                    v3 = r98;
                    v3.FireServer(v3);
                    return; 
                end);
            end;
            task.wait(r92);
        end; 
    end;
    return; 
end;
local function r101(...)
    J = r31;
    v1 = J[2];
    J = J[1];
    for X, o in pairs(J.GetDescendants(J)) do
        e = X;
        v2 = o.Name == "CreatureBlobman" and o.FindFirstChild(o, "VehicleSeat");
        if v2 then
            v2 = r26.Character;
            if v2 then
                v3 = o.VehicleSeat.SeatWeld.Part1;
                w = v3;
                while not v3 do
                    if w then
                        K = v4.Parent;
                    end;
                    if v3 == v3 then
                        return o;
                    else
                        
                    end; 
                end;
                w = v3 ~= v2 and v3.Parent;
                v3 = v3;
            end;
        end; 
    end;
    return nil; 
end;
Gn.AddToggle(Gn, "KickAuraBlobman", {
    ["Text"] = "Kick Aura(Blobman) [Alpha]",
    ["Default"] = false,
    ["Callback"] = function(arg1_34, ...)
        v1 = arg1_34;
        r88 = v1;
        if v1 then
            i = not r60();
            if i then
                r37("Kick Aura", "Cant sit on Blobman!", 3);
                i = r36.KickAuraBlobman;
                i.SetValue(i, false);
                return;
            end;
            r62(function(...)
                return r88; 
            end);
            r37("Kick Aura(Blobman)", "Started! Range: " .. r90, 3);
            r89 = task.spawn(function(...)
                while r88 do
                    if not r101() then
                        task.wait(0.5);
                    end;
                    J = r26.Character;
                    if J and J.FindFirstChild(J, "HumanoidRootPart") then
                        v2 = r25;
                        n = {
                            v2.GetPlayers(v2)
                        };
                        e = v2[2];
                        o = v2[3];
                        v2 = "ipairs";
                        for o, v4 in ipairs(T(n)) do
                            n = o;
                            if v4 ~= r26 and v4.Character then
                                v3 = v4.Character;
                                K = v3.FindFirstChild(v3, "HumanoidRootPart");
                                if K then
                                    w = (K.Position - (i and J.FindFirstChild(J, "HumanoidRootPart")).Position).Magnitude < r90;
                                end;
                                if K then
                                    table.insert({}, v4);
                                end;
                            end; 
                        end;
                        v2 = n[3];
                        for v2, v4 in n[1], ipairs({}) do
                            n = v2;
                            if not r88 then
                                
                            else
                                v3 = v4.Character;
                                if v3 then
                                    v3 = v4.Character;
                                    K = v3.FindFirstChild(v3, "HumanoidRootPart");
                                    if K then
                                        w = (K.Position - (i and J.FindFirstChild(J, "HumanoidRootPart")).Position).Magnitude < r90;
                                    end;
                                    if K then
                                        Q[Z[12]](v4, r101());
                                    end;
                                end;
                            end; 
                        end;
                        task.wait(r91);
                    end; 
                end;
                return; 
            end);
        else
            if r89 then
                task.cancel(r89);
            end;
            r37("Kick Aura(Blobman)", "Stopped!", 2);
            return;
        end; 
    end
});
Gn.AddLabel(Gn, "aeae");
Gn.AddToggle(Gn, "SilentAimToggle", {
    ["Text"] = "Enable Silent Aim",
    ["Default"] = false,
    ["Callback"] = function(arg1_35, ...)
        v1 = arg1_35;
        v3 = not _G.SAConfig;
        if v3 then
            _G.SAConfig = {
                ["Enabled"] = false,
                ["Distance"] = 28,
                ["TargetMode"] = "cursor"
            };
            if not _G.SAHooked then
                r103 = hookmetamethod(game, "__namecall", newcclosure(function(arg1_36, ...)
                    X = {
                        v(2, T(I))
                    };
                    getnamecallmethod();
                    if _G.SAConfig.Enabled and r102 then
                        if typeof(T(X)) == "Vector3" then
                            i = (r102 - T(X)).Unit * _G.SAConfig.Distance;
                            e[2] = i;
                            return r103(arg1_36, unpack(e));
                        end;
                    end;
                    return r103(arg1_36, T(X)); 
                end));
                _G.SAHooked = true;
            end;
            v3 = r30.RenderStepped;
            v3.Connect(v3, function(...)
                if not _G.SAConfig.Enabled then
                    return;
                end;
                i = _G.SAConfig.TargetMode == "cursor";
                if i then
                    i = r28;
                    v1 = i.GetMouseLocation(i);
                else
                    v1 = Vector2.new(r32.ViewportSize.X / 2, r32.ViewportSize.Y / 2);
                end;
                if not nil then
                    return;
                end;
                o = math.huge;
                K = r25;
                w = {
                    K.GetPlayers(K)
                };
                n = K[2];
                v2 = K[1];
                for v4, w in ipairs(T(w)) do
                    K = v4;
                    if w ~= r26 then
                        a = w.Character;
                        if a then
                            t = a.FindFirstChildOfClass(a, "Humanoid");
                            if t then
                                i = t.Health > 0;
                            end;
                            v3 = not _G.SAConfig.Enabled;
                            if t then
                                v3 = v3;
                                v5 = a.FindFirstChild(a, "HumanoidRootPart") or a.FindFirstChild(a, "Torso");
                                if v5 then
                                    W = r15;
                                    i = (v5.Position - r32.CFrame.Position).Magnitude <= _G.SAConfig.Distance;
                                    if i then
                                        i = r32;
                                        W = {
                                            i.WorldToViewportPoint(i, i.Position)
                                        };
                                        F = i.WorldToViewportPoint(i, i.Position);
                                        if W[2] then
                                            s = "Magnitude";
                                            W = (Vector2.new(F.X, F.Y) - nil)[s];
                                            i = W < math.huge;
                                            if i then
                                                s = W;
                                                e = i;
                                                i = (u - v1)[s];
                                                o = W;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end; 
                end;
                if nil then
                    r102 = nil.Position;
                else
                    
                end;
                return; 
            end);
        end;
        J = arg1_35;
        _G.SAConfig.Enabled = J;
        v3 = r37;
        o = v3;
        v3 = v3;
        if v1 then
            v3 = v3;
            v3("Silent Aim", v1 and "ON", 2);
            return;
        else
            e = "OFF";
        end; 
    end
});
wn.AddSlider(wn, "SADistance", {
    ["Text"] = "Silent Aim Distance",
    ["Min"] = 5,
    ["Max"] = 100,
    ["Default"] = 28,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_37, ...)
        X = "SAConfig";
        if _G[X] then
            X = arg1_37;
            _G.SAConfig.Distance = X;
        end;
        return; 
    end
});
wn.AddDropdown(wn, "SAMode", {
    ["Text"] = "SA Target Mode",
    ["Values"] = {
        "cursor",
        "center"
    },
    ["Default"] = 1,
    ["Callback"] = function(arg1_38, ...)
        X = "SAConfig";
        if _G[X] then
            X = arg1_38;
            _G.SAConfig.TargetMode = X;
        end;
        return; 
    end
});
wn.AddSlider(wn, "SpinSpeed", {
    ["Text"] = "Spin Speed",
    ["Min"] = 0,
    ["Max"] = 1000,
    ["Default"] = 500,
    ["Rounding"] = 0
});
_G.JerkAnimSpeed = 1;
_G.JerkAnimId = "rbxassetid://507770677";
wn.AddSlider(wn, "JerkAnimSpeed", {
    ["Text"] = "Jerk Speed",
    ["Min"] = .1,
    ["Max"] = 5,
    ["Default"] = 1,
    ["Rounding"] = 1,
    ["Callback"] = function(arg1_39, ...)
        _G.JerkAnimSpeed = arg1_39;
        return; 
    end
});
local function r105(...)
    v1 = r26.Character;
    if not v1 then
        return;
    end;
    X = v1.FindFirstChildOfClass(v1, "Humanoid");
    if not X then
        return;
    end;
    J = X.FindFirstChildOfClass(X, "Animator");
    i = J;
    if J then
        v3 = r104;
        if v3 then
            v3 = r104;
            v3.Stop(v3);
        end;
        e = Instance.new("Animation");
        e.AnimationId = _G.JerkAnimId;
        r104 = J.LoadAnimation(J, e);
        r104.Priority = Enum.AnimationPriority.Action;
        i = r104;
        i.Play(i);
        i = r104;
        i.AdjustSpeed(i, _G.JerkAnimSpeed);
        return;
    else
        Instance.new("Animator", X);
    end; 
end;
gn = wn.AddLabel(wn, "Jerk Bind");
gn.AddKeyPicker(gn, "JerkBind", {
    ["Default"] = "Q",
    ["NoUI"] = true,
    ["Text"] = "Jerk Bind",
    ["Callback"] = function(...)
        r105();
        return; 
    end
});
wn.AddSlider(wn, "FlingAuraStrength", {
    ["Text"] = "Fling Aura Strength",
    ["Min"] = 0,
    ["Max"] = 40000,
    ["Default"] = 300,
    ["Rounding"] = 0
});
wn.AddSlider(wn, "ToysAuraRadius", {
    ["Text"] = "Toys Aura Radius",
    ["Min"] = 0,
    ["Max"] = 1000,
    ["Default"] = 10,
    ["Rounding"] = 0
});
wn.AddSlider(wn, "ToysAuraHeight", {
    ["Text"] = "Toys Aura Height",
    ["Min"] = 0,
    ["Max"] = 100,
    ["Default"] = 0,
    ["Rounding"] = 0
});
wn.AddSlider(wn, "ToysAuraSpeed", {
    ["Text"] = "Toys Aura Speed",
    ["Min"] = 0,
    ["Max"] = 1000,
    ["Default"] = 10,
    ["Rounding"] = 0
});
wn.AddDropdown(wn, "FlingAuraMode", {
    ["Text"] = "Fling Aura Mode",
    ["Values"] = {
        "All"
    },
    ["Default"] = 1
});
wn.AddDropdown(wn, "ToysAuraMode", {
    ["Text"] = "Toys Aura Mode",
    ["Values"] = {
        "All"
    },
    ["Default"] = 1
});
gn = l.Target;
rn = gn.AddLeftGroupbox(gn, "Target", "crosshair");
gn = l.Target;
ln = gn.AddRightGroupbox(gn, "Blobman Methods", "layers");
gn = l.Target;
q5 = gn.AddRightGroupbox(gn, "Settings", "settings");
r106 = false;
r109 = Color3.fromRGB(255, 0, 0);
local function r110(arg1_40, ...)
    if r108 then
        v3 = r108;
        v3.Disconnect(v3);
    end;
    if r107 then
        i = r107;
        i.Destroy(i);
    end;
    X = r25;
    r111 = X.FindFirstChild(X, arg1_40);
    if not r111 then
        r106 = false;
        return;
    end;
    r112 = Instance.new("Attachment");
    r113 = Instance.new("Attachment");
    r107 = Instance.new("Beam");
    r107.Color = ColorSequence.new(r109);
    r107.Width0 = 0.5;
    r107.Width1 = 0.5;
    r107.FaceCamera = true;
    r107.Attachment0 = r112;
    r107.Attachment1 = r113;
    r107.Parent = r31.Terrain;
    v2 = r30.Heartbeat;
    r108 = v2.Connect(v2, function(...)
        if not r106 then
            return;
        end;
        v1 = r26.Character;
        X = r111 and r111.Character;
        if v1 then
            i = r111 and r111.Character;
        end;
        if v1 then
            o = r16;
            J = v1.FindFirstChild(v1, "HumanoidRootPart");
            e = X.FindFirstChild(X, "HumanoidRootPart");
            if J then
                i = v3;
            end;
            if J then
                o = v1.FindFirstChild(v1, "HumanoidRootPart");
                r112.Parent = o;
                o = r113;
                r113.Parent = o;
            end;
        end;
        return; 
    end);
    return; 
end;
q5.AddToggle(q5, "TraceToggle", {
    ["Text"] = "Trace to Target",
    ["Default"] = false,
    ["Callback"] = function(arg1_41, ...)
        v1 = arg1_41;
        r106 = v1;
        if v1 then
            v3 = v1;
            X = r56 and r56.Name;
            if X then
                r110(X);
            else
                r106 = false;
            end;
        else
            if r108 then
                X = r108;
                X.Disconnect(X);
            end;
            if r107 then
                J = r107;
                J.Destroy(J);
            end;
            return;
        end; 
    end
});
Z5 = q5.AddLabel(q5, "Trace Color");
Z5.AddColorPicker(Z5, "TraceColorPicker", {
    ["Default"] = Color3.fromRGB(255, 0, 0),
    ["Title"] = "Trace Color",
    ["Callback"] = function(arg1_42, ...)
        r109 = arg1_42;
        if r107 then
            r107.Color = ColorSequence.new(r109);
        end;
        return; 
    end
});
r114 = false;
local function r116(...)
    while r114 do
        if not (r56 and r56.Name) then
            task.wait(1);
        else
            v3 = r31;
            v2 = r16;
            X = v3.FindFirstChild(v3, v1 .. "SpawnedInToys");
            if X then
                v2 = X.GetChildren;
                o = {
                    v2(X)
                };
                e = v2[3];
                J = v2[2];
                for e, n in pairs(T(i)) do
                    r117 = n;
                    v2 = e;
                    if r117.Name == "InstrumentGuitarGucci" then
                        pcall(function(...)
                            v3 = r29.MenuToys.DestroyToy;
                            v3.FireServer(v3, r117);
                            return; 
                        end);
                    end; 
                end;
            end;
            task.wait(0.5);
        end; 
    end;
    return; 
end;
q5.AddToggle(q5, "DestroyGucciToggle", {
    ["Text"] = "Destroy Gucci",
    ["Default"] = false,
    ["Callback"] = function(arg1_43, ...)
        v1 = arg1_43;
        r114 = v1;
        if v1 then
            r115 = task.spawn(r116);
        else
            if r115 then
                task.cancel(r115);
            end;
            return;
        end; 
    end
});
r118 = false;
local function r120(...)
    while r118 do
        J = r25;
        v1 = J[2];
        J = J[1];
        for X, o in ipairs(J.GetPlayers(J)) do
            e = X;
            v3 = o ~= r26;
            if v3 then
                v3 = r31;
                v2 = v3.FindFirstChild(v3, o.Name .. "SpawnedInToys");
                if v2 then
                    v3 = pairs;
                    a = v2.GetChildren;
                    n = a[1];
                    v4 = a[2];
                    for K, a in v3(a(v2)) do
                        w = K;
                        r121 = a;
                        v3 = r121;
                        if v3.IsA(v3, "Model") then
                            pcall(function(...)
                                v3 = r29.MenuToys.DestroyToy;
                                v3.FireServer(v3, r121);
                                return; 
                            end);
                        end; 
                    end;
                end;
            end; 
        end;
        task.wait(0.5); 
    end;
    return; 
end;
q5.AddToggle(q5, "RemoveAllAntiInputToggle", {
    ["Text"] = "Remove All Anti Input",
    ["Default"] = false,
    ["Callback"] = function(arg1_44, ...)
        v1 = arg1_44;
        r118 = v1;
        if v1 then
            r119 = task.spawn(r120);
        else
            if r119 then
                task.cancel(r119);
            end;
            return;
        end; 
    end
});
r122 = {};
q5.AddToggle(q5, "TargetNotifyToggle", {
    ["Text"] = "Leave/Join Target Notify",
    ["Default"] = false,
    ["Callback"] = function(arg1_45, ...)
        if arg1_45 then
            X = r56 and r56.Name;
            if not X then
                return;
            end;
            v3 = r25;
            J = v3.FindFirstChild(v3, X);
            if J then
                r37("Target Notify", J.DisplayName .. " (" .. J.Name .. ") is in game", 3);
            end;
            e = r25.PlayerAdded;
            r122.Added = e.Connect(e, function(arg1_46, ...)
                v1 = arg1_46;
                if r56 and v1.Name == r56.Name then
                    r37("Target Notify", v1.DisplayName .. " (" .. v1.Name .. ") Joined", 3);
                end;
                return; 
            end);
            e = r25.PlayerRemoving;
            r122.Removing = e.Connect(e, function(arg1_47, ...)
                X = r56;
                v1 = arg1_47;
                if X then
                    i = v1.Name == r56.Name;
                end;
                if X then
                    r37("Target Notify", v1.DisplayName .. " (" .. v1.Name .. ") Left", 3);
                end;
                return; 
            end);
        else
            e = r122;
            J = 276[3];
            e = 276[1];
            for J, v2 in e, pairs(e) do
                if v2 then
                    v2.Disconnect(v2);
                end; 
            end;
            r122 = {};
            return;
        end; 
    end
});
q5.AddToggle(q5, "LoopKick", {
    ["Text"] = "Kick Ownership",
    ["Default"] = false,
    ["Callback"] = function(arg1_48, ...)
        v1 = arg1_48;
        r64 = v1;
        if not v1 then
            r68();
            return;
        end;
        r67();
        task.spawn(function(...)
            J = "Character";
            v1 = r26[J];
            if v1 then
                v1 = r26.Character;
                i = v1.FindFirstChild(v1, "HumanoidRootPart");
            end;
            r123 = v1;
            if not r123 then
                v3 = r36.LoopKick;
                v3.SetValue(v3, false);
                r68();
                return;
            end;
            X = getKickTargetPos();
            if X then
                J = "CFrame";
                r123.CFrame = J;
            end;
            v2 = r16("\xbdp=\xd9\xad\xc2", 20420545242405);
            J = r123[r15[v2]];
            o = 0;
            e = false;
            while r64 do
                v2 = r56;
                if not v2 or not v2.Parent then
                    break;
                else
                    n = v2.Character;
                    if n then
                        i = n.FindFirstChild(n, "HumanoidRootPart");
                    end;
                    r124 = n;
                    if n then
                        i = n.FindFirstChild(n, "Humanoid");
                    end;
                    r125 = n;
                    if not r124 or (not r125 or r125.Health <= 0) then
                        o = 0;
                        e = false;
                        F = {
                            r69(v3, 10, function(...)
                                return Q[275]; 
                            end)
                        };
                        r124 = r69(v3, 10, function(...)
                            return Q[275]; 
                        end);
                        r125 = F[2];
                        w = not r124;
                        if w then
                            w = r30.Heartbeat;
                            w.Wait(w);
                        else
                        end;
                    end;
                    if not false then
                        r123.CFrame = r124.CFrame;
                        pcall(function(...)
                            r125.PlatformStand = true;
                            r125.Sit = true;
                            v3 = r50;
                            v3.FireServer(v3, r124, r123.CFrame);
                            v3 = r51;
                            v3.FireServer(v3, r124, Vector3.zero, r124.Position, false);
                            return; 
                        end);
                        if i == 0 then
                            o = tick();
                        end;
                        if tick() - i > .35 then
                            e = true;
                            o = 0;
                        end;
                    else
                        u = J;
                        r123.CFrame = u;
                        r126 = J * CFrame.new(0, 17, 0);
                        r124.CFrame = r126;
                        r124.Velocity = Vector3.zero;
                        pcall(function(...)
                            r125.PlatformStand = true;
                            r125.Sit = false;
                            v3 = r50;
                            v3.FireServer(v3, r124, r126);
                            v3 = r52;
                            v3.FireServer(v3, r124);
                            v3 = r51;
                            v3.FireServer(v3, r124, Vector3.zero, r124.Position, false);
                            return; 
                        end);
                    end;
                    F = r30.Heartbeat;
                    F.Wait(F);
                end; 
            end;
            r123.CFrame = J;
            r64 = false;
            n = r36.LoopKick;
            n.SetValue(n, false);
            r68();
            return; 
        end);
        return; 
    end
});
r127 = false;
local function r129(arg1_49, ...)
    while r127 do
        v3 = r25;
        X = v3.FindFirstChild(v3, arg1_49);
        if not X or not X.Character then
            task.wait(0.5);
        end;
        e = X.Character;
        r130 = e.FindFirstChild(e, "UpperTorso") or e.FindFirstChild(e, "Torso");
        if r130 then
            pcall(function(...)
                v3 = r29.MenuToys.SpawnToyRemoteFunction;
                v3.InvokeServer(v3, "BallSnowball", r130.CFrame * CFrame.new(Vector3.new(math.random(-30, 30) / 100, math.random(-30, 30) / 100, math.random(-30, 30) / 100)), Vector3.zero);
                return; 
            end);
        end;
        task.wait(.1); 
    end;
    return; 
end;
q5.AddToggle(q5, "SnowballRagdollToggle", {
    ["Text"] = "Snowball Ragdoll",
    ["Default"] = false,
    ["Callback"] = function(arg1_50, ...)
        v1 = arg1_50;
        v3 = v1;
        r127 = v3;
        J = r56;
        if J then
            i = r56.Name;
        end;
        v3 = v3;
        r131 = J;
        if v1 then
            if r131 then
                r128 = task.spawn(function(...)
                    r129(r131);
                    return; 
                end);
            else
                Q[J5] = false;
            end;
        else
            if r128 then
                task.cancel(r128);
            end;
            return;
        end; 
    end
});
m5 = l.Target;
L5 = m5.AddLeftGroupbox(m5, "Advanced Kick", "zap");
rn.AddDropdown(rn, "TargetPlayer", {
    ["Values"] = r57(),
    ["Default"] = 1,
    ["Multi"] = false,
    ["Text"] = "Target",
    ["Callback"] = function(arg1_51, ...)
        r56 = r58(arg1_51);
        return; 
    end
});
rn.AddButton(rn, {
    ["Text"] = "Refresh",
    ["Func"] = function(...)
        v3 = r35.TargetPlayer;
        v3.SetValues(v3, r57());
        v3 = r35.TargetPlayer;
        v3.SetValue(v3, nil);
        return; 
    end
});
m5 = r25.PlayerAdded;
m5.Connect(m5, function(...)
    task.wait(1);
    pcall(function(...)
        v3 = r35.TargetPlayer;
        v3.SetValues(v3, r57());
        return; 
    end);
    return; 
end);
m5 = r25.PlayerRemoving;
m5.Connect(m5, function(...)
    task.wait(0.5);
    pcall(function(...)
        v3 = r35.TargetPlayer;
        v3.SetValues(v3, r57());
        return; 
    end);
    return; 
end);
r132 = false;
rn.AddToggle(rn, "KickSpamGrab", {
    ["Text"] = "Kick (spam grab)",
    ["Default"] = false,
    ["Callback"] = function(arg1_52, ...)
        v1 = arg1_52;
        r132 = v1;
        if not v1 then
            return;
        end;
        task.spawn(function(...)
            v2 = 10453253182211;
            v3 = r29;
            J = r16;
            e = J("\n\xa8\x92\r\x02\xbe3\xf1*B", v2);
            r133 = v3.WaitForChild(v3, r15[e]);
            v3 = r132;
            while v3 do
                J = r56;
                e = not J;
                if e or not J.Parent then
                    
                else
                    e = r26.Character;
                    if e then
                        i = e.FindFirstChild(e, "HumanoidRootPart");
                    end;
                    r134 = e;
                    i = r134;
                    if not i then
                        
                    else
                        v3 = not nil;
                        if v3 then
                            X = r134.CFrame;
                        end;
                        v2 = v3.Character;
                        K = v3;
                        if v2 then
                            i = v2.FindFirstChild(v2, "HumanoidRootPart");
                        end;
                        r135 = v2;
                        v3 = K;
                        K = v3;
                        if v2 then
                            i = v2.FindFirstChild(v2, "Humanoid");
                        end;
                        r136 = v2;
                        v3 = K;
                        w = r135;
                        i = "Heartbeat";
                        if w then
                            v3 = K;
                            i = r136 and r136.Health > 0;
                        end;
                        v3 = v3;
                        if i then
                            r135.AssemblyLinearVelocity = Vector3.zero;
                            r135.AssemblyAngularVelocity = Vector3.zero;
                            r135.Velocity = Vector3.zero;
                            pcall(function(...)
                                r136.PlatformStand = true;
                                r136.Sit = true;
                                v3 = r133.SetNetworkOwner;
                                v3.FireServer(v3, r135, r134.CFrame);
                                v3 = r133.CreateGrabLine;
                                v3.FireServer(v3, r135, Vector3.zero, r135.Position, false);
                                return; 
                            end);
                        end;
                        i = r30.Heartbeat;
                        i.Wait(i);
                    end;
                end; 
            end;
            J = v3;
            if nil then
                v2 = r26.Character;
                i = v2 and v2.FindFirstChild(v2, "HumanoidRootPart");
                v3 = r132;
            end;
            v3 = J;
            if X then
                r26.Character.HumanoidRootPart.CFrame = e;
            end;
            e = r36;
            i = e;
            if e then
                i = r36.KickSpamGrab;
            end;
            v3 = v3;
            if i then
                i = r36.KickSpamGrab;
                i.SetValue(i, false);
            end;
            return; 
        end);
        return; 
    end
});
rn.AddToggle(rn, "RagalicRagdollSnowball", {
    ["Text"] = "Ragdoll Snowball",
    ["Default"] = false,
    ["Callback"] = function(arg1_53, ...)
        _G.RagalicRagdollSnowball = arg1_53;
        task.spawn(function(...)
            X = r15;
            while _G.RagalicRagdollSnowball do
                v3 = r56;
                if not v3 or not v3.Parent then
                    v3 = r30.Heartbeat;
                    v3.Wait(v3);
                end;
                X = v3.Character;
                if X then
                    v3 = v1[o[n]];
                    i = X.FindFirstChild(X, "UpperTorso") or X.FindFirstChild(X, "Torso");
                end;
                r137 = X;
                v3 = not r137;
                if v3 then
                    v3 = r30.Heartbeat;
                    v3.Wait(v3);
                else
                    pcall(function(...)
                        v3 = r29.MenuToys.SpawnToyRemoteFunction;
                        v3.InvokeServer(v3, "BallSnowball", r137.CFrame * CFrame.new(Vector3.new(math.random(-30, 30) / 100, math.random(-30, 30) / 100, math.random(-30, 30) / 100)), Vector3.zero);
                        return; 
                    end);
                    v3 = r31;
                    v4 = r15;
                    n = "SpawnedInToys";
                    e = v3.FindFirstChild(v3, r26.Name .. n);
                    if e then
                        v4 = e.GetChildren;
                        n = {
                            v4(e)
                        };
                        o = v4[2];
                        n = v4[1];
                        for v2, K in pairs(T(n)) do
                            v4 = v2;
                            if K.Name == "BallSnowball" and K.Parent then
                                w = K.PrimaryPart or K.FindFirstChildWhichIsA(K, "BasePart");
                                if w then
                                    w.CFrame = r137.CFrame * CFrame.new(Vector3.new(math.random(-30, 30) / 100, math.random(-30, 30) / 100, math.random(-30, 30) / 100));
                                    w.AssemblyLinearVelocity = Vector3.zero;
                                    w.AssemblyAngularVelocity = Vector3.zero;
                                end;
                            end; 
                        end;
                    end;
                    v3 = r30.Heartbeat;
                    v3.Wait(v3);
                end; 
            end;
            return; 
        end);
        return; 
    end
});
r138 = false;
rn.AddToggle(rn, "GrabTrollSpam", {
    ["Text"] = "Grab Troll (spam grab)",
    ["Default"] = false,
    ["Callback"] = function(arg1_54, ...)
        v1 = arg1_54;
        r138 = v1;
        if not v1 then
            return;
        end;
        task.spawn(function(...)
            v2 = 28682562810924;
            v3 = r29;
            J = r16;
            e = J("L\xb24x\xe1|\xfb\xd9\xebS", v2);
            r139 = v3.WaitForChild(v3, r15[e]);
            v3 = r138;
            while v3 do
                J = r56;
                e = not J;
                if e or not J.Parent then
                    
                else
                    e = r26.Character;
                    if e then
                        i = e.FindFirstChild(e, "HumanoidRootPart");
                    end;
                    r140 = e;
                    i = r140;
                    if not i then
                        
                    else
                        v3 = not nil;
                        if v3 then
                            X = r140.CFrame;
                        end;
                        v2 = v3.Character;
                        K = v3;
                        if v2 then
                            i = v2.FindFirstChild(v2, "HumanoidRootPart");
                        end;
                        v3 = K;
                        r141 = v2;
                        K = v3;
                        if v2 then
                            i = v2.FindFirstChild(v2, "Humanoid");
                        end;
                        v3 = K;
                        r142 = v2;
                        v3 = v3;
                        if r141 and (r142 and r142.Health > 0) then
                            r141.AssemblyLinearVelocity = Vector3.zero;
                            r141.AssemblyAngularVelocity = Vector3.zero;
                            r141.Velocity = Vector3.zero;
                            pcall(function(...)
                                r142.PlatformStand = true;
                                r142.Sit = true;
                                v3 = r139.SetNetworkOwner;
                                v3.FireServer(v3, r141, r140.CFrame);
                                v3 = r139.CreateGrabLine;
                                v3.FireServer(v3, r141, Vector3.zero, r141.Position, false);
                                return; 
                            end);
                        end;
                        i = r30.Heartbeat;
                        i.Wait(i);
                    end;
                end; 
            end;
            J = v3;
            if nil then
                v2 = r26.Character;
                i = v2 and v2.FindFirstChild(v2, "HumanoidRootPart");
                v3 = r138;
            end;
            v3 = J;
            if X then
                r26.Character.HumanoidRootPart.CFrame = e;
            end;
            i = r36 and r36.GrabTrollSpam;
            v3 = v3;
            if i then
                i = r36.GrabTrollSpam;
                i.SetValue(i, false);
            end;
            return; 
        end);
        return; 
    end
});
r143 = false;
rn.AddToggle(rn, "LoopKickBlob", {
    ["Text"] = "Loop Kick (grab + blob)",
    ["Default"] = false,
    ["Callback"] = function(arg1_55, ...)
        v1 = arg1_55;
        r143 = v1;
        if not v1 then
            r143 = false;
            return;
        end;
        task.spawn(function(...)
            local Z = {
                112,
                225,
                641,
                643,
                275,
                279,
                285
            }; 
        end);
        return; 
    end
});
r144 = false;
rn.AddToggle(rn, "LoopKickDual", {
    ["Text"] = "Loop Kick",
    ["Default"] = false,
    ["Callback"] = function(arg1_56, ...)
        v1 = arg1_56;
        r144 = v1;
        if not v1 then
            r144 = false;
            return;
        end;
        task.spawn(function(...)
            while r144 do
                v3 = r56;
                if not v3 or not v3.Parent then
                    v3 = r30.Heartbeat;
                    v3.Wait(v3);
                end;
                X = r26.Character;
                J = X and X.FindFirstChild(X, "Humanoid");
                e = J and J.SeatPart;
                v3 = not e;
                if v3 then
                    v3 = r30.Heartbeat;
                    v3.Wait(v3);
                else
                    v3 = e.Parent;
                    Y = v3.FindFirstChild(v3, "BlobmanSeatAndOwnerScript");
                    i = v3.FindFirstChild(v3, "BlobmanSeatAndOwnerScript");
                    if Y then
                        Y = v3.BlobmanSeatAndOwnerScript;
                        i = Y.FindFirstChild(Y, "CreatureGrab");
                    end;
                    v2 = not v2 or not (i and Y.FindFirstChild(Y, "CreatureDrop"));
                    Y = v3.FindFirstChild(v3, "BlobmanSeatAndOwnerScript");
                    i = not v2;
                    if not v2 or not (i and Y.FindFirstChild(Y, "CreatureDrop")) then
                        v3 = r30.Heartbeat;
                        v3.Wait(v3);
                    else
                        v4 = o.FindFirstChild(o, "LeftDetector");
                        K = o.FindFirstChild(o, "RightDetector");
                        w = v4 and v4.FindFirstChild(v4, "LeftWeld");
                        if K then
                            i = K.FindFirstChild(K, "RightWeld");
                        end;
                        X.FindFirstChild(X, "HumanoidRootPart");
                        v5 = v1.Character;
                        v6 = v5 and v5.FindFirstChild(v5, "HumanoidRootPart");
                        F = v5 and v5.FindFirstChild(v5, "Humanoid");
                        if v6 then
                            if F then
                                Y = (v5 and v5.FindFirstChild(v5, "Humanoid")).Health > 0;
                            end;
                            i = F;
                            v3 = v1[Y[W]];
                        end;
                        if v6 then
                            i.FireServer(i, v4, v6, w);
                            task.wait(.1);
                            n.FireServer(n, w, v6);
                            task.wait(.1);
                            i.FireServer(i, K, v6, K);
                            task.wait(.1);
                            n.FireServer(n, K, v6);
                            task.wait(.1);
                        else
                            task.wait(.1);
                        end;
                    end;
                end; 
            end;
            r144 = false;
            i = r36 and r36.LoopKickDual;
            v3 = false;
            if i then
                i = r36.LoopKickDual;
                i.SetValue(i, false);
            end;
            return; 
        end);
        return; 
    end
});
r145 = false;
rn.AddToggle(rn, "PlayerFling", {
    ["Text"] = "Fling",
    ["Default"] = false,
    ["Callback"] = function(arg1_57, ...)
        v1 = arg1_57;
        r145 = v1;
        if not v1 then
            r145 = false;
            return;
        end;
        task.spawn(function(...)
            J = r26.Character;
            if J then
                J = r26.Character;
                i = J.FindFirstChild(J, "HumanoidRootPart");
            end;
            if J then
                X = r26.Character.HumanoidRootPart.CFrame;
            end;
            J = r37("Fling", "Fling Mode Activated.", 3);
            while r145 do
                J = r56;
                v3 = e;
                if not J or not J.Parent then
                    r26 = false;
                else
                    e = r26.Character;
                    if e then
                        w = e.FindFirstChild(e, "HumanoidRootPart");
                    end;
                    r146 = e;
                    t = not r146;
                    if t then
                        v3 = e;
                        if t then
                            task.wait(0.5);
                        else
                            a = v3;
                            n = r56.Character;
                            if n then
                                w = n.FindFirstChild(n, "HumanoidRootPart");
                            end;
                            v3 = a;
                            r147 = n;
                            a = v3;
                            if n then
                                w = n.FindFirstChild(n, "Humanoid");
                            end;
                            t = r147;
                            w = t;
                            v3 = a;
                            a = v3;
                            if t then
                                if n then
                                    t = n.Health > 0;
                                end;
                                v3 = a;
                                w = K;
                            end;
                            if w then
                                t = not nil;
                                w = t;
                                a = a;
                                if t then
                                    v3 = a;
                                    if w then
                                        if nil then
                                            nil.Destroy(nil);
                                        end;
                                        v1 = Instance.new("BodyAngularVelocity");
                                        v1.Name = "GGOGSpin";
                                        v1.MaxTorque = Vector3.new(math.huge, math.huge, math.huge);
                                        v1.AngularVelocity = Vector3.new(0, 10000, 0);
                                        v1.P = 10000;
                                        v1.Parent = r146;
                                    end;
                                    Y = {
                                        pairs(e.GetDescendants(e))
                                    };
                                    v6 = Y[3];
                                    v5 = Y[2];
                                    t = pairs(e.GetDescendants(e));
                                else
                                    w = nil.Parent ~= r146;
                                end;
                            else
                                task.wait(.2);
                            end;
                            task.wait(.1);
                        end;
                    else
                        w = not (e and e.FindFirstChild(e, "Humanoid"));
                    end;
                end; 
            end;
            if nil then
                nil.Destroy(nil);
            end;
            e = r26.Character;
            if e then
                v4 = r26.Character;
                v2 = v4[2];
                o = v4[1];
                for n, v4 in pairs(v4.GetDescendants(v4)) do
                    e = n;
                    if v4.IsA(v4, "BasePart") then
                        v4.CanCollide = true;
                    end; 
                end;
                e = r26.Character;
                o = e.FindFirstChild(e, "HumanoidRootPart");
                if o then
                    o.RotVelocity = Vector3.zero;
                    o.Velocity = Vector3.zero;
                    if v3 then
                        e.FindFirstChild(e, v2).CFrame = v3;
                    end;
                end;
            end;
            return; 
        end);
        return; 
    end
});
rn.AddToggle(rn, "DestroyTargetGucci", {
    ["Text"] = "Destroy Gucci (sit)",
    ["Default"] = false,
    ["Callback"] = function(arg1_58, ...)
        v1 = arg1_58;
        r148 = v1;
        if v1 then
            v3 = not r56;
            if v3 then
                r37("Error", "Select target first", 3);
                v3 = r36.DestroyTargetGucci;
                v3.SetValue(v3, false);
                return;
            end;
            task.spawn(function(...)
                J = "Character";
                v1 = r26[J] and J.FindFirstChild(J, "HumanoidRootPart");
                while r148 do
                    i = not r56 or not r56.Parent;
                    if i then
                        r148 = false;
                        i = r36.DestroyTargetGucci;
                        i.SetValue(i, false);
                        break;
                    else
                        i = r31;
                        X = i.FindFirstChild(i, r56.Name .. "SpawnedInToys");
                        if X then
                            n = X.GetChildren;
                            e = n[2];
                            o = n[3];
                            for o, n in ipairs(n(X)) do
                                v2 = o;
                                r149 = n;
                                K = "CreatureBlobman";
                                if r149.Name == K then
                                    K = r149;
                                    v5 = r16;
                                    v3 = r148;
                                    r150 = K.FindFirstChild(K, "VehicleSeat") or K.FindFirstChildWhichIsA(K, "VehicleSeat", true);
                                    if r150 then
                                        K = r26.Character;
                                        if K then
                                            i = K.FindFirstChild(K, "HumanoidRootPart");
                                        end;
                                        r151 = K;
                                        if K then
                                            i = K.FindFirstChild(K, "Humanoid");
                                        end;
                                        v5 = r151;
                                        if v5 then
                                            i = K;
                                        end;
                                        v3 = r148;
                                        if v5 then
                                            t = K.SeatPart;
                                            if t ~= r150 then
                                                i = r30.Stepped;
                                                t = i.Connect(i, function(...)
                                                    if r151 and r150 then
                                                        r151.CFrame = r150.CFrame;
                                                        r151.Velocity = Vector3.zero;
                                                        if r149.PrimaryPart then
                                                            r149.PrimaryPart.Velocity = Vector3.zero;
                                                            r149.PrimaryPart.RotVelocity = Vector3.zero;
                                                        end;
                                                    end;
                                                    return; 
                                                end);
                                                while tick() - tick() < 1 do
                                                    if K.SeatPart == r150 then
                                                    else
                                                        i = r150;
                                                        i.Sit(i, K);
                                                        task.wait();
                                                    end; 
                                                end;
                                                if t then
                                                    t.Disconnect(t);
                                                end;
                                                if K.SeatPart == r150 then
                                                    task.wait(.3);
                                                    K.Sit = false;
                                                    K.Jump = true;
                                                    task.wait(.05);
                                                    if v1 then
                                                        W = r26.Character;
                                                        if W then
                                                            W = r26.Character;
                                                            Y = W.FindFirstChild(W, "HumanoidRootPart");
                                                        end;
                                                        v3 = t;
                                                        i = W;
                                                    end;
                                                    v3 = t;
                                                    if v1 then
                                                        Y = i;
                                                        r26.Character.HumanoidRootPart.CFrame = Y;
                                                        r26.Character.HumanoidRootPart.Velocity = Vector3.zero;
                                                    end;
                                                    r37("Success", "gucci has removed", 1);
                                                    task.wait(0.5);
                                                else
                                                    if v1 then
                                                        W = r26.Character;
                                                        i = W and W.FindFirstChild(W, "HumanoidRootPart");
                                                        v3 = t;
                                                    end;
                                                    v3 = t;
                                                    if v1 then
                                                        Y = r26.Character.HumanoidRootPart;
                                                        r26.Character.HumanoidRootPart.CFrame = Y;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end; 
                            end;
                        end;
                        task.wait(1);
                    end; 
                end;
                return; 
            end);
        else
            r37("System", "remove Gucci off", 2);
        end;
        return; 
    end
});
rn.AddButton(rn, {
    ["Text"] = "Bring",
    ["Func"] = function(...)
        if not r56 then
            return;
        end;
        v1 = r26.Character;
        X = v1 and v1.FindFirstChild(v1, "Humanoid");
        J = X and X.SeatPart;
        if not J or J.Parent.Name ~= "CreatureBlobman" then
            return;
        end;
        e = J.Parent;
        n = not e.FindFirstChild(e, "HumanoidRootPart");
        i = n;
        if n then
            if i then
                return;
            end;
            r152 = v2.FindFirstChild(v2, "CreatureGrab");
            v2.FindFirstChild(v2, "CreatureDrop");
            r153 = e.FindFirstChild(e, "RightDetector");
            w = r153;
            i = 303;
            if w then
                w = r153;
                i = w.FindFirstChild(w, "RightWeld");
            end;
            r154 = i;
            a = r56.Character;
            if a then
                i = a.FindFirstChild(a, "HumanoidRootPart");
            end;
            r155 = a;
            if not r155 then
                return;
            end;
            o.CFrame = r155.CFrame;
            o.Velocity = Vector3.new();
            o.RotVelocity = Vector3.new();
            task.wait(.3);
            pcall(function(...)
                v3 = r152;
                if v3 then
                    v3 = r152;
                    v3.FireServer(v3, r153, r155, r154);
                end;
                return; 
            end);
            task.wait(0.5);
            i = o.CFrame;
            o.CFrame = i;
            o.Velocity = Vector3.new();
            o.RotVelocity = Vector3.new();
            return;
        else
            i = not e.FindFirstChild(e, "BlobmanSeatAndOwnerScript");
        end; 
    end
});
r156 = false;
rn.AddToggle(rn, "RemoveAntiInputLag", {
    ["Text"] = "Remove Anti Input Lag",
    ["Default"] = false,
    ["Callback"] = function(arg1_59, ...)
        v1 = arg1_59;
        r156 = v1;
        if not v1 then
            r156 = false;
            return;
        end;
        task.spawn(function(...)
            r157 = r26.Character;
            J = r157;
            if J then
                J = r157;
                i = J.FindFirstChild(J, "HumanoidRootPart");
            end;
            r158 = J;
            if not r158 then
                return;
            end;
            r159 = {};
            r160 = {
                ["FoodHamburger"] = true,
                ["FoodCoconut"] = true,
                ["FoodPizzaCheese"] = true,
                ["FoodPizzaPepperoni"] = true,
                ["FoodHotdog"] = true,
                ["FoodMushroomPoison"] = true,
                ["FoodBread"] = true,
                ["FoodDippyEgg"] = true,
                ["FoodMayonnaise"] = true,
                ["FoodFrenchFries"] = true,
                ["FoodMeatStick"] = true,
                ["FoodDonut"] = true,
                ["FoodCakePink"] = true,
                ["InstrumentGuitarBanjo"] = true,
                ["InstrumentGuitarViolin"] = true,
                ["InstrumentGuitarUkulele"] = true,
                ["InstrumentWoodwindSaxophone"] = true,
                ["InstrumentWoodwindOcarina"] = true,
                ["InstrumentBrassVuvuzelaQwizik"] = true,
                ["InstrumentBrassTrumpet"] = true,
                ["InstrumentDrumBongos"] = true,
                ["InstrumentDrumSnare"] = true,
                ["InstrumentPianoMelodica"] = true,
                ["InstrumentVoiceMicrophone"] = true,
                ["CupMugWhite"] = true,
                ["CupMugBrown"] = true,
                ["PoopPile"] = true,
                ["PoopPileSparkle"] = true
            };
            v3 = workspace.DescendantAdded;
            v3.Connect(v3, function(arg1_60, ...)
                r161 = arg1_60;
                X = r160[r161.Name];
                if X then
                    X = r161;
                    i = X.IsA(X, "Model");
                end;
                if X then
                    task.spawn(function(...)
                        v3 = r161;
                        v1 = v3.WaitForChild(v3, "HoldPart", 3);
                        if v1 then
                            table.insert(r159, r161);
                        end;
                        return; 
                    end);
                end;
                return; 
            end);
            v4 = workspace;
            K = {
                v4.GetDescendants(v4)
            };
            n = v4[3];
            v4 = v4[1];
            for n, w in v4, ipairs(T(K)) do
                K = n;
                if r160[w.Name] and (w.IsA(w, "Model") and w.FindFirstChild(w, "HoldPart")) then
                    r159[#r159 + 1] = w;
                end; 
            end;
            if r156 then
                v4 = 1;
                K = -1;
                w = K < 0;
                n = #r159 - K;
            end;
            return; 
        end);
        return; 
    end
});
r162 = false;
rn.AddToggle(rn, "RemoveAntiKick", {
    ["Text"] = "Remove Anti Kick",
    ["Default"] = false,
    ["Callback"] = function(arg1_61, ...)
        v1 = arg1_61;
        r162 = v1;
        if not v1 then
            r162 = false;
            return;
        end;
        task.spawn(function(...)
            while r162 do
                v1 = r56;
                if not v1 or not v1.Parent then
                    task.wait(0.5);
                else
                    n = r16("\x7fe\x83b\x9b\x0b(\xecX\xe2'\xe5\xd5", 10892962108368);
                    v3 = workspace;
                    J = v3.FindFirstChild(v3, v3.Name .. r15[n]);
                    if J then
                        n = J.GetChildren;
                        v2 = {
                            n(J)
                        };
                        o = n[3];
                        e = n[2];
                        for o, v4 in ipairs(T(i)) do
                            r163 = v4;
                            n = o;
                            w = Q[v3];
                            if w then
                                w = Q[v3];
                                K = w.FindFirstChild(w, "AntiKick");
                            end;
                            if w then
                                pcall(function(...)
                                    v3 = Q[v3].AntiKick;
                                    v3.Destroy(v3);
                                    return; 
                                end);
                            end; 
                        end;
                    end;
                    task.wait(1);
                end; 
            end;
            return; 
        end);
        return; 
    end
});
r164 = false;
r166 = {};
local function r167(...)
    J = r166;
    v1 = 641[2];
    J = 641[1];
    for X, o in pairs(J) do
        r168 = X;
        r169 = o;
        if r168 and r168.Parent then
            pcall(function(...)
                r168.CanCollide = Q[v3];
                return; 
            end);
        end; 
    end;
    r166 = {};
    return; 
end;
local function r170(...)
    while r164 do
        v1 = r59();
        if v1 then
            i = v1.bl and v1.bl.Parent;
            v3 = r59;
        end;
        if v1 then
            K = "\x9c\xa0";
            v4 = r16(K, 18979320144517);
            e = v1[r15[v4]];
            X = e[2];
            e = e[1];
            for J, v2 in ipairs(e.GetDescendants(e)) do
                o = J;
                r171 = v2;
                v4 = Q[v3];
                K = v4.IsA(v4, "BasePart");
                if K then
                    v3 = 218;
                    n = Q[v3].Parent and Q[v3].Parent ~= r26.Character;
                end;
                if K then
                    if r166[Q[v3]] == nil then
                        r166[Q[v3]] = Q[v3].CanCollide;
                    end;
                    pcall(function(...)
                        Q[v3].CanCollide = false;
                        return; 
                    end);
                end; 
            end;
        else
            if not r60() then
            end;
            task.wait(0.25);
        end; 
    end;
    r167();
    return; 
end;
rn.AddToggle(rn, "NoClipBlobmen", {
    ["Text"] = "No Clip Blobmen",
    ["Default"] = false,
    ["Callback"] = function(arg1_62, ...)
        v1 = arg1_62;
        r164 = v1;
        if v1 then
            if r165 then
                task.cancel(r165);
            end;
            r165 = task.spawn(r170);
            r37("No Clip Blobmen", "Enabled", 2);
        else
            if r165 then
                task.cancel(r165);
            end;
            r167();
            r37("No Clip Blobmen", "Disabled", 2);
            return;
        end; 
    end
});
r172 = false;
r173 = 12;
r174 = 8;
r175 = CFrame.new(0, 30, 0);
L5.AddToggle(L5, "KickSpinMercury", {
    ["Text"] = "Kick Spin [Mercury]",
    ["Default"] = false,
    ["Callback"] = function(arg1_63, ...)
        v1 = arg1_63;
        r172 = v1;
        if not v1 then
            r68();
            return;
        end;
        r67();
        r26.Character.HumanoidRootPart.CFrame = r175;
        task.spawn(function(...)
            if not r60() then
                r172 = false;
                i = r36.KickSpinMercury;
                i.SetValue(i, false);
                r68();
                r37("Error", "Can't sit on blobman!", 3);
                return;
            end;
            r62(function(...)
                return Q[232]; 
            end);
            tick();
            r37("Kick Spin", "Kicking " .. r56.DisplayName .. "...", 3);
            r176 = r59();
            if not r176 then
                r172 = false;
                X = r36.KickSpinMercury;
                X.SetValue(X, false);
                r68();
                return;
            end;
            while r172 do
                r176 = r59();
                X = not r176;
                if X then
                    task.wait(.075);
                    if r172 then
                        r62();
                    end;
                else
                    X = r56;
                    t = not X;
                    v3 = not r60();
                    if t or not X.Parent then
                        r37("Kick Spin", "Kicked! " .. string.format("%.1f", tick() - tick()) .. "s", 8);
                        break;
                    else
                        a = v3;
                        o = X.Character;
                        if o then
                            w = o.FindFirstChild(o, "HumanoidRootPart");
                        end;
                        v3 = a;
                        a = v3;
                        r177 = o;
                        if o then
                            w = o.FindFirstChild(o, "Humanoid");
                        end;
                        a = a;
                        r178 = o;
                        t = not r177;
                        w = t;
                        if t then
                        end;
                    end;
                end; 
            end;
            r172 = false;
            o = r36.KickSpinMercury;
            o.SetValue(o, false);
            r68();
            return; 
        end);
        return; 
    end
});
L5.AddSlider(L5, "KickSpinRadius", {
    ["Text"] = "Spin Radius",
    ["Min"] = 5,
    ["Max"] = 25,
    ["Default"] = 12,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_64, ...)
        r173 = arg1_64;
        return; 
    end
});
L5.AddSlider(L5, "KickSpinSpeed", {
    ["Text"] = "Spin Speed",
    ["Min"] = 0,
    ["Max"] = 1000,
    ["Default"] = 8,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_65, ...)
        r174 = arg1_65;
        return; 
    end
});
L5.AddLabel(L5, "0 = Stop | 1000 = Max Speed");
r179 = false;
L5.AddToggle(L5, "KickSpeedGGOG", {
    ["Text"] = "Kick Speed [GGOG]",
    ["Default"] = false,
    ["Callback"] = function(arg1_66, ...)
        v1 = arg1_66;
        r179 = v1;
        if not v1 then
            r68();
            return;
        end;
        r67();
        r180 = CFrame.new(1000, 1000, 1000);
        r26.Character.HumanoidRootPart.CFrame = r180;
        task.spawn(function(...)
            if not r60() then
                r179 = false;
                i = r36.KickSpeed1000;
                i.SetValue(i, false);
                r68();
                r37("Error", "Can't sit on blobman!", 3);
                return;
            end;
            r62(function(...)
                return Q[232]; 
            end);
            tick();
            r37("Kick Speed", "Kicking " .. r56.DisplayName .. "...", 3);
            r181 = r59();
            if not r181 then
                r179 = false;
                X = r36.KickSpeed1000;
                X.SetValue(X, false);
                r68();
                return;
            end;
            while r179 do
                r181 = r59();
                X = not r181;
                if X then
                    task.wait(0);
                    if r179 then
                        r37();
                    end;
                else
                    K = not r60();
                    X = r56;
                    w = not X;
                    v3 = K;
                    if w or not X.Parent then
                        r37("Kick Speed", "Target kicked! Time: " .. string.format("%.1f", tick() - tick()) .. "s", 8);
                        break;
                    else
                        K = v3;
                        o = X.Character;
                        if o then
                            v4 = o.FindFirstChild(o, "HumanoidRootPart");
                        end;
                        r182 = o;
                        v3 = K;
                        K = v3;
                        if o then
                            v4 = o.FindFirstChild(o, "Humanoid");
                        end;
                        v3 = K;
                        r183 = o;
                        w = not r182;
                        v4 = w;
                        K = v3;
                        if w then
                            v3 = K;
                            if w then
                                v5 = {
                                    r69(r56, 10, function(...)
                                        return Q[232]; 
                                    end)
                                };
                                r182 = r69(r56, 10, function(...)
                                    return Q[232]; 
                                end);
                                r183 = v5[2];
                                if not r182 then
                                    if X then
                                        a = r56.Parent;
                                    end;
                                    v3 = K;
                                    if not X then
                                        r37("Kick Speed", "Target kicked! Time: " .. string.format("%.1f", tick() - tick()) .. "s", 8);
                                    end;
                                else
                                end;
                            end;
                            r181.br.CFrame = r182.CFrame;
                            for a = 1, 16 do
                                v4 = a;
                                if not r179 then
                                    
                                else
                                    pcall(function(...)
                                        v3 = r181.cg;
                                        v3.FireServer(v3, r181.rd, r182, r181.rw);
                                        if r181.ld and r181.lw then
                                            v3 = r181.cg;
                                            v3.FireServer(v3, r181.ld, r182, r181.lw);
                                        end;
                                        v3 = r50;
                                        v3.FireServer(v3, r182, r181.br.CFrame);
                                        return; 
                                    end);
                                    task.wait(0);
                                end; 
                            end;
                            F = "U3 $\x1b5";
                            r181.br[r15[r16(F, 18485657362848)]] = r180;
                            while r179 do
                                o = r56.Character;
                                if o then
                                    a = o.FindFirstChild(o, "HumanoidRootPart");
                                end;
                                r182 = o;
                                r183 = o and o.FindFirstChild(o, "Humanoid");
                                F = not r182;
                                if F then
                                    v3 = K;
                                    if F then
                                        r181.br.CFrame = r180;
                                    else
                                        r184 = r180 * CFrame.new(0, 28, 0);
                                        r182.CFrame = r184;
                                        r182.Velocity = Vector3.zero;
                                        r182.RotVelocity = Vector3.zero;
                                        r181.br.CFrame = r180;
                                        pcall(function(...)
                                            r183.PlatformStand = true;
                                            r183.Sit = true;
                                            v3 = r50;
                                            v3.FireServer(v3, r182, r184);
                                            v1 = r181.rd;
                                            v1 = v1.FindFirstChild(v1, "RightWeld") or v1.FindFirstChildWhichIsA(v1, "Weld");
                                            if v1 then
                                                v3 = r181.cd;
                                                v3.FireServer(v3, v1);
                                            end;
                                            v3 = r181.cg;
                                            v3.FireServer(v3, r181.rd, r182, r181.rw);
                                            v3 = r52;
                                            v3.FireServer(v3, r182);
                                            v3 = r51;
                                            v3.FireServer(v3, r182, Vector3.zero, r182.Position, false);
                                            return; 
                                        end);
                                        task.wait(0);
                                    end;
                                else
                                    v5 = not r183 or r183.Health <= 0;
                                    v3 = K;
                                end; 
                            end;
                        else
                            v4 = not r183 or r183.Health <= 0;
                            v3 = K;
                        end;
                    end;
                end; 
            end;
            r179 = false;
            o = r36.KickSpeed1000;
            o.SetValue(o, false);
            r68();
            return; 
        end);
        return; 
    end
});
L5.AddToggle(L5, "BlobAntiLoopKill", {
    ["Text"] = "Anti Loop Kill (Blob)",
    ["Default"] = false,
    ["Callback"] = function(arg1_67, ...)
        v1 = arg1_67;
        X = v1;
        _G.antiKillActive = X;
        if _G.antiKillConn then
            v3 = _G.antiKillConn;
            v3.Disconnect(v3);
            _G.antiKillConn = nil;
        end;
        if not v1 then
            r37("Anti Kill", "OFF", 2);
            return;
        end;
        r37("Anti Kill", "MAX GRAB ON!", 3);
        X = r30.Heartbeat;
        _G.antiKillConn = X.Connect(X, function(...)
            if not _G.antiKillActive then
                return;
            end;
            r185 = r59();
            if not r185 then
                return;
            end;
            X = r26.Character;
            i = X;
            if not (i and X.FindFirstChild(X, "HumanoidRootPart")) then
                return;
            end;
            o = r25;
            e = o[3];
            o = o[1];
            for e, n in o, pairs(o.GetPlayers(o)) do
                v2 = e;
                if n ~= r26 and n.Character then
                    v3 = n.Character;
                    r186 = v3.FindFirstChild(v3, "HumanoidRootPart");
                    v3 = n.Character;
                    v4 = v3.FindFirstChildOfClass(v3, "Humanoid");
                    a = r186;
                    if a then
                        if v4 then
                            a = v3.FindFirstChildOfClass(v3, r15[v5]).Health > 0 and (r186.Position - (i and X.FindFirstChild(X, "HumanoidRootPart")).Position).Magnitude <= 50;
                            v3 = n.Character;
                        end;
                        v3 = n.Character;
                        w = v4;
                    end;
                    if a then
                        pcall(function(...)
                            v3 = r50;
                            v3.FireServer(v3, r186, r185.br.CFrame);
                            v3 = r185.cg;
                            v3.FireServer(v3, r185.rd, r186, r185.rw);
                            if r185.ld and r185.lw then
                                v3 = r185.cg;
                                v3.FireServer(v3, r185.ld, r186, r185.lw);
                            end;
                            v1 = r185.rd;
                            v1 = v1.FindFirstChild(v1, "RightWeld") or v1.FindFirstChildWhichIsA(v1, "Weld");
                            if v1 then
                                v3 = r185.cd;
                                v3.FireServer(v3, v1);
                            end;
                            if r185.ld and r185.lw then
                                X = r185.ld;
                                X = X.FindFirstChild(X, "LeftWeld") or X.FindFirstChildWhichIsA(X, "Weld");
                                if X then
                                    v3 = r185.cd;
                                    v3.FireServer(v3, X);
                                end;
                            end;
                            v3 = r185.cg;
                            v3.FireServer(v3, r185.rd, r186, r185.rw);
                            if r185.ld and r185.lw then
                                v3 = r185.cg;
                                v3.FireServer(v3, r185.ld, r186, r185.lw);
                            end;
                            return; 
                        end);
                    end;
                end; 
            end;
            return; 
        end);
        return; 
    end
});
r187 = false;
r188 = 20;
L5.AddToggle(L5, "KickRezonans", {
    ["Text"] = "Kick Blobmen (Rezonans)",
    ["Default"] = false,
    ["Callback"] = function(arg1_68, ...)
        v1 = arg1_68;
        r187 = v1;
        if not v1 then
            r68();
            return;
        end;
        r67();
        r189 = r26.Character.HumanoidRootPart.CFrame;
        task.spawn(function(...)
            if not r60() then
                r187 = false;
                i = r36.KickRezonans;
                i.SetValue(i, false);
                r68();
                r37("Error", "Can't sit on blobman!", 3);
                return;
            end;
            r62(function(...)
                return Q[232]; 
            end);
            tick();
            r37("Kick Rezonans", "Kicking " .. r56.DisplayName .. "...", 3);
            r190 = r59();
            if not r190 then
                r187 = false;
                X = r36.KickRezonans;
                X.SetValue(X, false);
                r68();
                return;
            end;
            while r187 do
                r190 = r59();
                X = not r190;
                if X then
                    task.wait(0);
                    if r187 then
                        r37();
                    end;
                else
                    K = not r60();
                    X = r56;
                    w = not X;
                    v3 = K;
                    if w or not X.Parent then
                        r37("Kick Rezonans", "Kicked! " .. string.format("%.1f", tick() - tick()) .. "s", 8);
                        break;
                    else
                        K = v3;
                        o = X.Character;
                        if o then
                            v4 = o.FindFirstChild(o, "HumanoidRootPart");
                        end;
                        v3 = K;
                        K = v3;
                        r191 = o;
                        if o then
                            v4 = o.FindFirstChild(o, "Humanoid");
                        end;
                        r192 = o;
                        w = not r191;
                        v4 = w;
                        v3 = K;
                        K = v3;
                        if w then
                            v3 = K;
                            if w then
                                v5 = {
                                    r69(r56, 10, function(...)
                                        return Q[232]; 
                                    end)
                                };
                                r191 = r69(r56, 10, function(...)
                                    return Q[232]; 
                                end);
                                r192 = v5[2];
                                if not r191 then
                                    if X then
                                        a = r56.Parent;
                                    end;
                                    v3 = K;
                                    if not X then
                                        r37("Kick Rezonans", "Kicked!", 8);
                                    end;
                                else
                                end;
                            end;
                            r190.br.CFrame = r191.CFrame;
                            for a = 1, 16 do
                                v4 = a;
                                if not r187 then
                                    
                                else
                                    pcall(function(...)
                                        v3 = r190.cg;
                                        v3.FireServer(v3, r190.rd, r191, r190.rw);
                                        if r190.ld and r190.lw then
                                            v3 = r190.cg;
                                            v3.FireServer(v3, r190.ld, r191, r190.lw);
                                        end;
                                        v3 = r50;
                                        v3.FireServer(v3, r191, r190.br.CFrame);
                                        return; 
                                    end);
                                    task.wait(0);
                                end; 
                            end;
                            r190.br.CFrame = r189;
                            while r187 do
                                o = r56.Character;
                                if o then
                                    a = o.FindFirstChild(o, "HumanoidRootPart");
                                end;
                                r191 = o;
                                if o then
                                    t = o.FindFirstChild(o, "Humanoid");
                                end;
                                r192 = o;
                                v3 = K;
                                if not r191 or (not r192 or r192.Health <= 0) then
                                    r190.br.CFrame = r189;
                                else
                                    r193 = r189 * CFrame.new(0, 17, 0);
                                    r191.CFrame = r193;
                                    r191.Velocity = Vector3.zero;
                                    r191.RotVelocity = Vector3.zero;
                                    r190.br.CFrame = r189;
                                    pcall(function(...)
                                        r192.PlatformStand = true;
                                        r192.Sit = true;
                                        v3 = r50;
                                        v3.FireServer(v3, r191, r193);
                                        v1 = r190.rd;
                                        v1 = v1.FindFirstChild(v1, "RightWeld") or v1.FindFirstChildWhichIsA(v1, "Weld");
                                        if v1 then
                                            v3 = r190.cd;
                                            v3.FireServer(v3, v1);
                                        end;
                                        v3 = r190.cg;
                                        v3.FireServer(v3, r190.rd, r191, r190.rw);
                                        if r190.ld and r190.lw then
                                            X = r190.ld;
                                            X = X.FindFirstChild(X, "LeftWeld") or X.FindFirstChildWhichIsA(X, "Weld");
                                            if X then
                                                v3 = r190.cd;
                                                v3.FireServer(v3, X);
                                            end;
                                            v3 = r190.cg;
                                            v3.FireServer(v3, r190.ld, r191, r190.lw);
                                        end;
                                        v3 = r52;
                                        v3.FireServer(v3, r191);
                                        v3 = r51;
                                        v3.FireServer(v3, r191, Vector3.zero, r191.Position, false);
                                        return; 
                                    end);
                                    task.wait(0 / r188);
                                end; 
                            end;
                        else
                            v3 = K;
                            v4 = not r192 or r192.Health <= 0;
                        end;
                    end;
                end; 
            end;
            r187 = false;
            o = r36.KickRezonans;
            o.SetValue(o, false);
            r68();
            return; 
        end);
        return; 
    end
});
L5.AddSlider(L5, "RezonansGPS", {
    ["Text"] = "Grabs Per Second",
    ["Min"] = 1,
    ["Max"] = 250,
    ["Default"] = 20,
    ["Rounding"] = 0,
    ["Suffix"] = " GPS",
    ["Callback"] = function(arg1_69, ...)
        r188 = arg1_69;
        return; 
    end
});
L5.AddLabel(L5, "1 GPS = Slow | 100 GPS = Max Speed");
rn.AddToggle(rn, "LoopKickGrabToggle2", {
    ["Text"] = "Kick (ragdoll grab)",
    ["Default"] = false,
    ["Callback"] = function(arg1_70, ...)
        v1 = arg1_70;
        r64 = v1;
        if not v1 then
            r68();
            return;
        end;
        r67();
        teleportToSafePos();
        task.spawn(function(...)
            v3 = r29;
            r194 = v3.WaitForChild(v3, "GrabEvents");
            X = r26.Character;
            if X then
                X = r26.Character;
                i = X.FindFirstChild(X, "HumanoidRootPart");
            end;
            r195 = X;
            if not r195 then
                v3 = r36.LoopKickGrabToggle2;
                v3.SetValue(v3, false);
                r68();
                return;
            end;
            v2 = r16("S\xc6\xb2?\x91\x04", 28618556732430);
            e = false;
            o = 0;
            while r64 do
                v2 = r56;
                if not v2 or not v2.Parent then
                    
                else
                    n = v2.Character;
                    if n then
                        i = n.FindFirstChild(n, "HumanoidRootPart");
                    end;
                    r196 = n;
                    if n then
                        i = n.FindFirstChild(n, "Humanoid");
                    end;
                    r197 = n;
                    if r196 and (r197 and r197.Health > 0) then
                        r196.AssemblyLinearVelocity = Vector3.zero;
                        r196.AssemblyAngularVelocity = Vector3.zero;
                        r196.Velocity = Vector3.zero;
                        if not false then
                            r195.CFrame = r196.CFrame;
                            pcall(function(...)
                                r197.PlatformStand = true;
                                r197.Sit = true;
                                v3 = r194.SetNetworkOwner;
                                v3.FireServer(v3, r196, r195.CFrame);
                                v3 = r194.CreateGrabLine;
                                v3.FireServer(v3, r196, Vector3.zero, r196.Position, false);
                                return; 
                            end);
                            if 0 == 0 then
                                o = tick();
                            end;
                            if tick() - 0 > .15 then
                                o = 0;
                                e = true;
                                r195.CFrame = i[r15[v2]];
                            end;
                        else
                            v6 = r196.CFrame;
                            r196.CFrame = v6.Lerp(v6, CFrame.new(i[r15[v2]].Position + Vector3.new(0, 7, 0)) * CFrame.Angles(math.rad(math.random(-180, 180)), math.rad(math.random(-180, 180)), math.rad(math.random(-180, 180))), .2);
                            r196.Velocity = Vector3.zero;
                            r196.RotVelocity = Vector3.zero;
                            pcall(function(...)
                                r197.PlatformStand = true;
                                r197.Sit = false;
                                v3 = r194.SetNetworkOwner;
                                v3.FireServer(v3, r196, r196.CFrame);
                                v3 = r194.DestroyGrabLine;
                                v3.FireServer(v3, r196);
                                v3 = r194.CreateGrabLine;
                                v3.FireServer(v3, r196, Vector3.zero, r196.Position, false);
                                return; 
                            end);
                        end;
                    else
                        e = false;
                        o = 0;
                    end;
                    v5 = r30.Heartbeat;
                    v5.Wait(v5);
                end; 
            end;
            if r195 then
                v4 = i[r15[v2]];
                r195.CFrame = v4;
                r195.Velocity = Vector3.zero;
            end;
            r64 = false;
            n = r36.LoopKickGrabToggle2;
            n.SetValue(n, false);
            r68();
            return; 
        end);
        return; 
    end
});
r198 = false;
local function r200(arg1_71, ...)
    v3 = r25;
    X = v3.FindFirstChild(v3, arg1_71);
    if not X then
        return;
    end;
    v3 = r29;
    r201 = v3.WaitForChild(v3, "GrabEvents");
    e = r198;
    i = e;
    while not e do
        if e then
            if not X.Character then
                task.wait(0.5);
            end;
            e = r26.Character;
            if e then
                i = e.FindFirstChild(e, "HumanoidRootPart");
            end;
            r202 = e;
            a = r16("mS\x16j\xccVLB\x04", 32037686966854);
            v2 = X[r15[a]];
            if v2 then
                i = v2.FindFirstChild(v2, "HumanoidRootPart");
            end;
            r203 = v2;
            if v2 then
                i = v2.FindFirstChildOfClass(v2, "Humanoid");
            end;
            r204 = v2;
            K = r203;
            if K then
                a = r204;
                if a then
                    v3 = X[r15[a]];
                    K = r204.Health > 0 and r202;
                end;
                i = a;
                v3 = X[r15[a]];
            end;
            if K then
                K = r202.CFrame;
                a = tick() - tick() < .35;
                i = r198;
                while not a do
                    if i then
                        v3 = not r203.Parent;
                        if v3 then
                        else
                            r202.CFrame = r203.CFrame * CFrame.new(0, 0, 2);
                            r202.Velocity = Vector3.zero;
                            pcall(function(...)
                                v3 = r201.SetNetworkOwner;
                                v3.FireServer(v3, r203, r202.CFrame);
                                v3 = r204;
                                v3.ChangeState(v3, Enum.HumanoidStateType.Dead);
                                r204.Health = 0;
                                v3 = r201.CreateGrabLine;
                                v3.FireServer(v3, r203, Vector3.zero, r203.Position, false);
                                v3 = r201.DestroyGrabLine;
                                v3.FireServer(v3, r203);
                                return; 
                            end);
                            v3 = r30.Heartbeat;
                            v3.Wait(v3);
                        end;
                    end;
                    if r202 then
                        a = Q[o].CFrame;
                        r202.CFrame = a;
                        r202.Velocity = Vector3.zero;
                    end;
                    task.wait(1.2); 
                end;
                i = r198;
            else
                task.wait(0.5);
            end;
        end;
        e = r26.Character;
        o = e and e.FindFirstChild(e, "HumanoidRootPart");
        if o then
            o.Velocity = Vector3.zero;
            break;
        end;
        return; 
    end;
    if X then
        e = X.Parent;
    end;
    i = X;
    v3 = v3; 
end;
q5.AddToggle(q5, "LoopKillToggle", {
    ["Text"] = "Loop Kill",
    ["Default"] = false,
    ["Callback"] = function(arg1_72, ...)
        v1 = arg1_72;
        v3 = v1;
        r198 = v3;
        v3 = v3;
        r205 = r56 and r56.Name;
        if v1 then
            v3 = v3;
            if r205 and r205 ~= "" then
                r199 = task.spawn(function(...)
                    r200(r205);
                    return; 
                end);
            else
                Q[vm41] = false;
            end;
        else
            if r199 then
                task.cancel(r199);
            end;
            return;
        end; 
    end
});
rn.AddButton(rn, {
    ["Text"] = "Try to Remove Gucci",
    ["Func"] = function(...)
        r37("Remove Gucci", "", 3);
        return; 
    end
});
q5.AddLabel(q5, "Change Offset");
q5.AddLabel(q5, "Position");
q5.AddSlider(q5, "OffsetX", {
    ["Text"] = "X",
    ["Min"] = 0,
    ["Max"] = 20,
    ["Default"] = 0,
    ["Rounding"] = 0
});
q5.AddSlider(q5, "OffsetY", {
    ["Text"] = "Y",
    ["Min"] = 0,
    ["Max"] = 20,
    ["Default"] = 15,
    ["Rounding"] = 0
});
q5.AddSlider(q5, "OffsetZ", {
    ["Text"] = "Z",
    ["Min"] = 0,
    ["Max"] = 20,
    ["Default"] = 0,
    ["Rounding"] = 0
});
q5.AddToggle(q5, "EnableRagdollTarget", {
    ["Text"] = "Enable Ragdoll Target",
    ["Default"] = false
});
r206 = false;
local function r208(arg1_73, ...)
    v3 = r29;
    v2 = "\xd1\xef\xd4\xddT{\xc8\xec\xb6\x1e\xbb\xa4[S\xff";
    i = v3.WaitForChild(v3, "GrabEvents");
    r209 = i.WaitForChild(i, r15[r16(v2, 17054291861253)]);
    r210 = r26;
    local function r211(arg1_74, arg2_74, ...)
        v3 = r209;
        v3.FireServer(v3, arg1_74, arg2_74);
        return; 
    end;
    local function o(arg1_75, ...)
        v1 = arg1_75;
        X = v1.FindFirstChild(v1, "SoundPart");
        if X then
            r211(X, X.CFrame);
            i = X.FindFirstChild(X, "PartOwner") and X.PartOwner.Value == r210.Name;
            repeat
                w = loadstring(D.HttpGet(D, v5 .. "addons/ThemeManager.lua"))();
            until 283.IsA(283, "BasePart");
            283.CanCollide = false;
            repeat
                
            until 281("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/", loadstring(D.HttpGet(D, v5 .. "addons/ThemeManager.lua"))());
        end;
        return; 
    end;
    while r206 do
        v3 = r25;
        v2 = v3.FindFirstChild(v3, arg1_73);
        if v2 then
            v3 = r31;
            if v3.FindFirstChild(v3, v2.Name .. "SpawnedInToys") then
                if n.FindFirstChild(n, "NinjaKunai") then
                    (function(arg1_76, ...)
                        v1 = arg1_76;
                        X = v1.FindFirstChild(v1, "SoundPart");
                        if X then
                            r211(X, X.CFrame);
                            i = X.FindFirstChild(X, "PartOwner") and X.PartOwner.Value == r210.Name;
                            repeat
                                w = loadstring(D.HttpGet(D, v5 .. "addons/ThemeManager.lua"))();
                            until 283.IsA(283, "BasePart");
                            283.CanCollide = false;
                            repeat
                                
                            until 281("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/", loadstring(D.HttpGet(D, v5 .. "addons/ThemeManager.lua"))());
                        end;
                        return; 
                    end)(n.NinjaKunai);
                end;
                if n.FindFirstChild(n, "NinjaShuriken") then
                    (function(arg1_77, ...)
                        v1 = arg1_77;
                        X = v1.FindFirstChild(v1, "SoundPart");
                        if X then
                            r211(X, X.CFrame);
                            i = X.FindFirstChild(X, "PartOwner") and X.PartOwner.Value == r210.Name;
                            repeat
                                w = loadstring(D.HttpGet(D, v5 .. "addons/ThemeManager.lua"))();
                            until 283.IsA(283, "BasePart");
                            283.CanCollide = false;
                            repeat
                                
                            until 281("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/", loadstring(D.HttpGet(D, v5 .. "addons/ThemeManager.lua"))());
                        end;
                        return; 
                    end)(n.NinjaShuriken);
                end;
                if n.FindFirstChild(n, "AntiKick") then
                    (function(arg1_78, ...)
                        v1 = arg1_78;
                        X = v1.FindFirstChild(v1, "SoundPart");
                        if X then
                            r211(X, X.CFrame);
                            i = X.FindFirstChild(X, "PartOwner") and X.PartOwner.Value == r210.Name;
                            repeat
                                w = loadstring(D.HttpGet(D, v5 .. "addons/ThemeManager.lua"))();
                            until 283.IsA(283, "BasePart");
                            283.CanCollide = false;
                            repeat
                                
                            until 281("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/", loadstring(D.HttpGet(D, v5 .. "addons/ThemeManager.lua"))());
                        end;
                        return; 
                    end)(n.AntiKick);
                end;
                task.wait(.1);
            end;
        end; 
    end;
    return; 
end;
q5.AddToggle(q5, "EnableAntiAntiKick", {
    ["Text"] = "Enable Anti-Anti-Kick",
    ["Default"] = false,
    ["Callback"] = function(arg1_79, ...)
        v1 = arg1_79;
        r206 = v1;
        if v1 then
            if r56 then
                r207 = task.spawn(function(...)
                    r208(r56.Name);
                    return; 
                end);
                r37("Anti-Anti-Kick", "Started for " .. r56.DisplayName, 3);
            else
                i = r36.EnableAntiAntiKick;
                i.SetValue(i, false);
                r37("Error", "Select a target first!", 3);
            end;
        else
            if r207 then
                task.cancel(r207);
            end;
            r37("Anti-Anti-Kick", "Stopped", 2);
            return;
        end; 
    end
});
q5.AddLabel(q5, "\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81");
q5.AddLabel(q5, "Crazy Line");
r212 = false;
r214 = .05;
q5.AddToggle(q5, "CrazyLine", {
    ["Text"] = "Crazy Line (Grab All)",
    ["Default"] = false,
    ["Callback"] = function(arg1_80, ...)
        v1 = arg1_80;
        r212 = v1;
        if v1 then
            r37("Crazy Line", "Grabbing all players!", 3);
            r213 = task.spawn(function(...)
                v1 = r26.Character;
                if not v1 then
                    r212 = false;
                    i = r36.CrazyLine;
                    i.SetValue(i, false);
                    r37("Error", "No character!", 3);
                    return;
                end;
                r215 = v1.FindFirstChild(v1, "HumanoidRootPart");
                J = r215;
                if not J then
                    r212 = false;
                    J = r36.CrazyLine;
                    J.SetValue(J, false);
                    return;
                end;
                e = {};
                K = r25;
                v4 = K[3];
                for v4, K in K[1], ipairs(K.GetPlayers(K)) do
                    o = v4;
                    if not r212 then
                        
                    else
                        v3 = not v1;
                        if K ~= r26 and K.Character then
                            w = K.Character;
                            r216 = w.FindFirstChild(w, "Head");
                            a = w.FindFirstChild(w, "HumanoidRootPart");
                            v5 = w.FindFirstChildOfClass(w, "Humanoid");
                            Y = r216;
                            if Y then
                                if a then
                                    if v5 then
                                        W = w.FindFirstChildOfClass(w, r15[u]).Health > 0;
                                    end;
                                    v3 = a;
                                    Y = v5;
                                end;
                                v3 = a;
                                v6 = a;
                            end;
                            v3 = a;
                            if Y then
                                pcall(function(...)
                                    v3 = r50;
                                    v3.FireServer(v3, r216, r215.CFrame);
                                    v3 = r51;
                                    v3.FireServer(v3, r216, Vector3.zero, r216.Position, false);
                                    return; 
                                end);
                                task.wait(.1);
                                table.insert({}, {
                                    ["player"] = K,
                                    ["head"] = r216,
                                    ["hrp"] = a
                                });
                                r37("Crazy Line", "Grabbed: " .. K.DisplayName, 1);
                            end;
                        end;
                    end; 
                end;
                K = r16;
                task.wait(.3);
                if #e > 0 then
                    r37("Crazy Line", "Grabbed " .. #e .. " players! Speed: " .. r214 .. "s", 3);
                    v2 = r215.CFrame * CFrame.new(-5 * #e / 2, 0, 0);
                    while r212 do
                        v4 = a[1];
                        K = a[2];
                        for w, a in ipairs({}) do
                            r217 = a;
                            v3 = not v1;
                            if r217.head and (r217.head.Parent and (r217.hrp and r217.hrp.Parent)) then
                                r218 = J * v4 * CFrame.new(5 * w, 2, 0);
                                pcall(function(...)
                                    v3 = r50;
                                    v3.FireServer(v3, r217.head, r218);
                                    r217.head.CFrame = r218;
                                    r217.head.Velocity = Vector3.zero;
                                    r217.head.RotVelocity = Vector3.zero;
                                    r217.head.CFrame = CFrame.new(r218.Position, r215.Position);
                                    return; 
                                end);
                            end; 
                        end;
                        task.wait(r214); 
                    end;
                else
                    r37("Crazy Line", "No players grabbed!", 3);
                end;
                v4 = K[3];
                n = K[2];
                for v4, K in ipairs(e) do
                    o = v4;
                    r219 = K;
                    v3 = not v1;
                    if r219.head and r219.head.Parent then
                        pcall(function(...)
                            v3 = r52;
                            v3.FireServer(v3, r219.head);
                            return; 
                        end);
                    end; 
                end;
                r37("Crazy Line", "Released all players!", 3);
                r212 = false;
                v2 = r36.CrazyLine;
                v2.SetValue(v2, false);
                return; 
            end);
        else
            if r213 then
                task.cancel(r213);
            end;
            n = r25;
            v2 = n[3];
            o = n[2];
            for v2, n in ipairs(n.GetPlayers(n)) do
                J = v2;
                v3 = v1;
                if n ~= r26 and n.Character then
                    v4 = n.Character;
                    r220 = v4.FindFirstChild(v4, "Head");
                    if r220 then
                        pcall(function(...)
                            v3 = Q[Qn];
                            v3.FireServer(v3, r220);
                            return; 
                        end);
                    end;
                end; 
            end;
            r37("Crazy Line", "Stopped!", 2);
            return;
        end; 
    end
});
q5.AddSlider(q5, "CrazyLineSpeed", {
    ["Text"] = "Line Update Speed",
    ["Min"] = 0,
    ["Max"] = 1,
    ["Default"] = .05,
    ["Rounding"] = 2,
    ["Suffix"] = "s",
    ["Callback"] = function(arg1_81, ...)
        r214 = arg1_81;
        return; 
    end
});
q5.AddLabel(q5, "0 = Max Speed | 1 = Slow");
vm28 = l.Target;
vm72 = vm28.AddLeftGroupbox(vm28, "Figure Grab Settings", "hand");
vm72.AddDropdown(vm72, "FG_TargetPart", {
    ["Text"] = "Target Part",
    ["Values"] = {
        "Torso",
        "Head",
        "Left Arm",
        "Right Arm",
        "Left Leg",
        "Right Leg"
    },
    ["Default"] = 1
});
vm72.AddLabel(vm72, "Rotation");
vm72.AddInput(vm72, "FG_RotX", {
    ["Text"] = "X",
    ["Default"] = "0"
});
vm72.AddInput(vm72, "FG_RotY", {
    ["Text"] = "Y",
    ["Default"] = "0"
});
vm72.AddInput(vm72, "FG_RotZ", {
    ["Text"] = "Z",
    ["Default"] = "0"
});
vm72.AddLabel(vm72, "Position");
vm72.AddInput(vm72, "FG_PosX", {
    ["Text"] = "X",
    ["Default"] = "0"
});
vm72.AddInput(vm72, "FG_PosY", {
    ["Text"] = "Y",
    ["Default"] = "0"
});
vm72.AddInput(vm72, "FG_PosZ", {
    ["Text"] = "Z",
    ["Default"] = "-4"
});
vm72.AddLabel(vm72, "Presets");
vm72.AddDropdown(vm72, "FG_Presets", {
    ["Text"] = "Presets",
    ["Values"] = {
        "---"
    },
    ["Default"] = 1
});
vm72.AddButton(vm72, {
    ["Text"] = "Save Preset",
    ["Func"] = function(...)
        return; 
    end
});
vm72.AddButton(vm72, {
    ["Text"] = "Load Preset",
    ["Func"] = function(...)
        return; 
    end
});
vm72.AddButton(vm72, {
    ["Text"] = "Delete Preset",
    ["Func"] = function(...)
        return; 
    end
});
r221 = {
    ["autoSitActive"] = false,
    ["loopKickBlobActive"] = false,
    ["loopAppleActive"] = false,
    ["blobLockRunning"] = false,
    ["blobLockBlob"] = nil,
    ["blobLockTime"] = 0,
    ["blobLockStartPos"] = nil,
    ["blobLockLastTP"] = 0
};
local function r222(...)
    X = r15;
    e = r16("\xe2;\xeb\x82\xcb\x8e\x97\xa2T R\x8d\x0b", 14785842060005);
    while r221[X[e]] do
        X = r26.Character;
        if X then
            i = X.FindFirstChild(X, "HumanoidRootPart");
        end;
        r223 = X;
        e = X and X.FindFirstChild(X, "Humanoid");
        if not r223 or not e then
            task.wait(1);
        else
            if e.SeatPart then
                task.wait(0.5);
            else
                v4 = "SpawnedInToys";
                v3 = r31;
                v2 = v3.FindFirstChild(v3, r26.Name .. v4);
                n = v2 and v2.FindFirstChild(v2, "CreatureBlobman");
                if not n then
                    task.spawn(function(...)
                        pcall(function(...)
                            v3 = r29.MenuToys.SpawnToyRemoteFunction;
                            v3.InvokeServer(v3, "CreatureBlobman", r223.CFrame, Vector3.zero);
                            return; 
                        end);
                        return; 
                    end);
                    v3 = not v2;
                    if v3 then
                        v3 = Q[a];
                        v3.WaitForChild(v3, v1.Name .. v4, 5);
                    end;
                    if v2 then
                        n = v2.WaitForChild(v2, "CreatureBlobman", 5);
                    end;
                end;
                if n then
                    w = 5;
                    v4 = n.WaitForChild(n, "VehicleSeat", w);
                    if v4 then
                        w = tick();
                        K = e.SeatPart == v4 or (tick() - w > 1.5 or not r221.autoSitActive);
                        repeat
                            
                        until not e.SeatPart;
                        r223.CFrame = v4.CFrame + Vector3.new(0, 1, 0);
                        r223.Velocity = Vector3.zero;
                        v4.Sit(v4, e);
                        K = r30.Heartbeat;
                        K.Wait(K);
                        v3 = not n;
                        if e.SeatPart == v4 or (tick() - w > 1.5 or not r221.autoSitActive) then
                            task.wait(0.5);
                        end;
                    end;
                end;
            end;
        end; 
    end;
    return; 
end;
local function r224(arg1_82, ...)
    v3 = r29;
    i = v3.WaitForChild(v3, "GrabEvents");
    i.WaitForChild(i, "SetNetworkOwner");
    v3 = r25;
    J = v3.FindFirstChild(v3, arg1_82);
    if not J then
        return;
    end;
    n = r15;
    e = r26.Character;
    i = e;
    if e then
        r225 = e.WaitForChild(e, "HumanoidRootPart");
        n = e.WaitForChild(e, "Humanoid").SeatPart;
        if not n or (not J or J == r26) then
            return;
        end;
        v4 = n.Parent;
        K = J.Character;
        i = K;
        if K then
            r226 = K.WaitForChild(K, "HumanoidRootPart");
            r227 = v4.WaitForChild(v4, "LeftDetector");
            v3 = r227;
            r228 = v3.WaitForChild(v3, "LeftWeld");
            v3 = v4.BlobmanSeatAndOwnerScript;
            r229 = v3.WaitForChild(v3, "CreatureGrab");
            r230 = r225.CFrame;
            r225.CFrame = r226.CFrame * CFrame.new(0, 0, 2.5);
            task.wait();
            v3 = r229;
            v3.FireServer(v3, r227, r226, r228);
            task.delay(.1, function(...)
                v3 = r229;
                v3.FireServer(v3, r227, r226, r228);
                return; 
            end);
            task.delay(.2, function(...)
                r225.CFrame = r230;
                return; 
            end);
            return;
        else
            K = v3.FindFirstChild(v3, v1).CharacterAdded;
            i = K.Wait(K);
        end;
    else
        e = r26.CharacterAdded;
        i = e.Wait(e);
    end; 
end;
local function r231(arg1_83, ...)
    v3 = r25;
    X = v3.FindFirstChild(v3, arg1_83);
    if not X then
        return;
    end;
    v2 = r15;
    J = r26.Character;
    i = J;
    if J then
        J.WaitForChild(J, "HumanoidRootPart");
        v2 = J.WaitForChild(J, "Humanoid").SeatPart;
        if v2 then
            if X then
                n = v3.FindFirstChild(v3, v1) ~= r26;
            end;
            i = X;
            v3 = e[r15[v4]];
        end;
        if v2 then
            n = v2.Parent;
            v4 = v3.FindFirstChild(v3, v1).Character;
            i = v4;
            if v4 then
                v4 = "BlobmanSeatAndOwnerScript";
                K = v4.WaitForChild(v4, "HumanoidRootPart");
                w = n.WaitForChild(n, "LeftDetector");
                a = w.WaitForChild(w, "LeftWeld");
                v3 = n.BlobmanSeatAndOwnerScript;
                t = v3.WaitForChild(v3, "CreatureGrab");
                v3 = n.BlobmanSeatAndOwnerScript;
                v5 = v3.WaitForChild(v3, "CreatureDrop");
                o.CFrame = K.CFrame * CFrame.new(0, 0, 3);
                task.wait(0);
                t.FireServer(t, w, K, a);
                task.wait(0);
                v5.FireServer(v5, a, K);
                task.wait(0);
                t.FireServer(t, w, K, a);
                F = Instance.new("BodyPosition");
                F.Position = Vector3.new(0, math.huge, 0);
                F.MaxForce = Vector3.new(0, math.huge, 0);
                F.Parent = K;
                task.wait(0);
                t.FireServer(t, w, K, a);
                F.Destroy(F);
                o.CFrame = o.CFrame;
                return;
            else
                v4 = v3.FindFirstChild(v3, v1).CharacterAdded;
                i = v4.Wait(v4);
            end;
        end;
    else
        J = r26.CharacterAdded;
        i = J.Wait(J);
    end; 
end;
local function r232(arg1_84, ...)
    v3 = r25;
    X = v3.FindFirstChild(v3, arg1_84);
    if not X or X == r26 then
        return;
    end;
    v2 = r15;
    n = r16;
    o = "Character";
    J = r26[o];
    i = J;
    if J then
        o = J.WaitForChild(J, "HumanoidRootPart");
        v2 = J.WaitForChild(J, "Humanoid").SeatPart;
        if not v2 then
            return;
        end;
        v5 = "\xcbd4\xedOD\x18\xad\x1b";
        n = v2.Parent;
        w = r15;
        a = r16;
        t = a(v5, 17723429609533);
        v4 = X[w[t]];
        i = v4;
        if v4 then
            w = i.WaitForChild(i, "HumanoidRootPart");
            a = n.WaitForChild(n, "LeftDetector");
            t = a.WaitForChild(a, "LeftWeld");
            v5 = n.WaitForChild(n, "RightDetector");
            v5.WaitForChild(v5, "RightWeld");
            v3 = n.BlobmanSeatAndOwnerScript;
            F = v3.WaitForChild(v3, "CreatureGrab");
            v3 = n.BlobmanSeatAndOwnerScript;
            Y = v3.WaitForChild(v3, "CreatureDrop");
            u = o.CFrame;
            o.CFrame = w.CFrame * CFrame.new(0, -5, 0);
            task.wait(.1);
            F.FireServer(F, a, w, t);
            task.wait(0.5);
            Y.FireServer(Y, t, w);
            task.wait(.2);
            W = Instance.new("BodyPosition");
            W.Position = Vector3.new(0, 999000000, 0);
            W.MaxForce = Vector3.new(999000000, 999000000, 999000000);
            W.Parent = w;
            F.FireServer(F, a, w, t);
            task.wait(0.5);
            Y.FireServer(Y, t, w);
            v3 = task.wait;
            v3(0.5);
            i = X;
            while not X do
                if X then
                    if v4.WaitForChild(v4, "Humanoid").Health > 0 then
                        F.FireServer(F, n.WaitForChild(n, "LeftDetector"), w, t);
                        task.wait();
                        Y.FireServer(Y, t, w);
                        task.wait();
                        F.FireServer(F, n.WaitForChild(n, "RightDetector"), w, v6);
                        task.wait();
                        Y.FireServer(Y, v6, w);
                        task.wait();
                    else
                    end;
                end;
                if W then
                    W.Destroy(W);
                    break;
                end;
                J.WaitForChild(J, "HumanoidRootPart").CFrame = o.CFrame;
                return; 
            end;
            i = X.Parent and i.WaitForChild(i, "Humanoid").Health > 0;
            v3 = v3;
        else
            v4 = v3.FindFirstChild(v3, v1).CharacterAdded;
            i = v4.Wait(v4);
        end;
    else
        J = r26.CharacterAdded;
        i = J.Wait(J);
    end; 
end;
local function r233(arg1_85, ...)
    v3 = r25;
    X = v3.FindFirstChild(v3, arg1_85);
    if not X or X == r26 then
        return;
    end;
    v2 = r15;
    o = "Character";
    J = r26[o];
    i = J;
    if J then
        o = i.WaitForChild(i, "Humanoid").SeatPart;
        if not o then
            return;
        end;
        v2 = o.Parent;
        w = r16;
        n = X.Character;
        i = n;
        if n then
            i.WaitForChild(i, "HumanoidRootPart");
            w = v2.WaitForChild(v2, "LeftDetector");
            w.WaitForChild(w, "LeftWeld");
            v3 = v2.BlobmanSeatAndOwnerScript;
            v3.WaitForChild(v3, "CreatureGrab");
            v3 = v2.BlobmanSeatAndOwnerScript;
            v3.WaitForChild(v3, "CreatureDrop");
            v3 = task.wait;
            v3(.05);
            while not X do
                if X then
                    for M = 1, 20 do
                        t.FireServer(t, v2.WaitForChild(v2, "LeftDetector"), n.WaitForChild(n, "HumanoidRootPart"), w.WaitForChild(w, "LeftWeld")); 
                    end;
                    v5.FireServer(v5, a, K);
                    v5.FireServer(v5, a, K);
                    task.wait(.01);
                    if not r36.LoopAppleMethod.Value then
                        break;
                    else
                    end;
                end;
                return; 
            end;
            i = X.Parent and (i.WaitForChild(i, "Humanoid").Health > 0 and r36.LoopAppleMethod.Value);
            v3 = v3;
        else
            n = v3.FindFirstChild(v3, v1).CharacterAdded;
            i = n.Wait(n);
        end;
    else
        J = r26.CharacterAdded;
        i = J.Wait(J);
    end; 
end;
local function r234(arg1_86, ...)
    v1 = arg1_86;
    local function J(arg1_87, arg2_87, arg3_87, ...)
        v1 = arg1_87;
        X = arg2_87;
        e = v1.FindFirstChild(v1, X);
        if e then
            return e;
        else
            v2 = r26;
            i = v1.WaitForChild(v1, X, arg3_87 or 3);
        end; 
    end;
    local function e(arg1_88, ...)
        v1 = arg1_88;
        v3 = r29.GrabEvents.SetNetworkOwner;
        v3.FireServer(v3, v1, v1.CFrame);
        return; 
    end;
    local function o(arg1_89, arg2_89, arg3_89, arg4_89, ...)
        J = arg3_89;
        v1 = arg1_89;
        o = v1.FindFirstChild(v1, J .. "Detector");
        if not o then
            return;
        end;
        v3 = arg4_89 == "Default";
        if v3 then
            v3 = v1.BlobmanSeatAndOwnerScript.CreatureGrab;
            v3.FireServer(v3, o, arg2_89, o[J .. "Weld"]);
        else
            v3 = arg4_89 == "Release";
            if v3 then
                v3 = v1.BlobmanSeatAndOwnerScript.CreatureRelease;
                v3.FireServer(v3, v1.FindFirstChild(v1, J .. "Detector")[arg3_89 .. "Weld"], arg2_89);
            end;
            return;
        end; 
    end;
    v3 = true;
    while v3 do
        v4 = r26.Character;
        i = v4;
        if v4 then
            v4 = v4;
            if (function(arg1_90, arg2_90, arg3_90, ...)
                v1 = arg1_90;
                X = arg2_90;
                e = v1.FindFirstChild(v1, X);
                if e then
                    return e;
                else
                    v2 = r26;
                    i = v1.WaitForChild(v1, X, arg3_90 or 3);
                end; 
            end)(v4, "Humanoid").SeatPart then
                n = J(v4, "Humanoid").SeatPart.Parent;
            else
                task.wait();
            end;
        else
            v4 = r26.CharacterAdded;
            i = v4.Wait(v4);
        end; 
    end;
    while not true do
        v3 = v3;
        if v2 then
            v4 = v3;
            K = r26.Character;
            i = K;
            if K then
                v3 = v3;
                v4 = not a;
                J(v4, "HumanoidRootPart");
                a = J(v4, "Humanoid").SeatPart;
                if not a then
                    v2 = false;
                    break;
                else
                    u = r25;
                    a = u.FindFirstChild(u, arg1_86);
                    if not a then
                        
                    else
                        t = a.Character;
                        if not t then
                            
                        else
                            v5 = J(t, "Humanoid", 2);
                            if v5 then
                                W = u;
                            end;
                            v3 = v3;
                            if not v5 then
                                
                            else
                                if v5.Health == 0 then
                                    u = a.CharacterAdded;
                                    t = u.Wait(u);
                                    v5 = J(t, "Humanoid", 2);
                                    task.wait(.15);
                                    if v5 then
                                        S = s;
                                    end;
                                    v3 = v3;
                                    if not v5 then
                                        
                                    else
                                    end;
                                end;
                                E = r15;
                                S = v3;
                                F = nil.FindFirstChild(nil, "LeftDetector");
                                if F then
                                    D = F.FindFirstChild(F, "LeftWeld");
                                end;
                                v3 = S;
                                S = v3;
                                if F then
                                    D = F;
                                end;
                                if F then
                                    S = S;
                                    E = F.Attachment0 ~= J(t, r15[S], 2).RootAttachment;
                                    while not E do
                                        v3 = S;
                                        if E then
                                            D = J(v4, "HumanoidRootPart").CFrame;
                                            for E = 1, 4 do
                                                S = E;
                                                if not J(v4, "Humanoid").SeatPart then
                                                    v2 = false;
                                                else
                                                    J(v4, "HumanoidRootPart").CFrame = v6.CFrame - Vector3.new(0, 10, 0);
                                                    o(nil, v6, "Left", "Default");
                                                    task.wait(.05);
                                                    o(nil, v6, "Left", "Release");
                                                    v5.Health = 0;
                                                    task.wait();
                                                end; 
                                            end;
                                            if not true then
                                                
                                            else
                                                J(v4, "HumanoidRootPart").CFrame = K[r15[r16(b, R)]];
                                            end;
                                        end; 
                                    end;
                                    D = true;
                                end;
                            end;
                        end;
                    end;
                end;
            else
                K = r26.CharacterAdded;
                i = K.Wait(K);
            end;
        end;
        return; 
    end;
    task.wait(); 
end;
local function r235(arg1_91, ...)
    r236 = arg1_91;
    r237 = r26;
    local function r238(arg1_92, arg2_92, arg3_92, ...)
        v1 = arg1_92;
        X = arg2_92;
        e = v1.FindFirstChild(v1, X);
        if e then
            return e;
        else
            v2 = r26;
            i = v1.WaitForChild(v1, X, arg3_92 or 3);
        end; 
    end;
    local function r239(arg1_93, ...)
        v1 = arg1_93;
        v3 = r29.GrabEvents.SetNetworkOwner;
        v3.FireServer(v3, v1, v1.CFrame);
        return; 
    end;
    local function r240(arg1_94, arg2_94, arg3_94, arg4_94, ...)
        J = arg3_94;
        v1 = arg1_94;
        o = v1.FindFirstChild(v1, J .. "Detector");
        if not o then
            return;
        end;
        v3 = arg4_94 == "Default";
        if v3 then
            v3 = v1.BlobmanSeatAndOwnerScript.CreatureGrab;
            v3.FireServer(v3, o, arg2_94, o[J .. "Weld"]);
        else
            v3 = arg4_94 == "Release";
            if v3 then
                v3 = v1.BlobmanSeatAndOwnerScript.CreatureRelease;
                v3.FireServer(v3, v1.FindFirstChild(v1, J .. "Detector")[arg3_94 .. "Weld"], arg2_94);
            end;
            return;
        end; 
    end;
    while true do
        n = r237.Character;
        i = n;
        if n then
            n = "SeatPart";
            if r238(n, "Humanoid").SeatPart then
                r241 = Q[J](n, "Humanoid").SeatPart.Parent;
            else
                task.wait();
            end;
        else
            n = r237.CharacterAdded;
            i = n.Wait(n);
        end; 
    end;
    local function n(...)
        v4 = 32192133724814;
        X = r237;
        n = "\x1d\x81?\xce\xae\xb2+sx";
        e = r15;
        o = r16;
        v2 = o(n, v4);
        J = e[v2];
        v1 = X[J];
        i = v1;
        if v1 then
            v1 = X.CFrame;
            X = r238(v1, "HumanoidRootPart");
            J = r238(v1, "Humanoid");
            if not J.SeatPart then
                return false;
            end;
            v3 = r25;
            e = v3.FindFirstChild(v3, r236);
            if not e then
                return false;
            end;
            o = e.Character;
            if not o then
                return false;
            end;
            v2 = o.FindFirstChild(o, "Humanoid");
            v3 = o.FindFirstChild(o, "HumanoidRootPart");
            n = true;
            if v2 then
                i = v3;
            end;
            v3 = v3;
            if not v2 then
                return false;
            end;
            v3 = r241;
            v4 = v3.FindFirstChild(v3, "LeftDetector");
            if v4 then
                i = v4.FindFirstChild(v4, "LeftWeld");
            end;
            w = v3;
            if v4 then
                i = v4;
            end;
            v3 = w;
            if not v4 then
                return false;
            end;
            task.spawn(r239, n);
            task.wait(.1);
            for a = 1, 3 do
                F = a;
                if not J.SeatPart then
                    return false;
                else
                    r238(v1, "HumanoidRootPart").CFrame = n.CFrame * CFrame.new(0, 0, -2.5);
                    r240(r241, n, "Left", "Default");
                    task.wait(.08);
                    r240(r241, n, "Left", "Release");
                    v2.Health = v2.MaxHealth;
                    task.wait(.08);
                end; 
            end;
            X.CFrame = X.CFrame;
            return true;
        else
            v1 = r237.CharacterAdded;
            i = v1.Wait(v1);
        end; 
    end;
    if not n() then
        task.wait(0.5);
        n();
    end;
    return; 
end;
r242 = {
    ["MyBlob"] = nil,
    ["Running"] = false,
    ["Time"] = 0,
    ["StartPos"] = nil,
    ["LastTP"] = 0
};
local function r243(arg1_95, ...)
    v1 = arg1_95;
    if v1 then
        v3 = Q[X];
        i = v1.IsDescendantOf(v1, r31) and v1.GetNetworkOwner(v1) == r26;
    end;
    return v1; 
end;
r242.TPToTargetAndBack = function(arg1_96, arg2_96, ...)
    X = arg2_96;
    v1 = arg1_96;
    J = r26.Character;
    if not J then
        return;
    end;
    e = J.FindFirstChild(J, "HumanoidRootPart");
    if not e then
        return;
    end;
    v1.StartPos = e.CFrame;
    e.CFrame = X.CFrame + Vector3.new(0, 5, 0);
    task.wait(.05);
    for o = 1, 3 do
        K = o;
        v3 = r29.GrabEvents.SetNetworkOwner;
        v3.FireServer(v3, X, X.CFrame);
        task.wait(); 
    end;
    task.wait(.1);
    e.CFrame = v1.StartPos;
    v1.LastTP = tick();
    return; 
end;
r242.Start = function(arg1_97, arg2_97, ...)
    r244 = arg1_97;
    r245 = arg2_97;
    if r244.Running then
        return;
    end;
    r244.Running = true;
    r221.blobLockRunning = true;
    task.spawn(function(...)
        v3 = r25;
        v1 = v3.FindFirstChild(v3, r245);
        v3 = not v1;
        if v3 then
            v3 = r244;
            v3.Stop(v3);
            return;
        end;
        r246 = v1.Character;
        v3 = not r246;
        if v3 then
            v3 = v1.CharacterAdded;
            v3.Wait(v3);
            task.wait(0.5);
            r246 = v1.Character;
        end;
        e = r246;
        i = e;
        if e then
            e = r246;
            i = e.FindFirstChild(e, "HumanoidRootPart");
        end;
        v3 = v3;
        J = e.Running;
        if J then
            i = r244;
            i.TPToTargetAndBack(i, J);
        end;
        e = r244;
        v2 = r15;
        while e.Running do
            task.wait();
            e = r26.Character;
            if not e then
                
            end;
            v2 = e.FindFirstChild(e, "Humanoid");
            v3 = v3;
            if not e.FindFirstChild(e, "HumanoidRootPart") or not v2 then
                
            else
                i = not v2.SeatPart;
                if i then
                    i = r244;
                    i.Stop(i);
                    break;
                else
                    if e.FindFirstChild(e, r15[v5]).SeatPart then
                        r244.MyBlob = e.FindFirstChild(e, r15[v5]).SeatPart.Parent;
                    end;
                    i = r25;
                    v1 = i.FindFirstChild(i, r245);
                    i = not v1;
                    if i then
                        i = r244;
                        i.Stop(i);
                        break;
                    else
                        r246 = v1.Character;
                        if not r246 then
                            
                        else
                            a = r246;
                            r247 = a.FindFirstChild(a, "Humanoid");
                            a = r246;
                            r248 = a.FindFirstChild(a, "HumanoidRootPart");
                            v3 = w;
                            if not r247 or not r248 then
                                
                            else
                                if r247.Health == 0 then
                                    
                                else
                                    t = v3;
                                    a = (e.FindFirstChild(e, "HumanoidRootPart").Position - r248.Position).Magnitude > 15 and tick() - r244.LastTP > 0.5;
                                    v3 = t;
                                    if a then
                                        a = r244;
                                        a.TPToTargetAndBack(a, r248);
                                    end;
                                    v3 = v3;
                                    if r244.MyBlob and r244.MyBlob.Parent then
                                        task.defer(function(...)
                                            if r243(r248) then
                                                if tick() - r244.Time > 0.5 then
                                                    r247.Sit = true;
                                                    task.wait(.16);
                                                    r247.Sit = false;
                                                    r244.Time = tick();
                                                end;
                                                v3 = r244.MyBlob;
                                                v1 = v3.FindFirstChild(v3, "LeftDetector");
                                                if v1 then
                                                    r248.CFrame = v1.CFrame;
                                                end;
                                                e = r246;
                                                X = e[2];
                                                e = e[1];
                                                for J, v2 in pairs(e.GetChildren(e)) do
                                                    o = J;
                                                    if v2.IsA(v2, "BasePart") then
                                                        v2.Velocity = Vector3.new();
                                                    end; 
                                                end;
                                            end;
                                            return; 
                                        end);
                                        a = r244.MyBlob;
                                        t = a.FindFirstChild(a, "LeftDetector");
                                        if t then
                                            v5 = a.BlobmanSeatAndOwnerScript.CreatureGrab;
                                            v6 = a.BlobmanSeatAndOwnerScript.CreatureRelease;
                                            v5.FireServer(v5, t, r248, t.LeftWeld);
                                            task.wait(.005);
                                            v6.FireServer(v6, t.LeftWeld, r248);
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
    end);
    return; 
end;
r242.Stop = function(arg1_98, ...)
    v1 = arg1_98;
    v1.Running = false;
    v1.MyBlob = nil;
    r221.blobLockRunning = false;
    return; 
end;
ln.AddToggle(ln, "AutoSitBlobmanToggle", {
    ["Text"] = "Auto Sit Blobman",
    ["Default"] = false,
    ["Callback"] = function(arg1_99, ...)
        v1 = arg1_99;
        r221.autoSitActive = v1;
        if v1 then
            task.spawn(r222);
        end;
        return; 
    end
});
ln.AddDropdown(ln, "BM_MethodSelect", {
    ["Text"] = "Selected Method",
    ["Values"] = {
        "Bring",
        "Loop Kick",
        "Bypass",
        "Kick",
        "Loop Kick (Grab+Blob)",
        "Blob Kill",
        "Lock"
    },
    ["Default"] = "Bring",
    ["Callback"] = function(arg1_100, ...)
        v1 = arg1_100;
        return; 
    end
});
ln.AddButton(ln, {
    ["Text"] = "Apply Method Once",
    ["Func"] = function(...)
        v1 = r56 and r56.Name;
        X = r35.BM_MethodSelect.Value;
        if v1 then
            i = v1 ~= "";
        end;
        if v1 then
            if X == "Bring" then
                r224(r56 and r56.Name);
            else
                if v3 == "Kick" then
                    r231(r56 and r56.Name);
                else
                    if v3 == "Loop Kick" then
                        r232(r56 and r56.Name);
                    else
                        if v3 == "Bypass" then
                            r233(r56 and r56.Name);
                        else
                            if v3 == "Loop Kick (Grab+Blob)" then
                                r221.loopKickBlobActive = true;
                            else
                                if v3 == "Blob Kill" then
                                    r234(r56 and r56.Name);
                                else
                                    v3 = v3 == "Lock";
                                    if v3 then
                                        v3 = r242;
                                        v3.Start(v3, r56 and r56.Name);
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        else
            r37("Error", "Select target first!", 3);
        end;
        return; 
    end,
    ["DoubleClick"] = false
});
ln.AddButton(ln, {
    ["Text"] = "Destroy Visual (Try 2 Times)",
    ["Func"] = function(...)
        v1 = r56 and r56.Name;
        if v1 then
            i = v1 ~= "";
        end;
        if v1 then
            r235(v1);
        else
            r37("Error", "Select target first!", 3);
        end;
        return; 
    end,
    ["DoubleClick"] = false
});
ln.AddToggle(ln, "LoopAppleMethod", {
    ["Text"] = "Loop Apple Method",
    ["Default"] = false,
    ["Callback"] = function(arg1_101, ...)
        v3 = r221;
        v1 = arg1_101;
        v3.loopAppleActive = v1;
        if v1 then
            r249 = r56 and r56.Name;
            r250 = r35.BM_MethodSelect.Value;
            if r249 and r249 ~= "" then
                task.spawn(function(...)
                    if r250 == "Lock" then
                        v3 = r242;
                        v3.Start(v3, r249);
                        v1 = r36.LoopAppleMethod.Value;
                        i = r242.Running;
                        while not v1 do
                            if v1 then
                                task.wait(.1);
                            end;
                            v3 = r242;
                            v3.Stop(v3);
                            break; 
                        end;
                        i = r242.Running;
                    else
                        while r36.LoopAppleMethod.Value do
                            if r250 == "Bring" then
                                r224(r249);
                            else
                                if r250 == "Kick" then
                                    r231(r249);
                                else
                                    if r250 == "Loop Kick" then
                                        r232(r249);
                                    else
                                        if r250 == "Bypass" then
                                            r233(r249);
                                        else
                                            if r250 == "Blob Kill" then
                                                r234(r249);
                                            end;
                                            task.wait(1);
                                        end;
                                    end;
                                end;
                            end; 
                        end;
                        return;
                    end; 
                end);
            else
                v3 = r36.LoopAppleMethod;
                v3.SetValue(v3, false);
                r37("Error", "Select target first!", 3);
            end;
        else
            r221.loopKickBlobActive = false;
            v3 = r242;
            v3.Stop(v3);
        end;
        return; 
    end
});
r251 = {
    ["Active"] = false,
    ["Intensity"] = 50,
    ["Task"] = nil,
    ["MonitorTask"] = nil,
    ["TargetToggles"] = {}
};
local function r252(...)
    v3 = r29;
    v1 = v3.WaitForChild(v3, "GrabEvents");
    r253 = v1.WaitForChild(v1, "SetNetworkOwner");
    while r251.Active do
        J = r56;
        if J then
            i = J.Parent and J.Character;
            v3 = r56;
        end;
        if J then
            v3 = J.Character;
            r254 = v3.FindFirstChild(v3, "HumanoidRootPart");
            if r254 then
                for o = 1, r251.Intensity do
                    K = o;
                    if not r251.Active then
                        
                    else
                        pcall(function(...)
                            v3 = r253;
                            o = r15;
                            v3.FireServer(v3, r254, r254.CFrame);
                            return; 
                        end);
                    end; 
                end;
            end;
        end;
        task.wait(.1); 
    end;
    return; 
end;
local function r255(...)
    e = r251;
    J = e.TargetToggles;
    v1 = e[2];
    X = e[3];
    for X, o in pairs("pairs") do
        if r36[X] and r36[X].Value then
            return true;
        else
            
        end; 
    end;
    return false; 
end;
local function r256(...)
    v1 = r255();
    if v1 then
        i = not r251.Active;
    end;
    if v1 then
        r251.Active = true;
        r251.Task = task.spawn(r252);
        r37("Toxin Lag", "Auto-enabled! Intensity: " .. r251.Intensity, 3);
    else
        if not v3() and r251.Active then
            r251.Active = false;
            if r251.Task then
                task.cancel(r251.Task);
                r251.Task = nil;
            end;
            r37("Toxin Lag", "Auto-disabled!", 2);
        end;
        return;
    end; 
end;
local function r257(arg1_102, ...)
    r258 = arg1_102;
    r251.TargetToggles[r258] = true;
    task.spawn(function(...)
        while true do
            v1 = r258;
            if r36[v1] then
                v1 = r36[r258].Value;
                X = not r36[r258];
                i = X;
                if X then
                    task.wait(.1);
                    if not r36[r258] or r36[r258].Value ~= v1 then
                        if r36[r258] then
                            r256();
                        else
                            
                        end;
                        return;
                    end;
                else
                    i = r36[r258].Value ~= v1;
                end;
            else
            end; 
        end; 
    end);
    return; 
end;
vm35 = l.Target;
vm92 = vm35.AddRightGroupbox(vm35, "Toxin Lag", "zap");
vm92.AddToggle(vm92, "EnableToxinLag", {
    ["Text"] = "Enable Lag (Toxin)",
    ["Default"] = false,
    ["Callback"] = function(arg1_103, ...)
        if arg1_103 then
            if not r56 then
                v3 = r36.EnableToxinLag;
                v3.SetValue(v3, false);
                r37("Error", "Select target first!", 3);
                return;
            end;
            r251.Active = true;
            r251.Task = task.spawn(r252);
            r37("Toxin Lag", "Manual ON! Intensity: " .. r251.Intensity, 3);
        else
            r251.Active = false;
            if r251.Task then
                task.cancel(r251.Task);
                r251.Task = nil;
            end;
            r37("Toxin Lag", "Manual OFF!", 2);
            return;
        end; 
    end
});
vm92.AddSlider(vm92, "ToxinIntensity", {
    ["Text"] = "Lag Intensity",
    ["Min"] = 1,
    ["Max"] = 150,
    ["Default"] = 50,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_104, ...)
        r251.Intensity = arg1_104;
        return; 
    end
});
vm92.AddLabel(vm92, "\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81");
vm92.AddLabel(vm92, "Auto-enables when any");
vm92.AddLabel(vm92, "Target function is active");
task.spawn(function(...)
    task.wait(1);
    e = "RemoveAntiKickToggle";
    v1 = {
        "TraceToggle",
        "DestroyGucciToggle",
        "RemoveAllAntiInputToggle",
        "TargetNotifyToggle",
        e,
        "AutoSitBlobmanToggle",
        "OwnershipKickToggle",
        "LoopKillToggle",
        "SnowballRagdollToggle",
        "PalletRagdollToggle",
        "LoopKickV2",
        "LoopKickV3",
        "LoopKickV4",
        "UnlimitedKick911",
        ("KickAuraBlobman")("AutoSitBlobmanToggle"),
        "LoopAppleMethod"
    };
    J = e[3];
    e = e[1];
    for J, v2 in e, ipairs(v1) do
        o = J;
        r257(v2); 
    end;
    print("\xe2\x9c\x85 Toxin Lag: Monitoring " .. #v1 .. " Target toggles");
    return; 
end);
r251.MonitorTask = task.spawn(function(...)
    while true do
        task.wait(0.5);
        if r36.EnableToxinLag and r36.EnableToxinLag.Value then
        else
            r256();
        end; 
    end;
    return; 
end);
vm35 = l.LocalPlayer;
vm30 = vm35.AddLeftGroupbox(vm35, "Defence", "shield");
r259 = Vector3.new(-514.3, 12.3, -137);
vm30.AddToggle(vm30, "GoToHomeToggle", {
    ["Text"] = "Go To Home",
    ["Default"] = false,
    ["Callback"] = function(arg1_105, ...)
        v1 = arg1_105;
        _G.GoToHome = v1;
        if v1 then
            task.spawn(function(...)
                while _G.GoToHome do
                    v3 = r26.Character;
                    if v3 then
                        X = not r26.InPlot;
                    end;
                    v3 = v3;
                    if v3 or r26.InPlot then
                        X = v3.FindFirstChild(v3, "HumanoidRootPart");
                        if X then
                            X.CFrame = CFrame.new(r259);
                            X.Anchored = false;
                        end;
                    end;
                    task.wait(); 
                end;
                return; 
            end);
        end;
        return; 
    end
});
vm30.AddToggle(vm30, "PlotBarriersToggle", {
    ["Text"] = "Anti Barrier",
    ["Default"] = false,
    ["Callback"] = function(arg1_106, ...)
        v1 = arg1_106;
        v3 = r31;
        X = v3.FindFirstChild(v3, "Plots");
        if not X then
            return;
        end;
        v2 = X.GetChildren;
        o = {
            v2(X)
        };
        e = v2[3];
        o = v2[1];
        for e, n in o, ipairs(T(o)) do
            v2 = e;
            if n.FindFirstChild(n, "Barrier") then
                v5 = v4.GetChildren;
                w = v5[2];
                K = v5[1];
                for a, v5 in ipairs(v5(v4)) do
                    t = a;
                    if v5.IsA(v5, "BasePart") and v5.Name == "PlotBarrier" then
                        v5.CanCollide = not arg1_106;
                    end; 
                end;
            end; 
        end;
        return; 
    end
});
r260 = false;
local function r262(...)
    r261 = task.spawn(function(...)
        while r260 do
            if r26.Character then
                X = v1.FindFirstChildOfClass(v1, "Humanoid");
                i = "task";
                if X then
                    i = X.Health < 10;
                end;
                if i then
                    X.Health = 0;
                    task.wait(3);
                end;
                task.wait(.1);
            end; 
        end;
        return; 
    end);
    return; 
end;
vm30.AddToggle(vm30, "KillDodgeToggle", {
    ["Text"] = "Kill Dodge",
    ["Default"] = false,
    ["Callback"] = function(arg1_107, ...)
        v1 = arg1_107;
        r260 = v1;
        if v1 then
            r262();
        else
            if r261 then
                task.cancel(r261);
            end;
            return;
        end; 
    end
});
r263 = false;
r264 = {};
local function r265(...)
    if r263 then
        X = r31.DescendantAdded;
        table.insert(r264, X.Connect(X, function(arg1_108, ...)
            r266 = arg1_108;
            if r263 and r266.Name == "CreatureBlobman" then
                pcall(function(...)
                    v3 = r266.LeftDetector;
                    v3.Destroy(v3);
                    v3 = r266.RightDetector;
                    v3.Destroy(v3);
                    return; 
                end);
            end;
            return; 
        end));
    else
        J = r264;
        X = 641[3];
        J = 641[1];
        for X, o in J, ipairs(J) do
            o.Disconnect(o); 
        end;
        r264 = {};
        return;
    end; 
end;
vm30.AddToggle(vm30, "AntiRagBlobToggle", {
    ["Text"] = "Anti Ragdoll on Blob",
    ["Default"] = false,
    ["Callback"] = function(arg1_109, ...)
        r263 = arg1_109;
        r265();
        return; 
    end
});
r267 = false;
local function r269(...)
    r268 = task.spawn(function(...)
        while r267 do
            v1 = r26.Character;
            if v1 then
                r270 = v1.FindFirstChild(v1, "HumanoidRootPart");
                if r270 then
                    o = r31;
                    J = o[2];
                    o = o[1];
                    for e, n in ipairs(o.GetChildren(o)) do
                        v2 = e;
                        K = n.IsA(n, "Model");
                        if K then
                            K = n.Name;
                            v4 = K.find(K, "Toy");
                        end;
                        if K then
                            r271 = n.PrimaryPart or n.FindFirstChildWhichIsA(n, "BasePart");
                            if r271 and (r271.Position - r270.Position).Magnitude <= 20 then
                                pcall(function(...)
                                    v3 = r50;
                                    v3.FireServer(v3, r271, r271.CFrame);
                                    r271.CFrame = r270.CFrame * CFrame.new(0, 0, -3);
                                    return; 
                                end);
                            end;
                        end; 
                    end;
                end;
            end;
            task.wait(.1); 
        end;
        return; 
    end);
    return; 
end;
vm30.AddToggle(vm30, "TelekinesisShieldToggle", {
    ["Text"] = "Telekinesis Shield",
    ["Default"] = false,
    ["Callback"] = function(arg1_110, ...)
        v1 = arg1_110;
        r267 = v1;
        if v1 then
            r268 = task.spawn(r269);
        else
            if r268 then
                task.cancel(r268);
            end;
            return;
        end; 
    end
});
r272 = false;
vm30.AddToggle(vm30, "FlyingResetToggle", {
    ["Text"] = "Flying Reset",
    ["Default"] = false,
    ["Callback"] = function(arg1_111, ...)
        v1 = arg1_111;
        r272 = v1;
        if v1 then
            i = r29;
            X = i.WaitForChild(i, "GameCorrectionEvents");
            i = r49;
            r274 = i.WaitForChild(i, "Struggle");
            i = X.WaitForChild(X, "GameCorrectionsNotify").OnClientEvent;
            r273 = i.Connect(i, function(arg1_112, ...)
                if r272 and arg1_112 == "Flying" then
                    v3 = r274;
                    v3.FireServer(v3, r26);
                    X = r26.Character;
                    if X then
                        J = X.FindFirstChildOfClass(X, "Humanoid");
                        if J then
                            J.Health = 0;
                        end;
                    end;
                end;
                return; 
            end);
        else
            if r273 then
                i = r273;
                i.Disconnect(i);
            end;
            return;
        end; 
    end
});
vm30.AddButton(vm30, {
    ["Text"] = "Break PCLD",
    ["Func"] = function(...)
        r275 = {};
        (function(...)
            v1 = r26.Character;
            if not v1 then
                return;
            end;
            r276 = v1.WaitForChild(v1, "HumanoidRootPart");
            v2 = v1.GetDescendants;
            e = v2[3];
            for e, v2 in v2[1], ipairs(v2(v1)) do
                o = e;
                if v2.IsA(v2, "Motor6D") then
                    r275[v2] = v2.Part0;
                    v2.Part0 = nil;
                end; 
            end;
            r276.CFrame = CFrame.new(-272.2197265625, -7.3504037857056, 475.01089477539);
            i = r30.RenderStepped;
            r277 = i.Connect(i, function(...)
                r276.AssemblyLinearVelocity = Vector3.zero;
                r276.AssemblyAngularVelocity = Vector3.zero;
                return; 
            end);
            return; 
        end)();
        task.wait(.12);
        (function(...)
            if r277 then
                v3 = r277;
                v3.Disconnect(v3);
            end;
            J = 276[3];
            for J, o in 276[1], pairs(r275) do
                if J then
                    i = J.Parent;
                end;
                v3 = r277;
                if J then
                    J.Part0 = o;
                end; 
            end;
            r275 = {};
            return; 
        end)();
        return; 
    end,
    ["DoubleClick"] = false
});
r278 = false;
r279 = Enum.KeyCode.X;
local function r282(...)
    if r280 then
        v3 = r280;
        v3.Disconnect(v3);
    end;
    i = r28.InputBegan;
    r280 = i.Connect(i, function(arg1_113, arg2_113, ...)
        if not arg2_113 and (arg1_113.KeyCode == r279 and r278) then
            J = r26.Character;
            if J then
                e = J.FindFirstChild(J, "HumanoidRootPart");
                if e then
                    if not r281 then
                        r281 = Instance.new("Part");
                        r281.Size = Vector3.new(10, 1, 10);
                        r281.Anchored = true;
                        r281.Transparency = 0.5;
                        r281.Material = Enum.Material.Neon;
                        r281.BrickColor = BrickColor.new("Bright blue");
                        r281.Parent = r31;
                    end;
                    r281.CFrame = e.CFrame * CFrame.new(0, -3, 0);
                end;
            end;
        end;
        return; 
    end);
    return; 
end;
vm30.AddToggle(vm30, "PlatformTPToggle", {
    ["Text"] = "Platform TP",
    ["Default"] = false,
    ["Callback"] = function(arg1_114, ...)
        v1 = arg1_114;
        r278 = v1;
        if v1 then
            r282();
        else
            if r280 then
                i = r280;
                i.Disconnect(i);
            end;
            if r281 then
                X = r281;
                X.Destroy(X);
            end;
            return;
        end; 
    end
});
vm100 = vm30.AddLabel(vm30, "Platform TP Key");
vm100.AddKeyPicker(vm100, "PlatformTPKey", {
    ["Default"] = "X",
    ["Mode"] = "Press",
    ["Text"] = "Platform TP Key",
    ["NoUI"] = false,
    ["ChangedCallback"] = function(arg1_115, ...)
        r279 = arg1_115;
        return; 
    end
});
vm100 = l.LocalPlayer;
vm68 = vm100.AddRightGroupbox(vm100, "Character", "user");
vm100 = l.LocalPlayer;
vm64 = vm100.AddRightGroupbox(vm100, "Settings", "settings");
vm100 = l.LocalPlayer;
vm113 = vm100.AddRightGroupbox(vm100, "Info", "info");
vm30.AddToggle(vm30, "AntiGrab", {
    ["Text"] = "Anti-Grab",
    ["Default"] = false,
    ["Callback"] = function(arg1_116, ...)
        X = r49;
        i = 203;
        if X then
            X = r49;
            i = X.FindFirstChild(X, "Struggle");
        end;
        r284 = i;
        if arg1_116 then
            v3 = r283;
            if v3 then
                v3 = r283;
                v3.Disconnect(v3);
            end;
            v3 = r30.Heartbeat;
            r283 = v3.Connect(v3, function(...)
                e = r16("\xa6\xc8\xc1\x97\x88j\x92\xa1Q", 34062432992757);
                r285 = r26[r15[e]];
                if r285 and (e.FindFirstChild(e, "Head") and e.FindFirstChild(e, "PartOwner")) then
                    task.spawn(function(...)
                        v3 = r284;
                        if v3 then
                            v3 = r284;
                            v3.FireServer(v3, r26);
                        end;
                        pcall(function(...)
                            v3 = r29.GameCorrectionEvents.StopAllVelocity;
                            v3.FireServer(v3);
                            return; 
                        end);
                        J = r285;
                        v1 = J[2];
                        J = J[1];
                        for X, o in pairs(J.GetChildren(J)) do
                            e = X;
                            if o.IsA(o, "BasePart") then
                                o.Anchored = true;
                            end; 
                        end;
                        v3 = r26;
                        o = r16(")BR\xd3\x8b\xb4", 2312346289204);
                        v1 = v3.FindFirstChild(v3, r15[o]);
                        X = v1;
                        while not v1 do
                            if v1 then
                                task.wait();
                            end;
                            o = r285;
                            v2 = {
                                o.GetChildren(o)
                            };
                            J = o[2];
                            e = o[3];
                            for e, v2 in pairs(T(v2)) do
                                o = e;
                                if v2.IsA(v2, "BasePart") then
                                    v2.Anchored = false;
                                end; 
                            end;
                            return; 
                        end;
                        X = v1.Value; 
                    end);
                end;
                return; 
            end);
        else
            if r283 then
                v3 = r283;
                v3.Disconnect(v3);
            end;
            K = "\x0b\xeb\x84o\xab\x81\xa8\xb6\xd1";
            J = r26[r15[r16(K, 231029358699)]];
            if J then
                K = J.GetChildren;
                v4 = {
                    K(J)
                };
                n = K[3];
                for n, v4 in K[1], pairs(T(v4)) do
                    e = n;
                    if v4.IsA(v4, "BasePart") then
                        v4.Anchored = false;
                    end; 
                end;
            end;
            return;
        end; 
    end
});
r286 = false;
local function r288(arg1_117, ...)
    r289 = arg1_117;
    if r289 and r289.Parent then
        pcall(function(...)
            v3 = r289;
            v3.Destroy(v3);
            return; 
        end);
    end;
    return; 
end;
local function r290(arg1_118, ...)
    v1 = arg1_118;
    if v1 then
        e = v1.IsA(v1, "Seat");
        if e then
            v3 = Q[X];
            X = v1.Parent and v1.Parent.Name == "FoodBanana";
        end;
        v3 = Q[X];
        i = e;
    end;
    return v1; 
end;
local function r291(...)
    while r286 do
        v1 = r26.Character;
        if v1 then
            i = v1.FindFirstChildOfClass(v1, "Humanoid");
        end;
        r292 = v1;
        if r292 then
            r293 = r292.SeatPart;
            if r290(r293) then
                pcall(function(...)
                    r292.Sit = false;
                    task.wait(0);
                    r288(r293.Parent);
                    return; 
                end);
            end;
            v2 = r31;
            e = v2[2];
            v2 = v2[1];
            for o, v4 in ipairs(v2.GetDescendants(v2)) do
                n = o;
                if v4.IsA(v4, "Model") and v4.Name == "FoodBanana" then
                    Q[vm100](v4);
                end; 
            end;
        end;
        task.wait(.2); 
    end;
    return; 
end;
vm30.AddToggle(vm30, "AntiBananaSitToggle", {
    ["Text"] = "Anti Banana Sit",
    ["Default"] = false,
    ["Callback"] = function(arg1_119, ...)
        v1 = arg1_119;
        r286 = v1;
        if v1 then
            if r287 then
                task.cancel(r287);
            end;
            r287 = task.spawn(r291);
        else
            if r287 then
                task.cancel(r287);
            end;
            return;
        end; 
    end
});
r294 = false;
r295 = {};
r296 = {};
r297 = {};
vm30.AddToggle(vm30, "AntiRagdollBeta", {
    ["Text"] = "Anti Ragdoll (Beta)",
    ["Default"] = false,
    ["Callback"] = function(arg1_120, ...)
        v1 = arg1_120;
        r294 = v1;
        if v1 then
            r298 = r26.Character;
            if not r298 then
                i = r36.AntiRagdollBeta;
                i.SetValue(i, false);
                r37("Error", "No character!", 3);
                return;
            end;
            i = r298;
            r299 = i.FindFirstChildOfClass(i, "Humanoid");
            i = not r299;
            if i then
                i = r36.AntiRagdollBeta;
                i.SetValue(i, false);
                return;
            end;
            i = r299;
            r300 = i.FindFirstChildOfClass(i, "Animator");
            n = r298;
            w = r15;
            v3 = v1;
            r301 = n.FindFirstChild(n, "UpperTorso") or n.FindFirstChild(n, "Torso");
            i = not r301;
            if i then
                i = r36.AntiRagdollBeta;
                i.SetValue(i, false);
                return;
            end;
            pcall(function(...)
                v3 = r298;
                v1 = v3.FindFirstChild(v3, "Animate");
                if v1 then
                    v1.Destroy(v1);
                end;
                return; 
            end);
            if r300 then
                w = r300;
                a = {
                    w.GetPlayingAnimationTracks(w)
                };
                v4 = w[2];
                K = w[3];
                for K, a in pairs(T(a)) do
                    w = K;
                    r302 = a;
                    pcall(function(...)
                        v3 = r302;
                        v3.Stop(v3, 0);
                        return; 
                    end); 
                end;
            end;
            w = r298;
            t = w.GetDescendants;
            a = {
                t(w)
            };
            K = w[3];
            v4 = w[2];
            for K, a in pairs(T(a)) do
                w = K;
                if a.IsA(a, "Motor6D") then
                    table.insert(r296, {
                        ["name"] = a.Name,
                        ["parent"] = a.Parent,
                        ["part0"] = a.Part0,
                        ["part1"] = a.Part1,
                        ["c0"] = a.C0,
                        ["c1"] = a.C1
                    });
                    a.Destroy(a);
                end; 
            end;
            local function n(arg1_121, arg2_121, arg3_121, ...)
                v1 = arg1_121;
                if not v1 or v1 == r301 then
                    return;
                end;
                e = Instance.new("Weld");
                e.Name = "VisibleAttach_" .. v1.Name;
                e.Part0 = r301;
                e.Part1 = v1;
                i = arg2_121;
                e.C0 = i;
                e.C1 = CFrame.new();
                e.Parent = r301;
                table.insert(r297, e);
                v1.Anchored = false;
                v1.Massless = false;
                v3 = "CanCollide";
                v1[v3] = arg3_121 or false;
                o = v3;
                return; 
            end;
            if not (r299.RigType == Enum.HumanoidRigType.R15) then
                t = "name";
                v5 = "name";
                F = "offset";
                CFrame.new(0.5, -1, 0);
                Y = "collision";
                W = true;
                i = pairs;
                w = t[2];
                K = t[1];
                for a, v5 in i({
                    {
                        ["name"] = "Head",
                        ["offset"] = CFrame.new(0, 1.5, 0),
                        ["collision"] = false
                    },
                    {
                        ["name"] = "Left Arm",
                        ["offset"] = CFrame.new(-1.5, 0.5, 0),
                        ["collision"] = false
                    },
                    {
                        ["name"] = "Right Arm",
                        ["offset"] = CFrame.new(1.5, 0.5, 0),
                        ["collision"] = false
                    },
                    {
                        [t] = "Left Leg",
                        ["offset"] = CFrame.new(-0.5, -1, 0),
                        ["collision"] = true
                    },
                    t
                }), "Right Leg" do
                    i = r298;
                    t = a;
                    v6 = i.FindFirstChild(i, v5.name);
                    if v6 then
                        (function(arg1_122, arg2_122, arg3_122, ...)
                            v1 = arg1_122;
                            if not v1 or v1 == r301 then
                                return;
                            end;
                            e = Instance.new("Weld");
                            e.Name = "VisibleAttach_" .. v1.Name;
                            e.Part0 = r301;
                            e.Part1 = v1;
                            i = arg2_122;
                            e.C0 = i;
                            e.C1 = CFrame.new();
                            e.Parent = r301;
                            table.insert(r297, e);
                            v1.Anchored = false;
                            v1.Massless = false;
                            v3 = "CanCollide";
                            v1[v3] = arg3_122 or false;
                            o = v3;
                            return; 
                        end)(v6, v5.offset, v5.collision);
                    end; 
                end;
            else
                w = {
                    ["name"] = "RightUpperArm",
                    ["offset"] = CFrame.new(1.25, 0.5, 0),
                    ["collision"] = false
                };
                t = "name";
                v5 = "name";
                v6 = "RightHand";
                F = "offset";
                CFrame.new(1.25, -0.5, 0);
                Y = "collision";
                v6 = {
                    ["name"] = "LeftLowerArm",
                    ["offset"] = CFrame.new(-1.25, 0, 0),
                    ["collision"] = false
                };
                i = pairs;
                a = t[3];
                for a, v5 in t[1], i({
                    {
                        ["name"] = "Head",
                        ["offset"] = CFrame.new(0, 1, 0),
                        ["collision"] = false
                    },
                    {
                        ["name"] = "LowerTorso",
                        ["offset"] = CFrame.new(0, -0.75, 0),
                        ["collision"] = true
                    },
                    w,
                    {
                        [t] = "RightLowerArm",
                        ["offset"] = CFrame.new(1.25, 0, 0),
                        ["collision"] = false
                    },
                    t,
                    {
                        ["name"] = "LeftUpperArm",
                        ["offset"] = CFrame.new(-1.25, 0.5, 0),
                        ["collision"] = false
                    },
                    v6,
                    {
                        ["name"] = "LeftHand",
                        ["offset"] = CFrame.new(-1.25, -0.5, 0),
                        ["collision"] = false
                    },
                    {
                        ["name"] = "RightUpperLeg",
                        ["offset"] = CFrame.new(0.5, -1, 0),
                        ["collision"] = false
                    },
                    {
                        ["name"] = "RightLowerLeg",
                        ["offset"] = CFrame.new(0.5, -1.5, 0),
                        ["collision"] = false
                    },
                    {
                        ["name"] = "RightFoot",
                        ["offset"] = CFrame.new(0.5, -2, 0),
                        ["collision"] = true
                    },
                    {
                        ["name"] = "LeftUpperLeg",
                        ["offset"] = CFrame.new(-0.5, -1, 0),
                        ["collision"] = false
                    },
                    {
                        ["name"] = "LeftLowerLeg",
                        ["offset"] = CFrame.new(-0.5, -1.5, 0),
                        ["collision"] = false
                    },
                    {
                        ["name"] = "LeftFoot",
                        ["offset"] = CFrame.new(-0.5, -2, 0),
                        ["collision"] = true
                    }
                }), t[1], v6 do
                    t = a;
                    i = r298;
                    v6 = i.FindFirstChild(i, v5.name);
                    if v6 then
                        (function(arg1_123, arg2_123, arg3_123, ...)
                            v1 = arg1_123;
                            if not v1 or v1 == r301 then
                                return;
                            end;
                            e = Instance.new("Weld");
                            e.Name = "VisibleAttach_" .. v1.Name;
                            e.Part0 = r301;
                            e.Part1 = v1;
                            i = arg2_123;
                            e.C0 = i;
                            e.C1 = CFrame.new();
                            e.Parent = r301;
                            table.insert(r297, e);
                            v1.Anchored = false;
                            v1.Massless = false;
                            v3 = "CanCollide";
                            v1[v3] = arg3_123 or false;
                            o = v3;
                            return; 
                        end)(v6, v5.offset, v5.collision);
                    end; 
                end;
                if r300 then
                    r300.LoadAnimation = function(arg1_124, arg2_124, ...)
                        v1 = arg1_124;
                        X = arg2_124;
                        return {
                            ["Play"] = function(...)
                                return; 
                            end,
                            ["Stop"] = function(...)
                                return; 
                            end,
                            ["AdjustSpeed"] = function(...)
                                return; 
                            end,
                            ["IsPlaying"] = false,
                            ["Destroy"] = function(...)
                                return; 
                            end
                        }; 
                    end;
                    w = r300.AnimationPlayed;
                    table.insert(r295, w.Connect(w, function(arg1_125, ...)
                        r303 = arg1_125;
                        if r294 then
                            task.spawn(function(...)
                                v3 = r303;
                                v3.Stop(v3, 0);
                                return; 
                            end);
                        end;
                        return; 
                    end));
                end;
                w = r30.Heartbeat;
                table.insert(r295, w.Connect(w, function(...)
                    if not r294 then
                        return;
                    end;
                    r298 = r26.Character;
                    if not r298 then
                        return;
                    end;
                    i = r298;
                    r299 = i.FindFirstChildOfClass(i, "Humanoid");
                    if not r299 then
                        return;
                    end;
                    i = r299;
                    v2 = r16("\xea\xfd\xc9\x13\x15l>\xaf", 1962233594769);
                    r300 = i.FindFirstChildOfClass(i, r15[v2]);
                    if r300 then
                        v2 = r300;
                        n = {
                            v2.GetPlayingAnimationTracks(v2)
                        };
                        e = v2[2];
                        J = v2[1];
                        for o, n in pairs(T(n)) do
                            v2 = o;
                            r304 = n;
                            pcall(function(...)
                                v3 = Q[i];
                                v3.Stop(v3, 0);
                                return; 
                            end); 
                        end;
                    end;
                    pcall(function(...)
                        v3 = r299;
                        v1 = v3.GetState(v3);
                        if v1 == Enum.HumanoidStateType.Ragdoll or (v1 == Enum.HumanoidStateType.FallingDown or v1 == Enum.HumanoidStateType.Physics) then
                            v3 = r299;
                            v3.ChangeState(v3, Enum.HumanoidStateType.Running);
                        end;
                        r299.PlatformStand = false;
                        r299.Sit = false;
                        return; 
                    end);
                    v2 = r298;
                    n = {
                        v2.GetDescendants(v2)
                    };
                    e = v2[2];
                    J = v2[1];
                    for o, n in pairs(T(n)) do
                        v2 = o;
                        if n.IsA(n, "Motor6D") then
                            n.Destroy(n);
                        end; 
                    end;
                    return; 
                end));
                w = r298.DescendantAdded;
                table.insert(r295, w.Connect(w, function(arg1_126, ...)
                    v1 = arg1_126;
                    if not r294 then
                        return;
                    end;
                    if v1.Name == "Animate" then
                        task.wait();
                        v1.Destroy(v1);
                    end;
                    if v1.IsA(v1, "AnimationTrack") then
                        task.wait();
                        v1.Stop(v1, 0);
                    end;
                    if v1.IsA(v1, "Motor6D") then
                        task.wait();
                        v1.Destroy(v1);
                    end;
                    return; 
                end));
                w = r299;
                a = w.GetPropertyChangedSignal(w, "PlatformStand");
                table.insert(r295, a.Connect(a, function(...)
                    if r294 and r299.PlatformStand then
                        r299.PlatformStand = false;
                    end;
                    return; 
                end));
                w = r299;
                a = w.GetPropertyChangedSignal(w, "Sit");
                table.insert(r295, a.Connect(a, function(...)
                    if r294 and r299.Sit then
                        r299.Sit = false;
                    end;
                    return; 
                end));
                w = r299.StateChanged;
                table.insert(r295, w.Connect(w, function(arg1_127, arg2_127, ...)
                    v1 = arg1_127;
                    v3 = not r294;
                    X = arg2_127;
                    if v3 then
                        return;
                    end;
                    if X == Enum.HumanoidStateType.Ragdoll or (X == Enum.HumanoidStateType.FallingDown or X == Enum.HumanoidStateType.Physics) then
                        v3 = r299;
                        v3.ChangeState(v3, Enum.HumanoidStateType.Running);
                    end;
                    return; 
                end));
                r37("Anti Ragdoll Beta", "VISIBLE MODE! All can see - no clipping", 5);
            end;
        else
            J = 275[2];
            X = 275[1];
            for e, v2 in pairs(r295) do
                o = e;
                r305 = v2;
                pcall(function(...)
                    v3 = r305;
                    v3.Disconnect(v3);
                    return; 
                end); 
            end;
            r295 = {};
            v2 = r297;
            o = 277[3];
            for o, v2 in 277[1], pairs(v2) do
                X = o;
                r306 = v2;
                pcall(function(...)
                    v3 = r306;
                    v3.Destroy(v3);
                    return; 
                end); 
            end;
            r297 = {};
            r307 = r26.Character;
            if r307 then
                v4 = r296;
                v2 = ("\x8bf\x1cZs2\x96\xf8\xd6")[2];
                o = ("\x8bf\x1cZs2\x96\xf8\xd6")[1];
                for n, v4 in pairs(v4) do
                    J = n;
                    v3 = v1;
                    if v4.part0 and (v4.part0.Parent and (v4.part1 and v4.part1.Parent)) then
                        w = Instance.new("Motor6D");
                        w.Name = v4.name;
                        w.Part0 = v4.part0;
                        w.Part1 = v4.part1;
                        w.C0 = v4.c0;
                        w.C1 = v4.c1;
                        w.Parent = v4.parent;
                    end; 
                end;
                r296 = {};
                pcall(function(...)
                    J = {
                        pcall(function(...)
                            X = game;
                            v3 = X.GetService(X, "Players").LocalPlayer.CharacterAppearanceConfiguration.Animate;
                            return v3.Clone(v3); 
                        end)
                    };
                    v1 = J[2];
                    X = pcall(function(...)
                        X = game;
                        v3 = X.GetService(X, "Players").LocalPlayer.CharacterAppearanceConfiguration.Animate;
                        return v3.Clone(v3); 
                    end);
                    if X then
                        i = J[2];
                    end;
                    if X then
                        v1.Parent = r307;
                    end;
                    return; 
                end);
            end;
            r37("Anti Ragdoll Beta", "Restored to normal", 2);
            return;
        end; 
    end
});
r308 = false;
vm30.AddToggle(vm30, "AutoReset", {
    ["Text"] = "Auto-Reset",
    ["Default"] = true,
    ["Callback"] = function(arg1_128, ...)
        v1 = arg1_128;
        r308 = v1;
        if v1 then
            task.spawn(function(...)
                while r308 do
                    v1 = r26.Character;
                    i = v1;
                    v1 = i and v1.FindFirstChild(v1, "Humanoid");
                    if v1 then
                        i = v1.Health > 0;
                    end;
                    if v1 then
                        v1.Health = 0;
                    end;
                    task.wait(0.5); 
                end;
                return; 
            end);
        end;
        return; 
    end
});
r309 = {
    ["Coconut"] = "FoodCoconut",
    ["Banana"] = "FoodBanana",
    ["Fries"] = "FoodFrenchFries",
    ["MeatStick"] = "FoodMeatStick",
    ["Poop"] = "PoopPile",
    ["Donut"] = "FoodDonut",
    ["Cake"] = "FoodCakePink",
    ["Burger"] = "FoodHamburger",
    ["Pizza"] = "FoodPizzaCheese",
    ["Hotdog"] = "FoodHotdog",
    ["Mushroom"] = "FoodMushroomPoison",
    ["Banjo"] = "InstrumentGuitarBanjo",
    ["Violin"] = "InstrumentGuitarViolin",
    ["Ukulele"] = "InstrumentGuitarUkulele",
    ["Sax"] = "InstrumentWoodwindSaxophone",
    ["Vuvuzela"] = "InstrumentBrassVuvuzela",
    ["Bongos"] = "InstrumentDrumBongos",
    ["Mic"] = "InstrumentVoiceMicrophone",
    ["Pepperoni"] = "FoodPizzaPepperoni",
    ["Piano"] = "InstrumentPianoMelodica",
    ["Bread"] = "FoodBread",
    ["Egg"] = "FoodDippyEgg",
    ["Mayo"] = "FoodMayonnaise",
    ["WhiteMug"] = "CupMugWhite",
    ["Ocarina"] = "InstrumentWoodwindOcarina",
    ["SparklePoop"] = "PoopPileSparkle",
    ["BrownMug"] = "CupMugBrown",
    ["Trumpet"] = "InstrumentBrassTrumpet",
    ["Snare"] = "InstrumentDrumSnare"
};
vm1 = {};
vm32 = {
    pairs(r309)
};
vm63 = pairs(r309)(vm32[2], vm32[3]);
while vm63 do
    vm83 = vm27(vm114, vm32[3]);
    table.insert(vm1, vm83); 
end;
table.sort(vm1);
r310 = r309[vm1[1]];
vm64.AddDropdown(vm64, "AntiInputType", {
    ["Text"] = "Anti-Input Item",
    ["Values"] = vm1,
    ["Default"] = 1,
    ["Callback"] = function(arg1_129, ...)
        r310 = r309[arg1_129];
        return; 
    end
});
vm64.AddSlider(vm64, "AILHeight", {
    ["Text"] = "Input Height",
    ["Min"] = 1,
    ["Max"] = 1000,
    ["Default"] = 10,
    ["Rounding"] = 0,
    ["Suffix"] = " studs",
    ["Callback"] = function(arg1_130, ...)
        _G.AILHeight = arg1_130;
        return; 
    end
});
vm64.AddButton(vm64, {
    ["Text"] = "Destroy Input Item",
    ["Func"] = function(...)
        v3 = r31;
        o = r16;
        v1 = v3.FindFirstChild(v3, r26.Name .. "SpawnedInToys");
        if v1 then
            o = v1.GetChildren;
            e = {
                o(v1)
            };
            J = o[3];
            X = o[2];
            for J, v2 in pairs(T(i)) do
                r311 = v2;
                o = J;
                if r311.Name == r310 then
                    pcall(function(...)
                        v3 = r29.MenuToys.DestroyToy;
                        v3.FireServer(v3, r311);
                        return; 
                    end);
                end; 
            end;
        end;
        r37("Input", "Item destroyed!", 2);
        return; 
    end
});
vm30.AddToggle(vm30, "AntiInputLag", {
    ["Text"] = "Anti-Input Lag V2 [10 Threads]",
    ["Default"] = false,
    ["Callback"] = function(arg1_131, ...)
        v1 = arg1_131;
        _G.AIL = v1;
        if v1 then
            task.spawn(function(...)
                r312 = r29.MenuToys.SpawnToyRemoteFunction;
                X = r26.Character;
                if not X then
                    r37("Error", "No character!", 3);
                    _G.AIL = false;
                    return;
                end;
                r313 = X.FindFirstChild(X, "HumanoidRootPart");
                if not r313 then
                    r37("Error", "No HRP!", 3);
                    _G.AIL = false;
                    return;
                end;
                pcall(function(...)
                    v3 = r312;
                    v3.InvokeServer(v3, r310, r313.CFrame * CFrame.new(0, 5, 0), Vector3.zero);
                    return; 
                end);
                task.wait(.3);
                v3 = r31;
                e = v3.FindFirstChild(v3, r26.Name .. "SpawnedInToys");
                if e then
                    i = e.FindFirstChild(e, r310);
                end;
                r314 = e;
                if not r314 then
                    r37("Error", "Spawn failed!", 3);
                    _G.AIL = false;
                    return;
                end;
                v3 = r314;
                r315 = v3.FindFirstChild(v3, "HoldPart");
                if not r315 then
                    _G.AIL = false;
                    return;
                end;
                r37("Anti-Input V2", "10 THREADS STARTED! 30M speed each", 5);
                n = {};
                for G = 1, 10 do
                    r316 = v4;
                    n[r316] = task.spawn(function(...)
                        local Z = {
                            641,
                            643,
                            275,
                            33,
                            7,
                            23
                        }; 
                    end); 
                end;
                w = r16;
                while _G.AIL do
                    task.wait(0.5); 
                end;
                v4 = w[2];
                w = w[1];
                for K, t in pairs(n) do
                    a = K;
                    r317 = t;
                    pcall(function(...)
                        task.cancel(r317);
                        return; 
                    end); 
                end;
                if r314 and r314.Parent then
                    pcall(function(...)
                        v3 = r29.MenuToys.DestroyToy;
                        v3.FireServer(v3, r314);
                        return; 
                    end);
                end;
                r37("Anti-Input V2", "All 10 threads stopped", 3);
                return; 
            end);
        else
        end;
        return; 
    end
});
r318 = {};
r319 = {};
local function r320(...)
    J = r31;
    X = J[3];
    J = J[1];
    for X, o in J, ipairs(J.GetDescendants(J)) do
        e = X;
        if o.IsA(o, "BasePart") and o.Name == "PaintPlayerPart" then
            v2 = o.Clone(o);
            v2.Archivable = true;
            r318[o.GetDebugId(o)] = {
                ["clone"] = v2,
                ["parent"] = o.Parent
            };
            o.Destroy(o);
        end; 
    end;
    return; 
end;
local function r321(...)
    J = r318;
    X = 641[3];
    v1 = 641[2];
    for X, o in pairs("pairs") do
        if o.clone and o.parent then
            o.clone.Parent = o.parent;
        end; 
    end;
    r318 = {};
    return; 
end;
local function r322(...)
    X = r31.DescendantAdded;
    table.insert(r319, X.Connect(X, function(arg1_132, ...)
        r323 = arg1_132;
        X = r323;
        J = X.IsA(X, "BasePart");
        if J then
            i = r323.Name == "PaintPlayerPart";
        end;
        if J then
        end; 
    end));
    return; 
end;
local function r324(...)
    J = r319;
    X = 641[3];
    v1 = 641[2];
    for X, o in ipairs("ipairs") do
        if o.Connected then
            o.Disconnect(o);
        end; 
    end;
    r319 = {};
    return; 
end;
local function r325(arg1_133, ...)
    v1 = arg1_133;
    v3 = r31;
    X = v3.FindFirstChild(v3, r26.Name);
    if not X then
        return;
    end;
    v2 = X.GetChildren;
    o = {
        v2(X)
    };
    e = v2[3];
    J = v2[2];
    for e, n in ipairs(T("ipairs")) do
        v2 = e;
        if n.IsA(n, "BasePart") then
            v4 = arg1_133;
            n.CanTouch = v4;
            n.CanQuery = v1;
        end; 
    end;
    return; 
end;
vm30.AddToggle(vm30, "AntiPaint", {
    ["Text"] = "Anti-Paint",
    ["Default"] = false,
    ["Callback"] = function(arg1_134, ...)
        if arg1_134 then
            r320();
            r322();
            r325(false);
        else
            r321();
            r324();
            r325(true);
        end;
        return; 
    end
});
r326 = false;
r328 = 0;
r331 = 0;
local function r332(...)
    r333 = {
        [1] = "CreatureBlobman",
        [2] = CFrame.new(0, 5000000, 0),
        [3] = Vector3.new(0, 60, 0)
    };
    pcall(function(...)
        v3 = r29.MenuToys.SpawnToyRemoteFunction;
        v3.InvokeServer(v3, unpack(r333));
        return; 
    end);
    v3 = r31;
    X = v3.WaitForChild(v3, r26.Name .. "SpawnedInToys", 5);
    if X then
        i = X.FindFirstChild(X, "CreatureBlobman");
    end;
    if X then
        J = X.CreatureBlobman;
        if J.FindFirstChild(J, "Head") then
            J.Head.CFrame = CFrame.new(0, 50000, 0);
            J.Head.Anchored = true;
        end;
        r37("Success", "Blobman Spawned!", 3);
    end;
    return; 
end;
r336 = 0;
local function r337(...)
    v1 = r26.Character;
    i = v1;
    if v1 then
        v1 = not o;
        r338 = v1.WaitForChild(v1, "Humanoid");
        r339 = v1.WaitForChild(v1, "HumanoidRootPart");
        v3 = r339.Position;
        r335 = v3;
        i = r31;
        e = i.FindFirstChild(i, r26.Name .. "SpawnedInToys");
        if e then
            i = e.FindFirstChild(e, "CreatureBlobman");
        end;
        v3 = v3;
        o = e;
        if o then
            i = o.FindFirstChild(o, "VehicleSeat");
        end;
        v3 = v3;
        if not o then
            r332();
            task.wait(1);
            i = r31;
            e = i.FindFirstChild(i, r26.Name .. "SpawnedInToys");
            if e then
                i = e.FindFirstChild(e, "CreatureBlobman");
            end;
            v3 = v3;
            o = e;
            if o then
                v4 = o.FindFirstChild(o, "VehicleSeat");
            end;
            v3 = v3;
            v2 = o;
        end;
        if o then
            K = o.IsA(o, "VehicleSeat");
        end;
        v3 = v3;
        if v2 then
            r339.CFrame = o.CFrame + Vector3.new(0, 2, 0);
            o.Sit(o, r338);
        end;
        K = r338;
        w = K.GetPropertyChangedSignal(K, "Jump");
        w.Connect(w, function(...)
            if r338.Jump and r338.Sit then
                r336 = 15;
                r335 = r339.Position;
            end;
            return; 
        end);
        K = r334;
        if K then
            K = Q[vm122];
            K.Disconnect(K);
        end;
        K = r30.Heartbeat;
        r334 = K.Connect(K, function(...)
            if not r339 or not r338 then
                return;
            end;
            v3 = r29.CharacterEvents.RagdollRemote;
            v3.FireServer(v3, r339, 0);
            if r336 > 0 then
                r339.CFrame = CFrame.new(r335);
                r336 = r336 - 1;
            end;
            return; 
        end);
        task.spawn(function(...)
            while r338.Sit do
                task.wait(1); 
            end;
            task.wait(0.5);
            r339.CFrame = CFrame.new(r335);
            return; 
        end);
        return true;
    else
        v1 = r26.CharacterAdded;
        i = v1.Wait(v1);
    end; 
end;
local function r340(...)
    if r334 then
        v3 = r334;
        v3.Disconnect(v3);
    end;
    return; 
end;
local function r341(...)
    e = r15;
    v1 = r26.Character;
    i = v1;
    if v1 then
        r342 = v1.WaitForChild(v1, "Humanoid");
        r343 = v1.WaitForChild(v1, "HumanoidRootPart");
        v3 = r343.Position;
        r330 = v3;
        v3 = v3;
        e = r31.Map and r31.Map.AlwaysHereTweenedObjects;
        if e then
            i = e.FindFirstChild(e, "Train");
        end;
        v3 = v3;
        if e then
            a = e.GetDescendants;
            K = a[3];
            for K, a in a[1], ipairs(a(e)) do
                w = K;
                if a.IsA(a, "Seat") then
                    v2 = a;
                else
                    
                end; 
            end;
        end;
        if nil then
            r343.CFrame = nil.CFrame + Vector3.new(0, 2, 0);
            nil.Sit(nil, r342);
        end;
        n = r342;
        v4 = n.GetPropertyChangedSignal(n, "Jump");
        v4.Connect(v4, function(...)
            local Z = {
                634,
                641,
                643,
                407,
                635,
                403
            }; 
        end);
        n = r329;
        if n then
            n = Q[vm111];
            n.Disconnect(n);
        end;
        n = r30.Heartbeat;
        r329 = n.Connect(n, function(...)
            if not r343 or not r342 then
                return;
            end;
            v3 = r29.CharacterEvents.RagdollRemote;
            v3.FireServer(v3, r343, 0);
            if r331 > 0 then
                r343.CFrame = CFrame.new(r330);
                r331 = r331 - 1;
            end;
            return; 
        end);
        task.spawn(function(...)
            while r342.Sit do
                task.wait(1); 
            end;
            task.wait(0.5);
            r343.CFrame = CFrame.new(r330);
            return; 
        end);
        return true;
    else
        v1 = r26.CharacterAdded;
        i = v1.Wait(v1);
    end; 
end;
local function r344(...)
    v3 = r329;
    if v3 then
        v3 = r329;
        v3.Disconnect(v3);
    end;
    v3 = v3;
    v1 = r31.Map and r31.Map.AlwaysHereTweenedObjects;
    if v1 then
        i = v1.FindFirstChild(v1, "Train");
    end;
    v3 = v3;
    if v1 then
    end;
    return; 
end;
vm30.AddToggle(vm30, "Gucci", {
    ["Text"] = "Gucci",
    ["Default"] = false,
    ["Callback"] = function(arg1_135, ...)
        if arg1_135 then
            if r35 and (r35.GucciType and r35.GucciType.Value == "Blobman") then
                r337();
            else
                r341();
            end;
        else
            if r35 and (r35.GucciType and r35.GucciType.Value == "Blobman") then
                r340();
            else
                r344();
            end;
            return;
        end; 
    end
});
vm30.AddToggle(vm30, "AutoGucci", {
    ["Text"] = "Auto Gucci",
    ["Default"] = false,
    ["Callback"] = function(arg1_136, ...)
        v1 = arg1_136;
        r326 = v1;
        if v1 then
            v3 = v1;
            if r35 and (r35.GucciType and r35.GucciType.Value == "Blobman") then
                X = r337();
            else
                r341();
            end;
            if not false then
                r37("Error", "Cant start Gucci!", 3);
                r326 = false;
                o = r36.AutoGucci;
                o.SetValue(o, false);
                return;
            end;
            local function r346(...)
                v3 = r26.Character;
                X = v3 and v3.FindFirstChildOfClass(v3, "Humanoid");
                if X then
                    v3 = r345;
                    if v3 then
                        v3 = r345;
                        v3.Disconnect(v3);
                    end;
                    v3 = X.Died;
                    r345 = v3.Connect(v3, function(...)
                        if not r326 then
                            return;
                        end;
                        r37("Auto Gucci", "Respawning...", 2);
                        v3 = r26.CharacterAdded;
                        v3.Wait(v3);
                        task.wait(0.5);
                        if r326 then
                            if r35 and (r35.GucciType and r35.GucciType.Value == "Blobman") then
                                if r337() then
                                    r37("Auto Gucci", "Re-seated!", 2);
                                    r346();
                                end;
                            else
                                if r341() then
                                    r37("Auto Gucci", "Re-seated!", 2);
                                    r346();
                                end;
                            end;
                        end;
                        return; 
                    end);
                end;
                return; 
            end;
            r346();
            n = r26.CharacterAdded;
            n.Connect(n, function(arg1_137, ...)
                v1 = arg1_137;
                if r326 then
                    task.wait(0.5);
                    if r35 and (r35.GucciType and r35.GucciType.Value == "Blobman") then
                        if r337() then
                            r37("Auto Gucci", "Re-seated!", 2);
                            r346();
                        end;
                    else
                        if r341() then
                            r37("Auto Gucci", "Re-seated!", 2);
                            r346();
                        end;
                    end;
                end;
                return; 
            end);
            if r327 then
                n = r327;
                n.Disconnect(n);
            end;
            v4 = r31.ChildAdded;
            r327 = v4.Connect(v4, function(arg1_138, ...)
                v1 = arg1_138;
                if not r326 then
                    return;
                end;
                if not v1 or not v1.Parent then
                    return;
                end;
                if v1.IsA(v1, "Model") and v1.Name == "GrabParts" then
                    X = v1.FindFirstChild(v1, "GrabPart");
                    if X then
                        J = X.FindFirstChild(X, "WeldConstraint");
                        e = J and J.Part1;
                        if e then
                            i = e.Parent == r26.Character;
                        end;
                        if e then
                            o = tick();
                            if o - r328 > 0.5 then
                                v3 = tick();
                                r328 = v3;
                                n = r35;
                                if n then
                                    w = r35;
                                    v4 = o;
                                    v5 = r16;
                                    v6 = v5("\xc1\x9d\xcf\xc7\x1ck\x975\x03", 28698013168691);
                                    n = w[r15[v6]] and r35.GucciType.Value == "Blobman";
                                    u = not r26.Character;
                                    F = u;
                                    while u do
                                        v3 = o;
                                        v5 = u;
                                        v3 = v6;
                                        a = F;
                                        v3 = r15;
                                        while not a do
                                            pcall(function(...)
                                                v2 = r16;
                                                e = "SAK";
                                                v1 = not _G[e];
                                                i = v1;
                                                if v1 then
                                                    task.wait(.05);
                                                    v2 = r16;
                                                    e = "SAK";
                                                    if not _G[e] or (not r26.Character or not v2.FindFirstChild(v2, "Humanoid")) then
                                                        if not Q[r35] or not e.FindFirstChild(e, "StickyPart") then
                                                            Q[Z[6]]();
                                                        end;
                                                        return;
                                                    end;
                                                else
                                                    v2 = "Character";
                                                    v3 = t;
                                                    i = not r26[v2] or (not v2.FindFirstChild(v2, "Humanoid") or (not Q[r35] or (not ("\xcd\xb2\x0f\xbfg\xacT\x870").FindFirstChild("\xcd\xb2\x0f\xbfg\xacT\x870", "StickyPart") or (not ("pcall").FindFirstChild("pcall", "StickyWeld") or not Q[r35].StickyPart.StickyWeld.Part1))));
                                                end; 
                                            end);
                                            K = "SAK";
                                            while _G[K] do
                                                task.wait(.005);
                                                t = "Character";
                                                if not r26[t] or (not t.FindFirstChild(t, "Humanoid") or r26.Character.Humanoid.Health <= 0) then
                                                    
                                                end;
                                                v3 = r328;
                                                K = v3.FindFirstChild(v3, r26.Name .. "SpawnedInToys");
                                                if K then
                                                    i = K.FindFirstChild(K, "NinjaShuriken");
                                                end;
                                                r347 = K;
                                                v3 = r328.PlotItems.PlayersInPlots;
                                                if v3.FindFirstChild(v3, r26.Name) then
                                                    v3 = Q[v3];
                                                    t = {
                                                        v3()
                                                    };
                                                    a = t[2];
                                                    t = v3();
                                                    if t then
                                                        if a then
                                                            F = r328.Plots;
                                                            v5 = F.FindFirstChild(F, t[2].Name);
                                                        end;
                                                        v3 = Q[v2];
                                                        i = a;
                                                    end;
                                                    if t then
                                                        v3 = r328.Plots[a.Name];
                                                        v5 = v3.FindFirstChild(v3, "PlotSign");
                                                        if v5 then
                                                            i = v5.ThisPlotsOwners.Value.TimeRemainingNum.Value > 89;
                                                        end;
                                                        if v5 then
                                                            r347 = v3("NinjaShuriken");
                                                            if r347 == nil then
                                                                
                                                            else
                                                                r347.Name = "AntiKick";
                                                                (K and r35.GucciType.Value == "Blobman")(r347);
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                                i = not r347;
                                                if i then
                                                    i = r328.PlotItems.PlayersInPlots;
                                                    if i.FindFirstChild(i, r26.Name) then
                                                        
                                                    else
                                                        r347 = v3("NinjaShuriken");
                                                        if r347 == nil then
                                                            
                                                        else
                                                            r347.Name = "AntiKick";
                                                            if not r347 then
                                                                
                                                            else
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                                t = v3;
                                                a = not r347 or (not _G.SAK or (not 11579011011855.FindFirstChild(11579011011855, "StickyPart") or (r347.StickyPart.CanTouch == false or (not r26.Character or (not ("\x15=\xd2\x81\xdb\xbb*\x14\x95").FindFirstChild("\x15=\xd2\x81\xdb\xbb*\x14\x95", "HumanoidRootPart") or (not R.FindFirstChild(R, "StickyPart") or (r26.Character.HumanoidRootPart.Position - r347.StickyPart.Position).Magnitude >= 20))))));
                                                v3 = t;
                                                t = v3;
                                                v5 = r347;
                                                a = Y;
                                                while not v5 do
                                                    v3 = v3;
                                                    if a then
                                                        (K and r35.GucciType.Value == "Blobman")(r347);
                                                        r347.Name = "AntiKick";
                                                    end;
                                                    task.wait(.3);
                                                    v5 = not r347;
                                                    t = v3;
                                                    v3 = t;
                                                    if v5 or (not _G.SAK or (not 17184685498178.FindFirstChild(17184685498178, "StickyPart") or (r347.StickyPart.CanTouch == false or (not r26.Character or (not ("\x15=\xd2\x81\xdb\xbb*\x14\x95").FindFirstChild("\x15=\xd2\x81\xdb\xbb*\x14\x95", "HumanoidRootPart") or (not R.FindFirstChild(R, "StickyPart") or (r26.Character.HumanoidRootPart.Position - r347.StickyPart.Position).Magnitude >= 20)))))) then
                                                        v5 = not r347;
                                                        a = v5;
                                                        t = v3;
                                                        if v5 then
                                                        else
                                                            v6 = t;
                                                            Y = r347;
                                                            D = r16;
                                                            v5 = not Y.FindFirstChild(Y, "StickyPart") or (not r26.Character or (not D.FindFirstChild(D, "HumanoidRootPart") or (r26.Character.HumanoidRootPart.Position - r347.StickyPart.Position).Magnitude >= 20));
                                                        end;
                                                    end; 
                                                end;
                                                F = r347;
                                                Y = F.FindFirstChild(F, "StickyPart");
                                                if Y then
                                                    v5 = r347.StickyPart.CanTouch == true;
                                                end;
                                                v3 = v3;
                                                a = Y; 
                                            end;
                                            return; 
                                        end;
                                        r35(); 
                                    end;
                                    D = r26.Character;
                                    v3 = o;
                                    F = not D.FindFirstChild(D, "HumanoidRootPart") or (r26.Character.HumanoidRootPart.Position - Q[w].StickyPart.Position).Magnitude >= 20;
                                end;
                                v3 = v3;
                                if n then
                                    r328();
                                else
                                    r35();
                                end;
                                r37("Auto Gucci", "Applied (grab)", 2);
                            end;
                        end;
                    end;
                end;
                return; 
            end);
        else
            r326 = false;
            if r327 then
                o = r327;
                o.Disconnect(o);
            end;
            v4 = v1;
            v2 = r35 and (r35.GucciType and r35.GucciType.Value == "Blobman" and r35.GucciType.Value == "Blobman");
        end; 
    end
});
vm30.AddToggle(vm30, "AntiLoopKill", {
    ["Text"] = "Anti-Loop Kill",
    ["Default"] = false,
    ["Callback"] = function(arg1_139, ...)
        if r348 then
            v3 = r348;
            v3.Disconnect(v3);
        end;
        if arg1_139 then
            r349 = CFrame.new(614.2, 124.3, -106.1);
            i = r26.CharacterAdded;
            r348 = i.Connect(i, function(arg1_140, ...)
                v1 = arg1_140;
                if not r36.AntiLoopKill.Value then
                    return;
                end;
                task.wait(.15);
                X = v1.WaitForChild(v1, "HumanoidRootPart", 5);
                if X then
                    X.CFrame = r349;
                    X.AssemblyLinearVelocity = Vector3.zero;
                    X.AssemblyAngularVelocity = Vector3.zero;
                    r37("Anti Loop Kill", "Teleported to safe zone!", 2);
                end;
                return; 
            end);
        end;
        return; 
    end
});
vm30.AddToggle(vm30, "AntiKick", {
    ["Text"] = "Anti-Kick(flash)",
    ["Default"] = false,
    ["Callback"] = function(arg1_141, ...)
        v1 = arg1_141;
        X = v1;
        _G.SAK = X;
        local function r350(...)
            v3 = r31;
            X = r29;
            v1 = v3.FindFirstChild(v3, r26.Name .. "SpawnedInToys");
            o = r15;
            v2 = r16;
            r351 = X.FindFirstChild(X, "MenuToys") and X.FindFirstChild(X, "DestroyToy");
            if v1 then
                i = r351;
            end;
            if v1 then
                v2 = v1.GetChildren;
                o = {
                    v2(v1)
                };
                o = v2[1];
                J = v2[2];
                for e, n in pairs(T(o)) do
                    r352 = n;
                    v2 = e;
                    if Q[v3].Name == "AntiKick" or Q[v3].Name == "NinjaShuriken" then
                        pcall(function(...)
                            v3 = r351;
                            v3.FireServer(v3, Q[v3]);
                            return; 
                        end);
                    end; 
                end;
            end;
            return; 
        end;
        if v1 then
            task.spawn(function(...)
                r353 = r29.GrabEvents.SetNetworkOwner;
                r354 = r29.PlayerEvents.StickyPartEvent;
                r355 = r29.MenuToys.SpawnToyRemoteFunction;
                v3 = r26;
                r356 = v3.WaitForChild(v3, "CanSpawnToy");
                local function r357(...)
                    local Z = {
                        275,
                        641,
                        643
                    };
                    X = Q[Z[4]];
                    J = r26.Character;
                    v3 = X;
                    if J then
                        return J and J.FindFirstChild(J, "HumanoidRootPart");
                    else
                        v1 = r26.CharacterAdded;
                        X = v1.Wait(v1);
                        i = X.WaitForChild(X, "HumanoidRootPart");
                    end; 
                end;
                local function v2(arg1_142, ...)
                    v1 = arg1_142;
                    if not v1 or not v1.FindFirstChild(v1, "StickyPart") then
                        return;
                    end;
                    X = r357();
                    if not X then
                        return;
                    end;
                    e = r16;
                    v3 = v1.FindFirstChild(v1, "SoundPart");
                    if v3 then
                        e = v1.SoundPart;
                        if not e.FindFirstChild(e, "PartOwner") or v1.SoundPart.PartOwner.Value ~= r26.Name then
                            v3 = r353;
                            v3.FireServer(v3, v1.SoundPart, v1.SoundPart.CFrame);
                        end;
                    end;
                    J = X.FindFirstChild(X, "FirePlayerPart") or X.WaitForChild(X, "FirePlayerPart", 5);
                    if J then
                        v3 = r354;
                        v3.FireServer(v3, v1.StickyPart, J, CFrame.new(0, 0, 0) * CFrame.Angles(0, math.rad(90), math.rad(90)));
                    end;
                    n = v1.GetChildren;
                    v2 = {
                        n(v1)
                    };
                    e = n[2];
                    o = n[3];
                    for o, v4 in pairs(T("pairs")) do
                        n = o;
                        if v4.Name == "Pyramid" then
                            v4.CanTouch = false;
                            v4.CanCollide = false;
                            v4.CanQuery = false;
                            v4.Transparency = 0;
                            if not v4.FindFirstChild(v4, "Highlight") then
                                Instance.new("Highlight", v4).FillColor = Color3.fromRGB(0, 0, 0);
                            end;
                        else
                            if v4.Name == "Main" then
                                v4.CanTouch = false;
                                v4.CanCollide = false;
                                v4.CanQuery = false;
                                v4.Transparency = 0;
                                if not v4.FindFirstChild(v4, "Highlight") then
                                    Instance.new("Highlight", v4).FillColor = Color3.fromRGB(255, 255, 255);
                                end;
                            else
                                if v4.IsA(v4, "BasePart") then
                                    v4.CanTouch = false;
                                    v4.CanCollide = false;
                                    v4.CanQuery = false;
                                    v4.Transparency = 1;
                                end;
                            end;
                        end; 
                    end;
                    return; 
                end;
                local function n(arg1_143, ...)
                    r358 = arg1_143;
                    while not r356.Value do
                        if not _G.SAK or tick() - tick() > 5 then
                            return nil;
                        else
                            task.wait(.1);
                        end; 
                    end;
                    r359 = r357();
                    if r359 then
                        task.spawn(function(...)
                            pcall(function(...)
                                v3 = r355;
                                v3.InvokeServer(v3, r358, r359.CFrame * CFrame.new(0, 12, 20), Vector3.new(0, 0, 0));
                                return; 
                            end);
                            return; 
                        end);
                    end;
                    v3 = r31;
                    e = v3.FindFirstChild(v3, r26.Name .. "SpawnedInToys");
                    if e then
                        return e.WaitForChild(e, r358, 2);
                    end;
                    return nil; 
                end;
                v4 = "SAK";
                while _G[v4] do
                    task.wait(.005);
                    a = "Character";
                    if not r26[a] or (not a.FindFirstChild(a, "Humanoid") or r26.Character.Humanoid.Health <= 0) then
                        
                    end;
                    v3 = r31;
                    v4 = v3.FindFirstChild(v3, r26.Name .. "SpawnedInToys");
                    K = v4 and v4.FindFirstChild(v4, "NinjaShuriken");
                    v3 = not K;
                    if v3 then
                        K = (function(arg1_144, ...)
                            r358 = arg1_144;
                            while not r356.Value do
                                if not _G.SAK or tick() - tick() > 5 then
                                    return nil;
                                else
                                    task.wait(.1);
                                end; 
                            end;
                            r359 = r357();
                            if r359 then
                                task.spawn(function(...)
                                    pcall(function(...)
                                        v3 = r355;
                                        v3.InvokeServer(v3, r358, r359.CFrame * CFrame.new(0, 12, 20), Vector3.new(0, 0, 0));
                                        return; 
                                    end);
                                    return; 
                                end);
                            end;
                            v3 = r31;
                            e = v3.FindFirstChild(v3, r26.Name .. "SpawnedInToys");
                            if e then
                                return e.WaitForChild(e, r358, 2);
                            end;
                            return nil; 
                        end)("NinjaShuriken");
                        if K == nil then
                            
                        else
                            K.Name = "AntiKick";
                            if not K then
                                
                            else
                            end;
                        end;
                    end;
                    w = v3;
                    i = not K or (not _G.SAK or (not K.FindFirstChild(K, "StickyPart") or (K.StickyPart.CanTouch == false or (not r26.Character or (not 357.FindFirstChild(357, "HumanoidRootPart") or (r26.Character.HumanoidRootPart.Position - K.StickyPart.Position).Magnitude >= 20)))));
                    w = w;
                    i = K;
                    while not K do
                        v3 = v3;
                        if K then
                            (function(arg1_145, ...)
                                v1 = arg1_145;
                                if not v1 or not v1.FindFirstChild(v1, "StickyPart") then
                                    return;
                                end;
                                X = r357();
                                if not X then
                                    return;
                                end;
                                e = r16;
                                v3 = v1.FindFirstChild(v1, "SoundPart");
                                if v3 then
                                    e = v1.SoundPart;
                                    if not e.FindFirstChild(e, "PartOwner") or v1.SoundPart.PartOwner.Value ~= r26.Name then
                                        v3 = r353;
                                        v3.FireServer(v3, v1.SoundPart, v1.SoundPart.CFrame);
                                    end;
                                end;
                                J = X.FindFirstChild(X, "FirePlayerPart") or X.WaitForChild(X, "FirePlayerPart", 5);
                                if J then
                                    v3 = r354;
                                    v3.FireServer(v3, v1.StickyPart, J, CFrame.new(0, 0, 0) * CFrame.Angles(0, math.rad(90), math.rad(90)));
                                end;
                                n = v1.GetChildren;
                                v2 = {
                                    n(v1)
                                };
                                e = n[2];
                                o = n[3];
                                for o, v4 in pairs(T("pairs")) do
                                    n = o;
                                    if v4.Name == "Pyramid" then
                                        v4.CanTouch = false;
                                        v4.CanCollide = false;
                                        v4.CanQuery = false;
                                        v4.Transparency = 0;
                                        if not v4.FindFirstChild(v4, "Highlight") then
                                            Instance.new("Highlight", v4).FillColor = Color3.fromRGB(0, 0, 0);
                                        end;
                                    else
                                        if v4.Name == "Main" then
                                            v4.CanTouch = false;
                                            v4.CanCollide = false;
                                            v4.CanQuery = false;
                                            v4.Transparency = 0;
                                            if not v4.FindFirstChild(v4, "Highlight") then
                                                Instance.new("Highlight", v4).FillColor = Color3.fromRGB(255, 255, 255);
                                            end;
                                        else
                                            if v4.IsA(v4, "BasePart") then
                                                v4.CanTouch = false;
                                                v4.CanCollide = false;
                                                v4.CanQuery = false;
                                                v4.Transparency = 1;
                                            end;
                                        end;
                                    end; 
                                end;
                                return; 
                            end)(K);
                            K.Name = "AntiKick";
                        end;
                        task.wait(.3);
                        v3 = v3;
                        if not K or (not _G.SAK or (not K.FindFirstChild(K, "StickyPart") or (K.StickyPart.CanTouch == false or (not r26.Character or (not 357.FindFirstChild(357, "HumanoidRootPart") or (r26.Character.HumanoidRootPart.Position - K.StickyPart.Position).Magnitude >= 20))))) then
                            v3 = v3;
                            if not K or (not K.FindFirstChild(K, "StickyPart") or (not r26.Character or (not 17697814192177.FindFirstChild(17697814192177, "HumanoidRootPart") or (r26.Character.HumanoidRootPart.Position - K.StickyPart.Position).Magnitude >= 20))) then
                                r350();
                            end;
                        end; 
                    end;
                    i = K.FindFirstChild(K, "StickyPart") and K.StickyPart.CanTouch == true;
                    v3 = w; 
                end;
                return; 
            end);
        else
            _G.SAK = false;
            r350();
        end;
        return; 
    end
});
r360 = false;
local function r361(...)
    v1 = r26.Character;
    if not v1 then
        return false;
    end;
    o = v1.GetDescendants;
    e = {
        o(v1)
    };
    J = o[3];
    X = o[2];
    for J, v2 in pairs(T("pairs")) do
        o = J;
        n = "BasePart";
        if v2.IsA(v2, n) then
            n = v2.FindFirstChild(v2, "StickyWeld");
            if n then
                v4 = n.Part1 and n.Part1.Name == "StickyPart";
                v2.FindFirstChild(v2, r15[w]);
            end;
            if n then
                return true;
            else
                
            end;
        end; 
    end;
    return false; 
end;
local function r362(...)
    v3 = r31;
    e = r15;
    o = r16;
    v1 = v3.FindFirstChild(v3, r26.Name .. "SpawnedInToys");
    if v1 then
        o = v1.GetChildren;
        e = {
            o(v1)
        };
        J = o[3];
        e = o[1];
        for J, v2 in e, pairs(T(e)) do
            o = J;
            r363 = v2;
            if Q[v3].Name == "NinjaKunai" or Q[v3].Name == "AntiKickKunai" then
                pcall(function(...)
                    v3 = r29.MenuToys.DestroyToy;
                    v3.FireServer(v3, Q[v3]);
                    return; 
                end);
            end; 
        end;
    end;
    return; 
end;
local function r364(...)
    v1 = r26.Character;
    i = v1;
    if v1 then
        r365 = v1.WaitForChild(v1, "HumanoidRootPart");
        r366 = v1.FindFirstChild(v1, "Right Leg") or (v1.FindFirstChild(v1, "RightLowerLeg") or v1.FindFirstChild(v1, "RightFoot"));
        if not r366 then
            return;
        end;
        r367 = r29.MenuToys.SpawnToyRemoteFunction;
        r368 = r29.GrabEvents.SetNetworkOwner;
        r369 = r29.PlayerEvents.StickyPartEvent;
        pcall(function(...)
            v3 = r367;
            v3.InvokeServer(v3, "NinjaKunai", r365.CFrame * CFrame.new(0, 10, 0), Vector3.zero);
            return; 
        end);
        task.wait(.3);
        v3 = r31;
        n = v3.FindFirstChild(v3, r26.Name .. "SpawnedInToys");
        if not n then
            return;
        end;
        v4 = n.FindFirstChild(n, "NinjaKunai");
        if not v4 then
            return;
        end;
        v4.Name = "AntiKickKunai";
        r370 = v4.FindFirstChild(v4, "StickyPart");
        r371 = v4.FindFirstChild(v4, "SoundPart");
        if not r370 then
            return;
        end;
        if r371 then
            pcall(function(...)
                v3 = r368;
                v3.FireServer(v3, r371, r371.CFrame);
                return; 
            end);
        end;
        pcall(function(...)
            v3 = r369;
            v3.FireServer(v3, r370, r366, CFrame.new(0, 0, 0) * CFrame.Angles(0, math.rad(90), math.rad(90)));
            return; 
        end);
        task.wait(.2);
        v6 = v4.GetChildren;
        v5 = {
            v6(v4)
        };
        v5 = v6[1];
        t = v6[3];
        for t, F in v5, pairs(T(v5)) do
            v6 = t;
            if F.Name == "Pyramid" then
                F.CanTouch = false;
                F.CanCollide = false;
                F.CanQuery = false;
                F.Transparency = 0;
                if not F.FindFirstChild(F, "Highlight") then
                    Instance.new("Highlight", F).FillColor = Color3.fromRGB(0, 0, 0);
                end;
            else
                if F.Name == "Main" then
                    F.CanTouch = false;
                    F.CanCollide = false;
                    F.CanQuery = false;
                    F.Transparency = 0;
                    if not F.FindFirstChild(F, "Highlight") then
                        Instance.new("Highlight", F).FillColor = Color3.fromRGB(255, 255, 255);
                    end;
                else
                    if F.IsA(F, "BasePart") then
                        F.CanTouch = false;
                        F.CanCollide = false;
                        F.CanQuery = false;
                        F.Transparency = 1;
                    end;
                end;
            end; 
        end;
        return;
    else
        v1 = r26.CharacterAdded;
        i = v1.Wait(v1);
    end; 
end;
vm30.AddToggle(vm30, "ShurikenAntiKick", {
    ["Text"] = "Anti Kick(Normal)",
    ["Default"] = false,
    ["Callback"] = function(arg1_146, ...)
        v1 = arg1_146;
        X = v1;
        _G.SAK = X;
        local function r372(...)
            v3 = r31;
            X = r29;
            o = r15;
            v2 = r16;
            v1 = v3.FindFirstChild(v3, r26.Name .. "SpawnedInToys");
            r373 = X.FindFirstChild(X, "MenuToys") and X.FindFirstChild(X, "DestroyToy");
            if v1 then
                i = r373;
            end;
            if v1 then
                v2 = v1.GetChildren;
                o = {
                    v2(v1)
                };
                J = v2[2];
                o = v2[1];
                for e, n in pairs(T(o)) do
                    v2 = e;
                    r374 = n;
                    if Q[v3].Name == "AntiKick" or Q[v3].Name == "NinjaShuriken" then
                        pcall(function(...)
                            v3 = r373;
                            v3.FireServer(v3, Q[v3]);
                            return; 
                        end);
                    end; 
                end;
            end;
            return; 
        end;
        if v1 then
            task.spawn(function(...)
                r375 = r29.GrabEvents.SetNetworkOwner;
                r376 = r29.PlayerEvents.StickyPartEvent;
                r377 = r29.MenuToys.SpawnToyRemoteFunction;
                v3 = r26;
                r378 = v3.WaitForChild(v3, "CanSpawnToy");
                local function r379(...)
                    local Z = {
                        275,
                        641,
                        643
                    };
                    X = Q[Z[4]];
                    J = r26.Character;
                    if J then
                        J = r26.Character;
                        v1 = J.FindFirstChild(J, "HumanoidRootPart");
                    end;
                    v3 = X;
                    if J then
                        return J;
                    else
                        v1 = r26.CharacterAdded;
                        X = v1.Wait(v1);
                        i = X.WaitForChild(X, "HumanoidRootPart");
                    end; 
                end;
                local function r380(...)
                    i = r31.PlotItems.PlayersInPlots;
                    if not i.FindFirstChild(i, r26.Name) then
                        return false;
                    end;
                    J = r31.Plots;
                    v1 = J[2];
                    J = J[1];
                    for X, o in pairs(J.GetChildren(J)) do
                        e = X;
                        v2 = o.FindFirstChild(o, "PlotSign");
                        if v2 then
                            n = v2.FindFirstChild(v2, "ThisPlotsOwners");
                        end;
                        if v2 then
                            t = v2.GetChildren;
                            w = t[3];
                            K = t[2];
                            for w, t in pairs(t(v2)) do
                                a = w;
                                v5 = t.Value;
                                v3 = v5 == r26.Name;
                                if v3 then
                                    v3 = r31.PlotItems;
                                    v5 = v3.FindFirstChild(v3, o.Name);
                                    if v5 then
                                        return true, v5;
                                    else
                                        
                                    end;
                                end; 
                            end;
                        end; 
                    end;
                    return false; 
                end;
                local function n(arg1_147, ...)
                    v1 = arg1_147;
                    if not v1 or not v1.FindFirstChild(v1, "StickyPart") then
                        return;
                    end;
                    X = r379();
                    if not X then
                        return;
                    end;
                    e = r16;
                    v3 = v1.FindFirstChild(v1, "SoundPart");
                    if v3 then
                        e = v1.SoundPart;
                        if not e.FindFirstChild(e, "PartOwner") or v1.SoundPart.PartOwner.Value ~= r26.Name then
                            v3 = r375;
                            v3.FireServer(v3, v1.SoundPart, v1.SoundPart.CFrame);
                        end;
                    end;
                    J = X.FindFirstChild(X, "FirePlayerPart") or X.WaitForChild(X, "FirePlayerPart", 5);
                    if J then
                        v3 = r376;
                        v3.FireServer(v3, v1.StickyPart, J, CFrame.new(0, 0, 0) * CFrame.Angles(0, math.rad(90), math.rad(90)));
                    end;
                    n = v1.GetChildren;
                    v2 = {
                        n(v1)
                    };
                    v2 = n[1];
                    o = n[3];
                    for o, v4 in v2, pairs(T(v2)) do
                        n = o;
                        if v4.Name == "Pyramid" then
                            v4.CanTouch = false;
                            v4.CanCollide = false;
                            v4.CanQuery = false;
                            v4.Transparency = 0;
                            if not v4.FindFirstChild(v4, "Highlight") then
                                Instance.new("Highlight", v4).FillColor = Color3.fromRGB(0, 0, 0);
                            end;
                        else
                            if v4.Name == "Main" then
                                v4.CanTouch = false;
                                v4.CanCollide = false;
                                v4.CanQuery = false;
                                v4.Transparency = 0;
                                if not v4.FindFirstChild(v4, "Highlight") then
                                    Instance.new("Highlight", v4).FillColor = Color3.fromRGB(255, 255, 255);
                                end;
                            else
                                if v4.IsA(v4, "BasePart") then
                                    v4.CanTouch = false;
                                    v4.CanCollide = false;
                                    v4.CanQuery = false;
                                    v4.Transparency = 1;
                                end;
                            end;
                        end; 
                    end;
                    return; 
                end;
                local function v4(arg1_148, ...)
                    r381 = arg1_148;
                    while not r378.Value do
                        if not _G.SAK or tick() - tick() > 5 then
                            return nil;
                        else
                            task.wait(.1);
                        end; 
                    end;
                    r382 = r379();
                    if r382 then
                        task.spawn(function(...)
                            pcall(function(...)
                                v3 = r377;
                                v3.InvokeServer(v3, r381, r382.CFrame * CFrame.new(0, 12, 20), Vector3.new(0, 0, 0));
                                return; 
                            end);
                            return; 
                        end);
                    end;
                    v3 = r31;
                    e = v3.FindFirstChild(v3, r26.Name .. "SpawnedInToys");
                    v2 = r31.PlotItems.PlayersInPlots;
                    o = not v2.FindFirstChild(v2, r26.Name);
                    if o then
                        i = v3.FindFirstChild(v3, r26.Name .. "SpawnedInToys");
                    end;
                    if o then
                        return e.WaitForChild(e, r381, 2);
                    end;
                    v2 = {
                        r380()
                    };
                    o = v2[2];
                    v2 = r380();
                    if v2 then
                        i = v2[2];
                    end;
                    if v2 then
                        return o.WaitForChild(o, r381, 2);
                    end;
                    return nil; 
                end; 
            end);
        else
            _G.SAK = false;
            r372();
        end;
        return; 
    end
});
vm30.AddToggle(vm30, "AntiKickV2", {
    ["Text"] = "Anti-Kick V2 (Kunai)",
    ["Default"] = false,
    ["Callback"] = function(arg1_149, ...)
        v1 = arg1_149;
        r360 = v1;
        if v1 then
            r362();
            task.wait(.2);
            task.spawn(function(...)
                while r360 do
                    if not r361() then
                        r362();
                        task.wait(.3);
                        r364();
                        r37("Anti Kick V2", "Kunai re-stuck!", 2);
                    end;
                    task.wait(0.5); 
                end;
                return; 
            end);
            r37("Anti Kick V2", "Protection activated!", 3);
        else
            r362();
            r37("Anti Kick V2", "Protection disabled!", 2);
        end;
        return; 
    end
});
vm30.AddToggle(vm30, "AntiRagdoll", {
    ["Text"] = "Anti-Ragdoll(TEST)",
    ["Default"] = false,
    ["Callback"] = function(arg1_150, ...)
        v1 = arg1_150;
        _G.ARag2 = v1;
        if v1 then
            task.spawn(function(...)
                while _G.ARag2 do
                    v1 = r26.Character;
                    i = v1;
                    v1 = i and v1.FindFirstChildOfClass(v1, "Humanoid");
                    if v1 then
                        i = v1.GetState(v1) == Enum.HumanoidStateType.Ragdoll;
                    end;
                    if v1 then
                        v1.ChangeState(v1, Enum.HumanoidStateType.Running);
                    end;
                    task.wait(.1); 
                end;
                return; 
            end);
        end;
        return; 
    end
});
r384 = false;
vm30.AddToggle(vm30, "LoopTp", {
    ["Text"] = "Loop Tp",
    ["Default"] = false,
    ["Callback"] = function(arg1_151, ...)
        X = r26.Character;
        i = X;
        if X then
            X = "Humanoid";
            r385 = X.WaitForChild(X, "HumanoidRootPart");
            if arg1_151 then
                r383 = r385.CFrame;
                r384 = true;
                if X.FindFirstChildOfClass(X, "Humanoid") then
                    v3.PlatformStand = true;
                end;
                task.spawn(function(...)
                    v1 = r384;
                    i = r385;
                    while not v1 do
                        if i then
                            r385.CFrame = CFrame.new(math.random(-500, 500), math.random(30, 480), math.random(-500, 500));
                            task.wait(.03);
                        end;
                        return; 
                    end;
                    i = r385; 
                end);
                r37("Loop TP", "Started! Start pos saved", 3);
            else
                r384 = false;
                task.wait(.1);
                if v3 then
                    v3.PlatformStand = false;
                end;
                X.FindFirstChildOfClass(X, i);
                if r383 and r385 then
                    r385.CFrame = r383;
                    r37("Loop TP", "Returned to start position!", 3);
                end;
                return;
            end;
        else
            X = r26.CharacterAdded;
            i = X.Wait(X);
        end; 
    end
});
vm30.AddToggle(vm30, "AntiBurn", {
    ["Text"] = "Anti-Burn",
    ["Default"] = false,
    ["Callback"] = function(arg1_152, ...)
        if arg1_152 then
            r387 = r26.Character;
            v3 = r387;
            r388 = v3.WaitForChild(v3, "Humanoid");
            v3 = r387;
            r389 = v3.WaitForChild(v3, "HumanoidRootPart");
            r387.PrimaryPart = r389;
            v3 = r386;
            if v3 then
                v3 = r386;
                v3.Disconnect(v3);
            end;
            v3 = r388.FireDebounce.Changed;
            r386 = v3.Connect(v3, function(arg1_153, ...)
                if arg1_153 then
                    X = r389.CFrame;
                    v3 = r31.Plots.Plot2.Barrier;
                    J = v3.FindFirstChild(v3, "PlotBarrier");
                    if J then
                        v3 = r387;
                        v3.SetPrimaryPartCFrame(v3, J.CFrame * CFrame.new(0, 6, 0));
                        task.wait(.3);
                        v3 = r387;
                        e = v3.FindFirstChild(v3, "FirePlayerPart", true);
                        if e then
                            v4 = e.GetChildren;
                            n = {
                                v4(e)
                            };
                            o = v4[2];
                            v2 = v4[3];
                            for v2, K in ipairs(T(i)) do
                                v4 = v2;
                                if K.IsA(K, "Sound") then
                                    K.Stop(K);
                                end;
                                if K.IsA(K, "Light") or K.IsA(K, "ParticleEmitter") then
                                    K.Enabled = false;
                                end; 
                            end;
                            if e.FindFirstChild(e, "CanBurn") then
                                i.CanBurn.Value = false;
                            end;
                            v3 = r388;
                            if v3.FindFirstChild(v3, "FireDebounce") then
                                r388.FireDebounce.Value = false;
                            end;
                        end;
                        v3 = task.wait;
                        v3(.6);
                        if r387 and r387.PrimaryPart then
                            v3 = Q[X];
                            v3.SetPrimaryPartCFrame(v3, r389.CFrame);
                        end;
                    end;
                end;
                return; 
            end);
        else
            v3 = r386;
            if v3 then
                v3 = Q[vm116];
                v3.Disconnect(v3);
            end;
            return;
        end; 
    end
});
r390 = false;
vm30.AddToggle(vm30, "AntiBlobman", {
    ["Text"] = "Anti-Blobman",
    ["Default"] = false,
    ["Callback"] = function(arg1_154, ...)
        v1 = arg1_154;
        r390 = v1;
        if v1 then
            i = r31.DescendantAdded;
            i.Connect(i, function(arg1_155, ...)
                r391 = arg1_155;
                if r391.Name == "CreatureBlobman" and r390 then
                    pcall(function(...)
                        v3 = r391.LeftDetector;
                        v3.Destroy(v3);
                        v3 = r391.RightDetector;
                        v3.Destroy(v3);
                        return; 
                    end);
                end;
                return; 
            end);
        end;
        return; 
    end
});
vm30.AddButton(vm30, {
    ["Text"] = "Delete Legs",
    ["Func"] = function(...)
        v1 = r26.Character;
        if not v1 then
            return;
        end;
        o = "Left Leg";
        X = o[2];
        for J, v2 in ipairs(o[1]) do
            o = J;
            n = v1.FindFirstChild(v1, v2);
            if n then
                n.Destroy(n);
            end; 
        end;
        return; 
    end
});
vm30.AddToggle(vm30, "AntiBanana", {
    ["Text"] = "Anti-Banana(TEST)",
    ["Default"] = false,
    ["Callback"] = function(arg1_156, ...)
        v1 = arg1_156;
        _G.AntiBan = v1;
        if v1 then
            task.spawn(function(...)
                while _G.AntiBan do
                    J = r31;
                    v1 = J[2];
                    J = J[1];
                    for X, o in ipairs(J.GetDescendants(J)) do
                        e = X;
                        r392 = o;
                        n = Q[v3].Name == "FoodBanana";
                        if n then
                            n = Q[v3];
                            v2 = n.IsA(n, "Model");
                        end;
                        if n then
                            pcall(function(...)
                                v3 = Q[v3];
                                v3.Destroy(v3);
                                return; 
                            end);
                        end; 
                    end;
                    task.wait(0.5); 
                end;
                return; 
            end);
        end;
        return; 
    end
});
vm30.AddToggle(vm30, "AntiFling", {
    ["Text"] = "Anti-Fling(buggy)",
    ["Default"] = false,
    ["Callback"] = function(arg1_157, ...)
        v1 = arg1_157;
        _G.AFL = v1;
        if v1 then
            task.spawn(function(...)
                while _G.AFL do
                    v1 = r26.Character;
                    v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
                    if v1 then
                        if v1.AssemblyLinearVelocity.Magnitude > 150 then
                            (i and v1.FindFirstChild(v1, "HumanoidRootPart")).AssemblyLinearVelocity = Vector3.zero;
                        end;
                    end;
                    task.wait(); 
                end;
                return; 
            end);
        end;
        return; 
    end
});
vm119 = r29;
vm132 = vm119.FindFirstChild(vm119, "GrabEvents");
if vm132 then
    vm119 = vm132.FindFirstChild(vm132, "CreateGrabLine");
    if vm119 then
        vm119 = vm119.FindFirstChild(vm119, vm128).CreateGrabLine;
        vm87 = vm119.Clone(vm119);
    end;
    vm119 = vm132.FindFirstChild(vm132, "ExtendGrabLine");
    if vm119 then
        vm119 = vm119.FindFirstChild(vm119, vm128).ExtendGrabLine;
        vm43 = vm119.Clone(vm119);
    end;
end;
vm117 = r29;
vm101 = vm117.FindFirstChild(vm117, "GrabEvents");
if vm101 then
    vm117 = vm101.FindFirstChild(vm101, "CreateGrabLine");
    if vm117 then
        vm117 = vm117.FindFirstChild(vm117, vm121).CreateGrabLine;
        vm119 = vm117.Clone(vm117);
    end;
    vm117 = vm101.FindFirstChild(vm101, "ExtendGrabLine");
    if vm117 then
        vm117 = vm117.FindFirstChild(vm117, vm121).ExtendGrabLine;
        vm103 = vm117.Clone(vm117);
    end;
end;
vm30.AddToggle(vm30, "AntiLagSCT1", {
    ["Text"] = "Anti-Lag",
    ["Default"] = false,
    ["Callback"] = function(arg1_158, ...)
        X = r26;
        i = X.FindFirstChild(X, "PlayerScripts") and X.FindFirstChild(X, "CharacterAndBeamMove");
        if i then
            i = arg1_158;
            i.Disabled = i;
        end;
        return; 
    end
});
vm30.AddToggle(vm30, "AntiSticky", {
    ["Text"] = "Anti-Sticky",
    ["Default"] = false,
    ["Callback"] = function(arg1_159, ...)
        v3 = r26.PlayerScripts;
        X = "StickyPartsTouchDetection";
        if v3.FindFirstChild(v3, X) then
            X = arg1_159;
            r26.PlayerScripts.StickyPartsTouchDetection.Disabled = X;
        end;
        return; 
    end
});
r393 = false;
vm30.AddToggle(vm30, "AntiExplode", {
    ["Text"] = "Anti-Explode",
    ["Default"] = false,
    ["Callback"] = function(arg1_160, ...)
        v1 = arg1_160;
        r393 = v1;
        if v1 then
            X = r26.Character;
            if not X then
                return;
            end;
            r394 = X.WaitForChild(X, "HumanoidRootPart");
            i = r31.ChildAdded;
            i.Connect(i, function(arg1_161, ...)
                v1 = arg1_161;
                if v1.Name == "Part" and (r393 and (v1.Position - r394.Position).Magnitude <= 20) then
                    r394.Anchored = true;
                    wait(.01);
                    r394.Anchored = false;
                end;
                return; 
            end);
        end;
        return; 
    end
});
vm30.AddToggle(vm30, "AntiVoid", {
    ["Text"] = "Anti-Void",
    ["Default"] = false,
    ["Callback"] = function(arg1_162, ...)
        if arg1_162 then
            v3 = r395;
            if v3 then
                v3 = r395;
                v3.Disconnect(v3);
            end;
            v3 = r30.Heartbeat;
            r395 = v3.Connect(v3, function(...)
                v1 = r26.Character;
                if v1 then
                    i = v1.PrimaryPart and v1.PrimaryPart.Position.Y < -50;
                    v3 = r26[X[e]];
                end;
                if v1 then
                    v1.SetPrimaryPartCFrame(v1, CFrame.new(v1.PrimaryPart.Position + Vector3.new(0, 100, 0)));
                    v1.PrimaryPart.AssemblyLinearVelocity = Vector3.zero;
                end;
                return; 
            end);
        else
            if r395 then
                v3 = r395;
                v3.Disconnect(v3);
            end;
            return;
        end; 
    end
});
vm117 = l.LocalPlayer;
vm107 = vm117.AddLeftGroupbox(vm117, "Counter-Attack", "shield");
r396 = false;
r397 = "Repulsion";
local function r399(arg1_163, arg2_163, ...)
    r400 = arg1_163;
    r401 = arg2_163;
    if not r400 or not r400.Parent then
        return;
    end;
    pcall(function(...)
        v3 = r397 == "Repulsion";
        if v3 then
            v1 = r26.Character;
            v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
            if not v1 then
                return;
            end;
            J = Instance.new("BodyVelocity");
            J.MaxForce = Vector3.new(100000000, 100000000, 100000000);
            J.Velocity = (r400.Position - v1.Position).Unit * 150;
            J.Parent = r400;
            v3 = r33;
            v3.AddItem(v3, J, 0.5);
        else
            if r397 == "Freeze" then
                v3 = r50;
                v3.FireServer(v3, r400, r400.CFrame);
                r400.Anchored = true;
                task.delay(2, function(...)
                    if r400 and r400.Parent then
                        r400.Anchored = false;
                    end;
                    return; 
                end);
            else
                if r397 == "Death" then
                    v3 = r50;
                    v3.FireServer(v3, r400, r400.CFrame);
                    v1 = Instance.new("BodyVelocity");
                    v1.MaxForce = Vector3.new(100000000, 100000000, 100000000);
                    v1.Velocity = Vector3.new(0, 5000, 0);
                    v1.Parent = r400;
                    v3 = r33;
                    v3.AddItem(v3, v1, 0.5);
                    v3 = r52;
                    v3.FireServer(v3, r400);
                    v3 = r401;
                    if v3 then
                        v3 = r401;
                        v3.ChangeState(v3, Enum.HumanoidStateType.Dead);
                    end;
                else
                    if r397 == "Kick" then
                        r402 = r59();
                        if not r402 then
                            return;
                        end;
                        X = r26.Character;
                        if X then
                            X = r26.Character;
                            i = X.FindFirstChild(X, "HumanoidRootPart");
                        end;
                        r403 = X;
                        if not r403 then
                            return;
                        end;
                        r404 = r403.CFrame;
                        r403.CFrame = r400.CFrame * CFrame.new(0, 5, 0);
                        for e = 1, 16 do
                            v4 = e;
                            pcall(function(...)
                                v3 = r402.cg;
                                v3.FireServer(v3, r402.rd, r400, r402.rw);
                                if r402.ld and r402.lw then
                                    v3 = r402.cg;
                                    v3.FireServer(v3, r402.ld, r400, r402.lw);
                                end;
                                v3 = r50;
                                v3.FireServer(v3, r400, r402.br.CFrame);
                                return; 
                            end);
                            task.wait(0); 
                        end;
                        e = getKickTargetPos();
                        o = getKickTargetPos();
                        r402.br.CFrame = o;
                        r405 = e * CFrame.new(0, 28, 0);
                        r400.CFrame = r405;
                        r400.Velocity = Vector3.zero;
                        pcall(function(...)
                            if r401 then
                                r401.PlatformStand = true;
                                r401.Sit = true;
                            end;
                            v3 = r50;
                            v3.FireServer(v3, r400, r405);
                            v1 = r402.rd;
                            v1 = v1.FindFirstChild(v1, "RightWeld") or v1.FindFirstChildWhichIsA(v1, "Weld");
                            if v1 then
                                v3 = r402.cd;
                                v3.FireServer(v3, v1);
                            end;
                            v3 = r402.cg;
                            v3.FireServer(v3, r402.rd, r400, r402.rw);
                            if r402.ld and r402.lw then
                                X = r402.ld;
                                X = X.FindFirstChild(X, "LeftWeld") or X.FindFirstChildWhichIsA(X, "Weld");
                                if X then
                                    v3 = r402.cd;
                                    v3.FireServer(v3, X);
                                end;
                                v3 = r402.cg;
                                v3.FireServer(v3, r402.ld, r400, r402.lw);
                            end;
                            v3 = r52;
                            v3.FireServer(v3, r400);
                            v3 = r51;
                            v3.FireServer(v3, r400, Vector3.zero, r400.Position, false);
                            return; 
                        end);
                        task.delay(.3, function(...)
                            if r403 and r403.Parent then
                                r403.CFrame = r404;
                            end;
                            return; 
                        end);
                    end;
                    return;
                end;
            end;
        end; 
    end);
    return; 
end;
local function r406(arg1_164, ...)
    X = r26.Character;
    if not X then
        return false;
    end;
    J = X.FindFirstChild(X, "Head");
    if not J then
        return false;
    end;
    e = J.FindFirstChild(J, "PartOwner");
    if e then
        i = e.Value == arg1_164.Name;
    end;
    if e then
        return true;
    end;
    v3 = r26;
    o = v3.FindFirstChild(v3, "IsHeld");
    if o then
        i = o.Value;
    end;
    if o then
        v3 = r31;
        v2 = v3.FindFirstChild(v3, "GrabParts");
        if v2 then
            if v2.FindFirstChild(v2, "GrabPart") then
                v4 = n.FindFirstChild(n, "WeldConstraint");
                i = 8845011521558;
                if v4 then
                    i = v4.Part1;
                end;
                if i then
                    K = v4.Part1.Parent;
                    if K then
                        i = K.Name == arg1_164.Name;
                    end;
                    if K then
                        return true;
                    end;
                end;
                if r26.Jump and r26.Sit then
                    r31 = 15;
                    Q[Z[6]] = Q[Z[5]].Position;
                end;
                return;
            end;
        end;
    end;
    return false; 
end;
local function r407(...)
    while r396 do
        v1 = r26.Character;
        X = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
        J = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
        if X then
            i = J and J.Health > 0;
            v3 = r26[r15[e]];
        end;
        if X then
            v3 = r26;
            v4 = "=#\x8e\xad\xe2\xfa";
            e = v3.FindFirstChild(v3, r15[r16(v4, 9093817684106)]);
            o = e and e.Value;
            if o then
                v4 = r25;
                n = v4[3];
                v4 = v4[1];
                for n, w in v4, ipairs(v4.GetPlayers(v4)) do
                    K = n;
                    if w ~= r26 and w.Character then
                        v3 = r406;
                        a = v3(w);
                        if a then
                            v3 = w.Character;
                            a = v3.FindFirstChild(v3, "HumanoidRootPart");
                            v3 = w.Character;
                            t = v3.FindFirstChildOfClass(v3, "Humanoid");
                            if a then
                                if t then
                                    v6 = v3.FindFirstChildOfClass(v3, v6[Y]).Health > 0;
                                end;
                                v3 = w.Character;
                                v5 = t;
                            end;
                            if a then
                                r399(v3.FindFirstChild(v3, "HumanoidRootPart"), v3.FindFirstChildOfClass(v3, v6[Y]));
                                r37("Counter-Attack", "Counter: " .. r397 .. " \xe2\x86\x92 " .. w.DisplayName, 3);
                                task.wait(0.5);
                            else
                                
                            end;
                        end;
                    end; 
                end;
            end;
            if not o then
                v2 = v1.FindFirstChild(v1, "Head");
                if v2 then
                    v4 = v2.Value ~= "";
                end;
                if v2 and v2.FindFirstChild(v2, "PartOwner") then
                    v3 = r25;
                    v4 = v3.FindFirstChild(v3, v2.Value);
                    if v4 then
                        v3 = r25;
                        K = v4 ~= r26 and v4.Character;
                    end;
                    if v4 then
                        v3 = v4.Character;
                        K = v3.FindFirstChild(v3, "HumanoidRootPart");
                        v3 = v4.Character;
                        w = v3.FindFirstChildOfClass(v3, "Humanoid");
                        if K then
                            if w then
                                t = v3.FindFirstChildOfClass(v3, t[v6]).Health > 0;
                            end;
                            v3 = v4.Character;
                            a = w;
                        end;
                        if K then
                            r399(K, w);
                            r37("Counter-Attack", "Counter: " .. r397 .. " \xe2\x86\x92 " .. v3.FindFirstChild(v3, n[w]).DisplayName, 3);
                            task.wait(0.5);
                        end;
                    end;
                end;
            end;
        end;
        task.wait(.05); 
    end;
    return; 
end;
vm107.AddToggle(vm107, "AutoAttackerToggle", {
    ["Text"] = "Auto Attacker",
    ["Default"] = false,
    ["Callback"] = function(arg1_165, ...)
        v1 = arg1_165;
        r396 = v1;
        if v1 then
            if r397 == "Kick" then
                i = not r60();
                if i then
                    r37("Auto Attacker", "Kick mode needs Blobman!", 3);
                    i = r36.AutoAttackerToggle;
                    i.SetValue(i, false);
                    return;
                end;
                r62(function(...)
                    return r396; 
                end);
            end;
            r398 = task.spawn(r407);
            r37("Auto Attacker", "Started! Mode: " .. r397, 3);
        else
            if r398 then
                task.cancel(r398);
            end;
            r37("Auto Attacker", "Stopped!", 2);
            return;
        end; 
    end
});
vm107.AddDropdown(vm107, "CounterMode", {
    ["Text"] = "Counter Mode",
    ["Values"] = {
        "Repulsion",
        "Freeze",
        "Death",
        "Kick"
    },
    ["Default"] = 1,
    ["Callback"] = function(arg1_166, ...)
        v1 = arg1_166;
        r397 = v1;
        v3 = v1;
        if r396 and v1 == "Kick" then
            if not r60() then
                r37("Counter Mode", "Kick needs Blobman! Switching to Repulsion", 3);
                i = r35.CounterMode;
                i.SetValue(i, "Repulsion");
                r397 = "Repulsion";
                return;
            end;
            r62(function(...)
                return r396; 
            end);
        end;
        r37("Counter Mode", "Mode: " .. v1, 2);
        return; 
    end
});
vm107.AddLabel(vm107, "\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81");
vm107.AddLabel(vm107, "Repulsion = Push away");
vm107.AddLabel(vm107, "Freeze = Anchor 2s");
vm107.AddLabel(vm107, "Death = Sky velocity");
vm107.AddLabel(vm107, "Kick = Blob kick (needs blob)");
vm68.AddToggle(vm68, "NoClip", {
    ["Text"] = "No Clip(buggy)",
    ["Default"] = false,
    ["Callback"] = function(arg1_167, ...)
        v1 = arg1_167;
        X = v1;
        _G.sctNC = X;
        if v1 then
            v3 = _G.sctNCConn;
            if v3 then
                v3 = _G.sctNCConn;
                v3.Disconnect(v3);
            end;
            X = r30.Stepped;
            _G.sctNCConn = X.Connect(X, function(...)
                if not _G.sctNC then
                    return;
                end;
                o = "\xcb\xa9\xc1=\xe6\xd1x%\x02";
                e = r16(o, 5012437649694);
                v1 = r26[r15[e]];
                if v1 then
                    o = v1.GetDescendants;
                    e = {
                        o(v1)
                    };
                    X = o[2];
                    e = o[1];
                    for J, v2 in ipairs(T(e)) do
                        o = J;
                        if v2.IsA(v2, "BasePart") then
                            v2.CanCollide = false;
                        end; 
                    end;
                end;
                return; 
            end);
        else
            if _G.sctNCConn then
                v3 = _G.sctNCConn;
                v3.Disconnect(v3);
                _G.sctNCConn = nil;
            end;
            v2 = "\xec\xb6\x82\xda\"\x01KT\xd9";
            o = r16(v2, 16447039020522);
            X = r26[r15[o]];
            if X then
                v2 = X.GetDescendants;
                o = {
                    v2(X)
                };
                J = v2[2];
                o = v2[1];
                for e, n in ipairs(T(o)) do
                    v2 = e;
                    if n.IsA(n, "BasePart") then
                        n.CanCollide = true;
                    end; 
                end;
            end;
            return;
        end; 
    end
});
_G.WSVal = 16;
_G.JPVal = 50;
vm68.AddSlider(vm68, "WalkSpeed", {
    ["Text"] = "Walk Speed",
    ["Min"] = 0,
    ["Max"] = 500,
    ["Default"] = 16,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_168, ...)
        _G.WSVal = arg1_168;
        return; 
    end
});
vm68.AddSlider(vm68, "JumpPower", {
    ["Text"] = "Jump Power",
    ["Min"] = 0,
    ["Max"] = 500,
    ["Default"] = 24,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_169, ...)
        _G.JPVal = arg1_169;
        return; 
    end
});
vm68.AddSlider(vm68, "WalkSpeed", {
    ["Text"] = "Walk Speed",
    ["Min"] = 0,
    ["Max"] = 500,
    ["Default"] = 16,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_170, ...)
        v1 = arg1_170;
        X = v1;
        _G.WSVal = X;
        X = r26.Character;
        i = X;
        X = i and X.FindFirstChildOfClass(X, "Humanoid");
        if X then
            i = arg1_170;
            X.WalkSpeed = i;
        end;
        return; 
    end
});
vm68.AddButton(vm68, {
    ["Text"] = "Reset WalkSpeed",
    ["Func"] = function(...)
        _G.WSVal = 16;
        v1 = r26.Character;
        v1 = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
        if v1 then
            v1.WalkSpeed = 16;
        end;
        v3 = r35.WalkSpeed;
        v3.SetValue(v3, 16);
        return; 
    end
});
vm68.AddButton(vm68, {
    ["Text"] = "Reset WalkSpeed",
    ["Func"] = function(...)
        v1 = r26.Character;
        v1 = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
        if v1 then
            v1.WalkSpeed = 16;
        end;
        return; 
    end
});
vm68.AddButton(vm68, {
    ["Text"] = "Set JumpPower",
    ["Func"] = function(...)
        v1 = r26.Character;
        v1 = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
        if v1 then
            if v1.UseJumpPower then
                (i and v1.FindFirstChildOfClass(v1, "Humanoid")).JumpPower = _G.JPVal;
            else
                (i and v1.FindFirstChildOfClass(v1, "Humanoid")).JumpHeight = _G.JPVal * _G.JPVal / 392.4;
            end;
        end;
        return; 
    end
});
vm68.AddButton(vm68, {
    ["Text"] = "Reset JumpPower",
    ["Func"] = function(...)
        v1 = r26.Character;
        v1 = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
        if v1 then
            if v1.UseJumpPower then
                (i and v1.FindFirstChildOfClass(v1, "Humanoid")).JumpPower = 50;
            else
                (i and v1.FindFirstChildOfClass(v1, "Humanoid")).JumpHeight = 7.2;
            end;
        end;
        return; 
    end
});
vm64.AddDropdown(vm64, "GucciType", {
    ["Text"] = "Gucci Type",
    ["Values"] = {
        "Train(Invisible)",
        "Blobman"
    },
    ["Default"] = 1
});
vm64.AddDropdown(vm64, "AntiInputType", {
    ["Text"] = "Anti-Input Type",
    ["Values"] = {
        "FoodBanana",
        "FoodCoconut",
        "FoodFrenchFries",
        "FoodMeatStick"
    },
    ["Default"] = 1,
    ["Callback"] = function(arg1_171, ...)
        _G.AILToy = arg1_171;
        return; 
    end
});
r408 = vm113.AddLabel(vm113, "Health: --");
r409 = vm113.AddLabel(vm113, "WalkSpeed: --");
r410 = vm113.AddLabel(vm113, "JumpPower: --");
r411 = vm113.AddLabel(vm113, "State: --");
r412 = vm113.AddLabel(vm113, "Player Who Grabbed You: --");
task.spawn(function(...)
    while task.wait(0.5) do
        pcall(function(...)
            o = "\x98y\xa9\x15\xca\x10yf\xf9";
            v1 = r26[r15[r16(o, 6344035093386)]];
            X = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
            if X then
                math.floor(X.Health);
                v3 = X.WalkSpeed;
                e = v3;
                o = X.UseJumpPower and X.JumpPower;
                v3 = v3;
                i = o;
                if o then
                    o = o;
                    v3 = r408;
                    v3.SetText(v3, "Health: " .. math.floor(X.Health));
                    v3 = r409;
                    v3.SetText(v3, "WalkSpeed: " .. v3);
                    v3 = r410;
                    v3 = v3;
                    v3 = v3;
                    v3.SetText(v3, (X.UseJumpPower and "JumpPower: " or "JumpHeight: ") .. o);
                    v3 = r411;
                    v3.SetText(v3, "State: " .. tostring(X.GetState(X)));
                    v3 = r26;
                    J = v3.FindFirstChild(v3, "IsHeld");
                    if J then
                        i = J.Value;
                    end;
                    if J then
                        e = v1 and v3.FindFirstChild(v3, "Head");
                        if e then
                            i = e.FindFirstChild(e, "PartOwner");
                        end;
                        if e then
                            v2 = e.Value;
                        end;
                        v3 = r26;
                        v3 = r412;
                        v3.SetText(v3, "Player Who Grabbed You: " .. (o or "?"));
                    else
                        v3 = r412;
                        v3.SetText(v3, "Player Who Grabbed You: --");
                    end;
                    return;
                else
                    i = string.format("%.1f", (i and v1.FindFirstChildOfClass(v1, "Humanoid")).JumpHeight);
                end;
            end; 
        end); 
    end;
    return; 
end);
vm125 = l.Visual;
vm23 = vm125.AddLeftGroupbox(vm125, "Misc", "layers");
vm125 = l.Visual;
vm19 = vm125.AddRightGroupbox(vm125, "ESP", "eye");
vm125 = l.Visual;
vm131 = vm125.AddRightGroupbox(vm125, "Shaders", "palette");
vm23.AddToggle(vm23, "AntiKickESP", {
    ["Text"] = "Anti-Kick ESP",
    ["Default"] = false,
    ["Callback"] = function(arg1_172, ...)
        v1 = arg1_172;
        _G.AKESP = v1;
        if v1 then
            task.spawn(function(...)
                while _G.AKESP do
                    J = r25;
                    X = J[3];
                    J = J[1];
                    for X, o in J, ipairs(J.GetPlayers(J)) do
                        e = X;
                        v3 = o ~= r26;
                        if v3 then
                            v3 = r31;
                            v2 = v3.FindFirstChild(v3, o.Name .. "SpawnedInToys");
                            if v2 then
                                a = "NinjaKunai";
                                t = "NinjaShuriken";
                                n = a[1];
                                v4 = a[2];
                                for K, a in ipairs({
                                    a,
                                    t,
                                    "AntiKick"
                                }) do
                                    w = K;
                                    t = v2.FindFirstChild(v2, a);
                                    if t then
                                        F = "Character";
                                        v6 = o[F];
                                        if v6 then
                                            v6 = o.Character;
                                            v5 = v6.FindFirstChild(v6, "Head");
                                        end;
                                        if v6 then
                                            Y = "AKESPGui";
                                            F = v6.FindFirstChild(v6, Y);
                                            if F then
                                                F.Name = "AKESPGui";
                                                F = v6;
                                                F.Adornee = F;
                                                F.Size = UDim2.new(0, 100, 0, 20);
                                                F.StudsOffset = Vector3.new(0, 3, 0);
                                                F.AlwaysOnTop = true;
                                                F.Parent = v5;
                                                Y = F.FindFirstChild(F, "TL");
                                                F = Y;
                                                if Y then
                                                    F.Name = "TL";
                                                    F.Size = UDim2.new(1, 0, 1, 0);
                                                    F.BackgroundTransparency = 1;
                                                    F.Text = "[AK]";
                                                    F.TextColor3 = Color3.fromRGB(255, 0, 0);
                                                    F.TextScaled = true;
                                                else
                                                    F = Instance.new("TextLabel", F);
                                                end;
                                            else
                                                v6 = Instance.new("BillboardGui");
                                            end;
                                        end;
                                    end; 
                                end;
                            end;
                        end; 
                    end;
                    task.wait(1); 
                end;
                return; 
            end);
        end;
        return; 
    end
});
vm23.AddSlider(vm23, "Transparency", {
    ["Text"] = "Transparency",
    ["Min"] = 0,
    ["Max"] = 1,
    ["Default"] = .6,
    ["Rounding"] = 1,
    ["Callback"] = function(arg1_173, ...)
        _G.UITrans = arg1_173;
        return; 
    end
});
vm23.AddToggle(vm23, "ViewPCID", {
    ["Text"] = "View PCID",
    ["Default"] = false,
    ["Callback"] = function(arg1_174, ...)
        if arg1_174 then
            task.spawn(function(...)
                J = r25;
                X = J[3];
                J = J[1];
                for X, o in J, ipairs(J.GetPlayers(J)) do
                    e = X;
                    if o.Character then
                        a = v2.GetDescendants;
                        K = a[3];
                        v4 = a[2];
                        for K, a in ipairs(a(v2)) do
                            w = K;
                            v5 = a.Name;
                            v6 = v5.lower(v5);
                            if v6.find(v6, "partesp") or v6.find(v6, "playercharacterlocationdetector") then
                                t = v3.FindFirstChild(v3, "Head");
                                if t then
                                    v5 = Instance.new("BillboardGui");
                                    v5.Name = "PCIDGui";
                                    v6 = v3;
                                    v5.Adornee = v6;
                                    v5.Size = UDim2.new(0, 120, 0, 20);
                                    v5.StudsOffset = Vector3.new(0, 5, 0);
                                    v5.AlwaysOnTop = true;
                                    v5.Parent = t;
                                    v6 = Instance.new("TextLabel", v5);
                                    v6.Size = UDim2.new(1, 0, 1, 0);
                                    v6.BackgroundTransparency = 1;
                                    v6.Text = "PCID:" .. a.Name;
                                    v6.TextColor3 = Color3.fromRGB(0, 255, 255);
                                    v6.TextScaled = true;
                                end;
                            end; 
                        end;
                    end; 
                end;
                return; 
            end);
        else
            e = r25;
            X = e[2];
            e = e[1];
            for J, v2 in ipairs(e.GetPlayers(e)) do
                o = J;
                v3 = v2.Character;
                if v3 then
                    v3 = v2.Character;
                    n = v3.FindFirstChild(v3, "Head");
                    if n then
                        v4 = n.FindFirstChild(n, "PCIDGui");
                        if v4 then
                            v4.Destroy(v4);
                        end;
                    end;
                end; 
            end;
            return;
        end; 
    end
});
r413 = {};
vm19.AddToggle(vm19, "BoxESP", {
    ["Text"] = "PCLD View",
    ["Default"] = false,
    ["Callback"] = function(arg1_175, ...)
        if arg1_175 then
            e = r31;
            X = e[2];
            J = e[3];
            e = "ipairs";
            for J, v2 in ipairs(e.GetDescendants(e)) do
                v5 = "\x81@\x02b\x9c*\x87\xc2";
                o = J;
                v4 = v2.IsA(v2, r15[r16(v5, 10035615797825)]);
                if v4 then
                    v5 = v2.Name;
                    v5 = "partesp";
                    v3 = v3;
                    n = (v5.lower(v5) == v5 or v5.lower(v5) == "playercharacterlocationdetector") and not r413[v2];
                    v3 = v3;
                end;
                if v4 then
                    n = Instance.new("BoxHandleAdornment");
                    n.Adornee = v2;
                    n.AlwaysOnTop = true;
                    n.ZIndex = 5;
                    n.Color3 = Color3.new(1, 1, 1);
                    n.Transparency = 0.5;
                    n.Size = v2.Size;
                    n.Parent = r27;
                    r413[v2] = n;
                end; 
            end;
        else
            e = 275[3];
            for e, v2 in 275[1], pairs(r413) do
                o = e;
                v2.Destroy(v2); 
            end;
            r413 = {};
            return;
        end; 
    end
});
vm19.AddToggle(vm19, "NicknameESP", {
    ["Text"] = "Nickname ESP",
    ["Default"] = false,
    ["Callback"] = function(arg1_176, ...)
        if arg1_176 then
            e = r25;
            J = e[3];
            e = e[1];
            for J, v2 in e, pairs(e.GetPlayers(e)) do
                o = J;
                if v2 ~= r26 and (v2.Character and 281.FindFirstChild(281, "HumanoidRootPart")) then
                    n = Instance.new("BillboardGui");
                    n.Name = "NameESP";
                    n.Adornee = v2.Character.HumanoidRootPart;
                    n.Size = UDim2.new(0, 100, 0, 30);
                    n.StudsOffset = Vector3.new(0, 3, 0);
                    n.AlwaysOnTop = true;
                    n.Parent = v2.Character.HumanoidRootPart;
                    v4 = Instance.new("TextLabel");
                    v4.Size = UDim2.new(1, 0, 1, 0);
                    v4.BackgroundTransparency = 1;
                    v4.Text = v2.Name;
                    v4.TextColor3 = Color3.new(1, 1, 1);
                    v4.TextStrokeTransparency = 0;
                    v4.TextScaled = true;
                    v4.Parent = n;
                end; 
            end;
        else
            o = r25;
            v2 = {
                o.GetPlayers(o)
            };
            e = o[3];
            for e, v2 in o[1], pairs(T(v2)) do
                o = e;
                v4 = v2.Character;
                if v4 then
                    v4 = v2.Character;
                    n = v4.FindFirstChild(v4, "HumanoidRootPart");
                end;
                if v4 then
                    v3 = v2.Character.HumanoidRootPart;
                    n = v3.FindFirstChild(v3, "NameESP");
                    if n then
                        n.Destroy(n);
                    end;
                end; 
            end;
            return;
        end; 
    end
});
vm131.AddToggle(vm131, "DreamyNight", {
    ["Text"] = "Dreamy Night Shader",
    ["Default"] = false,
    ["Callback"] = function(arg1_177, ...)
        v3 = game;
        r422 = v3.GetService(v3, "Lighting");
        if arg1_177 then
            r415 = {
                ["ClockTime"] = r422.ClockTime,
                ["GlobalShadows"] = r422.GlobalShadows,
                ["Brightness"] = r422.Brightness,
                ["EnvironmentDiffuseScale"] = r422.EnvironmentDiffuseScale,
                ["EnvironmentSpecularScale"] = r422.EnvironmentSpecularScale,
                ["FogEnd"] = r422.FogEnd
            };
            if r414 then
                o = n[3];
                for o, n in n[1], ipairs(r414) do
                    v2 = o;
                    r423 = n;
                    pcall(function(...)
                        v3 = Q[i];
                        v3.Destroy(v3);
                        return; 
                    end); 
                end;
            end;
            local function J(arg1_178, arg2_178, arg3_178, ...)
                v1 = arg1_178;
                i = arg2_178;
                v1.Name = i;
                o = ("\xce5\x88\xac")[3];
                v2 = ("\xce5\x88\xac")[1];
                for o, v4 in v2, pairs(arg3_178) do
                    v1[o] = v4; 
                end;
                v1.Parent = r422;
                r414[#r414 + 1] = v1;
                return; 
            end;
            r414 = {};
            J(Instance.new("BlurEffect"), "DreamyBlur", {
                ["Size"] = 6
            });
            J(Instance.new("BloomEffect"), "DreamyBloom", {
                ["Intensity"] = 1.6,
                ["Size"] = 90,
                ["Threshold"] = 1.4
            });
            J(Instance.new("ColorCorrectionEffect"), "DreamyCC", {
                ["Brightness"] = .15,
                ["Contrast"] = -0.1,
                ["Saturation"] = 0.25,
                ["TintColor"] = Color3.fromRGB(210, 220, 255)
            });
            J(Instance.new("SunRaysEffect"), "DreamySR", {
                ["Intensity"] = .05,
                ["Spread"] = .6
            });
            J(Instance.new("Atmosphere"), "DreamyAtmo", {
                ["Density"] = .45,
                ["Offset"] = .1,
                ["Color"] = Color3.fromRGB(180, 190, 255),
                ["Decay"] = Color3.fromRGB(120, 130, 180),
                ["Glare"] = .15,
                ["Haze"] = 3
            });
            r422.ClockTime = 0.5;
            r422.GlobalShadows = false;
            r422.Brightness = 2;
            r422.EnvironmentDiffuseScale = .2;
            r422.EnvironmentSpecularScale = .1;
            r422.FogEnd = 200000;
        else
            if r414 then
                n = r414;
                v2 = 278[3];
                o = 278[2];
                for v2, n in ipairs(n) do
                    J = v2;
                    r424 = n;
                    pcall(function(...)
                        v3 = r424;
                        v3.Destroy(v3);
                        return; 
                    end); 
                end;
            end;
            v4 = r422;
            K = {
                v4.GetChildren(v4)
            };
            n = v4[3];
            for n, v4 in v4[1], pairs(T(K)) do
                e = n;
                K = v4.Name;
                if K.find(K, "Dreamy") then
                    v4.Destroy(v4);
                end; 
            end;
            if r415 then
                v4 = r415;
                v2 = K[2];
                n = K[3];
                for n, v4 in pairs(v4) do
                    r422[n] = v4; 
                end;
            end;
            return;
        end; 
    end
});
vm131.AddToggle(vm131, "GoldenDay", {
    ["Text"] = "Golden Day Shader",
    ["Default"] = false,
    ["Callback"] = function(arg1_179, ...)
        v3 = game;
        r425 = v3.GetService(v3, "Lighting");
        if arg1_179 then
            r417 = {
                ["ClockTime"] = r425.ClockTime,
                ["GlobalShadows"] = r425.GlobalShadows,
                ["Brightness"] = r425.Brightness,
                ["EnvironmentDiffuseScale"] = r425.EnvironmentDiffuseScale,
                ["EnvironmentSpecularScale"] = r425.EnvironmentSpecularScale,
                ["FogEnd"] = r425.FogEnd
            };
            if r416 then
                e = n[2];
                o = n[3];
                for o, n in ipairs(r416) do
                    v2 = o;
                    r426 = n;
                    pcall(function(...)
                        v3 = r426;
                        v3.Destroy(v3);
                        return; 
                    end); 
                end;
            end;
            local function J(arg1_180, arg2_180, arg3_180, ...)
                v1 = arg1_180;
                i = arg2_180;
                v1.Name = i;
                e = ("\xd6l\xd28")[2];
                o = ("\xd6l\xd28")[3];
                v2 = "pairs";
                for o, v4 in pairs(arg3_180) do
                    v1[o] = v4; 
                end;
                v1.Parent = r425;
                r416[#r416 + 1] = v1;
                return; 
            end;
            r416 = {};
            J(Instance.new("BloomEffect"), "DayBloom", {
                ["Intensity"] = .8,
                ["Size"] = 56,
                ["Threshold"] = 1.1
            });
            J(Instance.new("ColorCorrectionEffect"), "DayCC", {
                ["Brightness"] = .08,
                ["Contrast"] = .15,
                ["Saturation"] = .35,
                ["TintColor"] = Color3.fromRGB(255, 245, 220)
            });
            J(Instance.new("SunRaysEffect"), "DaySR", {
                ["Intensity"] = 0.25,
                ["Spread"] = .8
            });
            J(Instance.new("BlurEffect"), "DayBlur", {
                ["Size"] = 2
            });
            J(Instance.new("Atmosphere"), "DayAtmo", {
                ["Density"] = .3,
                ["Offset"] = 0,
                ["Color"] = Color3.fromRGB(255, 235, 180),
                ["Decay"] = Color3.fromRGB(255, 200, 120),
                ["Glare"] = .4,
                ["Haze"] = 1.5
            });
            r425.ClockTime = 14;
            r425.GlobalShadows = true;
            r425.Brightness = 3;
            r425.EnvironmentDiffuseScale = 1;
            r425.EnvironmentSpecularScale = .8;
            r425.FogEnd = 100000;
        else
            if r416 then
                n = r416;
                v2 = 278[3];
                for v2, n in 278[1], ipairs(n) do
                    J = v2;
                    r427 = n;
                    pcall(function(...)
                        v3 = r427;
                        v3.Destroy(v3);
                        return; 
                    end); 
                end;
            end;
            v4 = r425;
            K = {
                v4.GetChildren(v4)
            };
            o = v4[1];
            v2 = v4[2];
            for n, v4 in pairs(T(K)) do
                e = n;
                K = v4.Name;
                if K.find(K, "Day") then
                    v4.Destroy(v4);
                end; 
            end;
            if r417 then
                v4 = r417;
                v2 = K[2];
                n = K[3];
                for n, v4 in pairs(v4) do
                    r425[n] = v4; 
                end;
            end;
            return;
        end; 
    end
});
vm131.AddToggle(vm131, "PinkSunset", {
    ["Text"] = "Pink Sunset Shader",
    ["Default"] = false,
    ["Callback"] = function(arg1_181, ...)
        v3 = game;
        r428 = v3.GetService(v3, "Lighting");
        if arg1_181 then
            r419 = {
                ["ClockTime"] = r428.ClockTime,
                ["GlobalShadows"] = r428.GlobalShadows,
                ["Brightness"] = r428.Brightness,
                ["EnvironmentDiffuseScale"] = r428.EnvironmentDiffuseScale,
                ["EnvironmentSpecularScale"] = r428.EnvironmentSpecularScale,
                ["FogEnd"] = r428.FogEnd
            };
            if r418 then
                o = n[3];
                for o, n in n[1], ipairs(r418) do
                    v2 = o;
                    r429 = n;
                    pcall(function(...)
                        v3 = r429;
                        v3.Destroy(v3);
                        return; 
                    end); 
                end;
            end;
            local function J(arg1_182, arg2_182, arg3_182, ...)
                v1 = arg1_182;
                i = arg2_182;
                v1.Name = i;
                o = ("g\xb7\x80\x83")[3];
                e = ("g\xb7\x80\x83")[2];
                v2 = "pairs";
                for o, v4 in pairs(arg3_182) do
                    v1[o] = v4; 
                end;
                v1.Parent = r428;
                r418[#r418 + 1] = v1;
                return; 
            end;
            r418 = {};
            J(Instance.new("BloomEffect"), "PinkBloom", {
                ["Intensity"] = 1.2,
                ["Size"] = 70,
                ["Threshold"] = 1
            });
            J(Instance.new("ColorCorrectionEffect"), "PinkCC", {
                ["Brightness"] = .1,
                ["Contrast"] = .1,
                ["Saturation"] = 0.5,
                ["TintColor"] = Color3.fromRGB(255, 180, 200)
            });
            J(Instance.new("SunRaysEffect"), "PinkSR", {
                ["Intensity"] = .35,
                ["Spread"] = 1
            });
            J(Instance.new("BlurEffect"), "PinkBlur", {
                ["Size"] = 3
            });
            J(Instance.new("Atmosphere"), "PinkAtmo", {
                ["Density"] = .35,
                ["Offset"] = .05,
                ["Color"] = Color3.fromRGB(255, 170, 190),
                ["Decay"] = Color3.fromRGB(255, 100, 130),
                ["Glare"] = .3,
                ["Haze"] = 2
            });
            r428.ClockTime = 18.5;
            r428.GlobalShadows = true;
            r428.Brightness = 2.5;
            r428.EnvironmentDiffuseScale = .8;
            r428.EnvironmentSpecularScale = .6;
            r428.FogEnd = 80000;
        else
            if r418 then
                n = r418;
                v2 = 278[3];
                for v2, n in 278[1], ipairs(n) do
                    J = v2;
                    r430 = n;
                    pcall(function(...)
                        v3 = Q[v4];
                        v3.Destroy(v3);
                        return; 
                    end); 
                end;
            end;
            v4 = r428;
            K = {
                v4.GetChildren(v4)
            };
            o = v4[1];
            v2 = v4[2];
            for n, v4 in pairs(T(K)) do
                e = n;
                K = v4.Name;
                if K.find(K, "Pink") then
                    v4.Destroy(v4);
                end; 
            end;
            if r419 then
                v4 = r419;
                n = K[3];
                for n, v4 in K[1], pairs(v4) do
                    r428[n] = v4; 
                end;
            end;
            return;
        end; 
    end
});
vm131.AddToggle(vm131, "CrystalDay", {
    ["Text"] = "Crystal Day Shader",
    ["Default"] = false,
    ["Callback"] = function(arg1_183, ...)
        v3 = game;
        r431 = v3.GetService(v3, "Lighting");
        if arg1_183 then
            r421 = {
                ["ClockTime"] = r431.ClockTime,
                ["GlobalShadows"] = r431.GlobalShadows,
                ["Brightness"] = r431.Brightness,
                ["EnvironmentDiffuseScale"] = r431.EnvironmentDiffuseScale,
                ["EnvironmentSpecularScale"] = r431.EnvironmentSpecularScale,
                ["FogEnd"] = r431.FogEnd
            };
            if r420 then
                o = n[3];
                e = n[2];
                for o, n in ipairs(r420) do
                    v2 = o;
                    r432 = n;
                    pcall(function(...)
                        v3 = r432;
                        v3.Destroy(v3);
                        return; 
                    end); 
                end;
            end;
            local function J(arg1_184, arg2_184, arg3_184, ...)
                v1 = arg1_184;
                i = arg2_184;
                v1.Name = i;
                o = ("&pHw")[3];
                v2 = ("&pHw")[1];
                for o, v4 in v2, pairs(arg3_184) do
                    v1[o] = v4; 
                end;
                v1.Parent = r431;
                r420[#r420 + 1] = v1;
                return; 
            end;
            r420 = {};
            J(Instance.new("BloomEffect"), "CrystBloom", {
                ["Intensity"] = .6,
                ["Size"] = 40,
                ["Threshold"] = 1.3
            });
            J(Instance.new("ColorCorrectionEffect"), "CrystCC", {
                ["Brightness"] = .05,
                ["Contrast"] = .2,
                ["Saturation"] = .6,
                ["TintColor"] = Color3.fromRGB(200, 240, 255)
            });
            J(Instance.new("SunRaysEffect"), "CrystSR", {
                ["Intensity"] = .2,
                ["Spread"] = 0.5
            });
            J(Instance.new("Atmosphere"), "CrystAtmo", {
                ["Density"] = .2,
                ["Offset"] = 0,
                ["Color"] = Color3.fromRGB(200, 230, 255),
                ["Decay"] = Color3.fromRGB(150, 200, 255),
                ["Glare"] = 0.5,
                ["Haze"] = 1
            });
            r431.ClockTime = 12;
            r431.GlobalShadows = true;
            r431.Brightness = 3.5;
            r431.EnvironmentDiffuseScale = 1.2;
            r431.EnvironmentSpecularScale = 1;
            r431.FogEnd = 200000;
        else
            if r420 then
                n = r420;
                v2 = 278[3];
                for v2, n in 278[1], ipairs(n) do
                    J = v2;
                    r433 = n;
                    pcall(function(...)
                        v3 = r433;
                        v3.Destroy(v3);
                        return; 
                    end); 
                end;
            end;
            v4 = r431;
            K = {
                v4.GetChildren(v4)
            };
            v2 = v4[2];
            o = v4[1];
            for n, v4 in pairs(T(K)) do
                e = n;
                K = v4.Name;
                if K.find(K, "Cryst") then
                    v4.Destroy(v4);
                end; 
            end;
            if r421 then
                v4 = r421;
                n = K[3];
                v2 = K[2];
                for n, v4 in pairs(v4) do
                    r431[n] = v4; 
                end;
            end;
            return;
        end; 
    end
});
vm131.AddButton(vm131, {
    ["Text"] = "Full Bright",
    ["Func"] = function(...)
        v3 = game;
        v1 = v3.GetService(v3, "Lighting");
        v1.Brightness = 2;
        v1.ClockTime = 14;
        v1.FogEnd = 100000;
        v1.GlobalShadows = false;
        v1.OutdoorAmbient = Color3.fromRGB(128, 128, 128);
        r37("Visual", "Fullbright ON!", 3);
        return; 
    end
});
vm149 = l.AnimCreator;
vm136 = vm149.AddLeftGroupbox(vm149, "Target", "crosshair");
vm161 = vm149.AddRightGroupbox(vm149, "Saved Anims", "activity");
vm171 = {
    "Torso",
    "Head",
    "Left Arm",
    "Right Arm",
    "Left Leg",
    "Right Leg"
};
vm136.AddDropdown(vm136, "AC_Target", {
    ["Text"] = "Target",
    ["Values"] = r57(),
    ["Default"] = 1,
    ["Callback"] = function(arg1_185, ...)
        v1 = arg1_185;
        return; 
    end
});
vm136.AddToggle(vm136, "AC_AnimGrab", {
    ["Text"] = "Anim Grab",
    ["Default"] = false
});
vm136.AddLabel(vm136, "Anim");
vm136.AddButton(vm136, {
    ["Text"] = "Start Record",
    ["Func"] = function(...)
        r37("Anim Creator", "", 3);
        return; 
    end
});
vm136.AddButton(vm136, {
    ["Text"] = "Stop Record",
    ["Func"] = function(...)
        r37("Anim Creator", "", 3);
        return; 
    end
});
vm136.AddButton(vm136, {
    ["Text"] = "Playback",
    ["Func"] = function(...)
        r37("Anim Creator", "", 3);
        return; 
    end
});
vm136.AddToggle(vm136, "AC_LoopPlayback", {
    ["Text"] = "Loop Playback",
    ["Default"] = false
});
vm161.AddDropdown(vm161, "AC_AnimList", {
    ["Text"] = "Anim List",
    ["Values"] = {
        "---"
    },
    ["Default"] = 1
});
vm161.AddInput(vm161, "AC_AnimName", {
    ["Text"] = "Anim Name",
    ["Default"] = "Anim1"
});
vm161.AddButton(vm161, {
    ["Text"] = "Remove Anim",
    ["Func"] = function(...)
        return; 
    end
});
vm161.AddButton(vm161, {
    ["Text"] = "Save Anim",
    ["Func"] = function(...)
        return; 
    end
});
vm161.AddButton(vm161, {
    ["Text"] = "Load Anim",
    ["Func"] = function(...)
        return; 
    end
});
vm168 = vm149.AddLeftTabbox(vm149, "Editor");
vm142 = vm168.AddTab(vm168, "Sliders");
vm166 = vm168.AddTab(vm168, "Textbox");
vm142.AddDropdown(vm142, "AC_TargetPartsS", {
    ["Text"] = "Target Parts",
    ["Values"] = vm171,
    ["Default"] = 1
});
vm142.AddLabel(vm142, "Rotation");
vm142.AddSlider(vm142, "AC_RotXS", {
    ["Text"] = "Rotation X",
    ["Min"] = 0,
    ["Max"] = 360,
    ["Default"] = 0,
    ["Rounding"] = 0
});
vm142.AddSlider(vm142, "AC_RotYS", {
    ["Text"] = "Rotation Y",
    ["Min"] = 0,
    ["Max"] = 360,
    ["Default"] = 0,
    ["Rounding"] = 0
});
vm142.AddSlider(vm142, "AC_RotZS", {
    ["Text"] = "Rotation Z",
    ["Min"] = 0,
    ["Max"] = 360,
    ["Default"] = 0,
    ["Rounding"] = 0
});
vm142.AddLabel(vm142, "Position");
vm142.AddSlider(vm142, "AC_PosXS", {
    ["Text"] = "Position X",
    ["Min"] = -30,
    ["Max"] = 30,
    ["Default"] = 0,
    ["Rounding"] = 0
});
vm142.AddSlider(vm142, "AC_PosYS", {
    ["Text"] = "Position Y",
    ["Min"] = -30,
    ["Max"] = 30,
    ["Default"] = 0,
    ["Rounding"] = 0
});
vm142.AddSlider(vm142, "AC_PosZS", {
    ["Text"] = "Position Z",
    ["Min"] = -30,
    ["Max"] = 30,
    ["Default"] = -4,
    ["Rounding"] = 0
});
vm166.AddDropdown(vm166, "AC_TargetPartsT", {
    ["Text"] = "Target Parts",
    ["Values"] = vm171,
    ["Default"] = 1
});
vm166.AddLabel(vm166, "Rotation");
vm166.AddInput(vm166, "AC_RotXT", {
    ["Text"] = "X Value",
    ["Default"] = "0"
});
vm166.AddInput(vm166, "AC_RotYT", {
    ["Text"] = "Y Value",
    ["Default"] = "0"
});
vm166.AddInput(vm166, "AC_RotZT", {
    ["Text"] = "Z Value",
    ["Default"] = "0"
});
vm166.AddLabel(vm166, "Position");
vm166.AddInput(vm166, "AC_PosXT", {
    ["Text"] = "X Pos Value",
    ["Default"] = "0"
});
vm166.AddInput(vm166, "AC_PosYT", {
    ["Text"] = "Y Pos Value",
    ["Default"] = "0"
});
vm166.AddInput(vm166, "AC_PosZT", {
    ["Text"] = "Z Pos Value",
    ["Default"] = "-4"
});
vm176 = l.Server;
vm154 = vm176.AddLeftGroupbox(vm176, "Lags", "zap");
vm174 = vm176.AddRightGroupbox(vm176, "No Blobman", "activity");
vm174.AddButton(vm174, "Bring Server", function(...)
    i = game;
    r434 = i.GetService(i, "Players").LocalPlayer;
    v3 = game;
    r435 = v3.GetService(v3, "Players");
    v3 = game;
    r436 = v3.GetService(v3, "ReplicatedStorage").GrabEvents.SetNetworkOwner;
    o = r434.Character;
    if o then
        o = r434.Character;
        i = o.FindFirstChild(o, "HumanoidRootPart");
    end;
    r437 = o;
    if not r437 then
        return;
    end;
    r438 = r437.Position;
    task.spawn(function(...)
        J = Q[X];
        v1 = J[2];
        J = J[1];
        for X, o in ipairs(J.GetPlayers(J)) do
            n = o ~= r434;
            v2 = n;
            e = X;
            if n then
                v2 = o.Character;
            end;
            if v2 then
                v3 = o.Character;
                v2 = v3.FindFirstChild(v3, "HumanoidRootPart");
                v3 = o.Character;
                w = r16;
                n = v3.FindFirstChild(v3, "Head");
                if v2 then
                    v4 = v3.FindFirstChild(v3, K[a]);
                end;
                if v2 then
                    v3 = r434.Character;
                    v3.PivotTo(v3, v2.CFrame * CFrame.new(0, -6, 0));
                    w = 0 > 20;
                    K = w;
                    if w then
                        v3 = r436;
                        v3.FireServer(v3, v3.FindFirstChild(v3, "HumanoidRootPart"), r437.CFrame);
                        task.wait(.15);
                        v3 = v4 + 1;
                        v3 = v3;
                        if v3 > 20 or n.FindFirstChild(n, "PartOwner") then
                            v3 = v3;
                            if n.FindFirstChild(n, "PartOwner") and n.PartOwner.Value == r434.Name then
                                v2.CFrame = CFrame.new(r438);
                                v2.AssemblyLinearVelocity = Vector3.zero;
                                task.wait(.8);
                            end;
                        end;
                    else
                        v3 = 0;
                        K = n.FindFirstChild(n, "PartOwner") and n.PartOwner.Value == r434.Name;
                    end;
                end;
            end; 
        end;
        r437.CFrame = CFrame.new(r438);
        r37("Bring Server", "All players brought!", 5);
        return; 
    end);
    return; 
end);
vm174.AddButton(vm174, "Kill Server", function(...)
    i = game;
    r439 = i.GetService(i, "Players").LocalPlayer;
    v3 = game;
    X = v3.GetService(v3, "Players");
    v3 = game;
    J = v3.GetService(v3, "ReplicatedStorage");
    r440 = J.GrabEvents.SetNetworkOwner;
    r441 = J.GrabEvents.DestroyGrabLine;
    v4 = "Character";
    r442 = r439[v4] and v4.FindFirstChild(v4, "HumanoidRootPart");
    r443 = Vector3.new(5, -18.5, 0);
    a = X.GetPlayers;
    w = {
        a(X)
    };
    K = a[3];
    w = a[1];
    for K, t in w, ipairs(T(w)) do
        v6 = t ~= r439;
        a = K;
        if v6 then
            v5 = t.Character;
        end;
        if v6 then
            v3 = t.Character;
            r444 = v3.FindFirstChild(v3, "HumanoidRootPart");
            v3 = t.Character;
            v3 = t.Character;
            v3.FindFirstChild(v3, "Head");
            if r444 and v3.FindFirstChildOfClass(v3, "Humanoid") then
                pcall(function(...)
                    v3 = r439.Character;
                    v3.PivotTo(v3, CFrame.new(r444.Position + r443));
                    v3 = r440;
                    v3.FireServer(v3, r444, r444.CFrame);
                    task.wait();
                    v3 = r439.Character;
                    v3.PivotTo(v3, r442);
                    task.wait(.1);
                    v3 = r441;
                    v3.FireServer(v3, r444);
                    return; 
                end);
            end;
        end; 
    end;
    r37("Kill Server", "All players killed!", 5);
    return; 
end);
vm174.AddToggle(vm174, "LoopRagdollServer", {
    ["Text"] = "Loop Ragdoll Server",
    ["Default"] = false
});
vm174.AddToggle(vm174, "Zelebomba", {
    ["Text"] = "Zelebomba",
    ["Default"] = false
});
r445 = 100;
vm154.AddSlider(vm154, "LinesPerSecond", {
    ["Text"] = "Lines Per Second",
    ["Min"] = 1,
    ["Max"] = 10000,
    ["Default"] = 150,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_186, ...)
        r445 = arg1_186;
        return; 
    end
});
vm154.AddToggle(vm154, "LineLag", {
    ["Text"] = "Line Lag",
    ["Default"] = false,
    ["Callback"] = function(arg1_187, ...)
        v1 = arg1_187;
        _G.LineLagActive = v1;
        if v1 then
            task.spawn(function(...)
                while _G.LineLagActive do
                    for z = 1, r445 do
                        v4 = r15;
                        o = v1;
                        K = r16;
                        if not _G.LineLagActive then
                            task.wait(1);
                        else
                            v4 = game;
                            K = v4.GetService(v4, "Players");
                            v4 = {
                                K.GetPlayers(K)
                            };
                            v2 = K[2];
                            v4 = K[1];
                            for n, w in ipairs(T(v4)) do
                                r446 = w;
                                K = n;
                                t = Q[v3].Character;
                                if t then
                                    t = Q[v3].Character;
                                    a = t.FindFirstChild(t, "Torso");
                                end;
                                if t then
                                    pcall(function(...)
                                        v1 = game;
                                        v3 = v1.GetService(v1, "ReplicatedStorage").GrabEvents.CreateGrabLine;
                                        v3.FireServer(v3, Q[v3].Character.Torso, Q[v3].Character.Torso.CFrame);
                                        return; 
                                    end);
                                end; 
                            end;
                        end; 
                    end;
                    task.wait(1); 
                end;
                return; 
            end);
        end;
        return; 
    end
});
vm154.AddInput(vm154, "LagDelay", {
    ["Text"] = "Delay",
    ["Default"] = "1",
    ["Placeholder"] = "1"
});
vm169 = vm176.AddRightGroupbox(vm176, "Packets", "server");
r447 = 3000;
vm169.AddSlider(vm169, "PacketStrengthSlider", {
    ["Text"] = "Packet Strength",
    ["Min"] = 0,
    ["Max"] = 200000,
    ["Default"] = 3000,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_188, ...)
        r447 = arg1_188;
        return; 
    end
});
r448 = false;
vm169.AddToggle(vm169, "AntiDetectPackets", {
    ["Text"] = "Anti-Detect(Packets)",
    ["Default"] = false,
    ["Callback"] = function(arg1_189, ...)
        v1 = arg1_189;
        r448 = v1;
        if v1 then
            r449 = task.spawn(function(...)
                r450 = r29.GrabEvents.ExtendGrabLine;
                r451 = CFrame.new(-524.1, 39.9, -167.3);
                while r448 do
                    for J = 1, 3 do
                        n = J;
                        if not r29 then
                            
                        else
                            pcall(function(...)
                                v3 = r450;
                                v3.FireServer(v3, string.rep("x", r447), r451);
                                return; 
                            end);
                        end; 
                    end;
                    task.wait(1); 
                end;
                return; 
            end);
        else
            if r449 then
                task.cancel(r449);
            end;
            return;
        end; 
    end
});
r452 = false;
vm169.AddToggle(vm169, "PacketsToggle", {
    ["Text"] = "Packets",
    ["Default"] = false,
    ["Callback"] = function(arg1_190, ...)
        v1 = arg1_190;
        r452 = v1;
        if v1 then
            r453 = task.spawn(function(...)
                r454 = r29.GrabEvents.ExtendGrabLine;
                r455 = CFrame.new(-524.1, 39.9, -167.3);
                while r452 do
                    pcall(function(...)
                        v3 = r454;
                        v3.FireServer(v3, string.rep("x", r447), r455);
                        return; 
                    end);
                    task.wait(); 
                end;
                return; 
            end);
        else
            if r453 then
                task.cancel(r453);
            end;
            return;
        end; 
    end
});
vm169.AddButton(vm169, {
    ["Text"] = "Packet",
    ["Func"] = function(...)
        r456 = r29.GrabEvents.ExtendGrabLine;
        r457 = CFrame.new(-524.1, 39.9, -167.3);
        pcall(function(...)
            v3 = r456;
            v3.FireServer(v3, string.rep("x", r447), r457);
            return; 
        end);
        r37("Packet", "Sent 1 packet!", 2);
        return; 
    end,
    ["DoubleClick"] = false
});
vm169.AddButton(vm169, {
    ["Text"] = "Grab Item",
    ["Func"] = function(...)
        v1 = r29;
        e = r15;
        J = "GrabEvents";
        X = v1.FindFirstChild(v1, J);
        if X then
            J = r29.GrabEvents;
            e = J.FindFirstChild(J, "ExtendGrabLine");
            if e then
                v1 = r29.GrabEvents.ExtendGrabLine;
            end;
            v3 = Q[X];
            i = e;
        end;
        r458 = X;
        if not r458 then
            r37("Grab", "ExtendGrabLine missing", 3);
            return;
        end;
        X = r26.Character;
        X = X and X.FindFirstChild(X, "HumanoidRootPart");
        if not X then
            r37("Grab", "No HumanoidRootPart", 3);
            return;
        end;
        r459 = CFrame.new(X.Position + X.CFrame.LookVector * 3);
        pcall(function(...)
            v3 = r458;
            v3.FireServer(v3, string.rep("x", 10), r459);
            return; 
        end);
        r37("Grab", "Sent normal grab", 2);
        return; 
    end,
    ["DoubleClick"] = false
});
r460 = false;
vm169.AddToggle(vm169, "SecondLineGrab", {
    ["Text"] = "Second Line (click to grab)",
    ["Default"] = false,
    ["Callback"] = function(arg1_191, ...)
        v1 = arg1_191;
        r460 = v1;
        if r461 then
            i = r461;
            i.Disconnect(i);
        end;
        if v1 then
            e = r29;
            v2 = "GrabEvents";
            o = e.FindFirstChild(e, v2);
            if o then
                v2 = r29.GrabEvents;
                e = v2.FindFirstChild(v2, "ExtendGrabLine");
                X = e and r29.GrabEvents.ExtendGrabLine;
                v3 = v1;
            end;
            v3 = v1;
            r462 = o;
            if not r462 then
                r37("Second Line", "ExtendGrabLine missing", 3);
                return;
            end;
            X = Mouse.Button1Down;
            r461 = X.Connect(X, function(...)
                v3 = not r460;
                if v3 then
                    return;
                end;
                v3 = v3;
                v1 = Mouse.Hit and Mouse.Hit.p or nil;
                if not v1 then
                    return;
                end;
                r463 = CFrame.new(v1);
                pcall(function(...)
                    v3 = r462;
                    v3.FireServer(v3, string.rep("x", 20), r463);
                    return; 
                end);
                return; 
            end);
            r37("Second Line", "Enabled", 2);
        else
            r37("Second Line", "Disabled", 2);
        end;
        return; 
    end
});
r464 = false;
vm169.AddToggle(vm169, "AntiDetectPackets", {
    ["Text"] = "Anti-Detect(Packets)",
    ["Default"] = false,
    ["Callback"] = function(arg1_192, ...)
        v1 = arg1_192;
        r464 = v1;
        if v1 then
            r465 = task.spawn(function(...)
                r466 = r29.GrabEvents.ExtendGrabLine;
                r467 = CFrame.new(-524.1, 39.9, -167.3);
                while r464 do
                    for J = 1, 3 do
                        n = J;
                        if not r29 then
                            
                        else
                            pcall(function(...)
                                v3 = r466;
                                v3.FireServer(v3, string.rep("x", r447), r467);
                                return; 
                            end);
                        end; 
                    end;
                    task.wait(1); 
                end;
                return; 
            end);
        else
            if r465 then
                task.cancel(r465);
            end;
            return;
        end; 
    end
});
r468 = false;
vm169.AddToggle(vm169, "Packets", {
    ["Text"] = "Packets",
    ["Default"] = false,
    ["Callback"] = function(arg1_193, ...)
        v1 = arg1_193;
        r468 = v1;
        if v1 then
            r469 = task.spawn(function(...)
                r470 = r29.GrabEvents.ExtendGrabLine;
                r471 = CFrame.new(-524.1, 39.9, -167.3);
                while r468 do
                    pcall(function(...)
                        v3 = r470;
                        v3.FireServer(v3, string.rep("x", r447), r471);
                        return; 
                    end);
                    task.wait(); 
                end;
                return; 
            end);
        else
            if r469 then
                task.cancel(r469);
            end;
            return;
        end; 
    end
});
vm153 = vm176.AddLeftGroupbox(vm176, "Blobman", "layers");
vm153.AddToggle(vm153, "KickAllBeta", {
    ["Text"] = "Kick All [Beta]",
    ["Default"] = false,
    ["Callback"] = function(arg1_194, ...)
        v1 = arg1_194;
        _G.kickAllBeta = v1;
        if not v1 then
            r37("Kick All", "Stopped", 3);
            return;
        end;
        task.spawn(function(...)
            r472 = CFrame.new(0, 40, 0);
            if not r60() then
                pcall(function(...)
                    v3 = r29.MenuToys.SpawnToyRemoteFunction;
                    v3.InvokeServer(v3, "CreatureBlobman", r472, Vector3.zero);
                    return; 
                end);
                task.wait(1.5);
                if not r60() then
                    _G.kickAllBeta = false;
                    v3 = r36.KickAllBeta;
                    v3.SetValue(v3, false);
                    r37("Error", "Cant sit!", 3);
                    return;
                end;
            end;
            r62(function(...)
                return _G.kickAllBeta; 
            end);
            r37("Kick All", "Started!", 3);
            J = {};
            v2 = r25;
            e = v2[2];
            o = v2[3];
            v2 = "ipairs";
            for o, v4 in ipairs(v2.GetPlayers(v2)) do
                n = o;
                if v4 ~= r26 and v4.Character then
                    table.insert({}, v4);
                end; 
            end;
            v3 = #J == 0;
            if v3 then
                r37("Kick All", "No targets", 3);
                _G.kickAllBeta = false;
                v3 = r36.KickAllBeta;
                v3.SetValue(v3, false);
                return;
            end;
            r473 = r59();
            v3 = not r473;
            if v3 then
                r37("Kick All", "Blobman not ready", 3);
                _G.kickAllBeta = false;
                v3 = r36.KickAllBeta;
                v3.SetValue(v3, false);
                return;
            end;
            e = #J;
            v2 = math.max(6, e * 1.5);
            for w = 1, e do
                v5 = (w - 1) / e * 2 * math.pi;
                ({})[w] = CFrame.new(r472.Position + Vector3.new(math.cos(v5) * v2, 0, math.sin(v5) * v2) + Vector3.new(0, 1.5, 0)); 
            end;
            a = 33201205869668[3];
            w = 33201205869668[2];
            for a, v5 in ipairs(J) do
                t = a;
                v6 = _G.kickAllBeta;
                if not v6 then
                    
                else
                    v6 = v5.Character;
                    if v6 then
                        W = v6.FindFirstChild(v6, "HumanoidRootPart");
                    end;
                    r474 = v6;
                    if v6 then
                        W = v6.FindFirstChildOfClass(v6, "Humanoid");
                    end;
                    r475 = v6;
                    if not r474 or (not r475 or r475.Health <= 0) then
                        
                    else
                        r473.br.CFrame = r474.CFrame * CFrame.new(0, 5, 0);
                        task.wait(.12);
                        pcall(function(...)
                            r475.PlatformStand = true;
                            r475.Sit = true;
                            if r473.rd and r473.rw then
                                pcall(function(...)
                                    v3 = r473.cg;
                                    v3.FireServer(v3, r473.rd, r474, r473.rw);
                                    return; 
                                end);
                            end;
                            i = r473.ld and r473.lw; 
                        end);
                        task.wait(.12);
                        r476 = ({})[a];
                        pcall(function(...)
                            v3 = r50;
                            v3.FireServer(v3, r474, r476);
                            r474.CFrame = r476;
                            return; 
                        end);
                        table.insert({}, r474);
                        r37("Grabbed", v5.DisplayName, 1);
                        task.wait(.06);
                    end;
                end; 
            end;
            w = r26.Character;
            K = w;
            if w then
                w = r26.Character;
                K = w.FindFirstChild(w, "HumanoidRootPart");
            end;
            if K then
                K.CFrame = r472;
            end;
            task.wait(0.25);
            a = r29;
            v6 = r15;
            v5 = "GrabEvents";
            t = a.FindFirstChild(a, v5);
            if t then
                v5 = r29.GrabEvents;
                v6 = v5.FindFirstChild(v5, "ExtendGrabLine");
                if v6 then
                    a = r29.GrabEvents.ExtendGrabLine;
                end;
                v3 = task.wait;
                w = v6;
            end;
            r477 = t;
            if r477 then
                for t = 1, 2 do
                    w = t;
                    u = s[2];
                    Y = s[1];
                    for W, D in ipairs({}) do
                        r478 = D;
                        if Q[v3] and Q[v3].Parent then
                            pcall(function(...)
                                v3 = r477;
                                v3.FireServer(v3, string.rep("x", 20), CFrame.new(Q[v3].Position));
                                return; 
                            end);
                        end; 
                    end;
                    task.wait(.09); 
                end;
            end;
            t = v6[2];
            w = v6[1];
            for v5, F in ipairs({}) do
                v6 = v5;
                r479 = F;
                if Q[v3] and Q[v3].Parent then
                    pcall(function(...)
                        v3 = r52;
                        v3.FireServer(v3, Q[v3]);
                        return; 
                    end);
                end; 
            end;
            r473 = r59();
            if r473 then
                pcall(function(...)
                    v1 = r473.rd;
                    v1 = v1.FindFirstChild(v1, "RightWeld") or v1.FindFirstChildWhichIsA(v1, "Weld");
                    if v1 then
                        v3 = r473.cd;
                        v3.FireServer(v3, v1);
                    end;
                    if r473.ld and r473.lw then
                        X = r473.ld;
                        X = X.FindFirstChild(X, "LeftWeld") or X.FindFirstChildWhichIsA(X, "Weld");
                        if X then
                            v3 = r473.cd;
                            v3.FireServer(v3, X);
                        end;
                    end;
                    return; 
                end);
            end;
            _G.kickAllBeta = false;
            pcall(function(...)
                v3 = r36.KickAllBeta;
                v3.SetValue(v3, false);
                return; 
            end);
            r37("Kick All", "Finished! " .. string.format("%.1f", tick() - tick()) .. "s", 8);
            return; 
        end);
        return; 
    end
});
vm153.AddButton(vm153, "Bring Server", function(...)
    i = game;
    r480 = i.GetService(i, "Players").LocalPlayer;
    v3 = game;
    r481 = v3.GetService(v3, "Players");
    v3 = game;
    J = v3.GetService(v3, "ReplicatedStorage");
    r482 = J.GrabEvents.SetNetworkOwner;
    o = J.GrabEvents.DestroyGrabLine;
    v3 = game;
    v3.GetService(v3, "RunService");
    n = r480.Character;
    if n then
        n = r480.Character;
        i = n.FindFirstChild(n, "HumanoidRootPart");
    end;
    r483 = n;
    if not r483 then
        return;
    end;
    r484 = r483.Position;
    task.spawn(function(...)
        J = r481;
        X = J[3];
        J = J[1];
        for X, o in J, ipairs(J.GetPlayers(J)) do
            e = X;
            n = o ~= r480;
            v2 = n and o.Character;
            if v2 then
                v3 = o.Character;
                v2 = v3.FindFirstChild(v3, "HumanoidRootPart");
                v3 = o.Character;
                w = r16;
                n = v3.FindFirstChild(v3, "Head");
                if v2 then
                    v4 = v3.FindFirstChild(v3, K[a]);
                end;
                if v2 then
                    v3 = r480.Character;
                    v3.PivotTo(v3, v2.CFrame * CFrame.new(0, -6, 0));
                    w = 0 > 20;
                    K = w;
                    if w then
                        v3 = r482;
                        v3.FireServer(v3, v3.FindFirstChild(v3, "HumanoidRootPart"), r483.CFrame);
                        task.wait(.15);
                        v3 = v4 + 1;
                        v3 = v3;
                        if v3 > 20 or n.FindFirstChild(n, "PartOwner") then
                            v3 = v3;
                            if n.FindFirstChild(n, "PartOwner") and n.PartOwner.Value == r480.Name then
                                v2.CFrame = CFrame.new(r484);
                                v2.AssemblyLinearVelocity = Vector3.zero;
                                task.wait(.8);
                            end;
                        end;
                    else
                        K = n.FindFirstChild(n, "PartOwner") and n.PartOwner.Value == r480.Name;
                        v3 = 0;
                    end;
                end;
            end; 
        end;
        r483.CFrame = CFrame.new(r484);
        r37("Bring Server", "All players brought!", 5);
        return; 
    end);
    return; 
end);
vm153.AddToggle(vm153, "AntiGrabForServer", {
    ["Text"] = "Anti Grab For Server",
    ["Default"] = false
});
vm177 = vm176.AddRightGroupbox(vm176, "Breaker", "zap");
vm177.AddLabel(vm177, "Select Object");
vm177.AddDropdown(vm177, "BreakerSelectObject", {
    ["Text"] = "",
    ["Values"] = {
        "InnerUFO"
    },
    ["Default"] = 1
});
vm177.AddButton(vm177, "Break", function(...)
    return; 
end);
vm176 = l.Misc;
vm154 = vm176.AddLeftGroupbox(vm176, "Misc", "layers");
vm176 = l.Misc;
vm174 = vm176.AddRightGroupbox(vm176, "Fun", "gamepad");
vm176 = l.Misc;
vm169 = vm176.AddLeftGroupbox(vm176, "Build", "build");
vm154.AddToggle(vm154, "IgnoreBarriers", {
    ["Text"] = "Ignore Barriers",
    ["Default"] = false,
    ["Callback"] = function(arg1_195, ...)
        v1 = arg1_195;
        v2 = " \xe0\x81tI";
        v3 = r31;
        X = v3.FindFirstChild(v3, r15[r16(v2, 29851732194892)]);
        if X then
            v2 = X.GetChildren;
            o = {
                v2(X)
            };
            J = v2[2];
            e = v2[3];
            for e, n in ipairs(T("ipairs")) do
                v2 = e;
                if n.FindFirstChild(n, "Barrier") then
                    v5 = v4.GetDescendants;
                    w = v5[2];
                    K = v5[1];
                    for a, v5 in ipairs(v5(v4)) do
                        t = a;
                        if v5.IsA(v5, "BasePart") then
                            v5.CanCollide = not arg1_195;
                        end; 
                    end;
                end; 
            end;
        end;
        return; 
    end
});
r485 = {
    ["Enabled"] = false,
    ["Connection"] = nil,
    ["canGrab"] = true,
    ["maxDist"] = 20,
    ["lastT"] = nil,
    ["lastH"] = 0,
    ["tMD"] = .1,
    ["cT"] = .008,
    ["lastC"] = 0
};
r486 = RaycastParams.new();
r486.FilterType = Enum.RaycastFilterType.Exclude;
r485.GetTarget = function(arg1_196, ...)
    X = r26.Character;
    if not X or not X.FindFirstChild(X, "HumanoidRootPart") then
        return;
    end;
    r486.FilterDescendantsInstances = {
        X,
        r31.Terrain
    };
    v3 = r31;
    J = v3.Raycast(v3, r32.CFrame.Position, r32.CFrame.LookVector * 1000, r486);
    if not J then
        return;
    end;
    v3 = J.Instance;
    e = v3.FindFirstAncestorOfClass(v3, "Model");
    if not e or (not e.FindFirstChildOfClass(e, "Humanoid") or e == X) then
        return;
    end;
    if e.FindFirstChildOfClass(e, "Humanoid").Health <= 0 then
        return;
    end;
    v2 = e.FindFirstChild(e, "HumanoidRootPart");
    if v2 then
        i = (X.HumanoidRootPart.Position - v2.Position).Magnitude <= arg1_196.maxDist;
    end;
    if v2 then
        return e;
    end;
    return; 
end;
r485.OnHB = function(arg1_197, ...)
    r487 = arg1_197;
    v2 = r15;
    if not r487.Enabled or (not r487.canGrab or v2.GetFocusedTextBox(v2)) then
        return;
    end;
    r487.lastC = tick();
    v3 = r487;
    X = v3.GetTarget(v3);
    if X then
        J = i;
        r487.lastT = J;
        r487.lastH = tick();
    else
        if r487.lastT and tick() - r487.lastH > r487.tMD then
            r487.lastT = nil;
        end;
        if not r487.lastT then
            return;
        end;
        J = r26.Character;
        v3 = r487.lastT;
        e = v3.FindFirstChild(v3, "HumanoidRootPart");
        if not J or (not J.FindFirstChild(J, "HumanoidRootPart") or (not e or (J.HumanoidRootPart.Position - e.Position).Magnitude > r487.maxDist)) then
            r487.lastT = nil;
            return;
        end;
        r487.canGrab = false;
        task.spawn(function(...)
            pcall(mouse1press);
            v1 = tick();
            J = r31;
            X = not J.FindFirstChild(J, "GrabParts");
            i = X;
            if X then
                task.wait(.02);
                J = r31;
                if not J.FindFirstChild(J, "GrabParts") or tick() - v1 > 1.6 then
                    task.wait(.05);
                    r487.canGrab = true;
                    r487.lastT = nil;
                    return;
                end;
            else
                i = tick() - v1 > 1.6;
            end; 
        end);
        return;
    end; 
end;
vm154.AddToggle(vm154, "TriggerBot", {
    ["Text"] = "Trigger Bot",
    ["Default"] = false,
    ["Callback"] = function(arg1_198, ...)
        v1 = arg1_198;
        X = v1;
        r485.Enabled = X;
        if v1 then
            i = not r485.Connection;
        end;
        if v1 then
            X = r30.Heartbeat;
            r485.Connection = X.Connect(X, function(...)
                v3 = r485;
                v3.OnHB(v3);
                return; 
            end);
        else
            if not arg1_198 and r485.Connection then
                v3 = r485.Connection;
                v3.Disconnect(v3);
                r485.Connection = nil;
            end;
            return;
        end; 
    end
});
vm154.AddSlider(vm154, "FOVSlider", {
    ["Text"] = "FOV",
    ["Default"] = 90,
    ["Min"] = 1,
    ["Max"] = 120,
    ["Rounding"] = 0,
    ["Suffix"] = "deg",
    ["Callback"] = function(arg1_199, ...)
        r32.FieldOfView = arg1_199;
        return; 
    end
});
vm154.AddToggle(vm154, "AntiAFK", {
    ["Text"] = "Anti AFK",
    ["Default"] = false,
    ["Callback"] = function(arg1_200, ...)
        if arg1_200 then
            v3 = game;
            r488 = v3.GetService(v3, "VirtualUser");
            v3 = r26.Idled;
            v3.Connect(v3, function(...)
                v3 = r488;
                v3.CaptureController(v3);
                v3 = r488;
                v3.ClickButton2(v3, Vector2.new());
                return; 
            end);
        end;
        return; 
    end
});
vm154.AddButton(vm154, {
    ["Text"] = "Remove Accessories",
    ["Func"] = function(...)
        v1 = r26.Character;
        if v1 then
            o = v1.GetChildren;
            e = {
                o(v1)
            };
            X = o[2];
            e = o[1];
            for J, v2 in pairs(T(e)) do
                o = J;
                if v2.IsA(v2, "Accessory") then
                    v2.Destroy(v2);
                end; 
            end;
            r37("Misc", "Accessories removed!", 2);
        end;
        return; 
    end
});
vm154.AddButton(vm154, {
    ["Text"] = "Boost FPS",
    ["Func"] = function(...)
        v3 = game;
        v1 = v3.GetService(v3, "Lighting");
        e = r31;
        J = e[3];
        e = e[1];
        for J, v2 in e, pairs(e.GetDescendants(e)) do
            o = J;
            if v2.IsA(v2, "BasePart") then
                v2.Material = Enum.Material.Plastic;
                v2.Reflectance = 0;
                v2.CastShadow = false;
            else
                if v2.IsA(v2, "ParticleEmitter") or (v2.IsA(v2, "Trail") or (v2.IsA(v2, "Smoke") or v2.IsA(v2, "Fire"))) then
                    v2.Enabled = false;
                end;
            end; 
        end;
        v1.GlobalShadows = false;
        v1.FogEnd = 100000;
        v1.Brightness = 2;
        r37("FPS", "Boost applied!", 3);
        return; 
    end
});
vm153 = l.Misc;
vm159 = vm153.AddRightGroupbox(vm153, "Coordinates", "map");
vm159.AddButton(vm159, {
    ["Text"] = "Copy XYZ",
    ["Func"] = function(...)
        v1 = r26.Character;
        v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
        if v1 then
            X = v1.Position;
            setclipboard(string.format("%.2f, %.2f, %.2f", X.X, X.Y, X.Z));
            r37("Coordinates", "Copied!", 2);
        end;
        return; 
    end
});
vm159.AddButton(vm159, {
    ["Text"] = "Copy CFrame",
    ["Func"] = function(...)
        v1 = r26.Character;
        v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
        if v1 then
            setclipboard(string.format("CFrame.new(%.2f, %.2f, %.2f)", v1.Position.X, v1.Position.Y, v1.Position.Z));
            r37("CFrame", "Copied!", 2);
        end;
        return; 
    end
});
vm159.AddInput(vm159, "CoordDisplay", {
    ["Text"] = "Position",
    ["Default"] = "X:0 Y:0 Z:0",
    ["Placeholder"] = "coordinates here"
});
vm159.AddInput(vm159, "RotDisplay", {
    ["Text"] = "Rotation",
    ["Default"] = "X:0 Y:0 Z:0",
    ["Placeholder"] = "rotation here"
});
vm159.AddInput(vm159, "SpeedDisplay", {
    ["Text"] = "Speed",
    ["Default"] = "0",
    ["Placeholder"] = "speed here"
});
task.spawn(function(...)
    while task.wait(.1) do
        pcall(function(...)
            v1 = r26.Character;
            v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
            if v1 then
                X = v1.Position;
                v3 = v1.CFrame;
                o = {
                    v3.ToOrientation(v3)
                };
                v3 = r35.CoordDisplay;
                v3.SetValue(v3, string.format("X:%.1f Y:%.1f Z:%.1f", X.X, X.Y, X.Z));
                v3 = r35.RotDisplay;
                v3.SetValue(v3, string.format("X:%.0f Y:%.0f Z:%.0f", math.deg(v3.ToOrientation(v3)), math.deg(o[2]), math.deg(o[3])));
                v3 = r35.SpeedDisplay;
                v3.SetValue(v3, string.format("%.1f studs/s", v1.AssemblyLinearVelocity.Magnitude));
            end;
            return; 
        end); 
    end;
    return; 
end);
r489 = false;
r491 = "Crazy";
vm133 = "rbxassetid://507770677";
r492 = {
    ["Crazy"] = "rbxassetid://248263260",
    ["Insane"] = "rbxassetid://35654637",
    ["Collapse"] = "rbxassetid://35154961",
    ["Zombie"] = "rbxassetid://33796059",
    ["Dance01"] = vm133,
    ["Dance02"] = vm133,
    ["Dance03"] = vm133,
    ["Dance04"] = vm133,
    ["Dance05"] = vm133,
    ["Dance06"] = vm133,
    ["Dance07"] = vm133,
    ["Dance08"] = vm133,
    ["Dance09"] = vm133,
    ["Dance10"] = vm133,
    ["Groove01"] = vm133,
    ["Groove02"] = vm133,
    ["Groove03"] = vm133,
    ["Funk01"] = vm133,
    ["Funk02"] = vm133,
    ["Robot"] = vm133,
    ["Breakdance"] = vm133,
    ["Moonwalk"] = vm133,
    ["Twerk"] = vm133,
    ["Floss"] = vm133,
    ["Pop"] = vm133,
    ["Lock"] = vm133,
    ["Spin"] = vm133,
    ["Cheer01"] = vm133,
    ["Cheer02"] = vm133,
    ["Laugh01"] = vm133,
    ["Clap01"] = vm133
};
local function r493(...)
    v1 = r26.Character;
    v1 = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
    if not v1 then
        return;
    end;
    X = v1.FindFirstChildOfClass(v1, "Animator");
    i = X;
    if X then
        v3 = r490;
        if v3 then
            v3 = r490;
            v3.Stop(v3);
        end;
        J = Instance.new("Animation");
        J.AnimationId = r492[r491];
        r490 = X.LoadAnimation(X, J);
        r490.Priority = Enum.AnimationPriority.Action;
        r490.Looped = true;
        i = r490;
        i.Play(i);
        return;
    else
        Instance.new("Animator", v1);
    end; 
end;
vm174.AddToggle(vm174, "PlayAnim", {
    ["Text"] = "Play Animation",
    ["Default"] = false,
    ["Callback"] = function(arg1_201, ...)
        v1 = arg1_201;
        r489 = v1;
        if v1 then
            r493();
        else
            if r490 then
                i = r490;
                i.Stop(i);
            end;
            return;
        end; 
    end
});
vm174.AddDropdown(vm174, "AnimSelect", {
    ["Text"] = "Animation",
    ["Values"] = {
        "Crazy",
        "Insane",
        "Collapse",
        "Zombie",
        "Dance01",
        "Dance02",
        "Dance03",
        "Dance04",
        "Dance05",
        "Dance06",
        "Dance07",
        "Dance08",
        "Dance09",
        "Dance10",
        "Groove01",
        "Groove02",
        "Groove03",
        "Funk01",
        "Funk02",
        "Robot",
        "Breakdance",
        "Moonwalk",
        "Twerk",
        "Floss",
        "Pop",
        "Lock",
        "Spin",
        "Cheer01",
        "Cheer02",
        "Laugh01",
        "Clap01"
    },
    ["Default"] = 1,
    ["Callback"] = function(arg1_202, ...)
        r491 = arg1_202;
        if r489 then
            r493();
        end;
        return; 
    end
});
r495 = 5;
vm174.AddToggle(vm174, "SpinFun", {
    ["Text"] = "Spin",
    ["Default"] = false,
    ["Callback"] = function(arg1_203, ...)
        if arg1_203 then
            v3 = r30.Heartbeat;
            r494 = v3.Connect(v3, function(...)
                v1 = r26.Character;
                v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
                if v1 then
                    v1.CFrame = v1.CFrame * CFrame.Angles(0, math.rad(r495), 0);
                end;
                return; 
            end);
        else
            if r494 then
                v3 = r494;
                v3.Disconnect(v3);
            end;
            return;
        end; 
    end
});
vm174.AddSlider(vm174, "SpinSpeedFun", {
    ["Text"] = "Spin Speed",
    ["Default"] = 5,
    ["Min"] = 1,
    ["Max"] = 50,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_204, ...)
        r495 = arg1_204;
        return; 
    end
});
r496 = false;
vm174.AddToggle(vm174, "FollowStare", {
    ["Text"] = "Follow & Stare",
    ["Default"] = false,
    ["Callback"] = function(arg1_205, ...)
        r496 = arg1_205;
        task.spawn(function(...)
            while r496 do
                v3 = r25;
                v1 = v3.GetPlayers(v3);
                X = v1[math.random(#v1)];
                if X ~= r26 and X.Character then
                    r26.Character.HumanoidRootPart.CFrame = CFrame.new(X.Character.HumanoidRootPart.Position + X.Character.HumanoidRootPart.CFrame.LookVector * -2, X.Character.HumanoidRootPart.Position);
                end;
                task.wait(.3); 
            end;
            return; 
        end);
        return; 
    end
});
vm174.AddToggle(vm174, "FakeDeath", {
    ["Text"] = "Fake Death",
    ["Default"] = false,
    ["Callback"] = function(arg1_206, ...)
        X = r26.Character;
        X = X and X.FindFirstChildOfClass(X, "Humanoid");
        if X then
            if arg1_206 then
                X.ChangeState(X, Enum.HumanoidStateType.Physics);
                X.PlatformStand = true;
            else
                X.PlatformStand = false;
                X.ChangeState(X, Enum.HumanoidStateType.GettingUp);
            end;
        end;
        return; 
    end
});
vm174.AddToggle(vm174, "FakeLag", {
    ["Text"] = "Fake Lag",
    ["Default"] = false,
    ["Callback"] = function(arg1_207, ...)
        if r497 then
            v3 = r497;
            v3.Disconnect(v3);
        end;
        if arg1_207 then
            i = r30.Heartbeat;
            r497 = i.Connect(i, function(...)
                v1 = r26.Character;
                i = v1;
                v1 = i and v1.FindFirstChild(v1, "HumanoidRootPart");
                if v1 then
                    i = math.random(1, 5) == 1;
                end;
                if v1 then
                    v1.CFrame = v1.CFrame * CFrame.new(math.random(-2, 2) / 10, 0, math.random(-2, 2) / 10);
                end;
                return; 
            end);
        end;
        return; 
    end
});
r498 = false;
vm169.AddToggle(vm169, "HeartBuild", {
    ["Text"] = "Heart Build",
    ["Default"] = false,
    ["Callback"] = function(arg1_208, ...)
        v1 = arg1_208;
        r498 = v1;
        if v1 then
            task.spawn(function(...)
                v1 = r26.Character;
                if v1 then
                    v1 = r26.Character;
                    i = v1.FindFirstChild(v1, "HumanoidRootPart");
                end;
                r501 = v1;
                if not r501 then
                    return;
                end;
                pcall(function(...)
                    v3 = r29.MenuToys.SpawnToyRemoteFunction;
                    v3.InvokeServer(v3, "FireworkSparkler", r501.CFrame * CFrame.new(0, 50, 0), Vector3.zero);
                    return; 
                end);
                v3 = r31;
                X = v3.WaitForChild(v3, r26.Name .. "SpawnedInToys", 5);
                r500 = X and X.WaitForChild(X, "FireworkSparkler", 5);
                if not r500 then
                    return;
                end;
                e = r500;
                r502 = e.FindFirstChild(e, "Handle") or e.FindFirstChildWhichIsA(e, "BasePart");
                if not r502 then
                    return;
                end;
                task.wait(.2);
                n = r500;
                v4 = {
                    n.GetDescendants(n)
                };
                v2 = n[3];
                for v2, v4 in n[1], ipairs(T(v4)) do
                    n = v2;
                    if v4.IsA(v4, "BasePart") then
                        v4.Anchored = false;
                        v4.CanCollide = false;
                        v4.Massless = true;
                    end; 
                end;
                v3 = r502;
                v3.BreakJoints(v3);
                r503 = Instance.new("BodyPosition");
                r503.MaxForce = Vector3.new(100000000, 100000000, 100000000);
                r503.P = 20000;
                r503.D = 500;
                r503.Parent = r502;
                r504 = 0;
                v3 = r30.Heartbeat;
                r499 = v3.Connect(v3, function(arg1_209, ...)
                    if not r498 or (not r502 or not r502.Parent) then
                        v3 = r499;
                        if v3 then
                            v3 = r504;
                            v3.Disconnect(v3);
                        end;
                        if r500 then
                            pcall(function(...)
                                v3 = Q[524];
                                v3.Destroy(v3);
                                return; 
                            end);
                        end;
                        return;
                    end;
                    X = r26.Character;
                    i = X;
                    X = i and X.FindFirstChild(X, "HumanoidRootPart");
                    if not X then
                        return;
                    end;
                    pcall(function(...)
                        v3 = r50;
                        v3.FireServer(v3, r502, r502.CFrame);
                        return; 
                    end);
                    r504 = r504 + 8 * arg1_209;
                    o = X.CFrame;
                    r503.Position = o.PointToWorldSpace(o, Vector3.new(16 * math.sin(r504) ^ 3 * 1.5, (13 * math.cos(r504) - 5 * math.cos(2 * r504) - 2 * math.cos(3 * r504) - math.cos(4 * r504)) * 1.5 + 25, 3));
                    return; 
                end);
                return; 
            end);
        else
            if r499 then
                i = r499;
                i.Disconnect(i);
            end;
            if r500 then
                pcall(function(...)
                    v3 = Q[vm164];
                    v3.Destroy(v3);
                    return; 
                end);
                Q[vm164] = nil;
            end;
            return;
        end; 
    end
});
vm169.AddToggle(vm169, "SpiralBuild", {
    ["Text"] = "Spiral Build",
    ["Default"] = false,
    ["Callback"] = function(arg1_210, ...)
        v1 = arg1_210;
        _G.spiralRun = v1;
        if v1 then
            r505 = {};
            task.spawn(function(...)
                v1 = r26.Character;
                if v1 then
                    v1 = r26.Character;
                    i = v1.FindFirstChild(v1, "HumanoidRootPart");
                end;
                r506 = v1;
                if not r506 then
                    return;
                end;
                for X = 1, 9 do
                    v2 = X;
                    if not _G.spiralRun then
                        
                    else
                        pcall(function(...)
                            v3 = r29.MenuToys.SpawnToyRemoteFunction;
                            v3.InvokeServer(v3, "FireworkSparkler", r506.CFrame * CFrame.new(0, 50, 0), Vector3.zero);
                            return; 
                        end);
                        task.wait(.1);
                    end; 
                end;
                task.wait(0.5);
                v3 = r31;
                o = r15;
                v2 = r16;
                n = v2("Z\xc7\xac\x81\xccU\x18\xe9*\xd1I$+", 20857311421936);
                X = v3.FindFirstChild(v3, r26.Name .. o[n]);
                if X then
                    v2 = X.GetChildren;
                    o = {
                        v2(X)
                    };
                    J = v2[2];
                    o = v2[1];
                    for e, n in ipairs(T(o)) do
                        v2 = e;
                        if n.Name == "FireworkSparkler" then
                            v4 = n.FindFirstChild(n, "Handle") or n.FindFirstChildWhichIsA(n, "BasePart");
                            if v4 then
                                table.insert(r505, {
                                    ["toy"] = n,
                                    ["part"] = v4
                                });
                            end;
                        end; 
                    end;
                end;
                o = n[3];
                e = n[2];
                for o, n in ipairs(r505) do
                    v2 = o;
                    if n.part then
                        t = n.toy;
                        v5 = {
                            t.GetDescendants(t)
                        };
                        w = t[2];
                        K = t[1];
                        for a, v5 in ipairs(T(v5)) do
                            t = a;
                            if v5.IsA(v5, "BasePart") then
                                v5.Anchored = false;
                                v5.CanCollide = false;
                                v5.Massless = true;
                            end; 
                        end;
                        v4.BreakJoints(v4);
                        K = Instance.new("BodyPosition");
                        K.MaxForce = Vector3.new(100000000, 100000000, 100000000);
                        K.P = 20000;
                        K.D = 500;
                        K.Parent = v4;
                    end; 
                end;
                e = r30.Heartbeat;
                _G.spiralConn = e.Connect(e, function(...)
                    e = r16;
                    X = "spiralRun";
                    if not _G[X] then
                        v3 = _G.spiralConn;
                        if v3 then
                            v3 = _G.spiralConn;
                            v3.Disconnect(v3);
                        end;
                        e = {
                            ipairs(r505)
                        };
                        X = e[3];
                        J = ipairs(r505);
                        v1 = e[2];
                        X, o = J(v1, X);
                        if X then
                            o = r16("\xd1/\xfeNK", 30619437430706);
                            task[r15[o]](function(...)
                                if Q[e[2]] and Q[e[2]].Parent then
                                    v3 = Q[e[2]];
                                    v1 = v3.Clone(v3);
                                    v1.Archivable = true;
                                    i = Q[e[2]];
                                    r505[i.GetDebugId(i)] = {
                                        ["clone"] = v1,
                                        ["parent"] = Q[e[2]].Parent
                                    };
                                    v3 = Q[e[2]];
                                    v3.Destroy(v3);
                                end;
                                return; 
                            end);
                            return;
                        end;
                        return;
                    end;
                    v2 = r16;
                    X = r26.Character;
                    if X then
                        X = r26.Character;
                        v1 = X.FindFirstChild(X, "HumanoidRootPart");
                    end;
                    r507 = X;
                    if not r507 then
                        return;
                    end;
                    J = v2[2];
                    v1 = v2[1];
                    for e, v2 in ipairs(r505) do
                        r508 = v2;
                        if Q[v3].part and Q[v3].part.Parent then
                            n = (e - 1) * 360 / #r505 / 180 * math.pi;
                            r509 = Vector3.new(math.cos(n) * 9, 0, math.sin(n) * 9);
                            v3 = Q[v3].part;
                            r510 = v3.FindFirstChildOfClass(v3, "BodyPosition");
                            if r510 then
                                pcall(function(...)
                                    r510.Position = r507.Position + r509;
                                    return; 
                                end);
                            end;
                            pcall(function(...)
                                v3 = r50;
                                v3.FireServer(v3, Q[v3].part, Q[v3].part.CFrame);
                                return; 
                            end);
                        end; 
                    end;
                    return; 
                end);
                return; 
            end);
        else
            if _G.spiralConn then
                v3 = _G.spiralConn;
                v3.Disconnect(v3);
                _G.spiralConn = nil;
            end;
            return;
        end; 
    end
});
vm178 = l.Teleport;
vm151 = vm178.AddLeftGroupbox(vm178, "Teleport", "compass");
vm178 = l.Teleport;
vm208 = vm178.AddRightGroupbox(vm178, "Spectate", "eye");
vm151.AddButton(vm151, {
    ["Text"] = "TP to Target",
    ["Func"] = function(...)
        if not r56 then
            r37("Error", "Select target!", 3);
            return;
        end;
        v1 = r56.Character;
        if v1 then
            v1 = r56.Character;
            i = v1.FindFirstChild(v1, "HumanoidRootPart");
        end;
        X = r26.Character;
        X = X and X.FindFirstChild(X, "HumanoidRootPart");
        if v1 then
            i = X and X.FindFirstChild(X, "HumanoidRootPart");
        end;
        if v1 then
            X.CFrame = CFrame.new(v1.Position);
        end;
        return; 
    end
});
vm151.AddToggle(vm151, "LoopTPTarget", {
    ["Text"] = "Loop TP to Target",
    ["Default"] = false,
    ["Callback"] = function(arg1_211, ...)
        v1 = arg1_211;
        _G.sctLoopTP = v1;
        if v1 then
            task.spawn(function(...)
                while _G.sctLoopTP do
                    if r56 and r56.Character then
                        v1 = r26.Character;
                        v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
                        if v1 then
                            v1.CFrame = CFrame.new(r56.Character.HumanoidRootPart.Position);
                        end;
                    end;
                    task.wait(.02); 
                end;
                return; 
            end);
        end;
        return; 
    end
});
vm151.AddButton(vm151, {
    ["Text"] = "TP to Spawn",
    ["Func"] = function(...)
        v1 = r26.Character;
        v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
        if v1 then
            v1.CFrame = CFrame.new(0, 10, 0);
        end;
        return; 
    end
});
r511 = {
    ["Pink House (Plot)"] = CFrame.new(-491.6, -7.4, -146),
    ["Blue House (Plot)"] = CFrame.new(-491.6, -7.4, -146),
    ["Red House (Plot)"] = CFrame.new(-491.6, -7.4, -146),
    ["Dark House (Plot)"] = CFrame.new(-491.6, -7.4, -146),
    ["Green House (Plot)"] = CFrame.new(-491.6, -7.4, -146),
    ["Red House 2"] = CFrame.new(-239, 82.8, -328.9),
    ["Dark Green House"] = CFrame.new(-337.5, 81.6, 341.5),
    ["Dark Red House"] = CFrame.new(137.4, 347.2, 352)
};
r512 = r511["Pink House (Plot)"];
vm151.AddDropdown(vm151, "TeleportLocation", {
    ["Text"] = "Select Location",
    ["Values"] = {
        "Pink House (Plot)",
        "Blue House (Plot)",
        "Red House (Plot)",
        "Dark House (Plot)",
        "Green House (Plot)",
        "Red House 2",
        "Dark Green House",
        "Dark Red House"
    },
    ["Default"] = 1,
    ["Callback"] = function(arg1_212, ...)
        r512 = r511[arg1_212];
        return; 
    end
});
vm151.AddButton(vm151, {
    ["Text"] = "Teleport",
    ["Func"] = function(...)
        v1 = r26.Character;
        i = v1;
        v1 = i and v1.FindFirstChild(v1, "HumanoidRootPart");
        if v1 then
            i = r512;
        end;
        if v1 then
            v1.CFrame = r512;
            r37("Teleport", "Done!", 2);
        end;
        return; 
    end
});
vm151.AddToggle(vm151, "LoopTPLoc", {
    ["Text"] = "Loop TP",
    ["Default"] = false,
    ["Callback"] = function(arg1_213, ...)
        v1 = arg1_213;
        _G.LoopTPLoc = v1;
        if v1 then
            task.spawn(function(...)
                while _G.LoopTPLoc do
                    v1 = r26.Character;
                    i = v1;
                    v1 = i and v1.FindFirstChild(v1, "HumanoidRootPart");
                    if v1 then
                        i = r512;
                    end;
                    if v1 then
                        v1.CFrame = r512;
                    end;
                    task.wait(0); 
                end;
                return; 
            end);
        end;
        return; 
    end
});
vm151.AddButton(vm151, {
    ["Text"] = "TP to Safe Pos",
    ["Func"] = function(...)
        v1 = r26.Character;
        v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
        if v1 then
            v1.CFrame = CFrame.new(-485.6, -9.25, 377.2);
        end;
        return; 
    end
});
vm208.AddDropdown(vm208, "SpecPlayer", {
    ["Values"] = r57(),
    ["Default"] = 1,
    ["Multi"] = false,
    ["Text"] = "Select Player",
    ["Callback"] = function(arg1_214, ...)
        r513 = r58(arg1_214);
        return; 
    end
});
vm208.AddButton(vm208, {
    ["Text"] = "Refresh",
    ["Func"] = function(...)
        v3 = r35.SpecPlayer;
        v3.SetValues(v3, r57());
        return; 
    end
});
vm208.AddToggle(vm208, "Spectate", {
    ["Text"] = "Spectate Player",
    ["Default"] = false,
    ["Callback"] = function(arg1_215, ...)
        if arg1_215 then
            if not r513 or not r513.Character then
                r37("Error", "Select player!", 3);
                v3 = r36.Spectate;
                v3.SetValue(v3, false);
                return;
            end;
            X = r513.Character;
            r32.CameraSubject = X.FindFirstChildOfClass(X, "Humanoid");
            v3 = r514;
            if v3 then
                v3 = r514;
                v3.Disconnect(v3);
            end;
            v3 = r30.Heartbeat;
            r514 = v3.Connect(v3, function(...)
                if not r36.Spectate.Value or (not r513 or not r513.Character) then
                    v3 = r36.Spectate;
                    v3.SetValue(v3, false);
                    return;
                end;
                v1 = r513.Character;
                r32.CameraSubject = v1.FindFirstChildOfClass(v1, "Humanoid");
                return; 
            end);
        else
            v3 = r514;
            if v3 then
                v3 = r514;
                v3.Disconnect(v3);
            end;
            v2 = Q[v2].Character;
            r32.CameraSubject = v2 and v2.FindFirstChildOfClass(v2, "Humanoid");
            v3 = v3;
            return;
        end; 
    end
});
vm216 = l.Keybinds;
vm203 = vm216.AddLeftGroupbox(vm216, "Movement", "arrow-up");
vm216 = l.Keybinds;
vm236 = vm216.AddRightGroupbox(vm216, "Combat", "sword");
vm216 = l.Keybinds;
vm141 = vm216.AddLeftGroupbox(vm216, "Utility", "tool");
vm216 = l.Keybinds;
vm237 = vm216.AddRightGroupbox(vm216, "Fun", "gamepad");
vm216 = r26;
r515 = vm216.GetMouse(vm216);
vm167 = vm203.AddLabel(vm203, "TP to Mouse");
vm167.AddKeyPicker(vm167, "TPKeybind", {
    ["Default"] = "X",
    ["Text"] = "TP to Mouse",
    ["NoUI"] = false,
    ["Callback"] = function(...)
        v1 = r26.Character;
        v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
        if v1 then
            v1.CFrame = CFrame.new(r515.Hit.Position + Vector3.new(0, 3, 0));
        end;
        return; 
    end
});
vm167 = vm203.AddLabel(vm203, "Sit Blobman");
vm167.AddKeyPicker(vm167, "SitBlobmanKey", {
    ["Default"] = "Z",
    ["Text"] = "Sit Blobman",
    ["NoUI"] = false,
    ["Callback"] = function(...)
        v1 = r26.Character;
        if v1 then
            i = v1.FindFirstChildOfClass(v1, "Humanoid");
        end;
        r516 = v1;
        if v1 then
            i = v1.FindFirstChild(v1, "HumanoidRootPart");
        end;
        if not r516 or (not v1 or r516.SeatPart) then
            return;
        end;
        o = 50;
        v4 = r31;
        v2 = v4[2];
        v4 = v4[1];
        for n, w in ipairs(v4.GetDescendants(v4)) do
            K = n;
            if w.IsA(w, "Model") and w.Name == "CreatureBlobman" then
                a = w.FindFirstChild(w, "HumanoidRootPart") or w.PrimaryPart;
                if a then
                    t = (a.Position - v1.Position).Magnitude < 50;
                end;
                if a then
                    e = w;
                    o = (a.Position - v1.Position).Magnitude;
                end;
            end; 
        end;
        if nil then
            r517 = nil.FindFirstChildWhichIsA(nil, "VehicleSeat", true);
            if r517 then
                v1.CFrame = r517.CFrame * CFrame.new(0, 1.2, -1);
                task.wait(.05);
                pcall(function(...)
                    v3 = r517;
                    v3.Sit(v3, r516);
                    return; 
                end);
            end;
        end;
        return; 
    end
});
vm167 = vm203.AddLabel(vm203, "Speed Toggle");
vm167.AddKeyPicker(vm167, "SpeedKey", {
    ["Default"] = "RightShift",
    ["Text"] = "Speed",
    ["NoUI"] = false,
    ["Callback"] = function(...)
        v3 = _G;
        v3.WSE = not _G.WSE;
        v1 = r26.Character;
        v1 = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
        if v1 then
            v3 = "WalkSpeed";
            X = v3;
            v3 = v3;
            v1[v3] = _G.WSE and (_G.WSVal or 50) or 16;
        end;
        v3 = v3;
        v3 = v3;
        r37("Speed", _G.WSE and "ON" or "OFF", 2);
        return; 
    end
});
vm167 = vm203.AddLabel(vm203, "Noclip Toggle");
vm167.AddKeyPicker(vm167, "NoclipKey", {
    ["Default"] = "N",
    ["Text"] = "Noclip",
    ["NoUI"] = false,
    ["Callback"] = function(...)
        _G.sctNC = not _G.sctNC;
        v3 = r37;
        o = v3;
        v3 = o;
        v3 = v3;
        v3("Noclip", _G.sctNC and "ON" or "OFF", 2);
        return; 
    end
});
vm167 = vm203.AddLabel(vm203, "Reset Char");
vm167.AddKeyPicker(vm167, "ResetKey", {
    ["Default"] = "Delete",
    ["Text"] = "Reset",
    ["NoUI"] = false,
    ["Callback"] = function(...)
        v1 = r26.Character;
        if v1 then
            v1.BreakJoints(v1);
        end;
        return; 
    end
});
vm167 = vm236.AddLabel(vm236, "Kill Aura");
vm167.AddKeyPicker(vm167, "KAKey", {
    ["Default"] = "K",
    ["Text"] = "Kill Aura",
    ["NoUI"] = false,
    ["Callback"] = function(...)
        v3 = r36.KillAura;
        v3.SetValue(v3, not r36.KillAura.Value);
        return; 
    end
});
vm167 = vm236.AddLabel(vm236, "Anti Grab");
vm167.AddKeyPicker(vm167, "AGKey", {
    ["Default"] = "G",
    ["Text"] = "Anti Grab",
    ["NoUI"] = false,
    ["Callback"] = function(...)
        v3 = r36.AntiGrab;
        v3.SetValue(v3, not r36.AntiGrab.Value);
        return; 
    end
});
vm167 = vm236.AddLabel(vm236, "Fling Nearest");
vm167.AddKeyPicker(vm167, "FlingKey", {
    ["Default"] = "Q",
    ["Text"] = "Fling",
    ["NoUI"] = false,
    ["Callback"] = function(...)
        e = r15;
        v1 = r26.Character;
        if v1 and v1.FindFirstChild(v1, "HumanoidRootPart") then
            e = r25;
            J = e[3];
            e = e[1];
            for J, v2 in e, ipairs(e.GetPlayers(e)) do
                o = J;
                n = v2 ~= r26 and v2.Character;
                if n then
                    v3 = v2.Character;
                    n = v3.FindFirstChild(v3, "HumanoidRootPart");
                    if n then
                        v4 = (n.Position - (i and v1.FindFirstChild(v1, "HumanoidRootPart")).Position).Magnitude <= 20;
                    end;
                    if n then
                        v4 = Instance.new("BodyVelocity");
                        v4.MaxForce = Vector3.new(100000000, 100000000, 100000000);
                        v4.Velocity = (n.Position - (i and v1.FindFirstChild(v1, "HumanoidRootPart")).Position).Unit * 1000;
                        v4.Parent = n;
                        v3 = r33;
                        v3.AddItem(v3, v4, 0.5);
                    else
                        
                    end;
                end; 
            end;
        end;
        return; 
    end
});
vm167 = vm141.AddLabel(vm141, "Fullbright");
vm167.AddKeyPicker(vm167, "FBKey", {
    ["Default"] = "L",
    ["Text"] = "Fullbright",
    ["NoUI"] = false,
    ["Callback"] = function(...)
        v3 = game;
        v1 = v3.GetService(v3, "Lighting");
        v1.Brightness = 2;
        v1.ClockTime = 14;
        v1.FogEnd = 100000;
        v1.GlobalShadows = false;
        r37("Fullbright", "ON", 2);
        return; 
    end
});
vm167 = vm141.AddLabel(vm141, "FOV+");
vm167.AddKeyPicker(vm167, "FOVUpKey", {
    ["Default"] = "Equals",
    ["Text"] = "FOV+",
    ["NoUI"] = false,
    ["Callback"] = function(...)
        r32.FieldOfView = math.min(r32.FieldOfView + 5, 120);
        r37("FOV", tostring(r32.FieldOfView), 1);
        return; 
    end
});
vm167 = vm141.AddLabel(vm141, "FOV-");
vm167.AddKeyPicker(vm167, "FOVDownKey", {
    ["Default"] = "Minus",
    ["Text"] = "FOV-",
    ["NoUI"] = false,
    ["Callback"] = function(...)
        r32.FieldOfView = math.max(r32.FieldOfView - 5, 1);
        r37("FOV", tostring(r32.FieldOfView), 1);
        return; 
    end
});
vm167 = vm237.AddLabel(vm237, "Spin");
vm167.AddKeyPicker(vm167, "SpinKey", {
    ["Default"] = "R",
    ["Text"] = "Spin",
    ["NoUI"] = false,
    ["Callback"] = function(...)
        if r494 then
            v3 = r494;
            v3.Disconnect(v3);
            r37("Spin", "OFF", 2);
        else
            i = r30.Heartbeat;
            r494 = i.Connect(i, function(...)
                v1 = r26.Character;
                v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
                if v1 then
                    v3 = "CFrame";
                    K = v3;
                    v1[v3] = v1.CFrame * CFrame.Angles(0, math.rad(r495 or 5), 0);
                end;
                return; 
            end);
            r37("Spin", "ON", 2);
        end;
        return; 
    end
});
vm167 = vm237.AddLabel(vm237, "Fake Death");
vm167.AddKeyPicker(vm167, "FDKey", {
    ["Default"] = "F",
    ["Text"] = "Fake Death",
    ["NoUI"] = false,
    ["Callback"] = function(...)
        v1 = r26.Character;
        if v1 then
            v1 = r26.Character;
            i = v1.FindFirstChildOfClass(v1, "Humanoid");
        end;
        r518 = v1;
        if r518 then
            v3 = r518;
            v3.ChangeState(v3, Enum.HumanoidStateType.Physics);
            r518.PlatformStand = true;
            task.delay(2, function(...)
                r518.PlatformStand = false;
                v3 = r518;
                v3.ChangeState(v3, Enum.HumanoidStateType.GettingUp);
                return; 
            end);
        end;
        return; 
    end
});
vm167 = vm237.AddLabel(vm237, "Dance");
vm167.AddKeyPicker(vm167, "DanceKey", {
    ["Default"] = "1",
    ["Text"] = "Dance",
    ["NoUI"] = false,
    ["Callback"] = function(...)
        v1 = r26.Character;
        v1 = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
        if v1 then
            X = Instance.new("Animation");
            X.AnimationId = "rbxassetid://507770677";
            v3 = v1.LoadAnimation(v1, X);
            v3.Play(v3);
        end;
        return; 
    end
});
vm167 = vm237.AddLabel(vm237, "Wave");
vm167.AddKeyPicker(vm167, "WaveKey", {
    ["Default"] = "2",
    ["Text"] = "Wave",
    ["NoUI"] = false,
    ["Callback"] = function(...)
        v1 = r26.Character;
        if v1 and v1.FindFirstChildOfClass(v1, "Humanoid") then
            X = Instance.new("Animation");
            X.AnimationId = "rbxassetid://507770239";
            v3 = v1.LoadAnimation(v1, X);
            v3.Play(v3);
            if Q[Z[4]].lw then
                pcall(function(...)
                    local Z = {
                        Z[4],
                        641,
                        643,
                        Z[5]
                    };
                    v3 = Q[Z[5]].cg;
                    v3.FireServer(v3, Q[Z[5]].ld, Q[Z[5]], Q[Z[5]].lw);
                    return; 
                end);
            end;
            v3 = Q[Z[6]];
            v3.FireServer(v3, Q[Z[5]], Q[Z[4]].br.CFrame);
            return;
        end; 
    end
});
vm167 = l.Whitelist;
vm185 = vm167.AddLeftGroupbox(vm167, "Whitelist", "users");
vm185.AddToggle(vm185, "EnableWhitelist", {
    ["Text"] = "Enable Whitelist",
    ["Default"] = false
});
vm185.AddDropdown(vm185, "MultiWhitelist", {
    ["Values"] = r57(),
    ["Default"] = {},
    ["Multi"] = true,
    ["Text"] = "Whitelist Players"
});
vm185.AddButton(vm185, {
    ["Text"] = "Refresh",
    ["Func"] = function(...)
        v3 = r35.MultiWhitelist;
        v3.SetValues(v3, r57());
        return; 
    end
});
r519 = false;
vm185.AddToggle(vm185, "JoinNotify", {
    ["Text"] = "View PCLD(off>>on to update)",
    ["Default"] = false,
    ["Callback"] = function(arg1_216, ...)
        v1 = arg1_216;
        r519 = v1;
        if v1 then
            i = r520;
            if i then
                i = r520;
                i.Disconnect(i);
            end;
            i = r25.PlayerAdded;
            r520 = i.Connect(i, function(arg1_217, ...)
                if not r519 then
                    return;
                end;
                o = r16("'b\x84\xf2\xa2", 10547999871791);
                e = o[3];
                J = o[2];
                o = "pairs";
                for e, n in pairs(r35.MultiWhitelist[r15[o]]) do
                    if n then
                        if e.match(e, "%((.-)%)") == arg1_217.Name then
                            r37("Detected", "[WL] " .. arg1_217.Name, 8);
                            return;
                        else
                            
                        end;
                    end; 
                end;
                J = r35.TargetPlayer and r35.TargetPlayer.Value;
                if J then
                    if J.match(J, "%((.-)%)") == arg1_217.Name then
                        r37("Detected", "[Target] " .. arg1_217.Name, 8);
                    end;
                end;
                return; 
            end);
        else
            if r520 then
                i = r520;
                i.Disconnect(i);
            end;
            return;
        end; 
    end
});
vm167 = l.CMD;
vm187 = vm167.AddLeftGroupbox(vm167, "Commands", "terminal");
vm167 = l.CMD;
vm238 = vm167.AddRightGroupbox(vm167, "List", "list");
vm187.AddToggle(vm187, "EnableCMD", {
    ["Text"] = "Enable CMD",
    ["Default"] = false,
    ["Callback"] = function(arg1_218, ...)
        v1 = arg1_218;
        _G.CMDEnabled = v1;
        if v1 then
            r37("CMD", "Chat commands ON!", 3);
        end;
        return; 
    end
});
vm187.AddLabel(vm187, "Prefix: /");
vm238.AddLabel(vm238, "/kill + name");
vm238.AddLabel(vm238, "/kickv2 + name");
vm238.AddLabel(vm238, "/kickv3 + name");
vm238.AddLabel(vm238, "/killall");
vm238.AddLabel(vm238, "/kickall");
vm238.AddLabel(vm238, "/bringall /flingall");
vm238.AddLabel(vm238, "/fly /godmode /noclip");
vm238.AddLabel(vm238, "/speed 100");
vm238.AddLabel(vm238, "/esp /fullbright /invis");
vm238.AddLabel(vm238, "/infjump /resetchr /rejoin");
vm238.AddLabel(vm238, "/antiafk");
vm238.AddLabel(vm238, "/tp + name /bring + name");
vm238.AddLabel(vm238, "/fling + name");
vm238.AddLabel(vm238, "/code:... /cmdlist");
vm167 = r26.Chatted;
vm167.Connect(vm167, function(arg1_219, ...)
    v1 = arg1_219;
    if not _G.CMDEnabled then
        return;
    end;
    v1 = v1.lower(v1);
    if v1.find(v1, "/kill ") then
        e = (function(arg1_220, ...)
            e = r25;
            X = e[2];
            e = e[1];
            for J, v2 in pairs(e.GetPlayers(e)) do
                o = J;
                if v2 ~= r26 and 280.find(280, arg1_220) then
                    return v2;
                else
                    
                end; 
            end;
            return; 
        end)(v1.sub(v1, 7));
        i = e;
        if e then
            i = e.Character;
        end;
        v1.lower(v1);
        if i then
            i = e.Character;
            o = i.FindFirstChildOfClass(i, "Humanoid");
            if o then
                o.Health = 0;
                r37("CMD", "Killed " .. J(X(v1, 7)).Name, 3);
            end;
        end;
    else
        if v1.find(v1, "/kickv2 ") then
            e = (function(arg1_221, ...)
                e = r25;
                X = e[2];
                e = e[1];
                for J, v2 in pairs(e.GetPlayers(e)) do
                    o = J;
                    if v2 ~= r26 and 280.find(280, arg1_221) then
                        return v2;
                    else
                        
                    end; 
                end;
                return; 
            end)(v1.sub(v3, 9));
            if e then
                r56 = e;
                o = r36.LoopKickV2;
                o.SetValue(o, true);
                r37("CMD", "KickV2 " .. e.Name, 3);
            end;
        else
            if v3.find(v3, "/kickv3 ") then
                e = (function(arg1_222, ...)
                    e = r25;
                    X = e[2];
                    e = e[1];
                    for J, v2 in pairs(e.GetPlayers(e)) do
                        o = J;
                        if v2 ~= r26 and 280.find(280, arg1_222) then
                            return v2;
                        else
                            
                        end; 
                    end;
                    return; 
                end)(v1.sub(v3, 9));
                if e then
                    r56 = e;
                    v2 = r36.LoopKickV3;
                    v2.SetValue(v2, true);
                    r37("CMD", "KickV3 " .. e.Name, 3);
                end;
            else
                if v3 == "/killall" then
                    K = r25;
                    v2 = K[1];
                    n = K[2];
                    for v4, K in pairs(K.GetPlayers(K)) do
                        e = v4;
                        v1.lower(v1);
                        if K ~= r26 and K.Character then
                            w = K.Character;
                            r521 = w.FindFirstChild(w, "HumanoidRootPart");
                            a = K.Character;
                            r522 = a.FindFirstChildOfClass(a, "Humanoid");
                            v3 = a;
                            if r521 and (r522 and r522.Health > 0) then
                                pcall(function(...)
                                    v3 = r50;
                                    v3.FireServer(v3, r521, r521.CFrame);
                                    task.wait(.05);
                                    v3 = r52;
                                    v3.FireServer(v3, r521);
                                    r522.Health = 0;
                                    return; 
                                end);
                            end;
                        end; 
                    end;
                    r37("CMD", "Killed all!", 3);
                else
                    if v3 == "/kickall" then
                        task.spawn(function(...)
                            if not r60() then
                                r37("CMD", "Blobman needed", 3);
                                return;
                            end;
                            r523 = r59();
                            if not r523 then
                                return;
                            end;
                            e = r25;
                            X = e[2];
                            e = e[1];
                            for J, v2 in pairs(e.GetPlayers(e)) do
                                o = J;
                                if v2 ~= r26 and v2.Character then
                                    v3 = v2.Character;
                                    r524 = v3.FindFirstChild(v3, "HumanoidRootPart");
                                    v3 = v2.Character;
                                    r525 = v3.FindFirstChild(v3, "Humanoid");
                                    if r524 and (r525 and r525.Health > 0) then
                                        r523.br.CFrame = r524.CFrame;
                                        pcall(function(...)
                                            v3 = r523.cg;
                                            v3.FireServer(v3, r523.rd, r524, r523.rw);
                                            if r523.ld and r523.lw then
                                                v3 = r523.cg;
                                                v3.FireServer(v3, r523.ld, r524, r523.lw);
                                            end;
                                            v3 = r50;
                                            v3.FireServer(v3, r524, r523.br.CFrame);
                                            return; 
                                        end);
                                        task.wait(.1);
                                        r523.br.CFrame = r523.sp;
                                        r526 = r523.sp * CFrame.new(0, 25, 0);
                                        r524.CFrame = r526;
                                        pcall(function(...)
                                            r525.PlatformStand = true;
                                            r525.Sit = true;
                                            v3 = r50;
                                            v3.FireServer(v3, r524, r526);
                                            v1 = r523.rd;
                                            v1 = v1.FindFirstChild(v1, "RightWeld") or v1.FindFirstChildWhichIsA(v1, "Weld");
                                            if v1 then
                                                v3 = r523.cd;
                                                v3.FireServer(v3, v1);
                                            end;
                                            v3 = r523.cg;
                                            v3.FireServer(v3, r523.rd, r524, r523.rw);
                                            if r523.ld and r523.lw then
                                                X = r523.ld;
                                                X = X.FindFirstChild(X, "LeftWeld") or X.FindFirstChildWhichIsA(X, "Weld");
                                                if X then
                                                    v3 = r523.cd;
                                                    v3.FireServer(v3, X);
                                                end;
                                                v3 = r523.cg;
                                                v3.FireServer(v3, r523.ld, r524, r523.lw);
                                            end;
                                            v3 = r52;
                                            v3.FireServer(v3, r524);
                                            return; 
                                        end);
                                    end;
                                    task.wait(.1);
                                end; 
                            end;
                            r523.br.CFrame = r523.sp;
                            r37("CMD", "Kicked all!", 3);
                            return; 
                        end);
                    else
                        if v3 == "/bringall" then
                            n = r26.Character;
                            if n then
                                n = r26.Character;
                                e = n.FindFirstChild(n, "HumanoidRootPart");
                            end;
                            v1.lower(v1);
                            if n then
                                w = r25;
                                n = w[1];
                                v4 = w[2];
                                for K, w in pairs(w.GetPlayers(w)) do
                                    v2 = K;
                                    a = w ~= r26 and w.Character;
                                    v3 = v2;
                                    if a then
                                        a = w.Character;
                                        t = a.FindFirstChild(a, "HumanoidRootPart");
                                        if t then
                                            t.CFrame = n.CFrame;
                                        end;
                                    end; 
                                end;
                                r37("CMD", "Brought all!", 2);
                            end;
                        else
                            if v3 == "/flingall" then
                                n = r26.Character;
                                if n then
                                    n = r26.Character;
                                    e = n.FindFirstChild(n, "HumanoidRootPart");
                                end;
                                v1.lower(v1);
                                if n then
                                    w = r25;
                                    K = w[3];
                                    v4 = w[2];
                                    for K, w in pairs(w.GetPlayers(w)) do
                                        v2 = K;
                                        v3 = v2;
                                        if w ~= r26 and w.Character then
                                            a = w.Character;
                                            t = a.FindFirstChild(a, "HumanoidRootPart");
                                            if t then
                                                v5 = Instance.new("BodyVelocity");
                                                v5.MaxForce = Vector3.new(100000000, 100000000, 100000000);
                                                v5.Velocity = (t.Position - n.Position).Unit * 2000;
                                                v5.Parent = t;
                                                a = r33;
                                                a.AddItem(a, v5, 0.5);
                                            end;
                                        end; 
                                    end;
                                    r37("CMD", "Flung all!", 2);
                                end;
                            else
                                if v3 == "/fly" then
                                    e = r36.ClassicFly;
                                    e.SetValue(e, not r36.ClassicFly.Value);
                                    r37("CMD", "Fly: " .. tostring(r36.ClassicFly.Value), 2);
                                else
                                    if v3 == "/godmode" then
                                        e = r36.ClassicGodMode;
                                        e.SetValue(e, not r36.ClassicGodMode.Value);
                                        r37("CMD", "God: " .. tostring(r36.ClassicGodMode.Value), 2);
                                    else
                                        if v3 == "/noclip" then
                                            e = r36.ClassicNoclip;
                                            e.SetValue(e, not r36.ClassicNoclip.Value);
                                            r37("CMD", "Noclip: " .. tostring(r36.ClassicNoclip.Value), 2);
                                        else
                                            if v3.find(v3, "/speed ") then
                                                v2 = tonumber(v1.sub(v3, 8));
                                                if v2 then
                                                    v4 = e(T(n));
                                                    _G.WSVal = v4;
                                                    v4 = r26.Character;
                                                    if v4 then
                                                        v4 = r26.Character;
                                                        e = v4.FindFirstChildOfClass(v4, "Humanoid");
                                                    end;
                                                    v1.lower(v1);
                                                    if v4 then
                                                        v4.WalkSpeed = v2;
                                                        r37("CMD", "Speed: " .. v2, 2);
                                                    end;
                                                end;
                                            else
                                                if v3 == "/esp" then
                                                    e = r36.ClassicESP;
                                                    e.SetValue(e, not r36.ClassicESP.Value);
                                                    r37("CMD", "ESP: " .. tostring(r36.ClassicESP.Value), 2);
                                                else
                                                    if v3 == "/fullbright" then
                                                        e = r36.ClassicFullbright;
                                                        e.SetValue(e, not r36.ClassicFullbright.Value);
                                                        r37("CMD", "FB: " .. tostring(r36.ClassicFullbright.Value), 2);
                                                    else
                                                        if v3 == "/invis" then
                                                            e = r36.ClassicInvis;
                                                            e.SetValue(e, not r36.ClassicInvis.Value);
                                                            r37("CMD", "Invis: " .. tostring(r36.ClassicInvis.Value), 2);
                                                        else
                                                            if v3 == "/infjump" then
                                                                e = r36.ClassicInfJump;
                                                                e.SetValue(e, not r36.ClassicInfJump.Value);
                                                                r37("CMD", "InfJump: " .. tostring(r36.ClassicInfJump.Value), 2);
                                                            else
                                                                if v3 == "/resetchr" then
                                                                    e = r26.Character;
                                                                    if e then
                                                                        e.BreakJoints(e);
                                                                        r37("CMD", "Reset!", 2);
                                                                    end;
                                                                else
                                                                    v2 = "/rejoin";
                                                                    if v3 == v2 then
                                                                        e = game;
                                                                        v2 = e.GetService(e, "TeleportService");
                                                                        v2.Teleport(v2, game.PlaceId, r26);
                                                                    else
                                                                        if v3 == "/antiafk" then
                                                                            e = r36.ClassicAntiAFK;
                                                                            e.SetValue(e, not r36.ClassicAntiAFK.Value);
                                                                            r37("CMD", "AntiAFK: " .. tostring(r36.ClassicAntiAFK.Value), 2);
                                                                        else
                                                                            if v3.find(v3, "/tp ") then
                                                                                e = (function(arg1_223, ...)
                                                                                    e = r25;
                                                                                    X = e[2];
                                                                                    e = e[1];
                                                                                    for J, v2 in pairs(e.GetPlayers(e)) do
                                                                                        o = J;
                                                                                        if v2 ~= r26 and 280.find(280, arg1_223) then
                                                                                            return v2;
                                                                                        else
                                                                                            
                                                                                        end; 
                                                                                    end;
                                                                                    return; 
                                                                                end)(v1.sub(v3, 5));
                                                                                if e then
                                                                                    v2 = e.Character;
                                                                                end;
                                                                                v1.lower(v1);
                                                                                if e then
                                                                                    v2 = e.Character;
                                                                                    n = v2.FindFirstChild(v2, "HumanoidRootPart");
                                                                                    v4 = n;
                                                                                    K = r26.Character;
                                                                                    v2 = v4;
                                                                                    if K then
                                                                                        K = r26.Character;
                                                                                        v2 = K.FindFirstChild(K, "HumanoidRootPart");
                                                                                    end;
                                                                                    if n then
                                                                                        v4 = K;
                                                                                    end;
                                                                                    v3 = v4;
                                                                                    if n then
                                                                                        v2.CFrame = n.CFrame;
                                                                                        r37("CMD", "TP " .. J(X(v1, 5)).Name, 2);
                                                                                    end;
                                                                                end;
                                                                            else
                                                                                if v3.find(v3, "/bring ") then
                                                                                    e = (function(arg1_224, ...)
                                                                                        e = r25;
                                                                                        X = e[2];
                                                                                        e = e[1];
                                                                                        for J, v2 in pairs(e.GetPlayers(e)) do
                                                                                            o = J;
                                                                                            if v2 ~= r26 and 280.find(280, arg1_224) then
                                                                                                return v2;
                                                                                            else
                                                                                                
                                                                                            end; 
                                                                                        end;
                                                                                        return; 
                                                                                    end)(v1.sub(v3, 8));
                                                                                    v4 = r26.Character;
                                                                                    v2 = v1.lower(v1);
                                                                                    if v4 then
                                                                                        v4 = r26.Character;
                                                                                        v2 = v4.FindFirstChild(v4, "HumanoidRootPart");
                                                                                    end;
                                                                                    n = v2;
                                                                                    if v2 then
                                                                                        if e then
                                                                                            K = J(X(v1, 8)).Character;
                                                                                        end;
                                                                                        v1.lower(v1);
                                                                                        n = e;
                                                                                    end;
                                                                                    v1.lower(v1);
                                                                                    if n then
                                                                                        n = e.Character;
                                                                                        v4 = n.FindFirstChild(n, "HumanoidRootPart");
                                                                                        if v4 then
                                                                                            v4.CFrame = v2.CFrame;
                                                                                            r37("CMD", "Brought " .. J(X(v1, 8)).Name, 2);
                                                                                        end;
                                                                                    end;
                                                                                else
                                                                                    if v3.find(v3, "/fling ") then
                                                                                        e = (function(arg1_225, ...)
                                                                                            e = r25;
                                                                                            X = e[2];
                                                                                            e = e[1];
                                                                                            for J, v2 in pairs(e.GetPlayers(e)) do
                                                                                                o = J;
                                                                                                if v2 ~= r26 and 280.find(280, arg1_225) then
                                                                                                    return v2;
                                                                                                else
                                                                                                    
                                                                                                end; 
                                                                                            end;
                                                                                            return; 
                                                                                        end)(v1.sub(v3, 8));
                                                                                        v4 = r26.Character;
                                                                                        v2 = v1.lower(v1);
                                                                                        if v4 then
                                                                                            v4 = r26.Character;
                                                                                            v2 = v4.FindFirstChild(v4, "HumanoidRootPart");
                                                                                        end;
                                                                                        n = v2;
                                                                                        if v2 then
                                                                                            if e then
                                                                                                K = J(X(v1, 8)).Character;
                                                                                            end;
                                                                                            v1.lower(v1);
                                                                                            n = e;
                                                                                        end;
                                                                                        v1.lower(v1);
                                                                                        if n then
                                                                                            n = e.Character;
                                                                                            v4 = n.FindFirstChild(n, "HumanoidRootPart");
                                                                                            if v4 then
                                                                                                K = Instance.new("BodyVelocity");
                                                                                                K.MaxForce = Vector3.new(100000000, 100000000, 100000000);
                                                                                                K.Velocity = (v4.Position - v4.Position).Unit * 2000;
                                                                                                K.Parent = v4;
                                                                                                n = r33;
                                                                                                n.AddItem(n, K, 0.5);
                                                                                                r37("CMD", "Flung " .. J(X(v1, 8)).Name, 2);
                                                                                            end;
                                                                                        end;
                                                                                    else
                                                                                        if v3.find(v3, "/code:") then
                                                                                            r37("CMD", "Code: " .. v1.sub(v3, 7), 3);
                                                                                        else
                                                                                            v1.lower(v1);
                                                                                            if v3 == "/cmdlist" or (v3 == "/cmds" or v3 == "/help") then
                                                                                                r37("CMD", "Commands: /kill /kickv2 /kickv3 /killall /kickall /bringall /flingall /fly /godmode /noclip /speed /esp /fullbright /invis /infjump /resetchr /rejoin /antiafk /tp /bring /fling /code:", 10);
                                                                                            end;
                                                                                            return;
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
end);
vm167 = l.Misc;
vm231 = vm167.AddRightGroupbox(vm167, "Auras", "sparkles");
r527 = 12;
vm231.AddSlider(vm231, "KillAuraRadius", {
    ["Text"] = "Kill Aura Radius",
    ["Min"] = 5,
    ["Max"] = 50,
    ["Default"] = 12,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_226, ...)
        v1 = arg1_226;
        r527 = v1;
        kaR = v1;
        return; 
    end
});
r529 = 20;
vm231.AddSlider(vm231, "DualKickRadius", {
    ["Text"] = "Dual Kick Aura Radius",
    ["Min"] = 10,
    ["Max"] = 100,
    ["Default"] = 20,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_227, ...)
        r529 = arg1_227;
        return; 
    end
});
vm231.AddToggle(vm231, "DualKickAura", {
    ["Text"] = "Dual Kick Aura (Blob)",
    ["Default"] = false,
    ["Callback"] = function(arg1_228, ...)
        if r528 then
            v3 = r528;
            v3.Disconnect(v3);
        end;
        if not arg1_228 then
            return;
        end;
        i = r30.Heartbeat;
        r528 = i.Connect(i, function(...)
            tick();
            v3 = r26.Character;
            X = ipairs;
            J = X and X.FindFirstChild(X, "Humanoid");
            e = J and J.SeatPart;
            if X then
                i = X.FindFirstChild(X, "HumanoidRootPart");
            end;
            v2 = not e;
            if e then
                i = X;
            end;
            v3 = v2;
            if not e then
                return;
            end;
            v2 = e.Parent;
            n = v2.FindFirstChild(v2, "BlobmanSeatAndOwnerScript");
            if n then
                i = n.FindFirstChild(n, "CreatureGrab");
            end;
            r530 = n;
            if n then
                i = n.FindFirstChild(n, "CreatureDrop");
            end;
            r531 = n;
            r532 = v2.FindFirstChild(v2, "LeftDetector");
            v3 = v2.FindFirstChild(v2, "RightDetector");
            r533 = v3;
            t = r532;
            i = 41;
            if t then
                t = r532;
                i = t.FindFirstChild(t, "LeftWeld");
            end;
            r534 = i;
            v5 = r533;
            i = 594;
            if v5 then
                v5 = r533;
                i = v5.FindFirstChild(v5, "RightWeld");
            end;
            r535 = i;
            F = r530;
            if F then
                i = r531 and r532;
                v2.FindFirstChild(v2, "RightDetector");
            end;
            v3 = v3;
            if not F then
                return;
            end;
            Y = r25;
            v6 = Y[2];
            Y = Y[1];
            for F, W in ipairs(Y.GetPlayers(Y)) do
                u = F;
                if W ~= r26 and W.Character then
                    v3 = W.Character;
                    r536 = v3.FindFirstChild(v3, "HumanoidRootPart");
                    v3 = W.Character;
                    if r536 and v3.FindFirstChildOfClass(v3, "Humanoid") then
                        pcall(function(...)
                            v3 = r530;
                            v3.FireServer(v3, r532, r536, r534);
                            task.wait(.04);
                            v3 = r531;
                            v3.FireServer(v3, r534, r536);
                            v3 = r530;
                            v3.FireServer(v3, r533, r536, r535);
                            task.wait(.04);
                            v3 = r531;
                            v3.FireServer(v3, r535, r536);
                            return; 
                        end);
                    end;
                end; 
            end;
            return; 
        end);
        return; 
    end
});
r538 = 20;
vm231.AddSlider(vm231, "KickAura1Radius", {
    ["Text"] = "Kick Aura Radius",
    ["Min"] = 10,
    ["Max"] = 100,
    ["Default"] = 20,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_229, ...)
        r538 = arg1_229;
        return; 
    end
});
vm231.AddToggle(vm231, "KickAura1", {
    ["Text"] = "Kick Aura (Blob)",
    ["Default"] = false,
    ["Callback"] = function(arg1_230, ...)
        if r537 then
            v3 = r537;
            v3.Disconnect(v3);
        end;
        if not arg1_230 then
            return;
        end;
        i = r30.Heartbeat;
        r537 = i.Connect(i, function(...)
            v3 = r26.Character;
            v1 = ipairs;
            X = v1 and v1.FindFirstChild(v1, "Humanoid");
            J = X and X.SeatPart;
            o = not J;
            if J then
                i = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
            end;
            v3 = o;
            if not J then
                return;
            end;
            o = J.Parent;
            v2 = o.FindFirstChild(o, "BlobmanSeatAndOwnerScript");
            if v2 then
                i = v2.FindFirstChild(v2, "CreatureGrab");
            end;
            r539 = v2;
            if v2 then
                i = v2.FindFirstChild(v2, "CreatureDrop");
            end;
            r540 = v2;
            v3 = o.FindFirstChild(o, "RightDetector");
            r541 = v3;
            r542 = r541 and ("\xae\x1e\x8c\xd2=HVn}\x10\xb2\x92{").FindFirstChild("\xae\x1e\x8c\xd2=HVn}\x10\xb2\x92{", "RightWeld");
            v3 = v3;
            if not (r539 and (r540 and (r541 and r542))) then
                return;
            end;
            v5 = r25;
            a = v5[2];
            t = v5[3];
            v5 = "ipairs";
            for t, F in ipairs(v5.GetPlayers(v5)) do
                v6 = t;
                if F ~= r26 and F.Character then
                    v3 = F.Character;
                    r543 = v3.FindFirstChild(v3, "HumanoidRootPart");
                    v3 = F.Character;
                    Y = v3.FindFirstChild(v3, "Humanoid");
                    s = r543;
                    if s then
                        if Y then
                            v3 = F.Character;
                            s = v3.FindFirstChild(v3, r15[S]).Health > 0 and (r543.Position - (v1 and v1.FindFirstChild(v1, "HumanoidRootPart")).Position).Magnitude <= r538;
                        end;
                        v3 = F.Character;
                        W = Y;
                    end;
                    if s then
                        pcall(function(...)
                            v1 = r541;
                            v1 = v1.FindFirstChild(v1, "RightWeld") or v1.FindFirstChildWhichIsA(v1, "Weld");
                            if v1 then
                                v3 = r540;
                                v3.FireServer(v3, v1);
                                v3 = r539;
                                v3.FireServer(v3, r541, r543, r542);
                            end;
                            return; 
                        end);
                    end;
                end; 
            end;
            return; 
        end);
        return; 
    end
});
r545 = 15;
vm231.AddSlider(vm231, "RAKRadius", {
    ["Text"] = "Remove AK Aura Radius",
    ["Min"] = 5,
    ["Max"] = 50,
    ["Default"] = 15,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_231, ...)
        r545 = arg1_231;
        return; 
    end
});
vm231.AddToggle(vm231, "RemoveAKAura", {
    ["Text"] = "Remove Anti-Kick Aura",
    ["Default"] = false,
    ["Callback"] = function(arg1_232, ...)
        if r544 then
            v3 = r544;
            v3.Disconnect(v3);
        end;
        if not arg1_232 then
            return;
        end;
        r546 = r29.GrabEvents.SetNetworkOwner;
        i = r30.Heartbeat;
        r544 = i.Connect(i, function(...)
            v1 = r26.Character;
            i = v1;
            if not (i and v1.FindFirstChild(v1, "HumanoidRootPart")) then
                return;
            end;
            e = r25;
            X = e[2];
            e = e[1];
            for J, v2 in ipairs(e.GetPlayers(e)) do
                o = J;
                if v2 ~= r26 then
                    v4 = v2.Character;
                    n = v4;
                    if n then
                        v4 = (n.Position - (i and v1.FindFirstChild(v1, "HumanoidRootPart")).Position).Magnitude <= r545;
                    end;
                    if n and v4.FindFirstChild(v4, "HumanoidRootPart") then
                        v3 = r31;
                        v4 = v3.FindFirstChild(v3, v2.Name .. "SpawnedInToys");
                        if v4 then
                            v5 = "NinjaKunai";
                            w = v5[2];
                            a = v5[3];
                            for a, v5 in ipairs({
                                v5,
                                "NinjaShuriken",
                                "AntiKick"
                            }) do
                                t = a;
                                r547 = v4.FindFirstChild(v4, v5);
                                Y = r547;
                                if Y then
                                    Y = r547;
                                    F = Y.FindFirstChild(Y, "SoundPart");
                                end;
                                if Y then
                                    pcall(function(...)
                                        v3 = r546;
                                        v3.FireServer(v3, r547.SoundPart, r547.SoundPart.CFrame);
                                        return; 
                                    end);
                                end; 
                            end;
                        end;
                    end;
                end; 
            end;
            return; 
        end);
        return; 
    end
});
vm231.AddToggle(vm231, "LaunchAura", {
    ["Text"] = "Launch Aura",
    ["Default"] = false,
    ["Callback"] = function(arg1_233, ...)
        v1 = arg1_233;
        _G.LaunchA = v1;
        if v1 then
            task.spawn(function(...)
                while _G.LaunchA do
                    pcall(function(...)
                        v1 = r26.Character;
                        if not v1 or not v1.FindFirstChild(v1, "HumanoidRootPart") then
                            return;
                        end;
                        X = v1.HumanoidRootPart;
                        o = r25;
                        e = o[3];
                        J = o[2];
                        o = "pairs";
                        for e, n in pairs(o.GetPlayers(o)) do
                            v2 = e;
                            v4 = n ~= r26 and n.Character;
                            if v4 then
                                v3 = n.Character;
                                w = r15;
                                v4 = v3.FindFirstChild(v3, "Torso");
                                if v4 then
                                    K = (v4.Position - v1.HumanoidRootPart.Position).Magnitude <= 25;
                                end;
                                if v4 then
                                    w = v4.FindFirstChild(v4, "LaunchBV");
                                    K = w;
                                    if w then
                                        w.Name = "LaunchBV";
                                        w.Velocity = Vector3.new(0, 200000000000, 0);
                                        w.MaxForce = Vector3.new(0, 1000000000000, 0);
                                        v3 = r33;
                                        v3.AddItem(v3, w, 100);
                                    else
                                        K = Instance.new("BodyVelocity", v3.FindFirstChild(v3, w[t]));
                                    end;
                                end;
                            end; 
                        end;
                        return; 
                    end);
                    task.wait(.02); 
                end;
                return; 
            end);
        end;
        return; 
    end
});
vm231.AddToggle(vm231, "DeathAura", {
    ["Text"] = "Death Aura",
    ["Default"] = false,
    ["Callback"] = function(arg1_234, ...)
        v1 = arg1_234;
        X = v1;
        _G.DeathA = X;
        if v1 then
            X = r30.Heartbeat;
            _G.DeathAConn = X.Connect(X, function(...)
                if not _G.DeathA then
                    return;
                end;
                J = r25;
                X = J[3];
                v1 = J[2];
                J = "ipairs";
                for X, o in ipairs(J.GetPlayers(J)) do
                    e = X;
                    if o ~= r26 and o.Character then
                        v3 = o.Character;
                        r548 = v3.FindFirstChild(v3, "HumanoidRootPart");
                        v3 = o.Character;
                        r549 = v3.FindFirstChild(v3, "Head");
                        v3 = o.Character;
                        r550 = v3.FindFirstChildOfClass(v3, "Humanoid");
                        if r548 and (r549 and (r550 and r550.Health > 0)) then
                            w = r26.Character;
                            v2 = w;
                            if v2 then
                                w = (r548.Position - v2.Position).Magnitude <= 25;
                            end;
                            if v2 and w.FindFirstChild(w, "HumanoidRootPart") then
                                pcall(function(...)
                                    v3 = r50;
                                    v3.FireServer(v3, r548, r548.CFrame);
                                    task.wait(.1);
                                    v3 = r52;
                                    v3.FireServer(v3, r548);
                                    v1 = r549;
                                    X = v1.FindFirstChild(v1, "PartOwner");
                                    if X then
                                        i = r549.PartOwner.Value == r26.Name;
                                    end;
                                    if X then
                                        J = r550.Parent;
                                        X = J[3];
                                        J = J[1];
                                        for X, o in J, pairs(J.GetChildren(J)) do
                                            e = X;
                                            if o.IsA(o, "BasePart") then
                                                o.CFrame = CFrame.new(-1000000000, 1000000000, -1000000000);
                                            end; 
                                        end;
                                        r551 = Instance.new("BodyVelocity");
                                        r551.Velocity = Vector3.new(0, -10000000, 0);
                                        r551.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000);
                                        r551.Parent = r548;
                                        v3 = r550;
                                        v3.ChangeState(v3, Enum.HumanoidStateType.Dead);
                                        task.delay(2, function(...)
                                            if r551 and r551.Parent then
                                                v3 = r551;
                                                v3.Destroy(v3);
                                            end;
                                            return; 
                                        end);
                                    end;
                                    return; 
                                end);
                            end;
                        end;
                    end; 
                end;
                return; 
            end);
        else
            v3 = _G.DeathAConn;
            if v3 then
                v3 = _G.DeathAConn;
                v3.Disconnect(v3);
            end;
            return;
        end; 
    end
});
r552 = 32;
vm231.AddSlider(vm231, "EggAuraRadius", {
    ["Text"] = "Egg Aura Radius",
    ["Min"] = 10,
    ["Max"] = 100,
    ["Default"] = 32,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_235, ...)
        r552 = arg1_235;
        return; 
    end
});
vm231.AddToggle(vm231, "EggKillAura", {
    ["Text"] = "Egg Kill Aura",
    ["Default"] = false,
    ["Callback"] = function(arg1_236, ...)
        _G.EKA = arg1_236;
        return; 
    end
});
vm231.AddToggle(vm231, "EggVoidAura", {
    ["Text"] = "Egg Void Aura",
    ["Default"] = false,
    ["Callback"] = function(arg1_237, ...)
        _G.EVA = arg1_237;
        return; 
    end
});
vm231.AddToggle(vm231, "EggFlingAura", {
    ["Text"] = "Egg Fling Aura",
    ["Default"] = false,
    ["Callback"] = function(arg1_238, ...)
        _G.EFA2 = arg1_238;
        return; 
    end
});
vm231.AddToggle(vm231, "EggAnchorAura", {
    ["Text"] = "Egg Anchor Aura",
    ["Default"] = false,
    ["Callback"] = function(arg1_239, ...)
        _G.EAA = arg1_239;
        return; 
    end
});
vm167 = l.Misc;
vm211 = vm167.AddLeftGroupbox(vm167, "Mega Anti", "shield");
r553 = "_SOB_BP";
r554 = "_SOB_BG";
r555 = false;
r556 = {};
r557 = CFrame.new(322.31, 9.52, 489.68);
r560 = {
    "idle",
    "walk",
    "run",
    "jump",
    "fall",
    "climb",
    "sit",
    "swim",
    "tool",
    "wave",
    "point",
    "dance",
    "cheer",
    "laugh",
    "tilt",
    "movedirection",
    "land"
};
r561 = {
    "grab",
    "hold",
    "carry",
    "punch",
    "stun",
    "ragdoll",
    "knock",
    "sleep",
    "drag",
    "pull",
    "throw",
    "slam",
    "choke",
    "bind",
    "tie",
    "capture",
    "arrest",
    "cuff",
    "kill",
    "eat",
    "swallow",
    "consume",
    "caught",
    "trapped",
    "picked",
    "lifted",
    "fling",
    "toss",
    "crush",
    "blob",
    "devour",
    "absorb"
};
local function r562(arg1_240, ...)
    v1 = arg1_240;
    i = v1;
    if v1 then
        X = v1.lower(v1);
        if X == "" then
            return false;
        end;
        o = r560;
        e = ("")[3];
        o = ("")[1];
        for e, n in o, ipairs(o) do
            v2 = e;
            if X.find(X, n) then
                return true;
            else
                
            end; 
        end;
        return false;
    else
        i = "";
    end; 
end;
local function r563(arg1_241, ...)
    v1 = arg1_241;
    i = v1;
    if v1 then
        X = v1.lower(v1);
        o = r561;
        J = 275[2];
        e = 275[3];
        for e, n in ipairs(i) do
            v2 = e;
            if X.find(X, n) then
                return true;
            else
                
            end; 
        end;
        return false;
    else
        i = "";
    end; 
end;
local function r564(arg1_242, ...)
    v1 = arg1_242;
    X = v1.Name == r553;
    if X then
        return X;
    else
        i = v1.Name == r554;
    end; 
end;
local function r565(arg1_243, ...)
    v1 = arg1_243;
    o = "BodyVelocity";
    J = o[3];
    e = o[1];
    for J, v2 in e, ipairs(e) do
        o = J;
        if v1.IsA(v1, v2) then
            return true;
        else
            
        end; 
    end;
    return false; 
end;
local function r566(arg1_244, ...)
    v1 = arg1_244;
    v3 = r558;
    if v3 then
        pcall(function(...)
            v3 = r558;
            v3.Disconnect(v3);
            return; 
        end);
    end;
    X = v1.WaitForChild(v1, "Humanoid", 5);
    if not X then
        return;
    end;
    v3 = v3;
    J = X.FindFirstChildOfClass(X, "Animator") or X.WaitForChild(X, "Animator", 3);
    if not J then
        return;
    end;
    i = J.AnimationPlayed;
    r558 = i.Connect(i, function(arg1_245, ...)
        r567 = arg1_245;
        if not r555 then
            return;
        end;
        r568 = "";
        pcall(function(...)
            v3 = i[J];
            r568 = r567.Animation and r567.Animation.Name or "";
            return; 
        end);
        e = r563(r568);
        if e then
            if e then
                pcall(function(...)
                    v3 = r567;
                    v3.Stop(v3, 0);
                    return; 
                end);
                task.defer(function(...)
                    pcall(function(...)
                        v3 = Q[v1];
                        v3.Stop(v3, 0);
                        return; 
                    end);
                    return; 
                end);
                J = r26.Character;
                J = J and J.FindFirstChild(J, "HumanoidRootPart");
                if J then
                    J.CFrame = r557;
                    J.AssemblyLinearVelocity = Vector3.zero;
                    J.AssemblyAngularVelocity = Vector3.zero;
                end;
            end;
            return;
        end; 
    end);
    return; 
end;
vm211.AddToggle(vm211, "MegaAntiAll", {
    ["Text"] = "Anti All [2026]",
    ["Default"] = false,
    ["Callback"] = function(arg1_246, ...)
        v1 = arg1_246;
        r555 = v1;
        if v1 then
            J = 275[2];
            e = 275[3];
            for e, v2 in pairs(r556) do
                r569 = v2;
                o = e;
                pcall(function(...)
                    v3 = Q[i];
                    v3.Disconnect(v3);
                    return; 
                end); 
            end;
            r556 = {};
            pcall(function(...)
                if Q[v2].Character then
                    r566(Q[v2].Character);
                    r559 = Q[v2].Character;
                end;
                return; 
            end);
            o = Q[v2].CharacterAdded;
            table.insert(r556, o.Connect(o, function(arg1_247, ...)
                v1 = arg1_247;
                if not r555 then
                    return;
                end;
                task.wait(.3);
                r566(v1);
                r559 = v1;
                return; 
            end));
            task.spawn(function(...)
                while r555 do
                    task.wait(.15);
                    pcall(function(...)
                        v1 = Q[v2].Character;
                        v1 = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
                        if not v1 then
                            return;
                        end;
                        v2 = 10872340534214;
                        v1.ChangeState(v1, Enum.HumanoidStateType.GettingUp);
                        X = v1.FindFirstChildOfClass(v1, r15[r16("\xe5z\x87\x05\x08\xe6C\xc2", v2)]);
                        if X then
                            v2 = X.GetPlayingAnimationTracks;
                            o = {
                                v2(X)
                            };
                            J = v2[2];
                            e = v2[3];
                            for e, n in pairs(T(i)) do
                                r570 = n;
                                v2 = e;
                                r571 = "";
                                pcall(function(...)
                                    v3 = r15[w];
                                    r571 = r570.Animation and r570.Animation.Name or "";
                                    return; 
                                end);
                                v3 = not r562(r571);
                                if v3 then
                                    v3 = r570;
                                    v3.Stop(v3, 0);
                                end; 
                            end;
                        end;
                        v1.Sit = false;
                        v1.PlatformStand = false;
                        if Q[v2].Character ~= r559 then
                            r559 = Q[v2].Character;
                            r566(Q[v2].Character);
                        end;
                        return; 
                    end); 
                end;
                return; 
            end);
            task.spawn(function(...)
                while r555 do
                    task.wait(.3);
                    pcall(function(...)
                        v1 = Q[v2].Character;
                        if not v1 then
                            return;
                        end;
                        o = v1.GetDescendants;
                        e = {
                            o(v1)
                        };
                        J = o[3];
                        X = o[2];
                        for J, v2 in pairs(T("pairs")) do
                            K = Env[i];
                            o = J;
                            v4 = v2.IsA(v2, "Weld") or (v2.IsA(v2, "WeldConstraint") or v2.IsA(v2, "RigidConstraint"));
                            v3 = K;
                            if v4 and (v2.Part0 and v2.Part1) then
                                K = v2.Part0;
                                v4 = not K.IsDescendantOf(K, v1);
                                if v4 or not K.IsDescendantOf(K, v1) then
                                    v3 = K;
                                    v3 = not w;
                                    if r15.GucciType and r15.GucciType.Value == "Blobman" then
                                        Q[({
                                            Z[4],
                                            641,
                                            643
                                        })[13]]();
                                    else
                                        Q[({
                                            Z[4],
                                            641,
                                            643
                                        })[14]]();
                                    end;
                                    break;
                                else
                                end;
                            end; 
                        end;
                        return; 
                    end); 
                end;
                return; 
            end);
            local function X(...)
                if not r555 then
                    return;
                end;
                v1 = Q[v2].Character;
                i = 196;
                if v1 then
                    v1 = Q[v2].Character;
                    i = v1.FindFirstChild(v1, "HumanoidRootPart");
                end;
                r572 = i;
                X = Q[v2].Character;
                i = 211;
                if X then
                    X = Q[v2].Character;
                    i = X.FindFirstChildOfClass(X, "Humanoid");
                end;
                r573 = i;
                if not r572 then
                    return;
                end;
                pcall(function(...)
                    r572.Anchored = false;
                    v3 = r572;
                    v1 = v3.FindFirstChild(v3, r553);
                    if not v1 then
                        v1 = Instance.new("BodyPosition");
                        v1.Name = r553;
                        v1.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
                        v1.P = 10000000;
                        v1.D = 100000;
                        v1.Parent = r572;
                    end;
                    v1.Position = r557.Position;
                    v3 = r572;
                    X = v3.FindFirstChild(v3, r554);
                    if not X then
                        X = Instance.new("BodyGyro");
                        X.Name = r554;
                        X.MaxTorque = Vector3.new(math.huge, math.huge, math.huge);
                        X.P = 10000000;
                        X.Parent = r572;
                    end;
                    X.CFrame = r557;
                    for o = 1, 10 do
                        e = o;
                        r572.CFrame = r557;
                        r572.AssemblyLinearVelocity = Vector3.zero;
                        r572.AssemblyAngularVelocity = Vector3.zero; 
                    end;
                    n = r572;
                    v4 = {
                        n.GetChildren(n)
                    };
                    e = n[1];
                    o = n[2];
                    for v2, v4 in pairs(T(v4)) do
                        n = v2;
                        a = r565(v4);
                        if a then
                            K = not Q[v2](v4);
                        end;
                        if a then
                            v4.Destroy(v4);
                        end; 
                    end;
                    n = Q[v2].Character;
                    v4 = {
                        n.GetDescendants(n)
                    };
                    v2 = n[3];
                    o = n[2];
                    for v2, v4 in pairs(T(v4)) do
                        n = v2;
                        if v4.IsA(v4, "BasePart") and v4 ~= r572 then
                            v4.AssemblyLinearVelocity = Vector3.zero;
                            Y = 32714208508801;
                            v4.AssemblyAngularVelocity = Vector3[r15[r16("\xd0\x07\xce\x93", Y)]];
                            v5 = v4.GetChildren;
                            w = v5[2];
                            a = v5[3];
                            for a, v5 in pairs(v5(v4)) do
                                Y = r564(v5);
                                t = a;
                                if Y then
                                    v6 = not Q[v2](v5);
                                end;
                                if Y then
                                    v5.Destroy(v5);
                                end; 
                            end;
                        end; 
                    end;
                    if r573 and (r573.SeatPart and not v4.IsDescendantOf(v4, Q[v2].Character)) then
                        r573.Jump = true;
                        r573.Sit = false;
                    end;
                    if r573 then
                        r573.PlatformStand = false;
                        r573.Sit = false;
                        r573.Health = r573.MaxHealth;
                    end;
                    n = Q[v2].Character;
                    v4 = {
                        n.GetDescendants(n)
                    };
                    o = n[2];
                    e = n[1];
                    for v2, v4 in pairs(T(v4)) do
                        n = v2;
                        if v4.IsA(v4, "Fire") or (v4.IsA(v4, "Smoke") or v4.IsA(v4, "Sparkles")) then
                            v4.Destroy(v4);
                        end; 
                    end;
                    r572.CFrame = r557;
                    r572.AssemblyLinearVelocity = Vector3.zero;
                    r572.AssemblyAngularVelocity = Vector3.zero;
                    r572.Anchored = false;
                    return; 
                end);
                return; 
            end;
            v2 = r30.RenderStepped;
            table.insert(r556, v2.Connect(v2, X));
            v2 = r30.Heartbeat;
            table.insert(r556, v2.Connect(v2, X));
            v2 = r30.Stepped;
            table.insert(r556, v2.Connect(v2, X));
            v2 = r30.Heartbeat;
            table.insert(r556, v2.Connect(v2, function(...)
                if not r555 then
                    return;
                end;
                v1 = Q[v2].Character;
                i = v1;
                v1 = i and v1.FindFirstChild(v1, "HumanoidRootPart");
                if v1 then
                    i = (v1.Position - r557.Position).Magnitude > 5;
                end;
                if v1 then
                    v1.Anchored = false;
                    task.wait();
                    for X = 1, 500 do
                        v2 = X;
                        v1.CFrame = r557;
                        v1.AssemblyLinearVelocity = Vector3.zero; 
                    end;
                    X = v1.FindFirstChild(v1, r553);
                    if X then
                        X.Position = r557.Position;
                    end;
                end;
                return; 
            end));
        else
            v2 = r556;
            e = 277[2];
            o = 277[3];
            for o, v2 in pairs(v2) do
                X = o;
                r574 = v2;
                pcall(function(...)
                    v3 = r574;
                    v3.Disconnect(v3);
                    return; 
                end); 
            end;
            r556 = {};
            if r558 then
                pcall(function(...)
                    v3 = Q[vm193];
                    v3.Disconnect(v3);
                    return; 
                end);
                Q[vm193] = nil;
            end;
            pcall(function(...)
                v1 = Q[v2].Character;
                v1 = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
                if v1 then
                    v1.Anchored = false;
                    X = v1.FindFirstChild(v1, r553);
                    if X then
                        X.Destroy(X);
                    end;
                    J = v1.FindFirstChild(v1, r554);
                    if J then
                        J.Destroy(J);
                    end;
                end;
                return; 
            end);
            return;
        end; 
    end
});
r575 = false;
r576 = false;
r577 = Color3.fromRGB(255, 0, 0);
r578 = false;
r579 = Color3.fromRGB(0, 255, 0);
r580 = false;
r581 = Color3.fromRGB(255, 255, 0);
r582 = false;
r583 = Color3.fromRGB(0, 0, 255);
r584 = {};
r585 = {};
local function r586(...)
    J = r585;
    X = 641[3];
    J = 641[1];
    for X, o in J, pairs(J) do
        r587 = o;
        pcall(function(...)
            v3 = r587;
            v3.Remove(v3);
            return; 
        end); 
    end;
    r585 = {};
    if not r575 then
        return;
    end;
    if r576 then
        o = r25;
        J = o[2];
        e = o[3];
        for e, o in ipairs(o.GetPlayers(o)) do
            v1 = e;
            if o ~= r26 and o.Character then
                v2 = o.Character;
                n = v2.FindFirstChild(v2, "HumanoidRootPart");
                a = r16;
                v4 = v2.FindFirstChildOfClass(v2, "Humanoid");
                if n then
                    if v4 then
                        a = v2.FindFirstChildOfClass(v2, r15[t]).Health > 0;
                    end;
                    v3 = n;
                    K = v4;
                end;
                v3 = n;
                if n then
                    a = r56 and o.Name == r56.Name;
                    v3 = r56 and o.Name == r56.Name;
                    if r56 and o.Name == r56.Name then
                        K = true;
                    end;
                    if false then
                        t = Instance.new("Highlight");
                        t.Name = "ESP_Highlight_" .. o.Name;
                        v5 = o.Character;
                        t.Adornee = v5;
                        t.FillColor = r577;
                        t.FillTransparency = 0.5;
                        t.OutlineColor = r577;
                        t.OutlineTransparency = 0;
                        t.Parent = Q[o];
                        table.insert(r585, t);
                    end;
                end;
            end; 
        end;
    end;
    if r578 then
        J = r26.Character;
        if J then
            J = r26.Character;
            v1 = J.FindFirstChild(J, "HumanoidRootPart");
        end;
        if J then
            v2 = r25;
            o = v2[3];
            for o, v2 in v2[1], ipairs(v2.GetPlayers(v2)) do
                X = o;
                n = v2 ~= r26 and v2.Character;
                v3 = X;
                if n then
                    n = v2.Character;
                    v4 = n.FindFirstChild(n, "HumanoidRootPart");
                    if v4 then
                        K = Drawing.new("Line");
                        K.Thickness = 2;
                        K.Color = r579;
                        K.Transparency = 1;
                        K.ZIndex = 1;
                        n = r32;
                        a = n.WorldToViewportPoint(n, J.Position);
                        n = r32;
                        t = n.WorldToViewportPoint(n, v4.Position);
                        v3 = v3;
                        if a.Z > 0 and t.Z > 0 then
                            K.From = Vector2.new(a.X, a.Y);
                            K.To = Vector2.new(t.X, t.Y);
                            K.Visible = true;
                        else
                            K.Visible = false;
                        end;
                        table.insert(r585, K);
                    end;
                end; 
            end;
        end;
    end;
    if r580 then
        o = "Character";
        if r26[o] and o.FindFirstChild(o, "Head") then
            v2 = r25;
            J = v2[1];
            e = v2[2];
            for o, v2 in ipairs(v2.GetPlayers(v2)) do
                X = o;
                n = v2 ~= r26 and v2.Character;
                v3 = X;
                if n then
                    n = v2.Character;
                    a = r15;
                    if n.FindFirstChild(n, "Head") then
                        a = r56;
                        if a then
                            n = v2.Name == r56.Name;
                        end;
                        v3 = v4;
                        if a then
                            a = Drawing.new("Line");
                            a.Thickness = 3;
                            a.Color = r581;
                            a.Transparency = 1;
                            a.ZIndex = 2;
                            K = r32;
                            t = K.WorldToViewportPoint(K, (J and o.FindFirstChild(o, "Head")).Position);
                            K = r32;
                            v5 = K.WorldToViewportPoint(K, n.FindFirstChild(n, K).Position);
                            v6 = K;
                            v3 = v6;
                            if t.Z > 0 and v5.Z > 0 then
                                a.From = Vector2.new(t.X, t.Y);
                                a.To = Vector2.new(v5.X, v5.Y);
                                a.Visible = true;
                            else
                                a.Visible = false;
                            end;
                            table.insert(r585, a);
                        end;
                    end;
                end; 
            end;
        end;
    end;
    if r582 then
        o = r31;
        J = o[2];
        X = o[1];
        for e, o in ipairs(o.GetDescendants(o)) do
            v1 = e;
            K = "Tool";
            if o.IsA(o, K) or o.IsA(o, "Model") then
                K = v2;
                n = n;
                v3 = n;
                v2 = o.IsA(o, "Model") and o.PrimaryPart or o.IsA(o, "Tool");
                if v2 then
                    n = v2.IsA(v2, "BasePart");
                end;
                v3 = n;
                if v2 then
                    v4 = o.Name;
                    K = v4.lower(v4);
                    v3 = v4;
                    if K.find(K, "sword") or (K.find(K, "gun") or (K.find(K, "knife") or (K.find(K, "tool") or K.find(K, "weapon")))) then
                        n = true;
                    end;
                    if false then
                        t = Instance.new("Highlight");
                        t.Name = "ESP_Item_" .. o.Name;
                        t.Adornee = o;
                        t.FillColor = r583;
                        t.FillTransparency = .7;
                        t.OutlineColor = r583;
                        t.OutlineTransparency = .3;
                        t.Parent = Q[o];
                        table.insert(r585, t);
                    end;
                end;
            end; 
        end;
    end; 
end;
local function r588(...)
    if r575 then
        r586();
    end;
    return; 
end;
vm251 = l.Misc;
vm218 = vm251.AddRightGroupbox(vm251, "ESP System", "eye");
vm218.AddToggle(vm218, "ESPEnabled", {
    ["Text"] = "Enable ESP",
    ["Default"] = false,
    ["Callback"] = function(arg1_248, ...)
        v1 = arg1_248;
        r575 = v1;
        if v1 then
            e = r30.RenderStepped;
            table.insert(r584, e.Connect(e, r588));
            r37("ESP", "Enabled!", 3);
        else
            X = 275[1];
            J = 275[2];
            for e, v2 in pairs(r584) do
                o = e;
                r589 = v2;
                pcall(function(...)
                    v3 = r589;
                    v3.Disconnect(v3);
                    return; 
                end); 
            end;
            r584 = {};
            v2 = r585;
            o = 277[3];
            e = 277[2];
            for o, v2 in pairs(v2) do
                X = o;
                r590 = v2;
                pcall(function(...)
                    v3 = r590;
                    v3.Remove(v3);
                    return; 
                end); 
            end;
            r585 = {};
            n = r27;
            v4 = {
                n.GetChildren(n)
            };
            v2 = n[3];
            for v2, n in n[1], pairs(T(v4)) do
                J = v2;
                v4 = n.Name;
                if v4.find(v4, "ESP_") then
                    n.Destroy(n);
                end; 
            end;
            r37("ESP", "Disabled!", 2);
            return;
        end; 
    end
});
vm218.AddToggle(vm218, "ESPPlayers", {
    ["Text"] = "ESP Players (Kick)",
    ["Default"] = false,
    ["Callback"] = function(arg1_249, ...)
        r576 = arg1_249;
        if r575 then
            r588();
        end;
        return; 
    end
});
vm251 = vm218.AddLabel(vm218, "Player ESP Color");
vm251.AddColorPicker(vm251, "ESPPlayerColor", {
    ["Default"] = Color3.fromRGB(255, 0, 0),
    ["Title"] = "Player ESP Color",
    ["Callback"] = function(arg1_250, ...)
        r577 = arg1_250;
        if r575 then
            r588();
        end;
        return; 
    end
});
vm218.AddToggle(vm218, "ESPPlayerLines", {
    ["Text"] = "ESP Lines to Players",
    ["Default"] = false,
    ["Callback"] = function(arg1_251, ...)
        r578 = arg1_251;
        if r575 then
            r588();
        end;
        return; 
    end
});
vm251 = vm218.AddLabel(vm218, "Lines Color");
vm251.AddColorPicker(vm251, "ESPLineColor", {
    ["Default"] = Color3.fromRGB(0, 255, 0),
    ["Title"] = "Lines Color",
    ["Callback"] = function(arg1_252, ...)
        r579 = arg1_252;
        if r575 then
            r588();
        end;
        return; 
    end
});
vm218.AddToggle(vm218, "ESPHeadLines", {
    ["Text"] = "ESP Head Lines (Kick)",
    ["Default"] = false,
    ["Callback"] = function(arg1_253, ...)
        r580 = arg1_253;
        if r575 then
            r588();
        end;
        return; 
    end
});
vm251 = vm218.AddLabel(vm218, "Head Lines Color");
vm251.AddColorPicker(vm251, "ESPHeadLineColor", {
    ["Default"] = Color3.fromRGB(255, 255, 0),
    ["Title"] = "Head Lines Color",
    ["Callback"] = function(arg1_254, ...)
        r581 = arg1_254;
        if r575 then
            r588();
        end;
        return; 
    end
});
vm218.AddToggle(vm218, "ESPItems", {
    ["Text"] = "ESP Items",
    ["Default"] = false,
    ["Callback"] = function(arg1_255, ...)
        r582 = arg1_255;
        if r575 then
            r588();
        end;
        return; 
    end
});
vm251 = vm218.AddLabel(vm218, "Items Color");
vm251.AddColorPicker(vm251, "ESPItemColor", {
    ["Default"] = Color3.fromRGB(0, 0, 255),
    ["Title"] = "Items Color",
    ["Callback"] = function(arg1_256, ...)
        r583 = arg1_256;
        if r575 then
            r588();
        end;
        return; 
    end
});
vm211.AddToggle(vm211, "SitLock", {
    ["Text"] = "Sit Lock",
    ["Default"] = false,
    ["Callback"] = function(arg1_257, ...)
        v1 = arg1_257;
        _G.SitLock = v1;
        if v1 then
            task.spawn(function(...)
                while _G.SitLock do
                    pcall(function(...)
                        v1 = r26.Character;
                        if not v1 then
                            return;
                        end;
                        X = v1.FindFirstChildOfClass(v1, "Humanoid");
                        J = v1.FindFirstChild(v1, "HumanoidRootPart");
                        if not X or not J then
                            return;
                        end;
                        a = 32022559685183;
                        X.PlatformStand = false;
                        X.Sit = false;
                        X.ChangeState(X, Enum[r15[r16("k\xd0B\xfc\x06\x19k\xb2\xb6\x9dC,\xe1\x18x\x1a\xda", a)]].GettingUp);
                        n = v1.GetDescendants;
                        v2 = {
                            n(v1)
                        };
                        o = n[3];
                        v2 = n[1];
                        for o, v4 in v2, pairs(T(v2)) do
                            n = o;
                            v3 = 70;
                            Q[v3] = v4;
                            w = Q[v3];
                            v5 = r15;
                            if w.IsA(w, "Weld") or w.IsA(w, "WeldConstraint") then
                                pcall(function(...)
                                    r591 = Q[v3].Part0;
                                    return; 
                                end);
                                v3 = pcall;
                                v3(function(...)
                                    r592 = Q[v3].Part1;
                                    return; 
                                end);
                                if r591 and not v5.IsDescendantOf(v5, r26.Character) then
                                    v3 = Q[v3];
                                    v3.Destroy(v3);
                                else
                                    if r592 and not v5.IsDescendantOf(v5, r26.Character) then
                                        v3 = Q[v3];
                                        v3.Destroy(v3);
                                    end;
                                end;
                            end;
                            a = r565(Q[v3]);
                            if a then
                                v3 = 70;
                                K = not r564(Q[v3]) and Q[v3].Parent;
                            end;
                            if a then
                                v3 = Q[v3];
                                v3.Destroy(v3);
                            end; 
                        end;
                        J.AssemblyLinearVelocity = Vector3.zero;
                        J.AssemblyAngularVelocity = Vector3.zero;
                        v3 = r29.CharacterEvents.RagdollRemote;
                        v3.FireServer(v3, J, 0);
                        return; 
                    end);
                    task.wait(.05); 
                end;
                return; 
            end);
        end;
        return; 
    end
});
vm211.AddToggle(vm211, "Anonymous", {
    ["Text"] = "Anonymous",
    ["Default"] = false,
    ["Callback"] = function(arg1_258, ...)
        if arg1_258 then
            v3 = r593;
            if v3 then
                v3 = r593;
                v3.Disconnect(v3);
            end;
            v3 = r30.Heartbeat;
            r593 = v3.Connect(v3, function(...)
                pcall(function(...)
                    v1 = r26.Character;
                    if not v1 then
                        return;
                    end;
                    v2 = 6687864425514;
                    o = "FL8\xd7";
                    X = v1.FindFirstChild(v1, r15[r16(o, v2)]);
                    if X then
                        v2 = X.GetDescendants;
                        o = {
                            v2(X)
                        };
                        J = v2[2];
                        o = v2[1];
                        for e, n in pairs(T(o)) do
                            v2 = e;
                            if n.IsA(n, "TextLabel") or n.IsA(n, "TextBox") then
                                if n.Text == r26.DisplayName or n.Text == r26.Name then
                                    n.Text = "Anonymous";
                                end;
                            end; 
                        end;
                    end;
                    return; 
                end);
                return; 
            end);
        else
            if r593 then
                v3 = r593;
                v3.Disconnect(v3);
            end;
            return;
        end; 
    end
});
r594 = {
    CFrame.new(326.8, -4.5, 486.7),
    CFrame.new(601.7, 124.3, -101.4),
    CFrame.new(539, 96.5, -391),
    CFrame.new(-525.1, 52, -164.9),
    CFrame.new(-576.5, 50.4, 89.2)
};
r595 = {};
vm211.AddToggle(vm211, "AntiRezonans", {
    ["Text"] = "Anti Rezonans v2",
    ["Default"] = false,
    ["Callback"] = function(arg1_259, ...)
        v1 = arg1_259;
        X = v1;
        _G.AntiRezon = X;
        e = r595;
        X = ("FQ\xe7\x95\xa8\xbb\xce\x07\xa6")[2];
        e = ("FQ\xe7\x95\xa8\xbb\xce\x07\xa6")[1];
        for J, v2 in pairs(e) do
            r596 = v2;
            o = J;
            pcall(function(...)
                v3 = r596;
                v3.Disconnect(v3);
                return; 
            end); 
        end;
        r595 = {};
        if v1 then
            r597 = 0;
            local function X(...)
                if not _G.AntiRezon then
                    return;
                end;
                v1 = r26.Character;
                i = v1;
                if v1 then
                    v1 = r26.Character;
                    i = v1.FindFirstChild(v1, "HumanoidRootPart");
                end;
                r598 = i;
                X = r26.Character;
                i = X;
                if X then
                    X = r26.Character;
                    i = X.FindFirstChildOfClass(X, "Humanoid");
                end;
                r599 = i;
                if not r598 then
                    return;
                end;
                pcall(function(...)
                    r598.Anchored = false;
                    r597 = r597 % #r594 + 1;
                    v1 = r594[r597];
                    J = r594[r597];
                    r598.CFrame = J;
                    r598.AssemblyLinearVelocity = Vector3.zero;
                    r598.AssemblyAngularVelocity = Vector3.zero;
                    i = r599;
                    if i then
                        r599.PlatformStand = false;
                        r599.Sit = false;
                        i = r599;
                        i.ChangeState(i, Enum.HumanoidStateType.GettingUp);
                    end;
                    K = r16;
                    o = r26.Character;
                    v2 = {
                        o.GetDescendants(o)
                    };
                    J = o[2];
                    X = o[1];
                    for e, v2 in pairs(T(v2)) do
                        n = r597 % #r594 + 1;
                        o = e;
                        r600 = v2;
                        v4 = r600;
                        a = r15;
                        v5 = r16("I\xe9\x9c\xda", 26431840727060);
                        v3 = n;
                        if v4.IsA(v4, a[v5]) or v4.IsA(v4, "WeldConstraint") then
                            pcall(function(...)
                                r601 = r600.Part0;
                                return; 
                            end);
                            a = n;
                            pcall(function(...)
                                r602 = r600.Part1;
                                return; 
                            end);
                            n = n;
                            v3 = n;
                            i = r601 and not v5.IsDescendantOf(v5, r26.Character) or r602;
                            v3 = n;
                            if i then
                                i = r600;
                                i.Destroy(i);
                            end;
                        end;
                        n = v3;
                        K = r565(r600);
                        i = K;
                        if K then
                            v4 = not r564(r600) and r600.Parent;
                            while not r598 do
                                t = X;
                                while not X do
                                    if X then
                                        t = o[1];
                                        v1.CFrame = t;
                                        v1.Velocity = Vector3.zero;
                                    end;
                                    v3 = r599.Heartbeat;
                                    v3.Wait(v3);
                                    while r598 do
                                        J = r15;
                                        if not J or not J.Parent then
                                            
                                        else
                                            a = r16;
                                            v3 = r594.Character;
                                            o = e and v3.FindFirstChild(v3, "Humanoid");
                                            v2 = o and o.SeatPart;
                                            w = not v2;
                                            if w or v2.Parent.Name ~= "CreatureBlobman" then
                                                v3 = r599.Heartbeat;
                                                v3.Wait(v3);
                                            else
                                                r603 = v2.Parent;
                                                w = r603;
                                                a = w.FindFirstChild(w, "HumanoidRootPart");
                                                if a then
                                                    v1 = a;
                                                    if X then
                                                        X = X;
                                                        v4 = v3.Character;
                                                        if v4 then
                                                            a = v4.FindFirstChild(v4, "HumanoidRootPart");
                                                        end;
                                                        r604 = v4;
                                                        t = r604;
                                                        if t then
                                                            a = i;
                                                        end;
                                                        if t then
                                                            if tick() - tick() < .35 then
                                                            end;
                                                        end;
                                                    else
                                                        if v1 then
                                                            a = i.CFrame;
                                                        end;
                                                        v3 = v2.Parent;
                                                        w = v1;
                                                    end;
                                                else
                                                    i = r603.PrimaryPart;
                                                end;
                                            end;
                                        end; 
                                    end;
                                    r598 = false;
                                    J = r26 and r26.LoopKickBlob;
                                    v3 = false;
                                    if J then
                                        J = r26.LoopKickBlob;
                                        J.SetValue(J, false);
                                        break;
                                    end;
                                    return; 
                                end;
                                t = r594[r597]; 
                            end;
                            v1.CFrame = Q[n].CFrame;
                            v1.Velocity = Vector3.zero;
                            pcall(function(...)
                                v3 = Q[v3];
                                v1 = v3.FindFirstChild(v3, "BlobmanSeatAndOwnerScript");
                                if v1 then
                                    i = v1.FindFirstChild(v1, "CreatureGrab");
                                end;
                                v3 = Q[v3];
                                J = v3.FindFirstChild(v3, "RightDetector");
                                if v1 then
                                    i = v3.FindFirstChild(v3, r16[v2]);
                                end;
                                if v1 then
                                    v1.FireServer(v1, J, Q[n], J and J.FindFirstChild(J, "RightWeld"));
                                end;
                                return; 
                            end);
                            v3 = r599.Heartbeat;
                            v3.Wait(v3);
                        end; 
                    end;
                    o = r26.Character;
                    v2 = {
                        o.GetDescendants(o)
                    };
                    e = o[3];
                    J = o[2];
                    for e, v2 in pairs(T(v2)) do
                        o = e;
                        v3 = r597 % #r594 + 1;
                        if v2.IsA(v2, "Fire") or (v2.IsA(v2, "Smoke") or v2.IsA(v2, "Sparkles")) then
                            v2.Destroy(v2);
                        end; 
                    end;
                    i = r29.CharacterEvents.RagdollRemote;
                    i.FireServer(i, r598, 0);
                    return; 
                end);
                return; 
            end;
            n = r30.RenderStepped;
            table.insert(r595, n.Connect(n, X));
            n = r30.Heartbeat;
            table.insert(r595, n.Connect(n, X));
            n = r30.Stepped;
            table.insert(r595, n.Connect(n, X));
        end;
        return; 
    end
});
vm211.AddButton(vm211, {
    ["Text"] = "Remove Void",
    ["Func"] = function(...)
        r31.FallenPartsDestroyHeight = -1e+95;
        r37("Mega Anti", "Void removed!", 3);
        return; 
    end
});
vm211.AddButton(vm211, {
    ["Text"] = "Anti Ragdoll Fire Server",
    ["Func"] = function(...)
        if r53 then
            J = Q[J];
            X = J[3];
            J = J[1];
            for X, o in J, pairs(J.GetPlayers(J)) do
                e = X;
                n = o.Character;
                if n then
                    n = o.Character;
                    v2 = n.FindFirstChild(n, "HumanoidRootPart");
                end;
                if n then
                    for n = 1, 150 do
                        v3 = r53;
                        v2 = n;
                        v3.FireServer(v3, o.Character.HumanoidRootPart, 9999999);
                        task.wait(); 
                    end;
                end; 
            end;
        end;
        return; 
    end
});
r605 = Instance.new("ScreenGui");
r605.Name = "SitBtnGui";
r605.ResetOnSpawn = false;
r605.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
r605.Parent = r27;
r606 = Instance.new("TextButton");
r606.Name = "SitBtn";
r606.Size = UDim2.new(0, 55, 0, 55);
r606.Position = UDim2.new(1, -70, 0.5, -27);
r606.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
r606.BackgroundTransparency = .1;
r606.TextColor3 = Color3.fromRGB(255, 255, 255);
r606.Text = "SIT";
r606.Font = Enum.Font.GothamBold;
r606.TextSize = 16;
r606.BorderSizePixel = 0;
r606.Parent = r605;
Instance.new("UICorner", r606).CornerRadius = UDim.new(0, 8);
vm139 = Instance.new("UIStroke");
vm139.Color = Color3.fromRGB(255, 0, 0);
vm139.Thickness = 3;
vm139.Parent = r606;
vm189 = r606.MouseButton1Click;
vm189.Connect(vm189, function(...)
    v1 = r26.Character;
    if v1 then
        i = v1.FindFirstChild(v1, "HumanoidRootPart");
    end;
    r607 = v1;
    J = v1 and v1.FindFirstChild(v1, "Humanoid");
    if not r607 or not J then
        return;
    end;
    n = r16("\xcf\x01\xf3\x99}\xbe\x89\\T\xa6\xbe\xea|", 27457382330865);
    v3 = r31;
    o = v3.FindFirstChild(v3, r26.Name .. r15[n]);
    v2 = o and o.FindFirstChild(o, "CreatureBlobman");
    if not v2 then
        pcall(function(...)
            v3 = r29.MenuToys.SpawnToyRemoteFunction;
            v3.InvokeServer(v3, "CreatureBlobman", r607.CFrame * CFrame.new(0, 0, 0), Vector3.zero);
            return; 
        end);
        v3 = not o;
        if v3 then
            v3 = Q[a];
            v3.WaitForChild(v3, r26[r15[r16("^\xe9p\xf0", w)]] .. r15[n], 5);
        end;
        if o then
            v2 = o.WaitForChild(o, "CreatureBlobman", 5);
        end;
    end;
    if v2 then
        K = 5;
        n = v2.WaitForChild(v2, "VehicleSeat", K);
        if n then
            K = tick();
            v4 = J.SeatPart == n or tick() - K > 2;
            repeat
                
            until not J.SeatPart;
            r607.CFrame = n.CFrame + Vector3.new(0, 1, 0);
            r607.Velocity = Vector3.zero;
            n.Sit(n, J);
            v4 = r30.Heartbeat;
            v4.Wait(v4);
            v3 = not v2;
            if J.SeatPart == n or tick() - K > 2 then
                return;
            end;
        end;
    end; 
end);
vm135 = r606.InputBegan;
vm135.Connect(vm135, function(arg1_260, ...)
    r612 = arg1_260;
    J = r612.UserInputType;
    if J == Enum.UserInputType.MouseButton1 or r612.UserInputType == Enum.UserInputType.Touch then
        r608 = true;
        r610 = r612.Position;
        r611 = r606.Position;
        J = r612.Changed;
        J.Connect(J, function(...)
            if r612.UserInputState == Enum.UserInputState.End then
                r608 = false;
            end;
            return; 
        end);
    end;
    return; 
end);
vm135 = r606.InputChanged;
vm135.Connect(vm135, function(arg1_261, ...)
    v1 = arg1_261;
    if v1.UserInputType == Enum.UserInputType.MouseMovement or v1.UserInputType == Enum.UserInputType.Touch then
        v3 = arg1_261;
        r609 = v3;
    end;
    return; 
end);
vm135 = r28.InputChanged;
vm135.Connect(vm135, function(arg1_262, ...)
    v1 = arg1_262;
    if v1 == r609 and r608 then
        X = v1.Position - r610;
        r606.Position = UDim2.new(r611.X.Scale, r611.X.Offset + X.X, r611.Y.Scale, r611.Y.Offset + X.Y);
    end;
    return; 
end);
r613 = 0;
r614 = 0;
vm243 = r30.Heartbeat;
vm243.Connect(vm243, function(arg1_263, ...)
    v1 = arg1_263;
    X = r26.Character;
    if not X then
        return;
    end;
    r615 = X.FindFirstChild(X, "HumanoidRootPart");
    if not r615 or not X.FindFirstChildOfClass(X, "Humanoid") then
        return;
    end;
    r613 = r613 + v1;
    r614 = r614 + v1;
    w = r16("\x01N\xa5\x17\x98", 15616233348199);
    if _G[r15[w]] then
        w = X.GetDescendants;
        K = {
            w(X)
        };
        v4 = w[3];
        for v4, K in w[1], pairs(T(K)) do
            o = v4;
            if K.IsA(K, "BasePart") then
                K.CanCollide = false;
            end; 
        end;
    end;
    if r614 >= .3 then
        v3 = r613 + v1;
        if _G.EKA or (_G.EVA or (_G.EFA2 or _G.EAA)) then
            K = r25;
            v2 = K[1];
            n = K[2];
            for v4, K in ipairs(K.GetPlayers(K)) do
                o = v4;
                r616 = K;
                v3 = v2;
                if r616 ~= r26 and r616.Character then
                    w = r616.Character;
                    r617 = w.FindFirstChild(w, "HumanoidRootPart");
                    a = r616.Character;
                    r618 = a.FindFirstChildOfClass(a, "Humanoid");
                    v3 = a;
                    if r617 and (r618 and (r618.Health > 0 and (r617.Position - r615.Position).Magnitude <= r552)) then
                        pcall(function(...)
                            v3 = r50;
                            v3.FireServer(v3, r617);
                            if _G.EKA then
                                r618.Health = 0;
                                v3 = r616.Character;
                                v3.BreakJoints(v3);
                                r55(r617, CFrame.new(4096, -75, 4096));
                                r54(r617, Vector3.new(0, -1000, 0));
                            end;
                            if _G.EVA then
                                r54(r617, Vector3.new(0, 10000, 0));
                            end;
                            v3 = _G.EFA2;
                            if v3 then
                                v1 = Instance.new("BodyVelocity");
                                v1.MaxForce = Vector3.new(100000000, 100000000, 100000000);
                                v1.Velocity = (r617.Position - r615.Position).Unit * 500;
                                v1.Parent = r617;
                                v3 = r33;
                                v3.AddItem(v3, v1, 0.5);
                            end;
                            if _G.EAA then
                                r617.Anchored = true;
                            end;
                            return; 
                        end);
                    end;
                end; 
            end;
        end;
        r614 = 0;
    end;
    if r613 >= 1.5 then
        v3 = r613 + v1;
        if r56 and (r56.Parent and r56.Character) then
            if _G.ELK then
                task.spawn(function(arg1_264, ...)
                    v1 = arg1_264;
                    X = v1.Character;
                    if X then
                        X = v1.Character;
                        i = X.FindFirstChild(X, "HumanoidRootPart");
                    end;
                    r619 = X;
                    if r619 then
                        pcall(function(...)
                            v3 = r50;
                            v3.FireServer(v3, r619);
                            r55(r619, CFrame.new(4096, -75, 4096));
                            r54(r619, Vector3.new(0, -1000, 0));
                            return; 
                        end);
                    end;
                    return; 
                end, r56);
            end;
            if _G.ELV then
                task.spawn(function(arg1_265, ...)
                    v1 = arg1_265;
                    X = v1.Character;
                    if X then
                        X = v1.Character;
                        i = X.FindFirstChild(X, "HumanoidRootPart");
                    end;
                    r620 = X;
                    if r620 then
                        pcall(function(...)
                            v3 = r50;
                            v3.FireServer(v3, r620);
                            r54(r620, Vector3.new(0, 10000, 0));
                            return; 
                        end);
                    end;
                    return; 
                end, r56);
            end;
        end;
        r613 = 0;
    end;
    if _G.FlingA then
        a = r25;
        K = a[2];
        v4 = a[1];
        for w, a in ipairs(a.GetPlayers(a)) do
            n = w;
            v3 = r613 + v1;
            if a ~= r26 and a.Character then
                t = a.Character;
                v5 = t.FindFirstChild(t, "HumanoidRootPart");
                t = v5;
                if v5 then
                    t = (v5.Position - r615.Position).Magnitude <= 20;
                end;
                v3 = v5;
                if t then
                    v6 = Instance.new("BodyVelocity");
                    v6.MaxForce = Vector3.new(100000000, 100000000, 100000000);
                    W = v3;
                    v3 = v3;
                    v6.Velocity = (v5.Position - r615.Position).Unit * (r35.FlingAuraStrength and r35.FlingAuraStrength.Value or 300);
                    v6.Parent = v5;
                    t = r33;
                    t.AddItem(t, v6, .1);
                end;
            end; 
        end;
    end;
    if kaE then
        if tick() - kaCD >= .12 then
            a = r25;
            K = a[2];
            v4 = a[1];
            for w, a in ipairs(a.GetPlayers(a)) do
                n = w;
                if a == r26 then
                    
                end;
                r621 = a.Character;
                u = r621;
                F = u;
                if u then
                    u = r621;
                    F = u.FindFirstChild(u, "HumanoidRootPart");
                end;
                r622 = F;
                u = r621;
                F = u;
                if u then
                    u = r621;
                    F = u.FindFirstChildOfClass(u, "Humanoid");
                end;
                r623 = F;
                v3 = r613 + v1;
                if r622 and (r623 and (r623.Health > 0 and (r622.Position - r615.Position).Magnitude <= kaR)) then
                    kaCD = tick();
                    pcall(function(...)
                        v3 = r50;
                        v3.FireServer(v3, r622, r622.CFrame);
                        r623.Health = 0;
                        v3 = r621;
                        v3.BreakJoints(v3);
                        return; 
                    end);
                else
                    
                end; 
            end;
        end;
    end;
    return; 
end);
vm243 = r28.JumpRequest;
vm243.Connect(vm243, function(...)
    if _G.sctIJ then
        v1 = r26.Character;
        X = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
        if X then
            i = X.GetState(X) ~= Enum.HumanoidStateType.Dead;
        end;
        if X then
            v3 = X.UseJumpPower;
            if v3 then
                v3 = "JumpPower";
                J = v3;
                (v1 and v1.FindFirstChildOfClass(v1, "Humanoid"))[v3] = _G.sctJPVal or 100;
            else
                v2 = v3;
                n = v3;
                (v1 and v1.FindFirstChildOfClass(v1, "Humanoid")).JumpHeight = (_G.sctJPVal or 100) * (_G.sctJPVal or 100) / 392.4;
            end;
            X.ChangeState(X, Enum.HumanoidStateType.Jumping);
        end;
    end;
    return; 
end);
vm243 = r26.CharacterAdded;
vm243.Connect(vm243, function(arg1_266, ...)
    v1 = arg1_266;
    task.wait(0.5);
    X = v1.WaitForChild(v1, "Humanoid", 5);
    if not X then
        return;
    end;
    if _G.ClassicSP then
        X.WalkSpeed = 100;
    else
        v3 = _G.sctWS;
        if v3 then
            v3 = "WalkSpeed";
            v2 = "WalkSpeed";
            v1.WaitForChild(v1, "Humanoid", 5)[v3] = 16 * (_G.sctWSVal or 5) / 5;
        else
            if _G.WSE then
                e = v3;
                v1.WaitForChild(v1, "Humanoid", 5).WalkSpeed = _G.WSVal or 50;
            else
                if _G.WSVal then
                    v1.WaitForChild(v1, "Humanoid", 5).WalkSpeed = _G.WSVal;
                else
                    v1.WaitForChild(v1, "Humanoid", 5).WalkSpeed = 16;
                end;
                return;
            end;
        end;
    end; 
end);
spawn(function(...)
    while task.wait(1) do
        e = r15;
        J = "NicknameESP";
        if r36[J] and r36.NicknameESP.Value then
            J = r25;
            X = J[3];
            J = J[1];
            for X, o in J, pairs(J.GetPlayers(J)) do
                e = X;
                if o ~= r26 and (o.Character and 280.FindFirstChild(280, "HumanoidRootPart")) then
                    v2 = Instance.new("BillboardGui");
                    v2.Name = "NameESP";
                    v2.Adornee = o.Character.HumanoidRootPart;
                    v2.Size = UDim2.new(0, 100, 0, 30);
                    v2.StudsOffset = Vector3.new(0, 3, 0);
                    v2.AlwaysOnTop = true;
                    v2.Parent = o.Character.HumanoidRootPart;
                    n = Instance.new("TextLabel");
                    n.Size = UDim2.new(1, 0, 1, 0);
                    n.BackgroundTransparency = 1;
                    n.Text = o.Name;
                    n.TextColor3 = Color3.new(1, 1, 1);
                    n.TextStrokeTransparency = 0;
                    n.TextScaled = true;
                    n.Parent = v2;
                end; 
            end;
        else
            e = r25;
            o = {
                e.GetPlayers(e)
            };
            J = e[3];
            X = e[2];
            for J, o in pairs(T(o)) do
                e = J;
                n = o.Character;
                if n then
                    n = o.Character;
                    v2 = n.FindFirstChild(n, "HumanoidRootPart");
                end;
                if n then
                    v3 = o.Character.HumanoidRootPart;
                    v2 = v3.FindFirstChild(v3, "NameESP");
                    if v2 then
                        v2.Destroy(v2);
                    end;
                end; 
            end;
        end; 
    end;
    return; 
end);
vm243 = l.UI;
vm263 = vm243.AddLeftGroupbox(vm243, "Menu Settings", "settings");
vm243 = l.UI;
vm256 = vm243.AddRightGroupbox(vm243, "Background", "image");
vm263.AddButton(vm263, {
    ["Text"] = "Unload",
    ["Func"] = function(...)
        v3 = r605;
        if v3 then
            v3 = r605;
            v3.Destroy(v3);
        end;
        v3 = r34;
        v3.Unload(v3);
        return; 
    end
});
vm243 = vm263.AddLabel(vm263, "Menu bind");
vm243.AddKeyPicker(vm243, "MenuKeybind", {
    ["Default"] = "RightShift",
    ["NoUI"] = true,
    ["Text"] = "Menu bind"
});
r34.ToggleKeybind = r35.MenuKeybind;
r624 = false;
vm263.AddToggle(vm263, "AlwaysViewCursor", {
    ["Text"] = "Always View Cursor",
    ["Default"] = false,
    ["Callback"] = function(arg1_267, ...)
        v1 = arg1_267;
        r624 = v1;
        if v1 then
            i = game;
            i.GetService(i, "UserInputService").MouseIconEnabled = true;
        end;
        return; 
    end
});
vm256.AddToggle(vm256, "CustomBackground", {
    ["Text"] = "Custom Background",
    ["Default"] = false,
    ["Callback"] = function(arg1_268, ...)
        _G.CustomBG = arg1_268;
        return; 
    end
});
vm256.AddToggle(vm256, "Blur", {
    ["Text"] = "Blur",
    ["Default"] = false,
    ["Callback"] = function(arg1_269, ...)
        v3 = game;
        i = v3.GetService(v3, "Lighting");
        i.FindFirstChild(i, "SOBBlur");
        if arg1_269 then
            if not X then
                X = Instance.new("BlurEffect");
                X.Name = "SOBBlur";
                X.Size = 10;
                J = game;
                X.Parent = J.GetService(J, "Lighting");
            end;
        else
            if v3 then
                v3.Destroy(v3);
            end;
            return;
        end; 
    end
});
vm256.AddInput(vm256, "ImageUrl", {
    ["Text"] = "Image Url",
    ["Default"] = "",
    ["Placeholder"] = "https://...",
    ["Callback"] = function(arg1_270, ...)
        _G.BGUrl = arg1_270;
        return; 
    end
});
s.SetLibrary(s, r34);
s.IgnoreThemeSettings(s);
s.SetIgnoreIndexes(s, {
    "MenuKeybind"
});
v6.SetFolder(v6, "a_sob_ultimate");
s.SetFolder(s, "a_sob_ultimate/Configs");
s.BuildConfigSection(s, l.UI);
v6.ApplyToTab(v6, l.UI);
vm243 = r25.PlayerAdded;
vm243.Connect(vm243, function(...)
    task.wait(1);
    pcall(function(...)
        v1 = r57();
        v3 = r35.TargetPlayer;
        v3.SetValues(v3, v1);
        v3 = r35.MultiWhitelist;
        if v3 then
            v3 = r35.MultiWhitelist;
            v3.SetValues(v3, v1);
        end;
        v3 = r35.SpecPlayer;
        if v3 then
            v3 = r35.SpecPlayer;
            v3.SetValues(v3, v1);
        end;
        return; 
    end);
    return; 
end);
vm243 = r25.PlayerRemoving;
vm243.Connect(vm243, function(...)
    task.wait(0.5);
    pcall(function(...)
        v1 = r57();
        v3 = r35.TargetPlayer;
        v3.SetValues(v3, v1);
        v3 = r35.MultiWhitelist;
        if v3 then
            v3 = r35.MultiWhitelist;
            v3.SetValues(v3, v1);
        end;
        v3 = r35.SpecPlayer;
        if v3 then
            v3 = r35.SpecPlayer;
            v3.SetValues(v3, v1);
        end;
        return; 
    end);
    return; 
end);
vm243 = r31.DescendantAdded;
vm243.Connect(vm243, function(arg1_271, ...)
    v1 = arg1_271;
    if r36.BoxESP and (r36.BoxESP.Value and v1.IsA(v1, "BasePart")) then
        X = Instance.new("BoxHandleAdornment");
        i = arg1_271;
        X.Adornee = i;
        X.AlwaysOnTop = true;
        X.ZIndex = 5;
        X.Color3 = Color3.new(1, 1, 1);
        X.Transparency = 0.5;
        X.Size = v1.Size;
        X.Parent = r27;
        r413[v1] = X;
    end;
    return; 
end);
vm243 = l.Visual;
vm192 = vm243.AddLeftGroupbox(vm243, "Silent Aim", "crosshair");
r625 = false;
r626 = 120;
r627 = 500;
r628 = "Head";
local function r631(...)
    if r629 then
        pcall(function(...)
            v3 = r629;
            v3.Remove(v3);
            return; 
        end);
    end;
    r629 = Drawing.new("Circle");
    r629.Thickness = 2;
    r629.NumSides = 64;
    r629.Radius = r626;
    r629.Filled = false;
    r629.Visible = false;
    r629.ZIndex = 999;
    r629.Transparency = 1;
    r629.Color = Color3.fromRGB(255, 255, 255);
    r629.Position = Vector2.new(r32.ViewportSize.X / 2, r32.ViewportSize.Y / 2);
    return; 
end;
local function r632(...)
    if not r625 then
        return nil;
    end;
    X = r626;
    v3 = r28;
    v3.GetMouseLocation(v3);
    v2 = r25;
    o = v2[3];
    e = v2[2];
    v2 = "ipairs";
    for o, v4 in ipairs(v2.GetPlayers(v2)) do
        n = o;
        if v4 == r26 then
            
        else
            if not v4.Character then
                
            end;
        end; 
    end;
    return nil; 
end;
vm192.AddToggle(vm192, "SilentAim", {
    ["Text"] = "Enable Silent Aim",
    ["Default"] = false,
    ["Callback"] = function(arg1_272, ...)
        v1 = arg1_272;
        r625 = v1;
        if v1 then
            r631();
            i = r30.RenderStepped;
            r630 = i.Connect(i, function(...)
                if not r625 then
                    return;
                end;
                if r629 and r629.Visible then
                    r629.Position = Vector2.new(r32.ViewportSize.X / 2, r32.ViewportSize.Y / 2);
                    r629.Radius = r626;
                end;
                r633 = r632();
                X = r633;
                if X then
                    X = r28;
                    i = X.IsMouseButtonPressed(X, Enum.UserInputType.MouseButton1);
                end;
                if X then
                    X = r26.Character;
                    if X then
                        X = r26.Character;
                        i = X.FindFirstChild(X, "HumanoidRootPart");
                    end;
                    r634 = X;
                    if r634 and (r634.Position - r633.Position).Magnitude <= 25 then
                        pcall(function(...)
                            v3 = r50;
                            v3.FireServer(v3, r633, r634.CFrame);
                            v3 = r51;
                            v3.FireServer(v3, r633, Vector3.zero, r633.Position, false);
                            return; 
                        end);
                    end;
                end;
                return; 
            end);
            r37("Silent Aim", "Enabled! FOV:" .. r626, 3);
        else
            if r630 then
                i = r630;
                i.Disconnect(i);
            end;
            if r629 then
                r629.Visible = false;
            end;
            r37("Silent Aim", "Disabled", 2);
            return;
        end; 
    end
});
vm192.AddSlider(vm192, "SilentAimFOV", {
    ["Text"] = "FOV Radius",
    ["Default"] = 120,
    ["Min"] = 10,
    ["Max"] = 500,
    ["Rounding"] = 1,
    ["Suffix"] = " px",
    ["Callback"] = function(arg1_273, ...)
        v1 = arg1_273;
        r626 = v1;
        if r629 then
            J = arg1_273;
            r629.Radius = J;
        end;
        return; 
    end
});
vm192.AddSlider(vm192, "SilentAimDist", {
    ["Text"] = "Max Distance",
    ["Default"] = 500,
    ["Min"] = 50,
    ["Max"] = 2000,
    ["Rounding"] = 10,
    ["Suffix"] = " studs",
    ["Callback"] = function(arg1_274, ...)
        r627 = arg1_274;
        return; 
    end
});
vm192.AddDropdown(vm192, "SilentAimPart", {
    ["Text"] = "Target Part",
    ["Values"] = {
        "Head",
        "HumanoidRootPart",
        "Torso",
        "UpperTorso"
    },
    ["Default"] = 1,
    ["Callback"] = function(arg1_275, ...)
        r628 = arg1_275;
        return; 
    end
});
vm192.AddToggle(vm192, "SilentAimShowFOV", {
    ["Text"] = "Show FOV Circle",
    ["Default"] = false,
    ["Callback"] = function(arg1_276, ...)
        v1 = arg1_276;
        if r629 then
            X = arg1_276;
            r629.Visible = X;
        else
            r631();
            X = arg1_276;
            r629.Visible = X;
        end;
        return; 
    end
});
vm254 = vm192.AddLabel(vm192, "FOV Color");
vm254.AddColorPicker(vm254, "SilentAimColor", {
    ["Default"] = Color3.fromRGB(255, 255, 255),
    ["Title"] = "FOV Color",
    ["Callback"] = function(arg1_277, ...)
        if r629 then
            X = arg1_277;
            r629.Color = X;
        end;
        return; 
    end
});
vm254 = r28.JumpRequest;
vm254.Connect(vm254, function(...)
    if r36.infJump and r36.infJump.Value then
        v1 = r26.Character;
        X = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
        if X then
            i = X.GetState(X) ~= Enum.HumanoidStateType.Dead;
        end;
        if X then
            X.ChangeState(X, Enum.HumanoidStateType.Jumping);
        end;
    end;
    return; 
end);
vm68.AddToggle(vm68, "infJump", {
    ["Text"] = "Infinite Jump",
    ["Default"] = false
});
vm68.AddSlider(vm68, "SCT1JPVal", {
    ["Text"] = "Jump Power [SDFv3]",
    ["Default"] = 100,
    ["Min"] = 16,
    ["Max"] = 500,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_278, ...)
        v1 = arg1_278;
        X = v1;
        _G.sctJPVal = X;
        if _G.sctIJ then
            X = r26.Character;
            J = X and X.FindFirstChildOfClass(X, "Humanoid");
            if J then
                if J.UseJumpPower then
                    (i and X.FindFirstChildOfClass(X, "Humanoid")).JumpPower = arg1_278;
                else
                    (i and X.FindFirstChildOfClass(X, "Humanoid")).JumpHeight = v1 * v1 / 392.4;
                end;
            end;
        end;
        return; 
    end
});
vm68.AddToggle(vm68, "InfJumpSDFv3", {
    ["Text"] = "Infinite Jump [SDFv3]",
    ["Default"] = false,
    ["Callback"] = function(arg1_279, ...)
        v1 = arg1_279;
        _G.sctIJ = v1;
        if not v1 then
            X = r26.Character;
            J = X and X.FindFirstChildOfClass(X, "Humanoid");
            if J then
                if J.UseJumpPower then
                    (i and X.FindFirstChildOfClass(X, "Humanoid")).JumpPower = 50;
                else
                    (i and X.FindFirstChildOfClass(X, "Humanoid")).JumpHeight = 7.2;
                end;
            end;
        end;
        return; 
    end
});
vm68.AddSlider(vm68, "SCT1WSVal", {
    ["Text"] = "Speed Multiplier [SDFv3]",
    ["Default"] = 5,
    ["Min"] = 1,
    ["Max"] = 50,
    ["Rounding"] = 1,
    ["Callback"] = function(arg1_280, ...)
        X = arg1_280;
        _G.sctWSVal = X;
        if _G.sctWS then
            X = r26.Character;
            J = X and X.FindFirstChildOfClass(X, "Humanoid");
            if J then
                J.WalkSpeed = 16 * arg1_280 / 5;
            end;
        end;
        return; 
    end
});
vm68.AddToggle(vm68, "WalkspeedSDFv3", {
    ["Text"] = "Walkspeed [SDFv3]",
    ["Default"] = false,
    ["Callback"] = function(arg1_281, ...)
        v1 = arg1_281;
        _G.sctWS = v1;
        if v1 then
            i = r26.Character;
        else
            X = r26.Character;
            if X then
                i = X.FindFirstChildOfClass(X, "Humanoid");
            end;
            v3 = _G;
            J = X;
            if J then
                J.WalkSpeed = 16;
            end;
            return;
        end; 
    end
});
vm68.AddToggle(vm68, "GodMode", {
    ["Text"] = "God Mode",
    ["Default"] = false,
    ["Callback"] = function(arg1_282, ...)
        if arg1_282 then
            X = r26.Character;
            if X then
                J = X.FindFirstChildOfClass(X, "Humanoid");
                if J then
                    J.MaxHealth = math.huge;
                    J.Health = math.huge;
                end;
            end;
        else
            X = r26.Character;
            if X then
                J = X.FindFirstChildOfClass(X, "Humanoid");
                if J then
                    J.MaxHealth = 100;
                    J.Health = 100;
                end;
            end;
            return;
        end; 
    end
});
vm68.AddToggle(vm68, "Invisibility", {
    ["Text"] = "Invisibility",
    ["Default"] = false,
    ["Callback"] = function(arg1_283, ...)
        v1 = arg1_283;
        v2 = ".U,)d?\xc1\x13\x83";
        e = r16;
        X = r26[r15[e(v2, 18464400089494)]];
        if X then
            v2 = 18464400089494;
            v3 = Q[e][v2];
            r635 = v3;
            v5 = not r635;
            t = v5;
            while v5 do
                if t then
                    table.remove(Q[r16], n);
                else
                    r636 = r635.HoldPart;
                    pcall(function(...)
                        v3 = r636.HoldItemRemoteFunction;
                        v3.InvokeServer(v3, r635, Q[v3]);
                        return; 
                    end);
                    task.wait();
                    pcall(function(...)
                        v3 = r636.DropItemRemoteFunction;
                        v3.InvokeServer(v3, r635, CFrame.new(Q[r15].Position + Vector3.new(0, -2000, 0)), Vector3.new(0, 0, 0));
                        return; 
                    end);
                end;
                repeat
                    a = 282 and 18464400089494 + 279 >= nil;
                until (nil or not 282 and 18464400089494 <= nil) and nil; 
            end;
            Y = r635.Parent;
            v3 = v3;
            t = not Y or not Y.FindFirstChild(Y, "HoldPart");
        end;
        return; 
    end
});
vm23.AddToggle(vm23, "ThirdPerson", {
    ["Text"] = "3rd Person",
    ["Default"] = false,
    ["Callback"] = function(arg1_284, ...)
        if arg1_284 then
            r26.CameraMode = Enum.CameraMode.Classic;
            r26.CameraMaxZoomDistance = 1000000000;
            r26.CameraMinZoomDistance = 0.5;
        else
            r26.CameraMode = Enum.CameraMode.LockFirstPerson;
            r26.CameraMaxZoomDistance = 0;
            r26.CameraMinZoomDistance = 0;
        end;
        return; 
    end
});
vm23.AddSlider(vm23, "CamZoom", {
    ["Text"] = "Max Zoom",
    ["Default"] = 128,
    ["Min"] = 1,
    ["Max"] = 50000,
    ["Rounding"] = 0,
    ["Callback"] = function(arg1_285, ...)
        r26.CameraMaxZoomDistance = arg1_285;
        return; 
    end
});
spawn(function(...)
    while task.wait(1) do
        e = r15;
        if r36.BoxESP and r36.BoxESP.Value then
            J = r25;
            X = J[3];
            v1 = J[2];
            J = "pairs";
            for X, o in pairs(J.GetPlayers(J)) do
                e = X;
                if o ~= r26 and o.Character then
                    v2 = o.Character;
                    if not v2.FindFirstChild(v2, "ESPBox") then
                        n = Instance.new("BillboardGui");
                        n.Name = "ESPBox";
                        n.AlwaysOnTop = true;
                        n.Size = UDim2.new(0, 100, 0, 50);
                        n.StudsOffset = Vector3.new(0, 3, 0);
                        v4 = o.Character;
                        n.Parent = v4;
                        v4 = Instance.new("Frame");
                        v4.Size = UDim2.new(1, 0, 1, 0);
                        v4.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
                        v4.BackgroundTransparency = 0.5;
                        v4.BorderSizePixel = 2;
                        v4.Parent = n;
                        K = Instance.new("TextLabel");
                        K.Size = UDim2.new(1, 0, 1, 0);
                        K.BackgroundTransparency = 1;
                        K.Text = o.Name;
                        K.TextColor3 = Color3.fromRGB(255, 255, 255);
                        K.TextScaled = true;
                        K.Parent = v4;
                    end;
                end; 
            end;
        else
            e = r25;
            o = {
                e.GetPlayers(e)
            };
            X = e[2];
            J = e[3];
            for J, o in pairs(T(o)) do
                e = J;
                n = o.Character;
                if n then
                    n = o.Character;
                    v2 = n.FindFirstChild(n, "ESPBox");
                end;
                if n then
                    v3 = o.Character.ESPBox;
                    v3.Destroy(v3);
                end; 
            end;
        end; 
    end;
    return; 
end);
vm254 = r26.CharacterAdded;
vm254.Connect(vm254, function(arg1_286, ...)
    v1 = arg1_286;
    if r308 then
        task.wait(0.5);
        v3 = v1.WaitForChild(v1, "Humanoid", 5);
        if v3 then
            v3 = v3.Died;
            v3.Connect(v3, function(...)
                v3 = r308;
                if v3 then
                    task.wait(1);
                    v3 = r26;
                    v3.LoadCharacter(v3);
                end;
                return; 
            end);
        end;
    end;
    return; 
end);
r26.CameraMode = Enum.CameraMode.Classic;
r26.CameraMinZoomDistance = 0.5;
r26.CameraMaxZoomDistance = 128;
vm254 = r30.Heartbeat;
vm254.Connect(vm254, function(...)
    v1 = r26.Character;
    if not v1 then
        return;
    end;
    X = v1.FindFirstChildOfClass(v1, "Humanoid");
    if not X then
        return;
    end;
    if _G.ClassicSP then
        X.WalkSpeed = 100;
    else
        v3 = _G.sctWS;
        if v3 then
            v3 = "WalkSpeed";
            v2 = "WalkSpeed";
            v1.FindFirstChildOfClass(v1, "Humanoid")[v3] = 16 * (_G.sctWSVal or 5) / 5;
        else
            if _G.WSE then
                e = v3;
                v1.FindFirstChildOfClass(v1, "Humanoid").WalkSpeed = _G.WSVal or 50;
            else
                J = v3;
                v3 = J;
                if _G.WSVal and _G.WSVal ~= 16 then
                    v1.FindFirstChildOfClass(v1, "Humanoid").WalkSpeed = _G.WSVal;
                else
                    v1.FindFirstChildOfClass(v1, "Humanoid").WalkSpeed = 16;
                end;
                v3 = v3;
                if r36.GodMode and r36.GodMode.Value then
                    if X.Health < X.MaxHealth then
                        X.Health = X.MaxHealth;
                    end;
                end;
                return;
            end;
        end;
    end; 
end);
vm254 = r31.ChildAdded;
vm254.Connect(vm254, function(arg1_287, ...)
    v1 = arg1_287;
    n = r16("e\x8e\xb6[\xc8\xc2\xba\x94\x02NI\x9a\xbb", 22375923443891);
    if v1.Name == r15[n] or v1.Name == "BlackHoleDetected" then
        v3 = task.wait;
        v3(.05);
        v3 = v3;
        v3 = J;
        if not (v1.IsA(v1, "BasePart") and v1.Position or v1.IsA(v1, "Model") and (v1.PrimaryPart and v1.PrimaryPart.Position)) then
            return;
        end;
        e = 1000000000;
        n = r25;
        v2 = n[3];
        n = n[1];
        for v2, K in n, ipairs(n.GetPlayers(n)) do
            v4 = v2;
            if K ~= r26 and K.Character then
                v3 = K.Character;
                w = v3.FindFirstChild(v3, "HumanoidRootPart");
                if w then
                    a = (w.Position - (v1.IsA(v1, o) and v1.Position or v1.IsA(v1, "Model") and (v1.PrimaryPart and v1.PrimaryPart.Position))).Magnitude < 1000000000;
                end;
                if w then
                    J = K;
                    e = (w.Position - (v1.IsA(v1, o) and v1.Position or v1.IsA(v1, "Model") and (v1.PrimaryPart and v1.PrimaryPart.Position))).Magnitude;
                end;
            end; 
        end;
        if nil then
            r37("Kick Detected", nil.DisplayName .. " used kick!", 6);
        end;
    end;
    return; 
end);
vm254 = r25.PlayerAdded;
vm254.Connect(vm254, function(arg1_288, ...)
    r637 = arg1_288;
    pcall(function(...)
        v3 = r637;
        if v3.IsFriendsWith(v3, Q[Z[1]].UserId) then
            Q[Z[4]]("Friend Joined", r637.Name .. " joined!", 5);
        end;
        return; 
    end);
    return; 
end);
vm254 = r30.Heartbeat;
vm254.Connect(vm254, function(...)
    if r36.AntiVoid and r36.AntiVoid.Value then
        v1 = r26.Character;
        if v1 then
            v3 = r26[X[e]];
            i = v1.PrimaryPart and v1.PrimaryPart.Position.Y < -50;
        end;
        if v1 then
            v1.SetPrimaryPartCFrame(v1, CFrame.new(v1.PrimaryPart.Position + Vector3.new(0, 100, 0)));
            v1.PrimaryPart.AssemblyLinearVelocity = Vector3.zero;
        end;
    end;
    return; 
end);
vm254 = r30.Heartbeat;
vm254.Connect(vm254, function(...)
    if r36.LoopTp and r36.LoopTp.Value then
        v1 = r26.Character;
        X = v1 and v1.FindFirstChild(v1, "HumanoidRootPart");
        if X then
            X.CFrame = CFrame.new(math.random(-500, 500), math.random(30, 480), math.random(-500, 500));
        end;
    end;
    return; 
end);
vm254 = r30.Heartbeat;
vm254.Connect(vm254, function(...)
    if r36.AutoSitBlobman and r36.AutoSitBlobman.Value then
        v1 = r26.Character;
        i = v1;
        v1 = i and v1.FindFirstChildOfClass(v1, "Humanoid");
        if v1 then
            i = not v1.SeatPart;
        end;
        if v1 then
            task.spawn(r60);
        end;
    end;
    return; 
end);
vm254 = l.Code;
vm258 = vm254.AddLeftGroupbox(vm254, "Code Executor", "code");
vm254 = l.Code;
r638 = vm254.AddRightGroupbox(vm254, "Active Functions", "activity");
r639 = "";
r640 = {};
vm258.AddLabel(vm258, "Enter Code:");
vm258.AddInput(vm258, "CodeInput", {
    ["Text"] = "Code",
    ["Default"] = "",
    ["Placeholder"] = "Enter code (e.g. 9800)",
    ["Callback"] = function(arg1_289, ...)
        r639 = arg1_289;
        return; 
    end
});
vm258.AddButton(vm258, {
    ["Text"] = "Execute",
    ["Func"] = function(...)
        e = r16("", 10538153399083);
        if r639 == r15[e] then
            r37("Code", "Enter code first!", 3);
            return;
        end;
        J = r36;
        X = e[3];
        v1 = e[2];
        for X, o in pairs(i) do
            e = X;
            if o.Value then
                o.SetValue(o, false);
            end; 
        end;
        r37("Code", "All functions disabled...", 2);
        task.wait(0.5);
        e = {
            pcall(function(...)
                v3 = game;
                return v3.HttpGet(v3, "https://raw.githubusercontent.com/sladkoeshkaogg-svg/CodeExecutor/main/codes.txt"); 
            end)
        };
        X = e[2];
        if not pcall(function(...)
            v3 = game;
            return v3.HttpGet(v3, "https://raw.githubusercontent.com/sladkoeshkaogg-svg/CodeExecutor/main/codes.txt"); 
        end) then
            r37("Code", "\xe2\x9d\x8c Failed to connect to server!", 5);
            return;
        end;
        J = false;
        n = {
            X.gmatch(X, "[^\r\n]+")
        };
        o = X.gmatch(X, "[^\r\n]+")(n[2], n[3]);
        while o do
            n = o;
            F = 2162713609199;
            a = {
                n.match(n, r15[r16("\xad\xb3e\x05\x07*.-]\x9b`\xd8", F)])
            };
            r641 = a[2];
            if n.match(n, r15[r16("\xad\xb3e\x05\x07*.-]\x9b`\xd8", F)]) == r639 then
                J = true;
                r37("Code", "\xe2\x9c\x85 Code verified! Loading...", 3);
                task.wait(0.5);
                F = {
                    pcall(function(...)
                        v3 = game;
                        return v3.HttpGet(v3, r641); 
                    end)
                };
                r642 = F[2];
                if pcall(function(...)
                    v3 = game;
                    return v3.HttpGet(v3, r641); 
                end) then
                    pcall(function(...)
                        loadstring(r642)();
                        table.insert(r640, {
                            ["code"] = r639,
                            ["name"] = "Script_" .. r639
                        });
                        r37("Code", "\xf0\x9f\x9a\x80 Script " .. r639 .. " loaded!", 5);
                        v3 = r638;
                        v3.AddLabel(v3, "\xe2\x9c\x85 " .. r639 .. " - Active");
                        return; 
                    end);
                else
                    r37("Code", "\xe2\x9d\x8c Failed to load script!", 5);
                end;
                if not J then
                    r37("Code", "\xe2\x9d\x8c Invalid code!", 3);
                    break;
                end;
                return;
            else
                
            end; 
        end; 
    end
});
vm258.AddButton(vm258, {
    ["Text"] = "Delete All Functions",
    ["Func"] = function(...)
        J = r36;
        v1 = 641[2];
        X = 641[3];
        for X, o in pairs(i) do
            if o.Value then
                o.SetValue(o, false);
            end; 
        end;
        r640 = {};
        task.wait(.3);
        r37("Code", "\xf0\x9f\x97\x91\xef\xb8\x8f All functions deleted!", 3);
        return; 
    end
});
vm258.AddLabel(vm258, "\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90");
vm258.AddLabel(vm258, "Instructions:");
vm258.AddLabel(vm258, "Insert the code");
vm258.AddLabel(vm258, "you want to use,");
vm258.AddLabel(vm258, "for example 9800,");
vm258.AddLabel(vm258, "and click Execute");
vm258.AddLabel(vm258, "\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90");
vm258.AddLabel(vm258, "\xd0\x98\xd0\xbd\xd1\x81\xd1\x82\xd1\x80\xd1\x83\xd0\xba\xd1\x86\xd0\xb8\xd1\x8f");
vm258.AddLabel(vm258, "\xd0\x92\xd0\xb2\xd0\xb5\xd0\xb4\xd0\xb8\xd1\x82\xd0\xb5 \xd0\xba\xd0\xbe\xd0\xb4,");
vm258.AddLabel(vm258, "\xd0\xba\xd0\xbe\xd1\x82\xd0\xbe\xd1\x80\xd1\x8b\xd0\xb9 \xd1\x85\xd0\xbe\xd1\x82\xd0\xb8\xd1\x82\xd0\xb5 \xd0\xb8\xd1\x81\xd0\xbf\xd0\xbe\xd0\xbb\xd1\x8c\xd0\xb7\xd0\xbe\xd0\xb2\xd0\xb0\xd1\x82\xd1\x8c,");
vm258.AddLabel(vm258, "\xd0\xbd\xd0\xb0\xd0\xbf\xd1\x80\xd0\xb8\xd0\xbc\xd0\xb5\xd1\x80 9800,");
vm258.AddLabel(vm258, "\xd0\xb8 \xd0\xbd\xd0\xb0\xd0\xb6\xd0\xbc\xd0\xb8\xd1\x82\xd0\xb5 Execute");
vm258.AddLabel(vm258, "\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90");
vm152 = r638;
vm152.AddLabel(vm152, "Wexord hub 2022(New \xd0\x9d\xd0\x90\xd0\xa5\xd0\xa3\xd0\x99) - 0690");
vm152 = r638;
vm152.AddLabel(vm152, "\xd0\x9e\xd0\xa1\xd0\xa2\xd0\x9e\xd0\xa0\xd0\x9e\xd0\x96\xd0\x9d\xd0\x9e \xd0\x9d\xd0\x90\xd0\xa5\xd0\xa3\xd0\x99 \xd0\x97\xd0\x90\xd0\x9f\xd0\xa3\xd0\xa1\xd0\x9a\xd0\x90\xd0\x95\xd0\xa2\xd0\xa1\xd0\xaf \xd0\xa1 \xd0\x9b\xd0\x90\xd0\x93\xd0\x9e\xd0\x9c");
vm152 = r638;
vm152.AddLabel(vm152, "Ametist premium(PC) - 0878");
vm152 = r638;
vm152.AddLabel(vm152, "Bloody V2 Premium(No Key) - 123112");
vm152 = r638;
vm152.AddLabel(vm152, "Alon Hub(No Key) - 213213");
vm152 = r638;
vm152.AddLabel(vm152, "VHSVF Script(No key) - 6121");
vm152 = r638;
vm152.AddLabel(vm152, "Worst Script(No Key) - 1145");
vm152 = r638;
vm152.AddLabel(vm152, "Polaris Hub(No Key) - 0392");
vm152 = r638;
vm152.AddLabel(vm152, "BlizT Hub(No Key) - 4824");
vm152 = r638;
vm152.AddLabel(vm152, "Ragalic(No Key) - 0934");
vm152 = r638;
vm152.AddLabel(vm152, "Bloody V2 - 9800");
vm152 = r638;
vm152.AddLabel(vm152, "Yuki Hub - 0923");
vm152 = r638;
vm152.AddLabel(vm152, "Posral - 1234");
vm152 = r638;
vm152.AddLabel(vm152, "Rezonans - 54637");
vm152 = r638;
vm152.AddLabel(vm152, "Mercuriy - 92847");
vm152 = r638;
vm152.AddLabel(vm152, "Ftap Hub - 2113");
vm152 = r638;
vm152.AddLabel(vm152, "FANATIC - 2345");
vm152 = r638;
vm152.AddLabel(vm152, "BlizT Hub - 6767");
vm152 = r638;
vm152.AddLabel(vm152, "Tokra (error) - 1731");
vm152 = r638;
vm152.AddLabel(vm152, "Genius - 12932 ");
vm152 = r638;
vm152.AddLabel(vm152, "Galaxy Script(UPD) - 4444");
vm152 = l.VUHUT;
vm222 = vm152.AddLeftGroupbox(vm152, "Discord Community", "chat");
vm222.AddButton(vm222, {
    ["Text"] = "Copy Discord Link",
    ["Func"] = function(...)
        setclipboard("https://discord.gg/ysZByhDT");
        r37("Discord", "Link copied!", 3);
        return; 
    end
});
vm222.AddLabel(vm222, "Discord: discord.gg/ysZByhDT");
vm222.AddLabel(vm222, "Join for updates & support!");
vm222.AddLabel(vm222, "Thanks For Join!!!");
vm222.AddLabel(vm222, "");
vm222.AddLabel(vm222, "Contact Developer:");
vm222.AddLabel(vm222, "TG: @HunterH2");
vm222.AddLabel(vm222, "Roblox: magfun_legend");
vm152 = l.VUHUT;
vm241 = vm152.AddRightGroupbox(vm152, "VUHUT Scripts", "file-code");
vm241.AddButton(vm241, {
    ["Text"] = "Copy Telegram Link",
    ["Func"] = function(...)
        setclipboard("https://t.me/VUHUTScript");
        r37("Telegram", "Link copied!", 3);
        return; 
    end
});
vm241.AddLabel(vm241, "Telegram: t.me/VUHUTScript");
vm241.AddLabel(vm241, "Join for updates & support!");
vm241.AddLabel(vm241, "Thanks For Join!!!");
vm241.AddLabel(vm241, "");
vm241.AddButton(vm241, {
    ["Text"] = "Official Site (ALPHA)",
    ["Func"] = function(...)
        setclipboard("https://github.com/sladkoeshkaogg-svg/Nexus");
        r37("GitHub", "Link copied!", 3);
        return; 
    end
});
vm241.AddLabel(vm241, "GitHub: github.com/sladkoeshkaogg-svg/Nexus");
vm241.AddLabel(vm241, "");
vm241.AddLabel(vm241, "Contact Developer:");
vm241.AddLabel(vm241, "TG: @HunterH2");
vm241.AddLabel(vm241, "Roblox: magfun_legend");
task.spawn(function(...)
    task.wait(1);
    local function v1(...)
        n = r16;
        v4 = n("\x98\x87\x93", 20433633453355);
        J = r34[r15[v4]];
        X = J[3];
        J = J[1];
        for X, o in J, pairs(J.GetDescendants(J)) do
            e = X;
            r643 = o;
            n = Q[v3];
            v4 = n.IsA(n, "TextLabel");
            v2 = n.IsA(n, "Frame");
            if v4 then
                K = Q[v3].Text;
                if K then
                    K = Q[v3].Text;
                    n = K.find(K, "Hell Kick");
                end;
                v3 = 652;
                v2 = K;
            end;
            if v2 then
                Q[v3].TextColor3 = Color3.fromRGB(255, 50, 50);
                n = Q[v3];
                v2 = n.FindFirstChildOfClass(n, "UIStroke") or Instance.new("UIStroke");
                v2.Color = Color3.fromRGB(255, 0, 0);
                v2.Thickness = 1.5;
                v2.Transparency = .3;
                v2.Parent = Q[v3];
                task.spawn(function(...)
                    while Q[v3].Parent do
                        v3 = TS;
                        i = v3.Create(v3, Q[v3], TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            ["TextColor3"] = Color3.fromRGB(255, 100, 100)
                        });
                        i.Play(i);
                        task.wait(1);
                        v3 = TS;
                        i = v3.Create(v3, Q[v3], TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            ["TextColor3"] = Color3.fromRGB(255, 50, 50)
                        });
                        i.Play(i);
                        task.wait(1); 
                    end;
                    return; 
                end);
            end;
            n = Q[v3];
            v4 = n.IsA(n, "Frame");
            if v4 then
                v2 = Q[v3].Parent and Q[v3].Parent.Name == "HellKick";
                v3 = 652;
            end;
            if v4 then
                n = Q[v3];
                r644 = n.FindFirstChildOfClass(n, "UIStroke") or Instance.new("UIStroke");
                r644.Color = Color3.fromRGB(255, 0, 0);
                r644.Thickness = 2;
                r644.Parent = Q[v3];
                w = Q[v3];
                a = {
                    w.GetChildren(w)
                };
                v4 = w[2];
                K = w[3];
                for K, a in pairs(T(a)) do
                    w = K;
                    if a.IsA(a, "ImageLabel") or a.IsA(a, "TextLabel") then
                        if a.IsA(a, "ImageLabel") then
                            a.ImageColor3 = Color3.fromRGB(255, 0, 0);
                        else
                            a.TextColor3 = Color3.fromRGB(255, 0, 0);
                        end;
                    end; 
                end;
                task.spawn(function(...)
                    while Q[v3].Parent do
                        v3 = TS;
                        i = v3.Create(v3, r644, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            ["Transparency"] = 0
                        });
                        i.Play(i);
                        task.wait(1.5);
                        v3 = TS;
                        i = v3.Create(v3, r644, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            ["Transparency"] = 0.5
                        });
                        i.Play(i);
                        task.wait(1.5); 
                    end;
                    return; 
                end);
            end; 
        end;
        return; 
    end;
    v1();
    task.wait(2);
    v1();
    return; 
end);
vm152 = l.Developers;
vm235 = vm152.AddLeftGroupbox(vm152, "Information", "user");
vm235.AddLabel(vm235, "magfun_legend - Developer", "Sword");
vm235.AddLabel(vm235, "tudufhhvgu3 - Skidder");
vm235.AddLabel(vm235, "ia_sigma61 - Friend & Owner of");
vm235.AddLabel(vm235, "another Script *Doro hub*");
vm235.AddLabel(vm235, "dvinechja - Friend & Says what to add");
vm235.AddLabel(vm235, "Hasup_233 - Tester & Friend");
vm235.AddLabel(vm235, "amdprocessor_death - Says what to add");
vm235.AddLabel(vm235, "Vanessa735285 - Friend & Tester");
vm235.AddLabel(vm235, "What are you even doing here? ;3");
vm235.AddLabel(vm235, "\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81\xe2\x94\x81");
r37("a:sob ULTIMATE", "v3.0 loaded! All functions active!", 5);
print("\xe2\x95\x94\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x97");
print("\xe2\x95\x91  a:sob ULTIMATE v3.0      \xe2\x95\x91");
print("\xe2\x95\x91  All systems loaded!      \xe2\x95\x91");
print("\xe2\x95\x91  Kick V1/V2/V3/V4 ready!  \xe2\x95\x91");
print("\xe2\x95\x91  Silent Aim ready!        \xe2\x95\x91");
print("\xe2\x95\x91  Mega Anti ready!         \xe2\x95\x91");
print("\xe2\x95\x9a\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x90\xe2\x95\x9d");
task.spawn(function(...)
    task.wait(2);
    local function v1(...)
        n = r16;
        v4 = n("+\x89\xed", 19489598464883);
        J = r34[r15[v4]];
        v1 = J[2];
        X = J[3];
        J = "pairs";
        for X, o in pairs(J.GetDescendants(J)) do
            e = X;
            r645 = o;
            n = Q[v3];
            K = "TextLabel";
            v4 = n.IsA(n, K);
            v2 = n.IsA(n, "Frame");
            if v4 then
                K = Q[v3].Text;
                v2 = K and K.find(K, "Kick exe");
                v3 = 190;
            end;
            if v2 then
                Q[v3].TextColor3 = Color3.fromRGB(255, 0, 0);
                n = Q[v3];
                v2 = n.FindFirstChildOfClass(n, "UIStroke") or Instance.new("UIStroke");
                v2.Color = Color3.fromRGB(255, 0, 0);
                v2.Thickness = 2;
                v2.Transparency = .2;
                v2.Parent = Q[v3];
                task.spawn(function(...)
                    while Q[v3].Parent do
                        v3 = TS;
                        i = v3.Create(v3, Q[v3], TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            ["TextColor3"] = Color3.fromRGB(255, 100, 100)
                        });
                        i.Play(i);
                        task.wait(1);
                        v3 = TS;
                        i = v3.Create(v3, Q[v3], TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            ["TextColor3"] = Color3.fromRGB(255, 0, 0)
                        });
                        i.Play(i);
                        task.wait(1); 
                    end;
                    return; 
                end);
            end;
            n = Q[v3];
            v4 = n.IsA(n, "Frame");
            if v4 then
                v2 = Q[v3].Parent and Q[v3].Parent.Name == "KickExe";
                v3 = 190;
            end;
            if v4 then
                n = Q[v3];
                w = r15;
                v2 = n.FindFirstChildOfClass(n, "UIStroke") and w[2];
                r646 = Instance.new("UIStroke");
                r646.Color = Color3.fromRGB(255, 0, 0);
                r646.Thickness = 2;
                r646.Parent = Q[v3];
                w = Q[v3];
                a = {
                    w.GetChildren(w)
                };
                K = w[3];
                for K, a in w[1], pairs(T(a)) do
                    w = K;
                    if a.IsA(a, "ImageLabel") then
                        a.ImageColor3 = Color3.fromRGB(255, 0, 0);
                    else
                        if a.IsA(a, "TextLabel") then
                            a.TextColor3 = Color3.fromRGB(255, 0, 0);
                        end;
                    end; 
                end;
                task.spawn(function(...)
                    while Q[v3].Parent do
                        v3 = TS;
                        i = v3.Create(v3, r646, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            ["Transparency"] = 0
                        });
                        i.Play(i);
                        task.wait(1.5);
                        v3 = TS;
                        i = v3.Create(v3, r646, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            ["Transparency"] = 0.5
                        });
                        i.Play(i);
                        task.wait(1.5); 
                    end;
                    return; 
                end);
            end; 
        end;
        return; 
    end;
    v1();
    task.wait(2);
    v1();
    return; 
end);
return;