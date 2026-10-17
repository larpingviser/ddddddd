-- [[ ts is generated @ dsc.gg/6vms ]]

local textChatService = game:GetService("TextChatService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
local v1 = game:GetService("Workspace")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local lighting = game:GetService("Lighting")
local debris = game:GetService("Debris")
local tweenService = game:GetService("TweenService")
local coreGui = game:GetService("CoreGui")
task.wait(3)

local function f1()
  local v2 = false
  local v3 = textChatService and textChatService.ChatVersion == Enum.ChatVersion.TextChatService
  local rbxGeneral

  if v3 then
    rbxGeneral = textChatService.TextChannels:FindFirstChild("RBXGeneral")

    if rbxGeneral then
      pcall(function()
        rbxGeneral:SendAsync("Aloe hub script made by suu_2772")
        v2 = true
      end)
    end
  end

  local defaultChatSystemChatEvents

  if not v2 then
    defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")

    if defaultChatSystemChatEvents
      and defaultChatSystemChatEvents:FindFirstChild("SayMessageRequest") then
      pcall(function()
        defaultChatSystemChatEvents.SayMessageRequest:FireServer(
          "Aloe hub script made by suu_2772", "All"
        )

        v2 = true
      end)
    end
  end

  if not v2 then
    print("[Aloe Hub] Aloe hub script made by suu_2772")
  end
end

f1()

game:IsLoaded()
local v4

repeat
  task.wait()
  v4 = game
until v4:IsLoaded()

local v5

repeat
  task.wait()
  v5 = game
until v5:GetService("Players").LocalPlayer

local v6

repeat
  task.wait()
  v6 = game
until v6:GetService("Players").LocalPlayer.Character

local localPlayer = players.LocalPlayer
localPlayer:GetMouse()

local function f2()
  local random = Random.new()

  local instance = Instance.new("ScreenGui", coreGui)
  instance.DisplayOrder = 1000000
  instance.IgnoreGuiInset = true

  local instance2 = Instance.new("Frame", instance)
  instance2.Size = UDim2.new(1, 0, 1, 0)
  instance2.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
  instance2.BorderSizePixel = 0

  local v7 = game

  local instance3 = Instance.new("Sound", v7:GetService("SoundService"))
  instance3.SoundId = "rbxassetid://6097367958"
  instance3.Volume = 3
  instance3:Play()

  local instance4 = Instance.new("Frame", instance2)
  instance4.Size = UDim2.new(0, 200, 0, 200)
  instance4.Position = UDim2.new(0.5, 0, 0.4, 0)
  instance4.AnchorPoint = Vector2.new(0.5, 0.5)
  instance4.BackgroundTransparency = 1

  for i = 1, 8 do
    local instance5 = Instance.new("Frame", instance4)
    instance5.Size = UDim2.new(0, 8, 0, 8)
    instance5.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    instance5.BorderSizePixel = 0
    instance5.Position = UDim2.new(i <= 4 and 0 or 1, 0, i % 2 == 0 and 0 or 1, 0)

    Instance.new("UICorner", instance5).CornerRadius = UDim.new(1, 0)
  end

  local instance6 = Instance.new("TextLabel", instance2)
  instance6.Size = UDim2.new(1, 0, 0, 50)
  instance6.Position = UDim2.new(0, 0, 0.65, 0)
  instance6.BackgroundTransparency = 1
  instance6.Text = "ALOE HUB! | v2.3.1 BOOT"
  instance6.TextColor3 = Color3.fromRGB(0, 255, 255)
  instance6.TextSize = 30
  instance6.Font = Enum.Font.Code

  local instance7 = Instance.new("TextLabel", instance2)
  instance7.Size = UDim2.new(1, 0, 0, 30)
  instance7.Position = UDim2.new(0, 0, 0.75, 0)
  instance7.BackgroundTransparency = 1
  instance7.Text = "LOADING..."
  instance7.TextColor3 = Color3.fromRGB(255, 255, 255)
  instance7.TextSize = 18
  instance7.Font = Enum.Font.Code

  task.spawn(function()
    tweenService:Create(
      instance4, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
      { Rotation = 360 }
    ):Play()

    for j = 1, 12 do
      task.spawn(function()
        for k = 1, 10 do
          local instance8 = Instance.new("Frame", instance2)
          instance8.Size = UDim2.new(0, 5, 0, 5)
          instance8.Position = UDim2.new(0.5, 0, 0.4, 0)
          instance8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

          local nextNumber = random:NextNumber(0, math.pi * 2)
          local nextInteger = random:NextInteger(200, 500)

          tweenService:Create(instance8, TweenInfo.new(0.5), {
            Position = UDim2.new(
              0.5 + math.cos(nextNumber) * nextInteger / 1920, 0,
              0.4 + math.sin(nextNumber) * nextInteger / 1080, 0
            ),
            BackgroundTransparency = 1,
          }):Play()

          task.delay(0.5, function() instance8:Destroy() end)
        end
      end)

      task.wait(0.43)
    end

    tweenService:Create(instance2, TweenInfo.new(0.5), { BackgroundTransparency = 1 }):Play()
    task.wait(0.5)
    instance:Destroy()
  end)
end

local v8

local function f3()
  local v9, v10 = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/jadpy/suki/refs/heads/main/orion"))()
  end)

  if v9 and v10 then
    v8 = v10
    return true
  end

  return false
end

f2()
print("Loading OrionLib...")
local v11 = false

for m = 1, 20 do
  if f3() then
    v11 = true
    print("OrionLib loaded!")
    break
  end

  task.wait(0.5)
end

local f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19, f20, f21, f22,
  f23, f24, f25, f26, f27, f28, f29, f30, f31, f32, f33, f34, f35, f36, f37, f38, grabEvents,
  raycastParams, v12, v13, v14, vector, v15, v16, v17, f39, instance9, instance10, v18, v19,
  v20, match, v21, f40, f41, selectVictimAddDropdown, v22, v23, v24, part, v25, v26,
  findFirstChild, v27, v28, f42, addDropdown, v29, f43, f44, v30, v31, f45, f46, v32, v33,
  connect, v34, v35, w, v36, v37, f47, f48, addDropdown2, f49, f50, v38, v39, v40, v41, v42,
  v43, v44, v45, connect2, v46, v47, v48, v49, v50, connect3, v51, v52, jumpPower, v53, v54,
  v55, bodyVelocity, bodyGyro, connect4

if not v11 then
  warn("OrionLib failed to load")
  return
