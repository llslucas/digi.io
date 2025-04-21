local Entity = require "src.entity.core.entity"
local TankCannon = Entity:extend()
local createQuads = require "src.utils.create-quads"

local margin = 5
local xoffset = 45

function TankCannon:new(scale, type)
  TankCannon.super.new(self, LG.newImage("assets/img/tank-cannon.png"), scale)

  self.type = type or 1
  self.quads = createQuads(self.img, 3, 1, margin, 0)
end

function TankCannon:draw(x, y)
  LG.draw(
    self.img,
    self.quads[self.type],
    self.x + (self:getWidth() / 2) + (xoffset * self.scale),
    self.y + (self:getHeight() * 0.75),
    self.angle,
    self.scale,
    self.scale,
    self:getWidth() / self.scale / 2,
    self:getHeight() / self.scale * 0.75
  )
end

function TankCannon:turn(angle)
  self.angle = math.rad(angle)
end

function TankCannon:getWidth()
  return TankCannon.super.getWidth(self) / 3 - (margin * self.scale)
end

function TankCannon:getCoordinates()
  return self.x + (self:getWidth() / 2) + (xoffset * self.scale),
         self.y + (self:getHeight() * 0.75)
end

return TankCannon