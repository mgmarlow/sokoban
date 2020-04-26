GameObject = Class{}

function GameObject:init(def, params)
  self.tileIndex = def.tileIndex
  self.width = def.width
  self.height = def.height
  self.isMoveable = def.isMoveable
  self.isSolid = def.isSolid
  self.isVictory = def.isVictory

  self.id = params.id
  self.x = params.x
  self.y = params.y

  self.satisifed = false
end

function GameObject:update(dt)
end

function GameObject:render()
  love.graphics.draw(
    gTextures.tilesheet,
    quads[self.tileIndex],
    self.x,
    self.y
  )
end

function GameObject:move(dir, level)
  local prevX = self.x
  local prevY = self.y

  self.x = self.x + (dir.x * TILE_WIDTH)
  self.y = self.y + (dir.y * TILE_HEIGHT)

  for _, object in pairs(level.gameObjects) do
    -- Lua lacks a continue statement, so use an anon function
    -- instead to prevent breaking loop entirely.
    local state = (function()
      if object.id == self.id or object.satisfied then
        return 'skip'
      end

      -- TODO: abstract this, same logic is repeated in player
      -- walk state.
      if self.x <= level.xOffset - 1 or
        self.x > level.xOffset + level.pixelWidth - 1 or
        self.y <= level.yOffset - 1 or
        self.y > level.yOffset + level.pixelHeight - 1 then
          return 'blocked'
      end

      if object:collides(self) and object.isSolid then
        return 'blocked'
      end

      if object:collides(self) and object.isVictory then
        return 'victory'
      end
    end)()

    if state == 'blocked' then
      self.x = prevX
      self.y = prevY
      return false
    end

    if state == 'victory' then
      object.satisifed = true
      level.victories = level.victories + 1
    end
  end

  return true
end

function GameObject:collides(other)
  if self.x > other.x + other.width - 1 or other.x > self.x + self.width -1 then
    return false
  end

  if self.y > other.y + other.height - 1 or other.y > self.y + self.height - 1 then
    return false
  end

  return true
end
