
----------------------
-- Menu Gamestate --
----------------------

local Menu = {
  buttons = {}
}

button_height = 64
local font = nil

function newButton(text ,fn)
  return {
      text = text,
      fn = fn,
      now = false,
      last = false
  }
end

function load()
  font = love.graphics.newFont(32)
  -- TODO: why?
  print("Hello")

  table.insert(Menu.buttons, newButton(
      "go to another state",
      function()
          print("text1")
          Gamestate.switch(Game)
      end))

  table.insert(Menu.buttons, newButton(
      "text2",
      function()
          print("text2")
      end))

  table.insert(Menu.buttons, newButton(
      "exit",
      function()
          love.event.quit(0)
      end))
-- table.insert( list, [pos,] value )

end

load()

function Menu:draw()
  love.graphics.setColor(0, 0, 255)
  love.graphics.print("I AM THE MENU STATE")
  love.graphics.print("Press RETURN to PLAY", 0, 20)
  love.graphics.print("Press ESCAPE to QUIT", 0, 40)
  love.graphics.setColor(255, 255, 255, 255)

--   print(#Menu.buttons.." "..#buttons2)

  local ww = love.graphics.getWidth()
  local wh = love.graphics.getHeight()

  local button_width = ww * (1/3)
  local margin = 16
  local total_height = (button_height + margin) * #Menu.buttons
  local cursor_y = 0

  for i, button in ipairs(Menu.buttons) do
      button.last = button.now
      local bx = (ww * 0.5) - (button_width * 0.5)
      local by = (wh * 0.5) - (total_height * 0.5) + cursor_y

      local textW = font:getWidth(button.text)
      local textH = font:getHeight(button.text)

      local tx = (ww * 0.5) - textW * 0.5
      local ty = by + textH * 0.45

      local mx, my = love.mouse.getPosition()

      -- grey
      local color = {0.4,0.4,0.5,1.0}
      local hot = mx > bx and mx < bx + button_width and
                  my > by and my < by + button_height
      if hot then
          color = {0.9,0.9,0.9,1}
      end

      button.now = love.mouse.isDown(1)
      if button.now and not button.last and hot then
          button.fn()
      end
      love.graphics.setColor(unpack(color))

      love.graphics.rectangle(
          "fill",
          bx,
          by,
          button_width,
          button_height
      )

      -- black
      love.graphics.setColor(0,0,0,1)

      love.graphics.print(
          button.text,
          font,
          tx,
          ty
      )

      cursor_y = cursor_y + (button_height + margin)
  end
end


function Menu:keypressed(key)
  if key == "escape" then love.event.quit()
  elseif key == "return" then Gamestate.switch(Game) end
end

return Menu