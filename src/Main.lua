supportedOrientations(PORTRAIT_ANY)
-- Use this function to perform your initial setup
function setup()
    version = "1.2"
    database = "Inferno"
    saveProjectInfo("Author", "David Lockwood")
    saveProjectInfo("Description", "Eve Online Real-Time Killmail Display\nVersion:"..version.."\nWritten by Dave Lockwood")
    
    setInstructionLimit(0)
    --displayMode(FULLSCREEN_NO_BUTTONS)
    displayMode(FULLSCREEN)
    
    setDefaultValues()
    loadSavedData()
    
    notifyHandle = NotificationHandler()
    dotLanRSSHandle = DotlanRSS()
    dotLanRadarHandle = DotlanRadar()
    dotLanRadarHandle.token = readLocalData("dotLanRadarToken","")

end

-- This function gets called once every frame
function draw()
    if screen == "MAP" then
        background(0, 0, 0, 255)
    
        pushStyle()
        stroke(248, 247, 247, 255)
        strokeWidth(2)
        -- This sets a dark background color 
    
        line(WIDTH/2-25,HEIGHT/2,WIDTH/2+25,HEIGHT/2)
        line(WIDTH/2,HEIGHT/2-25,WIDTH/2,HEIGHT/2+25)
        popStyle()
        
        stroke(255, 255, 255, 255)
        strokeWidth(2)
        
        tick()          
    
        if linesByNone == false then --or drawLines == true then
            drawlines()
        end
        
        drawStars()
       
        if mapStarLinesToggle == true then
            drawStarLinesBar()
        end
        if dotlanRadarTracking == true then
            dotLanRadarHandle:displayLocation()
        end
       
       
        drawSearchBox()
    
        notifyHandle:draw()
        drawLabel()
        drawBoxes()
        
        drawRefreshTimer()
        
    elseif screen == "SETTINGS" then
        
        background(0, 0, 0, 255)
        drawSettings()
        
    elseif screen == "KMFILTER" then
        background(0, 0, 0, 255)
        drawKMFiltersScreen()
        
    end
    
end

function touched(touch)
    if screen == "MAP" then
    
    handleMainTouch(touch)
    
    elseif screen == "SETTINGS" then
        handleSettingsTouch(touch)
        
    elseif screen == "KMFILTER" then
        KMFilterHandleTouches(touch)
        
    end
end

function keyboard(key)
    --Handles Keyboard Input Ending Correctly.
    --This must be any program that handles a Text Input Box
    
    if key == RETURN then
        hideKeyboard()
        if screen == "MAP" then
            performSystemSearch()
        elseif screen == "SETTINGS" then
            --placeholder
            
        end
        lastKey = RETURN
    else
        lastKey = nil
    end
end

function tick()
    
    handleSearchResults()
    saveSettings()
    
    --Refresh Data Timer (5 mins)
    if os.difftime(currentClock,appClock) >= 300 then
        appClock = os.clock()
        getNewData()
    end
    
    -- Handle Dotlan Radar (20 secs)
    if dotlanRadarTracking == true and (dotLanRadarHandle.token == "" or dotLanRadarHandle.token == nil) then
        dotlanRadarTracking = false
        dotLanRadarHandle.active = false
    end
    
    local dotlanDifference = os.difftime(currentClock,dotLanRadarHandle.lastChecked)
    
    if (dotLanRadarHandle.token ~= nil and dotlanRadarTracking == true) and (dotLanRadarHandle.lastChecked == nil or dotlanDifference >= 20) then
        dotLanRadarHandle:getLocation()
    end
    
    if dotlanRadarTracking == true then
        dotLanRadarHandle:parseDotlanRadarData()
    end
    
    dotLanRSSHandle:parseData()
    
    currentClock = os.clock()
    
end


