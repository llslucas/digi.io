local Object = require "lib.classic"
local Entity = Object:extend()

function Entity:new(x, y)
    self.x = x
    self.y = y
    self.angle = 0
    self.img = nil
    self.quad = nil
end

function Entity:getHeight()
    return self.img:getHeight()
end

function Entity:getWidth()
    return self.img:getWidth()
end

return Entity