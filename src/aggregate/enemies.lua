local Object = require 'lib.classic'
local Enemies = Object:extend()

local Enemy = require 'src.entity.enemy'

function Enemies:new()
  self.enemies = {}
end

function Enemies:addEnemy(speed, word, type)
  local enemy = Enemy(speed, word, type)
  table.insert(self.enemies, enemy)
end

function Enemies:draw()
  for _, enemy in ipairs(self.enemies) do
    enemy:draw()
  end
end

function Enemies:update(dt)
  for _, enemy in ipairs(self.enemies) do
    enemy:update(dt)
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

function Enemies:removeEnemy(index)
  table.remove(self.enemies, index)
end

function Enemies:clear()
  self.enemies = {}
end

return Enemies