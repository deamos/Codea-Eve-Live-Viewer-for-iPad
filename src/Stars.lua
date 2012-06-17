StarHandler= class()

function StarHandler:init()
    -- you can accept and set parameters here
    self.data = {}
    
    for i,star in pairs(solarSystems) do 
        newStar = Star(star[2],star[1],star[6],vec2(star[3],star[5]))
        self.data[i] = newStar
    end
    
    for i,jump in ipairs(solarSystemJumps) do
        local jumpTo = jump[3]
        local jumpSource = jump[2]
        table.insert(self.data[jumpSource].jumps,jumpTo)
    end
    
    solarSystems = nil
    solarSystemJumps = nil
        
end

function StarHandler:draw()
    -- Codea does not automatically call this method
    for i,star in pairs(self.data) do
        star:drawJumps()
        star:draw() 
    end
    
end

function StarHandler:touched(touch)
    -- Codea does not automatically call this method
end
--------------------------------------------------------
Star = class()

function Star:init(sysName,sysRegion,sysSec,sysPos)
    -- you can accept and set parameters here
    self.sysID = sysID
    self.sysName = sysName
    self.sysRegion = sysRegion
    self.sysSec = sysSec
    self.sysPos = sysPos
    self.jumps = {}
    self.sysOwningAlliance = nil
    self.sysOwningAllianceImg = nil
end

function Star:draw()
    -- Codea does not automatically call this method
    pushStyle()
    fill(255, 255, 255, 255)

    local secStatus = round(self.sysSec,2)

    local xval = (WIDTH/2)+(self.sysPos.x/(scaleValX*10^xscale))+x
    local yval = (HEIGHT/2)+(self.sysPos.y/(scaleValY*10^yscale))+y
    if xval > 0 and xval < WIDTH and yval > 0 and yval < HEIGHT then
        strokeWidth(0)

        if secStatus <= 0.00 then
            fill(255, 0, 0, 255)
        elseif secStatus <= 0.49 then
            fill(255, 220, 0, 255)
        else
            fill(42, 255, 0, 255)
        end
        
        if secStatus <= 0 and showNull == true then
            ellipse(xval,yval,6,6)
        elseif secStatus > 0 and showEmpire == true then
            ellipse(xval,yval,6,6)
        end
    end

    popStyle()
end

function Star:drawJumps()
    
    if drawLines == false or linesByNone == true then
        return
    end
    pushStyle()
    
    for i,v in ipairs(self.jumps) do
        
        local sourceSystem = self.sysID
        local sourceRegion = self.sysRegion

        local sourceSecStatus = round(self.sysSec,2)
        
        local sourceX = (WIDTH/2)+(self.sysPos.x/(scaleValX*10^xscale))+x
        local sourceY = (HEIGHT/2)+(self.sysPos.y/(scaleValY*10^yscale))+y
        
        local destSystem = v
        local destRegion = starHandle.data[destSystem].sysRegion
        
        local destSecStatus = round(starHandle.data[destSystem].sysSec, 2)
        
        local destX = (WIDTH/2)+(starHandle.data[destSystem].sysPos.x/(scaleValX*10^xscale))+x
        local destY = (HEIGHT/2)+(starHandle.data[destSystem].sysPos.y/(scaleValY*10^yscale))+y
        
        for n,dest in ipairs(starHandle.data[destSystem].jumps) do
            if dest == self.sysID then
                table.remove(starHandle.data[destSystem].jumps,n)
            end
        end
        
        if (sourceX > 0 and sourceX < WIDTH) or (destX > 0 and destX < WIDTH) then
            if (sourceY > 0 and sourceY < HEIGHT) or (destY > 0 and destY < HEIGHT) then
                
                strokeWidth(2)
                pushStyle()
                if sourceRegion ~= destRegion then
                    stroke(255, 0, 0, 255)
                elseif sourceRegion == destRegion then
                    stroke(15, 53, 239, 237)
                end
                
                if showEmpire == true then
                    if showNull == true then
                        if linesByRegion == false and linesBySystem == false then
                            line(sourceX,sourceY,destX,destY)
                        elseif linesByRegion == true and (sourceRegion == regionSelected or destRegion == regionSelected) then
                            line(sourceX,sourceY,destX,destY)
                        elseif linesBySystem == true and (sourceSystem == systemSelected or destSystem == systemSelected) then
                            line(sourceX,sourceY,destX,destY)
                        end
                        
                    elseif showNull == false then
                        if sourceSecStatus > 0.00 and destSecStatus > 0.00 then
                            if linesByRegion == false and linesBySystem == false then
                                line(sourceX,sourceY,destX,destY)
                            elseif linesByRegion == true and (sourceRegion == regionSelected or destRegion == regionSelected) then
                                line(sourceX,sourceY,destX,destY)
                            elseif linesBySystem == true and (sourceSystem == systemSelected or destSystem == systemSelected) then
                                line(sourceX,sourceY,destX,destY)
                            end
                        end
                    end
                    
                elseif showEmpire == false then
                    if showNull == true then
                        if sourceSecStatus <= 0.00 and destSecStatus <= 0.00 then
                            if linesByRegion == false and linesBySystem == false then
                                line(sourceX,sourceY,destX,destY)
                            elseif linesByRegion == true and (sourceRegion == regionSelected or destRegion == regionSelected) then
                                line(sourceX,sourceY,destX,destY)
                            elseif linesBySystem == true and (sourceSystem == systemSelected or destSystem == systemSelected) then
                                line(sourceX,sourceY,destX,destY)
                            end
                        end
                    end
                end
                            
                popStyle()
            end
        end
        
    popStyle()
        
    end
end

function Star:touched(touch)
    -- Codea does not automatically call this method
end

function Star:getOwningFactionData()
    local url = "http://evemaps.dotlan.net/system/"..self.sysName.."/kills"
    sysAlliance = nil
    http.get(url,gotSysInfo)
end

function Star:handleOwningFactionData()

    local sysAlliance = string.match(sysDotlanData,'/alliance/[%a%p]+"')
    
    if sysAlliance ~= nil then
        sysAlliance = string.sub(sysAlliance,11,string.len(sysAlliance)-1)
        self.sysOwningAlliance = string.gsub(sysAlliance,"_"," ")
        local sysAllianceURL = string.match(sysDotlanData,'http://e.dotlan.net/images/Alliance/[%d]+_128.png')
        getSysAllianceImg(sysAllianceURL)
    end
    
    sysDotlanData = nil
    
end


