function handleSettingsTouch(touch,state)
    
    if touch.x >= WIDTH-64 and touch.x <= WIDTH and touch.state == BEGAN then
        if touch.y >= 5 and touch.y <= 69 then
            screen = "MAP"
        end
    
    elseif touch.x >= 70 and touch.x <= 70+64 and touch.state == BEGAN then
        if touch.y >= HEIGHT-140 and touch.y <= HEIGHT-140 + 32 then
            gotoEvent = not gotoEvent
            gotoRadar = false
            sound(SOUND_PICKUP, 26808)
        end
        
    elseif touch.x >= 140 and touch.x <= 140+64 and touch.state == BEGAN then
        if touch.y >= HEIGHT-140 and touch.y <= HEIGHT-140 + 32 then
            gotoEvent = false
            gotoRadar = not gotoRadar
            sound(SOUND_PICKUP, 26808)
        end
    end
    
    --Problem with touch.state again here    
    if touch.x >= 50 and touch.x <= 50+84 and touch.state == BEGAN then
        if touch.y >= HEIGHT-230 and touch.y <= HEIGHT-230 + 32 then
            killNotifications = not killNotifications
            sound(SOUND_PICKUP, 26808)
        end 
        
    elseif touch.x >= 141 and touch.x <= 141+84 and touch.state == BEGAN then
        if touch.y >= HEIGHT-230 and touch.y <= HEIGHT-230 + 32 then
            dotlanNotifications = not dotlanNotifications
            sound(SOUND_PICKUP, 26808)
        end 
        
    elseif touch.x >= WIDTH-160 and touch.x <= WIDTH-160+84 and touch.state == ENDED then
        if touch.y >= HEIGHT-140 and touch.y <= HEIGHT-140 + 32 then
            clearLocalData()
            setDefaultValues()
            screen = "SETTINGS"
            sound(SOUND_PICKUP, 26808)
        end
        rect(WIDTH-160,HEIGHT-210,84,32)
    elseif touch.x >= WIDTH-160 and touch.x <= WIDTH-160+84 and touch.state == BEGAN then
        if touch.y >= HEIGHT-210 and touch.y <= HEIGHT-210 + 32 then
            local imageList = spriteList("Documents")
            for i,v in pairs(imageList) do
                saveImage("Documents:"..v,nil)
            end
            sound(SOUND_PICKUP, 26808)
        end
    
    end
    
    if touch.x >= 45 and touch.x <= 45+64 and touch.state == BEGAN then
        if touch.y >= HEIGHT-320 and touch.y <= HEIGHT-320 + 32 then
            notificationTime = 10
            sound(SOUND_PICKUP, 26808)
        end 
    
    elseif touch.x >= 109 and touch.x <= 109+64 and touch.state == BEGAN then
        if touch.y >= HEIGHT-320 and touch.y <= HEIGHT-320 + 32 then
            notificationTime = 15
            sound(SOUND_PICKUP, 26808)
        end 
    
    elseif touch.x >= 173 and touch.x <= 173+64 and touch.state == BEGAN then
        if touch.y >= HEIGHT-320 and touch.y <= HEIGHT-320 + 32 then
            notificationTime = 30
            sound(SOUND_PICKUP, 26808)
        end
    end

    if touch.x >= 65 and touch.x <= 65+64 and touch.state == BEGAN then
        if touch.y >= HEIGHT-400 and touch.y <= HEIGHT-400+32 then
            kmFiltersToggle = not kmFiltersToggle
            sound(SOUND_PICKUP, 26808)
        end

    elseif touch.x >= 128 and touch.x <= 128+84 and touch.state == BEGAN then
        if touch.y >= HEIGHT-400 and touch.y <= HEIGHT-400+32 then
            screen = "KMFILTER"
            sound(SOUND_PICKUP, 26808)
        end
    end
    
    if touch.x >= WIDTH/2-42 and touch.x <= WIDTH/2-42+84 and touch.state == BEGAN then
        if touch.y >= HEIGHT-140 and touch.y <= HEIGHT-140+32 then
            dotlanRadarTracking = not dotlanRadarTracking
            sound(SOUND_PICKUP, 26808)
        end
        rect(WIDTH/2-128,HEIGHT-210,256,32)
    elseif touch.x >= WIDTH/2-128 and touch.x <= WIDTH/2-128+256 and touch.state == BEGAN then
        if touch.y >= HEIGHT-210 and touch.y <= HEIGHT-210+32 then
            showKeyboard()
            sound(SOUND_PICKUP, 26808)
        end
    end
    
end