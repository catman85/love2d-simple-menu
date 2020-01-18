
----------------------
-- Game Gamestate --
----------------------

local Game = {}


function Game:draw()
  love.graphics.setColor(0, 255, 0)
  love.graphics.print("I AM THE GAME STATE")
  love.graphics.print("Press ESCAPE to get back to Menu", 0, 20)
  love.graphics.setColor(255, 255, 255, 255)
end


function Game:keypressed(key)
  if key == "escape" then Gamestate.switch(Menu) end
end

return Game