local Tank = require("src.entity.tank")
local Enemy = Tank:extend()

function Enemy:new(speed, word, type)
  Enemy.super.new(self, 0.5, type, math.rad(180))

  self:setCoordinates(
    math.random(0, LG.getWidth() - self:getWidth()),
    0
  )

  self.speed = speed
  self.word = word

  self.textWidth = LG.getFont():getWidth(self.word)
  self.textHeight = LG.getFont():getHeight(self.word)
end

function Enemy:draw()
  LG.setColor(0, 0, 0, 0.6)
  LG.rectangle("fill", self:getCenterCoordinates() - self.textWidth / 2 - 10, self.y - 35, self.textWidth + 20, self.textHeight + 10, 5, 5, 10)
  LG.setColor(1, 1, 1)

  LG.print(self.word, self:getCenterCoordinates() - self.textWidth / 2, self.y - 30)

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
end

function Enemy:setCoordinates(x, y)
  self.x = x
  self.y = y

  self.track:setCoordinates(x, y)
  self.base:setCoordinates(x, y)
  self.cannon:setCoordinates(x, y - 40)
end

return Enemy