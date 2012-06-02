function drawlines()
    if drawLines == false or linesByNone == true then
        return
    end
    pushStyle()
    
    for i,v in ipairs(solarSystemJumps) do
        
        local sourceSystem = v[2]
        local sourceRegion = v[1]

        local sourceSecStatus = round(solarSystems[sourceSystem][6],2)
        
        local sourceX = (WIDTH/2)+(solarSystems[sourceSystem][3]/(scaleValX*10^xscale))+x
        local sourceY = (HEIGHT/2)+(solarSystems[sourceSystem][5]/(scaleValY*10^yscale))+y
        
        local destSystem = v[3]
        local destRegion = v[4]
        
        local destSecStatus = round(solarSystems[destSystem][6],2)
        
        local destX = (WIDTH/2)+(solarSystems[destSystem][3]/(scaleValX*10^xscale))+x
        local destY = (HEIGHT/2)+(solarSystems[destSystem][5]/(scaleValY*10^yscale))+y
        
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

function drawStars()
    pushStyle()
    fill(255, 255, 255, 255)
    for i,v in pairs(solarSystems) do

        local secStatus = round(solarSystems[i][6],2)

        local xval = (WIDTH/2)+(solarSystems[i][3]/(scaleValX*10^xscale))+x
        local yval = (HEIGHT/2)+(solarSystems[i][5]/(scaleValY*10^yscale))+y
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

    end
    popStyle()
end

function drawLabel()

    for i,v in pairs(solarSystems) do

        local secStatus = round(solarSystems[i][6],2)

        local xval = (WIDTH/2)+(solarSystems[i][3]/(scaleValX*10^xscale))+x
        local yval = (HEIGHT/2)+(solarSystems[i][5]/(scaleValY*10^yscale))+y
        if (xval > (WIDTH/2-1.75) and xval < (WIDTH/2+1.75) and yval > (HEIGHT/2-1.75) and yval < (HEIGHT/2+1.75)) then
            if ((showEmpire == true and secStatus > 0) or (showNull == true and secStatus <= 0)) and infoBar == true then
                
                gotoSystem(i)
                local systemName = solarSystems[i][2]
                local regionName = solarSystems[i][1]
                
                sysBar = true
                sysBarName = systemName
                
                pushStyle()
                stroke(78, 78, 78, 137)
                strokeWidth(1)
                fill(80, 80, 80, 216)
                rect(WIDTH-250,HEIGHT-565,245,450)
                
                strokeWidth(2)
                stroke(255, 0, 0, 255)
                fill(255, 0, 0, 0)
                sprite("Eve Live View:105_32_27",xval,yval)
                
                font("AmericanTypewriter-Bold")
                fontSize(16)
                fill(255, 255, 255, 255)
                text(systemName,(WIDTH-250+(245/2)),HEIGHT-565+430)
                    
                sprite("Eve Live View:7_64_4",WIDTH-250+30,HEIGHT-565+420)
                    
                fontSize(14)
                font("AmericanTypewriter")
                fill(249, 249, 249, 255)
                text(regions[regionName],(WIDTH-250+(245/2)),HEIGHT-565+410)
                lineCapMode(ROUND)
                smooth()
                strokeWidth(5)
                stroke(255, 255, 255, 255)
                line((WIDTH-250+(245/9)),HEIGHT-565+390,WIDTH-250+(245/2+100),HEIGHT-565+390)
                textMode(CORNER)
                textAlign(LEFT)
                text("Sec Status: " .. secStatus ,WIDTH-250+10,HEIGHT-565+360)
                    
                local displayedJumps = {}
                local yPosOffset = HEIGHT-565+330
                for n,m in pairs(solarSystemJumps) do
                        
                    local sourceSystem = m[2]
                    local destSystem = m[3]
                        
                    if sourceSystem == i then
                        sprite("Eve Live View:38_16_251",WIDTH-250+18,yPosOffset+9)
                        text(solarSystems[destSystem][2],WIDTH-250+30,yPosOffset)
                        yPosOffset=yPosOffset-20
                        sourceSystem = nil
                        destSystem = nil
                    end
                end
                    
                    
                lineCapMode(ROUND)
                smooth()
                strokeWidth(5)
                stroke(255, 255, 255, 255)
                line((WIDTH-250+(245/9)),yPosOffset,WIDTH-250+(245/2+100),yPosOffset)
                fill(106, 106, 106, 255)
                stroke(154, 154, 154, 255)
                strokeWidth(2)
                rect(WIDTH-250+8,HEIGHT-565+7,66,67)
                sprite("Eve Live View:95_64_12",WIDTH-250+40,HEIGHT-565+40)
                fill(106, 106, 106, 255)
                stroke(154, 154, 154, 255)
                strokeWidth(2)
                rect(WIDTH-85+8,HEIGHT-565+7,66,67)
                sprite("Eve Live View:95_64_10",WIDTH-85+40,HEIGHT-565+40)
            end
            popStyle()
                
            systemSelected = i
            regionSelected = solarSystems[i][1]

            return
        end
    systemSelected = nil
    regionSelected = nil
    sysBar = false
    sysBarName = nil
    end
