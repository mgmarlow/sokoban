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
    love.graphics.setColor(255, 255, 255, 255)
end

-- http://lua-users.org/wiki/CopyTable
function clone(orig, copies)
    copies = copies or {}
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if copies[orig] then
            copy = copies[orig]
        else
            copy = {}
            copies[orig] = copy
            for orig_key, orig_value in next, orig, nil do
                copy[clone(orig_key, copies)] = clone(orig_value, copies)
            end
            setmetatable(copy, clone(getmetatable(orig), copies))
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end
