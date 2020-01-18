
----------------------
-- Menu Gamestate --
----------------------

local Menu = {}

function Menu:draw()
  love.graphics.setColor(0, 0, 255)
  love.graphics.print("I AM THE MENU STATE")
  love.graphics.print("Press RETURN to PLAY", 0, 20)
  love.graphics.print("Press ESCAPE to QUIT", 0, 40)
  love.graphics.setColor(255, 255, 255, 255)
end


function Menu:keypressed(key)
  if key == "escape" then love.event.quit()
  elseif key == "return" then Gamestate.switch(Game) end
end

return Menu