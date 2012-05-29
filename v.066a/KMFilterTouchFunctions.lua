function KMFilterHandleTouches(touch)
    KMFilterHandleExit(touch)
    KMFilterHandleRegionToggle(touch)
    KMFilterHandleRegionButtons(touch)
end

function KMFilterHandleExit(touch)
    if touch.x >= WIDTH-64 and touch.x <= WIDTH and touch.state == BEGAN then
        if touch.y >= 5 and touch.y <= 69 then
            screen = "SETTINGS"
            saveSettings()
            sound(SOUND_PICKUP, 26808)
        end
    end
end

function KMFilterHandleRegionToggle(touch)

    if touch.x >= 120 and touch.x <= 168 and touch.state == BEGAN then
        if touch.y >= HEIGHT-95 and touch.y <= HEIGHT-95+28 then
            kmFiltersRegionToggle = not kmFiltersRegionToggle
            sound(SOUND_PICKUP, 26808)
        end
    end
end

function KMFilterHandleRegionButton(region,buttonPos,touch)
    if touch.x >= buttonPos.x and touch.x <= buttonPos.x+180 and touch.state == BEGAN then
        if touch.y >= buttonPos.y and touch.y <= buttonPos.y+24 then
            local found = false
            for i,j in ipairs(kmFiltersList) do
                if j == region then
                    table.remove(kmFiltersList,i)
                    found = true
                end
            end
            if found == false then
                table.insert(kmFiltersList,region)
            end
            sound(SOUND_PICKUP, 26808)
        end
    end
end

function KMFilterHandleRegionButtons(touch)
    
    local region = "Aridia"
    local buttonPos = vec2(25,HEIGHT-125)
    KMFilterHandleRegionButton(region,buttonPos,touch)

    local region = "Black Rise"
    local buttonPos = vec2(207,HEIGHT-125)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "The Bleak Lands"
    local buttonPos = vec2(389,HEIGHT-125)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Branch"
    local buttonPos = vec2(571,HEIGHT-125)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    -----
    
    local region = "Cache"
    local buttonPos = vec2(25,HEIGHT-151)
    KMFilterHandleRegionButton(region,buttonPos,touch)

    local region = "Catch"
    local buttonPos = vec2(207,HEIGHT-151)
    KMFilterHandleRegionButton(region,buttonPos,touch)

    local region = "The Citadel"
    local buttonPos = vec2(389,HEIGHT-151)
    KMFilterHandleRegionButton(region,buttonPos,touch)

    local region = "Cloud Ring"
    local buttonPos = vec2(571,HEIGHT-151)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    ----
    
    local region = "Cobalt Edge"
    local buttonPos = vec2(25,HEIGHT-177)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Curse"
    local buttonPos = vec2(207,HEIGHT-177)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Deklein"
    local buttonPos = vec2(389,HEIGHT-177)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Delve"
    local buttonPos = vec2(571,HEIGHT-177)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    ----
    
    local region = "Derelik"
    local buttonPos = vec2(25,HEIGHT-203)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Detorid"
    local buttonPos = vec2(207,HEIGHT-203)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Devoid"
    local buttonPos = vec2(389,HEIGHT-203)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Domain"
    local buttonPos = vec2(571,HEIGHT-203)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    --
    
    local region = "Esoteria"
    local buttonPos = vec2(25,HEIGHT-229)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Essence"
    local buttonPos = vec2(207,HEIGHT-229)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Etherium Reach"
    local buttonPos = vec2(389,HEIGHT-229)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Everyshore"
    local buttonPos = vec2(571,HEIGHT-229)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    ----
    
    local region = "Fade"
    local buttonPos = vec2(25,HEIGHT-255)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Feythabolis"
    local buttonPos = vec2(207,HEIGHT-255)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "The Forge"
    local buttonPos = vec2(389,HEIGHT-255)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Fountain"
    local buttonPos = vec2(571,HEIGHT-255)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    ----
    
    local region = "Geminate"
    local buttonPos = vec2(25,HEIGHT-281)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Genesis"
    local buttonPos = vec2(207,HEIGHT-281)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Great Wildlands"
    local buttonPos = vec2(389,HEIGHT-281)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Heimatar"
    local buttonPos = vec2(571,HEIGHT-281)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    ----
    
    local region = "Immensea"
    local buttonPos = vec2(25,HEIGHT-307)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Impass"
    local buttonPos = vec2(207,HEIGHT-307)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Insmother"
    local buttonPos = vec2(389,HEIGHT-307)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Kador"
    local buttonPos = vec2(571,HEIGHT-307)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    --
    
    local region = "The Kalevala Expanse"
    local buttonPos = vec2(25,HEIGHT-333)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Khanid"
    local buttonPos = vec2(207,HEIGHT-333)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Kor-Azor"
    local buttonPos = vec2(389,HEIGHT-333)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Lonetrek"
    local buttonPos = vec2(571,HEIGHT-333)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    ----
    
    local region = "Malpais"
    local buttonPos = vec2(25,HEIGHT-359)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Metropolis"
    local buttonPos = vec2(207,HEIGHT-359)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Molden Heath"
    local buttonPos = vec2(389,HEIGHT-359)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Oasa"
    local buttonPos = vec2(571,HEIGHT-359)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    ----
    
    local region = "Omist"
    local buttonPos = vec2(25,HEIGHT-385)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Outer Passage"
    local buttonPos = vec2(207,HEIGHT-385)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Outer Ring"
    local buttonPos = vec2(389,HEIGHT-385)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Paragon Soul"
    local buttonPos = vec2(571,HEIGHT-385)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    ----
        
    local region = "Peroid Basis"
    local buttonPos = vec2(25,HEIGHT-411)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Perrigen Falls"
    local buttonPos = vec2(207,HEIGHT-411)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Placid"
    local buttonPos = vec2(389,HEIGHT-411)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Providence"
    local buttonPos = vec2(571,HEIGHT-411)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    ----
    
    local region = "Pure Blind"
    local buttonPos = vec2(25,HEIGHT-437)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Querious"
    local buttonPos = vec2(207,HEIGHT-437)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Scalding Pass"
    local buttonPos = vec2(389,HEIGHT-437)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Sinq Laison"
    local buttonPos = vec2(571,HEIGHT-437)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    ----
    
    local region = "Solitude"
    local buttonPos = vec2(25,HEIGHT-463)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "The Spire"
    local buttonPos = vec2(207,HEIGHT-463)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Stain"
    local buttonPos = vec2(389,HEIGHT-463)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Syndicate"
    local buttonPos = vec2(571,HEIGHT-463)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    ----
    
    local region = "Tash-Murkon"
    local buttonPos = vec2(25,HEIGHT-489)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Tenal"
    local buttonPos = vec2(207,HEIGHT-489)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Tenerifis"
    local buttonPos = vec2(389,HEIGHT-489)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Tribute"
    local buttonPos = vec2(571,HEIGHT-489)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    ----
    
    local region = "Vale of the Silent"
    local buttonPos = vec2(25,HEIGHT-515)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Venal"
    local buttonPos = vec2(207,HEIGHT-515)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Verge Vendor"
    local buttonPos = vec2(389,HEIGHT-515)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    
    local region = "Wicked Creek"
    local buttonPos = vec2(571,HEIGHT-515)
    KMFilterHandleRegionButton(region,buttonPos,touch)
    ----
end
