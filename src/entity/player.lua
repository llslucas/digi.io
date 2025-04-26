local Tank = require "src.entity.tank"
local Player = Tank:extend()

local drawDashedLine = require "src.utils.draw-dashed-line"

local Aim = require "src.entity.graphics.aim"

function Player:new()
  Player.super.new(self, SPRITES_SCALING, 1)

  self:setCoordinates(
    LG.getWidth()/2 - self:getCenter(),
    LG.getHeight() - self:getHeight() - 20
  )

  self.aim = Aim(SPRITES_SCALING)
  self.enemy = nil
end

function Player:draw()
  if self.enemy then
    self.aim:draw()

    local playerX, playerY = self.cannon:getCoordinates()
    LG.setColor(1, 0.349, 0)
    drawDashedLine(playerX, playerY, self.aim.x,self.aim.y, 20, 20)
    LG.setColor(1, 1, 1)
  end

  if self.isAlive then
    self.super.draw(self)
  end
end

function Player:update(dt)
  self.super.update(self, dt)

  if self.enemy then
    self:aimEnemy()
  end
end

function Player:setEnemy(enemy)
  self.enemy = enemy
end

function Player:unsetEnemy()
  self.enemy = nil
  self:turnCannon(0)
end

function Player:aimEnemy()
  local cannonX, cannonY = self.cannon:getCoordinates()
  local enemyX, enemyY = self.enemy:getCenterCoordinates()

  local angle = math.deg(math.atan2(enemyY - cannonY, enemyX - cannonX)) + 90

  self:turnCannon(angle)
  self.aim:setCoordinates(enemyX, enemyY)
end

function Player:checkCollision(tank)
  if tank == nil then
    return false
  end

  local playerY = self.y
  local tankY = tank.y

  if math.abs(playerY - tankY) < self:getHeight() then
    return true
  end

  return false
end

return Player