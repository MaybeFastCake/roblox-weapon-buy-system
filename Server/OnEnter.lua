game.Players.PlayerAdded:Connect(Function(player)
    local startSwordModel
    local plrBackpack = player.Backpack
    local clonedModel = startSwordModel:Clone()
    
    clonedModel.Parent = plrBackpack
end