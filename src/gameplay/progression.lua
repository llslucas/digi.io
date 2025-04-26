local Progression = Object:extend()

function Progression:new()
  GAME.LEVEL = 1
  GAME.ENEMIES = INITIAL_ENEMIES
  GAME.ENEMY_SPEED = INITIAL_SPEED
  GAME.SPAWN_RATE = INITIAL_SPAWN_RATE
end

function Progression:increaseLevel()
  GAME.LEVEL = GAME.LEVEL + 1
  self:calcEnemies()
  self:calcEnemySpeed()
  self:calcSpawnRate()
end

function Progression:reset()
  GAME.LEVEL = 1
  GAME.ENEMIES = 5
  GAME.ENEMY_SPEED = INITIAL_SPEED
  GAME.SPAWN_RATE = INITIAL_SPAWN_RATE
end

function Progression:calcEnemySpeed()
  GAME.ENEMY_SPEED = math.min(math.floor(INITIAL_SPEED + (GAME.LEVEL - 1) * SPEED_INCREMENT), SPEED_LIMIT)
end

function Progression:calcSpawnRate()
  GAME.SPAWN_RATE = math.max(math.floor(INITIAL_SPAWN_RATE - (GAME.LEVEL - 1) * SPAWN_RATE_DECREMENT), SPAWN_RATE_LIMIT)
end

function Progression:calcEnemies()
  GAME.ENEMIES = math.min(math.floor(INITIAL_ENEMIES + (GAME.LEVEL - 1) * ENEMIES_INCREMENT), ENEMIES_LIMIT)
end

return Progression