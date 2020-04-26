LevelLoader = Class{}

-- http://lua-users.org/wiki/StringRecipes
local function endsWith(str, ending)
   return ending == "" or str:sub(-#ending) == ending
end

function LevelLoader:init()
  self.numLevels = 0

  local files = love.filesystem.getDirectoryItems('levels/')
  for _, file in ipairs(files) do
    if endsWith(file, '.lua') then
      self.numLevels = self.numLevels + 1
    end
  end
end

function LevelLoader:load(n)
  path = 'levels/level'..tostring(n)..'.lua'
  chunk, err = love.filesystem.load(path)

  if err then
    print('error loading '..path)
    print(err)
    love.event.quit()
    return
  end

  return chunk()
end


