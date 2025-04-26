local Score = require 'src.entity.graphics.score'
local BigScore = Score:extend()

function BigScore:new(x, y)
  self.super.new(self, x, y)

  self.font = FONTS.BigScore
  self.width = self.font:getWidth(self.text)
  self.height = self.font:getHeight(self.text)

  self.paddingX = 40
  self.paddingY = 40

  self.dx = self.x - (self.width + self.paddingX) / 2
  self.dy = self.y - (self.height + self.paddingY) / 2
end

function BigScore:update(dt)
  self.super.update(self, dt)

  self.dx = self.x - (self.width + self.paddingX) / 2
  self.dy = self.y - (self.height + self.paddingY) / 2
end

return BigScore
