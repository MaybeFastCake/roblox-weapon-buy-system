local Players = game:GetService("Players")
local TestService = game:GetService("TestService")
local RunService = game:GetService("RunService")
local DataStoreService = game:GetService("DataStoreService")
local DataStore = DataStoreService:GetDataStore("DataStoreValues") --Name the DataStore whatever you want

Players.PlayerAdded:Connect(function(player)

    local Stats = Instance.new('Folder')
    Stats.Name = 'Stats'
    Stats.Parent = player
    
    local SwordSaves = Instance.new("Folder")
    SwordSaves.Name = "SwordSaves"
    SwordSaves.Parent = player
    
    local EquippedSwords = Instance.new("Folder")
    EquippedSwords.Name = "EquippedSwords"
    EquippedSwords.Parent = SwordSaves
    
    local SwordsBought = Instance.new("Folder")
    SwordsBought.Name = "SwordsBought"
    SwordsBought.Parent = SwordSaves

    --Creating Equipped DataStoreValues
    local CurrentSword = Instance.new("IntValue")
    CurrentSword.Name = "CurrentSword"
    CurrentSword.Value = 1 --default
    CurrentSword.Parent = EquippedSwords
    --Creating Bought Swords
    local Sword1 = Instance.new("BoolValue")
    Sword1.Name = "Sword1"
    Sword1.Value = true --default
    Sword1.Parent = SwordsBought
    
    local Sword2 = Instance.new("BoolValue")
    Sword2.Name = "Sword2"
    Sword2.Value = false
    Sword2.Parent = SwordsBought
    
    
	local value1Data = CurrentSword
    local value2Data = Sword1
    local value3Data = Sword2

	local s, e = pcall(function()
		value1Data = DataStore:GetAsync(player.UserId..'-Value1') or 0 --check if they have data, if not it'll be "0"
        value2Data = DataStore:GetAsync(player.UserId..'-Value2') or true --we used true because its a bool value!
        value3Data = DataStore:GetAsync(player.UserId..'-Value3') or false --we used true because its a bool value!
	end)

	if s then
		CurrentSword.Value = value1Data --setting data if its success
        SwordsBought.Value = value2Data
	else
		TestService:Error(e)  --if not success then we error it to the console
	end
end)

Players.PlayerRemoving:Connect(function(player)
local s, e = pcall(function()
	DataStore:SetAsync(player.UserId..'-Value1', player.Stats.EquippedSwords.CurrentSword.Value) --setting data
    DataStore:SetAsync(player.UserId..'-Value2', player.Stats.SwordsBought.Sword1.Value)
    DataStore:SetAsync(player.UserId..'-Value3', player.Stats.SwordsBought.Sword2.Value)
	end)
	if not s then TestService:Error(e) 
	end
end)

game:BindToClose(function(player)
      if not RunService:IsStudio() then
          local s, e = pcall(function()
	      DataStore:SetAsync(player.UserId..'-Value1', player.Stats.EquippedSwords.CurrentSword.Value) --setting data
          DataStore:SetAsync(player.UserId..'-Value2', player.Stats.SwordsBought.Sword1.Value)
          DataStore:SetAsync(player.UserId..'-Value3', player.Stats.SwordsBought.Sword2.Value)
	end)
	if not s then TestService:Error(e) 
	       end
     end)
end)