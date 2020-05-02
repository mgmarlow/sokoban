require 'src/dependencies'

function love.load()
  love.window.setTitle('Sokoban')

  love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)

  gLoader = LevelLoader()

  gFonts = {
    ['small'] = love.graphics.newFont('fonts/cardenio_modern.otf', 18),
    ['medium'] = love.graphics.newFont('fonts/cardenio_modern.otf', 32),
    ['large'] = love.graphics.newFont('fonts/cardenio_modern.otf', 48)
  }

  gTextures = {
    ['tilesheet'] = love.graphics.newImage('img/sokoban_tilesheet.png')
  }

  quads = generateQuads(gTextures.tilesheet, TILE_WIDTH, TILE_HEIGHT)

  gStateMachine =
    StateMachine {
    ['start'] = function()
      return StartState()
    end,
    ['play'] = function()
      return PlayState()
    end,
    ['victory'] = function()
      return VictoryState()
    end,
    ['pause'] = function()
      return PauseState()
    end
  }
  gStateMachine:change('start')

  love.keyboard.keysPressed = {}
end

function love.update(dt)
  gStateMachine:update(dt)
  Timer.update(dt)

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

  -- displayFPS()
end
