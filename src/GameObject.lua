GameObject = Class{}

function GameObject:init(def, params)
  -- self.tileIndex = def.tileIndex
  self.width = def.width
  self.height = def.height
  self.isMoveable = def.isMoveable
  self.isSolid = def.isSolid
  self.isVictory = def.isVictory

  self.id = params.id
  self.x = params.x
  self.y = params.y
  self.tileIndex = params.tileIndex
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
  local prevCollision = nil
  local nextCollision = nil
  local prevX = self.x
  local prevY = self.y

  -- Keep track of previous collisions
  for _, object in pairs(level.gameObjects) do
    if object.id ~= self.id and object:collides(self) then
      prevCollision = object
    end
  end

  self.x = self.x + (dir.x * TILE_WIDTH)
  self.y = self.y + (dir.y * TILE_HEIGHT)

  for _, object in pairs(level.gameObjects) do
    -- Lua lacks a continue statement, so use an anon function
    -- instead to prevent breaking loop entirely.
    local state = (function()
      if object.id == self.id then
        return 'skip'
      end

      if level:outsideBounds(self.x, self.y) then
        return 'blocked'
      end

      if object:collides(self) and object.isSolid then
        return 'blocked'
      end

      if object:collides(self) then
        return 'valid'
      end
    end)()

    if state == 'blocked' then
      self.x = prevX
      self.y = prevY
      return false
    end

    if state == 'valid' then
      nextCollision = object
      -- Break early since only 1 object can collide
      -- with one other.
      break
    end
  end

  if prevCollision ~= nil and prevCollision.isVictory then
    level.victories = level.victories - 1
  end

  if nextCollision and nextCollision.isVictory then
    level.victories = level.victories + 1
  end

  return true
end

function GameObject:collides(other)
  if self.x > other.x + other.width - 1 or other.x > self.x + self.width - 1 then
    return false
  end

  if self.y > other.y + other.height - 1 or other.y > self.y + self.height - 1 then
    return false
  end

  return true
end
