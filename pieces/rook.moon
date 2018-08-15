-- Boilerplate line to access the Piece and Helper classes
require "piece_move_count"
require "util"

-- The Rook is a (1, 0)-rider
-- 
-- Superpowers:
-- 1.  Castling, two moves in a row with the King, 
export class Rook extends PieceMoveCount
    -- TODO: superpower 1
    dir: {1, 0}

    get_possible_moves: (board) =>
        return Util.rider_moves(board, self, @dir)
