LEVEL_ZERO = {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.4",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 8,
  height = 8,
  tilewidth = 64,
  tileheight = 64,
  nextlayerid = 4,
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
      name = "bg",
      x = 0,
      y = 0,
      width = 8,
      height = 8,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        90, 90, 90, 90, 90, 90, 90, 90,
        90, 89, 90, 90, 90, 90, 90, 90,
        90, 90, 90, 90, 90, 90, 90, 90,
        90, 90, 90, 90, 90, 90, 90, 90,
        90, 90, 90, 90, 90, 90, 90, 90,
        90, 90, 90, 90, 90, 89, 89, 90,
        90, 90, 90, 90, 90, 89, 89, 90,
        90, 90, 90, 90, 90, 90, 90, 90
      }
    },
    {
      type = "tilelayer",
      id = 3,
      name = "objects",
      x = 0,
      y = 0,
      width = 8,
      height = 8,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        20, 20, 20, 20, 20, 20, 20, 20,
        20, 73, 0, 0, 0, 0, 0, 20,
        20, 0, 0, 0, 0, 0, 0, 20,
        20, 0, 0, 0, 0, 0, 0, 20,
        20, 0, 8, 0, 0, 42, 0, 20,
        20, 0, 0, 0, 0, 0, 0, 20,
        20, 0, 0, 0, 0, 0, 0, 20,
        20, 20, 20, 20, 20, 20, 20, 20
      }
    }
  }
}
