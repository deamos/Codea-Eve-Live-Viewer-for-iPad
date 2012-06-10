function drawSettings()
    
    drawSettingsTitle()
    drawSettingsExitButton()
    drawSettingsGotoEventToggle()
    drawSettingsNotificationTypeSelection()
    drawSettingsNotificationTimeSelection()
    drawSettingsFilterButton()
    drawDotlanRadarSettings()
    drawSettingsReset()
    drawSettingsResetImgCache()
    drawSettingsCredits()

end

function drawSettingsTitle()
    pushStyle()
        font("Futura-CondensedExtraBold")
        fontSize(30)
        fill(255, 255, 255, 255)
        text("Eve Live Viewer Settings",WIDTH/2,HEIGHT-20)
    popStyle()
end

function drawSettingsExitButton()
    pushStyle()
    strokeWidth(2)
    stroke(255, 255, 255, 255)
    fill(62, 61, 61, 255)
    --rect(WIDTH-64,5,64,64)
    sprite("Eve Live View:94_64_3",WIDTH-64+32,37)
    popStyle()
end

function drawSettingsGotoEventToggle()
    pushStyle()
    font("AmericanTypewriter")
    fontSize(16)
    fill(255, 255, 255, 255)
    text("Go To...",141,HEIGHT-90)
    strokeWidth(2)
    if gotoEvent == false then
        fill(31, 29, 64, 255)
    elseif gotoEvent == true then
        fill(20, 72, 181, 255)
    end
    stroke(61, 61, 61, 255)
    rect(70,HEIGHT-140,64,32)
    
    fill(255, 255, 255, 255)
    text("Events",70+32,HEIGHT-140+16)
    
    if gotoRadar == false then
        fill(31, 29, 64, 255)
    elseif gotoRadar == true then
        fill(20, 72, 181, 255)
    end
    stroke(61, 61, 61, 255)
    rect(140,HEIGHT-140,64,32)
    
    fill(255, 255, 255, 255)
    text("Radar",140+32,HEIGHT-140+16)
    
    popStyle()
end

function drawSettingsNotificationTypeSelection()
    
    pushStyle()
    font("AmericanTypewriter")
    fontSize(16)
    fill(255, 255, 255, 255)
    text("Notification Types",141,HEIGHT-180)
    strokeWidth(2)
    if killNotifications == false then
        fill(31, 29, 64, 255)
    elseif killNotifications == true then
        fill(20, 72, 181, 255)
    end
    stroke(61, 61, 61, 255)
    rect(50,HEIGHT-230,84,32)
    
    if dotlanNotifications == false then
        fill(31, 29, 64, 255)
    elseif dotlanNotifications == true then
        fill(20, 72, 181, 255)
    end
    stroke(61, 61, 61, 255)
    rect(141,HEIGHT-230,84,32)
    
    fill(255, 255, 255, 255)
    text("Kill Mails",60+32,HEIGHT-230+16)
    text("Dotlan",151+32,HEIGHT-230+16)
    
end

function drawSettingsNotificationTimeSelection()
    pushStyle()
    font("AmericanTypewriter")
    fontSize(16)
    
    fill(255, 255, 255, 255)
    text("Notification Duration (secs)",141,HEIGHT-270)
    strokeWidth(2)
    if notificationTime ~= 10 then
        fill(31, 29, 64, 255)
    elseif notificationTime == 10 then
        fill(20, 72, 181, 255)
    end
    stroke(61, 61, 61, 255)
    rect(45,HEIGHT-320,64,32)
    fill(255, 255, 255, 255)
    text("10",45+32,HEIGHT-320+16)
    
    if notificationTime ~= 15 then
        fill(31, 29, 64, 255)
    elseif notificationTime == 15 then
        fill(20, 72, 181, 255)
    end
    stroke(61, 61, 61, 255)
    rect(109,HEIGHT-320,64,32)
    fill(255, 255, 255, 255)
    text("15",109+32,HEIGHT-320+16)
    
    if notificationTime ~= 30 then
        fill(31, 29, 64, 255)
    elseif notificationTime == 30 then
        fill(20, 72, 181, 255)
    end
    stroke(61, 61, 61, 255)
    rect(173,HEIGHT-320,64,32)
    fill(255, 255, 255, 255)
    text("30",173+32,HEIGHT-320+16)
    
    popStyle()
end

function drawSettingsFilterButton()
    pushStyle()
    font("AmericanTypewriter")
    fontSize(16)
    fill(255, 255, 255, 255)
    text("Filters",141,HEIGHT-350)
    text("Kills", 35,HEIGHT-385)
    if kmFiltersToggle == false then
        fill(31, 29, 64, 255)
    elseif kmFiltersToggle == true then
        fill(20, 72, 181, 255)
    end
    rect(65,HEIGHT-400,64,32)
    
    fill(255, 255, 255, 255)
    local setting = nil
    if kmFiltersToggle == false then
        setting = "Off"
    elseif kmFiltersToggle == true then
        setting = "On"
    end
    text(setting,96,HEIGHT-400+16)
    
    fill(20, 72, 181, 255)
    rect(128,HEIGHT-400,84,32)
    fill(255, 255, 255, 255)
    text("Filters",128+42,HEIGHT-384)
    
    popStyle()
