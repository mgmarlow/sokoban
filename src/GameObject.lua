GameObject = Class{}

function GameObject:init(def, params)
  self.tileIndex = def.tileIndex
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
