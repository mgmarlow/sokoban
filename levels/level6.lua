return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.3.4",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 8,
  height = 5,
  tilewidth = 64,
  tileheight = 64,
  nextlayerid = 5,
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
      width = 8,
      height = 5,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        89, 89, 89, 89, 89, 89, 89, 89,
        89, 89, 89, 89, 89, 89, 89, 89,
        89, 89, 89, 89, 89, 89, 89, 89,
        89, 89, 89, 89, 89, 89, 89, 89,
        89, 89, 89, 89, 89, 89, 89, 89
      }
    },
    {
      type = "tilelayer",
      id = 4,
      name = "Tile Layer 2",
      x = 0,
      y = 0,
      width = 8,
      height = 5,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        7, 7, 7, 7, 7, 7, 7, 7,
        7, 0, 0, 0, 12, 0, 42, 7,
        7, 73, 8, 8, 12, 0, 0, 7,
        7, 0, 0, 0, 12, 0, 0, 7,
        7, 7, 7, 7, 7, 7, 7, 7
      }
    }
  }
}
