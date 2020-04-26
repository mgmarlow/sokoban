PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
  self.tilemap = params.tilemap

  if params.level and params.player then
    self.level = params.level
    self.player = params.player
  else
    self:initializeLevel()
  end
end

function PlayState:update(dt)
  if love.keyboard.wasPressed('r') then
    self:reset()
  end

  if love.keyboard.wasPressed('escape') then
    gStateMachine:change('pause', {
      tilemap = self.tilemap,
      player = self.player,
      level = self.level
    })
  end

  if self.level.victoriesNeeded > 0 and
     self.level.victoriesNeeded == self.level.victories then
       gStateMachine:change('victory')
  end

  self.level:update(dt)
  self.player:update(dt)
end

function PlayState:render()
  self.level:render()
  self.player:render()
end

function PlayState:reset()
  self:initializeLevel()
end

function PlayState:initializeLevel()
  self.level = Level{source = self.tilemap}
  self.player = Player {
    x = self.level.playerX,
    y = self.level.playerY
  }

  self.player.stateMachine = StateMachine {
    ['walk'] = function() return PlayerWalkState(self.player, self.level) end,
    ['idle'] = function() return PlayerIdleState(self.player) end,
    ['push'] = function() return PlayerPushState(self.player, self.level) end,
  }
  self.player:changeState('idle')
end
