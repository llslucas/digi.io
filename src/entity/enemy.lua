local Tank = require("src.entity.tank")
local Enemy = Tank:extend()

local Text = require("src.entity.graphics.text")

function Enemy:new(speed, word, type)
  Enemy.super.new(self, SPRITES_SCALING, type, math.rad(180))

  self:setCoordinates(
    math.random(TANK_SPAWN_MARGIN, LG.getWidth() - self:getWidth() - TANK_SPAWN_MARGIN),
    0
  )

  self.speed = speed
  self.text = Text(word, self:getCenterCoordinates(), self.y - 30)
end

function Enemy:draw()
  self.text:draw()
  self.super.draw(self)
end

function Enemy:update(dt)
  self.super.update(self, dt)
  self:moveFoward(self.speed * dt)
end

function Enemy:moveFoward(distance)
  self:setCoordinates(
    self.x,
    self.y + distance
  )

  self.text:setCoordinates(self:getCenterCoordinates(), self.y - 30)
end

function Enemy:setCoordinates(x, y)
  self.x = x
  self.y = y

  self.track:setCoordinates(x, y)
  self.base:setCoordinates(x, y)
  self.cannon:setCoordinates(x, y - 40)
end

function Enemy:checkInput(char)
  return self.text:checkInput(char)
end

function Enemy:checkCompleted()
  return self.text:checkCompleted()
end

function Enemy:getHeight()
  return self.super.getHeight(self) + 30
end

return Enemy