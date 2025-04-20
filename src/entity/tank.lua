local entity = require "src.entity.core.entity"

local Tank = entity:extend()

local Track = require "src.entity.parts.track"
local TankCannon = require "src.entity.parts.tank-cannon"
local TankBase = require "src.entity.parts.tank-base"

function Tank:new(x, y, scale, type)
  Tank.super.new(self, x, y)

  self.scale = scale or 1
  self.type = type or 1

  self.cannon = TankCannon(x, y, scale, type)
  self.base = TankBase(x, y, scale, type)
  self.track = Track(x, y, scale, 0.1)
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

return Tank