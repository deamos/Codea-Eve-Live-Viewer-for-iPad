NotificationHandler = class()
function NotificationHandler:init()
    self.list = {}
    self.active = false
end

function NotificationHandler:push(type,parameters)
    newNotification = Notification(type,parameters)
    table.insert(self.list,newNotification)
    
    totalNotifications = totalNotifications + 1
    if type == "Kill" then 
        totalKillNotifications = totalKillNotifications + 1
    end

end

function NotificationHandler:pop()
    table.remove(self.list,1)
end

function NotificationHandler:draw()
    if table.maxn(self.list) >= 1 then
        if self.list[1].finished == false then
            if killNotifications == true and (self.list[1].type == "Kill") then
                local systemName = self.list[1].parameters[2]
                local secStatus = round(solarSystems[sysNameToId(systemName)][6],2)
                
                if (secStatus >0 and showEmpire == true) or (secStatus <= 0 and showNull == true) then
                
                    self.list[1]:draw()
                    self.active = true
                end
            elseif self.list[1].type == "CommError" then
                self.list[1]:draw()
                self.active = true
            end
        elseif self.list[1].finished == true then
            self:pop()
            self.active = false
        end
    end
end

function NotificationHandler:touched(touch)
    self.list[1]:touched(touch)
end

------------------------------------------------------

Notification = class()

function Notification:init(type,parameters)
    -- you can accept and set parameters here
    self.type = type
    self.parameters = parameters
    self.moved = false
    
    self.displayed = false
    self.displayedAt = nil
    self.finished = false
    self.iconSize = 10
end

function Notification:draw()
    -- Codea does not automatically call this method

    local xval = nil
    local yval = nil
    local systemName = nil
    local regionName = nil
    local secStatus = nil
    local sysID = nil
    local iskValue = nil
    local victimShipClass = nil
    
    if self.type == "Kill" then
        systemName = self.parameters[2]
        regionName = regions[solarSystems[sysNameToId(systemName)][1]]
        secStatus = round(solarSystems[sysNameToId(systemName)][6],2)
        sysID = sysNameToId(systemName)
        iskValue = tonumber(self.parameters[14])
        victimShipClass = self.parameters[15]

        xval = (WIDTH/2)+(solarSystems[sysID][3]/(scaleValX*10^xscale))+x
        yval = (HEIGHT/2)+(solarSystems[sysID][5]/(scaleValY*10^yscale))+y
    end
    
    

    
    if self.type == "Kill" then
        if kmFiltersToggle == false then
            self:handleNotificationTimer()
            self:drawBeacon(xval,yval)
            self:drawBox()
            --self:drawSysIndicator()
            self:drawKill(systemName,regionName,secStatus)
        elseif kmFiltersToggle == true then
            if kmFiltersRegionToggle == true then
                if iskValue >= KMFilterIsk then
                    for i,n in ipairs(kmFiltersList) do
                        if n == regionName then
                            self:handleNotificationTimer()
                            self:drawBeacon(xval,yval)
                            self:drawBox()
                            --self:drawSysIndicator()
                            self:drawKill(systemName,regionName,secStatus)
                        end
                    end
                end
            elseif iskValue >= KMFilterIsk then
                self:handleNotificationTimer()
                self:drawBeacon(xval,yval)
                self:drawBox()
                --self:drawSysIndicator()
                self:drawKill(systemName,regionName,secStatus)
            end             
        elseif iskValue >= KMFilterIsk then
            self:handleNotificationTimer()
            self:drawBeacon(xval,yval)
            self:drawBox()
            --self:drawSysIndicator()
            self:drawKill(systemName,regionName,secStatus)
        
        else
            self.finished = true
        end
    elseif self.type == "CommError" then
        self:handleNotificationTimer()
        self:drawBox()
        self:drawCommError()
    end

    
    popStyle()
    local currentDateTime = os.clock()
    if os.difftime(currentDateTime,self.displayedAt) > notificationTime then
        self.finished = true
    end
end

function Notification:touched(touch)
    -- Codea does not automatically call this method
    if touch.x >= WIDTH-70 and touch.x <= WIDTH-70+64 and touch.state ==BEGAN then
        if touch.y >= 82 and touch.y <= 82+64 then
            local killID = self.parameters[13]
            local url = "http://eve-kill.net/?a=kill_detail&kll_id="..killID
            
            openURL(url)
        end
    end
