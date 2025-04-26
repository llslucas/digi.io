local Score = Object:extend()

function Score:new(x, y)
  self.x = x
  self.y = y

  self:setText()

  self.font = LG.newFont(20)
  self.width = self.font:getWidth(self.text)
  self.height = self.font:getHeight(self.text)

  self.dx = x - self.width - 20
  self.dy = y - self.height - 10
end

function Score:draw()
  local defaultFont = LG.getFont()
  LG.setFont(self.font)

  LG.setColor(0, 0, 0, 0.6)
  LG.rectangle("fill", self.dx, self.dy, self.width + 20, self.height + 10, 5, 5, 10)

  LG.setColor(1, 0.349, 0)

  LG.print(self.text, self.dx + 10, self.dy + 5)

  LG.setColor(1, 1, 1)
  LG.setFont(defaultFont)
end

function Score:update(dt)
  self:setText()

  self.width = self.font:getWidth(self.text)
  self.height = self.font:getHeight(self.text)

  self.dx = self.x - self.width - 20
  self.dy = self.y - self.height - 10
end

function Score:getScore()
  return GAME.SCORE
end

function Score:setScore(score)
  GAME.SCORE = score
end

function Score:addScore(points)
  GAME.SCORE = GAME.SCORE + points
end

function Score:reset()
  GAME.SCORE = 0
end

function Score:setText()
  self.text = "L" .. GAME.LEVEL .. " " .. GAME.SCORE .. " pts"
end

return Score