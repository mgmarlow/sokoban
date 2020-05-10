PlayerPushState = Class {__includes = BaseState}

function PlayerPushState:init(player, level)
  self.player = player
  self.level = level
end

function PlayerPushState:enter(params)
  self.dir = params.dir
  self.target = params.target
  self.onMove = params.onMove
end

function PlayerPushState:update(dt)
  local moveable, nextObject, nextCollision, victoryChange =
    self.target:move(self.dir, self.level)

  -- This should really just emit generic events that are well-named.
  -- e.g. payload is currentCollision, nextCollision, prevCollision
  -- and special boolean values don't need to be sent over, instead
  -- object.move/undo.object.move, etc.
  if moveable then
    local actions = {
      {
        type = 'object.move',
        snapshot = {
          id = self.target.id,
          to = {
            x = self.target.x,
            y = self.target.y
          },
          victories = self.level.victories
        },
        payload = {
          id = self.target.id,
          to = nextObject,
          victories = self.level.victories + victoryChange
        }
      },
      self.onMove()
    }

    if nextCollision and nextCollision.isPluggable then
      table.insert(
        actions,
        {
          type = 'object.plug',
          snapshot = {
            plugged = false,
            pluggedId = self.target.id,
            pitId = nextCollision.id
          },
          payload = {
            plugged = true,
            pluggedId = self.target.id,
            pitId = nextCollision.id
          }
        }
      )
    end

    Signal.emit('move', {actions = actions})
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
