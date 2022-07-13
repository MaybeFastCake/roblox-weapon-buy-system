local RemoteEvent = game:GetService("ReplicatedStorage").Remotes.BuyRemote


local function TakeAction(player, swordID, swordPrice, swordModel)
    task.wait() --preventing spam abuse
    print("Recieved Event --Debugging")
    local Coins = player.Stats.Coins.Value
    local Stats = player.Stats
    local PlayerName = player.Name
    local UserBackpack = game.Players.PlayerName.Backpack
    
    if swordID == Stats.SwordSaves.EquippedSwords.CurrentSword.Value then
        return
     else
         if Coins >= swordPrice then 
             Coins = Coins - swordPrice
             print("Player is elidgible")
             local clonedModel = swordModel:Clone()
             clonedModel.Parent = UserBackpack
             --saving
             Stats.SwordSaves.EquippedSwords.CurrentSword.Value = swordID
             Stats.SwordSaves.SwordsBought.Sword2.Value = true
        end
    end
end

RemoteEvent.OnServerEvent:Connect(TakeAction)