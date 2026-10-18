--[[
    TIVEAU PANEL • SPÉCIAL BROOKHAVEN RP
    Touche RightShift = afficher / cacher
    Sauvegarde : TIVEAU_Brookhaven_Config.json (dossier workspace de l'executor)
]]
-- ===================== SYSTÈME DE KEY =====================
do
    local KEY = "TiveauONtop2341"
    local validated = false

    local CoreGui = game:GetService("CoreGui")
    local parent = (gethui and gethui()) or CoreGui

    local old = parent:FindFirstChild("TIVEAU_KEY")
    if old then old:Destroy() end

    local kgui = Instance.new("ScreenGui")
    kgui.Name = "TIVEAU_KEY"
    kgui.ResetOnSpawn = false
    kgui.IgnoreGuiInset = true
    kgui.Parent = parent

    local frame = Instance.new("Frame")
    frame.Size = UDim2.fromOffset(340, 190)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Position = UDim2.fromScale(0.5, 0.5)
    frame.BackgroundColor3 = Color3.fromRGB(240, 247, 255)
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    frame.Parent = kgui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)
    local fs = Instance.new("UIStroke", frame)
    fs.Color = Color3.fromRGB(120, 170, 235)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 44)
    title.BackgroundTransparency = 1
    title.Text = "🏡 BROOKHAVEN • KEY"
    title.TextColor3 = Color3.fromRGB(45, 65, 95)
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 18
    title.Parent = frame

    local box = Instance.new("TextBox")
    box.Size = UDim2.new(1, -40, 0, 36)
    box.Position = UDim2.fromOffset(20, 56)
    box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    box.TextColor3 = Color3.fromRGB(50, 60, 75)
    box.PlaceholderText = "Entre ta key ici..."
    box.PlaceholderColor3 = Color3.fromRGB(150, 165, 185)
    box.Text = ""
    box.ClearTextOnFocus = false
    box.Font = Enum.Font.GothamMedium
    box.TextSize = 14
    box.Parent = frame
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -40, 0, 36)
    btn.Position = UDim2.fromOffset(20, 102)
    btn.BackgroundColor3 = Color3.fromRGB(80, 150, 230)
    btn.Text = "Valider"
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 15
    btn.Parent = frame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, -20, 0, 36)
    status.Position = UDim2.new(0, 10, 1, -42)
    status.BackgroundTransparency = 1
    status.Text = "Accès réservé"
    status.TextColor3 = Color3.fromRGB(100, 115, 135)
    status.TextWrapped = true
    status.Font = Enum.Font.GothamMedium
    status.TextSize = 12
    status.Parent = frame

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.fromOffset(26, 26)
    closeBtn.Position = UDim2.new(1, -34, 0, 8)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.fromRGB(100, 115, 135)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 15
    closeBtn.Parent = frame

    local function check()
        if box.Text == KEY then
            status.TextColor3 = Color3.fromRGB(60, 190, 120)
            status.Text = "Key valide !"
            validated = true
        else
            status.TextColor3 = Color3.fromRGB(225, 90, 90)
            status.Text = "Key invalide"
            local p = frame.Position
            for _ = 1, 3 do
                frame.Position = p + UDim2.fromOffset(6, 0) task.wait(0.04)
                frame.Position = p - UDim2.fromOffset(6, 0) task.wait(0.04)
            end
            frame.Position = p
        end
    end

    btn.MouseButton1Click:Connect(check)
    box.FocusLost:Connect(function(enter) if enter then check() end end)
    closeBtn.MouseButton1Click:Connect(function() kgui:Destroy() end)

    repeat task.wait(0.1) until validated or not kgui.Parent
    if validated then
        task.wait(0.6)
        kgui:Destroy()
    else
        return
    end
end
-- =================== FIN SYSTÈME DE KEY ===================

-- ===================== RÈGLEMENT (10 s avant de pouvoir accepter) =====================
do
    local accepted = false
    local parent = (gethui and gethui()) or game:GetService("CoreGui")

    local old = parent:FindFirstChild("TIVEAU_RULES")
    if old then old:Destroy() end

    local rgui = Instance.new("ScreenGui")
    rgui.Name = "TIVEAU_RULES"
    rgui.ResetOnSpawn = false
    rgui.IgnoreGuiInset = true
    rgui.Parent = parent

    local frame = Instance.new("Frame")
    frame.Size = UDim2.fromOffset(460, 330)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Position = UDim2.fromScale(0.5, 0.5)
    frame.BackgroundColor3 = Color3.fromRGB(240, 247, 255)
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    frame.Parent = rgui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)
    local fs = Instance.new("UIStroke", frame)
    fs.Color = Color3.fromRGB(120, 170, 235)
    fs.Thickness = 1.5

    local sc = Instance.new("UIScale", frame)
    local vp = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1280, 720)
    sc.Scale = math.clamp(math.min(vp.X / 520, vp.Y / 390), 0.5, 1)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -20, 0, 44)
    title.Position = UDim2.fromOffset(10, 4)
    title.BackgroundTransparency = 1
    title.Text = "⚠️ RÈGLEMENT — PANEL UNIVERSEL"
    title.TextColor3 = Color3.fromRGB(60, 110, 200)
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 19
    title.Parent = frame

    local body = Instance.new("TextLabel")
    body.Size = UDim2.new(1, -40, 0, 190)
    body.Position = UDim2.fromOffset(20, 52)
    body.BackgroundTransparency = 1
    body.Text = table.concat({
        "🔹 Vous êtes entièrement responsable de l’utilisation du script.",
        "🔹 Nous ne sommes pas responsables de vos actions en jeu.",
        "🔹 L’utilisation du script comporte des risques de bannissement Roblox, temporaire ou permanent.",
        "🔹 Aucun fonctionnement ni protection contre les bannissements n’est garanti.",
        "🔹 En utilisant le script, vous reconnaissez avoir lu et accepté ces conditions.",
        "",
        "🔐 Utilisation à vos risques et périls.",
    }, "\n")
    body.TextColor3 = Color3.fromRGB(55, 65, 85)
    body.TextWrapped = true
    body.TextXAlignment = Enum.TextXAlignment.Left
    body.TextYAlignment = Enum.TextYAlignment.Top
    body.Font = Enum.Font.GothamMedium
    body.TextSize = 14
    body.Parent = frame

    local accept = Instance.new("TextButton")
    accept.Size = UDim2.new(1, -40, 0, 38)
    accept.Position = UDim2.new(0, 20, 1, -54)
    accept.BackgroundColor3 = Color3.fromRGB(215, 225, 240)
    accept.AutoButtonColor = false
    accept.Text = "Patiente 10 s..."
    accept.TextColor3 = Color3.fromRGB(110, 125, 150)
    accept.Font = Enum.Font.GothamBold
    accept.TextSize = 15
    accept.Parent = frame
    Instance.new("UICorner", accept).CornerRadius = UDim.new(0, 8)

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.fromOffset(26, 26)
    closeBtn.Position = UDim2.new(1, -34, 0, 8)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.fromRGB(100, 115, 135)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 15
    closeBtn.Parent = frame
    closeBtn.MouseButton1Click:Connect(function() rgui:Destroy() end)

    local ready = false
    accept.MouseButton1Click:Connect(function()
        if ready then accepted = true end
    end)

    for s = 10, 1, -1 do
        if not rgui.Parent then break end
        accept.Text = "Patiente " .. s .. " s..."
        task.wait(1)
    end
    if rgui.Parent then
        ready = true
        accept.Text = "✅ J'accepte le règlement"
        accept.BackgroundColor3 = Color3.fromRGB(80, 150, 230)
        accept.TextColor3 = Color3.new(1, 1, 1)
    end

    repeat task.wait(0.1) until accepted or not rgui.Parent
    if accepted then
        rgui:Destroy()
    else
        return
    end
