local Screen = require 'src.screens.screen'
local StartScreen = Screen:extend()

function StartScreen:new()
  self.super.new(self, 'assets/img/bg-start.png')

  self.buttons:add("Iniciar", StartGame)
  -- self.buttons:add("Ranking")
  self.buttons:add("Sair", QuitGame)
end

return StartScreen