function drawKMFiltersScreen()
    drawKMFiltersTitle()
    drawKMFiltersExitButton()
    drawKMFiltersRegionButtons()
    drawKMFilterRegionToggle()
    drawKMFilterIskButtons()
    
end

function drawKMFiltersTitle()
    pushStyle()
    font("Futura-CondensedExtraBold")
    fill(255, 255, 255, 255)
    fontSize(26)
    text("Kill Mail Notification Filters", WIDTH/2, HEIGHT-30)
    popStyle()
end

function drawKMFiltersExitButton()
    pushStyle()
    fill(74, 74, 74, 255)
    --rect(WIDTH-64,5,64,64)
    sprite("Eve Live View:94_64_3",WIDTH-64+32,37)
    popStyle()
end

function drawKMFilterRegionToggle()
    pushStyle()
    if kmFiltersRegionToggle == true then
        fill(20, 72, 181, 255)
    elseif kmFiltersRegionToggle == false then
        fill(31, 29, 64, 255)
    end
    rect(120,HEIGHT-95,48,28)
    
    font("AmericanTypewriter")
    fontSize(16)
    fill(255, 255, 255, 255)
    local txt = nil
    if kmFiltersRegionToggle == true then
        txt = "On"
    elseif kmFiltersRegionToggle == false then
        txt = "Off"
    end
    text(txt,120+24,HEIGHT-95+14)
    
    popStyle()
end

function drawKMFilterRegion(regionName, POS)
    pushStyle()
    local region = regionName
    local buttonPos = POS
    
    local found = false
    for i,j in ipairs(kmFiltersList) do
        if j == region then
            fill(20, 72, 181, 255)
            found = true
        end
    end
    if found == false then
        fill(31, 29, 64, 255)
    end
    rect(buttonPos.x,buttonPos.y,180,24)
    
    font("AmericanTypewriter")
    fontSize(16)
    fill(255, 255, 255, 255)
    text(region,buttonPos.x+90,buttonPos.y+12)
    popStyle()
end

