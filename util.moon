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
rider_moves_in_dir = (board, piece, dir) ->
    res = {}
    {x, y} = piece\get_pos()
    {add_x, add_y} = dir

    while true
        x += add_x
        y += add_y
        if not is_inside x, y
            break
        table.insert(res, {x, y})
        if board[x][y]
            break

    return res

-- Generate all moves in given directions
rider_moves_in_dirs = (board, piece, dirs) ->
    res = {}
    for dir in *dirs
        for pos in *rider_moves_in_dir(board, piece, dir)
            table.insert(res, pos)
    return res

-- Generate all leaper moves
leaper_moves_in_dirs = (board, piece, dirs) ->
    res = {}
    {x, y} = piece\get_pos()

    for dir in *dirs
        {add_x, add_y} = dir
        nx = x + add_x  -- target x position
        ny = y + add_y  -- target y position
        if is_inside(nx, ny)
            if board[nx][ny]
                if board[nx][ny]\get_player_id() != piece\get_player_id()
                    table.insert(res, {nx, ny})
            else
                table.insert(res, {nx, ny})

    return res


export Util = {
    :is_free,
    :rider_moves_in_dir,
    :rider_moves_in_dirs,
    :leaper_moves_in_dirs
}
