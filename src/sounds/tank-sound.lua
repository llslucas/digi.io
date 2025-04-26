local Sound = require 'src.sounds.sound'
local TankSound = Sound:extend()

function TankSound:new()
  self.super.new(self, "assets/sounds/move-tank.wav", "stream", SFX_VOLUME, false)
end

return TankSound