local Object = require "lib.classic"
local Entity = Object:extend()

function Entity:new(img, scale)
    self.img = img
    self.angle = 0
    self.scale = scale or 1
end

function Entity:draw(x, y)
    love.graphics.draw(self.img, x, y, self.angle, self.scale, self.scale)
end

function Entity:getHeight()
    return self.img:getHeight()
end

function Entity:getWidth()
    return self.img:getWidth()
end

return Entity