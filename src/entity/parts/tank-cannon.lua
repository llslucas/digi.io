local Entity = require "src.entity.core.entity"
local TankCannon = Entity:extend()
local createQuads = require "src.utils.create-quads"

local margin = 5
local xoffset = 45

function TankCannon:new(scale, type)
  TankCannon.super.new(self, LG.newImage("assets/img/tank-cannon.png"), scale)

  self.type = type or 1
  self.quads = createQuads(self.img, 3, 1, margin)
end

function TankCannon:draw(x, y)
  LG.draw(
    self.img,
    self.quads[self.type],
    x + (self:getWidth() * self.scale / 3 / 2) + xoffset,
    y + (self:getHeight() * self.scale * 0.77),
    self.angle,
    self.scale,
    self.scale,
    self:getWidth() * self.scale / 3 / 2,
    self:getHeight() * self.scale * 0.77
  )
end

function TankCannon:turn(angle)
  self.angle = angle
end

return TankCannon