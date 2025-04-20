local Entity = require "src.entity.core.entity"
local TankBase = Entity:extend()
local createQuads = require "src.utils.create-quads"

local margin = 5
local xoffset = 10

function TankBase:new(scale, type)
  TankBase.super.new(self, LG.newImage("assets/img/tank-base.png"), scale)

  self.type = type or 1
  self.quads = createQuads(self.img, 3, 1, margin, 0)
end

function TankBase:draw(x, y)
  LG.draw(
    self.img,
    self.quads[self.type],
    x + (xoffset * self.scale),
    y,
    self.angle,
    self.scale,
    self.scale
  )
end

return TankBase