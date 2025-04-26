local Entity = Object:extend()

function Entity:new(img, scale, angle)
    self.img = img or nil
    self.scale = scale or 1
    self.angle = angle or 0
    self.x = 0
    self.y = 0
end

function Entity:draw()
    LG.draw(self.img, self.x, self.y, self.angle, self.scale, self.scale)
end

function Entity:getHeight()
    return math.floor(self.img:getHeight() * self.scale)
end

function Entity:getWidth()
    return math.floor(self.img:getWidth() * self.scale)
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