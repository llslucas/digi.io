local Object = require 'lib.classic'
local Text = Object:extend()

function Text:new(text, x, y)
  self.str = text
  self.x = x
  self.y = y

  self.length = string.len(text)
  self.width = love.graphics.getFont():getWidth(text)
  self.height = love.graphics.getFont():getHeight(text)
end

function Text:draw()
  LG.setColor(0, 0, 0, 0.6)
  LG.rectangle("fill", self.x - self.width / 2 - 10, self.y - 5, self.width + 20, self.height + 10, 5, 5, 10)

  LG.setColor(1, 1, 1)
  LG.print(self.str, self.x - self.width / 2, self.y)
end

function Text:setCoordinates(x, y)
  self.x = x
  self.y = y
end

return Text