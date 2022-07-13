local localPlayer = game.Players.localPlayer
local coins = localPlayer.Stats.Coins.Value

value:GetPropertyChangedSignal("Value"):Connect(function()
    task.wait() --prevent lag
    local textDisplay = script.Parent
    textDisplay.Text = coins.Value
end)