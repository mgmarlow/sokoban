Class = require 'lib/class'

require 'levels/levelZero'
require 'levels/levelOne'

require 'src/constants'
require 'src/game_objects'
require 'src/util'
require 'src/StateMachine'
require 'src/Level'
require 'src/Animation'
require 'src/Player'
require 'src/Entity'
require 'src/GameObject'

-- States
require 'src/states/BaseState'

require 'src/states/player/PlayerIdleState'
require 'src/states/player/PlayerWalkState'
require 'src/states/player/PlayerPushState'

require 'src/states/StartState'
require 'src/states/PlayState'
require 'src/states/VictoryState'
require 'src/states/PauseState'
