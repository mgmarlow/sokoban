PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
  self.tilemap = TileMap{source = params.tilemap}
  self.player = Player{}
end

function PlayState:update(dt)
  self.player:update(dt)
end

function PlayState:render()
  self.tilemap:render()
  self.player:render()
end
