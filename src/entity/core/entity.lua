local Object = require "lib.classic"
local Entity = Object:extend()

function Entity:new(img, scale)
    self.img = img
    self.angle = 0
    self.scale = scale or 1
    self.x = 0
    self.y = 0
end

function Entity:draw()
    love.graphics.draw(self.img, self.x, self.y, self.angle, self.scale, self.scale)
end

function Entity:getHeight()
    return self.img:getHeight() * self.scale
end

function Entity:getWidth()
    return self.img:getWidth() * self.scale
end

function Entity:setCoordinates(x, y)
    self.x = x
    self.y = y
end

function Entity:getCenter()
    return self:getWidth() / 2, self:getHeight() / 2
end

function Entity:getCoordinates()
    return self.x, self.y
end

function Entity:getCenterCoordinates()
    return self.x + (self:getWidth() / 2), self.y + (self:getHeight() / 2)
end

return Entity