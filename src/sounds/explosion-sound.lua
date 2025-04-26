local Sound = require 'src.sounds.sound'
local ExplosionSound = Sound:extend()

function ExplosionSound:new()
  self.super.new(self, 'assets/sounds/explosion3.flac', 'static', 0.5, false)    
end

function ExplosionSound:play()
  self.sound:stop()
  self.sound:play()
end

return ExplosionSound