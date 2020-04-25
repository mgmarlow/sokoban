PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
  self.tilemap = TileMap{source = params.tilemap}
  self.player, self.gameObjects = self.tilemap:getGameObjects()

  self.player.stateMachine = StateMachine {
    ['walk'] = function() return PlayerWalkState(self.player, self.gameObjects) end,
    ['idle'] = function() return PlayerIdleState(self.player) end,
    ['push'] = function() return PlayerPushState(self.player, self.gameObjects) end,
  }
  self.player:changeState('idle')
end

function PlayState:update(dt)
  for i = 1, #self.gameObjects do
    self.gameObjects[i]:update(dt)
  end

  self.player:update(dt)
end

function PlayState:render()
  self.tilemap:render()

  for i = 1, #self.gameObjects do
    self.gameObjects[i]:render()
  end

  self.player:render()
end
