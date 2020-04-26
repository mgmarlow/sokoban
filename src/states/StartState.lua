StartState = Class{__includes = BaseState}

function StartState:update(dt)
  -- confirm whichever option we have selected to change screens
  if love.keyboard.wasPressed('z') then
    gStateMachine:change('play', {
      tilemap = LEVEL_ONE
    })
  end

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end
end

function StartState:render()
  -- title
  love.graphics.setFont(gFonts['large'])
  love.graphics.printf("Sokoban", 0, WINDOW_HEIGHT / 3,
    WINDOW_WIDTH, 'center')
  
  -- instructions
  love.graphics.setFont(gFonts['medium'])
  love.graphics.setColor(0, 255, 0, 255)
  love.graphics.printf("Press Z to start", 0, WINDOW_HEIGHT / 2 + 70,
    WINDOW_WIDTH, 'center')

  -- reset the color
  love.graphics.setColor(255, 255, 255, 255)
end
