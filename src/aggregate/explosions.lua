local Explosions = Object:extend()

local Explosion = require 'src.animations.explosion'
local ExplosionSound = require 'src.sounds.explosion-sound'

function Explosions:new()
  self.explosions = {}
  self.explosionSound = ExplosionSound()
end

function Explosions:addExplosion(x, y, scale)
  local explosion = Explosion(x, y, scale)
  table.insert(self.explosions, explosion)
  self.explosionSound:play()
end

function Explosions:draw()
  for _, explosion in ipairs(self.explosions) do
    explosion:draw()
  end
end

function Explosions:update(dt)
  for _, explosion in ipairs(self.explosions) do
    explosion:update(dt)
  end

  self:checkCompleted()
end

function Explosions:checkCompleted()
  for i, explosion in ipairs(self.explosions) do
    if explosion:checkCompleted() then
      self:removeExplosion(i)
    end
  end
end

function Explosions:removeExplosion(index)
  table.remove(self.explosions, index)
end

function Explosions:clear()
  self.explosions = {}
end

return Explosions