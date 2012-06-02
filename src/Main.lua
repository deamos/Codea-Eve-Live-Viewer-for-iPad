supportedOrientations(PORTRAIT_ANY)
-- Use this function to perform your initial setup
function setup()
    version = "0.69a"
    database = "Inferno"
    saveProjectInfo("Author", "David Lockwood")
    saveProjectInfo("Description", "Eve Online Real-Time Killmail Display\nVersion:"..version.."\nWritten by Dave Lockwood")
    
    setInstructionLimit(0)
    --displayMode(FULLSCREEN_NO_BUTTONS)
    displayMode(FULLSCREEN)
    
    setDefaultValues()
    loadSavedData()
    
    notifyHandle = NotificationHandler()

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
        drawLabel()
        if mapStarLinesToggle == true then
            drawStarLinesBar()
        end
        drawBoxes()
        drawSearchBox()
    
        notifyHandle:draw()
        
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
        end
        lastKey = RETURN
    else
        lastKey = nil
    end
end

function tick()
    
    handleSearchResults()
    saveSettings()
    
    --Refresh Data Timer
    if os.difftime(currentClock,appClock) >= 300 then
        appClock = os.clock()
        getNewData()
    end
    
    currentClock = os.clock()
    
end


