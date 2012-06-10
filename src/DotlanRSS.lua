DotlanDataBucket = nil

DotlanRSS = class()

function DotlanRSS:init(x)
    -- you can accept and set parameters here
    self.url = "http://evemaps.dotlan.net/feed"
    self.data = {}
    self.waitingForData = false
end

function DotlanRSS:getFeed()
    http.get(self.url,gotDotlanData,didNotGetDotlanData)
    self.waitingForData = true
end

function gotDotlanData(data,status,headers)
    DotlanDataBucket = data
end

function didNotGetDotlanData(reason)
end

function DotlanRSS:parseData()
    if type(DotlanDataBucket) == type("table") then
        self.waitingForData = false
        
        local xmlTree=XmlParser:ParseXmlText(DotlanDataBucket)
        
        self.data = {}
        
        for i,j in pairs(xmlTree.ChildNodes) do
            for n,o in pairs(j.ChildNodes) do
                local subData = {}
                if o.Name == "item" then
                    for l,m in pairs(o.ChildNodes) do
                        if m.Name == "title" then
                            subData["title"] = m.Value
                            local sysName = string.match(m.Value,'[sS]ystem +[%a%d-]*')
                            if sysName ~= nil then
                                sysName = string.sub(sysName,8,string.len(sysName ))
                                subData["system"] = sysName
                            end
                        elseif m.Name == "link" then
                            subData["link"] = m.Value
                    
                        elseif m.Name == "category" then
                            local _,_,catName = string.find(m.Value,"%[(.+)%]%]")
                            catName = string.sub(catName,7,string.len(catName))
                            catName = string.gsub(catName,"Factionwarfare", "Faction Warfare")
                            
                            subData["category"] = catName
                            
                    
                        elseif m.Name == "pubDate" then
                            local pattern = "(%d+) (%a+) (%d+) (%d+):(%d+):(%d+)"
                            local _,_,day,month,year,hour,min,sec = string.find(m.Value,pattern)
                            
                            local months = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"}
                            for i,j in ipairs(months) do
                                if month == j then
                                    month = i
                                    break
                                end
                            end
                            
                            local timeTable = {}
                                timeTable["day"] = day
                                timeTable["month"] = month
                                timeTable["year"] = year
                                timeTable["hour"] = hour
                                timeTable["min"] = min
                                timeTable["sec"] = sec
                            
                            subData["pubDate"] = timeTable
                            
                        end
                    
                    end
                end
                if subData["title"] ~= nil then
                    table.insert(self.data,subData)
                end
            end
        end
        
        DotlanDataBucket = nil
        
        self:removeOld()
        self:pushNewNotifications()
        
    end
end

function DotlanRSS:removeOld()
    local oldData = true
    
    while oldData == true do
        local foundOld = 0
        
        for i,j in ipairs(self.data) do
            local time = getNow()
            local notificationTime = j["pubDate"]
        
            local difference = os.difftime(os.time(time),os.time(notificationTime))-(60*60)
        
            if difference >= 300 then
                table.remove(self.data,i)
                foundOld = foundOld + 1
                print("Removed old Dotlan - " .. j["title"] .. " " ..j["pubDate"]["hour"]..":"..j["pubDate"]["min"] .. "-" .. difference)
            end
        end
        if foundOld == 0 then
            oldData = false
        end
    end
end

function DotlanRSS:pushNewNotifications()
    for i,j in pairs(self.data) do
        local newNotification = {j["title"],j["category"],j["pubDate"],j["link"],j["system"]}
        
        --local time = getNow()
        --local notificationTime = j["pubDate"]
        --local difference = (os.difftime(os.time(time),os.time(notificationTime))/60)-60
        --print(difference)
        
        --print("Pushing")
        
        notifyHandle:push("dotLanRSS",newNotification)
        
    end
    
    self.data = {}
end
        
        

        
    