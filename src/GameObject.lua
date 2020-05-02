GameObject = Class{}

function GameObject:init(def, params)
  self.width = def.width
  self.height = def.height
  self.isMoveable = def.isMoveable
  self.isSolid = def.isSolid
  self.isVictory = def.isVictory

  self.id = params.id
  self.x = params.x
  self.y = params.y
  self.tileIndex = params.tileIndex

  Signal.register('object.move', function(nextPos)
    if nextPos.id == self.id then
      Timer.tween(0.1, self, {x=nextPos.x, y=nextPos.y})
    end
  end)
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

  -- Keep track of previous collisions
  for _, object in pairs(level.gameObjects) do
    if object.id ~= self.id and object:collides(self) then
      prevCollision = object
    end
  end

  local nextObject = {
    id=self.id,
    x=self.x + (dir.x * TILE_WIDTH),
    y=self.y + (dir.y * TILE_HEIGHT),
    width=self.width,
    height=self.height
  }

  for _, object in pairs(level.gameObjects) do
    -- Lua lacks a continue statement, so use an anon function
    -- instead to prevent breaking loop entirely.
    local state = (function()
      if object.id == self.id then
        return 'skip'
      end

      if level:outsideBounds(nextObject.x, nextObject.y) then
        return 'blocked'
      end

      if object:collides(nextObject) and object.isSolid then
        return 'blocked'
      end

      if object:collides(nextObject) then
        return 'valid'
      end
    end)()

    if state == 'blocked' then
      return false, nil
    end

    if state == 'valid' then
      nextCollision = object
      -- Break early since only 1 object can collide
      -- with one other.
      break
    end
  end

  if prevCollision ~= nil and prevCollision.isVictory then
    Signal.emit('victories.down')
  end

  if nextCollision and nextCollision.isVictory then
    Signal.emit('victories.up')
  end

  return true, nextObject
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
