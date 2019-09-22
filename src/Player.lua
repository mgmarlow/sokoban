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
  self.currentAnimation = idleAnimation
end

function Player:update(dt)
  -- TODO: add active state to animation (to prevent looping)
  self.currentAnimation:update(dt)

  if love.keyboard.wasPressed('left') then
    self.currentAnimation = movingAnimations.left
  elseif love.keyboard.wasPressed('right') then
    self.currentAnimation = movingAnimations.right
  elseif love.keyboard.wasPressed('up') then
    self.currentAnimation = movingAnimations.up
  elseif love.keyboard.wasPressed('down') then
    self.currentAnimation = movingAnimations.down
  else
  end
end

function Player:render()
  love.graphics.draw(
    gTextures.tilesheet,
    quads[self.currentAnimation:getCurrentFrame()],
    -- TODO: offset
    self.x,
    self.y
  )
end
