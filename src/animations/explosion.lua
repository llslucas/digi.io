local Animation = require 'src.animations.animation'
local Explosion = Animation:extend()

local createQuads = require 'src.utils.create-quads'

function Explosion:new(x, y, scale)
  self.super.new(self, 0.08)

  self.x = x
  self.y = y
  self.scale = scale

  self.img = LG.newImage('assets/img/explosion.png')
  self.frames = createQuads(self.img, 8, 1)
  self.completed = false
end

function Explosion:draw()
  LG.draw(
    self.img,
    self.frames[self.currentFrame],
    self.x,
    self.y,
    0,
    self.scale,
    self.scale,
    self.img:getWidth() / 8 / 2,
    self.img:getHeight() / 2
  )
end

function Explosion:update(dt)
  if self.currentFrame < #self.frames then
    self.super.update(self, dt)
  else 
    self.completed = true
  end
end

function Explosion:checkCompleted()
  return self.completed
end

return Explosion