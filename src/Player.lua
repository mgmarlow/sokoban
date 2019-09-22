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
  -- square tiles, speed will simply move to next tile
  self.speed = TILE_WIDTH
  self.currentAnimation = idleAnimation
end

function Player:update(dt)
  local keyPressed = false

  if self.currentAnimation.done == false then
    self.currentAnimation:update(dt)
  end

  if love.keyboard.wasPressed('left') then
    self.currentAnimation = movingAnimations.left
    keyPressed = true
  elseif love.keyboard.wasPressed('right') then
    self.currentAnimation = movingAnimations.right
    keyPressed = true
  elseif love.keyboard.wasPressed('up') then
    self.currentAnimation = movingAnimations.up
    keyPressed = true
  elseif love.keyboard.wasPressed('down') then
    self.currentAnimation = movingAnimations.down
    keyPressed = true
  else
  end

  if keyPressed == true then
    self.currentAnimation:reset()
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
