local Object = require 'lib.classic'
local ShotSound = Object:extend()

function ShotSound:new()
  self.shot = love.audio.newSource("assets/sounds/shot-laser.wav", "static")
  self.shot:setVolume(0.5)
end

function ShotSound:play()
  self.shot:stop()
  self.shot:play()
end

return ShotSound