-- Dependências Globais
LG = love.graphics
require 'src.global.parameters'
require 'src.global.game'
Object = require 'lib.classic'

-- Dependências Locais
local Gameplay = require 'src.gameplay.gameplay'

-- Local 
local gameplay

function love.load()
  math.randomseed(os.time())
  local customFont = LG.newFont('assets/fonts/Press_Start_2P/PressStart2P-Regular.ttf', 10)
  LG.setFont(customFont)

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