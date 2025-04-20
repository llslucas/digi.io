local Entity = require "src.entity.core.entity"
local TankBase = Entity:extend()
local createQuads = require "src.utils.create-quads"

local margin = 5
local xoffset = 10

function TankBase:new(x, y, scale, type)
  TankBase.super.new(self, x + xoffset, y)
  
  self.img = LG.newImage("assets/img/tank-base.png")

  self.scale = scale or 1
  self.type = type or 1

  self.quads = createQuads(self.img, 3, 1, margin)
end

function TankBase:draw()
  LG.draw(
    self.img,
    self.quads[self.type],
    self.x * self.scale,
    self.y * self.scale,
    self.angle,
    self.scale,
    self.scale
  )
end

return TankBase