end
-- =================== FIN RÈGLEMENT ===================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LP = Players.LocalPlayer
local function cam() return workspace.CurrentCamera end
local G = (getgenv and getgenv()) or _G

if G.TIVEAU_BROOKHAVEN_UNLOAD then pcall(G.TIVEAU_BROOKHAVEN_UNLOAD) end

local alive = true
local conns = {}
local function addConn(c) conns[#conns + 1] = c return c end

local function char() return LP.Character end
local function hum() local c = char() return c and c:FindFirstChildOfClass("Humanoid") end
local function root() local c = char() return c and c:FindFirstChild("HumanoidRootPart") end

-- =====================================================================
--  CONFIG / SAUVEGARDE
-- =====================================================================
local FILE = "TIVEAU_Brookhaven_Config.json"
local Config = {
    settings = {
        speed = 50, jump = 100, flySpeed = 60, vehSpeed = 110, vehTurn = 110,
        note = "", waypoints = {},
    },
}
local function canFile()
    return type(writefile) == "function" and type(readfile) == "function" and type(isfile) == "function"
end
local function mergeConfig(data)
    if type(data) ~= "table" then return end
    if type(data.settings) == "table" then
        for k, v in pairs(data.settings) do Config.settings[k] = v end
    end
end
do
    local loaded = false
    if canFile() then
        pcall(function()
            if isfile(FILE) then
                mergeConfig(HttpService:JSONDecode(readfile(FILE)))
                loaded = true
            end
        end)
    end
    if not loaded and G.TIVEAU_BROOKHAVEN_CFG then mergeConfig(G.TIVEAU_BROOKHAVEN_CFG) end
end
local saveQueued = false
local function saveConfig()
    G.TIVEAU_BROOKHAVEN_CFG = Config
    if saveQueued then return end
    saveQueued = true
    task.delay(0.5, function()
        saveQueued = false
        if canFile() then pcall(writefile, FILE, HttpService:JSONEncode(Config)) end
    end)
end

local S = {
    speedOn = false, jumpOn = false, infJump = false, noclip = false,
    fly = false, vehFly = false, vehInvert = false,
    esp = false, fullbright = false, antiAfk = false, clickTp = false,
}

-- =====================================================================
--  UI : OUTILS (thème bleu/blanc Brookhaven)
-- =====================================================================
local T = {
    bg = Color3.fromRGB(250, 252, 255), side = Color3.fromRGB(232, 241, 252),
    card = Color3.fromRGB(255, 255, 255), cardHover = Color3.fromRGB(226, 238, 252),
    stroke = Color3.fromRGB(190, 212, 235), text = Color3.fromRGB(40, 50, 65),
    sub = Color3.fromRGB(120, 135, 155), accent = Color3.fromRGB(70, 140, 230),
    accent2 = Color3.fromRGB(130, 210, 190), good = Color3.fromRGB(70, 190, 130),
    bad = Color3.fromRGB(230, 95, 95),
}
local WHITE = Color3.new(1, 1, 1)

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props or {}) do o[k] = v end
    if parent then o.Parent = parent end
    return o
end
local function corner(o, r) return new("UICorner", { CornerRadius = UDim.new(0, r or 10) }, o) end
local function stroke(o, color, th, tr)
    return new("UIStroke", { Color = color or T.stroke, Thickness = th or 1, Transparency = tr or 0,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, o)
end
local function tween(o, t, props)
    TweenService:Create(o, TweenInfo.new(t, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play()
end
local function gradient(o, rot)
    return new("UIGradient", { Color = ColorSequence.new(T.accent, T.accent2), Rotation = rot or 0 }, o)
end
local layoutCounter = 0
local function nextOrder() layoutCounter += 1 return layoutCounter end

local guiParent
pcall(function() guiParent = (gethui and gethui()) or game:GetService("CoreGui") end)
guiParent = guiParent or LP:WaitForChild("PlayerGui")
local oldGui = guiParent:FindFirstChild("TIVEAU_BROOKHAVEN")
if oldGui then oldGui:Destroy() end

local gui = new("ScreenGui", { Name = "TIVEAU_BROOKHAVEN", ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, IgnoreGuiInset = true })
gui.Parent = guiParent

-- ---------- Notifications ----------
local toasts = new("Frame", { Size = UDim2.fromOffset(290, 400), Position = UDim2.new(1, -306, 0, 16),
    BackgroundTransparency = 1 }, gui)
new("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }, toasts)

local function notify(text, kind)
    local col = (kind == "bad" and T.bad) or (kind == "good" and T.good) or T.accent
    local f = new("Frame", { Size = UDim2.new(1, 0, 0, 40), BackgroundColor3 = T.card,
        BackgroundTransparency = 1, LayoutOrder = nextOrder() }, toasts)
    corner(f, 10)
    stroke(f, T.stroke, 1, 0.4)
    local bar = new("Frame", { Size = UDim2.new(0, 3, 1, -12), Position = UDim2.fromOffset(6, 6),
        BackgroundColor3 = col, BackgroundTransparency = 1 }, f)
    corner(bar, 2)
    local l = new("TextLabel", { Size = UDim2.new(1, -24, 1, 0), Position = UDim2.fromOffset(18, 0),
        BackgroundTransparency = 1, Text = text, TextColor3 = T.text, TextTransparency = 1,
        Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true }, f)
    tween(f, 0.2, { BackgroundTransparency = 0 })
    tween(bar, 0.2, { BackgroundTransparency = 0 })
    tween(l, 0.2, { TextTransparency = 0 })
    task.delay(3.2, function()
        if not f.Parent then return end
        tween(f, 0.3, { BackgroundTransparency = 1 })
        tween(bar, 0.3, { BackgroundTransparency = 1 })
        tween(l, 0.3, { TextTransparency = 1 })
        task.wait(0.35)
        f:Destroy()
    end)
end

-- ---------- Fenêtre principale ----------
local main = new("Frame", { Name = "Main", Size = UDim2.fromOffset(580, 420), AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5), BackgroundColor3 = T.bg, BorderSizePixel = 0, ClipsDescendants = true }, gui)
corner(main, 16)
stroke(main, T.stroke, 1)
local uiScale = new("UIScale", {}, main)
local function fit()
    local vp = cam().ViewportSize
    uiScale.Scale = math.clamp(math.min(vp.X / 640, vp.Y / 480), 0.5, 1)
end
fit()

local topLine = new("Frame", { Size = UDim2.new(1, 0, 0, 3), BackgroundColor3 = WHITE, BorderSizePixel = 0,
    ZIndex = 5 }, main)
gradient(topLine)

local bar = new("Frame", { Size = UDim2.new(1, 0, 0, 46), BackgroundColor3 = T.side, BorderSizePixel = 0 }, main)
new("TextLabel", { Size = UDim2.new(1, -110, 0, 24), Position = UDim2.fromOffset(16, 6),
    BackgroundTransparency = 1, Text = "🏡 TIVEAU PANEL • BROOKHAVEN", TextColor3 = T.text,
    Font = Enum.Font.GothamBlack, TextSize = 16, TextXAlignment = Enum.TextXAlignment.Left }, bar)
new("TextLabel", { Size = UDim2.new(1, -110, 0, 14), Position = UDim2.fromOffset(16, 28),
    BackgroundTransparency = 1, Text = "v1.0  •  RightShift = afficher / cacher  •  connecté : " .. LP.DisplayName,
    TextColor3 = T.sub, Font = Enum.Font.GothamMedium, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left }, bar)

local function barButton(text, xOff, color)
    local b = new("TextButton", { Size = UDim2.fromOffset(30, 26), Position = UDim2.new(1, xOff, 0, 10),
        BackgroundColor3 = color, BackgroundTransparency = 0.2, Text = text, TextColor3 = T.text,
        Font = Enum.Font.GothamBold, TextSize = 15, AutoButtonColor = false }, bar)
    corner(b, 8)
    b.MouseEnter:Connect(function() tween(b, 0.12, { BackgroundTransparency = 0 }) end)
    b.MouseLeave:Connect(function() tween(b, 0.12, { BackgroundTransparency = 0.2 }) end)
    return b
end
local minBtn = barButton("–", -76, T.card)
local closeBtn = barButton("✕", -40, T.bad)

do
    local dragging, dragStart, startPos
    bar.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging, dragStart, startPos = true, i.Position, main.Position
        end
    end)
    addConn(UIS.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            local d = (i.Position - dragStart) / uiScale.Scale
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end))
    addConn(UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end))