end

function Notification:drawKill(systemName,regionName,secStatus)
    
    local victimName = self.parameters[1]
    local victimID = self.parameters[5]
    local victimShipType = self.parameters[3]
    local shipID = self.parameters[4]
    local victimCorpName = self.parameters[6]
    local victimAllianceName = self.parameters[7]
    local FBName = self.parameters[8]
    local FBCorpName = self.parameters[9]
    local FBAllianceName = self.parameters[10]
    local involvedPartyCount = self.parameters[11]
    local timestamp = self.parameters[12]
    local iskValue = self.parameters[14]
    
    pushStyle()
    sprite("Eve Live View:52_64_9",35,110,64,64)
    
    fill(255, 109, 0, 255)
    font("Optima-ExtraBlack")
    textMode(CENTER)
    text("*** DED Alert - ".. timestamp .. " *** ",WIDTH/2,140)
            
    if self.moved == false and gotoEvent == true then
        xscale = 13.79
        yscale = 13.69
        kbBuffer = self.parameters[2]
        performSystemSearch()
        self.moved = true
    end
    
    
    pushStyle()
    sprite("Eve Live View:4_64_7",WIDTH-101,114,64,64)
        
    pushStyle()
    fill(31, 44, 77, 255)
    stroke(255, 255, 255, 255)
    strokeWidth(2)
    --rect(WIDTH-70,82,64,64)
    sprite("Eve Live View:84_64_15",WIDTH-37,114)
    popStyle()
    
    
    fill(255, 255, 255, 255)
    font("AmericanTypewriter-Bold")
    textMode(CORNER)
    textAlign(LEFT)
    text("System: ", 70,115)
    pushStyle()
    fill(162, 255, 0, 255)
    text(systemName, 150,115)
    popStyle()
        
    text("Security Status: ", 70,95)
    pushStyle()
    if secStatus >= .5 then
        fill(8, 255, 0, 255)
    elseif secStatus > 0 then
        fill(255, 219, 0, 255)
    else
        fill(255, 0, 0, 255)
    end
    text(secStatus,215,95)
        
    popStyle()
    fill(255, 255, 255, 255)
    font("AmericanTypewriter-Bold")
    textMode(CORNER)
    textAlign(LEFT)
    text("Region: ", 70,75)
    pushStyle()
    fill(255, 254, 0, 255)
    text(regionName, 145,75)
    popStyle()
    
    popStyle()
    fill(255, 255, 255, 255)
    font("AmericanTypewriter-Bold")
    fontSize(12)
    textMode(CORNER)
    textAlign(LEFT)
    text("Victim: ", 140,55)
    pushStyle()
    fill(222, 10, 10, 255)
    text(victimName, 192,55)
    popStyle()
    
    fill(255, 255, 255, 255)
    font("AmericanTypewriter-Bold")
    fontSize(12)
    textMode(CORNER)
    textAlign(LEFT)
    text("Corp: ", 140,39)
    pushStyle()
    fill(222, 10, 10, 255)
    text(victimCorpName, 178,39)
    popStyle()
    
    fill(255, 255, 255, 255)
    font("AmericanTypewriter-Bold")
    fontSize(12)
    textMode(CORNER)
    textAlign(LEFT)
    text("Alliance: ", 140,20)
    pushStyle()
    fill(222, 10, 10, 255)
    text(victimAllianceName, 202,20)
    popStyle()
    
    --Debug for Missing typeIDs
    if victimShipType == nil then
        victimShipType = "typeID:"..shipID
        --sound(SOUND_EXPLODE, 43651)
    end
    
    fill(255, 255, 255, 255)
    font("AmericanTypewriter-Bold")
    fontSize(12)
    textMode(CORNER)
    textAlign(LEFT)
    text("Ship Lost: ", 140,1)
    pushStyle()
    fill(0, 237, 255, 255)
    text(victimShipType, 206,1)
    popStyle()
    
    fill(255, 255, 255, 255)
    font("AmericanTypewriter-Bold")
    fontSize(12)
    textMode(CORNER)
    textAlign(LEFT)
    text("Killer: ", WIDTH-350,55)
    pushStyle()
    fill(66, 255, 0, 255)
    text(FBName, WIDTH-303,55)
    popStyle()
    
    fill(255, 255, 255, 255)
    font("AmericanTypewriter-Bold")
    fontSize(12)
    textMode(CORNER)
    textAlign(LEFT)
    text("Corp: ", WIDTH-350,39)
    pushStyle()
    fill(66, 255, 0, 255)
    text(FBCorpName, WIDTH-316,39)
    popStyle()
    
    fill(255, 255, 255, 255)
    font("AmericanTypewriter-Bold")
    fontSize(12)
    textMode(CORNER)
    textAlign(LEFT)
    text("Alliance: ", WIDTH-350,20)
    pushStyle()
    fill(66, 255, 0, 255)
    text(FBAllianceName, WIDTH-288,20)
    popStyle()
    
    pushStyle()
    stroke(255, 255, 255, 255)
    strokeWidth(2)
    line(138,20,WIDTH,20)
    line(138,1,138,75)
    popStyle()
    
    fill(255, 255, 255, 255)
    font("AmericanTypewriter-Bold")
    fontSize(12)
    textMode(CORNER)
    textAlign(LEFT)
    text("Pilots Involved: ", WIDTH-410,1)
    pushStyle()
    fill(66, 255, 0, 255)
    text(involvedPartyCount, WIDTH-305,1)
    popStyle()
    
    fill(255, 255, 255, 255)
    font("AmericanTypewriter-Bold")
    fontSize(12)
    textMode(CORNER)
    textAlign(LEFT)
    text("ISK value: ", WIDTH-240,1)
    pushStyle()
    fill(255, 138, 0, 255)
    text(comma_val(iskValue), WIDTH-173,1)
    popStyle()
    
    if shipImageID ~= shipID or shipImageID == nil then
        getShipImage(shipID)
    end

    if shipImage ~= nil then
        sprite(shipImage,102,38,62,62)
    end
    
    if charImageID ~= victimID or charImageID == nil then
        getVictimCharImage(victimID)
    end

    if charImage ~= nil then
        sprite(charImage,36,38,62,62)
    end
    
    
