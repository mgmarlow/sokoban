return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.3.4",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 6,
  height = 7,
  tilewidth = 64,
  tileheight = 64,
  nextlayerid = 3,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "sokoban_tilesheet",
      firstgid = 1,
      filename = "../img/sokoban_tilesheet.tsx",
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      columns = 13,
      image = "../img/sokoban_tilesheet.png",
      imagewidth = 832,
      imageheight = 512,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 64,
        height = 64
      },
      properties = {},
      terrains = {},
      tilecount = 104,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 1,
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 6,
      height = 7,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        90, 90, 90, 90, 90, 0,
        90, 90, 90, 90, 90, 90,
        90, 90, 90, 90, 90, 90,
        90, 90, 90, 90, 90, 90,
        90, 90, 90, 90, 90, 90,
        89, 90, 90, 90, 90, 90,
        89, 90, 90, 90, 90, 90
      }
    },
    {
      type = "tilelayer",
      id = 2,
      name = "Tile Layer 2",
      x = 0,
      y = 0,
      width = 6,
      height = 7,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        7, 7, 7, 7, 7, 0,
        7, 1, 1, 42, 7, 7,
        7, 1, 8, 1, 1, 7,
        7, 7, 73, 8, 1, 7,
        7, 7, 8, 7, 0, 7,
        7, 42, 1, 1, 42, 7,
        7, 7, 7, 7, 7, 7
      }
    }
  }
}