function drawKMFiltersRegionButtons()
    pushStyle()
    font("AmericanTypewriter")
    fontSize(22)
    fill(255, 255, 255, 255)
    textMode(CORNER)
    textAlign(LEFT)
    text("Regional",25,HEIGHT-95)
    popStyle()
    
    local region = "Aridia"
    local buttonPos = vec2(25,HEIGHT-125)
    drawKMFilterRegion(region, buttonPos)

    local region = "Black Rise"
    local buttonPos = vec2(207,HEIGHT-125)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "The Bleak Lands"
    local buttonPos = vec2(389,HEIGHT-125)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Branch"
    local buttonPos = vec2(571,HEIGHT-125)
    drawKMFilterRegion(region, buttonPos)
    
    -----
    
    local region = "Cache"
    local buttonPos = vec2(25,HEIGHT-151)
    drawKMFilterRegion(region, buttonPos)

    local region = "Catch"
    local buttonPos = vec2(207,HEIGHT-151)
    drawKMFilterRegion(region, buttonPos)

    local region = "The Citadel"
    local buttonPos = vec2(389,HEIGHT-151)
    drawKMFilterRegion(region, buttonPos)

    local region = "Cloud Ring"
    local buttonPos = vec2(571,HEIGHT-151)
    drawKMFilterRegion(region, buttonPos)
    
    ----
    
    local region = "Cobalt Edge"
    local buttonPos = vec2(25,HEIGHT-177)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Curse"
    local buttonPos = vec2(207,HEIGHT-177)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Deklein"
    local buttonPos = vec2(389,HEIGHT-177)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Delve"
    local buttonPos = vec2(571,HEIGHT-177)
    drawKMFilterRegion(region, buttonPos)
    
    ----
    
    local region = "Derelik"
    local buttonPos = vec2(25,HEIGHT-203)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Detorid"
    local buttonPos = vec2(207,HEIGHT-203)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Devoid"
    local buttonPos = vec2(389,HEIGHT-203)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Domain"
    local buttonPos = vec2(571,HEIGHT-203)
    drawKMFilterRegion(region, buttonPos)
    
    --
    
    local region = "Esoteria"
    local buttonPos = vec2(25,HEIGHT-229)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Essence"
    local buttonPos = vec2(207,HEIGHT-229)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Etherium Reach"
    local buttonPos = vec2(389,HEIGHT-229)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Everyshore"
    local buttonPos = vec2(571,HEIGHT-229)
    drawKMFilterRegion(region, buttonPos)
    
    ----
    
    local region = "Fade"
    local buttonPos = vec2(25,HEIGHT-255)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Feythabolis"
    local buttonPos = vec2(207,HEIGHT-255)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "The Forge"
    local buttonPos = vec2(389,HEIGHT-255)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Fountain"
    local buttonPos = vec2(571,HEIGHT-255)
    drawKMFilterRegion(region, buttonPos)
    
    ----
    
    local region = "Geminate"
    local buttonPos = vec2(25,HEIGHT-281)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Genesis"
    local buttonPos = vec2(207,HEIGHT-281)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Great Wildlands"
    local buttonPos = vec2(389,HEIGHT-281)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Heimatar"
    local buttonPos = vec2(571,HEIGHT-281)
    drawKMFilterRegion(region, buttonPos)
    
    ----
    
    local region = "Immensea"
    local buttonPos = vec2(25,HEIGHT-307)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Impass"
    local buttonPos = vec2(207,HEIGHT-307)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Insmother"
    local buttonPos = vec2(389,HEIGHT-307)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Kador"
    local buttonPos = vec2(571,HEIGHT-307)
    drawKMFilterRegion(region, buttonPos)
    
    --
    
    local region = "The Kalevala Expanse"
    local buttonPos = vec2(25,HEIGHT-333)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Khanid"
    local buttonPos = vec2(207,HEIGHT-333)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Kor-Azor"
    local buttonPos = vec2(389,HEIGHT-333)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Lonetrek"
    local buttonPos = vec2(571,HEIGHT-333)
    drawKMFilterRegion(region, buttonPos)
    
    ----
    
    local region = "Malpais"
    local buttonPos = vec2(25,HEIGHT-359)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Metropolis"
    local buttonPos = vec2(207,HEIGHT-359)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Molden Heath"
    local buttonPos = vec2(389,HEIGHT-359)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Oasa"
    local buttonPos = vec2(571,HEIGHT-359)
    drawKMFilterRegion(region, buttonPos)
    ----
    
    local region = "Omist"
    local buttonPos = vec2(25,HEIGHT-385)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Outer Passage"
    local buttonPos = vec2(207,HEIGHT-385)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Outer Ring"
    local buttonPos = vec2(389,HEIGHT-385)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Paragon Soul"
    local buttonPos = vec2(571,HEIGHT-385)
    drawKMFilterRegion(region, buttonPos)
    ----
        
    local region = "Peroid Basis"
    local buttonPos = vec2(25,HEIGHT-411)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Perrigen Falls"
    local buttonPos = vec2(207,HEIGHT-411)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Placid"
    local buttonPos = vec2(389,HEIGHT-411)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Providence"
    local buttonPos = vec2(571,HEIGHT-411)
    drawKMFilterRegion(region, buttonPos)
    ----
    
    local region = "Pure Blind"
    local buttonPos = vec2(25,HEIGHT-437)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Querious"
    local buttonPos = vec2(207,HEIGHT-437)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Scalding Pass"
    local buttonPos = vec2(389,HEIGHT-437)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Sinq Laison"
    local buttonPos = vec2(571,HEIGHT-437)
    drawKMFilterRegion(region, buttonPos)
    ----
    
    local region = "Solitude"
    local buttonPos = vec2(25,HEIGHT-463)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "The Spire"
    local buttonPos = vec2(207,HEIGHT-463)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Stain"
    local buttonPos = vec2(389,HEIGHT-463)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Syndicate"
    local buttonPos = vec2(571,HEIGHT-463)
    drawKMFilterRegion(region, buttonPos)
    ----
    
    local region = "Tash-Murkon"
    local buttonPos = vec2(25,HEIGHT-489)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Tenal"
    local buttonPos = vec2(207,HEIGHT-489)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Tenerifis"
    local buttonPos = vec2(389,HEIGHT-489)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Tribute"
    local buttonPos = vec2(571,HEIGHT-489)
    drawKMFilterRegion(region, buttonPos)
    ----
    
    local region = "Vale of the Silent"
    local buttonPos = vec2(25,HEIGHT-515)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Venal"
    local buttonPos = vec2(207,HEIGHT-515)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Verge Vendor"
    local buttonPos = vec2(389,HEIGHT-515)
    drawKMFilterRegion(region, buttonPos)
    
    local region = "Wicked Creek"
    local buttonPos = vec2(571,HEIGHT-515)
    drawKMFilterRegion(region, buttonPos)
    ----
