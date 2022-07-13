local function onButtinClicked()
    local frame = script.Parent.Parent
    if frame.Enabled == false then 
        frame.Enabled = true
        else
            frame.Enabled = false
    end
end
script.Parent.Activated:Connect(onButtinClicked)