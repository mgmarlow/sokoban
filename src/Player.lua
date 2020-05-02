Player = Class{}

function Player:init(params)
  self.x = params.x
  self.y = params.y
  self.width = TILE_WIDTH
  self.height = TILE_HEIGHT

  -- square tiles, speed will simply move to next tile
  self.speed = TILE_WIDTH

  Signal.register('player.move', function(params)
    nextPos = params.to
    Timer.tween(0.1, self, {x=nextPos.x, y=nextPos.y})
  end)
end

-- StateMachine assigned in the PlayState
function Player:update(dt)
  self.stateMachine:update(dt)
end

function Player:render()
  self.stateMachine:render()
end

function Player:changeState(next, params)
  self.stateMachine:change(next, params)
end