end

local sidebar = new("Frame", { Size = UDim2.new(0, 142, 1, -46), Position = UDim2.fromOffset(0, 46),
    BackgroundColor3 = T.side, BorderSizePixel = 0 }, main)
new("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }, sidebar)
new("UIPadding", { PaddingTop = UDim.new(0, 10), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8) }, sidebar)

local content = new("Frame", { Size = UDim2.new(1, -158, 1, -58), Position = UDim2.fromOffset(150, 54),
    BackgroundTransparency = 1 }, main)

local pages, tabs = {}, {}
local function selectTab(name)
    for n, pg in pairs(pages) do pg.Visible = (n == name) end
    for n, t in pairs(tabs) do
        local on = (n == name)
        tween(t.btn, 0.15, { BackgroundTransparency = on and 0 or 1 })
        t.btn.TextColor3 = on and WHITE or T.sub
    end
end
local function newTab(name)
    local btn = new("TextButton", { Size = UDim2.new(1, 0, 0, 34), BackgroundColor3 = WHITE,
        BackgroundTransparency = 1, Text = "  " .. name, TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamBold, TextSize = 14, TextColor3 = T.sub, AutoButtonColor = false,
        LayoutOrder = nextOrder() }, sidebar)
    corner(btn, 10)
    gradient(btn)
    local pg = new("ScrollingFrame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1,
        BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = T.accent,
        AutomaticCanvasSize = Enum.AutomaticSize.Y, CanvasSize = UDim2.new(), Visible = false }, content)
    new("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, pg)
    new("UIPadding", { PaddingRight = UDim.new(0, 8), PaddingBottom = UDim.new(0, 8) }, pg)
    pages[name] = pg
    tabs[name] = { btn = btn }
    btn.MouseButton1Click:Connect(function() selectTab(name) end)
    return pg
end

-- ---- Composants ----
local function card(pg, h)
    local f = new("Frame", { Size = UDim2.new(1, 0, 0, h), BackgroundColor3 = T.card,
        LayoutOrder = nextOrder() }, pg)
    corner(f, 10)
    stroke(f, T.stroke, 1, 0.4)
    return f
end
local function Section(pg, text)
    return new("TextLabel", { Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1,
        Text = string.upper(text), TextColor3 = T.accent, Font = Enum.Font.GothamBold, TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Left, LayoutOrder = nextOrder() }, pg)
end
local function Info(pg, text)
    return new("TextLabel", { Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1, Text = text,
        TextColor3 = T.sub, Font = Enum.Font.GothamMedium, TextSize = 13, TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left, LayoutOrder = nextOrder() }, pg)
end
local function InfoCard(pg, head, body)
    local f = new("Frame", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = T.card, LayoutOrder = nextOrder() }, pg)
    corner(f, 10)
    stroke(f, T.stroke, 1, 0.4)
    new("UIPadding", { PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12) }, f)
    new("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }, f)
    new("TextLabel", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1,
        Text = head, TextColor3 = T.accent, Font = Enum.Font.GothamBold, TextSize = 14, TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left, LayoutOrder = 1 }, f)
    if body then
        new("TextLabel", { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1,
            Text = body, TextColor3 = T.text, Font = Enum.Font.GothamMedium, TextSize = 13, TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left, LayoutOrder = 2 }, f)
    end
end
local function safe(cb, ...)
    local ok, err = pcall(cb, ...)
    if not ok then notify("Erreur : " .. tostring(err), "bad") end
end
local function Toggle(pg, name, cb)
    local row = card(pg, 40)
    new("TextLabel", { Size = UDim2.new(1, -70, 1, 0), Position = UDim2.fromOffset(14, 0),
        BackgroundTransparency = 1, Text = name, TextColor3 = T.text, Font = Enum.Font.GothamBold,
        TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left }, row)
    local sw = new("Frame", { Size = UDim2.fromOffset(40, 20), Position = UDim2.new(1, -54, 0.5, -10),
        BackgroundColor3 = T.stroke }, row)
    corner(sw, 10)
    local knob = new("Frame", { Size = UDim2.fromOffset(14, 14), Position = UDim2.fromOffset(3, 3),
        BackgroundColor3 = WHITE }, sw)
    corner(knob, 7)
    local btn = new("TextButton", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "" }, row)
    local on = false
    local obj = {}
    function obj.Set(v, silent)
        on = v and true or false
        tween(sw, 0.15, { BackgroundColor3 = on and T.accent or T.stroke })
        tween(knob, 0.15, { Position = on and UDim2.fromOffset(23, 3) or UDim2.fromOffset(3, 3) })
        if not silent then task.spawn(safe, cb, on) end
    end
    function obj.Get() return on end
    btn.MouseButton1Click:Connect(function() obj.Set(not on) end)
    return obj
