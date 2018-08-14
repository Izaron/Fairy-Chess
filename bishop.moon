-- Boilerplate line to access the Piece and Helper classes
require "piece"
require "util"

-- The Bishop is a rider of all four diagonal directions
export class Bishop extends Piece
    dirs: {
        {1, 1}, {1, -1},
        {-1, 1}, {-1, -1}
    }

    get_possible_moves: (board) =>
        return Util.rider_moves_in_dirs(board, self, @dirs)
