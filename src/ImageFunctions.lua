function getShipImage(shipID)
    local url = 'http://image.eveonline.com/Render/'..shipID..'_64.png'
    if readImage("EveLive - Ships - " ..shipID) == nil then
        http.get(url, didGetShipImage)
        cacheImage("EveLive - Ships - " ..shipID,shipImage)
    else
        shipImage = readImage("EveLive - Ships - " ..shipID)
    end
    shipImageID = shipID
end

function didGetShipImage(data,status,headers)
    shipImage = data
end

function getVictimCharImage(charID)
    local url = 'http://image.eveonline.com/Character/'..charID..'_64.jpg'
    if readImage("EveLive - Pilots - " ..charID) == nil then
        http.get(url, didGetCharImage)
        cacheImage("EveLive - Pilots - " ..charID,charImage)
    else
        charImage = readImage("EveLive - Pilots - " ..charID)
    end
    charImageID = charID
end

function didGetCharImage(data,status,headers)
    charImage = data
end

function getSysAllianceImg(sysAllianceURL)
    if sysAllianceURL ~= nil then
        local num = string.sub(sysAllianceURL,37,string.len(sysAllianceURL)-4)
        
        if readImage("Documents:EveLive - Alliance -"..num) == nil then
            http.get(sysAllianceURL,gotSysAllianceImage)
            cacheImage("EveLive - Alliance -"..num,sysAllianceImg)
        else 
            sysAllianceImg = readImage("Documents:EveLive - Alliance -"..num)
        end
    end
end

function cacheImage(imgName,img)
    local name = "Documents:"..imgName
    saveImage("Documents:"..imgName,img)
end
