PlayerPushState = Class{__includes = BaseState}

function PlayerPushState:init(player, level)
  self.player = player
  self.level = level
end

function PlayerPushState:enter(params)
  self.dir = params.dir
  self.target = params.target
  self.nextPlayerPos = params.nextPlayerPos
end

function PlayerPushState:update(dt)
  local moveable, nextObjectPos = self.target:move(self.dir, self.level)

  if moveable then
    Signal.emit('object.move', nextObjectPos)
    Signal.emit('player.move', self.nextPlayerPos)
    -- TODO:
    -- Signal.emit('move', {
    --   playerFrom=,
    --   playerTo=self.nextPlayerPos,
    --   interactFrom=,
    --   interactTo=nextObjectPos
    -- })
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
