VictoryState = Class{__includes = BaseState}

-- TODO: remove this with level select. This will
-- just loop levels as they are completed.
local function getNextLevel(n)
  if n > gLoader.numLevels then
    return 1
  end

  return n
end

function VictoryState:enter(params)
  self.levelNumber = params.levelNumber
end

function VictoryState:update(dt)
  local next = getNextLevel(self.levelNumber + 1)

  if love.keyboard.wasPressed('z') then
    gStateMachine:change('play', {
      levelNumber = next
    })
  end

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end
end

function VictoryState:render()
  -- title
  love.graphics.setFont(gFonts['large'])
  love.graphics.printf("Success!", 0, WINDOW_HEIGHT / 3,
    WINDOW_WIDTH, 'center')
  
  -- instructions
  love.graphics.setFont(gFonts['medium'])
  love.graphics.setColor(0, 255, 0, 255)
  love.graphics.printf("Press Z to go to next level", 0, WINDOW_HEIGHT / 2 + 70,
    WINDOW_WIDTH, 'center')

  -- reset the color
  love.graphics.setColor(255, 255, 255, 255)
end
