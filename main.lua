-- Hump Gamestate Library --
Gamestate = require("src/lib/gamestate")

-- Your Gamestates --
Splash = require("src/Splash")
Menu = require("src/Menu")
Game = require("src/Game")


function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(Splash)
end

function love.update(dt)
end

function love.keypressed(key, u)
    --Debug
    if key == "rctrl" then --set to whatever key you want to use
       debug.debug()
    end
 end

function love.draw()
end