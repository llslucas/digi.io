local Score = Object:extend()

function Score:new(x, y)
  self.x = x
  self.y = y

  self:setText()

  self.font = FONTS.Score
  self.width = self.font:getWidth(self.text)
  self.height = self.font:getHeight(self.text)

  self.paddingX = 20
  self.paddingY = 20

  self.dx = self.x - self.width - self.paddingX
  self.dy = self.y - self.height - self.paddingY
end

function Score:draw()
  local defaultFont = LG.getFont()
  LG.setFont(self.font)

  LG.setColor(0, 0, 0, 0.6)
  LG.rectangle("fill", self.dx, self.dy, self.width + self.paddingX, self.height + self.paddingY, self.height / 2, self.height / 2)

  LG.setColor(1, 1, 1)
  LG.print(self.text, self.dx + self.paddingX / 2, self.dy + self.paddingY / 2)

  LG.setFont(defaultFont)
end

function Score:update(dt)
  self:setText()

  self.width = self.font:getWidth(self.text)
  self.height = self.font:getHeight(self.text)

  self.dx = self.x - self.width - self.paddingX
  self.dy = self.y - self.height - self.paddingY
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
  self.text = "L" .. GAME.LEVEL .. " - " .. GAME.SCORE .. " pts"
end

return Score