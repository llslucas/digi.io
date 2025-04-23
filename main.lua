-- Variáveis Globais
LG = love.graphics

-- Variáveis locais
local gameScreen = require 'src.screen.game-screen'
local Player = require 'src.entity.player'
local Enemies = require 'src.aggregate.enemies'

local player, enemies
local elapsedTime = 0

function love.load()
  math.randomseed(os.time())
  LG.setFont(LG.newFont(14))

  gameScreen.load()
  player = Player()
  enemies = Enemies()
end

function love.draw()
  gameScreen.draw()
  player:draw()
  enemies:draw()
end

function love.update(dt)
  elapsedTime = elapsedTime + dt

  player:update(dt)
  enemies:update(dt)

  if elapsedTime >= 2 then
    enemies:addEnemy(100, "palavra", 2)
    elapsedTime = 0
  end
end

function love.keypressed(key)
  if not player.enemy then
    player:setEnemy(enemies:checkInput(key))
  else
    player.enemy:checkInput(key)
  end

  if enemies:checkCompleted() then 
    player:unsetEnemy()
  end
end