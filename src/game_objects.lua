GAME_OBJECT_DEFS = {
  ['wall'] = {
    tileIndex = 20,
    isMoveable = false,
    isSolid = true,
    isVictory = false,
    width = TILE_WIDTH ,
    height = TILE_HEIGHT
  },
  ['box'] = {
    tileIndex = 8,
    isMoveable = true,
    isSolid = true,
    isVictory = false,
    width = TILE_WIDTH,
    height = TILE_HEIGHT
  },
  ['destination'] = {
    tileIndex = 42,
    isMoveable = false,
    isSolid = false,
    isVictory = true,
    width = TILE_WIDTH,
    height = TILE_HEIGHT
  }
}
