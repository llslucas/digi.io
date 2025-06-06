-- Variáveis Globais
require 'data.words'

local Object = require 'lib.classic'
local Gameplay = Object:extend()

-- Dependências
local GameScreen = require 'src.screens.game-screen'
local PauseScreen = require 'src.screens.pause-screen'

local Player = require 'src.entity.player'
local Enemies = require 'src.aggregate.enemies'
local ShotSound = require 'src.sounds.shot-sound'
local Score = require 'src.entity.graphics.score'
local Progression = require 'src.gameplay.progression'

function Gameplay:new()
  self.progression = Progression()

  self.gameScreen = GameScreen()
  self.pauseScreen = PauseScreen()

  self.player = Player()
  self.enemies = Enemies()

  self.shotSound = ShotSound()
  self.score = Score(LG.getWidth() - 10, LG.getHeight() - 10)

  self.elapsedTime = 0
end

function Gameplay:draw()
  self.gameScreen:draw()
  self.player:draw()
  self.enemies:draw()
  self.score:draw()

  if GAME.STATUS == 'paused' then
    self.pauseScreen:draw()
  end
end

function Gameplay:update(dt)
  if GAME.STATUS == 'start' then
    self.progression:reset()
    self.enemies:clear()
    GAME.SCORE = 0
    GAME.STATUS = 'playing'
  end

  if GAME.STATUS == 'paused' then
    self.pauseScreen:update(dt)
  end

  if self.player.isAlive and GAME.STATUS == "playing" then
    self.elapsedTime = self.elapsedTime + dt

    self.player:update(dt)
    self.enemies:update(dt)
    self.score:update(dt)

    if self.elapsedTime >= GAME.SPAWN_RATE then
      local randomWord = words[math.random(#words)]
      self.enemies:addEnemy(GAME.ENEMY_SPEED, randomWord.word, math.random(2, 3))
      self.elapsedTime = 0
    end

    if self.player:checkCollision(self.enemies:getFirstEnemy()) then
      self:gameOver()
    end

    if GAME.ENEMIES <= 0 then
      self.progression:increaseLevel()
    end
  else
    self:stopSounds()
  end  
end

function Gameplay:keypressed(key)
  if key == 'return' or key == 'escape' then
    self:tooglePause()
    return
  end

  if GAME.STATUS ~= "playing" then
    return
  end

  if not self.player.enemy then
    local enemy = self.enemies:checkInput(key)

    if enemy then
      self.shotSound:play()
      self.player:setEnemy(enemy)
    end
  else
    if self.player.enemy:checkInput(key) then
      self.shotSound:play()
    end
  end

  if self.enemies:checkCompleted() then
    self.player:unsetEnemy()
    self.score:addScore(POINTS_PER_ENEMY)
    GAME.ENEMIES = GAME.ENEMIES - 1
  end
end

function Gameplay:tooglePause()
  if GAME.STATUS == "playing" then
    GAME.STATUS = "paused"
  else
    GAME.STATUS = "playing"
  end
end

function Gameplay:restart()
  GAME.STATUS = "playing"
  self.elapsedTime = 0
end

function Gameplay:gameOver()
  self.player:unsetEnemy()
  self.enemies:clear()
  self:stopSounds()
  GAME.STATUS = "gameover"
end

function Gameplay:stopSounds()
  self.enemies.tankSound:stop()
end

function Gameplay:playSounds()
  self.enemies.tankSound:play()
end

return Gameplay