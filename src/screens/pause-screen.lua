local PauseScreen = Object:extend()

local Buttons = require 'src.aggregate.buttons'

function PauseScreen:new()
  self.buttons = Buttons()

  self.text = "PAUSE"
  self.font = FONTS.Big

  self.width = self.font:getWidth(self.text)
  self.height = self.font:getHeight(self.text)

  self.dx = (LG.getWidth() - self.width) / 2
  self.dy = (LG.getHeight() - self.height) / 2 - 150

  self.buttons:add("Continuar", ResumeGame)
  self.buttons:add("Reiniciar", StartGame)
  self.buttons:add("Sair", QuitGame)
end

function PauseScreen:draw()
  LG.setColor(0,0,0, 0.6)
  LG.rectangle("fill", 0, 0, LG.getWidth(), LG.getHeight())

  LG.setColor(0.996, 0.973, 0.361)
  LG.setFont(self.font)
  LG.print(self.text, self.dx, self.dy)
  LG.setFont(FONTS.normal)
  
  LG.setColor(1,1,1)
  self.buttons:draw()
end

function PauseScreen:update()
  self.buttons:update()
end

return PauseScreen