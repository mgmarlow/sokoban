GameObject = Class{}

function GameObject:init(def, params)
  self.tileIndex = def.tileIndex
  self.width = def.width
  self.height = def.height
  self.isMoveable = def.isMoveable
  self.isSolid = def.isSolid

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
