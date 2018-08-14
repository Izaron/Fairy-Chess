-- Boilerplate line to access the Piece and Helper classes
require "piece_move_count"
require "util"

-- Rooks move in four directions any count of cells, unless there are a piece
-- on the path between the first and the last cell
--
-- The Rook is a (1, 0)-rider
-- 
-- Superpowers:
-- 1.  Castling, two moves in a row with the King, 
export class Rook extends PieceMoveCount
    -- TODO: superpower 1
    dirs: {
        {1, 0}, {0, 1},
        {-1, 0}, {0, -1}
    }

    get_possible_moves: (board) =>
        return Util.rider_moves_in_dirs(board, self, @dirs)
