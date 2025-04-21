local Entity = require "src.entity.core.entity"
local Aim = Entity:extend()

function Aim:new(scale)
  Aim.super.new(self, LG.newImage("assets/img/aim.png"), scale)
end

function Aim:draw()
  LG.draw(
    self.img,
    self.x,
    self.y,
    self.angle,
    self.scale,
    self.scale,
    self:getWidth() / self.scale / 2,
    self:getHeight() / self.scale / 2
  )
end

return Aim
