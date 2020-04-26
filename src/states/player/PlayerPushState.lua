PlayerPushState = Class{__includes = BaseState}

function PlayerPushState:init(player, level)
  self.player = player
  self.level = level
end

function PlayerPushState:enter(params)
  self.dir = params.dir
  self.target = params.target
  self.prevX = params.prevX
  self.prevY = params.prevY
end

function PlayerPushState:update(dt)
  local success = self.target:move(self.dir, self.level)

  if not success then
    self.player.x = self.prevX
    self.player.y = self.prevY
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
