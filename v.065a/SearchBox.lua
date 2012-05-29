SearchBox = class()

function SearchBox:init(sysName,sID)
    -- you can accept and set parameters here
    self.sysName = sysName
    self.sysID = sID
    self.posY= (HEIGHT*.95 -33)- (searchBoxYMulti * table.maxn(systemSearchHelper))
    self.posX = 285
end

function SearchBox:draw()
    -- Codea does not automatically call this method
    pushStyle()
    strokeWidth(2)
    stroke(220, 220, 220, 255)
    fill(105, 105, 105, 198)
    rect(self.posX, self.posY, 200,30)
    fill(255, 255, 255, 255)
    textAlign(LEFT)
    textMode(CORNER)
    text(self.sysName,self.posX+5,self.posY+7)
    popStyle()
    
end

function SearchBox:touched(touch)
    -- Codea does not automatically call this method
    if touch.state == BEGAN then
        if touch.x >= self.posX and touch.x <= self.posX+200 then
            if touch.y >= self.posY and touch.y <= self.posY+30 then
                kbBuffer = nil
                hideKeyboard()
                gotoSystem(self.sysID)
                
            end
        end
    end
end
