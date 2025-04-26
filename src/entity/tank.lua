local entity = require "src.entity.core.entity"
local Tank = entity:extend()

local Track = require "src.entity.parts.track"
local TankCannon = require "src.entity.parts.tank-cannon"
local TankBase = require "src.entity.parts.tank-base"
local RotateSound = require "src.sounds.rotate-sound"

function Tank:new(scale, type, angle)
  Tank.super.new(self)

  self.isAlive = true
  self.rotateSound = RotateSound()

  self.angle = angle or 0
  self.scale = scale or SPRITES_SCALING
  self.type = type or 1

  self.cannon = TankCannon(scale, type, angle)
  self.base = TankBase(scale, type, angle)
  self.track = Track(scale, 0.1, angle)
end

function Tank:draw()
  self.track:draw()
  self.base:draw()
  self.cannon:draw()
end

function Tank:update(dt)
  self.track:update(dt)
end

function Tank:getHeight()
  return self.track:getHeight()
end

function Tank:getWidth()
  return self.track:getWidth()
end

function Tank:turnCannon(angle)
  -- Verifica se o ângulo mudou o suficiente 
  if math.abs(self.angle - angle) > 1 then
    self.rotateSound:play()
  end

  self.angle = angle
  self.cannon:turn(angle)
end

function Tank:setCoordinates(x, y)
  self.x = x
  self.y = y

  self.track:setCoordinates(x, y)
  self.base:setCoordinates(x, y)
  self.cannon:setCoordinates(x, y)
end

function Tank:gerCenterCoordinates()
  return self.track:gerCenterCoordinates()
end

function Tank:checkCollision(tank)
  local x1, y1 = self.track:getCoordinates()
  local x2, y2 = tank.track:getCoordinates()

  local width1, height1 = self:getWidth(), self:getHeight()
  local width2, height2 = tank:getWidth(), tank:getHeight()

  local collision = x1 < x2 + width2 and
                    x1 + width1 > x2 and
                    y1 < y2 + height2 and
                    y1 + height1 > y2

  return collision
end

return Tank