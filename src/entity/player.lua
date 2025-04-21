local Tank = require "src.entity.tank"
local Player = Tank:extend()
local drawDashedLine = require "src.utils.draw-dashed-line"

local Aim = require "src.entity.aim"

function Player:new()
  Player.super.new(self, 0.5, 1)

  self:setCoordinates(
    LG.getWidth()/2 - self:getCenter(),
    LG.getHeight() - self:getHeight() - 20
  )

  self.aim = Aim(0.5)
  self.aimed = false
end

function Player:draw()
  if self.aimed then
    self.aim:draw()

    local playerX, playerY = self.cannon:getCoordinates()
    LG.setColor(1, 0.349, 0)
    drawDashedLine(playerX, playerY, self.aim.x,self.aim.y, 20, 20)
    LG.setColor(1, 1, 1)
  end

  self.super.draw(self)
end

function Player:update(dt)
  self.super.update(self, dt)

  if self.aimed then
    self:aimEnemy(self.aim.x, self.aim.y)
  end
end

function Player:aimEnemy(x, y)
  local cannonX, cannonY = self.cannon:getCoordinates()

  local angle = math.deg(math.atan2(y - cannonY, x - cannonX)) + 90

  self:turnCannon(angle)
  self.aim:setCoordinates(x, y)
  self.aimed = true
end

return Player