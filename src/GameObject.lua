GameObject = Class {}

function GameObject:init(def, params)
  self.width = def.width
  self.height = def.height
  self.isMoveable = def.isMoveable
  self.isSolid = def.isSolid
  self.isVictory = def.isVictory
  self.type = def.type
  self.zIndex = def.zIndex or 0
  self.isPluggable = def.isPluggable or false

  self.id = params.id
  self.x = params.x
  self.y = params.y
  self.tileIndex = params.tileIndex

  if self.isMoveable then
    local handleMove = function(params)
      if self.id == params.id then
        local nextObj = params.to

        Signal.emit('set.victories', params.victories)
        self.x = nextObj.x
        self.y = nextObj.y
      end
    end

    Signal.register('object.move', handleMove)
  end

  -- TODO: update tile to look plugged
  local handlePlug = function(params)
    -- If an object is plugged it is not moveable
    if self.id == params.pluggedId then
      self.isMoveable = not params.plugged
      self.isSolid = not params.plugged
    end

    if self.id == params.pitId then
      self.isPluggable = not params.plugged
    end
  end

  Signal.register('object.plug', handlePlug)
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
  local victoryChange = 0

  -- Keep track of previous collisions
  for _, object in pairs(level.gameObjects) do
    if object.id ~= self.id and object:collides(self) then
      prevCollision = object
    end
  end

  local nextObject = {
    x = self.x + (dir.x * TILE_WIDTH),
    y = self.y + (dir.y * TILE_HEIGHT),
    width = self.width,
    height = self.height,
    victories = 0
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
    victoryChange = victoryChange - 1
  end

  if nextCollision and nextCollision.isVictory then
    victoryChange = victoryChange + 1
  end

  return true, nextObject, nextCollision, victoryChange
end

function GameObject:collides(other)
  if
    self.x > other.x + other.width - 1 or other.x > self.x + self.width - 1
   then
    return false
  end

  if
    self.y > other.y + other.height - 1 or
      other.y > self.y + self.height - 1
   then
    return false
  end

  return true
end
