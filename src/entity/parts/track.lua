local Entity = require "src.entity.core.entity"
local Animation = require "src.animations.animation"
local createQuads = require "src.utils.create-quads"

local Track = Entity:extend()
local margin = 5

function Track:new(x, y, scale, interval)
  Track.super.new(self, x, y)

  self.scale = scale or 1
  self.img = LG.newImage("assets/img/track.png")

  self.animation = Animation(interval)
  self.animation.frames = createQuads(self.img, 2, 1, margin)
end

function Track:draw()
  LG.draw(
    self.img,
    self.animation.frames[self.animation.currentFrame],
    self.x * self.scale,
    self.y * self.scale,
    self.angle,
    self.scale,
    self.scale
  )
end

function Track:update(dt)
  self.animation:update(dt)
end

return Track