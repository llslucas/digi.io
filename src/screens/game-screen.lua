local GameScreen = Object:extend()

function GameScreen:new()
  self.bg = {}
  self.bg.img = LG.newImage('assets/img/bg-game.jpg')
  self.bg.img:setWrap("repeat", "repeat")

  self.bg.width = LG.getWidth()
  self.bg.height = LG.getHeight()
  self.bg.scale = self.bg.width / self.bg.img:getWidth()

  self.bg.scroll = 0
  self.bg.speed = 50

  self.bg.quad = LG.newQuad(
    0, 0,
    self.bg.img:getWidth(),
    self.bg.img:getHeight(),
    self.bg.img:getWidth(),
    self.bg.img:getHeight()
  )
end

function GameScreen:draw()
  LG.draw(self.bg.img, self.bg.quad, 0, 0, 0, self.bg.scale, self.bg.scale)
end

function GameScreen:update(dt)
  self.bg.scroll = (self.bg.scroll - self.bg.speed * dt) % self.bg.img:getHeight()

  self.bg.quad:setViewport(
    0,
    self.bg.scroll,
    self.bg.width,
    self.bg.height,
    self.bg.width,
    self.bg.height
  )
end

return GameScreen