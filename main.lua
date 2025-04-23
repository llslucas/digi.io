-- Variáveis Globais
LG = love.graphics

-- Variáveis locais
local gameScreen = require 'src.screen.game-screen'
local Player = require 'src.entity.player'
local Enemies = require 'src.aggregate.enemies'


local player, enemies
local elapsedTime = 0

local function playShot()
  local s = love.audio.newSource("assets/sounds/shot-laser.wav", "static")
  s:setVolume(0.5)
  s:play()
end

function love.load()
  math.randomseed(os.time())
  LG.setFont(LG.newFont(14))

  gameScreen.load()
  player = Player()
  enemies = Enemies()
  
  backgroundAmbience = love.audio.newSource("assets/sounds/ambience.mp3", "stream")
  backgroundAmbience:setLooping(true)
  backgroundAmbience:setVolume(0.2) 
  backgroundAmbience:play()
  
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

  if elapsedTime >= 1 then
    enemies:addEnemy(50, "palavra", 3)
    elapsedTime = 0
  end
end

function love.keypressed(key)
  if not player.enemy then
    local enemy = enemies:checkInput(key)
    if enemy then
      playShot() -- 🔫 som ao acertar a 1ª letra
      player:setEnemy(enemy)
    end
  else
    if player.enemy:checkInput(key) then
      playShot() -- 🔫 som a cada letra correta
    end
  end

  if enemies:checkCompleted() then
    player:unsetEnemy()
  end
end


