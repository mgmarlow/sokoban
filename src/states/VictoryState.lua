VictoryState = Class {__includes = BaseState}

function VictoryState:enter(params)
  self.next = params.levelNumber + 1
  self.showNext = self.next <= gLoader.numLevels
end

function VictoryState:update(dt)
  if love.keyboard.wasPressed('z') and self.showNext then
    gStateMachine:change('play', {levelNumber = self.next})
  end

  if not self.showNext and love.keyboard.wasPressed('x') then
    gStateMachine:change('level_select', {})
  end

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end
end

function VictoryState:render()
  love.graphics.setColor(1, 1, 1, 1)
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

  if self.showNext then
    love.graphics.printf(
      'Press Z to go to next level',
      0,
      WINDOW_HEIGHT / 2 + 70,
      WINDOW_WIDTH,
      'center'
    )
  else
    love.graphics.printf(
      'Press X to go to level select',
      0,
      WINDOW_HEIGHT / 2 + 70,
      WINDOW_WIDTH,
      'center'
    )
  end

  -- reset the color
  love.graphics.setColor(255, 255, 255, 255)
end
