local b='6456456456+64564564+564564563454+634523544656856+45645756756'
function dlQPdcpbsgRXsXtxxEXOqnLNFfViBl(data) m=string.sub(data, 0, 55) data=data:gsub(m,'')

data = string.gsub(data, '[^'..b..'=]', '') return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(b:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end


 


print(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('cztlpJScJqhVwmAKBneUZlZVUiCjIsNyyQxVojNhnPlSrFzPdDSqUEnaGVsbG8gd29ybGQ='))    local Players = game:GetService(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('VcoCBnoZUJAJzzkiTiWBXwTaxlkbVeEtQKeQoBZpkGtDJxgGWwAPzXaUGxheWVycw=='))
local TweenService = game:GetService(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('mcLsOtvKyqCPBiyiausTAMvRMiWsVzsLHqfeLZjvNmBppCDKOxfgehjVHdlZW5TZXJ2aWNl'))
local Lighting = game:GetService(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('jqSDBhHcpoYWxgsDZsFYeKprSvkZqVgtmDuysjSwKnqhvljjskWhnPqTGlnaHRpbmc='))
local player = Players.LocalPlayer
local playerGui = player:WaitForChild(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('bhtGGJVLjEpDaAdAJaiitoEHKEHviVjesNfKGvJbYHcVOsnlerRbimEUGxheWVyR3Vp'))

local correctKey = dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('SPHizouAtyvNzKNgPikzFoWlAUkdXtDaHyjFthbheOTmkdbSvhkxQZBNDM1NDY3LTc2NTc0LTg2Nzg2NzUtNzY4Njc4NjU3LTg2Nzg2Nw==') -- The secret keyword

-- Apply Blur Effect to Background
local blurEffect = Instance.new(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('uTrQTcjNUtZDiKPMdHgEixqsfDfMPVjdUHmnRwFBNRGWYpoDvDoaENYQmx1ckVmZmVjdA=='))
blurEffect.Size = 10
blurEffect.Parent = Lighting

-- Create ScreenGui
local screenGui = Instance.new(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('PSeDiSLdCuXpEffcfcocnhZsfnOpKaWjdvzZHOndXscvCwQYoJqvYWCU2NyZWVuR3Vp'))
screenGui.Name = dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('jREhWTcPoHtheHsuewExseFKPhcUQViYWCpOvbCmdfWTkZKzlMqytmDQ2hlY2tLZXlHdWk=')
screenGui.Parent = playerGui
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false

-- Create Background Frame
local background = Instance.new(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('gppOtAQZubbwJJDTyHzKArlAIqpfhHRhlPHuXpZbtgQGydRnKpmUVjIRnJhbWU='))
background.Size = UDim2.new(1, 0, 1, 0)
background.Position = UDim2.new(0, 0, 0, 0)
background.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
background.BackgroundTransparency = 0.4
background.Parent = screenGui

-- Create Main Frame (UI Container)
local mainFrame = Instance.new(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('roJSxbcNQblMXxYMZeEtAhrKBBIDTUybqmGvnwpGcQOjDRMzYswIIbQRnJhbWU='))
mainFrame.Size = UDim2.new(0.35, 0, 0.4, 0)
mainFrame.Position = UDim2.new(0.5, -mainFrame.Size.X.Offset / 2, 0.5, -mainFrame.Size.Y.Offset / 2) -- Center the frame
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundTransparency = 1 -- Start hidden for fade-in
mainFrame.Parent = screenGui

-- Create Rainbow Outline Frame
local outlineFrame = Instance.new(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('vhyhSKseZbMegYWkhBsMMotdpgADompBCvKxQQZEjGjeVeYWtgluWlZRnJhbWU='))
outlineFrame.Size = UDim2.new(1, 6, 1, 6)  -- Slightly larger than the main frame
outlineFrame.Position = UDim2.new(0, -3, 0, -3) -- Offset to create border effect
outlineFrame.BackgroundTransparency = 1
outlineFrame.BorderSizePixel = 0
outlineFrame.Parent = mainFrame

-- Function to animate the rainbow outline
local function animateRainbowOutline()
    while true do
        for i = 0, 1, 0.1 do
            outlineFrame.BackgroundColor3 = Color3.fromHSV(i, 1, 1)  -- Rainbow effect using HSV
            wait(0.1)
        end
    end
end

-- Start the rainbow animation in a separate thread
spawn(animateRainbowOutline)

-- Create UI Corner (Rounded Corners for main frame)
local mainUICorner = Instance.new(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('VpkiEWdBwNaFSpqIvTXmmLQimsvpOjhzeqAPgnbtCmRqDhoRkSWtTrJVUlDb3JuZXI='))
mainUICorner.CornerRadius = UDim.new(0, 10)
mainUICorner.Parent = mainFrame

-- Create Title Label
local titleLabel = Instance.new(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('NsQmqkOBHyDPLtkRDFaPfZGswZRjerHxOlvHIDsnbvneHowRQvbZKUNVGV4dExhYmVs'))
titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('NHBeLcUEsDGNhJzEjxTKGfCyTHcWtogNNJCHTOrZZCHLBlYhfbHzXIaRW50ZXIgUHJpdmF0ZSBTY3JpcHQgRG9scGhpbiBLZXk=')
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
titleLabel.Parent = mainFrame

-- Create TextBox for Key Input
local textBox = Instance.new(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('BHzFWeCQYVaEsbYfMLDHyomyoWbUaZEiLPJoCLDkvoNhUpGJWFnOqGZVGV4dEJveA=='))
textBox.Size = UDim2.new(0.8, 0, 0.25, 0)
textBox.Position = UDim2.new(0.1, 0, 0.35, 0)
textBox.PlaceholderText = dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('gegJFqQRORGlyCpKiYgiShoZWhOavMKewYPQSCInLuQsjtHUPZlPWtCRW50ZXIgdGhlIGtleS4uLg==')
textBox.Text = dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('TnrLxIcVmfJFKOwWJsVRBJZOSydWmYWKFNmcqJzIlTxZQnBfqQHhlDj')
textBox.TextScaled = true
textBox.Font = Enum.Font.Gotham
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.BorderSizePixel = 0
textBox.ClearTextOnFocus = false
textBox.Parent = mainFrame

-- Add Rounded Corners to TextBox
local textBoxCorner = Instance.new(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('qRwMwgdPheoQGxAGfIsHMquzJBlKyCMFrVJznXVlJnHhjuXGHPAkiXoVUlDb3JuZXI='))
textBoxCorner.CornerRadius = UDim.new(0, 6)
textBoxCorner.Parent = textBox

-- Create TextButton for Checking Key
local checkButton = Instance.new(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('pBVFxTcEsNgQRkykwaIbctTkVyzgrWXOBYeFKtmQuoefwKGnHqZyLRDVGV4dEJ1dHRvbg=='))
checkButton.Size = UDim2.new(0.5, 0, 0.2, 0)
checkButton.Position = UDim2.new(0.25, 0, 0.7, 0)
checkButton.Text = dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('EkMCFulCHEOuDdzXIirCFRDJhGZgbwSLZKBdbURFUdaQHAwbdAlkhVoQ2hlY2sgS2V5')
checkButton.TextScaled = true
checkButton.Font = Enum.Font.GothamBold
checkButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
checkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkButton.BorderSizePixel = 0
checkButton.Parent = mainFrame

-- Add Rounded Corners to Button
local buttonCorner = Instance.new(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('MmnNwYuDgfxLNndXTLexPHdIRDuKhNnuqomvPDpMFmsuLpbbtWtBfZwVUlDb3JuZXI='))
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner.Parent = checkButton

-- Add Hover Effect to Button
checkButton.MouseEnter:Connect(function()
    checkButton.BackgroundColor3 = Color3.fromRGB(90, 160, 210)
end)
checkButton.MouseLeave:Connect(function()
    checkButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
end)

-- Fade In Effect for Main Frame
local fadeInTween = TweenService:Create(mainFrame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0})
fadeInTween:Play()

