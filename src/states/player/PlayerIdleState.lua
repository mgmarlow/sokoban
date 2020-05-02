PlayerIdleState = Class {__includes = BaseState}

local idleAnimation =
  Animation {
  frames = {66},
  interval = 1
}

function PlayerIdleState:init(player)
  self.player = player
  self.player.currentAnimation = idleAnimation
end

function PlayerIdleState:update(dt)
  if
    love.keyboard.wasPressed('left') or love.keyboard.wasPressed('right') or
      love.keyboard.wasPressed('up') or
      love.keyboard.wasPressed('down')
   then
    self.player:changeState('walk')
    self.player:update(dt)
  end
end

function PlayerIdleState:render()
  love.graphics.draw(
    gTextures.tilesheet,
    quads[self.player.currentAnimation:getCurrentFrame()],
    self.player.x,
    self.player.y
  )
end
