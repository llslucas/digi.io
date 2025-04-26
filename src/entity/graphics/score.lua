local Object = require("lib.classic")
local Score = Object:extend()

function Score:new(x, y)  
  self.x = x
  self.y = y

  self.score = 0
  self.text = self.score .. " pts"

  self.font = love.graphics.newFont(20)
  self.width = self.font:getWidth(self.text)
  self.height = self.font:getHeight(self.text)

  self.dx = x - self.width - 20
  self.dy = y - self.height - 10
end

function Score:draw()
  local defaultFont = love.graphics.getFont()
  love.graphics.setFont(self.font)

  LG.setColor(0, 0, 0, 0.6)
  LG.rectangle("fill", self.dx, self.dy, self.width + 20, self.height + 10, 5, 5, 10)

  LG.setColor(1, 0.349, 0)

  love.graphics.print(self.text, self.dx + 10, self.dy + 5)

  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(defaultFont)
end

function Score:update(dt)
  self.text = self.score .. " pts"

  self.width = self.font:getWidth(self.text)
  self.height = self.font:getHeight(self.text)

  self.dx = self.x - self.width - 20
  self.dy = self.y - self.height - 10
end

function Score:getScore()
  return self.score
end

function Score:setScore(score)
  self.score = score
end

function Score:addScore(points)
  self.score = self.score + points
end

function Score:reset()
  self.score = 0
end

return Score