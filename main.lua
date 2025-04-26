-- Dependências Globais
LG = love.graphics
require 'src.global.parameters'
require 'src.global.game'
require 'src.global.fonts'
require 'src.global.functions'
Object = require 'lib.classic'

-- Dependências Locais
local Gameplay = require 'src.gameplay.gameplay'
local StartScreen = require 'src.screens.start-screen'
local GameOverScreen = require 'src.screens.game-over-screen'
local AmbienceSound = require 'src.sounds.ambience-sound'

-- Local 
local startScreen, gameplay, gameOverScreen, ambience

function love.load()
  math.randomseed(os.time())
  LG.setFont(FONTS.normal)

  startScreen = StartScreen()
  gameplay = Gameplay()
  gameOverScreen = GameOverScreen()

  ambience = AmbienceSound()
  ambience:play()
end

function love.draw()
  if GAME.STATUS == 'initial' then
    startScreen:draw()
  elseif GAME.STATUS == 'playing' or GAME.STATUS == "paused" then
    gameplay:draw()
  elseif GAME.STATUS == 'gameover' then
    gameOverScreen:draw()
  end
end

function love.update(dt)
  if GAME.STATUS == 'initial' then
    startScreen:update(dt)
  elseif GAME.STATUS == 'playing' or GAME.STATUS == "paused" then
    gameplay:update(dt)
  elseif GAME.STATUS == 'gameover' then
    gameOverScreen:update(dt)
  end
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
  gameplay:keypressed(key)
end