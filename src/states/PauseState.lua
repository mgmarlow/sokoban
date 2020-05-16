PauseState = Class {__includes = BaseState}

function PauseState:enter(params)
  self.tilemap = params.tilemap
  self.player = params.player
  self.level = params.level
end

function PauseState:update(dt)
  if love.keyboard.wasPressed('return') then
    love.event.quit()
  end

  if love.keyboard.wasPressed('escape') then
    gStateMachine:change(
      'play',
      {
        tilemap = self.tilemap,
        player = self.player,
        level = self.level
      }
    )
  end

  if love.keyboard.wasPressed('x') then
    gStateMachine:change(
      'level_select',
      {
        selectedLevel = self.next
      }
    )
  end
end

function PauseState:render()
  self.level:render()
  self.player:render()

  love.graphics.setColor(0, 0, 0, 0.6)
  love.graphics.rectangle('fill', 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT)

  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setFont(gFonts['large'])
  love.graphics.printf('Paused!', 0, 50, WINDOW_WIDTH, 'center')

  love.graphics.setFont(gFonts['medium'])
  love.graphics.printf(
    "Hit 'escape' again to resume,\n'enter' to exit,\n'x' to go to level select.",
    0,
    WINDOW_HEIGHT / 2 - 50,
    WINDOW_WIDTH,
    'center'
  )
end
