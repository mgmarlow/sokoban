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

function GameObject:move(dir, gameObjects)
  local prevX = self.x
  local prevY = self.y

  self.x = self.x + (dir.x * TILE_WIDTH)
  self.y = self.y + (dir.y * TILE_HEIGHT)

  for _, object in pairs(gameObjects) do
    if object.id ~= self.id and object:collides(self) then
      self.x = prevX
      self.y = prevY
      return false
    end
  end

  return true
end

function GameObject:collides(other)
  if not self.isSolid then
    return false
  end

  if self.x > other.x + other.width - 1 or other.x > self.x + self.width -1 then
    return false
  end

  if self.y > other.y + other.height - 1 or other.y > self.y + self.height - 1 then
    return false
  end

  return true
end
