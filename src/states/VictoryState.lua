VictoryState = Class {__includes = BaseState}

function VictoryState:enter(params)
  self.next = params.levelNumber + 1
  self.showNext = self.next <= gLoader.numLevels
end

function VictoryState:update(dt)
  if love.keyboard.wasPressed('z') and self.showNext then
    gStateMachine:change('play', {levelNumber = self.next})
  end

  if love.keyboard.wasPressed('x') then
    gStateMachine:change(
      'level_select',
      {
        selectedLevel = self.next
      }
    )
  end

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end
end

function VictoryState:render()
  -- title
  love.graphics.setFont(gFonts['large'])
  love.graphics.printf(
    'Success!',
    0,
    WINDOW_HEIGHT / 3,
    WINDOW_WIDTH,
    'center'
  )

  -- instructions
  love.graphics.setFont(gFonts['medium'])
  love.graphics.setColor(0, 255, 0, 255)

  if self.showNext then
    love.graphics.printf(
      'Press Z to go to next level',
      0,
      WINDOW_HEIGHT / 2 + 70,
      WINDOW_WIDTH,
      'center'
    )
  end

  love.graphics.printf(
    'Press X to go to level select',
    0,
    WINDOW_HEIGHT / 2 + 120,
    WINDOW_WIDTH,
    'center'
  )

  -- reset the color
  love.graphics.setColor(255, 255, 255, 255)
end
