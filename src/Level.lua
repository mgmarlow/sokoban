Level = Class{}

function Level:init(params)
  local tilemap = params.source

  -- w/h in number of tiles
  self.width = tilemap.width
  self.height = tilemap.height
  self.tileSize = TILE_WIDTH

  self.pixelWidth = self.width * self.tileSize
  self.pixelHeight = self.height * self.tileSize

  self.mapLayer = tilemap.layers[1]
  self.objectLayer = tilemap.layers[2]

  -- map layer w/h should always match object layer w/h
  self.xOffset = (WINDOW_WIDTH - (TILE_WIDTH * self.width)) / 2
  self.yOffset = (WINDOW_HEIGHT - (TILE_HEIGHT * self.height)) / 2

  self.victories = 0
  self.victoriesNeeded = 0

  -- Convert tilemap into game objects
  self:initializeGameObjects()
end

function Level:update(dt)
  -- TODO: resolve victories here rather than on collisions
  -- since we need to keep track of blocks moved off of
  -- the destination square.
  local victoryCount = 0

  for _, gameObject in pairs(self.gameObjects) do
    gameObject:update(dt)
  end
end

function Level:render()
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

  for i = 1, #self.gameObjects do
    self.gameObjects[i]:render()
  end
end

-- TODO: Move this into its own file
function Level:initializeGameObjects()
  self.gameObjects = {}

  local wallDef = GAME_OBJECT_DEFS['wall']
  local boxDef = GAME_OBJECT_DEFS['box']
  local destDef = GAME_OBJECT_DEFS['destination']

  for row = 1, self.height do
    for col = 1, self.width do
      local id = tostring(row) .. ":" .. tostring(col)
      local tileIndex = ((row - 1) * self.objectLayer.height) + col
      local quadIndex = self.objectLayer.data[tileIndex]

      local x = self.xOffset + (col - 1) * TILE_WIDTH
      local y = self.yOffset + (row - 1) * TILE_HEIGHT

      local gameObjectParams = {
        id = id,
        x = x,
        y = y
      }

      if quadIndex == wallDef.tileIndex then
        table.insert(self.gameObjects, GameObject(
            wallDef,
            gameObjectParams
          )
        )
      elseif quadIndex == 73 then
        -- Don't append the player to list of game objects
        -- since it can't interact with itself.
        self.playerX = x
        self.playerY = y
      elseif quadIndex == boxDef.tileIndex then
        table.insert(self.gameObjects, GameObject(
            boxDef,
            gameObjectParams
          )
        )
      elseif quadIndex == destDef.tileIndex then
        self.victoriesNeeded = self.victoriesNeeded + 1
        table.insert(self.gameObjects, GameObject(
            destDef,
            gameObjectParams
          )
        )
      end
    end
  end
end
