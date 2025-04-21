-- Variáveis Globais
LG = love.graphics

-- Variáveis locais
local gameScreen = require 'src.screen.game-screen'
local Player = require 'src.entity.player'
local Enemy = require 'src.entity.enemy'

local player
local enemy

function love.load()
  math.randomseed(os.time())
  LG.setFont(LG.newFont(14))

  gameScreen.load()
  player = Player()

  enemy = Enemy(100, "teste", 2)

  player:setEnemy(enemy)
end

function love.draw()
  gameScreen.draw()
  player:draw()
  enemy:draw()
end

function love.update(dt)
  player:update(dt)
  enemy:update(dt)
end