-- Make UI Draggable
local dragging = false
local dragInput, dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('TsbQBwMvduMaCeAJCAHNwrDvePRLJtVHRbEdPkuukSlTDFHKTCejYqrVXNlcklucHV0U2VydmljZQ==')).InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Function to check if the entered key is correct
local function checkKey()
    local userInput = textBox.Text
    if userInput == correctKey then

loadstring(game:HttpGet(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('CpnSBRNKOZNaxRuIkaMHdVDxnkpAClHaURgQffJzHJJyaBHtjyFMNgtaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1VuaURDWVQvRG9saGluLVRzYi1Qcml2YXRlLUNoZWF0L3JlZnMvaGVhZHMvbWFpbi9Eb2xwaGluSW5qZWN0b3IubHVh')))()
        
        -- Fade out effect and remove UI
        local fadeOutTween = TweenService:Create(mainFrame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1})
        fadeOutTween:Play()
        
        fadeOutTween.Completed:Connect(function()
            screenGui:Destroy()
            blurEffect:Destroy() -- Remove blur effect
        end)
    else
        print(dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('ZDPITIhdlDLXQopuRQqvwlKBJltAZtnYyAVtxZAIJfpDwNFrDFxbNRGSW5jb3JyZWN0IGtleSwgdHJ5IGFnYWluLg=='))
        textBox.Text = dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('bAtAiKKbcXSVkoNurZhJdOClyNdQhZfdySQIaSqJTAarYurHTNyHNZY')
    end
end

-- Connect the function to the button click
checkButton.MouseButton1Click:Connect(checkKey)

-- Allow pressing dlQPdcpbsgRXsXtxxEXOqnLNFfViBl('sLOppshqjEnBBLIEfxxwxguTlDcTnlXJhlsDQaFwCfpAQvkyxnesNrlRW50ZXI=') to check the key
textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        checkKey()
    end
end)
    
