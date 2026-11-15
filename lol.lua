-- Blood Debt Ultimate Cheat (by Jack & Fox)
local P=game:GetService("Players")local R=game:GetService("RunService")local U=game:GetService("UserInputService")local CG=game:GetService("CoreGui")local W=game:GetService("Workspace")local LP=P.LocalPlayer local Cam=W.CurrentCamera

local SG=Instance.new("ScreenGui")SG.Name="blood_debt_cheat"SG.ResetOnSpawn=false SG.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
if not pcall(function()SG.Parent=CG end)then SG.Parent=LP:WaitForChild("PlayerGui")end

local M=Instance.new("Frame")M.Size=UDim2.new(0,220,0,350)M.Position=UDim2.new(0,20,0,100)M.BackgroundColor3=Color3.fromRGB(20,20,25)M.BorderSizePixel=0 M.Active=true M.Draggable=true M.Parent=SG
Instance.new("UICorner",M).CornerRadius=UDim.new(0,8)

local T=Instance.new("TextLabel")T.Size=UDim2.new(1,0,0,30)T.BackgroundColor3=Color3.fromRGB(30,30,40)T.BorderSizePixel=0 T.Text="Blood Debt Ultimate"T.TextColor3=Color3.new(1,1,1)T.Font=Enum.Font.GothamBold T.TextSize=15 T.Parent=M
Instance.new("UICorner",T).CornerRadius=UDim.new(0,8)

local TB=Instance.new("TextButton")TB.Size=UDim2.new(0,26,0,26)TB.Position=UDim2.new(1,-30,0,2)TB.BackgroundColor3=Color3.fromRGB(200,50,50)TB.Text="–"TB.TextColor3=Color3.new(1,1,1)TB.Font=Enum.Font.GothamBold TB.TextSize=18 TB.Parent=T
Instance.new("UICorner",TB).CornerRadius=UDim.new(0,6)

local S=Instance.new("ScrollingFrame")S.Size=UDim2.new(1,-10,1,-40)S.Position=UDim2.new(0,5,0,35)S.BackgroundTransparency=1 S.BorderSizePixel=0 S.ScrollBarThickness=3 S.CanvasSize=UDim2.new(0,0,0,0)S.Parent=M
local L=Instance.new("UIListLayout")L.SortOrder=Enum.SortOrder.LayoutOrder L.Padding=UDim.new(0,4)L.Parent=S
L:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()S.CanvasSize=UDim2.new(0,0,0,L.AbsoluteContentSize.Y+8)end)

TB.MouseButton1Click:Connect(function()S.Visible=not S.Visible M.Size=S.Visible and UDim2.new(0,220,0,350)or UDim2.new(0,220,0,30)TB.Text=S.Visible and "–"or "+"end)

local function btn(txt)B=Instance.new("TextButton")B.Size=UDim2.new(1,0,0,26)B.BackgroundColor3=Color3.fromRGB(40,40,50)B.Text=txt B.TextColor3=Color3.fromRGB(230,230,230)B.Font=Enum.Font.Gotham B.TextSize=13 B.Parent=S Instance.new("UICorner",B).CornerRadius=UDim.new(0,6)return B end
local function tog(txt)B=btn(txt..": OFF")B.BackgroundColor3=Color3.fromRGB(35,35,45)local st=false local function set(v)st=v B.Text=txt..": "..(v and "ON"or "OFF")B.BackgroundColor3=v and Color3.fromRGB(40,120,60)or Color3.fromRGB(35,35,45)end B.MouseButton1Click:Connect(function()set(not st)end)return B,function()return st end,set end

local function getC()return LP.Character or LP.CharacterAdded:Wait()end local function getH()local c=LP.Character return c and c:FindFirstChildOfClass("Humanoid")end

-- ESP Variables
local EF=Instance.new("Folder")EF.Name="bd_esp"EF.Parent=SG
local eP=false local et={}

local function dESP(m)local t=et[m]if not t then return end if t.c then t.c:Disconnect()end if t.b then t.b:Destroy()end et[m]=nil end

