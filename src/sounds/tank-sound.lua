local Sound = require 'src.sounds.sound'
local TankSound = Sound:extend()

function TankSound:new()
  self.super.new(self, "assets/sounds/move-tank.wav", "stream", 0.5, false)
end

return TankSound