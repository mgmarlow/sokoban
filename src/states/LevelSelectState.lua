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
  love.graphics.setFont(gFonts['medium'])

  for i = 1, self.levels do
    if i == self.selectedLevel then
      love.graphics.setColor(255, 255, 255, 255)
    else
      love.graphics.setColor(0, 255, 0, 255)
    end

    love.graphics.printf(
      'level ' .. i,
      0,
      50 + i * 45,
      WINDOW_WIDTH
      -- 'center'
    )
  end

  love.graphics.setColor(255, 255, 255, 255)
end
