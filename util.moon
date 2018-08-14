require "config"

-- This is a helper module for move generation
-- export *  -- export all functions to the outer world

-- Is the cell free
-- May be unused, since 'if board[x][y] != nil' detects it
is_free = (cell) ->
    cell == nil

-- Is the cell inside the board
is_inside = (x, y) ->
    x >= 0 and x < Config.columns and
    y >= 0 and y < Config.rows

-- Generate all rider moves in given direction
-- Until we collided with the border or another cell
rider_moves_in_dir = (board, pos, dir) ->
    res = { }
    {x, y} = pos
    {add_x, add_y} = dir

    while true
        x += add_x
        y += add_y
        if not is_inside x, y
            break
        table.insert res, {x, y}
        if board[x][y]
            break

    return res

-- Generate all moves in given directions
rider_moves_in_dirs = (board, pos, dirs) ->
    res = {}
    for dir in *dirs
        for pos in *Util.rider_moves_in_dir(board, pos, dir)
            table.insert res, pos
    return res


export Util = {
    :is_free,
    :rider_moves_in_dir,
    :rider_moves_in_dirs
}
