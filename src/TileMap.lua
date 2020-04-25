TileMap = Class{}

function TileMap:init(params)
  local tilemap = params.source

  self.width = 8
  self.height = 8
  self.mapLayer = tilemap.layers[1]
  self.objectLayer = tilemap.layers[2]

  -- map layer w/h should always match object layer w/h
  self.xOffset = (WINDOW_WIDTH - (TILE_WIDTH * self.width)) / 2
  self.yOffset = (WINDOW_HEIGHT - (TILE_HEIGHT * self.height)) / 2
end

function TileMap:render()
  for row = 1, self.height do
    for col = 1, self.width do
      local tileIndex = ((row - 1) * self.mapLayer.height) + col

      love.graphics.draw(
        gTextures.tilesheet,
        quads[self.mapLayer.data[tileIndex]],
        self.xOffset + (col - 1) * TILE_WIDTH,
        self.yOffset + (row - 1) * TILE_HEIGHT
      )
    end
  end
end

function TileMap:getGameObjects()
  local player
  local levelObjects = {}

  local wallDef = GAME_OBJECT_DEFS['wall']
  local boxDef = GAME_OBJECT_DEFS['box']
  local destDef = GAME_OBJECT_DEFS['destination']

  for row = 1, self.height do
    for col = 1, self.width do
      local tileIndex = ((row - 1) * self.objectLayer.height) + col
      local quadIndex = self.objectLayer.data[tileIndex]

      local x = self.xOffset + (col - 1) * TILE_WIDTH
      local y = self.yOffset + (row - 1) * TILE_HEIGHT

      if quadIndex == wallDef.tileIndex then
        table.insert(levelObjects, GameObject(
            wallDef,
            { x = x, y = y }
          )
        )
      elseif quadIndex == 73 then
        -- Keep the player separate so it can be instantiated
        -- with knowledge of other game objects
        player = Player {
          x = x,
          y = y
        }
      elseif quadIndex == boxDef.tileIndex then
        table.insert(levelObjects, GameObject(
            boxDef,
            { x = x, y = y }
          )
        )
      elseif quadIndex == destDef.tileIndex then
        table.insert(levelObjects, GameObject(
            destDef,
            { x = x, y = y }
          )
        )
      end
    end
  end

  return player, levelObjects
end
