local GameScreen = Object:extend()

function GameScreen:new()
  GameScreen.bg = {}
  GameScreen.bg.img = LG.newImage('assets/img/bg.jpg')
  GameScreen.bg.img:setWrap("repeat", "repeat")

  GameScreen.bg.width = LG.getWidth()
  GameScreen.bg.height = LG.getHeight()
  GameScreen.bg.scale = GameScreen.bg.width / GameScreen.bg.img:getWidth()

  GameScreen.bg.scroll = 0
  GameScreen.bg.speed = 50

  GameScreen.bg.quad = LG.newQuad(
    0, 0,
    GameScreen.bg.img:getWidth(),
    GameScreen.bg.img:getHeight(),
    GameScreen.bg.img:getWidth(),
    GameScreen.bg.img:getHeight()
  )
end

function GameScreen:draw()
  LG.draw(GameScreen.bg.img, GameScreen.bg.quad, 0, 0, 0, GameScreen.bg.scale, GameScreen.bg.scale)
end

function GameScreen:update(dt)
  GameScreen.bg.scroll = (GameScreen.bg.scroll - GameScreen.bg.speed * dt) % GameScreen.bg.img:getHeight()

  GameScreen.bg.quad:setViewport(
    0,
    GameScreen.bg.scroll,
    GameScreen.bg.width,
    GameScreen.bg.height,
    GameScreen.bg.width,
    GameScreen.bg.height
  )
end

return GameScreen