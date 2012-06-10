function getNow()
    local timeTable = {}
    local currentTime = os.date("!*t")
    
    --print(currentTime["hour"]..":"..currentTime["min"])
    
    return currentTime
    
end