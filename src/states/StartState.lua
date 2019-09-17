StartState = Class{__includes = BaseState}

local highlighted = 1

function StartState:update(dt)
  if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
    highlighted = highlighted == 1 and 2 or 1
    -- gSounds['paddle-hit']:play()
  end

  -- confirm whichever option we have selected to change screens
  -- if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
      -- gSounds['confirm']:play()

      -- if highlighted == 1 then
      --     gStateMachine:change('serve', {
      --         paddle = Paddle(1),
      --         bricks = LevelMaker.createMap(1),
      --         health = 3,
      --         score = 0,
      --         level = 1
      --     })
      -- end
  -- end

  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end
end

function StartState:render()
  love.graphics.setColor(0, 255, 0, 255)
  -- title
  love.graphics.setFont(gFonts['large'])
  love.graphics.printf("Sokoban", 0, WINDOW_HEIGHT / 3,
    WINDOW_WIDTH, 'center')
  
  -- instructions
  love.graphics.setFont(gFonts['medium'])

  love.graphics.setColor(255, 255, 255, 255)

  -- if we're highlighting 1, render that option blue
  if highlighted == 1 then
    love.graphics.setColor(0, 255, 0, 255)
  end
  love.graphics.printf("START", 0, WINDOW_HEIGHT / 2 + 70,
    WINDOW_WIDTH, 'center')

  -- reset the color
  love.graphics.setColor(255, 255, 255, 255)

  -- render option 2 blue if we're highlighting that one
  if highlighted == 2 then
    love.graphics.setColor(0, 255, 0, 255)
  end
  love.graphics.printf("HIGH SCORES", 0, WINDOW_HEIGHT / 2 + 90,
    WINDOW_WIDTH, 'center')

  -- reset the color
  love.graphics.setColor(255, 255, 255, 255)
end
