Entity = Class {}

function Entity:init(params)
  self.x = params.x
  self.y = params.y
  self.tileIndex = params.tileIndex
end

function Entity:update(dt)
end

function Entity:render()
  love.graphics.draw(
    gTextures.tilesheet,
    quads[self.tileIndex],
    self.x,
    self.y
  )
end
