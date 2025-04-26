local entity = require "src.entity.core.entity"
local Tank = entity:extend()

local Track = require "src.entity.parts.track"
local TankCannon = require "src.entity.parts.tank-cannon"
local TankBase = require "src.entity.parts.tank-base"
local RotateSound = require "src.sounds.rotate-sound"

function Tank:new(scale, type, angle)
  Tank.super.new(self)

  self.rotateSound = RotateSound()

  self.angle = angle or 0
  self.scale = scale or 0.5
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

return Tank