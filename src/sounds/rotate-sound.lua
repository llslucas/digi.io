local Sound = require 'src.sounds.sound'
local RotateSound = Sound:extend()

function RotateSound:new()
  self.super.new(self, "assets/sounds/turret-rotate.wav", "static", 0.5, false)
end

function RotateSound:play()
  self.sound:stop()
  self.sound:play()
end

return RotateSound