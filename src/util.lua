function generateQuads(atlas, tw, th)
  local sheetWidth = atlas:getWidth() / tw
  local sheetHeight = atlas:getHeight() / th

  local sheetCounter = 1
  local spritesheet = {}

  for y = 0, sheetHeight - 1 do
    for x = 0, sheetWidth - 1 do
      spritesheet[sheetCounter] = love.graphics.newQuad(
        x * tw, y * th, tw, th, atlas:getDimensions()
      )
      sheetCounter = sheetCounter + 1
    end
  end

  return spritesheet
end

function displayFPS()
    -- love.graphics.setFont(gFonts['small'])
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
end
