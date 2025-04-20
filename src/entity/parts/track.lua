local Entity = require "src.entity.core.entity"
local Animation = require "src.animations.animation"
local createQuads = require "src.utils.create-quads"

local Track = Entity:extend()
local margin = 5

function Track:new(scale, interval)
  Track.super.new(self, LG.newImage("assets/img/track.png"), scale)

  self.animation = Animation(interval)
  self.animation.frames = createQuads(self.img, 2, 1, margin)
end

function Track:draw(x, y)
  LG.draw(
    self.img,
    self.animation.frames[self.animation.currentFrame],
    x * self.scale,
    y * self.scale,
    self.angle,
    self.scale,
    self.scale
  )
end

function Track:update(dt)
  self.animation:update(dt)
end

return Track