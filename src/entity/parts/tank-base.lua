local Entity = require "src.entity.core.entity"
local TankBase = Entity:extend()
local createQuads = require "src.utils.create-quads"

local margin = 5
local xoffset = 10

function TankBase:new(scale, type, angle)
  TankBase.super.new(self, LG.newImage("assets/img/tank-base.png"), scale, angle)

  self.type = type or 1
  self.quads = createQuads(self.img, 3, 1, margin, 0)
end

function TankBase:draw()
  LG.draw(
    self.img,
    self.quads[self.type],
    self.x + (self:getWidth() / 2) + (xoffset * self.scale),
    self.y + (self:getHeight() / 2),
    self.angle,
    self.scale,
    self.scale,
    self:getWidth() / self.scale / 2,
    self:getHeight() / self.scale / 2
  )
end

function TankBase:getWidth()
  return math.floor(TankBase.super.getWidth(self) / 3 - (margin * self.scale))
end

return TankBase