end

function Notification:drawCommError()
    pushStyle()
    sprite("Eve Live View:52_64_9",35,110,64,64)
    
    fill(255, 109, 0, 255)
    font("Optima-ExtraBlack")
    textMode(CENTER)
    text("*** Communications Error ***",WIDTH/2,140)
    
end
    

function Notification:drawBox()
    pushStyle()
    fill(33, 33, 33, 255)
    stroke(255, 255, 255, 188)
    strokeWidth(2)
    rect(0,0,WIDTH,150)
    popStyle()
    
    strokeWidth(2)
    stroke(255, 255, 255, 255)
    lineCapMode(ROUND)
    line(0,75,WIDTH,75)
end

function Notification:drawBeacon(xval,yval)
    pushStyle()
    tint(255, 0, 8, 255)
    sprite("Eve Live View:38_16_44",xval,yval,self.iconSize,self.iconSize)
    popStyle()
    
    self.iconSize = self.iconSize + 5
    
    if self.iconSize > 32 then
        self.iconSize = 10
    end
end

function Notification:handleNotificationTimer()
    if self.displayed == false then
        sound(SOUND_PICKUP, 8049)
        self.displayedAt = os.clock()
        self.displayed = true
    end
end

function Notification:drawSysIndicator()
    if self.type == "Kill" then
        local systemName = self.parameters[2]
        local regionName = regions[solarSystems[sysNameToId(systemName)][1]]
        local secStatus = round(solarSystems[sysNameToId(systemName)][6],2)
        local sysID = sysNameToId(systemName)

        local xval = (WIDTH/2)+(solarSystems[sysID][3]/(scaleValX*10^xscale))+x
        local yval = (HEIGHT/2)+(solarSystems[sysID][5]/(scaleValY*10^yscale))+y
    
        pushStyle()
        sprite("Eve Live View:38_16_208",xval-8,yval+10)
        popStyle()
    end
end
    
    
