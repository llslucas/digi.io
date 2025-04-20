local entity = require "src.entity.core.entity"

local Tank = entity:extend()

local Track = require "src.entity.parts.track"
local TankCannon = require "src.entity.parts.tank-cannon"
local TankBase = require "src.entity.parts.tank-base"

function Tank:new(scale, type)
  Tank.super.new(self)

  self.scale = scale or 1
  self.type = type or 1

  self.cannon = TankCannon(scale, type)
  self.base = TankBase(scale, type)
  self.track = Track(scale, 0.1)
end

function Tank:draw(x, y)
  self.track:draw(x, y)
  self.base:draw(x, y)
  self.cannon:draw(x, y)
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