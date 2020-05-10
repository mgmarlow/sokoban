--[[
  Note on tile tileIndex:

  Since lua indexes by 1 instead of 0, the Tiled
  tile index equivalent is tileIndex - 1.

  After loading the sokoban_tilesheet, click on an
  individual tile to get its index. Add 1 to this
  value and you'll get the exported *.lua equivalent.
--]]
GAME_OBJECT_DEFS = {
  ['wall'] = {
    type = 'wall',
    tileIndex = {20, 7, 2},
    isMoveable = false,
    isSolid = true,
    isVictory = false,
    width = TILE_WIDTH,
    height = TILE_HEIGHT
  },
  ['pit'] = {
    type = 'pit',
    tileIndex = 12,
    isMoveable = false,
    isSolid = false,
    isPluggable = true,
    isVictory = false,
    width = TILE_WIDTH,
    height = TILE_HEIGHT
  },
  ['box'] = {
    type = 'box',
    tileIndex = 8,
    isMoveable = true,
    isSolid = true,
    isVictory = false,
    width = TILE_WIDTH,
    height = TILE_HEIGHT,
    zIndex = 1
  },
  ['destination'] = {
    type = 'dest',
    tileIndex = 42,
    isMoveable = false,
    isSolid = false,
    isVictory = true,
    width = TILE_WIDTH,
    height = TILE_HEIGHT
  }
}
