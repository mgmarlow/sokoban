LevelSelectState = Class {__includes = BaseState}

local function clamp(val, min, max)
  if val <= max and val > 0 then
    return val
  elseif val <= 0 then
    return max
  else
    return min
  end
end

function LevelSelectState:enter(params)
  self.levels = gLoader.numLevels
  self.selectedLevel = clamp(params.selectedLevel or 1, 1, self.levels)
end

function LevelSelectState:update(dt)
  if love.keyboard.wasPressed('escape') then
    gStateMachine:change('start')
  end

  if love.keyboard.wasPressed('z') then
    gStateMachine:change('play', {levelNumber = self.selectedLevel})
  end

  if love.keyboard.wasPressed('up') then
    self.selectedLevel = clamp(self.selectedLevel - 1, 1, self.levels)
  elseif love.keyboard.wasPressed('down') then
    self.selectedLevel = clamp(self.selectedLevel + 1, 1, self.levels)
  end
end

function LevelSelectState:render()
  love.graphics.setFont(gFonts['medium-large'])
  love.graphics.printf('Select a level', 0, 20, WINDOW_WIDTH, 'center')

  love.graphics.setFont(gFonts['medium'])
  love.graphics.printf(
    '(use up and down arrow keys)',
    0,
    100,
    WINDOW_WIDTH,
    'center'
  )

  for i = 0, self.levels - 1 do
    if i + 1 == self.selectedLevel then
      love.graphics.setColor(0, 1, 0, 1)
    else
      love.graphics.setColor(1, 1, 1, 1)
    end

    local spacing = 100
    local columnNumber = i % 3

    love.graphics.printf(
      'level ' .. i + 1,
      (spacing * columnNumber) - 100,
      200 + math.floor(i / 3) * 50,
      WINDOW_WIDTH,
      'center'
    )
  end

  love.graphics.setColor(255, 255, 255, 255)
end
