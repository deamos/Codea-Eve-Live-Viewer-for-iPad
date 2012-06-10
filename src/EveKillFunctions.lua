function getEveKillData()
    date=getNow()
    
    currentTimeFormat=date.year.."-"..date.month.."-"..date.day.."_"..(date.hour).."."..(date.min-5).."."..date.sec
    eveKill=nil
    http.get("http://eve-kill.net/epic/startDate:"..currentTimeFormat.."/mask:458743",didGetEveKillData,didNotGetEveKillData)
    
end

function didNotGetEveKillData(failStuffs)
    print("Communication Error with Eve Kill: " ..failStuffs)
    notifyHandle:push("CommError",failStuffs)
    
end

function didGetEveKillData(data,status,headers)
    eveKillData=parseEveKillData(data)
    for i,j in pairs(eveKillData) do
        
        local victimName = eveKillData[i]["victimName"]
        victimName = stripQuotes(victimName)
        
        local victimID = eveKillData[i]["victimExternalID"]
        
        local victimShipClass = eveKillData[i]["victimShipClass"]
        victimShipClass = stripQuotes(victimShipClass)
        
        local victimCorpName = eveKillData[i]["victimCorpName"]
        victimCorpName = stripQuotes(victimCorpName)
        
        local victimAllianceName = eveKillData[i]["victimAllianceName"]
        victimAllianceName = stripQuotes(victimAllianceName)
        
        local FBName = eveKillData[i]["FBPilotName"]
        FBName = stripQuotes(FBName)
        
        local FBCorpName = eveKillData[i]["FBCorpName"]
        FBCorpName = stripQuotes(FBCorpName)
        
        local FBAllianceName = eveKillData[i]["FBAllianceName"]
        FBAllianceName = stripQuotes(FBAllianceName)
                
        local involvedPartyCount = eveKillData[i]["involvedPartyCount"]
        
        local timestamp = eveKillData[i]["timestamp"]
        timestamp = stripQuotes(timestamp)
        
        local killID = eveKillData[i]["internalID"]
        
        local isk = eveKillData[i]["ISK"]

        --If the data is malformed, will ignore this kill
        if eveKillData[i]["victimShipID"] == nil then
            break
        end
        
        local victimShipType = typeIdToTypeName(eveKillData[i]["victimShipID"])
        
        local victimShipID = eveKillData[i]["victimShipID"]
        
        local solarSystemName = eveKillData[i]["solarSystemName"]
        solarSystemName = stripQuotes(solarSystemName)
        
        newNotification = {victimName,solarSystemName,victimShipType, victimShipID, victimID,victimCorpName,victimAllianceName,FBName, FBCorpName,FBAllianceName,involvedPartyCount,timestamp,killID,isk,victimShipClass}
        notifyHandle:push("Kill",newNotification)
    end
end

function parseEveKillData(data)   
    mainKill = {}
    parsedData = {}
    
    if data == nil then
        return nil
    end
    
    eveKill = data
    eveKill=string.sub(eveKill,2,string.len(eveKill))
    
    eveKill=split(eveKill,"},")
    for i = 0,table.maxn(eveKill) do
        if eveKill[i] ~= nil then
            data=string.sub(eveKill[i],2,string.len(eveKill[i]))
            data = data .. ","
            mainKill[i]=split(data,",")
            
        end
    end
    
    for k,l in ipairs(mainKill) do
        local subData={}
        for m,n in ipairs(mainKill[k]) do
            local header = string.match(n,'"[%a]+":')
            
            local value = string.sub(n,string.len(header)+1,string.len(n))
            
            header = string.sub(header,2,string.len(header)-2)
        
            subData[header] = value
            
        end
        parsedData[k]=subData
    end
    
    return parsedData
end