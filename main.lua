-- Hump Gamestate Library --
Gamestate = require("src/lib/gamestate")

-- Your Gamestates --
Splash = require("src/Splash")
Menu = require("src/Menu")
Game = require("src/Game")

button_height = 64

local function newButton(text ,fn)
    return {
        text = text,
        fn = fn,
        now = false,
        last = false
    }
end

local buttons = {}
local font = nil

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(Splash)

    font = love.graphics.newFont(32)

    table.insert(buttons, newButton(
        "text1",
        function()
            print("text1")
        end))

    table.insert(buttons, newButton(
        "text2",
        function()
            print("text2")
        end))

    table.insert(buttons, newButton(
        "exit",
        function()
            love.event.quit(0)
        end))
-- table.insert( list, [pos,] value )
end

function love.update(dt)
end

function love.draw()
    local ww = love.graphics.getWidth()
    local wh = love.graphics.getHeight()

    local button_width = ww * (1/3)
    local margin = 16
    local total_height = (button_height + margin) * #buttons
    local cursor_y = 0

    for i, button in ipairs(buttons) do
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