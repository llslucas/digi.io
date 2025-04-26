local Buttons = Object:extend()

local Button = require 'src.entity.graphics.button'

function Buttons:new()
  self.buttons = {}
  self.isHovered = false
end

function Buttons:add(text, callback)
  table.insert(self.buttons, Button(LG.getWidth() / 2, LG.getHeight() / 2  + #self.buttons * 70 + 30, text, callback))
end

function Buttons:draw()
  self.isHovered = false

  for _, button in ipairs(self.buttons) do
    button:draw()

    if button:isHovered() then
      self.isHovered = true
    end
  end

  love.mouse.setCursor(love.mouse.getSystemCursor(self.isHovered and "hand" or "arrow"))
end

function Buttons:update(dt)
  for _, button in ipairs(self.buttons) do
    button:update(dt)
  end
end

return Buttons