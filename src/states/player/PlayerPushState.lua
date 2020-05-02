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
    Signal.emit('move', {
      actions={
        {
          type='object.move',
          -- TODO: add prev pos
          payload=nextObjectPos
        },
        {
          type='player.move',
          -- TODO: add prev pos
          payload=self.nextPlayerPos
        }
      }
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
