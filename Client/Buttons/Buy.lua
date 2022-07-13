local player = game:GetService("Players").LocalPlayer
--input sword data below
local swordID = 2
local swordPrice = 500
local swordModel = game:GetService("ReplicatedStorage").Models.Swords.Sword2

local function BuyClick()
    task.wait(.1) --preventing spam abuse
    local Remote = game:GetService("ReplicatedStorage").Remotes.BuyRemote
    Remote.FireServer(player, swordID, swordPrice, swordModel)
end
script.Parent.Activated:Connect(BuyClick)