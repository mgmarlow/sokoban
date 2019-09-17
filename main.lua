require 'src/dependencies'

function love.load()
  love.window.setTitle('Sokoban')

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
  displayFPS()
end