end

function drawBoxes()
    --Zoom In/Zoom Out Buttons
    pushStyle()
    sprite("Eve Live View:44_32_44",WIDTH-76+36/2,HEIGHT*.95+35/2)
    sprite("Eve Live View:44_32_43",WIDTH-38+36/2,HEIGHT*.95+35/2)
    popStyle()
    popStyle()
    
    pushStyle()
    if mapStarLinesToggle == true then
        tint(0, 255, 26, 255)
    end
    sprite("Eve Live View:44_32_58",26,HEIGHT*.95+16)
    popStyle()
    
    pushStyle()
    strokeWidth(1)
    stroke(104, 104, 104, 130)
    fill(57, 59, 58, 194)
    rect(285,HEIGHT*.95,200,35)
    popStyle()
    pushStyle()
    fill(255, 255, 255, 255)
    font("Courier-Bold")
    fontSize(18)
    textMode(CORNER)
    textAlign(RIGHT)
    text(kbBuffer,288,HEIGHT*.95+9)
    popStyle()
    
    pushStyle()
    strokeWidth(1)
    stroke(255, 255, 255, 255)
    fill(27, 73, 145, 255)
    rect(485,HEIGHT*.95,35,35)
    fontSize(18)
    fill(255, 255, 255, 255)
    sprite("Eve Live View:77_32_49",503,HEIGHT*.95+35/2)
    popStyle()
    
    pushStyle()
    strokeWidth(2)
    stroke(255, 255, 255, 255)
    fill(80, 74, 70, 255)
    --rect(WIDTH-38,HEIGHT-100,35,35)
    fill(255, 255, 255, 255)
    sprite("Eve Live View:77_32_30",WIDTH-21,HEIGHT-100+35/2,28,28)
    popStyle()
    
    pushStyle()
    strokeWidth(2)
    stroke(255, 255, 255, 255)
    fill(80, 74, 70, 255)
    if infoBar == false then
        tint(212, 209, 209, 255)
    else
        tint(27, 255, 0, 255)
    end
    sprite("Eve Live View:44_32_24",WIDTH-23,HEIGHT-140,28,28)
    popStyle()
    
end

function drawSearchBox()
    for n,p in ipairs(systemSearchHelper) do
        p:draw()
    end
end

function drawRefreshTimer()
    local timeUntilMin= (300 - os.difftime(currentClock,appClock))/60
    local timeUntilSec= (300 - os.difftime(currentClock,appClock))%60
    pushStyle()
    font("Copperplate")
    fill(255, 0, 0, 255)
    fontSize(16)
    textMode(CORNER)
    textAlign(LEFT)
    if timeUntilSec < 10 then
        timeUntilSec = "0" .. timeUntilSec
    end
    text(math.floor(timeUntilMin)..":"..timeUntilSec,WIDTH-190,HEIGHT*.95+8)
    sprite("Eve Live View:105_32_7",WIDTH-190+50,HEIGHT*.95+18)
end
    
function drawStarLinesBar()
    
    pushStyle()
    fill(30, 174, 22, 255)
    rect(5,HEIGHT*.95-45,40,35)
    fill(255, 0, 0, 255)
    rect(5,HEIGHT*.95-80,40,35)
    fontSize(9)
    fill(255, 255, 255, 255)
    text("Empire",5+20,HEIGHT*.95-45+35/2)
    text("Null",5+20,HEIGHT*.95-80+35/2)
    popStyle()
    
    pushStyle()
    fontSize(10)
    font("Futura-CondensedMedium")
    if linesByRegion == true then
        fill(87, 112, 183, 255)
    else
        
        fill(70, 70, 70, 255)
    end
    rect(5,HEIGHT*.95-120,40,35)
    fill(255, 255, 255, 255)
    text("Region",5+20,HEIGHT*.95-120+35/2)
    if linesBySystem == true then
        fill(87, 112, 183, 255)
    
    else
        fill(70, 70, 70, 255)
    end
    rect(5,HEIGHT*.95-155,40,35)
    fill(255, 255, 255, 255)
    text("System",5+20,HEIGHT*.95-155+35/2)
    if linesBySystem == false and linesByRegion == false and linesByNone == false then
        fill(87, 112, 183, 255)
        
    else
        fill(70, 70, 70, 255)
    end
    rect(5,HEIGHT*.95-190,40,35)
    fill(255, 255, 255, 255)
    text("All",5+20,HEIGHT*.95-190+35/2)
    if linesByNone == true then
        fill(87, 112, 183, 255)
        
    else
        fill(70, 70, 70, 255)
    end
    rect(5,HEIGHT*.95-225,40,35)
    fill(255, 255, 255, 255)
    text("None",5+20,HEIGHT*.95-225+35/2)
    popStyle()
    
end

