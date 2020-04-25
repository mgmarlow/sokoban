Player = Class{}

local idleAnimation = Animation {
  frames = {66},
  interval = 1
}

local movingAnimations = {
  ['left'] = Animation {
    frames = {96, 97, 95},
    interval = 0.2
  },
  ['right'] = Animation {
    frames = {93, 94, 92},
    interval = 0.2
  },
  ['up'] = Animation {
    frames = {70, 71, 69},
    interval = 0.2
  },
  ['down'] = Animation {
    frames = {67, 68, 66},
    interval = 0.2
  },
}

function Player:init(params)
  self.x = params.x
  self.y = params.y
  self.width = TILE_WIDTH
  self.height = TILE_HEIGHT

  -- square tiles, speed will simply move to next tile
  self.speed = TILE_WIDTH
  self.currentAnimation = idleAnimation
end

function Player:update(dt, gameObjects)
  local dir

  if self.currentAnimation.done == false then
    self.currentAnimation:update(dt)
  end

  if love.keyboard.wasPressed('left') then
    self.currentAnimation = movingAnimations.left
    dir = {x=-1, y=0}
  elseif love.keyboard.wasPressed('right') then
    self.currentAnimation = movingAnimations.right
    dir = {x=1, y=0}
  elseif love.keyboard.wasPressed('up') then
    self.currentAnimation = movingAnimations.up
    dir = {x=0, y=-1}
  elseif love.keyboard.wasPressed('down') then
    self.currentAnimation = movingAnimations.down
    dir = {x=0, y=1}
  else
  end

  if dir ~= nil then
    self.currentAnimation:reset()
    prevX = self.x
    prevY = self.y

    self.x = self.x + (dir.x * self.speed)
    self.y = self.y + (dir.y * self.speed)

    for _, object in pairs(gameObjects) do
      if object:collides(self) then
        self.x = prevX
        self.y = prevY
        break
      end
    end
  end
end

function Player:render()
  love.graphics.draw(
    gTextures.tilesheet,
    quads[self.currentAnimation:getCurrentFrame()],
    self.x,
    self.y
  )
end
