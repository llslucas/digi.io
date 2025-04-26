function StartGame()
  GAME.LEVEL = 1
  GAME.SCORE = 0
  GAME.ENEMIES = INITIAL_ENEMIES
  GAME.ENEMY_SPEED = INITIAL_SPEED
  GAME.SPAWN_RATE = INITIAL_SPAWN_RATE
  GAME.STATUS = 'playing'
end

function QuitGame()
  love.event.quit()
end