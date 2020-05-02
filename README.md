# Sokoban

Sokoban implemented with [Love2D](https://love2d.org/).

## Play the Game

Download the latest build from the
[releases](https://github.com/mgmarlow/sokoban/releases) page.
Currently only available for Windows.

**Windows 10 build instructions**:

1. [Download `sokoban.zip`](https://github.com/mgmarlow/sokoban/releases)
2. Extract `sokoban.zip` into a new directory
3. Open the new directory and run `sokoban.exe`

## Todos

- [x] build automation
- [ ] undo
- [ ] dev console level selection
- [ ] portal block types
- [ ] more juice
- [ ] more levels

## Prior Art

Much of this implementation references the Harvard's CS50
[Zelda source code](https://github.com/games50/zelda), in
particular the
[`StateMachine`](https://github.com/mgmarlow/sokoban/blob/master/src/StateMachine.lua)
Class. This project also uses multiple
libraries from [hump](https://github.com/vrld/hump/).
