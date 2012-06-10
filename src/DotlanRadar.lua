dotlanRadarBucket = nil

DotlanRadar = class()

function DotlanRadar:init()
    -- you can accept and set parameters here
    self.system = nil
    self.lastChecked = nil
    self.token = ""
    self.url = "http://evemaps.dotlan.net/map/follow/"
    self.waitingForData = false
    self.active = false
    self.iconSize = 5
    self.moved = false
end

function DotlanRadar:setToken(token)
    self.token = token
end

function DotlanRadar:draw()
    -- Codea does not automatically call this method
    
end

function DotlanRadar:touched(touch)
    -- Codea does not automatically call this method
end

function DotlanRadar:getLocation()
    http.get(self.url .. self.token,gotDotlanRadarData)
    self.waitingForData = true
    self.lastChecked = os.clock()
end

function gotDotlanRadarData(data,status,headers)
    --print("getting")
    dotlanRadarBucket = data
end

function DotlanRadar:parseDotlanRadarData()
    if self.waitingForData == true and dotlanRadarBucket ~= nil then
        self.waitingForData = false
        local sysName = string.match(dotlanRadarBucket,'/T:'..self.token..'/[%a+%s+]+"')
        
        if sysName == nil then
            self.active = false
            self.waitingForData = false
            dotlanRadarBucket = nil
            self:getLocation()
            return
        end
        
        sysName = string.gsub(sysName,"/T:"..self.token.."/","")
        sysName = string.sub(sysName,1,string.len(sysName)-1)
        
        if self.system ~= sysName then
            self.moved = false
        end
        
        self.system = sysName
        self.active = true
        dotlanRadarBucket = nil
    end
end

function DotlanRadar:displayLocation()
    if self.active == true and self.system ~= nil then
        local sysID = sysNameToId(self.system)
        
        xval = (WIDTH/2)+(solarSystems[sysID][3]/(scaleValX*10^xscale))+x
        yval = (HEIGHT/2)+(solarSystems[sysID][5]/(scaleValY*10^yscale))+y
        sprite("Eve Live View:38_16_195",xval,yval,self.iconSize,self.iconSize)
        
        if self.moved == false and gotoRadar == true then
            gotoSystem(sysID)
            self.moved = true
        end
        
        self.iconSize = self.iconSize + 5
        
        if self.iconSize > 40 then
            self.iconSize = 5
        end
        
    end
end

