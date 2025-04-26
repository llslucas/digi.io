local Screen = require 'src.screens.screen'
local GameOverScreen = Screen:extend()

local BigScore = require "src.entity.graphics.bigScore"

function GameOverScreen:new()
  self.super.new(self, 'assets/img/bg-gameover.png')

  self.score = BigScore(LG.getWidth()/2, LG.getHeight()/2 - 60)

  self.buttons:add("Reiniciar", StartGame)
  self.buttons:add("Sair", QuitGame)
end

function GameOverScreen:draw()
  self.super.draw(self)
  self.score:draw()
end

function GameOverScreen:update(dt)
  self.super.update(self, dt)
  self.score:update(dt)
end

return GameOverScreen