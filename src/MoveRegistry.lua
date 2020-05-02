MoveRegistry = Class {}

local function delegateMove(payload)
  -- todo
end

function MoveRegistry:init()
  self.moves = {}

  self.handler = function(payload)
    table.insert(self.moves, payload)

    for i, action in ipairs(payload.actions) do
      Signal.emit(action.type, action.payload)
    end
  end

  Signal.register('move', self.handler)
end

function MoveRegistry:enter()
  Signal.register('move', self.handler)
end

function MoveRegistry:exit()
  Signal.remove('move', self.handler)
end

function MoveRegistry:undo()
  if #self.moves > 0 then
    local latest = table.remove(self.moves)

    for _, action in ipairs(latest.actions) do
      Signal.emit(action.type, action.snapshot)
    end
  end
end

function MoveRegistry:render()
  love.graphics.setColor(0, 255, 0, 255)
  love.graphics.print('Moves: ' .. tostring(#self.moves), 5, 5)
  love.graphics.setColor(255, 255, 255, 255)
end
