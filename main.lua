-- Variáveis Globais
LG = love.graphics

-- Variáveis locais
local gameScreen = require 'src.screen.game-screen'
local Tank = require 'src.entity.tank'

local tank

function love.load()
  gameScreen.load()

  tank = Tank(LG.getWidth()/2, LG.getHeight()/2, 1, 1)
end

function love.draw()
  gameScreen.draw()
  tank:draw()
end

function love.update(dt)
  tank:update(dt)
end