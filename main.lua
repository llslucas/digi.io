-- Variáveis Globais
require 'data.words'

LG = love.graphics

-- Variáveis locais
local gameScreen = require 'src.screens.game-screen'
local Player = require 'src.entity.player'
local Enemies = require 'src.aggregate.enemies'
local Ambience = require 'src.sounds.ambience'
local ShotSound = require 'src.sounds.shot'

local player, enemies, ambience, shotSound
local elapsedTime = 0

function love.load()
  math.randomseed(os.time())
  LG.setFont(LG.newFont(14))

  gameScreen.load()
  player = Player()
  enemies = Enemies()

  ambience = Ambience()
  shotSound = ShotSound()

  ambience:play()
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
    local randomWord = words[math.random(#words)]
    enemies:addEnemy(50, randomWord.word, math.random(2, 3))
    elapsedTime = 0
  end
end

function love.keypressed(key)
  if not player.enemy then
    local enemy = enemies:checkInput(key)

    if enemy then
      shotSound:play()
      player:setEnemy(enemy)
    end

  else
    if player.enemy:checkInput(key) then
      shotSound:play()
    end
  end

  if enemies:checkCompleted() then
    player:unsetEnemy()
  end
end