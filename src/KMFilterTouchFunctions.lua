function KMFilterHandleTouches(touch)
    KMFilterHandleExit(touch)
    KMFilterHandleRegionToggle(touch)
    KMFilterHandleRegionButtons(touch)
    KMFilterHandleISKButtons(touch)
    KMFilterHandleShipClassToggle(touch)
    KMFilterHandleShipClass(touch)
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

function KMFilterHandleISKButtons(touch)
 
    if touch.x >= 140 and touch.x <= 140+24 and touch.state == BEGAN then
        if touch.y >= HEIGHT-560 and touch.y <= HEIGHT-546 then
            KMFilterIsk = 0
            sound(SOUND_PICKUP, 26808)
            return
        end
    end
    
    if touch.x >= 25 and touch.x <= 25+180 and touch.state == BEGAN then
        if touch.y >= HEIGHT-590 and touch.y <= HEIGHT-590+24 then
            KMFilterIsk = 1000000000
            sound(SOUND_PICKUP, 26808)
            return
        end
    end
    
    if touch.x >= 207 and touch.x <= 207+180 and touch.state == BEGAN then
        if touch.y >= HEIGHT-590 and touch.y <= HEIGHT-590+24 then
            KMFilterIsk = 2000000000
            sound(SOUND_PICKUP, 26808)
            return
        end
    end
    
    if touch.x >= 389 and touch.x <= 389+180 and touch.state == BEGAN then
        if touch.y >= HEIGHT-590 and touch.y <= HEIGHT-590+24 then
            KMFilterIsk = 5000000000
            sound(SOUND_PICKUP, 26808)
            return
        end
    end
    
    if touch.x >= 571 and touch.x <= 571+180 and touch.state == BEGAN then
        if touch.y >= HEIGHT-590 and touch.y <= HEIGHT-590+24 then
            KMFilterIsk = 10000000000
            sound(SOUND_PICKUP, 26808)
            return
        end
    end
end

function KMFilterHandleShipClassToggle(touch)

    if touch.x >= 160 and touch.x <= 160+48 and touch.state == BEGAN then
        if touch.y >= HEIGHT-635 and touch.y <= HEIGHT-635+28 then
            kmFiltersShipClassToggle = not kmFiltersShipClassToggle
            sound(SOUND_PICKUP, 26808)
        end
    end
end

function KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    if touch.x >= buttonPos.x and touch.x <= buttonPos.x+180 and touch.state == BEGAN then
        if touch.y >= buttonPos.y and touch.y <= buttonPos.y+24 then
            local found = false
            for i,j in ipairs(kmFiltersList) do
                if string.lower(j) == string.lower(shipClass) then
                    table.remove(kmFiltersList,i)
                    found = true
                end
            end
            if found == false then
                table.insert(kmFiltersList,shipClass)
            end
            sound(SOUND_PICKUP, 26808)
        end
    end
end

function KMFilterHandleShipClass(touch)
    local shipClass = "Noobship"
    local buttonPos = vec2(25,HEIGHT-670)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)

    local shipClass = "Capsule"
    local buttonPos = vec2(207,HEIGHT-670)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Shuttle"
    local buttonPos = vec2(389,HEIGHT-670)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Frigate"
    local buttonPos = vec2(571,HEIGHT-670)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    --
    local shipClass = "Destroyer"
    local buttonPos = vec2(25,HEIGHT-696)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)

    local shipClass = "Cruiser"
    local buttonPos = vec2(207,HEIGHT-696)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Battlecruiser"
    local buttonPos = vec2(389,HEIGHT-696)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Battleship"
    local buttonPos = vec2(571,HEIGHT-696)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    --
    local shipClass = "Industrial"
    local buttonPos = vec2(25,HEIGHT-722)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)

    local shipClass = "Transport"
    local buttonPos = vec2(207,HEIGHT-722)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Freighter"
    local buttonPos = vec2(389,HEIGHT-722)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Jump Freighter"
    local buttonPos = vec2(571,HEIGHT-722)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    --
    local shipClass = "Mining barge"
    local buttonPos = vec2(25,HEIGHT-748)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)

    local shipClass = "Exhumer"
    local buttonPos = vec2(207,HEIGHT-748)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Industrial Command Ship"
    local buttonPos = vec2(389,HEIGHT-748)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Capital Industrial Ship"
    local buttonPos = vec2(571,HEIGHT-748)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    --
    local shipClass = "Assault frigate"
    local buttonPos = vec2(25,HEIGHT-774)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)

    local shipClass = "Interceptor"
    local buttonPos = vec2(207,HEIGHT-774)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Electronic Attack Ship"
    local buttonPos = vec2(389,HEIGHT-774)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Covert ops"
    local buttonPos = vec2(571,HEIGHT-774)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    --
    local shipClass = "Interdictor"
    local buttonPos = vec2(25,HEIGHT-800)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)

    local shipClass = "Heavy Interdictor"
    local buttonPos = vec2(207,HEIGHT-800)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Command ship"
    local buttonPos = vec2(389,HEIGHT-800)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Heavy assault"
    local buttonPos = vec2(571,HEIGHT-800)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    --
    local shipClass = "Logistics"
    local buttonPos = vec2(25,HEIGHT-826)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)

    local shipClass = "Recon ship"
    local buttonPos = vec2(207,HEIGHT-826)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Strategic Cruiser"
    local buttonPos = vec2(389,HEIGHT-826)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Black Ops"
    local buttonPos = vec2(571,HEIGHT-826)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    --
    local shipClass = "Marauder"
    local buttonPos = vec2(25,HEIGHT-852)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)

    local shipClass = "Carrier"
    local buttonPos = vec2(207,HEIGHT-852)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Supercarrier"
    local buttonPos = vec2(389,HEIGHT-852)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local shipClass = "Dreadnought"
    local buttonPos = vec2(571,HEIGHT-852)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    --
    local shipClass = "Titan"
    local buttonPos = vec2(25,HEIGHT-878)
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local buttonPos = vec2(207,HEIGHT-878)
    local shipClass = "POS Modules"
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    local shipClass = "POS Large"
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    local shipClass = "POS Medium"
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    local shipClass = "POS Small"
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    
    local buttonPos = vec2(389,HEIGHT-878)
    local shipClass = "Infrastructure Modules"
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    local shipClass = "Territory Modules"
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
    local shipClass = "Customs Offices"
    KMFilterHandleShipClassButton(shipClass,buttonPos,touch)
end
            
