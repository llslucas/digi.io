-- Global
LG = love.graphics

-- Dependências
local Gameplay = require 'src.gameplay.gameplay'

-- Local 
local gameplay

function love.load()
  math.randomseed(os.time())
  LG.setFont(LG.newFont(14))

  gameplay = Gameplay()
end

function love.draw()
  gameplay:draw()
end

function love.update(dt)
  gameplay:update(dt)
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end

  gameplay:keypressed(key)
end