PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
  self.level = Level{source = params.tilemap}
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

function PlayState:update(dt)
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
