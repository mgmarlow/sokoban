require 'src/dependencies'

function love.load()
  love.window.setTitle('Sokoban')

  love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)

  gFonts = {
    ['small'] = love.graphics.newFont('fonts/cardenio_modern.otf', 16),
    ['medium'] = love.graphics.newFont('fonts/cardenio_modern.otf', 18),
    ['large'] = love.graphics.newFont('fonts/cardenio_modern.otf', 32)
  }

  gTextures = {
    ['sheet'] = love.graphics.newImage('img/sokoban_tilesheet.png')
  }

  gStateMachine = StateMachine {
    ['start'] = function() return StartState() end,
  }
  gStateMachine:change('start')

  love.keyboard.keysPressed = {}
end

function love.update(dt)
  gStateMachine:update(dt)

  love.keyboard.keysPressed = {}
end

function love.keypressed(key)
  love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
  if love.keyboard.keysPressed[key] then
    return true
  else
    return false
  end
end

function love.draw()
  gStateMachine:render()

  displayFPS()
end
