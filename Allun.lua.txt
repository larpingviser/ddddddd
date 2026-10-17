local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/"
local DEFAULT_PALETTE = "Slate"
local DEFAULT_RADIUS = 14

local AllunFunctions = {}

do
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local localPlayer = Players.LocalPlayer
    local playerCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local toysFolder = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
    local DestroyToy = ReplicatedStorage:WaitForChild("MenuToys"):WaitForChild("DestroyToy")
    local SetNetworkOwner = ReplicatedStorage:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")

    local anchoredParts = {}
    local anchoredConnections = {}
    local playerList = {}

    local function isDescendantOf(target, other)
        local currentParent = target and target.Parent
        while currentParent do
            if currentParent == other then
                return true
            end
            currentParent = currentParent.Parent
        end
        return false
    end

    local function DestroyT(toy)
        local targetToy = toy or (toysFolder and toysFolder:FindFirstChildWhichIsA("Model"))
        if targetToy then
            DestroyToy:FireServer(targetToy)
        end
    end

    local function getDescendantParts(descendantName)
        local parts = {}
        local map = workspace:FindFirstChild("Map")
        if not map then
            return parts
        end

        for _, descendant in ipairs(map:GetDescendants()) do
            if descendant:IsA("Part") and descendant.Name == descendantName then
                table.insert(parts, descendant)
            end
        end
        return parts
    end

    local function updatePlayerList()
        table.clear(playerList)
        for _, player in ipairs(Players:GetPlayers()) do
            table.insert(playerList, player.Name)
        end
    end

    local function onPlayerAdded(player)
        table.insert(playerList, player.Name)
    end

    local function onPlayerRemoving(player)
        for index, name in ipairs(playerList) do
            if name == player.Name then
                table.remove(playerList, index)
                break
            end
        end
    end

    local function getNearestPlayer()
        local nearestPlayer
        local nearestDistance = math.huge

        if not playerCharacter or not playerCharacter:FindFirstChild("HumanoidRootPart") then
            return nil
        end

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (playerCharacter.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance < nearestDistance then
                    nearestDistance = distance
                    nearestPlayer = player
                end
            end
        end

        return nearestPlayer
    end

    local function cleanupConnections(connectionTable)
        for _, connection in ipairs(connectionTable) do
            connection:Disconnect()
        end
        table.clear(connectionTable)
    end

    local function getVersion()
        local url = "https://raw.githubusercontent.com/Undebolted/FTAP/main/VERSION.json"
        local success, response = pcall(function()
            return game:HttpGet(url)
        end)

        if success then
            local data = HttpService:JSONDecode(response)
            return data.version
        end

        warn("Failed to get version: " .. tostring(response))
        return "Unknown"
    end

    local function spawnItem(itemName, position, orientation)
        task.spawn(function()
            local cframe = CFrame.new(position)
            ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(
                itemName,
                cframe,
                orientation or Vector3.new(0, 90, 0)
            )
        end)
    end

    local function spawnItemCf(itemName, cframe)
        task.spawn(function()
            ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(
                itemName,
                cframe,
                Vector3.new(0, 0, 0)
            )
        end)
    end

    local function createHighlight(parent)
        local highlight = Instance.new("Highlight")
        highlight.DepthMode = Enum.HighlightDepthMode.Occluded
        highlight.FillTransparency = 1
        highlight.Name = "Highlight"
        highlight.OutlineColor = Color3.new(0, 0, 1)
        highlight.OutlineTransparency = 0.5
        highlight.Parent = parent
        return highlight
    end

    local function createBodyMovers(part, position, rotation)
        local bodyPosition = Instance.new("BodyPosition")
        local bodyGyro = Instance.new("BodyGyro")

        bodyPosition.P = 15000
        bodyPosition.D = 200
        bodyPosition.MaxForce = Vector3.new(5000000, 5000000, 5000000)
        bodyPosition.Position = position
        bodyPosition.Parent = part

        bodyGyro.P = 15000
        bodyGyro.D = 200
        bodyGyro.MaxTorque = Vector3.new(5000000, 5000000, 5000000)
        bodyGyro.CFrame = rotation
        bodyGyro.Parent = part
    end

    local function cleanupAnchoredParts()
        for _, part in ipairs(anchoredParts) do
            if part then
                if part:FindFirstChild("BodyPosition") then
                    part.BodyPosition:Destroy()
                end
                if part:FindFirstChild("BodyGyro") then
                    part.BodyGyro:Destroy()
                end
                local highlight = part:FindFirstChild("Highlight") or (part.Parent and part.Parent:FindFirstChild("Highlight"))
                if highlight then
                    highlight:Destroy()
                end
            end
        end

        cleanupConnections(anchoredConnections)
        table.clear(anchoredParts)
    end

    AllunFunctions.state = {
        anchoredParts = anchoredParts,
        anchoredConnections = anchoredConnections,
        playerList = playerList,
        toysFolder = toysFolder,
        localPlayer = localPlayer,
        SetNetworkOwner = SetNetworkOwner,
    }

    AllunFunctions.isDescendantOf = isDescendantOf
    AllunFunctions.DestroyT = DestroyT
    AllunFunctions.getDescendantParts = getDescendantParts
    AllunFunctions.updatePlayerList = updatePlayerList
    AllunFunctions.onPlayerAdded = onPlayerAdded
    AllunFunctions.onPlayerRemoving = onPlayerRemoving
    AllunFunctions.getNearestPlayer = getNearestPlayer
    AllunFunctions.cleanupConnections = cleanupConnections
    AllunFunctions.getVersion = getVersion
    AllunFunctions.spawnItem = spawnItem
    AllunFunctions.spawnItemCf = spawnItemCf
    AllunFunctions.createHighlight = createHighlight
    AllunFunctions.createBodyMovers = createBodyMovers
    AllunFunctions.cleanupAnchoredParts = cleanupAnchoredParts
end

getgenv().AllunFunctions = AllunFunctions

do
    local HttpService = game:GetService("HttpService")
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Debris = game:GetService("Debris")

    local GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents")
    local MenuToys = ReplicatedStorage:WaitForChild("MenuToys")
    local CharacterEvents = ReplicatedStorage:WaitForChild("CharacterEvents")
    local SetNetworkOwner = GrabEvents:WaitForChild("SetNetworkOwner")
    local Struggle = CharacterEvents:WaitForChild("Struggle")
    local CreateLine = GrabEvents:WaitForChild("CreateGrabLine")
    local DestroyLine = GrabEvents:WaitForChild("DestroyGrabLine")
    local DestroyToy = MenuToys:WaitForChild("DestroyToy")

    local localPlayer = Players.LocalPlayer
    local playerCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local toysFolder = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

    local OrionLib = nil
    local U = nil

    local state = {
        AutoRecoverDroppedPartsCoroutine = nil,
        connectionBombReload = nil,
        reloadBombCoroutine = nil,
        antiExplosionConnection = nil,
        poisonAuraCoroutine = nil,
        deathAuraCoroutine = nil,
        poisonCoroutines = {},
        strengthConnection = nil,
        coroutineRunning = false,
        autoStruggleCoroutine = nil,
        autoDefendCoroutine = nil,
        auraCoroutine = nil,
        gravityCoroutine = nil,
        kickCoroutine = nil,
        kickGrabCoroutine = nil,
        hellSendGrabCoroutine = nil,
        anchoredParts = {},
        anchoredConnections = {},
        compiledGroups = {},
        compileConnections = {},
        compileCoroutine = nil,
        fireAllCoroutine = nil,
        connections = {},
        renderSteppedConnections = {},
        ragdollAllCoroutine = nil,
        crouchJumpCoroutine = nil,
        crouchSpeedCoroutine = nil,
        anchorGrabCoroutine = nil,
        poisonGrabCoroutine = nil,
        ufoGrabCoroutine = nil,
        burnPart = nil,
        fireGrabCoroutine = nil,
        noclipGrabCoroutine = nil,
        furtherReachEnabled = false,
        furtherReachRespawnConnection = nil,
        antiKickCoroutine = nil,
        kickGrabConnections = {},
        blobmanCoroutine = nil,
        lighBitSpeedCoroutine = nil,
        lightbitpos = {},
        lightbitparts = {},
        lightbitcon = nil,
        lightbitcon2 = nil,
        lightorbitcon = nil,
        bodyPositions = {},
        alignOrientations = {},
        playerList = {},
        selection = nil,
        blobman = nil,
        platforms = {},
        ownedToys = {},
        bombList = {},
        decoyOffset = 15,
        stopDistance = 5,
        circleRadius = 10,
        circleSpeed = 2,
        auraToggle = 1,
        crouchWalkSpeed = 50,
        crouchJumpPower = 50,
        kickMode = 1,
        auraRadius = 20,
        lightbit = 0.3125,
        lightbitoffset = 1,
        lightbitradius = 20,
        usingradius = 20,
        followMode = true,
        blobalter = 1,
        toysFolder = toysFolder,
        localPlayer = localPlayer,
        playerCharacter = playerCharacter,
        SetNetworkOwner = SetNetworkOwner,
        Struggle = Struggle,
        CreateLine = CreateLine,
        DestroyLine = DestroyLine,
        DestroyToy = DestroyToy,
        OrionLib = OrionLib,
        Utilities = U,
    }

    _G.ToyToLoad = _G.ToyToLoad or "BombMissile"
    _G.MaxMissiles = _G.MaxMissiles or 9
    _G.BlobmanDelay = _G.BlobmanDelay or 0.005

    state.usingradius = state.lightbitradius

    localPlayer.CharacterAdded:Connect(function(character)
        playerCharacter = character
        state.playerCharacter = character
    end)

    local function getDescendantParts(descendantName)
        local parts = {}
        local map = workspace:FindFirstChild("Map")
        if not map then
            return parts
        end
        for _, descendant in ipairs(map:GetDescendants()) do
            if descendant:IsA("Part") and descendant.Name == descendantName then
                table.insert(parts, descendant)
            end
        end
        return parts
    end

    state.poisonHurtParts = getDescendantParts("PoisonHurtPart")
    state.paintPlayerParts = getDescendantParts("PaintPlayerPart")

    task.spawn(function()
        local playerGui = localPlayer:FindFirstChild("PlayerGui") or localPlayer:WaitForChild("PlayerGui", 10)
        local menuGui = playerGui and playerGui:FindFirstChild("MenuGui")
        local menu = menuGui and menuGui:FindFirstChild("Menu")
        local tabContents = menu and menu:FindFirstChild("TabContents")
        local toysTab = tabContents and tabContents:FindFirstChild("Toys")
        local toysContents = toysTab and toysTab:FindFirstChild("Contents")

        if not toysContents then
            return
        end

        for _, child in ipairs(toysContents:GetChildren()) do
            if child.Name ~= "UIGridLayout" then
                state.ownedToys[child.Name] = true
            end
        end
    end)

    AllunFunctions.state = state
    AllunFunctions.refs = {
        HttpService = HttpService,
        RunService = RunService,
        Players = Players,
        UserInputService = UserInputService,
        ReplicatedStorage = ReplicatedStorage,
        Debris = Debris,
    }
end

do
    local state = AllunFunctions.state
    local refs = AllunFunctions.refs
    local Players = refs.Players
    local RunService = refs.RunService
    local UserInputService = refs.UserInputService
    local ReplicatedStorage = refs.ReplicatedStorage
    local Debris = refs.Debris

    function AllunFunctions.isDescendantOf(target, other)
        local currentParent = target and target.Parent
        while currentParent do
            if currentParent == other then
                return true
            end
            currentParent = currentParent.Parent
        end
        return false
    end

    function AllunFunctions.DestroyT(toy)
        local targetToy = toy or (state.toysFolder and state.toysFolder:FindFirstChildWhichIsA("Model"))
        if targetToy then
            state.DestroyToy:FireServer(targetToy)
        end
    end

    function AllunFunctions.updatePlayerList()
        table.clear(state.playerList)
        for _, player in ipairs(Players:GetPlayers()) do
            table.insert(state.playerList, player.Name)
        end
    end

    function AllunFunctions.onPlayerAdded(player)
        table.insert(state.playerList, player.Name)
    end

    function AllunFunctions.onPlayerRemoving(player)
        for i, name in ipairs(state.playerList) do
            if name == player.Name then
                table.remove(state.playerList, i)
                break
            end
        end
    end

    Players.PlayerAdded:Connect(AllunFunctions.onPlayerAdded)
    Players.PlayerRemoving:Connect(AllunFunctions.onPlayerRemoving)
    AllunFunctions.updatePlayerList()

    function AllunFunctions.getNearestPlayer()
        local nearestPlayer
        local nearestDistance = math.huge
        local character = state.playerCharacter

        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return nil
        end

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= state.localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance < nearestDistance then
                    nearestDistance = distance
                    nearestPlayer = player
                end
            end
        end

        return nearestPlayer
    end

    function AllunFunctions.cleanupConnections(connectionTable)
        for _, connection in ipairs(connectionTable) do
            connection:Disconnect()
        end
        table.clear(connectionTable)
    end

    function AllunFunctions.getVersion()
        local url = "https://raw.githubusercontent.com/Undebolted/FTAP/main/VERSION.json"
        local success, response = pcall(function()
            return game:HttpGet(url)
        end)

        if success then
            local data = refs.HttpService:JSONDecode(response)
            return data.version
        end

        warn("Failed to get version: " .. tostring(response))
        return "Unknown"
    end

    function AllunFunctions.spawnItem(itemName, position, orientation)
        task.spawn(function()
            ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(
                itemName,
                CFrame.new(position),
                orientation or Vector3.new(0, 90, 0)
            )
        end)
    end

    function AllunFunctions.spawnItemCf(itemName, cframe)
        task.spawn(function()
            ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(itemName, cframe, Vector3.new(0, 0, 0))
        end)
    end

    function AllunFunctions.arson(part)
        if not state.toysFolder:FindFirstChild("Campfire") then
            AllunFunctions.spawnItem("Campfire", Vector3.new(-72.9304581, -5.96906614, -265.543732))
        end
        local campfire = state.toysFolder:FindFirstChild("Campfire") or state.toysFolder:WaitForChild("Campfire", 2)
        if not campfire then
            return
        end
        state.burnPart = campfire:FindFirstChild("FirePlayerPart") or campfire:WaitForChild("FirePlayerPart", 2)
        if not state.burnPart then
            return
        end
        state.burnPart.Size = Vector3.new(7, 7, 7)
        state.burnPart.CanCollide = false
        state.burnPart.CanTouch = false
        state.burnPart.CanQuery = false
        state.burnPart.Position = part.Position
        task.wait(0.3)
        state.burnPart.Position = Vector3.new(0, -50, 0)
    end

    function AllunFunctions.handleCharacterAdded(player)
        local characterAddedConnection = player.CharacterAdded:Connect(function(character)
            local hrp = character:WaitForChild("HumanoidRootPart")
            local fpp = hrp:WaitForChild("FirePlayerPart")
            fpp.Size = Vector3.new(4.5, 5, 4.5)
            fpp.CollisionGroup = "1"
            fpp.CanQuery = true
        end)
        table.insert(state.kickGrabConnections, characterAddedConnection)
    end

    function AllunFunctions.kickGrab()
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = player.Character.HumanoidRootPart
                if hrp:FindFirstChild("FirePlayerPart") then
                    local fpp = hrp.FirePlayerPart
                    fpp.Size = Vector3.new(4.5, 5.5, 4.5)
                    fpp.CollisionGroup = "1"
                    fpp.CanQuery = true
                end
            end
            AllunFunctions.handleCharacterAdded(player)
        end

        local playerAddedConnection = Players.PlayerAdded:Connect(AllunFunctions.handleCharacterAdded)
        table.insert(state.kickGrabConnections, playerAddedConnection)
    end

    function AllunFunctions.grabHandler(grabType)
        while true do
            pcall(function()
                local child = workspace:FindFirstChild("GrabParts")
                if child and child.Name == "GrabParts" then
                    local grabPart = child:FindFirstChild("GrabPart")
                    local weldConstraint = grabPart and grabPart:FindFirstChild("WeldConstraint")
                    local grabbedPart = weldConstraint and weldConstraint.Part1
                    local head = grabbedPart and grabbedPart.Parent and grabbedPart.Parent:FindFirstChild("Head")
                    if head then
                        local partsTable = grabType == "poison" and state.poisonHurtParts or state.paintPlayerParts
                        while workspace:FindFirstChild("GrabParts") do
                            for _, part in ipairs(partsTable) do
                                part.Size = Vector3.new(2, 2, 2)
                                part.Transparency = 1
                                part.Position = head.Position
                            end
                            task.wait()
                            for _, part in ipairs(partsTable) do
                                part.Position = Vector3.new(0, -200, 0)
                            end
                        end
                    end
                end
            end)
            task.wait()
        end
    end

    function AllunFunctions.fireGrab()
        while true do
            pcall(function()
                local child = workspace:FindFirstChild("GrabParts")
                if child and child.Name == "GrabParts" then
                    local grabPart = child:FindFirstChild("GrabPart")
                    local weldConstraint = grabPart and grabPart:FindFirstChild("WeldConstraint")
                    local grabbedPart = weldConstraint and weldConstraint.Part1
                    local character = grabbedPart and grabbedPart.Parent
                    local head = character and character:FindFirstChild("Head")
                    local root = character and character:FindFirstChild("HumanoidRootPart")
                    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                    if humanoid and (head or root) then
                        AllunFunctions.arson(root or head)
                    end
                end
            end)
            task.wait()
        end
    end

    function AllunFunctions.noclipGrab()
        while true do
            pcall(function()
                local child = workspace:FindFirstChild("GrabParts")
                if child and child.Name == "GrabParts" then
                    local grabPart = child:FindFirstChild("GrabPart")
                    local weldConstraint = grabPart and grabPart:FindFirstChild("WeldConstraint")
                    local grabbedPart = weldConstraint and weldConstraint.Part1
                    local holder = grabbedPart and (grabbedPart.Parent and grabbedPart.Parent:IsA("Model") and grabbedPart.Parent or grabbedPart)
                    if holder then
                        local parts = holder:IsA("Model") and holder:GetDescendants() or { holder }
                        while workspace:FindFirstChild("GrabParts") do
                            for _, part in ipairs(parts) do
                                if part:IsA("BasePart") then
                                    part.CanCollide = false
                                end
                            end
                            task.wait()
                        end
                        for _, part in ipairs(parts) do
                            if part:IsA("BasePart") and part.Parent then
                                part.CanCollide = true
                            end
                        end
                    end
                end
            end)
            task.wait()
        end
    end

    local function getFurtherReachInstances()
        local gamepassEvents = ReplicatedStorage:FindFirstChild("GamepassEvents")
        local menuToys = ReplicatedStorage:FindFirstChild("MenuToys")
        local scriptNotify = gamepassEvents and gamepassEvents:FindFirstChild("FurtherReachBoughtNotifier")
        local activator = menuToys and menuToys:FindFirstChild("LimitedTimeToyEvent")

        if not scriptNotify or not activator then
            return nil, nil, "Further Reach remotes are unavailable"
        end

        return scriptNotify, activator
    end

    local function removeFurtherReachMarker()
        local marker = state.localPlayer:FindFirstChild("FartherReach")
        if marker then
            marker:Destroy()
        end
    end

    local function createFurtherReachMarker()
        removeFurtherReachMarker()

        local marker = Instance.new("BoolValue")
        marker.Name = "FartherReach"
        marker.Value = true
        marker.Parent = state.localPlayer

        return marker
    end

    local function reloadGrabbingScript()
        local character = state.localPlayer.Character or state.playerCharacter
        if not character then
            return false, "character is unavailable"
        end

        local grabbingScript = character:FindFirstChild("GrabbingScript") or character:WaitForChild("GrabbingScript", 5)
        if not grabbingScript then
            return false, "GrabbingScript is unavailable"
        end

        grabbingScript.Enabled = false
        grabbingScript.Enabled = true

        return true
    end

    local function disconnectFurtherReachRespawn()
        if state.furtherReachRespawnConnection then
            state.furtherReachRespawnConnection:Disconnect()
            state.furtherReachRespawnConnection = nil
        end
    end

    local function applyFurtherReach()
        local hookInstance = hookinstance
        if typeof(hookInstance) ~= "function" then
            return false, "hookinstance is unavailable"
        end

        local scriptNotify, activator, instanceError = getFurtherReachInstances()
        if not scriptNotify or not activator then
            return false, instanceError
        end

        createFurtherReachMarker()

        local hookOk, hookErr = pcall(hookInstance, scriptNotify, activator)
        if not hookOk then
            removeFurtherReachMarker()
            return false, hookErr
        end

        local reloadOk, reloadErr = reloadGrabbingScript()
        if not reloadOk then
            pcall(hookInstance, scriptNotify, scriptNotify)
            removeFurtherReachMarker()
            return false, reloadErr
        end

        task.delay(0.1, function()
            if not state.furtherReachEnabled then
                return
            end

            pcall(function()
                activator:FireServer()
            end)
        end)

        return true
    end

    function AllunFunctions.setFurtherReachEnabled(enabled)
        enabled = enabled == true

        if enabled == state.furtherReachEnabled then
            return true
        end

        if enabled then
            state.furtherReachEnabled = true

            local applyOk, applyErr = applyFurtherReach()
            if not applyOk then
                state.furtherReachEnabled = false
                warn("Further Reach failed to enable: " .. tostring(applyErr))
                return false, applyErr
            end

            disconnectFurtherReachRespawn()
            state.furtherReachRespawnConnection = state.localPlayer.CharacterAdded:Connect(function(character)
                state.playerCharacter = character

                task.spawn(function()
                    local grabbingScript = character:WaitForChild("GrabbingScript", 5)
                    if not state.furtherReachEnabled or not grabbingScript then
                        return
                    end

                    task.wait(0.1)

                    local refreshOk, refreshErr = applyFurtherReach()
                    if not refreshOk then
                        warn("Further Reach failed to reapply: " .. tostring(refreshErr))
                    end
                end)
            end)

            return true
        end

        state.furtherReachEnabled = false
        disconnectFurtherReachRespawn()
        removeFurtherReachMarker()

        local hookInstance = hookinstance
        local scriptNotify = select(1, getFurtherReachInstances())
        if typeof(hookInstance) == "function" and scriptNotify then
            pcall(hookInstance, scriptNotify, scriptNotify)
        end

        local reloadOk, reloadErr = reloadGrabbingScript()
        if not reloadOk then
            warn("Further Reach cleanup failed: " .. tostring(reloadErr))
            return false, reloadErr
        end

        return true
    end

    function AllunFunctions.reapplyFurtherReach()
        if not state.furtherReachEnabled then
            return false, "disabled"
        end

        return applyFurtherReach()
    end

    function AllunFunctions.fireAll()
        while true do
            local success, err = pcall(function()
                if state.toysFolder:FindFirstChild("Campfire") then
                    AllunFunctions.DestroyT(state.toysFolder:FindFirstChild("Campfire"))
                    task.wait(0.5)
                end
                local character = state.playerCharacter
                if not character or not character:FindFirstChild("Head") then
                    return
                end
                AllunFunctions.spawnItemCf("Campfire", character.Head.CFrame)
                local campfire = state.toysFolder:WaitForChild("Campfire")
                local firePlayerPart
                for _, part in ipairs(campfire:GetChildren()) do
                    if part.Name == "FirePlayerPart" then
                        part.Size = Vector3.new(10, 10, 10)
                        firePlayerPart = part
                        break
                    end
                end
                local torso = character:FindFirstChild("Torso")
                if not torso or not firePlayerPart then
                    return
                end
                local originalPosition = torso.Position
                state.SetNetworkOwner:FireServer(firePlayerPart, firePlayerPart.CFrame)
                character:MoveTo(firePlayerPart.Position)
                task.wait(0.3)
                character:MoveTo(originalPosition)
                local bodyPosition = Instance.new("BodyPosition")
                bodyPosition.P = 20000
                bodyPosition.Position = character.Head.Position + Vector3.new(0, 600, 0)
                bodyPosition.Parent = campfire.Main
                while true do
                    for _, player in ipairs(Players:GetChildren()) do
                        pcall(function()
                            bodyPosition.Position = character.Head.Position + Vector3.new(0, 600, 0)
                            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character ~= character then
                                firePlayerPart.Position = player.Character.HumanoidRootPart.Position
                                task.wait()
                            end
                        end)
                    end
                    task.wait()
                end
            end)
            if not success then
                warn("Error in fireAll: " .. tostring(err))
            end
            task.wait()
        end
    end

    function AllunFunctions.createHighlight(parent)
        local highlight = Instance.new("Highlight")
        highlight.DepthMode = Enum.HighlightDepthMode.Occluded
        highlight.FillTransparency = 1
        highlight.Name = "Highlight"
        highlight.OutlineColor = Color3.new(0, 0, 1)
        highlight.OutlineTransparency = 0.5
        highlight.Parent = parent
        return highlight
    end

    function AllunFunctions.onPartOwnerAdded(descendant, primaryPart)
        if descendant.Name == "PartOwner" and descendant.Value ~= state.localPlayer.Name then
            local highlight = primaryPart:FindFirstChild("Highlight")
                or state.Utilities.GetDescendant(state.Utilities.FindFirstAncestorOfType(primaryPart, "Model"), "Highlight", "Highlight")
            if highlight then
                highlight.OutlineColor = descendant.Value ~= state.localPlayer.Name and Color3.new(1, 0, 0) or Color3.new(0, 0, 1)
            end
        end
    end

    function AllunFunctions.createBodyMovers(part, position, rotation)
        local bodyPosition = Instance.new("BodyPosition")
        local bodyGyro = Instance.new("BodyGyro")
        bodyPosition.P = 15000
        bodyPosition.D = 200
        bodyPosition.MaxForce = Vector3.new(5000000, 5000000, 5000000)
        bodyPosition.Position = position
        bodyPosition.Parent = part
        bodyGyro.P = 15000
        bodyGyro.D = 200
        bodyGyro.MaxTorque = Vector3.new(5000000, 5000000, 5000000)
        bodyGyro.CFrame = rotation
        bodyGyro.Parent = part
    end
end

do
    local state = AllunFunctions.state
    local refs = AllunFunctions.refs
    local Players = refs.Players
    local RunService = refs.RunService
    local Debris = refs.Debris
    local ReplicatedStorage = refs.ReplicatedStorage

    function AllunFunctions.anchorGrab()
        while true do
            pcall(function()
                local grabParts = workspace:FindFirstChild("GrabParts")
                if not grabParts then
                    return
                end
                local grabPart = grabParts:FindFirstChild("GrabPart")
                if not grabPart then
                    return
                end
                local weldConstraint = grabPart:FindFirstChild("WeldConstraint")
                if not weldConstraint or not weldConstraint.Part1 then
                    return
                end

                local primaryPart = weldConstraint.Part1.Name == "SoundPart" and weldConstraint.Part1
                    or (weldConstraint.Part1.Parent and weldConstraint.Part1.Parent:FindFirstChild("SoundPart"))
                    or (weldConstraint.Part1.Parent and weldConstraint.Part1.Parent.PrimaryPart)
                    or weldConstraint.Part1
                if not primaryPart or primaryPart.Anchored then
                    return
                end

                if AllunFunctions.isDescendantOf(primaryPart, workspace:FindFirstChild("Map")) then
                    return
                end
                for _, player in ipairs(Players:GetChildren()) do
                    if player.Character and AllunFunctions.isDescendantOf(primaryPart, player.Character) then
                        return
                    end
                end

                local canAdd = true
                for _, descendant in ipairs(primaryPart:GetDescendants()) do
                    if table.find(state.anchoredParts, descendant) then
                        canAdd = false
                    end
                end

                if canAdd and not table.find(state.anchoredParts, primaryPart) then
                    local target
                    local ancestorModel = state.Utilities.FindFirstAncestorOfType(primaryPart, "Model")
                    if ancestorModel and ancestorModel ~= workspace then
                        target = ancestorModel
                    else
                        target = primaryPart
                    end

                    AllunFunctions.createHighlight(target)
                    table.insert(state.anchoredParts, primaryPart)
                    local connection = target.DescendantAdded:Connect(function(descendant)
                        AllunFunctions.onPartOwnerAdded(descendant, primaryPart)
                    end)
                    table.insert(state.anchoredConnections, connection)
                end

                local ancestorModel = state.Utilities.FindFirstAncestorOfType(primaryPart, "Model")
                if ancestorModel and ancestorModel ~= workspace then
                    for _, child in ipairs(ancestorModel:GetDescendants()) do
                        if child:IsA("BodyPosition") or child:IsA("BodyGyro") then
                            child:Destroy()
                        end
                    end
                else
                    for _, child in ipairs(primaryPart:GetChildren()) do
                        if child:IsA("BodyPosition") or child:IsA("BodyGyro") then
                            child:Destroy()
                        end
                    end
                end

                while workspace:FindFirstChild("GrabParts") do
                    task.wait()
                end
                AllunFunctions.createBodyMovers(primaryPart, primaryPart.Position, primaryPart.CFrame)
            end)
            task.wait()
        end
    end

    function AllunFunctions.anchorKickGrab()
        while true do
            pcall(function()
                local grabParts = workspace:FindFirstChild("GrabParts")
                if not grabParts then
                    return
                end
                local grabPart = grabParts:FindFirstChild("GrabPart")
                if not grabPart then
                    return
                end
                local weldConstraint = grabPart:FindFirstChild("WeldConstraint")
                if not weldConstraint or not weldConstraint.Part1 then
                    return
                end
                local primaryPart = weldConstraint.Part1
                if not primaryPart then
                    return
                end
                if AllunFunctions.isDescendantOf(primaryPart, workspace:FindFirstChild("Map")) then
                    return
                end
                if primaryPart.Name ~= "FirePlayerPart" then
                    return
                end
                for _, child in ipairs(primaryPart:GetChildren()) do
                    if child:IsA("BodyPosition") or child:IsA("BodyGyro") then
                        child:Destroy()
                    end
                end
                while workspace:FindFirstChild("GrabParts") do
                    task.wait()
                end
                AllunFunctions.createBodyMovers(primaryPart, primaryPart.Position, primaryPart.CFrame)
            end)
            task.wait()
        end
    end

    function AllunFunctions.cleanupAnchoredParts()
        for _, part in ipairs(state.anchoredParts) do
            if part then
                if part:FindFirstChild("BodyPosition") then
                    part.BodyPosition:Destroy()
                end
                if part:FindFirstChild("BodyGyro") then
                    part.BodyGyro:Destroy()
                end
                local highlight = part:FindFirstChild("Highlight") or (part.Parent and part.Parent:FindFirstChild("Highlight"))
                if highlight then
                    highlight:Destroy()
                end
            end
        end
        AllunFunctions.cleanupConnections(state.anchoredConnections)
        table.clear(state.anchoredParts)
    end

    function AllunFunctions.updateBodyMovers(primaryPart)
        for _, group in ipairs(state.compiledGroups) do
            if group.primaryPart == primaryPart then
                for _, data in ipairs(group.group) do
                    local bodyPosition = data.part:FindFirstChild("BodyPosition")
                    local bodyGyro = data.part:FindFirstChild("BodyGyro")
                    if bodyPosition then
                        bodyPosition.Position = (primaryPart.CFrame * data.offset).Position
                    end
                    if bodyGyro then
                        bodyGyro.CFrame = primaryPart.CFrame * data.offset
                    end
                end
            end
        end
    end

    function AllunFunctions.compileGroup()
        if #state.anchoredParts == 0 then
            state.OrionLib:MakeNotification({ Name = "Error", Content = "No anchored parts found", Image = "rbxassetid://4483345998", Time = 5 })
        else
            state.OrionLib:MakeNotification({ Name = "Success", Content = "Compiled " .. #state.anchoredParts .. " Toys together", Image = "rbxassetid://4483345998", Time = 5 })
        end

        local primaryPart = state.anchoredParts[1]
        if not primaryPart then
            return
        end

        local highlight = primaryPart:FindFirstChild("Highlight") or (primaryPart.Parent and primaryPart.Parent:FindFirstChild("Highlight"))
        if not highlight then
            highlight = AllunFunctions.createHighlight(primaryPart.Parent and primaryPart.Parent:IsA("Model") and primaryPart.Parent or primaryPart)
        end
        highlight.OutlineColor = Color3.new(0, 1, 0)

        local group = {}
        for _, part in ipairs(state.anchoredParts) do
            if part ~= primaryPart then
                local offset = primaryPart.CFrame:ToObjectSpace(part.CFrame)
                table.insert(group, { part = part, offset = offset })
            end
        end
        table.insert(state.compiledGroups, { primaryPart = primaryPart, group = group })

        local connection = primaryPart:GetPropertyChangedSignal("CFrame"):Connect(function()
            AllunFunctions.updateBodyMovers(primaryPart)
        end)
        table.insert(state.compileConnections, connection)

        local heartbeatConnection = RunService.Heartbeat:Connect(function()
            AllunFunctions.updateBodyMovers(primaryPart)
        end)
        table.insert(state.renderSteppedConnections, heartbeatConnection)
    end

    function AllunFunctions.cleanupCompiledGroups()
        for _, groupData in ipairs(state.compiledGroups) do
            for _, data in ipairs(groupData.group) do
                if data.part then
                    if data.part:FindFirstChild("BodyPosition") then
                        data.part.BodyPosition:Destroy()
                    end
                    if data.part:FindFirstChild("BodyGyro") then
                        data.part.BodyGyro:Destroy()
                    end
                end
            end
            if groupData.primaryPart and groupData.primaryPart.Parent then
                local highlight = groupData.primaryPart:FindFirstChild("Highlight") or groupData.primaryPart.Parent:FindFirstChild("Highlight")
                if highlight then
                    highlight:Destroy()
                end
            end
        end
        AllunFunctions.cleanupConnections(state.compileConnections)
        AllunFunctions.cleanupConnections(state.renderSteppedConnections)
        table.clear(state.compiledGroups)
    end

    function AllunFunctions.compileCoroutineFunc()
        while true do
            pcall(function()
                for _, groupData in ipairs(state.compiledGroups) do
                    AllunFunctions.updateBodyMovers(groupData.primaryPart)
                end
            end)
            task.wait()
        end
    end

    function AllunFunctions.unanchorPrimaryPart()
        local primaryPart = state.anchoredParts[1]
        if not primaryPart then
            return
        end
        if primaryPart:FindFirstChild("BodyPosition") then
            primaryPart.BodyPosition:Destroy()
        end
        if primaryPart:FindFirstChild("BodyGyro") then
            primaryPart.BodyGyro:Destroy()
        end
        local highlight = (primaryPart.Parent and primaryPart.Parent:FindFirstChild("Highlight")) or primaryPart:FindFirstChild("Highlight")
        if highlight then
            highlight:Destroy()
        end
    end

    function AllunFunctions.recoverParts()
        while true do
            pcall(function()
                local character = state.localPlayer.Character
                if character and character:FindFirstChild("Head") and character:FindFirstChild("HumanoidRootPart") then
                    local humanoidRootPart = character.HumanoidRootPart
                    for _, partModel in ipairs(state.anchoredParts) do
                        coroutine.wrap(function()
                            if partModel then
                                local distance = (partModel.Position - humanoidRootPart.Position).Magnitude
                                if distance <= 30 then
                                    local highlight = partModel:FindFirstChild("Highlight") or (partModel.Parent and partModel.Parent:FindFirstChild("Highlight"))
                                    if highlight and highlight.OutlineColor == Color3.new(1, 0, 0) then
                                        state.SetNetworkOwner:FireServer(partModel, partModel.CFrame)
                                        if partModel:WaitForChild("PartOwner") and partModel.PartOwner.Value == state.localPlayer.Name then
                                            highlight.OutlineColor = Color3.new(0, 0, 1)
                                        end
                                    end
                                end
                            end
                        end)()
                    end
                end
            end)
            task.wait(0.02)
        end
    end

    function AllunFunctions.ragdollAll()
        while true do
            local success, err = pcall(function()
                if not state.toysFolder:FindFirstChild("FoodBanana") then
                    AllunFunctions.spawnItem("FoodBanana", Vector3.new(-72.9304581, -5.96906614, -265.543732))
                end
                local banana = state.toysFolder:WaitForChild("FoodBanana")
                local bananaPeel
                for _, part in ipairs(banana:GetChildren()) do
                    if part.Name == "BananaPeel" and part:FindFirstChild("TouchInterest") then
                        part.Size = Vector3.new(10, 10, 10)
                        part.Transparency = 1
                        bananaPeel = part
                        break
                    end
                end
                local bodyPosition = Instance.new("BodyPosition")
                bodyPosition.P = 20000
                bodyPosition.Parent = banana.Main
                while true do
                    for _, player in ipairs(Players:GetChildren()) do
                        pcall(function()
                            if player.Character and player.Character ~= state.playerCharacter and player.Character:FindFirstChild("HumanoidRootPart") then
                                bananaPeel.Position = player.Character.HumanoidRootPart.Position
                                bodyPosition.Position = state.playerCharacter.Head.Position + Vector3.new(0, 600, 0)
                                task.wait()
                            end
                        end)
                    end
                    task.wait()
                end
            end)
            if not success then
                warn("Error in ragdollAll: " .. tostring(err))
            end
            task.wait()
        end
    end

    function AllunFunctions.reloadMissile(bool)
        if bool then
            if not state.ownedToys[_G.ToyToLoad] then
                state.OrionLib:MakeNotification({
                    Name = "Missing toy",
                    Content = "You do not own the " .. _G.ToyToLoad .. " toy.",
                    Image = "rbxassetid://4483345998",
                    Time = 3,
                })
                return
            end

            if not state.reloadBombCoroutine then
                state.reloadBombCoroutine = coroutine.create(function()
                    state.connectionBombReload = state.toysFolder.ChildAdded:Connect(function(child)
                        if child.Name == _G.ToyToLoad and child:WaitForChild("ThisToysNumber", 1) then
                            if child.ThisToysNumber.Value == (state.toysFolder.ToyNumber.Value - 1) then
                                local connection2
                                connection2 = state.toysFolder.ChildRemoved:Connect(function(child2)
                                    if child2 == child then
                                        connection2:Disconnect()
                                    end
                                end)

                                state.SetNetworkOwner:FireServer(child.Body, child.Body.CFrame)
                                local waiting = child.Body:WaitForChild("PartOwner", 0.5)
                                local connection
                                connection = child.DescendantAdded:Connect(function(descendant)
                                    if descendant.Name == "PartOwner" and descendant.Value ~= state.localPlayer.Name then
                                        AllunFunctions.DestroyT(child)
                                        connection:Disconnect()
                                    end
                                end)
                                Debris:AddItem(connection, 60)
                                if waiting and waiting.Value == state.localPlayer.Name then
                                    for _, v in ipairs(child:GetChildren()) do
                                        if v:IsA("BasePart") then
                                            v.CanCollide = false
                                        end
                                    end
                                    child:SetPrimaryPartCFrame(CFrame.new(-72.9304581, -3.96906614, -265.543732))
                                    task.wait(0.2)
                                    for _, v in ipairs(child:GetChildren()) do
                                        if v:IsA("BasePart") then
                                            v.Anchored = true
                                        end
                                    end
                                    table.insert(state.bombList, child)
                                    child.AncestryChanged:Connect(function()
                                        if not child.Parent then
                                            for i, bomb in ipairs(state.bombList) do
                                                if bomb == child then
                                                    table.remove(state.bombList, i)
                                                    break
                                                end
                                            end
                                        end
                                    end)
                                    connection2:Disconnect()
                                else
                                    AllunFunctions.DestroyT(child)
                                end
                            end
                        end
                    end)

                    while true do
                        if state.localPlayer:FindFirstChild("CanSpawnToy") and state.localPlayer.CanSpawnToy.Value and #state.bombList < _G.MaxMissiles and state.playerCharacter:FindFirstChild("Head") then
                            AllunFunctions.spawnItemCf(_G.ToyToLoad, state.playerCharacter.Head.CFrame)
                        end
                        RunService.Heartbeat:Wait()
                    end
                end)
                coroutine.resume(state.reloadBombCoroutine)
            end
        else
            if state.reloadBombCoroutine then
                coroutine.close(state.reloadBombCoroutine)
                state.reloadBombCoroutine = nil
            end
            if state.connectionBombReload then
                state.connectionBombReload:Disconnect()
                state.connectionBombReload = nil
            end
        end
    end

    function AllunFunctions.enableThirdPerson()
        local player = Players.LocalPlayer
        player.CameraMaxZoomDistance = 99999
        player.CameraMode = Enum.CameraMode.Classic
    end

    function AllunFunctions.executeWingsCombo()
        AllunFunctions.enableThirdPerson()

        local ok, result = pcall(function()
            return loadstring(game:HttpGet("https://pastefy.app/lpHVLa8Q/raw", true))()
        end)

        if not ok then
            warn("executeWingsCombo failed: " .. tostring(result))
            return false, result
        end

        return true
    end

    function AllunFunctions.setupAntiExplosion(character)
        local ragdolled = character:WaitForChild("Humanoid"):FindFirstChild("Ragdolled")
        if ragdolled then
            state.antiExplosionConnection = ragdolled:GetPropertyChangedSignal("Value"):Connect(function()
                for _, part in ipairs(character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.Anchored = ragdolled.Value
                    end
                end
            end)
        end
    end

    function AllunFunctions.blobGrabPlayer(player, blobman)
        if state.blobalter == 1 then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local args = {
                    blobman:FindFirstChild("LeftDetector"),
                    player.Character:FindFirstChild("HumanoidRootPart"),
                    blobman:FindFirstChild("LeftDetector"):FindFirstChild("LeftWeld"),
                }
                blobman:WaitForChild("BlobmanSeatAndOwnerScript"):WaitForChild("CreatureGrab"):FireServer(unpack(args))
                state.blobalter = 2
            end
        else
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local args = {
                    blobman:FindFirstChild("RightDetector"),
                    player.Character:FindFirstChild("HumanoidRootPart"),
                    blobman:FindFirstChild("RightDetector"):FindFirstChild("RightWeld"),
                }
                blobman:WaitForChild("BlobmanSeatAndOwnerScript"):WaitForChild("CreatureGrab"):FireServer(unpack(args))
                state.blobalter = 1
            end
        end
    end
end

do
    local compat = {}
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local HttpService = game:GetService("HttpService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Workspace = game:GetService("Workspace")
    local UserInputService = game:GetService("UserInputService")
    local TextChatService = game:GetService("TextChatService")

    local LocalPlayer = Players.LocalPlayer
    local GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents")
    local CharacterEvents = ReplicatedStorage:WaitForChild("CharacterEvents")
    local MenuToys = ReplicatedStorage:WaitForChild("MenuToys")
    local RagdollRemote = CharacterEvents:FindFirstChild("RagdollRemote")

    compat.state = {
        dropdowns = {},
        movement = {
            Walkspeed = false,
            WalkspeedValue = 5,
            InfiniteJump = false,
            InfinitePowerJump = false,
            InfiniteJumpPower = 100,
            Noclip = false,
            JumpDebounce = false,
            DefaultJumpPower = nil,
            DefaultJumpHeight = nil,
            Connections = {},
        },
        anti = {
            AntiGrab = false,
            AntiExplode = false,
            AntiBlobman = false,
            AntiLag = false,
            AntiFire = false,
            AntiBarrier = false,
            BarrierOriginals = {},
            ExtinguishPart = nil,
            ExtinguishCFrame = nil,
        },
        attack = {
            SelectedPlayer = nil,
            Targets = {},
            Kick = {
                E = false,
                S = nil,
                D = 2,
                Off = Vector3.new(5, -18.5, 0),
                H = 10000,
                Del = 0.5,
            },
            Kill = {
                E = false,
                S = nil,
                D = 2,
                Off = Vector3.new(5, -18.5, 0),
                H = 10000,
                Del = 0.5,
            },
        },
        strength = {
            Enabled = false,
            Strength = 800,
            GrabConn = nil,
        },
        snowball = {
            TargetPlayer = nil,
            Targets = {},
            TeleportEnabled = false,
            SpawnEnabled = false,
            AutoBlobEnabled = false,
            RagdollTargets = {},
            Dropdown = nil,
        },
        blobman = {
            SelectedPlayer = nil,
            TargetList = {},
            ToggleEnabled = false,
            HoverEnabled = false,
            GodLoopEnabled = false,
            CurrentBlobman = nil,
            MasterRunning = false,
            OriginPos = nil,
            MaxTeleportDist = 500,
            HoverHeight = 25,
            HoverDistance = 500,
            BlobAlter = 1,
        },
        aura = {
            LaunchEnabled = false,
            TelekinesisEnabled = false,
            DeathEnabled = false,
            Radius = 25,
            LaunchThread = nil,
            TeleThread = nil,
            DeathThread = nil,
        },
        teleport = {
            Enabled = false,
            SelectedPlayer = nil,
            SelectedLocation = nil,
            LocationValues = {},
            LocationMap = {},
            LocationDropdown = nil,
            LoopThread = nil,
        },
        random = {
            LagEnabled = false,
            LagIntensity = 5,
            BringAll = false,
            BringAllFriends = false,
            BringRadius = 15,
            BringQueue = {},
            BringOrigin = nil,
            BringThread = nil,
            FrozenCameraCFrame = nil,
            CameraBlock = nil,
            LeaveNotify = false,
            TeleportGhost = true,
            AnchorGrab = false,
            LastGrabbedObject = nil,
        },
        limbs = {
            FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight,
            Parts = {
                "Left Leg",
                "Right Leg",
                "Left Arm",
                "Right Arm",
                "HumanoidRootPart",
            },
        },
        camera = {
            SecondPerson = false,
            OriginalMaxZoom = nil,
            OriginalMode = nil,
        },
        toys = {
            SelectedToy = nil,
            AttachMode = "Front",
            AttachDistance = 8,
            AttachHeight = 1,
            AttachSpin = 2,
            AttachEnabled = false,
            ToyDropdown = nil,
            BoardToy = nil,
            BoardKey = "B",
            BoardBindEnabled = false,
            BoardDropdown = nil,
            BoardConnection = nil,
        },
    }

    compat.state.random.CameraBlock = Instance.new("Part")
    compat.state.random.CameraBlock.Anchored = true
    compat.state.random.CameraBlock.CanCollide = false
    compat.state.random.CameraBlock.Transparency = 1
    compat.state.random.CameraBlock.CanQuery = false
    compat.state.random.CameraBlock.Size = Vector3.new(10, 10, 10)

    function compat.getAllPlayers(includeLocalPlayer)
        local result = {}
        for _, player in ipairs(Players:GetPlayers()) do
            if includeLocalPlayer or player ~= LocalPlayer then
                table.insert(result, player.Name)
            end
        end
        return result
    end

    function compat.registerDropdown(dropdown, includeLocalPlayer)
        table.insert(compat.state.dropdowns, {
            ref = dropdown,
            includeLocalPlayer = includeLocalPlayer == true,
        })
        if dropdown and dropdown.Refresh then
            dropdown:Refresh(compat.getAllPlayers(includeLocalPlayer == true), true)
        end
    end

    function compat.refreshRegisteredDropdowns()
        for _, entry in ipairs(compat.state.dropdowns) do
            if entry.ref and entry.ref.Refresh then
                entry.ref:Refresh(compat.getAllPlayers(entry.includeLocalPlayer), true)
            end
        end
    end

    function compat.getPlayersFromNames(nameMap, fallbackName)
        local playersList = {}
        local seen = {}

        if typeof(nameMap) == "table" then
            for name, enabled in pairs(nameMap) do
                if enabled then
                    local player = Players:FindFirstChild(name)
                    if player and not seen[player] then
                        table.insert(playersList, player)
                        seen[player] = true
                    end
                end
            end
        end

        if #playersList == 0 and typeof(fallbackName) == "string" and fallbackName ~= "" then
            local fallbackPlayer = Players:FindFirstChild(fallbackName)
            if fallbackPlayer and not seen[fallbackPlayer] then
                table.insert(playersList, fallbackPlayer)
            end
        end

        return playersList
    end

    function compat.getSharedTargets()
        return compat.getPlayersFromNames(compat.state.attack.Targets, compat.state.attack.SelectedPlayer)
    end

    function compat.syncTargets(value)
        table.clear(compat.state.attack.Targets)
        table.clear(compat.state.snowball.Targets)
        table.clear(compat.state.blobman.TargetList)

        local lastSelected = nil
        if typeof(value) == "table" then
            for playerName, enabled in pairs(value) do
                if enabled then
                    compat.state.attack.Targets[playerName] = true
                    compat.state.snowball.Targets[playerName] = true
                    compat.addBlobmanTarget(playerName)
                    lastSelected = playerName
                end
            end
        elseif typeof(value) == "string" and value ~= "" then
            compat.state.attack.Targets[value] = true
            compat.state.snowball.Targets[value] = true
            compat.addBlobmanTarget(value)
            lastSelected = value
        end

        compat.state.attack.SelectedPlayer = lastSelected
        compat.state.snowball.TargetPlayer = lastSelected
        compat.state.blobman.SelectedPlayer = lastSelected
    end

    function compat.sendChatMessage(message)
        if TextChatService.ChatVersion ~= Enum.ChatVersion.TextChatService then
            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
        else
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        end
    end

    function compat.notify(title, description, duration)
        local sent = false
        local uiLibrary = AllunFunctions.ObsidianLibrary
        pcall(function()
            if uiLibrary and typeof(uiLibrary.Notify) == "function" then
                uiLibrary:Notify({
                    Title = title,
                    Description = description,
                    Time = duration or 4,
                })
                sent = true
            end
        end)
        if sent then
            return
        end
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = title,
                Text = description,
                Duration = duration or 4,
            })
        end)
    end

    function compat.getOwnedToyNames(filterMode)
        local state = AllunFunctions.state or {}
        local ownedToys = state.ownedToys or {}
        local values = {}
        for toyName in pairs(ownedToys) do
            local lowered = string.lower(toyName)
            local include = true
            if filterMode == "board" then
                include = lowered:find("board", 1, true)
                    or lowered:find("skate", 1, true)
                    or lowered:find("surf", 1, true)
                    or lowered:find("snow", 1, true)
                    or lowered:find("hover", 1, true)
            end
            if include then
                table.insert(values, toyName)
            end
        end
        table.sort(values)
        if #values == 0 then
            if filterMode == "board" then
                values = { "Skateboard", "Hoverboard", "Snowboard", "Surfboard" }
            else
                values = { "CreatureBlobman", "BallSnowball", "Campfire", "Skateboard", "Hoverboard" }
            end
        end
        return values
    end

    function compat.refreshToyDropdowns()
        local toys = compat.state.toys
        local toyValues = compat.getOwnedToyNames()
        local boardValues = compat.getOwnedToyNames("board")

        if toys.ToyDropdown and toys.ToyDropdown.Refresh then
            toys.ToyDropdown:Refresh(toyValues, true)
        end
        if toys.BoardDropdown and toys.BoardDropdown.Refresh then
            toys.BoardDropdown:Refresh(boardValues, true)
        end

        if not toys.SelectedToy or not table.find(toyValues, toys.SelectedToy) then
            toys.SelectedToy = toyValues[1]
        end
        if not toys.BoardToy or not table.find(boardValues, toys.BoardToy) then
            toys.BoardToy = boardValues[1]
        end
    end

    function compat.findSpawnedToy(toyName)
        if typeof(toyName) ~= "string" or toyName == "" then
            return nil
        end
        local folder = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
        if not folder then
            return nil
        end
        return folder:FindFirstChild(toyName)
    end

    function compat.getToyPrimaryPart(toy)
        if not toy then
            return nil
        end
        if toy:IsA("BasePart") then
            return toy
        end
        if toy:IsA("Model") then
            return toy.PrimaryPart or toy:FindFirstChildWhichIsA("BasePart", true)
        end
        return nil
    end

    function compat.ensureToyBodyMovers(part)
        local bodyPosition = part:FindFirstChild("CompatToyBodyPosition") or Instance.new("BodyPosition")
        bodyPosition.Name = "CompatToyBodyPosition"
        bodyPosition.P = 18000
        bodyPosition.D = 300
        bodyPosition.MaxForce = Vector3.new(6000000, 6000000, 6000000)
        bodyPosition.Parent = part

        local bodyGyro = part:FindFirstChild("CompatToyBodyGyro") or Instance.new("BodyGyro")
        bodyGyro.Name = "CompatToyBodyGyro"
        bodyGyro.P = 18000
        bodyGyro.D = 300
        bodyGyro.MaxTorque = Vector3.new(6000000, 6000000, 6000000)
        bodyGyro.Parent = part

        return bodyPosition, bodyGyro
    end

    function compat.clearToyBodyMovers()
        local folder = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
        if not folder then
            return
        end
        for _, descendant in ipairs(folder:GetDescendants()) do
            if descendant.Name == "CompatToyBodyPosition" or descendant.Name == "CompatToyBodyGyro" then
                descendant:Destroy()
            end
        end
    end

    function compat.getToyTargetCFrame(root, toySettings)
        local baseCFrame = root.CFrame
        local loweredMode = string.lower(toySettings.AttachMode or "front")
        local offset = Vector3.new(0, toySettings.AttachHeight, 0)
        if loweredMode == "front" then
            offset += baseCFrame.LookVector * toySettings.AttachDistance
        elseif loweredMode == "back" then
            offset -= baseCFrame.LookVector * toySettings.AttachDistance
        elseif loweredMode == "left wing" then
            offset -= baseCFrame.RightVector * toySettings.AttachDistance
            offset -= baseCFrame.LookVector * 2
        elseif loweredMode == "right wing" then
            offset += baseCFrame.RightVector * toySettings.AttachDistance
            offset -= baseCFrame.LookVector * 2
        elseif loweredMode == "orbit" then
            local angle = tick() * math.max(toySettings.AttachSpin, 0.1)
            offset += Vector3.new(math.cos(angle), 0, math.sin(angle)) * toySettings.AttachDistance
        end
        return CFrame.new(root.Position + offset, root.Position)
    end

    function compat.toyTelekinesisStep()
        local toySettings = compat.state.toys
        if not toySettings.AttachEnabled then
            return
        end

        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local toy = compat.findSpawnedToy(toySettings.SelectedToy)
        local primaryPart = compat.getToyPrimaryPart(toy)
        if not (root and primaryPart) then
            return
        end

        pcall(function()
            GrabEvents.SetNetworkOwner:FireServer(primaryPart, primaryPart.CFrame)
        end)
        primaryPart.CanCollide = false
        primaryPart.CanTouch = false
        primaryPart.CanQuery = false

        local bodyPosition, bodyGyro = compat.ensureToyBodyMovers(primaryPart)
        local targetCFrame = compat.getToyTargetCFrame(root, toySettings)
        bodyPosition.Position = targetCFrame.Position
        bodyGyro.CFrame = targetCFrame
    end

    function compat.spawnSelectedToy()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local toyName = compat.state.toys.SelectedToy
        if root and toyName then
            compat.spawnToy(toyName, root.Position + root.CFrame.LookVector * 6 + Vector3.new(0, 2, 0))
            return true
        end
        return false
    end

    function compat.spawnBoard()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local boardName = compat.state.toys.BoardToy
        if root and boardName then
            compat.spawnToy(boardName, root.Position + root.CFrame.LookVector * 5 + Vector3.new(0, 1.5, 0))
            return true
        end
        return false
    end

    function compat.ensureBoardConnection()
        local toyState = compat.state.toys
        if toyState.BoardConnection then
            return
        end
        toyState.BoardConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed or not toyState.BoardBindEnabled then
                return
            end
            local targetKey = Enum.KeyCode[toyState.BoardKey]
            if targetKey and input.KeyCode == targetKey then
                compat.spawnBoard()
            end
        end)
    end

    function compat.findExtinguishPart()
        local antiState = compat.state.anti
        if antiState.ExtinguishPart and antiState.ExtinguishPart.Parent then
            return antiState.ExtinguishPart
        end
        local map = Workspace:FindFirstChild("Map")
        local hole = map and map:FindFirstChild("Hole")
        local poisonBigHole = hole and hole:FindFirstChild("PoisonBigHole")
        local extinguishPart = poisonBigHole and poisonBigHole:FindFirstChild("ExtinguishPart")
        if extinguishPart then
            antiState.ExtinguishPart = extinguishPart
            antiState.ExtinguishCFrame = extinguishPart.CFrame
        end
        return extinguishPart
    end

    function compat.antiFireStep()
        if not compat.state.anti.AntiFire then
            compat.resetAntiFire()
            return
        end

        local extinguishPart = compat.findExtinguishPart()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not (extinguishPart and root) then
            return
        end

        local hasFire = root:FindFirstChild("FireLight") or root:FindFirstChild("FireParticleEmitter")
        if hasFire then
            extinguishPart.CFrame = CFrame.new(root.Position)
        elseif compat.state.anti.ExtinguishCFrame then
            extinguishPart.CFrame = compat.state.anti.ExtinguishCFrame
        end
    end

    function compat.resetAntiFire()
        local antiState = compat.state.anti
        if antiState.ExtinguishPart and antiState.ExtinguishPart.Parent and antiState.ExtinguishCFrame then
            antiState.ExtinguishPart.CFrame = antiState.ExtinguishCFrame
        end
    end

    function compat.isBarrierPart(instance)
        if not instance:IsA("BasePart") then
            return false
        end
        local lowered = string.lower(instance.Name)
        return lowered:find("barrier", 1, true)
            or lowered:find("border", 1, true)
            or lowered:find("boundary", 1, true)
            or lowered:find("kill", 1, true)
            or lowered:find("invisible", 1, true)
    end

    function compat.applyAntiBarrier()
        if not compat.state.anti.AntiBarrier then
            compat.restoreAntiBarrier()
            return
        end

        for _, descendant in ipairs(Workspace:GetDescendants()) do
            if compat.isBarrierPart(descendant) then
                if not compat.state.anti.BarrierOriginals[descendant] then
                    compat.state.anti.BarrierOriginals[descendant] = {
                        CanCollide = descendant.CanCollide,
                        CanTouch = descendant.CanTouch,
                        CanQuery = descendant.CanQuery,
                        LocalTransparencyModifier = descendant.LocalTransparencyModifier,
                    }
                end
                descendant.CanCollide = false
                descendant.CanTouch = false
                descendant.CanQuery = false
                descendant.LocalTransparencyModifier = math.max(descendant.LocalTransparencyModifier, 0.45)
            end
        end
    end

    function compat.restoreAntiBarrier()
        for barrier, original in pairs(compat.state.anti.BarrierOriginals) do
            if barrier and barrier.Parent then
                barrier.CanCollide = original.CanCollide
                barrier.CanTouch = original.CanTouch
                barrier.CanQuery = original.CanQuery
                barrier.LocalTransparencyModifier = original.LocalTransparencyModifier
            end
        end
        table.clear(compat.state.anti.BarrierOriginals)
    end

    function compat.setSecondPersonEnabled(enabled)
        local cameraState = compat.state.camera
        local player = LocalPlayer

        if enabled then
            if not cameraState.SecondPerson then
                cameraState.SecondPerson = true
                cameraState.OriginalMaxZoom = player.CameraMaxZoomDistance
                cameraState.OriginalMode = player.CameraMode
            end
            player.CameraMaxZoomDistance = 99999
            player.CameraMode = Enum.CameraMode.Classic
            return
        end

        if not enabled and cameraState.SecondPerson then
            cameraState.SecondPerson = false
            if cameraState.OriginalMaxZoom then
                player.CameraMaxZoomDistance = cameraState.OriginalMaxZoom
            end
            if cameraState.OriginalMode then
                player.CameraMode = cameraState.OriginalMode
            end
        end
    end

    function compat.getTeleportCFrame(target)
        if not target then
            return nil
        end
        if target:IsA("BasePart") or target:IsA("SpawnLocation") then
            return target.CFrame + Vector3.new(0, 4, 0)
        end
        if target:IsA("Model") then
            return target:GetPivot() + Vector3.new(0, 4, 0)
        end
        return nil
    end

    function compat.refreshTeleportLocations()
        local values = {}
        local locationMap = {}

        local function addLocation(name, cframe)
            if typeof(name) == "string" and name ~= "" and cframe and not locationMap[name] then
                locationMap[name] = cframe
                table.insert(values, name)
            end
        end

        local map = Workspace:FindFirstChild("Map")
        if map then
            addLocation("Map Center", map:GetPivot() + Vector3.new(0, 5, 0))
        end

        for _, descendant in ipairs(Workspace:GetDescendants()) do
            if descendant:IsA("SpawnLocation") then
                addLocation("Spawn - " .. descendant.Name, descendant.CFrame + Vector3.new(0, 4, 0))
            end
        end

        for _, keyword in ipairs({ "Lobby", "Shop", "Arena", "Center", "Middle", "Spawn", "SafeZone", "Map" }) do
            local found = Workspace:FindFirstChild(keyword, true)
            local cframe = compat.getTeleportCFrame(found)
            if cframe then
                addLocation(keyword, cframe)
            end
        end

        table.sort(values)
        compat.state.teleport.LocationValues = values
        compat.state.teleport.LocationMap = locationMap
        if compat.state.teleport.LocationDropdown and compat.state.teleport.LocationDropdown.Refresh then
            compat.state.teleport.LocationDropdown:Refresh(values, true)
        end
        if compat.state.teleport.SelectedLocation and not locationMap[compat.state.teleport.SelectedLocation] then
            compat.state.teleport.SelectedLocation = values[1]
        elseif not compat.state.teleport.SelectedLocation then
            compat.state.teleport.SelectedLocation = values[1]
        end
        return values
    end

    function compat.teleportToLocation()
        local targetCFrame = compat.state.teleport.LocationMap[compat.state.teleport.SelectedLocation]
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if targetCFrame and root then
            compat.setTeleportGhost(true)
            root.CFrame = targetCFrame
            task.delay(0.25, function()
                compat.setTeleportGhost(false)
            end)
            return true
        end
        return false
    end

    function compat.setTeleportGhost(enabled)
        if not compat.state.random.TeleportGhost then
            enabled = false
        end
        local character = LocalPlayer.Character
        if not character then
            return
        end
        for _, descendant in ipairs(character:GetDescendants()) do
            if descendant:IsA("BasePart") then
                descendant.LocalTransparencyModifier = enabled and 1 or 0
            elseif descendant:IsA("Decal") then
                descendant.Transparency = enabled and 1 or 0
            end
        end
    end

    function compat.applyPowerJump()
        local character = LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if not humanoid then
            return
        end
        local movement = compat.state.movement
        movement.DefaultJumpPower = movement.DefaultJumpPower or humanoid.JumpPower
        movement.DefaultJumpHeight = movement.DefaultJumpHeight or humanoid.JumpHeight
        if movement.InfinitePowerJump then
            if humanoid.UseJumpPower == false then
                humanoid.JumpHeight = math.clamp(movement.InfiniteJumpPower / 10, 7.2, 50)
            else
                humanoid.JumpPower = movement.InfiniteJumpPower
            end
        else
            if humanoid.UseJumpPower == false then
                humanoid.JumpHeight = movement.DefaultJumpHeight or humanoid.JumpHeight
            else
                humanoid.JumpPower = movement.DefaultJumpPower or humanoid.JumpPower
            end
        end
    end

    function compat.powerJumpFunc()
        local movement = compat.state.movement
        if movement.Connections.PowerJump then
            movement.Connections.PowerJump:Disconnect()
            movement.Connections.PowerJump = nil
        end
        compat.applyPowerJump()
        if movement.InfinitePowerJump then
            movement.Connections.PowerJump = RunService.Heartbeat:Connect(function()
                compat.applyPowerJump()
            end)
        end
    end

    function compat.walkspeedFunc()
        local movement = compat.state.movement
        if movement.Connections.WS then
            movement.Connections.WS:Disconnect()
            movement.Connections.WS = nil
        end
        if not movement.Walkspeed then
            return
        end
        movement.Connections.WS = RunService.Stepped:Connect(function()
            local character = LocalPlayer.Character
            local root = character and character:FindFirstChild("HumanoidRootPart")
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            if root and humanoid and typeof(movement.WalkspeedValue) == "number" then
                root.CFrame = root.CFrame + humanoid.MoveDirection * (16 * movement.WalkspeedValue / 10)
            end
        end)
    end

    function compat.infiniteJumpFunc()
        local movement = compat.state.movement
        if movement.Connections.JP then
            movement.Connections.JP:Disconnect()
            movement.Connections.JP = nil
        end
        if not movement.InfiniteJump then
            return
        end
        movement.Connections.JP = UserInputService.JumpRequest:Connect(function()
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            if not humanoid or movement.JumpDebounce then
                return
            end
            movement.JumpDebounce = true
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            task.delay(0.1, function()
                movement.JumpDebounce = false
            end)
        end)
    end

    function compat.noclipFunc()
        local movement = compat.state.movement
        if movement.Connections.NC then
            movement.Connections.NC:Disconnect()
            movement.Connections.NC = nil
        end
        if not movement.Noclip then
            return
        end
        movement.Connections.NC = RunService.Stepped:Connect(function()
            local character = LocalPlayer.Character
            if not character then
                return
            end
            for _, descendant in ipairs(character:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.CanCollide = false
                end
            end
        end)
    end

    function compat.ragdollAllPlayers()
        if not RagdollRemote then
            return false
        end
        for _, player in ipairs(Players:GetPlayers()) do
            if player == LocalPlayer then
                continue
            end
            local character = player.Character
            if character then
                local parts = {
                    character:FindFirstChild("HumanoidRootPart"),
                    character:FindFirstChild("Torso"),
                    character:FindFirstChild("UpperTorso"),
                    character:FindFirstChild("Head"),
                }
                for _, part in ipairs(parts) do
                    if part then
                        for _ = 1, 8 do
                            pcall(function()
                                RagdollRemote:FireServer(part, 9999999)
                            end)
                            task.wait(0.02)
                        end
                    end
                end
            end
        end
        return true
    end

    function compat.ragdollSelectedPlayers()
        if not RagdollRemote then
            return false
        end
        local affected = false
        for _, player in ipairs(compat.getSharedTargets()) do
            if player ~= LocalPlayer then
                local character = player.Character
                if character then
                    affected = true
                    for _, part in ipairs({
                        character:FindFirstChild("HumanoidRootPart"),
                        character:FindFirstChild("Torso"),
                        character:FindFirstChild("UpperTorso"),
                        character:FindFirstChild("Head"),
                    }) do
                        if part then
                            for _ = 1, 8 do
                                pcall(function()
                                    RagdollRemote:FireServer(part, 9999999)
                                end)
                                task.wait(0.02)
                            end
                        end
                    end
                end
            end
        end
        return affected
    end

    function compat.antiGrabStep()
        if not compat.state.anti.AntiGrab then
            return
        end
        local held = LocalPlayer:FindFirstChild("IsHeld")
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if held and held.Value == true and root then
            root.Anchored = true
            while compat.state.anti.AntiGrab and held.Value == true do
                CharacterEvents.Struggle:FireServer(LocalPlayer)
                task.wait(0.001)
            end
            root.Anchored = false
        end
    end

    function compat.antiExplodeStep(part)
        if not compat.state.anti.AntiExplode or not part:IsA("Part") or part.Name ~= "Part" then
            return
        end
        local character = LocalPlayer.Character
        local root = character and character:FindFirstChild("HumanoidRootPart")
        local arm = character and character:FindFirstChild("Right Arm")
        if root and arm and (part.Position - root.Position).Magnitude <= 20 then
            root.Anchored = true
            task.wait(0.01)
            while arm:FindFirstChild("RagdollLimbPart") and arm.RagdollLimbPart.CanCollide == true do
                task.wait(0.001)
            end
            root.Anchored = false
        end
    end

    function compat.antiLag()
        local character = LocalPlayer.Character
        local scripts = LocalPlayer:FindFirstChild("PlayerScripts")
        local moveScript = scripts and scripts:FindFirstChild("CharacterAndBeamMove")
        if moveScript then
            moveScript.Disabled = compat.state.anti.AntiLag
        end
    end

    function compat.removeDetectors()
        local character = LocalPlayer.Character
        local root = character and character:FindFirstChild("HumanoidRootPart")
        if not root then
            return
        end
        for _, descendant in ipairs(Workspace:GetDescendants()) do
            if descendant:IsA("BasePart")
                and (descendant.Name == "LeftDetector" or descendant.Name == "RightDetector")
                and (root.Position - descendant.Position).Magnitude > 10 then
                descendant:Destroy()
            end
        end
    end

    function compat.applyAntiMassless()
        if not compat.state.anti.AntiBlobman then
            return
        end
        local character = LocalPlayer.Character
        if not character then
            return
        end
        for _, descendant in ipairs(character:GetDescendants()) do
            if descendant:IsA("BasePart") and descendant.Massless then
                descendant.Massless = false
            end
        end
    end

    function compat.upd(dropdown, includeLocalPlayer)
        if dropdown and dropdown.Refresh then
            dropdown:Refresh(compat.getAllPlayers(includeLocalPlayer == true), true)
        end
    end

    function compat.nocoll(instance)
        for _, descendant in ipairs(instance:GetDescendants()) do
            if descendant:IsA("BasePart") then
                descendant.CanCollide = false
            end
        end
    end

    function compat.fling(rootPart, humanoid)
        compat.nocoll(rootPart.Parent)
        local velocity = Instance.new("BodyVelocity")
        velocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        velocity.Velocity = Vector3.new(0, 1000000000, 0)
        velocity.Parent = rootPart
        humanoid.Jump = true
        humanoid.Sit = false
        task.delay(3, function()
            if velocity.Parent then
                velocity:Destroy()
            end
        end)
    end

    function compat.above(player, yPosition)
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        return (not root or yPosition < root.Position.Y) and true or false
    end

    function compat.save(config)
        local character = LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            config.S = character:GetPivot()
        end
    end

    function compat.ret(config)
        local character = LocalPlayer.Character
        local root = character and character:FindFirstChild("HumanoidRootPart")
        if root and config.S and (root.Position - config.S.Position).Magnitude > config.D then
            character:PivotTo(config.S)
        end
    end

    function compat.act(player, config, shouldKill)
        if not config.E then
            return
        end
        if Workspace:FindFirstChild("PlotItems")
            and Workspace.PlotItems:FindFirstChild("PlayersInPlots")
            and Workspace.PlotItems.PlayersInPlots:FindFirstChild(player.Name) then
            return
        end

        local character = player.Character
        local root = character and character:FindFirstChild("HumanoidRootPart")
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local head = character and character:FindFirstChild("Head")
        local myCharacter = LocalPlayer.Character
        local myRoot = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")
        if not (root and humanoid and head and myCharacter and myRoot) then
            return
        end
        if humanoid.Health <= 0 or compat.above(player, config.H) then
            return
        end

        pcall(function()
            compat.save(config)
            compat.setTeleportGhost(true)
            myCharacter:PivotTo(CFrame.new(root.Position + config.Off))
            compat.nocoll(character)
            GrabEvents.SetNetworkOwner:FireServer(root, root.CFrame)
            task.wait()
            compat.ret(config)
            task.wait(0.1)
            GrabEvents.DestroyGrabLine:FireServer(root)
            task.wait(0.1)
            if head:FindFirstChild("PartOwner") and head.PartOwner.Value == LocalPlayer.Name then
                compat.fling(root, humanoid)
                if shouldKill then
                    task.wait(0.1)
                    humanoid.Health = 0
                end
            end
        end)
        compat.setTeleportGhost(false)
        task.wait(config.Del)
    end

    function compat.loop(config, shouldKill)
        compat.save(config)
        for playerName in pairs(compat.state.attack.Targets) do
            if not config.E then
                break
            end
            local player = Players:FindFirstChild(playerName)
            if player then
                compat.act(player, config, shouldKill)
            end
        end
    end

    function compat.loopCtrl(config, shouldKill)
        return RunService.Heartbeat:Connect(function()
            if config.E then
                compat.loop(config, shouldKill)
            end
        end)
    end

    function compat.stopLoop(connection, config)
        config.E = false
        if connection then
            connection:Disconnect()
        end
        config.S = nil
    end

    function compat.killGrabStep(model)
        return
    end

    function compat.onGrabAdded(grabModel)
        if grabModel.Name ~= "GrabParts" then
            return
        end
        if not compat.state.strength.Enabled and not compat.state.random.AnchorGrab then
            return
        end
        local grabPart = grabModel:FindFirstChild("GrabPart")
        local weld = grabPart and grabPart:FindFirstChild("WeldConstraint")
        local attachedPart = weld and weld.Part1
        if not attachedPart then
            return
        end
        compat.state.random.LastGrabbedObject = attachedPart.Parent and attachedPart.Parent:IsA("Model") and attachedPart.Parent or attachedPart
        local attachedCharacter = attachedPart.Parent
        local attachedHumanoid = attachedCharacter and attachedCharacter:FindFirstChildOfClass("Humanoid")
        local bodyVelocity = nil
        if attachedHumanoid then
            bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(0, 0, 0)
            bodyVelocity.Parent = attachedPart
        end
        local released = false
        local function onRelease()
            if released then
                return
            end
            released = true
            if bodyVelocity then
                local camera = Workspace.CurrentCamera
                if camera then
                    bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bodyVelocity.Velocity = camera.CFrame.LookVector * compat.state.strength.Strength
                    game:GetService("Debris"):AddItem(bodyVelocity, 1)
                end
            end
            if compat.state.random.AnchorGrab then
                task.delay(0.05, function()
                    local target = compat.state.random.LastGrabbedObject
                    local parts = nil
                    if target and target.Parent then
                        parts = target:IsA("Model") and target:GetDescendants() or { target }
                        for _, part in ipairs(parts) do
                            if part:IsA("BasePart") then
                                part.Anchored = true
                                part.AssemblyLinearVelocity = Vector3.zero
                                part.AssemblyAngularVelocity = Vector3.zero
                            end
                        end
                    end
                end)
            end
        end

        grabModel:GetPropertyChangedSignal("Parent"):Connect(function()
            if not grabModel.Parent then
                onRelease()
            end
        end)
    end

    function compat.toggleStrengthConnections(enabled)
        compat.state.strength.Enabled = enabled
        if compat.state.strength.GrabConn then
            compat.state.strength.GrabConn:Disconnect()
            compat.state.strength.GrabConn = nil
        end
        if enabled then
            compat.state.strength.GrabConn = Workspace.ChildAdded:Connect(compat.onGrabAdded)
        end
    end

    function compat.spawnToy(itemName, position)
        task.spawn(function()
            local remote = MenuToys:FindFirstChild("SpawnToyRemoteFunction")
            if remote then
                pcall(function()
                    remote:InvokeServer(itemName, CFrame.new(position), Vector3.new())
                end)
            end
        end)
    end

    function compat.updateSnowballDropdown()
        local dropdown = compat.state.snowball.Dropdown
        if dropdown and dropdown.Refresh then
            dropdown:Refresh(compat.getAllPlayers(false), true)
        end
    end

    function compat.spawnBallsStep()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            compat.spawnToy("BallSnowball", root.Position + Vector3.new(0, 2, 0))
        end
    end

    function compat.tpBallStep()
        local folder = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
        local targets = compat.getPlayersFromNames(compat.state.snowball.Targets, compat.state.snowball.TargetPlayer)
        if not folder or #targets == 0 then
            return
        end
        local roots = {}
        for _, player in ipairs(targets) do
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                table.insert(roots, root)
            end
        end
        if #roots == 0 then
            return
        end
        local rootIndex = 1
        for _, child in ipairs(folder:GetChildren()) do
            if child:IsA("Model") and child.Name == "BallSnowball" then
                local targetRoot = roots[rootIndex]
                rootIndex = rootIndex % #roots + 1
                for _, descendant in ipairs(child:GetDescendants()) do
                    if descendant:IsA("BasePart") then
                        descendant.Position = targetRoot.Position
                    end
                end
            end
        end
    end

    function compat.autoBlobStep()
        compat.state.snowball.RagdollTargets = {}
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.SeatPart and humanoid.SeatPart.Parent and humanoid.SeatPart.Parent.Name == "CreatureBlobman" then
                    table.insert(compat.state.snowball.RagdollTargets, player)
                    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        compat.spawnToy("BallSnowball", root.Position + Vector3.new(0, 2, 0))
                    end
                end
            end
        end
    end

    function compat.tpSnowStep()
        local folder = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
        if not folder then
            return
        end
        for _, player in ipairs(compat.state.snowball.RagdollTargets) do
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                for _, child in ipairs(folder:GetChildren()) do
                    if child:IsA("Model") and child.Name == "BallSnowball" then
                        for _, descendant in ipairs(child:GetDescendants()) do
                            if descendant:IsA("BasePart") then
                                descendant.Position = root.Position
                            end
                        end
                    end
                end
            end
        end
    end

    function compat.teleportToPlayer()
        local playerName = compat.state.teleport.SelectedPlayer
        if not playerName then
            return false
        end
        local target = Players:FindFirstChild(playerName)
        local targetRoot = target and target.Character and target.Character:FindFirstChild("HumanoidRootPart")
        local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if targetRoot and myRoot then
            compat.setTeleportGhost(true)
            myRoot.CFrame = CFrame.new(targetRoot.Position)
            task.delay(0.25, function()
                compat.setTeleportGhost(false)
            end)
            return true
        end
        return false
    end

    function compat.startLoopTeleport()
        compat.state.teleport.Enabled = true
        compat.state.teleport.LoopThread = task.spawn(function()
            while compat.state.teleport.Enabled do
                compat.teleportToPlayer()
                task.wait(0.02)
            end
        end)
    end

    function compat.stopLoopTeleport()
        compat.state.teleport.Enabled = false
        compat.state.teleport.LoopThread = nil
    end

    function compat.lagStep()
        if not compat.state.random.LagEnabled then
            return
        end
        for _ = 1, compat.state.random.LagIntensity do
            for _, player in ipairs(Players:GetPlayers()) do
                local torso = player.Character and player.Character:FindFirstChild("Torso")
                if torso then
                    GrabEvents.CreateGrabLine:FireServer(torso, torso.CFrame)
                end
            end
        end
    end

    function compat.getMountedBlobman()
        local character = LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.SeatPart and humanoid.SeatPart.Parent and humanoid.SeatPart.Parent.Name == "CreatureBlobman" then
            return humanoid.SeatPart.Parent
        end
        return nil
    end

    function compat.findGroundBelow(position)
        local params = RaycastParams.new()
        params.FilterDescendantsInstances = { LocalPlayer.Character }
        params.FilterType = Enum.RaycastFilterType.Blacklist
        local result = Workspace:Raycast(position + Vector3.new(0, 50, 0), Vector3.new(0, -400, 0), params)
        return result and result.Position or position
    end

    function compat.findExistingBlobman()
        local folder = Workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
        return folder and folder:FindFirstChild("CreatureBlobman") or nil
    end

    function compat.spawnBlobman()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not root then
            return nil
        end
        local spawnCf = CFrame.new(compat.findGroundBelow(root.Position) + Vector3.new(0, 3, 0))
        pcall(function()
            ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer("CreatureBlobman", spawnCf, Vector3.new(0, 59.667, 0))
        end)
        local folderName = LocalPlayer.Name .. "SpawnedInToys"
        for _ = 1, 30 do
            local folder = Workspace:FindFirstChild(folderName)
            local blobman = folder and folder:FindFirstChild("CreatureBlobman")
            if blobman then
                compat.state.blobman.CurrentBlobman = blobman
                return blobman
            end
            task.wait(0.15)
        end
        return nil
    end

    function compat.seatOnBlobman(blobman)
        local character = LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local root = character and character:FindFirstChild("HumanoidRootPart")
        local seat = blobman and blobman:FindFirstChild("VehicleSeat")
        if humanoid and root and seat and seat:IsA("VehicleSeat") then
            root.CFrame = seat.CFrame + Vector3.new(0, 2, 0)
            pcall(function()
                seat:Sit(humanoid)
            end)
            task.wait(0.25)
        end
    end

    function compat.teleportBlobman(blobman, position)
        if not (blobman and blobman.PrimaryPart) then
            return
        end
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not root then
            return
        end
        local mover = Instance.new("BodyPosition")
        mover.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        mover.P = 100000
        mover.Position = position
        mover.Parent = blobman.PrimaryPart
        pcall(function()
            root.CFrame = CFrame.new(position)
            blobman:SetPrimaryPartCFrame(CFrame.new(position))
        end)
        task.wait(0.1)
        if mover.Parent then
            mover:Destroy()
        end
    end

    function compat.addBlobmanTarget(name)
        local clean = typeof(name) == "string" and name:match("^%s*(.-)%s*$") or ""
        local player = Players:FindFirstChild(clean)
        if player then
            compat.state.blobman.TargetList[player.UserId] = player.Name
            return true
        end
        return false
    end

    function compat.removeBlobmanTarget(name)
        local clean = typeof(name) == "string" and name:match("^%s*(.-)%s*$") or ""
        local player = Players:FindFirstChild(clean)
        if player then
            compat.state.blobman.TargetList[player.UserId] = nil
            return true
        end
        return false
    end

    function compat.blobGrabPlayerCompat(player, blobman)
        if AllunFunctions.blobGrabPlayer then
            pcall(function()
                AllunFunctions.blobGrabPlayer(player, blobman)
            end)
            return
        end
        local root = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        local leftDetector = blobman and blobman:FindFirstChild("LeftDetector")
        local rightDetector = blobman and blobman:FindFirstChild("RightDetector")
        local blobScript = blobman and blobman:FindFirstChild("BlobmanSeatAndOwnerScript")
        local remote = blobScript and blobScript:FindFirstChild("CreatureGrab")
        if not (root and remote) then
            return
        end
        if compat.state.blobman.BlobAlter ~= 1 then
            local weld = rightDetector and rightDetector:FindFirstChild("RightWeld")
            if rightDetector and weld then
                remote:FireServer(rightDetector, root, weld)
                compat.state.blobman.BlobAlter = 1
            end
        else
            local weld = leftDetector and leftDetector:FindFirstChild("LeftWeld")
            if leftDetector and weld then
                remote:FireServer(leftDetector, root, weld)
                compat.state.blobman.BlobAlter = 2
            end
        end
    end

    function compat.attemptTeleportAndGrab(player, blobman, returnPos, dist)
        local maxDist = dist or 20
        local root = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not (player and blobman and returnPos and root) then
            return false
        end
        if compat.state.blobman.OriginPos and (root.Position - compat.state.blobman.OriginPos).Magnitude > compat.state.blobman.MaxTeleportDist then
            return false
        end
        if (root.Position - returnPos).Magnitude <= maxDist then
            compat.blobGrabPlayerCompat(player, blobman)
            task.wait(0.1)
            return true
        end
        compat.teleportBlobman(blobman, root.Position + Vector3.new(0, 2, 0))
        task.wait(0.2)
        compat.blobGrabPlayerCompat(player, blobman)
        task.wait(0.2)
        compat.teleportBlobman(blobman, returnPos)
        task.wait(0.2)
        return player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            and (player.Character.HumanoidRootPart.Position - returnPos).Magnitude <= maxDist
            or false
    end

    function compat.blobDropAndRegrabCycle(player, blobman, origin)
        if not (player and player.Character and blobman and blobman.Parent) then
            return
        end
        local root = player.Character:FindFirstChild("HumanoidRootPart")
        local blobScript = blobman:FindFirstChild("BlobmanSeatAndOwnerScript")
        local dropRemote = blobScript and blobScript:FindFirstChild("CreatureDrop")
        if not (root and dropRemote) then
            return
        end
        for i = 1, 4 do
            if not compat.state.blobman.ToggleEnabled then
                break
            end
            compat.teleportBlobman(blobman, (origin or Vector3.new()) + Vector3.new(0, 10 * i, 0))
            task.wait(0.1)
            local left = blobman:FindFirstChild("LeftDetector")
            local right = blobman:FindFirstChild("RightDetector")
            local leftJoint = left and (left:FindFirstChild("RigidConstraint") or left:FindFirstChild("LeftWeld"))
            local rightJoint = right and (right:FindFirstChild("RightWeld") or right:FindFirstChild("RigidConstraint"))
            if leftJoint then
                pcall(function()
                    dropRemote:FireServer(leftJoint, root)
                end)
            end
            if rightJoint then
                pcall(function()
                    dropRemote:FireServer(rightJoint, root)
                end)
            end
            task.wait(0.1)
            compat.blobGrabPlayerCompat(player, blobman)
            task.wait(0.1)
        end
    end

    function compat.masterLoop()
        if compat.state.blobman.MasterRunning then
            return
        end
        compat.state.blobman.MasterRunning = true
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            compat.state.blobman.OriginPos = root.Position
        end
        task.spawn(function()
            while compat.state.blobman.ToggleEnabled do
                if not compat.state.blobman.CurrentBlobman or not compat.state.blobman.CurrentBlobman.Parent then
                    compat.state.blobman.CurrentBlobman = compat.findExistingBlobman() or compat.spawnBlobman()
                end
                if compat.state.blobman.CurrentBlobman and compat.getMountedBlobman() ~= compat.state.blobman.CurrentBlobman then
                    compat.seatOnBlobman(compat.state.blobman.CurrentBlobman)
                end
                local blobman = compat.getMountedBlobman()
                local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if blobman and myRoot then
                    local origin = myRoot.Position
                    for userId in pairs(compat.state.blobman.TargetList) do
                        if not compat.state.blobman.ToggleEnabled then
                            break
                        end
                        local player = Players:GetPlayerByUserId(userId)
                        local targetRoot = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        if targetRoot and (targetRoot.Position - origin).Magnitude <= compat.state.blobman.MaxTeleportDist then
                            if (targetRoot.Position - origin).Magnitude <= 20 then
                                compat.blobGrabPlayerCompat(player, blobman)
                                task.wait(_G.BlobmanDelay or 0.1)
                                pcall(function()
                                    compat.blobDropAndRegrabCycle(player, blobman, origin)
                                end)
                            else
                                compat.attemptTeleportAndGrab(player, blobman, origin, 20)
                            end
                        end
                    end
                end
                task.wait(0.25)
            end
            compat.state.blobman.MasterRunning = false
        end)
    end

    function compat.godLoopTargetStep()
        local blobman = compat.getMountedBlobman()
        if not blobman then
            return
        end
        for userId in pairs(compat.state.blobman.TargetList) do
            if userId ~= LocalPlayer.UserId then
                local player = Players:GetPlayerByUserId(userId)
                local root = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    compat.blobGrabPlayerCompat(player, blobman)
                end
            end
        end
    end

    function compat.hoverFollowTargetStep()
        local blobman = compat.getMountedBlobman()
        local selectedTargets = compat.getPlayersFromNames(compat.state.attack.Targets, compat.state.blobman.SelectedPlayer)
        local target = selectedTargets[1]
        local targetRoot = target and target.Character and target.Character:FindFirstChild("HumanoidRootPart")
        local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if blobman and targetRoot and myRoot and (myRoot.Position - targetRoot.Position).Magnitude <= compat.state.blobman.HoverDistance then
            compat.teleportBlobman(blobman, targetRoot.Position + Vector3.new(0, compat.state.blobman.HoverHeight, 0))
        end
    end

    function compat.startAirSuspendAura()
        compat.state.aura.LaunchEnabled = true
        if compat.state.aura.LaunchThread then
            return
        end
        compat.state.aura.LaunchThread = task.spawn(function()
            while compat.state.aura.LaunchEnabled do
                local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            local torso = player.Character:FindFirstChild("Torso")
                            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                            if torso and hrp and (torso.Position - root.Position).Magnitude <= compat.state.aura.Radius then
                                pcall(function()
                                    GrabEvents.SetNetworkOwner:FireServer(torso, hrp:FindFirstChild("FirePlayerPart") and hrp.FirePlayerPart.CFrame or torso.CFrame)
                                end)
                                task.wait(0.1)
                                local velocity = torso:FindFirstChild("CompatLaunchVelocity") or Instance.new("BodyVelocity")
                                velocity.Name = "CompatLaunchVelocity"
                                velocity.Velocity = Vector3.new(0, 200000000000, 0)
                                velocity.MaxForce = Vector3.new(0, math.huge, 0)
                                velocity.Parent = torso
                            end
                        end
                    end
                end
                task.wait(0.02)
            end
            compat.state.aura.LaunchThread = nil
        end)
    end

    function compat.stopAirSuspendAura()
        compat.state.aura.LaunchEnabled = false
    end

    function compat.startHellSendAura()
        compat.state.aura.TelekinesisEnabled = true
        if compat.state.aura.TeleThread then
            return
        end
        compat.state.aura.TeleThread = task.spawn(function()
            while compat.state.aura.TelekinesisEnabled do
                local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local camera = Workspace.CurrentCamera
                if root and camera then
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            local torso = player.Character:FindFirstChild("Torso")
                            if torso and (torso.Position - root.Position).Magnitude <= compat.state.aura.Radius then
                                GrabEvents.SetNetworkOwner:FireServer(torso, root.CFrame)
                                for _, descendant in ipairs(player.Character:GetDescendants()) do
                                    if descendant:IsA("BasePart") then
                                        descendant.CanCollide = false
                                    end
                                end
                                local pos = torso:FindFirstChild("HellAuraPos") or Instance.new("BodyPosition")
                                pos.Name = "HellAuraPos"
                                pos.MaxForce = Vector3.new(100000, 100000, 100000)
                                pos.D = 500
                                pos.P = 50000
                                pos.Parent = torso
                                local gyro = torso:FindFirstChild("HellAuraGyro") or Instance.new("BodyGyro")
                                gyro.Name = "HellAuraGyro"
                                gyro.MaxTorque = Vector3.new(100000, 100000, 100000)
                                gyro.D = 500
                                gyro.P = 50000
                                gyro.Parent = torso
                                pos.Position = root.Position + camera.CFrame.LookVector * 15 + Vector3.new(0, 5, 0)
                                gyro.CFrame = CFrame.new(torso.Position, root.Position)
                            end
                        end
                    end
                end
                task.wait(0.05)
            end
            compat.state.aura.TeleThread = nil
        end)
    end

    function compat.stopHellSendAura()
        compat.state.aura.TelekinesisEnabled = false
    end

    function compat.deathAuraStep()
        local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not myRoot then
            return
        end
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local root = player.Character:FindFirstChild("HumanoidRootPart")
                local head = player.Character:FindFirstChild("Head")
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if root and head and humanoid and humanoid.Health > 0 and (root.Position - myRoot.Position).Magnitude <= compat.state.aura.Radius then
                    pcall(function()
                        GrabEvents.SetNetworkOwner:FireServer(root, root.CFrame)
                        task.wait(0.1)
                        GrabEvents.DestroyGrabLine:FireServer(root)
                        if head:FindFirstChild("PartOwner") and head.PartOwner.Value == LocalPlayer.Name then
                            for _, child in ipairs(humanoid.Parent:GetChildren()) do
                                if child:IsA("BasePart") then
                                    child.CFrame = CFrame.new(-1000000000, 1000000000, -1000000000)
                                end
                            end
                            local velocity = Instance.new("BodyVelocity")
                            velocity.Velocity = Vector3.new(0, -9999999, 0)
                            velocity.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
                            velocity.P = 100000075
                            velocity.Parent = root
                            humanoid.Sit = false
                            humanoid.Jump = true
                            humanoid.BreakJointsOnDeath = false
                            humanoid:ChangeState(Enum.HumanoidStateType.Dead)
                            task.delay(2, function()
                                if velocity.Parent then
                                    velocity:Destroy()
                                end
                            end)
                        end
                    end)
                end
            end
        end
    end

    function compat.freezeCamera()
        local camera = Workspace.CurrentCamera
        if not camera then
            return
        end
        compat.state.random.FrozenCameraCFrame = camera.CFrame
        compat.state.random.CameraBlock.CFrame = camera.CFrame
        compat.state.random.CameraBlock.Parent = Workspace
        camera.CameraType = Enum.CameraType.Scriptable
        camera.CFrame = compat.state.random.FrozenCameraCFrame
    end

    function compat.unfreezeCamera()
        compat.state.random.CameraBlock.Parent = nil
        local camera = Workspace.CurrentCamera
        if camera then
            camera.CameraType = Enum.CameraType.Custom
            local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                camera.CameraSubject = humanoid
            end
            if compat.state.random.FrozenCameraCFrame then
                camera.CFrame = compat.state.random.FrozenCameraCFrame
            end
        end
        compat.state.random.FrozenCameraCFrame = nil
    end

    function compat.bringNoCollide(model)
        for _, descendant in ipairs(model:GetDescendants()) do
            if descendant:IsA("BasePart") then
                descendant.CanCollide = false
            end
        end
    end

    function compat.playerInPlot(player)
        local plotItems = Workspace:FindFirstChild("PlotItems")
        local playersInPlots = plotItems and plotItems:FindFirstChild("PlayersInPlots")
        return playersInPlots and playersInPlots:FindFirstChild(player.Name) ~= nil
    end

    function compat.playerIgnored(player)
        return player == LocalPlayer
            or (compat.state.random.BringAllFriends and LocalPlayer:IsFriendsWith(player.UserId))
    end

    function compat.rebuildBringQueue()
        compat.state.random.BringQueue = {}
        for _, player in ipairs(Players:GetPlayers()) do
            if not compat.playerIgnored(player) and player.Character and not compat.playerInPlot(player) then
                local root = player.Character:FindFirstChild("HumanoidRootPart")
                if root and compat.state.random.BringOrigin and (root.Position - compat.state.random.BringOrigin).Magnitude > compat.state.random.BringRadius then
                    table.insert(compat.state.random.BringQueue, player)
                end
            end
        end
    end

    function compat.bringNextStep()
        if #compat.state.random.BringQueue == 0 then
            compat.rebuildBringQueue()
            if #compat.state.random.BringQueue == 0 then
                return
            end
        end
        local player = table.remove(compat.state.random.BringQueue, 1)
        local targetRoot = player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        local targetHead = player and player.Character and player.Character:FindFirstChild("Head")
        local myCharacter = LocalPlayer.Character
        local myRoot = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")
        if targetRoot and targetHead and myCharacter and myRoot then
            myCharacter:PivotTo(targetRoot.CFrame * CFrame.new(0, -6, 0))
            compat.bringNoCollide(myCharacter)
            local tries = 0
            repeat
                GrabEvents.SetNetworkOwner:FireServer(targetRoot, myRoot.CFrame)
                task.wait(0.15)
                tries = tries + 1
            until tries > 20
                or (targetHead:FindFirstChild("PartOwner") and targetHead.PartOwner.Value == LocalPlayer.Name)
                or not compat.state.random.BringAll
            if compat.state.random.BringAll and targetHead:FindFirstChild("PartOwner") and targetHead.PartOwner.Value == LocalPlayer.Name then
                targetRoot.CFrame = CFrame.new(compat.state.random.BringOrigin)
                targetRoot.Position = compat.state.random.BringOrigin
                targetRoot.AssemblyLinearVelocity = Vector3.zero
                task.wait(0.8)
            end
        end
    end

    function compat.startBringAll()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not root then
            return
        end
        compat.state.random.BringAll = true
        compat.state.random.BringOrigin = root.Position
        compat.rebuildBringQueue()
        compat.freezeCamera()
        compat.setTeleportGhost(true)
        if compat.state.random.BringThread then
            return
        end
        compat.state.random.BringThread = RunService.Heartbeat:Connect(function()
            if compat.state.random.BringAll then
                compat.bringNextStep()
                local camera = Workspace.CurrentCamera
                if camera and compat.state.random.FrozenCameraCFrame then
                    camera.CameraType = Enum.CameraType.Scriptable
                    camera.CFrame = compat.state.random.FrozenCameraCFrame
                    compat.state.random.CameraBlock.CFrame = compat.state.random.FrozenCameraCFrame
                    compat.state.random.CameraBlock.Parent = Workspace
                end
            end
        end)
    end

    function compat.stopBringAll()
        compat.state.random.BringAll = false
        if compat.state.random.BringThread then
            compat.state.random.BringThread:Disconnect()
            compat.state.random.BringThread = nil
        end
        compat.unfreezeCamera()
        compat.setTeleportGhost(false)
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root and compat.state.random.BringOrigin then
            root.AssemblyLinearVelocity = Vector3.zero
            root.CFrame = CFrame.new(compat.state.random.BringOrigin)
        end
    end

    function compat.findHeldPlayer()
        local grabParts = Workspace:FindFirstChild("GrabParts")
        if not grabParts then
            return nil
        end
        for _, child in ipairs(grabParts:GetChildren()) do
            if child:IsA("BasePart") then
                for _, descendant in ipairs(child:GetChildren()) do
                    if descendant:IsA("WeldConstraint") and descendant.Part1 and descendant.Part1.Parent:IsA("Model") then
                        local model = descendant.Part1.Parent
                        if model:FindFirstChildOfClass("Humanoid") then
                            return Players:GetPlayerFromCharacter(model)
                        end
                    end
                end
            end
        end
        return nil
    end

    function compat.teleportLimbParts(player)
        local character = player and player.Character
        if not character then
            return
        end
        local disabled = {}
        for _, partName in ipairs(compat.state.limbs.Parts) do
            local part = character:FindFirstChild(partName)
            if part then
                for _, descendant in ipairs(Workspace:GetDescendants()) do
                    if descendant:IsA("WeldConstraint") and (descendant.Part0 == part or descendant.Part1 == part) then
                        descendant.Enabled = false
                        table.insert(disabled, descendant)
                    end
                end
                for _, child in ipairs(part:GetChildren()) do
                    if child:IsA("Motor6D") or child:IsA("Weld") then
                        child.Enabled = false
                        table.insert(disabled, child)
                    end
                end
                part.Anchored = false
                part.CFrame = CFrame.new(Vector3.new(part.Position.X, compat.state.limbs.FallenPartsDestroyHeight - 100, part.Position.Z))
                task.wait(0.1)
            end
        end
        for _, item in ipairs(disabled) do
            item.Enabled = true
        end
    end

    function compat.deleteHeldPlayerLimbs()
        local held = compat.findHeldPlayer()
        if held then
            compat.teleportLimbParts(held)
        end
    end

    function compat.checkShutdown(url)
        local targetUrl = url or "https://raw.githubusercontent.com/Jeffepicy/yeah/refs/heads/main/yeah"
        local ok, response = pcall(function()
            return game:HttpGet(targetUrl)
        end)
        if not ok or not response then
            return false, nil
        end
        local decoded = nil
        pcall(function()
            decoded = HttpService:JSONDecode(response)
        end)
        return decoded == true, decoded
    end

    Players.PlayerAdded:Connect(function()
        compat.refreshRegisteredDropdowns()
        compat.updateSnowballDropdown()
        compat.refreshTeleportLocations()
    end)

    Players.PlayerRemoving:Connect(function(player)
        compat.refreshRegisteredDropdowns()
        compat.updateSnowballDropdown()
        compat.refreshTeleportLocations()
        if compat.state.random.LeaveNotify then
            compat.notify("Player Left", player.Name .. " left the server.", 4)
        end
    end)

    LocalPlayer.CharacterAdded:Connect(function()
        task.defer(function()
            compat.refreshTeleportLocations()
            compat.refreshToyDropdowns()
            compat.ensureBoardConnection()
            if compat.state.camera.SecondPerson then
                LocalPlayer.CameraMaxZoomDistance = 99999
                LocalPlayer.CameraMode = Enum.CameraMode.Classic
            end
        end)
    end)

    Workspace.ChildAdded:Connect(function(child)
        compat.antiExplodeStep(child)
        compat.killGrabStep(child)
        compat.onGrabAdded(child)
    end)

    compat.refreshTeleportLocations()
    compat.ensureBoardConnection()
    task.delay(2, compat.refreshToyDropdowns)

    AllunFunctions.CosmicCompatibility = compat
end

do
    local exported = AllunFunctions or {}
    local compat = exported.CosmicCompatibility or {}
    local visuals = exported.Visuals or {}
    local merged = exported.MergedHub or {}
    local env = getgenv and getgenv() or _G

    local importedFunctionNames = {
        "GetKey", "ActionEvent", "Type", "showNotification", "IsSolara", "WaitForAttribute", "CheckToyLimit",
        "IsMobile", "checkadminData", "SpawnToy", "getGroupRank", "isAuthorized", "IsHoldingAdminPlayer",
        "WhatIsHolding", "tableAlphabeticOrder", "refreshPlayerList", "refreshStringList", "updatePlayerList",
        "lookAt", "onSpawnToyAction", "teleportfunc", "onTeleportAction", "isPlayerWhitelisted",
        "startFloating", "toggleNoclip", "countToys", "CheckNetworkOwnerShipOnPlayer",
        "CheckNetworkOwnerShipPermanentOnPlayer", "CheckNetworkOwnerShipOnPart", "SNOWship",
        "IsPlayerInsideSafeZone", "IsPlayerFloating", "CheckPlayerVelocity", "SNOWshipOnce",
        "SNOWshipOnceAndCheck", "SNOWshipTrack", "SNOWshipOnceAndDelete", "SNOWshipPlayer",
        "SNOWshipPermanentPlayer", "GetPlayerCharacter", "ChangeActivityPriority", "TeleportPlayer",
        "GetPlayerCFrame", "GetPlayerRoot", "GetPlayerHRPByName", "Getdistancefromcharacter", "anchorobjecteffect",
        "autosetownership", "ChangeSBstate", "DisconnectObject", "unAnchorObject", "setanchorObject",
        "anchorfunc", "anchorobject", "updateAnchoredGroup", "IsHoldingAnchoredPart",
        "IsHoldingPrimaryCompiledObject", "CreateNoCollisionConstraintsCompile", "IsInCompileGroup",
        "CheckPrimaryPartOnCompileGroup", "ObjectStateBillboardGUI", "RemoveCompileGroup",
        "RemoveGroupCompileFromName", "CountCompileGroups", "updateCompileGroupsDropdown", "checkAnchoredParts",
        "fireBombs", "GodModeFTry", "makeCharacterNotGrabbable", "makeCharacterGrabbable",
        "controlcreatureeffectIn", "controlcreatureeffectOut", "controlCreature", "controlBindF", "controlBind",
        "checkPowerRequirement", "DevJoinEffect", "mute", "processCommand", "handleChatMessage",
        "SetModelProperties", "SetAimPart", "SetKunaiToyAntiKick", "IsItemInPlayerPlot",
        "GetTeslaCoilFromPlayerPlot", "CheckObjectsAroundPlayer", "findSprayCan", "getSprayCan",
        "applySprayCanEffect", "CheckIfKunaiIsOnPlayer", "CheckIfPlayerIsHoldingFood", "CheckKunai", "GetKunai",
        "isToyEdibleOrHoldable", "findFoodBanana", "getBananaModel", "setBananaModelProperties",
        "checkHoldFirePart", "getHoldFirePart", "findCampfire", "getCampfire", "handleCampfireTouch",
        "CheckFakeAim", "GetFakeAim", "GetFakeAim2", "findCreatureBlobman", "getLastBlobmanSeat",
        "PerspectiveOnEffect", "PerspectiveOffEffect", "togglePerspectiveEffects", "buttonClicked",
        "buttonClickedDE", "toggleButtonState", "toggleDefaultExtendButtons", "runButtonClickedLoop",
        "runButtonClickedDELoop", "findNearestPlayer", "calculateDirectionalVector", "areAllSlotsNeon",
        "saveCharacterPosition", "teleportToLocation", "updateTimeInHouseLabel", "GetPlotModel", "ClaimPlot",
        "UpdatePlotOwner", "IsThereOwnerOnPlot", "UpdatePeopleInPlot", "ExplodeSb", "checkSize", "checkSnowBall",
        "holdOwnership", "CountGrownSnowsballs", "modify", "newSnowball", "GetAimMissile", "ExplodeBomb",
        "ExplodeByTargetMode", "ExplodeFirstBomb", "ExplodeAllAtOnce", "lockCamera", "GrabPartFake",
        "isPlayerSeatedInBlobman", "IsPlayerKickingWithBlobman", "CheckPlayer", "CheckPlayerForLoopKill",
        "CheckPlayerAuras", "CheckPlayerAurasKick", "CheckPlayerAnnoyAll", "CheckPlayerKill", "CheckPlayerKick",
        "CheckPlayerBring", "CreateSkyVelocity", "CreateBringBody", "unAnchorAll", "SetCollisionObjectOff",
        "SetCollisionObjectOn", "SpiralFormulaCalculation", "CreateKickPhysical", "FreezeCam", "unFreezeCam",
        "antivoidmesssage", "ESPIconCreation", "CreateIconOnPlayer", "teleportplayerfunctionoffset",
        "checkBlobmanSeat", "CountRealNumberPlayersInLoop", "IsThereAnyPlayersInLoopAlive", "ResetCharacterStats",
        "verifyPlayerinBlobmanHand", "handleCreatureGrab", "blobmangraball", "IsReallyBeingHeld",
        "checkIfPlayerInRagdollAntiExplosion", "setMasslessFalse", "enforceMasslessFalse", "reconnect",
        "CanRemoveStickyPart", "PlayerRemoving_Added",
    }

    exported.ImportedFunctionNames = importedFunctionNames

    local function resolveImportedFunction(functionName)
        local candidates = {
            exported[functionName],
            exported.LegacyRuntime and exported.LegacyRuntime[functionName],
            compat[functionName],
            visuals[functionName],
            merged[functionName],
            env[functionName],
            rawget(_G, functionName),
        }

        for _, candidate in ipairs(candidates) do
            if type(candidate) == "function" then
                return candidate
            end
        end
    end

    local function installImportedCompatibility()
        local resolved = {}
        local missing = {}

        for _, functionName in ipairs(importedFunctionNames) do
            local implementation = resolveImportedFunction(functionName)
            if implementation then
                exported[functionName] = implementation
                resolved[functionName] = implementation
                env[functionName] = implementation
            else
                table.insert(missing, functionName)
            end
        end

        exported.ImportedCompatibility = resolved
        exported.MissingImportedFunctions = missing
    end

    exported.InstallImportedCompatibility = installImportedCompatibility
    installImportedCompatibility()
end

do
    local exported = AllunFunctions or {}
    local function createUiStub(library)
        local control = {}
        function control:AddColorpicker(...) return self end
        function control:AddColorPicker(...) return self end
        function control:AddKeyPicker(...) return self end
        function control:AddBind(...) return self end
        function control:AddLabel(...) return self end
        function control:AddParagraph(...) return self end
        function control:Set(...) return self end
        function control:SetValue(...) return self end
        function control:Refresh(...) return self end

        local container = nil
        container = setmetatable({}, {
            __index = function(_, key)
                if key == 'AddToggle' or key == 'AddButton' or key == 'AddDropdown' or key == 'AddSlider' or key == 'AddTextbox' or key == 'AddColorpicker' or key == 'AddColorPicker' or key == 'AddLabel' or key == 'AddParagraph' or key == 'AddBind' or key == 'AddKeyPicker' then
                    return function() return control end
                end
                if key == 'AddSection' or key == 'AddFolder' or key == 'AddTab' or key == 'MakeTab' or key == 'MakeWindow' then
                    return function() return container end
                end
                if key == 'MakeNotification' then
                    return function(_, data)
                        if library and library.Notify then
                            library:Notify(tostring((type(data) == 'table' and (data.Content or data.Name)) or data or 'Allun'), (type(data) == 'table' and data.Time) or 3)
                        end
                    end
                end
                if key == 'Init' then
                    return function() end
                end
                return function() return container end
            end,
        })

        return container
    end

    local runtimeSource = [====[
-- leaked by vhck
game.Players.LocalPlayer:SetAttribute("RG", "YJMZg8bAH8")


getgenv().d84jdnmasjdh43d = true
local playersService = game:GetService("Players")
function GetKey()
    if playersService.LocalPlayer:GetAttribute("RG") == "YJMZg8bAH8" then
        return "Xana"
    end
end

local orionXHub = __allunUiStub
local debrisService = game:GetService("Debris")
local workspaceService = game:GetService("Workspace")
local lightingService = game:GetService("Lighting")
local tweenService = game:GetService("TweenService")
local userInputService = game:GetService("UserInputService")
local replicatedStorageService = game:GetService("ReplicatedStorage")
local replicatedFirstService = game:GetService("ReplicatedFirst")
local contextActionService = game:GetService("ContextActionService")
local runService = game:GetService("RunService")
local virtualUserService = game:GetService("VirtualUser")
local characterEventsFolder = replicatedStorageService:WaitForChild("CharacterEvents")
local localPlayer = playersService.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")
localPlayer:GetMouse()
local spawnedInToysFolder = workspaceService:WaitForChild(localPlayer.Name .. "SpawnedInToys")
local isInPlotValue = localPlayer:WaitForChild("InPlot")
local toysLimitCapValue = localPlayer:WaitForChild("ToysLimitCap")
local usedToyPointsValue = localPlayer:WaitForChild("UsedToyPoints")
SpawnToyRF = replicatedStorageService:WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction")
DeleteToyRE = replicatedStorageService:WaitForChild("MenuToys"):WaitForChild("DestroyToy")
BuyToy = replicatedStorageService:WaitForChild("MenuToys"):WaitForChild("BuyToyRemoteFunction")
BombEvents = replicatedStorageService:WaitForChild("BombEvents")
function ActionEvent(actionName, actionState)
    local controlsGui = playerGui:FindFirstChild("ControlsGui")
    local actionEvent = controlsGui and controlsGui:FindFirstChild("ActionEvent")
    if actionEvent then
        actionEvent:Fire(actionName, actionState)
    end
end
typeAnimation = replicatedFirstService.Typing.Type
flailAnimation = replicatedFirstService.ThrowPlayers.Flail
local createGrabLineEvent = replicatedStorageService:WaitForChild("GrabEvents"):WaitForChild("CreateGrabLine")
local destroyGrabLineEvent = replicatedStorageService:WaitForChild("GrabEvents"):WaitForChild("DestroyGrabLine")
local setNetworkOwnerEvent = replicatedStorageService:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
local extendGrabLineRemoteEvent = replicatedStorageService:WaitForChild("GrabEvents"):WaitForChild("ExtendGrabLine")
local ragdollRemoteEvent = characterEventsFolder:WaitForChild("RagdollRemote")
ChatTypingBoard = characterEventsFolder:WaitForChild("ChatTyping")
local sayMessageRequestEvent
if replicatedStorageService:FindFirstChild("DefaultChatSystemChatEvents") and replicatedStorageService.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest") then
    sayMessageRequestEvent = replicatedStorageService.DefaultChatSystemChatEvents.SayMessageRequest
else
    sayMessageRequestEvent = nil
end
local updateLineColorsEvent = replicatedStorageService:WaitForChild("DataEvents"):WaitForChild("UpdateLineColorsEvent")
local isHeldValue = localPlayer:WaitForChild("IsHeld")
local playerScriptsFolder = localPlayer:WaitForChild("PlayerScripts")
local heldObjectName = nil
local struggleEvent = characterEventsFolder:WaitForChild("Struggle")
anticreatelinelocalscript = playerScriptsFolder:WaitForChild("CharacterAndBeamMove")

function Type(data)
    sayMessageRequestEvent:FireServer(data, "All")
end
local function showNotification(notificationContent)
    orionXHub:MakeNotification({
        Name = "Allun",
        Content = notificationContent,
        Image = "rbxassetid://16570630989",
        Time = 5
    })
end
function IsSolara()
    if getexecutorname then
        local executorName = getexecutorname()
        if executorName and string.find(executorName, "Solara") then
            return true
        end
    end
end
function WaitForAttribute(attributeInstance, attributeName, duration)
    local startTime = os.clock()
    local timeoutDuration = duration or 10
    while timeoutDuration > os.clock() - startTime do
        game:GetService("RunService").Heartbeat:Wait()
        if attributeInstance:GetAttribute(attributeName) ~= nil then
            break
        end
    end
    return attributeInstance:GetAttribute(attributeName)
end
function CheckToyLimit(delay, condition, data)
    local additionalPoints = delay or 0
    local isOverLimit = (usedToyPointsValue.Value + additionalPoints) / toysLimitCapValue.Value > 1
    if condition and typeof(data) == "table" then
        local spawnedToysFolder = spawnedInToysFolder
        local iteratorFunction, childrenIterator, index = pairs(spawnedToysFolder:GetChildren())
        while true do
            local childInstance
            index, childInstance = iteratorFunction(childrenIterator, index)
            if index == nil then
                break
            end
            local iteratorFunction2, dataIterator, index2 = pairs(data)
            while true do
                local modelName
                index2, modelName = iteratorFunction2(dataIterator, index2)
                if index2 == nil then
                    break
                end
                if childInstance:IsA("Model") and (childInstance.Name ~= modelName and (not WaitForAttribute(childInstance, "Connected2", 1) and (usedToyPointsValue.Value + additionalPoints) / toysLimitCapValue.Value > 1)) then
                    DeleteToyRE:FireServer(childInstance)
                end
            end
        end
    end
    return isOverLimit
end
function IsMobile()
    if localPlayer.PlayerGui:FindFirstChild("ContextActionGui") then
        return true
    end
end
IsUsingSolara = IsSolara()
if IsUsingSolara then
    print("new proximity promp created!")
    getgenv().fireproximityprompt = function(proximityPrompt)
        if proximityPrompt.Name ~= "ProximityPrompt" then
            error("retard: " .. Obj.Name)
        else
            local holdDuration = proximityPrompt.HoldDuration
            local maxActivationDistance = proximityPrompt.MaxActivationDistance
            proximityPrompt.MaxActivationDistance = math.huge
            proximityPrompt.HoldDuration = 0
            proximityPrompt:InputHoldBegin()
            proximityPrompt:InputHoldEnd()
            proximityPrompt.HoldDuration = holdDuration
            proximityPrompt.MaxActivationDistance = maxActivationDistance
        end
    end
end
local adminDataMap = {}
function checkadminData(item)
    if table.find(adminDataMap, item) then
        return true
    end
end
spawnToyThread = coroutine.create(function()
    while true do
        repeat
            local yieldedData = coroutine.yield()
        until typeof(yieldedData) == "table"
        SpawnToyRF:InvokeServer(unpack(yieldedData))
    end
end)
function SpawnToy(toyData, shouldSpawn)
    if (shouldSpawn or not isInPlotValue.Value) and true or false then
        coroutine.resume(spawnToyThread, toyData)
    end
end
local function getGroupRank(playerInstance, groupId)
    if typeof(playerInstance) == "Instance" and playerInstance.Parent then
        local lastTimeRankUpdate = playerInstance:GetAttribute("LastTimeRankUpdate")
        if not lastTimeRankUpdate or lastTimeRankUpdate and os.clock() - lastTimeRankUpdate >= 300 then
            local success, rank = pcall(function()
                return playerInstance:GetRankInGroup(groupId)
            end)
            local _, groupRole = pcall(function()
                return playerInstance:GetRoleInGroup(groupId)
            end)
            local playerRank = not success and "Common" or rank
            if playerRank == 255 then
                playerInstance:SetAttribute("Rank", "Leader")
            elseif playerRank == 4 then
                if groupRole == "High Rank Admin" then
                    playerInstance:SetAttribute("Rank", "High Rank Admin")
                end
            elseif playerRank == 3 then
                playerInstance:SetAttribute("Rank", "Low Rank Admin")
            elseif playerRank == 2 then
                playerInstance:SetAttribute("Rank", "Goon")
            elseif playerRank == 0 or playerRank == 1 then
                playerInstance:SetAttribute("Rank", "Common")
            end
            playerInstance:SetAttribute("LastTimeRankUpdate", os.clock())
        end
        local _ = playerInstance.GetAttribute
    end
end
local function isAuthorized(targetInstance)
    if typeof(targetInstance) ~= "Instance" then
        targetInstance = nil
    elseif targetInstance:IsA("Model") and targetInstance:FindFirstChildOfClass("Humanoid") and playersService:GetPlayerFromCharacter(targetInstance) then
        targetInstance = playersService:GetPlayerFromCharacter(targetInstance)
    elseif not targetInstance:IsA("Player") then
        return
    end
    local isAdmin = false
    if targetInstance then
        local groupRank = getGroupRank(targetInstance, 16168861)
        local isAdmin = (groupRank == "Leader" or (groupRank == "High Rank Admin" or (groupRank == "Low Rank Admin" or groupRank == "Goon"))) and true or isAdmin
        if checkadminData(targetInstance.Name) and not adminDataMap[targetInstance.Name].Protection then
            isAdmin = false
        end
        return isAdmin
    end
end
function IsHoldingAdminPlayer()
    local grabPartsFolder = workspaceService:FindFirstChild("GrabParts")
    if grabPartsFolder and grabPartsFolder:FindFirstChild("GrabPart") and grabPartsFolder.GrabPart:FindFirstChild("WeldConstraint") then
        local part1 = grabPartsFolder.GrabPart.WeldConstraint.Part1
        if part1 and isAuthorized(part1.Parent) then
            return true
        end
    end
end
function WhatIsHolding(grabbedObject)
    if grabbedObject and grabbedObject:FindFirstChild("GrabPart") and grabbedObject.GrabPart:FindFirstChild("WeldConstraint") then
        local part1 = grabbedObject.GrabPart.WeldConstraint.Part1
        if part1 and part1.Parent and part1.Parent:IsA("Model") then
            local parent = part1.Parent
            return playersService:GetPlayerFromCharacter(part1.Parent) and "Player" or (parent:FindFirstChild("Pet") and "Follow NPC" or "Object")
        end
    end
end
function tableAlphabeticOrder(stringA, stringB)
    return stringA:lower() < stringB:lower()
end
local function refreshPlayerList(uiElement)
    local playersService = playersService
    local playerIterator, playerIterator3, playerIndex = pairs(playersService:GetPlayers())
    local playerNamesList = {}
    while true do
        local player
        playerIndex, player = playerIterator(playerIterator3, playerIndex)
        if playerIndex == nil then
            break
        end
        if player.UserId ~= localPlayer.UserId then
            table.insert(playerNamesList, player.Name .. " " .. "(" .. player.DisplayName .. ")")
        end
    end
    table.sort(playerNamesList, tableAlphabeticOrder)
    uiElement:Refresh(playerNamesList, true)
end
local playerList = {}
local processedInstances = {}
local function refreshStringList(uiElement, tableToIterate)
    local stringIterator, stringIteratorState, stringIndex = pairs(tableToIterate)
    local playerNames = {}
    while true do
        local stringItem
        stringIndex, stringItem = stringIterator(stringIteratorState, stringIndex)
        if stringIndex == nil then
            break
        end
        if typeof(stringItem) == "string" then
            table.insert(playerNames, stringItem)
        end
    end
    uiElement:Refresh(playerNames, true)
end
local function updatePlayerList(uiElement)
    local playersService2 = playersService
    local playerIterator2, playerIterator4, playerIndex2 = pairs(playersService2:GetPlayers())
    local playerNameList = {}
    while true do
        local playerInstance
        playerIndex2, playerInstance = playerIterator2(playerIterator4, playerIndex2)
        if playerIndex2 == nil then
            break
        end
        if playerInstance.UserId ~= localPlayer.UserId then
            table.insert(playerNameList, playerInstance.Name .. " " .. "(" .. playerInstance.DisplayName .. ")")
        end
    end
    table.sort(playerNameList, tableAlphabeticOrder)
    table.insert(playerNameList, 1, localPlayer.Name .. " " .. "(" .. localPlayer.DisplayName .. ")")
    uiElement:Refresh(playerNameList, true)
end
function lookAt(startPosition, targetPosition)
    local directionVector = (targetPosition - startPosition).Unit
    local rightVector = directionVector:Cross((Vector3.new(0, 1, 0)))
    local upVector = rightVector:Cross(directionVector)
    return CFrame.fromMatrix(startPosition, rightVector, upVector)
end
local function onSpawnToyAction(actionName, inputState, _)
    if actionName == "Spawn Toy (TAB)" and inputState == Enum.UserInputState.Begin then
        local spawnToyArguments = {
            _G.SelectedToy,
            localPlayer.Character.CamPart.CFrame,
            Vector3.new(0, localPlayer.Character.CamPart.Orientation.Y, 0)
        }
        SpawnToyRF:InvokeServer(unpack(spawnToyArguments))
    end
end
function teleportfunc()
    local controllingCreature = _G.ControllingCreature or localPlayer.Character
    local cameraPartName = _G.ControllingCreature and "Head" or (localPlayer.Character and "CamPart" or nil)
    local hitPart, hitPosition = workspaceService:FindPartOnRayWithIgnoreList(Ray.new(controllingCreature[cameraPartName].Position, localPlayer.Character.CamPart.CFrame.lookVector * 5000), {
        controllingCreature
    })
    if hitPart then
        controllingCreature.HumanoidRootPart.CFrame = CFrame.new(hitPosition.X, hitPosition.Y + 5, hitPosition.Z)
    end
end
local function onTeleportAction(inputName, inputState, _)
    if inputName == "Teleport(Z)" and inputState == Enum.UserInputState.Begin then
        teleportfunc()
    end
end
local function isPlayerWhitelisted(tag)
    if table.find(processedInstances, tag) then
        return true
    end
end
local floatSteppedConnection = nil
local isFloating = nil
Noclip2 = nil
Clip2 = nil
local function startFloating()
    if not floatSteppedConnection then
        isFloating = false
        local function checkCollision()
            if isFloating == false and game.Players.LocalPlayer.Character ~= nil then
                local pairsIterator, pairsState, pairsIndex = pairs(game.Players.LocalPlayer.Character:GetChildren())
                while true do
                    local hitPart
                    pairsIndex, hitPart = pairsIterator(pairsState, pairsIndex)
                    if pairsIndex == nil then
                        break
                    end
                    if hitPart:IsA("BasePart") and (hitPart.CanCollide and hitPart.Name ~= floatName) then
                        hitPart.CanCollide = false
                    end
                end
            end
            wait(0.21)
        end
        floatSteppedConnection = runService.Stepped:Connect(checkCollision)
    end
end
local function toggleNoclip()
    if not _G.NoclipToggle then
        if floatSteppedConnection then
            floatSteppedConnection:Disconnect()
            floatSteppedConnection = nil
        end
        isFloating = true
    end
end
function countToys(floatName)
    local children = spawnedInToysFolder
    local pairsIterator2, childIndex, pairsIndex2 = pairs(children:GetChildren())
    local partsAnchoredCount = 0
    while true do
        local child
        pairsIndex2, child = pairsIterator2(childIndex, pairsIndex2)
        if pairsIndex2 == nil then
            break
        end
        if child.Name == floatName then
            partsAnchoredCount = partsAnchoredCount + 1
        end
    end
    return partsAnchoredCount
end
function CheckNetworkOwnerShipOnPlayer(potentialPlayer, condition)
    if typeof(potentialPlayer) == "Instance" and (potentialPlayer:IsA("Player") and potentialPlayer.Character) and (potentialPlayer.Character:FindFirstChild("Head") and (potentialPlayer.Character.Head:FindFirstChild("PartOwner") and potentialPlayer.Character.Head.PartOwner.Value == localPlayer.Name)) then
        return not condition and true or potentialPlayer.Character.Head.PartOwner
    end
end
function CheckNetworkOwnerShipPermanentOnPlayer(potentialPlayer, condition)
    if typeof(potentialPlayer) == "Instance" and (potentialPlayer:IsA("Player") and potentialPlayer.Character) and (potentialPlayer.Character:FindFirstChild("HumanoidRootPart") and (potentialPlayer.Character.HumanoidRootPart:FindFirstChild("FirePlayerPart") and (potentialPlayer.Character.HumanoidRootPart.FirePlayerPart:FindFirstChild("PartOwner") and potentialPlayer.Character.HumanoidRootPart.FirePlayerPart.PartOwner.Value == localPlayer.Name))) then
        return not condition and true or potentialPlayer.Character.HumanoidRootPart.FirePlayerPart.PartOwner
    end
end
function CheckNetworkOwnerShipOnPart(potentialPart, condition)
    if typeof(potentialPart) == "Instance" and (potentialPart:FindFirstChild("PartOwner") and potentialPart.PartOwner.Value == localPlayer.Name) then
        return not condition and true or potentialPart.PartOwner
    end
end
function SNOWship(targetPart)
    if targetPart and typeof(targetPart) == "Instance" then
        local distanceFromCharacter = localPlayer:DistanceFromCharacter(targetPart.Position)
        if localPlayer.Character and (localPlayer.Character:FindFirstChild("HumanoidRootPart") and distanceFromCharacter <= 30) then
            setNetworkOwnerEvent:FireServer(targetPart, lookAt(localPlayer.Character.HumanoidRootPart.Position, targetPart.Position))
        end
    end
end
function IsPlayerInsideSafeZone(player)
    if typeof(player) == "Instance" and (player:IsA("Player") and (player:FindFirstChild("InPlot") and player.InPlot.Value)) then
        return true
    end
end
function IsPlayerFloating(playerInstance)
    if typeof(playerInstance) == "Instance" and (playerInstance:IsA("Player") and playerInstance.Character) and (playerInstance.Character:FindFirstChildOfClass("Humanoid") and playerInstance.Character:FindFirstChildOfClass("Humanoid").FloorMaterial == Enum.Material.Air) then
        return true
    end
end
function CheckPlayerVelocity(playerInstanceVelocity)
    if typeof(playerInstanceVelocity) == "Instance" and (playerInstanceVelocity:IsA("Player") and playerInstanceVelocity.Character) and playerInstanceVelocity.Character:FindFirstChild("HumanoidRootPart") then
        return playerInstanceVelocity.Character.HumanoidRootPart.Velocity.Magnitude
    end
end
function SNOWshipOnce(targetPart2)
    local distanceFromCharacter = localPlayer:DistanceFromCharacter(targetPart2.Position)
    if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        if CheckNetworkOwnerShipOnPart(targetPart2) then
            return true
        end
        if distanceFromCharacter <= 30 then
            setNetworkOwnerEvent:FireServer(targetPart2, lookAt(localPlayer.Character.HumanoidRootPart.Position, targetPart2.Position))
        end
    end
end
function SNOWshipOnceAndCheck(targetPart, defaultDistance)
    local maxAttempts = defaultDistance or 5
    local distanceFromCharacter2 = localPlayer:DistanceFromCharacter(targetPart.Position)
    if not (localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")) then
        return
    end
    if CheckNetworkOwnerShipOnPart(targetPart) then
        return true
    end
    if distanceFromCharacter2 <= 30 then
        setNetworkOwnerEvent:FireServer(targetPart, lookAt(localPlayer.Character.HumanoidRootPart.Position, targetPart.Position))
    end
    local isNetworkOwner = false
    for _ = 0, maxAttempts do
        isNetworkOwner = CheckNetworkOwnerShipOnPart(targetPart, true)
        if isNetworkOwner then
            break
        end
        task.wait()
    end
    return isNetworkOwner
end
function SNOWshipTrack(targetPart)
    if targetPart.Parent and targetPart.Parent:IsA("Model") then
        local targetModel = targetPart.Parent
        local isOwnershipTrackConnected = targetModel:GetAttribute("OwnershipTrackConnected")
        local isCreatedConnected2 = targetModel:GetAttribute("CreatedConnected2")
        if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local distanceFromCharacter = localPlayer:DistanceFromCharacter(targetPart.Position)
            if isCreatedConnected2 then
                if isOwnershipTrackConnected then
                    return true
                end
                if distanceFromCharacter <= 30 then
                    setNetworkOwnerEvent:FireServer(targetPart, lookAt(localPlayer.Character.HumanoidRootPart.Position, targetPart.Position))
                end
            else
                targetModel:SetAttribute("CreatedConnected2", true)
                print("Create Connection 2")
                targetModel.DescendantAdded:Connect(function(attribute)
                    if attribute.Name ~= "PartOwner" or attribute.Value ~= localPlayer.Name then
                        if attribute.Name == "PartOwner" and attribute.Value ~= localPlayer.Name then
                            targetModel:SetAttribute("OwnershipTrackConnected", false)
                        end
                    else
                        targetModel:SetAttribute("OwnershipTrackConnected", true)
                    end
                end)
            end
        end
    end
end
function SNOWshipOnceAndDelete(networkedPart)
    local distanceFromCharacter = localPlayer:DistanceFromCharacter(networkedPart.Position)
    local isConnected = networkedPart:GetAttribute("Connected")
    local createdConnected = networkedPart:GetAttribute("CreatedConnected")
    if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        if CheckNetworkOwnerShipOnPart(networkedPart) then
            networkedPart:SetAttribute("Connected", true)
            destroyGrabLineEvent:FireServer(networkedPart)
            if not createdConnected then
                networkedPart:SetAttribute("CreatedConnected", true)
                print("Create Connection")
                networkedPart.ChildAdded:Connect(function(child)
                    if child.Name == "PartOwner" and child.Value ~= localPlayer.Name then
                        networkedPart:SetAttribute("Connected", false)
                    end
                end)
            end
        elseif distanceFromCharacter <= 30 and not isConnected then
            setNetworkOwnerEvent:FireServer(networkedPart, lookAt(localPlayer.Character.HumanoidRootPart.Position, networkedPart.Position))
        end
    end
end
function SNOWshipPlayer(otherPlayer, callbackFunction)
    if localPlayer.Character and (localPlayer.Character:FindFirstChild("HumanoidRootPart") and (typeof(otherPlayer) == "Instance" and (otherPlayer:IsA("Player") and otherPlayer.Character)) and otherPlayer.Character:FindFirstChild("HumanoidRootPart")) then
        local otherPlayerHumanoidRootPart = otherPlayer.Character.HumanoidRootPart
        local distanceFromOtherPlayer = localPlayer:DistanceFromCharacter(otherPlayerHumanoidRootPart.Position)
        if CheckNetworkOwnerShipOnPlayer(otherPlayer) then
            if type(callbackFunction) == "function" then
                callbackFunction()
            end
            return true
        end
        if distanceFromOtherPlayer <= 30 then
            setNetworkOwnerEvent:FireServer(otherPlayerHumanoidRootPart, lookAt(localPlayer.Character.HumanoidRootPart.Position, otherPlayerHumanoidRootPart.Position))
        end
    end
end
function SNOWshipPermanentPlayer(otherPlayer, callbackFunction)
    if localPlayer.Character and (localPlayer.Character:FindFirstChild("HumanoidRootPart") and (typeof(otherPlayer) == "Instance" and (otherPlayer:IsA("Player") and otherPlayer.Character)) and (otherPlayer.Character:FindFirstChild("HumanoidRootPart") and otherPlayer.Character.HumanoidRootPart:FindFirstChild("FirePlayerPart"))) then
        local firePlayerPart = otherPlayer.Character.HumanoidRootPart.FirePlayerPart
        local distanceFromFirePlayerPart = localPlayer:DistanceFromCharacter(firePlayerPart.Position)
        if type(callbackFunction) == "function" then
            callbackFunction()
        end
        if distanceFromFirePlayerPart <= 30 then
            setNetworkOwnerEvent:FireServer(firePlayerPart, lookAt(localPlayer.Character.HumanoidRootPart.Position, firePlayerPart.Position))
            return true
        end
    end
end
function GetPlayerCharacter()
    if localPlayer.Character and (localPlayer.Character:FindFirstChild("HumanoidRootPart") and localPlayer.Character:FindFirstChildOfClass("Humanoid")) then
        return localPlayer.Character
    end
end
_G.TP_Priority = 0
function ChangeActivityPriority(teleportPriority)
    if _G.TP_Priority <= teleportPriority then
        _G.TP_Priority = teleportPriority
        return true
    end
    if teleportPriority == 0 then
        _G.TP_Priority = teleportPriority
        return true
    end
end
function TeleportPlayer(cframeOffset, teleportPriority)
    if (teleportPriority == nil and 0 or teleportPriority) == _G.TP_Priority then
        local playerCharacter = GetPlayerCharacter()
        if playerCharacter and (not _G.TeleportingToNetworkOwnership and typeof(cframeOffset) == "CFrame") then
            local humanoidRootPart = playerCharacter.HumanoidRootPart
            local humanoid = playerCharacter:FindFirstChildOfClass("Humanoid")
            humanoidRootPart.CFrame = humanoidRootPart.CFrame.Rotation + cframeOffset.Position
            if humanoid.SeatPart == nil or tostring(humanoid.SeatPart.Parent) ~= "CreatureBlobman" then
                humanoid.Sit = false
            end
        end
    end
end
function GetPlayerCFrame()
    local playerCharacterCFrame = GetPlayerCharacter()
    if playerCharacterCFrame then
        return playerCharacterCFrame.HumanoidRootPart.CFrame
    end
end
function GetPlayerRoot()
    local playerHumanoidRootPart = GetPlayerCharacter()
    if playerHumanoidRootPart then
        return playerHumanoidRootPart.HumanoidRootPart
    end
end
function GetPlayerHRPByName(playerName)
    if playersService:FindFirstChild(playerName) and playersService[playerName].Character then
        local _ = playersService[playerName].Character.FindFirstChild
    end
end
function Getdistancefromcharacter(characterPosition)
    return localPlayer:DistanceFromCharacter(characterPosition)
end
AnchoredObjects = {}
CompiledGroups = {}
local attachmentInstance = Instance.new("Attachment")
local soundEffect = Instance.new("Sound", attachmentInstance)
local particleEmitter = Instance.new("ParticleEmitter", attachmentInstance)
soundEffect.Name = "soundeffect"
soundEffect.SoundId = "rbxassetid://1091083826"
particleEmitter.LightInfluence = 1
particleEmitter.Lifetime = NumberRange.new(2, 3)
particleEmitter.Texture = "rbxassetid://15668608167"
particleEmitter.Transparency = NumberSequence.new(0, 1)
particleEmitter.Speed = NumberRange.new(6, 6)
particleEmitter.Size = NumberSequence.new(0, 1)
particleEmitter.SpreadAngle = Vector2.new(360, 360)
particleEmitter.Rate = 20
particleEmitter.Enabled = false
particleEmitter.Name = "particle"
function anchorobjecteffect(parentPart)
    local clonedAttachment = attachmentInstance:Clone()
    clonedAttachment.Parent = parentPart
    clonedAttachment.soundeffect:Play()
    clonedAttachment.particle:Emit(25)
    debrisService:AddItem(clonedAttachment)
end
function autosetownership()
    local pairsIterator, anchoredObjectIndex, anchoredObjectKey = pairs(AnchoredObjects)
    while true do
        local anchoredObjectValue
        anchoredObjectKey, anchoredObjectValue = pairsIterator(anchoredObjectIndex, anchoredObjectKey)
        if anchoredObjectKey == nil then
            return
        end
        if typeof(anchoredObjectValue.PartAnchored) == "Instance" and not anchoredObjectKey:GetAttribute("AnchorOwnership") then
            local anchoredPart = anchoredObjectValue.PartAnchored
            local anchoredModel = anchoredObjectValue.Model
            local isOwnershipValid = false
            local playerFromCharacter
            if anchoredModel:FindFirstChildOfClass("Humanoid") then
                playerFromCharacter = playersService:GetPlayerFromCharacter(anchoredModel)
                anchoredPart = anchoredModel:FindFirstChild("Head")
            else
                playerFromCharacter = nil
            end
            local canTeleport = (playerFromCharacter and (_G.OwnershipModeTarget == 1 or _G.OwnershipModeTarget == 3) or playerFromCharacter == nil and (_G.OwnershipModeTarget == 2 or _G.OwnershipModeTarget == 3)) and true or isOwnershipValid
            if anchoredPart then
                if Getdistancefromcharacter(anchoredPart.Position) >= 30 then
                    if _G.OwnershipModeAnchorBehavior == "Teleport" and canTeleport then
                        print("working!")
                        ChangeActivityPriority(1)
                        local playerCFrame = GetPlayerCFrame()
                        for _ = 0, 15 do
                            if SNOWshipOnce(anchoredPart) then
                                anchoredModel:SetAttribute("AnchorOwnership", true)
                                break
                            end
                            TeleportPlayer(CFrame.new(anchoredPart.Position + Vector3.new(0, 5, 0)), 1)
                            wait()
                        end
                        ChangeActivityPriority(0)
                        TeleportPlayer(playerCFrame)
                    end
                elseif SNOWshipOnce(anchoredPart) then
                    anchoredModel:SetAttribute("AnchorOwnership", true)
                end
            end
        end
    end
end
SB_LineTransparencyValue = Instance.new("NumberValue")
SB_SurfaceTransparencyValue = Instance.new("NumberValue")
SB_AnchoredColor3 = Instance.new("Color3Value")
SB_AnchoredColor3Surface = Instance.new("Color3Value")
SB_GlueColor3 = Instance.new("Color3Value")
SB_GlueColor3Surface = Instance.new("Color3Value")
SB_MainGlueColor3 = Instance.new("Color3Value")
SB_MainGlueColor3Surface = Instance.new("Color3Value")
SB_AnchoredColor3.Value = Color3.fromRGB(22, 2, 138)
SB_AnchoredColor3Surface.Value = Color3.fromRGB(38, 85, 172)
SB_GlueColor3.Value = Color3.fromRGB(242, 124, 17)
SB_GlueColor3Surface.Value = Color3.fromRGB(253, 243, 130)
SB_MainGlueColor3.Value = Color3.fromRGB(0, 85, 0)
SB_MainGlueColor3Surface.Value = Color3.fromRGB(89, 225, 65)
function ChangeSBstate(selectionBox, selectionBoxState)
    if typeof(selectionBox) == "Instance" and selectionBox:IsA("SelectionBox") then
        selectionBox:SetAttribute("SB_State", selectionBoxState)
        if selectionBoxState == "Anchored" then
            selectionBox.Color3 = SB_AnchoredColor3.Value
            selectionBox.SurfaceColor3 = SB_AnchoredColor3Surface.Value
        elseif selectionBoxState == "Glue" then
            selectionBox.Color3 = SB_GlueColor3.Value
            selectionBox.SurfaceColor3 = SB_GlueColor3Surface.Value
        elseif selectionBoxState == "GluePrimary" then
            selectionBox.Color3 = SB_MainGlueColor3.Value
            selectionBox.SurfaceColor3 = SB_MainGlueColor3Surface.Value
        else
            selectionBox.Color3 = Color3.fromRGB(139, 0, 0)
            selectionBox.SurfaceColor3 = Color3.fromRGB(193, 0, 0)
        end
    end
end
function DisconnectObject(anchoredPart)
    if typeof(anchoredPart) == "Instance" and AnchoredObjects[anchoredPart] then
        local anchoredObjectData = AnchoredObjects[anchoredPart]
        anchoredObjectData.BodyPosition.Parent = anchoredPart
        anchoredObjectData.BodyGyro.Parent = anchoredPart
        anchoredObjectData.PartAnchored = nil
        anchoredObjectData.SB.Visible = false
        local connectionPairsIterator, connectionIndex, connectionKey = pairs(anchoredObjectData.Connections)
        while true do
            local connection
            connectionKey, connection = connectionPairsIterator(connectionIndex, connectionKey)
            if connectionKey == nil then
                break
            end
            connection:Disconnect()
        end
        anchoredPart:SetAttribute("IsAnchored", nil)
        anchoredPart:SetAttribute("AnchorOwnership", nil)
        anchoredPart:SetAttribute("Glue", nil)
        anchoredPart:SetAttribute("GluePrimary", nil)
        anchoredPart:SetAttribute("IsAnchored", nil)
        AnchoredObjects[anchoredPart] = nil
        print("Disconnected Object")
    end
end
function unAnchorObject(anchoredObject)
    if typeof(anchoredObject) == "Instance" and anchoredObject.Parent and (anchoredObject.Parent:IsA("Model") or anchoredObject.Parent:IsA("Folder")) then
        local anchoredObjectParent = anchoredObject.Parent
        local isAnchoredAttribute = anchoredObjectParent:GetAttribute("IsAnchored")
        local gluePrimaryAttribute = anchoredObjectParent:GetAttribute("GluePrimary")
        anchoredObjectParent:GetAttribute("Glue")
        if not anchoredObjectParent:IsA("Folder") and anchoredObjectParent ~= workspaceService then
            anchoredObject = anchoredObjectParent
        end
        if AnchoredObjects[anchoredObject] and isAnchoredAttribute then
            local anchoredObjectData = AnchoredObjects[anchoredObject]
            anchoredObjectData.BodyPosition.Parent = anchoredObject
            anchoredObjectData.BodyGyro.Parent = anchoredObject
            anchoredObjectData.PartAnchored = nil
            if gluePrimaryAttribute then
                ChangeSBstate(anchoredObjectData.SB, "GluePrimary")
            else
                anchoredObjectData.SB.Visible = false
            end
            local anchoredObjectConnectionPairsIterator, connectionIndex, connectionIterator = pairs(anchoredObjectData.Connections)
            while true do
                local connection
                connectionIterator, connection = anchoredObjectConnectionPairsIterator(connectionIndex, connectionIterator)
                if connectionIterator == nil then
                    break
                end
                connection:Disconnect()
            end
            anchoredObject:SetAttribute("IsAnchored", false)
            anchoredObject:SetAttribute("AnchorOwnership", false)
            if not gluePrimaryAttribute then
                AnchoredObjects[anchoredObject] = nil
            end
            print("UnAnchored")
        end
    end
end
function setanchorObject(part)
    if typeof(part) == "Instance" and part.Parent and (part.Parent:IsA("Model") or part.Parent:IsA("Folder")) then
        local parentModel = part.Parent
        if parentModel:IsA("Folder") or parentModel == workspaceService then
            parentModel = part
        end
        if parentModel:GetAttribute("IsAnchored") or parentModel:GetAttribute("Glue") then
            unAnchorObject(part)
        else
            local anchorPositionBody = parentModel:FindFirstChild("AnchorPositionBody") or (part:FindFirstChild("AnchorPositionBody") or Instance.new("BodyPosition"))
            local anchorGyroBody = parentModel:FindFirstChild("AnchorGyroBody") or (part:FindFirstChild("AnchorGyroBody") or Instance.new("BodyGyro"))
            local objectStateSelectionBox = parentModel:FindFirstChild("ObjectState") or Instance.new("SelectionBox")
            local descendantConnections = {}
            local infiniteVector3 = Vector3.new(math.huge, math.huge, math.huge)
            local zeroVector = Vector3.new(0, 0, 0)
            local partPosition = part.Position
            local currentPart = nil
            local isConnected = false
            local isPartOwnerRemoved = false
            if part.Parent:FindFirstChild("Head") and part.Parent:FindFirstChildOfClass("Humanoid") then
                if playersService:GetPlayerFromCharacter(part.Parent) then
                    isPartOwnerRemoved = true
                else
                    isConnected = true
                end
            end
            anchorPositionBody.Name = "AnchorPositionBody"
            anchorPositionBody.Position = part.Position
            anchorPositionBody.Parent = part
            anchorGyroBody.Name = "AnchorGyroBody"
            anchorGyroBody.Parent = part
            anchorGyroBody.CFrame = part.CFrame
            anchorGyroBody.D = 950
            anchorGyroBody.P = 40000
            anchorPositionBody.P = 40000
            anchorPositionBody.D = 950
            objectStateSelectionBox.Name = "ObjectState"
            objectStateSelectionBox.LineThickness = 0.025
            objectStateSelectionBox.SurfaceTransparency = SB_SurfaceTransparencyValue.Value
            objectStateSelectionBox.Transparency = SB_LineTransparencyValue.Value
            objectStateSelectionBox.Visible = true
            objectStateSelectionBox.Parent = parentModel
            objectStateSelectionBox.Adornee = parentModel
            local function updateJointMaxForce()
                if parentModel:GetAttribute("IsAnchored") or parentModel:GetAttribute("Glue") then
                    anchorGyroBody.MaxTorque = infiniteVector3
                    anchorPositionBody.MaxForce = infiniteVector3
                end
                if parentModel:GetAttribute("GluePrimary") and not parentModel:GetAttribute("IsAnchored") then
                    ChangeSBstate(objectStateSelectionBox, "GluePrimary")
                elseif parentModel:GetAttribute("Glue") and not parentModel:GetAttribute("IsAnchored") then
                    ChangeSBstate(objectStateSelectionBox, "Glue")
                else
                    ChangeSBstate(objectStateSelectionBox, "Anchored")
                end
            end
            local function resetAnchorForces()
                anchorGyroBody.MaxTorque = Vector3.new()
                anchorPositionBody.MaxForce = Vector3.new()
                ChangeSBstate(objectStateSelectionBox)
                parentModel:SetAttribute("AnchorOwnership", false)
            end
            local function updateSelectionBoxState()
                local selectedObject = objectStateSelectionBox
                ChangeSBstate(objectStateSelectionBox, selectedObject:GetAttribute("SB_State"))
            end
            descendantConnections[1] = parentModel.DescendantAdded:Connect(function(descendant)
                if descendant.Name == "PartOwner" then
                    if descendant.Value ~= localPlayer.Name then
                        resetAnchorForces()
                    else
                        currentPart = descendant
                        updateJointMaxForce()
                    end
                end
            end)
            descendantConnections[2] = parentModel.DescendantRemoving:Connect(function(descendant)
                if descendant.Name == "PartOwner" and descendant.Value == localPlayer.Name then
                    if descendant.Value ~= localPlayer.Name or not isConnected then
                        if descendant.Value == localPlayer.Name and isPartOwnerRemoved then
                            currentPart = nil
                            resetAnchorForces()
                        end
                    else
                        currentPart = nil
                        updateJointMaxForce()
                    end
                end
            end)
            descendantConnections[# descendantConnections + 1] = SB_LineTransparencyValue.Changed:Connect(function(transparencyValue)
                objectStateSelectionBox.Transparency = transparencyValue
                print(transparencyValue)
            end)
            descendantConnections[# descendantConnections + 1] = SB_SurfaceTransparencyValue.Changed:Connect(function(surfaceTransparencyValue)
                objectStateSelectionBox.SurfaceTransparency = surfaceTransparencyValue
            end)
            descendantConnections[# descendantConnections + 1] = SB_AnchoredColor3.Changed:Connect(function(_)
                updateSelectionBoxState()
            end)
            descendantConnections[# descendantConnections + 1] = SB_AnchoredColor3Surface.Changed:Connect(function(_)
                updateSelectionBoxState()
            end)
            descendantConnections[# descendantConnections + 1] = SB_AnchoredColor3Surface.Changed:Connect(function(_)
                updateSelectionBoxState()
            end)
            descendantConnections[# descendantConnections + 1] = SB_AnchoredColor3Surface.Changed:Connect(function(_)
                updateSelectionBoxState()
            end)
            descendantConnections[# descendantConnections + 1] = SB_GlueColor3.Changed:Connect(function(_)
                updateSelectionBoxState()
            end)
            descendantConnections[# descendantConnections + 1] = SB_GlueColor3Surface.Changed:Connect(function(_)
                updateSelectionBoxState()
            end)
            descendantConnections[# descendantConnections + 1] = SB_MainGlueColor3.Changed:Connect(function(_)
                updateSelectionBoxState()
            end)
            descendantConnections[# descendantConnections + 1] = SB_MainGlueColor3Surface.Changed:Connect(function(_)
                updateSelectionBoxState()
            end)
            task.spawn(function()
                while anchorPositionBody.Parent and not parentModel:GetAttribute("Glue") do
                    if parentModel:GetAttribute("IsAnchored") then
                        anchorGyroBody.MaxTorque = infiniteVector3
                        anchorPositionBody.MaxForce = infiniteVector3
                    else
                        anchorGyroBody.MaxTorque = zeroVector
                        anchorPositionBody.MaxForce = zeroVector
                    end
                    anchorPositionBody.Position = partPosition + Vector3.new(0, 0.001, 0)
                    task.wait()
                    anchorPositionBody.Position = partPosition
                end
                print("breaked")
            end)
            AnchoredObjects[parentModel] = {
                BodyPosition = anchorPositionBody,
                BodyGyro = anchorGyroBody,
                PartAnchored = part,
                SB = objectStateSelectionBox,
                Connections = descendantConnections,
                Model = parentModel
            }
            anchorobjecteffect(part)
            parentModel:SetAttribute("IsAnchored", true)
            updateJointMaxForce()
            print("Anchored!")
        end
    end
end
CharacterRaycastFilter = RaycastParams.new()
CharacterRaycastFilter.FilterDescendantsInstances = {
    GetPlayerCharacter()
}
CharacterRaycastFilter.FilterType = Enum.RaycastFilterType.Exclude
function anchorfunc()
    local grabPartsFolder = workspaceService:FindFirstChild("GrabParts")
    local function isGrabbablePart(part)
        if part and not (part:IsDescendantOf(workspaceService.Map) or part.Anchored) then
            return true
        end
    end
    if grabPartsFolder then
        local grabbedPart = grabPartsFolder.GrabPart.WeldConstraint.Part1
        if isGrabbablePart(grabbedPart) then
            setanchorObject(grabbedPart)
        end
    elseif GetPlayerCharacter() then
        local controllingCreature = _G.ControllingCreature or localPlayer.Character
        local cameraFocusPartName = _G.ControllingCreature and "Head" or (localPlayer.Character and "CamPart" or nil)
        local raycastPart, _ = workspaceService:FindPartOnRayWithIgnoreList(Ray.new(controllingCreature[cameraFocusPartName].Position, localPlayer.Character.CamPart.CFrame.lookVector * 5000), {
            controllingCreature
        })
        if raycastPart and raycastPart.Parent and (raycastPart.Parent:IsA("Model") and (raycastPart.Parent:GetAttribute("IsAnchored") and isGrabbablePart(raycastPart))) then
            setanchorObject(raycastPart)
        end
    end
end
function anchorobject(inputActionName, inputState, _)
    if inputActionName == "AnchorK" and inputState == Enum.UserInputState.Begin then
        anchorfunc()
    end
end
local function updateAnchoredGroup(primaryPart)
    local compiledGroupsIterator, compiledGroupsState, compiledGroupsIndex = ipairs(CompiledGroups)
    while true do
        local compiledGroupData
        compiledGroupsIndex, compiledGroupData = compiledGroupsIterator(compiledGroupsState, compiledGroupsIndex)
        if compiledGroupsIndex == nil then
            break
        end
        if compiledGroupData.primaryPart and compiledGroupData.primaryPart == primaryPart then
            local groupPartsIterator, groupIndex, groupPartsIndex = ipairs(compiledGroupData.group)
            while true do
                local groupPartData
                groupPartsIndex, groupPartData = groupPartsIterator(groupIndex, groupPartsIndex)
                if groupPartsIndex == nil then
                    break
                end
                if groupPartData.model ~= primaryPart then
                    local bodyPosition = groupPartData.bodypos
                    local bodyGyro = groupPartData.bodygyro
                    local basePart = primaryPart.PrimaryPart or primaryPart:FindFirstChildOfClass("BasePart")
                    if basePart and primaryPart then
                        if bodyPosition then
                            bodyPosition.P = 40000
                            bodyPosition.D = 200
                            bodyPosition.Position = (basePart.CFrame * groupPartData.offset).Position
                            task.wait()
                            bodyPosition.Position = bodyPosition.Position + Vector3.new(0, 0.002, 0)
                        end
                        if bodyGyro then
                            bodyGyro.P = 40000
                            bodyGyro.D = 200
                            bodyGyro.CFrame = basePart.CFrame * groupPartData.offset
                        end
                    end
                end
            end
        end
    end
end
function IsHoldingAnchoredPart()
    local grabPartsFolder = workspaceService:FindFirstChild("GrabParts")
    local anchoredModel = nil
    if grabPartsFolder then
        local grabbedPart = grabPartsFolder.GrabPart.WeldConstraint.Part1
        if grabbedPart then
            local pairsIterator, index, anchoredObjectKey = pairs(AnchoredObjects)
            while true do
                local anchoredObjectValue
                anchoredObjectKey, anchoredObjectValue = pairsIterator(index, anchoredObjectKey)
                if anchoredObjectKey == nil then
                    break
                end
                if grabbedPart:IsDescendantOf(anchoredObjectKey) then
                    anchoredModel = anchoredObjectValue.Model
                    break
                end
            end
        end
    end
    return anchoredModel
end
function IsHoldingPrimaryCompiledObject()
    local grabPartsFolder = workspaceService:FindFirstChild("GrabParts")
    local isCompiled = nil
    if grabPartsFolder then
        local grabPart = grabPartsFolder.GrabPart.WeldConstraint.Part1
        if grabPart then
            local anchoredObjectsPairsIterator, anchoredObjectsIndex, anchoredObjectInstanceKey = pairs(AnchoredObjects)
            while true do
                local compiledGroupIndex
                anchoredObjectInstanceKey, compiledGroupIndex = anchoredObjectsPairsIterator(anchoredObjectsIndex, anchoredObjectInstanceKey)
                if anchoredObjectInstanceKey == nil then
                    break
                end
                if grabPart:IsDescendantOf(anchoredObjectInstanceKey) and anchoredObjectInstanceKey:GetAttribute("GluePrimary") then
                    isCompiled = true
                    break
                end
            end
        end
    end
    return isCompiled
end
function CreateNoCollisionConstraintsCompile(primaryPart)
    local compiledGroupsIpairsIterator, compiledGroupIterator, compiledGroupIndex = ipairs(CompiledGroups)
    while true do
        local compiledGroupValue
        compiledGroupIndex, compiledGroupValue = compiledGroupsIpairsIterator(compiledGroupIterator, compiledGroupIndex)
        if compiledGroupIndex == nil then
            break
        end
        if compiledGroupValue.primaryPart and compiledGroupValue.primaryPart == primaryPart then
            local groupPairsIterator, groupPairIterator, groupIndex = pairs(compiledGroupValue.group)
            while true do
                local groupValue
                groupIndex, groupValue = groupPairsIterator(groupPairIterator, groupIndex)
                if groupIndex == nil then
                    break
                end
                local groupModel = groupValue.model
                if groupModel == primaryPart and (groupModel and primaryPart) then
                    local modelChildrenIpairsIterator, modelChildrenIterator, modelChildIndex = ipairs(groupModel:GetChildren())
                    while true do
                        local modelChildValue
                        modelChildIndex, modelChildValue = modelChildrenIpairsIterator(modelChildrenIterator, modelChildIndex)
                        if modelChildIndex == nil then
                            break
                        end
                        if modelChildValue:IsA("BasePart") then
                            local groupPairsIterator2, groupIndex2, groupIndex3 = pairs(compiledGroupValue.group)
                            while true do
                                local groupValue2
                                groupIndex3, groupValue2 = groupPairsIterator2(groupIndex2, groupIndex3)
                                if groupIndex3 == nil then
                                    break
                                end
                                local modelInstance = groupValue2.model
                                local modelChildrenIpairsIterator2, modelChildrenIterator, modelChildIndex2 = ipairs(modelInstance:GetChildren())
                                while true do
                                    local modelChildValue2
                                    modelChildIndex2, modelChildValue2 = modelChildrenIpairsIterator2(modelChildrenIterator, modelChildIndex2)
                                    if modelChildIndex2 == nil then
                                        break
                                    end
                                    if modelChildValue2:IsA("BasePart") then
                                        local noCollisionConstraint = Instance.new("NoCollisionConstraint", modelChildValue)
                                        noCollisionConstraint.Part0 = modelChildValue
                                        noCollisionConstraint.Part1 = modelChildValue2
                                        noCollisionConstraint.Enabled = true
                                        table.insert(compiledGroupValue.Nc_Group, noCollisionConstraint)
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
function IsInCompileGroup(partToCheck)
    local compiledGroupsIpairsIterator2, compiledGroupIterator, compiledGroupIndex2 = ipairs(CompiledGroups)
    local isGlued = false
    while true do
        local compiledGroupValue2
        compiledGroupIndex2, compiledGroupValue2 = compiledGroupsIpairsIterator2(compiledGroupIterator, compiledGroupIndex2)
        if compiledGroupIndex2 == nil then
            return isGlued
        end
        if compiledGroupValue2.primaryPart then
            local groupPairsIterator3, groupIndex4, groupIndex5 = pairs(compiledGroupValue2.group)
            while true do
                local groupValue3
                groupIndex5, groupValue3 = groupPairsIterator3(groupIndex4, groupIndex5)
                if groupIndex5 == nil then
                    break
                end
                local groupModel = groupValue3.model
                if groupModel and (groupModel == partToCheck and (groupModel:GetAttribute("Glue") or groupModel:GetAttribute("GluePrimary"))) and not groupModel:GetAttribute("IsAnchored") then
                    isGlued = true
                    break
                end
            end
        end
    end
end
function CheckPrimaryPartOnCompileGroup(primaryPart)
    local compiledGroupsIpairsIterator3, compiledGroupIterator, compiledGroupIndex3 = ipairs(CompiledGroups)
    local isExploiter = false
    while true do
        local compiledGroupValue3
        compiledGroupIndex3, compiledGroupValue3 = compiledGroupsIpairsIterator3(compiledGroupIterator, compiledGroupIndex3)
        if compiledGroupIndex3 == nil then
            break
        end
        if compiledGroupValue3.primaryPart and compiledGroupValue3.primaryPart == primaryPart and compiledGroupValue3.primaryPart:GetAttribute("IsAnchored") then
            isExploiter = true
            break
        end
    end
    return isExploiter
end
function ObjectStateBillboardGUI(billboardGui, objectState)
    local objectTextBillboardGui = billboardGui:FindFirstChild("ObjectText")
    if not objectTextBillboardGui then
        objectTextBillboardGui = Instance.new("BillboardGui")
        local stateTextLabel = Instance.new("TextLabel")
        local uiTextSizeConstraint = Instance.new("UITextSizeConstraint")
        local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
        objectTextBillboardGui.Name = "ObjectText"
        objectTextBillboardGui.Parent = billboardGui
        objectTextBillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        objectTextBillboardGui.Active = true
        objectTextBillboardGui.Adornee = billboardGui
        objectTextBillboardGui.AlwaysOnTop = true
        objectTextBillboardGui.Size = UDim2.new(3, 0, 3, 0)
        objectTextBillboardGui.Enabled = false
        stateTextLabel.Name = "State"
        stateTextLabel.Parent = objectTextBillboardGui
        stateTextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        stateTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        stateTextLabel.BackgroundTransparency = 1
        stateTextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        stateTextLabel.BorderSizePixel = 0
        stateTextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        stateTextLabel.Size = UDim2.new(1, 5, 0.340000004, 5)
        stateTextLabel.Font = Enum.Font.SourceSans
        stateTextLabel.Text = ""
        stateTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        stateTextLabel.TextScaled = true
        stateTextLabel.TextSize = 28
        stateTextLabel.TextStrokeTransparency = 0
        stateTextLabel.TextWrapped = true
        uiTextSizeConstraint.Parent = stateTextLabel
        uiTextSizeConstraint.MaxTextSize = 28
        uiTextSizeConstraint.MinTextSize = 15
        uiAspectRatioConstraint.Name = ""
        uiAspectRatioConstraint.Parent = objectTextBillboardGui
        uiAspectRatioConstraint.AspectRatio = 1.043
    end
    if typeof(objectState) ~= "string" then
        objectTextBillboardGui.Enabled = false
    else
        objectTextBillboardGui.State.TextColor3 = Color3.fromRGB(255, 255, 255)
        objectTextBillboardGui.State.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        if objectState == "Anchored" then
            objectTextBillboardGui.State.TextColor3 = Color3.fromRGB(112, 186, 255)
            objectTextBillboardGui.State.TextStrokeColor3 = Color3.fromRGB(0, 0, 127)
        elseif objectState == "Disconnected" then
            objectTextBillboardGui.State.TextColor3 = Color3.fromRGB(255, 0, 0)
            objectTextBillboardGui.State.TextStrokeColor3 = Color3.fromRGB(67, 0, 0)
        end
        objectTextBillboardGui.State.Text = objectState
        objectTextBillboardGui.Enabled = true
    end
end
function RemoveCompileGroup(part)
    local ipairsIterator, compiledGroupIterator, compiledGroupIndex = ipairs(CompiledGroups)
    while true do
        local compiledGroupIndexValue, compiledGroup = ipairsIterator(compiledGroupIterator, compiledGroupIndex)
        if compiledGroupIndexValue == nil then
            break
        end
        if compiledGroup.primaryPart and compiledGroup.primaryPart == part then
            local pairsIterator, nonCollidingGroupPairIterator, ncGroupIndex = pairs(compiledGroup.Nc_Group)
            compiledGroupIndex = compiledGroupIndexValue
            while true do
                local nonCollidingObject
                ncGroupIndex, nonCollidingObject = pairsIterator(nonCollidingGroupPairIterator, ncGroupIndex)
                if ncGroupIndex == nil then
                    break
                end
                nonCollidingObject:Destroy()
            end
            ObjectStateBillboardGUI(part)
            local pairsIteratorGc, gameCollisionPairIterator, gcIndex = pairs(compiledGroup.gC)
            while true do
                local gameCollisionConnection
                gcIndex, gameCollisionConnection = pairsIteratorGc(gameCollisionPairIterator, gcIndex)
                if gcIndex == nil then
                    break
                end
                gameCollisionConnection:Disconnect()
                print("Disconnected!")
            end
            local pairsIteratorGroup, groupPairIterator, groupIndex = pairs(compiledGroup.group)
            while true do
                local groupValue
                groupIndex, groupValue = pairsIteratorGroup(groupPairIterator, groupIndex)
                if groupIndex == nil then
                    break
                end
                local model = groupValue.model
                model:SetAttribute("Glue", false)
                model:SetAttribute("GluePrimary", false)
                model:SetAttribute("IsAnchored", false)
            end
            table.remove(CompiledGroups, compiledGroupIndexValue)
        else
            compiledGroupIndex = compiledGroupIndexValue
        end
    end
end
function RemoveGroupCompileFromName(groupName)
    local ipairsIteratorCompiledGroups, compiledGroupIterator, compiledGroupIndex2 = ipairs(CompiledGroups)
    while true do
        local compiledGroup2
        compiledGroupIndex2, compiledGroup2 = ipairsIteratorCompiledGroups(compiledGroupIterator, compiledGroupIndex2)
        if compiledGroupIndex2 == nil then
            break
        end
        if compiledGroup2.gN == groupName then
            local groupPrimaryPart = compiledGroup2.primaryPart
            local pairsIteratorGroup2, groupPairIterator, groupIndex2 = pairs(compiledGroup2.group)
            while true do
                local groupObject
                groupIndex2, groupObject = pairsIteratorGroup2(groupPairIterator, groupIndex2)
                if groupIndex2 == nil then
                    break
                end
                DisconnectObject(groupObject.model)
            end
            RemoveCompileGroup(groupPrimaryPart)
        end
    end
end
function CountCompileGroups()
    local ipairsIteratorCompiledGroups3, compiledGroupIterator, compiledGroupIndex3 = ipairs(CompiledGroups)
    local exploitCounter = 0
    while true do
        local compiledGroup
        compiledGroupIndex3, compiledGroup = ipairsIteratorCompiledGroups3(compiledGroupIterator, compiledGroupIndex3)
        if compiledGroupIndex3 == nil then
            break
        end
        exploitCounter = exploitCounter + 1
    end
    return exploitCounter
end
function updateCompileGroupsDropdown(objectStateBillboard)
    local ipairsIteratorCompiledGroups4, compiledGroupIterator, compiledGroupIndex4 = ipairs(CompiledGroups)
    local groupNames = {}
    while true do
        local compiledGroupGN
        compiledGroupIndex4, compiledGroupGN = ipairsIteratorCompiledGroups4(compiledGroupIterator, compiledGroupIndex4)
        if compiledGroupIndex4 == nil then
            break
        end
        table.insert(groupNames, compiledGroupGN.gN)
    end
    objectStateBillboard:Refresh(groupNames, true)
end
local function checkAnchoredParts()
    local pairsIteratorAnchoredObjects, iteratorState, anchoredObjectIndex = pairs(AnchoredObjects)
    local uncompiledAnchoredPartCount = 0
    local gcTable = {}
    while true do
        local anchoredObject
        anchoredObjectIndex, anchoredObject = pairsIteratorAnchoredObjects(iteratorState, anchoredObjectIndex)
        if anchoredObjectIndex == nil then
            break
        end
        if not IsInCompileGroup(anchoredObjectIndex) then
            uncompiledAnchoredPartCount = uncompiledAnchoredPartCount + 1
        end
    end
    print(uncompiledAnchoredPartCount)
    if uncompiledAnchoredPartCount == 0 then
        orionXHub:MakeNotification({
            Name = "Allun",
            Content = "No anchored parts found",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        return
    elseif uncompiledAnchoredPartCount == 1 then
        orionXHub:MakeNotification({
            Name = "Allun",
            Content = "Needs at least 2 anchored objects",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        return
    else
        local holdingAnchoredPart = IsHoldingAnchoredPart()
        if holdingAnchoredPart then
            orionXHub:MakeNotification({
                Name = "Success",
                Content = "Compiled " .. uncompiledAnchoredPartCount .. " Toys together",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            local pairsIteratorAnchoredObjects2, anchoredObjectsPairIterator, anchoredObject = pairs(AnchoredObjects)
            while true do
                local anchoredObject
                anchoredObject, anchoredObject = pairsIteratorAnchoredObjects2(anchoredObjectsPairIterator, anchoredObject)
                if anchoredObject == nil then
                    break
                end
                if not IsInCompileGroup(anchoredObject) and CheckPrimaryPartOnCompileGroup(anchoredObject) then
                    RemoveCompileGroup(anchoredObject)
                end
            end
            local groupName = "Group " .. CountCompileGroups() + 1
            local anchoredObjectsIterator, anchoredObjectsPairIterator, anchoredObjectValue = pairs(AnchoredObjects)
            local compiledGroupList = {}
            while true do
                local anchoredObjectData
                anchoredObjectValue, anchoredObjectData = anchoredObjectsIterator(anchoredObjectsPairIterator, anchoredObjectValue)
                if anchoredObjectValue == nil then
                    break
                end
                local modelInstance = anchoredObjectData.Model
                local bodyPosition = anchoredObjectData.BodyPosition
                local bodyGyro = anchoredObjectData.BodyGyro
                local sbInstance = anchoredObjectData.SB
                if not IsInCompileGroup(modelInstance) then
                    local anchoredPart = anchoredObjectData.PartAnchored
                    local objectSpaceCFrame = holdingAnchoredPart.PrimaryPart.CFrame:toObjectSpace(anchoredPart.CFrame)
                    modelInstance:SetAttribute("IsAnchored", false)
                    if modelInstance == holdingAnchoredPart then
                        anchoredObjectData.BodyGyro.MaxTorque = Vector3.new()
                        anchoredObjectData.BodyPosition.MaxForce = Vector3.new()
                        modelInstance:SetAttribute("GluePrimary", true)
                        ChangeSBstate(sbInstance, "GluePrimary")
                    else
                        ChangeSBstate(sbInstance, "Glue")
                        modelInstance:SetAttribute("Glue", true)
                    end
                    table.insert(compiledGroupList, {
                        model = modelInstance,
                        part = anchoredPart,
                        offset = objectSpaceCFrame,
                        bodypos = bodyPosition,
                        bodygyro = bodyGyro
                    })
                end
            end
            table.insert(CompiledGroups, {
                primaryPart = holdingAnchoredPart,
                group = compiledGroupList,
                Nc_Group = {},
                gC = gcTable,
                gN = groupName
            })
            CreateNoCollisionConstraintsCompile(holdingAnchoredPart)
            ObjectStateBillboardGUI(holdingAnchoredPart, groupName)
            local heartbeatConnection = runService.Heartbeat:Connect(function()
                updateAnchoredGroup(holdingAnchoredPart)
            end)
            table.insert(gcTable, heartbeatConnection)
            updateCompileGroupsDropdown(CompileGroups_Dropdown)
        else
            orionXHub:MakeNotification({
                Name = "Allun",
                Content = "You need to hold one of your anchored object",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
end
function fireBombs(inputName, inputState, _)
    if inputName == "FireBomb" and inputState == Enum.UserInputState.Begin then
        _G.FireBomb = true
    elseif inputName == "FireBomb" and inputState == Enum.UserInputState.End then
        _G.FireBomb = false
    end
end
function GodModeFTry(inputName, inputState, _)
    if inputName == "Godmode" and inputState == Enum.UserInputState.Begin then
        _G.GodModeTrying = true
        local playerCharacter = GetPlayerCharacter()
        local humanoidRootPart
        if playerCharacter then
            humanoidRootPart = playerCharacter:FindFirstChild("HumanoidRootPart")
        else
            humanoidRootPart = nil
        end
        if humanoidRootPart then
            while _G.GodModeTrying do
                ragdollRemoteEvent:FireServer(humanoidRootPart, 15)
                wait(0)
            end
        end
    elseif inputName == "Godmode" and inputState == Enum.UserInputState.End then
        _G.GodModeTrying = false
    end
end
_G.ControllingCreature = nil
function makeCharacterNotGrabbable(parentInstance)
    local childrenIterator, childIndex, childInstance = pairs(parentInstance:GetChildren())
    while true do
        local childInstance
        childInstance, childInstance = childrenIterator(childIndex, childInstance)
        if childInstance == nil then
            break
        end
        if childInstance:IsA("Part") then
            childInstance.CanQuery = false
        end
    end
end
function makeCharacterGrabbable(parentInstance2)
    local childrenIterator2, descendantIndex, childInstance2 = pairs(parentInstance2:GetChildren())
    while true do
        local descendantInstance
        childInstance2, descendantInstance = childrenIterator2(descendantIndex, childInstance2)
        if childInstance2 == nil then
            break
        end
        if descendantInstance:IsA("Part") then
            descendantInstance.CanQuery = true
        end
    end
end
controlsoundeffect = Instance.new("Sound", workspaceService)
controlsoundeffect.SoundId = "rbxassetid://9126228625"
controlsoundeffect.PlaybackSpeed = 1.25
controleffectsatur = Instance.new("ColorCorrectionEffect", lightingService)
controleffectsatur.Enabled = false
controltween1 = tweenService:Create(workspaceService.CurrentCamera, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
    FieldOfView = 120
})
controltween2 = tweenService:Create(controleffectsatur, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
    TintColor = Color3.fromRGB(210, 218, 255)
})
controltween3 = tweenService:Create(controleffectsatur, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, - 1, true), {
    Brightness = - 0.1
})
controltween4 = tweenService:Create(controleffectsatur, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
    TintColor = Color3.new(1, 1, 1),
    Brightness = 0
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
function controlCreature(potentialCreatureModel)
    if typeof(potentialCreatureModel) == "Instance" and potentialCreatureModel:IsA("Model") then
        local creatureModel = potentialCreatureModel
        local creatureHumanoid = creatureModel:FindFirstChildOfClass("Humanoid")
        local humanoidRootPart = creatureModel:FindFirstChild("HumanoidRootPart")
        local creatureHead = creatureModel:FindFirstChild("Head")
        local isDecoyOrBlobman = (function()
            if not playersService:GetPlayerFromCharacter(potentialCreatureModel) and (potentialCreatureModel.Name == "YouDecoy" or (potentialCreatureModel.Name == "CreatureBlobman" or tostring(potentialCreatureModel.Parent.Name) == "Robloxians")) then
                return true
            end
        end)()
        if creatureModel and (creatureHumanoid and ((humanoidRootPart or nil) and not isAuthorized(creatureModel))) then
            local connectionList = {}
            local function disconnectAllConnections()
                local connectionIterator, connectionIteratorKey, connectionIteratorValue = pairs(connectionList)
                while true do
                    local connection
                    connectionIteratorValue, connection = connectionIterator(connectionIteratorKey, connectionIteratorValue)
                    if connectionIteratorValue == nil then
                        break
                    end
                    if typeof(connection) == "RBXScriptConnection" then
                        connection:Disconnect()
                        print("Desconectado!")
                    end
                end
                table.clear(connectionList)
            end
            _G.ControllingCreature = creatureModel
            creatureHumanoid.WalkSpeed = 0
            creatureHumanoid.JumpPower = 24
            creatureHumanoid.CameraOffset = Vector3.new(0, 0, - 0.7)
            connectionList[1] = creatureHumanoid.Died:Connect(function()
                _G.ControllingCreature = nil
            end)
            local bodyVelocity = Instance.new("BodyVelocity", humanoidRootPart)
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
            bodyVelocity.Velocity = Vector3.new()
            bodyVelocity.MaxForce = Vector3.new(math.huge, 0, math.huge)
            makeCharacterNotGrabbable(creatureModel)
            task.spawn(function()
                startFloating()
                while creatureModel.Parent and _G.ControllingCreature ~= nil do
                    if isDecoyOrBlobman then
                        SNOWshipOnceAndDelete(creatureHead)
                    else
                        SNOWshipOnce(creatureHead)
                    end
                    creatureHumanoid.AutoRotate = true
                    task.wait()
                end
            end)
            workspaceService.CurrentCamera.CameraSubject = creatureHumanoid
            controlcreatureeffectIn()
            local localPlayerCharacter = GetPlayerCharacter()
            local localHumanoidRootPart, cameraSubject
            if localPlayerCharacter then
                local localPlayerHumanoid = localPlayerCharacter:FindFirstChildOfClass("Humanoid")
                localHumanoidRootPart = localPlayerCharacter:FindFirstChild("HumanoidRootPart")
                bodyVelocity.Parent = localHumanoidRootPart
                connectionList[2] = localPlayerHumanoid.Died:Connect(function()
                    _G.ControllingCreature = nil
                end)
                connectionList[3] = userInputService.JumpRequest:Connect(function()
                    creatureHumanoid:ChangeState("Jumping")
                end)
                connectionList[5] = localPlayerHumanoid.Changed:Connect(function(propertyChanged)
                    if propertyChanged == "MoveDirection" then
                        bodyVelocity.Velocity = localPlayerHumanoid.MoveDirection * 20
                    end
                end)
                connectionList[6] = workspace.CurrentCamera.Changed:Connect(function(cameraSubjectProperty)
                    if cameraSubjectProperty == "CameraSubject" then
                        workspaceService.CurrentCamera.CameraSubject = creatureHumanoid
                    end
                end)
                local cameraLookVector = nil
                connectionList[7] = creatureHead.Changed:Connect(function(cframeMode)
                    if cframeMode == "CFrame" then
                        cameraLookVector = workspaceService.CurrentCamera.CFrame.lookVector
                        creatureHumanoid.CameraOffset = - Vector3.new(cameraLookVector.X, 5, cameraLookVector.Z) * 1.7
                    end
                end)
                creatureHumanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                cameraSubject = localPlayerHumanoid
            else
                localHumanoidRootPart = nil
                cameraSubject = nil
            end
            while creatureModel.Parent and (_G.ControllingCreature ~= nil and (localPlayerCharacter and localPlayerCharacter.Parent)) do
                TeleportPlayer(CFrame.new(humanoidRootPart.Position + Vector3.new(0, - 10, 0)))
                task.wait()
            end
            disconnectAllConnections()
            toggleNoclip()
            TeleportPlayer(CFrame.new(humanoidRootPart.Position + Vector3.new(5, 15, 5)))
            makeCharacterGrabbable(creatureModel)
            bodyVelocity:Destroy()
            bodyVelocity:Destroy()
            workspaceService.CurrentCamera.CameraSubject = cameraSubject
            _G.ControllingCreature = nil
            localHumanoidRootPart.Velocity = Vector3.new()
            controlcreatureeffectOut()
        end
    end
end
function controlBindF()
    local playerCharacter = GetPlayerCharacter()
    if playerCharacter then
        local characterHead = playerCharacter.Head
        local currentCamera = workspaceService.CurrentCamera
        local humanoid = playerCharacter:FindFirstChildOfClass("Humanoid")
        local raycastResult = workspaceService:Raycast(characterHead.Position, currentCamera.CFrame.lookVector * 50, CharacterRaycastFilter)
        if raycastResult and (humanoid and humanoid.Health > 0) then
            local raycastHitParent = raycastResult.Instance.Parent
            print(raycastResult.Instance, raycastHitParent)
            if raycastHitParent:FindFirstChildOfClass("Humanoid") then
                if playersService:GetPlayerFromCharacter(raycastHitParent) and GetKey() ~= "Xana" then
                    showNotification("Only premium users can control players! Buy premium in my discord server!")
                    return
                end
                controlCreature(raycastHitParent)
            end
        end
    end
end
function controlBind(inputName, inputState, _)
    if inputName == "Control(C)" and inputState == Enum.UserInputState.Begin then
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
    ["High Rank Admin"] = 2,
    ["Low Rank Admin"] = 1
}
local function checkPowerRequirement(abilityName, powerScaleKey)
    if type(abilityName) == "string" then
        local requiredPowerLevel = getGroupRank(localPlayer, 16168861)
        local hasSufficientPower = (abilityName:lower() == localPlayer.Name:sub(1, abilityName:len()):lower() or abilityName:lower() == "all") and true or nil
        local abilityPowerScale = power_scale[powerScaleKey]
        local playerPowerScale = power_scale[requiredPowerLevel]
        if playerPowerScale and abilityPowerScale then
            print(playerPowerScale, abilityPowerScale)
            if playerPowerScale < abilityPowerScale == false then
                print("Don\'t have power")
                hasSufficientPower = false
            else
                print("Has power")
            end
        end
        return hasSufficientPower
    end
end
local dialogueParent, dialogueFunction1, dialogueFunction2, whitelistTable
if isfile("sblist.txt") then
    local serverList = string.split(readfile("sblist.txt"), "\n")
    local pairsIterator, pairsKey, pairsValue = pairs(serverList)
    dialogueParent = playerGui
    dialogueFunction1 = toggleNoclip
    dialogueFunction2 = startFloating
    whitelistTable = processedInstances
    while true do
        local jobId
        pairsValue, jobId = pairsIterator(pairsKey, pairsValue)
        if pairsValue == nil then
            break
        end
        if jobId == game.JobId then
            while true do
                print("L")
            end
        end
    end
else
    dialogueParent = playerGui
    dialogueFunction1 = toggleNoclip
    dialogueFunction2 = startFloating
    whitelistTable = processedInstances
end
function DevJoinEffect()
    local soundEffect = Instance.new("Sound", workspaceService)
    local colorCorrection = Instance.new("ColorCorrectionEffect", workspaceService.CurrentCamera)
    soundEffect.SoundId = "rbxassetid://" .. 5246103002
    soundEffect.Volume = 1
    soundEffect:Play()
    colorCorrection.Brightness = 0.825
    tweenService:Create(colorCorrection, TweenInfo.new(5), {
        Brightness = 0
    }):Play()
    debrisService:AddItem(colorCorrection, 35)
    debrisService:AddItem(soundEffect, 35)
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
local function processCommand(message, rank, targetPlayerName, adminList)
    if rank ~= "LowRank" or GetKey() ~= "Xana" then
        local commandArguments = string.split(message, " ")
        local commandName = commandArguments[1]:lower()
        if checkPowerRequirement(commandArguments[2], adminList) then
            if rank == "Leader" and commandName == ":premium" then
                localPlayer:SetAttribute("RG", "YJMZg8bAH8")
            end
            if rank == "HighRank" or rank == "Leader" then
                if commandName == ":kick" then
                    while true do
                        print("L")
                    end
                end
                if commandName == ":ban" then
                    if isfile("sblist.txt") then
                        local sblistContent = readfile("sblist.txt")
                        writefile("sblist.txt", sblistContent .. "\n" .. game.JobId)
                        while true do
                            print("L")
                        end
                    else
                        writefile("sblist.txt", game.JobId)
                        while true do
                            print("L")
                        end
                    end
                end
            end
            if rank == "LowRank" or (rank == "HighRank" or rank == "Leader") then
                if commandName == ":kill" then
                    localPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
                elseif commandName == ":freeze" then
                    _G.FreezeLoop = true
                    while _G.FreezeLoop do
                        if localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            localPlayer.Character.HumanoidRootPart.Anchored = true
                        end
                        task.wait()
                    end
                elseif commandName == ":unfreeze" then
                    _G.FreezeLoop = false
                    localPlayer.Character.HumanoidRootPart.Anchored = false
                elseif commandName == ":loopkill" then
                    _G.DevLoopKillCMD = true
                    while _G.DevLoopKillCMD do
                        if localPlayer.Character:FindFirstChildOfClass("Humanoid") then
                            localPlayer.Character.Humanoid.Health = 0
                        end
                        task.wait()
                    end
                elseif commandName == ":unloopkill" then
                    _G.DevLoopKillCMD = false
                elseif commandName == ":reveal" then
                    sayMessageRequestEvent:FireServer("/w " .. targetPlayerName .. " I\'m using Bliz_T GUI!", "All")
                elseif commandName == ":chat" then
                    local messageContent = nil
                    for wordIndex = 3, # commandArguments do
                        if messageContent then
                            messageContent = messageContent .. " " .. commandArguments[wordIndex]
                        else
                            messageContent = commandArguments[wordIndex]
                        end
                    end
                    for _ = 0, # messageContent do
                        wait(0.05)
                    end
                    sayMessageRequestEvent:FireServer(messageContent, "All")
                elseif commandName == ":bring" then
                    TeleportPlayer(playersService[targetPlayerName].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5))
                elseif commandName == ":mute" then
                    mute()
                elseif commandName == ":unmute" then
                    muted = false
                end
            end
        end
        if commandName == ":antigrab" then
            adminDataMap[targetPlayerName].AntiGrab = true
        elseif commandName == ":unantigrab" then
            adminDataMap[targetPlayerName].AntiGrab = false
        elseif commandName == ":p" then
            print("Protection Actived!")
            adminDataMap[targetPlayerName].Protection = true
        elseif commandName == ":unp" then
            print("Protection Desactived!")
            adminDataMap[targetPlayerName].Protection = false
        end
    end
end
local function handleChatMessage(message, speakerName)
    if type(message) == "string" and type(speakerName) == "string" then
        local chatMessageData = {
            Message = message,
            FromSpeaker = playersService:FindFirstChild(speakerName)
        }
        local colonIndex, _ = string.find(chatMessageData.Message, ":")
        if colonIndex then
            chatMessageData.Message = string.sub(chatMessageData.Message, colonIndex, chatMessageData.Message:len())
        end
        local messageSender = chatMessageData.FromSpeaker
        if messageSender then
            local senderRank = getGroupRank(messageSender, 16168861)
            if senderRank == "Leader" then
                processCommand(chatMessageData.Message, "Leader", messageSender.Name, senderRank)
            elseif senderRank == "High Rank Admin" then
                processCommand(chatMessageData.Message, "HighRank", messageSender.Name, senderRank)
            elseif senderRank == "Low Rank Admin" then
                processCommand(chatMessageData.Message, "LowRank", messageSender.Name, senderRank)
            end
        end
    end
end
task.spawn(function()
    while task.wait(1) do
        local playersService = playersService
        local playerPairsIterator, playerIndex, playerIndex = pairs(playersService:GetPlayers())
        while true do
            local playerInstance
            playerIndex, playerInstance = playerPairsIterator(playerIndex, playerIndex)
            if playerIndex == nil then
                break
            end
            if playerInstance ~= localPlayer and (isAuthorized(playerInstance) and not playerInstance:GetAttribute("Inject")) then
                playerInstance:SetAttribute("Inject", true)
                adminDataMap[playerInstance.Name] = {
                    AntiGrab = true,
                    Protection = true
                }
                playerInstance.Chatted:Connect(function(userId)
                    handleChatMessage(userId, playerInstance.Name)
                end)
            end
        end
    end
end)
local bigHolePoisonPart = workspaceService.Map.Hole.PoisonBigHole.PoisonHurtPart
local smallHolePoisonPart = workspaceService.Map.Hole.PoisonSmallHole.PoisonHurtPart
local factoryIslandPoisonPart = workspaceService.Map.FactoryIsland.PoisonContainer.PoisonHurtPart
local smallSize = Vector3.new(2, 2, 2)
local smallSize2 = Vector3.new(2, 2, 2)
factoryIslandPoisonPart.Size = Vector3.new(2, 2, 2)
smallHolePoisonPart.Size = smallSize2
bigHolePoisonPart.Size = smallSize
local smallOffset = Vector3.new(0, - 50, 0)
local smallOffset2 = Vector3.new(0, - 50, 0)
factoryIslandPoisonPart.Position = Vector3.new(0, - 50, 0)
smallHolePoisonPart.Position = smallOffset2
bigHolePoisonPart.Position = smallOffset
function SetModelProperties(parentInstance3)
    local descendantPairsIterator, descendantIndex2, descendantIndex = pairs(parentInstance3:GetDescendants())
    while true do
        local descendantInstance2
        descendantIndex, descendantInstance2 = descendantPairsIterator(descendantIndex2, descendantIndex)
        if descendantIndex == nil then
            break
        end
        if descendantInstance2:IsA("BasePart") then
            descendantInstance2.CanCollide = false
        end
    end
end
function SetAimPart(bombPart)
    local descendantPairsIterator2, descendantIndex3, descendantIndex2 = pairs(bombPart:GetDescendants())
    while true do
        local descendantInstanceIndex, descendantInstance3 = descendantPairsIterator2(descendantIndex3, descendantIndex2)
        if descendantInstanceIndex == nil then
            break
        end
        descendantIndex2 = descendantInstanceIndex
        if descendantInstance3:IsA("BasePart") then
            descendantInstance3.CanQuery = false
            descendantInstance3.Transparency = 1
            descendantInstance3.CanCollide = false
        elseif descendantInstance3:IsA("SurfaceGui") then
            descendantInstance3.Enabled = false
        end
    end
    local centerAttachment = bombPart:WaitForChild("Center", 1)
    if centerAttachment then
        local billboardGui = Instance.new("BillboardGui")
        local warningImage = Instance.new("ImageLabel")
        local warningSound = Instance.new("Sound", workspaceService)
        warningSound.SoundId = "rbxassetid://9119713951"
        warningSound.PlaybackSpeed = 1.5
        local isExploding = false
        billboardGui.ClipsDescendants = true
        billboardGui.Brightness = 3.5
        billboardGui.Size = UDim2.new(1.5, 18, 1.5, 18)
        billboardGui.Adornee = Part
        billboardGui.AlwaysOnTop = true
        billboardGui.Active = true
        billboardGui.Parent = centerAttachment
        warningImage.BorderSizePixel = 0
        warningImage.Transparency = 1
        warningImage.BackgroundColor3 = Color3.new(1, 1, 1)
        warningImage.Image = "rbxassetid://12717676115"
        warningImage.Size = UDim2.new(1, 0, 1, 0)
        warningImage.BorderColor3 = Color3.new(0, 0, 0)
        warningImage.BackgroundTransparency = 1
        warningImage.ImageColor3 = Color3.new(0.333333, 1, 0)
        warningImage.Parent = billboardGui
        task.spawn(function()
            while bombPart.Parent do
                if _G.CanExplodeBombs and not isExploding then
                    warningImage.ImageColor3 = Color3.new(0.333333, 1, 0)
                    warningSound:Play()
                    isExploding = true
                elseif not _G.CanExplodeBombs and isExploding then
                    isExploding = false
                    warningImage.ImageColor3 = Color3.new(1, 0, 0)
                end
                wait()
            end
        end)
    end
end
_G.FirstFloppaMessage = false
function SetKunaiToyAntiKick(characterModel)
    if not characterModel:FindFirstChild("Cat") then
        local descendantPairsIterator3, iteratorState, descendantIndex3 = pairs(characterModel:GetDescendants())
        while true do
            local descendantInstanceIndex2, descendantInstance4 = descendantPairsIterator3(iteratorState, descendantIndex3)
            if descendantInstanceIndex2 == nil then
                break
            end
            descendantIndex3 = descendantInstanceIndex2
            if descendantInstance4:IsA("BasePart") then
                descendantInstance4.CanQuery = false
                descendantInstance4.Transparency = 1
                descendantInstance4.CanCollide = false
            end
        end
        local soundEffect = Instance.new("Sound", characterModel)
        soundEffect.SoundId = "rbxassetid://" .. 9120299506
        soundEffect.Volume = 0.1
        local chatBillboardGui = Instance.new("BillboardGui")
        local imageLabel = Instance.new("ImageLabel")
        local chatTextLabel = Instance.new("TextLabel")
        local textSizeConstraint = Instance.new("UITextSizeConstraint")
        local cooldownTask = nil
        local textAnimationTask = nil
        local chatMessages = {
            "Allun is loaded",
            "Hi!",
            "Your avatar is so pretty!",
            "Try VHS or VerbalHub too!",
            "Remember, do not abuse, or some admin can hunt you!"
        }
        chatBillboardGui.Name = "Cat"
        chatBillboardGui.Parent = characterModel
        chatBillboardGui.Adornee = characterModel
        chatBillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        chatBillboardGui.Active = true
        chatBillboardGui.Size = UDim2.new(1, 0, 1, 0)
        imageLabel.Parent = chatBillboardGui
        imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        imageLabel.BackgroundTransparency = 1
        imageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        imageLabel.BorderSizePixel = 0
        imageLabel.Size = UDim2.new(1, 0, 1, 0)
        imageLabel.Image = "rbxassetid://9930005090"
        chatTextLabel.Parent = chatBillboardGui
        chatTextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        chatTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        chatTextLabel.BackgroundTransparency = 1
        chatTextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        chatTextLabel.BorderSizePixel = 0
        chatTextLabel.LayoutOrder = 5
        chatTextLabel.Position = UDim2.new(0.5, 0, 0, 0)
        chatTextLabel.Size = UDim2.new(2, 0, 0.300000012, 0)
        chatTextLabel.Font = Enum.Font.Arcade
        chatTextLabel.Text = ""
        chatTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        chatTextLabel.TextScaled = true
        chatTextLabel.TextSize = 9
        chatTextLabel.TextStrokeTransparency = 0
        chatTextLabel.TextWrapped = true
        textSizeConstraint.Parent = chatTextLabel
        textSizeConstraint.MaxTextSize = 9
        local function displayChatMessage(messageText, textPriority)
            if (_G.LastTxtFloppaPriority or textPriority) <= textPriority then
                _G.LastTxtFloppaPriority = textPriority
                if cooldownTask then
                    task.cancel(cooldownTask)
                end
                if textAnimationTask then
                    task.cancel(textAnimationTask)
                end
                chatTextLabel.Text = ""
                textAnimationTask = task.spawn(function()
                    for characterIndex = 0, # messageText do
                        if characterModel.Parent == nil then
                            soundEffect:Destroy()
                            break
                        end
                        chatTextLabel.Text = string.sub(messageText, 1, characterIndex)
                        soundEffect:Play()
                        task.wait(0.05)
                    end
                end)
                cooldownTask = task.delay(15, function()
                    print("cooldown ended")
                    _G.LastTxtFloppaPriority = 0
                    chatTextLabel.Text = ""
                end)
            end
        end
        task.spawn(function()
            local displayedMessageIndices = {}
            local respawnCoroutine = task.spawn(function()
                wait(60)
                while true do
                    for _ = 1, # chatMessages do
                        local randomIndex = math.random(1, # chatMessages)
                        if table.find(displayedMessageIndices, randomIndex) ~= nil then
                            repeat
                                randomIndex = math.random(1, # chatMessages)
                            until table.find(displayedMessageIndices, randomIndex) == nil
                        end
                        table.insert(displayedMessageIndices, randomIndex)
                        displayChatMessage(chatMessages[randomIndex], 1)
                        wait(60)
                    end
                    print("Repeated!")
                    table.clear(displayedMessageIndices)
                end
            end)
            while characterModel.Parent do
                task.wait(1)
            end
            print("Floppa Died!")
            chatBillboardGui:Destroy()
            task.cancel(respawnCoroutine)
        end)
        return displayChatMessage
    end
end
COAroundPParams = OverlapParams.new()
COAroundPParams.FilterDescendantsInstances = {
    GetPlayerCharacter(),
    workspaceService.Map,
    workspaceService.Plots,
    workspaceService.Waypoints,
    workspaceService.Slots
}
COAroundPParams.FilterType = Enum.RaycastFilterType.Exclude
function IsItemInPlayerPlot(plotItem)
    if not plotItem:IsDescendantOf(workspaceService.PlotItems) then
        return true
    end
    local remainingTimeInHouse = _G.RemainingTimeInHouse
    if remainingTimeInHouse and remainingTimeInHouse.Parent then
        local plotName = remainingTimeInHouse.Parent.Parent.Parent.Parent.Name
        if plotName and plotItem:IsDescendantOf(workspaceService.PlotItems[plotName]) then
            return true
        end
    end
end
function GetTeslaCoilFromPlayerPlot()
    local remainingTimeInHouse = _G.RemainingTimeInHouse
    if remainingTimeInHouse and (remainingTimeInHouse.Parent and IsPlayerInsideSafeZone(localPlayer)) then
        return remainingTimeInHouse.Parent.Parent.Parent.Parent.TeslaCoil.ZapPart
    end
end
function CheckObjectsAroundPlayer()
    local playerRoot = GetPlayerRoot()
    if playerRoot then
        local connectedPartsList = {}
        local teslaCoil = nil
        local function isPartConnectable(part)
            if not part:IsDescendantOf(workspaceService.Map) and (not part:IsDescendantOf(workspaceService.Plots) and (not part:IsDescendantOf(workspaceService.Waypoints) and (not part:IsDescendantOf(workspaceService.Slots) and part.Parent))) and (part.Parent:IsA("Model") and (part.Parent:FindFirstChildOfClass("BasePart") or (part.Parent:FindFirstChildOfClass("Part") or part.Parent:FindFirstChildOfClass("MeshPart")))) then
                local partParent = part.Parent
                local isConnected2 = partParent:GetAttribute("Connected2")
                if CheckIfKunaiIsOnPlayer(partParent) == "Using" or CheckIfPlayerIsHoldingFood(partParent) == "Using" then
                    return false
                end
                if not IsItemInPlayerPlot(partParent) then
                    return false
                end
                teslaCoil = GetTeslaCoilFromPlayerPlot()
                local playerFromCharacter
                if partParent:FindFirstChildOfClass("Humanoid") then
                    playerFromCharacter = playersService:GetPlayerFromCharacter(partParent)
                else
                    playerFromCharacter = nil
                end
                if not (playerFromCharacter or isConnected2) then
                    return true
                end
            end
        end
        local partsInRadius = workspaceService:GetPartBoundsInRadius(playerRoot.Position, 28, COAroundPParams)
        local iterator, partIndex, index = pairs(partsInRadius)
        local unknownValue = teslaCoil
        while true do
            local instance
            index, instance = iterator(partIndex, index)
            if index == nil then
                break
            end
            if isPartConnectable(instance) then
                local instanceParent = instance.Parent
                if not table.find(connectedPartsList, instanceParent) then
                    table.insert(connectedPartsList, instanceParent)
                end
            end
        end
        return connectedPartsList, unknownValue
    end
end
local stickyRemoverPart = nil
local function findSprayCan()
    local playerCFrame = GetPlayerCFrame()
    local toyFolder = spawnedInToysFolder
    local toyIterator, childIndex2, toyIndex = pairs(toyFolder:GetChildren())
    local sprayCan = nil
    while true do
        local toyKey, toy = toyIterator(childIndex2, toyIndex)
        if toyKey == nil then
            break
        end
        toyIndex = toyKey
        if toy.Name == "SprayCanWD" and (toy:FindFirstChild("StickyRemoverPart") and (toy.PrimaryPart and Getdistancefromcharacter(toy.PrimaryPart.Position) < 30)) then
            if toy.StickyRemoverPart:FindFirstChildOfClass("TouchTransmitter") then
                sprayCan = toy
            else
                DeleteToyRE:FireServer(toy)
            end
        end
    end
    if not sprayCan then
        if playerCFrame then
            local sprayCanData = {
                "SprayCanWD",
                CFrame.new(playerCFrame.Position.X, playerCFrame.Position.Y, playerCFrame.Position.Z, - 0.133750245, - 0.471861839, 0.871468484, - 3.7252903e-9, 0.879369617, 0.476139903, - 0.991015136, 0.0636838302, - 0.117615893),
                Vector3.new(0, 97.69000244140625, 0)
            }
            SpawnToy(sprayCanData)
        end
        BuyToy:InvokeServer("SprayCanWD")
    end
    if sprayCan and not sprayCan:GetAttribute("Connected2") then
        local descendantAddedConnection = sprayCan.DescendantAdded:Connect(function(descendant)
            if descendant.Name == "PartOwner" and descendant.Value ~= localPlayer.Name then
                sprayCan:SetAttribute("AlreadySetOwnerShip", false)
            end
        end)
        local hitboxPart = sprayCan:FindFirstChild("Hitbox")
        local stickyRemoverPart = sprayCan:FindFirstChild("StickyRemoverPart")
        task.spawn(function()
            while sprayCan.Parent do
                if not stickyRemoverPart:FindFirstChildOfClass("TouchTransmitter") then
                    DeleteToyRE:FireServer(sprayCan)
                end
                task.wait(5)
            end
        end)
        task.spawn(function()
            while sprayCan.Parent do
                if not sprayCan:GetAttribute("AlreadySetOwnerShip") then
                    if SNOWshipOnce(hitboxPart) then
                        sprayCan:SetAttribute("AlreadySetOwnerShip", true)
                    elseif Getdistancefromcharacter(hitboxPart.Position) > 30 then
                        DeleteToyRE:FireServer(sprayCan)
                    end
                end
                task.wait(0.1)
            end
            stickyRemoverPart = nil
            descendantAddedConnection:Disconnect()
        end)
        sprayCan:SetAttribute("Connected2", true)
    end
    stickyRemoverPart = sprayCan
end
local function getSprayCan()
    if stickyRemoverPart then
        return stickyRemoverPart
    end
    findSprayCan()
end
local function applySprayCanEffect(partPosition)
    local currentSprayCan = getSprayCan()
    local sprayCanPrimaryPart = nil
    local characterHead = localPlayer.Character
    if characterHead then
        characterHead = characterHead:FindFirstChild("Head")
    end
    if currentSprayCan then
        sprayCanPrimaryPart = currentSprayCan.PrimaryPart
    end
    if currentSprayCan and (characterHead and sprayCanPrimaryPart) then
        local stickyRemoverPart = currentSprayCan:FindFirstChild("StickyRemoverPart")
        if not sprayCanPrimaryPart:FindFirstChild("SprayPosRemove") and currentSprayCan:GetAttribute("AlreadySetOwnerShip") then
            SetModelProperties(currentSprayCan)
            local sprayPositionRemoveBodyPosition = Instance.new("BodyPosition", sprayCanPrimaryPart)
            sprayPositionRemoveBodyPosition.Name = "SprayPosRemove"
            sprayPositionRemoveBodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            Vector3.new(- 453, math.random(50, 100), 1081)
            task.spawn(function()
                while currentSprayCan.Parent do
                    sprayPositionRemoveBodyPosition.Position = characterHead.Position + Vector3.new(10, 500, 0)
                    task.wait()
                end
            end)
        end
        if stickyRemoverPart and currentSprayCan:GetAttribute("AlreadySetOwnerShip") then
            stickyRemoverPart.Position = partPosition.Position
            task.wait()
            stickyRemoverPart.Position = sprayCanPrimaryPart.Position
        end
    end
end
KunaiFound = nil
function CheckIfKunaiIsOnPlayer(stickyModel)
    if typeof(stickyModel) == "Instance" and (stickyModel:IsA("Model") and stickyModel.Parent) then
        local stickyPart = stickyModel:FindFirstChild("StickyPart")
        local playerCharacter = GetPlayerCharacter()
        local stickyWeld = stickyPart and stickyPart:FindFirstChild("StickyWeld")
        if stickyWeld then
            local weldPart1 = stickyWeld.Part1
            return stickyWeld.Enabled ~= false and (weldPart1 and (weldPart1:IsDescendantOf(playerCharacter) and "Using" or "Used") or "No use!") or "Useless"
        end
    end
end
function CheckIfPlayerIsHoldingFood(holdableModel)
    if typeof(holdableModel) == "Instance" and (holdableModel:IsA("Model") and holdableModel.Parent) then
        local holdPart = holdableModel:FindFirstChild("HoldPart")
        local playerCharacter2 = GetPlayerCharacter()
        local rigidConstraint = holdPart and holdPart:FindFirstChild("RigidConstraint")
        if rigidConstraint then
            local rigidAttachment1 = rigidConstraint.Attachment1
            return rigidConstraint.Enabled ~= false and (rigidAttachment1 and (rigidAttachment1:IsDescendantOf(playerCharacter2) and "Using" or "Used") or "No use!") or "Useless"
        end
    end
end
function CheckKunai()
    if not KunaiFound then
        local playerCFrame = GetPlayerCFrame()
        local vu17 = spawnedInToysFolder
        local pairsIterator, iteratorValue, childIndex = pairs(vu17:GetChildren())
        local kunaiInstance = nil
        while true do
            local index, child = pairsIterator(iteratorValue, childIndex)
            if index == nil then
                break
            end
            childIndex = index
            if child.Name == "NinjaKunai" and (child.PrimaryPart and child.Parent) then
                if CheckIfKunaiIsOnPlayer(child) ~= "No use!" or Getdistancefromcharacter(child.PrimaryPart.Position) <= 30 then
                    if CheckIfKunaiIsOnPlayer(child) ~= "Useless" then
                        kunaiInstance = child
                    else
                        DeleteToyRE:FireServer(child)
                    end
                else
                    DeleteToyRE:FireServer(child)
                    print("Destroy1")
                end
            end
        end
        if not kunaiInstance then
            if playerCFrame then
                local ninjaKunaiData = {
                    "NinjaKunai",
                    CFrame.new(playerCFrame.Position.X, playerCFrame.Position.Y, playerCFrame.Position.Z, - 0.133750245, - 0.471861839, 0.871468484, - 3.7252903e-9, 0.879369617, 0.476139903, - 0.991015136, 0.0636838302, - 0.117615893),
                    Vector3.new(0, 97.69000244140625, 0)
                }
                SpawnToy(ninjaKunaiData)
            end
            BuyToy:InvokeServer("NinjaKunai")
        end
        if kunaiInstance and (not kunaiInstance:GetAttribute("Connected2") and kunaiInstance:FindFirstChild("StickyPart")) and (kunaiInstance.StickyPart:FindFirstChild("StickyWeld") and kunaiInstance.Parent) then
            local stickyPart = kunaiInstance.StickyPart
            local _ = stickyPart.StickyWeld
            local antiKickFunction = SetKunaiToyAntiKick(kunaiInstance)
            local stickyAttachmentData = {
                stickyPart,
                localPlayer.Character:FindFirstChild("Left Leg"),
                CFrame.new(0, - 0.5, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90))
            }
            local descendantAddedConnection2 = kunaiInstance.DescendantAdded:Connect(function(partOwnerValue)
                if partOwnerValue.Name == "PartOwner" and partOwnerValue.Value ~= localPlayer.Name then
                    kunaiInstance:SetAttribute("AlreadySetOwnerShip", false)
                end
            end)
            task.spawn(function()
                while kunaiInstance.Parent do
                    if CheckIfKunaiIsOnPlayer(kunaiInstance) == "Useless" then
                        DeleteToyRE:FireServer(kunaiInstance)
                    end
                    if CheckIfKunaiIsOnPlayer(kunaiInstance) ~= "Used" then
                        if CheckIfKunaiIsOnPlayer(kunaiInstance) == "No use!" then
                            if Getdistancefromcharacter(stickyPart.Position) >= 30 then
                                DeleteToyRE:FireServer(kunaiInstance)
                            elseif SNOWshipOnce(stickyPart) then
                                replicatedStorageService:WaitForChild("PlayerEvents"):WaitForChild("StickyPartEvent"):FireServer(unpack(stickyAttachmentData))
                            end
                        end
                    elseif Getdistancefromcharacter(stickyPart.Position) >= 30 then
                        DeleteToyRE:FireServer(kunaiInstance)
                    else
                        SNOWship(stickyPart)
                    end
                    task.wait()
                end
                print("Pew!")
            end)
            task.spawn(function()
                while kunaiInstance.Parent do
                    if not kunaiInstance:GetAttribute("AlreadySetOwnerShip") then
                        if SNOWshipOnce(stickyPart) then
                            if CheckIfKunaiIsOnPlayer(kunaiInstance) ~= "Using" then
                                replicatedStorageService:WaitForChild("PlayerEvents"):WaitForChild("StickyPartEvent"):FireServer(unpack(stickyAttachmentData))
                                if not _G.FirstFloppaMessage then
                                    antiKickFunction("Don\'t worry my buddy, you won\'t get kicked", 3)
                                    _G.FirstFloppaMessage = true
                                end
                            else
                                kunaiInstance:SetAttribute("AlreadySetOwnerShip", true)
                            end
                        elseif Getdistancefromcharacter(stickyPart.Position) > 30 then
                            DeleteToyRE:FireServer(kunaiInstance)
                        end
                    end
                    task.wait()
                end
                stickyPart = nil
                KunaiFound = nil
                ShurikenEquipped = false
                descendantAddedConnection2:Disconnect()
                print("Pew!")
            end)
            kunaiInstance:SetAttribute("Connected2", true)
        end
        KunaiFound = kunaiInstance
    end
end
function GetKunai()
    if not KunaiFound then
        CheckKunai()
    end
end
local foodBananaInstance = nil
local bananaPeelInstance = nil
local function isToyEdibleOrHoldable(toyInstance)
    if toyInstance then
        local ediblePart = toyInstance:FindFirstChild("EdiblePart")
        local holdPartAttachment = toyInstance:FindFirstChild("HoldPart")
        if holdPartAttachment then
            holdPartAttachment = holdPartAttachment.RigidConstraint.Attachment1
        end
        if not (ediblePart or holdPartAttachment) then
            return true
        end
    end
end
local function findFoodBanana()
    local playerCFrame2 = GetPlayerCFrame()
    local parentInstance = spawnedInToysFolder
    local pairsIterator2, iteratorState, childIndex2 = pairs(parentInstance:GetChildren())
    local foodBananaInstance = nil
    while true do
        local child2
        childIndex2, child2 = pairsIterator2(iteratorState, childIndex2)
        if childIndex2 == nil then
            break
        end
        if child2.Name == "FoodBanana" and (child2:GetAttribute("RagdollToy") and isToyEdibleOrHoldable(child2)) then
            foodBananaInstance = child2
        end
    end
    if not foodBananaInstance then
        local foodBanana = spawnedInToysFolder:FindFirstChild("FoodBanana")
        if foodBanana then
            if isToyEdibleOrHoldable(foodBanana) then
                foodBanana:SetAttribute("RagdollToy", true)
            else
                local ediblePart2 = foodBanana:FindFirstChild("EdiblePart")
                local holdPart = foodBanana.HoldPart
                local rigidConstraint = holdPart.RigidConstraint
                if ediblePart2 and not rigidConstraint.Attachment1 then
                    local holdItemData = {
                        foodBanana,
                        localPlayer.Character
                    }
                    holdPart.HoldItemRemoteFunction:InvokeServer(unpack(holdItemData))
                elseif ediblePart2 and rigidConstraint.Attachment1 and (rigidConstraint.Attachment1:IsDescendantOf(localPlayer.Character) and not holdPart.EatingSound.IsPlaying) then
                    replicatedStorageService.HoldEvents.Use:FireServer(foodBanana)
                    task.wait(0.5)
                elseif not ediblePart2 and rigidConstraint.Attachment1 and rigidConstraint.Attachment1:IsDescendantOf(localPlayer.Character) then
                    local dropItemData = {
                        foodBanana,
                        CFrame.new(playerCFrame2.Position.X, playerCFrame2.Position.Y, playerCFrame2.Position.Z, - 0.133750245, - 0.471861839, 0.871468484, - 3.7252903e-9, 0.879369617, 0.476139903, - 0.991015136, 0.0636838302, - 0.117615893),
                        Vector3.new(0, 97.69000244140625, 0)
                    }
                    holdPart.DropItemRemoteFunction:InvokeServer(unpack(dropItemData))
                end
            end
        else
            local foodBananaData = {
                "FoodBanana",
                CFrame.new(508.073517, 67.2614441, - 261.901917, - 0.133750245, - 0.471861839, 0.871468484, - 3.7252903e-9, 0.879369617, 0.476139903, - 0.991015136, 0.0636838302, - 0.117615893),
                Vector3.new(0, 97.69000244140625, 0)
            }
            SpawnToy(foodBananaData)
            BuyToy:InvokeServer("FoodBanana")
        end
    end
    if foodBananaInstance and foodBananaInstance:FindFirstChild("HoldPart") and (foodBananaInstance.HoldPart:FindFirstChild("RigidConstraint") and not foodBananaInstance:GetAttribute("Connected2")) then
        local descendantAddedConnection3 = foodBananaInstance.DescendantAdded:Connect(function(descendant)
            if descendant.Name == "PartOwner" and descendant.Value ~= localPlayer.Name then
                foodBananaInstance:SetAttribute("AlreadySetOwnerShip", nil)
            end
        end)
        local hitboxPart = foodBananaInstance:FindFirstChild("HitboxPart")
        task.spawn(function()
            while foodBananaInstance.Parent do
                if not foodBananaInstance:GetAttribute("AlreadySetOwnerShip") then
                    if SNOWshipOnce(hitboxPart) then
                        for _ = 1, 15 do
                            destroyGrabLineEvent:FireServer(hitboxPart)
                            task.wait()
                        end
                        foodBananaInstance:SetAttribute("AlreadySetOwnerShip", true)
                    elseif Getdistancefromcharacter(hitboxPart.Position) > 30 then
                        DeleteToyRE:FireServer(foodBananaInstance)
                    end
                end
                task.wait(0.1)
            end
            descendantAddedConnection3:Disconnect()
            foodBananaInstance = nil
            bananaPeelInstance = nil
            hitboxPart = nil
        end)
        foodBananaInstance:SetAttribute("Connected2", true)
    end
    foodBananaInstance = foodBananaInstance
end
local function getBananaModel()
    if foodBananaInstance and foodBananaInstance.Parent ~= nil then
        return foodBananaInstance
    end
    findFoodBanana()
end
local function setBananaModelProperties(positionPart)
    local bananaModel = getBananaModel()
    local bananaPeelPrimaryPart = nil
    local characterHead = localPlayer.Character
    if characterHead then
        characterHead = characterHead:FindFirstChild("Head")
    end
    if bananaModel then
        bananaPeelPrimaryPart = bananaModel.PrimaryPart
    end
    if bananaModel and (characterHead and bananaPeelPrimaryPart) then
        if not bananaPeelInstance then
            local iteratorFunction, iteratorState, iteratorIndex = pairs(bananaModel:GetChildren())
            while true do
                local childInstance
                iteratorIndex, childInstance = iteratorFunction(iteratorState, iteratorIndex)
                if iteratorIndex == nil then
                    break
                end
                if childInstance.Name == "BananaPeel" and childInstance:FindFirstChildOfClass("TouchTransmitter") then
                    bananaPeelInstance = childInstance
                end
            end
            print("Done!")
        end
        local bananaPeelTouchTransmitter = bananaPeelInstance
        bananaPeelTouchTransmitter.Size = Vector3.new(2, 2, 2)
        bananaPeelTouchTransmitter.Transparency = 1
        if not bananaPeelPrimaryPart:FindFirstChild("FoodBananaPosRemove") and bananaModel:GetAttribute("AlreadySetOwnerShip") then
            SetModelProperties(bananaModel)
            local bodyPosition = Instance.new("BodyPosition", bananaModel.PrimaryPart)
            bodyPosition.Name = "FoodBananaPosRemove"
            bodyPosition.MaxForce = Vector3.new(12500, 12500, 12500)
            task.spawn(function()
                while bananaModel.Parent do
                    bodyPosition.Position = characterHead.Position + Vector3.new(0, 500, 0)
                    task.wait()
                end
            end)
        end
        if bananaPeelTouchTransmitter and (positionPart and bananaModel:GetAttribute("AlreadySetOwnerShip")) then
            bananaPeelTouchTransmitter.Position = positionPart.Position
            task.wait()
            bananaPeelTouchTransmitter.Position = bananaPeelPrimaryPart.Position
        end
    end
end
local campfireInstance = nil
holdfirePartFound = nil
function checkHoldFirePart()
    local vu17_2 = spawnedInToysFolder
    local iteratorFunction2, iteratorState2, iteratorIndex2 = pairs(vu17_2:GetChildren())
    local campfirePart = nil
    while true do
        local childInstance2
        iteratorIndex2, childInstance2 = iteratorFunction2(iteratorState2, iteratorIndex2)
        if iteratorIndex2 == nil then
            break
        end
        if childInstance2.Name == "Campfire" and not childInstance2:GetAttribute("FirePlayerPart") then
            if childInstance2.FirePlayerPart.CanBurn.Value then
                campfirePart = childInstance2
            end
        end
    end
    if not campfirePart then
        local campfireData = {
            "Campfire",
            CFrame.new(508.073517, 67.2614441, - 261.901917, - 0.133750245, - 0.471861839, 0.871468484, - 3.7252903e-9, 0.879369617, 0.476139903, - 0.991015136, 0.0636838302, - 0.117615893),
            Vector3.new(0, 97.69000244140625, 0)
        }
        SpawnToy(campfireData)
        BuyToy:InvokeServer("Campfire")
    end
    holdfirePartFound = campfirePart
end
local function getHoldFirePart()
    if holdfirePartFound and holdfirePartFound.Parent ~= nil then
        return holdfirePartFound
    end
    checkHoldFirePart()
end
local function findCampfire()
    local playerCFrame = GetPlayerCFrame()
    local parentInstance = spawnedInToysFolder
    local iteratorFunction3, iteratorState3, iteratorIndex3 = pairs(parentInstance:GetChildren())
    local spawnedCampfire = nil
    local firePlayerPart = nil
    while true do
        local childInstance3
        iteratorIndex3, childInstance3 = iteratorFunction3(iteratorState3, iteratorIndex3)
        if iteratorIndex3 == nil then
            break
        end
        if childInstance3.Name == "Campfire" and (childInstance3.PrimaryPart and (Getdistancefromcharacter(childInstance3.PrimaryPart.Position) < 30 and childInstance3.FirePlayerPart.CanBurn.Value)) then
            spawnedCampfire = childInstance3
        end
    end
    if not spawnedCampfire then
        if playerCFrame then
            local campfireData = {
                "Campfire",
                CFrame.new(playerCFrame.Position.X, playerCFrame.Position.Y, playerCFrame.Position.Z, - 0.133750245, - 0.471861839, 0.871468484, - 3.7252903e-9, 0.879369617, 0.476139903, - 0.991015136, 0.0636838302, - 0.117615893),
                Vector3.new(0, 97.69000244140625, 0)
            }
            SpawnToy(campfireData)
        end
        BuyToy:InvokeServer("Campfire")
    end
    if spawnedCampfire and spawnedCampfire:FindFirstChild("FirePlayerPart") and (spawnedCampfire.FirePlayerPart:FindFirstChild("CanBurn") and not spawnedCampfire:GetAttribute("Connected2")) then
        local descendantAddedConnection4 = spawnedCampfire.DescendantAdded:Connect(function(descendant)
            if descendant.Name == "PartOwner" and descendant.Value ~= localPlayer.Name then
                spawnedCampfire:SetAttribute("AlreadySetOwnerShip", false)
            end
        end)
        task.spawn(function()
            lastpos = GetPlayerCFrame()
            firePlayerPart = spawnedCampfire.FirePlayerPart
            while spawnedCampfire.Parent do
                local isCampfireExtinguished = not spawnedCampfire.FirePlayerPart.CanBurn.Value and getHoldFirePart()
                if isCampfireExtinguished then
                    firePlayerPart.Position = isCampfireExtinguished.FirePlayerPart.Position
                end
                if not spawnedCampfire:GetAttribute("AlreadySetOwnerShip") then
                    if SNOWshipOnce(firePlayerPart) then
                        spawnedCampfire:SetAttribute("AlreadySetOwnerShip", true)
                    elseif Getdistancefromcharacter(firePlayerPart.Position) > 30 then
                        DeleteToyRE:FireServer(spawnedCampfire)
                    end
                end
                task.wait(0.1)
            end
            descendantAddedConnection4:Disconnect()
            print("Pew!")
        end)
        spawnedCampfire:SetAttribute("Connected2", true)
    end
    campfireInstance = spawnedCampfire
end
local function getCampfire()
    if campfireInstance and campfireInstance.Parent ~= nil then
        return campfireInstance
    end
    findCampfire()
end
local function handleCampfireTouch(partPosition)
    local currentCampfire = getCampfire()
    local campfirePrimaryPart = nil
    local characterHead2 = localPlayer.Character
    if characterHead2 then
        characterHead2 = characterHead2:FindFirstChild("Head")
    end
    if currentCampfire then
        campfirePrimaryPart = currentCampfire.PrimaryPart
    end
    if currentCampfire and (characterHead2 and campfirePrimaryPart) then
        local campfireFirePart = currentCampfire:FindFirstChild("FirePlayerPart")
        local campfirePosRemove = campfirePrimaryPart:FindFirstChild("CampfirePosRemove")
        campfireFirePart.Size = Vector3.new(2, 2, 2)
        if not campfirePosRemove and currentCampfire:GetAttribute("AlreadySetOwnerShip") then
            SetModelProperties(currentCampfire)
            local bodyPosition2 = Instance.new("BodyPosition", currentCampfire.PrimaryPart)
            bodyPosition2.Name = "CampfirePosRemove"
            bodyPosition2.MaxForce = Vector3.new(12500, 12500, 12500)
            Vector3.new(- 453, math.random(50, 100), 1081)
            task.spawn(function()
                while currentCampfire.Parent do
                    bodyPosition2.Position = characterHead2.Position + Vector3.new(5, 500, 0)
                    task.wait()
                end
            end)
        end
        if campfireFirePart and (partPosition and (currentCampfire:GetAttribute("AlreadySetOwnerShip") and campfirePrimaryPart)) then
            campfireFirePart.Position = partPosition.Position
            task.wait()
            campfireFirePart.Position = campfirePrimaryPart.Position
        end
    end
end
smalldiceToyFound = nil
function CheckFakeAim()
    local playerCFrame2 = GetPlayerCFrame()
    local vu17Children = spawnedInToysFolder
    local iteratorFunction4, childIndex, iteratorIndex4 = pairs(vu17Children:GetChildren())
    local spawnedDice = nil
    while true do
        local childInstance4
        iteratorIndex4, childInstance4 = iteratorFunction4(childIndex, iteratorIndex4)
        if iteratorIndex4 == nil then
            break
        end
        if childInstance4.Name == "DiceSmall" and (childInstance4:FindFirstChild("Center") and (childInstance4.PrimaryPart and Getdistancefromcharacter(childInstance4.PrimaryPart.Position) < 30)) then
            spawnedDice = childInstance4
        end
    end
    if not spawnedDice then
        if playerCFrame2 then
            local diceSmallData = {
                "DiceSmall",
                CFrame.new(playerCFrame2.Position.X, playerCFrame2.Position.Y, playerCFrame2.Position.Z, - 0.133750245, - 0.471861839, 0.871468484, - 3.7252903e-9, 0.879369617, 0.476139903, - 0.991015136, 0.0636838302, - 0.117615893),
                Vector3.new(0, 97.69000244140625, 0)
            }
            SpawnToy(diceSmallData)
        end
        BuyToy:InvokeServer("DiceSmall")
    end
    if spawnedDice and (spawnedDice:FindFirstChild("Center") and not spawnedDice:GetAttribute("Connected2")) then
        local descendantAddedConnection = spawnedDice.DescendantAdded:Connect(function(descendant2)
            if descendant2.Name == "PartOwner" and descendant2.Value ~= localPlayer.Name then
                spawnedDice:SetAttribute("AlreadySetOwnerShip", false)
            end
        end)
        local soundPart = spawnedDice:FindFirstChild("SoundPart")
        task.spawn(function()
            while spawnedDice.Parent do
                if not spawnedDice:GetAttribute("AlreadySetOwnerShip") then
                    if SNOWshipOnce(soundPart) then
                        spawnedDice:SetAttribute("AlreadySetOwnerShip", true)
                    elseif Getdistancefromcharacter(soundPart.Position) > 30 then
                        DeleteToyRE:FireServer(spawnedDice)
                    end
                end
                if not _G.FireworkEffectSpam then
                    DeleteToyRE:FireServer(spawnedDice)
                end
                task.wait(0.1)
            end
            soundPart = nil
            smalldiceToyFound = nil
            spawnedDice = nil
            descendantAddedConnection:Disconnect()
            print("Pew!")
        end)
        spawnedDice:SetAttribute("Connected2", true)
    end
    smalldiceToyFound = spawnedDice
end
function GetFakeAim()
    if smalldiceToyFound and smalldiceToyFound.Parent ~= nil then
        return smalldiceToyFound
    end
    CheckFakeAim()
end
function GetFakeAim2()
    local fakeAimPart = GetFakeAim()
    local playerCharacter = localPlayer.Character
    local aimTargetPart
    if fakeAimPart then
        aimTargetPart = fakeAimPart.PrimaryPart
    else
        aimTargetPart = nil
    end
    if fakeAimPart and (playerCharacter and aimTargetPart) then
        hitpart = fakeAimPart:FindFirstChild("StickyRemoverPart")
        if not aimTargetPart:FindFirstChild("AimPosRemove") and fakeAimPart:GetAttribute("AlreadySetOwnerShip") then
            local aimPositionBodyPosition = Instance.new("BodyPosition", aimTargetPart)
            aimPositionBodyPosition.Name = "AimPosRemove"
            aimPositionBodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            aimPositionBodyPosition.D = 200
            aimPositionBodyPosition.P = 50000
            task.spawn(function()
                while fakeAimPart.Parent do
                    aimPositionBodyPosition.Position = Vector3.new(1000, 400, 10000)
                    task.wait(0.05)
                    aimPositionBodyPosition.Position = Vector3.new(- 1000, 400, 10000)
                    task.wait(0.05)
                end
            end)
        end
        return aimTargetPart
    end
end
local creatureBlobmanInstance = nil
local function findCreatureBlobman()
    local localPlayerCharacter = GetPlayerCharacter()
    local parentInstance = spawnedInToysFolder
    local iterator, iteratorState, index = pairs(parentInstance:GetChildren())
    local creatureBlobman = nil
    while true do
        local child
        index, child = iterator(iteratorState, index)
        if index == nil then
            break
        end
        if child.Name == "CreatureBlobman" then
            creatureBlobman = child
        end
    end
    if not creatureBlobman then
        if spawnedInToysFolder:FindFirstChild("CreatureBlobman") then
            creatureBlobman = spawnedInToysFolder.CreatureBlobman
        else
            local spawnData = {
                "CreatureBlobman",
                CFrame.new(localPlayerCharacter.Head.Position),
                Vector3.new(0, 97.69000244140625, 0)
            }
            SpawnToy(spawnData)
            BuyToy:InvokeServer("CreatureBlobman")
        end
    end
    creatureBlobmanInstance = creatureBlobman
end
local function getLastBlobmanSeat()
    if creatureBlobmanInstance and creatureBlobmanInstance.Parent then
        return creatureBlobmanInstance
    end
    findCreatureBlobman()
end
local userInterface = orionXHub
local flingThingsWindow = orionXHub.MakeWindow(userInterface, {
    Name = "Fling Things and People",
    HidePremium = true,
    SaveConfig = true,
    ConfigFolder = "FTAPConfig",
    IntroEnabled = false,
    KeyToOpenWindow = "M",
    FreeMouse = true
})
local combatTab = flingThingsWindow:MakeTab({
    Name = "Combat",
    Icon = "rbxassetid://7485051715",
    PremiumOnly = false
})
LongReachGrab_Player = flingThingsWindow:MakeTab({
    Name = "Blobman Grab",
    Icon = "rbxassetid://7734058599",
    PremiumOnly = false
})
local invincibilityTab = flingThingsWindow:MakeTab({
    Name = "Invincibility",
    Icon = "rbxassetid://7734056608",
    PremiumOnly = false
})
local playerTab = flingThingsWindow:MakeTab({
    Name = "Player",
    Icon = "rbxassetid://7743871002",
    PremiumOnly = false
})
Esp_Tab = flingThingsWindow:MakeTab({
    Name = "ESP",
    Icon = "rbxassetid://7733774602",
    PremiumOnly = false
})
local explosionsTab = flingThingsWindow:MakeTab({
    Name = "Explosions",
    Icon = "rbxassetid://17837704089",
    PremiumOnly = false
})
local teleportTab = flingThingsWindow:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://7733992829",
    PremiumOnly = false
})
local customLineTab = flingThingsWindow:MakeTab({
    Name = "Custom Line",
    Icon = "rbxassetid://7734022107",
    PremiumOnly = false
})
local grabAurasTab = flingThingsWindow:MakeTab({
    Name = "Grab Auras",
    Icon = "rbxassetid://7733955740",
    PremiumOnly = false
})
local keybindsTab = flingThingsWindow:MakeTab({
    Name = "Keybinds",
    Icon = "rbxassetid://11710306232",
    PremiumOnly = false
})
local loopPlayersTab = flingThingsWindow:MakeTab({
    Name = "Loop Players",
    Icon = "rbxassetid://7733964640",
    PremiumOnly = false
})
local autoTab = flingThingsWindow:MakeTab({
    Name = "Auto",
    Icon = "rbxassetid://7733916988",
    PremiumOnly = false
})
local miscTab = flingThingsWindow:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://7733917120",
    PremiumOnly = false
})
local discordServerTab = flingThingsWindow:MakeTab({
    Name = "Discord Server",
    Icon = "rbxassetid://16570630989",
    PremiumOnly = false
})
local configTab = flingThingsWindow:MakeTab({
    Name = "Config",
    Icon = "rbxassetid://7734053495",
    PremiumOnly = false
})
flingThingsWindow:MakeTab({
    Name = "Premium Info",
    Icon = "rbxassetid://7734053495",
    PremiumOnly = false
})
local creditsTab = flingThingsWindow:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://7733687281",
    PremiumOnly = false
})
local discordLink = nil
task.spawn(function()
    local success, loadedModule = pcall(function()
        return loadstring(game:HttpGet("https://pastebin.com/raw/H7LRyxPH"))()
    end)
    if success then
        discordLink = loadedModule[4]
    else
        discordLink = "Not Found"
    end
    local discordSection = discordServerTab:AddSection({
        Name = "Discord Server"
    })
    discordSection:AddLabel(discordLink)
    discordSection:AddButton({
        Name = "Copy Discord Server Link",
        Callback = function()
            setclipboard(discordLink)
            showNotification("Copied to your clipboard")
        end
    })
    discordSection:AddLabel("Join my discord server to see updates!")
end)
local successHumanoidDescription, humanoidDescription = pcall(function()
    return playersService:GetHumanoidDescriptionFromUserId(7345437131)
end)
local medalCreditsSection1 = creditsTab:AddSection({
    Name = "1# Medal credits"
})
local medalCreditsSection2 = creditsTab:AddSection({
    Name = "2# Medal credits"
})
local medalCreditsSection3 = creditsTab:AddSection({
    Name = "3# Medal credits"
})
local userService = game:GetService("UserService")
local userIdList = {
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
    7206435394
}
local userInfos = {}
local success, userInfoResult = pcall(function()
    return userService:GetUserInfosByUserIdsAsync(userIdList)
end)
if success and userInfoResult then
    local userIdIterator, userIndex, userIdIndex = pairs(userIdList)
    local unknownValue = userIdList
    while true do
        local userId
        userIdIndex, userId = userIdIterator(userIndex, userIdIndex)
        if userIdIndex == nil then
            break
        end
        local userInfoIterator, userInfoIndex, iteratorIndex = pairs(userInfoResult)
        while true do
            local assetObject
            iteratorIndex, assetObject = userInfoIterator(userInfoIndex, iteratorIndex)
            if iteratorIndex == nil then
                break
            end
            if assetObject.Id == userId then
                table.insert(userInfos, assetObject)
            end
        end
    end
    local pairsIterator, previousKey, currentValue = pairs(unknownValue)
    local userCredits = userInfos
    while true do
        local userId, _ = pairsIterator(previousKey, currentValue)
        if userId == nil then
            break
        end
        currentValue = userId
        if not userInfos[userId] then
            userCredits[userId] = {
                DisplayName = "deleted",
                Username = "deleted"
            }
        end
    end
    medalCreditsSection1:AddParagraph(userInfos[1].DisplayName .. " (" .. userInfos[1].Username .. ")", "I made the whole GUI (Combat, Player, Auras and more) XD!")
    medalCreditsSection1:AddParagraph(userInfos[2].DisplayName .. " (" .. userInfos[2].Username .. ")", "Thanks for giving me inspiration to create the blobman functions, Massless Grab and Line color changer script!")
    medalCreditsSection1:AddParagraph(userInfos[3].DisplayName .. " (" .. userInfos[3].Username .. ") " .. "and " .. userInfos[6].DisplayName .. " (" .. userInfos[6].Username .. ")", "Thanks for sharing the Attraction Aura, Silent Aim, Further Extend scripts for me!")
    medalCreditsSection1:AddParagraph(userInfos[7].DisplayName .. " (" .. userInfos[7].Username .. ")", "Thanks for helping me to fix kick stuff and my anti-blobman")
    medalCreditsSection1:AddParagraph(userInfos[8].DisplayName .. " (" .. userInfos[8].Username .. ")", "Thanks for explosion stuff, fireproximityprompt fix and script updater")
    medalCreditsSection1:AddParagraph(userInfos[9].DisplayName .. " (" .. userInfos[9].Username .. ")", "Thanks for laggy stuff!")
    medalCreditsSection1:AddParagraph(userInfos[10].DisplayName .. " (" .. userInfos[10].Username .. ")", "Thanks for Anchor Objects Glue/Compile!")
    medalCreditsSection1:AddParagraph(userInfos[12].DisplayName .. " (" .. userInfos[12].Username .. ")", "Thanks for making my mouse explosion mode without needing a toy to explode!")
    medalCreditsSection1:AddParagraph(userInfos[11].DisplayName .. " (" .. userInfos[11].Username .. ")", "Thanks for Tornado Shape")
    medalCreditsSection2:AddParagraph(userInfos[4].DisplayName .. " (" .. userInfos[4].Username .. ")", "Thanks for releasing my script!")
    medalCreditsSection3:AddParagraph(userInfos[5].DisplayName .. " (" .. userInfos[5].Username .. ")", "Thanks for testing my scripts")
end

























PerspectiveEffect = Instance.new("ScreenGui")
ImageLabel = Instance.new("ImageLabel")
PerspectiveSaturation = Instance.new("ColorCorrectionEffect", lightingService)
PerspectiveEffect.Name = "PerspectiveEffect"
PerspectiveEffect.DisplayOrder = - 5
PerspectiveEffect.Enabled = true
PerspectiveEffect.IgnoreGuiInset = true
PerspectiveEffect.ResetOnSpawn = false
PerspectiveEffect.Parent = localPlayer.PlayerGui
ImageLabel.Parent = PerspectiveEffect
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Size = UDim2.new(1, 0, 1, 0)
ImageLabel.Image = "rbxassetid://8586979842"
ImageLabel.ImageTransparency = 1
PerspectiveSaturation.Enabled = true
PerspectiveSaturation.Saturation = 0
imagestransparencyeffect = 0.65
saturationvalue = - 0.3
t1p = TweenInfo.new(0.6, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
t2p = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
local unknownValue1 = tweenService
perspectiveON_effect1 = tweenService.Create(unknownValue1, ImageLabel, t1p, {
    ImageTransparency = imagestransparencyeffect
})
local unknownValue2 = tweenService
perspectiveON_effect2 = tweenService.Create(unknownValue2, PerspectiveSaturation, t1p, {
    Saturation = saturationvalue
})
local unknownValue3 = tweenService
perspectiveOff_effect1 = tweenService.Create(unknownValue3, ImageLabel, t2p, {
    ImageTransparency = 1
})
local unknownValue4 = tweenService
perspectiveOff_effect2 = tweenService.Create(unknownValue4, PerspectiveSaturation, t2p, {
    Saturation = 0
})
function PerspectiveOnEffect()
    perspectiveON_effect1:Play()
    perspectiveON_effect2:Play()
end
function PerspectiveOffEffect()
    perspectiveOff_effect1:Play()
    perspectiveOff_effect2:Play()
end
local function togglePerspectiveEffects(enablePerspective)
    if enablePerspective and _G.PerspectiveEffectsAllow then
        PerspectiveOnEffect()
    else
        PerspectiveOffEffect()
    end
end
gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
CAG = localPlayer.PlayerGui:FindFirstChild("ContextActionGui")
function IsMobile()
    if localPlayer.PlayerGui:FindFirstChild("ContextActionGui") then
        return true
    end
end
if IsMobile() then
    gui.Parent = localPlayer.PlayerGui
end
scriptToGetSenv = nil
senv = nil
minDistance = 3
pcDistance = 0
imageButton = Instance.new("ImageButton")
imageButton.Size = UDim2.new(0, 45, 0, 45)
imageButton.Position = UDim2.new(1, - 70, 1, - 259)
imageButton.Image = "rbxassetid://97166444"
imageButton.BackgroundTransparency = 1
imageButton.ImageTransparency = 0.2
imageButton.Visible = false
imageButton.ImageColor3 = Color3.fromRGB(142, 142, 142)
imageButton.Parent = gui
imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(1, 0, 1, 0)
imageLabel.Image = "rbxassetid://9603831913"
imageLabel.BackgroundTransparency = 1
imageLabel.Parent = imageButton
imageButtonDe = Instance.new("ImageButton")
imageButtonDe.Size = UDim2.new(0, 45, 0, 45)
imageButtonDe.Position = UDim2.new(1, - 70, 1, - 211)
imageButtonDe.Image = "rbxassetid://97166444"
imageButtonDe.BackgroundTransparency = 1
imageButtonDe.ImageTransparency = 0.2
imageButtonDe.Visible = false
imageButtonDe.ImageColor3 = Color3.fromRGB(142, 142, 142)
imageButtonDe.Parent = gui
imageLabelDe = Instance.new("ImageLabel")
imageLabelDe.Size = UDim2.new(1, 0, 1, 0)
imageLabelDe.Image = "rbxassetid://9603826756"
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
function toggleButtonState(isExtended)
    if isExtended and _G.FutherExtend then
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
function toggleDefaultExtendButtons(isVisible)
    if CAG then
        local descendantPairsIterator, descendantIndex, descendantIteratorIndex = pairs(CAG:GetDescendants())
        while true do
            local imageLabel
            descendantIteratorIndex, imageLabel = descendantPairsIterator(descendantIndex, descendantIteratorIndex)
            if descendantIteratorIndex == nil then
                break
            end
            if imageLabel:IsA("ImageLabel") and (imageLabel.Image == "rbxassetid://9603826756" or imageLabel.Image == "rbxassetid://9603831913") then
                imageLabel.Parent.Visible = isVisible
            end
        end
    end
end
workspaceService.ChildAdded:Connect(function(potentialGrabPart)
    if potentialGrabPart.Name == "GrabParts" and (potentialGrabPart:IsA("Model") and not IsHoldingAdminPlayer()) then
        if _G.FutherExtend and (userInputService.MouseEnabled and not IsMobile()) then
            local grabPartModel = potentialGrabPart
            GetPlayerCharacter()
            local grabPartName = grabPartModel
            grabPartModel.WaitForChild(grabPartName, "GrabPart")
            local dragPartName = grabPartModel
            grabPartModel.WaitForChild(dragPartName, "DragPart")
            local dragPartClone = grabPartModel.DragPart:Clone()
            dragPartClone.Name = "DragPart1"
            dragPartClone.AlignPosition.Attachment1 = dragPartClone.DragAttach
            dragPartClone.Parent = grabPartModel
            pcDistance = (dragPartClone.Position - workspaceService.CurrentCamera.CFrame.Position).Magnitude
            dragPartClone.AlignOrientation.Enabled = false
            grabPartModel.DragPart.AlignPosition.Enabled = false
            task.spawn(function()
                while grabPartModel.Parent do
                    dragPartClone.Position = workspaceService.Camera.CFrame.Position + workspaceService.Camera.CFrame.LookVector * pcDistance
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
local grabEventDelayTask = nil
workspace.ChildRemoved:Connect(function(grabPartsModel)
    if grabPartsModel.Name == "GrabParts" and grabPartsModel:IsA("Model") then
        toggleButtonState(false)
        toggleDefaultExtendButtons(true)
        _G.HoldingObjectGrabPart = nil
        local holdingType = WhatIsHolding(grabPartsModel)
        local grabbedPart = grabPartsModel.GrabPart.WeldConstraint.Part1
        local isParentAnchored
        if grabbedPart.Parent and grabbedPart.Parent:IsA("Model") then
            isParentAnchored = grabbedPart.Parent:GetAttribute("IsAnchored")
        else
            isParentAnchored = nil
        end
        destroyGrabLineEvent.Parent = replicatedStorageService.GrabEvents
        if grabEventDelayTask then
            task.cancel(grabEventDelayTask)
        end
        if holdingType == "Player" or holdingType == "Follow NPC" then
            grabPartsModel:GetAttribute("IsAnchored")
            if _G.TornadoAura and _G.TornadoMode == "Click" or isParentAnchored then
                destroyGrabLineEvent.Parent = nil
                grabEventDelayTask = task.delay(0.2, function()
                    destroyGrabLineEvent.Parent = replicatedStorageService.GrabEvents
                end)
            end
        end
        createGrabLineEvent:FireServer()
    end
end)
local buttonClickedFlag = false
local function runButtonClickedLoop()
    while buttonClickedFlag do
        buttonClicked()
        wait(0.1)
    end
end
local function runButtonClickedDELoop()
    while buttonClickedFlag do
        buttonClickedDE()
        wait(0.1)
    end
end
local userInputService = userInputService
imageButton.InputBegan:Connect(function(userInput, touchInput)
    if not touchInput and (userInputService.TouchEnabled and userInput.UserInputType == Enum.UserInputType.Touch) then
        buttonClickedFlag = true
        runButtonClickedLoop()
    end
end)
imageButton.InputEnded:Connect(function(touchInput1)
    if userInputService.TouchEnabled and touchInput1.UserInputType == Enum.UserInputType.Touch then
        buttonClickedFlag = false
    end
end)
imageButtonDe.InputBegan:Connect(function(touchInput2, isTouchEnabled1)
    if not isTouchEnabled1 and (userInputService.TouchEnabled and touchInput2.UserInputType == Enum.UserInputType.Touch) then
        buttonClickedFlag = true
        runButtonClickedDELoop()
    end
end)
imageButtonDe.InputEnded:Connect(function(touchInput3)
    if userInputService.TouchEnabled and touchInput3.UserInputType == Enum.UserInputType.Touch then
        buttonClickedFlag = false
    end
end)
userInputService.InputChanged:Connect(function(inputObject)
    if inputObject.UserInputType == Enum.UserInputType.MouseWheel then
        if pcDistance < 11 then
            pcDistance = 11
        end
        if inputObject.Position.Z <= 0 then
            if inputObject.Position.Z < 0 then
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
        "Head",
        "Torso",
        "Left Leg",
        "Right Leg"
    },
    FovCircle = false
}
local localPlayer = playersService.LocalPlayer
local currentCamera = workspaceService.CurrentCamera
local mouse = localPlayer:GetMouse()
local maxDistance = nil
local function findNearestPlayer(_)
    local nearestDistance = math.huge
    local playersService = localPlayer
    local getPlayersIterator, playerIterator, playerIteratorIndex = pairs(playersService:GetPlayers())
    local nearestPlayer = nil
    while true do
        local player
        playerIteratorIndex, player = getPlayersIterator(playerIterator, playerIteratorIndex)
        if playerIteratorIndex == nil then
            break
        end
        if player.Name ~= localPlayer.Name and (player.Character and (localPlayer and localPlayer.Character)) and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local localPlayerRootPosition = localPlayer.Character.HumanoidRootPart.Position
                local _, screenPosition = currentCamera:WorldToScreenPoint(humanoidRootPart.Position)
                if screenPosition then
                    local distance = (localPlayerRootPosition - humanoidRootPart.Position).magnitude
                    if distance < nearestDistance then
                        nearestPlayer = player
                        nearestDistance = distance
                    end
                end
            end
        end
    end
    return nearestPlayer
end
local nearestPlayerInfo = nil
local hitboxIndex = nil
local hitboxPartName = nil
local hitboxPart = nil
local fovCircleDrawing = Drawing.new("Circle")
local fovCircle = Drawing.new("Circle")
runService.RenderStepped:Connect(function()
    if fovCircleDrawing then
        fovCircleDrawing.Radius = getgenv().Settings.Fov
        fovCircleDrawing.Thickness = 2
        fovCircleDrawing.Position = Vector2.new(currentCamera.ViewportSize.X / 2, currentCamera.ViewportSize.Y / 2 + 36)
        fovCircleDrawing.Transparency = 1
        fovCircleDrawing.Filled = false
        fovCircleDrawing.Color = Color3.fromRGB(255, 255, 255)
        fovCircleDrawing.Visible = getgenv().Settings.FovCircle
        fovCircleDrawing.ZIndex = 2
    end
    if fovCircle then
        fovCircle.Radius = getgenv().Settings.Fov
        fovCircle.Thickness = 4
        fovCircle.Position = Vector2.new(currentCamera.ViewportSize.X / 2, currentCamera.ViewportSize.Y / 2 + 36)
        fovCircle.Transparency = 1
        fovCircle.Filled = false
        fovCircle.Color = Color3.new()
        fovCircle.Visible = getgenv().Settings.FovCircle
        fovCircle.ZIndex = 1
    end
    nearestPlayerInfo = findNearestPlayer(getgenv().Settings.Fov)
end)
local function calculateDirectionalVector(startPosition, targetPosition, distanceMultiplier)
    return (targetPosition - startPosition).Unit * distanceMultiplier
end
if hookmetamethod then
    local namecallHook = nil
    namecallHook = hookmetamethod(game, "__namecall", function(...)
        local raycastData = {
            ...
        }
        local workspaceReference = raycastData[1]
        local namecallMethod = getnamecallmethod()
        if workspaceReference == workspace and (not checkcaller() and (namecallMethod == "Raycast" and (nearestPlayerInfo and (nearestPlayerInfo.Character and (nearestPlayerInfo.Character.HumanoidRootPart and (localPlayer.Character.HumanoidRootPart and (nearestPlayerInfo.Character.Humanoid and (nearestPlayerInfo.Character.Humanoid.Health > 0 and (not nearestPlayerInfo.InPlot.Value and _G.SilentAim))))))))) then
            local distanceToTarget = (localPlayer.Character.HumanoidRootPart.Position - nearestPlayerInfo.Character.HumanoidRootPart.Position).magnitude
            hitboxIndex = math.random(1, # getgenv().Settings.Hitbox)
            hitboxPartName = getgenv().Settings.Hitbox[hitboxIndex]
            hitboxPart = nearestPlayerInfo.Character[hitboxPartName]
            if distanceToTarget <= maxDistance and hitboxPart then
                raycastData[3] = calculateDirectionalVector(raycastData[2], nearestPlayerInfo.Character[hitboxPartName].Position, 1000)
                raycastData[4] = RaycastParams.new()
                raycastData[4].FilterDescendantsInstances = {
                    nearestPlayerInfo.Character
                }
                raycastData[4].FilterType = Enum.RaycastFilterType.Include
                hitboxIndex = nil
                hitboxPartName = nil
                hitboxPart = nil
            end
        end
        return namecallHook(unpack(raycastData))
    end)
end
local function areAllSlotsNeon()
    local pairsIterator, slotsInstance, slotIndex = pairs(workspaceService.Slots:GetChildren())
    local unknownBoolean = nil
    while true do
        local slotInstance
        slotIndex, slotInstance = pairsIterator(slotsInstance, slotIndex)
        if slotIndex == nil then
            break
        end
        if slotInstance.SlotHandle.LightBall.Material ~= Enum.Material.Neon then
            unknownBoolean = false
            break
        end
        unknownBoolean = true
    end
    return unknownBoolean
end
local function saveCharacterPosition(teleportLocation)
    local humanoidRootPart
    if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        humanoidRootPart = localPlayer.Character.HumanoidRootPart
    else
        humanoidRootPart = nil
    end
    if teleportLocation == "Spin" then
        if humanoidRootPart then
            _G.SavedPositionInSpin = humanoidRootPart.CFrame
        end
    elseif teleportLocation == "House" and humanoidRootPart then
        _G.SavedPositionOutHouse = humanoidRootPart.CFrame
    end
end
local function teleportToLocation(teleportLocation2)
    local characterRootPart
    if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        characterRootPart = localPlayer.Character.HumanoidRootPart
    else
        characterRootPart = nil
    end
    if teleportLocation2 == "Spin" then
        if characterRootPart then
            characterRootPart.CFrame = _G.SavedPositionInSpin
        end
    elseif teleportLocation2 == "House" and characterRootPart then
        characterRootPart.CFrame = _G.SavedPositionOutHouse
    end
end
local autoGetCoinsSection = autoTab:AddSection({
    Name = "Auto Get Coins"
})
local autoTimeResetSection = autoTab:AddSection({
    Name = "Auto Time-Reset"
})
local autoClaimPlotSection = autoTab:AddSection({
    Name = "Auto Claim-Plot"
})
timelefttextlabelingame = workspaceService.Slots.Slots.Screen.SlotGui.TimeLeftFrame.TimeText
autoGetCoinsSection:AddToggle({
    Name = "Auto-Spin",
    Default = false,
    Callback = function(isAutoFarmCoinsEnabled)
        _G.AutoFarmCoins = isAutoFarmCoinsEnabled
        if isAutoFarmCoinsEnabled then
            while _G.AutoFarmCoins do
                if areAllSlotsNeon() and ChangeActivityPriority(5) then
                    saveCharacterPosition("Spin")
                    local slotHandle = nil
                    local teleportTask = task.spawn(function()
                        while true do
                            if slotHandle then
                                TeleportPlayer(slotHandle.CFrame + Vector3.new(0, 5, 0), 5)
                                task.wait(0.2)
                                SNOWship(slotHandle)
                            end
                            task.wait()
                        end
                    end)
                    local pairsIteratorSlots, slotIterator, slotIndexSlots = pairs(workspaceService.Slots:GetChildren())
                    while true do
                        local slotInstanceSlots
                        slotIndexSlots, slotInstanceSlots = pairsIteratorSlots(slotIterator, slotIndexSlots)
                        if slotIndexSlots == nil then
                            break
                        end
                        slotHandle = slotInstanceSlots.SlotHandle.Handle
                        slotHandle.CanCollide = false
                        local teleportPart = slotHandle
                        for _ = 1, 5 do
                            task.wait(0.2)
                        end
                        teleportPart.CanCollide = true
                        if not areAllSlotsNeon() then
                            break
                        end
                    end
                    task.cancel(teleportTask)
                    newtask = nil
                    ChangeActivityPriority(0)
                    teleportToLocation("Spin")
                end
                task.wait(5)
            end
        end
    end,
    Save = true,
    Flag = "autofarmcoins_toggle"
})
TimeRemainingLabel = autoGetCoinsSection:AddLabel("Time Remaining: 0:00")
CoinsWonLabel = autoGetCoinsSection:AddLabel("Coins Won: 0")
timelefttextlabelingame.Changed:Connect(function(timeText)
    if timeText == "Text" then
        TimeRemainingLabel:Set("Time Remaining: " .. timelefttextlabelingame.Text)
    end
end)
task.spawn(function()
    local pairsIteratorDescendants, slotDescendantIterator, descendantIndex = pairs(workspaceService.Slots:GetDescendants())
    while true do
        local descendantInstance
        descendantIndex, descendantInstance = pairsIteratorDescendants(slotDescendantIterator, descendantIndex)
        if descendantIndex == nil then
            break
        end
        if descendantInstance.Name == "CoinAmount" and tostring(descendantInstance.Parent) == "CoinsFrame" then
            descendantInstance.Changed:Connect(function(propertyName)
                local playerNameLabel = descendantInstance.Parent.Parent.SpinningFrame.PlayerName
                if propertyName == "Text" and (playerNameLabel.Text == localPlayer.DisplayName and CoinsWonLabel) then
                    CoinsWonLabel:Set(descendantInstance.Text)
                end
            end)
        end
    end
    workspaceService.Plots.DescendantAdded:Connect(function(child)
        if child.Name == "Value" and (tostring(child.Parent) == "ThisPlotsOwners" and child.Value == localPlayer.Name) then
            RTime = child:WaitForChild("TimeRemainingNum", 1)
            if RTime then
                RTime.Changed:Connect(function(timeInHouse)
                    TimeInHouseLabel:Set("Time: " .. timeInHouse)
                end)
            end
        end
    end)
end)
local function updateTimeInHouseLabel()
    local pairsIteratorPlots, plotsInstance, plotIndex = pairs(workspaceService.Plots:GetDescendants())
    while true do
        local timeRemainingNumberValue
        plotIndex, timeRemainingNumberValue = pairsIteratorPlots(plotsInstance, plotIndex)
        if plotIndex == nil then
            break
        end
        if timeRemainingNumberValue.Name == "TimeRemainingNum" and timeRemainingNumberValue.Parent.Value == localPlayer.Name then
            _G.RemainingTimeInHouse = timeRemainingNumberValue
            timeRemainingNumberValue.Changed:Connect(function(timeRemaining)
                TimeInHouseLabel:Set("Time: " .. timeRemaining)
            end)
        end
    end
end
task.spawn(updateTimeInHouseLabel)
local preserveTimeToggle = nil
preserveTimeToggle = autoTimeResetSection:AddToggle({
    Name = "Preserve Time",
    Default = false,
    Callback = function(toggleState)
        _G.AutoSaveHouseTime = toggleState
        if toggleState then
            while _G.AutoSaveHouseTime do
                if localPlayer.InfiniteHouseTime.Value then
                    preserveTimeToggle:Set(false)
                    orionXHub:MakeNotification({
                        Name = "Allun",
                        Content = "You already own infinity house gamepass!",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                    break
                end
                local remainingTimeInHouseValue = _G.RemainingTimeInHouse
                if typeof(remainingTimeInHouseValue) == "Instance" and (remainingTimeInHouseValue:IsDescendantOf(workspaceService) and remainingTimeInHouseValue:IsA("IntValue")) then
                    local plotArea = _G.RemainingTimeInHouse.Parent.Parent.Parent.Parent:FindFirstChild("PlotArea")
                    if remainingTimeInHouseValue.Value < 20 and ChangeActivityPriority(4) then
                        saveCharacterPosition("House")
                        task.wait()
                        repeat
                            TeleportPlayer(CFrame.new(plotArea.Position), 4)
                            task.wait(1)
                        until remainingTimeInHouseValue.Parent ~= nil or (not _G.AutoSaveHouseTime or remainingTimeInHouseValue.Value > 15)
                        teleportToLocation("House")
                        ChangeActivityPriority(0)
                    end
                end
                task.wait(2)
            end
        end
    end,
    Save = true,
    Flag = "autosavehousetimeremaining_toggle"
})
TimeInHouseLabel = autoTimeResetSection:AddLabel("Plot Time: 0")
local plotVisitCounter = Instance.new("IntValue")
PlotWorkspace = workspaceService.Plots:GetDescendants()
function GetPlotModel(_)
    local currentPlot = workspaceService.Plots
    local plotName = _G.PlotName
    if plotName == "Witch House" then
        currentPlot = currentPlot:FindFirstChild("Plot3")
    elseif plotName == "Lumber House" then
        currentPlot = currentPlot:FindFirstChild("Plot2")
    elseif plotName == "Common House" then
        currentPlot = currentPlot:FindFirstChild("Plot1")
    elseif plotName == "American House" then
        currentPlot = currentPlot:FindFirstChild("Plot4")
    elseif plotName == "Chinese House" then
        currentPlot = currentPlot:FindFirstChild("Plot5")
    end
    return currentPlot
end
function ClaimPlot()
    local plotModel = not IsThereOwnerOnPlot() and GetPlotModel(_G.PlotName)
    if plotModel then
        local plotSign = plotModel.PlotSign
        local function isPlayerOnPlot()
            local pairsIterator, pairsState, pairsIndex = pairs(plotSign.ThisPlotsOwners:GetChildren())
            local isOwnerFound = false
            while true do
                local plotOwnerValue
                pairsIndex, plotOwnerValue = pairsIterator(pairsState, pairsIndex)
                if pairsIndex == nil then
                    break
                end
                if plotOwnerValue.Value == localPlayer.Name then
                    isOwnerFound = true
                end
            end
            return isOwnerFound
        end
        local plotSign = plotSign
        local pairsIterator2, plotSignChildIterator, pairsIndex2 = pairs(plotSign.GetChildren(plotSign))
        while true do
            local plotChild
            pairsIndex2, plotChild = pairsIterator2(plotSignChildIterator, pairsIndex2)
            if pairsIndex2 == nil or isPlayerOnPlot() then
                break
            end
            if plotChild.Name == "Sign" and ChangeActivityPriority(3) then
                local grabPart = plotChild.Plus.PlusGrabPart
                TeleportPlayer(grabPart.CFrame * CFrame.new(- 5, 0, - 5), 3)
                for _ = 0, 15 do
                    SNOWship(grabPart)
                    wait()
                end
                ChangeActivityPriority(0)
            end
        end
    end
end
function UpdatePlotOwner()
    local plotWorkspace = PlotWorkspace
    local pairsIterator3, pairsState3, pairsIndex3 = pairs(plotWorkspace)
    while true do
        local playerRoleTextLabel
        pairsIndex3, playerRoleTextLabel = pairsIterator3(pairsState3, pairsIndex3)
        if pairsIndex3 == nil then
            break
        end
        if playerRoleTextLabel.Name == "PlayerRole" then
            local playerDisplayNameTextLabel = playerRoleTextLabel.Parent.PlayerDisplayName
            local playerRoleValue = playerRoleTextLabel
            local parentObject = playerRoleTextLabel.Parent
            local plotModel = nil
            local isPlotOwner = false
            local function updatePlotOwnerDisplay()
                isPlotOwner = false
                plotModel = GetPlotModel(_G.PlotName)
                if plotModel and (playerRoleValue:IsDescendantOf(plotModel) and (playerRoleValue.Text == "Owner" and parentObject.Visible)) then
                    wait()
                    local playerService = playersService
                    local pairsIterator4, plotPlayerIterator, pairsIndex4 = pairs(playerService:GetPlayers())
                    while true do
                        local player
                        pairsIndex4, player = pairsIterator4(plotPlayerIterator, pairsIndex4)
                        if pairsIndex4 == nil then
                            break
                        end
                        if player.DisplayName == playerDisplayNameTextLabel.Text then
                            isPlotOwner = true
                        end
                    end
                    if PlotOwner and isPlotOwner then
                        PlotOwner:Set("Plot Owner: " .. playerDisplayNameTextLabel.Text)
                    else
                        PlotOwner:Set("Plot Available!")
                    end
                end
            end
            playerRoleValue.Changed:Connect(function(changedProperty)
                if changedProperty == "Text" then
                    updatePlotOwnerDisplay()
                end
            end)
            plotVisitCounter.Changed:Connect(function(_)
                updatePlotOwnerDisplay()
            end)
            updatePlotOwnerDisplay()
        end
    end
end
function IsThereOwnerOnPlot()
    local plotModel = GetPlotModel()
    if plotModel and plotModel.PlotSign.ThisPlotsOwners:FindFirstChild("Value") then
        return true
    end
end
function UpdatePeopleInPlot()
    local plotWorkspace2 = PlotWorkspace
    local pairsIterator5, pairsState5, pairsIndex5 = pairs(plotWorkspace2)
    while true do
        local plotChild2
        pairsIndex5, plotChild2 = pairsIterator5(pairsState5, pairsIndex5)
        if pairsIndex5 == nil then
            break
        end
        if plotChild2.Name == "ThisPlotsOwners" then
            local function updatePlayersInPlotDisplay()
                local children = plotChild2
                local plotModel = GetPlotModel(_G.PlotName)
                local plotChildren = children:GetChildren()
                if plotModel and plotChild2:IsDescendantOf(plotModel) then
                    local playerCount = table.getn(plotChildren)
                    if PlayersInPlot then
                        PlayersInPlot:Set("Players in Plot: " .. playerCount)
                    end
                    if playerCount == 0 and PlotOwner then
                        PlotOwner:Set("Plot Available!")
                    end
                end
            end
            plotVisitCounter.Changed:Connect(function(_)
                updatePlayersInPlotDisplay()
            end)
            plotChild2.ChildAdded:Connect(updatePlayersInPlotDisplay)
            plotChild2.ChildRemoved:Connect(updatePlayersInPlotDisplay)
            updatePlayersInPlotDisplay()
        end
    end
end
autoClaimPlotSection:AddDropdown({
    Name = "Plot",
    Default = "Witch House",
    Options = {
        "Witch House",
        "Lumber House",
        "Common House",
        "American House",
        "Chinese House"
    },
    Callback = function(plotNameInput)
        _G.PlotName = plotNameInput
        plotVisitCounter.Value = plotVisitCounter.Value + 1
    end
})
task.spawn(function()
    UpdatePlotOwner()
    task.wait()
    UpdatePeopleInPlot()
end)
PlotOwner = autoClaimPlotSection:AddLabel("Plot Owner:")
PlayersInPlot = autoClaimPlotSection:AddLabel("Players in Plot: 0")
autoClaimPlotSection:AddButton({
    Name = "Claim Plot!",
    Callback = function()
        ClaimPlot()
    end
})

























function ExplodeSb(bombModel)
    local bombExplosionData = {
        {
            Radius = 17.5,
            TimeLength = 0.1,
            Hitbox = bombModel:FindFirstChild("SoundPart"),
            ExplodesByFire = true,
            MaxForcePerStudSquared = - 100,
            DestroysModel = true,
            Model = bombModel,
            ExplodesByPointy = false,
            ImpactSpeed = 100,
            PositionPart = localPlayer.Character.HumanoidRootPart
        },
        localPlayer.Character.HumanoidRootPart.Position
    }
    BombEvents.BombExplode:FireServer(unpack(bombExplosionData))
end
getgenv().MaxSize = 15
local soundPartVisitedMap = {}
local snowballAmount = 0
local grownSnowballsLabel = nil
snowballEffectConnection = nil
snowballMaxAmmount = 20
if toysLimitCapValue.Value == 200 then
    snowballMaxAmmount = 40
end
function checkSize(descendant)
    while _G.SnowbalEffectSpam do
        if descendant and (descendant:IsDescendantOf(workspaceService) and descendant:FindFirstChild("SoundPart")) then
            local soundPart = descendant:FindFirstChild("SoundPart")
            local partSize = soundPart.Size
            if partSize.X >= MaxSize and (partSize.Y >= MaxSize and (partSize.Z >= MaxSize and not soundPartVisitedMap[soundPart])) then
                soundPartVisitedMap[soundPart] = true
                break
            end
        end
        task.wait()
    end
end
function checkSnowBall(plot)
    if plot and plot:FindFirstChild("SoundPart") then
        local soundPart = plot.SoundPart
        local raycastParameters = RaycastParams.new()
        raycastParameters.FilterDescendantsInstances = {
            plot
        }
        raycastParameters.FilterType = Enum.RaycastFilterType.Exclude
        local groundRaycastResult = workspaceService:Raycast(soundPart.Position, Vector3.new(0, - 100, 0), raycastParameters)
        if groundRaycastResult and groundRaycastResult.Material == Enum.Material.Sand then
            return true
        end
    end
end
lastpossb = nil
function holdOwnership()
    if not _G.SnowbalEffectSpam then
        return
    end
    local terrainFolder = spawnedInToysFolder
    local iterator, terrainChild, index = pairs(terrainFolder:GetChildren())
    if child and (child.Name == "BallSnowball" and child:FindFirstChild("SoundPart")) then
        local soundPart = child:FindFirstChild("SoundPart")
        if not CheckNetworkOwnerShipOnPart(soundPart) then
            if not lastpossb then
                lastpossb = GetPlayerCFrame()
            end
            for _ = 1, 10 do
                if SNOWshipOnce(soundPart) then
                    soundPart.CanTouch = false
                    soundPart.CanCollide = false
                    break
                end
                TeleportPlayer(CFrame.new(soundPart.Position + Vector3.new(0, - 10, 0)))
                task.wait(0.1)
            end
            TeleportPlayer(lastpossb)
            lastpossb = nil
        end
    end
    local child
    index, child = iterator(terrainChild, index)
    if index ~= nil and _G.SnowbalEffectSpam then
    else
    end
    task.wait()
end
function CountGrownSnowsballs()
    local iterator, snowballSoundPart, soundPartInstance = pairs(soundPartVisitedMap)
    local grownSnowballCount = 0
    while true do
        local success
        soundPartInstance, success = iterator(snowballSoundPart, soundPartInstance)
        if soundPartInstance == nil then
            break
        end
        if soundPartInstance:IsDescendantOf(workspaceService) then
            grownSnowballCount = grownSnowballCount + 1
        else
            soundPartVisitedMap[soundPartInstance] = nil
        end
    end
    grownSnowballsLabel:Set("Grown Snowballs: " .. grownSnowballCount)
    return grownSnowballCount
end
function modify(soundPartInstance)
    local spawnCFrame = CFrame.new(- 410, 228.394, 510, - 0.246182978, 3.22764193e-9, - 0.96922338, 1.2914926e-8, 1, 4.97377278e-11, 0.96922338, - 1.2505204e-8, - 0.246182978)
    while _G.SnowbalEffectSpam and soundPartInstance do
        if soundPartInstance:FindFirstChild("SoundPart") then
            local soundPartParent = soundPartInstance.SoundPart
            local farmSnowball = soundPartParent:FindFirstChild("FarmSnowball")
            if CheckNetworkOwnerShipOnPart(soundPartParent) then
                if farmSnowball then
                    if soundPartVisitedMap[soundPartParent] then
                        farmSnowball.Position = Vector3.new(math.random(- 10000, 10000), 10000, math.random(- 10000, 10000))
                    else
                        farmSnowball.Position = spawnCFrame.Position + Vector3.new(25, 0, 0) + Vector3.new(0, soundPartParent.Size.X / 2 - 0.65, 0)
                        wait(0.5)
                        farmSnowball.Position = spawnCFrame.Position + Vector3.new(- 25, 0, 0) + Vector3.new(0, soundPartParent.Size.X / 2 - 0.65, 0)
                        wait(0.5)
                        farmSnowball.Position = spawnCFrame.Position + Vector3.new(0, soundPartParent.Size.X / 2 - 0.65, 0)
                    end
                else
                    local farmSnowballBodyPosition = Instance.new("BodyPosition", soundPartParent)
                    farmSnowballBodyPosition.MaxForce = Vector3.new(12500, 12500, 12500)
                    farmSnowballBodyPosition.Name = "FarmSnowball"
                    farmSnowballBodyPosition.Position = soundPartParent.Position
                end
            end
        end
        wait()
    end
end
function newSnowball(projectile)
    if projectile.Name == "BallSnowball" and _G.SnowbalEffectSpam then
        task.spawn(function()
            checkSize(projectile)
        end)
        task.spawn(function()
            modify(projectile)
        end)
    end
end
task.spawn(function()
    while task.wait() do
        CountGrownSnowsballs()
    end
end)
local snowballSection = explosionsTab:AddSection({
    Name = "Snowball"
})
snowballSection:AddSlider({
    Name = "Ammount",
    Min = 5,
    Max = snowballMaxAmmount,
    Default = 5,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "Snowballs you want to make to explode them!",
    Callback = function(characterModel)
        snowballAmount = characterModel
    end,
    Save = true,
    Flag = "ammountsnowballtomake_slider"
})
automakesnowballtoggle = nil
automakesnowballtoggle = snowballSection:AddToggle({
    Name = "Auto Make Snowball",
    Default = false,
    Callback = function(autoMakeSnowballEnabled)
        _G.SnowbalEffectSpam = autoMakeSnowballEnabled
        if autoMakeSnowballEnabled then
            snowballEffectConnection = spawnedInToysFolder.ChildAdded:Connect(newSnowball)
            task.spawn(function()
                while _G.SnowbalEffectSpam do
                    if snowballAmount > countToys("BallSnowball") then
                        SpawnToy({
                            "BallSnowball",
                            CFrame.new(- 389, 228, 550, - 0.3092496991157532, 0.2610282301902771, - 0.9144555330276489, 0, 0.9615919589996338, 0.2744831442832947, 0.9509809017181396, 0.08488383144140244, - 0.2973720133304596),
                            Vector3.new(0, 97.69000244140625, 0)
                        })
                        wait(0.15)
                    end
                    if snowballAmount <= CountGrownSnowsballs() then
                        automakesnowballtoggle:Set(false)
                    end
                    task.wait()
                end
            end)
            task.spawn(function()
                holdOwnership()
            end)
            local children = spawnedInToysFolder
            local iterator, snowballChild, index = ipairs(children:GetChildren())
            while true do
                local snowballInstance
                index, snowballInstance = iterator(snowballChild, index)
                if index == nil then
                    break
                end
                newSnowball(snowballInstance)
            end
        elseif snowballEffectConnection then
            snowballEffectConnection:Disconnect()
        end
    end,
    Save = true,
    Flag = "autofarmsnowball_toggle"
})
local _ = snowballSection:AddLabel("Grown Snowballs:")
snowballSection:AddButton({
    Name = "Explode Snowballs",
    Callback = function()
        local iterator, state, snowballInstance = pairs(soundPartVisitedMap)
        while true do
            local success
            snowballInstance, success = iterator(state, snowballInstance)
            if snowballInstance == nil then
                break
            end
            if snowballInstance:IsDescendantOf(workspaceService) then
                ExplodeSb(snowballInstance.Parent)
            end
        end
    end
})
spamexplosiontype = nil
spamexplosiontarget = 0
bombsammountoexplode = 1
reachedrightammount = false
explosionInterval = nil
canExplode = false
maxBombstoexplode = 8
if toysLimitCapValue.Value == 200 then
    maxBombstoexplode = 18
end
AimMissile = nil
function GetAimMissile()
    if AimMissile and (AimMissile.Parent and AimMissile.PrimaryPart) then
        return AimMissile.PrimaryPart
    end
end
contextActionService:BindAction("FireBomb", fireBombs, false, Enum.KeyCode.F)
local bombHitboxMap = {
    BombMissile = "PartHitDetector",
    BombDarkMatter = "PartHitDetector",
    FireworkMissile = "PartHitDetector",
    BombBalloon = "Balloon",
    PresentBig = "Box",
    PresentSmall = "Box"
}
function ExplodeBomb(bombInstance, positionPart, otherData)
    local bombExplosionData = {
        {
            Hitbox = bombInstance:FindFirstChild(bombHitboxMap[bombInstance.Name]),
            PositionPart = positionPart
        },
        otherData
    }
    BombEvents.BombExplode:FireServer(unpack(bombExplosionData))
end
function ExplodeByTargetMode(player)
    if spamexplosiontarget ~= 0 then
        if spamexplosiontarget ~= 1 then
            if spamexplosiontarget == 2 then
                local fakeAimPosition = GetFakeAim2()
                local explosionPosition = nil
                if localPlayer.Character and localPlayer.Character:FindFirstChild("CamPart") then
                    ray = Ray.new(localPlayer.Character.CamPart.Position, localPlayer.Character.CamPart.CFrame.lookVector * 5000)
                    local raycastHitPart, raycastHitPosition = workspaceService:FindPartOnRayWithIgnoreList(ray, {
                        localPlayer.Character,
                        spawnedInToysFolder
                    })
                    pos = raycastHitPosition
                    hit = raycastHitPart
                    if hit and pos then
                        explosionPosition = pos
                    end
                end
                if fakeAimPosition and explosionPosition then
                    ExplodeBomb(player, fakeAimPosition, explosionPosition)
                end
            end
        else
            local targetPlayer
            if _G.TargetToBombPlayer then
                targetPlayer = playersService:FindFirstChild(_G.TargetToBombPlayer)
            else
                targetPlayer = nil
            end
            if targetPlayer and (not IsPlayerInsideSafeZone(targetPlayer) and targetPlayer.Character) and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local humanoidRootPart = targetPlayer.Character.HumanoidRootPart
                if _G.PredictPlayer then
                    local predictedPosition = GetFakeAim2()
                    if predictedPosition then
                        ExplodeBomb(player, predictedPosition, humanoidRootPart.Position + humanoidRootPart.Velocity / 1.93)
                    end
                else
                    ExplodeBomb(player, humanoidRootPart, humanoidRootPart.Position)
                end
            end
        end
    else
        ExplodeBomb(player, workspace.SpawnLocation, Vector3.new(math.random(- 10, 10), math.random(- 10, 10), math.random(- 10, 10)))
    end
end
function ExplodeFirstBomb(targetMode)
    local targetPart = spawnedInToysFolder:FindFirstChild(targetMode)
    if targetPart then
        ExplodeByTargetMode(targetPart)
    end
end
_G.ExplodingBombs = false
function ExplodeAllAtOnce()
    _G.ExplodingBombs = true
    local targetFolder = spawnedInToysFolder
    local iterator, targetChild, index = pairs(targetFolder:GetChildren())
    while true do
        local targetInstance
        index, targetInstance = iterator(targetChild, index)
        if index == nil then
            break
        end
        if targetInstance.Name == spamexplosiontype then
            ExplodeByTargetMode(targetInstance)
        end
        if explosionInterval > 0 then
            task.wait(explosionInterval)
        end
    end
    _G.ExplodingBombs = false
end
firework_section = explosionsTab:AddSection({
    Name = "Explosions Spam"
})
explosionexplanation = explosionsTab:AddSection({
    Name = "FAQ about (Explosions Spam)"
})
firework_section:AddToggle({
    Name = "Explode",
    Default = false,
    Callback = function(fireworkEffectSpam)
        _G.FireworkEffectSpam = fireworkEffectSpam
        if fireworkEffectSpam then
            task.spawn(function()
                while _G.FireworkEffectSpam do
                    local playerCFrame = GetPlayerCFrame()
                    if countToys(spamexplosiontype) < bombsammountoexplode and (not CheckToyLimit(10) and (not _G.ExplodingBombs and playerCFrame)) then
                        SpawnToy({
                            spamexplosiontype,
                            CFrame.new(playerCFrame.Position.X, playerCFrame.Position.Y, playerCFrame.Position.Z, - 0.3092496991157532, 0.2610282301902771, - 0.9144555330276489, 0, 0.9615919589996338, 0.2744831442832947, 0.9509809017181396, 0.08488383144140244, - 0.2973720133304596),
                            Vector3.new(0, 97.69000244140625, 0)
                        })
                    end
                    task.wait()
                end
            end)
            task.spawn(function()
                while _G.FireworkEffectSpam do
                    local targetFolder2 = spawnedInToysFolder
                    local iterator, targetChild2, index = pairs(targetFolder2:GetChildren())
                    while true do
                        local child
                        index, child = iterator(targetChild2, index)
                        if index == nil then
                            break
                        end
                        if child.Name == spamexplosiontype then
                            local hitboxPart = nil
                            if spamexplosiontype ~= "BombDarkMatter" then
                                if spamexplosiontype ~= "BombMissile" then
                                    if spamexplosiontype ~= "BombBalloon" then
                                        if spamexplosiontype ~= "FireworkMissile" then
                                            if spamexplosiontype == "PresentBig" or spamexplosiontype == "PresentSmall" then
                                                hitboxPart = child:FindFirstChild("Box")
                                            end
                                        else
                                            hitboxPart = child:FindFirstChild("Hitbox")
                                        end
                                    else
                                        hitboxPart = child:FindFirstChild("Balloon")
                                    end
                                else
                                    hitboxPart = child:FindFirstChild("Body")
                                end
                            else
                                hitboxPart = child:FindFirstChild("Pyramid")
                            end
                            if hitboxPart and not SNOWshipOnce(hitboxPart) and localPlayer:DistanceFromCharacter(hitboxPart.Position) > 30 then
                                DeleteToyRE:FireServer(child)
                                print("Deletado!")
                            elseif hitboxPart and (CheckNetworkOwnerShipOnPart(hitboxPart) and not child:GetAttribute("MissileTeleported")) then
                                local stableBodyVelocity = Instance.new("BodyVelocity", child.PrimaryPart)
                                stableBodyVelocity.Velocity = Vector3.new(0, 0, 0)
                                stableBodyVelocity.MaxForce = Vector3.new(1, 1, 1) * math.huge
                                stableBodyVelocity.Name = "Stable"
                                wait()
                                child:PivotTo(CFrame.new(math.random(- 1000, 1000), 10000, math.random(- 1000, 1000)))
                                child:SetAttribute("MissileTeleported", true)
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end)
            task.spawn(function()
                while _G.FireworkEffectSpam do
                    if _G.TriggerMode ~= 1 or spamexplosiontarget ~= 0 and spamexplosiontarget ~= 1 then
                        if (_G.TriggerMode == 0 or spamexplosiontarget == 2) and _G.FireBomb then
                            ExplodeFirstBomb(spamexplosiontype)
                        end
                    elseif countToys(spamexplosiontype) >= bombsammountoexplode or CheckToyLimit(10) then
                        ExplodeAllAtOnce()
                    end
                    task.wait()
                end
            end)
            task.spawn(function()
                while _G.FireworkEffectSpam do
                    CheckToyLimit(10, true, {
                        spamexplosiontype
                    })
                    task.wait()
                end
            end)
            task.spawn(function()
                while _G.FireworkEffectSpam do
                    if spamexplosiontarget == 2 then
                        GetAimMissile()
                    end
                    wait()
                end
            end)
        end
    end
})
firework_section:AddDropdown({
    Name = "Explosion Type",
    Default = "Firework",
    Options = {
        "Firework",
        "Missile",
        "Void",
        "Ballon",
        "Small Present",
        "Big Present"
    },
    Callback = function(explosionType)
        if explosionType == "Firework" then
            spamexplosiontype = "FireworkMissile"
        elseif explosionType == "Missile" then
            spamexplosiontype = "BombMissile"
        elseif explosionType == "Void" then
            spamexplosiontype = "BombDarkMatter"
        elseif explosionType == "Ballon" then
            spamexplosiontype = "BombBalloon"
        elseif explosionType == "Small Present" then
            spamexplosiontype = "PresentSmall"
        elseif explosionType == "Big Present" then
            spamexplosiontype = "PresentBig"
        end
    end
})
firework_section:AddBind({
    Name = "Trigger Bombs",
    Default = Enum.KeyCode.F,
    Hold = true,
    Callback = function(fireBombValue)
        _G.FireBomb = fireBombValue
    end
})
firework_section:AddDropdown({
    Name = "Trigger Mode",
    Default = "Automatic",
    Options = {
        "Key",
        "Automatic"
    },
    Callback = function(triggerMode)
        if triggerMode == "Key" then
            _G.TriggerMode = 0
        elseif triggerMode == "Automatic" then
            _G.TriggerMode = 1
        end
    end
})
firework_section:AddSlider({
    Name = "Delay (Automatic Trigger Mode)",
    Min = 0,
    Max = 0.5,
    Default = 0,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.015,
    ValueName = "interval between every explosion in automatic trigger mode!",
    Callback = function(explosionInterval)
        explosionInterval = explosionInterval
    end
})
firework_section:AddSlider({
    Name = "Ammount to Explode",
    Min = 1,
    Max = 20,
    Default = 1,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "to explode the player brutally",
    Callback = function(bombsAmountToExplode)
        bombsammountoexplode = bombsAmountToExplode
    end
})
firework_section:AddDropdown({
    Name = "Target",
    Default = "Spawn",
    Options = {
        "Spawn",
        "Player",
        "Mouse"
    },
    Callback = function(explosionTarget)
        if explosionTarget == "Spawn" then
            spamexplosiontarget = 0
        elseif explosionTarget == "Player" then
            spamexplosiontarget = 1
        elseif explosionTarget == "Mouse" then
            spamexplosiontarget = 2
        end
    end
})
PlayerToTarget = firework_section:AddDropdown({
    Name = "Select Player",
    Default = "Macaco (negro)",
    Options = {
        ""
    },
    Callback = function(targetPlayerNameString)
        local targetPlayerNameSplit = string.split(targetPlayerNameString, " ")
        _G.TargetToBombPlayer = targetPlayerNameSplit[1]
    end
})
firework_section:AddToggle({
    Name = "Predict Player Movement",
    Default = false,
    Callback = function(predictPlayer)
        _G.PredictPlayer = predictPlayer
    end,
    Save = true,
    Flag = "SilentAim_toggle"
})
explosionexplanation:AddParagraph("How to use target mouse?", "Press/Hold the keybind (F) and then BOOM!")
explosionexplanation:AddParagraph("How to target player?", "Select Target to Player and then select the player you want to target")
explosionexplanation:AddParagraph("How to change the explosive", "Click on Explosive Type and select any type")
localPlayer.Idled:Connect(function()
    virtualUserService:CaptureController()
    virtualUserService:ClickButton2(Vector2.new())
end)
GrabPartsModel = game:GetService("ReplicatedFirst").GrabParts
_G.ActualFakeGrabParts = nil
var120_upvw = nil
replicatedStorageService.GrabEvents.EndGrabEarly.OnClientEvent:Connect(function()
    if _G.ActualFakeGrabParts then
        _G.ActualFakeGrabParts:Destroy()
    end
end)
local function lockCamera()
    if userInputService.MouseBehavior ~= Enum.MouseBehavior.LockCenter then
        userInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    end
    if workspaceService.CurrentCamera.CameraType ~= Enum.CameraType.Scriptable then
        workspaceService.CurrentCamera.CameraType = Enum.CameraType.Scriptable
    end
    local characterDescendantIterator, characterDescendant, characterDescendant = pairs(localPlayer.Character:GetDescendants())
    while true do
        local descendantInstance
        characterDescendant, descendantInstance = characterDescendantIterator(characterDescendant, characterDescendant)
        if characterDescendant == nil then
            break
        end
        if descendantInstance:IsA("BasePart") then
            descendantInstance.Transparency = 1
        end
    end
    workspaceService.CurrentCamera.CFrame = CFrame.new(_G.UniversalPlayerRoot.CFrame * var120_upvw) * workspaceService.CurrentCamera.CFrame.Rotation
    if _G.RotatingFakeGrabParts == false then
        runService:UnbindFromRenderStep("camBinding1")
        workspaceService.CurrentCamera.CameraType = Enum.CameraType.Custom
        userInputService.MouseBehavior = Enum.MouseBehavior.Default
    end
end
function GrabPartFake(potentialGrabPart)
    local localPlayerCharacter = game.Players.LocalPlayer.Character
    local actualFakeGrabParts = _G.ActualFakeGrabParts
    if localPlayerCharacter and (potentialGrabPart and (potentialGrabPart:IsA("Part") and (not actualFakeGrabParts and _G.UniverPlayerHumanoid.Health > 0))) then
        if _G.RealGrabParts then
            return
        end
        local headPart = potentialGrabPart.Parent:FindFirstChild("Head")
        local targetHumanoid = potentialGrabPart.Parent:FindFirstChildOfClass("Humanoid")
        local grabPartOrHead = headPart or potentialGrabPart
        local isGrabbing = false
        local isRotatingFakeGrabParts = false
        local currentReach = localPlayer:FindFirstChild("CurrentReach")
        if targetHumanoid and targetHumanoid.Health < 1 then
            return nil
        end
        pcDistance2 = (potentialGrabPart.Position - workspaceService.CurrentCamera.CFrame.Position).Magnitude
        local grabPartsModelClone = GrabPartsModel:Clone()
        grabPartsModelClone:SetAttribute("Fake", true)
        grabPartsModelClone.Name = "GrabParts"
        grabPartsModelClone.GrabPart.Color = game.Players.LocalPlayer.BeamColor.BallColorHolder.Value
        grabPartsModelClone.BeamPart.GrabBeam.Color = game.Players.LocalPlayer.BeamColor.ColorSequenceHolder.Color
        if currentReach and currentReach.Value == 40 then
            grabPartsModelClone.BeamPart.GrabBeam.Texture = "rbxassetid://8933355899"
        end
        grabPartsModelClone.DragPart.Anchored = true
        grabPartsModelClone.GrabPart.GrabAttach.Orientation = workspace.RotateOrientPart.PartOrient.WorldOrientation
        grabPartsModelClone.DragPart.DragAttach.WorldOrientation = workspace.RotateOrientPart.PartOrient.WorldOrientation
        grabPartsModelClone.GrabPart.WeldConstraint.Part1 = potentialGrabPart
        grabPartsModelClone.GrabPart.Position = potentialGrabPart.Position
        grabPartsModelClone.GrabPart.Anchored = false
        grabPartsModelClone.BeamPart.Anchored = true
        grabPartsModelClone.BeamPart.GrabBeam.Attachment0 = localPlayerCharacter:FindFirstChild("CamPart").Attachment
        grabPartsModelClone.Parent = workspace
        _G.ActualFakeGrabParts = grabPartsModelClone
        local inputChangedConnection = userInputService.InputChanged:Connect(function(inputObject, inputIsProcessed)
            if not inputIsProcessed then
                if inputObject.UserInputType == Enum.UserInputType.MouseWheel then
                    if inputObject.Position.Z <= 0 then
                        if inputObject.Position.Z < 0 then
                            pcDistance2 = math.floor(pcDistance2 + inputObject.Position.Z * 2)
                        end
                    else
                        pcDistance2 = math.ceil(pcDistance2 + inputObject.Position.Z * 2)
                    end
                    if pcDistance2 >= 3 then
                        if pcDistance2 >= 30 then
                            pcDistance2 = 30
                        end
                    else
                        pcDistance2 = 3
                    end
                    extendGrabLineRemoteEvent:FireServer(pcDistance2)
                end
                if isRotatingFakeGrabParts then
                    local rotateOrientPartClone = workspace.RotateOrientPart:Clone()
                    rotateOrientPartClone.Anchored = true
                    rotateOrientPartClone.Orientation = Vector3.new(rotateOrientPartClone.Orientation.X + inputObject.Delta.Y, rotateOrientPartClone.Orientation.Y + inputObject.Delta.X, rotateOrientPartClone.Orientation.Z)
                    workspaceService.RotateOrientPart.PartOrient.WorldOrientation = rotateOrientPartClone:WaitForChild("PartOrient").WorldOrientation
                    rotateOrientPartClone:Destroy()
                end
            end
        end)
        grabPartsModelClone.GrabPart.BeamSound:Play()
        grabPartsModelClone.GrabPart.AttachSound:Play()
        ActionEvent("HoldControls", false)
        ActionEvent("GrabbingControls", true)
        ActionEvent("GrabControls", false)
        local function destroyGrabParts()
            grabPartsModelClone:Destroy()
            if potentialGrabPart.Anchored == false then
                local totalMass = 0
                if potentialGrabPart.Parent:IsA("Model") and potentialGrabPart.Parent.Name ~= "Workspace" then
                    local parentChildrenIterator, iteratorValue, parentChild = pairs(potentialGrabPart.Parent:GetChildren())
                    while true do
                        local childPart
                        parentChild, childPart = parentChildrenIterator(iteratorValue, parentChild)
                        if parentChild == nil then
                            break
                        end
                        if childPart:IsA("BasePart") then
                            totalMass = totalMass + childPart.Mass
                        end
                    end
                    local parentChildrenIterator2, iteratorValue2, parentChild2 = pairs(potentialGrabPart.Parent:GetChildren())
                    while true do
                        local childPart2
                        parentChild2, childPart2 = parentChildrenIterator2(iteratorValue2, parentChild2)
                        if parentChild2 == nil then
                            break
                        end
                        if childPart2:IsA("BasePart") then
                            childPart2.Velocity = workspaceService.CurrentCamera.CFrame.LookVector * 50
                        end
                    end
                end
                local calculatedVelocity = workspaceService.CurrentCamera.CFrame.LookVector * 750 / (totalMass + potentialGrabPart.Mass) + workspaceService.CurrentCamera.CFrame.LookVector * 15
                if calculatedVelocity.Magnitude < 100 then
                    calculatedVelocity = workspaceService.CurrentCamera.CFrame.LookVector * 100
                end
                potentialGrabPart.Velocity = calculatedVelocity
            end
        end
        local inputBeganConnection = userInputService.InputBegan:Connect(function(inputObject2, inputIsProcessed2)
            if not inputIsProcessed2 then
                if inputObject2.UserInputType ~= Enum.UserInputType.MouseButton2 then
                    if inputObject2.KeyCode == Enum.KeyCode.R then
                        if isRotatingFakeGrabParts then
                            isRotatingFakeGrabParts = false
                            _G.RotatingFakeGrabParts = false
                            workspaceService.CurrentCamera.CameraType = Enum.CameraType.Custom
                            userInputService.MouseBehavior = Enum.MouseBehavior.Default
                            runService:UnbindFromRenderStep("camBinding1")
                            ActionEvent("RotatingControls", false)
                            ActionEvent("RotateControls", true)
                        else
                            isRotatingFakeGrabParts = true
                            _G.RotatingFakeGrabParts = true
                            var120_upvw = _G.UniversalPlayerRoot.CFrame:ToObjectSpace(workspaceService.CurrentCamera.CFrame).Position
                            workspaceService.CurrentCamera.CameraType = Enum.CameraType.Scriptable
                            userInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
                            runService:BindToRenderStep("camBinding1", Enum.RenderPriority.Camera.Value - 1, lockCamera)
                            ActionEvent("RotatingControls", true)
                            ActionEvent("RotateControls", false)
                            ActionEvent("")
                        end
                    end
                else
                    destroyGrabParts()
                end
            end
        end)
        local descendantAddedConnection = workspaceService.DescendantAdded:Connect(function(potentialGrabParts)
            if grabPartsModelClone.Parent and (potentialGrabParts.Name == "GrabParts" and (potentialGrabParts ~= grabPartsModelClone and potentialGrabParts.Parent == workspaceService)) then
                runService:UnbindFromRenderStep("dragBinding")
                runService:UnbindFromRenderStep("buttonDistanceMoving")
                local dragPart = potentialGrabParts.DragPart
                local beamPart = potentialGrabParts.BeamPart
                local grabPart = potentialGrabParts.GrabPart
                if dragPart and (beamPart and grabPart) then
                    beamPart.GrabBeam.Enabled = false
                    grabPart.Transparency = 1
                    grabPart.AttachSound.Volume = 0
                    grabPart.BeamSound.Volume = 0
                    dragPart.AlignOrientation.Enabled = false
                    dragPart.AlignPosition.Enabled = false
                    createGrabLineEvent:FireServer(potentialGrabPart, CFrame.new(0, 0, 0))
                end
            end
        end)
        setNetworkOwnerEvent:FireServer(grabPartOrHead, workspaceService.CurrentCamera.CFrame)
        task.spawn(function()
            while grabPartsModelClone.Parent and potentialGrabPart:IsDescendantOf(workspaceService) do
                if CheckNetworkOwnerShipOnPart(grabPartOrHead) and not isGrabbing then
                    pcDistance2 = (potentialGrabPart.Position - workspaceService.CurrentCamera.CFrame.Position).Magnitude
                    extendGrabLineRemoteEvent:FireServer(pcDistance2)
                    createGrabLineEvent:FireServer(potentialGrabPart, CFrame.new(0, 0, 0))
                    localPlayer.PlayerScripts.CharacterAndBeamMove.GrabNotifyEvent:Fire(true)
                    isGrabbing = true
                elseif not CheckNetworkOwnerShipOnPart(grabPartOrHead) and isGrabbing then
                    isGrabbing = false
                end
                grabPartsModelClone.DragPart.Position = workspace.CurrentCamera.CFrame.LookVector * pcDistance2 + workspace.CurrentCamera.CFrame.Position
                grabPartsModelClone.DragPart.DragAttach.WorldOrientation = workspace.RotateOrientPart.PartOrient.WorldOrientation
                grabPartsModelClone.BeamPart.CFrame = CFrame.lookAt(grabPartsModelClone.GrabPart.Position, grabPartsModelClone.DragPart.Position, Vector3.new(0, 0, 1))
                grabPartsModelClone.BeamPart.GrabBeam.CurveSize1 = (grabPartsModelClone.GrabPart.Position - grabPartsModelClone.DragPart.Position).Magnitude * 1.5
                grabPartsModelClone.GrabPart.BeamSound.PlaybackSpeed = (grabPartsModelClone.GrabPart.Position - grabPartsModelClone.DragPart.Position).Magnitude * 1.5 * 1.5 / 2 + 2.5
                task.wait()
            end
            inputChangedConnection:Disconnect()
            inputBeganConnection:Disconnect()
            descendantAddedConnection:Disconnect()
            ActionEvent("GrabbingControls", false)
            ActionEvent("GrabControls", false)
            ActionEvent("RotatingControls", false)
            ActionEvent("RotateControls", false)
            localPlayer.PlayerScripts.CharacterAndBeamMove.GrabNotifyEvent:Fire(false)
            destroyGrabLineEvent:FireServer(potentialGrabPart)
            if _G.ActualFakeGrabParts then
                _G.ActualFakeGrabParts:Destroy()
            end
            _G.ActualFakeGrabParts = nil
            _G.RotatingFakeGrabParts = false
            isRotatingFakeGrabParts = false
            workspaceService.CurrentCamera.CameraType = Enum.CameraType.Custom
            userInputService.MouseBehavior = Enum.MouseBehavior.Default
        end)
    elseif actualFakeGrabParts then
        actualFakeGrabParts:Destroy()
    end
end
SilentAim_Section = miscTab:AddSection({
    Name = "Silent-Aim"
})
SilentAim_Section:AddToggle({
    Name = "Silent Aim V1 (Raycast)",
    Default = false,
    Callback = function(silentAim)
        _G.SilentAim = silentAim
    end,
    Save = true,
    Flag = "SilentAim_toggle"
})
oldgrablineeventparent = createGrabLineEvent.Parent
SilentAim_Section:AddToggle({
    Name = "Silent Aim V2 (All Executor and PC Only)",
    Default = false,
    Callback = function(silentAimV2)
        _G.SilentAimV2 = silentAimV2
    end,
    Save = true,
    Flag = "SilentAimV2_toggle"
})
userInputService.InputBegan:Connect(function(inputObject3)
    if inputObject3.UserInputType == Enum.UserInputType.MouseButton1 then
        if _G.ActualFakeGrabParts then
            _G.ActualFakeGrabParts:Destroy()
            return
        end
        if nearestPlayerInfo and (nearestPlayerInfo ~= localPlayer and (nearestPlayerInfo.Character and (nearestPlayerInfo.Character.HumanoidRootPart and _G.SilentAimV2))) then
            local characterDistance = (localPlayer.Character.HumanoidRootPart.Position - nearestPlayerInfo.Character.HumanoidRootPart.Position).magnitude
            hitboxIndex = math.random(1, # getgenv().Settings.Hitbox)
            hitboxPartName = getgenv().Settings.Hitbox[hitboxIndex]
            hitboxPart = nearestPlayerInfo.Character[hitboxPartName]
            if characterDistance <= maxDistance and hitboxPart then
                GrabPartFake(hitboxPart)
            end
        end
    end
end)
SilentAim_Section:AddSlider({
    Name = "Silent-Aim Range",
    Min = 0,
    Max = 50,
    Default = 50,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "",
    Callback = function(vu766)
        maxDistance = vu766
    end,
    Save = true,
    Flag = "silentaimrange_slider"
})
GrabPartsModel = replicatedFirstService.GrabParts
_G.ActualFakeGrabParts = nil
FurtherLineExtend_Section = customLineTab:AddSection({
    Name = "Line Extender"
})
FurtherLineExtend_Section:AddToggle({
    Name = "Further Extend",
    Default = false,
    Callback = function(furtherExtend)
        _G.FutherExtend = furtherExtend
    end,
    Save = true,
    Flag = "FurtherLineExtend_toggle"
})
MaxExtendLine = 0
MinExtendLine = 0
if userInputService.TouchEnabled then
    MinExtendLine = 3
    MaxExtendLine = 25
elseif userInputService.MouseEnabled then
    MinExtendLine = 3
    MaxExtendLine = 25
end
FurtherLineExtend_Section:AddSlider({
    Name = "Increase Extend",
    Min = MinExtendLine,
    Max = MaxExtendLine,
    Default = 3,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "Ammount",
    Callback = function(increaseLineExtend)
        IncreaseLineExtend = increaseLineExtend
    end,
    Save = true,
    Flag = "FurtherLineExtend_slider"
})
local normalAurasSection = grabAurasTab:AddSection({
    Name = "Normal Auras"
})
local flingAuraSection = grabAurasTab:AddSection({
    Name = "Fling Aura"
})
local telekinesisAuraSection = grabAurasTab:AddSection({
    Name = "Telekinesis Aura"
})
local anchorAuraSection = grabAurasTab:AddSection({
    Name = "Anchor Aura"
})
local kickAuraSection = grabAurasTab:AddSection({
    Name = "Kick Aura"
})
local aurasWhitelistSection = grabAurasTab:AddSection({
    Name = "Auras Whitelist"
})
local function isPlayerSeatedInBlobman()
    local localCharacter = localPlayer.Character
    local seatedHumanoid
    if localCharacter then
        seatedHumanoid = localCharacter:FindFirstChildOfClass("Humanoid")
    else
        seatedHumanoid = nil
    end
    if not localCharacter or (not seatedHumanoid or (not seatedHumanoid.Sit or (seatedHumanoid.SeatPart == nil or tostring(seatedHumanoid.SeatPart.Parent) ~= "CreatureBlobman"))) then
        return false
    end
    _G.LastBlobmanWasSeat = seatedHumanoid.SeatPart.Parent
    return true
end
function IsPlayerKickingWithBlobman()
    if isPlayerSeatedInBlobman() and _G.LoopKick then
        return true
    end
end
local function isPlayerWhitelisted(partName)
    local isMatching = false
    playersService:FindFirstChild(partName)
    if isPlayerSeatedInBlobman() and _G.LoopKick then
        local pairsIterator, previousKey, key = pairs(playerList)
        while true do
            local value
            key, value = pairsIterator(previousKey, key)
            if key == nil then
                break
            end
            if partName == value then
                isMatching = true
            end
        end
    end
    return isMatching
end
function CheckPlayer(potentialPlayer)
    if typeof(potentialPlayer) == "Instance" and (potentialPlayer ~= localPlayer and (not isAuthorized(potentialPlayer) and potentialPlayer.Character)) and (potentialPlayer.Character:IsDescendantOf(workspaceService) and (potentialPlayer.Character:FindFirstChild("HumanoidRootPart") and (potentialPlayer.Character:FindFirstChildOfClass("Humanoid") and potentialPlayer.Character.Humanoid.Health > 0))) then
        return true
    end
end
function CheckPlayerForLoopKill(playerToCheck)
    if CheckPlayer(playerToCheck) and not IsPlayerInsideSafeZone(playerToCheck) then
        return true
    end
end
function CheckPlayerAuras(potentialKickedPlayer1)
    if CheckPlayer(potentialKickedPlayer1) and not (isPlayerWhitelisted(potentialKickedPlayer1.Name) and _G.WhitelistFriends) and not isPlayerWhitelisted(potentialKickedPlayer1.Name) and not (potentialKickedPlayer1.Character:GetAttribute("Kicking") or _G.KickAura) then
        return true
    end
end
function CheckPlayerAurasKick(potentialKickedPlayer2)
    if CheckPlayer(potentialKickedPlayer2) and not (isPlayerWhitelisted(potentialKickedPlayer2.Name) and _G.WhitelistFriends) and not isPlayerWhitelisted(potentialKickedPlayer2.Name) and not potentialKickedPlayer2.Character:GetAttribute("Kicking") then
        return true
    end
end
function CheckPlayerAnnoyAll(potentialKickedPlayer3)
    if CheckPlayer(potentialKickedPlayer3) and not (isPlayerWhitelisted(potentialKickedPlayer3.Name) and _G.WhitelistFriends3) and not isPlayerWhitelisted(potentialKickedPlayer3.Name) and not potentialKickedPlayer3.Character:GetAttribute("Kicking") then
        return true
    end
end
function CheckPlayerKill(potentialKickedPlayer4)
    if CheckPlayer(potentialKickedPlayer4) and not (isPlayerWhitelisted(potentialKickedPlayer4.Name) and _G.WhitelistFriends3) and not IsPlayerInsideSafeZone(potentialKickedPlayer4) then
        return true
    end
end
function CheckPlayerKick(potentialKickedPlayer5)
    if CheckPlayer(potentialKickedPlayer5) and not (isPlayerWhitelisted(potentialKickedPlayer5.Name) and _G.WhitelistFriends3) and not (IsPlayerInsideSafeZone(potentialKickedPlayer5) or IsPlayerFloating(potentialKickedPlayer5)) then
        return true
    end
end
function CheckPlayerBring(potentialKickedPlayer6, _)
    if CheckPlayer(potentialKickedPlayer6) and not (isPlayerWhitelisted(potentialKickedPlayer6.Name) and _G.WhitelistFriends3) and (not IsPlayerInsideSafeZone(potentialKickedPlayer6) and CheckPlayerVelocity(potentialKickedPlayer6) < 20) then
        return true
    end
end
function CreateSkyVelocity(skyObject)
    if not skyObject:FindFirstChild("SkyVelocity") then
        local skyVelocityBodyVelocity = Instance.new("BodyVelocity", skyObject)
        skyVelocityBodyVelocity.Name = "SkyVelocity"
        skyVelocityBodyVelocity.Velocity = Vector3.new(0, 100000000000000, 0)
        skyVelocityBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    end
end
function CreateBringBody(targetPart, destinationPart)
    if targetPart:FindFirstChild("BringBody") then
        targetPart:FindFirstChild("BringBody").Position = destinationPart.Position
    else
        local bringBodyPosition = Instance.new("BodyPosition", targetPart)
        bringBodyPosition.Name = "BringBody"
        bringBodyPosition.Position = destinationPart.Position
        bringBodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bringBodyPosition.D = 5000
        bringBodyPosition.P = 1500000
    end
end
local paintPlayerPart = workspaceService.Map.AlwaysHereTweenedObjects:FindFirstChild("OuterUFO")
if paintPlayerPart and paintPlayerPart:FindFirstChild("Object") and paintPlayerPart.Object:FindFirstChild("ObjectModel") then
    paintPlayerPart = paintPlayerPart.Object.ObjectModel.PaintPlayerPart
    paintPlayerPart:WaitForChild("WeldConstraint").Enabled = false
    paintPlayerPart.Anchored = true
    paintPlayerPart.Shape = Enum.PartType.Block
    paintPlayerPart.Transparency = 1
    paintPlayerPart.Size = Vector3.new(0.5, 0.5, 0.5)
    paintPlayerPart.Position = Vector3.new(0, - 50, 0)
end
normalAurasSection:AddToggle({
    Name = "Poison Aura",
    Default = false,
    Callback = function(poisonAuraEnabled)
        _G.Poison_Aura = poisonAuraEnabled
        if poisonAuraEnabled then
            while _G.Poison_Aura do
                local gamePlayers = playersService
                local playerPairsIterator, iteratorValue3, playerKey = pairs(gamePlayers:GetPlayers())
                while true do
                    local player
                    playerKey, player = playerPairsIterator(iteratorValue3, playerKey)
                    if playerKey == nil then
                        break
                    end
                    if CheckPlayerAuras(player) then
                        local playerHead = player.Character:FindFirstChild("Head")
                        if playerHead and SNOWshipPlayer(player) then
                            bigHolePoisonPart.CFrame = playerHead.CFrame
                            smallHolePoisonPart.CFrame = playerHead.CFrame
                            factoryIslandPoisonPart.CFrame = playerHead.CFrame
                            task.wait()
                            factoryIslandPoisonPart.Position = Vector3.new(0, - 50, 0)
                            smallHolePoisonPart.Position = Vector3.new(0, - 50, 0)
                            bigHolePoisonPart.Position = Vector3.new(0, - 50, 0)
                        end
                    end
                end
                task.wait()
            end
        end
    end,
    Save = true,
    Flag = "poisonaura_toggle"
})
normalAurasSection:AddToggle({
    Name = "Death Aura",
    Default = false,
    Callback = function(deathAuraEnabled)
        _G.DeathAura = deathAuraEnabled
        if deathAuraEnabled then
            while _G.DeathAura do
                local gamePlayers2 = playersService
                local playerPairsIterator2, iteratorValue4, playerKey2 = pairs(gamePlayers2:GetPlayers())
                while true do
                    local player2
                    playerKey2, player2 = playerPairsIterator2(iteratorValue4, playerKey2)
                    if playerKey2 == nil then
                        break
                    end
                    if CheckPlayerAuras(player2) then
                        local playerCharacter = player2.Character
                        local humanoidRootPart = playerCharacter:FindFirstChild("HumanoidRootPart")
                        local humanoid = playerCharacter:FindFirstChildOfClass("Humanoid")
                        if humanoidRootPart and (humanoid and SNOWshipPlayer(player2)) then
                            destroyGrabLineEvent:FireServer(humanoidRootPart)
                            CreateSkyVelocity(humanoidRootPart)
                            humanoid.BreakJointsOnDeath = false
                            humanoid:ChangeState(Enum.HumanoidStateType.Dead)
                            humanoid.Jump = true
                            humanoid.Sit = false
                            if humanoid:GetStateEnabled(Enum.HumanoidStateType.Dead) then
                                destroyGrabLineEvent:FireServer(humanoidRootPart)
                            end
                        end
                    end
                end
                task.wait()
            end
        end
    end,
    Save = true,
    Flag = "deathaura_toggle"
})
if paintPlayerPart then
    normalAurasSection:AddToggle({
        Name = "Radioactive Aura",
        Default = false,
        Callback = function(radioactiveAuraEnabled)
            _G.RadioactiveAura = radioactiveAuraEnabled
            if radioactiveAuraEnabled then
                while _G.RadioactiveAura do
                    local gamePlayers3 = playersService
                    local playerPairsIterator3, iteratorValue5, playerKey3 = pairs(gamePlayers3:GetPlayers())
                    while true do
                        local player3
                        playerKey3, player3 = playerPairsIterator3(iteratorValue5, playerKey3)
                        if playerKey3 == nil then
                            break
                        end
                        if CheckPlayerAuras(player3) then
                            local humanoidRootPart = player3.Character:FindFirstChild("HumanoidRootPart")
                            if humanoidRootPart and SNOWshipPlayer(player3) then
                                paintPlayerPart.Position = humanoidRootPart.Position
                                task.wait()
                                paintPlayerPart.Position = Vector3.new(0, - 50, 0)
                            end
                        end
                    end
                    task.wait()
                end
            end
        end,
        Save = true,
        Flag = "radioaura_toggle"
    })
end
normalAurasSection:AddToggle({
    Name = "Burn Aura",
    Default = false,
    Callback = function(burnAuraEnabled)
        _G.BurnAura = burnAuraEnabled
        if burnAuraEnabled then
            while _G.BurnAura do
                local gamePlayers4 = playersService
                local playerPairsIterator4, iteratorValue6, playerKey4 = pairs(gamePlayers4:GetPlayers())
                while true do
                    local playerAura
                    playerKey4, playerAura = playerPairsIterator4(iteratorValue6, playerKey4)
                    if playerKey4 == nil then
                        break
                    end
                    if CheckPlayerAuras(playerAura) then
                        local humanoidRootPart = playerAura.Character:FindFirstChild("HumanoidRootPart")
                        if humanoidRootPart and localPlayer:DistanceFromCharacter(humanoidRootPart.Position) < 30 then
                            handleCampfireTouch(humanoidRootPart)
                        end
                    end
                end
                task.wait()
            end
        end
    end,
    Save = true,
    Flag = "burnaura_toggle"
})
flingAuraSection:AddToggle({
    Name = "Fling Aura",
    Default = false,
    Callback = function(flingAuraEnabled)
        _G.FlingAura = flingAuraEnabled
        if flingAuraEnabled then
            while _G.FlingAura do
                if _G.FlingTarget == 2 or _G.FlingTarget == 3 then
                    local objectsAroundPlayer, flingTargetPart = CheckObjectsAroundPlayer()
                    if objectsAroundPlayer then
                        local pairsIterator, pairsState, pairsIndex = pairs(objectsAroundPlayer)
                        while true do
                            local childObject
                            pairsIndex, childObject = pairsIterator(pairsState, pairsIndex)
                            if pairsIndex == nil then
                                break
                            end
                            local retryCount1 = 0
                            if childObject then
                                local headPart = childObject:FindFirstChild("Head")
                                local childPairsIterator, iteratorValue7, childPairsIndex = pairs(childObject:GetChildren())
                                while true do
                                    local childPart
                                    childPairsIndex, childPart = childPairsIterator(iteratorValue7, childPairsIndex)
                                    if childPairsIndex == nil then
                                        break
                                    end
                                    if childPart:IsA("BasePart") and childPart.CanQuery then
                                        local networkOwnership = SNOWshipTrack(childPart)
                                        local playerRootPart = GetPlayerRoot()
                                        if not networkOwnership and headPart then
                                            networkOwnership = CheckNetworkOwnerShipOnPart(headPart)
                                        end
                                        if networkOwnership and playerRootPart then
                                            if flingTargetPart then
                                                local currentPosition = flingTargetPart.Position
                                                flingTargetPart.Position = childPart.Position
                                                task.wait()
                                                flingTargetPart.Position = currentPosition
                                            elseif not childPart:FindFirstChild("FlingAuraVelocity") then
                                                local lookAtCFrame = lookAt(playerRootPart.Position, childPart.Position)
                                                local flingBodyVelocity = Instance.new("BodyVelocity", childPart)
                                                flingBodyVelocity.Name = "FlingAuraVelocity"
                                                flingBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                                flingBodyVelocity.Velocity = Vector3.new(lookAtCFrame.lookVector.X, 0.5, lookAtCFrame.lookVector.Z) * math.clamp(_G.FlingStrength, 400, 600)
                                                debrisService:AddItem(flingBodyVelocity)
                                            end
                                            retryCount1 = retryCount1 + 1
                                        end
                                        if retryCount1 >= 3 then
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if _G.FlingTarget == 1 or _G.FlingTarget == 3 then
                    local playersService = playersService
                    local playerPairsIterator, iteratorValue8, playerPairsIndex = pairs(playersService:GetPlayers())
                    while true do
                        local otherPlayer
                        playerPairsIndex, otherPlayer = playerPairsIterator(iteratorValue8, playerPairsIndex)
                        if playerPairsIndex == nil then
                            break
                        end
                        if CheckPlayerAuras(otherPlayer) then
                            local otherPlayerRootPart = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
                            local snowshipPlayer = SNOWshipPlayer(otherPlayer)
                            local localPlayerCharacter = GetPlayerCharacter()
                            if otherPlayerRootPart and (snowshipPlayer and (localPlayerCharacter and not otherPlayerRootPart:FindFirstChild("FlingAuraVelocity"))) then
                                local flingDirectionCFrame = lookAt(localPlayerCharacter.HumanoidRootPart.Position, otherPlayerRootPart.Position)
                                local flingBodyVelocity = Instance.new("BodyVelocity", otherPlayerRootPart)
                                flingBodyVelocity.Name = "FlingAuraVelocity"
                                flingBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                flingBodyVelocity.Velocity = Vector3.new(flingDirectionCFrame.lookVector.X, 0.5, flingDirectionCFrame.lookVector.Z) * _G.FlingStrength
                                debrisService:AddItem(flingBodyVelocity)
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end
    end,
    Save = true,
    Flag = "flingaura_toggle"
})
flingAuraSection:AddSlider({
    Name = "Strength",
    Min = 400,
    Max = 10000,
    Default = 400,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 100,
    ValueName = "",
    Callback = function(flingStrength)
        _G.FlingStrength = flingStrength
    end,
    Save = true,
    Flag = "flingstrengthvalue_toggle"
})
flingAuraSection:AddDropdown({
    Name = "Target",
    Default = "Players",
    Options = {
        "Players",
        "Objects",
        "Players and Objects"
    },
    Callback = function(flingTargetType)
        if flingTargetType == "Players" then
            _G.FlingTarget = 1
        elseif flingTargetType == "Objects" then
            _G.FlingTarget = 2
        elseif flingTargetType == "Players and Objects" then
            _G.FlingTarget = 3
        end
    end,
    Save = true,
    Flag = "flingtarget_dropdown"
})
function unAnchorAll()
    local anchoredPairsIterator, iteratorValue9, anchoredPairsIndex = pairs(AnchoredObjects)
    while true do
        local anchoredObjectData
        anchoredPairsIndex, anchoredObjectData = anchoredPairsIterator(iteratorValue9, anchoredPairsIndex)
        if anchoredPairsIndex == nil then
            break
        end
        if typeof(anchoredObjectData.PartAnchored) == "Instance" then
            unAnchorObject(anchoredObjectData.PartAnchored)
        end
    end
end
anchorAuraSection:AddToggle({
    Name = "Anchor Aura",
    Default = false,
    Callback = function(isAnchorAuraEnabled)
        _G.AnchorAura = isAnchorAuraEnabled
        if isAnchorAuraEnabled then
            while _G.AnchorAura do
                local objectsToAnchor = (_G.AnchorTarget == 2 or _G.AnchorTarget == 3) and CheckObjectsAroundPlayer()
                if objectsToAnchor then
                    local anchorPairsIterator, anchorPairsState, anchorPairsIndex = pairs(objectsToAnchor)
                    while true do
                        local anchoredObject
                        anchorPairsIndex, anchoredObject = anchorPairsIterator(anchorPairsState, anchorPairsIndex)
                        if anchorPairsIndex == nil then
                            break
                        end
                        local retryCount2 = 0
                        if anchoredObject then
                            local isAnchored = anchoredObject:GetAttribute("IsAnchored")
                            if not isAnchored then
                                local iterator, state, index = pairs(anchoredObject:GetChildren())
                                while true do
                                    local child
                                    index, child = iterator(state, index)
                                    if index == nil then
                                        break
                                    end
                                    if (child:IsA("BasePart") or child:IsA("MeshPart")) and child.CanQuery then
                                        if (CheckNetworkOwnerShipOnPart(child) or SNOWshipOnce(child)) and not isAnchored then
                                            setanchorObject(child)
                                            retryCount2 = retryCount2 + 1
                                        end
                                        if retryCount2 >= 3 then
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if _G.AnchorTarget == 1 or _G.AnchorTarget == 3 then
                    local playersService2 = playersService
                    local playerIterator, iteratorValue10, playerIndex = pairs(playersService2:GetPlayers())
                    while true do
                        local player
                        playerIndex, player = playerIterator(iteratorValue10, playerIndex)
                        if playerIndex == nil then
                            break
                        end
                        if CheckPlayerAuras(player) then
                            local characterModel = player.Character
                            local humanoidRootPart2 = characterModel:FindFirstChild("HumanoidRootPart")
                            if humanoidRootPart2 and not characterModel:GetAttribute("IsAnchored") and (CheckNetworkOwnerShipOnPlayer(player) or SNOWshipPlayer(player)) then
                                setanchorObject(humanoidRootPart2)
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end
    end,
    Save = true,
    Flag = "anchoraura_toggle"
})
anchorAuraSection:AddDropdown({
    Name = "Target",
    Default = "Players",
    Options = {
        "Players",
        "Objects",
        "Players and Objects"
    },
    Callback = function(anchorTargetType)
        if anchorTargetType == "Players" then
            _G.AnchorTarget = 1
        elseif anchorTargetType == "Objects" then
            _G.AnchorTarget = 2
        elseif anchorTargetType == "Players and Objects" then
            _G.AnchorTarget = 3
        end
    end,
    Save = true,
    Flag = "anchortarget_dropdown"
})
anchorAuraSection:AddButton({
    Name = "Unanchor All",
    Callback = function(_)
        unAnchorAll()
    end
})
GroupCollisionData = {}
function SetCollisionObjectOff(modelInstance)
    if typeof(modelInstance) == "Instance" and (modelInstance:IsA("Model") and not modelInstance:GetAttribute("ObjectCollisions")) then
        modelInstance:SetAttribute("ObjectCollisions", true)
        local descendants = modelInstance:GetDescendants()
        local partIterator, pairsIteratorState, partIndex = pairs(descendants)
        local oldCanCollideValues = {}
        while true do
            local part
            partIndex, part = partIterator(pairsIteratorState, partIndex)
            if partIndex == nil then
                break
            end
            if part:IsA("BasePart") or (part:IsA("Part") or part:IsA("MeshPart")) then
                oldCanCollideValues[part] = part.CanCollide
            end
        end
        table.insert(GroupCollisionData, {
            Model = modelInstance,
            OldValues = oldCanCollideValues
        })
        local instanceIterator, descendantPairsIterator, instanceIndex = pairs(descendants)
        while true do
            local descendantPart
            instanceIndex, descendantPart = instanceIterator(descendantPairsIterator, instanceIndex)
            if instanceIndex == nil then
                break
            end
            if descendantPart:IsA("BasePart") or (descendantPart:IsA("Part") or descendantPart:IsA("MeshPart")) then
                descendantPart.CanCollide = false
            end
        end
    end
end
function SetCollisionObjectOn(modelInstance)
    if typeof(modelInstance) == "Instance" and (modelInstance:IsA("Model") and modelInstance:GetAttribute("ObjectCollisions")) then
        local collisionGroupIterator, groupCollisionDataPairsIteratorState, collisionGroupIndex = pairs(GroupCollisionData)
        while true do
            local collisionGroupData
            collisionGroupIndex, collisionGroupData = collisionGroupIterator(groupCollisionDataPairsIteratorState, collisionGroupIndex)
            if collisionGroupIndex == nil then
                break
            end
            local partCollisionIterator, modelDataPairsIteratorState, partCollisionIndex = pairs(collisionGroupData)
            local groupCollisionDataIndex = collisionGroupIndex
            while true do
                local partCollisionValue
                partCollisionIndex, partCollisionValue = partCollisionIterator(modelDataPairsIteratorState, partCollisionIndex)
                if partCollisionIndex == nil then
                    break
                end
                if partCollisionIndex == "Model" and partCollisionValue == modelInstance then
                    local descendantIterator, descendantPairsIterator, descendantIndex = pairs(modelInstance:GetDescendants())
                    while true do
                        local descendant
                        descendantIndex, descendant = descendantIterator(descendantPairsIterator, descendantIndex)
                        if descendantIndex == nil then
                            break
                        end
                        if descendant:IsA("BasePart") or (descendant:IsA("Part") or descendant:IsA("MeshPart")) then
                            descendant.CanCollide = collisionGroupData.OldValues[descendant]
                        end
                    end
                    modelInstance:SetAttribute("ObjectCollisions", false)
                    table.remove(GroupCollisionData, groupCollisionDataIndex)
                end
            end
        end
    end
end
TornadoOffset = 0
TornadoHeight = 0
function SpiralFormulaCalculation(position, tornadoAngle, radiusOffset, tornadoRadiusMultiplier)
    if _G.TornadoShape == "Tornado" then
        return Vector3.new(position.X + (15 + radiusOffset * tornadoRadiusMultiplier) * math.sin(tornadoAngle), position.Y + 20 + tornadoRadiusMultiplier * TornadoHeight + math.sin(tornadoAngle * 0.5) * 40 + math.random(- 20, 20), position.Z + (15 + radiusOffset * tornadoRadiusMultiplier) * math.cos(tornadoAngle))
    end
    if _G.TornadoShape == "Blackhole" then
        local _ = Vector3.new
        local _ = position.X + radiusOffset * math.sin(tornadoAngle)
        local _ = position.Y + TornadoHeight
        local _ = position.Z + radiusOffset * math.cos(tornadoAngle)
    end
end
_G.LastPartToGet = nil
_G.LastTheta = 0
_G.RevertTornado = 1
TelekinesisBodiesPosition = {}
telekinesisAuraSection:AddToggle({
    Name = "Telekinesis Aura",
    Default = false,
    Callback = function(tornadoAura)
        _G.TornadoAura = tornadoAura
        if tornadoAura then
            local ignoredParts = {}
            local tornadoScale = 0
            local function applyTornadoEffect(partToTornado, bodyPositionParent)
                if not partToTornado:GetAttribute("TornadoSetup") then
                    partToTornado:SetAttribute("TornadoSetup", true)
                    if tornadoScale <= 1 then
                        tornadoScale = tornadoScale + 0.1
                    else
                        tornadoScale = 0.1
                    end
                    _G.LastPartToGet = partToTornado
                    local spiralRadius = 40 * tornadoScale
                    table.insert(ignoredParts, partToTornado)
                    local existingItemIndex = table.find(ignoredParts, partToTornado)
                    local tornadoAuraBodyPosition = Instance.new("BodyPosition", bodyPositionParent)
                    tornadoAuraBodyPosition.Name = "TornadoAuraVelocity"
                    tornadoAuraBodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    table.insert(TelekinesisBodiesPosition, tornadoAuraBodyPosition)
                    task.spawn(function()
                        local tornadoTheta = _G.LastTheta
                        local zeroVector = Vector3.new(0, 0, 0)
                        local maxForceVector = Vector3.new(1250000, 1250000, 1250000)
                        local lastHitPart = nil
                        while partToTornado.Parent and tornadoAuraBodyPosition.Parent do
                            local hitPart
                            if _G.TornadoAura then
                                if _G.LastPartToGet == partToTornado then
                                    _G.LastTheta = tornadoTheta + 0.5
                                end
                                tornadoTheta = tornadoTheta + TornadoSpeed
                                local tornadoOffset = TornadoOffset
                                if _G.TornadoFollowType ~= "Mouse" or not localPlayer.Character or not localPlayer.Character:FindFirstChild("CamPart") then
                                    hitPart = lastHitPart
                                else
                                    local raycastResult
                                    raycastResult, hitPart = workspaceService:FindPartOnRayWithIgnoreList(Ray.new(localPlayer.Character.CamPart.Position, localPlayer.Character.CamPart.CFrame.lookVector * 5000), {
                                        localPlayer.Character,
                                        table.unpack(ignoredParts)
                                    })
                                    if raycastResult and hitPart then
                                        lastHitPart = hitPart
                                    else
                                        hitPart = lastHitPart
                                    end
                                    if lastHitPart then
                                        tornadoAuraBodyPosition.Position = SpiralFormulaCalculation(lastHitPart, tornadoTheta, tornadoOffset, spiralRadius)
                                    end
                                end
                                if _G.TornadoFollowType == "Player" then
                                    MainPart = GetPlayerHRPByName(_G.TornadoFollowPlayer)
                                    if MainPart then
                                        tornadoAuraBodyPosition.Position = SpiralFormulaCalculation(MainPart.Position, tornadoTheta, tornadoOffset, spiralRadius)
                                    end
                                end
                            else
                                hitPart = lastHitPart
                            end
                            if _G.TornadoAura then
                                tornadoAuraBodyPosition.MaxForce = maxForceVector
                                SetCollisionObjectOff(partToTornado)
                            else
                                SetCollisionObjectOn(partToTornado)
                                tornadoAuraBodyPosition.MaxForce = zeroVector
                            end
                            wait()
                            lastHitPart = hitPart
                        end
                        table.remove(ignoredParts, existingItemIndex)
                        SetCollisionObjectOn(partToTornado)
                        tornadoAuraBodyPosition:Destroy()
                        partToTornado:SetAttribute("TornadoSetup", false)
                    end)
                end
            end
            while _G.TornadoAura do
                if _G.TornadoMode ~= "Aura" then
                    if _G.TornadoMode == "Click" and _G.HoldingObjectGrabPart then
                        local holdingObjectGrabPart = _G.HoldingObjectGrabPart
                        if holdingObjectGrabPart.Parent and holdingObjectGrabPart.Parent:IsA("Model") then
                            local partParent = holdingObjectGrabPart.Parent
                            local playerFromCharacter = playersService:GetPlayerFromCharacter(partParent)
                            local characterHeadPart = partParent:FindFirstChild("Head")
                            if playerFromCharacter then
                                if CheckNetworkOwnerShipOnPlayer(playerFromCharacter) then
                                    applyTornadoEffect(partParent, holdingObjectGrabPart)
                                end
                            elseif not playerFromCharacter and CheckNetworkOwnerShipOnPart(characterHeadPart or holdingObjectGrabPart) then
                                applyTornadoEffect(partParent, characterHeadPart or holdingObjectGrabPart)
                            end
                        end
                    end
                else
                    if _G.TornadoTarget == 2 or _G.TornadoTarget == 3 then
                        local objectsAroundPlayer = CheckObjectsAroundPlayer()
                        if objectsAroundPlayer then
                            local pairsIterator, pairsState, pairsKey = pairs(objectsAroundPlayer)
                            while true do
                                local descendant
                                pairsKey, descendant = pairsIterator(pairsState, pairsKey)
                                if pairsKey == nil then
                                    break
                                end
                                local retryCount3 = 0
                                if descendant then
                                    local nearbyCharacterHead = descendant:FindFirstChild("Head")
                                    local descendantPairsIterator, childPairsIterator, descendantPairsKey = pairs(descendant:GetChildren())
                                    while true do
                                        local child
                                        descendantPairsKey, child = descendantPairsIterator(childPairsIterator, descendantPairsKey)
                                        if descendantPairsKey == nil then
                                            break
                                        end
                                        if child:IsA("BasePart") and child.CanQuery then
                                            local networkOwnership = SNOWshipTrack(child)
                                            local playerRootPart = GetPlayerRoot()
                                            if not networkOwnership and nearbyCharacterHead then
                                                networkOwnership = CheckNetworkOwnerShipOnPart(nearbyCharacterHead)
                                            end
                                            if networkOwnership and playerRootPart then
                                                applyTornadoEffect(descendant, child)
                                                retryCount3 = retryCount3 + 1
                                            end
                                            if retryCount3 >= 3 then
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if _G.TornadoTarget == 1 or _G.TornadoTarget == 3 then
                        local utilityModule = playersService
                        local playerPairsIterator, playerPairsIteratorState, playerPairsKey = pairs(utilityModule:GetPlayers())
                        while true do
                            local player
                            playerPairsKey, player = playerPairsIterator(playerPairsIteratorState, playerPairsKey)
                            if playerPairsKey == nil then
                                break
                            end
                            if CheckPlayerAuras(player) then
                                local character = player.Character
                                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                                if humanoidRootPart and (SNOWshipPlayer(player) and GetPlayerCharacter()) then
                                    applyTornadoEffect(character, humanoidRootPart)
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
    Flag = "tornadoaura_toggle"
})
telekinesisAuraSection:AddDropdown({
    Name = "Select Mode",
    Default = "Aura",
    Options = {
        "Click",
        "Aura"
    },
    Callback = function(tornadoModeEnabled)
        if tornadoModeEnabled then
            _G.TornadoMode = tornadoModeEnabled
        end
    end
})
telekenesisshapedropdown = nil
telekenesisshapedropdown = telekinesisAuraSection:AddDropdown({
    Name = "Shape",
    Default = "Blackhole",
    Options = {
        "Blackhole",
        "Tornado"
    },
    Callback = function(tornadoShapeType)
        if tornadoShapeType then
            if tornadoShapeType == "Tornado" then
                telekenesissliderspeed:Set(0.495)
            end
            _G.TornadoShape = tornadoShapeType
        end
    end
})
telekinesisAuraSection:AddDropdown({
    Name = "Follow Type:",
    Default = "Player",
    Options = {
        "Player",
        "Mouse"
    },
    Callback = function(tornadoFollowType)
        if tornadoFollowType then
            _G.TornadoFollowType = tornadoFollowType
        end
    end
})
RotationAuraList = telekinesisAuraSection:AddDropdown({
    Name = "Follow Player:",
    Default = "",
    Options = {
        ""
    },
    Callback = function(tornadoFollowPlayerName)
        if tornadoFollowPlayerName then
            _G.TornadoFollowPlayer = string.split(tornadoFollowPlayerName, " ")[1]
        end
    end
})
_G.TornadoFollowPlayer = localPlayer.Name
telekinesisAuraSection:AddDropdown({
    Name = "Target",
    Default = "Players",
    Options = {
        "Players",
        "Objects",
        "Players and Objects"
    },
    Callback = function(tornadoTargetType)
        if tornadoTargetType == "Players" then
            _G.TornadoTarget = 1
        elseif tornadoTargetType == "Objects" then
            _G.TornadoTarget = 2
        elseif tornadoTargetType == "Players and Objects" then
            _G.TornadoTarget = 3
        end
    end,
    Save = true,
    Flag = "tornadotarget_dropdown"
})
telekinesisAuraSection:AddSlider({
    Name = "Distance",
    Min = 5,
    Max = 1000,
    Default = 10,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 5,
    ValueName = "Offset",
    Callback = function(tornadoOffset)
        TornadoOffset = tornadoOffset
    end,
    Save = true,
    Flag = "tornadodistance_toggle"
})
telekinesisAuraSection:AddSlider({
    Name = "Height",
    Min = 5,
    Max = 1000,
    Default = 10,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 5,
    ValueName = "Offset",
    Callback = function(tornadoHeight)
        TornadoHeight = tornadoHeight
    end,
    Save = true,
    Flag = "tornadoheight_toggle"
})
telekenesissliderspeed = nil
telekenesissliderspeed = telekinesisAuraSection:AddSlider({
    Name = "Speed",
    Min = 0.01,
    Max = 0.5,
    Default = 0.01,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.015,
    ValueName = "Rotation Speed",
    Callback = function(tornadoSpeed)
        TornadoSpeed = tornadoSpeed
    end,
    Save = true,
    Flag = "tornadospeed_toggle"
})
telekinesisAuraSection:AddButton({
    Name = "Disconnect All",
    Callback = function()
        local telekinesisBodiesIterator, telekinesisBodiesState, telekinesisBodiesKey = pairs(TelekinesisBodiesPosition)
        while true do
            local spawnedObject
            telekinesisBodiesKey, spawnedObject = telekinesisBodiesIterator(telekinesisBodiesState, telekinesisBodiesKey)
            if telekinesisBodiesKey == nil then
                break
            end
            spawnedObject:Destroy()
            TelekinesisBodiesPosition[telekinesisBodiesKey] = nil
        end
        print(# TelekinesisBodiesPosition)
    end
})
normalAurasSection:AddToggle({
    Name = "Attraction Aura",
    Default = false,
    Callback = function(AttractionAura)
        _G.AttractionAura = AttractionAura
        if AttractionAura then
            while _G.AttractionAura do
                local gamePlayersService = playersService
                local playerServicePairsIterator, playerPairsIteratorState, playerServicePairsKey = pairs(gamePlayersService:GetPlayers())
                while true do
                    local player
                    playerServicePairsKey, player = playerServicePairsIterator(playerPairsIteratorState, playerServicePairsKey)
                    if playerServicePairsKey == nil then
                        break
                    end
                    if CheckPlayerAuras(player) then
                        local character = player.Character
                        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        local playerCharacter = GetPlayerCharacter()
                        if humanoid and (humanoidRootPart and playerCharacter) then
                            SNOWship(humanoidRootPart)
                            humanoid.Sit = false
                            humanoid.WalkSpeed = 25
                            humanoid:MoveTo(playerCharacter.HumanoidRootPart.Position)
                        end
                    end
                end
                task.wait()
            end
        end
    end,
    Save = true,
    Flag = "attractaura_toggle"
})
kickauratoggle = nil
KickTypesList = {
    "Silent",
    "Float",
    "Sky Anchor"
}
function CreateKickPhysical(filterInstance, auraPart, auraType)
    if auraPart:FindFirstChild("KickAuraP") then
        auraPart.KickAuraP:SetAttribute("TypeFunction", auraType)
    else
        local kickAuraBodyPosition = Instance.new("BodyPosition", auraPart)
        kickAuraBodyPosition.Name = "KickAuraP"
        local attributeName = kickAuraBodyPosition
        kickAuraBodyPosition.SetAttribute(attributeName, "TypeFunction", auraType)
        local kickAuraBodyVelocity = Instance.new("BodyVelocity", auraPart)
        kickAuraBodyVelocity.Name = "KickAuraP1"
        kickAuraBodyVelocity.Velocity = Vector3.new(0, 400, 0)
        task.spawn(function()
            local auraPartPosition = nil
            local raycastResult = nil
            local raycastDirection = Vector3.new(0, - 100, 0)
            local zeroVector = Vector3.new(0, 0, 0)
            local upwardForceVector = Vector3.new(0, 12500, 0)
            local maxForceVector = Vector3.new(4000, 4000, 4000)
            local randomPosition = Vector3.new(math.random(50, 250), 250, math.random(50, 250))
            local raycastParameters = RaycastParams.new()
            raycastParameters.FilterDescendantsInstances = {
                filterInstance
            }
            raycastParameters.FilterType = Enum.RaycastFilterType.Exclude
            local function applyKickEffect(kickType)
                if kickType == "Silent" then
                    kickAuraBodyPosition.MaxForce = upwardForceVector
                    kickAuraBodyVelocity.MaxForce = zeroVector
                    auraPartPosition = auraPart.Position
                    raycastResult = workspaceService:Raycast(auraPartPosition, raycastDirection, raycastParameters)
                    if raycastResult then
                        kickAuraBodyPosition.Position = raycastResult.Position + Vector3.new(0, 5, 0)
                    end
                elseif kickType == "Float" then
                    kickAuraBodyVelocity.MaxForce = maxForceVector
                    kickAuraBodyPosition.MaxForce = zeroVector
                elseif kickType == "Sky Anchor" then
                    kickAuraBodyPosition.MaxForce = maxForceVector
                    kickAuraBodyPosition.Position = randomPosition
                    kickAuraBodyVelocity.MaxForce = zeroVector
                end
            end
            while kickAuraBodyPosition.Parent and filterInstance.Parent do
                auraType = kickAuraBodyPosition:GetAttribute("TypeFunction")
                if auraType == "Aura" or not auraType then
                    if not _G.KickAura then
                        break
                    end
                    applyKickEffect(_G.KickAuraType)
                elseif auraType ~= "Counter" then
                    if auraType ~= "Kick_All" then
                        if auraType == "LoopKick" then
                            if not _G.LoopKickOwnership then
                                break
                            end
                            applyKickEffect(_G.LoopKickOwnerType)
                        end
                    else
                        if not _G.KickAll then
                            break
                        end
                        applyKickEffect(_G.KickAllType)
                    end
                else
                    if not _G.AutoAttacker then
                        break
                    end
                    applyKickEffect(_G.KickCounterType)
                end
                task.wait()
            end
            kickAuraBodyPosition:Destroy()
            kickAuraBodyVelocity:Destroy()
        end)
    end
end
kickauratoggle = kickAuraSection:AddToggle({
    Name = "Kick Aura",
    Default = false,
    Callback = function(isKickAuraEnabled)
        _G.KickAura = isKickAuraEnabled
        if isKickAuraEnabled then
            while _G.KickAura do
                if GetKey() ~= "Xana" then
                    kickauratoggle:Set(false)
                    showNotification("Only for premium users! Buy premium in my discord server!")
                    break
                end
                local playersService = playersService
                local getPlayersIterator, playerPairsIteratorState, playerIndex = pairs(playersService:GetPlayers())
                while true do
                    local player
                    playerIndex, player = getPlayersIterator(playerPairsIteratorState, playerIndex)
                    if playerIndex == nil then
                        break
                    end
                    if CheckPlayerAurasKick(player) then
                        local character = player.Character
                        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                        if humanoidRootPart and (character:FindFirstChildOfClass("Humanoid") and (humanoidRootPart:FindFirstChild("FirePlayerPart") and SNOWshipPlayer(player))) then
                            CreateSkyVelocity(humanoidRootPart)
                            destroyGrabLineEvent:FireServer(humanoidRootPart)
                        end
                    end
                end
                task.wait()
            end
        end
    end
})
kickAuraSection:AddDropdown({
    Name = "Kick Type",
    Default = "Go to the heaven!",
    Options = {
        "Go to the heaven!"
    },
    Callback = function(kickAuraType)
        _G.KickAuraType = kickAuraType
    end,
    Save = true,
    Flag = "kickauratype_dropdown"
})
aurasWhitelistSection:AddToggle({
    Name = "Whitelist Friends",
    Default = false,
    Callback = function(whitelistFriendsEnabled)
        _G.WhitelistFriends = whitelistFriendsEnabled
    end,
    Save = true,
    Flag = "whitelistaura_toggle"
})
local strengthSection = combatTab:AddSection({
    Name = "Strength"
})
local othersSection = combatTab:AddSection({
    Name = "Others"
})
local perspectiveSection = combatTab:AddSection({
    Name = "Perspective"
})
strengthSection:AddToggle({
    Name = "Super Strength",
    Default = false,
    Callback = function(superStrengthEnabled)
        _G.SuperStrength = superStrengthEnabled
    end,
    Save = true,
    Flag = "superstrengthgrab_toggle"
})
strengthSection:AddSlider({
    Name = "Strength",
    Min = 400,
    Max = 10000,
    Default = 400,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 100,
    ValueName = "",
    Callback = function(strengthValue)
        _G.Strength = strengthValue
    end,
    Save = true,
    Flag = "superstrengthvalue_toggle"
})
othersSection:AddToggle({
    Name = "Poison Grab",
    Default = false,
    Callback = function(poisonGrabEnabled)
        _G.Poison_Grab = poisonGrabEnabled
    end,
    Save = true,
    Flag = "poisongrab_toggle"
})
othersSection:AddToggle({
    Name = "Burn Grab",
    Default = false,
    Callback = function(burnGrabEnabled)
        _G.Burn_Grab = burnGrabEnabled
    end,
    Save = true,
    Flag = "burngrab_toggle"
})
othersSection:AddToggle({
    Name = "Death Grab",
    Default = false,
    Callback = function(deathGrabEnabled)
        _G.Death_Grab = deathGrabEnabled
    end,
    Save = true,
    Flag = "deathgrab_toggle"
})
othersSection:AddToggle({
    Name = "Massless Grab",
    Default = false,
    Callback = function(masslessGrabEnabled)
        _G.MasslessGrab = masslessGrabEnabled
    end,
    Save = true,
    Flag = "masslessgrab_toggle"
})
if paintPlayerPart then
    othersSection:AddToggle({
        Name = "Radiactive Grab",
        Default = false,
        Callback = function(radiactiveGrab)
            _G.Radiactive_Grab = radiactiveGrab
        end,
        Save = true,
        Flag = "radiactivegrab_toggle"
    })
end
othersSection:AddToggle({
    Name = "Noclip Grab",
    Default = false,
    Callback = function(noclipGrabEnabled)
        _G.NoclipGrab = noclipGrabEnabled
    end,
    Save = true,
    Flag = "noclipgrab_toggle"
})
local heartbeatConnection = nil
local perspectiveSpeed = 50
kickgrabtoggle = nil
perspectiveSection:AddToggle({
    Name = "Perspective Grab",
    Default = false,
    Callback = function(perspectiveGrabEnabled)
        _G.PerspectiveGrab = perspectiveGrabEnabled
    end,
    Save = true,
    Flag = "perspectivegrab_toggle"
})
perspectiveSection:AddSlider({
    Name = "Speed",
    Min = 50,
    Max = 150,
    Default = 50,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "",
    Callback = function(movementSpeed)
        perspectiveSpeed = movementSpeed
    end,
    Save = true,
    Flag = "perspectivespeedvalue_toggle"
})
local annoyPlayersSection = miscTab:AddSection({
    Name = "Annoy Players"
})
local kickAllSection = miscTab:AddSection({
    Name = "Kick All"
})
local bringAllSection = miscTab:AddSection({
    Name = "Bring All"
})
local whitelistSection = miscTab:AddSection({
    Name = "Whitelist"
})
freezecampart = Instance.new("Part", workspaceService)
freezecampart.Anchored = true
freezecampart.CanCollide = false
freezecampart.Transparency = 1
freezecampart.CanQuery = false
freezecampart.Size = Vector3.new()
function FreezeCam(freezeCamCFrame)
    freezecampart.CFrame = freezeCamCFrame
    workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
    workspace.CurrentCamera.CameraSubject = freezecampart
end
function unFreezeCam()
    workspace.CurrentCamera.CameraSubject = localPlayer.Character:FindFirstChildOfClass("Humanoid")
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
end
local fireAllToggle = nil
fireAllToggle = annoyPlayersSection:AddToggle({
    Name = "Fire All",
    Default = false,
    Callback = function(isFireAllEnabled)
        _G.FireAllPlayers = isFireAllEnabled
        if isFireAllEnabled then
            while _G.FireAllPlayers do
                if GetKey() ~= "Xana" then
                    fireAllToggle:Set(false)
                    showNotification("Only for premium users! Buy premium in my discord server!")
                    break
                end
                local playersServiceAnnoy = playersService
                local getPlayersIteratorAnnoy, playerIterator, playerIndexAnnoy = pairs(playersServiceAnnoy:GetPlayers())
                while true do
                    local playerAnnoy
                    playerIndexAnnoy, playerAnnoy = getPlayersIteratorAnnoy(playerIterator, playerIndexAnnoy)
                    if playerIndexAnnoy == nil then
                        break
                    end
                    if CheckPlayerAnnoyAll(playerAnnoy) then
                        local _ = playerAnnoy.Character
                        local humanoidRootPartAnnoy = playerAnnoy.Character:FindFirstChild("HumanoidRootPart")
                        local canBurn
                        if humanoidRootPartAnnoy:FindFirstChild("FirePlayerPart") and humanoidRootPartAnnoy.FirePlayerPart:FindFirstChild("CanBurn") then
                            canBurn = humanoidRootPartAnnoy.FirePlayerPart.CanBurn.Value
                        else
                            canBurn = nil
                        end
                        if humanoidRootPartAnnoy and (playerAnnoy and not (IsPlayerInsideSafeZone(playerAnnoy) or canBurn)) then
                            handleCampfireTouch(humanoidRootPartAnnoy)
                            task.wait(0.015)
                        end
                    end
                end
                task.wait()
            end
        end
    end
})
annoyalltoggle = annoyPlayersSection:AddToggle({
    Name = "Ragdoll All",
    Default = false,
    Callback = function(annoyAllPlayersEnabled)
        _G.AnnoyAllPlayers = annoyAllPlayersEnabled
        if annoyAllPlayersEnabled then
            while _G.AnnoyAllPlayers do
                if GetKey() ~= "Xana" then
                    annoyalltoggle:Set(false)
                    showNotification("Only for premium users! Buy premium in my discord server!")
                    break
                end
                local playersService = playersService
                local playerIterator, playerIterator2, playerIndex = pairs(playersService:GetPlayers())
                while true do
                    local player
                    playerIndex, player = playerIterator(playerIterator2, playerIndex)
                    if playerIndex == nil then
                        break
                    end
                    if CheckPlayerAnnoyAll(player) then
                        local character2 = player.Character
                        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        local ragdolledValue = character2:FindFirstChildOfClass("Humanoid"):FindFirstChild("Ragdolled")
                        if humanoidRootPart and (ragdolledValue and not ragdolledValue.Value) then
                            setBananaModelProperties(humanoidRootPart)
                            task.wait(0.015)
                        end
                    end
                end
                task.wait()
            end
        end
    end
})
killalltoggle = annoyPlayersSection:AddToggle({
    Name = "Kill All",
    Default = false,
    Callback = function(killAllEnabled)
        _G.KillAll = killAllEnabled
        if killAllEnabled then
            if GetKey() ~= "Xana" then
                _G.KillAll = false
                killalltoggle:Set(false)
                showNotification("Only for premium users! Buy premium in my discord server!")
                return
            end
            while _G.KillAll do
                ipos = GetPlayerCFrame()
                local playersService = playersService
                local playerIterator, playerIterator3, playerIndex = pairs(playersService:GetPlayers())
                while true do
                    local player
                    playerIndex, player = playerIterator(playerIterator3, playerIndex)
                    if playerIndex == nil then
                        break
                    end
                    if CheckPlayerKill(player) then
                        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        local humanoid = player.Character:FindFirstChild("Humanoid")
                        if player and (humanoidRootPart and humanoid) then
                            for _ = 0, 50 do
                                dialogueFunction2()
                                SNOWship(humanoidRootPart)
                                if not CheckPlayerKill(player) or (not _G.KillAll or (CheckNetworkOwnerShipOnPlayer(player) or humanoidRootPart.AssemblyLinearVelocity.Magnitude > 500)) then
                                    CreateSkyVelocity(humanoidRootPart)
                                    destroyGrabLineEvent:FireServer(humanoidRootPart)
                                    break
                                end
                                task.wait()
                                if humanoidRootPart.Position.Y <= - 12 then
                                    TeleportPlayer(CFrame.new(humanoidRootPart.Position + Vector3.new(0, 5, - 15)))
                                else
                                    TeleportPlayer(CFrame.new(humanoidRootPart.Position + Vector3.new(0, - 10, - 10)))
                                end
                                humanoid.BreakJointsOnDeath = false
                                humanoid:ChangeState(Enum.HumanoidStateType.Dead)
                                humanoid.Jump = true
                                humanoid.Sit = false
                            end
                        end
                    end
                end
                TeleportPlayer(ipos)
                task.wait(0.2)
            end
            dialogueFunction1()
            TeleportPlayer(ipos)
        end
    end
})
kickalltoggle = kickAllSection:AddToggle({
    Name = "Kick All",
    Default = false,
    Callback = function(kickAllEnabled)
        _G.KickAll = kickAllEnabled
        if kickAllEnabled then
            if GetKey() ~= "Xana" then
                _G.KickAll = false
                kickalltoggle:Set(false)
                showNotification("Only for premium users! Buy premium in my discord server!")
                return
            end
            while _G.KickAll do
                ipos = GetPlayerCFrame()
                local playersService = playersService
                local playerIterator, playerIterator4, playerIndex = pairs(playersService:GetPlayers())
                while true do
                    local player
                    playerIndex, player = playerIterator(playerIterator4, playerIndex)
                    if playerIndex == nil then
                        break
                    end
                    if CheckPlayerKick(player) then
                        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        if player and humanoidRootPart then
                            for _ = 0, 50 do
                                dialogueFunction2()
                                SNOWship(humanoidRootPart)
                                if not CheckPlayerKick(player) or (not _G.KickAll or (CheckNetworkOwnerShipOnPlayer(player) or humanoidRootPart.AssemblyLinearVelocity.Magnitude > 500)) then
                                    CreateSkyVelocity(humanoidRootPart)
                                    destroyGrabLineEvent:FireServer(humanoidRootPart)
                                    break
                                end
                                task.wait()
                                if humanoidRootPart.Position.Y <= - 12 then
                                    TeleportPlayer(CFrame.new(humanoidRootPart.Position + Vector3.new(0, 5, - 15)))
                                else
                                    TeleportPlayer(CFrame.new(humanoidRootPart.Position + Vector3.new(0, - 10, - 10)))
                                end
                            end
                        end
                    end
                end
                TeleportPlayer(ipos)
                task.wait(0.2)
            end
            dialogueFunction1()
            TeleportPlayer(ipos)
        end
    end
})
bringalltoggle = bringAllSection:AddToggle({
    Name = "Bring All",
    Default = false,
    Callback = function(bringAllEnabled)
        _G.BringAll = bringAllEnabled
        if bringAllEnabled then
            if GetKey() ~= "Xana" then
                _G.BringAll = false
                bringalltoggle:Set(false)
                showNotification("Only for premium users! Buy premium in my discord server!")
                return
            end
            local playerCFrame = GetPlayerCFrame()
            local cameraCFrame = CFrame.lookAt(workspaceService.CurrentCamera.CFrame.Position + Vector3.new(- 15, 15, 0), playerCFrame.Position)
            workspace.CurrentCamera.CFrame = cameraCFrame
            while _G.BringAll do
                FreezeCam(cameraCFrame)
                local playersService = playersService
                local playerIterator, playerIterator5, playerIndex = pairs(playersService:GetPlayers())
                while true do
                    local player
                    playerIndex, player = playerIterator(playerIterator5, playerIndex)
                    if playerIndex == nil then
                        break
                    end
                    if CheckPlayerBring(player) then
                        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                        local isRagdolled
                        if humanoid and humanoid:FindFirstChild("Ragdolled") then
                            isRagdolled = humanoid.Ragdolled
                        else
                            isRagdolled = nil
                        end
                        if player and (humanoidRootPart and (humanoid and isRagdolled)) then
                            for _ = 0, 50 do
                                if not _G.BringAll then
                                    break
                                end
                                dialogueFunction2()
                                SNOWshipOnce(humanoidRootPart)
                                if CheckNetworkOwnerShipOnPlayer(player) then
                                    if not isRagdolled.Value and player:DistanceFromCharacter(playerCFrame.Position) > 10 then
                                        humanoidRootPart.CFrame = playerCFrame
                                    end
                                    CreateBringBody(humanoidRootPart, playerCFrame)
                                    break
                                end
                                task.wait()
                                if humanoidRootPart.Position.Y <= - 12 then
                                    TeleportPlayer(CFrame.new(humanoidRootPart.Position + Vector3.new(0, 5, - 15)))
                                else
                                    TeleportPlayer(CFrame.new(humanoidRootPart.Position + Vector3.new(0, - 10, - 10)))
                                end
                            end
                        end
                    end
                end
                TeleportPlayer(CFrame.new(527, 123, - 376))
                task.wait()
            end
            unFreezeCam()
            dialogueFunction1()
            TeleportPlayer(playerCFrame)
        end
    end
})
kickAllSection:AddDropdown({
    Name = "Kick Type",
    Default = "Go to the heaven!",
    Options = {
        "Go to the heaven!"
    },
    Callback = function(kickAllType)
        _G.KickAllType = kickAllType
    end,
    Save = true,
    Flag = "kickalltype_dropdown"
})
whitelistSection:AddToggle({
    Name = "Whitelist Friends",
    Default = false,
    Callback = function(whitelistFriends3Enabled)
        _G.WhitelistFriends3 = whitelistFriends3Enabled
    end,
    Save = true,
    Flag = "whitelistfriends3_toggle"
})
local invulnerabilitySection = invincibilityTab:AddSection({
    Name = "Invulnerability"
})
local counterAttackSection = invincibilityTab:AddSection({
    Name = "Counter-Attack"
})
invulnerabilitySection:AddToggle({
    Name = "Anti-Grab",
    Default = false,
    Callback = function(antiGrabEnabled)
        _G.AntiGrab = antiGrabEnabled
        if antiGrabEnabled and not isAuthorized(heldObjectName) then
            struggleEvent:FireServer(localPlayer)
        end
    end,
    Save = true,
    Flag = "antigrab_toggle"
})
invulnerabilitySection:AddToggle({
    Name = "Anti-Burn",
    Default = false,
    Callback = function(antiBurnEnabled)
        _G.AntiBurn = antiBurnEnabled
    end,
    Save = true,
    Flag = "antiburn_toggle"
})
invulnerabilitySection:AddToggle({
    Name = "Anti-Explosion",
    Default = false,
    Callback = function(antiExplosionEnabled)
        _G.AntiExplosion = antiExplosionEnabled
    end,
    Save = true,
    Flag = "antiexplosion_toggle"
})
counterAttackSection:AddToggle({
    Name = "Auto-Attacker",
    Default = false,
    Callback = function(autoAttackerEnabled)
        _G.AutoAttacker = autoAttackerEnabled
    end,
    Save = true,
    Flag = "rinnegan_toggle"
})
counterdropdownselection = nil
counterdropdownselection = counterAttackSection:AddDropdown({
    Name = "Counter Mode",
    Default = "Repulsion",
    Options = {
        "Repulsion",
        "Freeze",
        "Death",
        "Kick"
    },
    Callback = function(counterMode)
        if counterMode == "Kick" and GetKey() ~= "Xana" then
            counterdropdownselection:Set("Repulsion")
            showNotification("Only for premium users! Buy premium in my discord server!")
        else
            _G.CounterMode = counterMode
        end
    end
})
floppadialogo = Instance.new("ScreenGui")
Floppa = Instance.new("ImageLabel")
Bubble_chat = Instance.new("ImageLabel")
BubbleTextchat = Instance.new("TextLabel")
typingsoundeffect = Instance.new("Sound", workspaceService)
typingsoundeffect2 = Instance.new("Sound", workspaceService)
typingsoundeffect.SoundId = "rbxassetid://" .. 9120299506
typingsoundeffect.Volume = 0.345
typingsoundeffect2.SoundId = "rbxassetid://" .. 9118870964
typingsoundeffect2.Volume = 1
typingsoundeffect2.PlaybackSpeed = 1.5
floppadialogo.IgnoreGuiInset = true
floppadialogo.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
floppadialogo.Name = "floppadialogo"
floppadialogo.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
floppadialogo.Parent = dialogueParent
floppadialogo.DisplayOrder = 10
floppadialogo.Enabled = false
floppadialogo.ResetOnSpawn = false
Floppa.ZIndex = 0
Floppa.BorderSizePixel = 0
Floppa.BackgroundColor3 = Color3.new(1, 1, 1)
Floppa.Image = "rbxassetid://15668608167"
Floppa.Size = UDim2.new(0.195372716, 0, 0.305668026, 0)
Floppa.BorderColor3 = Color3.new(0, 0, 0)
Floppa.Position = UDim2.new(0.0185752641, 0, 0.661330521, 0)
Floppa.Name = "Floppa"
Floppa.Parent = floppadialogo
Bubble_chat.BorderSizePixel = 0
Bubble_chat.Transparency = 1
Bubble_chatBackgroundColor3 = Color3.new(1, 1, 1)
Bubble_chat.Image = "rbxassetid://1395860348"
Bubble_chat.Size = UDim2.new(1.03356743, 0, 0.79455024, 0)
Bubble_chat.BorderColor3 = Color3.new(0, 0, 0)
Bubble_chat.BackgroundTransparency = 1
Bubble_chat.Position = UDim2.new(0.678329766, 0, - 0.292054504, 0)
Bubble_chat.Name = "Bubble chat"
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
BubbleTextchat.Text = "I saved you from falling on the void, my son!"
BubbleTextchat.Font = Enum.Font.SourceSans
BubbleTextchat.Position = UDim2.new(0.18163082, 0, 0.365639389, 0)
BubbleTextchat.BackgroundTransparency = 1
BubbleTextchat.TextTransparency = 0
BubbleTextchat.Parent = Bubble_chat
floppatweeninfo1 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
local floppaTweenService = tweenService
floppatween = tweenService.Create(floppaTweenService, Floppa, floppatweeninfo1, {
    Position = UDim2.new(0.0185752641, 0, 0.661330521, 0)
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
        floppatween.Completed:Connect(function(playbackState)
            if playbackState == Enum.PlaybackState.Completed then
                Bubble_chat.Visible = true
                BubbleTextchat.Visible = true
                BubbleTextchat.Text = ""
                local dialogueText = "I saved you from falling on the void, my son!"
                for textIndex = 0, # dialogueText do
                    BubbleTextchat.Text = string.sub(dialogueText, 1, textIndex)
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
invulnerabilitySection:AddToggle({
    Name = "Anti-Void",
    Default = false,
    Callback = function(isAntiVoidEnabled)
        _G.AntiVoid = isAntiVoidEnabled
        if isAntiVoidEnabled then
            workspaceService.FallenPartsDestroyHeight = - 1000
            while _G.AntiVoid do
                local playerCharacter = GetPlayerCharacter()
                if playerCharacter and playerCharacter.HumanoidRootPart.Position.Y < - 800 then
                    playerCharacter:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))
                    antivoidmesssage()
                end
                wait(0.1)
            end
        else
            workspaceService.FallenPartsDestroyHeight = - 100
        end
    end,
    Save = true,
    Flag = "antivoid_toggle"
})
invulnerabilitySection:AddToggle({
    Name = "Anti-Lag",
    Default = false,
    Callback = function(antiCreateLineLocalScriptDisabled)
        anticreatelinelocalscript.Disabled = antiCreateLineLocalScriptDisabled
    end,
    Save = true,
    Flag = "antilag_toggle"
})
antikicktoggle = invulnerabilitySection:AddToggle({
    Name = "Anti-Kick",
    Default = false,
    Callback = function(antiKickEnabled)
        _G.AntiKick = antiKickEnabled
        if antiKickEnabled then
            while _G.AntiKick do
                GetKunai()
                task.wait()
            end
        end
    end,
    Save = true,
    Flag = "antikick_toggle"
})
playersCharFolder = Instance.new("Model", workspaceService)
playersCharFolder.Name = "Characters"
highlightesp = Instance.new("Highlight")
highlightesp.Enabled = true
ESP_Section1 = Esp_Tab:AddSection({
    Name = "ESP Highlight"
})
ESP_Section2 = Esp_Tab:AddSection({
    Name = "ESP Billboard"
})
ESP_Section1:AddToggle({
    Name = "ESP (Highlight)",
    Default = false,
    Callback = function(espHighlightEnabled)
        _G.ESP_Hightlight = espHighlightEnabled
        if espHighlightEnabled then
            highlightesp.Parent = playersCharFolder
            local function onPlayerAddedToFolder(playerInstance)
                local playerCharacter = playerInstance ~= localPlayer and playerInstance.Character
                if playerCharacter then
                    playerCharacter.Parent = playersCharFolder
                end
            end
            local function updateCharacterHighlight()
                local playersService2 = playersService
                local pairsIterator, playerIterator6, playerIndex = pairs(playersService2:GetPlayers())
                while true do
                    local player
                    playerIndex, player = pairsIterator(playerIterator6, playerIndex)
                    if playerIndex == nil then
                        break
                    end
                    onPlayerAddedToFolder(player)
                end
            end
            updateCharacterHighlight()
            while _G.ESP_Hightlight do
                updateCharacterHighlight()
                wait(2)
            end
            highlightesp.Parent = nil
        end
    end
})
ESP_Section1:AddColorpicker({
    Name = "Fill Color",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(highlightFillColor)
        highlightesp.FillColor = highlightFillColor
    end,
    Save = true,
    Flag = "espHighlightFillcolor_picker"
})
ESP_Section1:AddSlider({
    Name = "Fill Transparency",
    Min = 0,
    Max = 1,
    Default = 0.5,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.1,
    ValueName = "Fill color transparency:",
    Callback = function(highlightFillTransparency)
        highlightesp.FillTransparency = highlightFillTransparency
    end,
    Save = true,
    Flag = "espHighlightFillTransparency_slider"
})
ESP_Section1:AddColorpicker({
    Name = "Outline Color",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(highlightOutlineColor)
        highlightesp.OutlineColor = highlightOutlineColor
    end,
    Save = true,
    Flag = "espHighlightOutlinecolor_picker"
})
ESP_Section1:AddSlider({
    Name = "Outline Transparency",
    Min = 0,
    Max = 1,
    Default = 0.5,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.1,
    ValueName = "Outline color transparency:",
    Callback = function(highlightOutlineTransparency)
        highlightesp.OutlineTransparency = highlightOutlineTransparency
    end,
    Save = true,
    Flag = "espHighlightOutlineTransparency_slider"
})
ESP_Section1:AddDropdown({
    Name = "Highlight Mode",
    Default = "AlwaysOnTop",
    Options = {
        "AlwaysOnTop",
        "Occluded"
    },
    Callback = function(highlightDepthMode)
        highlightesp.DepthMode = Enum.HighlightDepthMode[highlightDepthMode]
    end,
    Save = true,
    Flag = "espHighlightMode_dropdown"
})
function ESPIconCreation()
    local espBillboardGui = Instance.new("BillboardGui")
    local userImageButton = Instance.new("ImageButton")
    local userImageCorner = Instance.new("UICorner")
    local usernameLabel = Instance.new("TextLabel")
    local textSizeConstraint = Instance.new("UITextSizeConstraint")
    local aspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    espBillboardGui.Name = "ESP"
    espBillboardGui.Parent = nil
    espBillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    espBillboardGui.Active = true
    espBillboardGui.Adornee = nil
    espBillboardGui.AlwaysOnTop = true
    espBillboardGui.ExtentsOffset = Vector3.new(0, 10, 0)
    espBillboardGui.Size = UDim2.new(3, 50, 3, 45)
    userImageButton.Name = "UserImage"
    userImageButton.Parent = espBillboardGui
    userImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
    userImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    userImageButton.BackgroundTransparency = 1
    userImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    userImageButton.BorderSizePixel = 0
    userImageButton.Position = UDim2.new(0.5, 0, 0.300000012, 0)
    userImageButton.Size = UDim2.new(0.5, 5, 0.5, 5)
    userImageButton.Image = ""
    userImageCorner.CornerRadius = UDim.new(2, 0)
    userImageCorner.Parent = userImageButton
    usernameLabel.Name = "Username"
    usernameLabel.Parent = espBillboardGui
    usernameLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    usernameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    usernameLabel.BackgroundTransparency = 1
    usernameLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    usernameLabel.BorderSizePixel = 0
    usernameLabel.Position = UDim2.new(0.5, 0, 0.75999999, 0)
    usernameLabel.Size = UDim2.new(1, 5, 0.340000004, 5)
    usernameLabel.Font = Enum.Font.SourceSans
    usernameLabel.Text = ""
    usernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    usernameLabel.TextScaled = true
    usernameLabel.TextSize = 35
    usernameLabel.TextStrokeTransparency = 0
    usernameLabel.TextWrapped = true
    textSizeConstraint.Parent = usernameLabel
    textSizeConstraint.MaxTextSize = 35
    textSizeConstraint.MinTextSize = 15
    aspectRatioConstraint.Parent = espBillboardGui
    aspectRatioConstraint.AspectRatio = 1.043
    return espBillboardGui
end
ESPIconCreation = ESPIconCreation()
function CreateIconOnPlayer(player)
    if player.Character then
        local playerCharacterModel = player.Character
        local headPart = playerCharacterModel:WaitForChild("Head", 1)
        if not playerCharacterModel:FindFirstChild("ESP") and headPart then
            local espIcon = ESPIconCreation:Clone()
            espIcon.Parent = playerCharacterModel
            espIcon.Adornee = headPart
            espIcon.Username.Text = player.Name
            espIcon.UserImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"
            task.spawn(function()
                while playerCharacterModel.Parent and _G.ESP_Icon do
                    task.wait(0.25)
                end
                espIcon:Destroy()
            end)
        end
    end
end
ESP_Section2:AddToggle({
    Name = "ESP (Icon)",
    Default = false,
    Callback = function(espIconEnabled)
        _G.ESP_Icon = espIconEnabled
        if espIconEnabled then
            local characterAddedConnections = {}
            local function disconnectCharacterAddedConnections()
                local connectionPairsIterator, connectionState, connectionIndex = pairs(characterAddedConnections)
                while true do
                    local rbxScriptConnection
                    connectionIndex, rbxScriptConnection = connectionPairsIterator(connectionState, connectionIndex)
                    if connectionIndex == nil then
                        break
                    end
                    if typeof(rbxScriptConnection) == "RBXScriptConnection" then
                        rbxScriptConnection:Disconnect()
                        print("Desconectado!")
                    end
                end
                table.clear(characterAddedConnections)
            end
            local function onPlayerAdded(player)
                if player ~= localPlayer and (player.Character or player.CharacterAdded:Wait()) then
                    CreateIconOnPlayer(player)
                    characterAddedConnections[# characterAddedConnections + 1] = player.CharacterAdded:Connect(function(_)
                        CreateIconOnPlayer(player)
                    end)
                end
            end
            local function onPlayerAdded()
                local players = playersService
                local pairsIterator2, playerPairsIterator, playerIndex2 = pairs(players:GetPlayers())
                while true do
                    local player2
                    playerIndex2, player2 = pairsIterator2(playerPairsIterator, playerIndex2)
                    if playerIndex2 == nil then
                        break
                    end
                    onPlayerAdded(player2)
                end
            end
            local playerAddedConnection = playersService.PlayerAdded:Connect(function(unknownParameter)
                onPlayerAdded(unknownParameter)
            end)
            onPlayerAdded()
            while _G.ESP_Icon do
                wait(0.1)
            end
            playerAddedConnection:Disconnect()
            disconnectCharacterAddedConnections()
        end
    end
})
MapTeleport_Section = teleportTab:AddSection({
    Name = "Place TP"
})
PlayerTeleport_Section = teleportTab:AddSection({
    Name = "Player TP"
})
placeLocations = {
    ["Green House"] = CFrame.new(- 352, 99, 354),
    ["Green Safe-House"] = CFrame.new(- 584, - 6, 93),
    ["Chinese Safe-House"] = CFrame.new(579, 124, - 94),
    ["Farm House"] = CFrame.new(- 234, 83, - 324),
    Spawn = CFrame.new(4, - 7, - 3),
    ["Blue Safe-House"] = CFrame.new(538, 96, - 372),
    ["Secret Big Cave"] = CFrame.new(17, - 7, 539),
    ["Secret Train Cave"] = CFrame.new(500, 62, - 307),
    ["Mine Cave"] = CFrame.new(- 254, - 7, 518),
    ["Witch Safe-House"] = CFrame.new(296, - 4, 494),
    ["Red Safe-House"] = CFrame.new(- 516, - 6, - 162)
}
MapTeleport_Section:AddDropdown({
    Name = "Place to Teleport",
    Default = "Green House",
    Options = {
        "Green House",
        "Chinese Safe-House",
        "Spawn",
        "Blue Safe-House",
        "Secret Big Cave",
        "Secret Train Cave",
        "Mine Cave",
        "Farm House",
        "Witch Safe-House",
        "Green Safe-House",
        "Red Safe-House"
    },
    Callback = function(placeToTeleport)
        _G.PlaceToTeleport = placeToTeleport
    end
})
MapTeleport_Section:AddButton({
    Name = "Teleport",
    Callback = function()
        TeleportPlayer(placeLocations[_G.PlaceToTeleport])
    end
})
PlayerToTeleport = PlayerTeleport_Section:AddDropdown({
    Name = "Select Player",
    Default = "",
    Options = {
        ""
    },
    Callback = function(playerNameString)
        local playerNameParts = string.split(playerNameString, " ")
        _G.PlayerToTeleport = playerNameParts[1]
    end
})
function teleportplayerfunctionoffset(targetPart, playerRootPart, playerModel, playerToTeleport)
    local teleportCFrame = nil
    if _G.PlayerToTeleportDirection ~= "Behind" then
        if _G.PlayerToTeleportDirection ~= "Front" then
            if _G.PlayerToTeleportDirection ~= "Right" then
                if _G.PlayerToTeleportDirection ~= "Left" then
                    if _G.PlayerToTeleportDirection == "Rotate" and (playerRootPart and playerModel) then
                        local rotationAngle = 0
                        while _G.PlayerToTeleportDirection == "Rotate" and (_G.LoopPlayerTP and (playerModel:IsDescendantOf(workspaceService) and playerToTeleport == _G.PlayerToTeleport)) do
                            rotationAngle = rotationAngle + 0.1
                            teleportCFrame = CFrame.new(playerRootPart.Position + Vector3.new(math.clamp(math.cos(rotationAngle), - 1, 1), 0, math.clamp(math.sin(rotationAngle), - 1, 1)) * (TeleportPlayerOffset + 1), playerRootPart.Position)
                            TeleportPlayer(teleportCFrame)
                            task.wait()
                        end
                    end
                else
                    teleportCFrame = CFrame.new(targetPart.Position - targetPart.rightVector * (TeleportPlayerOffset + 1))
                end
            else
                teleportCFrame = CFrame.new(targetPart.Position + targetPart.rightVector * (TeleportPlayerOffset + 1))
            end
        else
            teleportCFrame = CFrame.new(targetPart.Position + targetPart.lookVector * (TeleportPlayerOffset + 1))
        end
    else
        teleportCFrame = CFrame.new(targetPart.Position - targetPart.lookVector * (TeleportPlayerOffset + 1))
    end
    if _G.PlayerToTeleportDirection ~= "Rotate" then
        TeleportPlayer(teleportCFrame)
    end
end
PlayerTeleport_Section:AddButton({
    Name = "Teleport",
    Callback = function()
        local playerToTeleport = playersService:FindFirstChild(_G.PlayerToTeleport)
        local playerRoot = GetPlayerRoot()
        local humanoidRootPart = playerToTeleport and (playerToTeleport.Character and playerRoot) and playerToTeleport.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            teleportplayerfunctionoffset(humanoidRootPart.CFrame, playerRoot)
        end
    end
})
PlayerLoopTeleport = PlayerTeleport_Section:AddToggle({
    Name = "Loop Teleport",
    Default = false,
    Callback = function(loopPlayerTeleport)
        _G.LoopPlayerTP = loopPlayerTeleport
        if loopPlayerTeleport then
            while _G.LoopPlayerTP do
                local playerToTeleport2 = playersService:FindFirstChild(_G.PlayerToTeleport)
                if playerToTeleport2 and (playerToTeleport2.Character and not IsPlayerKickingWithBlobman()) then
                    local characterModel = playerToTeleport2.Character
                    local humanoidRootPart = characterModel:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        teleportplayerfunctionoffset(humanoidRootPart.CFrame, humanoidRootPart, characterModel, playerToTeleport2.Name)
                    end
                elseif not playerToTeleport2 then
                    if PlayerLoopTeleport then
                        PlayerLoopTeleport:Set(false)
                    end
                    _G.LoopPlayerTP = false
                end
                task.wait()
            end
        end
    end
})
PlayerLockCamera = PlayerTeleport_Section:AddToggle({
    Name = "Lock Camera",
    Default = false,
    Callback = function(lockCameraOnPlayer)
        _G.LockCameraOnPlayer = lockCameraOnPlayer
        if lockCameraOnPlayer then
            local playerToLockCamera = nil
            local humanoidRootPart = nil
            local targetCharacter = nil
            local currentCamera = nil
            local renderSteppedConnection = nil
            renderSteppedConnection = runService.RenderStepped:Connect(function()
                playerToLockCamera = playersService:FindFirstChild(_G.PlayerToTeleport)
                currentCamera = workspaceService.CurrentCamera
                if not _G.LockCameraOnPlayer then
                    renderSteppedConnection:Disconnect()
                end
                if playerToLockCamera and (playerToLockCamera.Character and currentCamera) then
                    targetCharacter = playerToLockCamera.Character
                    humanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        currentCamera.CFrame = CFrame.lookAt(currentCamera.CFrame.Position, humanoidRootPart.CFrame.Position + Vector3.new(0, 1, 0))
                    end
                elseif not playerToLockCamera then
                    if PlayerLockCamera then
                        PlayerLockCamera:Set(false)
                    end
                    _G.LockCameraOnPlayer = false
                end
                task.wait()
            end)
        end
    end
})
PlayerViewCamera = PlayerTeleport_Section:AddToggle({
    Name = "View",
    Default = false,
    Callback = function(viewCameraOnPlayer)
        _G.ViewCameraOnPlayer = viewCameraOnPlayer
        if viewCameraOnPlayer then
            local camera = workspaceService.CurrentCamera
            local cameraSubject = camera.CameraSubject
            while _G.ViewCameraOnPlayer do
                local playerToTeleport = playersService:FindFirstChild(_G.PlayerToTeleport)
                if playerToTeleport and (playerToTeleport.Character and camera) then
                    local humanoid = playerToTeleport.Character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        camera.CameraSubject = humanoid
                    end
                elseif not playerToTeleport then
                    if PlayerViewCamera then
                        PlayerViewCamera:Set(false)
                    end
                    _G.ViewCameraOnPlayer = false
                end
                wait()
            end
            camera.CameraSubject = cameraSubject
        end
    end
})
PlayerTeleport_Section:AddSlider({
    Name = "Offset",
    Min = 1,
    Max = 20,
    Default = 1,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "Teleport Offset",
    Callback = function(teleportPlayerOffset)
        TeleportPlayerOffset = teleportPlayerOffset
    end,
    Save = true,
    Flag = "speed_slider"
})
PlayerTeleport_Section:AddDropdown({
    Name = "Behavior",
    Default = "Behind",
    Options = {
        "Behind",
        "Left",
        "Right",
        "Front",
        "Rotate"
    },
    Callback = function(playerToTeleportDirection)
        _G.PlayerToTeleportDirection = playerToTeleportDirection
    end
})
WS_Section = playerTab:AddSection({
    Name = "Walkspeed"
})
JP_Section = playerTab:AddSection({
    Name = "Infinite Power Jump"
})
NC_Section = playerTab:AddSection({
    Name = "Noclip"
})
WS_Section:AddToggle({
    Name = "Walkspeed",
    Default = false,
    Callback = function(superSpeedEnabled)
        _G.SuperSpeed = superSpeedEnabled
    end,
    Save = true,
    Flag = "walkspeed_toggle"
})
WS_Section:AddSlider({
    Name = "Speed",
    Min = 0.1,
    Max = 5,
    Default = 0.1,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.01,
    ValueName = "",
    Callback = function(speedMultiplier)
        Multiplier = speedMultiplier
    end,
    Save = true,
    Flag = "speed_slider"
})
JP_Section:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(infiniteJumpEnabled)
        _G.InfiniteJump = infiniteJumpEnabled
    end,
    Save = true,
    Flag = "infinitejump_toggle"
})
JP_Section:AddSlider({
    Name = "Jump Power",
    Min = 24,
    Max = 1000,
    Default = 24,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 10,
    ValueName = "",
    Callback = function(infiniteJumpPower)
        _G.InfiniteJumpPower = infiniteJumpPower
        localPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = infiniteJumpPower
    end,
    Save = true,
    Flag = "jumppower_slider"
})
NC_Section:AddToggle({
    Name = "Noclip",
    Default = false,
    Callback = function(noclipEnabled)
        _G.NoclipToggle = noclipEnabled
        if noclipEnabled then
            dialogueFunction2()
        else
            dialogueFunction1()
        end
    end,
    Save = true,
    Flag = "noclip_toggle"
})
local lineColors = {
    Color3.new(1, 0, 0),
    Color3.new(1, 0, 0),
    Color3.new(1, 0, 0),
    Color3.new(1, 0, 0),
    Color3.new(1, 0, 0),
    Color3.new(1, 0, 0),
    Color3.new(1, 0, 0),
    Color3.new(1, 0, 0),
    Color3.new(1, 0, 0),
    Color3.new(1, 0, 0)
}
RandomLineColors = {
    Color3.fromRGB(248, 247, 248),
    Color3.fromRGB(248, 246, 248),
    Color3.fromRGB(245, 245, 242),
    Color3.fromRGB(245, 244, 242),
    Color3.fromRGB(245, 243, 242),
    Color3.fromRGB(245, 242, 242),
    Color3.fromRGB(245, 241, 242),
    Color3.fromRGB(245, 240, 242)
}
local lineColorSection = customLineTab:AddSection({
    Name = "Change your entire line color"
})
local lineEffectsSection = customLineTab:AddSection({
    Name = "Line Effects"
})
local stressServerSection = customLineTab:AddSection({
    Name = "Stress Server"
})
LagServerToggle = nil
LagServerToggle = stressServerSection:AddToggle({
    Name = "Lag Server",
    Default = false,
    Callback = function(laggg)
        laggg = laggg
        while laggg do
            if GetKey() ~= "Xana" then
                LagServerToggle:Set(false)
                showNotification("Only for premium users! Buy premium in my discord server!")
                break
            end
            for _ = 0, Lag_Intensity do
                local ipairsIterator, playersTable, playerIndex = ipairs(game:GetService("Players"):GetPlayers())
                while true do
                    local player
                    playerIndex, player = ipairsIterator(playersTable, playerIndex)
                    if playerIndex == nil then
                        break
                    end
                    if player.Character.Torso ~= nil then
                        createGrabLineEvent:FireServer(player.Character.Torso, player.Character.Torso.CFrame)
                    end
                end
            end
            wait(1)
        end
    end
})
stressServerSection:AddSlider({
    Name = "Lag Intensity",
    Min = 1,
    Max = 400,
    Default = 150,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "This can have you kicked or kick someone in the server!",
    Save = true,
    Flag = "Lag-Intensity",
    Callback = function(lagIntensity)
        Lag_Intensity = lagIntensity
    end
})
lineColorSection:AddColorpicker({
    Name = "Choose the color",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(lineColorChangeValue)
        _G.LineColorChangeValue = lineColorChangeValue
    end,
    Save = true,
    Flag = "changelinecolor_picker"
})
lineColorSection:AddButton({
    Name = "Apply Colors",
    Callback = function()
        local pairsIterator, colorSequenceTable, colorSequenceIndex = pairs(lineColors)
        while true do
            local colorIndex
            colorSequenceIndex, colorIndex = pairsIterator(colorSequenceTable, colorSequenceIndex)
            if colorSequenceIndex == nil then
                break
            end
            if colorSequenceIndex == 1 then
                lineColors[colorSequenceIndex] = ColorSequence.new(_G.LineColorChangeValue, 1)
            else
                lineColors[colorSequenceIndex] = Color3.new(_G.LineColorChangeValue.R / 255, _G.LineColorChangeValue.G / 255, _G.LineColorChangeValue.B / 255)
            end
        end
        updateLineColorsEvent:FireServer(unpack(lineColors))
    end
})
lineEffectsSection:AddToggle({
    Name = "Crazy Line (Soft Lag)",
    Default = false,
    Callback = function(crazyLineEnabled)
        if crazyLineEnabled then
            _G.CrazyLine = crazyLineEnabled
            while _G.CrazyLine do
                local playersService = playersService
                local pairsIterator2, playerPairsIterator, playerIndex2 = pairs(playersService:GetPlayers())
                while true do
                    local player2
                    playerIndex2, player2 = pairsIterator2(playerPairsIterator, playerIndex2)
                    if playerIndex2 == nil then
                        break
                    end
                    if player2 and (player2 ~= localPlayer and player2.Character) and player2.Character:FindFirstChild("Torso") then
                        createGrabLineEvent:FireServer(player2.Character:FindFirstChild("Torso"), CFrame.new(0.12640380859375, 0.9606337547302246, - 0.5000009536743164, 0.9985212683677673, 0, - 0.05436277016997337, - 6.4805472099749295e-9, 1, - 1.1903301100346653e-7, 0.05436277016997337, 5.960464477539063e-8, 0.9985212683677673))
                    end
                    task.wait()
                end
            end
        else
            _G.CrazyLine = crazyLineEnabled
        end
    end
})
lineEffectsSection:AddToggle({
    Name = "Invisible Line",
    Default = false,
    Callback = function(invisibleLineEnabled)
        if invisibleLineEnabled then
            _G.InvisibleLine = invisibleLineEnabled
        else
            _G.InvisibleLine = invisibleLineEnabled
        end
    end,
    Save = true,
    Flag = "invisLine_toggle"
})
gui2 = Instance.new("ScreenGui")
gui2.ResetOnSpawn = false
gui2.Name = "CAG2"
if userInputService.TouchEnabled then
    gui2.Parent = localPlayer.PlayerGui
end
imageButtonTeleport = Instance.new("ImageButton")
imageButtonTeleport.Size = UDim2.new(0, 70, 0, 70)
imageButtonTeleport.Position = UDim2.new(1, - 267, 1, - 90)
imageButtonTeleport.Image = "rbxassetid://97166444"
imageButtonTeleport.BackgroundTransparency = 1
imageButtonTeleport.ImageTransparency = 0.2
imageButtonTeleport.ImageColor3 = Color3.fromRGB(142, 142, 142)
imageButtonTeleport.Parent = gui2
imageTLabel = Instance.new("ImageLabel")
imageTLabel.Size = UDim2.new(1, 0, 1, 0)
imageTLabel.Image = "rbxassetid://6723742952"
imageTLabel.BackgroundTransparency = 1
imageTLabel.Parent = imageButtonTeleport
imageButtonControl = Instance.new("ImageButton")
imageButtonControl.Size = UDim2.new(0, 50, 0, 50)
imageButtonControl.Position = UDim2.new(1, - 378, 1, - 80)
imageButtonControl.Image = "rbxassetid://97166444"
imageButtonControl.BackgroundTransparency = 1
imageButtonControl.ImageTransparency = 0.2
imageButtonControl.ImageColor3 = Color3.fromRGB(142, 142, 142)
imageButtonControl.Parent = gui2
imageCLabel = Instance.new("ImageLabel")
imageCLabel.Size = UDim2.new(1, 0, 1, 0)
imageCLabel.Image = "rbxassetid://14436167187"
imageCLabel.BackgroundTransparency = 1
imageCLabel.Parent = imageButtonControl
imageButtonAnchor = Instance.new("ImageButton")
imageButtonAnchor.Size = UDim2.new(0, 50, 0, 50)
imageButtonAnchor.Position = UDim2.new(1, - 325, 1, - 80)
imageButtonAnchor.Image = "rbxassetid://97166444"
imageButtonAnchor.BackgroundTransparency = 1
imageButtonAnchor.ImageTransparency = 0.2
imageButtonAnchor.ImageColor3 = Color3.fromRGB(142, 142, 142)
imageButtonAnchor.Parent = gui2
imageKLabelDe = Instance.new("ImageLabel")
imageKLabelDe.Size = UDim2.new(1, 0, 1, 0)
imageKLabelDe.Image = "rbxassetid://3040311268"
imageKLabelDe.BackgroundTransparency = 1
imageKLabelDe.Parent = imageButtonAnchor
imageButtonAnchor.InputBegan:Connect(function(userInputAnchor, isAnchorTouchEnabled)
    if not isAnchorTouchEnabled and (userInputService.TouchEnabled and userInputAnchor.UserInputType == Enum.UserInputType.Touch) then
        anchorfunc()
    end
end)
imageButtonTeleport.InputBegan:Connect(function(userInputTeleport, isTeleportTouchEnabled)
    if not isTeleportTouchEnabled and (userInputService.TouchEnabled and userInputTeleport.UserInputType == Enum.UserInputType.Touch) then
        teleportfunc()
    end
end)
imageButtonControl.InputBegan:Connect(function(userInputControl, isControlTouchEnabled)
    if not isControlTouchEnabled and (userInputService.TouchEnabled and userInputControl.UserInputType == Enum.UserInputType.Touch) then
        controlBind("Control(C)", Enum.UserInputState.Begin)
    end
end)
local teleportSection = keybindsTab:AddSection({
    Name = "Teleport"
})
local spawnToySection = keybindsTab:AddSection({
    Name = "Spawn Toy"
})
local anchorObjectsSection = keybindsTab:AddSection({
    Name = "Anchor Objects"
})
local compileObjectsSection = keybindsTab:AddSection({
    Name = "Compile Objects"
})
local controlPlayerSection = keybindsTab:AddSection({
    Name = "Control Player/NPC"
})
anchorObjectsSection:AddToggle({
    Name = "Anchor (K)",
    Default = false,
    Callback = function(isAnchorEnabled)
        imageButtonAnchor.Visible = isAnchorEnabled
        imageButtonAnchor.Active = isAnchorEnabled
        if isAnchorEnabled then
            contextActionService:BindAction("AnchorK", anchorobject, false, Enum.KeyCode.K)
        else
            contextActionService:UnbindAction("AnchorK")
        end
    end,
    Save = true,
    Flag = "anchorbind_toggle"
})
anchorObjectsSection:AddButton({
    Name = "Unanchor All",
    Callback = function(_)
        unAnchorAll()
    end
})
compileObjectsSection:AddButton({
    Name = "Compile New Group",
    Callback = function()
        checkAnchoredParts()
    end
})
CompileGroups_Dropdown = compileObjectsSection:AddDropdown({
    Name = "Groups",
    Default = "",
    Options = {
        ""
    },
    Callback = function(compileGroupSelected)
        _G.CompileGroupSelected = compileGroupSelected
    end
})
compileObjectsSection:AddButton({
    Name = "Delete Group",
    Callback = function()
        RemoveGroupCompileFromName(_G.CompileGroupSelected)
        updateCompileGroupsDropdown(CompileGroups_Dropdown)
    end
})
teleportSection:AddToggle({
    Name = "Teleport (Z)",
    Default = false,
    Callback = function(isVisible)
        imageButtonTeleport.Visible = isVisible
        imageButtonTeleport.Active = isVisible
        if isVisible then
            contextActionService:BindAction("Teleport(Z)", onTeleportAction, false, Enum.KeyCode.Z)
        else
            contextActionService:UnbindAction("Teleport(Z)")
        end
    end,
    Save = true,
    Flag = "teleportbind_toggle"
})
controlPlayerSection:AddToggle({
    Name = "Control (C)",
    Default = false,
    Callback = function(isControlEnabled)
        imageButtonControl.Visible = isControlEnabled
        imageButtonControl.Active = isControlEnabled
        if isControlEnabled then
            contextActionService:BindAction("Control(C)", controlBind, false, Enum.KeyCode.C)
        else
            contextActionService:UnbindAction("Control(C)")
        end
    end,
    Save = true,
    Flag = "controlbind_toggle"
})
spawnToySection:AddDropdown({
    Name = "Select Toy",
    Default = "Pallet",
    Options = {
        "Pallet",
        "BombMissile"
    },
    Callback = function(selectedToy)
        if selectedToy == "Pallet" then
            _G.SelectedToy = "PalletLightBrown"
        else
            _G.SelectedToy = selectedToy
        end
    end,
    Save = true,
    Flag = "selecttoy_dropdown"
})
spawnToySection:AddToggle({
    Name = "Spawn Toy (TAB)",
    Default = false,
    Callback = function(isSpawnToyEnabled)
        if isSpawnToyEnabled then
            contextActionService:BindAction("Spawn Toy (TAB)", onSpawnToyAction, false, Enum.KeyCode.Tab)
            contextActionService:SetImage("Spawn Toy (TAB)", "rbxassetid://6723742952")
            contextActionService:SetPosition("Spawn Toy (TAB)", UDim2.new(1, - 367, 1, - 90))
            local spawnToyButton = contextActionService:GetButton("Spawn Toy (TAB)")
            if spawnToyButton then
                spawnToyButton.Size = UDim2.new(0, 70, 0, 70)
            end
        else
            contextActionService:UnbindAction("Spawn Toy (TAB)")
        end
    end,
    Save = true,
    Flag = "spawntoy_toggle"
})
local whitelistSection = configTab:AddSection({
    Name = "Whitelist"
})
local selectPlayerDropdown = whitelistSection:AddDropdown({
    Name = "Select Player",
    Default = "",
    Options = {
        ""
    },
    Callback = function(playerNameToAddWhitelist)
        if playerNameToAddWhitelist then
            _G.PlayerToAddWhitelist = string.split(playerNameToAddWhitelist, " ")[1]
        end
    end
})
local playersInWhitelistDropdown = nil
whitelistSection:AddButton({
    Name = "Add",
    Callback = function()
        if not isPlayerWhitelisted(_G.PlayerToAddWhitelist) then
            table.insert(whitelistTable, _G.PlayerToAddWhitelist)
            refreshStringList(playersInWhitelistDropdown, whitelistTable)
        end
    end
})
playersInWhitelistDropdown = whitelistSection:AddDropdown({
    Name = "Players in Whitelist",
    Default = "",
    Options = {
        ""
    },
    Callback = function(playerNameToRemoveWhitelist)
        _G.PlayerToRemoveWhitelist = playerNameToRemoveWhitelist
    end
})
whitelistSection:AddButton({
    Name = "Remove",
    Callback = function()
        local pairsIterator3, whitelistTable, whitelistIndex = pairs(whitelistTable)
        while true do
            local whitelistedPlayer
            whitelistIndex, whitelistedPlayer = pairsIterator3(whitelistTable, whitelistIndex)
            if whitelistIndex == nil then
                break
            end
            if whitelistedPlayer == _G.PlayerToRemoveWhitelist then
                whitelistTable[whitelistIndex] = nil
            end
        end
        refreshStringList(playersInWhitelistDropdown, whitelistTable)
    end
})
BlobmanLoopKickConfig_Section = configTab:AddSection({
    Name = "Blobman Loopkick"
})
PerspectiveConfig_Section = configTab:AddSection({
    Name = "Perspective"
})
AnchorObjects_Section = configTab:AddSection({
    Name = "Auto Re-build Anchored Objects/Compiled"
})
ColorObjects_Section = configTab:AddSection({
    Name = "Anchor/Compile Objects Visual Settings"
})
ChangeSBColor1 = nil
ChangeSBColor2 = nil
pickcolor1dropdown = ColorObjects_Section:AddColorpicker({
    Name = "Pick Color Outline",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(snowballColor1)
        if ChangeSBColor1 then
            ChangeSBColor1.Value = snowballColor1
        end
    end
})
pickcolor2dropdown = ColorObjects_Section:AddColorpicker({
    Name = "Pick Color Surface",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(snowballColor2)
        if ChangeSBColor2 then
            ChangeSBColor2.Value = snowballColor2
        end
    end
})
ColorObjects_Section:AddDropdown({
    Name = "Change Color",
    Default = "Anchored",
    Options = {
        "Anchored",
        "Glue Object",
        "Main Glue"
    },
    Callback = function(snowballType)
        if snowballType == "Anchored" then
            ChangeSBColor1 = SB_AnchoredColor3
            ChangeSBColor2 = SB_AnchoredColor3Surface
        elseif snowballType == "Glue Object" then
            ChangeSBColor1 = SB_GlueColor3
            ChangeSBColor2 = SB_GlueColor3Surface
        elseif snowballType == "Main Glue" then
            ChangeSBColor1 = SB_MainGlueColor3
            ChangeSBColor2 = SB_MainGlueColor3Surface
        end
        pickcolor1dropdown:Set(ChangeSBColor1.Value)
        pickcolor2dropdown:Set(ChangeSBColor2.Value)
    end
})
ColorObjects_Section:AddSlider({
    Name = "Outline Transparency",
    Min = 0,
    Max = 1,
    Default = 0,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.01,
    ValueName = "Value:",
    Callback = function(snowballLineTransparency)
        SB_LineTransparencyValue.Value = snowballLineTransparency
    end
})
ColorObjects_Section:AddSlider({
    Name = "Surface Transparency",
    Min = 0,
    Max = 1,
    Default = 0.56,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.01,
    ValueName = "Value:",
    Callback = function(snowballSurfaceTransparency)
        SB_SurfaceTransparencyValue.Value = snowballSurfaceTransparency
    end
})
AnchorObjects_Section:AddToggle({
    Name = "Auto Ownership",
    Default = false,
    Callback = function(autoOwnershipAnchorEnabled)
        _G.AutoOwnershipAnchor = autoOwnershipAnchorEnabled
        if autoOwnershipAnchorEnabled then
            while _G.AutoOwnershipAnchor do
                autosetownership()
                task.wait(0.1)
            end
        end
    end,
    Save = true,
    Flag = "autoownershipanchorconfig_toggle"
})
AnchorObjects_Section:AddDropdown({
    Name = "Ownership Behavior",
    Default = "Teleport",
    Options = {
        "Teleport",
        "Aura"
    },
    Callback = function(ownershipModeAnchorBehavior)
        _G.OwnershipModeAnchorBehavior = ownershipModeAnchorBehavior
    end,
    Save = true,
    Flag = "autoownershipanchormode"
})
AnchorObjects_Section:AddDropdown({
    Name = "Ownership Teleport (Target)",
    Default = "Players and Objects",
    Options = {
        "Players",
        "Objects",
        "Players and Objects"
    },
    Callback = function(ownershipModeTarget)
        if ownershipModeTarget == "Players" then
            _G.OwnershipModeTarget = 1
        elseif ownershipModeTarget == "Objects" then
            _G.OwnershipModeTarget = 2
        elseif ownershipModeTarget == "Players and Objects" then
            _G.OwnershipModeTarget = 3
        end
    end
})
BlobmanLoopKickConfig_Section:AddToggle({
    Name = "Heavy Blobman",
    Default = false,
    Callback = function(rockBlobmanEnabled)
        _G.RockBlobman = rockBlobmanEnabled
    end,
    Save = true,
    Flag = "heavyblobmanconfig_toggle"
})
_G.PerspectiveEffectsAllow = true
PerspectiveConfig_Section:AddToggle({
    Name = "Teleport to Camera Position",
    Default = true,
    Callback = function(perspectiveTeleportToCameraPosEnabled)
        _G.PerspectiveTeleportToCameraPos = perspectiveTeleportToCameraPosEnabled
    end,
    Save = true,
    Flag = "perspectiveconfig1_toggle"
})
PerspectiveConfig_Section:AddDropdown({
    Name = "Camera Effect",
    Default = "Default",
    Options = {
        "Default",
        "Old TV"
    },
    Callback = function(imageEffectType)
        if imageEffectType == "Default" then
            ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ImageLabel.BorderSizePixel = 0
            ImageLabel.Size = UDim2.new(1, 0, 1, 0)
            ImageLabel.Image = "rbxassetid://5945121255"
            ImageLabel.ImageColor3 = Color3.new(0, 0, 0)
            imagestransparencyeffect = 0.45
            saturationvalue = - 0.6
            perspectiveON_effect1 = tweenService:Create(ImageLabel, t1p, {
                ImageTransparency = imagestransparencyeffect
            })
            perspectiveON_effect2 = tweenService:Create(PerspectiveSaturation, t1p, {
                Saturation = saturationvalue
            })
        elseif imageEffectType == "Old TV" then
            ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ImageLabel.BorderSizePixel = 0
            ImageLabel.Size = UDim2.new(1, 0, 1, 0)
            ImageLabel.Image = "rbxassetid://8586979842"
            ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
            imagestransparencyeffect = 0.7
            saturationvalue = - 0.3
            perspectiveON_effect1 = tweenService:Create(ImageLabel, t1p, {
                ImageTransparency = imagestransparencyeffect
            })
            perspectiveON_effect2 = tweenService:Create(PerspectiveSaturation, t1p, {
                Saturation = saturationvalue
            })
        end
    end,
    Save = true,
    Flag = "perspectivevisualeffect_dropdown"
})
local loopPlayersSection = loopPlayersTab:AddSection({
    Name = "Loop Players"
})
local playersInLoopSection = loopPlayersTab:AddSection({
    Name = "Players in Loop"
})
local loopKillFunctionsSection = loopPlayersTab:AddSection({
    Name = "Loop Kill Functions"
})
local loopKickSection = loopPlayersTab:AddSection({
    Name = "Loop Kick (Blobman)"
})
local selectPlayerDropdown = loopPlayersSection:AddDropdown({
    Name = "Select Player",
    Default = "",
    Options = {
        ""
    },
    Callback = function(playerNameToAdd)
        if playerNameToAdd then
            _G.PlayerToAdd = string.split(playerNameToAdd, " ")[1]
        end
    end
})
local unknownValue = nil
local maxPlayersInLoop = GetKey() ~= "Xana" and 3 or 999999
loopPlayersSection:AddButton({
    Name = "Add",
    Callback = function()
        if not table.find(playerList, _G.PlayerToAdd) then
            if maxPlayersInLoop <= # playerList then
                showNotification("You reached the max ammount of players in loop, buy premium to unlock more space!")
            else
                table.insert(playerList, _G.PlayerToAdd)
                refreshStringList(unknownValue, playerList)
            end
        end
    end
})
local playersInLoopDropdown = playersInLoopSection:AddDropdown({
    Name = "Players in Loop",
    Default = "",
    Options = {
        ""
    },
    Callback = function(playerNameToRemove)
        _G.PlayerToRemove = playerNameToRemove
    end
})
playersInLoopSection:AddButton({
    Name = "Remove",
    Callback = function()
        local index, playerValue, playerKey = pairs(playerList)
        while true do
            local playerName
            playerKey, playerName = index(playerValue, playerKey)
            if playerKey == nil then
                break
            end
            if playerName == _G.PlayerToRemove then
                playerList[playerKey] = nil
            end
        end
        refreshStringList(playersInLoopDropdown, playerList)
    end
})
local function checkBlobmanSeat()
    if typeof(_G.LastBlobmanWasSeat) ~= "Instance" or not _G.LastBlobmanWasSeat.Parent then
        _G.LastBlobmanWasSeat = getLastBlobmanSeat()
    else
        local playerCharacter = GetPlayerCharacter()
        local lastBlobmanSeat = _G.LastBlobmanWasSeat:FindFirstChild("VehicleSeat")
        if not (lastBlobmanSeat and lastBlobmanSeat:FindFirstChild("ProximityPrompt")) then
            DeleteToyRE:FireServer(_G.LastBlobmanWasSeat)
            return
        end
        local proximityPrompt = lastBlobmanSeat.ProximityPrompt
        local vehicleWeld = lastBlobmanSeat:FindFirstChildOfClass("Weld")
        if localPlayer:DistanceFromCharacter(lastBlobmanSeat.Position) >= 150 then
            DeleteToyRE:FireServer(_G.LastBlobmanWasSeat)
            return
        end
        if playerCharacter and (vehicleWeld and vehicleWeld.Part1) and not vehicleWeld.Part1:IsDescendantOf(playerCharacter) then
            local part1 = vehicleWeld.Part1
            local unknownValue2 = playersService
            SNOWshipPlayer(unknownValue2:GetPlayerFromCharacter(part1.Parent))
        end
        if proximityPrompt and lastBlobmanSeat then
            for _ = 0, 15 do
                if isPlayerSeatedInBlobman() or not _G.LoopKick then
                    break
                end
                fireproximityprompt(proximityPrompt)
                TeleportPlayer(lastBlobmanSeat.CFrame + Vector3.new(0, 3.5, 0), 1.5)
                task.wait(0.1)
            end
        end
    end
end
function CountRealNumberPlayersInLoop()
    local index2, pairsIterator1, playerKey2 = pairs(playerList)
    local counter = 0
    while true do
        local playerName2
        playerKey2, playerName2 = index2(pairsIterator1, playerKey2)
        if playerKey2 == nil then
            break
        end
        if playersService:FindFirstChild(playerName2) then
            counter = counter + 1
        end
    end
    return counter
end
function IsThereAnyPlayersInLoopAlive()
    local index3, pairsIterator2, playerKey3 = pairs(playerList)
    local someBooleanValue = false
    while true do
        local playerInstance
        playerKey3, playerInstance = index3(pairsIterator2, playerKey3)
        if playerKey3 == nil then
            break
        end
        if playersService:FindFirstChild(playerInstance) and playerInstance.Character then
            if playerInstance.Character:FindFirstChildOfClass("Humanoid") and playerInstance.Character.Humanoid.Health > 0 then
                someBooleanValue = true
            end
        end
    end
    return someBooleanValue
end
function ResetCharacterStats()
    local index4, pairsIterator3, playerKey4 = pairs(playerList)
    while true do
        local playerName4
        playerKey4, playerName4 = index4(pairsIterator3, playerKey4)
        if playerKey4 == nil then
            break
        end
        local playerInstance2 = playersService:FindFirstChild(playerName4)
        if playerInstance2 and playerInstance2.Character and playerInstance2.Character:FindFirstChild("HumanoidRootPart") then
            local characterHumanoidRootPart = playerInstance2.Character.HumanoidRootPart
            playerInstance2.Character:SetAttribute("Kick", 0)
            playerInstance2.Character:SetAttribute("Kicking", nil)
            playerInstance2.Character:SetAttribute("Kicking2", nil)
            if characterHumanoidRootPart:FindFirstChild("KickAuraVelocity") then
                characterHumanoidRootPart.KickAuraVelocity:Destroy()
            end
        end
    end
end
function verifyPlayerinBlobmanHand()
    local characterHumanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")
    if isPlayerSeatedInBlobman() then
        local leftWeldAttachment = characterHumanoid.SeatPart.Parent:WaitForChild("LeftDetector"):WaitForChild("LeftWeld").Attachment0
        local playerFromPart = leftWeldAttachment and leftWeldAttachment.Parent and playersService:GetPlayerFromCharacter(leftWeldAttachment.Parent.Parent)
        if playerFromPart then
            return playerFromPart
        end
    end
end
print("Allun")
local playerCFrame = nil
loopKillFunctionsSection:AddToggle({
    Name = "Loop Kill",
    Default = false,
    Callback = function(loopKill)
        _G.LoopKill = loopKill
        if loopKill then
            while _G.LoopKill do
                playerCFrame = GetPlayerCFrame()
                local index5, playerValue5, playerKey5 = pairs(playerList)
                while true do
                    local playerName5
                    playerKey5, playerName5 = index5(playerValue5, playerKey5)
                    if playerKey5 == nil then
                        break
                    end
                    local playerInstance3 = playersService:FindFirstChild(playerName5)
                    if CheckPlayerForLoopKill(playerInstance3) and ChangeActivityPriority(2) then
                        local humanoidRootPart = playerInstance3.Character:FindFirstChild("HumanoidRootPart")
                        local headPart = playerInstance3.Character:FindFirstChild("Head")
                        local characterHumanoid = playerInstance3.Character:FindFirstChild("Humanoid")
                        if playerInstance3 and (humanoidRootPart and headPart) then
                            for _ = 0, 50 do
                                dialogueFunction2()
                                SNOWship(humanoidRootPart)
                                if not CheckPlayerForLoopKill(playerInstance3) or (not _G.LoopKill or (CheckNetworkOwnerShipOnPlayer(playerInstance3) or humanoidRootPart.AssemblyLinearVelocity.Magnitude > 500)) then
                                    destroyGrabLineEvent:FireServer(humanoidRootPart)
                                    CreateSkyVelocity(humanoidRootPart)
                                    break
                                end
                                task.wait()
                                if humanoidRootPart.Position.Y <= - 12 then
                                    TeleportPlayer(CFrame.new(humanoidRootPart.Position + Vector3.new(0, 5, - 15)), 2)
                                else
                                    TeleportPlayer(CFrame.new(humanoidRootPart.Position + Vector3.new(0, - 10, - 10)), 2)
                                end
                                characterHumanoid.BreakJointsOnDeath = false
                                characterHumanoid:ChangeState(Enum.HumanoidStateType.Dead)
                                characterHumanoid.Jump = true
                                characterHumanoid.Sit = false
                            end
                        end
                        ChangeActivityPriority(0)
                    end
                end
                TeleportPlayer(playerCFrame)
                task.wait(0.2)
            end
            dialogueFunction1()
            TeleportPlayer(playerCFrame)
            print("End LoopKill")
                print("Allun")
        end
    end,
    Save = true,
    Flag = "lk_toggle"
})
local loopKickOwnershipSection = loopPlayersTab:AddSection({
    Name = "Loop Kick (Ownership)"
})
loopkickownertoggle = loopKickOwnershipSection:AddToggle({
    Name = "Loop Kick",
    Default = false,
    Callback = function(loopKickOwnershipEnabled)
        _G.LoopKickOwnership = loopKickOwnershipEnabled
        if loopKickOwnershipEnabled then
            while _G.LoopKickOwnership do
                if GetKey() ~= "Xana" then
                    _G.LoopKickOwnership = false
                    showNotification("Only for premium users! Buy premium in my discord server!")
                    loopkickownertoggle:Set(false)
                end
                playerCFrame = GetPlayerCFrame()
                local pairsIterator, pairsIterator4, playerIndex = pairs(playerList)
                while true do
                    local playerName
                    playerIndex, playerName = pairsIterator(pairsIterator4, playerIndex)
                    if playerIndex == nil then
                        break
                    end
                    local playerInstance = playersService:FindFirstChild(playerName)
                    if CheckPlayerForLoopKill(playerInstance) and ChangeActivityPriority(2) then
                        local playerHumanoidRootPart = playerInstance.Character:FindFirstChild("HumanoidRootPart")
                        local headPart2 = playerInstance.Character:FindFirstChild("Head")
                        playerInstance.Character:FindFirstChild("Humanoid")
                        if playerInstance and (playerHumanoidRootPart and headPart2) then
                            for _ = 0, 50 do
                                dialogueFunction2()
                                SNOWship(playerHumanoidRootPart)
                                if not CheckPlayerForLoopKill(playerInstance) or (not _G.LoopKickOwnership or (CheckNetworkOwnerShipOnPlayer(playerInstance) or playerHumanoidRootPart.AssemblyLinearVelocity.Magnitude > 500)) then
                                    destroyGrabLineEvent:FireServer(playerHumanoidRootPart)
                                    wait()
                                    CreateSkyVelocity(playerHumanoidRootPart)
                                    break
                                end
                                task.wait()
                                if playerHumanoidRootPart.Position.Y <= - 12 then
                                    TeleportPlayer(CFrame.new(playerHumanoidRootPart.Position + Vector3.new(0, 5, - 15)), 2)
                                else
                                    TeleportPlayer(CFrame.new(playerHumanoidRootPart.Position + Vector3.new(0, - 10, - 10)), 2)
                                end
                            end
                        end
                        ChangeActivityPriority(0)
                    end
                end
                TeleportPlayer(playerCFrame)
                task.wait(0.2)
            end
            dialogueFunction1()
            TeleportPlayer(playerCFrame)
        end
    end,
    Save = true,
    Flag = "lkickowner_toggle"
})
loopKickOwnershipSection:AddDropdown({
    Name = "Kick Type",
    Default = "Go to the heaven!",
    Options = {
        "Go to the heaven!"
    },
    Callback = function(loopKickOwnerType)
        _G.LoopKickOwnerType = loopKickOwnerType
    end,
    Save = true,
    Flag = "loopkickownershiptype_dropdown"
})
loopRagdoll = loopKillFunctionsSection:AddToggle({
    Name = "Loop Ragdoll",
    Default = false,
    Callback = function(loopRagdollEnabled)
        _G.LoopRagdoll = loopRagdollEnabled
        if loopRagdollEnabled then
            while _G.LoopRagdoll do
                if GetKey() ~= "Xana" then
                    loopRagdoll:Set(false)
                    _G.LoopRagdoll = false
                    showNotification("Only for premium users! Buy premium in my discord server!")
                    break
                end
                local pairsIteratorRagdoll, iteratorStateRagdoll, playerIndexRagdoll = pairs(playerList)
                while true do
                    local playerNameRagdoll
                    playerIndexRagdoll, playerNameRagdoll = pairsIteratorRagdoll(iteratorStateRagdoll, playerIndexRagdoll)
                    if playerIndexRagdoll == nil then
                        break
                    end
                    local playerInstanceRagdoll = playersService:FindFirstChild(playerNameRagdoll)
                    if CheckPlayerAnnoyAll(playerInstanceRagdoll) then
                        local character = playerInstanceRagdoll.Character
                        local playerHumanoidRootPartRagdoll = playerInstanceRagdoll.Character:FindFirstChild("HumanoidRootPart")
                        local ragdolledValue = character:FindFirstChildOfClass("Humanoid"):FindFirstChild("Ragdolled")
                        if playerHumanoidRootPartRagdoll and (ragdolledValue and not ragdolledValue.Value) then
                            setBananaModelProperties(playerHumanoidRootPartRagdoll)
                            task.wait(0.015)
                        end
                    end
                end
                task.wait()
            end
        end
    end
})
loopFire = loopKillFunctionsSection:AddToggle({
    Name = "Loop Fire",
    Default = false,
    Callback = function(loopFireEnabled)
        _G.LoopFire = loopFireEnabled
        if loopFireEnabled then
            while _G.LoopFire do
                if GetKey() ~= "Xana" then
                    loopFire:Set(false)
                    _G.LoopFire = false
                    showNotification("Only for premium users! Buy premium in my discord server!")
                    break
                end
                local pairsIteratorFire, iteratorStateFire, playerIndexFire = pairs(playerList)
                while true do
                    local playerNameFire
                    playerIndexFire, playerNameFire = pairsIteratorFire(iteratorStateFire, playerIndexFire)
                    if playerIndexFire == nil then
                        break
                    end
                    local playerInstanceFire = playersService:FindFirstChild(playerNameFire)
                    if CheckPlayerAnnoyAll(playerInstanceFire) then
                        local _ = playerInstanceFire.Character
                        local playerHumanoidRootPartFire = playerInstanceFire.Character:FindFirstChild("HumanoidRootPart")
                        local canBurnValue
                        if playerHumanoidRootPartFire:FindFirstChild("FirePlayerPart") and playerHumanoidRootPartFire.FirePlayerPart:FindFirstChild("CanBurn") then
                            canBurnValue = playerHumanoidRootPartFire.FirePlayerPart.CanBurn.Value
                        else
                            canBurnValue = nil
                        end
                        if playerHumanoidRootPartFire and (playerInstanceFire and not (IsPlayerInsideSafeZone(playerInstanceFire) or canBurnValue)) then
                            handleCampfireTouch(playerHumanoidRootPartFire)
                            task.wait(0.015)
                        end
                    end
                end
                task.wait()
            end
        end
    end
})
local function handleCreatureGrab(targetPlayerName, isBlobmanSeated)
    local localHumanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")
    if isPlayerSeatedInBlobman() then
        local seatParent = localHumanoid.SeatPart.Parent
        local targetPlayer = playersService:FindFirstChild(targetPlayerName)
        if targetPlayer and targetPlayer.Character and (targetPlayer.Character:FindFirstChild("HumanoidRootPart") and (seatParent and not isAuthorized(targetPlayer))) then
            local creatureGrabParameters = {
                seatParent.LeftDetector,
                targetPlayer.Character.HumanoidRootPart,
                seatParent.LeftDetector.LeftWeld
            }
            local creatureDropData = {
                seatParent.LeftDetector.LeftWeld,
                targetPlayer.Character.HumanoidRootPart
            }
            CreatureGrab = seatParent.BlobmanSeatAndOwnerScript.CreatureGrab
            local creatureDropRemoteEvent = seatParent.BlobmanSeatAndOwnerScript.CreatureDrop
            if seatParent then
                if isBlobmanSeated == 1 then
                    if seatParent.Parent ~= spawnedInToysFolder then
                        orionXHub:MakeNotification({
                            Name = "Allun",
                            Content = "The Blobman needs to be your own toy",
                            Image = "rbxassetid://4483345998",
                            Time = 5
                        })
                    else
                        task.wait(0.2)
                        DeleteToyRE:FireServer(seatParent)
                    end
                elseif isBlobmanSeated == 2 then
                    CreatureGrab:FireServer(unpack(creatureGrabParameters))
                    task.wait(0.155)
                    localHumanoid.Sit = false
                elseif isBlobmanSeated == 3 and not (targetPlayer.Character:GetAttribute("Kicking") or targetPlayer.Character:GetAttribute("Kicking2")) then
                    local targetPlayerInstance = playersService:FindFirstChild(targetPlayerName)
                    local targetCharacter = targetPlayerInstance.Character
                    local humanoidRootPart = targetCharacter.HumanoidRootPart
                    local _ = targetCharacter.Head
                    local humanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
                    local kickAuraBodyVelocity = nil
                    targetCharacter:SetAttribute("Kicking", true)
                    if humanoidRootPart:FindFirstChild("FlingAuraVelocity") then
                        humanoidRootPart.FlingAuraVelocity:Destroy()
                    end
                    print("Kick")
                    for _ = 0, 50 do
                        if not isPlayerSeatedInBlobman() or CheckNetworkOwnerShipOnPlayer(targetPlayerInstance) then
                            break
                        end
                        if verifyPlayerinBlobmanHand() == targetPlayerInstance then
                            creatureDropRemoteEvent:FireServer(unpack(creatureDropData))
                            break
                        end
                        CreatureGrab:FireServer(unpack(creatureGrabParameters))
                        task.wait()
                    end
                    print("End Loop Here!")
                    for _ = 0, 25 do
                        if SNOWshipPlayer(targetPlayerInstance) then
                            if not humanoidRootPart:FindFirstChild("KickAuraVelocity") then
                                kickAuraBodyVelocity = Instance.new("BodyVelocity", humanoidRootPart)
                                kickAuraBodyVelocity.Name = "KickAuraVelocity"
                                kickAuraBodyVelocity.MaxForce = Vector3.new(0, 12500, 0)
                                kickAuraBodyVelocity.Velocity = Vector3.new(0, 100, 0)
                            end
                            local kickLoopCounter = 0
                            while isPlayerSeatedInBlobman() and kickLoopCounter < 100 do
                                if humanoid.FloorMaterial == Enum.Material.Air and localPlayer:DistanceFromCharacter(humanoidRootPart.Position) > 100 then
                                    targetCharacter:SetAttribute("Kicking2", true)
                                    destroyGrabLineEvent:FireServer(humanoidRootPart)
                                    CreatureGrab:FireServer(unpack(creatureGrabParameters))
                                    print("Destroyed!")
                                    break
                                end
                                SNOWshipPlayer(targetPlayerInstance)
                                kickLoopCounter = kickLoopCounter + 1
                                task.wait()
                            end
                            break
                        end
                        if not isPlayerSeatedInBlobman() then
                            break
                        end
                        task.wait()
                    end
                    if kickAuraBodyVelocity then
                        kickAuraBodyVelocity:Destroy()
                    end
                    targetCharacter:SetAttribute("Kicking", nil)
                elseif not isBlobmanSeated then
                    CreatureGrab:FireServer(unpack(creatureGrabParameters))
                end
            end
        end
    else
        orionXHub:MakeNotification({
            Name = "Allun",
            Content = "Please, sit on any Blobman",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
end
loopKickSection:AddToggle({
    Name = "Loop Kick (Blobman)",
    Default = false,
    Callback = function(isLoopKickEnabled)
        if isLoopKickEnabled then
            _G.LoopKick = isLoopKickEnabled
            while _G.LoopKick do
                local pairsIterator, pairsIterator5, index = pairs(playerList)
                while true do
                    local value
                    index, value = pairsIterator(pairsIterator5, index)
                    if index == nil then
                        break
                    end
                    if playersService:FindFirstChild(value) and ChangeActivityPriority(1.5) then
                        if isPlayerSeatedInBlobman() then
                            handleCreatureGrab(value, 3)
                        else
                            checkBlobmanSeat()
                        end
                        ChangeActivityPriority(0)
                    end
                end
                task.wait()
            end
        else
            _G.LoopKick = isLoopKickEnabled
        end
    end,
    Save = true,
    Flag = "lkick_toggle"
})
function blobmangraball()
    local unknownValue3 = playersService
    local pairsIteratorPlayers, pairsIterator6, playerIndex = pairs(unknownValue3:GetPlayers())
    while true do
        local player
        playerIndex, player = pairsIteratorPlayers(pairsIterator6, playerIndex)
        if playerIndex == nil then
            break
        end
        if not isAuthorized(player) and (player ~= localPlayer and player.Character) and (player.Character:FindFirstChild("HumanoidRootPart") and not (isPlayerWhitelisted(player.Name) and _G.WhitelistFriends2) and localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")) then
            local seatParent = localPlayer.Character:FindFirstChildOfClass("Humanoid").SeatPart.Parent
            local creatureGrabParameters2 = {
                seatParent:WaitForChild("LeftDetector"),
                player.Character:FindFirstChild("HumanoidRootPart"),
                seatParent:WaitForChild("LeftDetector"):WaitForChild("LeftWeld")
            }
            seatParent:WaitForChild("BlobmanSeatAndOwnerScript"):WaitForChild("CreatureGrab"):FireServer(unpack(creatureGrabParameters2))
        end
        task.wait()
    end
end
PlayerToSelect = LongReachGrab_Player:AddDropdown({
    Name = "Select Player",
    Default = "",
    Options = {
        ""
    },
    Callback = function(inputString)
        local splitString = string.split(inputString, " ")
        _G.PlayerToLongGrab = splitString[1]
    end
})
LongReachGrab_Player:AddButton({
    Name = "Lock",
    Callback = function()
        handleCreatureGrab(_G.PlayerToLongGrab, 2)
    end
})
LongReachGrab_Player:AddButton({
    Name = "Bring",
    Callback = function()
        handleCreatureGrab(_G.PlayerToLongGrab)
    end
})
LongReachGrab_Player:AddButton({
    Name = "Kick",
    Callback = function()
        handleCreatureGrab(_G.PlayerToLongGrab, 3)
    end
})
local destroyEverythingSection = LongReachGrab_Player:AddSection({
    Name = "Destroy Everything"
})
local destroyServerToggle = nil
destroyServerToggle = destroyEverythingSection:AddToggle({
    Name = "Destroy Server",
    Default = false,
    Callback = function(isEnabled)
        if isEnabled then
            _G.BringAllLongReach = true
            if GetKey() ~= "Xana" and isInPlotValue.Value then
                destroyServerToggle:Set(false)
                showNotification("You can\'t use destroy server inside a house!, buy premium to be able to do that!")
                return
            end
            if isPlayerSeatedInBlobman() then
                while _G.BringAllLongReach do
                    if isPlayerSeatedInBlobman() then
                        blobmangraball()
                    else
                        task.wait(1)
                    end
                end
            else
                destroyServerToggle:Set(false)
                orionXHub:MakeNotification({
                    Name = "Allun",
                    Content = "Please, sit on any Blobman",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            end
        else
            _G.BringAllLongReach = false
        end
    end,
    Save = true,
    Flag = "BringAllLongReach_toggle"
})
destroyServerToggle = destroyEverythingSection:AddToggle({
    Name = "Whitelist Friends",
    Default = false,
    Callback = function(whitelistFriends)
        _G.WhitelistFriends2 = whitelistFriends
    end,
    Save = true,
    Flag = "Whitelistfreinds2_toggle"
})
apagarfogo = workspaceService.Map.Hole.PoisonBigHole.ExtinguishPart
apagarfogo.Size = Vector3.new(0.5, 0.5, 0.5)
apagarfogo.Transparency = 1
apagarfogo.Tex.Transparency = 1
workspaceService.ChildAdded:Connect(function(grabParts)
    if grabParts.Name == "GrabParts" then
        local grabbedPart = grabParts.GrabPart.WeldConstraint.Part1
        local superStrengthBodyVelocity = nil
        if not grabParts:GetAttribute("Fake") then
            _G.RealGrabParts = grabParts
        end
        if grabbedPart then
            if isAuthorized(grabbedPart.Parent) then
                return
            end
            if _G.InvisibleLine then
                createGrabLineEvent:FireServer()
            end
            if _G.SuperStrength then
                superStrengthBodyVelocity = Instance.new("BodyVelocity", grabbedPart)
                superStrengthBodyVelocity.MaxForce = Vector3.new(0, 0, 0)
                superStrengthBodyVelocity.Velocity = Vector3.new()
                superStrengthBodyVelocity.Name = "SuperStrength"
            end
            _G.HoldingObjectGrabPart = grabbedPart
            if _G.MasslessGrab then
                task.spawn(function()
                    local dragPartAlignOrientation = grabParts.DragPart.AlignOrientation
                    local dragPartAlignPosition = grabParts.DragPart.AlignPosition
                    while _G.MasslessGrab do
                        dragPartAlignOrientation.MaxTorque = 1e46
                        dragPartAlignOrientation.Responsiveness = 20099
                        dragPartAlignPosition.MaxForce = 1e51
                        dragPartAlignPosition.Responsiveness = 20099
                        task.wait(0.245)
                    end
                    dragPartAlignOrientation.MaxTorque = 600000
                    dragPartAlignOrientation.Responsiveness = 30
                    dragPartAlignPosition.MaxForce = 60000
                    dragPartAlignPosition.Responsiveness = 40
                end)
            end
            if _G.NoclipGrab and not grabbedPart.Anchored then
                task.spawn(function()
                    if grabbedPart.Parent and grabbedPart.Parent:IsA("Model") then
                        local descendants = grabbedPart.Parent:GetDescendants()
                        local humanoid = grabbedPart.Parent:FindFirstChildOfClass("Humanoid")
                        local pairsIteratorDescendants, index, descendantIndex = pairs(descendants)
                        local canCollideMap = {}
                        while true do
                            local descendant
                            descendantIndex, descendant = pairsIteratorDescendants(index, descendantIndex)
                            if descendantIndex == nil then
                                break
                            end
                            if descendant:IsA("BasePart") or (descendant:IsA("Part") or descendant:IsA("MeshPart")) then
                                canCollideMap[descendant] = descendant.CanCollide
                            end
                        end
                        while grabParts.Parent do
                            local pairsIteratorDescendants2, descendantIndex2, descendantIndex3 = pairs(descendants)
                            while true do
                                local descendantPart
                                descendantIndex3, descendantPart = pairsIteratorDescendants2(descendantIndex2, descendantIndex3)
                                if descendantIndex3 == nil then
                                    break
                                end
                                if descendantPart:IsA("BasePart") or (descendantPart:IsA("Part") or descendantPart:IsA("MeshPart")) then
                                    descendantPart.CanCollide = false
                                end
                            end
                            wait(0.214)
                        end
                        if humanoid then
                            task.wait(0.5)
                        end
                        local pairsIteratorDescendants3, index2, descendantIndex4 = pairs(descendants)
                        while true do
                            local descendantPart
                            descendantIndex4, descendantPart = pairsIteratorDescendants3(index2, descendantIndex4)
                            if descendantIndex4 == nil then
                                break
                            end
                            if descendantPart:IsA("BasePart") or (descendantPart:IsA("Part") or descendantPart:IsA("MeshPart")) then
                                descendantPart.CanCollide = canCollideMap[descendantPart]
                            end
                        end
                    end
                end)
            end
            if _G.PerspectiveGrab and not grabbedPart.Anchored then
                task.spawn(function()
                    local playerCharacter = GetPlayerCharacter()
                    createGrabLineEvent:FireServer()
                    local playerHumanoid, playerHumanoidRootPart
                    if playerCharacter then
                        playerHumanoid = playerCharacter:FindFirstChildOfClass("Humanoid")
                        playerHumanoidRootPart = playerCharacter:FindFirstChild("HumanoidRootPart")
                    else
                        playerHumanoid = nil
                        playerHumanoidRootPart = nil
                    end
                    local debugPart = Instance.new("Part", workspaceService)
                    debugPart.Anchored = true
                    debugPart.CanCollide = false
                    debugPart.Transparency = 1
                    debugPart.CanQuery = false
                    debugPart.Size = Vector3.new()
                    debugPart.CFrame = workspace.CurrentCamera.CFrame
                    workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
                    workspace.CurrentCamera.CameraSubject = debugPart
                    if heartbeatConnection then
                        heartbeatConnection:Disconnect()
                    end
                    if playerHumanoid and playerHumanoidRootPart then
                        local playerCFrame = GetPlayerCFrame()
                        togglePerspectiveEffects(true)
                        local moveDirectionVector = nil
                        local debugPartCFrame = nil
                        local currentCameraCFrame = nil
                        local objectSpacePosition = nil
                        local cameraPosition = nil
                        local objectPosition = nil
                        local vectorToObjectSpace = nil
                        heartbeatConnection = runService.Heartbeat:Connect(function(moveSpeedMultiplier)
                            moveDirectionVector = playerHumanoid.MoveDirection * (perspectiveSpeed * moveSpeedMultiplier)
                            debugPartCFrame = debugPart.CFrame
                            currentCameraCFrame = workspace.CurrentCamera.CFrame
                            objectSpacePosition = debugPartCFrame:ToObjectSpace(currentCameraCFrame).Position
                            currentCameraCFrame = currentCameraCFrame * CFrame.new(- objectSpacePosition.X, - objectSpacePosition.Y, - objectSpacePosition.Z + 1)
                            cameraPosition = currentCameraCFrame.Position
                            objectPosition = debugPartCFrame.Position
                            vectorToObjectSpace = CFrame.new(cameraPosition, Vector3.new(objectPosition.X, cameraPosition.Y, objectPosition.Z)):VectorToObjectSpace(moveDirectionVector)
                            debugPart.CFrame = CFrame.new(objectPosition) * (currentCameraCFrame - cameraPosition) * CFrame.new(vectorToObjectSpace)
                            playerHumanoidRootPart.CFrame = CFrame.new(527, 123, - 376)
                        end)
                        while grabParts.Parent do
                            task.wait()
                        end
                        local currentCameraCFrame = workspace.CurrentCamera.CFrame
                        togglePerspectiveEffects(false)
                        workspace.CurrentCamera.CameraSubject = localPlayer.Character:FindFirstChildOfClass("Humanoid")
                        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                        if heartbeatConnection then
                            heartbeatConnection:Disconnect()
                        end
                        if _G.PerspectiveTeleportToCameraPos then
                            playerHumanoidRootPart.CFrame = currentCameraCFrame
                        else
                            playerHumanoidRootPart.CFrame = playerCFrame
                        end
                    end
                end)
            end
            task.spawn(function()
                if superStrengthBodyVelocity then
                    if not localPlayer.PlayerGui:FindFirstChild("ContextActionGui") then
                        return
                    end
                    local contextActionGuiButtonParent = nil
                    local mouseButtonDownConnection = nil
                    local disconnectEvent = nil
                    while contextActionGuiButtonParent == nil and grabParts.Parent do
                        local pairsIterator, index3, pairsIndex = pairs(game.Players.LocalPlayer.PlayerGui.ContextActionGui:GetDescendants())
                        while true do
                            local descendantImageLabel
                            pairsIndex, descendantImageLabel = pairsIterator(index3, pairsIndex)
                            if pairsIndex == nil then
                                break
                            end
                            if descendantImageLabel:IsA("ImageLabel") and descendantImageLabel.Image == "http://www.roblox.com/asset/?id=9603678090" then
                                contextActionGuiButtonParent = descendantImageLabel.Parent
                            end
                        end
                        task.wait()
                    end
                    contextActionGuiButtonParent.Active = true
                    if contextActionGuiButtonParent then
                        mouseButtonDownConnection = contextActionGuiButtonParent.MouseButton1Down:Connect(function()
                            print("Launched Mobile!")
                            pressedStrength = true
                            superStrengthBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                            superStrengthBodyVelocity.Velocity = workspace.CurrentCamera.CFrame.lookVector * _G.Strength
                        end)
                    end
                    local _ = grabParts:GetPropertyChangedSignal("Parent"):Connect(function()
                        if not grabParts.Parent then
                            debrisService:AddItem(superStrengthBodyVelocity, 1)
                            if mouseButtonDownConnection then
                                mouseButtonDownConnection:Disconnect()
                            end
                            disconnectEvent:Disconnect()
                        end
                    end)
                end
            end)
            task.spawn(function()
                if superStrengthBodyVelocity then
                    local parentChangedConnection = nil
                    parentChangedConnection = grabParts:GetPropertyChangedSignal("Parent"):Connect(function()
                        if not grabParts.Parent then
                            if userInputService:GetLastInputType() ~= Enum.UserInputType.MouseButton2 or not _G.SuperStrength then
                                if userInputService:GetLastInputType() == Enum.UserInputType.MouseButton1 then
                                    superStrengthBodyVelocity:Destroy()
                                end
                            else
                                print("Launched!")
                                pressedStrength = true
                                superStrengthBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                superStrengthBodyVelocity.Velocity = workspace.CurrentCamera.CFrame.lookVector * _G.Strength
                                debrisService:AddItem(superStrengthBodyVelocity, 1)
                            end
                            parentChangedConnection:Disconnect()
                        end
                    end)
                end
            end)
            if _G.Poison_Grab then
                task.spawn(function()
                    if grabbedPart.Parent:FindFirstChildOfClass("Humanoid") then
                        local characterHead = grabbedPart.Parent.Head
                        while grabParts.Parent and _G.Poison_Grab do
                            bigHolePoisonPart.CFrame = characterHead.CFrame
                            smallHolePoisonPart.CFrame = characterHead.CFrame
                            factoryIslandPoisonPart.CFrame = characterHead.CFrame
                            task.wait()
                            factoryIslandPoisonPart.Position = Vector3.new(0, - 50, 0)
                            smallHolePoisonPart.Position = Vector3.new(0, - 50, 0)
                            bigHolePoisonPart.Position = Vector3.new(0, - 50, 0)
                        end
                    end
                end)
            end
            if _G.Burn_Grab then
                task.spawn(function()
                    while grabParts.Parent and _G.Burn_Grab do
                        if grabbedPart.Parent:FindFirstChildOfClass("Humanoid") then
                            handleCampfireTouch(grabbedPart.Parent.HumanoidRootPart)
                        elseif grabbedPart.Parent:FindFirstChild("FireDetector") then
                            handleCampfireTouch(grabbedPart.Parent.FireDetector)
                        else
                            handleCampfireTouch(grabbedPart)
                        end
                        task.wait()
                    end
                end)
            end
            if _G.Radiactive_Grab then
                task.spawn(function()
                    if grabbedPart.Parent:FindFirstChildOfClass("Humanoid") then
                        while grabParts.Parent and _G.Radiactive_Grab do
                            paintPlayerPart.Position = grabbedPart.Position
                            task.wait()
                        end
                        paintPlayerPart.Position = Vector3.new(0, - 50, 0)
                    end
                end)
            end
            if _G.Death_Grab then
                task.spawn(function()
                    if grabbedPart.Parent:FindFirstChildOfClass("Humanoid") then
                        local characterHumanoid = grabbedPart.Parent:FindFirstChildOfClass("Humanoid")
                        local _ = grabbedPart.Parent.HumanoidRootPart
                        while grabbedPart.Parent do
                            local player = playersService
                            if CheckNetworkOwnerShipOnPlayer(player:GetPlayerFromCharacter(grabbedPart.Parent)) then
                                characterHumanoid.BreakJointsOnDeath = false
                                characterHumanoid:ChangeState(Enum.HumanoidStateType.Dead)
                                characterHumanoid.Jump = true
                                characterHumanoid.Sit = false
                                if characterHumanoid:GetStateEnabled(Enum.HumanoidStateType.Dead) then
                                    destroyGrabLineEvent:FireServer(grabbedPart)
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
workspaceService.ChildRemoved:Connect(function(part)
    if part.Name == "GrabParts" and not part:GetAttribute("Fake") then
        _G.RealGrabParts = nil
    end
end)
workspace.DescendantAdded:Connect(function(part)
    if part.Name == "PartOwner" and part.Parent.Name == "Head" then
        local humanoidRootPart = part.Parent.Parent:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart:FindFirstChild("KickAuraP") then
            humanoidRootPart.KickAuraP:Destroy()
        end
        if humanoidRootPart:FindFirstChild("KickAuraP1") then
            humanoidRootPart.KickAuraP1:Destroy()
        end
        if humanoidRootPart:FindFirstChild("SkyVelocity") then
            humanoidRootPart.SkyVelocity:Destroy()
        end
        if humanoidRootPart:FindFirstChild("BringBody") then
            humanoidRootPart.BringBody:Destroy()
        end
    end
    if part.Name == "TimeRemainingNum" and part.Parent.Value == localPlayer.Name then
        _G.RemainingTimeInHouse = part
    end
end)
isHeldValue.Changed:Connect(function(isAntiGrabEnabled)
    if isAntiGrabEnabled == true and (not isAuthorized(playersService:FindFirstChild(heldObjectName)) and _G.AntiGrab) then
        local humanoidRootPart = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
        if isHeldValue.Value then
            local heartbeatConnection = nil
            heartbeatConnection = runService.Heartbeat:Connect(function()
                if isHeldValue.Value then
                    humanoidRootPart.Velocity = Vector3.new()
                    humanoidRootPart.Anchored = true
                    struggleEvent:FireServer(localPlayer)
                    ragdollRemoteEvent:FireServer(humanoidRootPart, 0)
                else
                    humanoidRootPart.Velocity = Vector3.new()
                    humanoidRootPart.Anchored = false
                    heartbeatConnection:Disconnect()
                end
            end)
        end
    end
end)
function IsReallyBeingHeld()
    if isHeldValue.Value and not _G.AntiGrab then
        return true
    end
    if isHeldValue.Value and isAuthorized(playersService:FindFirstChild(heldObjectName)) then
        return true
    end
end
function checkIfPlayerInRagdollAntiExplosion()
    local antiExplosionEnabled = _G.IsCharacterInRagdoll
    if antiExplosionEnabled then
        antiExplosionEnabled = _G.AntiExplosion
    end
    return antiExplosionEnabled
end
function setMasslessFalse(objectWithDescendants)
    local ipairsIterator, index4, ipairsIndex = ipairs(objectWithDescendants:GetDescendants())
    while true do
        local descendantPart2
        ipairsIndex, descendantPart2 = ipairsIterator(index4, ipairsIndex)
        if ipairsIndex == nil then
            break
        end
        if descendantPart2:IsA("BasePart") then
            descendantPart2.Massless = false
        end
    end
end
function enforceMasslessFalse(instance)
    instance.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("BasePart") then
            descendant:GetPropertyChangedSignal("Massless"):Connect(function()
                if descendant.Massless and (not checkIfPlayerInRagdollAntiExplosion() or descendant.Name == "HumanoidRootPart") then
                    descendant.Massless = false
                end
            end)
        end
    end)
    local ipairsIterator2, index5, ipairsIndex2 = ipairs(instance:GetDescendants())
    while true do
        local descendantPart3
        ipairsIndex2, descendantPart3 = ipairsIterator2(index5, ipairsIndex2)
        if ipairsIndex2 == nil then
            break
        end
        if descendantPart3:IsA("BasePart") then
            descendantPart3:GetPropertyChangedSignal("Massless"):Connect(function()
                if descendantPart3.Massless and (not checkIfPlayerInRagdollAntiExplosion() or descendantPart3.Name == "HumanoidRootPart") then
                    descendantPart3.Massless = false
                end
            end)
        end
    end
end
function reconnect()
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildWhichIsA("Humanoid") or character:WaitForChild("Humanoid")
    local humanoidRootPart2 = character:WaitForChild("HumanoidRootPart")
    character:WaitForChild("Head")
    local torsoPart = character:WaitForChild("Torso")
    _G.IsCharacterInRagdoll = false
    CharacterRaycastFilter.FilterDescendantsInstances[1] = character
    COAroundPParams.FilterDescendantsInstances[1] = character
    _G.UniversalPlayerRoot = humanoidRootPart2
    scriptToGetSenv = character:WaitForChild("GrabbingScript")
    if scriptToGetSenv and getsenv then
        senv = getsenv(scriptToGetSenv)
    end
    local canBurnValue = humanoidRootPart2:WaitForChild("FirePlayerPart"):WaitForChild("CanBurn")
    local ragdolledValue = humanoid:WaitForChild("Ragdolled")
    if GetKey() == "Xana" then
        local rootAttachment = humanoidRootPart2 and humanoidRootPart2:FindFirstChild("RootAttachment")
        if rootAttachment then
            task.delay(1, function()
                rootAttachment:Destroy()
            end)
        end
        setMasslessFalse(character)
        enforceMasslessFalse(character)
    end
    local bodyPosition = Instance.new("BodyPosition", humanoidRootPart2)
    local bodyVelocity = Instance.new("BodyVelocity", torsoPart)
    bodyPosition.MaxForce = Vector3.new(0, - 100, 0)
    bodyVelocity.MaxForce = Vector3.new(0, 0, 0)
    _G.AntiExplosionVelocity = bodyVelocity
    humanoid.JumpPower = _G.InfiniteJumpPower
    if _G.NoclipToggle then
        dialogueFunction2()
    end
    character.DescendantAdded:Connect(function(hitPart)
        if hitPart.Name == "PartOwner" then
            heldObjectName = tostring(hitPart.Value)
            if _G.AutoAttacker then
                local otherPlayer = playersService:FindFirstChild(heldObjectName)
                local otherHumanoid = nil
                local otherHumanoidRootPart = nil
                if otherPlayer and otherPlayer.Character then
                    local otherCharacter = otherPlayer.Character
                    if otherCharacter then
                        otherHumanoid = otherCharacter:FindFirstChildOfClass("Humanoid")
                        otherHumanoidRootPart = otherCharacter:FindFirstChild("HumanoidRootPart")
                    end
                end
                if otherPlayer and (isAuthorized(otherPlayer) == false and otherPlayer ~= localPlayer) then
                    local deathModeFunction = nil
                    local lookAtCFrame = nil
                    local usePermanentSnowship = false
                    local counterAction
                    if _G.CounterMode == "Repulsion" or not _G.CounterMode then
                        counterAction = function()
                            lookAtCFrame = lookAt(localPlayer.Character.HumanoidRootPart.Position, otherHumanoidRootPart.Position)
                            local bodyVelocity = Instance.new("BodyVelocity", otherPlayer.Character.HumanoidRootPart)
                            bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                            bodyVelocity.Velocity = Vector3.new(lookAtCFrame.lookVector.X, 0.5, lookAtCFrame.lookVector.Z) * 100
                            wait()
                            bodyVelocity:Destroy()
                            destroyGrabLineEvent:FireServer(otherHumanoidRootPart)
                        end
                    elseif _G.CounterMode ~= "Freeze" then
                        if _G.CounterMode ~= "Kick" then
                            counterAction = _G.CounterMode == "Death" and function()
                                local humanoidInstance = otherHumanoid
                                if humanoidInstance then
                                    CreateSkyVelocity(otherHumanoidRootPart)
                                    for _ = 0, 20 do
                                        humanoidInstance.BreakJointsOnDeath = false
                                        humanoidInstance:ChangeState(Enum.HumanoidStateType.Dead)
                                        humanoidInstance.Jump = true
                                        humanoidInstance.Sit = true
                                    end
                                    task.wait()
                                    destroyGrabLineEvent:FireServer(otherHumanoidRootPart)
                                end
                            end or deathModeFunction
                        else
                            counterAction = function()
                                CreateSkyVelocity(otherHumanoidRootPart)
                                wait(1)
                                destroyGrabLineEvent:FireServer(otherHumanoidRootPart)
                            end
                        end
                    else
                        counterAction = function()
                            local humanoid = otherHumanoid
                            if humanoid then
                                humanoid.WalkSpeed = 0
                                humanoid.Sit = false
                                humanoid.JumpPower = 0
                            end
                        end
                    end
                    if usePermanentSnowship then
                        for _ = 1, 50 do
                            SNOWshipPermanentPlayer(otherPlayer, counterAction)
                            task.wait()
                        end
                    else
                        for _ = 1, 50 do
                            if SNOWshipPlayer(otherPlayer, counterAction) then
                                break
                            end
                            task.wait()
                        end
                    end
                end
            end
        end
    end)
    canBurnValue.Changed:Connect(function(propertyName)
        if propertyName and _G.AntiBurn then
            while canBurnValue.Value do
                if firetouchinterest then
                    firetouchinterest(humanoidRootPart2.FirePlayerPart, apagarfogo, 0)
                    task.wait()
                    firetouchinterest(humanoidRootPart2.FirePlayerPart, apagarfogo, 1)
                else
                    apagarfogo.CFrame = humanoidRootPart2.FirePlayerPart.CFrame * CFrame.new(math.random(- 1, 1), math.random(- 1, 1), math.random(- 1, 1))
                    task.wait()
                    apagarfogo.Position = Vector3.new(0, - 100, 0)
                end
            end
        end
    end)
    ragdolledValue.Changed:Connect(function(isCharacterInRagdoll)
        _G.IsCharacterInRagdoll = isCharacterInRagdoll
        if isCharacterInRagdoll and _G.AntiExplosion then
            _G.AntiExplosionVelocity.MaxForce = Vector3.new(math.huge, - 6200, math.huge)
            while ragdolledValue.Value do
                character.Head.CanCollide = false
                character["Right Arm"].RagdollLimbPart.CanCollide = false
                character["Right Leg"].RagdollLimbPart.CanCollide = false
                character["Left Arm"].RagdollLimbPart.CanCollide = false
                character["Left Leg"].RagdollLimbPart.CanCollide = false
                character.Torso.CanCollide = false
                character.Head.Massless = true
                character["Right Arm"].Massless = true
                character["Right Leg"].Massless = true
                character["Left Arm"].Massless = true
                character["Left Leg"].Massless = true
                character.Head.CFrame = humanoidRootPart2.CFrame
                character["Right Arm"].CFrame = humanoidRootPart2.CFrame
                character["Right Leg"].CFrame = humanoidRootPart2.CFrame
                character["Left Arm"].CFrame = humanoidRootPart2.CFrame
                character["Left Leg"].CFrame = humanoidRootPart2.CFrame
                task.wait()
            end
            character.Head.Massless = false
            character["Right Arm"].Massless = false
            character["Right Leg"].Massless = false
            character["Left Arm"].Massless = false
            character["Left Leg"].Massless = false
        else
            _G.AntiExplosionVelocity.MaxForce = Vector3.new(0, 0, 0)
        end
    end)
    humanoid.Changed:Connect(function(humanoidProperty)
        if humanoidProperty == "Sit" and humanoid.Sit == true then
            if humanoid.SeatPart == nil or tostring(humanoid.SeatPart.Parent) ~= "CreatureBlobman" then
                if humanoid.SeatPart == nil and _G.AntiGrab then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                    humanoid.Sit = false
                end
            elseif _G.RockBlobman then
                bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bodyPosition.Position = humanoidRootPart2.Position
            end
        end
        if humanoidProperty == "SeatPart" and humanoid.SeatPart == nil then
            ResetCharacterStats()
            if humanoidRootPart2:FindFirstChild("BodyPositionFloat") then
                humanoidRootPart2.BodyPositionFloat:Destroy()
            end
            bodyPosition.MaxForce = Vector3.new(0, 0, 0)
        end
        if humanoidProperty == "MoveDirection" and (_G.RockBlobman and isPlayerSeatedInBlobman()) then
            bodyPosition.Position = humanoidRootPart2.Position
            if humanoid.MoveDirection.Magnitude <= 0 then
                bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            else
                bodyPosition.MaxForce = Vector3.new(0, 0, 0)
            end
        end
        if humanoidProperty == "MoveDirection" then
            bodyVelocity.Velocity = humanoid.MoveDirection * 20
        end
    end)
    humanoid.Died:Connect(function()
        if _G.ActualFakeGrabParts then
            _G.ActualFakeGrabParts:Destroy()
        end
    end)
    _G.UniverPlayerHumanoid = humanoid
    local animator = humanoid and humanoid:WaitForChild("Animator", 1)
    if animator then
        TypeAnimation = animator:LoadAnimation(typeAnimation)
        FlailAnimation = animator:LoadAnimation(flailAnimation)
    end
end
userInputService.JumpRequest:Connect(function()
    if _G.InfiniteJump then
        localPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)
runService.Heartbeat:Connect(function()
    if _G.SuperSpeed then
        localPlayer.Character.HumanoidRootPart.CFrame = localPlayer.Character.HumanoidRootPart.CFrame + localPlayer.Character:FindFirstChildOfClass("Humanoid").MoveDirection * Multiplier
    end
end)
function CanRemoveStickyPart(_, kickingAttribute, _)
    return kickingAttribute:GetAttribute("Kicking2") and true or nil
end
task.spawn(function()
    while task.wait() do
        local playersService = playersService
        local playerIterator, index6, playerIndex = pairs(playersService:GetPlayers())
        while true do
            local player
            playerIndex, player = playerIterator(index6, playerIndex)
            if playerIndex == nil then
                break
            end
            if CheckPlayer(player) then
                local character = player.Character
                local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if player and (character and (humanoidRootPart and CanRemoveStickyPart(player, character, humanoidRootPart))) then
                    applySprayCanEffect(humanoidRootPart)
                end
            end
        end
    end
end)
function PlayerRemoving_Added(_)
    refreshPlayerList(PlayerToSelect)
    refreshPlayerList(selectPlayerDropdown)
    refreshPlayerList(selectPlayerDropdown)
    refreshPlayerList(PlayerToTeleport)
    updatePlayerList(RotationAuraList)
    updatePlayerList(PlayerToTarget)
end
local _ = PlayerRemoving_Added
playersService.PlayerAdded:Connect(PlayerRemoving_Added)
playersService.PlayerRemoving:Connect(PlayerRemoving_Added)
task.spawn(PlayerRemoving_Added)
task.spawn(reconnect)
playersService.PlayerAdded:Connect(function(playerToCheck)
    local success, isFriendsWith = pcall(function()
        return playerToCheck:IsFriendsWith(localPlayer.UserId)
    end)
    if success then
        if isFriendsWith and not isPlayerWhitelisted(playerToCheck.Name) then
            table.insert(whitelistTable, playerToCheck.Name)
        end
        refreshStringList(playersInWhitelistDropdown, whitelistTable)
    end
end)
task.spawn(function()
    local players = playersService
    local playerIterator2, playerIndex, playerIndex2 = pairs(players:GetPlayers())
    while true do
        local player2
        playerIndex2, player2 = playerIterator2(playerIndex, playerIndex2)
        if playerIndex2 == nil then
            break
        end
        if player2:IsFriendsWith(localPlayer.UserId) then
            table.insert(whitelistTable, player2.Name)
        end
    end
    refreshStringList(playersInWhitelistDropdown, whitelistTable)
end)
localPlayer.CharacterAdded:Connect(reconnect)
orionXHub:Init()

]====]

    exported.LegacyRuntimeSource = runtimeSource
    exported.LoadImportedRuntime = function(uiStub)
        if exported.LegacyRuntimeLoaded then
            return true
        end

        local library = exported.ObsidianLibrary
        local runtimeEnv = {}
        local runtimeUiStub = uiStub or createUiStub(library)
        local baseEnv = (getfenv and getfenv()) or _G

        setmetatable(runtimeEnv, {
            __index = function(_, key)
                if key == '__allunUiStub' then
                    return runtimeUiStub
                end
                if key == '_G' then
                    return _G
                end
                return baseEnv[key]
            end,
            __newindex = function(_, key, value)
                rawset(runtimeEnv, key, value)
            end,
        })

        local loadedChunk = loadstring(runtimeSource)
        if loadedChunk and setfenv then
            setfenv(loadedChunk, runtimeEnv)
            local ok, err = pcall(loadedChunk)
            if not ok then
                warn('Allun imported runtime failed: ' .. tostring(err))
                exported.LegacyRuntimeError = err
                return false
            end
        else
            warn('Allun imported runtime could not be initialized in this executor')
            exported.LegacyRuntimeError = 'loadstring or setfenv unavailable'
            return false
        end

        exported.LegacyRuntime = runtimeEnv
        exported.LegacyRuntimeLoaded = true
        for _, functionName in ipairs(exported.ImportedFunctionNames or {}) do
            local implementation = runtimeEnv[functionName]
            if type(implementation) == 'function' then
                exported[functionName] = implementation
            end
        end

        if exported.InstallImportedCompatibility then
            exported.InstallImportedCompatibility()
        end

        return true
    end
end
do
    local Players = game:GetService("Players")
    local Workspace = game:GetService("Workspace")
    local RunService = game:GetService("RunService")
    local Lighting = game:GetService("Lighting")

    local player = Players.LocalPlayer

    local visuals = {
        DefaultLighting = {
            Brightness = Lighting.Brightness,
            ClockTime = Lighting.ClockTime,
            GlobalShadows = Lighting.GlobalShadows,
            OutdoorAmbient = Lighting.OutdoorAmbient,
            Ambient = Lighting.Ambient,
            FogStart = Lighting.FogStart,
            FogEnd = Lighting.FogEnd,
            FogColor = Lighting.FogColor,
            ExposureCompensation = Lighting.ExposureCompensation,
        },
        DefaultSkySettings = {},
        HatEnabled = false,
        HatTransparency = 0.3,
        HatRainbow = false,
        HatColor = Color3.fromRGB(0, 255, 255),
        HatParts = {},
        TrailEnabled = false,
        TrailGradient = false,
        TrailLifetime = 0.5,
        TrailTransparencyStart = 0,
        TrailRainbow = false,
        TrailColorStatic = Color3.fromRGB(0, 255, 255),
        TrailGradient1 = Color3.fromRGB(0, 86, 255),
        TrailGradient2 = Color3.fromRGB(255, 0, 0),
        TrailParts = {},
        SkinTrailEnabled = false,
        SkinTrailColor = Color3.fromRGB(255, 0, 0),
        SkinTrailLife = 0.5,
        ForceFieldEnabled = false,
        ForceFieldColor = Color3.fromRGB(128, 128, 128),
        ForceFieldRainbow = false,
        OriginalColors = {},
        AuraEnabled = false,
        AuraType = "Godly",
        CustomAuraID = "",
        CurrentAuraModel = nil,
        AuraEffects = {},
        WorldTimeEnabled = false,
        WorldTimeValue = 12,
        FullBrightEnabled = false,
        NebulaEnabled = false,
        NebulaThemeColor = Color3.fromRGB(173, 216, 230),
        CurrentSkybox = "HD",
        CustomSkyEnabled = false,
        ScreenEnabled = false,
        ScreenIntensity = 0,
        ScreenConnection = nil,
        AnimeImageEnabled = false,
        AnimeImageGui = nil,
        FpsPingEnabled = false,
        FpsPingEnabled2 = false,
    }

    local defaultSky = Lighting:FindFirstChildOfClass("Sky")
    if defaultSky then
        visuals.DefaultSkySettings = {
            SkyboxBk = defaultSky.SkyboxBk,
            SkyboxDn = defaultSky.SkyboxDn,
            SkyboxFt = defaultSky.SkyboxFt,
            SkyboxLf = defaultSky.SkyboxLf,
            SkyboxRt = defaultSky.SkyboxRt,
            SkyboxUp = defaultSky.SkyboxUp,
        }
    end

    visuals.AuraModels = {
        Godly = "rbxassetid://16699750981",
        ["Super Sayien"] = "rbxassetid://116109508364297",
        ["North Star"] = "rbxassetid://83945069652732",
        ["Blue Lord"] = "rbxassetid://10974316799",
        ["Pink Aura"] = "rbxassetid://115980859615239",
        ["Angel Wing"] = "rbxassetid://90022969696073",
        ["Sweet Heart"] = "rbxassetid://91724768175470",
        ["Ethereal Aura"] = "rbxassetid://97041568674250",
    }

    visuals.SkyboxAssets = {
        ["Black Storm"] = { Bk = "rbxassetid://15502511288", Dn = "rbxassetid://15502508460", Ft = "rbxassetid://15502510289", Lf = "rbxassetid://15502507918", Rt = "rbxassetid://15502509398", Up = "rbxassetid://15502511911" },
        HD = { Bk = "http://www.roblox.com/asset/?id=16553658937", Dn = "http://www.roblox.com/asset/?id=16553660713", Ft = "http://www.roblox.com/asset/?id=16553662144", Lf = "http://www.roblox.com/asset/?id=16553664042", Rt = "http://www.roblox.com/asset/?id=16553665766", Up = "http://www.roblox.com/asset/?id=16553667750" },
        Snow = { Bk = "http://www.roblox.com/asset/?id=155657655", Dn = "http://www.roblox.com/asset/?id=155674246", Ft = "http://www.roblox.com/asset/?id=155657609", Lf = "http://www.roblox.com/asset/?id=155657671", Rt = "http://www.roblox.com/asset/?id=155657619", Up = "http://www.roblox.com/asset/?id=155674931" },
        ["Blue Space"] = { Bk = "rbxassetid://15536110634", Dn = "rbxassetid://15536112543", Ft = "rbxassetid://15536116141", Lf = "rbxassetid://15536114370", Rt = "rbxassetid://15536118762", Up = "rbxassetid://15536117282" },
        Realistic = { Bk = "rbxassetid://653719502", Dn = "rbxassetid://653718790", Ft = "rbxassetid://653719067", Lf = "rbxassetid://653719190", Rt = "rbxassetid://653718931", Up = "rbxassetid://653719321" },
        Stormy = { Bk = "http://www.roblox.com/asset/?id=18703245834", Dn = "http://www.roblox.com/asset/?id=18703243349", Ft = "http://www.roblox.com/asset/?id=18703240532", Lf = "http://www.roblox.com/asset/?id=18703237556", Rt = "http://www.roblox.com/asset/?id=18703235430", Up = "http://www.roblox.com/asset/?id=18703232671" },
        Pink = { Bk = "rbxassetid://12216109205", Dn = "rbxassetid://12216109875", Ft = "rbxassetid://12216109489", Lf = "rbxassetid://12216110170", Rt = "rbxassetid://12216110471", Up = "rbxassetid://12216108877" },
        Sunset = { Bk = "rbxassetid://600830446", Dn = "rbxassetid://600831635", Ft = "rbxassetid://600832720", Lf = "rbxassetid://600886090", Rt = "rbxassetid://600833862", Up = "rbxassetid://600835177" },
        Arctic = { Bk = "http://www.roblox.com/asset/?id=225469390", Dn = "http://www.roblox.com/asset/?id=225469395", Ft = "http://www.roblox.com/asset/?id=225469403", Lf = "http://www.roblox.com/asset/?id=225469450", Rt = "http://www.roblox.com/asset/?id=225469471", Up = "http://www.roblox.com/asset/?id=225469481" },
        Space = { Bk = "http://www.roblox.com/asset/?id=166509999", Dn = "http://www.roblox.com/asset/?id=166510057", Ft = "http://www.roblox.com/asset/?id=166510116", Lf = "http://www.roblox.com/asset/?id=166510092", Rt = "http://www.roblox.com/asset/?id=166510131", Up = "http://www.roblox.com/asset/?id=166510114" },
        ["Roblox Default"] = { Bk = "rbxasset://textures/sky/sky512_bk.tex", Dn = "rbxasset://textures/sky/sky512_dn.tex", Ft = "rbxasset://textures/sky/sky512_ft.tex", Lf = "rbxasset://textures/sky/sky512_lf.tex", Rt = "rbxasset://textures/sky/sky512_rt.tex", Up = "rbxasset://textures/sky/sky512_up.tex" },
        ["Red Night"] = { Bk = "http://www.roblox.com/asset/?id=401664839", Dn = "http://www.roblox.com/asset/?id=401664862", Ft = "http://www.roblox.com/asset/?id=401664960", Lf = "http://www.roblox.com/asset/?id=401664881", Rt = "http://www.roblox.com/asset/?id=401664901", Up = "http://www.roblox.com/asset/?id=401664936" },
        ["Deep Space 1"] = { Bk = "http://www.roblox.com/asset/?id=149397692", Dn = "http://www.roblox.com/asset/?id=149397686", Ft = "http://www.roblox.com/asset/?id=149397697", Lf = "http://www.roblox.com/asset/?id=149397684", Rt = "http://www.roblox.com/asset/?id=149397688", Up = "http://www.roblox.com/asset/?id=149397702" },
        ["Pink Skies"] = { Bk = "http://www.roblox.com/asset/?id=151165214", Dn = "http://www.roblox.com/asset/?id=151165197", Ft = "http://www.roblox.com/asset/?id=151165224", Lf = "http://www.roblox.com/asset/?id=151165191", Rt = "http://www.roblox.com/asset/?id=151165206", Up = "http://www.roblox.com/asset/?id=151165227" },
        ["Purple Sunset"] = { Bk = "rbxassetid://264908339", Dn = "rbxassetid://264907909", Ft = "rbxassetid://264909420", Lf = "rbxassetid://264909758", Rt = "rbxassetid://264908886", Up = "rbxassetid://264907379" },
        ["Blue Night"] = { Bk = "http://www.roblox.com/asset/?id=12064107", Dn = "http://www.roblox.com/asset/?id=12064152", Ft = "http://www.roblox.com/asset/?id=12064121", Lf = "http://www.roblox.com/asset/?id=12063984", Rt = "http://www.roblox.com/asset/?id=12064115", Up = "http://www.roblox.com/asset/?id=12064131" },
        ["Blossom Daylight"] = { Bk = "http://www.roblox.com/asset/?id=271042516", Dn = "http://www.roblox.com/asset/?id=271077243", Ft = "http://www.roblox.com/asset/?id=271042556", Lf = "http://www.roblox.com/asset/?id=271042310", Rt = "http://www.roblox.com/asset/?id=271042467", Up = "http://www.roblox.com/asset/?id=271077958" },
        ["Blue Nebula"] = { Bk = "http://www.roblox.com/asset?id=135207744", Dn = "http://www.roblox.com/asset?id=135207662", Ft = "http://www.roblox.com/asset?id=135207770", Lf = "http://www.roblox.com/asset?id=135207615", Rt = "http://www.roblox.com/asset?id=135207695", Up = "http://www.roblox.com/asset?id=135207794" },
        ["Blue Planet"] = { Bk = "rbxassetid://218955819", Dn = "rbxassetid://218953419", Ft = "rbxassetid://218954524", Lf = "rbxassetid://218958493", Rt = "rbxassetid://218957134", Up = "rbxassetid://218950090" },
        ["Deep Space 2"] = { Bk = "http://www.roblox.com/asset/?id=159248188", Dn = "http://www.roblox.com/asset/?id=159248183", Ft = "http://www.roblox.com/asset/?id=159248187", Lf = "http://www.roblox.com/asset/?id=159248173", Rt = "http://www.roblox.com/asset/?id=159248192", Up = "http://www.roblox.com/asset/?id=159248176" },
        Summer = { Bk = "rbxassetid://16648590964", Dn = "rbxassetid://16648617436", Ft = "rbxassetid://16648595424", Lf = "rbxassetid://16648566370", Rt = "rbxassetid://16648577071", Up = "rbxassetid://16648598180" },
        Galaxy = { Bk = "rbxassetid://15983968922", Dn = "rbxassetid://15983966825", Ft = "rbxassetid://15983965025", Lf = "rbxassetid://15983967420", Rt = "rbxassetid://15983966246", Up = "rbxassetid://15983964246" },
        Stylized = { Bk = "rbxassetid://18351376859", Dn = "rbxassetid://18351374919", Ft = "rbxassetid://18351376800", Lf = "rbxassetid://18351376469", Rt = "rbxassetid://18351376457", Up = "rbxassetid://18351377189" },
        Minecraft = { Bk = "rbxassetid://8735166756", Dn = "http://www.roblox.com/asset/?id=8735166707", Ft = "http://www.roblox.com/asset/?id=8735231668", Lf = "http://www.roblox.com/asset/?id=8735166755", Rt = "http://www.roblox.com/asset/?id=8735166751", Up = "http://www.roblox.com/asset/?id=8735166729" },
        ["Sunset 2"] = { Bk = "http://www.roblox.com/asset/?id=151165214", Dn = "http://www.roblox.com/asset/?id=151165197", Ft = "http://www.roblox.com/asset/?id=151165224", Lf = "http://www.roblox.com/asset/?id=151165191", Rt = "http://www.roblox.com/asset/?id=151165206", Up = "http://www.roblox.com/asset/?id=151165227" },
        ["Cloudy Rain"] = { Bk = "http://www.roblox.com/asset/?id=4498828382", Dn = "http://www.roblox.com/asset/?id=4498828812", Ft = "http://www.roblox.com/asset/?id=4498829917", Lf = "http://www.roblox.com/asset/?id=4498830911", Rt = "http://www.roblox.com/asset/?id=4498830417", Up = "http://www.roblox.com/asset/?id=4498831746" },
        ["Black Cloudy Rain"] = { Bk = "http://www.roblox.com/asset/?id=149679669", Dn = "http://www.roblox.com/asset/?id=149681979", Ft = "http://www.roblox.com/asset/?id=149679690", Lf = "http://www.roblox.com/asset/?id=149679709", Rt = "http://www.roblox.com/asset/?id=149679722", Up = "http://www.roblox.com/asset/?id=149680199" },
    }

    function visuals.removeHat(character)
        local hat = visuals.HatParts[character]
        if hat then
            hat:Destroy()
            visuals.HatParts[character] = nil
        end
    end

    function visuals.addHat(character)
        task.wait(0.1)
        local head = character and character:FindFirstChild("Head")
        if not head then
            return
        end

        visuals.removeHat(character)

        local hat = Instance.new("Part")
        hat.Name = "Hat"
        hat.Transparency = visuals.HatTransparency
        hat.Color = visuals.HatColor
        hat.Material = Enum.Material.Neon
        hat.CanCollide = false
        hat.CanTouch = false
        hat.CanQuery = false
        hat.Massless = true

        local mesh = Instance.new("SpecialMesh")
        mesh.MeshId = "rbxassetid://1033714"
        mesh.Scale = Vector3.new(2.4, 1.6, 2.4)
        mesh.Parent = hat

        local weld = Instance.new("WeldConstraint")
        weld.Part0 = head
        weld.Part1 = hat
        weld.Parent = hat

        hat.CFrame = head.CFrame * CFrame.new(0, 1.1, 0)
        hat.Parent = character
        visuals.HatParts[character] = hat
    end

    function visuals.updateHats()
        local character = player.Character
        for char, hat in pairs(visuals.HatParts) do
            if hat and hat.Parent and char == character then
                hat.Transparency = visuals.HatTransparency
                hat.Color = visuals.HatRainbow and Color3.fromHSV((tick() % 5) / 5, 1, 1) or visuals.HatColor
            end
        end
    end

    function visuals.removeTrail(character)
        if visuals.TrailParts[character] then
            visuals.TrailParts[character]:Destroy()
            visuals.TrailParts[character] = nil
        end

        local torso = character and character:FindFirstChild("HumanoidRootPart")
        if torso then
            local a0 = torso:FindFirstChild("TrailAttach0")
            local a1 = torso:FindFirstChild("TrailAttach1")
            if a0 then a0:Destroy() end
            if a1 then a1:Destroy() end
        end
    end

    function visuals.addTrail(character)
        local torso = character and character:FindFirstChild("HumanoidRootPart")
        if not torso then
            return
        end

        visuals.removeTrail(character)

        local a0 = Instance.new("Attachment")
        a0.Name = "TrailAttach0"
        a0.Position = Vector3.new(0, 2, 0)
        a0.Parent = torso

        local a1 = Instance.new("Attachment")
        a1.Name = "TrailAttach1"
        a1.Position = Vector3.new(0, -2, 0)
        a1.Parent = torso

        local trail = Instance.new("Trail")
        trail.Attachment0 = a0
        trail.Attachment1 = a1
        trail.Lifetime = visuals.TrailLifetime
        trail.LightEmission = 0.2
        trail.Enabled = true
        trail.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, visuals.TrailTransparencyStart),
            NumberSequenceKeypoint.new(1, 1),
        })
        if visuals.TrailGradient then
            trail.Color = ColorSequence.new(visuals.TrailGradient1, visuals.TrailGradient2)
        else
            trail.Color = ColorSequence.new(visuals.TrailColorStatic)
        end
        trail.Parent = character
        visuals.TrailParts[character] = trail
    end

    function visuals.updateTrails()
        local character = player.Character
        for char, trail in pairs(visuals.TrailParts) do
            if trail and trail.Parent and char == character then
                trail.Lifetime = visuals.TrailLifetime
                trail.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, visuals.TrailTransparencyStart),
                    NumberSequenceKeypoint.new(1, 1),
                })
                if visuals.TrailGradient then
                    trail.Color = ColorSequence.new(visuals.TrailGradient1, visuals.TrailGradient2)
                else
                    local color = visuals.TrailRainbow and Color3.fromHSV((tick() % 5) / 5, 1, 1) or visuals.TrailColorStatic
                    trail.Color = ColorSequence.new(color)
                end
            end
        end
    end

    function visuals.saveOriginalColors(character)
        visuals.OriginalColors[character] = {}
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "Hat" then
                visuals.OriginalColors[character][part] = {
                    Color = part.Color,
                    Material = part.Material,
                }
            end
        end
    end

    function visuals.applyForceField(character)
        visuals.saveOriginalColors(character)
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "Hat" then
                part.Color = visuals.ForceFieldColor
                part.Material = Enum.Material.ForceField
            end
        end
    end

    function visuals.removeForceField(character)
        local original = visuals.OriginalColors[character]
        if not original then
            return
        end
        for part, data in pairs(original) do
            if part and part.Parent and part:IsA("BasePart") then
                part.Color = data.Color
                part.Material = data.Material
            end
        end
        visuals.OriginalColors[character] = nil
    end

    function visuals.updateForceField()
        if not (player.Character and visuals.ForceFieldEnabled) then
            return
        end
        for _, part in ipairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "Hat" and part.Material == Enum.Material.ForceField then
                part.Color = visuals.ForceFieldRainbow and Color3.fromHSV((tick() % 5) / 5, 1, 1) or visuals.ForceFieldColor
            end
        end
    end

    function visuals.toggleSkinTrail(enabled)
        local character = player.Character
        if not character then
            return
        end
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if not hrp then
            return
        end

        for _, part in ipairs(character:GetChildren()) do
            if part:IsA("BasePart") and part ~= hrp then
                if enabled then
                    if not part:FindFirstChild("SkinTrail") then
                        local trail = Instance.new("Trail")
                        trail.Name = "SkinTrail"
                        trail.Texture = "rbxassetid://1390780157"
                        trail.Color = ColorSequence.new(visuals.SkinTrailColor)
                        trail.Lifetime = visuals.SkinTrailLife
                        trail.Parent = part

                        local p1 = Instance.new("Attachment")
                        p1.Name = "SkinPointer1"
                        p1.Parent = part

                        local p2 = Instance.new("Attachment")
                        p2.Name = "SkinPointer2"
                        p2.Parent = hrp

                        trail.Attachment0 = p1
                        trail.Attachment1 = p2
                    end
                else
                    local trail = part:FindFirstChild("SkinTrail")
                    local p1 = part:FindFirstChild("SkinPointer1")
                    if trail then trail:Destroy() end
                    if p1 then p1:Destroy() end
                end
            end
        end

        if not enabled then
            local pointer = hrp:FindFirstChild("SkinPointer2")
            if pointer then
                pointer:Destroy()
            end
        end
    end

    function visuals.updateSkinTrail()
        local character = player.Character
        if not character then
            return
        end
        for _, descendant in ipairs(character:GetDescendants()) do
            if descendant:IsA("Trail") and descendant.Name == "SkinTrail" then
                descendant.Color = ColorSequence.new(visuals.SkinTrailColor)
                descendant.Lifetime = visuals.SkinTrailLife
            end
        end
    end

    function visuals.loadAuraModel(id)
        local success, result = pcall(function()
            return game:GetObjects(id)[1]
        end)
        if success then
            return result
        end
        return nil
    end

    function visuals.disableAura()
        for _, auraObject in ipairs(visuals.AuraEffects) do
            if auraObject and auraObject.Parent then
                auraObject:Destroy()
            end
        end
        table.clear(visuals.AuraEffects)
    end

    function visuals.enableAura(character)
        visuals.disableAura()
        if not visuals.CurrentAuraModel then
            return
        end

        local tempModel = visuals.CurrentAuraModel:Clone()
        for _, object in ipairs(tempModel:GetDescendants()) do
            if not object:IsA("BasePart") then
                local clone = object:Clone()
                local parentName = object.Parent and object.Parent.Name
                local target = parentName and character:FindFirstChild(parentName)
                if not target then
                    target = character:FindFirstChildWhichIsA("BasePart")
                end
                if target and not target:FindFirstChild(clone.Name) then
                    clone.Parent = target
                    table.insert(visuals.AuraEffects, clone)
                end
            end
        end
        tempModel:Destroy()
    end

    function visuals.updateAuraLogic()
        local idToLoad = visuals.CustomAuraID ~= ""
            and ("rbxassetid://" .. visuals.CustomAuraID:gsub("%D", ""))
            or visuals.AuraModels[visuals.AuraType]
        if not idToLoad then
            return
        end

        local model = visuals.loadAuraModel(idToLoad)
        if model then
            visuals.CurrentAuraModel = model
            if visuals.AuraEnabled and player.Character then
                visuals.enableAura(player.Character)
            end
        end
    end

    function visuals.applySkybox(name)
        local skybox = visuals.SkyboxAssets[name]
        if not skybox then
            return
        end

        local sky = Lighting:FindFirstChildOfClass("Sky")
        if not sky then
            sky = Instance.new("Sky")
            sky.Name = "Sky"
            sky.Parent = Lighting
        end

        sky.SkyboxBk = skybox.Bk
        sky.SkyboxDn = skybox.Dn
        sky.SkyboxFt = skybox.Ft
        sky.SkyboxLf = skybox.Lf
        sky.SkyboxRt = skybox.Rt
        sky.SkyboxUp = skybox.Up
    end

    function visuals.restoreDefaultSky()
        local sky = Lighting:FindFirstChildOfClass("Sky")
        if sky and visuals.DefaultSkySettings.SkyboxBk then
            sky.SkyboxBk = visuals.DefaultSkySettings.SkyboxBk
            sky.SkyboxDn = visuals.DefaultSkySettings.SkyboxDn
            sky.SkyboxFt = visuals.DefaultSkySettings.SkyboxFt
            sky.SkyboxLf = visuals.DefaultSkySettings.SkyboxLf
            sky.SkyboxRt = visuals.DefaultSkySettings.SkyboxRt
            sky.SkyboxUp = visuals.DefaultSkySettings.SkyboxUp
        elseif sky then
            sky:Destroy()
        end
    end

    function visuals.setNebulaEnabled(enabled)
        visuals.NebulaEnabled = enabled
        if enabled then
            local bloom = Lighting:FindFirstChild("NebulaBloom") or Instance.new("BloomEffect")
            bloom.Name = "NebulaBloom"
            bloom.Intensity = 0.7
            bloom.Size = 24
            bloom.Threshold = 1
            bloom.Parent = Lighting

            local correction = Lighting:FindFirstChild("NebulaColorCorrection") or Instance.new("ColorCorrectionEffect")
            correction.Name = "NebulaColorCorrection"
            correction.Saturation = 0.5
            correction.Contrast = 0.2
            correction.TintColor = visuals.NebulaThemeColor
            correction.Parent = Lighting

            local atmosphere = Lighting:FindFirstChild("NebulaAtmosphere") or Instance.new("Atmosphere")
            atmosphere.Name = "NebulaAtmosphere"
            atmosphere.Density = 0.4
            atmosphere.Offset = 0.25
            atmosphere.Glare = 1
            atmosphere.Haze = 2
            atmosphere.Color = visuals.NebulaThemeColor
            atmosphere.Decay = Color3.fromRGB(173, 216, 230)
            atmosphere.Parent = Lighting

            Lighting.Ambient = visuals.NebulaThemeColor
            Lighting.OutdoorAmbient = visuals.NebulaThemeColor
            Lighting.FogStart = 100
            Lighting.FogEnd = 500
            Lighting.FogColor = visuals.NebulaThemeColor
        else
            for _, name in ipairs({ "NebulaBloom", "NebulaColorCorrection", "NebulaAtmosphere" }) do
                local object = Lighting:FindFirstChild(name)
                if object then
                    object:Destroy()
                end
            end
            Lighting.Ambient = visuals.DefaultLighting.Ambient
            Lighting.OutdoorAmbient = visuals.DefaultLighting.OutdoorAmbient
            Lighting.FogStart = visuals.DefaultLighting.FogStart
            Lighting.FogEnd = visuals.DefaultLighting.FogEnd
            Lighting.FogColor = visuals.DefaultLighting.FogColor
        end
    end

    function visuals.setFullBrightEnabled(enabled)
        visuals.FullBrightEnabled = enabled
        if not enabled then
            Lighting.Brightness = visuals.DefaultLighting.Brightness
            Lighting.GlobalShadows = visuals.DefaultLighting.GlobalShadows
            Lighting.OutdoorAmbient = visuals.DefaultLighting.OutdoorAmbient
            Lighting.ExposureCompensation = visuals.DefaultLighting.ExposureCompensation
        end
    end

    function visuals.setScreenEnabled(enabled)
        visuals.ScreenEnabled = enabled
        if enabled then
            if visuals.ScreenConnection then
                visuals.ScreenConnection:Disconnect()
            end
            visuals.ScreenConnection = RunService.RenderStepped:Connect(function()
                local camera = Workspace.CurrentCamera
                if camera then
                    camera.CFrame = camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, 0.65 + visuals.ScreenIntensity, 0, 0, 0, 1)
                end
            end)
        elseif visuals.ScreenConnection then
            visuals.ScreenConnection:Disconnect()
            visuals.ScreenConnection = nil
        end
    end

    function visuals.toggleAnimeImage(enabled)
        visuals.AnimeImageEnabled = enabled
        if enabled then
            if visuals.AnimeImageGui then
                visuals.AnimeImageGui:Destroy()
            end
            local gui = Instance.new("ScreenGui")
            gui.Name = "AnimeImageGui"
            gui.ResetOnSpawn = false
            gui.Parent = player:WaitForChild("PlayerGui")

            local imageLabel = Instance.new("ImageLabel")
            imageLabel.Name = "AnimeImage"
            imageLabel.Image = "http://www.roblox.com/asset/?id=117783035423570"
            imageLabel.Size = UDim2.new(0, 350, 0, 400)
            imageLabel.Position = UDim2.new(1, -25, 0, 10)
            imageLabel.AnchorPoint = Vector2.new(1, 0)
            imageLabel.BackgroundTransparency = 1
            imageLabel.Parent = gui

            visuals.AnimeImageGui = gui
        elseif visuals.AnimeImageGui then
            visuals.AnimeImageGui:Destroy()
            visuals.AnimeImageGui = nil
        end
    end

    function visuals.reapplyVisuals(character)
        task.wait(1)
        if visuals.HatEnabled then visuals.addHat(character) end
        if visuals.TrailEnabled then visuals.addTrail(character) end
        if visuals.ForceFieldEnabled then visuals.applyForceField(character) end
        if visuals.AuraEnabled then visuals.enableAura(character) end
        if visuals.SkinTrailEnabled then visuals.toggleSkinTrail(true) end
        if visuals.AnimeImageEnabled then visuals.toggleAnimeImage(true) end
    end

    RunService.Heartbeat:Connect(function()
        if visuals.HatEnabled then
            visuals.updateHats()
        end
        if visuals.TrailEnabled then
            visuals.updateTrails()
        end
        if visuals.ForceFieldEnabled then
            visuals.updateForceField()
        end
        if visuals.WorldTimeEnabled then
            Lighting.ClockTime = visuals.WorldTimeValue
        end
        if visuals.FullBrightEnabled then
            Lighting.Brightness = 3
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
            Lighting.ExposureCompensation = 0.3
        end
    end)

    player.CharacterAdded:Connect(visuals.reapplyVisuals)
    if player.Character then
        task.defer(function()
            visuals.reapplyVisuals(player.Character)
        end)
    end

    AllunFunctions.Visuals = visuals
end

local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
AllunFunctions.ObsidianLibrary = Library
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()

ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder("AllunSettings")

ThemeManager:SetDefaultTheme({
    FontColor = "#F4F7FB",
    MainColor = "#161A20",
    AccentColor = "#89BCE8",
    BackgroundColor = "#101319",
    OutlineColor = "#1A2028",
    FontFace = Enum.Font.Gotham,
})

Library.ShowCustomCursor = false
Library.CornerRadius = DEFAULT_RADIUS
Library.NotifySide = "Right"
Library.ToggleKeybind = Enum.KeyCode.RightControl

local Window = Library:CreateWindow({
    Title = "Allun",
    Footer = "visual shell",
    Icon = 72656457634929,
    Center = true,
    AutoShow = true,
    Resizable = false,
    ShowCustomCursor = false,
    CornerRadius = DEFAULT_RADIUS,
    Font = Enum.Font.Gotham,
    NotifySide = "Right",
    IconSize = UDim2.fromOffset(22, 22),
    SearchbarSize = UDim2.fromScale(0.92, 1),
})

local Tabs = {
    Combat = Window:AddTab("Combat", "swords"),
    Targeting = Window:AddTab("Targeting", "crosshair"),
    Defense = Window:AddTab("Defense", "shield"),
    Auras = Window:AddTab("Auras", "sparkles"),
    Character = Window:AddTab("Character", "user"),
    Visuals = Window:AddTab("Visuals", "sparkles"),
    Explosions = Window:AddTab("Explosions", "flame"),
    Snowball = Window:AddTab("Snowball", "flame"),
    Blobman = Window:AddTab("Blobman", "user"),
    Teleport = Window:AddTab("Teleport", "user"),
    Utility = Window:AddTab("Utility", "settings"),
    Style = Window:AddTab("Style", "palette"),
    Settings = Window:AddTab("Settings", "settings"),
}

local CombatBox = Tabs.Combat:AddLeftGroupbox("Combat")
local CombatCosmicBox = Tabs.Combat:AddRightGroupbox("Cosmic Combat")
local TargetingBox = Tabs.Targeting:AddLeftGroupbox("Targeting")
local TargetingActionBox = Tabs.Targeting:AddRightGroupbox("Actions")
local DefenseBox = Tabs.Defense:AddLeftGroupbox("Defense")
local DefenseAntiBox = Tabs.Defense:AddRightGroupbox("Anti")
local AurasBox = Tabs.Auras:AddLeftGroupbox("Auras")
local AuraForceBox = Tabs.Auras:AddRightGroupbox("Force")
local CharacterBox = Tabs.Character:AddLeftGroupbox("Character")
local CharacterMovementBox = Tabs.Character:AddRightGroupbox("Movement")
local VisualsHatBox = Tabs.Visuals:AddLeftGroupbox("Hat & Trail")
local VisualsSkinBox = Tabs.Visuals:AddRightGroupbox("Skin & Aura")
local VisualsWorldBox = Tabs.Visuals:AddLeftGroupbox("World")
local VisualsOtherBox = Tabs.Visuals:AddRightGroupbox("Screen & Other")
local ExplosionsBox = Tabs.Explosions:AddLeftGroupbox("Explosions")
local SnowballBox = Tabs.Snowball:AddLeftGroupbox("Snowball")
local BlobmanBox = Tabs.Blobman:AddLeftGroupbox("Blobman")
local TeleportBox = Tabs.Teleport:AddLeftGroupbox("Teleport")
local UtilityBox = Tabs.Utility:AddLeftGroupbox("Utility")
local UtilityBringBox = Tabs.Utility:AddRightGroupbox("Bring All")

local SurfaceBox = Tabs.Style:AddLeftGroupbox("Surface")
local ThemeBox = Tabs.Style:AddRightGroupbox("Theme")
local SettingsBox = Tabs.Settings:AddRightGroupbox("Window")

local Compat = AllunFunctions.CosmicCompatibility
local Visuals = AllunFunctions.Visuals
local CompatPlayers = game:GetService("Players")
local kickLoopConnection = nil
local killLoopConnection = nil
local lineAllConnection = nil
local nextLineAllTick = 0
local espState = {
    OutlineEnabled = false,
    NameEnabled = false,
    AvatarEnabled = false,
    OutlineColor = Color3.fromRGB(255, 255, 255),
    OutlineTransparency = 0,
    NameColor = Color3.fromRGB(255, 255, 255),
    AvatarSize = 72,
    Fov = workspace.CurrentCamera and workspace.CurrentCamera.FieldOfView or 70,
    Objects = {},
}

local function trimText(value)
    if typeof(value) ~= "string" then
        return ""
    end
    return value:match("^%s*(.-)%s*$")
end

local function resolvePlayerByName(name)
    local cleanName = trimText(name)
    if cleanName == "" then
        return nil
    end
    return CompatPlayers:FindFirstChild(cleanName)
end

local function cleanupEspForPlayer(player)
    local bucket = espState.Objects[player]
    if not bucket then
        return
    end
    for _, obj in pairs(bucket) do
        if typeof(obj) == "Instance" and obj.Parent then
            obj:Destroy()
        end
    end
    espState.Objects[player] = nil
end

local function ensureEspForPlayer(player)
    if player == CompatPlayers.LocalPlayer then
        cleanupEspForPlayer(player)
        return
    end

    local character = player.Character
    local head = character and character:FindFirstChild("Head")
    if not head then
        cleanupEspForPlayer(player)
        return
    end

    local bucket = espState.Objects[player] or {}
    espState.Objects[player] = bucket

    if espState.OutlineEnabled then
        local highlight = bucket.Highlight
        if not highlight or not highlight.Parent then
            highlight = Instance.new("Highlight")
            highlight.Name = "AllunESPOutline"
            highlight.FillTransparency = 1
            highlight.DepthMode = Enum.HighlightDepthMode.Occluded
            highlight.Parent = character
            bucket.Highlight = highlight
        end
        highlight.Adornee = character
        highlight.OutlineColor = espState.OutlineColor
        highlight.OutlineTransparency = espState.OutlineTransparency
    elseif bucket.Highlight then
        bucket.Highlight:Destroy()
        bucket.Highlight = nil
    end

    if espState.NameEnabled then
        local billboard = bucket.NameBillboard
        local label = billboard and billboard:FindFirstChild("NameLabel")
        if not billboard or not billboard.Parent or not label then
            billboard = Instance.new("BillboardGui")
            billboard.Name = "AllunESPName"
            billboard.AlwaysOnTop = true
            billboard.Size = UDim2.new(0, 180, 0, 36)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.Parent = character
            billboard.Adornee = head

            label = Instance.new("TextLabel")
            label.Name = "NameLabel"
            label.BackgroundTransparency = 1
            label.Size = UDim2.fromScale(1, 1)
            label.Font = Enum.Font.GothamBold
            label.TextScaled = true
            label.TextStrokeTransparency = 0
            label.Parent = billboard
            bucket.NameBillboard = billboard
        end
        billboard.Adornee = head
        label.Text = player.DisplayName ~= player.Name and (player.DisplayName .. " (@" .. player.Name .. ")") or player.Name
        label.TextColor3 = espState.NameColor
    elseif bucket.NameBillboard then
        bucket.NameBillboard:Destroy()
        bucket.NameBillboard = nil
    end

    if espState.AvatarEnabled then
        local avatar = bucket.AvatarBillboard
        local image = avatar and avatar:FindFirstChild("AvatarImage")
        if not avatar or not avatar.Parent or not image then
            avatar = Instance.new("BillboardGui")
            avatar.Name = "AllunESPAvatar"
            avatar.AlwaysOnTop = true
            avatar.Size = UDim2.new(0, espState.AvatarSize, 0, espState.AvatarSize)
            avatar.StudsOffset = Vector3.new(0, 5.5, 0)
            avatar.Parent = character
            avatar.Adornee = head

            image = Instance.new("ImageLabel")
            image.Name = "AvatarImage"
            image.BackgroundTransparency = 1
            image.Size = UDim2.fromScale(1, 1)
            image.Parent = avatar
            bucket.AvatarBillboard = avatar
        end
        avatar.Adornee = head
        avatar.Size = UDim2.new(0, espState.AvatarSize, 0, espState.AvatarSize)
        local ok, content = pcall(function()
            return CompatPlayers:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
        end)
        if ok then
            image.Image = content
        end
    elseif bucket.AvatarBillboard then
        bucket.AvatarBillboard:Destroy()
        bucket.AvatarBillboard = nil
    end
end

local function refreshEsp()
    for _, player in ipairs(CompatPlayers:GetPlayers()) do
        ensureEspForPlayer(player)
    end
end

local function runWhile(flagGetter, step, delayTime)
    task.spawn(function()
        while flagGetter() do
            step()
            task.wait(delayTime or 0)
        end
    end)
end

CompatPlayers.LocalPlayer.CharacterAdded:Connect(function()
    task.defer(function()
        if Compat and Compat.powerJumpFunc then
            Compat.powerJumpFunc()
        end
        local state = AllunFunctions.state
        if state and (state.noclipGrabEnabled or _G.NoclipGrab) then
            if state.noclipGrabCoroutine then
                pcall(coroutine.close, state.noclipGrabCoroutine)
            end
            state.noclipGrabCoroutine = coroutine.create(AllunFunctions.noclipGrab)
            coroutine.resume(state.noclipGrabCoroutine)
        end
    end)
end)

CompatPlayers.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.defer(refreshEsp)
    end)
    task.defer(refreshEsp)
end)

CompatPlayers.PlayerRemoving:Connect(function(player)
    cleanupEspForPlayer(player)
end)

for _, player in ipairs(CompatPlayers:GetPlayers()) do
    if player ~= CompatPlayers.LocalPlayer then
        player.CharacterAdded:Connect(function()
            task.defer(refreshEsp)
        end)
    end
end

local function sanitizeImportedId(value)
    local cleaned = tostring(value or "Control"):gsub("[^%w]+", "")
    if cleaned == "" then
        cleaned = "Control"
    end
    return cleaned
end

local function createImportedUiBridge()
    local idCounter = 0
    local sectionCache = {}
    local tabColumnState = {}
    local tabMap = {
        Combat = Tabs.Combat,
        Invincibility = Tabs.Defense,
        Player = Tabs.Character,
        ESP = Tabs.Visuals,
        Explosions = Tabs.Explosions,
        Teleport = Tabs.Teleport,
        ["Custom Line"] = Tabs.Auras,
        ["Grab Auras"] = Tabs.Auras,
        Keybinds = Tabs.Utility,
        ["Loop Players"] = Tabs.Combat,
        Auto = Tabs.Utility,
        Misc = Tabs.Combat,
        ["Blobman Grab"] = Tabs.Blobman,
        Config = Tabs.Settings,
    }

    local function nextId(prefix)
        idCounter = idCounter + 1
        return ("Imported%s%d"):format(sanitizeImportedId(prefix), idCounter)
    end

    local function wrapControl(control)
        local proxy = {}

        function proxy:Set(value)
            if control and control.SetValue then
                control:SetValue(value)
            elseif control and control.Set then
                control:Set(value)
            end
        end

        proxy.SetValue = proxy.Set

        function proxy:Refresh(values, ...)
            if control and control.Refresh then
                control:Refresh(values, ...)
            elseif control and control.SetValues then
                control:SetValues(values)
            end
        end

        function proxy:AddColorpicker(options)
            if control and control.AddColorPicker then
                control:AddColorPicker(nextId((options and options.Name) or "Color"), {
                    Title = (options and options.Name) or "Color",
                    Default = (options and options.Default) or Color3.new(1, 1, 1),
                    Callback = options and options.Callback,
                })
            end
            return self
        end

        proxy.AddColorPicker = proxy.AddColorpicker

        function proxy:AddBind()
            return self
        end

        function proxy:AddKeyPicker()
            return self
        end

        return setmetatable(proxy, {
            __index = function(_, key)
                if control and control[key] ~= nil then
                    return control[key]
                end
            end,
        })
    end

    local function createNoopSection()
        local stub = wrapControl(nil)
        local section = {}
        function section:AddToggle() return stub end
        function section:AddButton() return stub end
        function section:AddDropdown() return stub end
        function section:AddSlider() return stub end
        function section:AddTextbox() return stub end
        function section:AddLabel() return stub end
        function section:AddParagraph() return stub end
        return section
    end

    local function resolvePlacement(tabName, sectionName)
        if tabName == "Discord Server" or tabName == "Credits" or tabName == "Premium Info" then
            return nil
        end

        if sectionName == "Auto Claim-Plot" then
            return Tabs.Teleport
        end
        if sectionName == "Auto Get Coins" or sectionName == "Auto Time-Reset" then
            return Tabs.Utility
        end
        if sectionName == "Annoy Players" or sectionName == "Kick All" or sectionName == "Loop Players" or sectionName == "Players in Loop" or sectionName == "Loop Kill Functions" or sectionName == "Loop Kick" or sectionName == "Kick Ownership" then
            return Tabs.Combat
        end
        if sectionName == "Bring All" or sectionName == "Whitelist" then
            return Tabs.Utility
        end
        if sectionName == "Invulnerability" or sectionName == "Counter-Attack" then
            return Tabs.Defense
        end
        if sectionName == "Place TP" or sectionName == "Player TP" or sectionName == "Teleport" then
            return Tabs.Teleport
        end
        if sectionName == "Walkspeed" or sectionName == "Infinite Power Jump" or sectionName == "Noclip" or sectionName == "Control Player/NPC" then
            return Tabs.Character
        end
        if sectionName == "Change your entire line color" or sectionName == "Line Effects" then
            return Tabs.Auras
        end
        if sectionName == "Stress Server" or sectionName == "Spawn Toy" then
            return Tabs.Utility
        end
        if sectionName == "Anchor Objects" or sectionName == "Compile Objects" then
            return Tabs.Combat
        end
        if sectionName == "Blobman Loopkick" then
            return Tabs.Blobman
        end
        if sectionName == "Perspective" then
            return Tabs.Combat
        end
        if sectionName == "Auto Re-build Anchored Objects/Compiled" then
            return Tabs.Utility
        end
        if sectionName == "Anchor/Compile Objects Visual Settings" then
            return Tabs.Style
        end

        return tabMap[tabName] or Tabs.Utility
    end

    local function resolveExistingGroupbox(tabName, sectionName)
        local bySection = {
            ["Strength"] = CombatBox,
            ["Others"] = CombatBox,
            ["Perspective"] = CombatCosmicBox,
            ["Annoy Players"] = CombatCosmicBox,
            ["Kick All"] = CombatCosmicBox,
            ["Loop Players"] = CombatCosmicBox,
            ["Players in Loop"] = CombatCosmicBox,
            ["Loop Kill Functions"] = CombatCosmicBox,
            ["Loop Kick"] = CombatCosmicBox,
            ["Kick Ownership"] = CombatCosmicBox,
            ["Anchor Objects"] = CombatBox,
            ["Compile Objects"] = CombatBox,

            ["Invulnerability"] = DefenseBox,
            ["Counter-Attack"] = DefenseAntiBox,

            ["Normal Auras"] = AurasBox,
            ["Fling Aura"] = AuraForceBox,
            ["Telekinesis Aura"] = AuraForceBox,
            ["Anchor Aura"] = AuraForceBox,
            ["Kick Aura"] = AuraForceBox,
            ["Auras Whitelist"] = AuraForceBox,
            ["Change your entire line color"] = AurasBox,
            ["Line Effects"] = AuraForceBox,

            ["Walkspeed"] = CharacterMovementBox,
            ["Infinite Power Jump"] = CharacterMovementBox,
            ["Noclip"] = CharacterMovementBox,
            ["Control Player/NPC"] = CharacterBox,

            ["ESP Highlight"] = VisualsWorldBox,
            ["ESP Billboard"] = VisualsOtherBox,

            ["Place TP"] = TeleportBox,
            ["Player TP"] = TeleportBox,
            ["Auto Claim-Plot"] = TeleportBox,

            ["Auto Get Coins"] = UtilityBox,
            ["Auto Time-Reset"] = UtilityBox,
            ["Bring All"] = UtilityBringBox,
            ["Whitelist"] = UtilityBringBox,
            ["Stress Server"] = UtilityBox,
            ["Spawn Toy"] = UtilityBox,
            ["Teleport"] = UtilityBox,
            ["Auto Re-build Anchored Objects/Compiled"] = UtilityBox,

            ["Blobman Loopkick"] = BlobmanBox,
            ["Blobman Grab"] = BlobmanBox,

            ["Anchor/Compile Objects Visual Settings"] = SurfaceBox,
        }

        if bySection[sectionName] then
            return bySection[sectionName]
        end

        local byTab = {
            Combat = CombatBox,
            Invincibility = DefenseBox,
            Player = CharacterBox,
            ESP = VisualsWorldBox,
            Explosions = ExplosionsBox,
            Teleport = TeleportBox,
            ["Custom Line"] = AurasBox,
            ["Grab Auras"] = AurasBox,
            Keybinds = UtilityBox,
            ["Loop Players"] = CombatCosmicBox,
            Auto = UtilityBox,
            Misc = CombatCosmicBox,
            ["Blobman Grab"] = BlobmanBox,
            Config = SettingsBox,
        }

        return byTab[tabName]
    end

    local function getDefaultExistingGroupbox(targetTab)
        if targetTab == Tabs.Combat then
            return CombatBox
        end
        if targetTab == Tabs.Defense then
            return DefenseBox
        end
        if targetTab == Tabs.Auras then
            return AurasBox
        end
        if targetTab == Tabs.Character then
            return CharacterBox
        end
        if targetTab == Tabs.Visuals then
            return VisualsWorldBox
        end
        if targetTab == Tabs.Explosions then
            return ExplosionsBox
        end
        if targetTab == Tabs.Snowball then
            return SnowballBox
        end
        if targetTab == Tabs.Blobman then
            return BlobmanBox
        end
        if targetTab == Tabs.Teleport then
            return TeleportBox
        end
        if targetTab == Tabs.Utility then
            return UtilityBox
        end
        if targetTab == Tabs.Style then
            return SurfaceBox
        end
        if targetTab == Tabs.Settings then
            return SettingsBox
        end
        return nil
    end

    local function resolveGroupbox(tabName, sectionName)
        local key = tostring(tabName) .. "::" .. tostring(sectionName)
        if sectionCache[key] then
            return sectionCache[key]
        end

        local existingGroupbox = resolveExistingGroupbox(tabName, sectionName)
        if existingGroupbox then
            sectionCache[key] = existingGroupbox
            return existingGroupbox
        end

        local targetTab = resolvePlacement(tabName, sectionName)
        if not targetTab then
            return nil
        end
        local groupbox = getDefaultExistingGroupbox(targetTab)
        if not groupbox then
            return nil
        end
        sectionCache[key] = groupbox
        return groupbox
    end

    local function createSection(tabName, sectionName)
        local groupbox = resolveGroupbox(tabName, sectionName)
        if not groupbox then
            return createNoopSection()
        end
        local section = {}

        function section:AddToggle(options)
            local control = groupbox:AddToggle(nextId(sectionName .. (options.Name or "Toggle")), {
                Text = options.Name or "Toggle",
                Default = options.Default == true,
                Callback = options.Callback,
            })
            return wrapControl(control)
        end

        function section:AddButton(options)
            local control = groupbox:AddButton({
                Text = options.Name or options.Text or "Button",
                Func = options.Callback or options.Func,
            })
            return wrapControl(control)
        end

        function section:AddDropdown(options)
            local values = options.Options or options.Values or options.List or {}
            local control = groupbox:AddDropdown(nextId(sectionName .. (options.Name or "Dropdown")), {
                Text = options.Name or "Dropdown",
                Values = values,
                Default = options.Default,
                Multi = options.Multi == true,
                Callback = options.Callback,
            })
            return wrapControl(control)
        end

        function section:AddSlider(options)
            local rounding = tonumber(options.Rounding)
            if rounding == nil then
                rounding = (options.Increment and tostring(options.Increment):find("%.")) and 1 or 0
            end
            local control = groupbox:AddSlider(nextId(sectionName .. (options.Name or "Slider")), {
                Text = options.Name or "Slider",
                Default = tonumber(options.Default) or tonumber(options.Min) or 0,
                Min = tonumber(options.Min) or 0,
                Max = tonumber(options.Max) or 100,
                Rounding = rounding,
                Callback = options.Callback,
            })
            return wrapControl(control)
        end

        function section:AddTextbox(options)
            local control = groupbox:AddInput(nextId(sectionName .. (options.Name or "Input")), {
                Text = options.Name or "Input",
                Default = options.Default or "",
                Placeholder = options.TextDisappear and "" or (options.Placeholder or ""),
                Numeric = options.NumbersOnly == true,
                Finished = options.ClearTextOnFocus == true,
                Callback = options.Callback,
            })
            return wrapControl(control)
        end

        function section:AddLabel(text)
            local control = groupbox:AddLabel(tostring(text))
            return wrapControl(control)
        end

        function section:AddParagraph(title, body)
            local control = groupbox:AddLabel(("%s: %s"):format(tostring(title), tostring(body)))
            return wrapControl(control)
        end

        return section
    end

    local function createTab(tabName)
        local tab = {}

        function tab:AddSection(options)
            return createSection(tabName, options.Name or "Section")
        end

        return tab
    end

    local root = {}

    function root.MakeWindow(_, _)
        local window = {}

        function window:MakeTab(options)
            return createTab(options.Name or "Tab")
        end

        return window
    end

    function root:MakeNotification(data)
        if Library and Library.Notify then
            Library:Notify(tostring((type(data) == "table" and (data.Content or data.Name)) or data or "Allun"), (type(data) == "table" and data.Time) or 3)
        end
    end

    function root:Init()
    end

    return root
end

if AllunFunctions and AllunFunctions.LoadImportedRuntime then
    task.defer(function()
        local importedOk = AllunFunctions.LoadImportedRuntime(createImportedUiBridge())
        if not importedOk and Library and Library.Notify then
            Library:Notify("Imported runtime failed: " .. tostring(AllunFunctions.LegacyRuntimeError), 6)
        end
    end)
end

local function getImportedHub()
    return AllunFunctions.MergedHub
end

local function callImportedFunction(functionName, ...)
    local importedHub = getImportedHub()
    local target = importedHub and importedHub[functionName]
    if typeof(target) ~= "function" then
        target = AllunFunctions[functionName]
    end
    if typeof(target) ~= "function" and AllunFunctions.LegacyRuntime then
        target = AllunFunctions.LegacyRuntime[functionName]
    end
    if typeof(target) ~= "function" then
        warn("Imported function not found: " .. tostring(functionName))
        return false
    end

    local ok, err = pcall(target, ...)
    if not ok then
        warn("Imported function failed: " .. tostring(functionName) .. " | " .. tostring(err))
        return false
    end

    return true
end

local function safeCallImported(functionName, ...)
    local ok = callImportedFunction(functionName, ...)
    if not ok then
        Library:Notify("Function unavailable: " .. tostring(functionName), 4)
    end
    return ok
end

local presetPlaceLocations = {
    ["Green House"] = CFrame.new(-352, 99, 354),
    ["Green Safe-House"] = CFrame.new(-584, -6, 93),
    ["Chinese Safe-House"] = CFrame.new(579, 124, -94),
    ["Farm House"] = CFrame.new(-234, 83, -324),
    ["Spawn"] = CFrame.new(4, -7, -3),
    ["Blue Safe-House"] = CFrame.new(538, 96, -372),
    ["Secret Big Cave"] = CFrame.new(17, -7, 539),
    ["Secret Train Cave"] = CFrame.new(500, 62, -307),
    ["Mine Cave"] = CFrame.new(-254, -7, 518),
    ["Witch Safe-House"] = CFrame.new(296, -4, 494),
    ["Red Safe-House"] = CFrame.new(-516, -6, -162),
}

local extrasOk, extrasErr = pcall(function()
CombatBox:AddToggle("FurtherReachToggle", {
    Text = "Further Reach",
    Default = false,
    Callback = function(value)
        local ok = AllunFunctions.setFurtherReachEnabled(value)
        if not ok and value and Library.Options.FurtherReachToggle then
            task.defer(function()
                Library.Options.FurtherReachToggle:SetValue(false)
            end)
        end
    end,
})

CombatBox:AddButton({
    Text = "Reapply Further Reach",
    Func = function()
        local ok, err = AllunFunctions.reapplyFurtherReach()
        if not ok and err ~= "disabled" then
            warn("Further Reach reapply failed: " .. tostring(err))
        end
    end,
})

CombatBox:AddToggle("FireGrabToggle", {
    Text = "Fire Grab",
    Default = false,
    Callback = function(value)
        local state = AllunFunctions.state
        if value then
            state.fireGrabCoroutine = coroutine.create(AllunFunctions.fireGrab)
            coroutine.resume(state.fireGrabCoroutine)
        elseif state.fireGrabCoroutine then
            coroutine.close(state.fireGrabCoroutine)
            state.fireGrabCoroutine = nil
        end
    end,
})

DefenseBox:AddButton({
    Text = "Refresh lists",
    Func = function()
        AllunFunctions.updatePlayerList()
        Compat.refreshRegisteredDropdowns()
        Compat.refreshTeleportLocations()
        Compat.refreshToyDropdowns()
    end,
})

DefenseBox:AddToggle("CompatAntiFireToggle", {
    Text = "Anti Fire",
    Default = false,
    Callback = function(value)
        Compat.state.anti.AntiFire = value
        if value then
            runWhile(function()
                return Compat.state.anti.AntiFire
            end, Compat.antiFireStep, 0.1)
        else
            Compat.resetAntiFire()
        end
    end,
})

CombatBox:AddToggle("AllunBurnGrabToggle", {
    Text = "Burn Grab",
    Default = false,
    Callback = function(value)
        local state = AllunFunctions.state
        if value then
            state.fireGrabCoroutine = coroutine.create(AllunFunctions.fireGrab)
            coroutine.resume(state.fireGrabCoroutine)
        elseif state.fireGrabCoroutine then
            coroutine.close(state.fireGrabCoroutine)
            state.fireGrabCoroutine = nil
        end
    end,
})

CombatBox:AddToggle("AllunSuperStrengthToggle", {
    Text = "Throw Strength",
    Default = false,
    Callback = function(value)
        Compat.toggleStrengthConnections(value)
    end,
})

CombatBox:AddSlider("AllunStrengthSlider", {
    Text = "Strength",
    Default = Compat.state.strength.Strength,
    Min = 400,
    Max = 10000,
    Rounding = 0,
    Callback = function(value)
        Compat.state.strength.Strength = value
    end,
})

DefenseBox:AddToggle("CompatAntiBarrierToggle", {
    Text = "Anti Barrier",
    Default = false,
    Callback = function(value)
        Compat.state.anti.AntiBarrier = value
        if value then
            runWhile(function()
                return Compat.state.anti.AntiBarrier
            end, Compat.applyAntiBarrier, 1)
        else
            Compat.restoreAntiBarrier()
        end
    end,
})

DefenseBox:AddButton({
    Text = "Destroy Void",
    Func = function()
        workspace.FallenPartsDestroyHeight = -1e95
        Compat.notify("Defense", "Void height destroyed.", 4)
    end,
})

DefenseBox:AddToggle("CompatLeaveNotifyToggle", {
    Text = "Player Leave Notify",
    Default = false,
    Callback = function(value)
        Compat.state.random.LeaveNotify = value
    end,
})

local visualsHatToggle = VisualsHatBox:AddToggle("VisualHatToggle", {
    Text = "Enable Chinese Hat",
    Default = false,
    Callback = function(value)
        Visuals.HatEnabled = value
        if value and game.Players.LocalPlayer.Character then
            Visuals.addHat(game.Players.LocalPlayer.Character)
        elseif game.Players.LocalPlayer.Character then
            Visuals.removeHat(game.Players.LocalPlayer.Character)
        end
    end,
})
visualsHatToggle:AddColorPicker("VisualHatColor", {
    Default = Visuals.HatColor,
    Title = "Hat Color",
    Callback = function(value)
        Visuals.HatColor = value
    end,
})

VisualsHatBox:AddToggle("VisualHatRainbowToggle", {
    Text = "Rainbow Hat",
    Default = false,
    Callback = function(value)
        Visuals.HatRainbow = value
    end,
})

VisualsHatBox:AddSlider("VisualHatTransparency", {
    Text = "Hat transparency",
    Default = Visuals.HatTransparency,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Callback = function(value)
        Visuals.HatTransparency = value
    end,
})

local visualsTrailToggle = VisualsHatBox:AddToggle("VisualTrailToggle", {
    Text = "Enable Trail",
    Default = false,
    Callback = function(value)
        Visuals.TrailEnabled = value
        if value and game.Players.LocalPlayer.Character then
            Visuals.addTrail(game.Players.LocalPlayer.Character)
        elseif game.Players.LocalPlayer.Character then
            Visuals.removeTrail(game.Players.LocalPlayer.Character)
        end
    end,
})
visualsTrailToggle:AddColorPicker("VisualTrailColor", {
    Default = Visuals.TrailColorStatic,
    Title = "Trail Color",
    Callback = function(value)
        Visuals.TrailColorStatic = value
    end,
})

local visualsTrailGradientToggle = VisualsHatBox:AddToggle("VisualTrailGradientToggle", {
    Text = "Use Gradient Mode",
    Default = false,
    Callback = function(value)
        Visuals.TrailGradient = value
        if Visuals.TrailEnabled and game.Players.LocalPlayer.Character then
            Visuals.addTrail(game.Players.LocalPlayer.Character)
        end
    end,
})
visualsTrailGradientToggle:AddColorPicker("VisualTrailGradient1", {
    Default = Visuals.TrailGradient1,
    Title = "Gradient Color 1",
    Callback = function(value)
        Visuals.TrailGradient1 = value
    end,
})
visualsTrailGradientToggle:AddColorPicker("VisualTrailGradient2", {
    Default = Visuals.TrailGradient2,
    Title = "Gradient Color 2",
    Callback = function(value)
        Visuals.TrailGradient2 = value
    end,
})

VisualsHatBox:AddToggle("VisualTrailRainbowToggle", {
    Text = "Trail Rainbow",
    Default = false,
    Callback = function(value)
        Visuals.TrailRainbow = value
    end,
})

VisualsHatBox:AddSlider("VisualTrailLifetime", {
    Text = "Trail lifetime",
    Default = Visuals.TrailLifetime,
    Min = 0.1,
    Max = 3,
    Rounding = 1,
    Callback = function(value)
        Visuals.TrailLifetime = value
    end,
})

VisualsHatBox:AddSlider("VisualTrailTransparency", {
    Text = "Trail transparency",
    Default = Visuals.TrailTransparencyStart,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Callback = function(value)
        Visuals.TrailTransparencyStart = value
    end,
})

local visualsForceFieldToggle = VisualsSkinBox:AddToggle("VisualForceFieldToggle", {
    Text = "Enable ForceField",
    Default = false,
    Callback = function(value)
        Visuals.ForceFieldEnabled = value
        local character = game.Players.LocalPlayer.Character
        if character then
            if value then
                Visuals.applyForceField(character)
            else
                Visuals.removeForceField(character)
            end
        end
    end,
})
visualsForceFieldToggle:AddColorPicker("VisualForceFieldColor", {
    Default = Visuals.ForceFieldColor,
    Title = "ForceField Color",
    Callback = function(value)
        Visuals.ForceFieldColor = value
        if Visuals.ForceFieldEnabled and game.Players.LocalPlayer.Character and not Visuals.ForceFieldRainbow then
            Visuals.applyForceField(game.Players.LocalPlayer.Character)
        end
    end,
})

VisualsSkinBox:AddToggle("VisualForceFieldRainbowToggle", {
    Text = "Rainbow ForceField",
    Default = false,
    Callback = function(value)
        Visuals.ForceFieldRainbow = value
    end,
})

local visualsSkinTrailToggle = VisualsSkinBox:AddToggle("VisualSkinTrailToggle", {
    Text = "Enable Skin Trail",
    Default = false,
    Callback = function(value)
        Visuals.SkinTrailEnabled = value
        Visuals.toggleSkinTrail(value)
    end,
})
visualsSkinTrailToggle:AddColorPicker("VisualSkinTrailColor", {
    Default = Visuals.SkinTrailColor,
    Title = "Skin Trail Color",
    Callback = function(value)
        Visuals.SkinTrailColor = value
        if Visuals.SkinTrailEnabled then
            Visuals.updateSkinTrail()
        end
    end,
})

VisualsSkinBox:AddSlider("VisualSkinTrailLife", {
    Text = "Skin trail life",
    Default = Visuals.SkinTrailLife,
    Min = 0.1,
    Max = 3,
    Rounding = 1,
    Callback = function(value)
        Visuals.SkinTrailLife = value
        if Visuals.SkinTrailEnabled then
            Visuals.updateSkinTrail()
        end
    end,
})

VisualsSkinBox:AddToggle("VisualAuraToggle", {
    Text = "Enable Local Aura",
    Default = false,
    Callback = function(value)
        Visuals.AuraEnabled = value
        if value then
            if not Visuals.CurrentAuraModel then
                Visuals.updateAuraLogic()
            end
            if game.Players.LocalPlayer.Character then
                Visuals.enableAura(game.Players.LocalPlayer.Character)
            end
        else
            Visuals.disableAura()
        end
    end,
})

local auraList = {}
for auraName in pairs(Visuals.AuraModels) do
    table.insert(auraList, auraName)
end
table.sort(auraList)

VisualsSkinBox:AddDropdown("VisualAuraTypeDropdown", {
    Text = "Aura Type",
    Values = auraList,
    Default = Visuals.AuraType,
    Multi = false,
    Callback = function(value)
        Visuals.AuraType = value
        Visuals.CustomAuraID = ""
        if Visuals.AuraEnabled then
            Visuals.updateAuraLogic()
        end
    end,
})

VisualsSkinBox:AddInput("VisualCustomAuraInput", {
    Text = "Custom Aura ID",
    Default = "",
    Placeholder = "Asset ID",
    Callback = function(value)
        Visuals.CustomAuraID = trimText(value)
        if Visuals.AuraEnabled and Visuals.CustomAuraID ~= "" then
            Visuals.updateAuraLogic()
        end
    end,
})

local skyList = {}
for skyboxName in pairs(Visuals.SkyboxAssets) do
    table.insert(skyList, skyboxName)
end
table.sort(skyList)

VisualsWorldBox:AddDropdown("VisualSkyboxDropdown", {
    Text = "Select Skybox",
    Values = skyList,
    Default = Visuals.CurrentSkybox,
    Multi = false,
    Callback = function(value)
        Visuals.CurrentSkybox = value
        if not Visuals.CustomSkyEnabled then
            Visuals.CustomSkyEnabled = true
        end
        Visuals.applySkybox(value)
    end,
})

VisualsWorldBox:AddToggle("VisualSkyboxToggle", {
    Text = "Enable Custom Skybox",
    Default = false,
    Callback = function(value)
        Visuals.CustomSkyEnabled = value
        if value then
            Visuals.applySkybox(Visuals.CurrentSkybox)
        else
            Visuals.restoreDefaultSky()
        end
    end,
})

local visualsNebulaToggle = VisualsWorldBox:AddToggle("VisualNebulaToggle", {
    Text = "Nebula Theme",
    Default = false,
    Callback = function(value)
        Visuals.setNebulaEnabled(value)
    end,
})
visualsNebulaToggle:AddColorPicker("VisualNebulaColor", {
    Default = Visuals.NebulaThemeColor,
    Title = "Nebula Color",
    Callback = function(value)
        Visuals.NebulaThemeColor = value
        if Visuals.NebulaEnabled then
            Visuals.setNebulaEnabled(false)
            Visuals.setNebulaEnabled(true)
        end
    end,
})

VisualsWorldBox:AddToggle("VisualTimeToggle", {
    Text = "Enable Time Changer",
    Default = false,
    Callback = function(value)
        Visuals.WorldTimeEnabled = value
    end,
})

VisualsWorldBox:AddSlider("VisualTimeValue", {
    Text = "Time (0-24)",
    Default = Visuals.WorldTimeValue,
    Min = 0,
    Max = 24,
    Rounding = 1,
    Callback = function(value)
        Visuals.WorldTimeValue = value
    end,
})

VisualsWorldBox:AddToggle("VisualFullBrightToggle", {
    Text = "Full Bright",
    Default = false,
    Callback = function(value)
        Visuals.setFullBrightEnabled(value)
    end,
})

VisualsWorldBox:AddSlider("AllunFovSlider", {
    Text = "FOV",
    Default = espState.Fov,
    Min = 40,
    Max = 120,
    Rounding = 0,
    Callback = function(value)
        espState.Fov = value
        local camera = workspace.CurrentCamera
        if camera then
            camera.FieldOfView = value
        end
    end,
})

VisualsOtherBox:AddToggle("VisualScreenToggle", {
    Text = "Enable Screen Effect",
    Default = false,
    Callback = function(value)
        Visuals.setScreenEnabled(value)
    end,
})

VisualsOtherBox:AddSlider("VisualScreenIntensity", {
    Text = "Screen Stretch",
    Default = Visuals.ScreenIntensity,
    Min = 0,
    Max = 0.2,
    Rounding = 3,
    Callback = function(value)
        Visuals.ScreenIntensity = value
    end,
})

VisualsOtherBox:AddToggle("VisualAnimeImageToggle", {
    Text = "Anime Image",
    Default = false,
    Callback = function(value)
        Visuals.toggleAnimeImage(value)
    end,
})

local espOutlineToggle = VisualsOtherBox:AddToggle("AllunEspOutlineToggle", {
    Text = "ESP Outline",
    Default = false,
    Callback = function(value)
        espState.OutlineEnabled = value
        refreshEsp()
    end,
})
espOutlineToggle:AddColorPicker("AllunEspOutlineColor", {
    Default = espState.OutlineColor,
    Title = "Outline Color",
    Callback = function(value)
        espState.OutlineColor = value
        refreshEsp()
    end,
})

VisualsOtherBox:AddSlider("AllunEspOutlineTransparency", {
    Text = "Outline transparency",
    Default = espState.OutlineTransparency,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Callback = function(value)
        espState.OutlineTransparency = value
        refreshEsp()
    end,
})

local espNameToggle = VisualsOtherBox:AddToggle("AllunEspNameToggle", {
    Text = "ESP Names",
    Default = false,
    Callback = function(value)
        espState.NameEnabled = value
        refreshEsp()
    end,
})
espNameToggle:AddColorPicker("AllunEspNameColor", {
    Default = espState.NameColor,
    Title = "Name Color",
    Callback = function(value)
        espState.NameColor = value
        refreshEsp()
    end,
})

VisualsOtherBox:AddToggle("AllunEspAvatarToggle", {
    Text = "ESP Avatar",
    Default = false,
    Callback = function(value)
        espState.AvatarEnabled = value
        refreshEsp()
    end,
})

VisualsOtherBox:AddSlider("AllunEspAvatarSize", {
    Text = "Avatar size",
    Default = espState.AvatarSize,
    Min = 40,
    Max = 120,
    Rounding = 0,
    Callback = function(value)
        espState.AvatarSize = value
        refreshEsp()
    end,
})

VisualsOtherBox:AddButton({
    Text = "Activate FPS/Ping Counter",
    Func = function()
        if not Visuals.FpsPingEnabled then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GLAMOHGA/fling/refs/heads/main/%D1%85%D0%B7%20%D0%BA%D0%B0%D0%BA%20%D0%BD%D0%B0%D0%B7%D0%B2%D0%B0%D1%82%D1%8C%20%D1%82%D0%B8%D0%BF%D0%BE%20%D1%84%D0%BF%D1%81%20%D0%B8%20%D0%BF%D0%B8%D0%BD%D0%B3.md"))()
            Visuals.FpsPingEnabled = true
        end
    end,
})

VisualsOtherBox:AddButton({
    Text = "Activate FPS/Ping Counter 2",
    Func = function()
        if not Visuals.FpsPingEnabled2 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VetrexTheBest/Fps-ping/refs/heads/main/fps%2Bping.txt"))()
            Visuals.FpsPingEnabled2 = true
        end
    end,
})

CharacterBox:AddSlider("CrouchSpeedValue", {
    Text = "Crouch speed",
    Default = AllunFunctions.state.crouchWalkSpeed,
    Min = 6,
    Max = 100,
    Rounding = 0,
    Callback = function(value)
        AllunFunctions.state.crouchWalkSpeed = value
    end,
})

CharacterBox:AddToggle("CompatSecondPersonToggle", {
    Text = "Second Person Camera",
    Default = false,
    Callback = function(value)
        Compat.setSecondPersonEnabled(value)
    end,
})

CharacterMovementBox:AddToggle("CompatWalkspeedToggle", {
    Text = "Walkspeed",
    Default = false,
    Callback = function(value)
        Compat.state.movement.Walkspeed = value
        Compat.walkspeedFunc()
    end,
})

CharacterMovementBox:AddSlider("CompatWalkspeedValue", {
    Text = "Speed multiplier",
    Default = Compat.state.movement.WalkspeedValue,
    Min = 1,
    Max = 5,
    Rounding = 1,
    Callback = function(value)
        Compat.state.movement.WalkspeedValue = value
    end,
})

CharacterMovementBox:AddToggle("CompatInfiniteJumpToggle", {
    Text = "Infinite Jump",
    Default = false,
    Callback = function(value)
        Compat.state.movement.InfiniteJump = value
        Compat.infiniteJumpFunc()
    end,
})

CharacterMovementBox:AddToggle("AllunInfinitePowerJumpToggle", {
    Text = "Jump Boost",
    Default = false,
    Callback = function(value)
        Compat.state.movement.InfinitePowerJump = value
        Compat.powerJumpFunc()
    end,
})

CharacterMovementBox:AddSlider("CompatJumpPowerValue", {
    Text = "Jump power",
    Default = Compat.state.movement.InfiniteJumpPower,
    Min = 16,
    Max = 500,
    Rounding = 0,
    Callback = function(value)
        Compat.state.movement.InfiniteJumpPower = value
        Compat.powerJumpFunc()
    end,
})

CharacterMovementBox:AddToggle("CompatNoclipToggle", {
    Text = "Noclip",
    Default = false,
    Callback = function(value)
        Compat.state.movement.Noclip = value
        Compat.noclipFunc()
    end,
})

CharacterMovementBox:AddToggle("CompatNoclipGrabUniversalToggle", {
    Text = "Noclip Grab",
    Default = false,
    Callback = function(value)
        local state = AllunFunctions.state
        state.noclipGrabEnabled = value
        _G.NoclipGrab = value
        if value then
            if state.noclipGrabCoroutine then
                pcall(coroutine.close, state.noclipGrabCoroutine)
            end
            state.noclipGrabCoroutine = coroutine.create(AllunFunctions.noclipGrab)
            coroutine.resume(state.noclipGrabCoroutine)
        elseif state.noclipGrabCoroutine then
            pcall(coroutine.close, state.noclipGrabCoroutine)
            state.noclipGrabCoroutine = nil
        end
    end,
})

DefenseAntiBox:AddButton({
    Text = "Ragdoll All",
    Func = function()
        Compat.ragdollAllPlayers()
    end,
})

DefenseAntiBox:AddToggle("CompatAntiGrabToggle", {
    Text = "Anti Grab",
    Default = false,
    Callback = function(value)
        Compat.state.anti.AntiGrab = value
        if value then
            runWhile(function()
                return Compat.state.anti.AntiGrab
            end, Compat.antiGrabStep, 0)
        end
    end,
})

DefenseAntiBox:AddToggle("CompatAntiExplodeToggle", {
    Text = "Anti Explode",
    Default = false,
    Callback = function(value)
        Compat.state.anti.AntiExplode = value
    end,
})

DefenseAntiBox:AddToggle("CompatAntiLagToggle", {
    Text = "Anti Lag",
    Default = false,
    Callback = function(value)
        Compat.state.anti.AntiLag = value
        Compat.antiLag()
    end,
})

DefenseAntiBox:AddToggle("CompatAntiBlobmanToggle", {
    Text = "Anti Blobman",
    Default = false,
    Callback = function(value)
        Compat.state.anti.AntiBlobman = value
        if value then
            runWhile(function()
                return Compat.state.anti.AntiBlobman
            end, function()
                Compat.removeDetectors()
                Compat.applyAntiMassless()
            end, 1)
        end
    end,
})

local compatAttackPlayerDropdown = CombatCosmicBox:AddDropdown("CompatAttackPlayerDropdown", {
    Text = "Target players",
    Values = Compat.getAllPlayers(false),
    Default = {},
    Multi = true,
    Callback = function(value)
        Compat.syncTargets(value)
    end,
})
Compat.registerDropdown(compatAttackPlayerDropdown, false)

CombatCosmicBox:AddToggle("CompatLoopKickToggle", {
    Text = "Loop Kick",
    Default = false,
    Callback = function(value)
        Compat.state.attack.Kick.E = value
        if value then
            if kickLoopConnection then
                kickLoopConnection:Disconnect()
            end
            kickLoopConnection = Compat.loopCtrl(Compat.state.attack.Kick, false)
        elseif kickLoopConnection then
            Compat.stopLoop(kickLoopConnection, Compat.state.attack.Kick)
            kickLoopConnection = nil
        end
    end,
})

CombatCosmicBox:AddToggle("CompatLoopKillToggle", {
    Text = "Loop Kill",
    Default = false,
    Callback = function(value)
        Compat.state.attack.Kill.E = value
        if value then
            if killLoopConnection then
                killLoopConnection:Disconnect()
            end
            killLoopConnection = Compat.loopCtrl(Compat.state.attack.Kill, true)
        elseif killLoopConnection then
            Compat.stopLoop(killLoopConnection, Compat.state.attack.Kill)
            killLoopConnection = nil
        end
    end,
})

local compatTargetingDropdown = TargetingBox:AddDropdown("CompatTargetingPlayerDropdown", {
    Text = "Target players",
    Values = Compat.getAllPlayers(false),
    Default = {},
    Multi = true,
    Callback = function(value)
        Compat.syncTargets(value)
    end,
})
Compat.registerDropdown(compatTargetingDropdown, false)

TargetingBox:AddButton({
    Text = "Refresh targets",
    Func = function()
        AllunFunctions.updatePlayerList()
        Compat.refreshRegisteredDropdowns()
    end,
})

TargetingActionBox:AddToggle("TargetingLoopKickToggle", {
    Text = "Auto Kick",
    Default = false,
    Callback = function(value)
        Compat.state.attack.Kick.E = value
        if value then
            if kickLoopConnection then
                kickLoopConnection:Disconnect()
            end
            kickLoopConnection = Compat.loopCtrl(Compat.state.attack.Kick, false)
        elseif kickLoopConnection then
            Compat.stopLoop(kickLoopConnection, Compat.state.attack.Kick)
            kickLoopConnection = nil
        end
    end,
})

TargetingActionBox:AddToggle("TargetingLoopKillToggle", {
    Text = "Auto Kill",
    Default = false,
    Callback = function(value)
        Compat.state.attack.Kill.E = value
        if value then
            if killLoopConnection then
                killLoopConnection:Disconnect()
            end
            killLoopConnection = Compat.loopCtrl(Compat.state.attack.Kill, true)
        elseif killLoopConnection then
            Compat.stopLoop(killLoopConnection, Compat.state.attack.Kill)
            killLoopConnection = nil
        end
    end,
})

TargetingActionBox:AddToggle("TargetingSnowballToggle", {
    Text = "Auto Snowball",
    Default = false,
    Callback = function(value)
        Compat.state.snowball.TeleportEnabled = value
        Compat.state.snowball.SpawnEnabled = value
        if value then
            runWhile(function()
                return Compat.state.snowball.TeleportEnabled
            end, function()
                Compat.spawnBallsStep()
                Compat.tpBallStep()
            end, 0.12)
        end
    end,
})

TargetingActionBox:AddToggle("TargetingBlobmanToggle", {
    Text = "Auto Blobman",
    Default = false,
    Callback = function(value)
        Compat.state.blobman.ToggleEnabled = value
        if value then
            Compat.masterLoop()
        end
    end,
})

TargetingActionBox:AddToggle("TargetingBlobmanHoverToggle", {
    Text = "Blobman Hover",
    Default = false,
    Callback = function(value)
        Compat.state.blobman.HoverEnabled = value
        if value then
            runWhile(function()
                return Compat.state.blobman.HoverEnabled
            end, Compat.hoverFollowTargetStep, 0.06)
        end
    end,
})

TargetingActionBox:AddButton({
    Text = "Ragdoll Selected",
    Func = function()
        Compat.ragdollSelectedPlayers()
    end,
})

TargetingActionBox:AddButton({
    Text = "Ragdoll All",
    Func = function()
        Compat.ragdollAllPlayers()
    end,
})

AuraForceBox:AddToggle("CompatStrengthToggle", {
    Text = "Grab Strength",
    Default = false,
    Callback = function(value)
        Compat.toggleStrengthConnections(value)
    end,
})

AuraForceBox:AddSlider("CompatStrengthValue", {
    Text = "Launch strength",
    Default = Compat.state.strength.Strength,
    Min = 10,
    Max = 3000,
    Rounding = 0,
    Callback = function(value)
        Compat.state.strength.Strength = value
    end,
})

AurasBox:AddSlider("CompatAuraRadiusValue", {
    Text = "Aura radius",
    Default = Compat.state.aura.Radius,
    Min = 5,
    Max = 50,
    Rounding = 0,
    Callback = function(value)
        Compat.state.aura.Radius = value
    end,
})

AurasBox:AddToggle("CompatLaunchAuraToggle", {
    Text = "Launch Aura",
    Default = false,
    Callback = function(value)
        if value then
            Compat.startAirSuspendAura()
        else
            Compat.stopAirSuspendAura()
        end
    end,
})

AurasBox:AddToggle("CompatTelekinesisAuraToggle", {
    Text = "Telekinesis Aura",
    Default = false,
    Callback = function(value)
        if value then
            Compat.startHellSendAura()
        else
            Compat.stopHellSendAura()
        end
    end,
})

AurasBox:AddToggle("CompatDeathAuraToggle", {
    Text = "Death Aura",
    Default = false,
    Callback = function(value)
        Compat.state.aura.DeathEnabled = value
        if value then
            runWhile(function()
                return Compat.state.aura.DeathEnabled
            end, Compat.deathAuraStep, 0)
        end
    end,
})

local compatSnowballPlayerDropdown = SnowballBox:AddDropdown("CompatSnowballPlayerDropdown", {
    Text = "Snowball target",
    Values = Compat.getAllPlayers(false),
    Default = {},
    Multi = true,
    Callback = function(value)
        Compat.syncTargets(value)
    end,
})
Compat.state.snowball.Dropdown = compatSnowballPlayerDropdown
Compat.registerDropdown(compatSnowballPlayerDropdown, false)

SnowballBox:AddToggle("CompatSnowballRagdollToggle", {
    Text = "Snowball Ragdoll",
    Default = false,
    Callback = function(value)
        Compat.state.snowball.TeleportEnabled = value
        if value then
            runWhile(function()
                return Compat.state.snowball.TeleportEnabled
            end, Compat.tpBallStep, 0.1)
        end
    end,
})

SnowballBox:AddToggle("CompatSnowballSpawnToggle", {
    Text = "Auto Spawn Snowballs",
    Default = false,
    Callback = function(value)
        Compat.state.snowball.SpawnEnabled = value
        if value then
            runWhile(function()
                return Compat.state.snowball.SpawnEnabled
            end, Compat.spawnBallsStep, 1)
        end
    end,
})

SnowballBox:AddToggle("CompatSnowballBlobToggle", {
    Text = "Auto Kick Blob",
    Default = false,
    Callback = function(value)
        Compat.state.snowball.AutoBlobEnabled = value
        if value then
            runWhile(function()
                return Compat.state.snowball.AutoBlobEnabled
            end, function()
                Compat.autoBlobStep()
                Compat.tpSnowStep()
            end, 0.1)
        end
    end,
})

local compatBlobmanPlayerDropdown = BlobmanBox:AddDropdown("CompatBlobmanPlayerDropdown", {
    Text = "Blobman players",
    Values = Compat.getAllPlayers(false),
    Default = {},
    Multi = true,
    Callback = function(value)
        Compat.syncTargets(value)
    end,
})
Compat.registerDropdown(compatBlobmanPlayerDropdown, false)

BlobmanBox:AddToggle("CompatBlobmanKickToggle", {
    Text = "Blobman Target",
    Default = false,
    Callback = function(value)
        Compat.state.blobman.ToggleEnabled = value
        if value then
            Compat.masterLoop()
        end
    end,
})

BlobmanBox:AddToggle("CompatBlobmanGodLoopToggle", {
    Text = "God Loop Target",
    Default = false,
    Callback = function(value)
        Compat.state.blobman.GodLoopEnabled = value
        if value then
            runWhile(function()
                return Compat.state.blobman.GodLoopEnabled
            end, Compat.godLoopTargetStep, 0.01)
        end
    end,
})

BlobmanBox:AddToggle("CompatBlobmanHoverToggle", {
    Text = "Hover Above Target",
    Default = false,
    Callback = function(value)
        Compat.state.blobman.HoverEnabled = value
        if value then
            runWhile(function()
                return Compat.state.blobman.HoverEnabled
            end, Compat.hoverFollowTargetStep, 0.06)
        end
    end,
})

BlobmanBox:AddSlider("CompatBlobmanHoverHeight", {
    Text = "Hover height",
    Default = Compat.state.blobman.HoverHeight,
    Min = 5,
    Max = 100,
    Rounding = 0,
    Callback = function(value)
        Compat.state.blobman.HoverHeight = value
    end,
})

ExplosionsBox:AddDropdown("ToyToLoadDropdown", {
    Text = "Toy to load",
    Values = { "BombMissile", "FireworkMissile" },
    Default = _G.ToyToLoad,
    Multi = false,
    Callback = function(value)
        _G.ToyToLoad = value
    end,
})

ExplosionsBox:AddSlider("MaxMissilesValue", {
    Text = "Max missiles",
    Default = _G.MaxMissiles,
    Min = 1,
    Max = 20,
    Rounding = 0,
    Callback = function(value)
        _G.MaxMissiles = value
    end,
})

ExplosionsBox:AddToggle("AutoReloadMissiles", {
    Text = "Auto Reload Cache",
    Default = false,
    Callback = function(value)
        AllunFunctions.reloadMissile(value)
    end,
})

local compatTeleportPlayerDropdown = TeleportBox:AddDropdown("CompatTeleportPlayerDropdown", {
    Text = "Teleport target",
    Values = Compat.getAllPlayers(false),
    Default = Compat.state.teleport.SelectedPlayer,
    Multi = false,
    Callback = function(value)
        Compat.state.teleport.SelectedPlayer = value
    end,
})
Compat.registerDropdown(compatTeleportPlayerDropdown, false)

TeleportBox:AddButton({
    Text = "Teleport to Player",
    Func = function()
        Compat.teleportToPlayer()
    end,
})

TeleportBox:AddDropdown("AllunPlaceToTeleportDropdown", {
    Text = "Place to Teleport",
    Values = {
        "Green House",
        "Chinese Safe-House",
        "Spawn",
        "Blue Safe-House",
        "Secret Big Cave",
        "Secret Train Cave",
        "Mine Cave",
        "Farm House",
        "Witch Safe-House",
        "Green Safe-House",
        "Red Safe-House",
    },
    Default = "Green House",
    Multi = false,
    Callback = function(value)
        Compat.state.teleport.PlacePreset = value
    end,
})

TeleportBox:AddButton({
    Text = "Teleport",
    Func = function()
        local character = game:GetService("Players").LocalPlayer.Character
        local root = character and character:FindFirstChild("HumanoidRootPart")
        local placeName = Compat.state.teleport.PlacePreset or "Green House"
        local target = presetPlaceLocations[placeName]
        if root and target then
            root.CFrame = target
        end
    end,
})

local compatTeleportLocationDropdown = TeleportBox:AddDropdown("CompatTeleportLocationDropdown", {
    Text = "Teleport place",
    Values = Compat.refreshTeleportLocations(),
    Default = Compat.state.teleport.SelectedLocation,
    Multi = false,
    Callback = function(value)
        Compat.state.teleport.SelectedLocation = value
    end,
})
Compat.state.teleport.LocationDropdown = compatTeleportLocationDropdown
Compat.refreshTeleportLocations()

TeleportBox:AddButton({
    Text = "Refresh places",
    Func = function()
        Compat.refreshTeleportLocations()
    end,
})

TeleportBox:AddButton({
    Text = "Teleport to Place",
    Func = function()
        Compat.teleportToLocation()
    end,
})

TeleportBox:AddToggle("CompatLoopTeleportToggle", {
    Text = "Loop Teleport",
    Default = false,
    Callback = function(value)
        if value then
            Compat.startLoopTeleport()
        else
            Compat.stopLoopTeleport()
        end
    end,
})

UtilityBox:AddToggle("CompatLagToggle", {
    Text = "Lag",
    Default = false,
    Callback = function(value)
        Compat.state.random.LagEnabled = value
        if value then
            runWhile(function()
                return Compat.state.random.LagEnabled
            end, Compat.lagStep, 1)
        end
    end,
})

UtilityBox:AddSlider("CompatLagIntensityValue", {
    Text = "Lag intensity",
    Default = Compat.state.random.LagIntensity,
    Min = 1,
    Max = 1000,
    Rounding = 0,
    Callback = function(value)
        Compat.state.random.LagIntensity = value
    end,
})

local compatToyDropdown = UtilityBox:AddDropdown("CompatToyDropdown", {
    Text = "Toy control",
    Values = Compat.getOwnedToyNames(),
    Default = Compat.state.toys.SelectedToy,
    Multi = false,
    Callback = function(value)
        Compat.state.toys.SelectedToy = value
    end,
})
Compat.state.toys.ToyDropdown = compatToyDropdown

UtilityBox:AddDropdown("CompatToyAttachModeDropdown", {
    Text = "Toy mode",
    Values = { "Front", "Back", "Left Wing", "Right Wing", "Orbit" },
    Default = Compat.state.toys.AttachMode,
    Multi = false,
    Callback = function(value)
        Compat.state.toys.AttachMode = value
    end,
})

UtilityBox:AddSlider("CompatToyDistanceValue", {
    Text = "Toy distance",
    Default = Compat.state.toys.AttachDistance,
    Min = 2,
    Max = 20,
    Rounding = 0,
    Callback = function(value)
        Compat.state.toys.AttachDistance = value
    end,
})

UtilityBox:AddSlider("CompatToyHeightValue", {
    Text = "Toy height",
    Default = Compat.state.toys.AttachHeight,
    Min = -8,
    Max = 12,
    Rounding = 0,
    Callback = function(value)
        Compat.state.toys.AttachHeight = value
    end,
})

UtilityBox:AddSlider("CompatToySpinValue", {
    Text = "Toy orbit speed",
    Default = Compat.state.toys.AttachSpin,
    Min = 1,
    Max = 12,
    Rounding = 1,
    Callback = function(value)
        Compat.state.toys.AttachSpin = value
    end,
})

UtilityBox:AddButton({
    Text = "Refresh toys",
    Func = function()
        Compat.refreshToyDropdowns()
    end,
})

UtilityBox:AddButton({
    Text = "Spawn selected toy",
    Func = function()
        Compat.spawnSelectedToy()
    end,
})

UtilityBox:AddToggle("CompatAnchorGrabToggle", {
    Text = "Anchor Grab",
    Default = false,
    Callback = function(value)
        Compat.state.random.AnchorGrab = value
    end,
})

UtilityBox:AddButton({
    Text = "Enable Wings",
    Func = function()
        local ok, err = AllunFunctions.executeWingsCombo()
        if not ok then
            Library:Notify("Wings failed: " .. tostring(err), 5)
        end
    end,
})

UtilityBox:AddToggle("CompatToyTelekinesisToggle", {
    Text = "Toy Telekinesis",
    Default = false,
    Callback = function(value)
        Compat.state.toys.AttachEnabled = value
        if value then
            runWhile(function()
                return Compat.state.toys.AttachEnabled
            end, Compat.toyTelekinesisStep, 0)
        else
            Compat.clearToyBodyMovers()
        end
    end,
})

local compatBoardDropdown = UtilityBox:AddDropdown("CompatBoardToyDropdown", {
    Text = "Board toy",
    Values = Compat.getOwnedToyNames("board"),
    Default = Compat.state.toys.BoardToy,
    Multi = false,
    Callback = function(value)
        Compat.state.toys.BoardToy = value
    end,
})
Compat.state.toys.BoardDropdown = compatBoardDropdown
Compat.refreshToyDropdowns()

UtilityBox:AddDropdown("CompatBoardKeyDropdown", {
    Text = "Board key",
    Values = { "B", "V", "C", "X", "Z", "T", "R", "G", "F", "Q" },
    Default = Compat.state.toys.BoardKey,
    Multi = false,
    Callback = function(value)
        Compat.state.toys.BoardKey = value
    end,
})

UtilityBox:AddButton({
    Text = "Spawn Board",
    Func = function()
        Compat.spawnBoard()
    end,
})

UtilityBox:AddToggle("CompatBoardBindToggle", {
    Text = "Board on Key",
    Default = false,
    Callback = function(value)
        Compat.state.toys.BoardBindEnabled = value
        Compat.ensureBoardConnection()
    end,
})

UtilityBringBox:AddToggle("CompatBringAllToggle", {
    Text = "Bring All",
    Default = false,
    Callback = function(value)
        if value then
            Compat.startBringAll()
        else
            Compat.stopBringAll()
        end
    end,
})

UtilityBringBox:AddToggle("CompatBringFriendsToggle", {
    Text = "Whitelist Friends",
    Default = false,
    Callback = function(value)
        Compat.state.random.BringAllFriends = value
    end,
})

UtilityBringBox:AddSlider("CompatBringRadiusValue", {
    Text = "Bring radius",
    Default = Compat.state.random.BringRadius,
    Min = 5,
    Max = 50,
    Rounding = 0,
    Callback = function(value)
        Compat.state.random.BringRadius = value
    end,
})

UtilityBringBox:AddButton({
    Text = "Delete Held Player Limbs",
    Func = function()
        Compat.deleteHeldPlayerLimbs()
    end,
})

CombatBox:AddToggle("MergedSilentAimToggle", {
    Text = "Silent Aim",
    Default = false,
    Callback = function(value)
        _G.SilentAim = value
        _G.SilentAimV2 = value
        callImportedFunction("setSilentAimEnabled", value)
    end,
})

CombatBox:AddToggle("AllunSilentAimV1Toggle", {
    Text = "Silent Aim V1 (Raycast)",
    Default = false,
    Callback = function(value)
        _G.SilentAim = value
        callImportedFunction("setSilentAimEnabled", value)
    end,
})

CombatBox:AddSlider("MergedSilentAimRange", {
    Text = "Silent aim range",
    Default = 30,
    Min = 5,
    Max = 200,
    Rounding = 0,
    Callback = function(value)
        callImportedFunction("setSilentAimRange", value)
    end,
})

CombatBox:AddSlider("AllunSilentAimRangeSlider", {
    Text = "Silent-Aim Range",
    Default = 50,
    Min = 0,
    Max = 50,
    Rounding = 0,
    Callback = function(value)
        callImportedFunction("setSilentAimRange", value)
    end,
})

CombatBox:AddButton({
    Text = "Create Grab Lines",
    Func = function()
        callImportedFunction("createGrabLineForAll")
    end,
})

CombatBox:AddToggle("MergedGrabLineLagToggle", {
    Text = "Grab Line Lag",
    Default = false,
    Callback = function(value)
        callImportedFunction("setGrabLineLagEnabled", value)
    end,
})

CombatBox:AddSlider("MergedGrabLineLagSpeed", {
    Text = "Grab line speed",
    Default = 0.5,
    Min = 0.01,
    Max = 2,
    Rounding = 2,
    Callback = function(value)
        callImportedFunction("setGrabLineSpeed", value)
    end,
})

CombatBox:AddToggle("MergedLineAllToggle", {
    Text = "Line All Players",
    Default = false,
    Callback = function(value)
        if lineAllConnection then
            lineAllConnection:Disconnect()
            lineAllConnection = nil
        end
        if value then
            lineAllConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if os.clock() < nextLineAllTick then
                    return
                end
                nextLineAllTick = os.clock() + (_G.LineAllDelay or 0.5)
                callImportedFunction("createGrabLineForAll")
                for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                    if player ~= game:GetService("Players").LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 500, 0)
                    end
                end
            end)
        end
    end,
})

CombatBox:AddSlider("MergedLineAllDelay", {
    Text = "Line all delay",
    Default = 0.5,
    Min = 0.01,
    Max = 2,
    Rounding = 2,
    Callback = function(value)
        _G.LineAllDelay = value
    end,
})

CombatCosmicBox:AddButton({
    Text = "Grab Nearby Once",
    Func = function()
        callImportedFunction("grabNearbyPlayers")
    end,
})

CombatCosmicBox:AddToggle("MergedNearbyGrabLoopToggle", {
    Text = "Auto Grab Nearby",
    Default = false,
    Callback = function(value)
        callImportedFunction("setAutoGrabNearbyEnabled", value)
    end,
})

CharacterBox:AddToggle("MergedFireAnimationToggle", {
    Text = "Fire Flail Animation",
    Default = false,
    Callback = function(value)
        callImportedFunction("setFireAnimationEnabled", value)
    end,
})

CharacterBox:AddToggle("MergedMouseTeleportToggle", {
    Text = "Mouse Teleport (Z)",
    Default = false,
    Callback = function(value)
        callImportedFunction("setMouseTeleportEnabled", value)
    end,
})

CharacterBox:AddToggle("MergedVoidRescueToggle", {
    Text = "Void Rescue",
    Default = false,
    Callback = function(value)
        callImportedFunction("setVoidRescueEnabled", value)
    end,
})

CharacterMovementBox:AddToggle("MergedGhostNoclipToggle", {
    Text = "Ghost Noclip",
    Default = false,
    Callback = function(value)
        callImportedFunction("setGhostNoclipEnabled", value)
    end,
})

DefenseAntiBox:AddToggle("MergedAntiKickToggle", {
    Text = "Anti Kick",
    Default = false,
    Callback = function(value)
        callImportedFunction("setAntiKickEnabled", value)
    end,
})

AurasBox:AddButton({
    Text = "Random Beam Colors",
    Func = function()
        callImportedFunction("updateBeamColors")
    end,
})

AurasBox:AddToggle("MergedBeamCycleToggle", {
    Text = "Beam Color Cycle",
    Default = false,
    Callback = function(value)
        callImportedFunction("setBeamCycleEnabled", value)
    end,
})

UtilityBox:AddToggle("MergedGrabEverythingToggle", {
    Text = "Grab Everything",
    Default = false,
    Callback = function(value)
        callImportedFunction("setGrabEverythingEnabled", value)
    end,
})

UtilityBox:AddSlider("MergedGrabEverythingSpeed", {
    Text = "Grab everything speed",
    Default = 0.1,
    Min = 0.01,
    Max = 10,
    Rounding = 2,
    Callback = function(value)
        callImportedFunction("setGrabEverythingSpeed", value)
    end,
})

UtilityBox:AddButton({
    Text = "Grab My Toys",
    Func = function()
        callImportedFunction("grabAllToys", game:GetService("Players").LocalPlayer)
    end,
})

UtilityBox:AddToggle("MergedGrabMyToysLoopToggle", {
    Text = "Loop Grab My Toys",
    Default = false,
    Callback = function(value)
        callImportedFunction("setGrabAllToysLoopEnabled", value)
    end,
})

UtilityBox:AddButton({
    Text = "Grab And Move Toys",
    Func = function()
        callImportedFunction("grabAndMoveToys")
    end,
})

UtilityBox:AddButton({
    Text = "Clear Toy Forces",
    Func = function()
        callImportedFunction("clearEffects")
    end,
})

UtilityBox:AddButton({
    Text = "Spawn Banana",
    Func = function()
        callImportedFunction("spawnBanana")
    end,
})

UtilityBox:AddButton({
    Text = "Hold Banana",
    Func = function()
        callImportedFunction("holdBanana")
    end,
})

UtilityBox:AddButton({
    Text = "Use Banana",
    Func = function()
        callImportedFunction("useBanana")
    end,
})

BlobmanBox:AddButton({
    Text = "Drop Random Player",
    Func = function()
        callImportedFunction("grabAndDropRandomPlayer")
    end,
})

BlobmanBox:AddToggle("MergedBlobDropLoopToggle", {
    Text = "Drop Loop",
    Default = false,
    Callback = function(value)
        callImportedFunction("setBlobDropLoopEnabled", value)
    end,
})

ThemeBox:AddButton({
    Text = "Enable World FX",
    Func = function()
        callImportedFunction("enableGraphics")
    end,
})

ThemeBox:AddButton({
    Text = "Disable World FX",
    Func = function()
        callImportedFunction("disableGraphics")
    end,
})
end)

if not extrasOk then
    warn("Allun extras failed to load: " .. tostring(extrasErr))
end

local function applyCornerRadius(radius)
    local value = math.clamp(tonumber(radius) or 14, 0, 28)
    Library.CornerRadius = value

    if typeof(Library.Corners) == "table" then
        for _, corner in pairs(Library.Corners) do
            if typeof(corner) == "Instance" and corner:IsA("UICorner") then
                corner.CornerRadius = UDim.new(0, value)
            end
        end
    end
end

local function applyPalette(mode)
    if mode == "Slate" then
        Library.Scheme.BackgroundColor = Color3.fromRGB(16, 19, 25)
        Library.Scheme.MainColor = Color3.fromRGB(22, 26, 33)
        Library.Scheme.OutlineColor = Color3.fromRGB(27, 33, 42)
        Library.Scheme.AccentColor = Color3.fromRGB(137, 188, 232)
    elseif mode == "Smoke" then
        Library.Scheme.BackgroundColor = Color3.fromRGB(18, 20, 24)
        Library.Scheme.MainColor = Color3.fromRGB(27, 30, 36)
        Library.Scheme.OutlineColor = Color3.fromRGB(32, 36, 43)
        Library.Scheme.AccentColor = Color3.fromRGB(158, 194, 223)
    elseif mode == "Night" then
        Library.Scheme.BackgroundColor = Color3.fromRGB(13, 15, 20)
        Library.Scheme.MainColor = Color3.fromRGB(18, 21, 28)
        Library.Scheme.OutlineColor = Color3.fromRGB(24, 29, 37)
        Library.Scheme.AccentColor = Color3.fromRGB(113, 163, 214)
    end

    Library:UpdateColorsUsingRegistry()
end

local function hideTopHandle()
    task.wait(0.3)

    if not Library.ScreenGui then
        return
    end

    local topMost
    for _, descendant in ipairs(Library.ScreenGui:GetDescendants()) do
        if descendant:IsA("ImageButton") then
            local size = descendant.AbsoluteSize
            local pos = descendant.AbsolutePosition

            local looksLikeHandle = size.X <= 28
                and size.Y <= 28
                and pos.Y <= 180
                and pos.X >= 900

            if looksLikeHandle then
                topMost = descendant
                break
            end
        end
    end

    if topMost then
        topMost.Visible = false
        topMost.Active = false
    end
end

SurfaceBox:AddDropdown("SurfacePreset", {
    Text = "Palette",
    Values = { "Slate", "Smoke", "Night" },
    Default = DEFAULT_PALETTE,
    Callback = function(Value)
        applyPalette(Value)
    end,
})

SurfaceBox:AddSlider("WindowRoundness", {
    Text = "Corner radius",
    Default = DEFAULT_RADIUS,
    Min = 4,
    Max = 24,
    Rounding = 0,
    Callback = function(Value)
        applyCornerRadius(Value)
    end,
})

SurfaceBox:AddDropdown("FontPreset", {
    Text = "Font",
    Values = { "Gotham", "BuilderSans", "SourceSans", "Roboto" },
    Default = "Gotham",
    Callback = function(Value)
        Library:SetFont(Enum.Font[Value])
        Library:UpdateColorsUsingRegistry()
    end,
})

ThemeManager:ApplyToTab(Tabs.Settings)

SettingsBox:AddSlider("ManualCornerRadius", {
    Text = "Live corner control",
    Default = DEFAULT_RADIUS,
    Min = 4,
    Max = 24,
    Rounding = 0,
    Callback = function(Value)
        applyCornerRadius(Value)
        if Library.Options.WindowRoundness and Library.Options.WindowRoundness.Value ~= Value then
            Library.Options.WindowRoundness:SetValue(Value)
        end
    end,
})

SettingsBox:AddDropdown("QuickPalette", {
    Text = "Quick palette",
    Values = { "Slate", "Smoke", "Night" },
    Default = DEFAULT_PALETTE,
    Callback = function(Value)
        applyPalette(Value)
        if Library.Options.SurfacePreset and Library.Options.SurfacePreset.Value ~= Value then
            Library.Options.SurfacePreset:SetValue(Value)
        end
    end,
})

local HUD_LOGO_IMAGE = "rbxassetid://72656457634929"
local HUD_STYLE = "Style 1"
local HUD_STYLE_2_ASSETS = {
    UserIcon = "rbxassetid://88517795223986",
    PlaceIcon = "rbxassetid://138047651582987",
    FpsIcon = "rbxassetid://108400895461990",
}
local HUD_STYLE_3_ASSETS = {
    BrandIcon = "rbxassetid://77856985540406",
    FpsIcon = "rbxassetid://112589113282360",
    PingIcon = "rbxassetid://129826901381657",
}

local HudRuntime = {
    RenderConnection = nil,
    InputConnection = nil,
    Gui = nil,
}

local cachedHudPlaceName = nil

local function disconnectHudConnection(key)
    local connection = HudRuntime[key]
    if connection then
        connection:Disconnect()
        HudRuntime[key] = nil
    end
end

local function trimHudText(value, maxLength)
    local text = tostring(value or "")
    if maxLength and #text > maxLength then
        return text:sub(1, maxLength) .. "..."
    end
    return text
end

local function getHudTextWidth(text, font, size)
    local textService = game:GetService("TextService")
    local bounds = textService:GetTextSize(tostring(text or ""), size, font, Vector2.new(1000, 24))
    return bounds.X
end

local function getHudPlaceName()
    if cachedHudPlaceName then
        return cachedHudPlaceName
    end

    local marketplaceService = game:GetService("MarketplaceService")
    local fallbackName = game:GetService("Workspace"):GetAttribute("PlaceName") or game.Name or ("Place " .. tostring(game.PlaceId))
    local success, productInfo = pcall(function()
        return marketplaceService:GetProductInfo(game.PlaceId)
    end)

    if success and type(productInfo) == "table" and typeof(productInfo.Name) == "string" and productInfo.Name ~= "" then
        cachedHudPlaceName = productInfo.Name
    else
        cachedHudPlaceName = tostring(fallbackName)
    end

    return cachedHudPlaceName
end

local function clearHud()
    disconnectHudConnection("RenderConnection")
    disconnectHudConnection("InputConnection")

    local player = game:GetService("Players").LocalPlayer
    local playerGui = player and (player:FindFirstChildOfClass("PlayerGui") or player:FindFirstChild("PlayerGui"))
    if playerGui then
        local existing = playerGui:FindFirstChild("AllunHud")
        if existing then
            existing:Destroy()
        end
    end

    HudRuntime.Gui = nil
end

local function attachHudDrag(handle, frame)
    disconnectHudConnection("InputConnection")

    local userInputService = game:GetService("UserInputService")
    local dragActive = false
    local dragStart
    local startPos

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragActive = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)

    handle.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragActive = false
        end
    end)

    HudRuntime.InputConnection = userInputService.InputChanged:Connect(function(input)
        if not dragActive then
            return
        end

        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            local delta = input.Position - dragStart
            frame.Position = UDim2.fromOffset(startPos.X.Offset + delta.X, startPos.Y.Offset + delta.Y)
        end
    end)
end

local function createHud2Icon(parent, assetId)
    local iconHolder = Instance.new("Frame")
    iconHolder.Name = "IconHolder"
    iconHolder.Size = UDim2.fromOffset(12, 12)
    iconHolder.BackgroundTransparency = 1
    iconHolder.Parent = parent

    if assetId ~= "" then
        local image = Instance.new("ImageLabel")
        image.Name = "Icon"
        image.BackgroundTransparency = 1
        image.AnchorPoint = Vector2.new(0.5, 0.5)
        image.Position = UDim2.fromScale(0.5, 0.5)
        image.Size = UDim2.fromOffset(12, 12)
        image.Image = assetId
        image.Parent = iconHolder
        return
    end

    local fallback = Instance.new("Frame")
    fallback.Name = "Fallback"
    fallback.AnchorPoint = Vector2.new(0.5, 0.5)
    fallback.Position = UDim2.fromScale(0.5, 0.5)
    fallback.Size = UDim2.fromOffset(8, 8)
    fallback.BackgroundColor3 = Color3.fromRGB(123, 93, 255)
    fallback.BorderSizePixel = 0
    fallback.Parent = iconHolder

    local fallbackCorner = Instance.new("UICorner")
    fallbackCorner.CornerRadius = UDim.new(0, 3)
    fallbackCorner.Parent = fallback

    local fallbackGlow = Instance.new("UIGradient")
    fallbackGlow.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(113, 95, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(83, 63, 214)),
    })
    fallbackGlow.Parent = fallback
end

local function createHud2Segment(parent, width, assetId, defaultText)
    local segment = Instance.new("Frame")
    segment.Name = "Segment"
    segment.Size = UDim2.fromOffset(width, 18)
    segment.BackgroundTransparency = 1
    segment.Parent = parent

    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.VerticalAlignment = Enum.VerticalAlignment.Center
    layout.Padding = UDim.new(0, 6)
    layout.Parent = segment

    createHud2Icon(segment, assetId)

    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Text"
    textLabel.BackgroundTransparency = 1
    textLabel.Size = UDim2.fromOffset(width - 18, 18)
    textLabel.Font = Enum.Font.GothamSemibold
    textLabel.Text = defaultText
    textLabel.TextColor3 = Color3.fromRGB(223, 224, 241)
    textLabel.TextSize = 11
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextTruncate = Enum.TextTruncate.AtEnd
    textLabel.Parent = segment

    return segment, textLabel
end

local function createHud3Stat(parent, width, assetId, defaultText, fallbackKind)
    local stat = Instance.new("Frame")
    stat.Name = "Stat"
    stat.BackgroundTransparency = 1
    stat.Size = UDim2.fromOffset(width, 18)
    stat.Parent = parent

    local iconHolder = Instance.new("Frame")
    iconHolder.BackgroundTransparency = 1
    iconHolder.BorderSizePixel = 0
    iconHolder.Size = UDim2.fromOffset(14, 14)
    iconHolder.Position = UDim2.fromOffset(0, 3)
    iconHolder.Parent = stat

    if assetId ~= "" then
        local icon = Instance.new("ImageLabel")
        icon.Name = "Icon"
        icon.BackgroundTransparency = 1
        icon.AnchorPoint = Vector2.new(0.5, 0.5)
        icon.Position = UDim2.fromScale(0.5, 0.5)
        icon.Size = UDim2.fromOffset(14, 14)
        icon.Image = assetId
        icon.Parent = iconHolder
    elseif fallbackKind == "fps" then
        local shell = Instance.new("Frame")
        shell.BorderSizePixel = 0
        shell.BackgroundColor3 = Color3.fromRGB(110, 149, 255)
        shell.BackgroundTransparency = 0.18
        shell.Position = UDim2.fromOffset(0, 1)
        shell.Size = UDim2.fromOffset(14, 10)
        shell.Parent = iconHolder

        local shellCorner = Instance.new("UICorner")
        shellCorner.CornerRadius = UDim.new(0, 2)
        shellCorner.Parent = shell

        local stand = Instance.new("Frame")
        stand.BorderSizePixel = 0
        stand.BackgroundColor3 = Color3.fromRGB(188, 208, 255)
        stand.Position = UDim2.fromOffset(5, 12)
        stand.Size = UDim2.fromOffset(4, 1)
        stand.Parent = iconHolder

        local function makeBar(x, height)
            local bar = Instance.new("Frame")
            bar.BorderSizePixel = 0
            bar.BackgroundColor3 = Color3.fromRGB(226, 236, 255)
            bar.Position = UDim2.fromOffset(x, 9 - height)
            bar.Size = UDim2.fromOffset(1, height)
            bar.Parent = shell
        end

        makeBar(3, 3)
        makeBar(6, 5)
        makeBar(9, 7)
    elseif fallbackKind == "ping" then
        local function makeArc(size, pos, transparency)
            local arc = Instance.new("Frame")
            arc.BorderSizePixel = 0
            arc.BackgroundColor3 = Color3.fromRGB(104, 142, 255)
            arc.BackgroundTransparency = transparency
            arc.Position = pos
            arc.Size = size
            arc.Parent = iconHolder

            local arcCorner = Instance.new("UICorner")
            arcCorner.CornerRadius = UDim.new(1, 0)
            arcCorner.Parent = arc
        end

        makeArc(UDim2.fromOffset(14, 14), UDim2.fromOffset(0, 0), 0.8)
        makeArc(UDim2.fromOffset(10, 10), UDim2.fromOffset(2, 2), 0.18)

        local dot = Instance.new("Frame")
        dot.BorderSizePixel = 0
        dot.BackgroundColor3 = Color3.fromRGB(232, 238, 255)
        dot.AnchorPoint = Vector2.new(0.5, 0.5)
        dot.Position = UDim2.fromScale(0.5, 0.5)
        dot.Size = UDim2.fromOffset(4, 4)
        dot.Parent = iconHolder

        local dotCorner = Instance.new("UICorner")
        dotCorner.CornerRadius = UDim.new(1, 0)
        dotCorner.Parent = dot
    end

    local value = Instance.new("TextLabel")
    value.Name = "Value"
    value.BackgroundTransparency = 1
    value.Position = UDim2.fromOffset(20, 0)
    value.Size = UDim2.fromOffset(width - 20, 18)
    value.Font = Enum.Font.GothamMedium
    value.Text = defaultText
    value.TextColor3 = Color3.fromRGB(228, 233, 245)
    value.TextSize = 11
    value.TextXAlignment = Enum.TextXAlignment.Left
    value.TextYAlignment = Enum.TextYAlignment.Center
    value.TextTruncate = Enum.TextTruncate.AtEnd
    value.Parent = stat

    return stat, value
end

local function createHud1(screenGui, player)
    local frame = Instance.new("Frame")
    frame.Name = "Container"
    frame.Position = UDim2.fromOffset(22, 20)
    frame.Size = UDim2.fromOffset(350, 50)
    frame.BackgroundColor3 = Color3.fromRGB(12, 13, 18)
    frame.BackgroundTransparency = 0.02
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(50, 56, 74)
    stroke.Transparency = 0.28
    stroke.Thickness = 1
    stroke.Parent = frame

    local gradient = Instance.new("UIGradient")
    gradient.Rotation = 0
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 20, 29)),
        ColorSequenceKeypoint.new(0.35, Color3.fromRGB(12, 13, 20)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(9, 10, 15)),
    })
    gradient.Parent = frame

    local brand = Instance.new("Frame")
    brand.Name = "Brand"
    brand.Position = UDim2.fromOffset(8, 7)
    brand.Size = UDim2.fromOffset(96, 36)
    brand.BackgroundColor3 = Color3.fromRGB(14, 16, 24)
    brand.BorderSizePixel = 0
    brand.Parent = frame

    local brandCorner = Instance.new("UICorner")
    brandCorner.CornerRadius = UDim.new(1, 0)
    brandCorner.Parent = brand

    local brandStroke = Instance.new("UIStroke")
    brandStroke.Color = Color3.fromRGB(52, 58, 76)
    brandStroke.Transparency = 0.22
    brandStroke.Thickness = 1
    brandStroke.Parent = brand

    local brandContent = Instance.new("Frame")
    brandContent.Name = "Content"
    brandContent.BackgroundTransparency = 1
    brandContent.AnchorPoint = Vector2.new(0.5, 0.5)
    brandContent.Position = UDim2.fromScale(0.5, 0.5)
    brandContent.Size = UDim2.fromOffset(68, 18)
    brandContent.Parent = brand

    local brandLayout = Instance.new("UIListLayout")
    brandLayout.FillDirection = Enum.FillDirection.Horizontal
    brandLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    brandLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    brandLayout.Padding = UDim.new(0, 6)
    brandLayout.Parent = brandContent

    local logoHolder = Instance.new("Frame")
    logoHolder.Size = UDim2.fromOffset(14, 14)
    logoHolder.BackgroundColor3 = Color3.fromRGB(19, 26, 46)
    logoHolder.BorderSizePixel = 0
    logoHolder.Parent = brandContent

    local logoHolderCorner = Instance.new("UICorner")
    logoHolderCorner.CornerRadius = UDim.new(1, 0)
    logoHolderCorner.Parent = logoHolder

    local logo = Instance.new("ImageLabel")
    logo.Name = "Logo"
    logo.BackgroundTransparency = 1
    logo.Position = UDim2.fromScale(0.5, 0.5)
    logo.AnchorPoint = Vector2.new(0.5, 0.5)
    logo.Size = UDim2.fromOffset(12, 12)
    logo.Image = HUD_LOGO_IMAGE
    logo.Parent = logoHolder

    local title = Instance.new("TextLabel")
    title.BackgroundTransparency = 1
    title.Size = UDim2.fromOffset(46, 18)
    title.Font = Enum.Font.GothamBold
    title.Text = "Allun"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextYAlignment = Enum.TextYAlignment.Center
    title.Parent = brandContent

    local titleGradient = Instance.new("UIGradient")
    titleGradient.Rotation = 0
    titleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(142, 161, 255)),
        ColorSequenceKeypoint.new(0.55, Color3.fromRGB(112, 127, 245)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(90, 108, 228)),
    })
    titleGradient.Parent = title

    local stats = Instance.new("TextLabel")
    stats.Name = "Stats"
    stats.BackgroundTransparency = 1
    stats.Position = UDim2.fromOffset(112, 0)
    stats.Size = UDim2.fromOffset(222, 50)
    stats.Font = Enum.Font.Gotham
    stats.Text = "Ping --   FPS --   Username " .. player.Name
    stats.TextColor3 = Color3.fromRGB(226, 231, 243)
    stats.TextSize = 11
    stats.TextXAlignment = Enum.TextXAlignment.Left
    stats.TextTruncate = Enum.TextTruncate.AtEnd
    stats.Parent = frame

    attachHudDrag(brand, frame)

    return function(data)
        stats.Text = string.format("Ping %s  |  FPS %d  |  Username %s", data.ping, data.fps, trimHudText(data.username, 14))
    end
end

local function createHud2(screenGui, player)
    local frame = Instance.new("Frame")
    frame.Name = "Container"
    frame.Position = UDim2.fromOffset(22, 20)
    frame.Size = UDim2.fromOffset(418, 46)
    frame.BackgroundColor3 = Color3.fromRGB(16, 11, 26)
    frame.BackgroundTransparency = 0.03
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 14)
    corner.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(90, 60, 140)
    stroke.Transparency = 0.12
    stroke.Thickness = 1
    stroke.Parent = frame

    local gradient = Instance.new("UIGradient")
    gradient.Rotation = 0
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(69, 37, 108)),
        ColorSequenceKeypoint.new(0.1, Color3.fromRGB(36, 23, 60)),
        ColorSequenceKeypoint.new(0.42, Color3.fromRGB(19, 14, 32)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 10, 20)),
    })
    gradient.Parent = frame

    local innerGlow = Instance.new("Frame")
    innerGlow.Name = "InnerGlow"
    innerGlow.BackgroundColor3 = Color3.fromRGB(111, 80, 182)
    innerGlow.BackgroundTransparency = 0.88
    innerGlow.BorderSizePixel = 0
    innerGlow.Size = UDim2.new(1, -8, 1, -10)
    innerGlow.Position = UDim2.fromOffset(4, 5)
    innerGlow.Parent = frame

    local innerCorner = Instance.new("UICorner")
    innerCorner.CornerRadius = UDim.new(0, 12)
    innerCorner.Parent = innerGlow

    local brand = Instance.new("Frame")
    brand.Name = "Brand"
    brand.BackgroundTransparency = 1
    brand.Size = UDim2.fromOffset(80, 18)
    brand.Position = UDim2.fromOffset(14, 14)
    brand.Parent = frame

    local brandLayout = Instance.new("UIListLayout")
    brandLayout.FillDirection = Enum.FillDirection.Horizontal
    brandLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    brandLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    brandLayout.Padding = UDim.new(0, 5)
    brandLayout.Parent = brand

    local brandLogo = Instance.new("ImageLabel")
    brandLogo.Name = "Logo"
    brandLogo.BackgroundTransparency = 1
    brandLogo.Size = UDim2.fromOffset(11, 11)
    brandLogo.Image = HUD_LOGO_IMAGE
    brandLogo.ImageTransparency = 0
    brandLogo.Parent = brand

    local brandTextHolder = Instance.new("Frame")
    brandTextHolder.Name = "TextHolder"
    brandTextHolder.BackgroundTransparency = 1
    brandTextHolder.Size = UDim2.fromOffset(50, 18)
    brandTextHolder.Parent = brand

    local brandGlow = Instance.new("TextLabel")
    brandGlow.Name = "Glow"
    brandGlow.BackgroundTransparency = 1
    brandGlow.Position = UDim2.fromOffset(0, 1)
    brandGlow.Size = UDim2.fromScale(1, 1)
    brandGlow.Font = Enum.Font.GothamBold
    brandGlow.Text = "Allun"
    brandGlow.TextColor3 = Color3.fromRGB(16, 19, 34)
    brandGlow.TextTransparency = 0.42
    brandGlow.TextStrokeTransparency = 1
    brandGlow.TextSize = 12
    brandGlow.TextXAlignment = Enum.TextXAlignment.Left
    brandGlow.TextYAlignment = Enum.TextYAlignment.Center
    brandGlow.Parent = brandTextHolder

    local brandText = Instance.new("TextLabel")
    brandText.Name = "Text"
    brandText.BackgroundTransparency = 1
    brandText.Size = UDim2.fromScale(1, 1)
    brandText.Font = Enum.Font.GothamBold
    brandText.Text = "Allun"
    brandText.TextColor3 = Color3.fromRGB(255, 255, 255)
    brandText.TextSize = 12
    brandText.TextXAlignment = Enum.TextXAlignment.Left
    brandText.TextYAlignment = Enum.TextYAlignment.Center
    brandText.Parent = brandTextHolder

    local brandGradient = Instance.new("UIGradient")
    brandGradient.Rotation = 0
    brandGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 24, 38)),
        ColorSequenceKeypoint.new(0.34, Color3.fromRGB(116, 137, 255)),
        ColorSequenceKeypoint.new(0.68, Color3.fromRGB(20, 22, 36)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(84, 106, 236)),
    })
    brandGradient.Parent = brandText

    local function createDivider()
        local divider = Instance.new("Frame")
        divider.Name = "Divider"
        divider.Size = UDim2.fromOffset(1, 13)
        divider.BackgroundColor3 = Color3.fromRGB(96, 86, 118)
        divider.BackgroundTransparency = 0.44
        divider.BorderSizePixel = 0
        divider.Parent = frame
        return divider
    end

    local divider1 = createDivider()
    local userSegment, userLabel = createHud2Segment(frame, 90, HUD_STYLE_2_ASSETS.UserIcon, player.Name)
    local divider2 = createDivider()
    local placeSegment, placeLabel = createHud2Segment(frame, 124, HUD_STYLE_2_ASSETS.PlaceIcon, getHudPlaceName())
    local divider3 = createDivider()
    local fpsSegment, fpsLabel = createHud2Segment(frame, 52, HUD_STYLE_2_ASSETS.FpsIcon, "0fps")

    attachHudDrag(frame, frame)

    local function setSegmentWidth(segment, label, width)
        segment.Size = UDim2.fromOffset(width, 18)
        label.Size = UDim2.fromOffset(math.max(18, width - 18), 18)
    end

    return function(data)
        local userText = trimHudText(data.username, 10)
        local placeText = trimHudText(data.place, 14)
        local fpsText = string.format("%d fps", data.fps)

        userLabel.Text = userText
        placeLabel.Text = placeText
        fpsLabel.Text = fpsText

        local userWidth = math.clamp(getHudTextWidth(userText, Enum.Font.GothamSemibold, 11) + 22, 72, 98)
        local placeWidth = math.clamp(getHudTextWidth(placeText, Enum.Font.GothamSemibold, 11) + 22, 92, 138)
        local fpsWidth = math.clamp(getHudTextWidth(fpsText, Enum.Font.GothamSemibold, 11) + 22, 50, 70)

        setSegmentWidth(userSegment, userLabel, userWidth)
        setSegmentWidth(placeSegment, placeLabel, placeWidth)
        setSegmentWidth(fpsSegment, fpsLabel, fpsWidth)

        brandGradient.Offset = Vector2.new(math.sin((data.time or 0) * 1.15) * 0.22, 0)

        local leftPadding = 14
        local gap = 7
        local dividerWidth = 1
        local brandWidth = 80
        local baseY = 14

        divider1.Position = UDim2.fromOffset(leftPadding + brandWidth + gap, 16)
        userSegment.Position = UDim2.fromOffset(leftPadding + brandWidth + gap + dividerWidth + gap, baseY)
        divider2.Position = UDim2.fromOffset(leftPadding + brandWidth + gap + dividerWidth + gap + userWidth + gap, 16)
        placeSegment.Position = UDim2.fromOffset(leftPadding + brandWidth + gap + dividerWidth + gap + userWidth + gap + dividerWidth + gap, baseY)
        divider3.Position = UDim2.fromOffset(leftPadding + brandWidth + gap + dividerWidth + gap + userWidth + gap + dividerWidth + gap + placeWidth + gap, 16)
        fpsSegment.Position = UDim2.fromOffset(leftPadding + brandWidth + gap + dividerWidth + gap + userWidth + gap + dividerWidth + gap + placeWidth + gap + dividerWidth + gap, baseY)

        local totalWidth = leftPadding + brandWidth + gap + dividerWidth + gap + userWidth + gap + dividerWidth + gap + placeWidth + gap + dividerWidth + gap + fpsWidth + 14
        frame.Size = UDim2.fromOffset(totalWidth, 46)
    end
end

local function createHud3(screenGui, player)
    local frame = Instance.new("Frame")
    frame.Name = "Container"
    frame.Position = UDim2.fromOffset(22, 20)
    frame.Size = UDim2.fromOffset(214, 34)
    frame.BackgroundColor3 = Color3.fromRGB(29, 25, 53)
    frame.BackgroundTransparency = 0.14
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 7)
    corner.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(96, 87, 176)
    stroke.Transparency = 0.32
    stroke.Thickness = 1
    stroke.Parent = frame

    local gradient = Instance.new("UIGradient")
    gradient.Rotation = 0
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(92, 112, 196)),
        ColorSequenceKeypoint.new(0.22, Color3.fromRGB(42, 48, 86)),
        ColorSequenceKeypoint.new(0.62, Color3.fromRGB(20, 23, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 12, 21)),
    })
    gradient.Parent = frame

    local leftGlow = Instance.new("Frame")
    leftGlow.Name = "LeftGlow"
    leftGlow.BackgroundColor3 = Color3.fromRGB(125, 90, 216)
    leftGlow.BackgroundTransparency = 0.7
    leftGlow.BorderSizePixel = 0
    leftGlow.Position = UDim2.fromOffset(0, 0)
    leftGlow.Size = UDim2.fromOffset(110, 34)
    leftGlow.Parent = frame

    local leftGlowCorner = Instance.new("UICorner")
    leftGlowCorner.CornerRadius = UDim.new(0, 7)
    leftGlowCorner.Parent = leftGlow

    local leftGlowGradient = Instance.new("UIGradient")
    leftGlowGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(131, 96, 224)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(131, 96, 224)),
    })
    leftGlowGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.08),
        NumberSequenceKeypoint.new(0.75, 0.78),
        NumberSequenceKeypoint.new(1, 1),
    })
    leftGlowGradient.Parent = leftGlow

    local innerLine = Instance.new("Frame")
    innerLine.Name = "InnerLine"
    innerLine.BackgroundColor3 = Color3.fromRGB(133, 112, 219)
    innerLine.BackgroundTransparency = 0.72
    innerLine.BorderSizePixel = 0
    innerLine.Position = UDim2.fromOffset(1, 1)
    innerLine.Size = UDim2.new(1, -2, 0, 1)
    innerLine.Parent = frame

    local brand = Instance.new("Frame")
    brand.Name = "Brand"
    brand.BackgroundTransparency = 1
    brand.BorderSizePixel = 0
    brand.Position = UDim2.fromOffset(10, 8)
    brand.Size = UDim2.fromOffset(62, 18)
    brand.Parent = frame

    local brandIconHolder = Instance.new("Frame")
    brandIconHolder.Name = "BrandIconHolder"
    brandIconHolder.Size = UDim2.fromOffset(14, 14)
    brandIconHolder.BackgroundTransparency = 1
    brandIconHolder.BorderSizePixel = 0
    brandIconHolder.Position = UDim2.fromOffset(0, 3)
    brandIconHolder.Parent = brand

    local brandIconId = HUD_STYLE_3_ASSETS.BrandIcon ~= "" and HUD_STYLE_3_ASSETS.BrandIcon or HUD_LOGO_IMAGE
    if brandIconId ~= "" then
        local brandIcon = Instance.new("ImageLabel")
        brandIcon.Name = "BrandIcon"
        brandIcon.BackgroundTransparency = 1
        brandIcon.AnchorPoint = Vector2.new(0.5, 0.5)
        brandIcon.Position = UDim2.fromScale(0.5, 0.5)
        brandIcon.Size = UDim2.fromOffset(14, 14)
        brandIcon.Image = brandIconId
        brandIcon.Parent = brandIconHolder
    end

    local brandText = Instance.new("TextLabel")
    brandText.Name = "BrandText"
    brandText.BackgroundTransparency = 1
    brandText.Position = UDim2.fromOffset(19, 2)
    brandText.Size = UDim2.fromOffset(40, 16)
    brandText.Font = Enum.Font.GothamSemibold
    brandText.Text = "Allun"
    brandText.TextColor3 = Color3.fromRGB(229, 231, 241)
    brandText.TextSize = 11
    brandText.TextXAlignment = Enum.TextXAlignment.Left
    brandText.TextYAlignment = Enum.TextYAlignment.Center
    brandText.Parent = brand

    local brandGradient = Instance.new("UIGradient")
    brandGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(243, 246, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(190, 199, 255)),
    })
    brandGradient.Parent = brandText

    local function createDivider()
        local divider = Instance.new("Frame")
        divider.BackgroundColor3 = Color3.fromRGB(126, 118, 190)
        divider.BackgroundTransparency = 0.34
        divider.BorderSizePixel = 0
        divider.Size = UDim2.fromOffset(1, 12)
        divider.Parent = frame

        local dividerGradient = Instance.new("UIGradient")
        dividerGradient.Rotation = 90
        dividerGradient.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.25, 0.45),
            NumberSequenceKeypoint.new(0.75, 0.45),
            NumberSequenceKeypoint.new(1, 1),
        })
        dividerGradient.Parent = divider

        return divider
    end

    local divider1 = createDivider()
    local fpsStat, fpsText = createHud3Stat(frame, 62, HUD_STYLE_3_ASSETS.FpsIcon, "0Fps", "fps")
    fpsStat.Position = UDim2.fromOffset(111, 9)

    local divider2 = createDivider()
    local pingStat, pingText = createHud3Stat(frame, 60, HUD_STYLE_3_ASSETS.PingIcon, "0ms", "ping")
    pingStat.Position = UDim2.fromOffset(170, 9)

    attachHudDrag(frame, frame)

    return function(data)
        local fpsValue = string.format("%dFps", data.fps)
        local pingValue = string.format("%sms", data.ping)

        fpsText.Text = fpsValue
        pingText.Text = pingValue

        gradient.Offset = Vector2.new(math.sin((data.time or 0) * 1.08) * 0.26, 0)
        leftGlowGradient.Offset = Vector2.new(math.sin((data.time or 0) * 1.08) * 0.14, 0)

        local brandWidth = math.max(58, 19 + getHudTextWidth("Allun", Enum.Font.GothamSemibold, 11) + 2)
        local fpsWidth = math.clamp(getHudTextWidth(fpsValue, Enum.Font.GothamMedium, 11) + 24, 58, 82)
        local pingWidth = math.clamp(getHudTextWidth(pingValue, Enum.Font.GothamMedium, 11) + 24, 56, 84)

        brand.Size = UDim2.fromOffset(brandWidth, 18)
        brandText.Size = UDim2.fromOffset(math.max(28, brandWidth - 19), 16)
        fpsStat.Size = UDim2.fromOffset(fpsWidth, 18)
        fpsText.Size = UDim2.fromOffset(fpsWidth - 20, 18)
        pingStat.Size = UDim2.fromOffset(pingWidth, 18)
        pingText.Size = UDim2.fromOffset(pingWidth - 20, 18)

        local leftPad = 10
        local dividerGap = 8
        local statGap = 7

        brand.Position = UDim2.fromOffset(leftPad, 8)
        divider1.Position = UDim2.fromOffset(leftPad + brandWidth + dividerGap, 11)
        fpsStat.Position = UDim2.fromOffset(leftPad + brandWidth + dividerGap + statGap, 9)
        divider2.Position = UDim2.fromOffset(leftPad + brandWidth + dividerGap + statGap + fpsWidth + dividerGap, 11)
        pingStat.Position = UDim2.fromOffset(leftPad + brandWidth + dividerGap + statGap + fpsWidth + dividerGap + statGap, 9)

        frame.Size = UDim2.fromOffset(leftPad + brandWidth + dividerGap + statGap + fpsWidth + dividerGap + statGap + pingWidth + 10, 34)
    end
end

local function createHud()
    local playerService = game:GetService("Players")
    local runService = game:GetService("RunService")
    local statsService = game:GetService("Stats")
    local player = playerService.LocalPlayer
    local playerGui = player:FindFirstChildOfClass("PlayerGui") or player:WaitForChild("PlayerGui")

    clearHud()

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AllunHud"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = playerGui
    HudRuntime.Gui = screenGui

    local updateDisplay
    if HUD_STYLE == "Style 3" then
        updateDisplay = createHud3(screenGui, player)
    elseif HUD_STYLE == "Style 2" then
        updateDisplay = createHud2(screenGui, player)
    else
        updateDisplay = createHud1(screenGui, player)
    end

    local lastFrame = os.clock()
    local sampleTime = 0
    local sampleFrames = 0
    local currentFps = 0
    local currentPing = "--"
    local statsItem = nil
    pcall(function()
        statsItem = statsService.Network.ServerStatsItem["Data Ping"]
    end)

    HudRuntime.RenderConnection = runService.RenderStepped:Connect(function()
        local now = os.clock()
        local dt = now - lastFrame
        lastFrame = now

        sampleTime += dt
        sampleFrames += 1

        if sampleTime >= 0.25 then
            currentFps = math.floor((sampleFrames / math.max(sampleTime, 0.001)) + 0.5)
            sampleTime = 0
            sampleFrames = 0

            if statsItem then
                local ok, pingValue = pcall(function()
                    return math.floor(statsItem:GetValue() + 0.5)
                end)
                if ok then
                    currentPing = tostring(pingValue)
                end
            end
        end

        updateDisplay({
            ping = currentPing,
            fps = currentFps,
            username = player.Name,
            place = getHudPlaceName(),
            time = now,
        })
    end)
end

SettingsBox:AddDropdown("HudStylePreset", {
    Text = "HUD style",
    Values = { "Style 1", "Style 2", "Style 3" },
    Default = HUD_STYLE,
    Callback = function(Value)
        HUD_STYLE = Value
        local ok, err = pcall(createHud)
        if not ok then
            warn("Allun HUD failed to switch: " .. tostring(err))
        end
    end,
})

applyPalette(DEFAULT_PALETTE)
applyCornerRadius(DEFAULT_RADIUS)
task.spawn(hideTopHandle)
task.spawn(function()
    local ok, err = pcall(createHud)
    if not ok then
        warn("Allun HUD failed to load: " .. tostring(err))
    end
end)

-- Imported function port for Allun.lua
do
    local state = AllunFunctions.state
    local refs = AllunFunctions.refs
    local RunService = refs.RunService
    local Players = refs.Players
    local UserInputService = refs.UserInputService
    local ReplicatedStorage = refs.ReplicatedStorage
    local Debris = refs.Debris
    local MergedHubPort = AllunFunctions.MergedHub or {}

    AllunFunctions.MergedHub = MergedHubPort

    local vu1 = RunService
    local vu2 = Players
    local vu3 = ReplicatedStorage
    local vu4 = Debris
    local GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents")
    local MenuToys = ReplicatedStorage:WaitForChild("MenuToys")
    local CharacterEvents = ReplicatedStorage:WaitForChild("CharacterEvents")
    local OrionLib = OrionLib or {
        MakeNotification = function()
        end,
    }
    local vu5 = GrabEvents:WaitForChild("SetNetworkOwner")
    local DestroyToy = MenuToys:WaitForChild("DestroyToy")
    local CreateLine = GrabEvents:WaitForChild("CreateGrabLine")
    local DestroyLine = GrabEvents:WaitForChild("DestroyGrabLine")
    local localPlayer = Players.LocalPlayer
    local player = localPlayer
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
    local playerCharacter = state.playerCharacter
    local vu22 = state.toysFolder
    local ownedToys = state.ownedToys
    local bombList = state.bombList
    local playerList = state.playerList
    local anchoredParts = state.anchoredParts
    local anchoredConnections = state.anchoredConnections
    local compiledGroups = state.compiledGroups
    local compileConnections = state.compileConnections
    local renderSteppedConnections = state.renderSteppedConnections
    local auraRadius = state.auraRadius
    local lightbitradius = state.lightbitradius
    local usingradius = state.usingradius
    local originalProperties = {}
    local highlightColor = Color3.fromRGB(128, 0, 128)
    local highlightTransparency = 0.5
    local replicatedStorage = ReplicatedStorage
    local updateLineColorsEvent = nil
    local fireAnimationTrack = nil
    local teleportActive = false
    local InfiniteJumpEnabled = false
    local vu178 = RunService
    local vu179 = Players
    local vu190 = ReplicatedStorage
    local vu191 = RunService
    local vu361 = RunService
    local vu362 = Players
    mouseTeleportInitialized = false
    beamCycleEnabled = false
    isLagging = false
    lagSpeed = 0.05
    grabEnabled = false
    grabSpeed = 0.1
    looping = false
    isLooping = false
    loopInterval = 0.4
    players = Players
    vu326 = GrabEvents
    vu327 = 0.5
    toggle = false
    angles = {}
    isFollowActive = false
    followDistance = 18
    followSpeed = 4
    vu547 = Players
    vu548 = RunService
    vu549 = workspace.CurrentCamera
    vu550 = false
    vu551 = 30
    vu552 = nil
    vu553 = nil
    playerNames = {}
    playerInfoEnabled = false
    vu516 = localPlayer
    head = character and character:FindFirstChild("Head")
    humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
    camera = workspace.CurrentCamera
    noclipEnabled = false
    depth = 20
    cameraOffset = 10
    effectDuration = 3
    effectColorSpeed = 3
    minSpeed = 0.2
    maxSpeed = 2
    audioDuration = 10
    initialized = true
    antiVoidEnabled = false
    safePosition = Vector3.new(0, 50, 0)
    voidYLevel = -50
    screenGui = nil
    infoBox = nil
    imageLabel = nil
    messageLabel = nil
    sound = nil
    rainbowColors = {
        Color3.fromRGB(255, 0, 0),
        Color3.fromRGB(255, 127, 0),
        Color3.fromRGB(255, 255, 0),
        Color3.fromRGB(0, 255, 0),
        Color3.fromRGB(0, 0, 255),
        Color3.fromRGB(75, 0, 130),
        Color3.fromRGB(148, 0, 211),
    }
    toggleActiveAntiKick = false
    antiKickLoopStarted = false
    toggleActiveAntiGrabAndBlobman = false
    autoStruggleCoroutine = nil
    vu675 = nil
    vu676 = 10
    vu677 = 1000
    vu680 = ReplicatedStorage
    vu682 = CharacterEvents:WaitForChild("Struggle")
    vu932 = Players
    LocalPlayer = localPlayer
    GrabRange = 50
    grabbedPlayers = {}
    vu933 = nil
    vu934 = 6000
    GrabEvent = GrabEvents:WaitForChild("SetNetworkOwner")
    whitelist = {}
    vu1207 = Players
    vu1208 = ReplicatedStorage
    vu1209 = false
    vu1210 = false
    vu1211 = nil
    vu1272 = Players
    vu1273 = false
    vu1274 = nil
    spawnerPlayer = nil
    vu1275 = {}
    vu1276 = localPlayer.Name
    vu1277 = {}
    loopActive = false
    noclipConnection = nil
    hum = humanoidRootPart
    mouse = nil

    local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui") or localPlayer:WaitForChild("PlayerGui")
    screenGui = playerGui:FindFirstChild("AllunMergedOverlay")
    if not screenGui then
        screenGui = Instance.new("ScreenGui")
        screenGui.Name = "AllunMergedOverlay"
        screenGui.ResetOnSpawn = false
        screenGui.Parent = playerGui
    end

    infoBox = screenGui:FindFirstChild("InfoBox")
    if not infoBox then
        infoBox = Instance.new("Frame")
        infoBox.Name = "InfoBox"
        infoBox.Position = UDim2.new(1, -150, 1, -150)
        infoBox.Size = UDim2.new(0, 150, 0, 150)
        infoBox.BackgroundTransparency = 0.5
        infoBox.BackgroundColor3 = Color3.new(0, 0, 0)
        infoBox.Visible = false
        infoBox.Parent = screenGui
    end

    imageLabel = infoBox:FindFirstChild("ImageLabel")
    if not imageLabel then
        imageLabel = Instance.new("ImageLabel")
        imageLabel.Name = "ImageLabel"
        imageLabel.Size = UDim2.new(1, 0, 1, 0)
        imageLabel.Position = UDim2.new(0, 0, 0, 0)
        imageLabel.BackgroundTransparency = 1
        imageLabel.Image = "rbxassetid://75142123538746"
        imageLabel.ScaleType = Enum.ScaleType.Stretch
        imageLabel.Parent = infoBox
    end

    messageLabel = infoBox:FindFirstChild("MessageLabel")
    if not messageLabel then
        messageLabel = Instance.new("TextLabel")
        messageLabel.Name = "MessageLabel"
        messageLabel.Size = UDim2.new(1, 0, 1, 0)
        messageLabel.Position = UDim2.new(0, 0, 0, 0)
        messageLabel.BackgroundTransparency = 1
        messageLabel.Font = Enum.Font.SourceSansBold
        messageLabel.TextSize = 16
        messageLabel.TextWrapped = true
        messageLabel.TextColor3 = Color3.new(1, 1, 1)
        messageLabel.Text = ""
        messageLabel.Parent = infoBox
    end

    sound = infoBox:FindFirstChild("LoopSound")
    if not sound then
        sound = Instance.new("Sound")
        sound.Name = "LoopSound"
        sound.SoundId = "rbxassetid://8887499160"
        sound.Volume = 1
        sound.Looped = true
        sound.Parent = infoBox
    end

    pcall(function()
        updateLineColorsEvent = replicatedStorage:WaitForChild("DataEvents"):WaitForChild("UpdateLineColorsEvent")
    end)

    pcall(function()
        local fireFlailAnimation = game:GetService("ReplicatedFirst"):WaitForChild("CatchFire"):WaitForChild("FireFlailAnimation")
        if animator then
            fireAnimationTrack = animator:LoadAnimation(fireFlailAnimation)
        end
    end)

    localPlayer.CharacterAdded:Connect(function(newCharacter)
        playerCharacter = newCharacter
        player = localPlayer
        character = newCharacter
        humanoid = character and character:FindFirstChildOfClass("Humanoid")
        animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
        head = character and character:FindFirstChild("Head")
        humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
        hum = humanoidRootPart
        camera = workspace.CurrentCamera
        fireAnimationTrack = nil
        pcall(function()
            local fireFlailAnimation = game:GetService("ReplicatedFirst"):WaitForChild("CatchFire"):WaitForChild("FireFlailAnimation")
            if animator then
                fireAnimationTrack = animator:LoadAnimation(fireFlailAnimation)
            end
        end)
        state.playerCharacter = newCharacter
    end)

    function playFireFlailAnimation()
        if fireAnimationTrack then
            fireAnimationTrack:Play()
        end
    end
    MergedHubPort.playFireFlailAnimation = playFireFlailAnimation

    function stopFireFlailAnimation()
        if fireAnimationTrack then
            fireAnimationTrack:Stop()
        end
    end
    MergedHubPort.stopFireFlailAnimation = stopFireFlailAnimation

    function setupCharacter(p29)
        hum = p29:WaitForChild("HumanoidRootPart")
        mouse = game.Players.LocalPlayer:GetMouse()
        mouse.KeyDown:Connect(function(p30)
            if p30 == "z" and (teleportActive and mouse.Target) then
                hum.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0, 5, 0))
            end
        end)
    end
    MergedHubPort.setupCharacter = setupCharacter

    function randomColor()
        return Color3.new(math.random(), math.random(), math.random())
    end
    MergedHubPort.randomColor = randomColor

    function generateRandomColorSequence()
        local colorSequenceKeypoints = {}
        for v32 = 0, 1, 0.1 do
            table.insert(colorSequenceKeypoints, ColorSequenceKeypoint.new(v32, randomColor()))
        end
        return ColorSequence.new(colorSequenceKeypoints)
    end
    MergedHubPort.generateRandomColorSequence = generateRandomColorSequence

    function updateBeamColors()
        if not updateLineColorsEvent then
            return
        end
        local v33 = {
            generateRandomColorSequence()
        }
        updateLineColorsEvent:FireServer(unpack(v33))
    end
    MergedHubPort.updateBeamColors = updateBeamColors

    function DestroyT(p35)
        local v36 = p35 or vu22:FindFirstChildWhichIsA("Model")
        DestroyToy:FireServer(v36)
    end
    AllunFunctions.DestroyT = DestroyT

    function onPlayerAdded(p37)
        table.insert(playerList, p37.Name)
    end
    AllunFunctions.onPlayerAdded = onPlayerAdded

    function onPlayerRemoving(p38)
        local v39, v40, v41 = ipairs(playerList)
        while true do
            local v42
            v41, v42 = v39(v40, v41)
            if v41 == nil then
                break
            end
            if v42 == p38.Name then
                table.remove(playerList, v41)
                break
            end
        end
    end
    AllunFunctions.onPlayerRemoving = onPlayerRemoving

    function getNearestPlayer()
        local v48 = math.huge
        local v49 = vu2
        local v50, v51, v52 = pairs(v49:GetPlayers())
        local v53 = nil
        while true do
            local v54
            v52, v54 = v50(v51, v52)
            if v52 == nil then
                break
            end
            if v54 ~= localPlayer and v54.Character and v54.Character:FindFirstChild("HumanoidRootPart") then
                local v55 = (playerCharacter.HumanoidRootPart.Position - v54.Character.HumanoidRootPart.Position).Magnitude
                if v55 < v48 then
                    v53 = v54
                    v48 = v55
                end
            end
        end
        return v53
    end
    AllunFunctions.getNearestPlayer = getNearestPlayer

    function spawnItemCf(pu56, pu57)
        task.spawn(function()
            local v58 = Vector3.new(0, 0, 0)
            vu3.MenuToys.SpawnToyRemoteFunction:InvokeServer(pu56, pu57, v58)
        end)
    end
    AllunFunctions.spawnItemCf = spawnItemCf

    local function vu78(p59)
        if p59 then
            if not ownedToys[_G.ToyToLoad] then
                OrionLib:MakeNotification({
                    Name = "Missing toy",
                    Content = "You do not own the " .. _G.ToyToLoad .. " toy.",
                    Image = "rbxassetid://4483345998",
                    Time = 3
                })
                return
            end
            if not vu8 then
                vu8 = coroutine.create(function()
                    vu7 = vu22.ChildAdded:Connect(function(pu60)
                        if pu60.Name == _G.ToyToLoad and (pu60:WaitForChild("ThisToysNumber", 1) and pu60.ThisToysNumber.Value == vu22.ToyNumber.Value - 1) then
                            local vu61 = nil
                            vu61 = vu22.ChildRemoved:Connect(function(p62)
                                if p62 == pu60 then
                                    vu61:Disconnect()
                                end
                            end)
                            vu5:FireServer(pu60.Body, pu60.Body.CFrame)
                            local v63 = pu60.Body:WaitForChild("PartOwner", 0.5)
                            pu60.DescendantAdded:Connect(function(p64)
                                if p64.Name == "PartOwner" and p64.Value ~= localPlayer.Name then
                                    DestroyT(pu60)
                                    connection:Disconnect()
                                end
                            end)
                            vu4:AddItem(connectio, 60)
                            if v63 and v63.Value == localPlayer.Name then
                                local v65, v66, v67 = pairs(pu60:GetChildren())
                                local v68 = vu61
                                while true do
                                    local v69
                                    v67, v69 = v65(v66, v67)
                                    if v67 == nil then
                                        break
                                    end
                                    if v69:IsA("BasePart") then
                                        v69.CanCollide = false
                                    end
                                end
                                pu60:SetPrimaryPartCFrame(CFrame.new(- 72.9304581, - 3.96906614, - 265.543732))
                                wait(0.2)
                                local v70, v71, v72 = pairs(pu60:GetChildren())
                                while true do
                                    local v73
                                    v72, v73 = v70(v71, v72)
                                    if v72 == nil then
                                        break
                                    end
                                    if v73:IsA("BasePart") then
                                        v73.Anchored = true
                                    end
                                end
                                table.insert(bombList, pu60)
                                pu60.AncestryChanged:Connect(function()
                                    if not pu60.Parent then
                                        local v74, v75, v76 = ipairs(bombList)
                                        while true do
                                            local v77
                                            v76, v77 = v74(v75, v76)
                                            if v76 == nil then
                                                break
                                            end
                                            if v77 == pu60 then
                                                table.remove(bombList, v76)
                                                break
                                            end
                                        end
                                    end
                                end)
                                v68:Disconnect()
                            else
                                DestroyT(pu60)
                            end
                        end
                    end)
                    while true do
                        if localPlayer.CanSpawnToy and (localPlayer.CanSpawnToy.Value and # bombList < _G.MaxMissiles) and playerCharacter:FindFirstChild("Head") then
                            spawnItemCf(_G.ToyToLoad, playerCharacter.Head.CFrame or playerCharacter.HumanoidRootPart.CFrame)
                        end
                        vu1.Heartbeat:Wait()
                    end
                end)
                coroutine.resume(vu8)
            end
        else
            if vu8 then
                coroutine.close(vu8)
                vu8 = nil
            end
            if vu7 then
                vu7:Disconnect()
            end
        end
    end
    MergedHubPort.vu78 = vu78

    function enableGraphics()
        Lighting = game:GetService("Lighting")
        Lighting.Brightness = 2.14
        Lighting.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
        Lighting.ColorShift_Top = Color3.fromRGB(240, 127, 14)
        Lighting.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
        Lighting.ClockTime = 6.7
        Lighting.FogColor = Color3.fromRGB(94, 76, 106)
        Lighting.FogEnd = 1000
        Lighting.FogStart = 0
        Lighting.ExposureCompensation = 0.24
        Lighting.ShadowSoftness = 0
        Lighting.Ambient = Color3.fromRGB(59, 33, 27)
        Bloom = Instance.new("BloomEffect")
        Bloom.Intensity = 0.1
        Bloom.Threshold = 0
        Bloom.Size = 100
        Bloom.Parent = Lighting
        Blur = Instance.new("BlurEffect")
        Blur.Size = 2
        Blur.Parent = Lighting
        ColorCorrection = Instance.new("ColorCorrectionEffect")
        ColorCorrection.Name = "WarmTint"
        ColorCorrection.Saturation = 0.05
        ColorCorrection.TintColor = Color3.fromRGB(255, 224, 219)
        ColorCorrection.Parent = Lighting
        SunRays = Instance.new("SunRaysEffect")
        SunRays.Intensity = 0.05
        SunRays.Parent = Lighting
        Tropic = Instance.new("Sky")
        Tropic.Name = "Tropic"
        Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
        Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
        Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
        Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
        Tropic.StarCount = 100
        Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
        Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
        Tropic.Parent = Lighting
    end
    MergedHubPort.enableGraphics = enableGraphics

    function disableGraphics()
        Lighting = game:GetService("Lighting")
        Lighting:ClearAllChildren()
        Lighting.Brightness = 1
        Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        Lighting.FogEnd = 10000
    end
    MergedHubPort.disableGraphics = disableGraphics

    function applyToAllSigns(p123, p124, p125, p126)
        local v127 = p123:GetChildren()
        local v128, v129, v130 = ipairs(v127)
        while true do
            local v131
            v130, v131 = v128(v129, v130)
            if v130 == nil then
                break
            end
            local v132 = v131:FindFirstChild(p126)
            if v132 and v132:FindFirstChild(p126 .. "GrabPart") then
                local v133 = {
                    v132[p126 .. "GrabPart"],
                    p124 * p125
                }
                vu122.GrabEvents.SetNetworkOwner:FireServer(unpack(v133))
            end
        end
    end
    MergedHubPort.applyToAllSigns = applyToAllSigns

    function handleLoop()
        while looping do
            local v134 = selectedPlot
            local v135 = workspace.Plots:FindFirstChild(v134)
            if v135 and v135:FindFirstChild("PlotSign") then
                local v136 = v135.PlotSign
                local v137 = positionsAndAngles[v134]
                applyToAllSigns(v136, v137.position, v137.angles, selectedSignType)
            else
                warn("Plot or PlotSign not found for: " .. v134)
            end
            wait(1)
        end
    end
    MergedHubPort.handleLoop = handleLoop

    function grabAllToys(p141)
        playerToysFolder = workspace:FindFirstChild(p141.Name .. "SpawnedInToys")
        if playerToysFolder then
            spawnedToys = playerToysFolder:GetChildren()
            local v142, v143, v144 = ipairs(spawnedToys)
            while true do
                local v145
                v144, v145 = v142(v143, v144)
                if v144 == nil then
                    break
                end
                if not (v145:IsA("Model") and v145.Name:match("MusicKeyboard")) and (v145:IsA("Model") or v145:IsA("Part")) then
                    local v146, v147, v148 = ipairs(v145:GetDescendants())
                    while true do
                        local v149
                        v148, v149 = v146(v147, v148)
                        if v148 == nil then
                            break
                        end
                        if v149:IsA("Part") then
                            local v150 = {
                                v149,
                                CFrame.new(v149.Position)
                            }
                            game:GetService("ReplicatedStorage").GrabEvents.SetNetworkOwner:FireServer(unpack(v150))
                        end
                    end
                end
            end
        else
            print("Player\'s toys folder not found.")
        end
    end
    MergedHubPort.grabAllToys = grabAllToys

    function handleToggle(p151)
        isLooping = p151
        if isLooping then
            print("Looping started.")
            spawn(function()
                while isLooping do
                    grabAllToys(game.Players.LocalPlayer)
                    wait(loopInterval)
                end
            end)
        else
            print("Looping stopped.")
        end
    end
    MergedHubPort.handleToggle = handleToggle

    local function vu173()
        local v156 = game:GetService("Players")
        local v157 = v156.LocalPlayer
        local v158 = v157.Character
        if v158 then
            v158 = v157.Character.PrimaryPart.Position
        end
        if v158 then
            local v159, v160, v161 = ipairs(v156:GetPlayers())
            while true do
                local v162
                v161, v162 = v159(v160, v161)
                if v161 == nil then
                    break
                end
                if v162 ~= v157 then
                    local v163 = workspace:FindFirstChild(v162.Name .. "SpawnedInToys")
                    if v163 then
                        local v164, v165, v166 = ipairs(v163:GetChildren())
                        while true do
                            local v167
                            v166, v167 = v164(v165, v166)
                            if v166 == nil then
                                break
                            end
                            if v167:IsA("Model") or v167:IsA("Part") then
                                local v168, v169, v170 = ipairs(v167:GetDescendants())
                                while true do
                                    local v171
                                    v170, v171 = v168(v169, v170)
                                    if v170 == nil then
                                        break
                                    end
                                    if v171:IsA("Part") and (v171.Position - v158).magnitude <= vu155 then
                                        local v172 = {
                                            v171,
                                            CFrame.new(v171.Position)
                                        }
                                        game:GetService("ReplicatedStorage").GrabEvents.SetNetworkOwner:FireServer(unpack(v172))
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    MergedHubPort.vu173 = vu173

    local function vu175(p174)
        if p174 then
            if not vu154 then
                vu154 = true
                print("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Looping started.")
                while vu154 do
                    vu173()
                    wait(loopInterval)
                end
            end
        elseif vu154 then
            vu154 = false
            print("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Looping stopped.")
        end
    end
    MergedHubPort.vu175 = vu175

    function OrbitPlayers()
        vu178.RenderStepped:Connect(function()
            if isFollowActive then
                playerCharacter = player.Character
                if playerCharacter then
                    local v180 = playerCharacter:FindFirstChild("HumanoidRootPart")
                    if v180 then
                        v180 = playerCharacter.HumanoidRootPart.Position
                    end
                    playerPosition = v180
                    if playerPosition then
                        local v181 = vu179
                        local v182, v183, v184 = ipairs(v181:GetPlayers())
                        while true do
                            local v185
                            v184, v185 = v182(v183, v184)
                            if v184 == nil then
                                break
                            end
                            if v185 ~= player then
                                character = v185.Character
                                if character then
                                    local v186 = character:FindFirstChild("HumanoidRootPart")
                                    if v186 then
                                        if not angles[v185] then
                                            angles[v185] = 0
                                        end
                                        angles[v185] = angles[v185] + followSpeed * vu178.RenderStepped:Wait()
                                        angle = angles[v185]
                                        offsetX = math.cos(angle) * followDistance
                                        offsetZ = math.sin(angle) * followDistance
                                        newPosition = playerPosition + Vector3.new(offsetX, 0, offsetZ)
                                        v186.CFrame = CFrame.new(newPosition, playerPosition)
                                    end
                                end
                            end
                        end
                    end
                else
                    return
                end
            else
                return
            end
        end)
    end
    MergedHubPort.OrbitPlayers = OrbitPlayers

    function saveOriginalProperties(p193)
        if not originalProperties[p193] then
            originalProperties[p193] = {}
            local v194, v195, v196 = ipairs(p193:GetChildren())
            while true do
                local v197
                v196, v197 = v194(v195, v196)
                if v196 == nil then
                    break
                end
                if v197:IsA("BasePart") then
                    originalProperties[p193][v197] = {
                        Material = v197.Material,
                        BrickColor = v197.BrickColor,
                        Transparency = v197.Transparency
                    }
                end
            end
        end
    end
    MergedHubPort.saveOriginalProperties = saveOriginalProperties

    function applyHighlight(p198)
        saveOriginalProperties(p198)
        local v199, v200, v201 = ipairs(p198:GetChildren())
        while true do
            local v202
            v201, v202 = v199(v200, v201)
            if v201 == nil then
                break
            end
            if v202:IsA("BasePart") then
                v202.Material = Enum.Material.Neon
                v202.BrickColor = BrickColor.new(highlightColor)
                v202.Transparency = highlightTransparency
            end
        end
    end
    MergedHubPort.applyHighlight = applyHighlight

    function removeHighlight(p203)
        local v204 = originalProperties[p203]
        if v204 then
            local v205, v206, v207 = pairs(v204)
            while true do
                local v208
                v207, v208 = v205(v206, v207)
                if v207 == nil then
                    break
                end
                if v207:IsA("BasePart") then
                    v207.Material = v208.Material
                    v207.BrickColor = v208.BrickColor
                    v207.Transparency = v208.Transparency
                end
            end
            originalProperties[p203] = nil
        end
    end
    MergedHubPort.removeHighlight = removeHighlight

    function grabAndMoveToys()
        local v209 = workspace:FindFirstChild(player.Name .. "SpawnedInToys")
        if v209 then
            local v210, v211, v212 = pairs(v209:GetChildren())
            while true do
                local v213
                v212, v213 = v210(v211, v212)
                if v212 == nil then
                    break
                end
                if v213:IsA("Model") then
                    if (v213.PrimaryPart.Position - player.Character.HumanoidRootPart.Position).magnitude > grabRadius then
                        removeHighlight(v213)
                    else
                        applyHighlight(v213)
                        local v214, v215, v216 = ipairs({
                            "Main",
                            "Hitbox",
                            "SoundPart",
                            "Base",
                            "BackPart",
                            "Axel2",
                            "Stick"
                        })
                        while true do
                            local v217
                            v216, v217 = v214(v215, v216)
                            if v216 == nil then
                                break
                            end
                            local v218 = v213:FindFirstChild(v217)
                            if v218 then
                                local v219 = {
                                    v218,
                                    CFrame.new(v218.Position)
                                }
                                vu190.GrabEvents.SetNetworkOwner:FireServer(unpack(v219))
                            end
                        end
                    end
                end
            end
        end
    end
    MergedHubPort.grabAndMoveToys = grabAndMoveToys

    function clearEffects()
        local v228, v229, v230 = pairs(workspace[player.Name .. "SpawnedInToys"]:GetChildren())
        while true do
            local v231
            v230, v231 = v228(v229, v230)
            if v230 == nil then
                break
            end
            local v232, v233, v234 = pairs(v231:GetDescendants())
            while true do
                local v235
                v234, v235 = v232(v233, v234)
                if v234 == nil then
                    break
                end
                if v235:IsA("BasePart") then
                    local v236 = v235:FindFirstChild("BodyVelocity")
                    local v237 = v235:FindFirstChild("BodyGyro")
                    if v236 then
                        v236:Destroy()
                    end
                    if v237 then
                        v237:Destroy()
                    end
                    v235.CanCollide = true
                end
            end
        end
    end
    MergedHubPort.clearEffects = clearEffects

    local function vu257()
        local v238 = 360 / # workspace[player.Name .. "SpawnedInToys"]:GetChildren()
        local v239 = 0
        while isMoving and selectedEffect == "Ferris Wheel \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189" do
            local v240 = character:WaitForChild("HumanoidRootPart").Position
            v239 = (v239 + speed * 0.1) % 360
            local v241, v242, v243 = pairs(workspace[player.Name .. "SpawnedInToys"]:GetChildren())
            local v244 = 1
            while true do
                local v245
                v243, v245 = v241(v242, v243)
                if v243 == nil then
                    break
                end
                local v246, v247, v248 = pairs(v245:GetDescendants())
                while true do
                    local v249
                    v248, v249 = v246(v247, v248)
                    if v248 == nil then
                        break
                    end
                    if v249:IsA("BasePart") then
                        local v250 = v239 + v238 * (v244 - 1)
                        local v251 = v240.X + radius * math.cos(math.rad(v250))
                        local v252 = v240.Z + radius * math.sin(math.rad(v250))
                        local v253 = v240.Y + math.sin(math.rad(v250)) * height
                        local v254 = Vector3.new(v251, v253, v252)
                        local v255 = v249:FindFirstChild("BodyVelocity") or Instance.new("BodyVelocity", v249)
                        v255.MaxForce = Vector3.new(10000, 10000, 10000)
                        v255.Velocity = (v254 - v249.Position) * speed * 0.1
                        local v256 = v249:FindFirstChild("BodyGyro") or Instance.new("BodyGyro", v249)
                        v256.MaxTorque = Vector3.new(10000, 10000, 10000)
                        v256.CFrame = CFrame.new(v254) * CFrame.Angles(math.rad(xRotation), math.rad(yRotation), math.rad(zRotation))
                        v249.CanCollide = false
                        v249.Anchored = false
                    end
                end
                v244 = v244 + 1
            end
            wait(0.05)
        end
    end
    MergedHubPort.vu257 = vu257

    local function vu276()
        local v258 = 360 / # workspace[player.Name .. "SpawnedInToys"]:GetChildren()
        local v259 = 0
        while isMoving and selectedEffect == "Orbit \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189" do
            local v260 = character:WaitForChild("HumanoidRootPart").Position
            v259 = (v259 + speed * 0.1) % 360
            local v261, v262, v263 = pairs(workspace[player.Name .. "SpawnedInToys"]:GetChildren())
            local v264 = 1
            while true do
                local v265
                v263, v265 = v261(v262, v263)
                if v263 == nil then
                    break
                end
                local v266 = v259 + v258 * (v264 - 1)
                local v267 = v260.X + radius * math.cos(math.rad(v266))
                local v268 = v260.Z + radius * math.sin(math.rad(v266))
                local v269 = Vector3.new(v267, v260.Y + height, v268)
                local v270, v271, v272 = pairs(v265:GetDescendants())
                while true do
                    local v273
                    v272, v273 = v270(v271, v272)
                    if v272 == nil then
                        break
                    end
                    if v273:IsA("BasePart") then
                        local v274 = v273:FindFirstChild("BodyVelocity") or Instance.new("BodyVelocity", v273)
                        v274.MaxForce = Vector3.new(10000, 10000, 10000)
                        v274.Velocity = (v269 - v273.Position) * speed * 0.1
                        local v275 = v273:FindFirstChild("BodyGyro") or Instance.new("BodyGyro", v273)
                        v275.MaxTorque = Vector3.new(10000, 10000, 10000)
                        v275.CFrame = CFrame.new(v269) * CFrame.Angles(math.rad(xRotation), math.rad(yRotation), math.rad(zRotation))
                        v273.CanCollide = false
                        v273.Anchored = false
                    end
                end
                v264 = v264 + 1
            end
            wait(0.05)
        end
    end
    MergedHubPort.vu276 = vu276

    local function vu296()
        local v277 = 360 / # workspace[player.Name .. "SpawnedInToys"]:GetChildren()
        local v278 = 0
        while isMoving and selectedEffect == "Tornado \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\184\143" do
            local v279 = character:WaitForChild("HumanoidRootPart").Position
            v278 = (v278 + speed * 0.1) % 360
            local v280, v281, v282 = pairs(workspace[player.Name .. "SpawnedInToys"]:GetChildren())
            local v283 = 1
            while true do
                local v284
                v282, v284 = v280(v281, v282)
                if v282 == nil then
                    break
                end
                local v285, v286, v287 = pairs(v284:GetDescendants())
                while true do
                    local v288
                    v287, v288 = v285(v286, v287)
                    if v287 == nil then
                        break
                    end
                    if v288:IsA("BasePart") then
                        local v289 = v278 + v277 * (v283 - 1)
                        local v290 = v279.X + radius * math.cos(math.rad(v289))
                        local v291 = v279.Z + radius * math.sin(math.rad(v289))
                        local v292 = v279.Y + v283 % layers * height
                        local v293 = Vector3.new(v290, v292, v291)
                        local v294 = v288:FindFirstChild("BodyVelocity") or Instance.new("BodyVelocity", v288)
                        v294.MaxForce = Vector3.new(10000, 10000, 10000)
                        v294.Velocity = (v293 - v288.Position) * speed * 0.1
                        local v295 = v288:FindFirstChild("BodyGyro") or Instance.new("BodyGyro", v288)
                        v295.MaxTorque = Vector3.new(10000, 10000, 10000)
                        v295.CFrame = CFrame.new(v293) * CFrame.Angles(math.rad(xRotation), math.rad(yRotation), math.rad(zRotation))
                        v288.CanCollide = false
                        v288.Anchored = false
                    end
                end
                v283 = v283 + 1
            end
            wait(0.05)
        end
    end
    MergedHubPort.vu296 = vu296

    function grabEverything()
        local v307 = tick()
        while grabEnabled and tick() - v307 < 2 do
            local v308, v309, v310 = pairs(workspace:GetDescendants())
            while true do
                local v311
                v310, v311 = v308(v309, v310)
                if v310 == nil or not grabEnabled then
                    break
                end
                if v311:IsA("BasePart") then
                    local v312 = {
                        v311,
                        CFrame.new(- 18.161, 91, - 36.838) * CFrame.Angles(0, 0, 0)
                    }
                    CreateGrabLine:FireServer(unpack(v312))
                end
            end
            wait(grabSpeed)
        end
    end
    MergedHubPort.grabEverything = grabEverything

    local function vu313()
        if grabEnabled then
            grabEverything()
            task.delay(5, vu313)
        end
    end
    MergedHubPort.vu313 = vu313

    function createGrabLineForAll()
        local v316 = vu179
        local v317, v318, v319 = ipairs(v316:GetPlayers())
        while true do
            local v320
            v319, v320 = v317(v318, v319)
            if v319 == nil then
                break
            end
            if v320.Character and v320.Character:FindFirstChild("Head") then
                local v321 = {
                    v320.Character.Head,
                    CFrame.new(0.30346226692199707, 0.17847490310668945, - 0.5) * CFrame.Angles(0.2570371627807617, - 1.5707963705062866, 0)
                }
                vu190.GrabEvents.CreateGrabLine:FireServer(unpack(v321))
            end
        end
    end
    MergedHubPort.createGrabLineForAll = createGrabLineForAll

    function toggleLag(p322)
        isLagging = p322
        if isLagging then
            vu191:BindToRenderStep("LagEffect", Enum.RenderPriority.Last.Value, function()
                createGrabLineForAll()
                wait(lagSpeed)
            end)
        else
            vu191:UnbindFromRenderStep("LagEffect")
        end
    end
    MergedHubPort.toggleLag = toggleLag

    function updateLagSpeed(p323)
        lagSpeed = 1 - p323 / 20 * 0.95
    end
    MergedHubPort.updateLagSpeed = updateLagSpeed

    function applyGrabLineLag()
        while toggle do
            local v328, v329, v330 = pairs(players:GetPlayers())
            while true do
                local v331
                v330, v331 = v328(v329, v330)
                if v330 == nil then
                    break
                end
                if v331.Character and v331.Character:FindFirstChild("Head") then
                    local v332 = {
                        v331.Character.Head,
                        CFrame.new(0.303, 0.178, - 0.5) * CFrame.Angles(0.257, - 1.571, 0)
                    }
                    vu326.CreateGrabLine:FireServer(unpack(v332))
                    v331.Character.HumanoidRootPart.Velocity = Vector3.new(0, 500, 0)
                    game:GetService("RunService").Stepped:Wait()
                end
            end
            wait(vu327)
        end
    end
    MergedHubPort.applyGrabLineLag = applyGrabLineLag

    function makePlayerFall(p333)
        if p333.Character and p333.Character:FindFirstChild("HumanoidRootPart") then
            p333.Character.HumanoidRootPart.Velocity = Vector3.new(0, - 50, 0)
        end
    end
    MergedHubPort.makePlayerFall = makePlayerFall

    function toggleScript(p334)
        toggle = p334
        if toggle then
            applyGrabLineLag()
        else
            local v335, v336, v337 = pairs(players:GetPlayers())
            while true do
                local v338
                v337, v338 = v335(v336, v337)
                if v337 == nil then
                    break
                end
                makePlayerFall(v338)
            end
        end
    end
    MergedHubPort.toggleScript = toggleScript

    function isDescendantOf(p341, p342)
        local v343 = p341.Parent
        while v343 do
            if v343 == p342 then
                return true
            end
            v343 = v343.Parent
        end
        return false
    end
    AllunFunctions.isDescendantOf = isDescendantOf

    function GetDescendant(p344, p345)
        local v346, v347, v348 = ipairs(p344:GetDescendants())
        while true do
            local v349
            v348, v349 = v346(v347, v348)
            if v348 == nil then
                break
            end
            if v349.Name == p345 then
                return v349
            end
        end
        return nil
    end
    MergedHubPort.GetDescendant = GetDescendant

    function FindFirstAncestorOfType(p350, p351)
        return p350 and p350:FindFirstAncestorWhichIsA(p351) or nil
    end
    MergedHubPort.FindFirstAncestorOfType = FindFirstAncestorOfType

    function cleanupConnections(p364)
        local v365, v366, v367 = ipairs(p364)
        while true do
            local v368
            v367, v368 = v365(v366, v367)
            if v367 == nil then
                break
            end
            v368:Disconnect()
        end
        for v369 = # p364, 1, - 1 do
            table.remove(p364, v369)
        end
    end
    AllunFunctions.cleanupConnections = cleanupConnections

    function createHighlightAndImage(p370)
        local v371 = Instance.new("Highlight")
        v371.DepthMode = Enum.HighlightDepthMode.Occluded
        v371.FillTransparency = 1
        v371.Name = "Highlight"
        v371.OutlineColor = Color3.fromRGB(0, 255, 255)
        v371.OutlineTransparency = 0.5
        v371.Parent = p370
        print("Created highlight and set on " .. p370.Name)
        local v372 = Instance.new("BillboardGui")
        v372.Name = "ImageOverlay"
        v372.Size = UDim2.new(0, 70, 0, 70)
        v372.StudsOffset = Vector3.new(0, 3, 0)
        v372.AlwaysOnTop = true
        v372.Adornee = p370
        v372.Parent = p370
        local v373 = Instance.new("ImageLabel")
        v373.Size = UDim2.new(1, 0, 1, 0)
        v373.Position = UDim2.new(0, 0, 0, 0)
        v373.BackgroundTransparency = 1
        v373.Image = "rbxassetid://122000268316876"
        v373.Parent = v372
        print("Added image overlay to " .. p370.Name)
        return {
            Highlight = v371,
            BillboardGui = v372
        }
    end
    MergedHubPort.createHighlightAndImage = createHighlightAndImage

    function onPartOwnerAdded(p374, p375)
        local v376 = p374.Name == "PartOwner" and p374.Value ~= localPlayer.Name and (GetDescendant(p375, "Highlight") or GetDescendant(FindFirstAncestorOfType(p375, "Model"), "Highlight"))
        if v376 then
            if p374.Value == localPlayer.Name then
                v376.OutlineColor = Color3.fromRGB(0, 255, 255)
            else
                v376.OutlineColor = Color3.new(1, 0, 0)
            end
            print("Updated highlight color for", p375.Name, "to", v376.OutlineColor)
        end
    end
    AllunFunctions.onPartOwnerAdded = onPartOwnerAdded

    function createBodyMovers(p377, p378, p379)
        local v380 = Instance.new("BodyPosition")
        local v381 = Instance.new("BodyGyro")
        v380.P = 15000
        v380.D = 200
        v380.MaxForce = Vector3.new(5000000, 5000000, 5000000)
        v380.Position = p378
        v380.Parent = p377
        v381.P = 15000
        v381.D = 200
        v381.MaxTorque = Vector3.new(5000000, 5000000, 5000000)
        v381.CFrame = p379
        v381.Parent = p377
        print("Created BodyMovers for", p377.Name)
    end
    AllunFunctions.createBodyMovers = createBodyMovers

    function anchorGrab()
        while true do
            pcall(function()
                local v382 = workspace:FindFirstChild("GrabParts")
                if not v382 then
                    return
                end
                local v383 = v382:FindFirstChild("GrabPart")
                if not v383 then
                    return
                end
                local v384 = v383:FindFirstChild("WeldConstraint")
                if not (v384 and v384.Part1) then
                    return
                end
                local vu385
                if v384.Part1.Name ~= "SoundPart" then
                    if v384.Part1.Parent then
                        vu385 = v384.Part1.Parent:FindFirstChild("SoundPart") or (v384.Part1.Parent.PrimaryPart or v384.Part1)
                    else
                        vu385 = v384.Part1
                    end
                else
                    vu385 = v384.Part1
                end
                if not vu385 then
                    return
                end
                if vu385.Anchored then
                    return
                end
                if workspace:FindFirstChild("Map") and isDescendantOf(vu385, workspace.Map) then
                    return
                end
                local v386 = vu362
                local v387, v388, v389 = pairs(v386:GetPlayers())
                while true do
                    local v390
                    v389, v390 = v387(v388, v389)
                    if v389 == nil then
                        break
                    end
                    if isDescendantOf(vu385, v390.Character) then
                        return
                    end
                end
                local v391, v392, v393 = pairs(vu385:GetDescendants())
                local v394 = true
                while true do
                    local v395
                    v393, v395 = v391(v392, v393)
                    if v393 == nil then
                        break
                    end
                    if table.find(vu10, v395) then
                        v394 = false
                        break
                    end
                end
                if v394 and not table.find(vu10, vu385) then
                    local v396
                    if FindFirstAncestorOfType(vu385, "Model") and FindFirstAncestorOfType(vu385, "Model") ~= workspace then
                        v396 = FindFirstAncestorOfType(vu385, "Model") or vu385
                    else
                        v396 = vu385
                    end
                    createHighlightAndImage(v396)
                    table.insert(vu10, vu385)
                    print("Anchored part:", v396.Name)
                    local v398 = v396.DescendantAdded:Connect(function(p397)
                        onPartOwnerAdded(p397, vu385)
                    end)
                    table.insert(vu11, v398)
                end
                local v399 = FindFirstAncestorOfType(vu385, "Model")
                if v399 and v399 ~= workspace then
                    local v400, v401, v402 = ipairs(v399:GetDescendants())
                    while true do
                        local v403
                        v402, v403 = v400(v401, v402)
                        if v402 == nil then
                            break
                        end
                        if v403:IsA("BodyPosition") or v403:IsA("BodyGyro") then
                            v403:Destroy()
                            print("Destroyed BodyMover:", v403.Name, "from", v399.Name)
                        end
                    end
                else
                    local v404, v405, v406 = ipairs(vu385:GetChildren())
                    while true do
                        local v407
                        v406, v407 = v404(v405, v406)
                        if v406 == nil then
                            break
                        end
                        if v407:IsA("BodyPosition") or v407:IsA("BodyGyro") then
                            v407:Destroy()
                            print("Destroyed BodyMover:", v407.Name, "from", vu385.Name)
                        end
                    end
                end
                while workspace:FindFirstChild("GrabParts") do
                    vu361.Heartbeat:Wait()
                end
                createBodyMovers(vu385, vu385.Position, vu385.CFrame)
            end)
            vu361.Heartbeat:Wait()
        end
    end
    AllunFunctions.anchorGrab = anchorGrab

    function cleanupAnchoredParts()
        local v408, v409, v410 = ipairs(vu10)
        while true do
            local v411
            v410, v411 = v408(v409, v410)
            if v410 == nil then
                break
            end
            if v411 then
                if v411:FindFirstChild("BodyPosition") then
                    v411.BodyPosition:Destroy()
                    print("Destroyed BodyPosition for", v411.Name)
                end
                if v411:FindFirstChild("BodyGyro") then
                    v411.BodyGyro:Destroy()
                    print("Destroyed BodyGyro for", v411.Name)
                end
                local v412 = not GetDescendant(v411, "Highlight") and FindFirstAncestorOfType(v411, "Model")
                if v412 then
                    v412 = FindFirstAncestorOfType(v411, "Model"):FindFirstChild("Highlight")
                end
                if v412 then
                    v412:Destroy()
                    print("Destroyed Highlight for", v411.Name)
                end
                local v413 = not GetDescendant(v411, "ImageOverlay") and FindFirstAncestorOfType(v411, "Model")
                if v413 then
                    v413 = FindFirstAncestorOfType(v411, "Model"):FindFirstChild("ImageOverlay")
                end
                if v413 then
                    v413:Destroy()
                    print("Destroyed Image Overlay for", v411.Name)
                end
            end
        end
        cleanupConnections(vu11)
        vu10 = {}
        print("Cleaned up all anchored parts and connections.")
    end
    AllunFunctions.cleanupAnchoredParts = cleanupAnchoredParts

    function updateBodyMovers(p414)
        local v415, v416, v417 = ipairs(vu12)
        while true do
            local v418
            v417, v418 = v415(v416, v417)
            if v417 == nil then
                break
            end
            if v418.primaryPart and v418.primaryPart == p414 then
                local v419, v420, v421 = ipairs(v418.group)
                while true do
                    local v422
                    v421, v422 = v419(v420, v421)
                    if v421 == nil then
                        break
                    end
                    local v423 = v422.part:FindFirstChild("BodyPosition")
                    local v424 = v422.part:FindFirstChild("BodyGyro")
                    if v423 then
                        v423.Position = (p414.CFrame * v422.offset).Position
                    end
                    if v424 then
                        v424.CFrame = p414.CFrame * v422.offset
                    end
                end
            end
        end
    end
    AllunFunctions.updateBodyMovers = updateBodyMovers

    function compileGroup()
        if # vu10 ~= 0 then
            OrionLib:MakeNotification({
                Name = "Success",
                Content = "Compiled " .. # vu10 .. " Toys together",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "No anchored parts found",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
        local vu425 = vu10[1]
        if vu425 then
            local v426 = not vu425:FindFirstChild("Highlight") and FindFirstAncestorOfType(vu425, "Model")
            if v426 then
                v426 = FindFirstAncestorOfType(vu425, "Model"):FindFirstChild("Highlight")
            end
            if not v426 then
                local v427 = createHighlightAndImage
                local v428
                if vu425.Parent:IsA("Model") then
                    v428 = vu425.Parent or vu425
                else
                    v428 = vu425
                end
                v426 = v427(v428).Highlight
            end
            v426.OutlineColor = Color3.new(0, 1, 0)
            v426.FillColor = Color3.new(0, 1, 0)
            v426.FillTransparency = 0
            v426.FillTransparency = 0
            v426.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            local v429, v430, v431 = ipairs(vu10)
            local v432 = {}
            while true do
                local v433
                v431, v433 = v429(v430, v431)
                if v431 == nil then
                    break
                end
                if v433 ~= vu425 then
                    local v434 = {
                        part = v433,
                        offset = vu425.CFrame:ToObjectSpace(v433.CFrame)
                    }
                    table.insert(v432, v434)
                end
            end
            table.insert(vu12, {
                primaryPart = vu425,
                group = v432
            })
            local v435 = vu425:GetPropertyChangedSignal("CFrame"):Connect(function()
                updateBodyMovers(vu425)
            end)
            table.insert(vu13, v435)
            local v436 = vu361.Heartbeat:Connect(function()
                updateBodyMovers(vu425)
            end)
            table.insert(renderSteppedConnections, v436)
            print("Compiled group with primary part:", vu425.Name)
        end
    end
    AllunFunctions.compileGroup = compileGroup

    function cleanupCompiledGroups()
        local v437, v438, v439 = ipairs(vu12)
        while true do
            local v440
            v439, v440 = v437(v438, v439)
            if v439 == nil then
                break
            end
            local v441, v442, v443 = ipairs(v440.group)
            while true do
                local v444
                v443, v444 = v441(v442, v443)
                if v443 == nil then
                    break
                end
                if v444.part then
                    if v444.part:FindFirstChild("BodyPosition") then
                        v444.part.BodyPosition:Destroy()
                        print("Destroyed BodyPosition for", v444.part.Name)
                    end
                    if v444.part:FindFirstChild("BodyGyro") then
                        v444.part.BodyGyro:Destroy()
                        print("Destroyed BodyGyro for", v444.part.Name)
                    end
                end
            end
            if v440.primaryPart and v440.primaryPart.Parent then
                local v445 = not v440.primaryPart:FindFirstChild("Highlight") and FindFirstAncestorOfType(v440.primaryPart, "Model")
                if v445 then
                    v445 = FindFirstAncestorOfType(v440.primaryPart, "Model"):FindFirstChild("Highlight")
                end
                if v445 then
                    v445:Destroy()
                    print("Destroyed Highlight for", v440.primaryPart.Name)
                end
                local v446 = not v440.primaryPart:FindFirstChild("ImageOverlay") and FindFirstAncestorOfType(v440.primaryPart, "Model")
                if v446 then
                    v446 = FindFirstAncestorOfType(v440.primaryPart, "Model"):FindFirstChild("ImageOverlay")
                end
                if v446 then
                    v446:Destroy()
                    print("Destroyed Image Overlay for", v440.primaryPart.Name)
                end
            end
        end
        cleanupConnections(vu13)
        cleanupConnections(renderSteppedConnections)
        vu12 = {}
        print("Cleaned up all compiled groups.")
    end
    AllunFunctions.cleanupCompiledGroups = cleanupCompiledGroups

    function compileCoroutineFunc()
        while true do
            pcall(function()
                local v447, v448, v449 = ipairs(vu12)
                while true do
                    local v450
                    v449, v450 = v447(v448, v449)
                    if v449 == nil then
                        break
                    end
                    updateBodyMovers(v450.primaryPart)
                end
            end)
            vu361.Heartbeat:Wait()
        end
    end
    AllunFunctions.compileCoroutineFunc = compileCoroutineFunc

    function unanchorPrimaryPart()
        local v451 = vu10[1]
        if v451 then
            if v451:FindFirstChild("BodyPosition") then
                v451.BodyPosition:Destroy()
                print("Destroyed BodyPosition for primary part:", v451.Name)
            end
            if v451:FindFirstChild("BodyGyro") then
                v451.BodyGyro:Destroy()
                print("Destroyed BodyGyro for primary part:", v451.Name)
            end
            local v452 = v451:FindFirstChild("Highlight")
            if v452 then
                v452:Destroy()
                print("Destroyed Highlight for primary part:", v451.Name)
            end
            local v453 = not v451:FindFirstChild("ImageOverlay") and FindFirstAncestorOfType(v451, "Model")
            if v453 then
                v453 = FindFirstAncestorOfType(v451, "Model"):FindFirstChild("ImageOverlay")
            end
            if v453 then
                v453:Destroy()
                print("Destroyed Image Overlay for primary part:", v451.Name)
            end
        else
            print("No primary part to unanchor.")
        end
    end
    AllunFunctions.unanchorPrimaryPart = unanchorPrimaryPart

    function recoverParts()
        while true do
            pcall(function()
                local v454 = localPlayer.Character
                if v454 and (v454:FindFirstChild("Head") and v454:FindFirstChild("HumanoidRootPart")) then
                    local v455 = v454.HumanoidRootPart
                    local v456, v457, v458 = pairs(vu10)
                    while true do
                        local v459
                        v458, v459 = v456(v457, v458)
                        if v458 == nil then
                            break
                        end
                        if v459 and (v459.Position - v455.Position).Magnitude <= 30 then
                            local v460 = not GetDescendant(v459, "Highlight") and FindFirstAncestorOfType(v459, "Model")
                            if v460 then
                                v460 = FindFirstAncestorOfType(v459, "Model"):FindFirstChild("Highlight")
                            end
                            if v460 and v460.OutlineColor == Color3.new(1, 0, 0) then
                                vu5:FireServer(v459, v459.CFrame)
                                if v459:FindFirstChild("PartOwner") and v459.PartOwner.Value == localPlayer.Name then
                                    v460.OutlineColor = Color3.fromRGB(0, 255, 255)
                                    print("Recovered and set ownership for", v459.Name)
                                end
                            end
                        end
                    end
                end
            end)
            vu361.Heartbeat:Wait()
        end
    end
    AllunFunctions.recoverParts = recoverParts

    local function vu469()
        local v463 = workspace:FindFirstChild(player.Name .. "SpawnedInToys")
        local v464 = {}
        if v463 then
            local v465, v466, v467 = pairs(v463:GetChildren())
            while true do
                local v468
                v467, v468 = v465(v466, v467)
                if v467 == nil then
                    break
                end
                if v468.Name == "MusicKeyboard" then
                    table.insert(v464, v468)
                end
            end
        end
        return v464
    end
    MergedHubPort.vu469 = vu469

    local function vu483()
        local v470 = vu469()
        local v471 = {
            "Key1F",
            "Key1E",
            "Key1G",
            "Key3C",
            "Key1C",
            "Key1D",
            "Key2Fsharp"
        }
        if # v470 <= 0 then
            warn("No MusicKeyboard toys found")
        else
            local v472 = (player.Character or player.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").Position
            local v473, v474, v475 = pairs(v470)
            while true do
                local v476
                v475, v476 = v473(v474, v475)
                if v475 == nil then
                    break
                end
                local v477, v478, v479 = ipairs(v471)
                while true do
                    local v480
                    v479, v480 = v477(v478, v479)
                    if v479 == nil then
                        break
                    end
                    local v481 = v476:FindFirstChild(v480)
                    if v481 then
                        local v482 = {
                            v481,
                            CFrame.new(v472.X, v472.Y - 5, v472.Z)
                        }
                        game:GetService("ReplicatedStorage").GrabEvents.SetNetworkOwner:FireServer(unpack(v482))
                    else
                        warn("Part " .. v480 .. " not found in toy " .. v476.Name)
                    end
                end
            end
        end
    end
    MergedHubPort.vu483 = vu483

    function executeLoop()
        while loopActive do
            vu483()
            wait(vu327)
        end
    end
    MergedHubPort.executeLoop = executeLoop

    local function v485(p484)
        vu327 = math.clamp(p484, 0.05, 5)
        print("\239\191\189\239\191\189\239\184\143 Loop speed set to: " .. vu327)
    end
    MergedHubPort.v485 = v485

    local function vu493()
        local v487 = workspace:FindFirstChild(player.Name .. "SpawnedInToys")
        local v488 = {}
        if v487 then
            local v489, v490, v491 = pairs(v487:GetChildren())
            while true do
                local v492
                v491, v492 = v489(v490, v491)
                if v491 == nil then
                    break
                end
                if v492.Name == "MusicKeyboard" then
                    table.insert(v488, v492)
                end
            end
        end
        return v488
    end
    MergedHubPort.vu493 = vu493

    local function vu510()
        local v496 = vu493()
        if # v496 <= 0 then
            warn("No MusicKeyboard toys found")
        else
            local v497 = (player.Character or player.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").Position
            local v498, v499, v500 = ipairs(currentSong)
            while true do
                local v501
                v500, v501 = v498(v499, v500)
                if v500 == nil then
                    break
                end
                local v502 = v501[1]
                local v503 = v501[2] * playSpeed
                local v504, v505, v506 = pairs(v496)
                while true do
                    local v507
                    v506, v507 = v504(v505, v506)
                    if v506 == nil then
                        break
                    end
                    local v508 = v507:FindFirstChild(v502)
                    if v508 then
                        local v509 = {
                            v508,
                            CFrame.new(v497.X, v497.Y - 5, v497.Z)
                        }
                        game:GetService("ReplicatedStorage").GrabEvents.SetNetworkOwner:FireServer(unpack(v509))
                    else
                        warn("Part " .. v502 .. " not found in toy " .. v507.Name)
                    end
                end
                wait(v503)
            end
        end
    end
    MergedHubPort.vu510 = vu510

    local function vu511()
        while loopActive do
            vu510()
        end
    end
    MergedHubPort.vu511 = vu511

    local function v513(p512)
        if p512 then
            loopActive = true
            print("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Loop activated \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
            spawn(vu511)
        else
            loopActive = false
            print("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Loop deactivated \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
        end
    end
    MergedHubPort.v513 = v513

    local function vu523()
        local v517 = workspace:FindFirstChild(vu516.Name .. "SpawnedInToys")
        local v518 = {}
        if v517 then
            local v519, v520, v521 = pairs(v517:GetChildren())
            while true do
                local v522
                v521, v522 = v519(v520, v521)
                if v521 == nil then
                    break
                end
                if v522.Name == "MusicKeyboard" then
                    table.insert(v518, v522)
                end
            end
        end
        return v518
    end
    MergedHubPort.vu523 = vu523

    local function vu541(p527)
        local v528 = vu523()
        if # v528 ~= 0 then
            local v529 = (vu516.Character or vu516.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")
            if v529 then
                local v530 = v529.Position
                local v531, v532, v533 = ipairs(p527)
                while true do
                    local v534
                    v533, v534 = v531(v532, v533)
                    if v533 == nil then
                        break
                    end
                    local v535, v536, v537 = pairs(v528)
                    while true do
                        local v538
                        v537, v538 = v535(v536, v537)
                        if v537 == nil then
                            break
                        end
                        local v539 = v538:FindFirstChild(v534)
                        if v539 then
                            local v540 = {
                                v539,
                                CFrame.new(v530.X, v530.Y - 5, v530.Z)
                            }
                            vu526.GrabEvents.SetNetworkOwner:FireServer(unpack(v540))
                        else
                            warn("Part " .. v534 .. " not found in toy " .. v538.Name)
                        end
                    end
                    wait(vu327)
                end
            else
                warn("HumanoidRootPart not found in character")
            end
        else
            warn("No MusicKeyboard toys found")
            return
        end
    end
    MergedHubPort.vu541 = vu541

    local function vu542()
        while loopActive do
            vu541(vu524[vu525])
        end
    end
    MergedHubPort.vu542 = vu542

    local function v544(p543)
        if p543 then
            if not loopActive then
                loopActive = true
                print("Loop activated")
                spawn(vu542)
            end
        else
            loopActive = false
            print("Loop deactivated")
        end
    end
    MergedHubPort.v544 = v544

    function SilentAim()
        local vu554 = {
            "Head",
            "Torso",
            "Left Leg",
            "Right Leg"
        }
        local function vu566()
            local v555 = math.huge
            local v556 = vu547
            local v557, v558, v559 = pairs(v556:GetPlayers())
            local v560 = nil
            while true do
                local v561
                v559, v561 = v557(v558, v559)
                if v559 == nil then
                    break
                end
                if v561.Name ~= localPlayer.Name and v561.Character and v561.Character:FindFirstChild("HumanoidRootPart") then
                    local v562 = localPlayer.Character.HumanoidRootPart.Position
                    local v563 = v561.Character.HumanoidRootPart
                    local _, v564 = vu549:WorldToScreenPoint(v563.Position)
                    if v564 then
                        local v565 = (v562 - v563.Position).magnitude
                        if v565 < v555 then
                            v560 = v561
                            v555 = v565
                        end
                    end
                end
            end
            return v560
        end
        vu552 = vu548.RenderStepped:Connect(function()
            if vu550 then
                vu566()
            end
        end)
        if not vu553 then
            vu553 = hookmetamethod(game, "__namecall", function(...)
                local v567 = {
                    ...
                }
                local v568 = v567[1]
                local v569 = getnamecallmethod()
                if v568 == workspace and (not checkcaller() and (v569 == "Raycast" and vu550)) then
                    local v570 = vu566()
                    if v570 and (v570.Character and (v570.Character.HumanoidRootPart and (localPlayer.Character.HumanoidRootPart and v570.Character.Humanoid.Health > 0))) then
                        local v571 = (localPlayer.Character.HumanoidRootPart.Position - v570.Character.HumanoidRootPart.Position).magnitude
                        local v572 = vu554[math.random(1, # vu554)]
                        local v573 = v570.Character[v572]
                        if v571 <= vu551 and v573 then
                            v567[3] = (v570.Character[v572].Position - v567[2]).Unit * 1000
                            v567[4] = RaycastParams.new()
                            v567[4].FilterDescendantsInstances = {
                                v570.Character
                            }
                            v567[4].FilterType = Enum.RaycastFilterType.Include
                        end
                    end
                end
                return vu553(unpack(v567))
            end)
        end
    end
    MergedHubPort.SilentAim = SilentAim

    function ToggleSilentAim(p574)
        if p574 then
            if not vu552 then
                SilentAim()
            end
        elseif vu552 then
            vu552:Disconnect()
            vu552 = nil
        end
    end
    MergedHubPort.ToggleSilentAim = ToggleSilentAim

    function updatePlayersDropdown(p598)
        table.clear(playerNames)
        local v599, v600, v601 = pairs(game.Players:GetPlayers())
        while true do
            local v602
            v601, v602 = v599(v600, v601)
            if v601 == nil then
                break
            end
            table.insert(playerNames, v602.DisplayName)
        end
        p598:Refresh(playerNames)
    end
    MergedHubPort.updatePlayersDropdown = updatePlayersDropdown

    function createPlayerInfoGui(p614)
        playerInfoFrame = Instance.new("BillboardGui")
        playerInfoFrame.Size = UDim2.new(0, 200, 0, 60)
        playerInfoFrame.StudsOffset = Vector3.new(0, 3, 0)
        playerInfoFrame.Adornee = p614.Character:FindFirstChild("Head") or p614.Character:FindFirstChild("HumanoidRootPart")
        playerInfoFrame.Parent = p614.Character
        local v615 = Instance.new("Frame", playerInfoFrame)
        v615.Size = UDim2.new(1, 0, 1, 0)
        v615.BackgroundTransparency = 1
        v615.BorderSizePixel = 0
        imageLabel = Instance.new("ImageLabel", playerInfoFrame)
        imageLabel.Size = UDim2.new(0.3, 0, 1, 0)
        imageLabel.Position = UDim2.new(0, 0, 0, 0)
        imageLabel.BackgroundTransparency = 1
        imageLabel.Image = "rbxassetid://0000000000"
        imageLabel.ClipsDescendants = true
        imageLabel.BorderSizePixel = 0
        imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        cornerRadius = Instance.new("UICorner")
        cornerRadius.CornerRadius = UDim.new(0.5, 0)
        cornerRadius.Parent = imageLabel
        textLabel = Instance.new("TextLabel", playerInfoFrame)
        textLabel.Size = UDim2.new(0.7, 0, 1, 0)
        textLabel.Position = UDim2.new(0.35, 0, 0, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        textLabel.TextStrokeTransparency = 0.8
        textLabel.TextScaled = true
        textLabel.TextWrapped = true
        textLabel.Text = ""
        textCornerRadius = Instance.new("UICorner")
        textCornerRadius.CornerRadius = UDim.new(0.5, 0)
        textCornerRadius.Parent = textLabel
        function rainbowText()
            local v616 = {
                Color3.fromRGB(255, 0, 0),
                Color3.fromRGB(255, 127, 0),
                Color3.fromRGB(255, 255, 0),
                Color3.fromRGB(0, 255, 0),
                Color3.fromRGB(0, 0, 255),
                Color3.fromRGB(75, 0, 130),
                Color3.fromRGB(148, 0, 211)
            }
            local v617 = 1
            while playerInfoEnabled do
                textLabel.TextColor3 = v616[v617]
                v617 = v617 % # v616 + 1
                wait(0.1)
            end
        end
        coroutine.wrap(rainbowText)()
        return playerInfoFrame, imageLabel, textLabel
    end
    MergedHubPort.createPlayerInfoGui = createPlayerInfoGui

    function createFlowerEffect()
        local vu633 = Instance.new("ScreenGui")
        vu633.Parent = vu516.PlayerGui
        local vu634 = Instance.new("Frame")
        vu634.Size = UDim2.new(1, 0, 1, 0)
        vu634.Position = UDim2.new(0, 0, 0, 0)
        vu634.BackgroundTransparency = 1
        vu634.Parent = vu633
        for v635 = 1, 12 do
            local v636 = v635
            local v637 = Instance.new("ImageLabel")
            v637.Size = UDim2.new(0.2, 0, 0.4, 0)
            v637.Position = UDim2.new(0.5, - 10, 0.5, - 20)
            v637.AnchorPoint = Vector2.new(0.5, 0.5)
            v637.BackgroundTransparency = 1
            v637.Image = "rbxassetid://12345678"
            v637.Rotation = v636 * 30
            v637.Parent = vu634
            v637.ImageColor3 = Color3.fromHSV(v636 / 12, 1, 1)
            v637.ImageTransparency = 0.5
        end
        local vu638 = tick()
        game:GetService("RunService").RenderStepped:Connect(function()
            local v639 = (tick() - vu638) * effectColorSpeed % 1
            local v640 = vu634
            local v641, v642, v643 = ipairs(v640:GetChildren())
            while true do
                local v644
                v643, v644 = v641(v642, v643)
                if v643 == nil then
                    break
                end
                if v644:IsA("ImageLabel") then
                    v644.ImageColor3 = Color3.fromHSV(v639, 1, 1)
                    v644.Rotation = v644.Rotation + effectColorSpeed * 50 * game:GetService("RunService").RenderStepped:Wait()
                end
            end
        end)
        delay(effectDuration, function()
            if vu633 then
                vu633:Destroy()
            end
        end)
    end
    MergedHubPort.createFlowerEffect = createFlowerEffect

    function playRandomSpeedAudio(p645)
        local v646 = Instance.new("Sound")
        v646.SoundId = p645
        v646.Parent = vu516.PlayerGui
        v646.PlaybackSpeed = math.random() * (maxSpeed - minSpeed) + minSpeed
        v646:Play()
        game:GetService("Debris"):AddItem(v646, audioDuration)
    end
    MergedHubPort.playRandomSpeedAudio = playRandomSpeedAudio

    function setNoclip(p647)
        if p647 then
            noclipConnection = game:GetService("RunService").Stepped:Connect(function()
                local v648, v649, v650 = pairs(character:GetChildren())
                while true do
                    local v651
                    v650, v651 = v648(v649, v650)
                    if v650 == nil then
                        break
                    end
                    if v651:IsA("BasePart") then
                        v651.CanCollide = false
                    end
                end
            end)
        elseif noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
    end
    MergedHubPort.setNoclip = setNoclip

    function toggleNoclip(p652)
        if noclipEnabled ~= p652 then
            noclipEnabled = p652
            setNoclip(noclipEnabled)
            if noclipEnabled then
                createFlowerEffect()
                playRandomSpeedAudio("rbxassetid://1835952552")
                local v653, v654, v655 = pairs(character:GetChildren())
                while true do
                    local v656
                    v655, v656 = v653(v654, v655)
                    if v655 == nil then
                        break
                    end
                    if v656:IsA("BasePart") and v656.Name ~= "Head" then
                        v656.Transparency = 1
                    end
                end
                local v657 = humanoidRootPart.Position - Vector3.new(0, depth, 0)
                humanoidRootPart.CFrame = CFrame.new(v657)
                head.CFrame = CFrame.new(humanoidRootPart.Position + Vector3.new(0, depth, 0))
            else
                playRandomSpeedAudio("rbxassetid://858508159")
                local v658 = humanoidRootPart.Position + Vector3.new(0, depth, 0)
                humanoidRootPart.CFrame = CFrame.new(v658)
                local v659, v660, v661 = pairs(character:GetChildren())
                while true do
                    local v662
                    v661, v662 = v659(v660, v661)
                    if v661 == nil then
                        break
                    end
                    if v662:IsA("BasePart") and v662.Name ~= "Head" then
                        v662.Transparency = 0
                    end
                end
            end
        end
    end
    MergedHubPort.toggleNoclip = toggleNoclip

    function typeMessage(p670)
        messageLabel.Text = ""
        local v671 = 1
        for v672 = 1, # p670 do
            messageLabel.Text = string.sub(p670, 1, v672)
            messageLabel.TextColor3 = rainbowColors[v671]
            v671 = v671 % # rainbowColors + 1
            wait(0.05)
        end
    end
    MergedHubPort.typeMessage = typeMessage

    function showTypedMessage()
        infoBox.Visible = true
        sound:Play()
        typeMessage("Void rescue activated.")
        wait(6.2)
        infoBox.Visible = false
        sound:Stop()
    end
    MergedHubPort.showTypedMessage = showTypedMessage

    function checkVoid()
        while antiVoidEnabled do
            local v673 = game.Players.LocalPlayer
            if v673 and v673.Character and (v673.Character:FindFirstChild("HumanoidRootPart") and v673.Character.HumanoidRootPart.Position.Y < voidYLevel) then
                v673.Character.HumanoidRootPart.CFrame = CFrame.new(safePosition)
                showTypedMessage()
            end
            wait(0.1)
        end
    end
    MergedHubPort.checkVoid = checkVoid

    local function vu693()
        autoStruggleCoroutine = vu191.Heartbeat:Connect(function()
            local v684 = localPlayer.Character
            if v684 and v684:FindFirstChild("Head") and v684.Head:FindFirstChild("PartOwner") then
                vu682:FireServer()
                vu680.GameCorrectionEvents.StopAllVelocity:FireServer()
                local v685, v686, v687 = pairs(v684:GetChildren())
                while true do
                    local v688
                    v687, v688 = v685(v686, v687)
                    if v687 == nil then
                        break
                    end
                    if v688:IsA("BasePart") then
                        v688.Anchored = true
                    end
                end
                while localPlayer.IsHeld.Value do
                    wait()
                end
                local v689, v690, v691 = pairs(v684:GetChildren())
                while true do
                    local v692
                    v691, v692 = v689(v690, v691)
                    if v691 == nil then
                        break
                    end
                    if v692:IsA("BasePart") then
                        v692.Anchored = false
                    end
                end
            end
        end)
    end
    MergedHubPort.vu693 = vu693

    local function vu696()
        if toggleActiveAntiGrabAndBlobman and vu675 then
            local v694 = localPlayer.Character
            local v695 = v694 and v694:FindFirstChild("HumanoidRootPart")
            if v695 then
                v695.CFrame = CFrame.new(vu675)
            end
        end
    end
    MergedHubPort.vu696 = vu696

    local function v701()
        if toggleActiveAntiGrabAndBlobman then
            local v697 = localPlayer.Character
            local v698 = v697 and v697:FindFirstChild("HumanoidRootPart")
            if v698 then
                local v699 = v698.AssemblyLinearVelocity
                local v700 = (v698.Position - vu675).Magnitude
                if vu677 < v699.Magnitude and vu676 < v700 then
                    v698.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    v698.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    vu696()
                end
            end
        end
    end
    MergedHubPort.v701 = v701

    local function vu712()
        if toggleActiveAntiGrabAndBlobman then
            local v706 = localPlayer.Character or localPlayer.CharacterAdded:Wait()
            local vu707 = v706:FindFirstChildWhichIsA("Humanoid") or v706:WaitForChild("Humanoid")
            v706:WaitForChild("HumanoidRootPart")
            local function v710()
                if vu707.SeatPart and tostring(vu707.SeatPart.Parent) == "CreatureBlobman" then
                    local v708 = vu707:FindFirstChild("RightGrabAnimation")
                    local v709 = vu707:FindFirstChild("LeftGrabAnimation")
                    if v708 then
                        v708.AnimationId = ""
                    end
                    if v709 then
                        v709.AnimationId = ""
                    end
                end
            end
            local v711 = vu707
            vu707.GetPropertyChangedSignal(v711, "SeatPart"):Connect(v710)
            v710()
        end
    end
    MergedHubPort.vu712 = vu712

    local function v717()
        local v713 = localPlayer.Character or localPlayer.CharacterAdded:Wait()
        local vu714 = v713:FindFirstChildWhichIsA("Humanoid") or v713:WaitForChild("Humanoid")
        v713:WaitForChild("HumanoidRootPart").ChildAdded:Connect(function(p715)
            if toggleActiveAntiGrabAndBlobman and p715:IsA("Fire") then
                p715:Destroy()
            end
        end)
        vu712()
        vu714.Changed:Connect(function(p716)
            if toggleActiveAntiGrabAndBlobman and (p716 == "Sit" and (vu714.Sit and (not vu714.SeatPart or tostring(vu714.SeatPart.Parent) ~= "CreatureBlobman"))) and not vu714.SeatPart then
                vu714:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                vu714.Sit = false
            end
        end)
    end
    MergedHubPort.v717 = v717

    function setupAntiExplosion(pu719)
        local vu720 = pu719:WaitForChild("Humanoid"):FindFirstChild("Ragdolled")
        if vu720 then
            vu16 = vu720:GetPropertyChangedSignal("Value"):Connect(function()
                if vu720.Value then
                    local v721 = pu719
                    local v722, v723, v724 = ipairs(v721:GetChildren())
                    while true do
                        local v725
                        v724, v725 = v722(v723, v724)
                        if v724 == nil then
                            break
                        end
                        if v725:IsA("BasePart") then
                            v725.Anchored = true
                        end
                    end
                else
                    local v726 = pu719
                    local v727, v728, v729 = ipairs(v726:GetChildren())
                    while true do
                        local v730
                        v729, v730 = v727(v728, v729)
                        if v729 == nil then
                            break
                        end
                        if v730:IsA("BasePart") then
                            v730.Anchored = false
                        end
                    end
                end
            end)
        end
    end
    AllunFunctions.setupAntiExplosion = setupAntiExplosion

    function runAntiKickLoop()
        while true do
            if toggleActiveAntiKick then
                local v740 = {
                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),
                    0
                }
                game:GetService("ReplicatedStorage"):WaitForChild("CharacterEvents"):WaitForChild("RagdollRemote"):FireServer(unpack(v740))
            end
            task.wait()
        end
    end
    MergedHubPort.runAntiKickLoop = runAntiKickLoop

    function getDescendantParts(p743)
        local v744, v745, v746 = ipairs(workspace.Map:GetDescendants())
        local v747 = {}
        while true do
            local v748
            v746, v748 = v744(v745, v746)
            if v746 == nil then
                break
            end
            if v748:IsA("Part") and v748.Name == p743 then
                table.insert(v747, v748)
            end
        end
        return v747
    end
    MergedHubPort.getDescendantParts = getDescendantParts

    function grabHandler(pu749)
        while true do
            local _, _ = pcall(function()
                local v750 = workspace:FindFirstChild("GrabParts")
                local v751 = v750 and v750.Name == "GrabParts" and v750:FindFirstChild("GrabPart"):FindFirstChild("WeldConstraint").Part1.Parent:FindFirstChild("Head")
                if v751 then
                    while workspace:FindFirstChild("GrabParts") do
                        local v752 = pu749 == "poison" and poisonHurtParts or paintPlayerParts
                        local v753, v754, v755 = pairs(v752)
                        while true do
                            local v756
                            v755, v756 = v753(v754, v755)
                            if v755 == nil then
                                break
                            end
                            v756.Size = Vector3.new(2, 2, 2)
                            v756.Transparency = 1
                            v756.Position = v751.Position
                        end
                        wait()
                        local v757, v758, v759 = pairs(v752)
                        while true do
                            local v760
                            v759, v760 = v757(v758, v759)
                            if v759 == nil then
                                break
                            end
                            v760.Position = Vector3.new(0, - 200, 0)
                        end
                    end
                    local v761, v762, v763 = pairs(partsTable)
                    while true do
                        local v764
                        v763, v764 = v761(v762, v763)
                        if v763 == nil then
                            break
                        end
                        v764.Position = Vector3.new(0, - 200, 0)
                    end
                end
            end)
            wait()
        end
    end
    AllunFunctions.grabHandler = grabHandler

    function noclipGrab()
        while true do
            local _, _ = pcall(function()
                local v770 = workspace:FindFirstChild("GrabParts")
                if v770 and v770.Name == "GrabParts" then
                    local v771 = v770:FindFirstChild("GrabPart"):FindFirstChild("WeldConstraint").Part1.Parent
                    if v771.HumanoidRootPart then
                        while workspace:FindFirstChild("GrabParts") do
                            local v772, v773, v774 = pairs(v771:GetChildren())
                            while true do
                                local v775
                                v774, v775 = v772(v773, v774)
                                if v774 == nil then
                                    break
                                end
                                if v775:IsA("BasePart") then
                                    v775.CanCollide = false
                                end
                            end
                            wait()
                        end
                        local v776, v777, v778 = pairs(v771:GetChildren())
                        while true do
                            local v779
                            v778, v779 = v776(v777, v778)
                            if v778 == nil then
                                break
                            end
                            if v779:IsA("BasePart") then
                                v779.CanCollide = true
                            end
                        end
                    end
                end
            end)
            wait()
        end
    end
    AllunFunctions.noclipGrab = noclipGrab

    local function vu827(p821)
        local v822 = p821.GrabPart.WeldConstraint.Part1
        if v822 then
            local v823 = v822.Parent:FindFirstChildOfClass("Humanoid")
            local v824 = v823 and v822.Parent:FindFirstChild("HumanoidRootPart")
            if v824 then
                local v825 = Vector3.new(0, 30, 0)
                local v826 = v824.Position + v825
                v824.CFrame = CFrame.new(v826)
                v823.PlatformStand = true
                v823.AutoRotate = false
                v823.AutoCrouch = false
                v823.Sit = false
                v823:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            end
        end
    end
    MergedHubPort.vu827 = vu827

    local function vu843(p837)
        local v838 = p837.GrabPart.WeldConstraint.Part1
        if v838 then
            local v839 = v838.Parent:FindFirstChildOfClass("Humanoid")
            local v840 = v839 and v838.Parent:FindFirstChild("HumanoidRootPart")
            if v840 then
                local v841 = Vector3.new(0, - 50, 0)
                local v842 = v840.Position + v841
                v840.CFrame = CFrame.new(v842)
                v839.PlatformStand = true
                v839.AutoRotate = false
                v839.AutoCrouch = false
                v839.Sit = false
                v839:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            end
        end
    end
    MergedHubPort.vu843 = vu843

    local function vu858(p856)
        if p856.Name == "GrabParts" then
            local v857 = p856:FindFirstChild("GrabPart") and p856.GrabPart:FindFirstChild("WeldConstraint")
            if v857 then
                v857 = p856.GrabPart.WeldConstraint.Part1
            end
            if v857 then
                v857.Parent:BreakJoints()
            end
        end
    end
    MergedHubPort.vu858 = vu858

    local function vu860()
        if vu855 then
            vu859 = vu854.ChildAdded:Connect(vu858)
        elseif vu859 then
            vu859:Disconnect()
            vu859 = nil
        end
    end
    MergedHubPort.vu860 = vu860

    function updatePlayerList()
        playerList = {}
        local v868 = vu836
        local v869, v870, v871 = ipairs(v868:GetPlayers())
        while true do
            local v872
            v871, v872 = v869(v870, v871)
            if v871 == nil then
                break
            end
            table.insert(playerList, v872.Name)
        end
    end
    AllunFunctions.updatePlayerList = updatePlayerList

    function MakePlayerStand(p915)
        local v916 = p915.Character:FindFirstChild("Humanoid")
        if v916 and v916.Sit then
            v916.Sit = false
            v916.PlatformStand = false
        end
    end
    MergedHubPort.MakePlayerStand = MakePlayerStand

    function SetBodyPartProperties(p917)
        if p917 ~= players.LocalPlayer or toggle then
            MakePlayerStand(p917)
            local v918, v919, v920 = pairs(p917.Character:GetDescendants())
            while true do
                local v921
                v920, v921 = v918(v919, v920)
                if v920 == nil then
                    break
                end
                if v921:IsA("BasePart") and v921.Name ~= "HumanoidRootPart" then
                    v921.CanCollide = not v921.CanCollide
                    v921.CanQuery = not v921.CanQuery
                    v921.CanTouch = not v921.CanTouch
                    v921.Massless = not v921.Massless
                    v921.CollisionGroup = "n"
                end
            end
        end
    end
    MergedHubPort.SetBodyPartProperties = SetBodyPartProperties

    function ApplySettingsLoop()
        while toggle do
            local v922, v923, v924 = pairs(players:GetPlayers())
            while true do
                local v925
                v924, v925 = v922(v923, v924)
                if v924 == nil then
                    break
                end
                if v925 ~= players.LocalPlayer and v925.Character then
                    SetBodyPartProperties(v925)
                end
            end
            wait(1)
        end
    end
    MergedHubPort.ApplySettingsLoop = ApplySettingsLoop

    function grabNearbyPlayers()
        players = vu932:GetPlayers()
        local v936, v937, v938 = pairs(players)
        while true do
            local v939
            v938, v939 = v936(v937, v938)
            if v938 == nil then
                break
            end
            if v939 ~= LocalPlayer and v939.Character and (v939.Character:FindFirstChild("Left Arm") and not whitelist[v939.Name]) then
                playerPosition = v939.Character.HumanoidRootPart.Position
                localPlayerPosition = LocalPlayer.Character.HumanoidRootPart.Position
                distance = (playerPosition - localPlayerPosition).Magnitude
                if distance <= GrabRange then
                    args = {
                        v939.Character:FindFirstChild("Left Arm"),
                        CFrame.new(playerPosition) * CFrame.Angles(- 3.032215118408203, 0.4513836205005646, 3.093726396560669)
                    }
                    pcall(function()
                        GrabEvent:FireServer(unpack(args))
                    end)
                end
            end
        end
    end
    MergedHubPort.grabNearbyPlayers = grabNearbyPlayers

    function ExecuteCodeOnLeftArm(pu940)
        if pu940 then
            pcall(function()
                GrabEvent:FireServer(pu940, pu940.CFrame)
            end)
            grabbedPlayers[pu940.Parent] = true
        end
    end
    MergedHubPort.ExecuteCodeOnLeftArm = ExecuteCodeOnLeftArm

    function ExecuteCode1(pu941)
        if pu941 then
            pcall(function()
                pu941.Parent.Humanoid.Jump = true
            end)
        end
    end
    MergedHubPort.ExecuteCode1 = ExecuteCode1

    function ExecuteCode2(p942)
        if p942 then
            local v943 = Instance.new("BodyVelocity")
            v943.Velocity = Vector3.new(0, 1000, 0)
            v943.MaxForce = Vector3.new(vu934, math.huge, vu934)
            v943.Parent = p942.Parent.HumanoidRootPart
        end
    end
    MergedHubPort.ExecuteCode2 = ExecuteCode2

    function ConnectTouchEvents()
        if not vu933 then
            vu933 = vu191.Heartbeat:Connect(function()
                if loopActive then
                    local v944 = vu932:GetPlayers()
                    local v945, v946, v947 = ipairs(v944)
                    while true do
                        local v948
                        v947, v948 = v945(v946, v947)
                        if v947 == nil then
                            break
                        end
                        if v948 ~= LocalPlayer and not whitelist[v948.Name] then
                            local v949 = v948.Character
                            if v949 then
                                local v950 = v949:FindFirstChild("Left Arm")
                                if v950 and (not grabbedPlayers[v949] and (v950.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= GrabRange) then
                                    ExecuteCodeOnLeftArm(v950)
                                    ExecuteCode1(v950)
                                    ExecuteCode2(v950)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
    MergedHubPort.ConnectTouchEvents = ConnectTouchEvents

    function DisconnectTouchEvents()
        if vu933 then
            vu933:Disconnect()
            vu933 = nil
        end
    end
    MergedHubPort.DisconnectTouchEvents = DisconnectTouchEvents

    local function vu957()
        local v951, v952, v953 = pairs(grabbedPlayers)
        while true do
            local v954
            v953, v954 = v951(v952, v953)
            if v953 == nil then
                break
            end
            local v955 = v953:FindFirstChild("HumanoidRootPart")
            if v955 then
                local v956 = v955:FindFirstChildOfClass("BodyVelocity")
                if v956 then
                    v956:Destroy()
                end
            end
        end
        grabbedPlayers = {}
    end
    MergedHubPort.vu957 = vu957

    local function vu959(p958)
        loopActive = p958
        if loopActive then
            ConnectTouchEvents()
            coroutine.wrap(function()
                while loopActive do
                    grabNearbyPlayers()
                    wait(0.1)
                end
            end)()
        else
            DisconnectTouchEvents()
            vu957()
        end
    end
    MergedHubPort.vu959 = vu959

    local function vu979()
        local v972 = vu962:GetPlayers()
        local v973, v974, v975 = pairs(v972)
        while true do
            local v976
            v975, v976 = v973(v974, v975)
            if v975 == nil then
                break
            end
            if v976 ~= vu971 and v976.Character and (v976.Character:FindFirstChild("Left Arm") and not vu970[v976.Name]) then
                local v977 = v976.Character.HumanoidRootPart.Position
                if (v977 - vu971.Character.HumanoidRootPart.Position).Magnitude <= vu966 then
                    local vu978 = {
                        v976.Character["Left Arm"],
                        CFrame.new(v977) * CFrame.Angles(- 3.032215118408203, 0.4513836205005646, 3.093726396560669)
                    }
                    pcall(function()
                        vu969:FireServer(unpack(vu978))
                    end)
                end
            end
        end
    end
    MergedHubPort.vu979 = vu979

    local function vu981(pu980)
        if pu980 then
            pcall(function()
                vu969:FireServer(pu980, pu980.CFrame)
            end)
            vu967[pu980.Parent] = true
        end
    end
    MergedHubPort.vu981 = vu981

    local function vu983(pu982)
        if pu982 then
            pcall(function()
                pu982.Parent.Humanoid.Jump = true
            end)
        end
    end
    MergedHubPort.vu983 = vu983

    local function vu986(p984)
        if p984 then
            local v985 = Instance.new("BodyVelocity")
            v985.Velocity = Vector3.new(0, 0, 0)
            v985.MaxForce = Vector3.new(6000000, math.huge, 6000000)
            v985.Parent = p984.Parent.HumanoidRootPart
        end
    end
    MergedHubPort.vu986 = vu986

    local function vu994()
        if not vu968 then
            vu968 = vu964.Heartbeat:Connect(function()
                if vu965 then
                    local v987 = vu962:GetPlayers()
                    local v988, v989, v990 = ipairs(v987)
                    while true do
                        local v991
                        v990, v991 = v988(v989, v990)
                        if v990 == nil then
                            break
                        end
                        if v991 ~= vu971 and not vu970[v991.Name] then
                            local v992 = v991.Character
                            if v992 then
                                local v993 = v992:FindFirstChild("Left Arm")
                                if v993 and (not vu967[v992] and (v993.Position - vu971.Character.HumanoidRootPart.Position).Magnitude <= vu966) then
                                    vu981(v993)
                                    vu983(v993)
                                    vu986(v993)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
    MergedHubPort.vu994 = vu994

    local function vu995()
        if vu968 then
            vu968:Disconnect()
            vu968 = nil
        end
    end
    MergedHubPort.vu995 = vu995

    local function vu1001()
        local v996, v997, v998 = pairs(vu967)
        while true do
            local v999
            v998, v999 = v996(v997, v998)
            if v998 == nil then
                break
            end
            if v998 and v998:FindFirstChild("HumanoidRootPart") then
                local v1000 = v998.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity")
                if v1000 then
                    v1000:Destroy()
                end
            end
        end
        vu967 = {}
    end
    MergedHubPort.vu1001 = vu1001

    local function vu1003(p1002)
        vu965 = p1002
        if vu965 then
            vu994()
            coroutine.wrap(function()
                while vu965 do
                    vu979()
                    wait(0.1)
                end
            end)()
        else
            vu995()
            vu1001()
        end
    end
    MergedHubPort.vu1003 = vu1003

    local function vu1022()
        local v1015 = vu1005:GetPlayers()
        local v1016, v1017, v1018 = pairs(v1015)
        while true do
            local v1019
            v1018, v1019 = v1016(v1017, v1018)
            if v1018 == nil then
                break
            end
            if v1019 ~= vu1014 and v1019.Character and (v1019.Character:FindFirstChild("HumanoidRootPart") and not vu1013[v1019.Name]) then
                local v1020 = v1019.Character.HumanoidRootPart.Position
                if (v1020 - vu1014.Character.HumanoidRootPart.Position).Magnitude <= vu1009 then
                    local vu1021 = {
                        v1019.Character.HumanoidRootPart,
                        CFrame.new(v1020) * CFrame.Angles(- 3.032215118408203, 0.4513836205005646, 3.093726396560669)
                    }
                    pcall(function()
                        vu1012:FireServer(unpack(vu1021))
                    end)
                end
            end
        end
    end
    MergedHubPort.vu1022 = vu1022

    local function vu1024(pu1023)
        if pu1023 then
            pcall(function()
                vu1012:FireServer(pu1023, pu1023.CFrame)
            end)
            vu1010[pu1023.Parent] = true
        end
    end
    MergedHubPort.vu1024 = vu1024

    local function vu1026(pu1025)
        if pu1025 then
            pcall(function()
                pu1025.Parent.Humanoid.Jump = true
            end)
        end
    end
    MergedHubPort.vu1026 = vu1026

    local function vu1029(p1027)
        if p1027 then
            local v1028 = Instance.new("BodyVelocity")
            v1028.Velocity = Vector3.new(0, - 500, 0)
            v1028.MaxForce = Vector3.new(600000, math.huge, 600000)
            v1028.Parent = p1027.Parent.HumanoidRootPart
        end
    end
    MergedHubPort.vu1029 = vu1029

    local function vu1037()
        if not vu1011 then
            vu1011 = vu1007.Heartbeat:Connect(function()
                if vu1008 then
                    local v1030 = vu1005:GetPlayers()
                    local v1031, v1032, v1033 = ipairs(v1030)
                    while true do
                        local v1034
                        v1033, v1034 = v1031(v1032, v1033)
                        if v1033 == nil then
                            break
                        end
                        if v1034 ~= vu1014 and not vu1013[v1034.Name] then
                            local v1035 = v1034.Character
                            if v1035 then
                                local v1036 = v1035:FindFirstChild("HumanoidRootPart")
                                if v1036 and (not vu1010[v1035] and (v1036.Position - vu1014.Character.HumanoidRootPart.Position).Magnitude <= vu1009) then
                                    vu1024(v1036)
                                    vu1026(v1036)
                                    vu1029(v1036)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
    MergedHubPort.vu1037 = vu1037

    local function vu1044()
        local v1038, v1039, v1040 = pairs(vu1010)
        while true do
            local v1041
            v1040, v1041 = v1038(v1039, v1040)
            if v1040 == nil then
                break
            end
            local v1042 = v1040:FindFirstChild("HumanoidRootPart")
            if v1042 then
                local v1043 = v1042:FindFirstChildOfClass("BodyVelocity")
                if v1043 then
                    v1043:Destroy()
                end
            end
        end
        vu1010 = {}
    end
    MergedHubPort.vu1044 = vu1044

    local function vu1046(p1045)
        vu1008 = p1045
        if vu1008 then
            vu1037()
            coroutine.wrap(function()
                while vu1008 do
                    if vu1014.Character then
                        vu1022()
                    end
                    wait(0.1)
                end
            end)()
        else
            vu995()
            vu1044()
        end
    end
    MergedHubPort.vu1046 = vu1046

    local function vu1060()
        local v1054 = vu1049
        local v1055, v1056, v1057 = pairs(v1054:GetPlayers())
        local v1058 = {}
        while true do
            local v1059
            v1057, v1059 = v1055(v1056, v1057)
            if v1057 == nil then
                break
            end
            if v1059 ~= vu1051 and v1059.Character and (v1059.Character:FindFirstChild("HumanoidRootPart") and (v1059.Character.HumanoidRootPart.Position - vu1051.Character.HumanoidRootPart.Position).Magnitude <= range) then
                table.insert(v1058, v1059)
            end
        end
        return v1058
    end
    MergedHubPort.vu1060 = vu1060

    local function vu1074()
        local v1061 = vu1060()
        local v1062 = tick()
        if # v1061 > 0 then
            separationAngle = 2 * math.pi / # v1061
        end
        local v1063, v1064, v1065 = pairs(v1061)
        while true do
            local v1066
            v1065, v1066 = v1063(v1064, v1065)
            if v1065 == nil then
                break
            end
            local v1067 = v1066.Character.HumanoidRootPart
            local v1068 = v1062 * orbitSpeed + v1065 * separationAngle
            local v1069 = math.cos(v1068) * orbitRadius
            local v1070 = math.sin(v1068) * orbitRadius
            local v1071 = vu1051.Character.HumanoidRootPart.Position + Vector3.new(v1069, 0, v1070)
            local v1072 = {
                v1067,
                CFrame.new(v1071)
            }
            vu1050.SetNetworkOwner:FireServer(unpack(v1072))
            local v1073 = Instance.new("BodyPosition")
            v1073.Position = v1071
            v1073.MaxForce = Vector3.new(4000, 4000, 4000)
            v1073.D = 100
            v1073.P = 3000
            v1073.Parent = v1067
            game:GetService("Debris"):AddItem(v1073, 0.1)
        end
    end
    MergedHubPort.vu1074 = vu1074

    local function vu1076(p1075)
        if p1075 then
            if not vu154 then
                vu154 = true
                vu1053 = vu1052.Heartbeat:Connect(function()
                    vu1074()
                end)
            end
        elseif vu154 then
            if vu1053 then
                vu1053:Disconnect()
                vu1053 = nil
            end
            vu154 = false
        end
    end
    MergedHubPort.vu1076 = vu1076

    local function vu1094()
        local v1088 = vu1079
        local v1089, v1090, v1091 = pairs(v1088:GetPlayers())
        local v1092 = {}
        while true do
            local v1093
            v1091, v1093 = v1089(v1090, v1091)
            if v1091 == nil then
                break
            end
            if v1093 ~= vu1081 and v1093.Character and (v1093.Character:FindFirstChild("HumanoidRootPart") and (v1093.Character.HumanoidRootPart.Position - vu1081.Character.HumanoidRootPart.Position).Magnitude <= vu1083) then
                table.insert(v1092, v1093)
            end
        end
        return v1092
    end
    MergedHubPort.vu1094 = vu1094

    function createAuraEffect()
        local v1095 = vu1094()
        local v1096 = # v1095
        if v1096 ~= 0 then
            local v1097 = tick()
            local v1098 = vu1081.Character.HumanoidRootPart.Position
            local v1099, v1100, v1101 = ipairs(v1095)
            while true do
                local v1102
                v1101, v1102 = v1099(v1100, v1101)
                if v1101 == nil then
                    break
                end
                local v1103 = v1102.Character.HumanoidRootPart
                local v1104 = v1097 * rotationSpeed + v1101 * math.pi * 2 / v1096
                local v1105 = math.cos(v1104) * vu1084
                local v1106 = math.sin(v1104) * vu1084
                local v1107 = Vector3.new(v1098.X + v1105, v1098.Y + auraHeight, v1098.Z + v1106)
                local v1108 = {
                    v1103,
                    CFrame.new(v1107)
                }
                vu1080.SetNetworkOwner:FireServer(unpack(v1108))
            end
            local v1109, v1110, v1111 = pairs(v1095)
            while true do
                local v1112
                v1111, v1112 = v1109(v1110, v1111)
                if v1111 == nil then
                    break
                end
                local v1113 = v1112.Character.HumanoidRootPart
                local v1114 = Instance.new("BodyPosition")
                v1114.MaxForce = Vector3.new(4000, 4000, 4000)
                v1114.D = 100
                v1114.P = 3000
                v1114.Parent = v1113
                game:GetService("Debris"):AddItem(v1114, 0.1)
                local v1115 = Instance.new("BodyVelocity")
                v1115.Velocity = (v1098 - v1113.Position).Unit * vu1085
                v1115.MaxForce = Vector3.new(4000, 4000, 4000)
                v1115.Parent = v1113
                game:GetService("Debris"):AddItem(v1115, 0.1)
            end
        end
    end
    MergedHubPort.createAuraEffect = createAuraEffect

    local function vu1117(p1116)
        if p1116 then
            if not vu1086 then
                vu1086 = true
                vu1087 = vu1082.Heartbeat:Connect(function()
                    createAuraEffect()
                end)
            end
        elseif vu1086 then
            if vu1087 then
                vu1087:Disconnect()
                vu1087 = nil
            end
            vu1086 = false
        end
    end
    MergedHubPort.vu1117 = vu1117

    local function vu1128()
        local v1122 = vu1119
        local v1123, v1124, v1125 = pairs(v1122:GetPlayers())
        local v1126 = {}
        while true do
            local v1127
            v1125, v1127 = v1123(v1124, v1125)
            if v1125 == nil then
                break
            end
            if v1127 ~= vu1081 and v1127.Character and (v1127.Character:FindFirstChild("HumanoidRootPart") and (v1127.Character.HumanoidRootPart.Position - vu1081.Character.HumanoidRootPart.Position).Magnitude <= config.range) then
                table.insert(v1126, v1127)
            end
        end
        return v1126
    end
    MergedHubPort.vu1128 = vu1128

    local function vu1137()
        local v1129 = vu1128()
        local v1130, v1131, v1132 = pairs(v1129)
        while true do
            local v1133
            v1132, v1133 = v1130(v1131, v1132)
            if v1132 == nil then
                break
            end
            local v1134 = v1133.Character.HumanoidRootPart
            local v1135 = vu1081.Character.HumanoidRootPart.CFrame * CFrame.new(config.grabOffset)
            vu1120.SetNetworkOwner:FireServer(unpack({
                v1134,
                v1135
            }))
            local v1136 = Instance.new("BodyVelocity")
            v1136.Velocity = (v1135.Position - v1134.Position).Unit * config.grabSpeed
            v1136.MaxForce = Vector3.new(100000, 100000, 100000)
            v1136.Parent = v1134
            game:GetService("Debris"):AddItem(v1136, 0.1)
        end
    end
    MergedHubPort.vu1137 = vu1137

    local function vu1139(p1138)
        if p1138 then
            if not state.isLooping then
                state.isLooping = true
                state.loopConnection = vu1121.Heartbeat:Connect(function()
                    if vu1081.Character and vu1081.Character:FindFirstChild("HumanoidRootPart") then
                        vu1137()
                    end
                end)
            end
        elseif state.isLooping then
            if state.loopConnection then
                state.loopConnection:Disconnect()
                state.loopConnection = nil
            end
            state.isLooping = false
        end
    end
    MergedHubPort.vu1139 = vu1139

    local function vu1157(p1151, p1152)
        local v1153, v1154, v1155 = ipairs(p1151:GetDescendants())
        while true do
            local v1156
            v1155, v1156 = v1153(v1154, v1155)
            if v1155 == nil then
                break
            end
            if v1156:IsA("BasePart") then
                v1156.CanCollide = not p1152
            end
        end
    end
    MergedHubPort.vu1157 = vu1157

    local function vu1160(p1158)
        if p1158 then
            local v1159 = Instance.new("BodyVelocity")
            v1159.Velocity = Vector3.new(0, - 7, 0)
            v1159.MaxForce = Vector3.new(0, math.huge, 0)
            v1159.Parent = p1158
        end
    end
    MergedHubPort.vu1160 = vu1160

    local function vu1168()
        local v1161 = vu1141:GetPlayers()
        local v1162, v1163, v1164 = pairs(v1161)
        while true do
            local v1165
            v1164, v1165 = v1162(v1163, v1164)
            if v1164 == nil then
                break
            end
            if v1165 ~= vu1150 and v1165.Character and (v1165.Character:FindFirstChild("HumanoidRootPart") and not vu1149[v1165.Name]) then
                local v1166 = v1165.Character.HumanoidRootPart.Position
                if (v1166 - vu1150.Character.HumanoidRootPart.Position).Magnitude <= vu1145 then
                    local vu1167 = {
                        v1165.Character.HumanoidRootPart,
                        CFrame.new(v1166) * CFrame.Angles(- 3.032215118408203, 0.4513836205005646, 3.093726396560669)
                    }
                    pcall(function()
                        vu1148:FireServer(unpack(vu1167))
                    end)
                    vu1157(v1165.Character, true)
                    vu1160(v1165.Character.HumanoidRootPart)
                    vu1146[v1165.Character] = true
                end
            end
        end
    end
    MergedHubPort.vu1168 = vu1168

    local function vu1170(pu1169)
        if pu1169 then
            pcall(function()
                vu1148:FireServer(pu1169, pu1169.CFrame)
            end)
            vu1146[pu1169.Parent] = true
        end
    end
    MergedHubPort.vu1170 = vu1170

    local function vu1178()
        if not vu1147 then
            vu1147 = vu1143.Heartbeat:Connect(function()
                if vu1144 then
                    local v1171 = vu1141:GetPlayers()
                    local v1172, v1173, v1174 = ipairs(v1171)
                    while true do
                        local v1175
                        v1174, v1175 = v1172(v1173, v1174)
                        if v1174 == nil then
                            break
                        end
                        if v1175 ~= vu1150 and not vu1149[v1175.Name] then
                            local v1176 = v1175.Character
                            if v1176 then
                                local v1177 = v1176:FindFirstChild("HumanoidRootPart")
                                if v1177 and (not vu1146[v1176] and (v1177.Position - vu1150.Character.HumanoidRootPart.Position).Magnitude <= vu1145) then
                                    vu1170(v1177)
                                    vu1168()
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
    MergedHubPort.vu1178 = vu1178

    local function vu1179()
        if vu1147 then
            vu1147:Disconnect()
            vu1147 = nil
        end
    end
    MergedHubPort.vu1179 = vu1179

    local function vu1186()
        local v1180, v1181, v1182 = pairs(vu1146)
        while true do
            local v1183
            v1182, v1183 = v1180(v1181, v1182)
            if v1182 == nil then
                break
            end
            local v1184 = v1182:FindFirstChild("HumanoidRootPart")
            if v1184 then
                local v1185 = v1184:FindFirstChildOfClass("BodyVelocity")
                if v1185 then
                    v1185:Destroy()
                end
                vu1157(v1182, false)
            end
        end
        vu1146 = {}
    end
    MergedHubPort.vu1186 = vu1186

    local function vu1188(p1187)
        vu1144 = p1187
        if vu1144 then
            vu1178()
            coroutine.wrap(function()
                while vu1144 do
                    if vu1150.Character then
                        vu1168()
                    end
                    wait(0.1)
                end
            end)()
        else
            vu1179()
            vu1186()
        end
    end
    MergedHubPort.vu1188 = vu1188

    function fireAll()
        while true do
            local v1204, v1205 = pcall(function()
                local v1191 = vu22:FindFirstChild("Campfire")
                if not v1191 then
                    spawnItemCf("Campfire", playerCharacter.Head.CFrame)
                    v1191 = vu22:WaitForChild("Campfire")
                end
                local v1192, v1193, v1194 = pairs(v1191:GetChildren())
                local v1195 = nil
                while true do
                    v1194, vu1196 = v1192(v1193, v1194)
                    if v1194 == nil then
                        break
                    end
                    if vu1196.Name == "FirePlayerPart" then
                        vu1196.Size = Vector3.new(10, 10, 10)
                    end
                end
                local vu1196 = v1195
                local v1197 = playerCharacter.Torso.Position
                vu5:FireServer(vu1196, vu1196.CFrame)
                playerCharacter:MoveTo(vu1196.Position)
                wait(0.3)
                playerCharacter:MoveTo(v1197)
                local vu1198 = Instance.new("BodyPosition")
                vu1198.P = 20000
                vu1198.Position = playerCharacter.Head.Position + Vector3.new(0, 600, 0)
                vu1198.Parent = v1191.Main
                pcall(function()
                    vu1198.Position = playerCharacter.Head.Position + Vector3.new(0, 600, 0)
                    if vu1200.Character and (vu1200.Character.HumanoidRootPart and vu1200.Character ~= playerCharacter) then
                        vu1196.Position = vu1200.Character.HumanoidRootPart.Position or vu1200.Character.Head.Position
                        wait()
                    end
                end)
                local v1199, vu1200 = v1202(v1203, v1199)
                if v1199 ~= nil then
                else
                end
                wait()
                local v1201 = vu1141
                local v1202, v1203
                v1202, v1203, v1199 = pairs(v1201:GetChildren())
            end)
            if not v1204 then
                warn("Error in fireAll: " .. tostring(v1205))
            end
            wait()
        end
    end
    AllunFunctions.fireAll = fireAll

    function grabBanana(p1212)
        if vu1209 then
            print("The banana has already been grabbed.")
        else
            vu1209 = true
            local v1213 = workspace:WaitForChild(p1212.Name .. "SpawnedInToys").FoodBanana.SoundPart
            local v1214 = {
                v1213,
                v1213.CFrame
            }
            vu1208.GrabEvents.SetNetworkOwner:FireServer(unpack(v1214))
        end
    end
    MergedHubPort.grabBanana = grabBanana

    function spawnBanana()
        local v1215 = {
            "FoodBanana",
            CFrame.new(67.55304718017578, - 5.7565531730651855, - 84.97564697265625) * CFrame.Angles(- 2.702202320098877, 1.113803744316101, 2.7424333095550537),
            Vector3.new(0, 113.98899841308594, 0)
        }
        game:GetService("ReplicatedStorage").MenuToys.SpawnToyRemoteFunction:InvokeServer(unpack(v1215))
    end
    MergedHubPort.spawnBanana = spawnBanana

    function holdBanana()
        local v1216 = game:GetService("Players").LocalPlayer.Name
        local v1217 = game:GetService("Players").LocalPlayer.Character
        local v1218 = workspace[v1216 .. "SpawnedInToys"].FoodBanana
        v1218.HoldPart.HoldItemRemoteFunction:InvokeServer(unpack({
            v1218,
            v1217
        }))
    end
    MergedHubPort.holdBanana = holdBanana

    function useBanana()
        local v1219 = game.Players.LocalPlayer
        local v1220 = "FoodBanana"
        local v1221 = {
            workspace:FindFirstChild(v1219.Name .. "SpawnedInToys"):FindFirstChild(v1220)
        }
        if v1221[1] then
            game:GetService("ReplicatedStorage").HoldEvents.Use:FireServer(unpack(v1221))
        else
            warn("Object not found: " .. v1220)
        end
    end
    MergedHubPort.useBanana = useBanana

    local function vu1228()
        local v1222 = game:GetService("Players").LocalPlayer
        local v1223 = workspace:FindFirstChild(v1222.Name .. "SpawnedInToys")
        if v1223 and v1223:FindFirstChild("FoodBanana") then
            local v1224 = v1223.FoodBanana
            local v1225 = v1222.Character
            if v1225 then
                v1225 = v1222.Character:FindFirstChild("Head")
            end
            if v1225 then
                local v1226 = v1225.Position - Vector3.new(0, 3, 0)
                local v1227 = {
                    v1224,
                    CFrame.new(v1226 + Vector3.new(0, 5, 0)),
                    Vector3.new(0, - 48.736000061035156, 0)
                }
                v1224.HoldPart.DropItemRemoteFunction:InvokeServer(unpack(v1227))
            end
        else
            warn("FoodBanana not found in player\'s toys.")
        end
    end
    MergedHubPort.vu1228 = vu1228

    local function vu1245()
        while vu1210 do
            local v1243, v1244 = pcall(function()
                local vu1229 = game.Players.LocalPlayer.Character
                local v1230 = workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "SpawnedInToys")
                if not v1230:FindFirstChild("FoodBanana") then
                    spawnBanana()
                end
                local v1231 = v1230:WaitForChild("FoodBanana")
                local v1232, v1233, v1234 = pairs(v1231:GetChildren())
                local v1235 = nil
                while true do
                    local vu1236
                    v1234, vu1236 = v1232(v1233, v1234)
                    if v1234 == nil then
                        vu1236 = v1235
                        break
                    end
                    if vu1236.Name == "BananaPeel" and vu1236:FindFirstChild("TouchInterest") then
                        vu1236.Size = Vector3.new(10, 10, 10)
                        vu1236.Transparency = 1
                        break
                    end
                end
                local vu1237 = Instance.new("BodyPosition")
                vu1237.P = 20000
                vu1237.D = 1000
                vu1237.MaxForce = Vector3.new(4000, 4000, 4000)
                vu1237.Parent = v1231.Main
                local vu1238 = Instance.new("BodyGyro")
                vu1238.MaxTorque = Vector3.new(4000, 4000, 4000)
                vu1238.CFrame = CFrame.Angles(0, math.rad(0), 0)
                vu1238.Parent = v1231.Main
                while vu1210 do
                    local v1239, v1240, v1241 = pairs(game.Players:GetChildren())
                    while true do
                        local vu1242
                        v1241, vu1242 = v1239(v1240, v1241)
                        if v1241 == nil then
                            break
                        end
                        pcall(function()
                            if vu1242.Character and vu1242.Character ~= vu1229 then
                                vu1236.Position = vu1242.Character.HumanoidRootPart.Position or vu1242.Character.Head.Position
                                vu1237.Position = vu1229.Head.Position + Vector3.new(0, 10, 0)
                                vu1238.CFrame = vu1238.CFrame * CFrame.Angles(0, math.rad(5), 0)
                                wait(0.03)
                            end
                        end)
                    end
                    wait()
                end
            end)
            if not v1243 then
                warn("Error in ragdollAll: " .. tostring(v1244))
            end
            wait()
        end
    end
    MergedHubPort.vu1245 = vu1245

    local function vu1247(p1246)
        vu1210 = p1246
        if p1246 then
            vu1211 = coroutine.create(vu1245)
            coroutine.resume(vu1211)
        end
    end
    MergedHubPort.vu1247 = vu1247

    function ForcePart(p1251)
        if p1251:IsA("Part") and not p1251.Anchored and (not p1251.Parent:FindFirstChild("Humanoid") and (not p1251.Parent:FindFirstChild("Head") and p1251.Name ~= "Handle")) then
            local v1252, v1253, v1254 = ipairs(p1251:GetChildren())
            while true do
                local v1255
                v1254, v1255 = v1252(v1253, v1254)
                if v1254 == nil then
                    break
                end
                if v1255:IsA("BodyAngularVelocity") or (v1255:IsA("BodyForce") or (v1255:IsA("BodyGyro") or (v1255:IsA("BodyPosition") or (v1255:IsA("BodyThrust") or (v1255:IsA("BodyVelocity") or v1255:IsA("RocketPropulsion")))))) then
                    v1255:Destroy()
                end
            end
            if p1251:FindFirstChild("Attachment") then
                p1251:FindFirstChild("Attachment"):Destroy()
            end
            if p1251:FindFirstChild("AlignPosition") then
                p1251:FindFirstChild("AlignPosition"):Destroy()
            end
            if p1251:FindFirstChild("Torque") then
                p1251:FindFirstChild("Torque"):Destroy()
            end
            p1251.CanCollide = false
            Torque = Instance.new("Torque", p1251)
            Torque.Torque = Vector3.new(100000, 100000, 100000)
            local v1256 = Instance.new("AlignPosition", p1251)
            local v1257 = Instance.new("Attachment", p1251)
            Torque.Attachment0 = v1257
            v1256.MaxForce = math.huge
            v1256.MaxVelocity = math.huge
            v1256.Responsiveness = 200
            v1256.Attachment0 = v1257
            v1256.Attachment1 = Attachment1
            Network.RetainPart(p1251)
        end
    end
    MergedHubPort.ForcePart = ForcePart

    function ReleasePart(p1258)
        if p1258:IsA("Part") and not p1258.Anchored then
            if p1258:FindFirstChild("Torque") then
                p1258:FindFirstChild("Torque"):Destroy()
            end
            if p1258:FindFirstChild("AlignPosition") then
                p1258:FindFirstChild("AlignPosition"):Destroy()
            end
            p1258.CanCollide = true
        end
    end
    MergedHubPort.ReleasePart = ReleasePart

    function toggleBlackHole()
        if blackHoleActive then
            local v1261 = vu1249
            local v1262, v1263, v1264 = ipairs(v1261:GetDescendants())
            while true do
                local v1265
                v1264, v1265 = v1262(v1263, v1264)
                if v1264 == nil then
                    break
                end
                ForcePart(v1265)
            end
            vu1259 = vu1249.DescendantAdded:Connect(function(p1266)
                if blackHoleActive then
                    ForcePart(p1266)
                end
            end)
            vu1260 = vu1143.RenderStepped:Connect(function()
                BlackHolePart.CFrame = humanoidRootPart.CFrame
            end)
        else
            local v1267, v1268, v1269 = ipairs(Network.BaseParts)
            while true do
                local v1270
                v1269, v1270 = v1267(v1268, v1269)
                if v1269 == nil then
                    break
                end
                ReleasePart(v1270)
            end
            if vu1259 then
                vu1259:Disconnect()
                vu1259 = nil
            end
            if vu1260 then
                vu1260:Disconnect()
                vu1260 = nil
            end
            if not resetDone then
                resetDone = true
                vu1143.Heartbeat:Wait()
                vu1150.Character:BreakJoints()
            end
        end
    end
    MergedHubPort.toggleBlackHole = toggleBlackHole

    local function vu1284()
        local v1278 = vu1272
        local v1279, v1280, v1281 = pairs(v1278:GetPlayers())
        while true do
            local v1282
            v1281, v1282 = v1279(v1280, v1281)
            if v1281 == nil then
                break
            end
            local v1283 = workspace:FindFirstChild(v1282.Name .. "SpawnedInToys")
            if v1283 and v1283:FindFirstChild("CreatureBlobman") then
                spawnerPlayer = v1282
                return v1283.CreatureBlobman
            end
        end
        return nil
    end
    MergedHubPort.vu1284 = vu1284

    function grabAndDropRandomPlayer()
        local v1285 = vu1272:GetPlayers()
        local v1286 = {}
        vu1274 = vu1274 or vu1284()
        if vu1274 then
            local v1287, v1288, v1289 = pairs(v1285)
            while true do
                local v1290
                v1289, v1290 = v1287(v1288, v1289)
                if v1289 == nil then
                    break
                end
                if v1290.Name ~= vu1276 and (v1290 ~= spawnerPlayer and v1290.Character) and (v1290.Character:FindFirstChild("HumanoidRootPart") and not (table.find(vu1275, v1290) or table.find(vu1277, v1290.Name))) then
                    table.insert(v1286, v1290)
                end
            end
            if # v1286 ~= 0 then
                v1285 = v1286
            else
                vu1275 = {}
            end
            if # v1285 > 0 then
                local v1291 = v1285[math.random(# v1285)]
                local v1292 = v1291.Character
                local v1293 = {
                    vu1274.RightDetector,
                    v1292.HumanoidRootPart,
                    vu1274.RightDetector.RightWeld
                }
                vu1274.BlobmanSeatAndOwnerScript.CreatureGrab:FireServer(unpack(v1293))
                table.insert(vu1275, v1291)
                wait(0.05)
                local v1294 = {
                    vu1274.BlobmanSeatAndOwnerScript.CreatureDrop,
                    v1292.HumanoidRootPart
                }
                vu1274.BlobmanSeatAndOwnerScript.CreatureDrop:FireServer(unpack(v1294))
            end
        end
    end
    MergedHubPort.grabAndDropRandomPlayer = grabAndDropRandomPlayer

    function startLoop()
        while vu1273 do
            grabAndDropRandomPlayer()
            wait(grabSpeed)
        end
    end
    MergedHubPort.startLoop = startLoop

    local function vu1306()
        local v1300 = vu1272
        local v1301, v1302, v1303 = ipairs(v1300:GetPlayers())
        local v1304 = {}
        while true do
            local v1305
            v1303, v1305 = v1301(v1302, v1303)
            if v1303 == nil then
                break
            end
            if not table.find(vu1277, v1305.Name) then
                table.insert(v1304, v1305.Name .. " (" .. v1305.DisplayName .. ")")
            end
        end
        vu1299:Refresh(v1304, true)
    end
    MergedHubPort.vu1306 = vu1306

    local function vu1315(p1310)
        local v1311, v1312, v1313 = ipairs(vu1309)
        while true do
            local v1314
            v1313, v1314 = v1311(v1312, v1313)
            if v1313 == nil then
                break
            end
            if v1314 == p1310 then
                return true
            end
        end
        return false
    end
    MergedHubPort.vu1315 = vu1315

    local function vu1322(_)
        local v1316 = vu1307
        local v1317, v1318, v1319 = pairs(v1316:GetPlayers())
        while true do
            local v1320
            v1319, v1320 = v1317(v1318, v1319)
            if v1319 == nil then
                break
            end
            local v1321 = workspace:FindFirstChild(v1320.Name .. "SpawnedInToys")
            if v1321 and v1321:FindFirstChild("CreatureBlobman") then
                return v1320
            end
        end
        return nil
    end
    MergedHubPort.vu1322 = vu1322

    local function vu1337()
        while vu1308 do
            local v1323 = vu1307
            local v1324, v1325, v1326 = pairs(v1323:GetPlayers())
            while true do
                local v1327
                v1326, v1327 = v1324(v1325, v1326)
                if v1326 == nil then
                    break
                end
                if not vu1315(v1327.Name) then
                    local v1328 = v1327.Character
                    if v1328 and v1328:FindFirstChild("HumanoidRootPart") then
                        local v1329 = vu1322
                        local v1330 = workspace:FindFirstChild(v1327.Name .. "SpawnedInToys")
                        if v1330 then
                            v1330 = workspace:FindFirstChild(v1327.Name .. "SpawnedInToys"):FindFirstChild("CreatureBlobman")
                        end
                        local v1331 = v1329(v1330)
                        if v1331 then
                            local v1332 = workspace:FindFirstChild(v1331.Name .. "SpawnedInToys")
                            if v1332 and v1332:FindFirstChild("CreatureBlobman") then
                                local vu1333 = v1332.CreatureBlobman
                                local vu1334 = {
                                    vu1333.LeftDetector,
                                    v1328.HumanoidRootPart,
                                    vu1333.LeftDetector.LeftWeld
                                }
                                local v1335, v1336 = pcall(function()
                                    vu1333.BlobmanSeatAndOwnerScript.CreatureGrab:FireServer(unpack(vu1334))
                                end)
                                if not v1335 then
                                    warn("Error firing server event: " .. v1336)
                                end
                            end
                        end
                    end
                end
            end
            wait(grabSpeed)
        end
    end
    MergedHubPort.vu1337 = vu1337

    local function vu1349()
        local v1343 = vu1307
        local v1344, v1345, v1346 = ipairs(v1343:GetPlayers())
        local v1347 = {}
        while true do
            local v1348
            v1346, v1348 = v1344(v1345, v1346)
            if v1346 == nil then
                break
            end
            if not vu1315(v1348.Name) then
                table.insert(v1347, v1348.Name .. " (" .. v1348.DisplayName .. ")")
            end
        end
        vu1342:Refresh(v1347, true)
    end
    MergedHubPort.vu1349 = vu1349

    local function vu1356(p1351)
        local v1352, v1353, v1354 = ipairs(vu1350)
        while true do
            local v1355
            v1354, v1355 = v1352(v1353, v1354)
            if v1354 == nil then
                break
            end
            if v1355 == p1351 then
                return true
            end
        end
        return false
    end
    MergedHubPort.vu1356 = vu1356

    local function vu1377()
        while vu1308 do
            local v1363 = vu1307
            local v1364, v1365, v1366 = pairs(v1363:GetPlayers())
            while true do
                local v1367
                v1366, v1367 = v1364(v1365, v1366)
                if v1366 == nil then
                    break
                end
                if not vu1356(v1367.Name) then
                    local v1368 = v1367.Character
                    if v1368 and v1368:FindFirstChild("HumanoidRootPart") then
                        local v1369 = vu1322
                        local v1370 = workspace:FindFirstChild(v1367.Name .. "SpawnedInToys")
                        if v1370 then
                            v1370 = workspace:FindFirstChild(v1367.Name .. "SpawnedInToys"):FindFirstChild("CreatureBlobman")
                        end
                        local v1371 = v1369(v1370)
                        if v1371 then
                            local v1372 = workspace:FindFirstChild(v1371.Name .. "SpawnedInToys")
                            if v1372 and v1372:FindFirstChild("CreatureBlobman") then
                                local vu1373 = v1372.CreatureBlobman
                                local vu1374 = {
                                    vu1373.RightDetector,
                                    v1368.HumanoidRootPart,
                                    vu1373.RightDetector.RightWeld
                                }
                                local v1375, v1376 = pcall(function()
                                    vu1373.BlobmanSeatAndOwnerScript.CreatureGrab:FireServer(unpack(vu1374))
                                end)
                                if not v1375 then
                                    warn("Error firing server event: " .. v1376)
                                end
                            end
                        end
                    end
                end
            end
            wait(grabSpeed)
        end
    end
    MergedHubPort.vu1377 = vu1377

    local function vu1389()
        local v1383 = vu1307
        local v1384, v1385, v1386 = ipairs(v1383:GetPlayers())
        local v1387 = {}
        while true do
            local v1388
            v1386, v1388 = v1384(v1385, v1386)
            if v1386 == nil then
                break
            end
            if not vu1356(v1388.Name) then
                table.insert(v1387, v1388.Name .. " (" .. v1388.DisplayName .. ")")
            end
        end
        vu1382:Refresh(v1387, true)
    end
    MergedHubPort.vu1389 = vu1389

    function executeScript(pu1434)
        local v1435, v1436 = pcall(function()
            loadstring(game:HttpGet(pu1434, true))()
        end)
        if not v1435 then
            warn("Failed to execute script: " .. v1436)
        end
    end
    MergedHubPort.executeScript = executeScript

    function executeOnce(p1437, p1438)
        if p1438 then
            return p1438
        end
        executeScript(p1437)
        return true
    end
    MergedHubPort.executeOnce = executeOnce

    function setFireAnimationEnabled(enabled)
        if enabled then
            playFireFlailAnimation()
        else
            stopFireFlailAnimation()
        end
    end
    MergedHubPort.setFireAnimationEnabled = setFireAnimationEnabled

    function setMouseTeleportEnabled(enabled)
        teleportActive = enabled == true
        if teleportActive and not mouseTeleportInitialized then
            mouseTeleportInitialized = true
            setupCharacter(localPlayer.Character or localPlayer.CharacterAdded:Wait())
        end
    end
    MergedHubPort.setMouseTeleportEnabled = setMouseTeleportEnabled

    function setSilentAimEnabled(enabled)
        vu550 = enabled == true
        ToggleSilentAim(vu550)
    end
    MergedHubPort.setSilentAimEnabled = setSilentAimEnabled

    function setSilentAimRange(value)
        vu551 = math.clamp(tonumber(value) or vu551, 5, 500)
    end
    MergedHubPort.setSilentAimRange = setSilentAimRange

    function setGrabLineLagEnabled(enabled)
        toggleLag(enabled == true)
    end
    MergedHubPort.setGrabLineLagEnabled = setGrabLineLagEnabled

    function setGrabLineSpeed(value)
        lagSpeed = math.clamp(tonumber(value) or lagSpeed, 0.01, 2)
    end
    MergedHubPort.setGrabLineSpeed = setGrabLineSpeed

    function setLineAllEnabled(enabled)
        if enabled then
            task.spawn(function()
                toggleScript(true)
            end)
        else
            toggleScript(false)
        end
    end
    MergedHubPort.setLineAllEnabled = setLineAllEnabled

    function setLineAllSpeed(value)
        vu327 = math.clamp(tonumber(value) or vu327, 0.01, 2)
    end
    MergedHubPort.setLineAllSpeed = setLineAllSpeed

    function setAutoGrabNearbyEnabled(enabled)
        vu959(enabled == true)
    end
    MergedHubPort.setAutoGrabNearbyEnabled = setAutoGrabNearbyEnabled

    function setVoidRescueEnabled(enabled)
        if enabled and not antiVoidEnabled then
            antiVoidEnabled = true
            task.spawn(checkVoid)
        else
            antiVoidEnabled = enabled == true
        end
    end
    MergedHubPort.setVoidRescueEnabled = setVoidRescueEnabled

    function setGhostNoclipEnabled(enabled)
        toggleNoclip(enabled == true)
    end
    MergedHubPort.setGhostNoclipEnabled = setGhostNoclipEnabled

    function setAntiKickEnabled(enabled)
        toggleActiveAntiKick = enabled == true
        if toggleActiveAntiKick and not antiKickLoopStarted then
            antiKickLoopStarted = true
            task.spawn(runAntiKickLoop)
        end
    end
    MergedHubPort.setAntiKickEnabled = setAntiKickEnabled

    function setBeamCycleEnabled(enabled)
        if enabled and not beamCycleEnabled then
            beamCycleEnabled = true
            task.spawn(function()
                while beamCycleEnabled do
                    updateBeamColors()
                    task.wait(1)
                end
            end)
        else
            beamCycleEnabled = enabled == true
        end
    end
    MergedHubPort.setBeamCycleEnabled = setBeamCycleEnabled

    function setGrabEverythingEnabled(enabled)
        grabEnabled = enabled == true
        if grabEnabled then
            task.spawn(vu313)
        end
    end
    MergedHubPort.setGrabEverythingEnabled = setGrabEverythingEnabled

    function setGrabEverythingSpeed(value)
        grabSpeed = math.clamp(tonumber(value) or grabSpeed, 0.01, 10)
    end
    MergedHubPort.setGrabEverythingSpeed = setGrabEverythingSpeed

    function setGrabAllToysLoopEnabled(enabled)
        handleToggle(enabled == true)
    end
    MergedHubPort.setGrabAllToysLoopEnabled = setGrabAllToysLoopEnabled

    function setBlobDropLoopEnabled(enabled)
        vu1273 = enabled == true
        if vu1273 then
            vu1274 = vu1274 or vu1284()
            task.spawn(startLoop)
        end
    end
    MergedHubPort.setBlobDropLoopEnabled = setBlobDropLoopEnabled

end

if AllunFunctions and AllunFunctions.InstallImportedCompatibility then
    AllunFunctions.InstallImportedCompatibility()
end
