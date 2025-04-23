local Object = require 'lib.classic'
local Ambience = Object:extend()

function Ambience:new()
  self.music = love.audio.newSource("assets/sounds/ambience.mp3", "stream")
  self.music:setVolume(0.2)
  self.music:setLooping(true)  
end

function Ambience:play()
  if not self.music:isPlaying() then
    self.music:play()
  end
end

return Ambience
