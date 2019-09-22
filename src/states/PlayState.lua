PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
  self.tilemap = TileMap{source = params.tilemap}
end

function PlayState:render()
  self.tilemap:render()
end