local function aESP(m,n,isN)
    if et[m]then return end
    local b=Instance.new("Frame")b.BackgroundTransparency=1 b.BorderSizePixel=0 b.Visible=false b.Parent=EF
    local st=Instance.new("UIStroke")st.Color=Color3.fromRGB(255,60,60)st.Thickness=1.5 st.Parent=b
    local lb=Instance.new("TextLabel")lb.BackgroundTransparency=1 lb.TextColor3=Color3.new(1,1,1)lb.Font=Enum.Font.GothamBold lb.TextSize=11 lb.TextStrokeTransparency=0 lb.TextXAlignment=Enum.TextXAlignment.Center lb.Size=UDim2.new(1,0,0,13)lb.Position=UDim2.new(0,0,-0.15,0)lb.Text=n lb.Parent=b
    local rl=Instance.new("TextLabel")rl.BackgroundTransparency=1 rl.TextColor3=Color3.fromRGB(255,255,0)rl.Font=Enum.Font.GothamBold rl.TextSize=11 rl.TextStrokeTransparency=0 rl.TextXAlignment=Enum.TextXAlignment.Center rl.Size=UDim2.new(1,0,0,13)rl.Position=UDim2.new(0,0,-0.3,0)rl.Text="" rl.Parent=b
    local info={b=b,s=st,l=lb,r=rl,c=nil}et[m]=info
    
    info.c=R.RenderStepped:Connect(function()
        if not m or not m.Parent then dESP(m)return end
        local hrp=m:FindFirstChild("HumanoidRootPart")local h=m:FindFirstChildOfClass("Humanoid")local hd=m:FindFirstChild("Head")
        if not hrp or not h or h.Health<=0 then b.Visible=false return end
        local tp=(hd and hd.Position+Vector3.new(0,0.6,0))or hrp.Position+Vector3.new(0,2.5,0)
        local bp=hrp.Position-Vector3.new(0,3,0)
        local a,ao=Cam:WorldToViewportPoint(tp)local c,co=Cam:WorldToViewportPoint(bp)
        if not ao or not co or a.Z<0 then b.Visible=false return end
        local hh=math.abs(a.Y-c.Y)local ww=hh*0.55
        b.Visible=true b.Size=UDim2.new(0,ww,0,hh)b.Position=UDim2.new(0,a.X-ww/2,0,a.Y)
        lb.Text=n.." HP "..math.floor(h.Health+0.5)
        local role = m:GetAttribute("Role") or "Unknown"
        rl.Text = tostring(role)
        if role == "Killer" then st.Color = Color3.fromRGB(255,0,0) -- Убийца (Красный)
        elseif role == "Vigilante" then st.Color = Color3.fromRGB(0,255,0) -- Ликвидатор (Зеленый)
        else st.Color = Color3.fromRGB(255,255,255) end -- Зевака (Белый)
    end)
end

R.Heartbeat:Connect(function()
    if eP then for _,p in pairs(P:GetPlayers())do if p~=LP and p.Character then aESP(p.Character,p.Name,false)end end end
end)

task.spawn(function()while true do task.wait(1)for m,_ in pairs(et)do if not m.Parent then dESP(m)end end end end)

-- Тогглы
local ePB,ePG=tog("ESP Игроки")ePB.MouseButton1Click:Connect(function()task.wait()eP=ePG()if not eP then for m,_ in pairs(et)do dESP(m)end end end)

local fB,fG=tog("Fullbright")
fB.MouseButton1Click:Connect(function()
    task.wait()
    local isOn = fG()
    local lighting = game:GetService("Lighting")
    if isOn then
        lighting.Ambient = Color3.fromRGB(255,255,255)
        lighting.Brightness = 2
        lighting.FogEnd = 100000
        lighting.GlobalShadows = false
    else
        lighting.Ambient = Color3.fromRGB(0,0,0)
        lighting.Brightness = 1
        lighting.GlobalShadows = true
    end
end)

local sB,sG=tog("Speed Hack")
sB.MouseButton1Click:Connect(function()
    task.wait()
    local isOn = sG()
    local h = getH()
    if isOn and h then h.WalkSpeed = 50 elseif h then h.WalkSpeed = 16 end
end)

-- ==========================================
-- УМНЫЙ АИМБОТ (Зависит от роли)
-- ==========================================
local aimbotEnabled = false
local aimbotFOV = 150
local targetPartName = "Head"

local aB,aG=tog("Умный Аимбот")
aB.MouseButton1Click:Connect(function()
    task.wait()
    aimbotEnabled = aG()
end)

local function GetClosestTarget()
    local closest = nil
    local shortestDist = aimbotFOV
    local myRole = LP:GetAttribute("Role") or "Unknown"
    
    for _, v in pairs(P:GetPlayers()) do
        if v ~= LP and v.Character then
            local hum = v.Character:FindFirstChildOfClass("Humanoid")
            local targetPart = v.Character:FindFirstChild(targetPartName)
            
            if hum and hum.Health > 0 and targetPart then
                local theirRole = v:GetAttribute("Role") or "Unknown"
                local shouldAim = false
                
                -- ЛОГИКА АИМБОТА
                if myRole == "Killer" then
                    -- Убийца целится во всех (или в цель)
                    shouldAim = true
                elseif myRole == "Vigilante" then
                    -- Ликвидатор целится ТОЛЬКО в Убийцу
                    if theirRole == "Killer" then shouldAim = true end
                else
                    -- Зевака целится в Убийцу, чтобы знать, где он
                    if theirRole == "Killer" then shouldAim = true end
                end

                if shouldAim then
                    local pos, onScreen = Cam:WorldToViewportPoint(targetPart.Position)
                    if onScreen then
                        local mousePos = U:GetMouseLocation()
                        local dist = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                        if dist < shortestDist then
                            shortestDist = dist
                            closest = targetPart
                        end
                    end
                end
            end
        end
    end
    return closest
end

R.RenderStepped:Connect(function()
    if not aimbotEnabled then return end
    local target = GetClosestTarget()
    if target then
        Cam.CFrame = CFrame.new(Cam.CFrame.Position, target.Position)
    end
end)

print("[Blood Debt Ultimate] Loaded. Good luck, Lonya!")