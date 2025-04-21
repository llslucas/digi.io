local Entity = require "src.entity.core.entity"
local Animation = require "src.animations.animation"
local createQuads = require "src.utils.create-quads"

local Track = Entity:extend()
local margin = 5

function Track:new(scale, interval, angle)
  Track.super.new(self, LG.newImage("assets/img/track.png"), scale, angle)

  self.animation = Animation(interval)
  self.animation.frames = createQuads(self.img, 2, 1, margin, 0)
end

function Track:draw(x, y)
  LG.draw(
    self.img,
    self.animation.frames[self.animation.currentFrame],
    self.x + (self:getWidth() / 2),
    self.y + (self:getHeight() / 2),
    self.angle,
    self.scale,
    self.scale,
    self:getWidth() / self.scale / 2,
    self:getHeight() / self.scale / 2
  )
end

function Track:update(dt)
  self.animation:update(dt)
end

function Track:getWidth()
  return math.floor(self.super.getWidth(self) / 2 - (margin * self.scale))
end

return Track