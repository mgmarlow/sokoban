TileMap = Class{}

function TileMap:init(params)
  self.tilemap = params.source
end

function TileMap:render()
  local map = self.tilemap.layers[1]
  local xOffset = (WINDOW_WIDTH - (TILE_WIDTH * map.width)) / 2
  local yOffset = (WINDOW_HEIGHT - (TILE_HEIGHT * map.height)) / 2

  for row = 1, map.height do
    for col = 1, map.width do
      local tileIndex = ((row - 1) * map.height) + col

      love.graphics.draw(
        gTextures.tilesheet,
        quads[map.data[tileIndex]],
        xOffset + (col - 1) * TILE_WIDTH,
        yOffset + (row - 1) * TILE_HEIGHT
      )
    end
  end
end