else
  task.wait(2)

  raycastParams = RaycastParams.new()
  raycastParams.FilterType = Enum.RaycastFilterType.Exclude

  v12 = 500
  v13 = {}
  v14 = {}
  vector = Vector3.new(0, 0, 0)
  v15 = {}
  v16 = { Responsiveness = 0.06 }

  v17 = {
    Height = 6,
    Radius = 22,
    Speed = 18,
    CurrentShape = "Wing",
    LastSwap = 0,
    Order = {},
    FlapStrength = 2.5,
  }

  function f4(p1, p2, p3, p4, p5)
    local speed = p4.Speed
    local height = p4.Height
    local radius = p4.Radius
    local v56 = p1 % 2 == 0 and 1 or -1
    local v57 = math.ceil(p1 / 2)
    local v58 = p1 * (math.pi * 2) / p2 + p3 * (speed / 5)

    if p4.CurrentShape == "VerticalHeart" then
      local v59 = p1 / p2 * math.pi * 2
      local v60 = math.sin(v59)
      local v61 = math.cos(v59)
      local v62 = math.cos(2 * v59)
      local v63 = math.cos(3 * v59)
      local v64 = math.cos(4 * v59)

      return p5.CFrame:VectorToWorldSpace(Vector3.new(16 * v60 ^ 3 * (radius / 25)
        * (1 + math.sin(p3 * (speed / 4)) * 0.1), (13 * v61 - 5 * v62 - 2 * v63 - v64)
          * (radius / 25)
        + height, 4))
    elseif p4.CurrentShape == "Wing" then
      return p5.CFrame:VectorToWorldSpace(Vector3.new(v56 * 1.5 + v56 * (v57 * (radius / 15)), height
        + math.sin(p3 * (speed / 4) - v57 * 0.3) * (p4.FlapStrength or 2.5), 1.5))
    elseif p4.CurrentShape == "DNA" then
      local v65 = p1 / p2 * radius - radius / 2
      local v66 = v65 * 0.4 + p3 * (speed / 3)

      return p5.CFrame:VectorToWorldSpace(Vector3.new(
        math.cos(v66 + v56 * math.pi) * 5, v65 + height, math.sin(v66 + v56 * math.pi) * 5
      ))
    elseif p4.CurrentShape == "Circle" then
      return p5.CFrame:VectorToWorldSpace(Vector3.new(
        math.cos(v58) * radius, height, math.sin(v58) * radius
      ))
    elseif p4.CurrentShape == "Lotus" then
      local v67 = radius * (0.7 + 0.3 * math.sin(p3 * (speed / 3) + p1))

      return p5.CFrame:VectorToWorldSpace(Vector3.new(
        math.cos(v58) * v67, height + math.sin(p3 * (speed / 2) + p1) * 3, math.sin(v58) * v67
      ))
    else
      if p4.CurrentShape == "Planet" then
        local v68 = radius * (0.8 + 0.2 * math.sin(p3 * (speed / 5)))

        return p5.CFrame:VectorToWorldSpace(Vector3.new(math.cos(v58) * v68, height
          + math.sin(p3 * (speed / 3) + p1) * 2, math.sin(v58) * v68))
      end

      return Vector3.new(math.cos(v58) * radius, height, math.sin(v58) * radius)
    end
  end

  function f39(p6, p7)
    local basePart = p6:IsA("BasePart") and p6 or p6.PrimaryPart
      or p6:FindFirstChildWhichIsA("BasePart", true)

    if basePart then
      pcall(function()
        if basePart:CanSetNetworkOwnership() then
          basePart:SetNetworkOwner(localPlayer)
        end
      end)

      basePart.Anchored = false

      for key, value in pairs(basePart:GetChildren()) do
        if value.Name == "AloeBP" or value.Name == "AloeBG" then
          value:Destroy()
        end
      end

      local aloeBP = Instance.new("BodyPosition", basePart)
      aloeBP.Name = "AloeBP"
      aloeBP.MaxForce = Vector3.new(1, 1, 1) * 1000000000
      aloeBP.P = 45000
      aloeBP.D = 1200

      local aloeBG = Instance.new("BodyGyro", basePart)
      aloeBG.Name = "AloeBG"
      aloeBG.MaxTorque = Vector3.new(1, 1, 1) * 1000000000

      for key2, value2 in pairs(p6:GetDescendants()) do
        if value2:IsA("BasePart") then
          value2.CanCollide = false
          value2.CanTouch = false
        end
      end

      if not table.find(p7, p6) then
        table.insert(p7, p6)
      end
    end
  end

  local v69 = game
  local instance11 = Instance.new("ScreenGui", v69:GetService("CoreGui"))

  instance9 = Instance.new("Frame", instance11)
  instance9.Size = UDim2.new(0, 180, 0, 180)
  instance9.Position = UDim2.new(0.01, 0, 0.02, 0)
  instance9.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
  instance9.BorderColor3 = Color3.fromRGB(255, 105, 180)
  instance9.BorderSizePixel = 2
  instance9.ClipsDescendants = true
  instance9.Visible = false
  instance9.Active = true

  for n = 1, 12 do
    v13[n] = {}

    for i6 = 1, 12 do
      local instance12 = Instance.new("Frame", instance9)
      instance12.Size = UDim2.new(0.08333333333333333, 0, 0.08333333333333333, 0)
      instance12.Position = UDim2.new((n - 1) / 12, 0, (i6 - 1) / 12, 0)
      instance12.BorderSizePixel = 0
      instance12.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

      v13[n][i6] = instance12
    end
  end

  local v70 = game
  local instance13 = Instance.new("ScreenGui", v70:GetService("CoreGui"))

  instance10 = Instance.new("Frame", instance13)
  instance10.Size = UDim2.new(0, 150, 0, 120)
  instance10.Position = UDim2.new(0.01, 0, 0.75, 0)
  instance10.BackgroundTransparency = 1
  instance10.Visible = false

  local function f51(p8, zindex)
    local instance14 = Instance.new("ImageLabel", instance10)
    instance14.Size = UDim2.new(1, 0, 1, 0)
    instance14.BackgroundTransparency = 1
    instance14.Image = "rbxassetid://" .. p8
    instance14.ZIndex = zindex
    instance14.ResampleMode = Enum.ResamplerMode.Pixelated

    return instance14
  end

  f51("13583091924", 500)

  v18 = f51("13583103443", 501)
  v19 = f51("13583115456", 501)
  v18.Visible = false
  v19.Visible = false
  local window = v8:MakeWindow({ Name = "Aloe Hub Ftap", HidePremium = true })

  local tab = window:MakeTab({ Name = "Main / Chat / Cat" })

  tab:AddTextbox({
    Name = "Spam Chat",
    Default = "",
    TextDisappear = true,
    Callback = function(value3)
      if textChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local rbxGeneral2 = textChatService.TextChannels:FindFirstChild("RBXGeneral")

        if rbxGeneral2 then
          rbxGeneral2:SendAsync(value3)
        end
      end
    end,
  })

  tab:AddToggle({
    Name = "Отображение Bongo Cat",
    Default = false,
    Callback = function(value4) instance10.Visible = value4 end,
  })

  tab:AddButton({
    Name = "Снятие ограничения камеры",
    Callback = function() localPlayer.CameraMaxZoomDistance = 10000 end,
  })

  local minimapTPTab = window:MakeTab({ Name = "Minimap TP" })

  minimapTPTab:AddToggle({
    Name = "Отображение мини-карты",
    Default = false,
    Callback = function(value5) instance9.Visible = value5 end,
  })

  minimapTPTab:AddSlider({
    Name = "Уровень зума",
    Min = 50,
    Max = 1000,
    Default = 500,
    Callback = function(value6) v12 = value6 end,
  })

  minimapTPTab:AddParagraph(
    "Info", "Клик по карте для TP с защитой от застревания, перетаскивание для перемещения UI."
  )

  local cosmosControlTab = window:MakeTab({ Name = "Cosmos Control" })

  cosmosControlTab:AddButton({
    Name = "Синхронизация Sparkler (FireworkSparkler)",
    Callback = function()
      for key3, value7 in pairs(v1:GetDescendants()) do
        if value7.Name:find("FireworkSparkler") then
          f39(value7, v15)
        end
      end
    end,
  })

  cosmosControlTab:AddSlider({
    Name = "Радиус / Размер",
    Min = 2,
    Max = 300,
    Default = v17.Radius,
    Callback = function(value8) v17.Radius = value8 end,
  })

  cosmosControlTab:AddSlider({
    Name = "Высота (Height)",
    Min = -50,
    Max = 100,
    Default = v17.Height,
    Callback = function(value9) v17.Height = value9 end,
  })

  cosmosControlTab:AddSlider({
    Name = "Скорость вращения (Speed)",
    Min = 0,
    Max = 100,
    Default = v17.Speed,
    Callback = function(value10) v17.Speed = value10 end,
  })

  cosmosControlTab:AddSlider({
    Name = "Сила крыльев (только Wing)",
    Min = 0,
    Max = 20,
    Default = 2.5,
    Callback = function(value11) v17.FlapStrength = value11 end,
  })

  for key4, value12 in pairs({ "Wing", "VerticalHeart", "DNA", "Circle", "Lotus", "Planet" }) do
    local v71 = value12

    cosmosControlTab:AddButton({
      Name = "Форма: " .. v71,
      Callback = function() v17.CurrentShape = v71 end,
    })
  end

  instance9.InputBegan:Connect(function(input)
    local v72, position, position2, connect5, connect6

    if input.UserInputType == Enum.UserInputType.MouseButton1 then
      v72 = true
      position = input.Position
      position2 = instance9.Position
      connect5 = nil
      connect6 = nil

      connect5 = userInputService.InputChanged:Connect(function(input2)
        if input2.UserInputType == Enum.UserInputType.MouseMovement and v72 then
          local v73 = input2.Position - position

          instance9.Position = UDim2.new(
            position2.X.Scale, position2.X.Offset + v73.X, position2.Y.Scale,
            position2.Y.Offset + v73.Y
          )
        end
      end)

      connect6 = userInputService.InputEnded:Connect(function(input3)
        if input3.UserInputType == Enum.UserInputType.MouseButton1 then
          v72 = false
          connect5:Disconnect()
          connect6:Disconnect()

          if (input3.Position - position).Magnitude < 5 and localPlayer.Character then
            local humanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart then
              local v74 = humanoidRootPart.Position.X
                + ((input3.Position.X - instance9.AbsolutePosition.X) / instance9.AbsoluteSize.X
                    - 0.5)
                  * v12

              local v75 = humanoidRootPart.Position.Z
                + ((input3.Position.Y - instance9.AbsolutePosition.Y) / instance9.AbsoluteSize.Y
                    - 0.5)
                  * v12

              local raycast = v1:Raycast(
                Vector3.new(v74, 1000, v75), Vector3.new(0, -2000, 0), raycastParams
              )

              local y = raycast and raycast.Position.Y or humanoidRootPart.Position.Y
              humanoidRootPart.CFrame = CFrame.new(v74, y + 4, v75)
            end
          end
        end
      end)
    end
  end)

  runService.Heartbeat:Connect(function()
    local character = localPlayer.Character
    local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart2 then
      return
    else
      if instance9.Visible and (humanoidRootPart2.Position - vector).Magnitude > 4 then
        vector = humanoidRootPart2.Position
        raycastParams.FilterDescendantsInstances = { character }

        for i7 = 1, 12 do
          for i8 = 1, 12 do
            local raycast2 = v1:Raycast(humanoidRootPart2.Position + Vector3.new(
              ((i7 - 1) / 11 - 0.5) * v12, 100, ((i8 - 1) / 11 - 0.5) * v12
            ), Vector3.new(0, -200, 0), raycastParams)

            if raycast2 then
              local v76 = math.clamp((raycast2.Position.Y - humanoidRootPart2.Position.Y + 20)
                / 40, 0, 1)

              v13[i7][i8].BackgroundColor3 = Color3.fromRGB(
                30 + v76 * 40, 60 + v76 * 80, 30 + v76 * 40
              )
            else
              v13[i7][i8].BackgroundColor3 = Color3.fromRGB(10, 10, 15)
            end
          end
        end
      end

      if instance9.Visible then
        for key5, value13 in pairs(players:GetPlayers()) do
          local humanoidRootPart3 = value13.Character
            and value13.Character:FindFirstChild("HumanoidRootPart")

          if humanoidRootPart3 then
            local v77 = v14[value13.Name]

            local function f52()
              local instance15 = Instance.new("Frame", instance9)
              instance15.Size = UDim2.new(0, 6, 0, 6)
              instance15.ZIndex = 10

              Instance.new("UICorner", instance15).CornerRadius = UDim.new(1, 0)
              return instance15
            end

            local v78 = v77 or f52()
            v14[value13.Name] = v78

            v78.BackgroundColor3 = value13 == localPlayer and Color3.fromRGB(0, 255, 255)
              or Color3.fromRGB(255, 50, 50)

            local v79 = (humanoidRootPart3.Position.X - humanoidRootPart2.Position.X) / v12
            local v80 = (humanoidRootPart3.Position.Z - humanoidRootPart2.Position.Z) / v12

            v78.Position = UDim2.new(0.5 + v79, -3, 0.5 + v80, -3)
            v78.Visible = math.abs(v79) < 0.5 and math.abs(v80) < 0.5
          end
        end
      end

      local v81 = tick()
      local v82 = humanoidRootPart2.AssemblyLinearVelocity * v16.Responsiveness

      for key6, value14 in pairs(v15) do
        local basePart2 = value14:IsA("BasePart") and value14 or value14.PrimaryPart
        local aloeBP2 = basePart2 and basePart2:FindFirstChild("AloeBP")
        local aloeBG2 = basePart2 and basePart2:FindFirstChild("AloeBG")

        if aloeBP2 and aloeBG2 then
          local v83 = f4(key6, #v15, v81, v17, humanoidRootPart2)
          aloeBP2.Position = humanoidRootPart2.Position + v82 + v83

          aloeBG2.CFrame = CFrame.new(
            basePart2.Position, humanoidRootPart2.Position + Vector3.new(0, 2, 0)
          )
        end
      end

      return
    end
  end)

  userInputService.InputBegan:Connect(function(input4, p9)
    if p9 or not instance10.Visible then
      return
    end

    if input4.KeyCode.Name:match("[WASD]") then
      v18.Visible = true
    elseif input4.KeyCode == Enum.KeyCode.Space then
      v19.Visible = true
    end
  end)

  userInputService.InputEnded:Connect(function(input5)
    if input5.KeyCode.Name:match("[WASD]") then
      v18.Visible = false
    elseif input5.KeyCode == Enum.KeyCode.Space then
      v19.Visible = false
    end
  end)

  v20 = {}

  function f5(p10)
    local basePart3 = p10:IsA("BasePart") and p10 or p10.PrimaryPart
      or p10:FindFirstChildWhichIsA("BasePart", true)

    if not basePart3 then
      return
    end

    basePart3.Anchored = true
    basePart3.CanCollide = false
    basePart3.CanTouch = false
    basePart3.CanQuery = false

    for key7, value15 in pairs(basePart3:GetChildren()) do
      if value15.Name:find("Aloe") or value15:IsA("BodyMover") or value15:IsA("Constraint") then
        value15:Destroy()
      end
    end

    if not table.find(v20, p10) then
      table.insert(v20, p10)
    end
  end

  local televisionMirrorTab = window:MakeTab({ Name = "Television Mirror" })
  televisionMirrorTab:AddSection({ Name = "Television Control" })

  televisionMirrorTab:AddToggle({
    Name = "Television 追従",
    Default = false,
    Callback = function(value16) end,
  })

  televisionMirrorTab:AddButton({
    Name = "Television 同期 (ゴースト化)",
    Callback = function()
      for key8, value17 in pairs(v1:GetDescendants()) do
        if value17.Name == "Television" or value17:FindFirstChild("Screen") then
          f5(value17)
        end
      end
    end,
  })

  televisionMirrorTab:AddSection({ Name = "TV Config " })

  televisionMirrorTab:AddSlider({
    Name = "Радиус / Radius",
    Min = 2,
    Max = 300,
    Default = 22,
    Callback = function(value18) end,
  })

  televisionMirrorTab:AddSlider({
    Name = "Высота / Height",
    Min = -50,
    Max = 100,
    Default = 6,
    Callback = function(value19) end,
  })

  televisionMirrorTab:AddSlider({
    Name = "Скорость вращения / Speed",
    Min = 0,
    Max = 100,
    Default = 18,
    Callback = function(value20) end,
  })

  televisionMirrorTab:AddSlider({
    Name = "Сила крыльев (Wing)",
    Min = 0,
    Max = 20,
    Default = 2.5,
    Callback = function(value21) end,
  })

  for key9, value22 in pairs({ "Wing", "VerticalHeart", "DNA", "Circle", "Lotus", "Planet" }) do
    televisionMirrorTab:AddButton({ Name = "Форма: " .. value22, Callback = function() end })
  end

  function f6(p11)
    local findFirstChild2 = players:FindFirstChild(p11)

    if findFirstChild2 and findFirstChild2.Character
      and findFirstChild2.Character:FindFirstChild("Humanoid") then
      findFirstChild2.Character.Humanoid.Health = 0
      return true
    end

    return false
  end

  function f7()
    local character2 = localPlayer.Character

    if not character2 then
      return nil
    else
      local humanoid = character2:FindFirstChildOfClass("Humanoid")

      if not humanoid or not humanoid.SeatPart then
        return nil
      else
        local seatPart = humanoid.SeatPart

        if seatPart:IsA("VehicleSeat") and seatPart.Parent
          and seatPart.Parent.Name == "CreatureBlobman" then
          return seatPart.Parent
        end

        return nil
      end
    end
  end

  match = nil
  v21 = false

  function f8()
    local v84 = {}

    for key10, value23 in pairs(players:GetPlayers()) do
      if value23 ~= localPlayer then
        table.insert(v84, value23.DisplayName .. " (@" .. value23.Name .. ")")
      end
    end

    return v84
  end

  function f9(p12)
    local v85 = f7()

    if not v85 or v21 then
      return
    end

    local findFirstChild3 = players:FindFirstChild(p12)
    local creatureGrab, creatureRelease, leftDetector, humanoidRootPart4

    if not findFirstChild3 or not findFirstChild3.Character then
      return
    else
      local blobmanSeatAndOwnerScript = v85:FindFirstChild("BlobmanSeatAndOwnerScript")

      creatureGrab = blobmanSeatAndOwnerScript
        and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")

      creatureRelease = blobmanSeatAndOwnerScript
        and blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")

      leftDetector = v85:FindFirstChild("LeftDetector")
      local leftWeld = leftDetector and leftDetector:FindFirstChild("LeftWeld")
      humanoidRootPart4 = findFirstChild3.Character:FindFirstChild("HumanoidRootPart")

      if not (creatureGrab and creatureRelease and leftDetector and leftWeld and humanoidRootPart4) then
        v8:MakeNotification({
          Name = "Error",
          Content = "Детали или события не обнаружены",
          Time = 3,
        })

        return
      end

      v21 = true
      f40(p12)

      task.wait(0.1)

      task.spawn(function()
        while v21 do
          if not findFirstChild3.Character or not humanoidRootPart4.Parent then
            break
          end

          creatureGrab:FireServer(leftDetector, humanoidRootPart4, leftWeld)
          runService.Heartbeat:Wait()
          creatureRelease:FireServer(leftWeld, humanoidRootPart4)
          runService.Heartbeat:Wait()
        end

        v21 = false
      end)

      return
    end
  end

  function f40(p13)
    local findFirstChild4 = players:FindFirstChild(p13)

    if findFirstChild4 and findFirstChild4.Character
      and findFirstChild4.Character:FindFirstChild("HumanoidRootPart") then
      local humanoidRootPart5 = findFirstChild4.Character.HumanoidRootPart

      local humanoidRootPart6 = localPlayer.Character
        and localPlayer.Character:FindFirstChild("HumanoidRootPart")

      if humanoidRootPart6 then
        humanoidRootPart6.CFrame = humanoidRootPart5.CFrame * CFrame.new(0, 0, 2.5)
      end

      return true
    end

    return false
  end

  function f41(p14)
    local v86 = f7()

    if not v86 then
      return
    else
      local blobmanSeatAndOwnerScript2 = v86:FindFirstChild("BlobmanSeatAndOwnerScript")

      local creatureGrab2 = blobmanSeatAndOwnerScript2
        and blobmanSeatAndOwnerScript2:FindFirstChild("CreatureGrab")

      local creatureRelease2 = blobmanSeatAndOwnerScript2
        and blobmanSeatAndOwnerScript2:FindFirstChild("CreatureRelease")

      local leftDetector2 = v86:FindFirstChild("LeftDetector")
      local leftWeld2 = leftDetector2 and leftDetector2:FindFirstChild("LeftWeld")
      local findFirstChild5 = players:FindFirstChild(p14)

      local humanoidRootPart7 = findFirstChild5 and findFirstChild5.Character
        and findFirstChild5.Character:FindFirstChild("HumanoidRootPart")

      if not (creatureGrab2 and creatureRelease2 and leftDetector2 and leftWeld2
        and humanoidRootPart7) then
        return
      else
        local cframe = localPlayer.Character
            and localPlayer.Character:FindFirstChild("HumanoidRootPart")
            and localPlayer.Character.HumanoidRootPart.CFrame
          or CFrame.new()

        f40(p14)
        task.wait(0.18)
        f6(p14)

        for i9 = 1, 4 do
          creatureGrab2:FireServer(leftDetector2, humanoidRootPart7, leftWeld2)
          runService.Heartbeat:Wait()
          creatureRelease2:FireServer(leftWeld2, humanoidRootPart7)
          runService.Heartbeat:Wait()
        end

        local humanoidRootPart8 = localPlayer.Character
          and localPlayer.Character:FindFirstChild("HumanoidRootPart")

        if humanoidRootPart8 then
          humanoidRootPart8.CFrame = cframe
        end

        return
      end
    end
  end

  function f10(p15, p16, p17, p18)
    local v87 = {}

    if p18 == 0 then
      return v87
    end

    for i10 = 1, p18 do
      local v88 = p16 + (p17 - p16) * ((i10 - 1) / (p18 - 1))
      local v89 = (i10 - 1) * (math.pi * 2 / p18) * 3
      local v90 = math.cos(v89)
      local v91 = math.sin(v89)
      table.insert(v87, { x = p15.X + v88 * v90, z = p15.Z + v88 * v91 })
    end

    return v87
  end

  function f11(p19, p20, p21, p22)
    local v92 = {}

    if p22 == 0 then
      return v92
    else
      local v93 = math.floor(p22 / 2)
      local v94 = p22 - v93
      local v95 = math.pi * 2 / math.max(v93, 1)

      for i11 = 1, v93 do
        local v96 = (i11 - 1) * v95
        local v97 = math.cos(v96)
        local v98 = math.sin(v96)
        table.insert(v92, { x = p19.X + p20 * v97, z = p19.Z + p20 * v98 })
      end

      local v99 = math.pi * 2 / math.max(v94, 1)

      for i12 = 1, v94 do
        local v100 = (i12 - 1) * v99 + math.pi / v94
        local v101 = math.cos(v100)
        local v102 = math.sin(v100)
        table.insert(v92, { x = p19.X + p21 * v101, z = p19.Z + p21 * v102 })
      end

      return v92
    end
  end

  local blobmanTab = window:MakeTab({
    Name = "Blobman",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false,
  })

  function f12()
    return localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
  end

  blobmanTab:AddSection({ Name = "Настройка цели" })

  function f13(p23)
    if not p23 then
      return
    end

    for index, value24 in ipairs(p23:GetDescendants()) do
      local v103 = value24

      if v103:IsA("BasePart") then
        pcall(function() v103.Anchored = false end)
      end
    end
  end

  local options = f8()

  function f14()
    local v104 = {}

    for index2, value25 in ipairs(players:GetPlayers()) do
      if value25 ~= localPlayer then
        table.insert(v104, value25.Name)
      end
    end

    return v104
  end

  selectVictimAddDropdown = blobmanTab:AddDropdown({
    Name = "Select Victim",
    Default = "",
    Options = options,
    Callback = function(value26)
      if value26 and value26 ~= "" then
        match = value26:match("%@(.*)%)")
      end
    end,
  })

  function f15()
    local v105 = {}

    for index3, value27 in ipairs(players:GetPlayers()) do
      if value27 ~= localPlayer then
        table.insert(v105, value27)
      end
    end

    return v105
  end

  blobmanTab:AddButton({
    Name = "Сбросить список игроков",
    Callback = function() selectVictimAddDropdown:Refresh(f8(), true) end,
  })

  function f16(p24, p25)
    if not p24 or not p25 or not p25.Character then
      return
    end

    local humanoidRootPart9 = p25.Character:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart9 then
      return
    end

    local blobmanSeatAndOwnerScript3 = p24:FindFirstChild("BlobmanSeatAndOwnerScript")

    if not blobmanSeatAndOwnerScript3 then
      return
    end

    pcall(function()
      if blobmanSeatAndOwnerScript3:FindFirstChild("CreatureGrab") then
        blobmanSeatAndOwnerScript3.CreatureGrab:FireServer(
          p24.LeftDetector, humanoidRootPart9, p24.LeftDetector.LeftWeld
        )
      end

      if blobmanSeatAndOwnerScript3:FindFirstChild("CreatureRelease") then
        blobmanSeatAndOwnerScript3.CreatureRelease:FireServer(p24.LeftDetector.LeftWeld)
      end
    end)
  end

  blobmanTab:AddSection({ Name = "Execution Commands" })

  blobmanTab:AddButton({
    Name = "Телепорт",
    Callback = function()
      if match then
        f40(match)
      end
    end,
  })

  blobmanTab:AddButton({
    Name = "Запуск быстрого захвата в цикле",
    Callback = function()
      if match then
        f9(match)
      end
    end,
  })

  function f17(p26, p27)
    if not p26 or not p27 or not p27.Character then
      return
    end

    local humanoidRootPart10 = p27.Character:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart10 then
      return
    end

    local blobmanSeatAndOwnerScript4 = p26:FindFirstChild("BlobmanSeatAndOwnerScript")

    if not blobmanSeatAndOwnerScript4
      or not blobmanSeatAndOwnerScript4:FindFirstChild("CreatureGrab") then
      return
    end

    pcall(function()
      blobmanSeatAndOwnerScript4.CreatureGrab:FireServer(
        p26.LeftDetector, humanoidRootPart10, p26.LeftDetector.LeftWeld
      )

      blobmanSeatAndOwnerScript4.CreatureGrab:FireServer(
        p26.RightDetector, humanoidRootPart10, p26.RightDetector.RightWeld
      )
    end)
  end

  blobmanTab:AddButton({ Name = "Остановить цикл захвата", Callback = function() v21 = false end })
  blobmanTab:AddSection({ Name = "Быстрый килл" })

  function f18(p28, p29, p30)
    local v106 = {}

    if p30 == 0 then
      return v106
    else
      local v107 = math.pi * 2 / p30

      for i13 = 1, p30 do
        local v108 = (i13 - 1) * v107
        local v109 = math.cos(v108)
        local v110 = math.sin(v108)
        table.insert(v106, { x = p28.X + p29 * v109, z = p28.Z + p29 * v110 })
      end

      return v106
    end
  end

  blobmanTab:AddButton({
    Name = "kill",
    Callback = function()
      if match then
        f41(match)
      end
    end,
  })

  task.spawn(function()
    while true do
      task.wait(0.5)
    end
  end)

  function f19()
    local humanoidRootPart11 = localPlayer.Character
      and localPlayer.Character:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart11 then
      return
    else
      local v111 = {
        [1] = "CreatureBlobman",
        [2] = humanoidRootPart11.CFrame * CFrame.new(0, 5, -5),
        [3] = Vector3.new(0, 27.4, 0),
      }

      local spawnToyRemoteFunction = replicatedStorage:FindFirstChild("MenuToys")
        and replicatedStorage.MenuToys:FindFirstChild("SpawnToyRemoteFunction")

      if spawnToyRemoteFunction then
        spawnToyRemoteFunction:InvokeServer(unpack(v111))
      end

      return
    end
  end

  v22 = false

  blobmanTab:AddSection({ Name = "Spawner" })

  blobmanTab:AddButton({
    Name = "Призвать Blobman",
    Callback = function()
      f19()

      v8:MakeNotification({
        Name = "Blobman",
        Content = "Призыв успешен! Садись!",
        Time = 3,
      })
    end,
  })

  function f20()
    for key11, value28 in pairs(v1:GetDescendants()) do
      if value28.Name == "CreatureBlobman" then
        local vehicleSeat = value28:FindFirstChild("VehicleSeat")

        if vehicleSeat and vehicleSeat:FindFirstChild("SeatWeld") then
          local part1 = vehicleSeat.SeatWeld.Part1

          if part1 and part1:IsDescendantOf(localPlayer.Character) then
            return value28
          end
        end
      end
    end

    return nil
  end

  blobmanTab:AddToggle({
    Name = "Blobman kill player",
    Default = false,
    Callback = function(value29)
      v22 = value29

      if value29 then
        if not match then
          v8:MakeNotification({
            Name = "Error",
            Content = "Выбери цель в выпадающем списке!",
            Time = 3,
          })

          v22 = false
          return
        end

        task.spawn(function()
          v8:MakeNotification({
            Name = "Lock On",
            Content = "Буду упорно преследовать " .. match,
            Time = 3,
          })

          while v22 do
            local v112 = f7()
            local findFirstChild6 = players:FindFirstChild(match)

            if findFirstChild6 and findFirstChild6.Character and v112 then
              local humanoidRootPart12 = findFirstChild6.Character:FindFirstChild("HumanoidRootPart")
              local humanoid2 = findFirstChild6.Character:FindFirstChild("Humanoid")

              if humanoidRootPart12 and humanoid2 and humanoid2.Health > 0 then
                local humanoidRootPart13 = localPlayer.Character
                  and localPlayer.Character:FindFirstChild("HumanoidRootPart")

                if humanoidRootPart13 then
                  humanoidRootPart13.CFrame = humanoidRootPart12.CFrame * CFrame.new(0, 0, 2.5)
                end

                task.wait(0.05)
                local blobmanSeatAndOwnerScript5 = v112:FindFirstChild("BlobmanSeatAndOwnerScript")

                local creatureGrab3 = blobmanSeatAndOwnerScript5
                  and blobmanSeatAndOwnerScript5:FindFirstChild("CreatureGrab")

                local creatureRelease3 = blobmanSeatAndOwnerScript5
                  and blobmanSeatAndOwnerScript5:FindFirstChild("CreatureRelease")

                local leftDetector3 = v112:FindFirstChild("LeftDetector")
                local leftWeld3 = leftDetector3 and leftDetector3:FindFirstChild("LeftWeld")

                if creatureGrab3 and creatureRelease3 and leftDetector3 and leftWeld3 then
                  for i14 = 1, 150 do
                    creatureGrab3:FireServer(leftDetector3, humanoidRootPart12, leftWeld3)
                    creatureRelease3:FireServer(leftWeld3, humanoidRootPart12)
                  end
                end

                humanoid2.Health = 0
              end
            elseif not findFirstChild6 then
              v22 = false

              v8:MakeNotification({
                Name = "Info",
                Content = "Цель сбежала!",
                Time = 3,
              })

              break
            end

            task.wait(0.5)
          end
        end)

        return
      end
    end,
  })

  v23 = false
  blobmanTab:AddSection({ Name = "all kill roop" })

  function f21(p31, p32, p33)
    if not p31 or not p32 then
      return
    end

    for i15 = 1, p33 do
      local humanoidRootPart14 = "Character"
      local v113 = p32[humanoidRootPart14]
      local v114 = v113

      if v113 then
        humanoidRootPart14 = p32.Character:FindFirstChild("HumanoidRootPart")
        v114 = humanoidRootPart14
      end

      local v115 = v114

      if not v115 then
        break
      else
        local blobmanSeatAndOwnerScript6 = p31:FindFirstChild("BlobmanSeatAndOwnerScript")

        if blobmanSeatAndOwnerScript6
          and blobmanSeatAndOwnerScript6:FindFirstChild("CreatureGrab") then
          pcall(function()
            blobmanSeatAndOwnerScript6.CreatureGrab:FireServer(
              p31.LeftDetector, v115, p31.LeftDetector.LeftWeld
            )

            blobmanSeatAndOwnerScript6.CreatureGrab:FireServer(
              p31.RightDetector, v115, p31.RightDetector.RightWeld
            )
          end)
        end

        task.wait(0.02)
      end
    end
  end

  function f22(p34)
    if not p34 then
      return false
    end

    local grabEvents2 = replicatedStorage:FindFirstChild("GrabEvents")

    if not grabEvents2 then
      return false
    end

    pcall(function()
      if grabEvents2:FindFirstChild("SetNetworkOwner") then
        grabEvents2.SetNetworkOwner:FireServer(p34, CFrame.new(p34.Position))
      end

      if grabEvents2:FindFirstChild("DestroyGrabLine") then
        grabEvents2.DestroyGrabLine:FireServer(p34)
      end
    end)

    return true
  end

  blobmanTab:AddToggle({
    Name = "Цикл убийства всех",
    Default = false,
    Callback = function(value30)
      v23 = value30

      if value30 then
        task.spawn(function()
          v8:MakeNotification({
            Name = "System",
            Content = "Запущен режим уничтожения тел",
            Time = 3,
          })

          while v23 do
            local v116 = f7()

            if not v116 then
              v23 = false
              break
            else
              local blobmanSeatAndOwnerScript7 = v116:FindFirstChild("BlobmanSeatAndOwnerScript")

              local creatureGrab4 = blobmanSeatAndOwnerScript7
                and blobmanSeatAndOwnerScript7:FindFirstChild("CreatureGrab")

              local creatureRelease4 = blobmanSeatAndOwnerScript7
                and blobmanSeatAndOwnerScript7:FindFirstChild("CreatureRelease")

              local leftDetector4 = v116:FindFirstChild("LeftDetector")
              local leftWeld4 = leftDetector4 and leftDetector4:FindFirstChild("LeftWeld")

              if creatureGrab4 and creatureRelease4 and leftDetector4 and leftWeld4 then
                for key12, value31 in pairs(players:GetPlayers()) do
                  if not v23 then
                    break
                  end

                  if value31 ~= localPlayer and value31.Character then
                    local character3 = value31.Character
                    local humanoidRootPart15 = character3:FindFirstChild("HumanoidRootPart")
                    local humanoid3 = character3:FindFirstChildOfClass("Humanoid")

                    if humanoidRootPart15 and humanoid3 and humanoid3.Health > 0 then
                      humanoid3.BreakJointsOnDeath = false

                      local humanoidRootPart16 = localPlayer.Character
                        and localPlayer.Character:FindFirstChild("HumanoidRootPart")

                      if humanoidRootPart16 then
                        humanoidRootPart16.CFrame = humanoidRootPart15.CFrame
                          * CFrame.new(0, 0, 3)
                      end

                      task.wait(0.05)

                      for i16 = 1, 100 do
                        creatureGrab4:FireServer(leftDetector4, humanoidRootPart15, leftWeld4)
                        creatureRelease4:FireServer(leftWeld4, humanoidRootPart15)

                        if i16 % 25 == 0 then
                          task.wait()
                        end
                      end

                      humanoid3.Health = 0
                      humanoid3:ChangeState(Enum.HumanoidStateType.Dead)

                      creatureRelease4:FireServer(leftWeld4, humanoidRootPart15)

                      task.delay(3, function()
                        if character3 and character3.Parent then
                          for key13, value32 in pairs(character3:GetDescendants()) do
                            if value32:IsA("BasePart") then
                              value32:Destroy()
                            end
                          end
                        end
                      end)

                      task.wait(0.15)
                    end
                  end
                end
              end

              task.wait(0.5)
            end
          end
        end)
      end
    end,
  })

  v24 = false
  part = nil

  blobmanTab:AddToggle({
    Name = "🌪️ Убийственный торнадо (Kill Tornado)",
    Default = false,
    Callback = function(value33)
      v24 = value33

      if v24 then
        part = Instance.new("Part")
        part.Shape = Enum.PartType.Ball
        part.Size = Vector3.new(6, 6, 6)
        part.Material = Enum.Material.Neon
        part.BrickColor = BrickColor.new("Deep orange")
        part.CanCollide = false
        part.Anchored = true
        part.Parent = workspace

        task.spawn(function()
          local total = 0

          while v24 do
            if localPlayer.Character
              and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
              total = total + 0.3
              local v117 = math.cos(total)
              local v118 = math.sin(total)
              local vector2 = Vector3.new(v117 * 6, 6, v118 * 6)
              part.CFrame = localPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(vector2)

              for key14, value34 in pairs(players:GetPlayers()) do
                if value34 ~= localPlayer and value34.Character
                  and value34.Character:FindFirstChild("Humanoid") then
                  if (part.Position - value34.Character.HumanoidRootPart.Position).Magnitude < 8 then
                    local humanoid4 = value34.Character.Humanoid

                    if humanoid4 and humanoid4.Health > 0 then
                      humanoid4.BreakJointsOnDeath = false
                      humanoid4.Health = 0
                      humanoid4:ChangeState(Enum.HumanoidStateType.Dead)
                    end
                  end
                end
              end
            end

            task.wait()
          end

          if part then
            part:Destroy()
          end
        end)
      elseif part then
        part:Destroy()
      end
    end,
  })

  v25 = 0
  v26 = {}
  findFirstChild = nil
  v27 = "circle"

  function f23(p35, x, z, p36, fn, ...)
    local v119 = fn({ X = x, Z = z }, ...)

    for index4, value35 in ipairs(p35) do
      if value35.Character and v119[index4] then
        local humanoidRootPart17 = value35.Character:FindFirstChild("HumanoidRootPart")

        if humanoidRootPart17 then
          humanoidRootPart17.CFrame = CFrame.new(v119[index4].x, v28 + p36, v119[index4].z)
        end
      end
    end
  end

  v28 = 100

  function f24(p37)
    if not p37 then
      return
    end

    for index5, value36 in ipairs(p37:GetDescendants()) do
      local v120 = value36

      if v120:IsA("BasePart") then
        pcall(function() v120.Anchored = true end)
      end
    end
  end

  function f25(p38)
    local v121 = f12()

    if v121 and p38 then
      v121.CFrame = p38.CFrame
      task.wait(0.02)
    end
  end

  function f26()
    local v122 = f12()

    if not v122 then
      return nil
    end

    local v123 = v122.CFrame * CFrame.new(0, 0, -8)
    local menuToys = replicatedStorage:FindFirstChild("MenuToys")

    if menuToys then
      pcall(function()
        menuToys.SpawnToyRemoteFunction:InvokeServer(
          "CreatureBlobman", v123, Vector3.new(0, 27.4, 0)
        )
      end)
    end

    return f42()
  end

  function f42()
    for i17 = 1, 30 do
      task.wait(0.1)
      local findFirstChild7 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")

      if findFirstChild7 then
        local creatureBlobman = findFirstChild7:FindFirstChild("CreatureBlobman")

        if creatureBlobman then
          local vehicleSeat2 = creatureBlobman:FindFirstChild("VehicleSeat")

          if vehicleSeat2 then
            local humanoid5 = localPlayer.Character
              and localPlayer.Character:FindFirstChildOfClass("Humanoid")

            if humanoid5 then
              vehicleSeat2:Sit(humanoid5)
              task.wait(0.2)

              if humanoid5.SeatPart == vehicleSeat2 then
                return creatureBlobman
              end
            end
          end
        end
      end
    end

    return nil
  end

  function f27(p39)
    if not p39 then
      return
    end

    pcall(function()
      if replicatedStorage and replicatedStorage.GrabEvents then
        local v124 = f12()

        if v124 then
          replicatedStorage.GrabEvents.SetNetworkOwner:FireServer(p39, v124.CFrame)
        end
      end
    end)
  end

  local function f53()
    local function f54(p40)
      if p40.Name == "BlackHoleKick" and not v26[p40] then
        v25 = v25 + 1
        v26[p40] = true

        v8:MakeNotification({
          Name = " BlackHoleKick обнаружен",
          Content = "Появился " .. v25 .. "-й",
          Time = 5,
        })
      end
    end

    for key15, value37 in pairs(workspace:GetChildren()) do
      f54(value37)
    end

    workspace.ChildAdded:Connect(f54)
  end

  f53()

  local tab2 = window:MakeTab({ Name = "Omni / Kick All" })
  tab2:AddSection({ Name = "Обнаружение BlackHole" })

  tab2:AddButton({
    Name = "Сброс счётчика BlackHole",
    Callback = function()
      v25 = 0
      v26 = {}

      v8:MakeNotification({
        Name = "Сброс",
        Content = "Счётчик BlackHole сброшен",
        Time = 2,
      })
    end,
  })

  tab2:AddSection({ Name = "Выбор режима размещения" })

  tab2:AddDropdown({
    Name = "Форма размещения игроков",
    Default = "Круг (одинарный)",
    Options = { "Круг (одинарный)", "Двойной круг", "Спираль" },
    Callback = function(value38)
      if value38 == "Круг (одинарный)" then
        v27 = "circle"
      elseif value38 == "Двойной круг" then
        v27 = "double"
      elseif value38 == "Спираль" then
        v27 = "spiral"
      end
    end,
  })

  tab2:AddSection({ Name = "Указание цели" })

  addDropdown = tab2:AddDropdown({
    Name = "Выбор цели",
    Default = "",
    Options = f14(),
    Callback = function(value39)
      findFirstChild = players:FindFirstChild(value39)

      if findFirstChild then
        v8:MakeNotification({ Name = "Выбран", Content = value39, Time = 1.5 })
      end
    end,
  })

  tab2:AddButton({
    Name = "Обновить список игроков",
    Callback = function() addDropdown:Refresh(f14(), true) end,
  })

  tab2:AddButton({
    Name = "Одиночный кик",
    Callback = function()
      local v125 = f20()

      if not v125 then
        v8:MakeNotification({
          Name = "Error",
          Content = "Сначала выполните KICK ALL",
          Time = 3,
        })

        return
      elseif not findFirstChild then
        v8:MakeNotification({
          Name = "Error",
          Content = "Сначала выберите цель",
          Time = 2,
        })

        return
      else
        local humanoidRootPart18 = findFirstChild.Character
          and findFirstChild.Character:FindFirstChild("HumanoidRootPart")

        if not humanoidRootPart18 then
          v8:MakeNotification({
            Name = "Error",
            Content = "Цель не найдена",
            Time = 2,
          })

          return
        end

        f25(humanoidRootPart18)
        f27(humanoidRootPart18)

        for i18 = 1, 3 do
          f16(v125, findFirstChild)

          if i18 < 3 then
            task.wait(0.08)
          end
        end

        v8:MakeNotification({
          Name = "Завершено",
          Content = findFirstChild.Name .. " кикнут",
          Time = 2,
        })

        return
      end
    end,
  })

  tab2:AddButton({
    Name = "Многократный удар (100 раз)",
    Callback = function()
      if not findFirstChild then
        v8:MakeNotification({
          Name = "Error",
          Content = "Сначала выберите цель",
          Time = 2,
        })

        return
      end

      local v126 = f20()

      if not v126 then
        v8:MakeNotification({
          Name = "Error",
          Content = "Сначала выполните KICK ALL",
          Time = 3,
        })

        return
      end

      v8:MakeNotification({
        Name = "Начало многократного удара",
        Content = "100 раз для " .. findFirstChild.Name,
        Time = 2,
      })

      task.spawn(function()
        f21(v126, findFirstChild, 100)

        v8:MakeNotification({
          Name = "Многократный удар завершён",
          Content = "Выполнено 100 раз",
          Time = 2,
        })
      end)
    end,
  })

  tab2:AddButton({
    Name = " KICK ALL",
    Callback = function()
      local v127 = f15()

      if #v127 == 0 then
        v8:MakeNotification({
          Name = "Ошибка",
          Content = "Нет других игроков",
          Time = 2,
        })

        return
      else
        if v25 > 0 then
          v8:MakeNotification({
            Name = "Внимание",
            Content = "Обнаружено BlackHole: " .. v25 .. " шт.",
            Time = 3,
          })
        end

        local v128 = f26()

        if not v128 then
          v8:MakeNotification({
            Name = "Ошибка",
            Content = "Не удалось сесть на Blobman",
            Time = 3,
          })

          return
        else
          v8:MakeNotification({
            Name = "Успех",
            Content = "Вы сели на Blobman",
            Time = 1.5,
          })

          task.wait(0.3)
          local v129 = f12()

          if not v129 then
            return
          end

          for index6, value40 in ipairs(v127) do
            local character4 = value40.Character

            local humanoidRootPart19 = character4

            humanoidRootPart19 = character4
              and value40.Character:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart19 then
              f25(humanoidRootPart19)
              f27(humanoidRootPart19)

              for i19 = 1, 3 do
                f16(v128, value40)

                if i19 < 3 then
                  task.wait(0.08)
                end
              end
            end
          end

          v129.CFrame = CFrame.new(0, 100, 0)
          task.wait(0.1)
          f24(v128)
          task.wait(0.1)

          if v27 == "circle" then
            f23(v127, 0, 0, 0, f18, 25, #v127)
          elseif v27 == "double" then
            f23(v127, 0, 0, 0, f11, 15, 35, #v127)
          elseif v27 == "spiral" then
            f23(v127, 0, 0, 0, f10, 10, 40, #v127)
          end

          task.wait(0.1)

          for index7, value41 in ipairs(v127) do
            local character5 = value41.Character

            local humanoidRootPart20 = character5

            humanoidRootPart20 = character5
              and value41.Character:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart20 then
              f22(humanoidRootPart20)
            end
          end

          task.wait(0.1)

          for index8, value42 in ipairs(v127) do
            local character6 = value42.Character

            local humanoidRootPart21 = character6

            humanoidRootPart21 = character6
              and value42.Character:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart21 then
              f22(humanoidRootPart21)
            end
          end

          task.wait(0.3)

          for i20 = 1, 3 do
            for index9, value43 in ipairs(v127) do
              f17(v128, value43)
            end

            if i20 < 3 then
              task.wait(0.08)
            end
          end

          task.wait(0.1)
          f13(v128)

          v8:MakeNotification({
            Name = "Kick All завершён",
            Content = #v127 .. " игроков кикнуто | Радиус: 25 (размер Сатурна)",
            Time = 4,
          })

          return
        end
      end
    end,
  })

  tab2:AddSection({ Name = "Destroy Server " })

  function f28()
    local v130 = {}

    for key16, value44 in pairs(players:GetPlayers()) do
      if value44 ~= localPlayer then
        table.insert(v130, value44)
      end
    end

    return v130
  end

  v29 = "Spawn"
  grabEvents = replicatedStorage:FindFirstChild("GrabEvents")

  function f29(p41, p42)
    if not p41 or not p42 then
      return
    end

    pcall(function()
      p41.CFrame = p42.CFrame * CFrame.new(0, 5, 5)
      p41.AssemblyLinearVelocity = Vector3.zero
    end)
  end

  function f43(p43)
    if not grabEvents then
      return
    end

    local setNetworkOwner = grabEvents:FindFirstChild("SetNetworkOwner")

    if setNetworkOwner and p43 then
      pcall(function() setNetworkOwner:FireServer(p43, p43.CFrame) end)
    end
  end

  function f44(p44)
    if not grabEvents then
      return
    end

    local createGrabLine = grabEvents:FindFirstChild("CreateGrabLine")
    local destroyGrabLine = grabEvents:FindFirstChild("DestroyGrabLine")

    if not createGrabLine or not destroyGrabLine then
      return
    end

    pcall(function()
      createGrabLine:FireServer(p44, CFrame.new(0, 1000000000, 0))
      task.wait()
      destroyGrabLine:FireServer(p44)
    end)
  end

  v30 = nil
  v31 = false

  function f45()
    if v31 then
      return
    end

    v31 = true

    v30 = coroutine.create(function()
      if not grabEvents then
        return
      else
        local createGrabLine2 = grabEvents:FindFirstChild("CreateGrabLine")

        if not createGrabLine2 then
          return
        end

        while v31 do
          local spawnLocation = v1:FindFirstChild("SpawnLocation")
            or v1:FindFirstChild("Spawn")
            or localPlayer.Character
              and localPlayer.Character:FindFirstChild("HumanoidRootPart")

          if spawnLocation then
            local v131 = math.random(-9000000000, 9000000000)
            local v132 = math.random(-9000000000, 9000000000)

            for key17, value45 in pairs({
              CFrame.new(v131, 0, v132), CFrame.new(-v131, 0, -v132),
              CFrame.new(v131, 0, -v132), CFrame.new(-v131, 0, v132),
            }) do
              createGrabLine2:FireServer(spawnLocation, value45)
            end
          end

          task.wait()
        end

        return
      end
    end)

    coroutine.resume(v30)
  end

  function f46()
    if not v31 then
      return
    end

    v31 = false

    if v30 then
      coroutine.close(v30)
      v30 = nil
    end
  end

  tab2:AddDropdown({
    Name = "Режим высоты",
    Default = "Spawn (на земле)",
    Options = { "Spawn (на земле)", "Heaven (небеса)" },
    Callback = function(value46)
      v29 = value46 == "Heaven (небеса)" and "Heaven" or "Spawn"
      v8:MakeNotification({ Name = "Height Mode", Content = value46, Time = 2 })
    end,
  })

  tab2:AddButton({
    Name = "Destroy Server",
    Callback = function()
      task.spawn(function()
        local v133 = v29 == "Heaven" and 1000000000 or 35
        f45()
        task.wait(1)
        local v134 = f28()

        if #v134 == 0 then
          f46()

          v8:MakeNotification({
            Name = "Destroy",
            Content = "Нет целевых игроков",
            Time = 3,
          })

          return
        else
          v8:MakeNotification({
            Name = "Destroy",
            Content = #v134 .. " игроков найдено",
            Time = 2,
          })

          local character7 = localPlayer.Character

          local humanoidRootPart22 = character7
            and character7:FindFirstChild("HumanoidRootPart")

          if not humanoidRootPart22 then
            f46()

            v8:MakeNotification({
              Name = "Destroy",
              Content = "У вас нет персонажа",
              Time = 3,
            })

            return
          else
            local v135 = {}

            for index10, value47 in ipairs(v134) do
              local character8 = value47.Character

              local humanoidRootPart23 = character8
                and character8:FindFirstChild("HumanoidRootPart")

              if humanoidRootPart23 then
                table.insert(v135, { player = value47, hrp = humanoidRootPart23 })
              end
            end

            for index11, value48 in ipairs(v135) do
              f29(humanoidRootPart22, value48.hrp)
              task.wait(0.2)
              f43(value48.hrp)
              task.wait()
            end

            local v136 = math.pi * 2 / #v135

            for index12, value49 in ipairs(v135) do
              local v137 = (index12 - 1) * v136
              local v138 = math.cos(v137) * 40
              local v139 = math.sin(v137) * 40

              local bodyPosition = Instance.new("BodyPosition")
              bodyPosition.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
              bodyPosition.P = 50000000
              bodyPosition.Position = Vector3.new(v138, v133, v139)
              bodyPosition.Parent = value49.hrp

              task.delay(2, function() pcall(function() bodyPosition:Destroy() end) end)
              task.wait()
            end

            v8:MakeNotification({ Name = "Destroy", Content = "Разрушение линий...", Time = 2 })

            for i21 = 1, 8 do
              for index13, value50 in ipairs(v135) do
                f44(value50.hrp)
              end

              task.wait(0.3)
            end

            v8:MakeNotification({ Name = "Destroy", Content = "Разрушение завершено!", Time = 2 })
            task.wait(6)
            f46()
            return
          end
        end
      end)
    end,
  })

  tab2:AddSection({ Name = "Single " })

  v32 = "Spawn"

  tab2:AddDropdown({
    Name = "Режим высоты для одного",
    Default = "Spawn (на земле)",
    Options = { "Spawn (на земле)", "Heaven (небеса)" },
    Callback = function(value51)
      v32 = value51 == "Heaven (небеса)" and "Heaven" or "Spawn"
      v8:MakeNotification({ Name = "Height Mode (Single)", Content = value51, Time = 2 })
    end,
  })

  tab2:AddButton({
    Name = "Single",
    Callback = function()
      local humanoidRootPart24, v140, bodyPosition2

      if not findFirstChild then
        v8:MakeNotification({
          Name = "Error",
          Content = "Сначала выберите цель",
          Time = 3,
        })

        return
      else
        local v141 = findFirstChild
        local character9 = v141.Character
        humanoidRootPart24 = character9 and character9:FindFirstChild("HumanoidRootPart")

        if not humanoidRootPart24 then
          v8:MakeNotification({
            Name = "Error",
            Content = "Персонаж цели не найден",
            Time = 3,
          })

          return
        else
          local character10 = localPlayer.Character

          local humanoidRootPart25 = character10
            and character10:FindFirstChild("HumanoidRootPart")

          if not humanoidRootPart25 then
            v8:MakeNotification({
              Name = "Error",
              Content = "У вас нет персонажа",
              Time = 3,
            })

            return
          end

          v140 = v32 == "Heaven" and 1000000000 or 35

          if not f45 then
            function f45()
              warn("startLineLag not defined, line lag skipped")
            end
          end

          if not f46 then
            function f46()
            end
          end

          f45()
          task.wait(1)
          f29(humanoidRootPart25, humanoidRootPart24)
          task.wait(0.2)
          f43(humanoidRootPart24)
          task.wait()

          pcall(function()
            humanoidRootPart24.CFrame = CFrame.new(0, v140, 0)
            humanoidRootPart24.AssemblyLinearVelocity = Vector3.zero
            humanoidRootPart24.Velocity = Vector3.zero
          end)

          bodyPosition2 = Instance.new("BodyPosition")
          bodyPosition2.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
          bodyPosition2.P = 50000000
          bodyPosition2.Position = Vector3.new(0, v140, 0)
          bodyPosition2.Parent = humanoidRootPart24

          task.delay(2, function() pcall(function() bodyPosition2:Destroy() end) end)

          v8:MakeNotification({
            Name = "Destroy Single",
            Content = "Разрушение линий...",
            Time = 2,
          })

          for i22 = 1, 8 do
            f44(humanoidRootPart24)
            task.wait(0.3)
          end

          v8:MakeNotification({
            Name = "Destroy Single",
            Content = v141.Name .. " разрушен!",
            Time = 2,
          })

          task.wait(6)
          f46()
          return
        end
      end
    end,
  })

  tab2:AddSection({ Name = "Blobman Spam" })

  v33 = false
  connect = nil
  v34 = 0
  v35 = 0
  w = ""
  v36 = 0.5

  function f30(p45)
    if not p45 or not p45.Character then
      return
    else
      local pcld = p45.Character:FindFirstChild("PCLD")

      if pcld and pcld:IsA("BasePart") then
        local v142 = math.random(-2, 2)
        local v143 = math.random(-1, 1)
        local vector3 = Vector3.new(v142, v143, math.random(-2, 2))
        pcld.Position = pcld.Position + vector3
      end

      return
    end
  end

  function f31()
    return workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
  end

  v37 = 2 * math.pi / v36

  function f32(p46, p47)
    local v144 = not p46 or not p47
    local creatureGrab5, creatureRelease5, leftDetector5

    if v144 then
      return
    else
      local blobmanSeatAndOwnerScript8 = p46:FindFirstChild("BlobmanSeatAndOwnerScript")

      if not blobmanSeatAndOwnerScript8 then
        return
      else
        creatureGrab5 = blobmanSeatAndOwnerScript8:FindFirstChild("CreatureGrab")
        creatureRelease5 = blobmanSeatAndOwnerScript8:FindFirstChild("CreatureRelease")

        leftDetector5 = p46:FindFirstChild("LeftDetector")
          or p46:FindFirstChild("RightDetector")

        local leftWeld5 = leftDetector5 and leftDetector5:FindFirstChild("LeftWeld")

        if not (creatureGrab5 and creatureRelease5 and leftDetector5 and leftWeld5) then
          return
        end

        pcall(function()
          creatureGrab5:FireServer(leftDetector5, p47, leftWeld5)
          creatureRelease5:FireServer(leftWeld5, p47)
        end)

        return
      end
    end
  end

  function f33()
    local v145 = {}

    for index14, value52 in ipairs(players:GetPlayers()) do
      if value52 ~= localPlayer then
        table.insert(v145, value52.DisplayName .. " (@" .. value52.Name .. ")")
      end
    end

    return v145
  end

  function f34()
    local v146 = f47()

    if v146 then
      pcall(function()
        local menuToys2 = replicatedStorage:FindFirstChild("MenuToys")

        if menuToys2 and menuToys2:FindFirstChild("DestroyToy") then
          menuToys2.DestroyToy:FireServer(v146)
        end
      end)
    end
  end

  function f47()
    local v147 = f31()
    return v147 and v147:FindFirstChild("CreatureBlobman")
  end

  function f48()
    local character11 = localPlayer.Character
    local humanoidRootPart26 = character11 and character11:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart26 then
      return
    end

    local v148 = humanoidRootPart26.CFrame * CFrame.new(0, 0, -5)

    pcall(function()
      local menuToys3 = replicatedStorage:FindFirstChild("MenuToys")

      if menuToys3 and menuToys3:FindFirstChild("SpawnToyRemoteFunction") then
        menuToys3.SpawnToyRemoteFunction:InvokeServer(
          "CreatureBlobman", v148, Vector3.new(0, 90, 0)
        )
      end
    end)
  end

  addDropdown2 = tab2:AddDropdown({
    Name = "Выбор цели для вращения",
    Default = "",
    Options = f33(),
    Callback = function(value53) w = value53:match("@([%w_%.]+)") or "" end,
  })

  task.spawn(function()
    while true do
      addDropdown2:Refresh(f33(), true)
      task.wait(5)
    end
  end)

  tab2:AddSlider({
    Name = "Скорость вращения",
    Min = 0.001,
    Max = 5,
    Default = 0.5,
    Increment = 0.05,
    Callback = function(value54)
      v36 = value54
      v37 = 2 * math.pi / v36

      v8:MakeNotification({
        Name = "Speed changed",
        Content = "Теперь " .. value54 .. " сек/круг",
        Time = 1,
      })
    end,
  })

  tab2:AddToggle({
    Name = "Вращение-спам",
    Default = false,
    Callback = function(value55)
      v33 = value55
      local humanoidRootPart27, f55, vector4, v149

      if value55 then
        if connect then
          connect:Disconnect()
        end

        v34 = 0
        v35 = 0
        local findFirstChild8 = players:FindFirstChild(w)

        if not findFirstChild8 then
          v8:MakeNotification({
            Name = "Error",
            Content = "Цель не найдена",
            Time = 2,
          })

          v33 = false
          return
        end

        v149 = f47()

        if not v149 then
          f48()
          task.wait(0.5)
          v149 = f47()
        end

        if not v149 then
          v8:MakeNotification({
            Name = "Error",
            Content = "Не удалось получить Blobman",
            Time = 2,
          })

          v33 = false
          return
        else
          local character12 = localPlayer.Character

          local humanoid6 = character12
          humanoid6 = character12 and character12:FindFirstChild("Humanoid")

          local vehicleSeat3 = v149:FindFirstChildOfClass("VehicleSeat")

          local seat = vehicleSeat3
          seat = vehicleSeat3 or v149:FindFirstChildOfClass("Seat")

          if seat and humanoid6 and humanoid6.SeatPart ~= seat then
            seat:Sit(humanoid6)
          end

          local character13 = findFirstChild8.Character

          local humanoidRootPart28 = character13
            and character13:FindFirstChild("HumanoidRootPart")

          local humanoid7 = character13 and character13:FindFirstChild("Humanoid")
          humanoidRootPart27 = v149:FindFirstChild("HumanoidRootPart") or v149.PrimaryPart

          if not (humanoidRootPart28 and humanoid7 and humanoid7.Health > 0 and humanoidRootPart27) then
            v8:MakeNotification({
              Name = "Error",
              Content = "Персонаж цели недействителен",
              Time = 2,
            })

            v33 = false
            return
          end

          function f55(p48)
            local raycast3 = v1:Raycast(p48, Vector3.new(0, 100, 0), RaycastParams.new())

            if raycast3 then
              return raycast3.Position.Y
            end

            return p48.Y
          end

          local v150 = f55(humanoidRootPart28.Position)

          vector4 = Vector3.new(
            humanoidRootPart28.Position.X, v150 + 23, humanoidRootPart28.Position.Z
          )

          connect = runService.RenderStepped:Connect(function(delta)
            local humanoidRootPart29

            if not v33 then
              return
            else
              local findFirstChild9 = players:FindFirstChild(w)

              if not findFirstChild9 or not findFirstChild9.Character then
                v8:MakeNotification({
                  Name = "Stopped",
                  Content = "Цель исчезла",
                  Time = 2,
                })

                v33 = false

                if connect then
                  connect:Disconnect()
                end

                connect = nil
                return
              else
                humanoidRootPart29 = findFirstChild9.Character:FindFirstChild("HumanoidRootPart")
                local humanoid8 = findFirstChild9.Character:FindFirstChild("Humanoid")

                if not humanoidRootPart29 or not humanoid8 or humanoid8.Health <= 0 then
                  v8:MakeNotification({
                    Name = "Stopped",
                    Content = "Цель мертва",
                    Time = 2,
                  })

                  v33 = false

                  if connect then
                    connect:Disconnect()
                  end

                  connect = nil
                  return
                else
                  humanoidRootPart29.CFrame = CFrame.new(vector4)
                  v34 = v34 + v37 * delta

                  if v34 > 2 * math.pi then
                    v34 = v34 - 2 * math.pi
                  end

                  local v151 = math.cos(v34)
                  local v152 = math.sin(v34)
                  local vector5 = Vector3.new(v151 * 30, 0, v152 * 30)

                  humanoidRootPart27.CFrame = CFrame.lookAt(vector4 + vector5, vector4)
                  humanoidRootPart27.Velocity = Vector3.zero

                  f32(v149, humanoidRootPart29)

                  pcall(function()
                    if grabEvents and grabEvents:FindFirstChild("SetNetworkOwner") then
                      grabEvents.SetNetworkOwner:FireServer(
                        humanoidRootPart29, humanoidRootPart29.CFrame
                      )
                    end

                    if grabEvents and grabEvents:FindFirstChild("DestroyGrabLine") then
                      grabEvents.DestroyGrabLine:FireServer(humanoidRootPart29)
                    end
                  end)

                  v35 = v35 + delta

                  if v35 >= 0.2 then
                    v35 = 0
                    f30(findFirstChild9)
                  end

                  return
                end
              end
            end
          end)

          v8:MakeNotification({
            Name = "GUCCI",
            Content = "Вращение начато: " .. (findFirstChild8.DisplayName or findFirstChild8.Name),
            Time = 2,
          })

          return
        end
      else
        if connect then
          connect:Disconnect()
          connect = nil
        end

        f34()
        v8:MakeNotification({ Name = "GUCCI", Content = "Остановлено", Time = 1 })
        return
      end
    end,
  })

  local tab3 = window:MakeTab({
    Name = "Захват",
    Icon = "rbxassetid://73570431850302",
    PremiumOnly = false,
  })

  function f49()
    local grabParts = workspace:FindFirstChild("GrabParts")

    if not grabParts then
      return nil
    else
      local grabPart = grabParts:FindFirstChild("GrabPart")

      if not grabPart then
        return nil
      else
        local weldConstraint = grabPart:FindFirstChild("WeldConstraint")

        if not weldConstraint then
          return nil
        end

        return weldConstraint.Part1
      end
    end
  end

  function f50()
    local v153 = f49()

    if not v153 then
      return nil
    else
      local parent = v153.Parent

      while parent do
        if parent:FindFirstChild("Humanoid") then
          return parent
        end

        parent = parent.Parent
      end

      return nil
    end
  end

  v38 = false
  v39 = false
  v40 = false
  v41 = false
  v42 = nil
  v43 = nil
  v44 = nil
  v45 = nil
  connect2 = nil
  v46 = 400

  tab3:AddSlider({
    Name = "Сила броска",
    Min = 100,
    Max = 5000,
    Default = v46,
    Callback = function(value56) v46 = value56 end,
  })

  tab3:AddToggle({
    Name = "Бросок (активируется левым кликом)",
    Default = false,
    Callback = function(value57)
      if value57 then
        connect2 = workspace.ChildAdded:Connect(function(child)
          local instance16

          if child.Name == "GrabParts" then
            task.wait(0.05)

            local weldConstraint2 = child:FindFirstChild("GrabPart")
              and child.GrabPart:FindFirstChild("WeldConstraint")

            if weldConstraint2 then
              local part12 = weldConstraint2.Part1

              if part12 then
                instance16 = Instance.new("BodyVelocity", part12)

                child:GetPropertyChangedSignal("Parent"):Connect(function()
                  if not child.Parent then
                    local getLastInputType = userInputService:GetLastInputType()

                    if getLastInputType == Enum.UserInputType.MouseButton2
                      or getLastInputType == Enum.UserInputType.Touch then
                      instance16.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                      instance16.Velocity = workspace.CurrentCamera.CFrame.LookVector * v46
                      debris:AddItem(instance16, 1)
                    else
                      instance16:Destroy()
                    end
                  end
                end)
              end
            end
          end
        end)
      elseif connect2 then
        connect2:Disconnect()
        connect2 = nil
      end
    end,
  })

  tab3:AddToggle({
    Name = "Ядовитый захват",
    Default = false,
    Callback = function(value58)
      if value58 then
        v38 = true

        if v42 then
          coroutine.close(v42)
        end

        v42 = coroutine.create(function()
          while v38 do
            local v154 = f50()

            if v154 then
              local humanoid9 = v154:FindFirstChild("Humanoid")

              if humanoid9 and humanoid9.Health > 0 then
                humanoid9.Health = humanoid9.Health - 5
              end
            end

            task.wait(0.5)
          end
        end)

        coroutine.resume(v42)
      else
        v38 = false
        v42 = nil
      end
    end,
  })

  tab3:AddToggle({
    Name = "Радиоактивный захват",
    Default = false,
    Callback = function(value59)
      if value59 then
        v39 = true

        if v43 then
          coroutine.close(v43)
        end

        v43 = coroutine.create(function()
          while v39 do
            local v155 = f50()

            if v155 then
              for key18, value60 in pairs(v155:GetDescendants()) do
                if value60:IsA("BasePart") then
                  value60.Color = Color3.fromRGB(0, 255, 0)
                  value60.Material = Enum.Material.Neon
                end
              end
            end

            task.wait(0.1)
          end
        end)

        coroutine.resume(v43)
      else
        v39 = false

        if v43 then
          coroutine.close(v43)
        end

        v43 = nil
        local v156 = f50()

        if v156 then
          for key19, value61 in pairs(v156:GetDescendants()) do
            if value61:IsA("BasePart") then
              value61.Color = Color3.fromRGB(255, 255, 255)
              value61.Material = Enum.Material.Plastic
            end
          end
        end
      end
    end,
  })

  tab3:AddToggle({
    Name = "Огненный захват",
    Default = false,
    Callback = function(value62)
      if value62 then
        v40 = true

        if v44 then
          coroutine.close(v44)
        end

        v44 = coroutine.create(function()
          while v40 do
            local v157 = f50()

            if v157 then
              for key20, value63 in pairs(v157:GetDescendants()) do
                if value63:IsA("BasePart") then
                  value63.Color = Color3.fromRGB(255, 0, 0)
                  value63.Material = Enum.Material.Neon
                end
              end

              local humanoid10 = v157:FindFirstChild("Humanoid")

              if humanoid10 then
                humanoid10.Health = humanoid10.Health - 3
              end
            end

            task.wait(0.3)
          end
        end)

        coroutine.resume(v44)
      else
        v40 = false

        if v44 then
          coroutine.close(v44)
        end

        v44 = nil
        local v158 = f50()

        if v158 then
          for key21, value64 in pairs(v158:GetDescendants()) do
            if value64:IsA("BasePart") then
              value64.Color = Color3.fromRGB(255, 255, 255)
              value64.Material = Enum.Material.Plastic
            end
          end
        end
      end
    end,
  })

  tab3:AddToggle({
    Name = "Ноклип захват",
    Default = false,
    Callback = function(value65)
      if value65 then
        v41 = true

        if v45 then
          coroutine.close(v45)
        end

        v45 = coroutine.create(function()
          while v41 do
            local v159 = f50()

            if v159 then
              for key22, value66 in pairs(v159:GetDescendants()) do
                if value66:IsA("BasePart") then
                  value66.CanCollide = false
                  value66.CanTouch = false
                end
              end
            end

            task.wait()
          end
        end)

        coroutine.resume(v45)
      else
        v41 = false

        if v45 then
          coroutine.close(v45)
        end

        v45 = nil
        local v160 = f50()

        if v160 then
          for key23, value67 in pairs(v160:GetDescendants()) do
            if value67:IsA("BasePart") then
              value67.CanCollide = true
              value67.CanTouch = true
            end
          end
        end
      end
    end,
  })

  v47 = false
  v48 = nil

  tab3:AddToggle({
    Name = "Граб-килл",
    Default = false,
    Callback = function(value68)
      v47 = value68

      if v48 then
        coroutine.close(v48)
        v48 = nil
      end

      if value68 then
        v48 = coroutine.create(function()
          while v47 do
            local v161 = f50()

            if v161 then
              local humanoid11 = v161:FindFirstChild("Humanoid")

              if humanoid11 and humanoid11.Health > 0 then
                pcall(function()
                  humanoid11.BreakJointsOnDeath = false
                  humanoid11.Health = 0
                  humanoid11:ChangeState(Enum.HumanoidStateType.Dead)

                  local humanoidRootPart30 = v161:FindFirstChild("HumanoidRootPart")

                  if humanoidRootPart30 then
                    humanoidRootPart30.Velocity = Vector3.zero
                    humanoidRootPart30.AssemblyLinearVelocity = Vector3.zero
                    humanoidRootPart30.AssemblyAngularVelocity = Vector3.zero
                  end

                  for key24, value69 in pairs(v161:GetDescendants()) do
                    if value69:IsA("BasePart") then
                      value69.Velocity = Vector3.zero
                      value69.AssemblyLinearVelocity = Vector3.zero
                    end
                  end
                end)
              end
            end

            task.wait(0.1)
          end
        end)

        coroutine.resume(v48)
        v8:MakeNotification({ Name = "Граб-килл", Content = "ON", Time = 1 })
      else
        v8:MakeNotification({ Name = "Граб-килл", Content = "OFF", Time = 1 })
      end
    end,
  })

  local defenceTab = window:MakeTab({ Name = "Defence" })
  v49 = false

  defenceTab:AddSection({ Name = "Auto Defense System" })

  defenceTab:AddToggle({
    Name = "Anti Grab",
    Default = false,
    Callback = function(value70)
      v49 = value70

      if value70 then
        task.spawn(function()
          while v49 do
            local characterEvents = replicatedStorage:FindFirstChild("CharacterEvents")

            if characterEvents and characterEvents:FindFirstChild("Struggle") then
              characterEvents.Struggle:FireServer()
            end

            task.wait(0.03)
          end
        end)

        v8:MakeNotification({ Name = "Anti Grab", Content = "ON", Time = 1 })
      else
        v8:MakeNotification({ Name = "Anti Grab", Content = "OFF", Time = 1 })
      end
    end,
  })

  v50 = false

  function f35(p49)
    local ragdolled

    if not v50 then
      return
    else
      local waitForChild = p49:WaitForChild("Humanoid", 5)
      ragdolled = waitForChild and waitForChild:FindFirstChild("Ragdolled")

      if ragdolled then
        if connect3 then
          connect3:Disconnect()
        end

        connect3 = ragdolled:GetPropertyChangedSignal("Value"):Connect(function()
          if not v50 then
            return
          end

          if ragdolled.Value then
            for index15, value71 in ipairs(p49:GetChildren()) do
              if value71:IsA("BasePart") then
                value71.Anchored = true
              end
            end
          else
            for index16, value72 in ipairs(p49:GetChildren()) do
              if value72:IsA("BasePart") then
                value72.Anchored = false
              end
            end
          end
        end)
      end

      return
    end
  end

  connect3 = nil

  defenceTab:AddToggle({
    Name = "Anti Explosion",
    Default = false,
    Callback = function(value73)
      v50 = value73
      local connect7

      if value73 then
        if localPlayer.Character then
          f35(localPlayer.Character)
        end

        connect7 = localPlayer.CharacterAdded:Connect(f35)

        task.spawn(function()
          repeat
            task.wait()
          until not v50

          connect7:Disconnect()

          if connect3 then
            connect3:Disconnect()
          end

          if localPlayer.Character then
            for index17, value74 in ipairs(localPlayer.Character:GetChildren()) do
              if value74:IsA("BasePart") then
                value74.Anchored = false
              end
            end
          end
        end)
      elseif connect3 then
        connect3:Disconnect()
      end
    end,
  })

  local playerTab = window:MakeTab({ Name = "Player" })

  function f36(walkSpeed)
    local character14 = localPlayer.Character
    local humanoid12 = character14 and character14:FindFirstChildOfClass("Humanoid")

    if humanoid12 then
      humanoid12.WalkSpeed = walkSpeed
    end
  end

  v51 = false
  v52 = 16
  jumpPower = 50
  v53 = false

  playerTab:AddSlider({
    Name = "Скорость ходьбы",
    Min = 16,
    Max = 300,
    Default = 16,
    Callback = function(value75)
      if v51 then
        f36(value75)
      end

      v52 = value75
    end,
  })

  playerTab:AddToggle({
    Name = "Включить изменение скорости",
    Default = false,
    Callback = function(value76)
      v51 = value76
      local character15 = localPlayer.Character
      local humanoid13 = character15 and character15:FindFirstChildOfClass("Humanoid")

      if value76 then
        if humanoid13 then
          humanoid13.WalkSpeed = v52
        end

        v8:MakeNotification({ Name = "Изменение скорости", Content = "ON - " .. v52 .. "", Time = 1 })
      else
        if humanoid13 then
          humanoid13.WalkSpeed = 16
        end

        v8:MakeNotification({ Name = "Изменение скорости", Content = "OFF", Time = 1 })
      end
    end,
  })

  playerTab:AddSection({ Name = "Настройки прыжка" })

  playerTab:AddSlider({
    Name = "Сила прыжка",
    Min = 1,
    Max = 300,
    Default = 50,
    Callback = function(value77)
      jumpPower = value77
      local character16 = localPlayer.Character
      local humanoid14 = character16 and character16:FindFirstChildOfClass("Humanoid")

      if humanoid14 then
        humanoid14.JumpPower = value77
      end
    end,
  })

  playerTab:AddToggle({
    Name = "Бесконечный прыжок",
    Default = false,
    Callback = function(value78)
      v53 = value78

      if value78 then
        v8:MakeNotification({
          Name = "Бесконечный прыжок",
          Content = "ON - можно прыгать в воздухе",
          Time = 1.5,
        })
      else
        v8:MakeNotification({ Name = "Бесконечный прыжок", Content = "OFF", Time = 1 })
      end
    end,
  })

  userInputService.JumpRequest:Connect(function()
    if not v53 then
      return
    else
      local character17 = localPlayer.Character
      local humanoid15 = character17 and character17:FindFirstChildOfClass("Humanoid")

      if humanoid15 and humanoid15:GetState() ~= Enum.HumanoidStateType.Jumping then
        humanoid15:ChangeState(Enum.HumanoidStateType.Jumping)
      end

      return
    end
  end)

  localPlayer.CharacterAdded:Connect(function(character18)
    task.wait(0.5)
    local humanoid16 = character18:FindFirstChildOfClass("Humanoid")

    if humanoid16 then
      if v51 then
        humanoid16.WalkSpeed = v52
      end

      humanoid16.JumpPower = jumpPower
    end
  end)

  playerTab:AddButton({
    Name = "Сбросить на значения по умолчанию",
    Callback = function()
      local character19 = localPlayer.Character
      local humanoid17 = character19 and character19:FindFirstChildOfClass("Humanoid")
      v52 = 16
      jumpPower = 50

      if humanoid17 then
        humanoid17.WalkSpeed = 16
        humanoid17.JumpPower = 50
      end

      v51 = false
      v53 = false

      v8:MakeNotification({
        Name = "Сброс",
        Content = "Скорость 16 / прыжок 50 восстановлены",
        Time = 2,
      })
    end,
  })

  playerTab:AddSection({ Name = "Функция полёта" })

  v54 = false
  v55 = 50

  function f37()
    local character20 = localPlayer.Character
    local humanoidRootPart31

    if not character20 then
      return
    else
      humanoidRootPart31 = character20:FindFirstChild("HumanoidRootPart")
      local v162 = not humanoidRootPart31
      local humanoid18 = character20:FindFirstChildOfClass("Humanoid")

      if v162 or not humanoid18 then
        return
      end

      humanoid18.PlatformStand = true

      bodyVelocity = Instance.new("BodyVelocity")
      bodyVelocity.MaxForce = Vector3.new(1, 1, 1) * 1000000
      bodyVelocity.Parent = humanoidRootPart31

      bodyGyro = Instance.new("BodyGyro")
      bodyGyro.MaxTorque = Vector3.new(1, 1, 1) * 100000000
      bodyGyro.P = 20000
      bodyGyro.D = 1000
      bodyGyro.Parent = humanoidRootPart31

      connect4 = runService.RenderStepped:Connect(function()
        if not v54 or not humanoidRootPart31.Parent then
          return
        else
          local cframe2 = workspace.CurrentCamera.CFrame
          bodyGyro.CFrame = cframe2
          local zero = Vector3.zero

          if userInputService:IsKeyDown(Enum.KeyCode.W) then
            zero = zero + cframe2.LookVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.S) then
            zero = zero - cframe2.LookVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.A) then
            zero = zero - cframe2.RightVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.D) then
            zero = zero + cframe2.RightVector
          end

          if userInputService:IsKeyDown(Enum.KeyCode.Space) then
            zero = zero + Vector3.new(0, 1, 0)
          end

          if userInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            zero = zero - Vector3.new(0, 1, 0)
          end

          if zero.Magnitude > 0 then
            bodyVelocity.Velocity = zero.Unit * v55
          else
            bodyVelocity.Velocity = Vector3.zero
          end

          return
        end
      end)

      return
    end
  end

  bodyVelocity = nil
  bodyGyro = nil

  function f38()
    if connect4 then
      connect4:Disconnect()
      connect4 = nil
    end

    if bodyVelocity then
      bodyVelocity:Destroy()
      bodyVelocity = nil
    end

    if bodyGyro then
      bodyGyro:Destroy()
      bodyGyro = nil
    end

    local character21 = localPlayer.Character

    local humanoid19 = character21
    humanoid19 = character21 and character21:FindFirstChildOfClass("Humanoid")

    if humanoid19 then
      humanoid19.PlatformStand = false
    end
  end

  connect4 = nil

  playerTab:AddToggle({
    Name = "Режим полёта",
    Default = false,
    Callback = function(value79)
      v54 = value79

      if value79 then
        f37()

        v8:MakeNotification({
          Name = "Режим полёта",
          Content = "ON - тело смотрит в сторону камеры",
          Time = 1.5,
        })
      else
        f38()
        v8:MakeNotification({ Name = "Режим полёта", Content = "OFF", Time = 1 })
      end
    end,
  })

  playerTab:AddSlider({
    Name = "Скорость полёта",
    Min = 20,
    Max = 200,
    Default = 50,
    Callback = function(value80) v55 = value80 end,
  })

  return
end