end
local function Slider(pg, name, min, max, default, cb, dec)
    dec = dec or 0
    local row = card(pg, 54)
    new("TextLabel", { Size = UDim2.new(0.6, 0, 0, 24), Position = UDim2.fromOffset(14, 4),
        BackgroundTransparency = 1, Text = name, TextColor3 = T.text, Font = Enum.Font.GothamBold,
        TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left }, row)
    local valLbl = new("TextLabel", { Size = UDim2.new(0.3, 0, 0, 24), Position = UDim2.new(0.7, -14, 0, 4),
        BackgroundTransparency = 1, Text = "", TextColor3 = T.accent, Font = Enum.Font.GothamBold,
        TextSize = 14, TextXAlignment = Enum.TextXAlignment.Right }, row)
    local track = new("Frame", { Size = UDim2.new(1, -28, 0, 6), Position = UDim2.new(0, 14, 0, 38),
        BackgroundColor3 = T.stroke }, row)
    corner(track, 3)
    local fill = new("Frame", { Size = UDim2.fromScale(0, 1), BackgroundColor3 = WHITE }, track)
    corner(fill, 3)
    gradient(fill)
    local knob = new("Frame", { Size = UDim2.fromOffset(14, 14), BackgroundColor3 = WHITE }, track)
    corner(knob, 7)
    local hit = new("TextButton", { Size = UDim2.new(1, -28, 0, 24), Position = UDim2.new(0, 14, 0, 29),
        BackgroundTransparency = 1, Text = "" }, row)

    local function setVal(v, fire)
        v = math.clamp(v, min, max)
        local m = 10 ^ dec
        v = math.floor(v * m + 0.5) / m
        local rel = (v - min) / (max - min)
        fill.Size = UDim2.fromScale(rel, 1)
        knob.Position = UDim2.new(rel, -7, 0.5, -7)
        valLbl.Text = tostring(v)
        if fire then pcall(cb, v) end
    end
    setVal(default, false)
    local dragging = false
    local function fromX(x)
        local rel = math.clamp((x - hit.AbsolutePosition.X) / hit.AbsoluteSize.X, 0, 1)
        setVal(min + (max - min) * rel, true)
    end
    hit.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            fromX(i.Position.X)
        end
    end)
    addConn(UIS.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            fromX(i.Position.X)
        end
    end))
    addConn(UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end))
end
local function Button(pg, text, cb, primary)
    local b = new("TextButton", { Size = UDim2.new(1, 0, 0, 36), BackgroundColor3 = primary and WHITE or T.card,
        Text = text, TextColor3 = T.text, Font = Enum.Font.GothamBold, TextSize = 14, AutoButtonColor = false,
        LayoutOrder = nextOrder() }, pg)
    corner(b, 10)
    if primary then gradient(b) else stroke(b, T.stroke, 1, 0.4) end
    b.MouseEnter:Connect(function()
        if not primary then tween(b, 0.12, { BackgroundColor3 = T.cardHover }) end
    end)
    b.MouseLeave:Connect(function()
        if not primary then tween(b, 0.12, { BackgroundColor3 = T.card }) end
    end)
    b.MouseButton1Click:Connect(function() task.spawn(safe, cb) end)
    return b
end
local function Input(pg, name, default, cb)
    local row = card(pg, 40)
    new("TextLabel", { Size = UDim2.new(0.45, 0, 1, 0), Position = UDim2.fromOffset(14, 0),
        BackgroundTransparency = 1, Text = name, TextColor3 = T.text, Font = Enum.Font.GothamBold,
        TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left }, row)
    local tb = new("TextBox", { Size = UDim2.new(0.5, -20, 0, 26), Position = UDim2.new(0.5, 6, 0.5, -13),
        BackgroundColor3 = T.bg, Text = tostring(default or ""), PlaceholderText = "...",
        TextColor3 = T.text, PlaceholderColor3 = T.sub, Font = Enum.Font.GothamMedium, TextSize = 13,
        ClearTextOnFocus = false }, row)
    corner(tb, 8)
    stroke(tb, T.stroke, 1, 0.4)
    tb.FocusLost:Connect(function() task.spawn(safe, cb, tb.Text, tb) end)
    return tb
end

-- =====================================================================
--  FLY / VÉHICULE
-- =====================================================================
local flyBV, flyBG
local function stopFly()
    if flyBV then flyBV:Destroy() flyBV = nil end
    if flyBG then flyBG:Destroy() flyBG = nil end
    local h = hum()
    if h then h.PlatformStand = false end
end
local function startFly()
    local r, h = root(), hum()
    if not (r and h) then return end
    stopFly()
    flyBV = new("BodyVelocity", { MaxForce = Vector3.new(1e9, 1e9, 1e9), Velocity = Vector3.zero }, r)
    flyBG = new("BodyGyro", { MaxTorque = Vector3.new(1e9, 1e9, 1e9), P = 9e4, CFrame = r.CFrame }, r)
    h.PlatformStand = true
end
local function moveDir(h)
    local cf = cam().CFrame
    local d = Vector3.zero
    if UIS:IsKeyDown(Enum.KeyCode.W) then d += cf.LookVector end
    if UIS:IsKeyDown(Enum.KeyCode.S) then d -= cf.LookVector end
    if UIS:IsKeyDown(Enum.KeyCode.D) then d += cf.RightVector end
    if UIS:IsKeyDown(Enum.KeyCode.A) then d -= cf.RightVector end
    if UIS:IsKeyDown(Enum.KeyCode.E) then d += Vector3.yAxis end
    if UIS:IsKeyDown(Enum.KeyCode.Q) then d -= Vector3.yAxis end
    if UIS:IsKeyDown(Enum.KeyCode.Space) then d += Vector3.yAxis end
    if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then d -= Vector3.yAxis end
    if d.Magnitude == 0 and h and h.MoveDirection.Magnitude > 0 then
        local f = Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z)
        local rg = Vector3.new(cf.RightVector.X, 0, cf.RightVector.Z)
        if f.Magnitude > 0.01 and rg.Magnitude > 0.01 then
            local md = h.MoveDirection
            d = cf.LookVector * md:Dot(f.Unit) + cf.RightVector * md:Dot(rg.Unit)
        else
            d = h.MoveDirection
        end
    end
    return d
end

local vehBV, vehBG, vehPart
local vehYaw, vehVel = 0, Vector3.zero
local function stopVehFly()
    if vehBV then vehBV:Destroy() vehBV = nil end
    if vehBG then vehBG:Destroy() vehBG = nil end
    vehPart = nil
    vehVel = Vector3.zero
end

-- =====================================================================
--  ESP
-- =====================================================================
local espFolder = new("Folder", { Name = "ESP" }, gui)
local espObjs = {}
local function removeESP(p)
    local o = espObjs[p]
    if o then
        pcall(function() o.hl:Destroy() end)
        pcall(function() o.bb:Destroy() end)
        espObjs[p] = nil
    end
