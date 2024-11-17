local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Dolphin Fire", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local TsbTab = Window:MakeTab({
	Name = "Tsb",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = TsbTab:AddSection({
	Name = "Characters"
})

OrionLib:MakeNotification({
	Name = "UHUH",
	Content = "YOU EXECUTED DOKPHIN PRIVATE HUB",
	Image = "rbxassetid://4483345998",
	Time = 5
})

TsbTab:AddButton({
	Name = "Kj Script",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Gokou300/Gokou300/main/kJ%20Moveset%20V2%20by%20camerawoman"))()
  	end    
})

TsbTab:AddButton({
	Name = "Gojo (Equeip Saitama)",
	Callback = function()
_G.settings = {
    ["RedStartupId"] = "rbxassetid://1177475221",
    ["RedHitId"] = "rbxassetid://8625377966",
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToSorcerer/main/Latest.lua"))()
  	end    
})

TsbTab:AddButton({
	Name = "Gojo V2 (Equip Saitama)",
	Callback = function()
    getgenv().morph = true -- turn false to true if you want custom accessories
loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToSorcerer/refs/heads/main/LatestV2.lua"))()
  	end    
})

TsbTab:AddButton({
	Name = "Gojo Domain Expansion Move + some exstra cool moves! (Equip Saitama)",
	Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/777Q4QDN",true))()
  	end    
})

TsbTab:AddButton({
	Name = "Sukuna (Equip Hero hunter)",
	Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Yourfavoriteguy/Sukuna/refs/heads/main/CLEAVE!'))()
  	end    
})

local Section = TsbTab:AddSection({
	Name = "Utility"
})

TsbTab:AddButton({
	Name = "Death counter Alert",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/louismich4el/ItsLouisPlayz-Scripts/main/TSB%20Death%20Counter%20Identifier.lua"))()
  	end    
})

TsbTab:AddButton({
	Name = "Block Aimbot",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UniDCYT/Dolhin-Tsb-Private-Cheat/refs/heads/main/32OIFTRJERLKDJFL34JFRLKD.lua"))()
  	end    
})

local LSTab = Window:MakeTab({
	Name = "No Limit Lifting Simulator",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

LSTab:AddButton({
	Name = "Auto Sell/Auto Lift",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SkoterScripts/No-Limit-Lifting-Simulator/refs/heads/main/Script"))()
  	end    
})