end

function drawKMFilterIskButtons()
    pushStyle()
    fill(255, 255, 255, 255)
    font("AmericanTypewriter")
    fontSize(22)
    textMode(CORNER)
    textAlign(LEFT)
    text("ISK Worth",25, HEIGHT-560)
    popStyle()
    
    pushStyle()
    local txt = nil
    
    local pos = vec2(140,HEIGHT-560)
    if KMFilterIsk ~= 0 then
        fill(20, 72, 181, 255)
        txt = "On"
    else
        fill(31, 29, 64, 255)
        txt = "Off"
    end
    rect(pos.x,pos.y,48,28)
    font("AmericanTypewriter")
    fontSize(16)
    fill(255, 255, 255, 255)
    text(txt,pos.x+24,pos.y+14)
    popStyle()
    
    pushStyle()
    local txt = "1+ Billion ISK"
    local buttonPos = vec2(25,HEIGHT-590)
    
    if KMFilterIsk == 1000000000 then
        fill(20, 72, 181, 255)
    else
        fill(31, 29, 64, 255)
    end
    rect(buttonPos.x,buttonPos.y,180,24)
    
    font("AmericanTypewriter")
    fontSize(16)
    fill(255, 255, 255, 255)
    text(txt,buttonPos.x+90,buttonPos.y+12)
    popStyle()
    
    pushStyle()
    local txt = "2+ Billion ISK"
    local buttonPos = vec2(207,HEIGHT-590)
    
    if KMFilterIsk == 2000000000 then
        fill(20, 72, 181, 255)
    else
        fill(31, 29, 64, 255)
    end
    rect(buttonPos.x,buttonPos.y,180,24)
    
    font("AmericanTypewriter")
    fontSize(16)
    fill(255, 255, 255, 255)
    text(txt,buttonPos.x+90,buttonPos.y+12)
    popStyle()
    
    pushStyle()
    local txt = "5+ Billion ISK"
    local buttonPos = vec2(389,HEIGHT-590)
    
    if KMFilterIsk == 5000000000 then
        fill(20, 72, 181, 255)
    else
        fill(31, 29, 64, 255)
    end
    rect(buttonPos.x,buttonPos.y,180,24)
    
    font("AmericanTypewriter")
    fontSize(16)
    fill(255, 255, 255, 255)
    text(txt,buttonPos.x+90,buttonPos.y+12)
    popStyle()
    
    pushStyle()
    local txt = "10+ Billion ISK"
    local buttonPos = vec2(571,HEIGHT-590)
    
    if KMFilterIsk == 10000000000 then
        fill(20, 72, 181, 255)
    else
        fill(31, 29, 64, 255)
    end
    rect(buttonPos.x,buttonPos.y,180,24)
    
    font("AmericanTypewriter")
    fontSize(16)
    fill(255, 255, 255, 255)
    text(txt,buttonPos.x+90,buttonPos.y+12)
    popStyle()
end