end
local function clearESP()
    for p in pairs(espObjs) do removeESP(p) end
end
local function makeESP(p)
    removeESP(p)
    local c = p.Character
    if not c then return end
    local anchor = c:FindFirstChild("Head") or c:FindFirstChild("HumanoidRootPart")
    if not anchor then return end
    local hl = new("Highlight", { Adornee = c, FillColor = T.accent, FillTransparency = 0.6, OutlineColor = WHITE,
        DepthMode = Enum.HighlightDepthMode.AlwaysOnTop }, espFolder)
    local bb = new("BillboardGui", { Adornee = anchor, Size = UDim2.fromOffset(170, 34),
        StudsOffset = Vector3.new(0, 2.6, 0), AlwaysOnTop = true }, espFolder)
    local lbl = new("TextLabel", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "",
        TextColor3 = T.text, TextStrokeTransparency = 0.3, TextStrokeColor3 = WHITE,
        Font = Enum.Font.GothamBold, TextSize = 13 }, bb)
    espObjs[p] = { hl = hl, bb = bb, lbl = lbl, char = c }
end
local function updateESP()
    if not S.esp then
        if next(espObjs) then clearESP() end
        return
    end
    local mr = root()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP then
            local o = espObjs[p]
            if p.Character and (not o or o.char ~= p.Character) then
                makeESP(p)
                o = espObjs[p]
            end
            if o and p.Character then
                local tr = p.Character:FindFirstChild("HumanoidRootPart")
                local dist = (mr and tr) and math.floor((tr.Position - mr.Position).Magnitude) or 0
                o.lbl.Text = p.DisplayName .. "\n" .. dist .. "m"
            end
        end
    end
    for p in pairs(espObjs) do
        if not p.Parent then removeESP(p) end
    end
end

-- =====================================================================
--  CHAT (emotes RP)
-- =====================================================================
local function sendChat(msg)
    return pcall(function()
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local ch = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
            if ch then ch:SendAsync(msg) end
        else
            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
        end
    end)
end

-- =====================================================================
--  ONGLET : JOUEUR
-- =====================================================================
local pPlayer = newTab("🏃  Joueur")
Section(pPlayer, "Mouvement")
local togSpeed
togSpeed = Toggle(pPlayer, "Vitesse", function(v)
    S.speedOn = v
    local h = hum()
    if h then h.WalkSpeed = v and Config.settings.speed or 16 end
end)
Slider(pPlayer, "Valeur vitesse", 16, 250, Config.settings.speed, function(v)
    Config.settings.speed = v
    saveConfig()
    local h = hum()
    if S.speedOn and h then h.WalkSpeed = v end
end)
Toggle(pPlayer, "Super saut", function(v)
    S.jumpOn = v
    if not v and hum() then hum().UseJumpPower = true hum().JumpPower = 50 end
end)
Slider(pPlayer, "Valeur saut", 50, 400, Config.settings.jump, function(v) Config.settings.jump = v saveConfig() end)
Toggle(pPlayer, "Saut infini", function(v) S.infJump = v end)
local togNoclip = Toggle(pPlayer, "Noclip (traverser les murs des maisons)", function(v) S.noclip = v end)
local togFly
togFly = Toggle(pPlayer, "Fly  (WASD / E monter / Q descendre)", function(v)
    S.fly = v
    if v then startFly() else stopFly() end
end)
Slider(pPlayer, "Vitesse du fly", 10, 250, Config.settings.flySpeed, function(v) Config.settings.flySpeed = v saveConfig() end)
Section(pPlayer, "Emotes RP")
Button(pPlayer, "👋 Saluer", function() sendChat("/e wave") end)
Button(pPlayer, "💃 Danse", function() sendChat("/e dance") end)
Button(pPlayer, "😂 Rire", function() sendChat("/e laugh") end)
Button(pPlayer, "🪑 S'asseoir", function()
    local h = hum()
    if h then h.Sit = true end
end)

-- =====================================================================
--  ONGLET : VÉHICULE
-- =====================================================================
local pVeh = newTab("🚗  Véhicule")
Section(pVeh, "Fly véhicule")
Info(pVeh, "W/S avancer • A/D tourner • E monter • Q descendre • Shift = turbo. Monte dans un véhicule d'abord.")
Toggle(pVeh, "Fly véhicule", function(v)
    S.vehFly = v
    if not v then stopVehFly() end
end)
Slider(pVeh, "Vitesse véhicule", 20, 400, Config.settings.vehSpeed, function(v) Config.settings.vehSpeed = v saveConfig() end)
Slider(pVeh, "Vitesse de rotation", 30, 300, Config.settings.vehTurn, function(v) Config.settings.vehTurn = v saveConfig() end)
Toggle(pVeh, "Inverser l'avant du véhicule", function(v)
    S.vehInvert = v
    stopVehFly()
end)
Section(pVeh, "Actions")
Button(pVeh, "Monter dans le véhicule le plus proche", function()
    local r, h = root(), hum()
    if not (r and h) then return end
    local best, bd
    for _, d in ipairs(workspace:GetDescendants()) do
        if d:IsA("VehicleSeat") and not d.Occupant then
            local dist = (d.Position - r.Position).Magnitude
            if not bd or dist < bd then best, bd = d, dist end
        end
    end
    if best then
        r.CFrame = best.CFrame + Vector3.new(0, 3, 0)
        task.wait(0.1)
        pcall(function() best:Sit(h) end)
        notify("Véhicule trouvé à " .. math.floor(bd) .. " studs", "good")
    else
        notify("Aucun véhicule libre trouvé", "bad")
    end
end, true)
Button(pVeh, "Freiner (arrêt immédiat)", function()
    local h = hum()
    local seat = h and h.SeatPart
    if seat then
        seat.AssemblyLinearVelocity = Vector3.zero
        seat.AssemblyAngularVelocity = Vector3.zero
    end
end)
Button(pVeh, "Retourner le véhicule", function()
    local h = hum()
    local seat = h and h.SeatPart
    if not seat then notify("Tu n'es pas dans un véhicule", "bad") return end
    local _, yaw = seat.CFrame:ToEulerAnglesYXZ()
    seat.AssemblyLinearVelocity = Vector3.zero
    seat.AssemblyAngularVelocity = Vector3.zero
    seat.CFrame = CFrame.new(seat.Position + Vector3.new(0, 4, 0)) * CFrame.Angles(0, yaw, 0)
end)

-- =====================================================================
--  ONGLET : VISUEL
-- =====================================================================
local pVis = newTab("👁  Visuel")
Section(pVis, "Joueurs")
Toggle(pVis, "ESP joueurs (voir à travers les maisons)", function(v) S.esp = v if not v then clearESP() end end)
local origLight
Toggle(pVis, "Fullbright (plus de nuit sombre)", function(v)
    S.fullbright = v
    if v then
        origLight = { Brightness = Lighting.Brightness, ClockTime = Lighting.ClockTime, FogEnd = Lighting.FogEnd,
            GlobalShadows = Lighting.GlobalShadows, Ambient = Lighting.Ambient }
    elseif origLight then
        for k, val in pairs(origLight) do Lighting[k] = val end
    end
end)
Slider(pVis, "Champ de vision (FOV)", 30, 120, math.floor(cam().FieldOfView + 0.5), function(v) cam().FieldOfView = v end)
Button(pVis, "Supprimer le brouillard", function()
    Lighting.FogEnd = 1e6
    for _, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("Atmosphere") then v:Destroy() end
    end
end)

