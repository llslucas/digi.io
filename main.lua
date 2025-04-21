-- Variáveis Globais
LG = love.graphics

-- Variáveis locais
local gameScreen = require 'src.screen.game-screen'
local Player = require 'src.entity.player'

local player

function love.load()
  gameScreen.load()
  player = Player()
end

function love.draw()  
  gameScreen.draw()
  player:draw()
end

function love.update(dt)
  player:update(dt)
end