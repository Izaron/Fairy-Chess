-- Boilerplate line to access the Piece and Helper classes
require "piece_move_count"
require "util"

-- Pawns have an ability to move 1 cells forward, but attack in diagonal
-- directions
-- 
-- Superpowers:
-- 1.  An ability to move 2 cells forward when haven't move yet at all
-- 2.  A need to transform either to a Queen, Rook, Bishop, or Knight
--     when reached the last cell
-- 3.  En passant - a pawn capture that can only occur immediately after a pawn
--     makes a double-step move from its starting square, and it could have been
--     captured by an enemy pawn had it advanced only one square.
export class Pawn extends PieceMoveCount
    -- TODO: En passant, superpower 2
    get_possible_moves: (board) =>
        x, y = get_pos!
        local res

        -- Add the first superpower and the regular move
        -- Add a move forward 1 cell
        if Util.is_free board[x][y + 1]
            table.insert res {x, y + 1}
            -- Well, is it possible to go 2 cells forward?
            if get_move_count! == 0
                if Util.is_free board[x][y + 2]
                    table.insert res, {x, y + 2}

        -- Add the attack moves
        for add_x = -1, 1, 2  -- add_x = {-1, 1}
            if not Util.is_free board[x + add_x][y + 1]
                if board[x + add_x][y + 1]\get_player_id! != get_player_id!
                    table.insert res, {x + add_x, y + 1}

        return res
