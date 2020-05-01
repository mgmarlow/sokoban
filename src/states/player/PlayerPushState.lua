PlayerPushState = Class{__includes = BaseState}

function PlayerPushState:init(player, level)
  self.player = player
  self.level = level
end

function PlayerPushState:enter(params)
  self.dir = params.dir
  self.target = params.target
  self.nextPlayer = params.nextPlayer
end

function PlayerPushState:update(dt)
  local success = self.target:move(self.dir, self.level)

  if success then
    Timer.tween(0.1, self.player, {
      x=self.nextPlayer.x,
      y=self.nextPlayer.y
    })
  end

  self.player:changeState('walk')
end

function PlayerPushState:render()
  love.graphics.draw(
    gTextures.tilesheet,
    quads[self.player.currentAnimation:getCurrentFrame()],
    self.player.x,
    self.player.y
  )
end
