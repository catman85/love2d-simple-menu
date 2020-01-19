
----------------------
-- Splash Gamestate --
----------------------

local Splash = {}
local centerX, centerY = love.graphics.getWidth()/2, love.graphics.getHeight()/2

function Splash:enter()
  self.duration = 5
end


function Splash:update(dt)
  self.duration = self.duration - dt
  if self.duration < 0 then
    Gamestate.switch(Menu)
  end
end


function Splash:draw()
  love.graphics.setColor(150, 110, 90, 255/self.duration)
  love.graphics.rectangle("fill", centerX-32, centerY-32, 64, 64)
  love.graphics.setColor(255, 255, 255, 255/self.duration)
  love.graphics.print("SPLAASH LOGOO", centerX-32, centerY+32)
end


function Splash:keypressed(key)
  if key then Gamestate.switch(Menu) end
end

return Splash

