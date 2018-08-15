-- This is a helper module for move generation
require "config"
log_console = require"logging.console"

logger = log_console()

--------------------------------------------------------------------------------
-------------------- OTHER FUNCTIONS
--------------------------------------------------------------------------------

-- Is the cell free
-- May be unused, since 'if board[x][y]' detects it as well
is_free = (cell) ->
    cell == nil

-- Is the cell inside the board
is_inside = (x, y) ->
    x >= 0 and x < Config.columns and
    y >= 0 and y < Config.rows

-- Inventing the set again
simple_table_to_str = (t) ->
    str = ""
    for val in *t
        if val == -0
            val = 0
        str ..= tostring(val)
        str ..= ","
    return str

set_contains = (set, key) ->
    return set[key] != nil

set_insert = (set, key) ->
    key_str = simple_table_to_str(key)
    if set_contains(set, key_str)
        return false
    set[key_str] = true
    return true

-- Generate all possible directions from a vector
gen_all_dir_permutations = (dir) ->
    dir_set = {}
    all_dirs = {}
    {x, y} = dir
    for mx = -1, 1, 2  -- mx = {-1, 1}
        for my = -1, 1, 2
            if set_insert(dir_set, {mx * x, my * y})
                table.insert(all_dirs, {mx * x, my * y})
            if set_insert(dir_set, {my * y, mx * x})
                table.insert(all_dirs, {my * y, mx * x})
    logger\debug "dir #{pos[1]} #{pos[2]}" for pos in *all_dirs
    return all_dirs

--------------------------------------------------------------------------------
-------------------- RIDER FUNCTIONS
--------------------------------------------------------------------------------

-- Generate all rider moves in given direction
-- Until we collided with the border or another cell
rider_moves_in_dir = (board, piece, dir) ->
    res = {}
    {x, y} = piece\get_pos()
    {add_x, add_y} = dir

    while true
        x += add_x
        y += add_y

        -- Stop the ride if reached the end of the table
        if not is_inside x, y
            break

        -- Stop the ride if reached a piece of the same color
        if board[x][y] and board[x][y]\get_player_id() == piece\get_player_id()
            break

        table.insert(res, {x, y})

        -- Can't jump over a piece of the other color
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

-- Generate all moves from all possible permutations of the 'dir' direction
rider_moves = (board, piece, dir) ->
    rider_moves_in_dirs(board, piece, gen_all_dir_permutations(dir))

--------------------------------------------------------------------------------
-------------------- LEAPER FUNCTIONS
--------------------------------------------------------------------------------

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

-- Generate all moves from all possible permutations of the 'dir' direction
leaper_moves = (board, piece, dir) ->
    leaper_moves_in_dirs(board, piece, gen_all_dir_permutations(dir))


--------------------------------------------------------------------------------
-------------------- EXPORT
--------------------------------------------------------------------------------

export Util = {
    :is_free,
    
    :rider_moves_in_dir,
    :rider_moves_in_dirs,
    :rider_moves,

    :leaper_moves_in_dirs,
    :leaper_moves
}
