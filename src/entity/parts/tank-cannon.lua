local Entity = require "src.entity.core.entity"
local TankCannon = Entity:extend()
local createQuads = require "src.utils.create-quads"

local margin = 5
local xoffset = 45

function TankCannon:new(x, y, scale, type)
  TankCannon.super.new(self, x + xoffset, y)

  self.img = LG.newImage("assets/img/tank-cannon.png")

  self.scale = scale or 1
  self.type = type or 1
  self.angle = 0

  self.quads = createQuads(self.img, 3, 1, margin)
end

function TankCannon:draw()
  LG.draw(
    self.img,
    self.quads[self.type],
    self.x + (self:getWidth() * self.scale / 3 / 2),
    self.y + (self:getHeight() * self.scale * 0.77),
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