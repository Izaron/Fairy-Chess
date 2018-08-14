-- Boilerplate line to access the Piece and Helper classes
require "piece"
require "util"

-- The Queen is a rider of all eight directions
export class Queen extends Piece
    dirs: {
        {1, 0}, {1, 1}, {0, 1}, {-1, 1},
        {-1, 0}, {-1, -1}, {0, -1}, {1, -1}
    }

    get_possible_moves: (board) =>
        return Util.rider_moves_in_dirs(board, @get_pos!, @dirs)
