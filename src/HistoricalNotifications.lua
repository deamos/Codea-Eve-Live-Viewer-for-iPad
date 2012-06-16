HistoricalNotificationHandler = class()

function HistoricalNotificationHandler:init()
    self.data = {}
    
end

HistoricalNotification = class()

function HistoricalNotification:init(type,parameters)
    -- you can accept and set parameters here
    self.type = type
    self.parameters = paramters
end

function HistoricalNotification:draw()
    -- Codea does not automatically call this method
end

function HistoricalNotification:touched(touch)
    -- Codea does not automatically call this method
end
