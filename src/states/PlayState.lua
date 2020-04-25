PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
  self.tilemap = TileMap{source = params.tilemap}
  self.player, self.gameObjects = self.tilemap:getGameObjects()
end

function PlayState:update(dt)
  for i = 1, #self.gameObjects do
    self.gameObjects[i]:update(dt)
  end

  self.player:update(dt, self.gameObjects)
end

function PlayState:render()
  self.tilemap:render()

  for i = 1, #self.gameObjects do
    self.gameObjects[i]:render()
  end

  self.player:render()
end