-- =====================================================================
--  ONGLET : TÉLÉPORT
-- =====================================================================
local pTp = newTab("📍  Téléport")
Section(pTp, "Positions sauvegardées (6 slots)")
Info(pTp, "Les maisons et lieux changent selon la map et les mises à jour : sauvegarde toi-même ta maison, ton travail, etc.")
local wpSlot = 1
Slider(pTp, "Slot", 1, 6, 1, function(v) wpSlot = v end)
Button(pTp, "📌 Sauvegarder ma position dans le slot", function()
    local r = root()
    if not r then return end
    local p = r.Position
    Config.settings.waypoints[tostring(wpSlot)] = { p.X, p.Y, p.Z }
    saveConfig()
    notify("Position sauvegardée dans le slot " .. wpSlot, "good")
end)
Button(pTp, "🌀 Me téléporter au slot", function()
    local w = Config.settings.waypoints[tostring(wpSlot)]
    local r = root()
    if w and r then
        r.CFrame = CFrame.new(w[1], w[2] + 3, w[3])
    else
        notify("Slot " .. wpSlot .. " vide", "bad")
    end
end, true)
Section(pTp, "Joueurs")
Button(pTp, "TP vers un joueur aléatoire", function()
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then table.insert(list, p) end
    end
    if #list > 0 and root() then
        local p = list[math.random(#list)]
        root().CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
        notify("TP vers " .. p.DisplayName, "good")
    else
        notify("Aucun joueur trouvé", "bad")
    end
end)
Button(pTp, "TP au spawn", function()
    local sp = workspace:FindFirstChildOfClass("SpawnLocation") or workspace:FindFirstChild("SpawnLocation", true)
    if sp and root() then root().CFrame = sp.CFrame + Vector3.new(0, 5, 0) end
end)
Toggle(pTp, "Ctrl + Clic = Téléportation", function(v) S.clickTp = v end)
addConn(UIS.InputBegan:Connect(function(i, gp)
    if gp then return end
    if S.clickTp and i.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
        local m = LP:GetMouse()
        local r = root()
        if r and m.Hit then r.CFrame = CFrame.new(m.Hit.Position + Vector3.new(0, 3, 0)) end
    end
end))


-- =====================================================================
--  OBJETS DE LA MAP (physique, vu par tous)
-- =====================================================================
local destroyPool, lastPool = {}, 0
local function claimOwnership()
    pcall(function() sethiddenproperty(LP, "SimulationRadius", 1e9) end)
    pcall(function() sethiddenproperty(LP, "MaximumSimulationRadius", 1e9) end)
end
local function refreshDestroyPool(range, count)
    local r = root()
    if not r then return end
    lastPool = os.clock()
    local chars = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Character then chars[p.Character] = true end
    end
    local list, me = {}, r.Position
    for _, d in ipairs(workspace:GetDescendants()) do
        if d:IsA("BasePart") and not d.Anchored and d.Size.Magnitude < 100 then
            local skip = false
            local cur = d.Parent
            while cur and cur ~= workspace do
                if chars[cur] then skip = true break end
                cur = cur.Parent
            end
            if not skip then
                local dist = (d.Position - me).Magnitude
                if dist <= range then table.insert(list, { part = d, dist = dist }) end
            end
        end
    end
    table.sort(list, function(a, b) return a.dist < b.dist end)
    local out = {}
    for i = 1, math.min(#list, count) do out[i] = list[i].part end
    destroyPool = out
end

local pDestroy = newTab("💥  Destruction")
Section(pDestroy, "Réglages")
Info(pDestroy, "Agit sur les objets non ancrés de la map (décor, débris, objets lâchés). Effets visibles par tout le serveur, réversibles : rien n'est supprimé.")
local destroyRange, destroyCount, destroyForce = 60, 150, 220
Slider(pDestroy, "Portée (studs)", 20, 200, destroyRange, function(v) destroyRange = v end)
Slider(pDestroy, "Nombre d'objets max", 20, 400, destroyCount, function(v) destroyCount = v end)
Slider(pDestroy, "Force des effets", 50, 500, destroyForce, function(v) destroyForce = v end)

Section(pDestroy, "Effets ponctuels")
Button(pDestroy, "💥 Explosion générale (pousse tout au loin)", function()
    local r = root()
    if not r then notify("Personnage introuvable", "bad") return end
    claimOwnership()
    refreshDestroyPool(destroyRange, destroyCount)
    if #destroyPool == 0 then notify("Aucun objet trouvé à portée", "bad") return end
    for _, part in ipairs(destroyPool) do
        if part.Parent and not part.Anchored then
            local d = part.Position - r.Position
            local dir = d.Magnitude > 0.1 and d.Unit or Vector3.new(math.random() - 0.5, 0.6, math.random() - 0.5).Unit
            part.AssemblyLinearVelocity = dir * destroyForce + Vector3.new(0, destroyForce * 0.4, 0)
            part.AssemblyAngularVelocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20))
        end
    end
    notify("💥 Explosion sur " .. #destroyPool .. " objet(s)", "good")
end, true)

Button(pDestroy, "🌪 Implosion (attire puis repousse)", function()
    local r = root()
    if not r then notify("Personnage introuvable", "bad") return end
    claimOwnership()
    refreshDestroyPool(destroyRange, destroyCount)
    if #destroyPool == 0 then notify("Aucun objet trouvé à portée", "bad") return end
    local center = r.Position
    for _, part in ipairs(destroyPool) do
        if part.Parent and not part.Anchored then
            local d = center - part.Position
            if d.Magnitude > 0.1 then part.AssemblyLinearVelocity = d.Unit * destroyForce end
        end
    end
    task.wait(0.6)
    for _, part in ipairs(destroyPool) do
        if part.Parent and not part.Anchored then
            local d = part.Position - center
            local dir = d.Magnitude > 0.1 and d.Unit or Vector3.new(0, 1, 0)
            part.AssemblyLinearVelocity = dir * destroyForce * 1.6 + Vector3.new(0, destroyForce * 0.5, 0)
        end
    end
    notify("🌪 Implosion terminée", "good")
end, true)

Button(pDestroy, "🏚 Tremblement (secoue les objets proches)", function()
    claimOwnership()
    refreshDestroyPool(destroyRange, destroyCount)
    if #destroyPool == 0 then notify("Aucun objet trouvé à portée", "bad") return end
    task.spawn(function()
        local t0 = os.clock()
        while os.clock() - t0 < 2.5 do
            for _, part in ipairs(destroyPool) do
                if part.Parent and not part.Anchored then
                    part.AssemblyLinearVelocity = Vector3.new(
                        (math.random() - 0.5) * destroyForce,
                        math.random() * destroyForce * 0.5,
                        (math.random() - 0.5) * destroyForce)
                end
            end
            task.wait(0.05)
        end
    end)
    notify("🏚 Tremblement en cours (2.5 s)", "good")
end, true)

Button(pDestroy, "🚀 Tout envoyer dans le ciel", function()
    claimOwnership()
    refreshDestroyPool(destroyRange, destroyCount)
    if #destroyPool == 0 then notify("Aucun objet trouvé à portée", "bad") return end
    for _, part in ipairs(destroyPool) do
        if part.Parent and not part.Anchored then
            part.AssemblyLinearVelocity = Vector3.new((math.random() - 0.5) * destroyForce * 0.3,
                destroyForce * 2, (math.random() - 0.5) * destroyForce * 0.3)
        end
    end
    notify("🚀 " .. #destroyPool .. " objet(s) envoyé(s) dans le ciel", "good")
end, true)

task.spawn(function()
    while alive do
        task.wait(1)
        if os.clock() - lastPool < 3 then claimOwnership() end
    end
end)

-- =====================================================================
--  ONGLET : DIVERS
-- =====================================================================
local pMisc = newTab("⚙  Divers")
Section(pMisc, "Utilitaires")
Toggle(pMisc, "Anti-AFK", function(v) S.antiAfk = v end)
Slider(pMisc, "Gravité", 0, 400, math.floor(workspace.Gravity + 0.5), function(v) workspace.Gravity = v end)
Button(pMisc, "🚀 Boost FPS (graphismes bas)", function()
    pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
    Lighting.GlobalShadows = false
    local n = 0
    for _, d in ipairs(workspace:GetDescendants()) do
        if (d:IsA("ParticleEmitter") or d:IsA("Smoke") or d:IsA("Sparkles") or d:IsA("Trail"))
            and d.Name:sub(1, 6) ~= "TIVEAU" then
            d.Enabled = false
            n += 1
        end
    end
    notify("Boost FPS appliqué (" .. n .. " effets coupés)", "good")
end)
Section(pMisc, "Panel")
Slider(pMisc, "Transparence du panel", 0, 0.6, Config.settings.opacity or 0, function(v)
    Config.settings.opacity = v
    saveConfig()
    main.BackgroundTransparency = v
end, 2)
Button(pMisc, "Copier ma config (JSON)", function()
    if setclipboard then setclipboard(HttpService:JSONEncode(Config)) notify("Config copiée", "good") end
end)
local unload
Button(pMisc, "Décharger le panel", function() unload() end)


-- =====================================================================
--  ONGLET : ADMIN (console de commandes, pour toi uniquement)
-- =====================================================================
local pAdmin = newTab("🛡️  Admin")
Section(pAdmin, "Console de commandes")
Info(pAdmin, "Ces commandes agissent uniquement sur TON personnage. Il n'y a aucune commande pour kick/ban/forcer d'autres joueurs : ça ne fonctionnerait pas sur un serveur public et ce ne serait pas correct envers eux.")
local cmdLog = Info(pAdmin, "Prêt.")
local function runCommand(raw)
    local parts = {}
    for w in raw:gmatch("%S+") do table.insert(parts, w) end
    local cmd = (parts[1] or ""):lower():gsub("^/", "")
    table.remove(parts, 1)
    local arg1 = parts[1]

    if cmd == "speed" then
        local v = tonumber(arg1)
        if v then
            Config.settings.speed = math.clamp(v, 16, 250)
            saveConfig()
            togSpeed.Set(true)
            cmdLog.Text = "✅ Vitesse réglée à " .. Config.settings.speed
        else
            togSpeed.Set(not togSpeed.Get())
            cmdLog.Text = "✅ Vitesse " .. (togSpeed.Get() and "activée" or "désactivée")
        end
    elseif cmd == "fly" then
        togFly.Set(not togFly.Get())
        cmdLog.Text = "✅ Fly " .. (togFly.Get() and "activé" or "désactivé")
    elseif cmd == "noclip" then
        togNoclip.Set(not togNoclip.Get())
        cmdLog.Text = "✅ Noclip " .. (togNoclip.Get() and "activé" or "désactivé")
    elseif cmd == "esp" then
        S.esp = not S.esp
        if not S.esp then clearESP() end
        cmdLog.Text = "✅ ESP " .. (S.esp and "activé" or "désactivé")
    elseif cmd == "fullbright" then
        S.fullbright = not S.fullbright
        cmdLog.Text = "✅ Fullbright " .. (S.fullbright and "activé" or "désactivé")
    elseif cmd == "jump" then
        local v = tonumber(arg1) or 100
        Config.settings.jump = math.clamp(v, 50, 400)
        saveConfig()
        S.jumpOn = true
        local h = hum()
        if h then h.UseJumpPower = true h.JumpPower = Config.settings.jump end
        cmdLog.Text = "✅ Saut réglé à " .. Config.settings.jump
    elseif cmd == "heal" or cmd == "respawn" then
        local h = hum()
        if h then h.Health = (cmd == "heal") and h.MaxHealth or 0 end
        cmdLog.Text = cmd == "heal" and "✅ Soigné" or "✅ Reset du personnage"
    elseif cmd == "tp" and arg1 then
        local target
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Name:lower() == arg1:lower() or p.DisplayName:lower() == arg1:lower() then target = p end
        end
        local r = root()
        local tr = target and target.Character and target.Character:FindFirstChild("HumanoidRootPart")
        if r and tr then
            r.CFrame = tr.CFrame * CFrame.new(0, 0, 3)
            cmdLog.Text = "✅ Téléporté vers " .. target.DisplayName
        else
            cmdLog.Text = "❌ Joueur introuvable : " .. arg1
        end
    elseif cmd == "panic" then
        S.speedOn, S.fly, S.noclip, S.esp, S.fullbright = false, false, false, false, false
        togSpeed.Set(false, true) togFly.Set(false, true) togNoclip.Set(false, true)
        stopFly()
        clearESP()
        local h = hum()
        if h then h.WalkSpeed = 16 h.UseJumpPower = true h.JumpPower = 50 end
        cmdLog.Text = "✅ Tout désactivé"
    elseif cmd == "help" or cmd == "" then
        cmdLog.Text = "Commandes : /speed [valeur], /fly, /noclip, /jump [valeur], /esp, /fullbright, /heal, /respawn, /tp <pseudo>, /panic"
    else
        cmdLog.Text = "❌ Commande inconnue : " .. cmd .. "  (tape /help)"
    end
end
Input(pAdmin, "Commande", "/help", function(t, tb)
    if t and t ~= "" then runCommand(t) end
    tb.Text = ""
end)
Section(pAdmin, "Raccourcis rapides")
Button(pAdmin, "⛑️ Tout désactiver (panic button)", function() runCommand("/panic") end)
Button(pAdmin, "📖 Voir la liste des commandes", function() runCommand("/help") end)

-- =====================================================================
--  ONGLET : INFOS
-- =====================================================================
local pInfo = newTab("ℹ️  Infos")
Section(pInfo, "ℹ️ INFORMATIONS — TIVEAU PANEL")
InfoCard(pInfo, "👑 Créateur : @tiveauontop",
    "Le Tiveau Panel a été entièrement conçu par @tiveauontop. Il est le seul créateur et développeur de ce panel.")
InfoCard(pInfo, "🛠️ Développement en cours",
    "Le panel est toujours en développement et continue d’être amélioré de jour en jour afin de vous offrir la meilleure expérience possible. De nouvelles améliorations et fonctionnalités pourront être ajoutées au fil du temps.")
InfoCard(pInfo, "💬 Suggestions et commentaires",
    "Vous avez des idées, des suggestions ou des remarques pour améliorer le panel ? N’hésitez pas à nous en faire part sur notre Discord !")
InfoCard(pInfo, "🔗 Discord officiel : https://discord.gg/MMbMQ53MPt")
Button(pInfo, "📋 Copier le lien Discord", function()
    if setclipboard then setclipboard("https://discord.gg/MMbMQ53MPt") notify("Lien Discord copié", "good") end
end, true)
InfoCard(pInfo, "❤️ Merci à tous ceux qui soutiennent le projet et contribuent à son amélioration !")
InfoCard(pInfo, "━━━━━━━━━━━━━━━━━━━━", "⚡ TIVEAU PANEL — Créé par @tiveauontop")

-- =====================================================================
--  BOUCLES
-- =====================================================================
addConn(RunService.Stepped:Connect(function()
    if S.noclip and char() then
        for _, v in ipairs(char():GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end))

addConn(RunService.RenderStepped:Connect(function(dt)
    local h, r = hum(), root()
    if h then
        if S.speedOn then h.WalkSpeed = Config.settings.speed end
        if S.jumpOn then h.UseJumpPower = true h.JumpPower = Config.settings.jump end
    end
    if S.fly and flyBV and flyBG then
        local d = moveDir(h)
        flyBV.Velocity = (d.Magnitude > 0 and d.Unit or d) * Config.settings.flySpeed
        flyBG.CFrame = cam().CFrame
    end
    if S.vehFly then
        local seat = h and h.SeatPart
        if seat then
            if vehPart ~= seat or not vehBV or vehBV.Parent ~= seat then
                stopVehFly()
                vehPart = seat
                local _, y = seat.CFrame:ToEulerAnglesYXZ()
                vehYaw = S.vehInvert and (y - math.pi) or y
                vehVel = Vector3.zero
                vehBV = new("BodyVelocity", { MaxForce = Vector3.new(1e9, 1e9, 1e9), Velocity = Vector3.zero }, seat)
                vehBG = new("BodyGyro", { MaxTorque = Vector3.new(1e9, 1e9, 1e9), P = 9e4, D = 1200, CFrame = seat.CFrame }, seat)
            end
            local speed = Config.settings.vehSpeed
            if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then speed = speed * 2 end
            local turn, fwd, up = 0, 0, 0
            if UIS:IsKeyDown(Enum.KeyCode.A) then turn += 1 end
            if UIS:IsKeyDown(Enum.KeyCode.D) then turn -= 1 end
            if UIS:IsKeyDown(Enum.KeyCode.W) then fwd += 1 end
            if UIS:IsKeyDown(Enum.KeyCode.S) then fwd -= 1 end
            if UIS:IsKeyDown(Enum.KeyCode.E) then up += 1 end
            if UIS:IsKeyDown(Enum.KeyCode.Q) then up -= 1 end
            if turn == 0 and fwd == 0 and h.MoveDirection.Magnitude > 0 then
                local md = h.MoveDirection
                local want = math.atan2(-md.X, -md.Z)
                local diff = (want - vehYaw + math.pi) % (2 * math.pi) - math.pi
                vehYaw += math.clamp(diff, -1, 1) * math.rad(Config.settings.vehTurn) * dt * 2
                fwd = 1
            end
            vehYaw += turn * math.rad(Config.settings.vehTurn) * dt
            local fv = CFrame.Angles(0, vehYaw, 0).LookVector
            local target = fv * fwd * speed + Vector3.new(0, up * speed * 0.6, 0)
            vehVel = vehVel:Lerp(target, 1 - math.exp(-dt * 6))
            vehBV.Velocity = vehVel
            vehBG.CFrame = CFrame.Angles(0, vehYaw, 0) * (S.vehInvert and CFrame.Angles(0, math.pi, 0) or CFrame.new())
        elseif vehPart then
            stopVehFly()
        end
    end
    if S.fullbright then
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 1e6
        Lighting.GlobalShadows = false
        Lighting.Ambient = WHITE
    end
end))

task.spawn(function()
    while alive do
        task.wait(0.2)
        pcall(updateESP)
    end
end)

addConn(UIS.JumpRequest:Connect(function()
    if S.infJump and hum() then hum():ChangeState(Enum.HumanoidStateType.Jumping) end
end))

addConn(LP.Idled:Connect(function()
    if S.antiAfk then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end))

addConn(Players.PlayerRemoving:Connect(function(p)
    removeESP(p)
end))

addConn(LP.CharacterAdded:Connect(function()
    task.wait(0.6)
    if S.fly then startFly() end
    stopVehFly()
end))

local floatBtn
local function toggleMain()
    main.Visible = not main.Visible
    if floatBtn then floatBtn.Visible = not main.Visible end
end
addConn(UIS.InputBegan:Connect(function(i, gp)
    if gp then return end
    if i.KeyCode == Enum.KeyCode.RightShift then toggleMain() end
end))
addConn(cam():GetPropertyChangedSignal("ViewportSize"):Connect(fit))

floatBtn = new("TextButton", { Size = UDim2.fromOffset(46, 46), Position = UDim2.new(0, 16, 0.5, -23),
    BackgroundColor3 = WHITE, Text = "🏡", TextColor3 = WHITE, Font = Enum.Font.GothamBlack, TextSize = 22,
    AutoButtonColor = false, Visible = false }, gui)
corner(floatBtn, 23)
gradient(floatBtn, 45)
floatBtn.MouseButton1Click:Connect(toggleMain)
minBtn.MouseButton1Click:Connect(toggleMain)

unload = function()
    alive = false
    for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
    stopFly()
    stopVehFly()
    clearESP()
    local h = hum()
    if h then
        h.WalkSpeed = 16
        h.UseJumpPower = true
        h.JumpPower = 50
        h.PlatformStand = false
    end
    if S.fullbright and origLight then
        for k, val in pairs(origLight) do Lighting[k] = val end
    end
    G.TIVEAU_BROOKHAVEN_UNLOAD = nil
    gui:Destroy()
end
G.TIVEAU_BROOKHAVEN_UNLOAD = unload
closeBtn.MouseButton1Click:Connect(unload)

selectTab("🏃  Joueur")
notify("🏡 TIVEAU PANEL BROOKHAVEN chargé", "good")