end

function drawSettingsReset()
    
    pushStyle()
    font("AmericanTypewriter")
    fontSize(16)
    fill(255, 255, 255, 255)
    text("Reset Settings",WIDTH-120,HEIGHT-90)
    strokeWidth(2)
    fill(20, 72, 181, 255)
    stroke(61, 61, 61, 255)
    rect(WIDTH-160,HEIGHT-140,84,32)
    
    fill(255, 255, 255, 255)
    text("Reset",WIDTH-118,HEIGHT-140+16)
    
end

function drawSettingsResetImgCache()
    
    pushStyle()
    font("AmericanTypewriter")
    fontSize(16)
    fill(255, 255, 255, 255)
    text("Reset Image Cache",WIDTH-120,HEIGHT-160)
    strokeWidth(2)
    fill(20, 72, 181, 255)
    stroke(61, 61, 61, 255)
    rect(WIDTH-160,HEIGHT-210,84,32)
    
    fill(255, 255, 255, 255)
    text("Reset",WIDTH-118,HEIGHT-210+16)
    
end

function drawDotlanRadarSettings()
    
    pushStyle()
    font("AmericanTypewriter")
    fontSize(16)
    fill(255, 255, 255, 255)
    text("Dotlan Radar",WIDTH/2,HEIGHT-90)
    strokeWidth(2)
    if dotlanRadarTracking == false then
        fill(31, 29, 64, 255)
    elseif dotlanRadarTracking == true then
        fill(20, 72, 181, 255)
    end
    stroke(61, 61, 61, 255)
    rect(WIDTH/2-42,HEIGHT-140,84,32)
    
    fill(255, 255, 255, 255)
    local setting = nil
    if dotlanRadarTracking == false then
        setting = "Off"
    elseif dotlanRadarTracking == true then
        setting = "On"
    end
    text(setting,WIDTH/2,HEIGHT-140+16)
    
    text("Radar Token",WIDTH/2,HEIGHT-165)
    if keyboardBuffer() ~= nil then
        dotLanRadarHandle.token = keyboardBuffer()
    end
    text(dotLanRadarHandle.token,WIDTH/2,HEIGHT-210+16)
    
    if dotLanRadarHandle.active == true then
        fill(31, 255, 0, 255)
        text("Active",WIDTH/2,HEIGHT-222) 
    else
        fill(255, 0, 0, 255)
        text("Inactive",WIDTH/2,HEIGHT-222) 
    end
    
    stroke(255, 255, 255, 255)
    strokeWidth(2)
    fill(0, 0, 0, 0)
    rect(WIDTH/2-128,HEIGHT-210,256,32)
    popStyle()
    
end
    

function drawSettingsCredits()
    pushStyle()
    lineCapMode(SQUARE)
    stroke(255, 255, 255, 255)
    strokeWidth(5)
    line(0,HEIGHT/2,WIDTH,HEIGHT/2)
    font("Futura-CondensedExtraBold")
    fontSize(28)
    fill(255, 255, 255, 255)
    text("About",WIDTH/2,HEIGHT/2-32)
    
    fontSize(18)
    text("Notifications Stats",100,HEIGHT/2-180)
    text("Application Data", 100,HEIGHT/2-60)
    text("Services", WIDTH-100,HEIGHT/2-60)
    strokeWidth(4)
    line(8,HEIGHT/2-75,190,HEIGHT/2-75)
    line(8,HEIGHT/2-192,190,HEIGHT/2-192)
    line(WIDTH-180,HEIGHT/2-75,WIDTH-8,HEIGHT/2-75)
    fontSize(16)
    font("Futura-Medium")
    textMode(CORNER)
    textAlign(LEFT)
    text("Version: " .. version,12,HEIGHT/2-100)
    text("Data: " .. database,12,HEIGHT/2-118)
    
    text("Kills: www.eve-kill.net",WIDTH-197,HEIGHT/2-101)
    text("       evemaps.dotlan.net",WIDTH-190,HEIGHT/2-120)
    text("Radar: evemaps.dotlan.net",WIDTH-197,HEIGHT/2-139)
    text("Extra: evemaps.dotlan.net",WIDTH-197,HEIGHT/2-158)
    
    text("All Notifications: " .. totalNotifications,12,HEIGHT/2-220)
    text("Kill Mails: " .. totalKillNotifications,12,HEIGHT/2-240)
    text("Dotlan Feed: " .. totalDotlanNotifications,12,HEIGHT/2-260)
    textMode(CENTER)
    textAlign(CENTER)
    textWrapWidth(275)
    text("This app was designed by Dave Lockwood. Any included images,data, or Intellectual Property pertaining to Eve Online are the property of CCP Games. \n\nSupport Email: eveliveviewer@divby0.net\n\nSupport Website:\nhttp://divby0.net/?cat=40",WIDTH/2,HEIGHT/2-200)
    
    popStyle()
end