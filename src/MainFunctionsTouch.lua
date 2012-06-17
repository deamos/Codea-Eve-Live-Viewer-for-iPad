function handleMainTouch(touch)
    
    if notifyHandle.active == true then
        if touch.x >= 0 and touch.x <= WIDTH and touch.y >= 0 and touch.y <= 150 then
            notifyHandle.list[1]:touched(touch)
            return
        end
    end
    if infoBar == true then
        handleSysBarTouch(touch)
    end
    handleSearchBoxTouch(touch)
    handleSearchBarButton(touch)
    handleSearchBarGoButton(touch)
    
    handleZoomButtons(touch)
    handleOpenSettingsButton(touch)
    handleStarsLinesToggle(touch)
    if mapStarLinesToggle == true then
        handleStarLinesButtons(touch)
    end
    handleInfoBarToggle(touch)
    
    handleForceRedownload(touch)
    
    handleTouchMove(touch)
end
    
function handleTouchMove(touch)
    if touch.state == BEGAN then
        initialTouch = vec2(touch.x,touch.y)
    
    elseif touch.state == MOVING then
        drawLines = false
        deltax = (touch.x - initialTouch.x)*.3
        deltay = (touch.y - initialTouch.y)*.3
        
        x=x+deltax
        y=y+deltay
        
        initialTouch = vec2(touch.x,touch.y)
    
    elseif touch.state == ENDED then
        drawLines = true
        --initialTouch = vec2(touch.x,touch.y)
    end
end

function handleZoomButtons(touch)
    if (touch.x >= WIDTH-38) and (touch.x <= ((WIDTH-38)+35)) and touch.state==BEGAN then
        if (touch.y >= HEIGHT*.95) and (touch.y <= ((HEIGHT*.95)+35)) then
            zoomIn(touch)
            return
        end
    elseif (touch.x >= WIDTH-76) and (touch.x <= ((WIDTH-76)+35)) and touch.state==BEGAN then
        if (touch.y >= HEIGHT*.95) and (touch.y <= ((HEIGHT*.95)+35)) then
            zoomOut(touch)
            return
        end
    end
end

function handleSearchBarButton(touch)
        
    if touch.x>=285 and touch.x < 485 and touch.state == BEGAN then
        if touch.y >= HEIGHT*.95 and touch.y <= HEIGHT*.95+35 then
            showKeyboard()
            return
        end
    end
end

function handleStarLinesButtons(touch)
    if (touch.x >= 5 and touch.x <= 45) and touch.state == BEGAN then
        if (touch.y >= HEIGHT*.95-45) and (touch.y <= ((HEIGHT*.95)-45+35)) then
            showEmpire = not showEmpire
            sound(SOUND_PICKUP, 16218)
            return
        end
    end
        
    if (touch.x >= 5 and touch.x <= 45) and touch.state == BEGAN then
        if (touch.y >= HEIGHT*.95-80) and (touch.y <= ((HEIGHT*.95)-80+35)) then
            showNull = not showNull
            sound(SOUND_PICKUP, 16218)
            return
        end
    end
    
    if (touch.x >= 5 and touch.x < 45) and touch.state == BEGAN then
        if (touch.y >= HEIGHT*.95-120) and (touch.y <= ((HEIGHT*.95)-120+35)) then
            linesBySystem = false
            linesByNone = false
            linesByRegion = true
            sound(SOUND_PICKUP, 16218)
            return
        end
    end
        
    if (touch.x >= 5 and touch.x < 45) and touch.state == BEGAN then
        if (touch.y >= HEIGHT*.95-155) and (touch.y <= ((HEIGHT*.95)-155+35)) then
            linesBySystem = true
            linesByNone = false
            linesByRegion = false
            sound(SOUND_PICKUP, 16218)
            return
        end
    end
    
    if (touch.x >= 5 and touch.x < 45) and touch.state == BEGAN then
        if (touch.y >= HEIGHT*.95-190) and (touch.y <= ((HEIGHT*.95)-190+35)) then
            linesBySystem = false
            linesByNone = false
            linesByRegion = false
            sound(SOUND_PICKUP, 16218)
            return
        end
    end
        
    if (touch.x >= 5 and touch.x < 45) and touch.state == BEGAN then
        if (touch.y >= HEIGHT*.95-225) and (touch.y <= ((HEIGHT*.95-225)+35)) then
            linesBySystem = false
            linesByNone = true
            linesByRegion = false
            sound(SOUND_PICKUP, 16218)
            return
        end
    end
end

