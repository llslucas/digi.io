local Sound = require 'src.sounds.sound'
local AmbienceSound = Sound:extend()

function AmbienceSound:new()
  self.super.new(self, "assets/sounds/ambience.mp3", "stream", 0.2, true)
end

return AmbienceSound
