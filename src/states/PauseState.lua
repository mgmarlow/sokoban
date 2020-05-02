PauseState = Class {__includes = BaseState}

function PauseState:enter(params)
  self.tilemap = params.tilemap
  self.player = params.player
  self.level = params.level
end

function PauseState:update(dt)
  if love.keyboard.wasPressed('escape') then
    love.event.quit()
  end

  if love.keyboard.wasPressed('return') then
    gStateMachine:change(
      'play',
      {
        tilemap = self.tilemap,
        player = self.player,
        level = self.level
      }
    )
  end
end

function PauseState:render()
  self.level:render()
  self.player:render()

  love.graphics.setFont(gFonts['large'])
  love.graphics.printf(
    "Hit 'escape' again to exit,\n'enter' to resume",
    0,
    WINDOW_HEIGHT / 3,
    WINDOW_WIDTH,
    'center'
  )
end
