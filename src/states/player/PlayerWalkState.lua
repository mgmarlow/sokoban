PlayerWalkState = Class{__includes = BaseState}

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

function PlayerWalkState:init(player, level)
  self.player = player
  self.level = level
end

function PlayerWalkState:update(dt)
  local dir

  if self.player.currentAnimation.done == false then
    self.player.currentAnimation:update(dt)
  end

  if love.keyboard.wasPressed('left') then
    self.player.currentAnimation = movingAnimations.left
    dir = {x=-1, y=0}
  elseif love.keyboard.wasPressed('right') then
    self.player.currentAnimation = movingAnimations.right
    dir = {x=1, y=0}
  elseif love.keyboard.wasPressed('up') then
    self.player.currentAnimation = movingAnimations.up
    dir = {x=0, y=-1}
  elseif love.keyboard.wasPressed('down') then
    self.player.currentAnimation = movingAnimations.down
    dir = {x=0, y=1}
  else
  end

  if dir == nil then
    return
  end

  self.player.currentAnimation:reset()

  local nextPlayer = {
    x=self.player.x + (dir.x * self.player.speed),
    y=self.player.y + (dir.y * self.player.speed),
    width=self.player.width,
    height=self.player.height
  }

  if self.level:outsideBounds(nextPlayer.x, nextPlayer.y) then
      -- Prevent movement
    return
  end

  -- Check object collisions
  for _, object in pairs(self.level.gameObjects) do
    if object:collides(nextPlayer) and object.isSolid then
      if object.isMoveable then
        self.player:changeState('push', {
          dir = dir,
          target = object,
          nextPlayer = nextPlayer
        })
        self.player:update(dt)
        return
      end

      -- Prevent movement
      return
    end
  end

  Timer.tween(0.1, self.player, {x=nextPlayer.x, y=nextPlayer.y})
end

function PlayerWalkState:render()
  love.graphics.draw(
    gTextures.tilesheet,
    quads[self.player.currentAnimation:getCurrentFrame()],
    self.player.x,
    self.player.y
  )
end
