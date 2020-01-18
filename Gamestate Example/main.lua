
-- Hump Gamestate Library --
Gamestate = require("gamestate")

-- Your Gamestates --
Splash = require("Splash")
Menu = require("Menu")
Game = require("Game")


function love.load()
  Gamestate.registerEvents()
  Gamestate.switch(Splash)
end
