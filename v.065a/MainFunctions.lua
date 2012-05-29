
function getXYSystem(sysID)
    local xval = (solarSystems[sysID][3]/(scaleValX*10^xscale))
    local yval = (solarSystems[sysID][5]/(scaleValY*10^yscale))
    local deltax = -xval
    local deltay = -yval
    local deltaPos=vec2(deltax,deltay)
    return deltaPos
end

function gotoSystem(sysID)
    local coord =getXYSystem(sysID)
    x=coord.x
    y=coord.y
end

function performSystemSearch()
    local systemName = kbBuffer
    for i,v in pairs(solarSystems) do
        if string.lower(solarSystems[i][2]) == string.lower(systemName) then
            gotoSystem(i)
            return
        end
    end
end

function typeIdToTypeName(id)
    return invTypes[id]
end

function typeNameToId(name)
    if name == nil then
        return "00000"
    end
    for i,v in pairs(invTypes) do
        if string.lower(invTypes[i]) == string.lower(name) then
            return i
        end
    end
    return nil
end

function sysNameToId(sysName)
    for i,v in pairs(solarSystems) do
        if string.lower(solarSystems[i][2]) == string.lower(sysName) then
            return i
        end
    end
    return nil
end
    
function handleSearchResults()
    systemSearchHelper = {}
    kbBuffer = keyboardBuffer()
    
    if kbBuffer == nil then
        kbBuffer = ""
    end
    if kbBuffer ~= "" and string.len(kbBuffer) > 2 then
        for a,b in pairs(solarSystems) do
            sysSearchName = solarSystems[a][2]
            searchLen = string.len(kbBuffer)
            systID = a
            if string.lower(string.sub(sysSearchName,1,searchLen)) == string.lower(kbBuffer) then
                newSearchBox = SearchBox(sysSearchName,systID)
                table.insert(systemSearchHelper,newSearchBox)
            end
        end
    end
end

function stripQuotes(variable)
    local stripedVar = string.sub(variable,2,(string.len(variable)-1))
    return stripedVar
end

function loadSavedData()
    totalNotifications = readLocalData("totalNotifications",totalNotifications)
    totalKillNotifications = readLocalData("totalKillNotifications",totalKillNotifications)
    gotoEvent = readLocalData("gotoEvent",gotoEvent)
    killNotifications = readLocalData("killNotifications", killNotifications)
    showEmpire = readLocalData("showEmpire", showEmpire)
    showNull = readLocalData("showNull", showNull)
    linesByRegion = readLocalData("linesByRegion", linesByRegion)
    linesBySystem = readLocalData("linesBySystem", linesBySystem)
    linesByNone = readLocalData("linesByNone", linesByNone)
    xscale = readLocalData("xscale", xscale)
    yscale = readLocalData("yscale", yscale)
    x = readLocalData("x",x)
    y = readLocalData("y",y)
    notificationTime = readLocalData("notificationTime",notificationTime)
    kmFiltersToggle = readLocalData("kmFiltersToggle",kmFiltersToggle)
    splitAndRestoreKMFilters()
    kmFiltersRegionToggle = readLocalData("kmFiltersRegionToggle",kmFiltersRegionToggle)
    infoBar = readLocalData("infoBar",infoBar)
end

function saveSettings()
    
    saveLocalData("totalNotifications",totalNotifications)
    saveLocalData("totalKillNotifications",totalKillNotifications)
    saveLocalData("gotoEvent",gotoEvent)
    saveLocalData("killNotifications", killNotifications)
    saveLocalData("showEmpire", showEmpire)
    saveLocalData("showNull", showNull)
    saveLocalData("linesByRegion", linesByRegion)
    saveLocalData("linesBySystem", linesBySystem)
    saveLocalData("linesByNone", linesByNone)
    saveLocalData("xscale", xscale)
    saveLocalData("yscale", yscale)
    saveLocalData("x",x)
    saveLocalData("y",y)
    saveLocalData("notificationTime",notificationTime)
    saveLocalData("kmFiltersToggle",kmFiltersToggle)
    splitAndSaveKMFilters()
    saveLocalData("kmFiltersRegionToggle",kmFiltersRegionToggle)
    saveLocalData("infoBar",infoBar)
end

function openSettings()
    screen = "SETTINGS"
end

function splitAndSaveKMFilters()
    local kmFiltersListString = ""
    if kmFiltersList ~= nil then
        for i,v in ipairs(kmFiltersList) do
            kmFiltersListString = kmFiltersListString..v..","
        end
    end
    saveLocalData("kmFiltersList",kmFiltersListString)
end

function splitAndRestoreKMFilters()
    local kmFiltersListString=readLocalData("kmFiltersList",kmFiltersList)
    if type(kmFiltersListString) ~= "table" then
        for regionName in string.gmatch(kmFiltersListString,"[%a+%s%-]+") do
            table.insert(kmFiltersList,regionName)
        end
    end
end
        
    