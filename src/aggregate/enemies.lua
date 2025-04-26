local Object = require 'lib.classic'
local Enemies = Object:extend()

local Enemy = require 'src.entity.enemy'
local Explosions = require 'src.aggregate.explosions'

function Enemies:new()
  self.enemies = {}
  self.explosions = Explosions()
  self.tankSound = love.audio.newSource('assets/sounds/move-tank.wav', 'stream')
  self.tankSound:setLooping(true)
end

function Enemies:addEnemy(speed, word, type)
  local enemy = Enemy(speed, word, type)

  while self:checkCollision(enemy) == true do
    enemy = Enemy(speed, word, type)
  end

  table.insert(self.enemies, enemy)
end

function Enemies:draw()
  for _, enemy in ipairs(self.enemies) do
    enemy:draw()
  end

  self.explosions:draw()
end

function Enemies:update(dt)
  for _, enemy in ipairs(self.enemies) do
    enemy:update(dt)
  end

  self.explosions:update(dt)
  
  if #self.enemies > 0 then
    if not self.tankSound:isPlaying() then
      self.tankSound:play()
    end
  else
    if self.tankSound:isPlaying() then
      self.tankSound:stop()
    end
  end
  
end

function Enemies:checkInput(char)
  for _, enemy in ipairs(self.enemies) do
    if enemy:checkInput(char) then
      return enemy
    end
  end
end

function Enemies:checkCompleted()
  for i, enemy in ipairs(self.enemies) do
    if enemy:checkCompleted() then
      self:removeEnemy(i)
      return true
    end
  end
  return false
end

function Enemies:checkCollision(tank)
  if tank == nil then
    return false
  end

  for _, enemy in ipairs(self.enemies) do
    if enemy:checkCollision(tank) then
      print("COLLISION")
      return true
    end
  end

  return false
end

function Enemies:removeEnemy(index)
  local x, y = self.enemies[index]:getCenterCoordinates()

  self.explosions:addExplosion(x, y, 0.5)
  table.remove(self.enemies, index)
end

function Enemies:clear()
  self.enemies = {}
end

return Enemies