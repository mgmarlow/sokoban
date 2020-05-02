MoveRegistry = Class{}

function MoveRegistry:init()
  self.moves = {}

  Signal.register('move', function(payload)
    table.insert(self.moves, payload)
  end)
end

function MoveRegistry:undo()
  local latest = table.remove(self.moves)

  Signal.emit('undo.move', latest)
end
