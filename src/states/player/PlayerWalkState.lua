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

function PlayerWalkState:init(player, gameObjects)
  self.player = player
  self.gameObjects = gameObjects
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

  if dir ~= nil then
    self.player.currentAnimation:reset()

    -- Retain previous position for collisions
    local prevX = self.player.x
    local prevY = self.player.y

    self.player.x = self.player.x + (dir.x * self.player.speed)
    self.player.y = self.player.y + (dir.y * self.player.speed)

    for _, object in pairs(self.gameObjects) do
      if object:collides(self.player) then
        if object.isMoveable then
          self.player:changeState('push', {
            dir = dir,
            target = object,
            prevX = prevX,
            prevY = prevY
          })
          self.player:update(dt)
          return
        end

        self.player.x = prevX
        self.player.y = prevY
        return
      end
    end
  end
end

function PlayerWalkState:render()
  love.graphics.draw(
    gTextures.tilesheet,
    quads[self.player.currentAnimation:getCurrentFrame()],
    self.player.x,
    self.player.y
  )
end
