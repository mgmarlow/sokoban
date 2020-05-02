MoveRegistry = Class{}

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

function MoveRegistry:exit()
  Signal.remove('move', self.handler)
end

function MoveRegistry:undo()
  -- TODO: unpack and delegate move
  -- local latest = table.remove(self.moves)
  -- Signal.emit('undo.move', latest)
end

function MoveRegistry:render()
  love.graphics.setColor(0, 255, 0, 255)
  love.graphics.print('Moves: ' .. tostring(#self.moves), 5, 5)
  love.graphics.setColor(255, 255, 255, 255)
end
