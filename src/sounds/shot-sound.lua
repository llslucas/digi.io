local Sound = require 'src.sounds.sound'
local ShotSound = Sound:extend()

function ShotSound:new()
  self.super.new(self, "assets/sounds/shot-laser.wav", "static", SFX_VOLUME, false)
end

function ShotSound:play()
  self.sound:stop()
  self.sound:play()
end

return ShotSound