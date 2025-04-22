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
  enemy = Enemy(100, "palavra", 2)

  player:setEnemy(enemy)
end

function love.draw()
  gameScreen.draw()
  player:draw()
  if enemy then 
    enemy:draw()
  end
end

function love.update(dt)
  player:update(dt)

  if enemy then 
    enemy:update(dt)
  end
end

function love.keypressed(key)
  enemy:checkInput(key)
  if(enemy:checkCompleted()) then
    enemy = nil
    player:unsetEnemy()
  end
end