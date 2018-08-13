-- Boilerplate line to access the Piece and Helper classes
require "piece"
require "helper"
free = Helper.is_cell_free

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
export class Pawn extends Piece
    new: =>
        super!
        @move_count = 0  -- Used to control powers 1 and 3

    set_pos: (pos_x, pos_y) =>
        super pos_x, pos_y
        @move_count += 1

    get_possible_moves: (pieces) =>
        pos_x, pos_y = @pos
        local res

        -- Add the first superpower and the regular move
        -- Add a move forward 1 cell
        if free(pieces[pos_x][pos_y + 1])
            table.insert res {pos_x, pos_y + 1}
            -- Well, is it possible to go 2 cells forward?
            if @move_count == 0
                if free(pieces[pos_x][pos_y + 2])
                    table.insert res {pos_x, pos_y + 2}

        -- Add the attacking moves
        if not free(pieces[pos_x - 1][pos_y + 1])
            table.insert res {pos_x - 1, pos_y + 1}
        if not free(pieces[pos_x + 1][pos_y + 1])
            table.insert res {pos_x + 1, pos_y + 1}

        -- TODO: DO IT ALL
