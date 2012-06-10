function setDefaultValues()

screen = "MAP"

xscale=14.59
yscale=14.49

scaleValX = 1
scaleValY = 1

x=-0
y=-0

drawLines = true

systemSelected = nil
regionSelected = nil

linesByRegion = true
linesBySystem = false
linesByNone = false

showEmpire = true
showNull = true

infoBar = false
mapStarLinesToggle = false

kbBuffer =""
lastKey = nil

sysBar = false
sysBarName = nil
lastSys = ""


searchBoxYMulti = 30

totalNotifications = 0
totalKillNotifications = 0
totalDotlanNotifications = 0
totalISK = 0

appTimer = os.clock()
currentClock = 99999999999999

shipImage = nil
shipImageID = nil

charImage = nil
charImageID = nil

sysAlliance = nil
sysAllianceImg = nil

sysDotlanData = nil
gettingSysData = false
--Settings

gotoEvent = true
gotoRadar = false

killNotifications = true
dotlanNotifications = true
dotlanRadarTracking = false

notificationTime = 15

kmFiltersToggle = false
kmFiltersList={}
kmFiltersRegionToggle = false
KMFilterIsk = 0
kmFiltersShipClassToggle = false

end