function handleSearchBarGoButton(touch)
    if touch.x >= 485 and touch.x <= 510 and touch.state == BEGAN then
        if (touch.y >= HEIGHT*.95) and touch.y <= HEIGHT*.95+35 then
            performSystemSearch()
            hideKeyboard()
            return
        end
    end
end
       
function handleOpenSettingsButton(touch)
    if touch.x >= WIDTH - 38 and touch.x <= WIDTH - 3 and touch.state == BEGAN then
        if (touch.y >= HEIGHT-100) and touch.y <= HEIGHT-100+35 then
            sound(SOUND_PICKUP, 16218)
            openSettings()
            return
        end
    end
end

function handleInfoBarToggle(touch)
    if touch.x >= WIDTH - 39 and touch.x <= WIDTH - 6 and touch.state == BEGAN then
        if (touch.y >= HEIGHT-158) and touch.y <= HEIGHT-123 then
            infoBar = not infoBar
            sound(SOUND_PICKUP, 16218)
            return
        end
    end

end

function zoomIn(touch)

    local oldXRef = (scaleValX*10^xscale)
    local oldYRef = (scaleValY*10^yscale)
    initialTouch = vec2(touch.x,touch.y)
    drawLines = false
    xscale = xscale-.1
    yscale = yscale-.1
    if xscale < 13 or yscale < 13 then
        xscale = xscale+.1
        yscale = yscale+.1
        sound(SOUND_SHOOT, 24317)
            
    else
        sound(SOUND_PICKUP, 16218)
        
        local newXRef = (scaleValX*10^xscale)
        local newYRef = (scaleValY*10^yscale)
        local perchangeX = (oldXRef/newXRef)
        local perchangeY = (oldYRef/newYRef)
        local deltaX = x*perchangeX
        local deltaY = y*perchangeY
        x=deltaX
        y=deltaY
    end
end
        
function zoomOut(touch)
    local oldXRef = (scaleValX*10^xscale)
    local oldYRef = (scaleValY*10^yscale)
    initialTouch = vec2(touch.x,touch.y)
    drawLines = false
    xscale = xscale+.1
    yscale = yscale+.1
    if xscale > 14.8 or yscale > 14.8 then
        xscale = xscale -.1
        yscale = yscale -.1
        sound(SOUND_SHOOT, 24317)
            
    else
        sound(SOUND_PICKUP, 16218)
                
        local newXRef = (scaleValX*10^xscale)
        local newYRef = (scaleValY*10^yscale)
        local perchangeX = (oldXRef/newXRef)
        local perchangeY = (oldYRef/newYRef)
        local deltaX = x*perchangeX
        local deltaY = y*perchangeY
        x=deltaX
        y=deltaY
            
    end
end

function handleSearchBoxTouch(touch)
    for n,p in ipairs(systemSearchHelper) do
        p:touched(touch)
    end
end

function handleSysBarTouch(touch)
rect(WIDTH-250+8,HEIGHT-565+7,66,67)
    if sysBar == true then
        if touch.x >= WIDTH-85+8 and touch.x <= WIDTH-11 and touch.state == BEGAN then
            if touch.y >= HEIGHT-565+7 and touch.y <= HEIGHT-491 then
                local sysName = string.gsub(sysBarName,"%s+","_")
                
                local url = "http://evemaps.dotlan.net/system/"..sysName.."/kills"
                
                openURL(url)
            end

        elseif touch.x >= WIDTH-250+8 and touch.x <= WIDTH-176 and touch.state == BEGAN then
            if touch.y >= HEIGHT-565+7 and touch.y <= HEIGHT-491 then
                local sysName = string.gsub(sysBarName,"%s+","_")
                
                local url = "http://evemaps.dotlan.net/system/"..sysName
                
                openURL(url)
            end
        end
    end
end

function handleStarsLinesToggle(touch)
    if touch.x >=10 and touch.x <=42 and touch.state == BEGAN then
        if touch.y >= HEIGHT*.95 and touch.y <= HEIGHT*.95+32 then
            mapStarLinesToggle = not mapStarLinesToggle
            sound(SOUND_PICKUP, 16218)
        end
    end
end

function handleForceRedownload(touch)
    rect(WIDTH-190+34,HEIGHT*.95+2,32,32)
    if touch.x >= WIDTH-190+34 and touch.x <= WIDTH-190+66 and touch.state == BEGAN then
        if touch.y >= HEIGHT*.95+2 and touch.y <= HEIGHT*.95+34 then
            currentClock = 99999999999999
        end
    end
end